# Lot 10 — Tâche 0 : reconnaissance et solde du reliquat

**Exécuté le :** 17 août 2026, session Claude Code, compte `Cywil`.
Reconnaissance faite **sur l'état réel du wiki**, jamais sur les rapports du
dépôt, conformément au §5 du cadrage.

---

## 1. Écritures

| Page | Résumé | revid |
|---|---|---|
| `Attribut:Foliage_persistence` | `[Correctif] Foliage persistence — description alignée sur les valeurs autorisées` | 376 → **783** |
| `Attribut:Life_cycle` | `[Correctif] Life cycle — description alignée sur les valeurs autorisées` | 379 → **784** |

**Aucun refus.** Le verrou signalé comme intermittent au §6 du cadrage ne s'est
pas manifesté sur ces deux écritures. `protection: []` sur les deux pages avant
écriture.

### 1.1 `Attribut:Foliage_persistence`

Avant :
```
[[Property_description_FR::Persistance du feuillage : caduc, semi-persistant ou persistant.]]
[[Property_description_EN::Foliage persistence: deciduous, semi-evergreen or evergreen.]]
```
Après :
```
[[Property_description_FR::Persistance du feuillage au fil de l'année.]]
[[Property_description_EN::Foliage persistence.]]
```

### 1.2 `Attribut:Life_cycle`

Avant :
```
[[Property_description_FR::Cycle de vie de la plante : annuelle, bisannuelle ou vivace.]]
[[Property_description_EN::Life cycle of the plant: annual, biennial or perennial.]]
```
Après :
```
[[Property_description_FR::Cycle de vie de la plante.]]
[[Property_description_EN::Life cycle of the plant.]]
```

Sur l'anglais, **seule la clause énumérative a été retirée**, la phrase de sens
restant intacte — d'où une description brève, sans reformulation. Le diff des
deux pages se limite aux lignes 5 et 6 (`5,6c5,6`) : `Allows value`,
`Has type`, cardinalité, domaine et portée sont inchangés.

Les deux pages appliquent désormais l'arbitrage 2.6 : la description dit ce que
la propriété veut dire, `Allows value` fait foi pour les valeurs. Ces deux
propriétés étaient les seules à recopier leur énumération (relevé du
17 août) — **il n'en reste aucune**.

### 1.3 Écritures locales

| Commit | Objet |
|---|---|
| `c9f60cb` | `[Lot 10] Cadrage` |
| `5be6c0c` | `[Lot 10][Tâche 0] Demande de collation SMW consignée` |

---

## 2. Reconnaissance

### 2.1 Propriétés existantes — 89, dont 73 avec `Property_range`

`action=ask` sur `[[Has type::+]]`, avec `|?Has type|?Property_range|
?Property_cardinality|?Property_domain`, `limit=300`.

**Piège rencontré** : la clé de printout de `Has type` est rendue sous son nom
d'affichage **français**, `A le type`, et non `Has type`. Filtrer sur le nom
anglais donne une colonne vide sur les 89 lignes — faux négatif du même genre
que celui déjà consigné pour `_PVAL`/`Allows value`.

Répartition par type : `Text` majoritaire, puis `Page`, `Number`, `Code`,
`Keyword`, `Date`, `URL`. Les 16 sans `Property_range` se répartissent en trois
groupes :

- **10 légitimement sans portée** : les propriétés de schéma du projet
  (`Property_cardinality`, `Property_range`, `Property_domain`,
  `Property_description_FR`/`EN`, `Object_description_FR`/`EN`) et les
  4 propriétés de vocabulaire importé (`Foaf:*`, `Owl:differentFrom`).
- **1 réellement vide** : `Edible_parts` — voir ci-dessous, c'est le même
  défaut que les 5 suivantes.
- **5 dont la valeur est écrite mais non stockée** : voir §3.1.

La liste complète, propriété par propriété, a été produite en session ; les
portées se répartissent entre unités (`m`, `mm`, `°C`, `cm`), classes cibles
(`Organic item`, `Referenced item`, `Functional item`, `lieu`, `Facette`),
formats (`identifiant Base 36, 4 caractères`, `date de calendrier`, `mois`),
`texte libre`, `énumération fermée` (8 propriétés), et la formule
« valeurs laissées émerger » (7 propriétés).

**Utile pour la tâche 3 :** `Realizes_function` existe déjà —
type `Page`, **multiple**, portée `Functional item`. L'arbitrage 2.3 du cadrage
n'a donc besoin d'aucune création de propriété pour être appliqué.
`Practice_domain`, en revanche, **n'existe pas** : elle est bien à créer.

### 2.2 Les deux banques de numérotation

| Banque | Propriété | Dernier attribué |
|---|---|---|
| Conception (fonctionnels, organiques, référencés) | `Item_ref` | **002G** — `Miscanthus La Closerie D'Olt 2026` |
| Inventaire (items physiques) | `Inventory_number` | **0042** — `Ail éléphant — Le Buisson de Cerzat (ECL-0042)` |

Suivants à attribuer : **002H** côté conception, **0043** côté inventaire.
Rappel du cadrage : aucune référence ne se crée hors ligne, le compteur est en
production.

### 2.3 `Module:Base36` — les deux correctifs sont toujours ouverts

Vérifié sur la **source vive** du module (revid 237), pas sur les rapports.

- **Correctif n° 1 — détection des doublons : ouverte.** `p.findGaps` stocke
  les références dans `existing_refs[dec] = true`, un ensemble. Une référence
  vue deux fois écrase la même clé : **un doublon est structurellement
  invisible**. La fonction ne compte rien et ne signale que les absents
  (boucle `for i = 1, max_dec`).
- **Correctif n° 3 — arrêt au tiret : ouverte.** `clean:match("[%w]+")` figure
  toujours **deux fois** : ligne 13 dans `p.next`, ligne 60 dans `p.findGaps`.
  `%w` ne couvrant pas le tiret, `ECL-0042` est lu comme `ECL`. C'est ce qui
  justifie que le préfixe `ECL` reste un affichage et jamais une valeur
  stockée.

**Constat lié, confirmé sur la source de `Modèle:Item numbering audit`**
(revid 239) : la requête est `[[Item_ref::+]]` sans filtre de catégorie et sans
mention d'`Inventory_number`. L'audit est donc **aveugle à la banque
physique** — les 42 items d'inventaire ne sont jamais audités.

### 2.4 Open Know-Where — noms de champs de l'équipement

**Source obtenue, verbatim, et concordante sur trois emplacements** — le
schéma JSON, sa documentation, et la page de conception du schéma :

- <https://github.com/iop-alliance/okw_data_management/blob/main/schemas/okw_v1_schema.json>
- <https://github.com/iop-alliance/okw_data_management/blob/main/docs/okw_v1_schema_specification.md>
- <https://map.internetofproduction.org/data-schema-design-choices/>

Classe `ManufacturingEquipment`, **7 champs**, tels que publiés :

| Champ | Type | Description publiée |
|---|---|---|
| `equipment_id` | int | Unique identifier for the equipment |
| `resource_id` | int | Reference to the distributed resource |
| `brand` | string | Brand of the equipment |
| `model` | string | Model of the equipment |
| `type` | string | Type of the equipment |
| `description` | string | Description of the equipment |
| `source_id` | int | Reference to the metadata of the source |

**Réserve importante, à lever avant la tâche 3.** Ce que j'ai obtenu est le
schéma **v1 de gestion de données** (celui de la carte), pas le document
**normatif** *Open Know-Where Specification, release 2*, publié à
<https://standards.internetofproduction.org/pub/okw/release/2> — **inaccessible
à mon outil de récupération, qui reçoit un HTTP 403** (site également
inaccessible via `barbal.co`, DNS non résolu).

Les deux ne coïncident pas nécessairement : les extraits de recherche du
document normatif montrent des champs nommés en toutes lettres — *Serial
Number*, *Location* (« Uses the Location class »), *Owner* (« Uses the Agent
class ; to be used when the owner is not the manufacturing facility ») — soit
une convention de nommage différente de celle du schéma de base de données
ci-dessus. **Je ne les reproduis pas comme liste faisant foi : ils viennent
d'extraits de moteur de recherche, pas du document lu.** Les inventer ou les
compléter de mémoire serait exactement ce que le cadrage interdit.

Deux points établis avec certitude sur la spécification, eux :

- elle décrit bien une **classe `Equipment`** dont la définition est
  « the equipment available for use at the manufacturing facility » ;
- elle **ne crée pas ses propres classifications** pour l'équipement, les
  procédés de fabrication et les matériaux : elle **renvoie à Wikipédia** comme
  référentiel. Ce point rejoint directement l'arbitrage 2.1 du cadrage et la
  propriété `External_classification` déjà en place (type URL, portée
  « URL Wikipédia ou Wikidata »).

**Action demandée à Cyril** : ouvrir l'URL de la spécification dans un
navigateur et coller la liste des champs `Equipment`, ou confirmer que le
schéma v1 ci-dessus fait foi pour ce lot.

---

## 3. Ce qui a échoué ou n'a pas pu être obtenu

### 3.1 Cinq `Property_range` écrits mais non stockés — limite à 85 caractères

Découvert en croisant le wikitexte et le magasin : cinq propriétés portent un
`Property_range` dans leur source **et n'en ont aucun dans SMW**.

**Message d'erreur exact**, relevé sur le rendu de
`Attribut:Propagation_method` :

> **« Le mot-clé dépasse la valeur maximale de 85 caractères. »**

`Property_range` est de type `Keyword`, plafonné à **85 caractères**. Au-delà,
la valeur est **rejetée au stockage** — l'écriture réussit, la page porte une
clé `_ERRC`, et rien ne remonte à l'auteur.

Mesure, qui situe la coupure exactement :

| Propriété | Longueur | Stockée ? |
|---|---|---|
| `Storage_method` | 84 car. | ✅ |
| `Soil_type` | 85 car. | ✅ (à la limite exacte) |
| `Seed_treatment` | 90 car. | ❌ |
| `Plant_habit` | 91 car. | ❌ |
| `Propagation_method` | 95 car. | ❌ |
| `Root_system` | 97 car. | ❌ |
| `Edible_parts` | 99 car. | ❌ |

**Conséquence directe pour ce lot.** La tâche 3 prévoit un jeu de propriétés
d'outil « arrêté en entier avant la première écriture », chacune complète du
premier coup — or c'est précisément le cas où une portée un peu bavarde passe
inaperçue. **Toute valeur de `Property_range` doit être tenue sous
85 caractères**, et le contrôle après écriture doit porter sur le magasin, pas
sur le wikitexte. Les 5 propriétés en défaut sont un reliquat du lot 9, **non
corrigé ici** : hors périmètre de la tâche 0, à traiter séparément.

### 3.2 La spécification OKW normative reste hors de portée

HTTP 403 sur `standards.internetofproduction.org` (deux URL essayées), DNS non
résolu sur `barbal.co` et erreur TLS sur `openknowwhere.org`. Le dépôt GitHub
de l'alliance n'héberge pas le texte normatif : `okw_map_site` ne contient
qu'un `README.md`, et la recherche de code sur l'API GitHub exige une
authentification (401) — `gh` n'est pas installé sur ce poste.

Contourné en partie seulement, voir §2.4 : le schéma v1 est obtenu et
vérifiable, le document normatif ne l'est pas.

### 3.3 Non fait, volontairement

- **Les 5 `Property_range` tronqués** (§3.1) : signalés, non corrigés.
- **`Practice_domain`** : confirmée absente, non créée — elle relève de la
  tâche 2, après validation de la tâche 1.
- **La demande de collation** est consignée dans `demandes-adminsys.md` mais
  **aucune vérification serveur n'a été faite** : ni `php7.4 -m | grep intl`,
  ni les droits en écriture sur `LocalSettings_ecolibre.php`. Ces deux
  contrôles demandent un accès SSH, hors de ce que fait cette session. Ils sont
  écrits dans la demande comme préalables, avec la note que si le groupe
  `fuzzy` a l'écriture, ce n'est pas une demande adminsys.

---

## 4. Ce qui reste ouvert pour la suite du lot

1. **Trancher la source OKW** (§2.4) : le schéma v1 fait-il foi, ou faut-il la
   liste du document normatif ? Bloque la tâche 3, pas la tâche 1.
2. **Le plafond de 85 caractères** (§3.1) est désormais une contrainte de
   rédaction pour toute propriété créée dans ce lot.
3. Les quatre questions du §4 du cadrage restent entières — elles se tranchent
   en tâche 1 puis en tâche 5, sur pièces.

**Rien dans cette reconnaissance ne contredit un arbitrage du cadrage.** Deux
faits le renforcent : `Realizes_function` est déjà multivaluée et pointe vers
`Functional item` (2.3), et la spécification OKW renvoie à Wikipédia plutôt que
de créer ses classifications (2.1).
