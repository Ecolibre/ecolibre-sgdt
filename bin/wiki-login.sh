#!/usr/bin/env bash
# Ouvre une session sur le wiki et stocke les cookies.
#
# .env est cherché d'abord dans $SGDT_PRIVE (par défaut
# ../ecolibre-sgdt-prive/, un répertoire voisin du dépôt, hors publication),
# puis dans le dépôt lui-même. Introuvable dans les deux : échec explicite.
# Les cookies sont écrits dans $SGDT_PRIVE s'il existe (répertoire privé
# préféré), sinon dans le dépôt.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PRIVE_DIR="${SGDT_PRIVE:-$DIR/../ecolibre-sgdt-prive}"

if [ -f "$PRIVE_DIR/.env" ]; then
  ENV_FILE="$PRIVE_DIR/.env"
elif [ -f "$DIR/.env" ]; then
  ENV_FILE="$DIR/.env"
else
  ENV_FILE=""
fi
if [ -n "$ENV_FILE" ]; then
  set -a; source "$ENV_FILE"; set +a
elif [ -z "${WIKI_API:-}" ] || [ -z "${WIKI_USER:-}" ] || [ -z "${WIKI_PASS:-}" ]; then
  echo "ERREUR: ni .env (cherché dans $PRIVE_DIR/.env puis $DIR/.env) ni WIKI_API, WIKI_USER et WIKI_PASS dans l'environnement" >&2
  exit 1
fi

if [ -d "$PRIVE_DIR" ]; then
  C="$PRIVE_DIR/.cookies.txt"
else
  C="$DIR/.cookies.txt"
fi

LGTOKEN=$(curl -s -c "$C" -G "$WIKI_API" \
  -d action=query -d meta=tokens -d type=login \
  -d format=json -d formatversion=2 \
  | python3 -c 'import sys,json;print(json.load(sys.stdin)["query"]["tokens"]["logintoken"])')

curl -s -b "$C" -c "$C" "$WIKI_API" \
  --data-urlencode "action=login" \
  --data-urlencode "lgname=$WIKI_USER" \
  --data-urlencode "lgpassword=$WIKI_PASS" \
  --data-urlencode "lgtoken=$LGTOKEN" \
  -d format=json -d formatversion=2 \
  | python3 -c '
import sys,json
r=json.load(sys.stdin)["login"]
print(r["result"], r.get("lgusername",""))
sys.exit(0 if r["result"]=="Success" else 1)'

chmod 600 "$C"
