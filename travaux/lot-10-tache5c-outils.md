# Lot 10 — tâche 5, bloc 3 : création des quatre outils restants

Date : 2026-08-29. Dix pages créées, une par une, en série stricte :
4 items organiques, 3 items référencés, 3 items physiques.

Deux outils sur cinq restent incomplets faute d'étiquette relevée — le gros
fer à souder et le boîtier de cycles : leurs organiques sont créés, leurs
référencés et physiques non. État légitime du modèle.

---

## Décision de cadrage — Practice_domain sur les organiques

**Practice_domain n'est pas écrit sur les quatre items organiques.** La
propriété `Attribut:Practice_domain` a pour domaine `Category:Functional item`
(cardinalité `multiple`, type `Text`) : elle ne s'écrit que sur les procédés.
Le modèle `Organic item` n'a pas ce champ — un `|Practice_domain=` y serait
inerte. Le cadrage §2.4 tranche explicitement. Les valeurs Practice_domain
figurant dans la consigne du bloc 3 étaient une erreur (confirmé par Cyril en
conversation), à ne pas appliquer.

**Point à trancher en clôture de lot** : la page fonction « Maintenir en
position » (002L) n'a aucun `Practice_domain`. C'est peut-être délibéré — un
procédé générique n'appartient à aucun domaine en propre. Non modifié dans ce
bloc. Les trois autres fonctions visées en portent déjà un : « Braser tendre »
(002I) → `électronique, plomberie` ; « Souder par points » (002J) →
`électronique, énergie` ; « Mesurer une grandeur électrique » (002K) →
`électronique, électricité, énergie`.

---

## Étape 1 — lectures préalables (aucune écriture)

### a) Dernier Item_ref

```
Machine à souder par points SUNKKO 709AD -> 002N
Machine à souder par point               -> 002M
Maintenir en position                    -> 002L
```
→ dernier Item_ref = **002N**. Conforme au garde-fou.

Base 36 vérifiée via `{{#invoke:Base36|next|…}}` :
`next(002N)=002O`, `next(002O)=002P`, `next(002Z)=0030`, `next(0009)=000A`.
Séquentiel simple sur l'alphabet `0-9A-Z`, aucun saut.

### b) Dernier Inventory_number du site CWL

```
Machine à souder par point — Atelier appartement (CWL-0008) -> 0008
```
→ dernier = **0008** (seul exemplaire CWL avant ce bloc, `0007` retiré au
bloc 1). Conforme au garde-fou. Suite Base 36 : `0009`, `000A`, `000B`.

### c) Gabarit organique — Machine à souder par point

```
{{Organic item
|Item_ref=002M
|Item_description=Outil qui assemble deux pièces métalliques par fusion locale du métal de base, sous l'effet Joule, entre deux électrodes, sans apport de matière.
|Realizes_function=Souder par points
}}
```
Champs réels du modèle `Organic item` : `Item_ref`, `Item_description`,
`Realizes_function` (+sep=,), `Part_of`, `External_classification`,
`Wanted_by`. **Pas de Practice_domain.**

### d) Gabarit référencé — Machine à souder par points SUNKKO 709AD

```
{{Referenced item
|Item_ref=002N
|Item_description=Machine de soudage par points à transformateur d'inversion, pour batteries.
|Corresponds_to_organic=Machine à souder par point
|Max_thickness=0,2
|Materials_worked=acier nickelé
|Procurement_route=acheté
|Manufacturer=SUNKKO
|Manufacturer_reference=709AD
|Power_rating=3200
}}
```

### e) Gabarit physique — Machine à souder par point — Atelier appartement (CWL-0008)

```
{{Physical item
|site_code=CWL
|ref_number=0008
|model_link=Machine à souder par points SUNKKO 709AD
|Owned_by=CWL
|Located_at=Atelier appartement
|description=Rangée dans une caisse, dans l'appartement.
}}
```

### f) prop=info sur les dix titres à créer

Les dix `MISSING`. Aucun conflit.

### Fonctions cibles (déjà en place, non modifiées)

`Braser tendre` (002I), `Mesurer une grandeur électrique` (002K),
`Maintenir en position` (002L) — toutes existent. `Realizes_function`
pointera sur elles.

### Wikidata retenu (External_classification)

Recherché sur wikidata.org, deux résultats évidents et vérifiés :
- `Fer à souder` → **Q623402** (« soldering iron — hand tool used in soldering »)
- `Multimètre` → **Q189996** (« multimeter — electronic measuring instrument… »)

Laissé vide, par doute, pour `Boîtier de cycles charge/décharge` et
`Support de maintien de cellule` — pas d'item Wikidata évident.

### Garde-fou d'arrêt — non déclenché

| Condition | Attendu | Constaté |
|---|---|---|
| Dernier Item_ref | 002N | 002N ✅ |
| Dernier Inventory_number CWL | 0008 | 0008 ✅ |
| Les 10 titres | absents | 10 × MISSING ✅ |

---

## Étape 2 à 4 — les dix créations, en série

`bin/wiki-login.sh` relancé avant la vague 1 (`Success Cywil`). Après **chaque**
création : `browsebysubject` sur la page + requête `[[Item_ref::<ref>]]` pour
confirmer l'unicité **avant** de calculer la référence suivante. Aucune
référence préparée d'avance, aucune écriture en parallèle.

### Vague 1 — items organiques

| # | Page | revid | Item_ref stocké | Realizes_function | External_classification |
|---|---|---|---|---|---|
| 1 | Fer à souder | 1098 | **002O** | Braser_tendre | Q623402 |
| 2 | Multimètre | 1099 | **002P** | Mesurer_une_grandeur_électrique | Q189996 |
| 3 | Boîtier de cycles charge/décharge | 1100 | **002Q** | Mesurer_une_grandeur_électrique | — |
| 4 | Support de maintien de cellule | 1101 | **002R** | Maintenir_en_position | — |

Contenu type (page 1) :
```
{{Organic item
|Item_ref=002O
|Item_description=Outil à panne chauffante qui fond un métal d'apport fusible pour assembler des pièces sans fondre le métal de base.
|Realizes_function=Braser tendre
|External_classification=https://www.wikidata.org/wiki/Q623402
}}
```
Descriptions (ce que l'outil FAIT, aucune marque) :
- **Multimètre** : « Appareil de mesure électrique portable réunissant
  plusieurs fonctions — au moins tension, intensité et résistance — dans un
  même boîtier commutable. »
- **Boîtier de cycles charge/décharge** : « Appareil qui charge puis décharge
  une cellule sous courant contrôlé en relevant tension et capacité, pour
  mesurer l'état de santé d'un accumulateur. »
- **Support de maintien de cellule** : « Monture qui tient une cellule ou un
  accumulateur en position et offre des contacts stables pendant qu'un autre
  outil opère ou mesure. »

Chaque `browsebysubject` : `_INST -> Organic_item#14##`, aucune clé `_ERR`,
aucun `Practice_domain`.

### Vague 2 — items référencés

| # | Page | revid | Item_ref stocké | Corresponds_to_organic |
|---|---|---|---|---|
| 5 | Fer à souder Quicko T12-942 | 1102 | **002S** | Fer_à_souder |
| 6 | Multimètre GVDA GD112C | 1103 | **002T** | Multimètre |
| 7 | Mini banc de mesure Ecolibre | 1104 | **002U** | Support_de_maintien_de_cellule |

**5 — Fer à souder Quicko T12-942**
```
{{Referenced item
|Item_ref=002S
|Item_description=Station de soudage à panne chauffante de type T12 livrée avec son alimentation dédiée. La puissance indiquée (96 W) est celle de cette alimentation (24 V, 4 A), et non une consommation mesurée du fer.
|Corresponds_to_organic=Fer à souder
|Procurement_route=acheté
|Manufacturer=Quicko
|Manufacturer_reference=T12-942
|Power_rating=96
}}
```
Faits : `Power_rating -> ['96']` (pas « 96 W », pas « 96,0 »),
`Procurement_route -> ['acheté']`, `Manufacturer -> ['Quicko#0##']`,
`Manufacturer_reference -> ['T12-942']`. Aucun `_ERR`.

**6 — Multimètre GVDA GD112C**
```
{{Referenced item
|Item_ref=002T
|Item_description=Multimètre numérique de poche à sélection automatique de calibre. Il offre un mode de mesure de tension à basse impédance (LowZ) qui écarte les tensions fantômes ; ce mode est une manière de mesurer, pas une grandeur mesurée.
|Corresponds_to_organic=Multimètre
|Procurement_route=acheté
|Manufacturer=GVDA
|Manufacturer_reference=GD112C
|Measured_quantities=tension, intensité, fréquence, résistance, température
}}
```
Faits : `Measured_quantities -> ['tension', 'intensité', 'fréquence',
'résistance', 'température']` — **5 valeurs distinctes, aucun espace parasite
en tête** (le `#arraymap` du modèle rogne). Pas de « LowZ » en grandeur
mesurée (documenté en `Item_description` seulement). Aucun `_ERR`.

**7 — Mini banc de mesure Ecolibre**
```
{{Referenced item
|Item_ref=002U
|Item_description=Conception Ecolibre. Maintient une cellule en position et offre des points de raccordement pour la mesure de tension et de courant.
|Corresponds_to_organic=Support de maintien de cellule
|Maturity_level=Prototype
|Procurement_route=autoproduit
}}
```
Faits : `Procurement_route -> ['autoproduit']` — relu caractère par
caractère : `a-u-t-o-p-r-o-d-u-i-t`, participe passé, accordé avec « acheté ».
`Maturity_level -> ['Prototype']`. Pas de `Manufacturer`. Pas de fait
`Design_source` (champ laissé vide — réceptacle du bloc 2, dépôt de
conception inexistant). Aucun `_ERR`.

### Vague 3 — items physiques

| # | Titre | revid | Inventory_ref | Instance_of | Owned_by |
|---|---|---|---|---|---|
| 8 | Fer à souder — Atelier appartement (CWL-0009) | 1105 | **CWL-0009** | Fer_à_souder_Quicko_T12-942 | CWL |
| 9 | Multimètre — Atelier appartement (CWL-000A) | 1106 | **CWL-000A** | Multimètre_GVDA_GD112C | CWL |
| 10 | Mini banc de mesure — Atelier appartement (CWL-000B) | 1107 | **CWL-000B** | Mini_banc_de_mesure_Ecolibre | CWL |

Contenu type (page 8) :
```
{{Physical item
|site_code=CWL
|ref_number=0009
|model_link=Fer à souder Quicko T12-942
|Located_at=Atelier appartement
|Owned_by=CWL
}}
```
Pour les trois : `Inventory_site -> ['CWL']`, `Located_at ->
['Atelier_appartement#0##']`, `_INST -> Physical_item#14##`, **pas de
`physical_parent`** (champ laissé vide, aucun contenant inventorié). Aucun
`_ERR`.

---

## Tableau d'unicité des références

### Item_ref — requête `[[Item_ref::+]]|?Item_ref|limit=200`

**101 valeurs, 101 distinctes, aucun doublon.** Les sept nouvelles
apparaissent une fois chacune :

| Ref | Page |
|---|---|
| 002O | Fer à souder |
| 002P | Multimètre |
| 002Q | Boîtier de cycles charge/décharge |
| 002R | Support de maintien de cellule |
| 002S | Fer à souder Quicko T12-942 |
| 002T | Multimètre GVDA GD112C |
| 002U | Mini banc de mesure Ecolibre |

### Inventory_number — requête `[[Inventory_site::CWL]]`

| N° | Inventory_ref | Page |
|---|---|---|
| 0008 | CWL-0008 | Machine à souder par point — Atelier appartement (CWL-0008) |
| 0009 | CWL-0009 | Fer à souder — Atelier appartement (CWL-0009) |
| 000A | CWL-000A | Multimètre — Atelier appartement (CWL-000A) |
| 000B | CWL-000B | Mini banc de mesure — Atelier appartement (CWL-000B) |

Chaque numéro une seule fois. **`0007` absent** (retiré au bloc 1, jamais
réattribué).

### Erreurs SMW — requête `[[_ERRC::+]]`

Une seule page : `Attribut:INSEE code` — **anomalie préexistante** (lot 7,
connue, consignée dans CLAUDE.md). **Aucune des dix pages de ce bloc.**

---

## Étape 5 — vérifications de rendu

File de travaux SMW **figée à 9 jobs** (`bin/wiki-wait-jobs.sh` : « FILE FIGEE
à 9 travaux »). Rappel : une file qui ne descend pas n'est pas une preuve
d'échec d'écriture — et les requêtes `action=ask` directes, elles, sont à jour.

### Page « Fer à souder » (organique) — rendue après purge

Bloc **« Implémenté par (Solution technique) »** →
**« Fer à souder Quicko T12-942 (Réf. SMW : 002S) »**. Le Quicko remonte bien
dans les solutions référencées. ✅

Contrôle croisé par requête directe
`[[Corresponds_to_organic::Fer à souder]]` → `Fer à souder Quicko T12-942
(002S)`. Cohérent.

### Page « Braser tendre » (procédé) — rendue après purge

Bloc **« Solutions organiques (Comment) »** → **rendu vide** (en-têtes
« Réf. | Description » seuls), au moment du rapport.

- **Ce n'est pas une perte de donnée.** La requête directe
  `[[Realizes_function::Braser tendre]]` retourne bien
  **« Fer à souder » (002O)**. Le fait est stocké et interrogeable ;
  seul le cache de rendu du `#ask` embarqué n'est pas reconstruit, faute de
  jobs. Il se remplira au vidage de la file.
- **Faux négatif attendu, confirmé et consigné (pas à corriger ici)** : la
  Machine à souder par points SUNKKO brase aussi à l'étain, mais sa page
  référencée porte `Corresponds_to_organic = Machine à souder par point`,
  propriété **monovaluée**. Elle ne peut donc pas être rattachée aussi à
  « Fer à souder » / « Braser tendre » et n'apparaîtra jamais dans ce bloc,
  même file vidée. Limite du modèle à trancher hors de ce bloc.

---

## Écarts constatés

1. **Practice_domain** : les valeurs de la consigne du bloc 3 n'ont pas été
   appliquées (propriété de domaine `Functional item`, champ absent du modèle
   `Organic item`). Décision de Cyril. Voir en tête de rapport.
2. **« Maintenir en position » sans Practice_domain** : constat laissé ouvert
   pour la clôture de lot (peut-être délibéré).
3. **File de travaux SMW figée à 9 jobs** — hors périmètre du bloc. Un
   `runJobs.php` côté Cyril / fuzzy (cf. `demandes-adminsys.md`) videra la
   file et reconstruira les blocs `#ask` en retard (« Solutions organiques »
   de « Braser tendre » notamment). Les données sont correctes : toutes les
   requêtes `action=ask` directes le confirment.

Rien d'autre. Les dix créations ont réussi du premier coup (`--createonly`),
les références sont uniques (101/101 pour Item_ref, 4/4 pour la banque CWL),
aucune des dix pages ne porte de clé `_ERR` / `_ERRC`, les valeurs sensibles
sont exactes (`Power_rating -> 96`, `Procurement_route -> autoproduit`,
`Measured_quantities` en 5 valeurs sans espace parasite).
