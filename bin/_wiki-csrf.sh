#!/usr/bin/env bash
# Helper INTERNE (préfixe _ = jamais appelé directement) : récupère le jeton
# CSRF de l'API MediaWiki pour les scripts d'écriture. Partagé par
# bin/wiki-put.sh, bin/wiki-purge.sh et bin/wiki-upload.sh, où ce bloc était
# auparavant recopié trois fois, sans garde-fou réseau (un échec curl y
# produisait un traceback Python brut, pas un message).
#
# Usage :  CSRF=$(bin/_wiki-csrf.sh "$COOKIES") || exit 1
#   $1         chemin du fichier de cookies (session ouverte par wiki-login.sh)
#   $WIKI_API  URL de l'API, exportée par le script appelant (set -a; source .env)
#
# Trois cas distincts, trois messages, trois codes de sortie :
#   0  jeton obtenu — écrit seul sur stdout, rien d'autre.
#   3  réseau : API injoignable (proxy sortant, DNS, hôte down, HTTP non-2xx,
#      réponse vide ou non-JSON). Rien n'est sorti de la machine — ce n'est
#      pas « pas de jeton », c'est « pas de réponse ».
#   4  session expirée : l'API a rendu le jeton anonyme '+\'. Relancer
#      bin/wiki-login.sh avant toute écriture.
set -euo pipefail

C="${1:?Usage: bin/_wiki-csrf.sh <chemin_du_fichier_de_cookies>}"
: "${WIKI_API:?_wiki-csrf.sh: variable WIKI_API absente — le script appelant doit faire 'set -a; source .env'}"

BODY="$(mktemp)"
trap 'rm -f "$BODY"' EXIT

HTTP=$(curl -sS -G -b "$C" -c "$C" -w '%{http_code}' -o "$BODY" "$WIKI_API" \
  -d action=query -d meta=tokens -d format=json -d formatversion=2) || {
  echo "_wiki-csrf.sh: API injoignable (transport curl en échec) — proxy sortant, DNS, ou hôte down." >&2
  exit 3
}

if [ "${HTTP:0:1}" != "2" ]; then
  echo "_wiki-csrf.sh: HTTP $HTTP de l'API en demandant le jeton — rien d'exploitable." >&2
  exit 3
fi

CSRF=$(python3 -c '
import sys, json
try:
    d = json.load(open(sys.argv[1]))
except (json.JSONDecodeError, OSError):
    sys.stderr.write("_wiki-csrf.sh: reponse non-JSON ou vide de l API (rien n est sorti de la machine ?)\n")
    sys.exit(3)
try:
    print(d["query"]["tokens"]["csrftoken"])
except (KeyError, TypeError):
    sys.stderr.write("_wiki-csrf.sh: pas de champ query.tokens.csrftoken dans la reponse\n")
    sys.exit(3)
' "$BODY") || exit 3

if [ "$CSRF" = '+\' ]; then
  echo "_wiki-csrf.sh: session expirée (l'API rend le jeton anonyme). Relance bin/wiki-login.sh." >&2
  exit 4
fi

printf '%s\n' "$CSRF"
