#!/usr/bin/env bash
# Usage: bin/wiki-purge.sh "Titre 1|Titre 2"
#   Purge une ou plusieurs pages (titres séparés par |), en POST avec jeton
#   CSRF (action=purge exige POST sur ce wiki, voir CLAUDE.md/leçons de
#   méthode). forcelinkupdate=1 est toujours ajouté. Aucun autre paramètre
#   n'est accepté, aucune autre action que purge n'est exécutée.
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

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 \"Titre 1|Titre 2\"" >&2
  exit 1
fi

TITLES="$1"

CSRF=$(curl -s -b "$C" -c "$C" -G "$WIKI_API" \
  -d action=query -d meta=tokens -d format=json -d formatversion=2 \
  | python3 -c 'import sys,json;print(json.load(sys.stdin)["query"]["tokens"]["csrftoken"])')

if [ "$CSRF" = '+\' ]; then
  echo "Session expirée : relance bin/wiki-login.sh"; exit 1
fi

curl -s -b "$C" -c "$C" "$WIKI_API" \
  --data-urlencode "action=purge" \
  --data-urlencode "titles=$TITLES" \
  --data-urlencode "forcelinkupdate=1" \
  --data-urlencode "token=$CSRF" \
  -d format=json -d formatversion=2 \
  | python3 -m json.tool
