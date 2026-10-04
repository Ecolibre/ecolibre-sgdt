# Lot 21, tâche 6 — Second bac à sable

Session du 5 octobre 2026, heure locale ; les horodatages du wiki sont en
UTC et tombent le 4 octobre 2026 entre 22 h 23 et 22 h 29.

**Tâche arrêtée avant l'étape 8.** Les onze pages sont créées et identiques
à leurs fichiers, et les six propriétés portent un `_TYPE` direct. Mais la
page d'item stocke ses valeurs **comme des pages** (type 9, `_wpg`), et non
dans le type déclaré par chaque propriété. L'état est stable sur trois
relevés consécutifs. Sur cette base, le changement de type de l'étape 8 ne
mesurerait pas ce que demande la question 2 : la valeur « 96 » n'est pas
stockée comme un nombre. Comme ce changement ne se fait qu'une fois, je ne
l'ai pas lancé. Voir les questions A et B.

Aucun sujet de production ne figure dans `[[_ERRC::+]]` : le compte est
de 0.

## Étape 0 — État du dépôt

- `git status --porcelain` : sortie vide. Aucune ligne M, A, D, R ni ??.
- `git status --porcelain --untracked-files=all travaux/` : sortie vide.
  Aucun fichier non suivi dans `travaux/`.
- **La suppression des douze pages d'essai du lot 21, faite le 4 octobre
  2026 entre 00 h 12 et 00 h 13 UTC, n'a pas de rapport.** Aucun fichier non
  suivi. Parmi les fichiers suivis, `lot-21-tache1` à `lot-21-tache5` ne la
  rapportent pas non plus : `grep` sur « supprim » ne trouve, dans
  `lot-21-tache5-purge.md`, que la ligne 12, qui constate que les huit
  propriétés supprimées ont disparu de la liste des pages, ainsi que les
  lignes `git status` habituelles. Rien n'a été ajouté.
- `.claude/settings.local.json` au début et à la fin de la tâche :
  `{"permissions": {"allow": [], "deny": []}}`. Aucune règle.

## Étape 1 — Titres libres

Les onze titres rendaient `"missing": true`, d'après un seul appel
`action=query&titles=…`. `ls travaux/lot-21-tache6-mesure.md
pages/Lot21b_essai_*` : « No such file or directory » pour les deux. Le
code de sortie 2 de ce `ls` est donc attendu.

## Étape 2 — Fichiers locaux

Les douze fichiers `pages/Lot21b_essai_01` à `12` ont été écrits avec
l'outil d'écriture de fichier, à partir des blocs de la consigne.

J'ai lu `Module:Nombre` par `bin/wiki-get.sh`, sans le modifier, pour
vérifier que la fonction `virgule` existait. Elle existe : elle ne convertit
que le cas d'un seul point sans virgule, et renvoie tout autre cas inchangé.

## Étape 3 — Créations

`bin/wiki-login.sh` : `Success Cywil`. Résumé de chaque création : `[Lot
21][Tâche 6] Essai en bac à sable — à conserver jusqu'à nouvel ordre`,
avec `--createonly`. Les onze ont répondu `"new": true, "result":
"Success"`.

| N° | Titre | Pageid | Révision | Horodatage (UTC) |
|---|---|---|---|---|
| 01 | Modèle:Test lot21b unités débit | 576 | 1427 | 2026-10-04T22:23:57Z |
| 02 | Modèle:Test lot21b valeur | 577 | 1428 | 2026-10-04T22:24:00Z |
| 03 | Attribut:Test lot21b débit | 578 | 1429 | 2026-10-04T22:24:01Z |
| 04 | Attribut:Test lot21b puissance | 579 | 1430 | 2026-10-04T22:24:02Z |
| 05 | Attribut:Test lot21b température | 580 | 1431 | 2026-10-04T22:24:03Z |
| 06 | Attribut:Test lot21b tolérance temp | 581 | 1432 | 2026-10-04T22:24:04Z |
| 07 | Attribut:Test lot21b écart température | 582 | 1433 | 2026-10-04T22:24:05Z |
| 08 | Attribut:Test lot21b libellé | 583 | 1434 | 2026-10-04T22:24:07Z |
| 09 | Catégorie:Test lot21b classe | 584 | 1435 | 2026-10-04T22:24:08Z |
| 10 | Utilisateur:Cywil/Bac à sable/Lot21b grandeur débit | 585 | 1436 | 2026-10-04T22:24:09Z |
| 11 | Utilisateur:Cywil/Bac à sable/Lot21b pompe | 586 | 1437 | 2026-10-04T22:24:10Z |

## Étape 4 — Attente et purges

**Avant toute purge**, pour respecter la règle « ne purge jamais une page
avant d'en avoir relevé le rendu », j'ai sauvegardé le rendu des deux pages
de bac à sable par `action=parse&prop=text`, en lecture seule. Cette étape
n'était pas dans la consigne : voir « Écarts et surprises », point 1. Ces
rendus sont recopiés à l'étape 7, état 0.

1. `bin/wiki-wait-jobs.sh` :
   ```
   essai 1 : jobs=31
   essai 2 : jobs=31
   essai 3 : jobs=31
   essai 4 : jobs=31
   essai 5 : jobs=31
   FILE FIGEE a 31 travaux — inutile d'attendre davantage
   sortie=2
   ```
2. Purge de `Lot21b pompe` :
   ```
   {"batchcomplete": true, "purge": [{"ns": 2, "title": "Utilisateur:Cywil/Bac à sable/Lot21b pompe", "purged": true, "linkupdate": true}]}
   sortie=0
   ```
3. Purge de `Lot21b grandeur débit` :
   ```
   {"batchcomplete": true, "purge": [{"ns": 2, "title": "Utilisateur:Cywil/Bac à sable/Lot21b grandeur débit", "purged": true, "linkupdate": true}]}
   sortie=0
   ```
4. `bin/wiki-wait-jobs.sh` : cinq fois `jobs=31`, puis `FILE FIGEE a 31
   travaux — inutile d'attendre davantage`, `sortie=2`.
5. Seconde purge de `Lot21b pompe` : même réponse qu'au point 2
   (`purged: true`, `linkupdate: true`), `sortie=0`.

## Étape 5 — Faits des six propriétés

**Premier passage**, juste après l'étape 4 : chacune des six pages ne
portait que deux clés, `_CHGPRO` et `_SKEY`. Aucun `_TYPE` direct. Le JSON
de `_CHGPRO` contenait les valeurs attendues : `_TYPE` `#_qty`, `#_num`,
`#_tem`, `#_tem`, `#_qty`, `#_mlt_rec`, ainsi que `_CONV`, `_UNIT` et
`Property_description_FR`.

**Relance** de `bin/wiki-wait-jobs.sh` :
```
essai 1 : jobs=31
essai 2 : jobs=31
essai 3 : jobs=31
essai 4 : jobs=24
essai 5 : jobs=24
essai 6 : jobs=24
essai 7 : jobs=24
essai 8 : jobs=24
FILE FIGEE a 24 travaux — inutile d'attendre davantage
sortie=2
```

**Second passage**. J'ai filtré la clé `_CHGPRO` à l'affichage, par
`grep -v`, sans vérifier si elle était encore présente.

```
Attribut:Test lot21b débit
Property_description_FR -> ["Propriété d'essai du lot 21 : un débit, dont les unités sont déclarées par un modèle transclus. Ne pas supprimer sans consigne."]
_CONV -> ['1 m³/s, m3/s', '3600 m³/h, m3/h', '3600000 L/h, l/h']
_MDAT -> ['1/2026/10/4/22/24/1/0']
_SKEY -> ['Test lot21b débit']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['L/h, m³/h, m³/s']

Attribut:Test lot21b puissance
Property_description_FR -> ["Propriété d'essai du lot 21 : créée en type Number pour mesurer ce que produit un changement de type vers Quantity sur une propriété qui porte déjà une valeur. Ne pas supprimer sans consigne."]
_MDAT -> ['1/2026/10/4/22/24/2/0']
_SKEY -> ['Test lot21b puissance']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_num']

Attribut:Test lot21b température
Property_description_FR -> ["Propriété d'essai du lot 21 : une température absolue, pour mesurer les unités reconnues nativement par le type Temperature. Ne pas supprimer sans consigne."]
_MDAT -> ['1/2026/10/4/22/24/3/0']
_SKEY -> ['Test lot21b température']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_tem']
_UNIT -> ['°C, K, °F']

Attribut:Test lot21b tolérance temp
Property_description_FR -> ["Propriété d'essai du lot 21 : un écart de température porté par le type Temperature, pour mesurer si le décalage d'origine lui est appliqué à tort. Ne pas supprimer sans consigne."]
_MDAT -> ['1/2026/10/4/22/24/4/0']
_SKEY -> ['Test lot21b tolérance temp']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_tem']
_UNIT -> ['°C, K']

Attribut:Test lot21b écart température
Property_description_FR -> ["Propriété d'essai du lot 21 : un écart de température porté par le type Quantity, où le kelvin et le degré Celsius ont le même facteur et aucun décalage. Ne pas supprimer sans consigne."]
_CONV -> ['1 °C, degré Celsius', '1 K, kelvin']
_MDAT -> ['1/2026/10/4/22/24/5/0']
_SKEY -> ['Test lot21b écart température']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['°C, K']

Attribut:Test lot21b libellé
Property_description_FR -> ["Propriété d'essai du lot 21 : libellé d'une grandeur dans une langue, pour mesurer le type Monolingual text. Ne pas supprimer sans consigne."]
_MDAT -> ['1/2026/10/4/22/24/7/0']
_SKEY -> ['Test lot21b libellé']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_mlt_rec']
```

Les six propriétés portent le type demandé.

**Attention à l'ordre :** les deux purges de l'étape 4 ont eu lieu
**avant** que ces `_TYPE` deviennent directs. Dans la tâche 2, l'ordre
était inverse : les faits des propriétés avaient été vus directs avant les
purges. Voir « Écarts et surprises », point 2.

## Étape 6 — `browsebysubject` (le relevé qui fait foi)

L'état stocké a changé au cours de la tâche. Je donne trois relevés, dans
l'ordre où je les ai faits.

### Relevé 6.1 — juste après l'étape 5, avant toute action hors consigne

**`Cywil/Bac_à_sable/Lot21b_pompe#2##`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_débit | — | `[]` (dataitem vide) |
| Test_lot21b_puissance | — | `[]` (dataitem vide) |
| Test_lot21b_température | — | `[]` (dataitem vide) |
| Test_lot21b_tolérance_temp | — | `[]` (dataitem vide) |
| Test_lot21b_écart_température | — | `[]` (dataitem vide) |
| _ASK | 9 | 9 requêtes |
| _INST | 9 | `Test_lot21b_classe#14##` |
| _MDAT | 6 | `1/2026/10/4/22/24/10/0` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe` |
| _SOBJ | 9 | `…#2##spec`, `…#2##fahrenheit`, `…#2##saisie-point`, `…#2##saisie-virgule`, `…#2##saisie-douteux` |

Sous-objets `spec`, `saisie-point`, `saisie-virgule` : `Test_lot21b_débit
-> []` et `_SKEY`. Sous-objet `fahrenheit` : `Test_lot21b_température ->
[]` et `_SKEY`.

Sous-objet `saisie-douteux` :

| Propriété | Type | Valeur |
|---|---|---|
| _ERRC | 9 | `Cywil/Bac_à_sable/Lot21b_pompe#2##_ERR005aa03162eebf6ea2cb0efcb936b12b` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe#saisie-douteux` |

L'erreur référencée, `…#2##_ERR005aa03162eebf6ea2cb0efcb936b12b` :
- `_ERRP` : `Test_lot21b_débit#102##`
- `_ERRT` : `[2,"smw_unitnotallowed",".2.3m³\/h"]`

Requête R8 stockée à ce moment : `[[Test lot21b libellé:: <q>[[Text::débit
volumique]] [[Language code::fr]]</q> ]]`, compilée comme une condition
Monolingual text.

J'ai cherché le même contenu autrement. `--facts` sur la page pompe et
`browsebysubject` sans `formatversion=2` rendent les mêmes `[]`.
`action=ask` sur `[[Test lot21b débit::+]]` rend `[]`.

### Relevé 6.2 — après une purge supplémentaire des deux pages, hors consigne

Il s'agit d'une purge combinée des deux pages (`purged: true`,
`linkupdate: true` pour chacune), puis de `bin/wiki-wait-jobs.sh` : cinq
fois `jobs=6`, `FILE FIGEE a 6 travaux`, sortie 2.

**`Cywil/Bac_à_sable/Lot21b_pompe#2##`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_débit | 9 | `800_L/h#0##` |
| Test_lot21b_puissance | 9 | `96#0##` |
| Test_lot21b_température | 9 | `-15_°C#0##` |
| Test_lot21b_tolérance_temp | 9 | `2_°C#0##` |
| Test_lot21b_écart_température | 9 | `2_°C#0##` |
| _ASK | 9 | 9 requêtes |
| _INST | 9 | `Test_lot21b_classe#14##` |
| _MDAT | 6 | `1/2026/10/4/22/24/10/0` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe` |
| _SOBJ | 9 | `Cywil/Bac_à_sable/Lot21b_pompe#2##spec` |
| _SOBJ | 9 | `Cywil/Bac_à_sable/Lot21b_pompe#2##fahrenheit` |
| _SOBJ | 9 | `Cywil/Bac_à_sable/Lot21b_pompe#2##saisie-point` |
| _SOBJ | 9 | `Cywil/Bac_à_sable/Lot21b_pompe#2##saisie-virgule` |
| _SOBJ | 9 | `Cywil/Bac_à_sable/Lot21b_pompe#2##saisie-douteux` |

**`Cywil/Bac_à_sable/Lot21b_pompe#2##spec`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_débit | 9 | `750_L/h#0##` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe#spec` |

**`Cywil/Bac_à_sable/Lot21b_pompe#2##fahrenheit`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_température | 9 | `50_°F#0##` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe#fahrenheit` |

**`Cywil/Bac_à_sable/Lot21b_pompe#2##saisie-point`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_débit | 9 | `0,9_m³/h#0##` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe#saisie-point` |

**`Cywil/Bac_à_sable/Lot21b_pompe#2##saisie-virgule`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_débit | 9 | `0,9_m³/h#0##` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe#saisie-virgule` |

**`Cywil/Bac_à_sable/Lot21b_pompe#2##saisie-douteux`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_débit | 9 | `1.2.3_m³/h#0##` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe#saisie-douteux` |

Le `_ERRC` du relevé 6.1 a disparu, et il n'y a plus d'entrée `_ERR…`.

**`Cywil/Bac_à_sable/Lot21b_grandeur_débit#2##`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_libellé | 9 | `Débit_volumique@fr#0##` |
| Test_lot21b_libellé | 9 | `Volumetric_flow_rate@en#0##` |
| _MDAT | 6 | `1/2026/10/4/22/24/9/0` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b grandeur débit` |

La majuscule initiale (« Débit », « Volumetric ») est la normalisation d'un
titre de page. Elle confirme que la valeur est traitée en type Page.

Dans le relevé 6.1, `browsebysubject` n'avait pas été fait sur `Lot21b
grandeur débit` : il est sauvegardé (`bbs_grandeur_1.json`, dans le
scratchpad), mais je ne l'ai pas lu avant la purge supplémentaire.

### Relevé 6.3 — après un nouveau `bin/wiki-wait-jobs.sh` et une nouvelle purge de la pompe, hors consigne

Le `bin/wiki-wait-jobs.sh` a affiché cinq fois `jobs=6`, `FILE FIGEE`,
sortie 2. La purge a répondu `purged: true`, `linkupdate: true`.

Les valeurs sont identiques au relevé 6.2 sur la page et sur ses cinq
sous-objets : type 9 partout. Le relevé `--facts` final, à 22:28:45 UTC,
donne les mêmes valeurs.

La requête R8 stockée est désormais `[[Test lot21b libellé::Débit
volumique@fr]]`, compilée comme une condition sur une page, avec un nouveau
hash `_QUERY4444d053…`. Au relevé 6.1, elle était compilée en Monolingual
text.

**Le sous-objet `saisie-sans-unite` n'existe dans aucun des trois
relevés** : il est absent de `_SOBJ`.

## Étape 7 — Rendu de la page d'item

Aucun avertissement de Semantic MediaWiki n'apparaît en tête de page, ni
nulle part dans le texte extrait, dans aucun des trois états.

### État 0 — avant toute purge (cache `20261004222416`, révision 1437)

- R1 :
  | Sujet | Test lot21b débit |
  |---|---|
  | Cywil/Bac à sable/Lot21b pompe | 800 L/h |
  | Cywil/Bac à sable/Lot21b pompe#saisie-douteux | 1.2.3 m³/h |
  | Cywil/Bac à sable/Lot21b pompe#saisie-point | 0,9 m³/h |
  | Cywil/Bac à sable/Lot21b pompe#saisie-virgule | 0,9 m³/h |
  | Cywil/Bac à sable/Lot21b pompe#spec | 750 L/h |
- R2 :
  | Sujet | Test lot21b débit |
  |---|---|
  | Cywil/Bac à sable/Lot21b pompe | 800 L/h |
- R3 : `Cywil/Bac à sable/Lot21b pompe`
- R4 :
  | Sujet | Test lot21b température | Test lot21b température (#K) | Test lot21b température (#°F) |
  |---|---|---|---|
  | Cywil/Bac à sable/Lot21b pompe | -15 °C | -15 °C | -15 °C |
  | Cywil/Bac à sable/Lot21b pompe#fahrenheit | 50 °F | 50 °F | 50 °F |
- R5 :
  | Sujet | Test lot21b tolérance temp | (#K) |
  |---|---|---|
  | Cywil/Bac à sable/Lot21b pompe | 2 °C | 2 °C |
- R6 :
  | Sujet | Test lot21b écart température | (#K) |
  |---|---|---|
  | Cywil/Bac à sable/Lot21b pompe | 2 °C | 2 °C |
- R7 :
  | Sujet | Test lot21b libellé |
  |---|---|
  | Cywil/Bac à sable/Lot21b grandeur débit | Débit volumique@fr / Volumetric flow rate@en |
- R8 : `Cywil/Bac à sable/Lot21b grandeur débit`
- R9 :
  | Sujet | Test lot21b puissance |
  |---|---|
  | Cywil/Bac à sable/Lot21b pompe | 96 |

Les en-têtes de colonne #K et #°F s'affichent tous sous le nom nu de la
propriété ; j'ai ajouté entre parenthèses l'indication de la colonne. Les
conversions vers K et °F n'ont **pas** eu lieu : la valeur est recopiée à
l'identique dans chaque colonne. Cela concorde avec un stockage en type
Page.

Page `Lot21b grandeur débit`, état 0 : seule la phrase d'introduction
s'affiche (cache `20261004222409`).

### État 1 — après les purges de l'étape 4 (cache `20261004222612`)

- R1 : AUCUN RÉSULTAT
- R2 : AUCUN RÉSULTAT
- R3 : `Cywil/Bac à sable/Lot21b pompe`
- R4 : AUCUN RÉSULTAT
- R5 : AUCUN RÉSULTAT
- R6 : AUCUN RÉSULTAT
- R7, recopié tel qu'extrait :
  ```
  Sujet | Test lot21b libellé |
  Cywil/Bac à sable/Lot21b grandeur débit | Cywil/Bac à sable/Lot21b grandeur débit
  Cywil/Bac à sable/Lot21b grandeur débit |
  ```
- R8 : AUCUN RÉSULTAT
- R9 : AUCUN RÉSULTAT

### État 2 — après les purges hors consigne (cache `20261004222716`), état final

Le contenu de R1 à R9 est identique, ligne pour ligne, à l'état 0 :
mêmes lignes, mêmes valeurs, aucune conversion dans les colonnes #K et
#°F.

## Étape 8 — Changement de type

**Non faite.** Aucune des six sous-étapes n'a été lancée, et
`Attribut:Test lot21b puissance` est toujours à la révision 1430 (type
Number). Motif : la valeur « 96 » est stockée en type Page (relevés 6.2 et
6.3), pas en Number. Mesurer « ce que devient la valeur » après un passage
Number → Quantity n'a de sens qu'à partir d'une valeur Number. Voir la
question B.

## Vérifications

**a. Celle qui tranche.** Elle est faite pour l'étape 6, en trois relevés,
ci-dessus. Elle n'existe pas pour l'étape 8.5, puisque l'étape 8 n'a pas
été faite.

**b. Contenu.** `bin/wiki-verify.sh` a rendu `IDENTIQUE`, sortie 0, pour
les onze pages :
```
IDENTIQUE : Modèle:Test lot21b unités débit
IDENTIQUE : Modèle:Test lot21b valeur
IDENTIQUE : Attribut:Test lot21b débit
IDENTIQUE : Attribut:Test lot21b puissance
IDENTIQUE : Attribut:Test lot21b température
IDENTIQUE : Attribut:Test lot21b tolérance temp
IDENTIQUE : Attribut:Test lot21b écart température
IDENTIQUE : Attribut:Test lot21b libellé
IDENTIQUE : Catégorie:Test lot21b classe
IDENTIQUE : Utilisateur:Cywil/Bac à sable/Lot21b grandeur débit
IDENTIQUE : Utilisateur:Cywil/Bac à sable/Lot21b pompe
```
La vérification sur le fichier 12 est sans objet : aucune écriture n'a eu
lieu à l'étape 8.

**c. Erreurs.** `action=ask` sur `[[_ERRC::+]]`, avec `limit=500`, rend
`[]`. Comme l'entrée 53 dit `action=ask` peu fiable pour ce compte, j'ai
refait la mesure par un rendu en ligne, `action=parse&text=` avec un `#ask`
`format=list` et un `#ask` `format=count`, sans rien enregistrer. Rendu :
`AUCUN RESULTAT 0`. Le compte est donc de **0**. Aucun sujet de production,
et aucun sujet Lot21b non plus : le `_ERRC` du relevé 6.1 a disparu avec la
purge suivante.

**d. Liens et catégories de la page d'item**, `action=parse&prop=links|categories`.
- Catégories : `Test_lot21b_classe`, et elle seule. Elle est posée par la
  page elle-même.
- Liens vers des pages **inexistantes**, au nombre de dix, tous dans
  l'espace principal : `800 L/h`, `1.2.3 m³/h`, `0,9 m³/h`, `750 L/h`,
  `-15 °C`, `50 °F`, `2 °C`, `Débit volumique@fr`, `Volumetric flow
  rate@en`, `96`. Ce sont les valeurs stockées en type Page, que les
  tableaux des requêtes affichent comme liens. C'est une conséquence du
  stockage en Page, et non une syntaxe non échappée.
- Les autres liens pointent vers des pages existantes : la page elle-même,
  `Lot21b grandeur débit` et six pages `Attribut:`.

## Les six questions

| N° | Question | Réponse | Relevé qui la fonde |
|---|---|---|---|
| 1 | Un filtre de classe écarte-t-il les sous-objets ? | **Oui.** | Stocké : `_INST` `Test_lot21b_classe#14##` est porté par la page seule, et absent des cinq sous-objets (relevés 6.1, 6.2 et 6.3). Rendu, états 0 et 2 : R1 rend la page et quatre sous-objets, R2 la page seule, R3 la page seule. Cette conclusion ne dépend pas du type des valeurs. |
| 2 | Changer le type d'une propriété portant une valeur déclenche-t-il le verrou ; que devient la valeur ? | **Non tranchée par cette mesure.** | Étape 8 non faite (question B). |
| 3 | « Nombre normalisé + unité » donne-t-il une annotation valide ; une unité vide empêche-t-elle l'annotation ? | **Première moitié : non tranchée par cette mesure. Seconde moitié : oui.** | La normalisation a bien lieu au niveau du texte : `saisie-point` stocke `0,9_m³/h`, identique à `saisie-virgule`, et `1.2.3` reste inchangé (relevé 6.2). Mais ces valeurs sont stockées en Page, pas en Quantity. Au relevé 6.1, les valeurs Quantity sont illisibles (`[]`) ; seul `1.2.3` y donnait `smw_unitnotallowed` sur `.2.3m³/h`. Unité vide : le sous-objet `saisie-sans-unite` est absent de `_SOBJ` dans les trois relevés. |
| 4 | Monolingual text : stockage, requête, affichage par langue ? | **Non tranchée par cette mesure.** | Stocké en Page : `Débit_volumique@fr`, `Volumetric_flow_rate@en` (relevé 6.2). Seul indice : au relevé 6.1, R8 avait été compilée par SMW en `Text` + `Language code`, sans qu'on puisse en lire le résultat. |
| 5 | Un écart porté par Temperature subit-il le décalage d'origine ? | **Non tranchée par cette mesure.** | `2_°C` est stocké en Page (relevé 6.2), sans conversion dans R5 (états 0 et 2). |
| 6 | Le °F est-il reconnu nativement par Temperature ? | **Non tranchée par cette mesure.** | `50_°F` est stocké en Page (relevé 6.2). Au relevé 6.1, la valeur était illisible (`[]`) mais sans `_ERRC` sur `fahrenheit`. Je ne sais pas si cette absence d'erreur vaut acceptation. |

## Écarts et surprises

1. **Relevé de rendu ajouté avant l'étape 4.** La règle impérative « ne
   purge jamais une page avant d'en avoir relevé le rendu » et l'ordre de
   l'étape 4, qui purge avant l'étape 7, se contredisaient. J'ai respecté
   les deux en sauvegardant le rendu des deux pages avant la première purge,
   en lecture seule. C'est l'état 0 de l'étape 7.

2. **Les valeurs de la page d'item ne sont pas stockées dans le type
   déclaré.** Ce qui suit est **un constat, pas un diagnostic établi** :
   - Les six propriétés portent leur `_TYPE` direct depuis le second passage
     de l'étape 5.
   - La page d'item, elle, a connu trois états stockés.
     - Création (22:24:10) : rendu sans conversion (état 0).
     - Après les purges de l'étape 4, qui ont eu lieu quand `_TYPE` n'était
       encore que dans `_CHGPRO` : des dataitems vides, un `_ERRC` de
       Quantity sur `1.2.3`, et R8 compilée en Monolingual text (relevé
       6.1). Le traitement a donc vu, au moins en partie, les vrais types,
       alors que la lecture n'a rien rendu.
     - Après deux purges de plus, faites alors que `_TYPE` était direct :
       tout en type Page (relevés 6.2 et 6.3), état stable.
   - Une hypothèse, non vérifiée : un cache du type de propriété, côté web,
     a retenu le type par défaut (Page) depuis la première analyse de la
     page d'item, alors que la file de travaux, elle, voyait les vrais
     types.
   - La consigne place les purges (étape 4) avant la vérification des types
     (étape 5). La tâche 2 faisait l'inverse et avait obtenu des valeurs
     Quantity lisibles. Je ne sais pas si cet ordre suffit à expliquer
     l'écart : la troisième purge, faite après que les types étaient
     directs, a quand même donné du Page.
   - Je n'ai trouvé dans les *Limites connues* aucune entrée sur ce
     phénomène. La recherche a porté sur « cache », « dataitem »,
     « _CHGPRO » et « propagation ».

3. **Actions hors consigne**, toutes en lecture seule ou de purge :
   - deux purges supplémentaires de `Lot21b pompe` et une de `Lot21b
     grandeur débit` ;
   - deux `bin/wiki-wait-jobs.sh` supplémentaires ;
   - des lectures (`action=parse`, `action=ask`, `action=smwbrowse`) ;
   - la lecture de `Module:Nombre`.

   Je les ai faites au titre de la règle « un relevé vide ne se conclut
   pas ». Aucune écriture de contenu hors consigne.

4. **Demandes de confirmation hors de la liste annoncée.** Il y en a eu
   probablement pour :
   - les lancements de `python3` sur deux scripts du scratchpad (`rendu.py`
     pour extraire le texte du rendu, `bbs.py` pour tabuler
     `browsebysubject`) ;
   - un `sed -n` de lecture de l'en-tête de `bin/wiki-verify.sh` ;
   - des `ls` et des `cat` ;
   - un `date -u`.

5. **`bin/wiki-wait-jobs.sh`** a annoncé `FILE FIGEE` à chacun de ses six
   appels, à 31, 24 puis 6 travaux, avec la sortie 2. Conforme à ce
   qu'annonçait la consigne.

6. Dans le relevé 6.1, je n'ai pas tabulé la page `Lot21b grandeur débit` :
   le JSON est sauvegardé dans le scratchpad, mais non lu avant la purge
   suivante. Le relevé 6.1 manque donc pour la question 4.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

**A.** *Contexte* : les six propriétés portent leur `_TYPE` direct, mais
la page d'item stocke ses valeurs en type Page, et l'état est stable après
trois purges. Tant qu'il en est ainsi, aucune des questions 2 à 6 ne peut
être tranchée par ce bac à sable. *Question* : comment obtenir un
stockage dans les types déclarés ? *Suggestion* : une consigne courte,
en deux temps.
- D'abord, toi, côté serveur :
  `SERVER_NAME=wiki.ecolibre.org php maintenance/runJobs.php`, pour vider
  réellement la file.
- Ensuite, une purge de `Lot21b pompe` et de `Lot21b grandeur débit`, puis
  `browsebysubject`.

Si les valeurs restent en Page, la piste suivante serait une modification
nulle de la page d'item, ou une demande à fuzzy sur le cache d'objets de
SMW. Pour un futur essai, créer les propriétés, attendre que leur `_TYPE`
soit direct, et seulement ensuite créer la page d'item.

**B.** *Contexte* : l'étape 8 n'a pas été lancée, et `Attribut:Test lot21b
puissance` reste en Number (révision 1430). Les fichiers 04 et 12 sont
prêts. *Question* : faut-il la lancer une fois la question A résolue, sur
une valeur `96` vérifiée de type 1 (Number) dans `browsebysubject` ?
*Suggestion* : oui, telle que la consigne la décrit, avec pour
précondition explicite ce relevé de type 1.

**C.** *Contexte* : la suppression des douze pages du premier essai, le 4
octobre 2026 entre 00 h 12 et 00 h 13 UTC, n'a de rapport ni suivi ni non
suivi. *Question* : faut-il la reconstituer à partir de la transcription de
la session concernée (`~/.claude/projects/`) et des journaux de
suppression du wiki ? *Suggestion* : oui, dans une tâche de rattrapage
dédiée, en lecture seule.
