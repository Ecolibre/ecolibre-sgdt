#!/usr/bin/env bash
# Usage: bin/wiki-put.sh "Nom de la page" fichier.txt "résumé de modif" [--createonly]
#   --createonly : échoue si la page existe déjà (articleexists), au lieu de
#                  l'écraser. À utiliser pour toute création de page.
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

PAGE="$1"; FILE="$2"; SUMMARY="${3:-Modification via Claude Code}"

case "$PAGE" in
  MediaWiki:*)
    echo "ERREUR: refus d'écrire sur '$PAGE' — l'espace MediaWiki: porte la configuration du wiki et se modifie à la main, jamais par le bot." >&2
    exit 1
    ;;
esac

CREATEONLY=0
for arg in "$@"; do
  [ "$arg" = "--createonly" ] && CREATEONLY=1
done

CSRF=$(curl -s -b "$C" -c "$C" -G "$WIKI_API" \
  -d action=query -d meta=tokens -d format=json -d formatversion=2 \
  | python3 -c 'import sys,json;print(json.load(sys.stdin)["query"]["tokens"]["csrftoken"])')

if [ "$CSRF" = '+\' ]; then
  echo "Session expirée : relance bin/wiki-login.sh"; exit 1
fi

EDIT_OPTS=(-d assert=user -d format=json -d formatversion=2)
[ "$CREATEONLY" = 1 ] && EDIT_OPTS+=(-d createonly=1)

curl -s -b "$C" -c "$C" "$WIKI_API" \
  --data-urlencode "action=edit" \
  --data-urlencode "title=$PAGE" \
  --data-urlencode "text@$FILE" \
  --data-urlencode "summary=$SUMMARY" \
  --data-urlencode "token=$CSRF" \
  "${EDIT_OPTS[@]}" \
  | python3 -m json.tool
