# Lot 44 — numérotation de « Choix imposés par l'outil », 20 octobre 2026

Correction de la numérotation de la page « Choix imposés par l'outil » : les
cinq lignes vides placées entre les entrées coupaient la liste numérotée en
six listes, chacune affichée « 1. ». Défaut signalé dans
`travaux/lot-44-choix-imposes.md`. Session Claude Code hébergée (cloud),
branche de travail `ccr-4b59dccc-xydpag`.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` au départ : sortie vide, aucun arrêt.
- `git fetch origin` : `origin/main` sur `e434d6d`, comme la branche de
  travail ; aucune mise à niveau nécessaire.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.

## 2. État de départ

- Page en ligne en **révision 1685**, inchangée depuis sa création.
- `bin/wiki-verify.sh` avant correction : copie locale `IDENTIQUE` à la page
  en ligne, donc la correction part bien de l'état publié.

## 3. Correction de la copie locale

Cinq suppressions faites avec l'outil de modification de fichier, chacune
ancrée sur la fin de la dernière sous-rubrique d'une entrée et le début de
l'intitulé de l'entrée suivante. Lignes vides supprimées : 12, 18, 24, 30
et 36 de l'ancienne copie.

Contrôles avant envoi :

| Contrôle | Mesure | Résultat |
|---|---|---|
| `git diff` : cinq lignes vides supprimées, rien d'ajouté ni de modifié | `--numstat` : `0 5` ; les cinq lignes retirées sont toutes vides (`-$` sous `cat -A`) | conforme |
| Aucune ligne vide entre la première ligne en `#` et la dernière en `#*` | lignes 7 à 36 de la nouvelle copie : zéro ligne vide | conforme |
| Six lignes commençant par `# '''` | 6 (et 24 lignes en `#*`) | conforme |

Les lignes vides restantes sont les lignes 2, 4, 6, 37, 39 et 41 : celle
qui précède la première entrée (6) et celle qui précède le séparateur
final (37) sont en place. Le fichier passe de 47 à 42 lignes.

## 4. Écriture

1. `bin/wiki-login.sh` : `Success Cywil`.
2. `bin/wiki-put.sh "Choix imposés par l'outil" pages/Choix_imposes_par_l_outil.txt "[Lot 44] Entrées numérotées de 1 à 6 : les lignes vides coupaient la liste"`
   : `Success`, **révision 1687** (ancienne 1685), 12:57:56 UTC.

Une seule écriture sur le wiki.

## 5. Vérifications

### Vérification décisive

Rendu de la révision 1687 (`action=parse&prop=text`) :

- **une seule** balise `<ol>`, sans attribut `start`, et une seule `</ol>` ;
- **six** éléments `<li>` de premier niveau dans cette liste ; les 30
  éléments `<li>` de la page sont tous nus, sans attribut `value`, donc
  numérotés à la suite par le navigateur : les numéros affichés vont de 1
  à 6 ;
- les six listes à puces des sous-rubriques (`<ul>`) sont imbriquées dans
  les six entrées.

**Réussie.**

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| `bin/wiki-verify.sh` | `IDENTIQUE` |
| Classe `error` dans le rendu | 0 |
| Liens rouges | aucun (`class="new"` : 0) ; trois liens internes, tous existants : « Gestion des lots », « Limites connues du Système de Gestion de Données Techniques », « Récapitulatif technique du Système de Gestion de Données Techniques » |
| Texte complet | les 6 intitulés et les 24 sous-rubriques, dépouillés de leur balisage, se retrouvent tous dans le texte du rendu : 30 sur 30 |
| Catégorie | `Catégorie:Page de suivi`, seule |

Contrôle en plus : `bin/wiki-api.sh --facts` rend toujours `_INST`
(Page de suivi), `_MDAT` et `_SKEY`, et aucun fait métier.

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- La numérotation de 1 à 6 se déduit du rendu HTML (une seule liste, six
  éléments nus) et non d'une observation à l'écran : le numéro affiché est
  produit par le navigateur, que je ne vois pas.
- Aucun autre écart.

## Poussée

Commit poussé sur `main`, et sur la branche désignée `ccr-4b59dccc-xydpag`.
