# Lot 9 — Tâche 8 : rapport d'annotation des photos

## Décision préalable — photos hors sujet végétal

Demandé : « chaque page Fichier: reçoit `{{Specimen photo}}` » et « vérifie
[...] que les trois propriétés sont stockées » sur 100 % des 71 pages. Les 71
fichiers bien nommés téléversés au lot 9 comptent **8 photos qui ne montrent
aucune plante** (faune, infrastructure) : `Couleuvre_verte_et_jaune` ×5 (Le
Buisson de Cerzat), `Gainage_cable` ×1, `Raboutage_cable_gaine` ×2 (mêmes
lieu). Aucune ne peut recevoir de `Depicts_specimen` significatif — il
n'existe aucune plantation à pointer.

Question posée à Cyril avant d'écrire quoi que ce soit. Réponse : les trois
propriétés ne sont pas solidaires (`Modèle:Specimen photo` a été construit
sans garde sur le `#set`, précisément pour ce cas — voir
`lot-9-tache3-proposition.md`, section « Écart assumé »). `{{Specimen
photo}}` est posé sur les 71 pages, avec `Image_date` et `Image_location`
partout ; `Depicts_specimen` sur 63 pages seulement. `Category:Photo de
plantation`, gardée par `Depicts_specimen`, en compte donc 63, pas 71 —
attendu et vérifié en fin de tâche.

## Source de vérité utilisée pour la liste des fichiers

Pas le TSV seul : `action=query&list=allimages` sur le wiki, lu en direct
avant d'écrire (leçon de méthode déjà consignée — l'état du wiki peut
diverger d'une copie locale). **73 fichiers `ECL-*`** dénombrés, cohérent
avec la convention de nommage de `CLAUDE.md` (« appliquée aux 73 photos du
lot 9 »). Sur ces 73 :
- **2 au nommage défectueux**, déjà identifiés en tâche 7 :
  `ECL-Buisson_CerzatHysope-2026-08-08_01.jpg` (tiret manquant après le lieu)
  et `ECL-Jardin_Cyril_Chilhac-Oignon_rocambole_2026-08-09_01.jpg` (tiret
  remplacé par un underscore avant la date). **Hors périmètre, tâche 11**,
  ni lus ni écrits ici.
- **71 bien nommés** : 63 montrant une plante identifiable dans le TSV, 8
  hors sujet végétal (voir ci-dessus).

Découpage du nom de fichier fait sur le tiret uniquement (jamais
l'underscore), avec les trois slugs de lieu connus comme séparateur fiable —
même méthode que celle validée en tâche 7 (le tiret figure aussi à
l'intérieur du champ date, ce qui interdit un simple split sur `-`).

## Table de correspondance lieu et Depicts_specimen

Table lieu → page telle que donnée par Cyril, vérifiée contre
`Category:Lieu` (3 pages, ces titres exacts) : `Buisson_Cerzat` → `Le
Buisson de Cerzat`, `Jardin_Cyril_Chilhac` → `Jardin de Chilhac`,
`Terrasse_Cyril_Chilhac` → `Terrasse de Chilhac`.

Rattachement `Depicts_specimen` par (lieu, plante) contre
`lot-9-tache7-manifeste.md` (40 plantations déjà créées en tâche 7). Les 38
titres de plantation distincts référencés par le plan ont été confirmés
existants dans `Category:Physical item` avant toute écriture (`list=categorymembers`,
comparaison titre à titre, aucun manquant).

Trois cas à règle spéciale, tous appliqués :

1. **`Menthe_X_&_Chayote` (Terrasse)** : montre deux plantations —
   `Depicts_specimen` multivalué, séparateur `;` : `Menthe X — Terrasse de
   Chilhac (ECL-0024)` et `Chayote — Terrasse de Chilhac (ECL-0025)`. 1 photo.
2. **`Poireau_perpetuel` (Buisson)** : deux plantations, `ECL-0032` (plantée
   2025-11-17) et `ECL-0033` (plantée 2026-08-07). Règle de date appliquée :
   les 11 photos réelles de ce couple sont datées 2026-08-07 (×4) ou
   2026-08-08 (×7), toutes **sur ou après** la date de plantation d'ECL-0033
   — aucune photo antérieure au 2026-08-07 n'existe dans ce lot. Les 11
   reçoivent donc les deux plantations. Vérifié sur les dates réelles
   extraites des noms de fichier, pas supposé.
3. **`Miscanthus` (Buisson)** : deux plantations indépartageables,
   `ECL-0027` (2025-11-17) et `ECL-0040` (date inconnue) — les 4 photos
   reçoivent systématiquement les deux.

`Ail_elephant` (Buisson) : trois plantations, `ECL-0003` (2025-11-17),
`ECL-0041` (2026-08-07) et `ECL-0042` (en réserve, sans date). Même règle de
date qu'au point 2 : les 4 photos réelles sont datées 2026-08-07 (×3) ou
2026-08-08 (×1), toutes sur ou après le seuil — les 4 reçoivent les trois
plantations.

Aucun des quatre cas à règle n'a produit de photo « avant seuil » dans ce lot
réel : le TSV ne contient tout simplement pas de photo d'Ail éléphant ou de
Poireau perpétuel du Buisson antérieure au 2026-08-07. La règle de date était
donc présente mais neutre sur ces 71 fichiers — notée ici pour que ce ne soit
pas pris pour un oubli de son application.

## Écriture

Séquence par fichier : lecture du wikitexte courant (`bin/wiki-get.sh`),
vérification qu'il est identique au texte-type déjà en place (« Photo prise
par Cyril Libert. Licence CC BY-SA 4.0, cohérente avec le wiki. » — confirmé
identique sur les 71, aucune variante), ajout de `{{Specimen photo|...}}` à
la suite, écriture (`bin/wiki-put.sh`, sans `--createonly` — édition d'une
page déjà existante, pas une création).

Résumé d'édition, un des deux selon le cas :
- `[Lot 9][Tâche 8] Annotation Specimen photo (Image_date/Image_location/Depicts_specimen)`
  — 63 pages.
- `[Lot 9][Tâche 8] Annotation Specimen photo (Image_date/Image_location)`
  — 8 pages (les photos hors sujet végétal).

**71/71 écritures réussies** (`result: Success`), aucune protection détectée
au préalable (`prop=info&inprop=protection` sur les 71 titres, en deux lots
groupés — aucune entrée de protection).

## Vérification — 100 % des 71 pages, individuellement

`browsebysubject` par page, comparé programmatiquement au plan attendu
(pas d'échantillon). Pièges de sérialisation déjà connus, appliqués à la
comparaison : `Image_date` en `1/AAAA/M/J` non préfixé de zéro, propriétés de
type Page comparées par titre normalisé (underscore, suffixe `#0##` ignoré).

**71/71 conformes** à la première passe automatique, avec un faux écart
initial à documenter : `ECL-Terrasse_Cyril_Chilhac-Menthe_X_&_Chayote-...jpg`
est ressorti vide au premier passage — pas un défaut d'écriture, un défaut du
script de vérification : le `&` du nom de fichier, passé tel quel à
`bin/wiki-api.sh` (qui ne réencode pas sa chaîne de paramètres, leçon déjà
consignée dans `CLAUDE.md`), a coupé la requête `subject=` en deux paramètres
côté serveur. Ré-interrogé avec le titre encodé (`urllib.parse.quote`), la
page est conforme : `Depicts_specimen` = deux `dataitem` distincts
(`Menthe_X_—_Terrasse_de_Chilhac_(ECL-0024)`,
`Chayote_—_Terrasse_de_Chilhac_(ECL-0025)`), `Image_date`/`Image_location`
corrects, `_INST` confirme `Photo_de_plantation`.

Sur les 63 pages à `Depicts_specimen` : toutes les valeurs pointent vers une
plantation existante (comparaison titre à titre contre `Category:Physical
item`, faite avant l'écriture — voir plus haut — et confirmée après par la
lecture individuelle).

## Comptage final

`Category:Photo de plantation` (`list=categorymembers`) : **63 membres
exactement**. Conforme au plan (63 pages à `Depicts_specimen` renseignée, 8
photos hors sujet végétal correctement exclues de la catégorie).

## Écart signalé, non traité ici

Aucun. Les deux fichiers au nommage défectueux restent hors périmètre,
renvoyés à la tâche 11 comme prévu — non lus, non modifiés dans cette tâche.
