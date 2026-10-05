# Lot 21, tâche 11 — Le verrou gêne-t-il l'usage ? : rapport

Session Claude Code du 5 octobre 2026, de 19 h 58 à 20 h 10 UTC.

**La réponse est non, d'après ce qui est stocké.** Une propriété verrouillée stocke ses valeurs exactement comme une propriété libre de même type : même valeur brute, même type de donnée, même table SQL, et les requêtes la lisent pareil. Le verrou ne se voit nulle part dans ce qui est stocké. Les deux propriétés créées dans cette tâche, `libellé` et `puissance`, sont elles-mêmes verrouillées, et elles stockent et répondent normalement.

**`_ERRC` vaut 1 sur tout le wiki, contre 0 avant la tâche.** Le seul sujet en erreur est le sous-objet d'essai `Utilisateur:Cywil/Bac à sable/Lot21c pompe#saisie-douteux`, qui a été construit pour produire cette erreur. Aucun sujet de production n'y figure.

## Étape 0 — État du dépôt

- `git status --short` : sortie vide.
- `travaux/lot-21-tache11-verrou-et-usage.md` : absent (`No such file or directory`).
- `.claude/settings.local.json` au début : `{"permissions": {"allow": [], "deny": []}}`. Aucune règle.

## Journal de l'étape 1

Les horodatages sont en UTC le 5 octobre 2026. Les écarts sont comptés depuis l'horodatage de création rendu par l'API. À chaque tour d'attente, deux lectures sur la page de propriété, et rien d'autre : `--facts`, puis `prop=info&intestactions=edit&intestactionsdetail=full`. Le script `verrou.py` fait cette seconde lecture.

### P4 — `Attribut:Test lot21c libellé`

| | |
|---|---|
| Vérification préalable | `missing: true` |
| Création | pageid 595, rév. 1448, `2026-10-05T19:58:52Z` |
| Tour 1, 20:00:00 (+68 s) | `_CHGPRO` présent (faits : `_CHGPRO`, `_SKEY`) ; verrou : `smw-change-propagation-protection` |
| Tour 2, 20:01:08 (+136 s) | `_CHGPRO` absent, `_TYPE` direct `_mlt_rec` ; verrou : `smw-change-propagation-protection` |
| Disparition de `_CHGPRO` | constatée à 20:01:08, au tour 2 |
| Première requête nommante | 20:01:12, soit +140 s |
| typeid lu | `_mlt_rec` ; témoin `Max thickness` à `_num` |
| Écriture de contrôle, 20:01:15 | refus `smw-change-propagation-protection` |
| Issue | **retenue** |

### P5 — `Attribut:Test lot21c puissance`

| | |
|---|---|
| Vérification préalable | `missing: true` |
| Création | pageid 596, rév. 1449, `2026-10-05T20:01:23Z` |
| Tour 1, 20:02:30 (+67 s) | `_CHGPRO` présent ; verrou présent |
| Tour 2, 20:03:40 (+137 s) | `_CHGPRO` présent ; verrou présent |
| Tour 3, 20:04:49 (+206 s) | `_CHGPRO` présent ; verrou présent |
| Tour 4, 20:05:57 (+274 s) | `_CHGPRO` absent, `_TYPE` direct `_num` ; verrou présent |
| Disparition de `_CHGPRO` | constatée à 20:05:57, au tour 4 |
| Première requête nommante | 20:06:00, soit +277 s |
| typeid lu | `_num` ; témoin `Max thickness` à `_num` |
| Écriture de contrôle, 20:06:04 | refus `smw-change-propagation-protection` |
| Issue | **retenue** |

Le verrou était présent sur les deux propriétés dès le premier tour, avant toute requête nommante, et il l'est resté à chaque tour. Pour P5, il l'était encore à 20:08:39, au relevé de l'étape 4.

## Noms retenus

- Libellé : `Test lot21c libellé`, sans suffixe.
- Puissance : `Test lot21c puissance`, sans suffixe.

Aucune substitution n'a été faite dans `pages/Lot21c_essai_09_grandeur_debit.txt` ni dans `pages/Lot21c_essai_12_pompe.txt`, donc il n'y a aucun diff.

## Créations des étapes 2 et 3

Les quatre titres ont été vérifiés `missing` à 20:06:08. Chaque page a été créée avec `--createonly` et le résumé « [Lot 21][Tâche 11] Essai en bac à sable - à conserver jusqu'à nouvel ordre ».

| Page | Fichier | pageid | rév. | Horodatage |
|---|---|---|---|---|
| `Modèle:Test lot21c valeur` | `pages/Lot21c_essai_07_modele_valeur.txt` | 597 | 1450 | 20:06:14 |
| `Catégorie:Test lot21c classe` | `pages/Lot21c_essai_08_categorie.txt` | 598 | 1451 | 20:06:15 |
| `Utilisateur:Cywil/Bac à sable/Lot21c grandeur débit` | `pages/Lot21c_essai_09_grandeur_debit.txt` | 599 | 1452 | 20:06:32 |
| `Utilisateur:Cywil/Bac à sable/Lot21c pompe` | `pages/Lot21c_essai_12_pompe.txt` (écrit dans cette tâche, conforme à la consigne) | 600 | 1453 | 20:06:32 |

`Module:Nombre`, appelé par le modèle, existe (pageid 412, rév. 816).

## Relevés de l'étape 4

### 4.1 — File de travaux

```
essai 1 : jobs=11
essai 2 : jobs=11
essai 3 : jobs=11
essai 4 : jobs=11
essai 5 : jobs=11
FILE FIGEE a 11 travaux — inutile d'attendre davantage
sortie 2
```

J'ai poursuivi, comme la consigne le prévoit.

### 4.2 — État 0, avant toute purge (20:07:13)

Le rendu est obtenu par `action=parse&prop=text`, puis les balises HTML sont retirées. Les tables sont rendues ligne par ligne, cellules séparées par `|`. Les avertissements SMW ont été cherchés dans les infobulles (`data-content`, `smwttcontent`).

```
== R1 ==
| Sujet | Test lot21c débit |
| Cywil/Bac à sable/Lot21c pompe | 800 L/h |
| Cywil/Bac à sable/Lot21c pompe#saisie-point | 900 L/h |
| Cywil/Bac à sable/Lot21c pompe#saisie-virgule | 900 L/h |
| Cywil/Bac à sable/Lot21c pompe#spec | 750 L/h |

== R2 ==
| Sujet | Test lot21c débit |
| Cywil/Bac à sable/Lot21c pompe | 800 L/h |

== R3 ==
Cywil/Bac à sable/Lot21c pompe

== R4 ==
| Sujet | Test lot21c température 3 | Test lot21c température 3 | Test lot21c température 2 | Test lot21c température 2 |
| Cywil/Bac à sable/Lot21c pompe | 5 °F | 258,15 K | 5 °F | 258,15 K |

== R5 ==
| Sujet | Test lot21c tolérance temp 2 | Test lot21c tolérance temp 2 | Test lot21c tolérance temp | Test lot21c tolérance temp |
| Cywil/Bac à sable/Lot21c pompe | 275,15 K | 275,15 K | 275,15 K | 275,15 K |

== R6 ==
| Sujet | Test lot21c écart température | Test lot21c écart température | Test lot21c écart température 2 | Test lot21c écart température 2 |
| Cywil/Bac à sable/Lot21c pompe | 2 °C | 2 K | 2 °C | 2 K |

== R7 ==
| Sujet | Test lot21c température 3 | Test lot21c température 3 | Test lot21c température 3 |
| Cywil/Bac à sable/Lot21c pompe | 5 °F | 258,15 K | 5 °F |
| Cywil/Bac à sable/Lot21c pompe#fahrenheit | 50 °F | 283,15 K | 50 °F |

== R8 ==
| Sujet | Test lot21c libellé |
| Cywil/Bac à sable/Lot21c grandeur débit | débit volumique (fr)
volumetric flow rate (en) |

== R9 ==
Cywil/Bac à sable/Lot21c grandeur débit

== R10 ==
| Sujet | Test lot21c puissance |
| Cywil/Bac à sable/Lot21c pompe | 96 |

Avertissements hors sections : []
```

Aucun avertissement SMW n'a été trouvé, ni dans les sections ni hors d'elles. Le sous-objet `saisie-douteux` n'apparaît pas dans R1 et ne porte aucune icône d'avertissement sur la page.

### 4.3 — Relevé 1 (`browsebysubject`)

Pour chaque fait : propriété, type du dataitem rendu par l'API, valeur brute. Les numéros de type de l'API sont traduits : 1 = number, 2 = blob, 6 = time, 9 = wikipage.

```
### Sujet : Cywil/Bac à sable/Lot21c pompe
   Test_lot21c_débit | number | 0.00022222222222222
   Test_lot21c_puissance | number | 96
   Test_lot21c_température_2 | number | 258.15
   Test_lot21c_température_3 | number | 258.15
   Test_lot21c_tolérance_temp | number | 275.15
   Test_lot21c_tolérance_temp_2 | number | 275.15
   Test_lot21c_écart_température | number | 2
   Test_lot21c_écart_température_2 | number | 2
   _ASK | wikipage | Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERYbe9cb58fe96ec481e22b1654a9792546
   _ASK | wikipage | Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERY9cc9e723bf5c9d3a59077686f0fb10c9
   _ASK | wikipage | Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERYef957fcc920b4beafb6840cc6ccc2a06
   _ASK | wikipage | Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERY1e01b915b982eea2095d4a9a538ef79f
   _ASK | wikipage | Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERY4ecdf5fd4eb00b2536d2274cb86f20f8
   _ASK | wikipage | Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERY027a35370b1049d922fe3a3b7acdac85
   _ASK | wikipage | Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERY963ec4eb50979c5a1e2fb3af34eac699
   _INST | wikipage | Test_lot21c_classe#14##
   _MDAT | time | 1/2026/10/5/20/6/32/0
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe
   _SOBJ | wikipage | Cywil/Bac_à_sable/Lot21c_pompe#2##spec
   _SOBJ | wikipage | Cywil/Bac_à_sable/Lot21c_pompe#2##fahrenheit
   _SOBJ | wikipage | Cywil/Bac_à_sable/Lot21c_pompe#2##saisie-point
   _SOBJ | wikipage | Cywil/Bac_à_sable/Lot21c_pompe#2##saisie-virgule
   _SOBJ | wikipage | Cywil/Bac_à_sable/Lot21c_pompe#2##saisie-douteux
### Sujet : Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERYbe9cb58fe96ec481e22b1654a9792546
   _ASKDE | number | 1
   _ASKFO | blob | table
   _ASKSI | number | 1
   _ASKST | blob | [[Test lot21c débit::+]]
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe# QUERYbe9cb58fe96ec481e22b1654a9792546
### Sujet : Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERY9cc9e723bf5c9d3a59077686f0fb10c9
   _ASKDE | number | 1
   _ASKFO | blob | table
   _ASKSI | number | 2
   _ASKST | blob | [[Catégorie:Test lot21c classe]] [[Test lot21c débit::+]]
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe# QUERY9cc9e723bf5c9d3a59077686f0fb10c9
### Sujet : Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERYef957fcc920b4beafb6840cc6ccc2a06
   _ASKDE | number | 0
   _ASKFO | blob | list
   _ASKFO | blob | table
   _ASKSI | number | 1
   _ASKST | blob | [[Catégorie:Test lot21c classe]]
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe# QUERYef957fcc920b4beafb6840cc6ccc2a06
### Sujet : Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERY1e01b915b982eea2095d4a9a538ef79f
   _ASKDE | number | 1
   _ASKFO | blob | table
   _ASKSI | number | 1
   _ASKST | blob | [[Test lot21c température 3::+]]
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe# QUERY1e01b915b982eea2095d4a9a538ef79f
### Sujet : Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERY4ecdf5fd4eb00b2536d2274cb86f20f8
   _ASKDE | number | 1
   _ASKFO | blob | table
   _ASKSI | number | 1
   _ASKST | blob | [[Test lot21c libellé::+]]
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe# QUERY4ecdf5fd4eb00b2536d2274cb86f20f8
### Sujet : Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERY027a35370b1049d922fe3a3b7acdac85
   _ASKDE | number | 2
   _ASKFO | blob | list
   _ASKSI | number | 5
   _ASKST | blob | [[Test lot21c libellé:: <q>[[Text::débit volumique]] [[Language code::fr]]</q> ]]
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe# QUERY027a35370b1049d922fe3a3b7acdac85
### Sujet : Cywil/Bac_à_sable/Lot21c_pompe#2##_QUERY963ec4eb50979c5a1e2fb3af34eac699
   _ASKDE | number | 1
   _ASKFO | blob | table
   _ASKSI | number | 1
   _ASKST | blob | [[Test lot21c puissance::+]]
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe# QUERY963ec4eb50979c5a1e2fb3af34eac699
### Sujet : Cywil/Bac_à_sable/Lot21c_pompe#2##spec
   Test_lot21c_débit | number | 0.00020833333333333
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe#spec
### Sujet : Cywil/Bac_à_sable/Lot21c_pompe#2##fahrenheit
   Test_lot21c_température_2 | number | 283.15
   Test_lot21c_température_3 | number | 283.15
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe#fahrenheit
### Sujet : Cywil/Bac_à_sable/Lot21c_pompe#2##saisie-point
   Test_lot21c_débit | number | 0.00025
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe#saisie-point
### Sujet : Cywil/Bac_à_sable/Lot21c_pompe#2##saisie-virgule
   Test_lot21c_débit | number | 0.00025
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe#saisie-virgule
### Sujet : Cywil/Bac_à_sable/Lot21c_pompe#2##_ERR005aa03162eebf6ea2cb0efcb936b12b
   _ERRP | wikipage | Test_lot21c_débit#102##
   _ERRT | blob | [2,"smw_unitnotallowed",".2.3m³\/h"]
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe# ERR005aa03162eebf6ea2cb0efcb936b12b
### Sujet : Cywil/Bac_à_sable/Lot21c_pompe#2##saisie-douteux
   _ERRC | wikipage | Cywil/Bac_à_sable/Lot21c_pompe#2##_ERR005aa03162eebf6ea2cb0efcb936b12b
   _SKEY | blob | Cywil/Bac à sable/Lot21c pompe#saisie-douteux
### Erreur référencée : Cywil/Bac_à_sable/Lot21c_pompe#2##_ERR005aa03162eebf6ea2cb0efcb936b12b
   _ERRP | ['Test_lot21c_débit#102##']
   _ERRT | ['[2,"smw_unitnotallowed",".2.3m\\u00b3\\/h"]']
### Sujet : Cywil/Bac à sable/Lot21c grandeur débit
   Test_lot21c_libellé | wikipage | Cywil/Bac_à_sable/Lot21c_grandeur_débit#2##_MLeefa7b4e12ca57011af8505a46d5f4ea
   Test_lot21c_libellé | wikipage | Cywil/Bac_à_sable/Lot21c_grandeur_débit#2##_ML45c94c2a3fb2000adf985909190ec86f
   _MDAT | time | 1/2026/10/5/20/6/32/0
   _SKEY | blob | Cywil/Bac à sable/Lot21c grandeur débit
### Sujet : Cywil/Bac_à_sable/Lot21c_grandeur_débit#2##_MLeefa7b4e12ca57011af8505a46d5f4ea
   _LCODE | blob | fr
   _SKEY | blob | Cywil/Bac à sable/Lot21c grandeur débit#débit volumique;fr
   _TEXT | blob | débit volumique
### Sujet : Cywil/Bac_à_sable/Lot21c_grandeur_débit#2##_ML45c94c2a3fb2000adf985909190ec86f
   _LCODE | blob | en
   _SKEY | blob | Cywil/Bac à sable/Lot21c grandeur débit#volumetric flow rate;en
   _TEXT | blob | volumetric flow rate
```

Il y a un seul `_ERRC`, porté par `saisie-douteux`. Son `_ERRP` vaut `Test_lot21c_débit#102##` et son `_ERRT` vaut `[2,"smw_unitnotallowed",".2.3m³/h"]`.

`saisie-sans-unite` n'est pas dans `_SOBJ`.

### 4.4 — Purge

`bin/wiki-purge.sh` a été lancé sur les deux pages : `purged: true` et `linkupdate: true` pour chacune. `bin/wiki-wait-jobs.sh` a annoncé ensuite « FILE FIGEE a 11 travaux », sortie 2, à 20:07:45.

### 4.5 — Relevé 2

Le relevé 2 est **identique au relevé 1** : `diff` entre les deux sorties de 103 lignes, sortie 0, aucune différence.

### 4.6 — État 1

L'état 1 est **identique à l'état 0** : `diff` entre les deux rendus de 58 lignes, sortie 0, aucune différence.

### 4.7 — Compilation en direct (`format=debug`)

La compilation est passée par `action=parse` (`contentmodel=wikitext`, `title=Accueil`) via `bin/wiki-api.sh`, en GET, et non en POST par `--data-urlencode` : voir « Écarts et surprises », point 1. Pour chaque requête, la ligne SQL est recopiée telle qu'elle est rendue, jusqu'à `ORDER BY`.

`{{#ask: [[Test lot21c tolérance temp 2::2 °C]] |format=debug}}`
```
SELECT DISTINCT t0.smw_id AS id, t0.smw_title AS t, t0.smw_namespace AS ns, t0.smw_iw AS iw, t0.smw_subobject AS so, t0.smw_sortkey AS sortkey, t0.smw_sort FROM `smw_object_ids` AS t0 INNER JOIN `smw_di_number` AS t1 ON t0.smw_id=t1.s_id WHERE ( (t1.o_sortkey='275.15') AND t1.p_id=1895) AND t0.smw_iw!=':smw' AND t0.smw_iw!=':smw-delete' AND t0.smw_iw!=':smw-redi' ORDER BY t0.smw_sort ASC LIMIT 55 OFFSET 0
```
FROM `smw_object_ids`, INNER JOIN `smw_di_number`. La saisie de 2 °C est cherchée comme 275.15.

`{{#ask: [[Test lot21c tolérance temp::2 °C]] |format=debug}}`
```
SELECT DISTINCT t0.smw_id AS id, t0.smw_title AS t, t0.smw_namespace AS ns, t0.smw_iw AS iw, t0.smw_subobject AS so, t0.smw_sortkey AS sortkey, t0.smw_sort FROM `smw_object_ids` AS t0 INNER JOIN `smw_di_number` AS t1 ON t0.smw_id=t1.s_id WHERE ( (t1.o_sortkey='275.15') AND t1.p_id=1894) AND t0.smw_iw!=':smw' AND t0.smw_iw!=':smw-delete' AND t0.smw_iw!=':smw-redi' ORDER BY t0.smw_sort ASC LIMIT 55 OFFSET 0
```
FROM `smw_object_ids`, INNER JOIN `smw_di_number`. Même requête que la précédente, seul le `p_id` change : 1894, propriété verrouillée, contre 1895, propriété libre.

`{{#ask: [[Test lot21c libellé::débit volumique@fr]] |format=debug}}`
```
SELECT DISTINCT t0.smw_id AS id, t0.smw_title AS t, t0.smw_namespace AS ns, t0.smw_iw AS iw, t0.smw_subobject AS so, t0.smw_sortkey AS sortkey, t0.smw_sort FROM `smw_object_ids` AS t0 INNER JOIN (`smw_di_wikipage` AS t1 INNER JOIN (`smw_fpt_text` AS t4 INNER JOIN `smw_fpt_lcode` AS t5 ON t4.s_id=t5.s_id) ON t1.o_id=t4.s_id) ON t0.smw_id=t1.s_id WHERE (t1.p_id=1898 AND ( (t4.o_hash='débit volumique') AND ( (t5.o_hash='fr') )) ) AND t0.smw_iw!=':smw' AND t0.smw_iw!=':smw-delete' AND t0.smw_iw!=':smw-redi' ORDER BY t0.smw_sort ASC LIMIT 55 OFFSET 0
```
FROM `smw_object_ids`, INNER JOIN `smw_di_wikipage`, INNER JOIN `smw_fpt_text`, INNER JOIN `smw_fpt_lcode`.

`{{#ask: [[Test lot21c puissance::96]] |format=debug}}`
```
SELECT DISTINCT t0.smw_id AS id, t0.smw_title AS t, t0.smw_namespace AS ns, t0.smw_iw AS iw, t0.smw_subobject AS so, t0.smw_sortkey AS sortkey, t0.smw_sort FROM `smw_object_ids` AS t0 INNER JOIN `smw_di_number` AS t1 ON t0.smw_id=t1.s_id WHERE ( (t1.o_sortkey='96') AND t1.p_id=1899) AND t0.smw_iw!=':smw' AND t0.smw_iw!=':smw-delete' AND t0.smw_iw!=':smw-redi' ORDER BY t0.smw_sort ASC LIMIT 55 OFFSET 0
```
FROM `smw_object_ids`, INNER JOIN `smw_di_number`.

Pour les quatre requêtes, la section « Errors and Warnings » du rendu debug vaut `None`, et « Auxilliary Tables » vaut `No auxilliary tables used`.

### 4.8 — Relevé du verrou (lecture à 20:08:39)

Les seize pages de `Attribut:` dont le titre commence par `Test lot21` ont été listées par `list=allpages`, préfixe `Test lot21` :

| Titre | Dernière révision | Verrou |
|---|---|---|
| Attribut:Test lot21b débit | 1429, 2026-10-04T22:24:01Z | présent |
| Attribut:Test lot21b puissance | 1430, 2026-10-04T22:24:02Z | présent |
| Attribut:Test lot21b température | 1431, 2026-10-04T22:24:03Z | présent |
| Attribut:Test lot21b tolérance temp | 1432, 2026-10-04T22:24:04Z | présent |
| Attribut:Test lot21b écart température | 1433, 2026-10-04T22:24:05Z | présent |
| Attribut:Test lot21b libellé | 1434, 2026-10-04T22:24:07Z | présent |
| Attribut:Test lot21c débit | 1440, 2026-10-04T23:44:00Z | absent |
| Attribut:Test lot21c température | 1441, 2026-10-05T12:03:18Z | présent |
| Attribut:Test lot21c température 2 | 1442, 2026-10-05T16:44:22Z | présent |
| Attribut:Test lot21c température 3 | 1443, 2026-10-05T16:50:08Z | absent |
| Attribut:Test lot21c tolérance temp | 1444, 2026-10-05T16:54:00Z | présent |
| Attribut:Test lot21c tolérance temp 2 | 1445, 2026-10-05T17:20:09Z | absent |
| Attribut:Test lot21c écart température | 1446, 2026-10-05T17:30:54Z | présent |
| Attribut:Test lot21c écart température 2 | 1447, 2026-10-05T17:40:01Z | présent |
| Attribut:Test lot21c libellé | 1448, 2026-10-05T19:58:52Z | présent |
| Attribut:Test lot21c puissance | 1449, 2026-10-05T20:01:23Z | présent |

Aucun verrou ne s'est levé depuis la tâche 10. Les six `lot21b` sont toujours verrouillées 21 h 45 après leur création, et `lot21c température` l'est toujours 8 h après la sienne. Les trois pages libres le sont restées.

## Vérifications

a. **Relevé 2** : c'est le relevé reproduit en 4.3, identique au relevé 1. C'est lui qui fonde toutes les réponses ci-dessous.

b. **Contenu** : `bin/wiki-verify.sh` a été lancé sur les six pages créées dans cette tâche. Les six rendent `IDENTIQUE`, sortie 0 :
   - `Attribut:Test lot21c libellé`
   - `Attribut:Test lot21c puissance`
   - `Modèle:Test lot21c valeur`
   - `Catégorie:Test lot21c classe`
   - `Utilisateur:Cywil/Bac à sable/Lot21c grandeur débit`
   - `Utilisateur:Cywil/Bac à sable/Lot21c pompe`

c. **Erreurs** : `[[_ERRC::+]]` a été compté deux fois.
   - Par `action=ask` (`limit=500`) : 1 résultat, `Utilisateur:Cywil/Bac à sable/Lot21c pompe#saisie-douteux`.
   - Par le rendu en ligne `{{#ask: [[_ERRC::+]] |format=count}}` : `1`.

   Le compte passe de 0 à 1. La seule erreur est celle du sous-objet d'essai, et aucun sujet de production n'y figure.

d. **Liens et catégories de la page d'item** : `action=parse&prop=links|categories` sur `Lot21c pompe` rend onze liens, tous avec `exists: True` :
   - la page elle-même ;
   - `Lot21c grandeur débit` ;
   - les neuf `Attribut:Test lot21c` employés : débit, libellé, puissance, température 2, température 3, tolérance temp, tolérance temp 2, écart température et écart température 2.

   Il n'y a **aucun lien vers une page inexistante**. La seule catégorie est `Test_lot21c_classe`.

## La question qui commande tout : une propriété verrouillée stocke-t-elle comme une propriété libre ?

**Oui. Le verrou ne se voit pas dans ce qui est stocké.** Comparaison ligne à ligne, d'après le relevé 2 :

| Couple | Sujet | Verrouillée : valeur brute (type) | Libre : valeur brute (type) | Affichage, état 1 |
|---|---|---|---|---|
| `température 2` (verrouillée) / `température 3` (libre) | pompe, -15 °C | `258.15` (number) | `258.15` (number) | R4 : `5 °F` et `258,15 K` pour les deux |
| idem | `#fahrenheit`, 50 °F | `283.15` (number) | `283.15` (number) | absent de R4 : `#fahrenheit` ne porte pas la catégorie |
| `tolérance temp` (verrouillée) / `tolérance temp 2` (libre) | pompe, 2 °C | `275.15` (number) | `275.15` (number) | R5 : `275,15 K` pour les quatre colonnes |
| `écart température` (verrouillée) / `écart température 2` (libre) | pompe, 2 °C | `2` (number) | `2` (number) | R6 : `2 °C` et `2 K` pour les deux |

Dans la compilation debug, les deux tolérances donnent la même requête sur la même table `smw_di_number`, avec la même valeur cherchée `275.15`. Seul le `p_id` diffère.

Les deux propriétés créées dans cette tâche, `libellé` (`_mlt_rec`) et `puissance` (`_num`), étaient verrouillées pendant tout leur usage. Elles stockent et répondent pourtant normalement : R8, R9 et R10, plus le relevé de la page de grandeur.

## Les cinq questions

| Question | Réponse | Relevé qui la fonde |
|---|---|---|
| 1 — Le filtre de classe écarte-t-il les sous-objets ? | **Oui.** R1, sans filtre, rend la page et ses trois sous-objets porteurs de débit (`saisie-point`, `saisie-virgule`, `spec`). R2, avec le filtre `[[Catégorie:Test lot21c classe]]`, ne rend que la page. R3 ne rend que la page. | Relevé 2 : `_INST` (`Test_lot21c_classe#14##`) n'est porté que par le sujet principal, et aucun sous-objet ne porte `_INST`. |
| 3a — Le couple nombre normalisé plus unité donne-t-il une annotation valide dans le type déclaré ? | **Oui pour le point et la virgule. Rejet visible pour la saisie douteuse. Absence pour la saisie sans unité.** `saisie-point` (0.9) et `saisie-virgule` (0,9) stockent tous deux `0.00025` (number), soit 0,9 m³/h exprimé en m³/s, et s'affichent `900 L/h` dans R1. `saisie-douteux` (1.2.3) ne stocke aucune valeur, et porte un `_ERRC` dont l'`_ERRT` vaut `smw_unitnotallowed` sur `.2.3m³/h` : SMW a lu le nombre `1` et a pris `.2.3m³/h` pour une unité. `saisie-sans-unite` est absent de `_SOBJ`, comme attendu. | Relevé 2 : sous-objets `saisie-*` et erreur `_ERR005aa031…` ; R1 |
| 4 — Monolingual text : stockage, requête et affichage par langue ? | **Le stockage et la requête par langue fonctionnent. L'affichage d'une seule langue n'est pas tranché par cette mesure.** Chaque libellé est stocké comme un sous-objet conteneur `_ML…` portant `_TEXT` et `_LCODE` : `débit volumique` / `fr` et `volumetric flow rate` / `en`. La requête `@fr` (R9) trouve la page de grandeur, et elle compile sur `smw_di_wikipage`, `smw_fpt_text` et `smw_fpt_lcode`. L'affichage (R8) montre les deux langues avec leur code : « débit volumique (fr) », « volumetric flow rate (en) ». Aucun affichage filtré par langue n'a été essayé. | Relevé 2, page de grandeur ; R8, R9 ; compilation debug n° 3 |
| 5 — Un écart porté par Temperature subit-il le décalage d'origine ? | **Oui : le piège est confirmé.** La tolérance, de type Temperature, saisie à 2 °C, stocke `275.15` et s'affiche `275,15 K`, dans la colonne #K comme dans la colonne principale. L'écart, de type Quantity, saisi à 2 °C, stocke `2` et s'affiche `2 °C`, et `2 K` dans la colonne #K. Une recherche `[[…tolérance temp…::2 °C]]` cherche `275.15`. **Une tolérance de température ne peut donc pas employer le type Temperature.** Le résultat est le même sur la propriété verrouillée et sur la libre. | Relevé 2, sujet principal ; R5, R6 ; compilations debug n° 1 et 2 |
| 6 — Le °F est-il reconnu nativement par Temperature ? | **Oui.** Le sous-objet `fahrenheit`, saisi à 50 °F, stocke `283.15`, soit 10 °C exprimés en K, ce qui est exact. Dans R7, il s'affiche `50 °F` dans la colonne principale, `283,15 K` dans la colonne #K et `50 °F` dans la colonne #°F. La valeur principale, -15 °C, est stockée `258.15` et s'affiche `5 °F` et `258,15 K`. | Relevé 2, sous-objet `fahrenheit` ; R7 |

## Écarts et surprises

1. **Une confirmation hors liste a été provoquée, et elle a été refusée.** Pour la compilation de l'étape 4.7, j'avais écrit un script du scratchpad (`debug.sh`) qui appelait `curl` en POST directement, avec `-b ../ecolibre-sgdt-prive/.cookies.txt` et `--data-urlencode`, sur `action=parse`. C'est une lecture, mais elle passe hors des scripts `bin/` et elle lit le fichier de cookies. L'appel a été refusé. Je ne l'ai pas relancé. Les quatre textes étant courts, je les ai passés par `bin/wiki-api.sh` en GET, avec un encodage intégral par `urllib.parse.quote`, au lieu du `--data-urlencode` demandé. Les rendus sont complets : chaque requête SQL est visible jusqu'à `ORDER BY`, et la section « Errors and Warnings » vaut `None`.

2. **Les propriétés de type Temperature n'affichent pas leurs valeurs dans la première unité de `Display units`.**
   - `température 3`, déclarée `°C, K, °F`, s'affiche en `°F` dans la colonne sans unité (R4, R7).
   - `tolérance temp 2`, déclarée `°C, K`, s'affiche en `K` (R5).
   - Les propriétés de type Quantity se comportent autrement : `écart température`, déclarée `°C, K`, s'affiche en `°C` (R6).
   - Chez Temperature, c'est la dernière unité de la liste qui s'affiche, dans les deux cas observés.

   Je ne sais pas si c'est une règle de SMW ou une coïncidence sur deux cas. Le fait `_UNIT` porte bien `°C, K, °F` (tâche 10).

3. **Le verrou est présent dès le premier tour, avant toute requête nommante.** C'est vrai pour P4 comme pour P5, à +68 s et +67 s, et il l'est resté jusqu'au bout. Il ne vient donc pas d'une requête émise trop tôt.

4. **Aucun verrou ne s'est levé avec le temps.** Les six `lot21b` sont verrouillées depuis 21 h 45. Dans `demandes-adminsys.md`, l'entrée dit « aucun dégel après quatorze heures » ; c'est désormais près de vingt-deux heures. L'entrée n'a pas été modifiée, conformément à la consigne.

5. **La file de travaux a été annoncée figée à 11 à deux reprises** (4.1 et 4.4). Le relevé 2 est pourtant identique au relevé 1, et rien n'a manqué au stockage. Je n'ai pas vérifié côté serveur, faute d'accès dans cette tâche.

6. **`_ERRC` vaut 1 et non plus 0.** C'est le résultat voulu par le sous-objet `saisie-douteux`. Tant que la page pompe reste en place, ce compte ne vaudra plus 0 comme référence avant tâche.

7. **Le débit est stocké en m³/s**, unité principale de la propriété : 800 L/h donne `0.00022222222222222`. Son affichage par défaut est en L/h.

8. `.claude/settings.local.json` en fin de tâche : `{"permissions": {"allow": [], "deny": []}}`. Aucune règle. Le refus du point 1 n'a inscrit aucune règle.

## Échanges avec Cyril hors consigne

Aucun, hormis le refus de l'appel `curl` direct (point 1 ci-dessus), donné par la fenêtre de confirmation.

## Questions

**A.** Contexte : le verrou ne gêne ni le stockage ni la requête. Il n'empêche que de modifier la page de propriété elle-même, par exemple pour corriger ses `Display units` ou ses valeurs autorisées. Question : une propriété de production verrouillée dès sa création est-elle acceptable, sachant qu'on ne pourrait plus la modifier tant que le verrou tient ? Suggestion : la règle de CLAUDE.md devrait dire que seul un type résolu faux est éliminatoire, et qu'une propriété ne doit être créée que lorsque sa page est définitive. Le volet 2 de la barrière, tel qu'il est écrit, est à retirer.

**B.** Contexte : sous Temperature, une tolérance de 2 °C est stockée 275,15 K. Question : quel type employer pour les tolérances et les écarts de température du modèle ? Suggestion : Quantity, avec `Corresponds to::1 °C` et `1 K`, comme `écart température`, qui stocke 2 et s'affiche correctement dans les deux unités.

**C.** Contexte : chez Temperature, la première unité de `Display units` n'est pas celle qui s'affiche par défaut (écart 2). Question : faut-il mesurer ce point avant de fixer les `Display units` des températures de production ? Suggestion : oui, par un essai sur une propriété neuve déclarée `K, °C`, pour savoir si c'est bien la dernière unité qui s'affiche.
