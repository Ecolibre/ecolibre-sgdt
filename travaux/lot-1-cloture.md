# Lot 1 — clôture : arbitrages et écarts consignés, état clos

Exécuté le 29 octobre 2026, dans une session Claude Code cloud, sur la branche
`claude/sgdt-lot1-closure-cakxxo`. Six écritures sur le wiki, toutes réussies
du premier coup, sur quatre pages.

## Étape 0 — état du dépôt

`git status --porcelain` : sortie vide. Aucun arrêt. `git fetch origin` :
branche alignée sur `origin/main` (`216ee1d`). `.claude/settings.local.json` :
absent, au début comme à la fin de la tâche, donc aucune règle.

## Écritures

Chaque page a été lue par `bin/wiki-get.sh` (`action=parse&prop=wikitext`)
juste avant son écriture. Aucune page n'était protégée (`prop=info&inprop=protection`
vide sur les quatre). Les chaînes à remplacer ou à repérer ont toutes été
trouvées une fois et une seule.

| Étape | Page | Révision | Résumé |
|---|---|---|---|
| 1 | Lot 1 — Corrections de schéma | 1184 → 1710 | `[Lot 1] Clôture - arbitrages et écarts consignés` |
| 2 | Limites connues du Système de Gestion de Données Techniques | 1694 → 1711 | `[Lot 1] Clôture - asymétrie de casse entre Code et Keyword` |
| 3 | Limites connues du Système de Gestion de Données Techniques | 1711 → 1712 | `[Lot 1] Clôture - la sensibilité à la casse est propre à Item_ref` |
| 4 | Lot 16 — Corrections du module de références | 1422 → 1713 | `[Lot 1] Clôture - unicité du numéro de série portée au lot 16` |
| 5 | Lot 6 — Durcissement du module de références | 1350 → 1714 | `[Lot 6] Écart entre l'objet annoncé et l'exécution, relevé hors lot` |
| 6 | Lot 1 — Corrections de schéma | 1710 → 1715 | `[Lot 1] Clôture - état clos au 29 octobre 2026` |

L'étape 2 est passée par `bin/wiki-append.sh` : 72 entrées avant, 73 après,
l'ajout est la dernière entrée, un seul bloc `<ol>` au rendu. Les autres par
`bin/wiki-put.sh`.

## Les six diffs

### Étape 1

```diff
--- av/lot1.txt	2026-10-29 20:53:40.203065598 +0000
+++ lot1-etape1.txt	2026-10-29 20:54:19.123064708 +0000
@@ -5,4 +5,18 @@
 |Work_package_opening_date=2026-07-25
 |Work_package_delivery_date=2026-07-25
 |Work_package_closure_report=https://github.com/Ecolibre/ecolibre-sgdt/blob/3a0e7af4e6b4d2e0ade4e1d645d568311e04afad/travaux/ecolibre-sgdt-lot1.md
-}}
\ No newline at end of file
+}}
+
+== Ce qui est déjà tranché ==
+
+'''Le numéro de série est de type <code>Keyword</code>.''' Motif : <code>Texte</code> n'est ni comparable ni triable de façon fiable, et <code>Code</code> n'en est qu'une variante d'affichage, avec les mêmes limites de fond. <code>Keyword</code> est à longueur restreinte, indexé, comparable, et exporté en littéral simple. Un numéro de série est un identifiant court, pas de la prose. Décidé le 25 juillet 2026.
+
+'''La virgule devient un séparateur de valeurs sur <code>Part_of</code> dans le modèle des items référencés.''' Conséquence directe du <code><nowiki>+sep=,</nowiki></code> posé par ce lot : un nom d'item référencé ne peut plus contenir de virgule. Décidé le 25 juillet 2026. La règle est énoncée dans le [[Récapitulatif technique du Système de Gestion de Données Techniques]] et son motif dans les [[Choix imposés par l'outil]].
+
+'''La réserve sur la casse du type <code>Keyword</code> est levée.''' Le cadrage de ce lot laissait ouverte la question de savoir si <code>Keyword</code> préserve la casse. Mesuré le 29 octobre 2026 : la valeur stockée la préserve, mais la requête d'égalité l'ignore, à la différence du type <code>Code</code>. Voir les [[Limites connues du Système de Gestion de Données Techniques]].
+
+== Ce qui est écarté, et pourquoi ==
+
+'''Le type <code>External identifier</code> pour le numéro de série.''' Il serait le plus juste si un numéro de série se résolvait en URL par une <code>External formatter URI</code>. C'est rare, et cela se déciderait constructeur par constructeur. Écarté le 25 juillet 2026.
+
+'''La bascule d'<code>Item_ref</code> du type <code>Code</code> vers <code>Keyword</code>.''' Le motif d'origine, selon lequel le tri d'un type chaîne ne serait pas garanti, est tombé le 5 octobre 2026 : le tri fonctionne, et la vraie limite est la longueur des valeurs, que le type ne corrige pas. Le seul bénéfice mesuré depuis est que <code>Code</code> distingue la casse à l'égalité quand <code>Keyword</code> l'ignore, et il s'obtient gratuitement en normalisant en majuscules dans le module. La bascule, elle, coûterait la réindexation de 118 pages et un verrou de quelques jours sur la propriété qui porte toute la banque de conception. Écarté le 29 octobre 2026.
```

### Étape 2 (sans contexte)

```diff
--- av/limites.txt	2026-10-29 20:53:42.003065557 +0000
+++ limites-1711.txt	2026-10-29 20:55:00.107063771 +0000
@@ -99 +99,2 @@
-# '''Le compteur de références peut rendre une valeur périmée quelques secondes après une création, et deux pages créées coup sur coup recevoir le même numéro.''' Mesuré le 11 octobre 2026 pendant la création de deux lieux. L'expression qui calcule le numéro par défaut cherche le plus grand numéro existant et prend le suivant. Juste après la création du lieu numéroté 0014, elle a rendu 0014 de nouveau au lieu de 0015, alors que les faits du lieu créé portaient déjà son numéro et qu'une requête directe le listait en tête. La réévaluation suivante, quelques secondes plus tard, a rendu 0015. Rien n'a été écrit avec la valeur périmée, parce qu'elle a été contrôlée avant emploi. Conséquence pour la saisie par formulaire, où rien ne contrôle : deux pages créées à quelques secondes d'intervalle peuvent recevoir le même numéro par défaut, et le wiki n'en dira rien. La parade est de réévaluer l'expression juste avant chaque création et de vérifier que la valeur rendue suit bien la précédente. Les cinq autres évaluations faites ce jour-là après une création dans la même banque n'ont montré aucun retard ; le compte ne porte que sur celles-là, puisqu'un retard ne peut se produire qu'après une création.
\ No newline at end of file
+# '''Le compteur de références peut rendre une valeur périmée quelques secondes après une création, et deux pages créées coup sur coup recevoir le même numéro.''' Mesuré le 11 octobre 2026 pendant la création de deux lieux. L'expression qui calcule le numéro par défaut cherche le plus grand numéro existant et prend le suivant. Juste après la création du lieu numéroté 0014, elle a rendu 0014 de nouveau au lieu de 0015, alors que les faits du lieu créé portaient déjà son numéro et qu'une requête directe le listait en tête. La réévaluation suivante, quelques secondes plus tard, a rendu 0015. Rien n'a été écrit avec la valeur périmée, parce qu'elle a été contrôlée avant emploi. Conséquence pour la saisie par formulaire, où rien ne contrôle : deux pages créées à quelques secondes d'intervalle peuvent recevoir le même numéro par défaut, et le wiki n'en dira rien. La parade est de réévaluer l'expression juste avant chaque création et de vérifier que la valeur rendue suit bien la précédente. Les cinq autres évaluations faites ce jour-là après une création dans la même banque n'ont montré aucun retard ; le compte ne porte que sur celles-là, puisqu'un retard ne peut se produire qu'après une création.
+# '''Une requête d'égalité distingue la casse sur une propriété de type <code>Code</code>, et l'ignore sur une propriété de type <code>Keyword</code>.''' Mesuré le 29 octobre 2026, avec contre-épreuve : <code><nowiki>[[Inventory_number::ZZZZ]]</nowiki></code> rend 0, la requête discrimine donc bien. Sur <code>Inventory_number</code>, de type <code>Keyword</code>, <code><nowiki>[[Inventory_number::000C]]</nowiki></code> et <code><nowiki>[[Inventory_number::000c]]</nowiki></code> rendent la même page. Sur <code>Item_ref</code>, de type <code>Code</code>, <code><nowiki>[[Item_ref::002Y]]</nowiki></code> rend sa page et <code><nowiki>[[Item_ref::002y]]</nowiki></code> ne rend rien. La valeur restituée garde sa casse dans les deux cas : c'est l'appariement qui diffère, pas le stockage. Conséquence pour le contrôle d'unicité du lot 16 : une minuscule échappe à un contrôle écrit en majuscules sur la banque de conception, et n'y échappe pas sur la banque d'inventaire.
\ No newline at end of file
```

### Étape 3 (sans contexte : la ligne entière de l'entrée change)

```diff
--- limites-1711.txt	2026-10-29 20:55:00.107063771 +0000
+++ limites-etape3.txt	2026-10-29 20:55:00.135432207 +0000
@@ -85 +85 @@
-# '''Le maximum d'une banque Base 36 est trouvé par un tri alphabétique, qui ne coïncide avec l'ordre numérique que sur des valeurs de même longueur.''' Les formulaires calculent le prochain numéro en triant <code>Item_ref</code> (type Code) ou <code>Inventory_number</code> (type Keyword) en ordre descendant, limite 1. Ce sont des types chaîne, donc le tri est alphabétique ; avec la collation <code>uca-fr</code> (entrée 41) les chiffres passent avant les lettres, et l'ordre alphabétique coïncide avec l'ordre Base 36 tant que toutes les valeurs font exactement quatre caractères. <code>Module:Base36</code> complète bien à quatre caractères, mais seulement tant que la valeur y tient : au-delà de <code>ZZZZ</code> il produit cinq caractères, qui se classeraient avant <code>ZZZZ</code> et figeraient le maximum. Mesuré le 5 octobre 2026 : une requête d'égalité est sensible à la casse, <code><nowiki>[[Item_ref::002y]]</nowiki></code> ne rend rien là où <code><nowiki>[[Item_ref::002Y]]</nowiki></code> rend sa page, alors que le module lit les minuscules sans broncher (<code>next(000a)</code> rend <code>000B</code>) : une valeur saisie en minuscules échapperait donc à un contrôle d'unicité écrit en majuscules. '''Règle de saisie : toute référence saisie à la main fait exactement quatre caractères, en majuscules.''' À traiter avec le lot de numérotation.
+# '''Le maximum d'une banque Base 36 est trouvé par un tri alphabétique, qui ne coïncide avec l'ordre numérique que sur des valeurs de même longueur.''' Les formulaires calculent le prochain numéro en triant <code>Item_ref</code> (type Code) ou <code>Inventory_number</code> (type Keyword) en ordre descendant, limite 1. Ce sont des types chaîne, donc le tri est alphabétique ; avec la collation <code>uca-fr</code> (entrée 41) les chiffres passent avant les lettres, et l'ordre alphabétique coïncide avec l'ordre Base 36 tant que toutes les valeurs font exactement quatre caractères. <code>Module:Base36</code> complète bien à quatre caractères, mais seulement tant que la valeur y tient : au-delà de <code>ZZZZ</code> il produit cinq caractères, qui se classeraient avant <code>ZZZZ</code> et figeraient le maximum. Mesuré le 5 octobre 2026, sur <code>Item_ref</code> et sur elle seule : une requête d'égalité y est sensible à la casse, <code><nowiki>[[Item_ref::002y]]</nowiki></code> ne rend rien là où <code><nowiki>[[Item_ref::002Y]]</nowiki></code> rend sa page, alors que le module lit les minuscules sans broncher (<code>next(000a)</code> rend <code>000B</code>) : une valeur saisie en minuscules échapperait donc à un contrôle d'unicité écrit en majuscules. '''Règle de saisie : toute référence saisie à la main fait exactement quatre caractères, en majuscules.''' À traiter avec le lot de numérotation.
```

### Étape 4

```diff
--- av/lot16.txt	2026-10-29 20:53:42.927065536 +0000
+++ lot16-etape4.txt	2026-10-29 20:55:29.328823537 +0000
@@ -20,6 +20,12 @@
 
 La bascule en deux temps, un mode comblement suivi d'un retour au maximum plus un, est écartée le 4 octobre 2026. Motif : le retour dépendrait d'une mémoire humaine à deux ou trois ans, et son oubli ne produirait aucun symptôme visible. Une fonction unique rend le même résultat sans bascule.
 
+== Points ouverts ==
+
+'''La portée d'unicité de <code>Serial_number</code> n'a jamais été tranchée.''' Le cadrage du lot 1 posait, le 25 juillet 2026, qu'un numéro de série est unique chez un constructeur et non globalement, et renvoyait la décision à plus tard. Elle n'a été rendue nulle part. Elle se pose ici parce que c'est ce lot qui écrira le contrôle d'unicité : faut-il qu'il couvre <code>Serial_number</code>, et à quelle portée. Le périmètre de ce lot, borné jusqu'ici aux banques Base 36, s'en trouve élargi.
+
+'''Aucun exemplaire ne porte de numéro de série.''' Mesuré le 29 octobre 2026 : 50 items physiques, 50 numéros d'inventaire, 0 numéro de série, alors que <code>Modèle:Physical item</code> pose bien la propriété et que le formulaire affiche son champ. Renseigner un exemplaire pour vérifier que la chaîne fonctionne de bout en bout, avant de trancher la question d'unicité, qui ne se décide pas sur un usage inexistant.
+
 == Dépendances ==
 
 Attend le lot 12, qui définit l'état de cycle de vie et la date d'étiquette.
```

### Étape 5

```diff
--- av/lot6.txt	2026-10-29 20:53:43.811065516 +0000
+++ lot6-etape5.txt	2026-10-29 20:55:46.808754898 +0000
@@ -12,4 +12,6 @@
 
 Deux dates à élucider. Ce lot est décrit « exécuté du 9 au 12 août 2026 » à deux endroits, alors que ses écritures étiquetées s'arrêtent le 10 août à 15h27 et que le rapport du 11 août porte déjà l'en-tête du lot 8. La date mesurée a été retenue, l'écart n'est pas expliqué.
 
-Le fichier `lot-6-consolide.md` est déclaré mort le 10 août 2026 dans le document de passation, alors qu'il existe toujours et qu'il est le rapport cité pour ce lot. L'un des deux est faux : soit le fichier n'aurait pas dû survivre, soit la déclaration de mort était erronée.
\ No newline at end of file
+Le fichier `lot-6-consolide.md` est déclaré mort le 10 août 2026 dans le document de passation, alors qu'il existe toujours et qu'il est le rapport cité pour ce lot. L'un des deux est faux : soit le fichier n'aurait pas dû survivre, soit la déclaration de mort était erronée.
+
+L'objet de ce lot annonce "basculer Item_ref". Ses deux rapports portent la consigne inverse, "ne pas toucher à <code>Module:Base36</code> ni à <code>Item_ref</code> ; la numérotation reste gelée", et le tableau de renommage de <code>lot-6-consolide.md</code> inscrit <code>Item_ref</code> comme inchangé. Mesuré le 29 octobre 2026 : <code>Attribut:Item ref</code> porte toujours <code><nowiki>[[Has type::Code]]</nowiki></code>. Le mot "basculer" peut désigner un autre travail que le changement de type, ou être une erreur de rédaction ; rien ne permet de départager. Relevé lors de la clôture du lot 1.
\ No newline at end of file
```

### Étape 6

```diff
--- lot1-1710.txt	2026-10-29 20:55:57.599062456 +0000
+++ lot1-etape6.txt	2026-10-29 20:55:57.622614694 +0000
@@ -1,9 +1,10 @@
 {{Lot
 |Work_package_number=1
-|Work_package_status=livré
+|Work_package_status=clos
 |Work_package_summary=Déclarer Serial_number, et poser le séparateur multivalué sur Part_of dans le modèle des items référencés.
 |Work_package_opening_date=2026-07-25
 |Work_package_delivery_date=2026-07-25
+|Work_package_closure_date=2026-10-29
 |Work_package_closure_report=https://github.com/Ecolibre/ecolibre-sgdt/blob/3a0e7af4e6b4d2e0ade4e1d645d568311e04afad/travaux/ecolibre-sgdt-lot1.md
 }}
 
```

## Vérifications

1. **Textes mot pour mot.** Les quatre pages relues après la dernière
   écriture. Chaque ligne non vide des textes fournis a été cherchée comme
   ligne entière du wikitexte en ligne : lot 1, 7 sur 7 ; Limites connues,
   1 sur 1, et c'est la dernière ligne de la page ; lot 16, 3 sur 3, section
   placée entre « Ce qui est écarté, et pourquoi » et « Dépendances » ;
   lot 6, 1 sur 1. Étape 3 : la nouvelle chaîne figure 1 fois, l'ancienne
   0 fois. Étape 6 : `Work_package_status=clos`, et
   `Work_package_closure_date=2026-10-29` entre la date de livraison et le
   rapport de clôture, ce dernier inchangé.
2. **Gestion des lots.** Sans purge, la ligne du lot 1 affiche « clos ». Le
   fait stocké sur la page du lot : `Work_package_status -> clos`,
   `Work_package_closure_date -> 1/2026/10/29`. Aucune purge n'a été faite.
3. **Qui tranche — annotations parasites.**
   - `action=ask` sur `[[Item_ref::002y]]` : **0** résultat (0 aussi avant
     les écritures).
   - `action=ask` sur `[[Item_ref::+]]` : **118** résultats (118 aussi avant
     les écritures), dont aucune page de lot ni la page des Limites connues.
   Les trois contrôles passent : aucun `<nowiki>` ne manque.

Contrôles complémentaires, non demandés :

- `[[Inventory_number::+]]` : 50 résultats, aucune page de lot ni les Limites
  connues — la nouvelle entrée cite aussi cette propriété.
- Faits (`smwbrowse`) : les Limites connues ne portent que `_INST` (Page de
  suivi), `_MDAT`, `_SKEY`. Les pages des lots 1, 6 et 16 ne portent que les
  faits de leur modèle `Lot` et ses `_ASK`.
- Liens (`generator=links`) : 11 cibles sur les quatre pages, aucune
  inexistante. `Choix imposés par l'outil` compte bien la page du lot 1
  parmi ses pages liantes.
- Catégories : `Catégorie:Lot` pour les trois lots, `Catégorie:Page de suivi`
  pour les Limites connues ; aucune catégorie de suivi.

## Écarts et surprises

- **Les identifiants du wiki ne viennent pas d'un `.env`.** Ni
  `../ecolibre-sgdt-prive/` ni `.env` n'existent dans cette session cloud ;
  `bin/wiki-login.sh` a pris `WIKI_API`, `WIKI_USER` et `WIKI_PASS` dans
  l'environnement, ce que le script prévoit. Le fichier de cookies a donc été
  écrit dans le dépôt (`.cookies.txt`, ignoré par git, non commité).
- **L'index « Gestion des lots » n'affiche pas la date de clôture.** La ligne
  du lot 1 montre deux dates, ouverture et livraison, toutes deux au
  25 juillet 2026 ; le 29 octobre n'y apparaît pas, alors que le fait est
  stocké. Vérifié dans le wikitexte de la page : la requête de l'index ne
  demande pas `Work_package_closure_date` (colonnes N°, État, Objet, Ouvert
  le, Livré le, Documents). Ce n'est pas un défaut de mise à jour ; une
  colonne « Clos le » serait à décider ailleurs.
- Aucune question n'a été posée par le canal direct pendant l'exécution.
