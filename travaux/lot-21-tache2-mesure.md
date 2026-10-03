# Lot 21, tâche 2 — mesure en bac à sable

Exécuté le 4 octobre 2026 (heure de Paris) par Claude Code, sur consigne
« Pour Claude Code. ».

Les douze pages d'essai ont été créées sans refus, et chacune est
identique à son fichier. Aucune n'a été retouchée, vidée ou supprimée.
Sur le wiki, il n'y a eu que deux autres actions, les deux purges
autorisées.

## Étape 0

- `git status` : aucune ligne modifiée, ajoutée, supprimée ou renommée.
  Six fichiers non suivis dans `travaux/`, qui ne comptent pas.
- `travaux/lot-21-tache2-mesure.md` et `pages/Lot21_essai_*.txt`
  n'existaient pas.

## Étape 1 — Index des lots

**Avant la purge.**
- `prop=info` sur `Gestion des lots` (pageid 484) :
  `"touched": "2026-10-03T01:45:41Z"`, `lastrevid` 1240. Cette date est
  antérieure à l'écriture qui a ouvert le lot 21 (2026-10-03T22:31:24Z).
- Rendu (`action=parse`) : la section « En cours » ne liste que le lot 24
  et le lot 34. Le lot 21 figure dans « À venir ».
- Compte en bas de page :
  - Lots au total : 34 ;
  - En cours : 2 ;
  - Faits : 14 ;
  - À venir : 18 ;
  - Abandonnés : 0.

**Purge** de « Gestion des lots » : `purged: true` et `linkupdate: true`.

**Après la purge.**
- `prop=info` : `"touched": "2026-10-03T23:21:12Z"`, `lastrevid` 1240.
- Rendu : la section « En cours » liste les lots 21, 24 et 34.
- Compte en bas de page :
  - Lots au total : 34 ;
  - En cours : 3 ;
  - Faits : 14 ;
  - À venir : 17 ;
  - Abandonnés : 0.
- Une occurrence du lot 21 reste dans la section « À venir ». C'est la
  colonne « Dépend de » de la ligne du lot 7, pas une ligne du lot 21.

## Étape 2 — Titres libres

Les douze titres rendaient `"missing": true`.

## Pages créées

Toutes les pages ont été créées avec `--createonly` et le résumé
`[Lot 21][Tâche 2] Essai en bac à sable — à supprimer après la mesure`.
`bin/wiki-login.sh` a été lancé avant la première (`Success Cywil`).

| N° | Titre | Pageid | Révision | Horodatage (UTC) | Vérification |
|---|---|---|---|---|---|
| 01 | Modèle:Test lot21 unités débit | 563 | 1398 | 2026-10-03T23:21:28Z | IDENTIQUE |
| 02 | Attribut:Test lot21 débit | 564 | 1399 | 2026-10-03T23:21:47Z | IDENTIQUE |
| 03 | Attribut:Test lot21 débit min | 565 | 1400 | 2026-10-03T23:21:51Z | IDENTIQUE |
| 04 | Attribut:Test lot21 débit max | 566 | 1401 | 2026-10-03T23:21:56Z | IDENTIQUE |
| 05 | Attribut:Test lot21 température | 567 | 1402 | 2026-10-03T23:22:02Z | IDENTIQUE |
| 06 | Attribut:Test lot21 unité | 568 | 1403 | 2026-10-03T23:22:07Z | IDENTIQUE |
| 07 | Attribut:Test lot21 grandeur | 569 | 1404 | 2026-10-03T23:22:12Z | IDENTIQUE |
| 08 | Attribut:Test lot21 date | 570 | 1405 | 2026-10-03T23:22:18Z | IDENTIQUE |
| 09 | Attribut:Test lot21 nombre | 571 | 1406 | 2026-10-03T23:22:23Z | IDENTIQUE |
| 10 | Utilisateur:Cywil/Bac à sable/Lot21 débit volumique | 572 | 1407 | 2026-10-03T23:23:31Z | IDENTIQUE |
| 11 | Utilisateur:Cywil/Bac à sable/Lot21 litre par heure | 573 | 1408 | 2026-10-03T23:23:36Z | IDENTIQUE |
| 12 | Utilisateur:Cywil/Bac à sable/Lot21 pompe | 574 | 1409 | 2026-10-03T23:23:41Z | IDENTIQUE |

## Étape 5 — Faits des huit propriétés

**Premier passage**, après un `bin/wiki-wait-jobs.sh` qui a affiché cinq
fois `jobs=27`, puis `FILE FIGEE a 27 travaux`, code de sortie 2. Les huit
propriétés ne portaient que deux clés :
- `_CHGPRO`, dont le JSON contenait un `_TYPE` ;
- `_SKEY`.

Aucune n'avait de `_TYPE` direct.

**Second passage**, après un nouveau `bin/wiki-wait-jobs.sh` (même
sortie : cinq fois `jobs=27`, `FILE FIGEE`, code 2). Les huit propriétés
portent désormais leurs faits directs.

```
Attribut:Test lot21 débit
Property_description_FR -> ["Propriété d'essai du lot 21 : un débit, dont les unités sont déclarées par un modèle transclus. À supprimer après la mesure."]
_CONV -> ['1 m³/s, m3/s', '3600 m³/h, m3/h', '3600000 L/h, l/h']
_MDAT -> ['1/2026/10/3/23/21/47/0']
_SKEY -> ['Test lot21 débit']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['L/h, m³/h, m³/s']

Attribut:Test lot21 débit min
Property_description_FR -> ["Propriété d'essai du lot 21 : borne basse d'un débit spécifié, mêmes unités par le même modèle. À supprimer après la mesure."]
_CONV -> ['1 m³/s, m3/s', '3600 m³/h, m3/h', '3600000 L/h, l/h']
_MDAT -> ['1/2026/10/3/23/21/51/0']
_SKEY -> ['Test lot21 débit min']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['L/h, m³/h, m³/s']

Attribut:Test lot21 débit max
Property_description_FR -> ["Propriété d'essai du lot 21 : borne haute d'un débit spécifié, mêmes unités par le même modèle, plus une unité à facteur décimal déclarée en propre. À supprimer après la mesure."]
_CONV -> ['1 m³/s, m3/s', '3600 m³/h, m3/h', '3600000 L/h, l/h', '86,4 ML/j']
_MDAT -> ['1/2026/10/3/23/21/56/0']
_SKEY -> ['Test lot21 débit max']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['L/h, m³/h, m³/s']

Attribut:Test lot21 température
Property_description_FR -> ["Propriété d'essai du lot 21 : une température. À supprimer après la mesure."]
_MDAT -> ['1/2026/10/3/23/22/2/0']
_SKEY -> ['Test lot21 température']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_tem']
_UNIT -> ['°C']

Attribut:Test lot21 unité
Property_description_FR -> ["Propriété d'essai du lot 21 : lien d'une valeur vers sa page d'unité. À supprimer après la mesure."]
_MDAT -> ['1/2026/10/3/23/22/7/0']
_SKEY -> ['Test lot21 unité']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_wpg']

Attribut:Test lot21 grandeur
Property_description_FR -> ["Propriété d'essai du lot 21 : lien d'une unité vers sa page de grandeur. À supprimer après la mesure."]
_MDAT -> ['1/2026/10/3/23/22/12/0']
_SKEY -> ['Test lot21 grandeur']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_wpg']

Attribut:Test lot21 date
Property_description_FR -> ["Propriété d'essai du lot 21 : date d'une mesure. À supprimer après la mesure."]
_MDAT -> ['1/2026/10/3/23/22/18/0']
_SKEY -> ['Test lot21 date']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_dat']

Attribut:Test lot21 nombre
Property_description_FR -> ["Propriété d'essai du lot 21 : nombres décimaux et séparateur de valeurs multiples. À supprimer après la mesure."]
_MDAT -> ['1/2026/10/3/23/22/23/0']
_SKEY -> ['Test lot21 nombre']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_num']
```

## Étape 7 — Attentes et purges

Les quatre opérations ont été faites dans l'ordre prévu :
1. `bin/wiki-wait-jobs.sh` : cinq fois `jobs=7`, `FILE FIGEE a 7 travaux`,
   code 2.
2. Première purge de « Lot21 pompe » : `purged: true`, `linkupdate: true`.
3. `bin/wiki-wait-jobs.sh` : cinq fois `jobs=7`, `FILE FIGEE`, code 2.
4. Seconde purge : `purged: true`, `linkupdate: true`.

Le rendu relevé à l'étape 8d porte `Cached time: 20261003232420` et
`revision id 1409`.

## Étape 8 — Relevés

### a. Stocké : `browsebysubject` sur « Lot21 pompe » (relevé qui fait foi)

Les valeurs sont recopiées telles que l'API les rend. Le type est le code
numérique de l'API.

**Page `Cywil/Bac_à_sable/Lot21_pompe#2##`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21_débit | 1 | `0.00022222222222222` |
| Test_lot21_température | 1 | `258.15` |
| _ASK | 9 | 10 requêtes (`…#2##_QUERY…`) |
| _MDAT | 6 | `1/2026/10/3/23/23/41/0` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21 pompe` |
| _SOBJ | 9 | `…#2##spec`, `…#2##mesure`, `…#2##rejets`, `…#2##sep-virgule`, `…#2##sep-pointvirgule`, `…#2##point-decimal` |

La page elle-même ne porte ni `_ERRC` ni `_ERRT`.

**Sous-objet `spec`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21_débit | 1 | `0.00022222222222222` |
| Test_lot21_débit_max | 1 | `0.00025` |
| Test_lot21_débit_min | 1 | `0.00020833333333333` |
| Test_lot21_unité | 9 | `Cywil/Bac_à_sable/Lot21_litre_par_heure#2##` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21 pompe#spec` |

**Sous-objet `mesure`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21_date | 6 | `1/2026/10/4` |
| Test_lot21_débit | 1 | `0.000215` |
| Test_lot21_température | 1 | `285.65` |
| Test_lot21_unité | 9 | `Cywil/Bac_à_sable/Lot21_litre_par_heure#2##` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21 pompe#mesure` |

**Sous-objet `rejets`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21_débit | 1 | `800` |
| _ERRC | 9 | `…#2##_ERRee0f3fbf3d7b1a826836cd2cee1174aa`, `…#2##_ERR9991211fa5aa0277293aa61ba4f5699e` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21 pompe#rejets` |

Ce sous-objet ne porte ni `Test_lot21_débit_min`, ni
`Test_lot21_débit_max`. Les deux erreurs qu'il référence :
- `_ERRee0f3fbf3d7b1a826836cd2cee1174aa` : `_ERRP` = `Test_lot21_débit_min#102##` ;
  `_ERRT` = `[2,"smw_unitnotallowed",".9m³\/h"]`.
- `_ERR9991211fa5aa0277293aa61ba4f5699e` : `_ERRP` = `Test_lot21_débit_max#102##` ;
  `_ERRT` = `[2,"smw_unitnotallowed","L\/min"]`.

**Sous-objet `sep-virgule`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21_nombre | 1 | `26`, `9`, `33`, `7` (quatre valeurs) |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21 pompe#sep-virgule` |

Ce sous-objet ne porte ni `_ERRC` ni `_ERRT`.

**Sous-objet `sep-pointvirgule`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21_nombre | 1 | `26.9`, `33.7` (deux valeurs) |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21 pompe#sep-pointvirgule` |

Ce sous-objet ne porte ni `_ERRC` ni `_ERRT`.

**Sous-objet `point-decimal`**

| Propriété | Type | Valeur |
|---|---|---|
| _ERRC | 9 | `…#2##_ERR9e4112d4a59ff644373f55eb6eecd631` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21 pompe#point-decimal` |

Ce sous-objet ne porte pas `Test_lot21_nombre`. L'erreur qu'il
référence :
- `_ERR9e4112d4a59ff644373f55eb6eecd631` : `_ERRP` = `Test_lot21_nombre#102##` ;
  `_ERRT` = `[2,"smw-datavalue-number-textnotallowed",".9","26"]`.

**Requêtes stockées : condition `_ASKST`.**
Les dix requêtes portent aussi `_ASKFO`, `_ASKSI` et `_ASKDE`.

| Section | `_ASKST` |
|---|---|
| Q1 | `[[Test lot21 débit::+]]` |
| Q2 | `[[Test lot21 débit::≥0,00021666666666667 m³/s]]` |
| Q3 | `[[Test lot21 débit::≥0,00022222222222222 m³/s]]` |
| Q4 | `[[Test lot21 débit::≥5,5555555555556e-5 m³/s]]` |
| Q5 | `[[Has subobject.Test lot21 débit min::≤0,00021111111111111 m³/s]]` |
| Q6 | `[[Test lot21 unité.Test lot21 grandeur::Utilisateur:Cywil/Bac à sable/Lot21 débit volumique]]` |
| Q7 | `[[Has subobject.Test lot21 unité.Test lot21 grandeur::Utilisateur:Cywil/Bac à sable/Lot21 débit volumique]]` |
| Q8 | `[[Test lot21 température::+]]` |
| Q9 | `[[Test lot21 nombre::+]]` |
| Q10 | `[[Test lot21 débit max::+]]` |

### b. Sujets porteurs d'une erreur : `[[_ERRC::+]]`

`count: 2`
- `Utilisateur:Cywil/Bac à sable/Lot21 pompe#point-decimal`
- `Utilisateur:Cywil/Bac à sable/Lot21 pompe#rejets`

### c. Faits de « Lot21 litre par heure »

```
Test_lot21_grandeur -> ['Cywil/Bac_à_sable/Lot21_débit_volumique#2##']
_MDAT -> ['1/2026/10/3/23/23/36/0']
_SKEY -> ['Cywil/Bac à sable/Lot21 litre par heure']
```

### d. Rendu de « Lot21 pompe » (`action=parse`)

**Avant les sections**, deux avertissements SMW s'affichent dans le texte.
- Le premier, à l'emplacement du sous-objet `rejets` : « « .9m³/h » n’est
  pas déclaré comme une unité valide de mesure pour cette propriété. »,
  puis « « L/min » n’est pas déclaré comme une unité valide de mesure pour
  cette propriété. ».
- Le second, à l'emplacement de `point-decimal` : « « .9 » ne peut pas être
  affecté à un type de nombre déclaré avec la valeur 26. ».

Dans les tableaux, toutes les colonnes portent l'en-tête « Test lot21
débit » (ou « … température », « … débit max »), sans mention de l'unité
demandée.

**Q1** — tableau, quatre lignes.

| Sujet | colonne 1 (`?Test lot21 débit`) | colonne 2 (`#m³/s`) | colonne 3 (`#m³/h`) |
|---|---|---|---|
| Cywil/Bac à sable/Lot21 pompe | 800 L/h | 2,222222e-4 m³/s | 0,8 m³/h |
| Cywil/Bac à sable/Lot21 pompe#mesure | 774 L/h | 2,15e-4 m³/s | 0,774 m³/h |
| Cywil/Bac à sable/Lot21 pompe#rejets | 2 880 000 000 L/h | 800 m³/s | 2 880 000 m³/h |
| Cywil/Bac à sable/Lot21 pompe#spec | 800 L/h | 2,222222e-4 m³/s | 0,8 m³/h |

**Q2** — liste : Cywil/Bac à sable/Lot21 pompe,
Cywil/Bac à sable/Lot21 pompe#rejets, Cywil/Bac à sable/Lot21 pompe#spec.

**Q3** — liste : Cywil/Bac à sable/Lot21 pompe,
Cywil/Bac à sable/Lot21 pompe#rejets, Cywil/Bac à sable/Lot21 pompe#spec.

**Q4** — liste : Cywil/Bac à sable/Lot21 pompe,
Cywil/Bac à sable/Lot21 pompe#mesure, Cywil/Bac à sable/Lot21 pompe#rejets,
Cywil/Bac à sable/Lot21 pompe#spec.

**Q5** — liste : Cywil/Bac à sable/Lot21 pompe.

**Q6** — tableau.

| Sujet | Test lot21 débit |
|---|---|
| Cywil/Bac à sable/Lot21 pompe#mesure | 774 L/h |
| Cywil/Bac à sable/Lot21 pompe#spec | 800 L/h |

**Q7** — liste : Cywil/Bac à sable/Lot21 pompe.

**Q8** — tableau.

| Sujet | colonne 1 (`?Test lot21 température`) | colonne 2 (`#K`) |
|---|---|---|
| Cywil/Bac à sable/Lot21 pompe | -15 °C | 258,15 K |
| Cywil/Bac à sable/Lot21 pompe#mesure | 12,5 °C | 285,65 K |

**Q9** — tableau. Les valeurs multiples s'affichent séparées par un
saut de ligne.

| Sujet | Test lot21 nombre |
|---|---|
| Cywil/Bac à sable/Lot21 pompe#sep-pointvirgule | 26,9 / 33,7 |
| Cywil/Bac à sable/Lot21 pompe#sep-virgule | 7 / 9 / 26 / 33 |

**Q10** — tableau.

| Sujet | colonne 1 (`?Test lot21 débit max`) | colonne 2 (`#ML/j`) | colonne 3 (`#L/h`) |
|---|---|---|---|
| Cywil/Bac à sable/Lot21 pompe#spec | 900 L/h | 0,0216 ML/j | 900 L/h |

Aucune section ne rend « AUCUN RÉSULTAT », et aucune ne rend de message
d'erreur de requête.

## Écarts et surprises

1. **`bin/wiki-wait-jobs.sh` a annoncé « FILE FIGEE » à ses quatre
   appels** : deux fois à 27 travaux, deux fois à 7. Les faits directs des
   huit propriétés sont pourtant apparus entre le premier et le second
   relevé, et les requêtes ont rendu des résultats complets. C'est le
   comportement déjà décrit dans CLAUDE.md : le nombre lu est une
   estimation, pas un décompte.
2. **Les comparateurs `>` et `<` ont été compilés en `≥` et `≤`.** C'est
   visible dans `_ASKST` de Q2, Q3 et Q5. Conséquence : Q3, qui demandait
   un débit `>800 L/h`, rend aussi la page et `#spec`, à exactement
   800 L/h.
3. **Une valeur sans unité est acceptée sans erreur, dans l'unité de
   base.** Dans `rejets`, `Test lot21 débit=800` est stocké `800`, sans
   `_ERRC`. L'unité de base est celle de facteur 1, ici m³/s : la valeur
   s'affiche « 800 m³/s », soit 2 880 000 000 L/h, et elle répond aux
   requêtes Q1 à Q4.
4. **Le point décimal dans une quantité est découpé, pas rejeté en bloc.**
   `0.9 m³/h` produit l'erreur `smw_unitnotallowed` sur l'unité `.9m³/h` :
   le nombre lu est `0`, et le reste est pris pour une unité.
5. **Séparateur décimal.** Un nombre à virgule décimale est accepté (`26,9`
   stocké `26.9` dans `sep-pointvirgule`), et le point est rejeté
   (`point-decimal`, erreur `textnotallowed`). Ce comportement est
   conforme à l'entrée 20 des Limites connues.
   - Avec `+sep=,`, `26,9, 33,7` devient quatre entiers, sans aucune
     erreur.
   - Avec `+sep=;`, on obtient les deux décimaux attendus.

   Les descriptions de `Attribut:Nominal diameter` et
   `Attribut:Secondary diameter` prescrivent l'inverse (« Décimales avec un
   point, jamais une virgule »). Ce relevé ne porte toutefois que sur la
   propriété d'essai, de type Number.
6. **L'unité déclarée en propre fonctionne.** `86,4 ML/j`, déclarée sur la
   seule propriété « débit max » avec une virgule décimale, convertit
   `0,0216 ML/j` en `0.00025` m³/s, soit 900 L/h. Elle sert aussi d'unité
   d'affichage par `#ML/j`, bien qu'absente de `Display units`.
7. **Les unités déclarées par un modèle transclus sont prises en compte.**
   `_CONV` et `_UNIT` de débit, débit min et débit max portent les trois
   déclarations du modèle 01.
8. **Les révisions 1392 à 1397 sont antérieures à cette tâche et
   n'émanent pas d'elle.** Elles ont été faites sur le wiki entre
   l'écriture du lot 21 (révision 1391) et la création de la page 01
   (révision 1398). Je ne les ai pas examinées.
9. **Commandes hors de la liste prévue.** Pour relever l'index des lots
   (étape 1) et vérifier l'origine de l'occurrence restante du lot 21, j'ai
   enchaîné `bin/wiki-api.sh … | grep -o …` (trois fois), et une fois
   `grep` sur le fichier où l'outil avait enregistré une sortie longue.
   Toutes ces commandes sont en lecture seule. La consigne ne les
   annonçait pas, et je ne sais pas si elles ont déclenché une fenêtre de
   confirmation. Aucun script n'a été écrit.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

Aucune.

## Les douze titres à supprimer

1. Modèle:Test lot21 unités débit
2. Attribut:Test lot21 débit
3. Attribut:Test lot21 débit min
4. Attribut:Test lot21 débit max
5. Attribut:Test lot21 température
6. Attribut:Test lot21 unité
7. Attribut:Test lot21 grandeur
8. Attribut:Test lot21 date
9. Attribut:Test lot21 nombre
10. Utilisateur:Cywil/Bac à sable/Lot21 débit volumique
11. Utilisateur:Cywil/Bac à sable/Lot21 litre par heure
12. Utilisateur:Cywil/Bac à sable/Lot21 pompe
