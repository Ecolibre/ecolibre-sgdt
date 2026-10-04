# Correction des rangs de plantation — 6 septembre 2026

Suite de `travaux/rangs-separateur.md` : la cause n'était pas le séparateur
décimal mais des plages saisies dans un champ unique. Décisions de Cyril
qui tranchent la suite : la convention « mètres entiers » du lot 11 tombe,
le terrain se mesurant au décimètre ; `Planting_rank`/`Planting_rank_end`
acceptent les décimales avec la virgule ; le début est le plus petit des
deux nombres, la fin le plus grand ; le « + » de Helianthi n'est pas une
plage mais deux emplacements distincts, traité à part (point 5).

## 1. Correction des trois pages

| Page | Avant | Après |
|---|---|---|
| Capucine tubéreuse — Le Buisson de Cerzat (ECL-0006) | `Planting_rank=53,1 54,3` | `Planting_rank=53,1` / `Planting_rank_end=54,3` |
| Fraisier X — Le Buisson de Cerzat (ECL-0014) | `Planting_rank=58,3 à 58,8` | `Planting_rank=58,3` / `Planting_rank_end=58,8` |
| Égopode — Le Buisson de Cerzat (ECL-0013) | `Planting_rank=49,6 51` (stockait 49,651, sans erreur visible) | `Planting_rank=49,6` / `Planting_rank_end=51` |

Trois éditions séparées, résumé `[Correctif] Planting_rank — plage saisie
dans un champ unique`, relecture du wikitexte après chacune — conforme dans
les trois cas. Helianthi n'a pas été touchée.

## 2. Vérification

`browsebysubject` sur les trois pages, après écriture :

- Capucine : `Planting_rank -> ['53.1']`, `Planting_rank_end -> ['54.3']`
- Fraisier X : `Planting_rank -> ['58.3']`, `Planting_rank_end -> ['58.8']`
- Égopode : `Planting_rank -> ['49.6']`, `Planting_rank_end -> ['51']`

Les deux valeurs sont bien stockées séparément sur les trois. La requête
`[[_ERRC::+]]` (Erreurs de traitement SMW) est repassée de 4 à 2 pages :
`Helianthi — Le Buisson de Cerzat (ECL-0020)` (attendu, non traité) et
`Attribut:INSEE code` (préexistant depuis le 21 août 2026, sans rapport
avec ce lot). La file de travaux affichait 7 travaux avant et pendant
l'écriture, sans bouger — sans conséquence ici : la lecture directe des
faits stockés fait foi, pas le compteur de file (cf. leçon sur
`wiki-wait-jobs.sh` dans CLAUDE.md).

## 3. Correction de la convention

Recherche plein texte infructueuse (0 résultat sur « Planting_rank » comme
sur « entiers rang » — l'espace Attribut n'est apparemment pas indexé, ou
pas sur ces termes) : les occurrences ont été trouvées par lecture directe
des pages candidates, pas par la recherche. Quatre pages corrigées, une à
la fois avec relecture :

- **Attribut:Planting rank** — `Property_description_FR/EN` et
  `Property_range` : « mètres entiers » → « mètres … décimales admises,
  séparateur virgule ».
- **Attribut:Planting rank end** — même correction.
- **Modèle:Physical facet plant/doc** — section « La position est un
  segment » : retire « mètres entiers », ajoute la règle un champ par
  valeur avec la référence datée à l'incident du 4 septembre 2026.
- **Récapitulatif technique du Système de Gestion de Données Techniques**
  — paragraphe « La maille d'une plantation » (lignes 314-321 de la version
  du 6 septembre) : même retrait, plus la mention explicite que la
  convention du lot 11 est tombée ce jour.

Contrôle après écriture : `prop=categories` sur les quatre pages — aucune
catégorie parasite (Attribut et Formulaire n'en portent aucune ; le
Récapitulatif ne porte que ses deux catégories attendues, Page de suivi et
SGDT).

## 4. Formulaire — infobulles

`Formulaire:Physical item/bloc facette végétal` : le champ « Fin du
segment » portait déjà une infobulle, mais elle disait encore « mètres
entiers » et ne mentionnait pas la vraie règle. Le champ « Position depuis
l'origine du lieu » n'en portait aucune — c'est cette absence qui a laissé
passer les trois plages saisies en silence.

Diff proposé puis écrit sur les deux champs : chacune dit maintenant
qu'une position occupe un seul champ, qu'une plage en occupe deux, jamais
deux nombres dans le même champ, et que le séparateur décimal est la
virgule (un point est rejeté sans message).

## 5. Note — Helianthi, à traiter à part

`Helianthi — Le Buisson de Cerzat (ECL-0020)` porte toujours
`Planting_rank=48,7 + 49,2`, en erreur de traitement SMW, non corrigée dans
ce lot puisqu'il s'agit de deux emplacements distincts, pas d'une plage.
Ce que la création d'une seconde plantation demanderait :

- **Une nouvelle référence Base36** pour le second exemplaire (garde-fou
  CLAUDE.md : aucune création de référence hors ligne, la banque
  `Inventory_number` est en production).
- **Les champs à recopier** depuis la page actuelle : `model_link`,
  `Owned_by`, `Located_at`, et côté facette végétale `Specimen_status`,
  `Propagated_from` s'il s'applique aux deux également — chacun avec sa
  propre valeur si elle diffère (un `Planting_date` distinct n'est pas
  exclu).
- **Un `Planting_rank` propre à chacun** : `48,7` pour l'un, `49,2` pour
  l'autre — sans plage, conformément à la règle qui vient d'être posée.
- **Un lien de filiation éventuel** : si les deux emplacements viennent de
  la division d'un même pied, `Propagated_from` de l'un pourrait pointer
  vers l'autre — à confirmer par Cyril plutôt qu'à supposer.
- **Le nom de la seconde page** : suivre le même patron que les doublons
  déjà en place sur ce lieu (`Menthe X — Le Buisson de Cerzat` /
  `Menthe X — Terrasse de Chilhac` sont des lieux différents ; le cas
  Helianthi serait un doublon de nom sur le *même* lieu, plus proche de
  `Poireau perpétuel` ECL-0032/ECL-0033, distingués par leur seule
  référence Base36 dans le nom d'item, pas par un suffixe visible dans le
  titre de page).

Rien de ce qui précède n'a été exécuté — décision à prendre par Cyril avant
toute écriture sur Helianthi.
