# Lot 44 — date du premier constat de clone superficiel, 29 octobre 2026

Correction de la date dans la règle sur les clones superficiels de
`CLAUDE.md`, ajoutée la veille : le premier constat date du 19 octobre 2026
dans la conversation claude.ai, le second du 28 octobre 2026 dans une
session cloud. Aucune écriture sur le wiki. Session Claude Code hébergée
(cloud), branche de travail `ccr-4b59dccc-xydpag`.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` au départ : sortie vide, aucun arrêt.
- `git fetch origin` : `origin/main` sur `ea032f9`, comme la branche de
  travail ; `Already up to date`.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.

## 2. Contrôle avant modification

La chaîne à remplacer, sur trois lignes, est présente **une seule fois**
dans `CLAUDE.md`, aux lignes 669 à 671. Le retour à la ligne tombe
exactement où la consigne le place. La section « Garde-fous d'exécution
(dépôt git) » compte **13** éléments de premier niveau (lignes commençant
par `- `).

## 3. Modification

Remplacement fait avec l'outil de modification de fichier, avec
l'indentation de liste (deux espaces) conservée sur les lignes de
continuation.

`git diff --numstat` : **4 ajoutées, 3 supprimées**, dans un seul bloc
(`@@ -669,3 +669,4 @@`). Les trois lignes retirées sont celles de l'ancienne
phrase, les quatre ajoutées celles de la nouvelle. La première ligne garde
son début, « `git fetch --unshallow` le complète. », qui n'a pas changé.

## 4. Vérifications

### Vérification décisive

| Contrôle | Résultat |
|---|---|
| « deux fois le 28 octobre 2026 » | **0** occurrence dans `CLAUDE.md` |
| « le 19 octobre 2026 dans une conversation » | **1** occurrence |
| Portée du diff | un seul bloc, dans le paragraphe de la règle sur les clones superficiels |

**Réussie.**

### Vérification secondaire

La règle est toujours le premier élément de la section (« **Avant de
conclure quoi que ce soit d'un `git log`, vérifier que le clone n'est pas
superficiel** »), et la section compte toujours **13** éléments.

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- La première ligne du paragraphe modifié dépasse maintenant la largeur des
  lignes voisines : 85 caractères environ, parce que « Constaté deux fois sur
  le même fichier, avec » suit « `git fetch --unshallow` le complète. » sur la
  même ligne, comme le prévoyait la coupure fournie. En markdown, la coupure
  est sans effet sur le rendu ; je ne l'ai pas rééquilibrée, le texte étant
  fourni mot pour mot.
- Aucun autre écart.

## Poussée

Commit poussé sur `main`, et sur la branche désignée `ccr-4b59dccc-xydpag`.
