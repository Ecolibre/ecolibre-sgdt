#!/usr/bin/env bash
# Usage: bin/wiki-put.sh "Nom de la page" fichier.txt "résumé de modif" [--createonly]
#   --createonly : échoue si la page existe déjà (articleexists), au lieu de
#                  l'écraser. À utiliser pour toute création de page.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
set -a; source "$DIR/.env"; set +a
C="$DIR/.cookies.txt"
PAGE="$1"; FILE="$2"; SUMMARY="${3:-Modification via Claude Code}"

CREATEONLY=0
for arg in "$@"; do
  [ "$arg" = "--createonly" ] && CREATEONLY=1
done

[ -f "$C" ] || { echo "Pas de session : lance d'abord bin/wiki-login.sh"; exit 1; }

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
