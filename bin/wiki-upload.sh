#!/usr/bin/env bash
# Usage: bin/wiki-upload.sh fichier.jpg
#   Téléverse UN fichier local, sous son nom de base (aucun renommage).
#   Jamais ignorewarnings : un fichier déjà présent sur le wiki fait échouer
#   l'appel (result != Success) au lieu d'être écrasé — équivalent de
#   --createonly côté wiki-put.sh. Jamais bot=1.
#   Résumé (comment) et licence (text) fixes, identiques pour tout appel.
#   Code de sortie non nul si l'API ne renvoie pas result: Success.
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

FILE="${1:?Usage: bin/wiki-upload.sh fichier}"
if [ ! -f "$FILE" ]; then
  echo "ERREUR: fichier introuvable : $FILE" >&2
  exit 1
fi
FILENAME="$(basename "$FILE")"

COMMENT="[Lot 9] Téléversement photos jardin-forêt"
TEXT="Photo prise par Cyril Libert. Licence CC BY-SA 4.0, cohérente avec le wiki."

CSRF=$(curl -s -b "$C" -c "$C" -G "$WIKI_API" \
  -d action=query -d meta=tokens -d format=json -d formatversion=2 \
  | python3 -c 'import sys,json;print(json.load(sys.stdin)["query"]["tokens"]["csrftoken"])')

if [ "$CSRF" = '+\' ]; then
  echo "Session expirée : relance bin/wiki-login.sh"; exit 1
fi

curl -s -b "$C" -c "$C" "$WIKI_API" \
  -F "action=upload" \
  -F "filename=$FILENAME" \
  -F "file=@$FILE;filename=$FILENAME" \
  -F "comment=$COMMENT" \
  -F "text=$TEXT" \
  -F "token=$CSRF" \
  -F "format=json" \
  -F "formatversion=2" \
  | python3 -c '
import sys, json
raw = sys.stdin.read()
try:
    r = json.loads(raw)
except json.JSONDecodeError:
    print(raw)
    sys.exit(1)
print(json.dumps(r, indent=4, ensure_ascii=False))
result = r.get("upload", {}).get("result")
sys.exit(0 if result == "Success" else 1)
'
