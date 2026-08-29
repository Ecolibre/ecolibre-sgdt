# Lot 10 — clôture

**Date : 29 août 2026.** Tâche 7 du cadrage `lot-10-cadrage.md`. Deux
livrables : ce rapport, et la page wiki *Gestion des lots* (texte statique).
Chaque fait ci-dessous vient d'un rapport `lot-10-tache*.md` ou d'une
vérification faite ce jour ; les écarts avec la consigne de la tâche 7 sont
signalés comme tels.

---

## Étape 1 — la liste réelle des lots

Reconstituée à partir des fichiers de `travaux/`, de leurs titres internes et
de `CLAUDE.md`. Aucun numéro ni contenu inventé.

| Lot | Objet (une phrase, tirée du document) | État apparent | Documents |
|---|---|---|---|
| **1** | Corrections de schéma : `Serial_number` déclarée, `+sep=,` posé sur `Part_of` dans `Modèle:Referenced item`. | Livré (rév. 248-249, 25 juil. 2026). | `ecolibre-sgdt-lot1.md` |
| **2** | Vocabulaires et intégrité des classes : URI de base `owl`/`skos` corrigées, catégorisations parasites retirées. | Livré (25 juil. 2026). | `ecolibre-sgdt-lot2.md` |
| **3** | Les quatre classes définies sur leurs pages de catégorie ; trois propriétés de schéma (`Property_cardinality`, `Property_domain`, `Property_range`). | Livré (26 juil. 2026). | `ecolibre-sgdt-lot3.md` |
| **4** | Numérotation d'inventaire des items physiques, séparée de la séquence de conception : `Inventory_site`, `Inventory_number` (Base 36), `Inventory_ref`. | Livré (26 juil. 2026, rév. 2 + phase 3). | `ecolibre-sgdt-lot4-rev2.md`, `ecolibre-sgdt-lot4-phase3.md` |
| **5** | Registre des préfixes, `Realizes_function` multivaluée, corrections. | Livré (28 juil. 2026). | `ecolibre-sgdt-lot5.md` |
| **6** | Durcissement de `Module:Base36` et bascule `Item_ref`, refonte de `Modèle:Functional item`/`Referenced item`, création de la page *Limites connues du SGDT*. | Livré (exécuté 9-12 août 2026). | `lot-6-consolide.md`, `lot-6-suite.md`, `rapport-2026-08-09.md`, `rapport-2026-08-10.md` |
| **7** | Nomenclature quantifiée et entité réception : un sous-objet par ligne de BOM porté par le parent (`BoM_component`/`quantity`/`unit`), `Procurement_route`, facture Weldom. | **Cadré, jamais exécuté** — et sans document de cadrage propre : décrit seulement dans `sgdt-passation-2026-08-10.md` §4 et en marge de `lot-8-cadrage-facettes.md`. Fragments repris depuis : `Procurement_route` créée au lot 10 tâche 3. **Lacune documentaire, non comblée ici.** | `sgdt-passation-2026-08-10.md` §4 |
| **8** | Facettes de type d'item (axe transversal à la chaîne des quatre classes) : `Organic/Physical facet plant`, `Registre des facettes`. | Livré (exécuté 11-12 août 2026 ; facettes en service, confirmé en ligne). | `lot-8-cadrage-facettes.md`, `lot-8-tache0-rapport.md`, `lot-8-amendement-1.md`, `lot-8-amendement-2.md` |
| **9** | Exemplaires plantés du jardin-forêt : 40 plantations, 73 photos, taxons. | Livré, clos le 16 août 2026. | `lot-9-cadrage-plantes.md`, `lot-9-cloture.md` et ~20 rapports `lot-9-tache*.md` |
| **10** | Référentiel des procédés techniques et rattachement de cinq outils, de bout en bout. | **Clos par ce document, 29 août 2026.** | `lot-10-cadrage.md`, `lot-10-tache0`…`tache7` |
| **11** | Subdivision des lieux : hiérarchie `Catégorie:Lieu`, `Location_number`, préfixe `LOC`, renommages. | Livré, clos le 27 août 2026. | `lot-11-cadrage-lieux.md`, `lot-11-cloture.md` et ~30 rapports `lot-11-*.md` |

**Trou de numérotation :** un seul, le **lot 7**, jamais exécuté. Les numéros
1 à 11 ont tous au moins un document ; le 7 est le seul sans document de
cadrage à lui seul. Ce n'est pas une erreur à masquer : c'est une dette
identifiée depuis le 10 août 2026, partiellement absorbée par les lots
suivants.

---

## 2. Ce qui a été fait

Toutes les révisions ci-dessous sont relevées dans les rapports de tâche.

### Référentiel des procédés (tâche 2, `lot-10-tache2-rapport.md`)

- **`Attribut:Practice_domain`** créée complète en une écriture (rév. 785) :
  type `Text`, cardinalité `multiple`, **ouverte — aucun `Allows value`**,
  conforme à l'arbitrage 2.4 du cadrage.
- **Cinq items fonctionnels de procédé**, marqués `[[Catégorie:Procédé]]`
  (cinq membres, `Assembler` compris — arbitrage 1 reçu de Cyril le
  19 août), chacun aligné sur Wikidata et portant sa ligne de motif en
  `Item_description` :

  | Procédé | `Item_ref` | Alignement | `Practice_domain` |
  |---|---|---|---|
  | Assembler | 002H | Q1480529 | — (groupe DIN 8580) |
  | Braser tendre | 002I | Q67131697 | électronique, plomberie |
  | Souder par points | 002J | Q2327972 | électronique, énergie |
  | Mesurer une grandeur électrique | 002K | Q3859407 | électronique, électricité, énergie |
  | Maintenir en position | 002L | Q2306980 | — |

- Redirection `Souder à l'étain` → `Braser tendre` (rév. 791).
- **`Modèle:Functional item`** modifié (garde-fou 6 levé par Cyril pour cette
  seule modification, arbitrage 2 du 19 août ; rév. finale 800) : accepte
  désormais `Practice_domain` (via `#arraymap` + `#set`, jamais `+sep=,` —
  propriété `Text`), `External_classification`, et `Procédé=oui` qui pose
  `[[Catégorie:Procédé]]`.

### Propriétés d'outil (tâche 3, `lot-10-tache3-rapport.md`)

Cinq propriétés créées, aucune `Allows value`, plafond des 85 caractères de
`Property_range` contrôlé avant écriture :

| Propriété | Type | Cardinalité | `Property_range` | rév. |
|---|---|---|---|---|
| `Procurement_route` | Text | single | (laissée émerger) | 802 |
| `Power_rating` | Number | single | W | 803 |
| `Max_thickness` | Number | single | mm | 804 |
| `Materials_worked` | Page | multiple | (laissée émerger) | 805 |
| `Measured_quantities` | Text | multiple | (laissée émerger) | 806 |

`Procurement_route` est un **reliquat du lot 7**, jamais exécuté ; la
proposition de tâche 3 a été amendée (commit `6944688`) parce qu'un résumé la
comptait à tort comme déjà existante.

### `Design_source` (tâche 5, bloc 2, `lot-10-tache5b-design-source.md`)

- **`Attribut:Design source`** créée (rév. 1095) : type `URL`, cardinalité
  `single`, domaine `Referenced item`. Description : URL permanente figée sur
  un commit, jamais une branche ; le wiki porte les rendus PNG et les plans
  PDF, les sources STEP/STL/natives vivent dans un dépôt versionné.
- Câblée dans **`Modèle:Referenced item`** (rév. 1096, ligne `#set` après
  `Procurement_route`, sans `+sep`) et **`Formulaire:Referenced item`**
  (rév. 1097, champ texte, bulle d'aide).
- **Vide sur tous les items** : le dépôt de conception n'existe pas encore.
  On a posé le réceptacle.

### `Corresponds_to_organic` multivaluée (tâche 5, bloc 4, `lot-10-tache5d-corresponds-multivalue.md`)

Quatre écritures : `Attribut:Corresponds to organic` (`Property_cardinality`
`single` → `multiple`, rév. 1108), `Modèle:Referenced item` (`+sep=,` +
`#arraymap`, rév. 1109), `Formulaire:Referenced item` (`combobox` →
`tokens|list`, rév. 1110), et l'item `Machine à souder par points SUNKKO
709AD` (rév. 1111 : `Corresponds_to_organic = Machine à souder par point, Fer
à souder`). Non-régression vérifiée sur les 37 items portant la propriété :
36 inchangés, seule la SUNKKO modifiée, aucune page fantôme portant la
virgule.

### Les cinq outils (tâches 4 et 5)

**Pilote** (tâche 4, `lot-10-tache4-rapport.md`) — chaîne complète, six
écritures, aucun refus :

- Lieu `Atelier appartement` créé minimal (rév. 819).
- Organique `Machine à souder par point` — `Item_ref` 002M, `Realizes_function
  = Souder par points` (rév. 820).
- Référencé `Machine à souder par points SUNKKO 709AD` — `Item_ref` 002N
  (rév. 821).
- Physique — d'abord `ECL-0043` (rév. 822), réinventorié en `CWL-0008` au
  bloc 1 de la tâche 5.

**Série** (tâche 5, bloc 3, `lot-10-tache5c-outils.md`) — dix créations en
série stricte, chacune `--createonly`, `Item_ref`/`Inventory_number` relus à
froid avant chaque création :

| Niveau | Pages | `Item_ref` / `Inventory_ref` |
|---|---|---|
| Organiques (4) | Fer à souder ; Multimètre ; Boîtier de cycles charge/décharge ; Support de maintien de cellule | 002O ; 002P ; 002Q ; 002R |
| Référencés (3) | Fer à souder Quicko T12-942 ; Multimètre GVDA GD112C ; Mini banc de mesure Ecolibre | 002S ; 002T ; 002U |
| Physiques (3) | Fer à souder — Atelier appartement (CWL-0009) ; Multimètre — … (CWL-000A) ; Mini banc de mesure — … (CWL-000B) | CWL-0009 ; CWL-000A ; CWL-000B |

101 valeurs `Item_ref`, 101 distinctes. Banque CWL : 0008, 0009, 000A, 000B,
chacune une seule fois, `0007` absent.

### Réordonnancement de la banque CWL (tâche 5, bloc 1, `lot-10-tache5a-preliminaires.md`)

- Organisation partenaire **`CWL`** créée (rév. 1089), description vide.
- `default=Ecolibre` **retiré** du champ `Owned_by` de `Formulaire:Physical
  item` (rév. 1090, garde-fou 6 levé) : il fabriquait un fait d'appartenance
  sur 44 items sur 44, que personne n'avait choisi.
- SUNKKO : `Machine à souder par point — Atelier appartement (ECL-0043)`
  **renommé** `(CWL-0008)` (`action=move`, redirection conservée comme
  trace), puis contenu à jour : `site_code` ECL→CWL, `ref_number` 0043→0008,
  `Owned_by` Ecolibre→CWL.
- Batterie : `Batterie de récupération trotinette 1` (pas de renommage, titre
  sans référence) passe de `CWL-0007` à **`ECL-0044`** ; `Owned_by` reste
  `Ecolibre` (le site qui inventorie change, pas le propriétaire).

### Vue et guide (tâche 6, `lot-10-tache6-vue.md`)

- `Modèle:Procédés et outils/ligne` (rév. 1118) — gabarit de sous-requête.
- **`Procédés et outils`** (rév. 1119) — tableau procédé → exemplaires
  disponibles (référence d'inventaire, lieu), vue triable par domaine de
  pratique, section *Limites connues* datée. Vérifié en rendu : Braser tendre
  → CWL-0008 + CWL-0009 ; Maintenir en position → CWL-000B ; Souder par
  points → CWL-0008 ; Mesurer une grandeur électrique → CWL-000A ; Assembler
  → ligne vide avec message d'absence.
- **`Guide de saisie`** (rév. 1121) — parcours « ajouter un outil » : ordre
  des niveaux, contenu par niveau, conventions de titre, pièges.
- `Feuille de route du SGDT` : section « Lots livrés » ajoutée (rév. 1122).

### Critères de clôture du cadrage (§7)

| Critère | État |
|---|---|
| Cinq outils en chaîne complète, chacun rattaché à ≥ 1 procédé | **3 sur 5** complets (SUNKKO, petit fer, multimètre, banc = 4 chaînes ; le gros fer et le boîtier de cycles n'ont que l'organique). |
| Chaque nœud de l'arbre porte sa ligne de motif | Oui — en `Item_description` sur les cinq procédés. |
| `Practice_domain` porte ≥ 1 valeur hors électronique | Oui — plomberie, électricité, énergie. |
| La vue procédé → outils rend le compte attendu, compteur affiché | Oui — `Procédés et outils`. |
| Le rapport dit ce que le lot ne couvre pas | §3 et §6 de ce document. |

---

## 3. Ce qui a échoué ou s'est révélé faux

Sans euphémisme. Trois de ces points remettent en cause la **consigne de la
tâche 7 elle-même** — ils sont marqués **[écart consigne]**.

1. **Le guide de saisie n'existait pas.** Le cadrage (§5, tâche 6) et la
   consigne de la tâche 6 parlaient d'une « mise à jour » du guide de saisie.
   Recherche faite en tâche 6 (index plein-texte HS, donc balayage des 193
   titres de l'espace principal + espaces `Aide` et `Projet`, vides) :
   **aucune page de ce genre sous quelque titre que ce soit.** La tâche 6 l'a
   **créé**, pas mis à jour.

2. **L'interdiction du tri alphabétique est levée.** Le cadrage (§6, tâche 6,
   risques) interdisait toute vue reposant sur un tri alphabétique tant que
   la collation SMW n'était pas corrigée. **Elle l'a été depuis.** Mesuré le
   29 août 2026 par une requête triée sur `[[Category:Referenced item]]` :
   « Égopode Escuroux 2025 » ressort **13e sur 38** (entre « Crosnes du
   Japon » et « Fer à souder Quicko T12-942 »), et non plus après « Yacon ».
   Le « É » se classe avec le « E ». Les deux vues de `Procédés et outils`
   utilisent le tri alphabétique.

3. **Une consigne de la tâche 5 contredisait l'arbitrage 2.4 du cadrage.**
   La consigne du bloc 3 demandait d'écrire `Practice_domain` sur les items
   **organiques**. Or `Attribut:Practice_domain` a pour domaine
   `Category:Functional item` : sur un organique, le champ est inerte.
   **Erreur interceptée avant écriture** (`lot-10-tache5c-outils.md`, en-tête)
   et confirmée par Cyril en conversation. Aucune écriture fautive.

4. **[écart consigne] `format=tree` et `format=outline` rendent, contrairement
   à ce qu'annonçait la consigne de la tâche 7.** Vérifié le 29 août 2026 sur
   `Catégorie:Functional item`, page purgée puis rendue (`action=parse`) :

   - Section « Hiérarchie (Format Arbre) » (`format=tree`, `root=Assurer les
     besoins vitaux`) : **rend un arbre imbriqué** correct — `Assurer les
     besoins vitaux` puis ses descendants indentés. `Assembler` /
     `Braser tendre` n'y figurent pas parce qu'ils sont hors de cette racine,
     pas parce que le format échoue.
   - Section « Arborescence textuelle » (`format=outline`) : **rend une liste
     ordonnée** de toutes les fonctions avec leur parent entre parenthèses.

   La section réellement dégradée est **« Visualisation … (Mermaid) »** : le
   `{{#mermaid:}}` **émet bien** un `<div class="ext-mermaid">` (l'extension
   est installée, rendu client), mais le contenu généré est **cassé** — il
   contient un littéral `[[SMW::off]]` en tête de graphe et un nœud
   `"S'hydrater, Irriguer"` dont la virgule (valeur multiple de `Part_of`)
   produit une arête malformée. Le graphe ne s'affichera pas proprement côté
   navigateur.

   **Conclusion :** la « section morte » à retirer ou marquer sur
   `Catégorie:Functional item` est **le bloc Mermaid**, pas les blocs
   `tree`/`outline`. La consigne de la tâche 7 est ici en retard sur l'état du
   wiki — même mécanisme que le point 2 (une observation ancienne, un wiki qui
   a bougé depuis).

5. **L'index plein-texte est partiel.** Vérifié le 29 août 2026 :
   `organique`, `outil`, `soudure`, `procédé` → **0 résultat** ; `Ecolibre`
   → 2 ; `Multimètre` → 3. La recherche de MediaWiki ne voit qu'une fraction
   du corpus. Ce n'est pas propre au lot 10 (déjà noté en tâche 4 :
   `list=search` sur `outil` et `machine` rendait 0). Piste : lancer
   `rebuildtextindex.php` côté serveur (relève de Cyril, `SERVER_NAME`
   obligatoire).

6. **[écart consigne partiel] `Attribut:Main image` n'est portée par aucune
   page, mais elle EST câblée.** Vérifié le 29 août 2026 :

   - `[[Main_image::+]]` → **0 page** : personne ne la porte (cohérent avec
     la leçon de `CLAUDE.md` sur l'annotation `Main_image` fausse, nettoyée).
     Sur ce point la consigne dit vrai.
   - « câblée dans AUCUN modèle ni formulaire » : **faux.** Elle est câblée
     dans **`Modèle:Physical facet plant`** (`#set` + affichage `[[File:…]]`)
     et dans **`Formulaire:Physical item/bloc facette végétal`**
     (`{{{field|Main_image|input type=text|uploadable}}}`). Ce qui est vrai :
     elle **n'est pas** dans le `Modèle:Physical item` de base ni dans le
     `Formulaire:Physical item` de base — elle est cantonnée à la facette
     végétale. C'est le chantier « Images » (voir §6) qui doit l'élargir aux
     quatre niveaux.

7. **[écart consigne] La liste des corrections de `CLAUDE.md` a été
   revérifiée une par une — et le `+sep` sur `Part_of` est correctement
   fermé, pas ouvert.** La consigne de la tâche 7 dit que « la correction
   n° 3 (+sep manquant sur `Part_of`) est déjà appliquée alors qu'elle figure
   comme ouverte ». Vérification sur `CLAUDE.md` en l'état et sur le wiki le
   29 août 2026 :

   - Correction **n° 3** de `CLAUDE.md` = « `Module:Base36` s'arrête au
     tiret » — **ouverte**, non touchée par le lot 10.
   - Correction **n° 4** = « `+sep=,` sur `Part_of` de `Modèle:Referenced
     item` » — déjà marquée **fermée** (« était déjà en place avant le
     lot 9 »). `bin/wiki-get.sh "Modèle:Referenced item"` confirme :
     `|Part_of={{{Part_of|}}}` suivi immédiatement de `|+sep=,`, et de même
     pour `Corresponds_to_organic`.
   - Corrections **n° 1** (détection des doublons Base36) et **n° 3** restent
     ouvertes, toutes deux sur `Module:Base36`, aucune touchée par le lot 10.

   **Il n'existe donc pas d'entrée « +sep sur Part_of » ouverte.** La liste
   de `CLAUDE.md` est, sur ce point précis, en phase avec le wiki. La
   consigne de la tâche 7 s'appuie ici sur une lecture périmée de la liste.
   L'instruction sous-jacente — revérifier la liste une par une — est juste
   et a été faite : n° 2, 4, 5 fermées et conformes ; n° 1 et 3 ouvertes et
   intactes.

---

## 4. Ce qui reste ouvert dans le périmètre du lot

1. **Deux outils incomplets faute d'étiquettes** (`lot-10-tache5c` en-tête) :
   le **gros fer à souder** et le **boîtier de cycles charge/décharge** ont
   leur item organique (`Fer à souder` 002O, `Boîtier de cycles
   charge/décharge` 002Q) mais **ni référencé ni exemplaire physique** —
   marque et modèle non relevés. État légitime du modèle, pas un échec.

2. **`Design_source` vide sur le banc** (`Mini banc de mesure Ecolibre`,
   002U) : le seul item autoproduit du lot, mais le dépôt git de conception
   n'existe pas. Le champ attend ce dépôt.

3. **La description de l'organisation `CWL`** est vide (`lot-10-tache5a`
   §2a) — à compléter par Cyril.

4. **`Assembler` et `Maintenir en position` n'ont aucun `Practice_domain`.**
   Motif probable : un procédé générique n'appartient à aucun domaine en
   propre (`lot-10-tache5c`, « Point à trancher en clôture de lot »). **La
   règle n'est pas écrite.** Elle est signalée dans la section *Limites
   connues* de `Procédés et outils` comme observation, pas comme règle.

5. **`Manufacturer` et `Materials_worked` sont de type `Page` et accumulent
   des liens rouges** : `SUNKKO`, `Quicko`, `GVDA`, `Acier nickelé` sont des
   cibles de propriété jamais créées (`lot-10-tache4-rapport.md` §7 point 3,
   `lot-10-tache5d` fin). **Question non tranchée :** un fabricant est-il un
   nœud du système (comme `Supplier` le laisse entendre) ou une simple
   étiquette ? Même famille que la limite connue n° 9 sur les pages de
   fournisseur nues.

6. **Deux pages de test à supprimer** (le compte bot ne sait pas supprimer,
   `lot-10-tache6-vue.md` §1) : `Modèle:Test lot10 ligne` et
   `Utilisateur:Cywil/Bac à sable/Lot10 vue`, toutes deux blanchies avec la
   mention « à supprimer ». Elles ont servi à prouver le `#ask` imbriqué.

7. **`Braser tendre` — faux négatif du modèle assumé** (`lot-10-tache5c`
   §Étape 5) : la SUNKKO brase aussi à l'étain, rattachée à « Fer à souder »
   via `Corresponds_to_organic` multivaluée depuis le bloc 4 — donc elle
   **apparaît** bien sous Braser tendre dans `Procédés et outils` (deux
   exemplaires). Ce point est **résolu** par le bloc 4. Reste que le bloc
   « Solutions organiques » de la page `Braser tendre` peut afficher vide
   quand la file de travaux SMW est en retard ; la donnée est correcte
   (requête directe OK).

8. **`Power_rating` non renseigné sur la SUNKKO** (3,2 kW visible sur
   l'étiquette, `lot-10-tache4-rapport.md` §10) — hors périmètre de l'étape
   qui ne demandait que `Max_thickness`, `Materials_worked`,
   `Procurement_route`. À compléter.

---

## 5. Arbitrages datés du 29 août 2026

Tous consignés dans les rapports `lot-10-tache5a`…`5d` et `tache6-vue`.

- **Une référence d'inventaire libérée n'est JAMAIS réattribuée.** `ECL-0043`
  (SUNKKO, jamais utilisée avant le renommage) et `CWL-0007` (batterie)
  restent vacantes à vie. **Conséquence assumée :** le modèle ne sait pas
  distinguer une référence *retirée* d'une référence *jamais utilisée* — les
  deux sont juste « absentes de la séquence ». À traiter avec les correctifs
  `Module:Base36` (voir *Gestion des lots*, lots à venir).

- **Les numéros d'inventaire sont en base 36**, conformément à la définition
  écrite sur `Attribut:Inventory_number`. `000A` suit `0009` ; `0010` suit
  `000Z`. Écrit en consigne dans le *Guide de saisie*.

- **`Inventory_site` dit qui a inventorié ; `Owned_by` dit qui possède.** Le
  SUNKKO passe à `CWL` sur les deux (inventorié et possédé par CWL). La
  batterie passe à `ECL` en site mais **reste `Ecolibre` en propriété**.

- **`default=Ecolibre` retiré du formulaire des items physiques** : il
  fabriquait un fait d'appartenance sur 44 items sur 44, choisi par personne.

- **`Corresponds_to_organic` devient multivaluée** : un modèle du commerce
  peut implémenter plusieurs solutions techniques (une station qui soude par
  points *et* brase à l'étain).

- **Le wiki porte les rendus PNG et les plans PDF ; les sources STEP, STL et
  natives vivent dans un dépôt git**, référencées par `Design_source` en
  permalien sur un commit — jamais sur une branche, qui pointerait un jour
  vers un fichier modifié à l'insu de tous.

- **Les rapports d'exécution restent dans `travaux/` et ne vont pas sur le
  wiki** : ils citent de la syntaxe SMW que le wiki lirait comme de vraies
  annotations.

- **Wikibase Client écarté** pour lire Wikidata : l'extension lit la base de
  données d'un dépôt Wikibase, pas son API, et ne peut pas lire wikidata.org
  depuis un wiki tiers.

- **CategoryTree écarté** pour la navigation dans la chaîne : il ne parcourt
  que l'appartenance aux catégories, qui vaut classe et non navigation.

- **La vue `Procédés et outils` s'arrête aux exemplaires physiques** : c'est
  le seul niveau où une ligne vide signale un manque réel (aucun outil
  possédé pour ce geste).

Rappels d'arbitrages antérieurs toujours en vigueur : 2.1 (un procédé est un
item fonctionnel, titre au verbe infinitif), 2.2 (plusieurs racines sœurs,
pas de chapeau — **à réviser au lot « arbre fonctionnel »**), 2.3 (le procédé
est porté par l'organique), 2.4 (`Practice_domain` sur le procédé, jamais sur
l'outil), 2.5 (la compétence est une arête, pas un nœud).

---

## 6. Deux motifs techniques réutilisables

1. **Un `#ask` imbriqué dans un modèle appelé en `format=template` par un
   `#ask` extérieur FONCTIONNE sur cette installation.** Prouvé en bac à
   sable le 29 août 2026 (`Modèle:Test lot10 ligne` +
   `Utilisateur:Cywil/Bac à sable/Lot10 vue`, rendus par `action=parse`), et
   mis en production dans `Procédés et outils`. La sous-requête a son propre
   `|default`, donc chaque ligne peut porter son message d'absence.

2. **SMW enchaîne les chaînes de propriétés INVERSES et les mélange aux
   directes.** `-Realizes_function.-Corresponds_to_organic.-Instance_of`
   descend du procédé jusqu'à l'exemplaire physique en une seule impression
   de colonne ; on peut ensuite chaîner une propriété directe
   (`.Inventory_number`, `.Located_at`). **Aucune propriété matérialisée
   n'est nécessaire pour la navigation descendante.** C'est déjà l'idiome de
   `Avancement du jardin-forêt` (`-Corresponds_to_organic.-Instance_of`).
   Retenu comme forme de repli ; `Procédés et outils` utilise le motif 1
   pour le message d'absence par ligne.

---

## 7. Livrables de la tâche 7 et vérifications

- **`travaux/lot-10-tache7-cloture.md`** — ce fichier (part sur GitHub).
- **`Gestion des lots`** — page wiki, texte statique, encadré « page
  provisoire », trois sections (lots livrés / lot en cours : aucun / lots à
  venir avec dépendances). Aucune propriété, aucune catégorie de classe,
  aucun `#ask`.
- **Renvoi croisé** ajouté entre `Feuille de route du SGDT` et `Gestion des
  lots`, dans les deux sens. Aucune fusion, aucun renommage, aucune
  suppression — la fusion appartient au lot de transformation.

Vérifications faites (détail dans le rapport terminal) :

- `browsebysubject` sur `Gestion des lots` : aucune propriété du modèle de
  données.
- Aucun `[[ ]]` littéral au rendu des pages touchées.
- Chaque lien GitHub contient le SHA du commit de ce rapport, jamais un nom
  de branche.
- Liste des lots relue : trou unique au lot 7, signalé, non comblé.

---

## 8. Rectification du 29 août 2026 (même jour, session suivante)

La page `Gestion des lots` avait été rédigée en partie d'après les trois
affirmations fausses de la consigne de la tâche 7 (voir §3, points 4, 6, 7).
Deux lots à venir en portaient la trace — `Navigation` et `Images` —
formulés comme si `format=tree`/`format=outline` ne rendaient rien et comme
si `Main_image` n'était câblée nulle part.

**Vérifications refaites** (ne pas se fier au §3, le remesurer) :

| Point | Mesure du 29 août 2026 | Verdict |
|---|---|---|
| `format=tree` sur `Catégorie:Functional item` | section « Hiérarchie (Format Arbre) » : **1113 caractères rendus**, arbre complet depuis « Assurer les besoins vitaux » | **fonctionne** |
| `format=outline` | section « Arborescence textuelle » : **1145 caractères rendus**, liste complète (Assembler, Braser tendre inclus) | **fonctionne** |
| bloc Mermaid | section « Visualisation … (Mermaid) » : **77 caractères** — le titre et la note seuls ; `<div class="ext-mermaid">` présent mais graphe non rendu (contenu généré malformé) | **cassé** |
| `format=datatable` (« Tableau de bord ») | **0 caractère rendu** — hors périmètre, signalé pour mémoire | ne rend rien |
| `Main_image` — `Modèle:Physical facet plant` | **2 occurrences** : ligne de stockage dans le `#set` (`Main_image={{#if:{{{Main_image|}}}|Fichier:{{{Main_image|}}}|}}`), ligne d'affichage `[[File:{{{Main_image|}}}|200px]]` avec repli `''non choisie''` | **câblée** |
| `Main_image` — `Formulaire:Physical item/bloc facette végétal` | `{{{field|Main_image|input type=text|uploadable}}}` | **câblée** |
| `Main_image` ailleurs | absente de `Modèle:Physical item`, `Formulaire:Physical item`, `Modèle:Organic facet plant`, `Modèle:Organic facet fitting`, `Modèle:Functional item` ; **aucun `Modèle:Physical facet fitting`/`raccord` n'existe** | non câblée hors facette végétal |
| `Main_image` portée par une page | `[[Main_image::+]]` → **0** | portée par aucune page |
| `CLAUDE.md` corrections n° 3 / n° 4 | n° 3 = « `Module:Base36` s'arrête au tiret » → **ouverte** ; n° 4 = « `+sep=,` sur `Part_of` de `Modèle:Referenced item` » → **fermée**, et `Modèle:Referenced item` porte bien `|Part_of={{{Part_of|}}}` puis `|+sep=,` | liste conforme au wiki |

**Corrections appliquées à `Gestion des lots`** (rév. 1126, résumé
`[Lot 10][Correctif] …`) :

- Lot **Navigation** réécrit : `format=tree` et `format=outline` fonctionnent
  et rendent déjà l'arbre fonctionnel complet ; le lot part d'une base
  éprouvée ; reste à replier les blocs (`mw-collapsible`), les porter sur les
  quatre modèles d'item, et **réparer le bloc Mermaid** ; `CategoryTree`
  reste écarté.
- Lot **Images** réécrit : `Main_image` est câblée dans la facette végétale
  (`Modèle:Physical facet plant` — stockage, affichage 200 px, « non
  choisie » ; champ `uploadable` dans le bloc de formulaire), portée par
  aucune page ; le lot **étend ce mécanisme existant aux autres facettes**
  plutôt que d'en créer un ; le reste inchangé (relation fichier → sujet,
  fichier non rattaché, item sans image locale).
- Lot **Corrections `Module:Base36`** : inchangé — il ne prétendait pas que
  la liste de `CLAUDE.md` était en retard sur le wiki. Rien à corriger.
- **Ligne de rectification datée** ajoutée en fin de section « Lots à venir »,
  renvoyant au §3 de ce rapport. La correction est visible, pas masquée.

**Ce rapport lui-même :** les trois affirmations fausses n'y figuraient déjà
que dans le §3, chacune présentée puis rectifiée sur place (marquées `[écart
consigne]`). Aucune ne subsistait ailleurs — ni au §2 (« ce qui a été
fait »), ni au §4 (« ce qui reste ouvert »). Aucune correction sur place
n'a donc été nécessaire dans le corps du rapport ; seule cette section 8 est
ajoutée.

**Vérifications post-correction :**

- `browsebysubject` sur `Gestion des lots` : `_MDAT`, `_SKEY` seuls — aucune
  propriété du modèle de données, la page reste statique.
- Aucun `[[ ]]` littéral au rendu (seule exception voulue :
  `<code><nowiki>[[SMW::off]]</nowiki></code>` cité en exemple du bug
  Mermaid).
- Les liens GitHub portent toujours le SHA `3a0e7af…`, jamais un nom de
  branche.
