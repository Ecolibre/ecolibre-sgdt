# Lot 48 — tâche 3 : refus des espaces de formation dans les scripts

Session locale sur le Framework, 19 novembre 2026, branche `main`, après le
commit `649f3f3`. Aucune écriture sur le wiki.

**Résultat : les seize essais de refus rendent le code 1 avec la ligne ERREUR
du détecteur, sans qu'aucune requête parte. Les cinq témoins négatifs passent.**
Quatre contournements hors spécification sont relevés (écart 1, question A).

## Étape 1 — État du dépôt

- `git fetch origin` : `main` alignée sur `origin/main`, 0 commit de retard.
- `git status --porcelain` : sortie vide.
- `.claude/settings.local.json` au début : fichier absent, donc aucune règle.

## Étape 2 — Le détecteur `bin/_refus-formation.py`

Nouveau fichier, exécutable, sans dépendance hors bibliothèque standard,
appelé par `python3 -I`. Il commence par un commentaire qui en donne la raison :
lot 48, dépôt et rapports publics, aucune exception ni variable de levée.

- `--titre "T1" ["T2|T3" ...]` : chaque argument est découpé sur `|`. Chaque titre
  est décodé une fois (`unquote_plus`), ses soulignés deviennent des espaces,
  ses deux-points et espaces de tête sont retirés. Il est refusé s'il répond
  à `^(discussion +)?(cao|solidworks|freecad|onshape|fusion|inventor|catia) *:`,
  sans tenir compte de la casse.
- `--params "..."` : la chaîne est découpée sur `&`, puis chaque paire sur le
  premier `=`. Nom et valeur sont décodés une fois. Le refus tombe dans trois cas :
  1. un morceau de la valeur découpée sur `|` est un titre refusé ;
  2. la valeur contient l'un des noms suivi de deux-points, en début de valeur
     ou après `[`, `|`, `:`, `=` ou une espace ;
  3. le paramètre s'appelle `ns` ou finit par `namespace`, et sa valeur
     contient un numéro de 502 à 515, ou `*`.
- Sorties : code 0 et rien à l'écran si rien n'est visé ; sinon code 1 et une
  seule ligne sur la sortie d'erreur :
  `ERREUR: refus - '<valeur>' vise un espace de formation, réservé au dépôt formation-cao.` ;
  code 2 en cas d'usage incorrect. Les scripts appelants traitent tout code non nul
  comme un refus.

## Étape 3 — Branchement (diff complet des scripts modifiés)

`git diff --numstat` : `wiki-api.sh` 7+, `wiki-append.sh` 4+, `wiki-get.sh` 9+,
`wiki-move.sh` 5+, `wiki-purge.sh` 4+, `wiki-put.sh` 4+, `wiki-verify.sh` 3+ ;
aucune ligne retirée. `wiki-upload.sh` n'est pas modifié.

```diff
--- a/bin/wiki-api.sh
+++ b/bin/wiki-api.sh
@@ -90,6 +90,13 @@ if [ "$#" -ne 1 ]; then
 fi
 
 PARAMS="$1"
+
+# Lot 48 : refus des espaces de formation, sur la chaîne telle que reçue,
+# avant la transformation de --facts et tout appel réseau. En --facts, la
+# valeur de subject passe par la règle des titres et ns=502 à 515 est
+# refusé par la règle des paramètres ns.
+python3 -I "$(dirname "${BASH_SOURCE[0]}")/_refus-formation.py" --params "$PARAMS" || exit 1
+
 if [ "$FACTS_MODE" = 1 ]; then
--- a/bin/wiki-append.sh
+++ b/bin/wiki-append.sh
@@ -42,6 +42,10 @@
 set -euo pipefail
 DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
+
+# Lot 48 : refus des espaces de formation, avant .env et tout appel réseau.
+python3 -I "$DIR/bin/_refus-formation.py" --titre "${1:-}" || exit 1
+
 PRIVE_DIR="${SGDT_PRIVE:-$DIR/../ecolibre-sgdt-prive}"
--- a/bin/wiki-get.sh
+++ b/bin/wiki-get.sh
@@ -31,6 +31,15 @@ set -euo pipefail
 DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
+
+# Lot 48 : refus des espaces de formation, avant tout appel réseau. Contrôle
+# le titre, et la catégorie de --category (ou le titre de --protection).
+if [ "$#" -eq 2 ] && { [ "$1" = "--category" ] || [ "$1" = "--protection" ]; }; then
+  python3 -I "$DIR/bin/_refus-formation.py" --titre "$2" || exit 1
+elif [ "$#" -ge 1 ]; then
+  python3 -I "$DIR/bin/_refus-formation.py" --titre "$1" || exit 1
+fi
+
 PRIVE_DIR="${SGDT_PRIVE:-$DIR/../ecolibre-sgdt-prive}"
--- a/bin/wiki-move.sh
+++ b/bin/wiki-move.sh
@@ -12,6 +12,11 @@
 set -euo pipefail
 DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
+
+# Lot 48 : refus des espaces de formation (source et cible), avant .env et
+# tout appel réseau.
+python3 -I "$DIR/bin/_refus-formation.py" --titre "${1:-}" "${2:-}" || exit 1
+
 PRIVE_DIR="${SGDT_PRIVE:-$DIR/../ecolibre-sgdt-prive}"
--- a/bin/wiki-purge.sh
+++ b/bin/wiki-purge.sh
@@ -10,6 +10,10 @@
 set -euo pipefail
 DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
+
+# Lot 48 : refus des espaces de formation, avant .env et tout appel réseau.
+python3 -I "$DIR/bin/_refus-formation.py" --titre "${1:-}" || exit 1
+
 PRIVE_DIR="${SGDT_PRIVE:-$DIR/../ecolibre-sgdt-prive}"
--- a/bin/wiki-put.sh
+++ b/bin/wiki-put.sh
@@ -8,6 +8,10 @@
 set -euo pipefail
 DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
+
+# Lot 48 : refus des espaces de formation, avant .env et tout appel réseau.
+python3 -I "$DIR/bin/_refus-formation.py" --titre "${1:-}" || exit 1
+
 PRIVE_DIR="${SGDT_PRIVE:-$DIR/../ecolibre-sgdt-prive}"
--- a/bin/wiki-verify.sh
+++ b/bin/wiki-verify.sh
@@ -31,6 +31,9 @@ fi
 TITRE="$1"
 ENVOYE="$2"
 
+# Lot 48 : refus des espaces de formation, avant toute lecture.
+python3 -I "$(dirname "${BASH_SOURCE[0]}")/_refus-formation.py" --titre "$TITRE" || exit 1
+
 if [ ! -f "$ENVOYE" ]; then
```

Le diff a été raccourci au seul en-tête de chaque section : certaines lignes de
contexte, inchangées, n'y figurent pas. Le diff intégral était affiché dans le
terminal avant le commit.

## Étape 4 — Essais de refus, sans écriture

Les essais ont été lancés par un script de session affiché avec son lancement,
avec `https_proxy`, `HTTPS_PROXY` et `http_proxy` pointés sur
`http://127.0.0.1:9`. Pour chaque essai, il relève le code de sortie et la
dernière ligne de la sortie d'erreur. **Témoin du proxy** : dans les mêmes
conditions, la lecture autorisée `bin/wiki-get.sh "Accueil"` a échoué
(code 1, `json.decoder.JSONDecodeError: Expecting value`, faute de réponse).
Le réseau était donc bien coupé, et une requête partie aurait produit une
erreur de connexion, pas la ligne ERREUR du détecteur.

| Commande | Code | Message |
|---|---|---|
| `wiki-get.sh "CAO:Titre factice"` | 1 | ERREUR: refus - 'CAO:Titre factice' vise un espace de formation, réservé au dépôt formation-cao. |
| `wiki-get.sh "Discussion_CAO:Titre factice"` | 1 | ERREUR: refus - 'Discussion_CAO:Titre factice' … |
| `wiki-get.sh "solidworks:x"` | 1 | ERREUR: refus - 'solidworks:x' … |
| `wiki-get.sh ":Fusion:x"` | 1 | ERREUR: refus - ':Fusion:x' … |
| `wiki-get.sh --category "Catia:x"` | 1 | ERREUR: refus - 'Catia:x' … |
| `wiki-put.sh "FreeCAD:x" /dev/null "essai"` | 1 | ERREUR: refus - 'FreeCAD:x' … |
| `wiki-append.sh "Onshape : x" /dev/null "essai"` | 1 | ERREUR: refus - 'Onshape : x' … |
| `wiki-move.sh "Accueil" "Inventor:x"` | 1 | ERREUR: refus - 'Inventor:x' … |
| `wiki-purge.sh "Accueil\|CAO:x"` | 1 | ERREUR: refus - 'CAO:x' … |
| `wiki-verify.sh "Discussion Fusion:x" /dev/null` | 1 | ERREUR: refus - 'Discussion Fusion:x' … |
| `wiki-api.sh "action=query&titles=Accueil\|FreeCAD:x"` | 1 | ERREUR: refus - 'FreeCAD:x' … |
| `wiki-api.sh "action=query&list=allpages&apnamespace=504"` | 1 | ERREUR: refus - 'apnamespace=504' … |
| `wiki-api.sh "action=query&list=search&srsearch=x&srnamespace=*"` | 1 | ERREUR: refus - 'srnamespace=*' … |
| `wiki-api.sh "action=ask&query=%5B%5BOnshape%3A%2B%5D%5D"` | 1 | ERREUR: refus - '[[Onshape:+]]' … |
| `wiki-api.sh --facts "subject=Essai lot 48&ns=502"` | 1 | ERREUR: refus - 'ns=502' … |
| `wiki-api.sh --facts "subject=CAO:Essai lot 48"` | 1 | ERREUR: refus - 'CAO:Essai lot 48' … |

(« … » : la fin de ligne, identique dans tous les cas, « vise un espace de
formation, réservé au dépôt formation-cao. »)

### Témoins négatifs

| Commande | Code | Message |
|---|---|---|
| détecteur `--titre "Accueil" "Catégorie:Lot" "Fusion de deux pages" "CAOutchouc" "Lot 48 essai"` | 0 | (rien) |
| détecteur `--params "action=query&list=allpages&apnamespace=0"` | 0 | (rien) |
| détecteur `--params "action=query&list=recentchanges&rcnamespace=0\|102"` | 0 | (rien) |
| `wiki-get.sh "Accueil"`, en réseau réel | 0 | wikitexte rendu, 1 642 octets |
| `wiki-api.sh "action=query&meta=siteinfo&format=json"`, en réseau réel | 0 | réponse avec `sitename` |

## Étape 5 — CLAUDE.md

La section « Espaces de formation (lot 48) » a été ajoutée en fin de fichier, mot pour
mot, précédée d'une ligne vide. `git diff --numstat CLAUDE.md` : 4 ajouts,
0 suppression : la ligne vide, le titre, la ligne vide, le paragraphe.

## Relevé de `.claude/settings.local.json`

- Début de tâche : fichier absent.
- Fin de tâche : fichier absent.

## Questions posées et réponses rendues hors consigne

Aucune.

## Écarts et surprises

1. **Contournements que la spécification ne couvre pas**, mesurés sur le
   détecteur seul (code 0, donc non refusés) :
   - `action=smwbrowse&params={"subject":"CAO:x","ns":502}`, la forme brute
     de `smwbrowse` que `CLAUDE.md` documente : le nom est précédé d'un `"`,
     qui n'est pas dans la liste des séparateurs, et `ns` est dans le JSON,
     pas dans un paramètre.
   - `pageids=725` ou `revids=1809` : on peut viser une page par son numéro,
     sans nommer l'espace.
   - `list=recentchanges` sans `rcnamespace` : MediaWiki couvre alors tous les
     espaces, et la réponse donnerait au membre les titres des pages de
     formation. Il en irait de même pour `list=logevents`, `list=usercontribs`
     ou `list=watchlistraw`. Ce sont des titres, sans contenu.
   - `action=parse&page=Essai inclusion lot 48` passe, mais sans risque :
     l'inclusion est interdite, et le rendu ne contient qu'un lien.
   - Une recherche sans `srnamespace` passe aussi, sans risque : elle ne
     couvre par défaut que l'espace principal.
   Voir la question A.
2. Dans la règle « nom dans une valeur », j'ai remplacé les soulignés par des
   espaces avant la recherche, comme dans la règle des titres, pour que
   `[[Discussion_CAO:+]]` soit aussi refusé. C'est un peu plus large que la
   liste de séparateurs donnée par la consigne. Aucun témoin négatif n'en est
   affecté.
3. Dans `wiki-get.sh`, le titre de `--protection` passe aussi par le détecteur,
   en plus du titre simple et de `--category`. C'est une lecture d'un titre
   comme une autre.
4. Le détecteur se place avant le contrôle d'existence du fichier dans
   `wiki-verify.sh`. Sans cela, l'essai avec `/dev/null`, qui n'est pas un
   fichier ordinaire, aurait échoué sur « fichier envoyé introuvable » et non sur le
   refus.
5. Le témoin du proxy coupé fait échouer `wiki-get.sh` sur une trace
   `JSONDecodeError`, et non sur un message clair : ce script ne traite pas la
   réponse vide, contrairement à `wiki-api.sh`. C'est une dette déjà connue en
   substance, et elle n'est pas modifiée ici.
6. Le message de refus d'un paramètre d'espace affiche `nom=valeur` (par exemple
   `'ns=502'`), et non la valeur seule : sans le nom, le message ne dirait pas
   quel paramètre est en cause.

## Question

**A.** Le détecteur suit la spécification, mais il laisse passer trois formes qui
peuvent faire sortir des titres ou des faits des espaces de formation :
`smwbrowse` en JSON brut, `pageids` et `revids`, et les listes qui couvrent par
défaut tous les espaces (`recentchanges`, `logevents`, `usercontribs`,
`watchlistraw`). Faut-il les fermer ? Ma suggestion :
- ajouter `"`, `{` et `,` aux séparateurs de la règle « nom dans une valeur » ;
- refuser `"ns":50[2-9]` et `"ns":51[0-5]` dans une valeur ;
- refuser `pageids` et `revids` dans `wiki-api.sh`. Mesure : un `grep` de ces
  deux noms dans `bin/`, `CLAUDE.md` et `methode-de-travail.md` ne trouve
  rien. Ce `grep` ne voit pas les appels passés dans les rapports ;
- pour les listes, ne rien interdire : en sortie, ce sont des titres, et le
  rapport est la frontière.
