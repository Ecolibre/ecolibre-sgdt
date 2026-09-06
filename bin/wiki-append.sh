#!/usr/bin/env bash
# Usage: bin/wiki-append.sh "Nom de la page" fichier.txt "résumé de modif"
#
#   Ajoute le contenu de fichier.txt À LA FIN de la page, via
#   action=edit&appendtext — sans jamais lire ni renvoyer le corps existant.
#   La surface de corruption d'un ajout d'entrée est donc nulle : les octets
#   déjà en place ne repassent jamais par un fichier local retouché à la main.
#
#   PÉRIMÈTRE — réservé aux pages qui se TERMINENT par la cible d'ajout :
#   une liste numérotée ouverte, un journal. Le script REFUSE (avant toute
#   écriture) si la dernière ligne non vide de la page — en ignorant un
#   éventuel commentaire HTML final — ne commence pas par « # ». Il ne sait
#   pas ajouter ailleurs qu'en toute fin de page : une section « == … == »
#   placée après la liste ferait atterrir l'ajout hors de la liste, sans
#   aucune erreur d'API.
#
#   REFUSE AUSSI si une ligne vide sépare la dernière entrée d'un commentaire
#   HTML final : appendtext ajoutant après le commentaire, cette ligne vide
#   couperait la liste en deux au rendu (invisible au wikitexte). Le
#   commentaire garde-fou doit être collé à la dernière entrée.
#
#   Contrôles APRÈS écriture : re-lecture du wikitexte (l'ajout est bien la
#   dernière entrée, +1 entrée « # »), puis du RENDU (l'ajout n'a pas démarré
#   une seconde liste numérotée). Tout écart est un avertissement bruyant —
#   l'ajout reste annulable par l'historique.
#
#   NE RÉSOUT PAS la correction d'une entrée existante. Reformuler, corriger
#   ou compléter une entrée au milieu de la page reste une réécriture
#   complète par bin/wiki-put.sh, avec toute la page qui repasse par un
#   fichier local. Le gain de ce script porte sur l'AJOUT, pas la correction.
#
#   Le fichier d'ajout doit commencer par exactement UN saut de ligne suivi
#   de « # » (zéro saut de ligne collerait l'ajout à la dernière entrée ;
#   deux casseraient la liste numérotée en deux) et contenir exactement une
#   ligne « # ».
#
#   Jamais bot=1. Jamais createonly : c'est un ajout, pas une création —
#   nocreate=1 est passé, la page DOIT déjà exister.
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

PAGE="${1:?Usage: bin/wiki-append.sh \"Page\" fichier.txt \"résumé\"}"
FILE="${2:?Usage: bin/wiki-append.sh \"Page\" fichier.txt \"résumé\"}"
SUMMARY="${3:?Usage: bin/wiki-append.sh \"Page\" fichier.txt \"résumé\" — le résumé est obligatoire}"

[ -f "$FILE" ] || { echo "ERREUR: fichier d'ajout introuvable : $FILE" >&2; exit 1; }

case "$PAGE" in
  MediaWiki:*)
    echo "ERREUR: refus d'écrire sur '$PAGE' — l'espace MediaWiki: se modifie à la main, jamais par le bot." >&2
    exit 1
    ;;
esac

# --- Contrôle local du fichier d'ajout -------------------------------------
python3 -c '
import sys
data = open(sys.argv[1], "rb").read().decode("utf-8")
if not data.startswith("\n"):
    sys.exit("REFUS: le fichier d ajout doit commencer par un saut de ligne (puis \"# \").")
if data.startswith("\n\n"):
    sys.exit("REFUS: le fichier d ajout commence par deux sauts de ligne — une ligne vide entre deux \"#\" casse la liste numerotee.")
body = data[1:]
if not body.startswith("# "):
    sys.exit("REFUS: apres le saut de ligne initial, le fichier d ajout doit commencer par \"# \".")
hashes = [ln for ln in body.split("\n") if ln.startswith("# ")]
if len(hashes) != 1:
    sys.exit("REFUS: le fichier d ajout doit contenir exactement une ligne \"# \" (trouve: %d)." % len(hashes))
' "$FILE"

# --- Pré-contrôle de la page : la liste doit finir la page ----------------
# On lit la page UNE fois pour ce contrôle. C'est une lecture, mais on ne
# renvoie jamais ce qu'on a lu : la surface de corruption de l'ajout reste
# nulle (appendtext n'envoie que le nouveau bloc).
BEFORE_TXT="$("$DIR/bin/wiki-get.sh" "$PAGE")"
COUNT_BEFORE=$(printf '%s\n' "$BEFORE_TXT" | python3 -c '
import sys
text = sys.stdin.read()
lines = text.split("\n")

# retirer les lignes vides terminales
while lines and lines[-1].strip() == "":
    lines.pop()

# retirer UN commentaire HTML final (mono- ou multi-ligne). Refus si une
# ligne vide le separe de la derniere entree : appendtext ajoute APRES le
# commentaire, et cette ligne vide couperait alors la liste numerotee en
# deux au rendu — sans aucune erreur d API (mesure du 6 septembre 2026).
if lines and lines[-1].rstrip().endswith("-->"):
    j = len(lines) - 1
    while j >= 0 and "<!--" not in lines[j]:
        j -= 1
    if j >= 0 and lines[j].split("<!--", 1)[0].strip() == "":
        if j - 1 >= 0 and lines[j - 1].strip() == "":
            sys.stderr.write("REFUS: une ligne vide separe la derniere entree du commentaire HTML final.\n")
            sys.stderr.write("       appendtext ajoute APRES ce commentaire ; la ligne vide casserait\n")
            sys.stderr.write("       la liste numerotee en deux au rendu. Coller le commentaire a la\n")
            sys.stderr.write("       derniere entree (aucune ligne vide entre les deux).\n")
            sys.exit(2)
        del lines[j:]

while lines and lines[-1].strip() == "":
    lines.pop()

if not lines or not lines[-1].startswith("# "):
    last = lines[-1] if lines else "(page vide)"
    sys.stderr.write("REFUS: la derniere ligne de contenu de la page nest pas une entree de liste.\n")
    sys.stderr.write("       derniere ligne vue: " + last[:100] + "\n")
    sys.stderr.write("       bin/wiki-append.sh najoute quen fin de PAGE : la cible doit finir la page.\n")
    sys.exit(2)
print(sum(1 for ln in text.split("\n") if ln.startswith("# ")))
')

echo "Pré-contrôle OK — $COUNT_BEFORE entrées « # » avant ajout, la liste finit la page." >&2

# --- Jeton CSRF ----------------------------------------------------------
CSRF=$("$DIR/bin/_wiki-csrf.sh" "$C") || exit 1

# --- Écriture : appendtext, jamais le corps existant --------------------
curl -sS -b "$C" -c "$C" "$WIKI_API" \
  --data-urlencode "action=edit" \
  --data-urlencode "title=$PAGE" \
  --data-urlencode "appendtext@$FILE" \
  --data-urlencode "summary=$SUMMARY" \
  --data-urlencode "token=$CSRF" \
  -d nocreate=1 -d assert=user -d format=json -d formatversion=2 \
  | python3 -c '
import sys, json
raw = sys.stdin.read()
try:
    d = json.loads(raw)
except json.JSONDecodeError:
    sys.stderr.write("ERREUR: reponse non-JSON de l API (transport ?)\n")
    sys.stdout.write(raw + "\n")
    sys.exit(1)
print(json.dumps(d, indent=4, ensure_ascii=False))
if "error" in d:
    e = d["error"]
    sys.stderr.write("ERREUR API: " + e.get("code", "?") + " — " + e.get("info", "") + "\n")
    sys.exit(1)
if d.get("edit", {}).get("result") != "Success":
    sys.stderr.write("ERREUR: ajout non confirme (result != Success)\n")
    sys.exit(1)
'

# --- Post-contrôle : re-lecture, l ajout est bien la derniere entree ----
AFTER_TXT="$("$DIR/bin/wiki-get.sh" "$PAGE")"
printf '%s\n' "$AFTER_TXT" | python3 -c '
import sys
text = sys.stdin.read()
count_before = int(sys.argv[1])
added = open(sys.argv[2], "rb").read().decode("utf-8")[1:].rstrip("\n")

def strip_tail(lines):
    changed = True
    while changed:
        changed = False
        while lines and lines[-1].strip() == "":
            lines.pop()
        if lines and lines[-1].rstrip().endswith("-->"):
            j = len(lines) - 1
            while j >= 0 and "<!--" not in lines[j]:
                j -= 1
            if j >= 0 and lines[j].split("<!--", 1)[0].strip() == "":
                del lines[j:]
                changed = True
    return lines

all_lines = text.split("\n")
count_after = sum(1 for ln in all_lines if ln.startswith("# "))
tail = strip_tail(list(all_lines))

problems = []
if count_after != count_before + 1:
    problems.append("le nombre d entrees # est passe de %d a %d (attendu +1)" % (count_before, count_after))
if not tail or tail[-1] != added:
    problems.append("la derniere entree de la page nest pas le texte ajoute")
if added not in text:
    problems.append("le texte ajoute est introuvable dans la page relue")

if problems:
    sys.stderr.write("AVERTISSEMENT: post-controle en echec —\n")
    for p in problems:
        sys.stderr.write("  - " + p + "\n")
    sys.stderr.write("  Lajout est annulable par lhistorique de la page.\n")
    sys.exit(1)
print("Post-controle OK : %d -> %d entrees, lajout est bien la derniere entree de la page." % (count_before, count_after))
' "$COUNT_BEFORE" "$FILE"

# --- Post-contrôle du RENDU : l'ajout ne doit pas avoir demarre une seconde
#     liste numerotee (cas ou un commentaire HTML mal place coupe la liste
#     sans erreur d API — invisible au controle du wikitexte ci-dessus).
PAGE_ENC=$(python3 -c 'import sys, urllib.parse; print(urllib.parse.quote(sys.argv[1]))' "$PAGE")
"$DIR/bin/wiki-api.sh" "action=parse&page=$PAGE_ENC&prop=text&format=json&formatversion=2" \
  | python3 -c '
import sys, json, re
added_markup = open(sys.argv[1], "rb").read().decode("utf-8")[1:].lstrip("# ").rstrip("\n")
needle = re.sub(r"[^0-9A-Za-zÀ-ÿ ]", "", added_markup).strip()[:40]
try:
    html = json.load(sys.stdin)["parse"]["text"]
except (json.JSONDecodeError, KeyError):
    sys.stderr.write("NOTE: rendu illisible, controle du rendu saute (le wikitexte, lui, est OK).\n")
    sys.exit(0)
ols = re.findall(r"<ol[^>]*>.*?</ol>", html, re.S)
host = [o for o in ols if needle and needle in re.sub(r"<[^>]+>", "", o)]
if host and host[-1].count("<li") == 1:
    sys.stderr.write("AVERTISSEMENT: au rendu, lajout forme une liste numerotee A LUI SEUL —\n")
    sys.stderr.write("  la liste a ete coupee en deux. Verifier la page ; lajout est annulable.\n")
    sys.exit(1)
print("Rendu OK : lajout sinsere dans la liste existante (%d bloc(s) <ol> sur la page)." % len(ols))
' "$FILE"
