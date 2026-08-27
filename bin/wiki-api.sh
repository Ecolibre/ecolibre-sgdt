#!/usr/bin/env bash
# Usage: bin/wiki-api.sh "action=browsebysubject&subject=Foo&property=Bar"
#        bin/wiki-api.sh --facts "subject=Foo&ns=102"
#
# Exécute n'importe quelle chaîne de paramètres d'API MediaWiki en GET, avec
# la session courante. Couvre tout ce pour quoi bin/wiki-get.sh n'a pas de
# raccourci dédié : browsebysubject, expandtemplates, intestactions,
# query&meta=siteinfo, query&list=allpages, query&list=backlinks, etc.
#
# --facts : raccourci pour action=browsebysubject. Ne pas répéter action=
#   dans la chaîne (refusé comme action= dupliqué, voir plus bas). Affiche
#   une ligne « propriété -> [valeurs] » par fait, au lieu du JSON brut —
#   c'est la mise en forme réécrite en python3 à chaque appel de
#   browsebysubject depuis la création de ce script.
#
# Lecture seule stricte :
#   - toujours curl -G : aucune donnée n'est jamais envoyée dans le corps
#     d'une requête, donc aucune requête POST n'est jamais émise ;
#   - le paramètre "action=" est obligatoire (pas de action=query implicite,
#     pour éviter toute ambiguïté sur ce qui est réellement exécuté) ;
#   - l'action demandée est vérifiée contre une liste noire des actions
#     d'écriture connues du cœur de l'API MediaWiki, et refusée si elle y
#     figure. action=purge est une exception explicitement autorisée :
#     invalidation de cache, pas une écriture de contenu.
# Cette liste noire est une défense en profondeur, pas la seule barrière :
# MediaWiki refuse de toute façon la plupart des actions d'écriture reçues
# en GET (mustBePosted). Elle couvre le cœur MediaWiki et les extensions de
# cette installation (Page Forms, Semantic Forms, SMW) ; une extension future
# ou non répertoriée ici pourrait exposer sa propre action d'écriture sous un
# autre nom.
#
# Authentification : réutilise .cookies.txt (créés par bin/wiki-login.sh),
# comme bin/wiki-get.sh. Aucun identifiant n'est jamais lu, construit ou
# passé en argument ici. Cherché d'abord dans $SGDT_PRIVE (par défaut
# ../ecolibre-sgdt-prive/, voisin du dépôt), puis dans le dépôt. Absent des
# deux : lecture anonyme, sans échec.
set -euo pipefail

readonly WIKI_API="https://wiki.ecolibre.org/api.php"

BODY_TMP="$(mktemp)"
trap 'rm -f "$BODY_TMP"' EXIT

readonly WRITE_ACTIONS=(
  edit delete move protect block unblock upload import patrol rollback
  undelete userrights emailuser createaccount changecontentmodel
  managetags mergehistory revisiondelete setnotificationtimestamp
  setpagelanguage tag thank watch changeauthenticationdata
  removeauthenticationdata resetpassword clearhasmsg filerevert
  imagerotate linkaccount unlinkaccount login logout options
  stashedit abusefilterunblockautopromote spamblacklist
  wbeditentity wbcreateclaim wbremoveclaims wbsetclaim wbsetclaimvalue
  wbsetdescription wbsetlabel wbsetsitelink wbsetaliases wbmergeitems
  wblinktitles
  pfautoedit sfautoedit smwtask
)

FACTS_MODE=0
if [ "$#" -ge 1 ] && [ "$1" = "--facts" ]; then
  FACTS_MODE=1
  shift
fi

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 [--facts] \"action=...&param=valeur...\"" >&2
  echo "       $0 --facts \"subject=Nom de la page&ns=0\"" >&2
  exit 1
fi

PARAMS="$1"
if [ "$FACTS_MODE" = 1 ]; then
  PARAMS="action=browsebysubject&${PARAMS}"
fi

ACTION=$(python3 -c '
import sys, urllib.parse
params = urllib.parse.parse_qs(sys.argv[1], keep_blank_values=True)
vals = params.get("action", [])
print("__MULTI__" if len(vals) > 1 else (vals[0] if vals else ""))
' "$PARAMS")

if [ -z "$ACTION" ]; then
  echo "ERREUR: paramètre action= obligatoire dans la chaîne" >&2
  exit 1
fi

if [ "$ACTION" = "__MULTI__" ]; then
  echo "ERREUR: action= apparaît plusieurs fois dans la chaîne — refusé (PHP retient la dernière valeur, un contrôle sur la première serait contournable)." >&2
  exit 1
fi

for w in "${WRITE_ACTIONS[@]}"; do
  if [ "$ACTION" = "$w" ]; then
    echo "ERREUR: action='$ACTION' est une action d'écriture, refusée par ce script (lecture seule stricte)." >&2
    exit 1
  fi
done

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PRIVE_DIR="${SGDT_PRIVE:-$DIR/../ecolibre-sgdt-prive}"
if [ -f "$PRIVE_DIR/.cookies.txt" ]; then
  COOKIES="$PRIVE_DIR/.cookies.txt"
elif [ -f "$DIR/.cookies.txt" ]; then
  COOKIES="$DIR/.cookies.txt"
else
  COOKIES=""
fi

CURL_OPTS=(-sS -G)
if [ -n "$COOKIES" ]; then
  CURL_OPTS+=(-b "$COOKIES")
fi

# Ajoute format=json/formatversion=2 par défaut si absents de $PARAMS,
# sans jamais dupliquer un paramètre déjà fourni par l'appelant.
EXTRA=""
case "&$PARAMS&" in
  *"&format="*) ;;
  *) EXTRA="${EXTRA}&format=json" ;;
esac
case "&$PARAMS&" in
  *"&formatversion="*) ;;
  *) EXTRA="${EXTRA}&formatversion=2" ;;
esac

HTTP_CODE=$(curl "${CURL_OPTS[@]}" -w '%{http_code}' -o "$BODY_TMP" \
  "$WIKI_API" --data "${PARAMS}${EXTRA}") || {
  rc=$?
  echo "ERREUR: curl a échoué (code $rc) — transport (hôte/proxy/DNS), ou URL mal formée." >&2
  echo "       Rappel : wiki-api.sh n'encode pas la chaîne — espace => %20, & littéral => %26." >&2
  exit 1
}
RESPONSE=$(cat "$BODY_TMP")
if [ -z "$RESPONSE" ]; then
  echo "ERREUR: réponse vide (HTTP ${HTTP_CODE:-?}). Ce n'est PAS « aucun résultat » —" >&2
  echo "       rien n'est sorti de la machine (proxy, réseau, hôte down)." >&2
  exit 1
fi
if [ "${HTTP_CODE:0:1}" != "2" ]; then
  echo "ERREUR: HTTP $HTTP_CODE de l'API." >&2
  printf '%s\n' "$RESPONSE" >&2
  exit 1
fi

if [ "$FACTS_MODE" = 1 ]; then
  printf '%s' "$RESPONSE" | python3 -c '
import sys, json
d = json.load(sys.stdin)
if "error" in d:
    sys.exit("ERREUR: " + d["error"].get("info", "inconnue"))
q = d.get("query", {})
data = q.get("data")
if not data:
    subj = q.get("subject", "?")
    sys.exit("ERREUR: le sujet « " + subj + " » ne porte aucun fait SMW "
             "(query.data vide ou absent). Causes possibles : sujet inexistant, "
             "nom mal orthographié, espace non sémantique, ou écriture pas "
             "encore propagée. À distinguer de « aucun fait à afficher ».")
for p in data:
    vals = [i.get("item") for i in p.get("dataitem", [])]
    print(p["property"], "->", vals)
'
else
  printf '%s' "$RESPONSE" | python3 -c '
import sys, json
raw = sys.stdin.read()
try:
    d = json.loads(raw)
except json.JSONDecodeError:
    sys.stderr.write("ERREUR: réponse non-JSON de l API\n")
    sys.stdout.write(raw + "\n")
    sys.exit(1)
print(json.dumps(d, indent=4, ensure_ascii=False))
if isinstance(d, dict) and "error" in d:
    e = d["error"]
    sys.stderr.write("ERREUR API: " + e.get("code", "?") + " — " + e.get("info", "") + "\n")
    sys.exit(1)
'
fi
