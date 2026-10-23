# Lot 44 — renvois vers « Choix imposés par l'outil », 23 octobre 2026

Trois renvois complétés pour que « Choix imposés par l'outil » soit citée :
la page du lot 44 (périmètre et décision sur le rangement en catégories),
et la ligne « Voir aussi » de tête du *Récapitulatif technique* et des
*Limites connues*. Session Claude Code hébergée (cloud), branche de travail
`ccr-4b59dccc-xydpag`.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` au départ : sortie vide, aucun arrêt.
- `git fetch origin` : `origin/main` avait avancé de `30288b3` à `6492d34`
  (trois commits « swowl », huit fichiers, aucun dans `CLAUDE.md` ni dans
  `bin/`). Mise à niveau par avance rapide, sans conflit.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.

## 2. Contrôles avant écriture

| Contrôle | Mesure | Résultat |
|---|---|---|
| « Choix imposés par l'outil » sans lien entrant | `list=backlinks` : liste vide | conforme |
| `lastrevid` de la page du lot 44 | **1683** ; wikitexte identique octet pour octet à `pages/Lot_44.txt` | relevé |
| `lastrevid` du *Récapitulatif technique* | **1463** ; 36 952 caractères, 37 877 octets | relevé |
| `lastrevid` des *Limites connues* | **1546** ; 64 522 caractères, 66 765 octets | relevé |
| Chaînes d'ancrage | chacune présente une seule fois, comme ligne entière : 5a, 5b, le début de ligne de 5c, la ligne 5 du *Récapitulatif*, la ligne 14 des *Limites connues* | conforme |

Comptes de rendu avant écriture (`action=parse&prop=text`) :

| Page | Tableaux | Blocs `pre` | Listes numérotées | Entrées numérotées | `li` au total |
|---|---|---|---|---|---|
| Récapitulatif technique | 6 | 23 | 0 | 0 | 73 |
| Limites connues | 0 | 0 | 1 | 72 | 72 |
| Lot 44 | 2 | 0 | 0 | 0 | 18 |

## 3. Préparation et contrôle des diffs

Les trois pages ont été relues entières par `bin/wiki-get.sh` dans le
scratchpad. Les fichiers modifiés ont été produits par un script de
scratchpad, `renvois.py`, montré avant son lancement. Il s'arrêtait si une
chaîne d'ancrage était absente ou multiple. Il contrôlait aussi le
deux-points de tête de tout lien de catégorie ajouté.

Diffs obtenus :

- **Lot 44** (7 537 → 8 122 octets) : trois blocs, et rien d'autre. 5a, une
  ligne remplacée ; 5b, une ligne ajoutée après la ligne d'ancrage ; 5c, le
  paragraphe et une ligne vide insérés juste avant la ligne
  `'''L'ordre des quatre travaux.'''`.
- **Récapitulatif technique** (37 877 → 38 124 octets) : **un seul bloc**,
  la ligne 5 remplacée par les deux lignes demandées séparées par une ligne
  vide.
- **Limites connues** (66 765 → 67 014 octets) : **un seul bloc**, la
  ligne 14 remplacée de même.

Règle 2 : quatre liens de catégorie ajoutés, deux par page de référence,
tous avec le deux-points de tête. Aucune forme sans deux-points. La page du
lot 44 n'en reçoit aucun.

## 4. Écritures

`bin/wiki-login.sh` : `Success Cywil`. Chaque écriture a été précédée d'une
relecture de son `lastrevid`, inchangé à chaque fois.

| N° | Page | Résumé | Révision |
|---|---|---|---|
| 1 | Lot 44 — Mémoire des choix contraints et clôture des travaux | `[Lot 44] Périmètre : le rangement en catégories, et renvoi vers la page des choix imposés` | 1683 → **1692**, 15:18:24 UTC |
| 2 | Récapitulatif technique du Système de Gestion de Données Techniques | `[Lot 44] Renvois de tête complétés : choix imposés, gestion des lots et les deux catégories` | 1463 → **1693**, 15:18:33 UTC |
| 3 | Limites connues du Système de Gestion de Données Techniques | `[Lot 44] Renvois de tête complétés : choix imposés, gestion des lots et les deux catégories` | 1546 → **1694**, 15:18:43 UTC |

Trois écritures sur le wiki, pas une de plus.

## 5. Vérifications

### Vérification décisive

| Contrôle | Résultat |
|---|---|
| Liens entrants de « Choix imposés par l'outil » | **exactement trois** : la page du lot 44, le *Récapitulatif technique*, les *Limites connues* |
| Fin des *Limites connues*, relue après écriture | la dernière ligne commence par `# ` (« Le compteur de références peut rendre une valeur périmée… ») ; 72 entrées `# ` au total, comme avant |
| Catégories | Lot 44 : `Catégorie:Lot` seule. *Récapitulatif technique* : `Page de suivi` et `SGDT`, comme avant. *Limites connues* : `Page de suivi` seule, comme avant. Aucune catégorie gagnée |

**Réussie.**

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| `bin/wiki-verify.sh` | `IDENTIQUE` sur les trois pages |
| Classe `error` | 0 sur les trois pages |
| Liens rouges | `class="new"` : 0 sur les trois. Voir « Écarts et surprises » pour deux liens du *Récapitulatif* vers des pages absentes, antérieurs à l'écriture |
| Structures du *Récapitulatif* | après : 6 tableaux, 23 `pre`, 0 entrée numérotée, 73 `li`. **Inchangé** |
| Structures des *Limites connues* | après : 0 tableau, 0 `pre`, 1 liste numérotée de 72 entrées, 72 `li`. **Inchangé** |
| Faits du lot 44 | `Work_package_number` 44, `Work_package_status` ouvert, `Work_package_opening_date` 2026-10-19, `Work_package_overlaps` sur deux pages (lots 21 et 27), aucun `_ERRC`. **Inchangés** |
| Emplacement du paragraphe 5c | dans la section « Ce qui est déjà tranché », juste avant le paragraphe « L'ordre des quatre travaux. » (mesuré sur les positions des titres `h2` du rendu) |
| Lot 44, autres structures | 2 tableaux, 19 `li` : un de plus qu'avant, la ligne ajoutée en 5b |

Contrôle en plus : la copie locale `pages/Lot_44.txt` a reçu les trois mêmes
changements, par l'outil de modification de fichier. Elle est identique à la
page publiée (`cmp` et `bin/wiki-verify.sh`), et elle est commitée avec ce
rapport.

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- **Les tailles de la consigne sont des comptes de caractères, pas
  d'octets.** 36 952 et 64 522 caractères, soit 37 877 et 66 765 octets. Les
  deux mesures concordent avec la consigne une fois l'unité précisée.
- **Les *Limites connues* ne se terminent par aucun commentaire HTML.** La
  consigne parle du « commentaire HTML qu'elle porte » à sa fin. Relu après
  écriture, le wikitexte se termine directement par la dernière entrée `# `,
  sans commentaire final. C'est ce que dit `CLAUDE.md` : depuis le
  6 septembre 2026, le commentaire garde-fou est placé avant la liste. La
  condition de `bin/wiki-append.sh` est remplie ; je ne l'ai pas éprouvée
  par un ajout réel, qui aurait fait une quatrième écriture.
- **Le *Récapitulatif technique* lie deux pages absentes**, avant comme
  après l'écriture : `Attribut:Has type` et `Attribut:Imported from`,
  rendues par les en-têtes de la requête de tête (lignes 14 à 24 du
  wikitexte, `{{#ask: [[Has type::+]]` avec `?Has type` et
  `?Imported from`). Aucun `class="new"` dans le rendu. Ce sont les noms des
  propriétés spéciales de Semantic MediaWiki, sans page `Attribut:` propre.
  Ce n'est pas lié à cette tâche ; je le signale seulement.
- **La page du lot 44 porte un lien de plus que le 20 octobre :
  `Attribut:Work package status`.** Il vient du tableau « Lots qui dépendent
  de celui-ci » de `Modèle:Lot`, qui rend désormais le lot 45 et lie
  l'attribut dans son en-tête « État ». `Modèle:Lot` n'a pas changé depuis
  sa révision 1358 du 11 septembre 2026 : c'est l'effet attendu de la
  création du lot 45, pas de cette écriture.
- Une de mes vérifications d'emplacement du paragraphe 5c a d'abord donné un
  faux négatif, parce que le mot « Périmètre » figure aussi dans le sommaire.
  Refaite sur les positions des titres de section du HTML : conforme.

## Poussée

Commit poussé sur `main`, et sur la branche désignée `ccr-4b59dccc-xydpag`.
