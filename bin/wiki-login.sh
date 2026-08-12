#!/usr/bin/env bash
# Ouvre une session sur le wiki et stocke les cookies.
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
set -a; source "$DIR/.env"; set +a
C="$DIR/.cookies.txt"

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
