# Lot 10 — tâche 5, bloc 2 : propriété Design_source et câblage

Date : 2026-08-29. Aucun item créé ni modifié. Création de la propriété
`Design_source`, câblage dans le modèle et le formulaire `Referenced item`.
**Le champ reste vide sur tous les items** : le dépôt de conception n'existe
pas encore. On prépare le réceptacle.

---

## Étape 1 — lectures préalables (aucune écriture)

### a) Attribut:External_classification — gabarit d'une propriété URL en service

```
[[Has type::URL]]
[[Property_description_FR::URL Wikipédia ou Wikidata identifiant le type d'objet, comme classification externe — ne pas utiliser Equivalent URI, qui exprime une assertion d'identité.]]
[[Property_description_EN::Wikipedia or Wikidata URL identifying the object type, as an external classification — do not use Equivalent URI, which expresses an identity assertion.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Organic item]]
[[Property_domain::Category:Referenced item]]
[[Property_domain::Category:Functional item]]
[[Property_range::URL Wikipédia ou Wikidata]]
```

Mise en forme retenue pour `Design_source` : mêmes assertions, une par ligne,
sans `<noinclude>`, sans catégorie. Un seul `Property_domain`
(`Category:Referenced item`), la propriété ne concernant que le niveau
référencé.

### b) Modèle:Referenced item (revid lu : 986)

Bloc `#set` — ordre des propriétés :
`Item_ref, Item_description, Maturity_level, Part_of (+sep=,),
Corresponds_to_organic, Max_head, Supplier, Supplier_reference, Sourcing_year,
Manufacturer, Manufacturer_reference, Procurement_route, Power_rating,
Max_thickness, Materials_worked (+sep=,), Wanted_by (+sep=,)`.

**Vérifié : aucun `+sep=` entre `Procurement_route` et `Power_rating`.** Les
`+sep=,` du bloc se rattachent à `Part_of`, `Materials_worked` et `Wanted_by`.
Insérer `Design_source` juste après `Procurement_route` est donc sans danger —
le `+sep` de `Materials_worked` reste rattaché à `Materials_worked`.

Tableau d'affichage — le patron conditionnel `{{#if:…|[[…]]}}` n'est employé
que pour les cellules produisant un lien (`Corresponds_to_organic`, `Supplier`,
`Manufacturer`). `Mode d'obtention` (`| {{{Procurement_route|}}}`) est une
cellule nue. `Design_source` étant de type URL affiché tel quel, sa cellule
sera nue elle aussi.

Le modèle est transclus par ~35 items référencés (`#ask` BOM + exemplaires
physiques). C'est le point sensible du bloc.

### c) Formulaire:Referenced item (revid lu : 988)

Champs dans l'ordre : `Item_ref, Item_description, Corresponds_to_organic,
Maturity_level, Part_of, Max_head, Supplier, Supplier_reference, Sourcing_year,
Manufacturer, Manufacturer_reference, Procurement_route, Power_rating,
Max_thickness, Materials_worked, Measured_quantities, Wanted_by`.

Champ `Procurement_route` :
`| {{{field|Procurement_route|input type=combobox|values from property=Procurement_route}}}`,
précédé d'une bulle `{{#info: … }}`. Patron des champs voisins reproduit pour
`Design_source`.

### d) action=query&prop=info sur Attribut:Design_source

Normalisé en `Attribut:Design source` (ns 102). `"missing": true`.
**La page n'existe pas.** Garde-fou d'arrêt non déclenché.

---

## Étape 2 — écritures

`bin/wiki-login.sh` relancé juste avant (`Success Cywil`).

### 2a — Création de Attribut:Design source (revid 1095, pageid 468)

Résumé : `[Lot 10][Tâche 5] création de la propriété Design_source (type URL,
monovaluée, domaine Referenced item) — réceptacle du plan de conception,
laissé vide partout`

Page complète en **une seule écriture** (le verrou
`smw-change-propagation-protection` interdit de compléter une page de
propriété en deux fois) :

```
[[Has type::URL]]
[[Property_description_FR::URL permanente vers les fichiers de conception d'un item référencé autoproduit — dossier figé sur un commit, jamais une branche mobile. Le wiki héberge les rendus PNG et les plans PDF ; les sources STEP, STL et natives vivent dans un dépôt versionné.]]
[[Property_description_EN::Permanent URL to the design files of a self-produced referenced item — folder pinned to a commit, never a moving branch. The wiki hosts PNG renders and PDF drawings; STEP, STL and native sources live in a versioned repository.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Referenced item]]
[[Property_range::URL permanente vers les fichiers de conception]]
```

`Property_range` = « URL permanente vers les fichiers de conception » — **46
caractères**, sous le plafond Keyword de 85 au-delà duquel le rejet serait
silencieux.

### 2b — Modèle:Referenced item (revid 986 → 1096)

Résumé : `[Lot 10][Tâche 5] câblage Design_source : ligne #set après
Procurement_route (sans +sep), ligne d'affichage Source de conception après
Mode d'obtention`

Diff appliqué (deux insertions, rien d'autre) :

```
@@ bloc #set @@
 |Procurement_route={{{Procurement_route|}}}
+|Design_source={{{Design_source|}}}
 |Power_rating={{#invoke:Nombre|virgule|{{{Power_rating|}}}}}

@@ tableau d'affichage @@
 ! style="background:#f2f2f2" | Mode d'obtention
 | {{{Procurement_route|}}}
 |-
+! style="background:#f2f2f2" | Source de conception
+| {{{Design_source|}}}
+|-
 ! style="background:#e8f0ff" | Fabricant
```

Pas de `|+sep=` ajouté (propriété monovaluée ; un `+sep` ici casserait
`Procurement_route`). Cellule d'affichage nue, sans `#if`. Fond `#f2f2f2`
conservé.

### 2c — Formulaire:Referenced item (revid 988 → 1097)

Résumé : `[Lot 10][Tâche 5] ajout du champ Design_source (input text, size 80,
placeholder https://) après Mode d'obtention, bulle d'aide sur le patron des
champs voisins`

Diff appliqué (une insertion, rien d'autre) :

```
 ! Mode d'obtention : {{#info: Comment cet objet a été obtenu — acheté, fabriqué soi-même, récupéré. Distinct du fournisseur, qui dit chez qui.}}
 | {{{field|Procurement_route|input type=combobox|values from property=Procurement_route}}}
 |-
+! Source de conception : {{#info: URL permanente vers les fichiers de conception, figée sur un commit et non sur une branche. Le wiki porte les rendus PNG et les plans PDF ; les sources STEP et STL vivent dans un dépôt versionné.}}
+| {{{field|Design_source|input type=text|size=80|placeholder=https://}}}
+|-
 ! Puissance (W) : {{#info: Décimales avec la virgule. Un point est converti automatiquement ; un nombre mêlant point et virgule est refusé.}}
```

Garde-fou 6 (modèle + formulaire en service) : accord explicite de Cyril donné
en conversation pour ce bloc.

---

## Étape 3 — vérification après écriture

File de travaux SMW **figée à 10 jobs** (`bin/wiki-wait-jobs.sh` : « FILE
FIGEE à 10 travaux »). Rappel : une file qui ne descend pas n'est pas une
preuve d'échec d'écriture.

### browsebysubject sur Attribut:Design source

La lecture ne rend **qu'une clé `_CHGPRO`** (plus `_SKEY`). C'est le verrou de
propagation : **la lecture est en retard, pas l'écriture.** Conformément à la
consigne, **aucune seconde écriture n'a été faite.**

La charge `_CHGPRO` elle-même est lisible et contient **les six assertions**,
non tronquées :

| Assertion | Valeur dans `_CHGPRO` | OK |
|---|---|---|
| `_TYPE` (Has type) | `…swivt/1.0#_uri` → URL | ✅ |
| `Property_description_FR` | texte complet (STEP, STL et natives…) | ✅ |
| `Property_description_EN` | texte complet (STEP, STL and native…) | ✅ |
| `Property_cardinality` | `single` | ✅ |
| `Property_domain` | `Referenced_item#14##` | ✅ |
| `Property_range` | `URL permanente vers les fichiers de conception` | ✅ |

**`Property_range` n'a PAS été silencieusement rejeté** : les 46 caractères
sont stockés intégralement dans la charge de propagation. À revérifier en
faits directs une fois la file vidée, mais la charge ne laisse pas de doute.

### browsebysubject sur Machine à souder par points SUNKKO 709AD

**Aucun fait perdu ni altéré** par la modification du modèle :

```
Item_ref               -> ['002N']              (attendu 002N ✅)
Procurement_route       -> ['acheté']            (attendu « acheté » ✅)
Materials_worked        -> ['Acier_nickelé#0##'] (attendu « Acier nickelé » ✅)
Corresponds_to_organic  -> ['Machine_à_souder_par_point#0##']
Item_description        -> ["Machine de soudage par points…"]
Manufacturer            -> ['SUNKKO#0##']
Manufacturer_reference  -> ['709AD']
Max_thickness           -> ['0.2']
Power_rating            -> ['3200']
_INST                   -> ['Referenced_item#14##']
```

Pas de fait `Design_source` (champ vide → `#set` ne reçoit rien → rien
stocké : comportement voulu). **Aucune clé `_ERR` / `_ERRC`.**

### Rendu de la page du SUNKKO référencé (après purge)

Lignes du tableau, dans l'ordre rendu :

```
Référence (Base 36)              002N
Description technique            Machine de soudage par points…
Item Organique associé           Machine à souder par point
État de maturité
Hauteur de refoulement max. (cm)
Puissance (W)                    3200
Épaisseur max. travaillée (mm)   0,2
Matériaux travaillés             acier nickelé
Grandeurs mesurées
Fournisseur
Réf. fournisseur
Année d'obtention
Mode d'obtention                 acheté
Source de conception             ← NOUVELLE LIGNE, vide
Fabricant                        SUNKKO
Réf. fabricant                   709AD
Cas d'emploi (Parents)
Composants enfants (BOM)         Aucun sous-composant déclaré.
Exemplaires physiques            Réf. inventaire | Site
Souhaité par
```

**La ligne « Source de conception » s'affiche, vide, à la bonne place** (entre
« Mode d'obtention » et « Fabricant »), **sans casser la mise en page** : les
20 lignes du tableau se rendent normalement, fond `#f2f2f2` conservé.

---

## Écarts constatés

**Aucun écart imputable aux écritures de ce bloc.** Les trois écritures ont
réussi ; les six assertions de la propriété sont dans la charge de propagation
(dont `Property_range`, non tronqué) ; les faits du SUNKKO référencé sont
intacts ; la nouvelle ligne s'affiche proprement.

Deux points ouverts, tous deux liés à la **file de travaux SMW figée** (10
jobs, déjà 4 en fin de bloc 1) — hors périmètre de ce bloc, à traiter par un
`runJobs.php` côté Cyril / fuzzy (cf. `demandes-adminsys.md`) :

1. `browsebysubject` sur `Attribut:Design source` ne rendra les faits directs
   (`Has type`, `Property_range`…) qu'après vidage de la file. Ne pas
   réécrire la page : la consigne est explicite, `_CHGPRO` = lecture en
   retard.
2. Le bloc « Exemplaires physiques » du SUNKKO référencé, qui affichait
   `CWL-0008` en fin de bloc 1, ne rend plus de ligne après la purge de ce
   bloc (en-têtes seuls, sans le `default`). Le fait `Instance_of` de
   l'exemplaire est pourtant intact (vérifié :
   `Instance_of -> Machine_à_souder_par_points_SUNKKO_709AD#0##`,
   `Inventory_ref -> CWL-0008`). C'est le cache de requête `#ask` invalidé
   par la purge et non reconstruit faute de jobs — pas une perte de donnée.
