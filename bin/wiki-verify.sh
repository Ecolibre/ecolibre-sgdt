#!/usr/bin/env bash
# bin/wiki-verify.sh — relit une page après écriture et la compare au
# fichier envoyé.
#
# Usage : bin/wiki-verify.sh "Titre de la page" chemin/vers/fichier-envoye.txt
#
# Relit la page par bin/wiki-get.sh dans un fichier temporaire, compare au
# fichier envoyé, affiche le diff s'il y en a un.
#
# Sortie 0 : contenu identique.
# Sortie 1 : écart de contenu, ou lecture de la page impossible (les deux
#            cas s'affichent avec un message distinct, jamais confondus).
#
# stderr n'est jamais redirigé vers le fichier temporaire de lecture (pas de
# 2>&1) : un échec de bin/wiki-get.sh (page introuvable, session expirée,
# API injoignable) doit rester visible comme une erreur, jamais se mélanger
# au contenu comparé comme s'il s'agissait d'un écart de wikitexte. Défaut
# relevé huit fois sur les confirmations shell analysées.
#
# bin/wiki-get.sh ne renvoie jamais de saut de ligne final ; un fichier
# produit par l'outil d'écriture en porte presque toujours un. Ce seul octet
# n'est pas un écart de wikitexte — la comparaison l'ignore, pas le reste.

set -uo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 \"Titre de la page\" chemin/vers/fichier-envoye.txt" >&2
  exit 1
fi

TITRE="$1"
ENVOYE="$2"

if [ ! -f "$ENVOYE" ]; then
  echo "ERREUR: fichier envoyé introuvable : $ENVOYE" >&2
  exit 1
fi

racine="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP="$(mktemp)"
trap 'rm -f "$TMP"' EXIT

if ! "$racine/bin/wiki-get.sh" "$TITRE" > "$TMP"; then
  echo "ERREUR: lecture de la page impossible (bin/wiki-get.sh a échoué) — comparaison non faite." >&2
  exit 1
fi

python3 -c '
import sys, difflib

envoye_path, lu_path, titre = sys.argv[1], sys.argv[2], sys.argv[3]

with open(envoye_path, "r", encoding="utf-8") as f:
    envoye = f.read()
with open(lu_path, "r", encoding="utf-8") as f:
    lu = f.read()

envoye_cmp = envoye[:-1] if envoye.endswith("\n") and not lu.endswith("\n") else envoye

if envoye_cmp == lu:
    print("IDENTIQUE : " + titre)
    sys.exit(0)

diff = difflib.unified_diff(
    envoye.splitlines(keepends=True), lu.splitlines(keepends=True),
    fromfile="envoyé (" + envoye_path + ")", tofile="lu sur le wiki (" + titre + ")",
)
sys.stdout.writelines(diff)
print("ECART : " + titre, file=sys.stderr)
sys.exit(1)
' "$ENVOYE" "$TMP" "$TITRE"
