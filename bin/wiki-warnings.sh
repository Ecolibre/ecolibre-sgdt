#!/usr/bin/env bash
# bin/wiki-warnings.sh — relève les avertissements SMW visibles au rendu
# d'une ou plusieurs pages.
#
# Usage : bin/wiki-warnings.sh "Titre 1" "Titre 2" ...
#
# Pour chaque titre, affiche le titre puis chaque avertissement trouvé dans
# le rendu (action=parse&prop=text), ou une ligne explicite s'il n'y en a
# aucun. Un avertissement SMW se rend en :
#   <span class="smw-highlighter" data-title="Avertissement" ...>
#     <span class="smwttcontent">message</span>
#   </span>
# Filtrer sur data-title="Avertissement" exclut les autres usages de
# smw-highlighter (infobulle de description de propriété, par exemple), qui
# ne sont pas des avertissements.
#
# Lecture seule : une requête action=parse&prop=text par page, via
# bin/wiki-api.sh. Même méthode que les relevés faits en boucle au fil des
# sessions précédentes, seulement versionnée.

set -uo pipefail

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 \"Titre 1\" [\"Titre 2\" ...]" >&2
  exit 1
fi

racine="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

for titre in "$@"; do
  echo "=== $titre ==="
  encode="$(python3 -c 'import sys, urllib.parse; print(urllib.parse.quote(sys.argv[1], safe=""))' "$titre")"
  "$racine/bin/wiki-api.sh" "action=parse&page=${encode}&prop=text" | python3 -c '
import sys, json, re

raw = sys.stdin.read()
try:
    d = json.loads(raw)
except json.JSONDecodeError:
    print("ERREUR : réponse non-JSON (page introuvable, ou API injoignable).")
    sys.exit(0)

if "error" in d:
    print("ERREUR : " + d["error"].get("info", "inconnue"))
    sys.exit(0)

html = d.get("parse", {}).get("text", "")
warnings = re.findall(
    "data-title=\"Avertissement\"[^>]*>.*?<span class=\"smwttcontent\">(.*?)</span>",
    html,
)
if not warnings:
    print("Aucun avertissement.")
else:
    for w in warnings:
        print("- " + w)
'
done
