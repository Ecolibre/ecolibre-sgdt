#!/usr/bin/env bash
# Usage: bin/wiki-purge.sh "Titre 1|Titre 2"
#   Purge une ou plusieurs pages (titres séparés par |), en POST (action=purge
#   exige POST sur ce wiki, mais PAS de jeton CSRF — needstoken: None, vérifié
#   via action=paraminfo). forcelinkupdate=1 est toujours ajouté. Aucun autre
#   paramètre n'est accepté, aucune autre action que purge n'est exécutée.
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

# action=purge n'exige pas de jeton CSRF (needstoken: None). Cet appel au
# helper ne sert donc qu'à vérifier la session AVANT la purge : il échoue
# (code 3) si l'API est injoignable, (code 4) si la session a expiré. Le
# jeton lui-même n'est pas réutilisé plus bas.
"$DIR/bin/_wiki-csrf.sh" "$C" >/dev/null || exit 1

curl -s -b "$C" -c "$C" "$WIKI_API" \
  --data-urlencode "action=purge" \
  --data-urlencode "titles=$TITLES" \
  --data-urlencode "forcelinkupdate=1" \
  -d format=json -d formatversion=2 \
  | python3 -m json.tool
