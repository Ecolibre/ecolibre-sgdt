#!/usr/bin/env bash
# Usage:
#   bin/wiki-get.sh "Nom de la page"               -> affiche le wikitexte
#   bin/wiki-get.sh --category "Nom de catégorie"  -> liste les membres
#                                                      (un titre par ligne)
#   bin/wiki-get.sh --protection "Nom de la page"  -> affiche le niveau de
#                                                      protection natif (peut
#                                                      être vide même si
#                                                      Lockdown s'applique)
#
# Lecture seule : seules les actions MediaWiki "parse" (lecture de
# wikitexte), "query&list=categorymembers" (membres d'une catégorie) et
# "query&prop=info|protection" (niveau de protection natif) sont possibles
# avec ce script. Méthode GET uniquement (curl -G, aucune donnée n'est
# jamais envoyée en POST). Hôte en dur : pas de dépendance à .env pour
# construire l'URL de l'API.
#
# Authentification : si une session existe déjà (cookies créés par
# bin/wiki-login.sh, qui seul lit WIKI_USER/WIKI_PASS dans .env), ce script
# réutilise ces cookies pour lire des pages/catégories restreintes par
# Lockdown. Aucun identifiant n'est jamais lu, construit ou passé en
# argument ici : ce script ne connaît que le chemin du fichier de cookies,
# jamais leur contenu.
#
# .cookies.txt est cherché d'abord dans $SGDT_PRIVE (par défaut
# ../ecolibre-sgdt-prive/, un répertoire voisin du dépôt, hors publication),
# puis dans le dépôt lui-même. Absent des deux : lecture anonyme, sans échec
# (comportement inchangé — ce script fonctionne sans session).
set -euo pipefail

readonly WIKI_API="https://wiki.ecolibre.org/api.php"

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PRIVE_DIR="${SGDT_PRIVE:-$DIR/../ecolibre-sgdt-prive}"
if [ -f "$PRIVE_DIR/.cookies.txt" ]; then
  COOKIES="$PRIVE_DIR/.cookies.txt"
elif [ -f "$DIR/.cookies.txt" ]; then
  COOKIES="$DIR/.cookies.txt"
else
  COOKIES=""
fi

CURL_OPTS=(-s -G)
[ -n "$COOKIES" ] && CURL_OPTS+=(-b "$COOKIES")

if [ "$#" -eq 2 ] && [ "$1" = "--category" ]; then
  case "$2" in
    [Cc]ategory:*|[Cc]at[ée]gorie:*) CMTITLE="$2" ;;
    *) CMTITLE="Category:$2" ;;
  esac

  CMCONTINUE=""
  while : ; do
    ARGS=("${CURL_OPTS[@]}" "$WIKI_API"
      --data-urlencode "action=query"
      --data-urlencode "list=categorymembers"
      --data-urlencode "cmtitle=$CMTITLE"
      -d cmlimit=max -d format=json -d formatversion=2)
    [ -n "$CMCONTINUE" ] && ARGS+=(--data-urlencode "cmcontinue=$CMCONTINUE")

    OUT=$(curl "${ARGS[@]}" | python3 -c '
import sys,json
d=json.load(sys.stdin)
if "error" in d:
    sys.exit("ERREUR: "+d["error"].get("info","inconnue"))
for m in d.get("query", {}).get("categorymembers", []):
    print(m["title"])
print("___CMCONTINUE___" + d.get("continue", {}).get("cmcontinue", ""))
')
    echo "$OUT" | grep -v '^___CMCONTINUE___'
    NEXT=$(echo "$OUT" | grep '^___CMCONTINUE___' | sed 's/^___CMCONTINUE___//')
    [ -z "$NEXT" ] && break
    CMCONTINUE="$NEXT"
  done
  exit 0
fi

if [ "$#" -eq 2 ] && [ "$1" = "--protection" ]; then
  curl "${CURL_OPTS[@]}" "$WIKI_API" \
    --data-urlencode "action=query" \
    --data-urlencode "titles=$2" \
    -d prop=info -d inprop=protection -d format=json -d formatversion=2 \
    | python3 -c '
import sys,json
d=json.load(sys.stdin)
if "error" in d:
    sys.exit("ERREUR: "+d["error"].get("info","inconnue"))
pages = d.get("query", {}).get("pages", [])
if not pages:
    sys.exit("ERREUR: page introuvable dans la réponse")
p = pages[0]
if p.get("missing"):
    print("Page inexistante")
    sys.exit(0)
prot = p.get("protection", [])
if not prot:
    print("Aucune protection native (Lockdown, si actif, ne serait pas visible ici)")
else:
    for entry in prot:
        print(entry.get("type") + ": " + entry.get("level") + " (expiry: " + entry.get("expiry","") + ")")
'
  exit 0
fi

if [ $# -ne 1 ]; then
  echo "Usage: $0 \"Nom de la page\"  |  $0 --category \"Nom de catégorie\"  |  $0 --protection \"Nom de la page\"" >&2
  exit 1
fi

curl "${CURL_OPTS[@]}" "$WIKI_API" \
  --data-urlencode "action=parse" \
  --data-urlencode "page=$1" \
  -d prop=wikitext -d format=json -d formatversion=2 \
  | python3 -c '
import sys,json
d=json.load(sys.stdin)
if "error" in d:
    sys.exit("ERREUR: "+d["error"].get("info","inconnue"))
print(d["parse"]["wikitext"], end="")'
