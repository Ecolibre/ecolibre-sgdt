# Lot 44 — orthographe traditionnelle sur trois pages, 28 octobre 2026

Treize formes rectifiées ramenées à l'orthographe traditionnelle du wiki,
sur « Choix imposés par l'outil », la page du lot 44 et la *Procédure de
clôture d'un lot*, et règle ajoutée à `methode-de-travail.md`. Réponse aux
questions A et B de `travaux/lot-44-coherences.md`. Session Claude Code
hébergée (cloud), branche de travail `ccr-4b59dccc-xydpag`.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` au départ : sortie vide, aucun arrêt.
- `git fetch origin` : `origin/main` avait avancé de `8e59b0d` à `9837747`
  (notes « swowl » dans `travaux/`, aucun changement de `CLAUDE.md`, de
  `bin/` ni de `methode-de-travail.md`). Mise à niveau par avance rapide,
  sans conflit.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.

## 2. Contrôles avant écriture

`lastrevid` relevés : « Choix imposés par l'outil » **1687**, page du lot 44
**1697**, procédure de clôture **1696**, conformes à la consigne. Catégories :
`Page de suivi`, `Lot`, `Page de suivi`.

Occurrences comptées sur le wikitexte relu par `bin/wiki-get.sh`, par mots
entiers (bornes `(?<!\w)` et `(?!\w)` en Python, sensibles à la casse), dans
l'ordre de remplacement prescrit :

| Page | Forme | Annoncé | Trouvé | Lignes |
|---|---|---|---|---|
| Choix imposés par l'outil | couterait | 1 | 1 | 1 |
| | Cout | 6 | 6 | 11, 16, 21, 26, 31, 36 |
| | cout | 2 | 2 | 16, 26 |
| Lot 44 | couterait | 1 | 1 | 35 |
| Procédure de clôture d'un lot | couterait | 1 | 1 | 67 |
| | cout | 1 | 1 | 67 |
| | connaitre | 1 | 1 | 67 |

Total : **13**, comme annoncé. Le « coûterait » déjà correct de la page du
lot 44 (ligne 23) n'est pas pris par le motif `couterait` et reste intact :
la page en porte deux après remplacement.

## 3. Préparation et diff

Les fichiers modifiés ont été produits par un script de scratchpad,
`ortho.py`, montré avant son lancement. Pour chaque règle, il comptait les
occurrences, s'arrêtait si le compte différait de l'annonce, puis
remplaçait, « couterait » toujours en premier. Contrôles du diff :

| Page | Octets | Lignes modifiées | Seuls mots changés |
|---|---|---|---|
| Choix imposés par l'outil | 6 757 → 6 766 (+9) | 1, 11, 16, 21, 26, 31, 36 | les neuf formes visées |
| Lot 44 | 8 142 → 8 143 (+1) | 35 | `couterait` → `coûterait` |
| Procédure de clôture | 8 255 → 8 258 (+3) | 67 | `couterait`, `cout`, `connaitre` |

Chaque octet ajouté correspond à une lettre accentuée : `û` et `î` prennent
deux octets en UTF-8 contre un pour `u` et `i`. Nombre de lignes inchangé
sur les trois pages ; mot à mot, aucun autre changement.

## 4. Écritures

`bin/wiki-login.sh` : `Success Cywil`. Chaque écriture a été précédée d'une
relecture de son `lastrevid`, inchangé à chaque fois.

| N° | Page | Résumé | Révision |
|---|---|---|---|
| 1 | Choix imposés par l'outil | `[Lot 44] Orthographe : coût, comme le reste du wiki` | 1687 → **1698**, 22:49:04 UTC |
| 2 | Lot 44 — Mémoire des choix contraints et clôture des travaux | `[Lot 44] Orthographe : coûterait` | 1697 → **1699**, 22:49:07 UTC |
| 3 | Procédure de clôture d'un lot | `[Lot 44] Orthographe : coût et connaître` | 1696 → **1700**, 22:49:09 UTC |

Trois écritures sur le wiki, pas une de plus.

## 5. Modification du dépôt

- `methode-de-travail.md` : la ligne d'ancrage « Enfin, sa première ligne
  nomme son destinataire… » est présente une seule fois (ligne 61). Le
  paragraphe a été inséré juste après, précédé d'une ligne vide, avant le
  titre « Format des échanges ». `git diff --numstat` : **2 lignes ajoutées,
  0 supprimée** (le paragraphe et une ligne vide).
- Copies locales : `pages/Choix_imposes_par_l_outil.txt` et
  `pages/Lot_44.txt` étaient identiques aux pages en ligne avant écriture
  (`cmp`). Elles ont été remplacées par les fichiers envoyés, qui restent
  identiques aux pages publiées. Ce ne sont pas des écritures sur le wiki.

## 6. Vérifications

### Vérification décisive

Pages relues en ligne après écriture par `bin/wiki-get.sh` :

| Page | `\b[Cc]out\w*` | `\b[Cc]onnait\w*` | `bin/wiki-verify.sh` |
|---|---|---|---|
| Choix imposés par l'outil | aucune | aucune | `IDENTIQUE` |
| Lot 44 | aucune | aucune | `IDENTIQUE` |
| Procédure de clôture d'un lot | aucune | aucune | `IDENTIQUE` |

**Réussie.**

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| Classe `error` | 0 sur les trois pages |
| Liens rouges | aucun sur les trois |
| Catégories | inchangées : `Page de suivi`, `Lot`, `Page de suivi` |
| Choix imposés, liste | une seule `<ol>`, 6 entrées de premier niveau, 30 `li` au total, soit 24 sous-rubriques |
| Procédure, sections | les six titres, inchangés : « Où lancer cette procédure », puis 1 à 5 |
| Procédure, bloc `pre` | une seule balise ; contenu rendu identique octet pour octet à celui de la révision 1696 (`cmp`) |
| Lot 44, faits | `Work_package_number` 44, `Work_package_status` ouvert, `Work_package_opening_date` 2026-10-19, deux recoupements, aucun `_ERRC`. Inchangés |
| Lot 44, rendu | 2 tableaux et 19 `li`, comme avant |
| `methode-de-travail.md` | diff : uniquement des lignes ajoutées (2) |

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- Le compte de la règle ajoutée (six familles de mots, cinquante et une
  formes traditionnelles, aucune rectifiée, au 19 octobre 2026) n'a pas été
  remesuré : il porte sur un état passé du wiki, que cette session ne relit
  pas. Le paragraphe a été recopié tel quel.
- Les deux copies locales de `pages/` ont été mises à jour avec les pages
  publiées, comme lors des tâches précédentes. La procédure de clôture n'a
  toujours pas de copie à jour dans `pages/` : seule existe
  `pages/Procedure_cloture_lot34.txt`, ancienne, non touchée. La règle
  ajoutée à `CLAUDE.md` le 25 octobre en couvre le risque.
- Aucun autre écart.

## Poussée

Commit poussé sur `main`, et sur la branche désignée `ccr-4b59dccc-xydpag`.
