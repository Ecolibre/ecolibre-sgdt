#!/usr/bin/env bash
# bin/wiki-wait-jobs.sh — attend que la file de travaux différés du wiki se vide.
#
# Usage : bin/wiki-wait-jobs.sh [essais] [intervalle]
#   essais     nombre d'interrogations (défaut 20)
#   intervalle secondes entre deux interrogations (défaut 3)
#
# Sortie 0 : file vide.
# Sortie 1 : file non vide au terme des essais, ou API injoignable.
# Sortie 2 : file figée — même compte sur 5 essais consécutifs.
#
# Lecture seule : n'interroge que action=query&meta=siteinfo.

set -uo pipefail

racine="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
essais="${1:-20}"
intervalle="${2:-3}"

lire_jobs() {
  "$racine/bin/wiki-api.sh" "action=query&meta=siteinfo&siprop=statistics" 2>/dev/null \
    | python3 -c "import json,sys; print(json.load(sys.stdin)['query']['statistics']['jobs'])" 2>/dev/null
}

identiques=0
precedent=""

for ((i = 1; i <= essais; i++)); do
  jobs="$(lire_jobs)"
  if [ -z "$jobs" ]; then
    echo "essai $i : lecture impossible (API injoignable ou reponse inattendue)"
    exit 1
  fi
  echo "essai $i : jobs=$jobs"
  if [ "$jobs" = "0" ]; then
    echo "FILE VIDE"
    exit 0
  fi
  if [ "$jobs" = "$precedent" ]; then
    identiques=$((identiques + 1))
  else
    identiques=0
  fi
  if [ "$identiques" -ge 4 ]; then
    echo "FILE FIGEE a $jobs travaux — inutile d'attendre davantage"
    exit 2
  fi
  precedent="$jobs"
  sleep "$intervalle"
done

echo "FILE NON VIDE apres $essais essais (dernier compte : $jobs)"
exit 1
