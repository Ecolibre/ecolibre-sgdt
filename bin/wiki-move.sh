#!/usr/bin/env bash
# Usage: bin/wiki-move.sh "Titre source" "Titre cible" ["résumé du renommage"]
#
# Renomme une page avec redirection conservée depuis l'ancien titre (jamais
# --noredirect, jamais --movetalk implicite : comportement par défaut de
# l'API, redirection posée). N'ajoute jamais ignorewarnings=1 : si le titre
# cible existe déjà, l'appel échoue (articleexists ou apparemment similaire)
# au lieu d'écraser — même philosophie que --createonly sur bin/wiki-put.sh.
#
# .env et .cookies.txt sont cherchés d'abord dans $SGDT_PRIVE (par défaut
# ../ecolibre-sgdt-prive/, un répertoire voisin du dépôt, hors publication),
# puis dans le dépôt lui-même. Introuvables dans les deux : échec explicite.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PRIVE_DIR="${SGDT_PRIVE:-$DIR/../ecolibre-sgdt-prive}"

if [ -f "$PRIVE_DIR/.env" ]; then
  ENV_FILE="$PRIVE_DIR/.env"
elif [ -f "$DIR/.env" ]; then
  ENV_FILE="$DIR/.env"
else
  echo "ERREUR: .env introuvable (cherché dans $PRIVE_DIR/.env puis $DIR/.env)" >&2
  exit 1
fi
set -a; source "$ENV_FILE"; set +a

if [ -f "$PRIVE_DIR/.cookies.txt" ]; then
  C="$PRIVE_DIR/.cookies.txt"
elif [ -f "$DIR/.cookies.txt" ]; then
  C="$DIR/.cookies.txt"
else
  echo "Pas de session (cherché .cookies.txt dans $PRIVE_DIR puis $DIR) : lance d'abord bin/wiki-login.sh" >&2
  exit 1
fi

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 \"Titre source\" \"Titre cible\" [\"résumé\"]" >&2
  exit 1
fi

FROM="$1"; TO="$2"; SUMMARY="${3:-Renommage via Claude Code}"

case "$FROM" in
  MediaWiki:*)
    echo "ERREUR: refus de renommer depuis '$FROM' — l'espace MediaWiki: se modifie à la main, jamais par le bot." >&2
    exit 1
    ;;
esac
case "$TO" in
  MediaWiki:*)
    echo "ERREUR: refus de renommer vers '$TO' — l'espace MediaWiki: se modifie à la main, jamais par le bot." >&2
    exit 1
    ;;
esac

CSRF=$(curl -s -b "$C" -c "$C" -G "$WIKI_API" \
  -d action=query -d meta=tokens -d format=json -d formatversion=2 \
  | python3 -c 'import sys,json;print(json.load(sys.stdin)["query"]["tokens"]["csrftoken"])')

if [ "$CSRF" = '+\' ]; then
  echo "Session expirée : relance bin/wiki-login.sh"; exit 1
fi

curl -sS -b "$C" -c "$C" "$WIKI_API" \
  --data-urlencode "action=move" \
  --data-urlencode "from=$FROM" \
  --data-urlencode "to=$TO" \
  --data-urlencode "reason=$SUMMARY" \
  --data-urlencode "token=$CSRF" \
  -d assert=user -d format=json -d formatversion=2 \
  | python3 -c '
import sys, json
raw = sys.stdin.read()
try:
    d = json.loads(raw)
except json.JSONDecodeError:
    sys.stderr.write("ERREUR: réponse non-JSON de l API (transport ?)\n")
    sys.stdout.write(raw + "\n")
    sys.exit(1)
print(json.dumps(d, indent=4, ensure_ascii=False))
if "error" in d:
    e = d["error"]
    sys.stderr.write("ERREUR API: " + e.get("code", "?") + " — " + e.get("info", "") + "\n")
    sys.exit(1)
if "move" not in d:
    sys.stderr.write("ERREUR: renommage non confirmé (pas de clé move dans la réponse)\n")
    sys.exit(1)
'
