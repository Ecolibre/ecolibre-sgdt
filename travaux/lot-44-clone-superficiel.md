# Lot 44 — règle sur les clones superficiels, et précision de date, 29 octobre 2026

Règle ajoutée en tête des garde-fous git de `CLAUDE.md` sur les clones
superficiels, et précision sur deux pages : la date du 1er septembre 2026
est celle de la classe sémantique des lots. Session Claude Code hébergée
(cloud), branche de travail `ccr-4b59dccc-xydpag`.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` au départ : sortie vide, aucun arrêt.
- `git fetch origin` : `origin/main` sur `a2ae613`, comme la branche de
  travail ; `Already up to date`.
- `git rev-parse --is-shallow-repository` : **`false`**. Ce n'est pas l'état
  d'origine de la session : le clone était superficiel, et je l'ai complété
  par `git fetch --unshallow origin` à la tâche précédente, dans le même
  conteneur. Une session cloud neuve repartira probablement d'un clone
  superficiel.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.

## 2. Contrôles avant écriture

| Page | `lastrevid` | Annoncé | Copie locale |
|---|---|---|---|
| Procédure de clôture d'une conversation | 1703 | 1703 | identique (`cmp`) |
| Lot 44 — Mémoire des choix contraints et clôture des travaux | 1704 | 1704 | identique |

Chaînes à remplacer, comptées par le script de scratchpad `classe.py`,
montré avant son lancement, qui s'arrêtait sur une chaîne absente ou
multiple : une occurrence chacune. Ancrage de `CLAUDE.md` : le titre
« ## Garde-fous d'exécution (dépôt git) » (ligne 663), une ligne vide, puis
le tiret « **État propre avant toute opération destructive** » (ligne 665).

## 3. Écritures

`bin/wiki-login.sh` : `Success Cywil`. Chaque écriture a été précédée d'une
relecture de son `lastrevid`, inchangé à chaque fois.

| N° | Page | Résumé | Révision | Diff |
|---|---|---|---|---|
| 1 | Procédure de clôture d'une conversation | `[Lot 44] Précision : la date est celle de la classe sémantique` | 1703 → **1706**, 11:41:17 UTC | ligne 5 seule ; 6 461 → 6 486 octets |
| 2 | Lot 44 — Mémoire des choix contraints et clôture des travaux | `[Lot 44] Précision : la date est celle de la classe sémantique` | 1704 → **1707**, 11:41:21 UTC | ligne 27 seule ; 8 231 → 8 257 octets |

Deux écritures sur le wiki, pas une de plus. Les copies locales
`pages/Procedure_cloture_conversation.txt` et `pages/Lot_44.txt` ont reçu
les fichiers envoyés.

## 4. Modification du dépôt

`CLAUDE.md` : la règle est insérée comme premier tiret de la section
« Garde-fous d'exécution (dépôt git) », après la ligne vide qui suit le
titre et avant « **État propre avant toute opération destructive** ».
`git diff --numstat` : **7 lignes ajoutées, 0 supprimée**.

## 5. Vérifications

### Vérification décisive

| Contrôle | Résultat |
|---|---|
| « système de lots, dont la classe sémantique date du 1er septembre 2026 », pages relues en ligne | présente **une fois** sur chacune des deux pages |
| « système de lots créé » | absente des deux |
| `bin/wiki-verify.sh` | `IDENTIQUE` sur les deux |
| `CLAUDE.md` | la règle est le premier élément de la liste de la section (lignes 665 à 671) ; diff : uniquement des lignes ajoutées |

**Réussie.**

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| Classe `error`, liens rouges | 0 et aucun, sur les deux pages |
| Catégories | inchangées : `Page de suivi` et `Lot` |
| Lot 44, faits | `Work_package_number` 44, `Work_package_status` ouvert, `Work_package_opening_date` 2026-10-19, deux recoupements, aucun `_ERRC` |
| Procédure de clôture d'une conversation | huit sections, tableau de 7 lignes `<tr>`, un bloc `pre` |

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- Le résultat `false` de l'étape 1 tient à mon `--unshallow` de la veille
  dans le même conteneur. Il ne mesure pas l'état dans lequel une session
  cloud reçoit le dépôt, qui était `true` pour celle-ci (relevé du
  29 octobre, `travaux/lot-44-correction-mesure.md`).
- La règle date de deux constats « le 28 octobre 2026 ». Le mien figure
  dans mon rapport du 28 octobre (`travaux/lot-44-cloture-conversation.md`),
  mais il n'a été reconnu comme une erreur de clone superficiel que le
  29 octobre. Je n'ai pas de quoi dater celui de la conversation claude.ai.
  Le texte a été écrit tel quel.
- Aucun autre écart.

## Poussée

Commit poussé sur `main`, et sur la branche désignée `ccr-4b59dccc-xydpag`.
