# Lot 9 — Tâche 7bis (proposition, aucune écriture)

Étape intermédiaire avant la génération de la tâche 7, sur le modèle exact
de la tâche 6bis : `Sourcing_year` existe déjà comme propriété
(`Attribut:Sourcing year`, créée en tâche 1 — `Has type::Number`,
`Property_domain::Category:Referenced item`, cardinalité unique) mais n'est
ni dans `Modèle:Referenced item` ni dans `Formulaire:Referenced item`. Même
défaut que `Located_at` en tâche 6bis : un paramètre présent dans le modèle
mais absent du formulaire est effacé silencieusement à la réédition par
formulaire — donc les deux pages, ensemble, jamais l'une sans l'autre.

Sans elle, l'année qui distingue `Miscanthus 2025` de `Miscanthus 2026`
resterait uniquement dans le titre de la page, pas interrogeable — ce que
la tâche 7 (préparation) avait signalé comme un gap, et que ceci ferme.

## 1. Modèle:Referenced item

### État actuel (relevé, wikitexte complet)

```
<noinclude>
{{Documentation}}
</noinclude>
<includeonly>
{{#set:
|Item_ref={{{Item_ref|}}}
|Item_description={{{Item_description|}}}
|Maturity_level={{{Maturity_level|}}}
|Part_of={{{Part_of|}}}
|+sep=,
|Corresponds_to_organic={{{Corresponds_to_organic|}}}
|Max_head={{{Max_head|}}}
|Supplier={{{Supplier|}}}
|Supplier_reference={{{Supplier_reference|}}}
|Manufacturer={{{Manufacturer|}}}
|Manufacturer_reference={{{Manufacturer_reference|}}}
}}

{| class="wikitable" style="width:100%"
! style="background:#f2f2f2; width:30%;" | Référence (Base 36)
| '''{{{Item_ref|}}}'''
|-
! style="background:#f2f2f2" | Description technique
| {{{Item_description|}}}
|-
! style="background:#e8f0ff" | Item Organique associé
| {{#if:{{{Corresponds_to_organic|}}}|[[{{{Corresponds_to_organic|}}}]]}}
|-
! style="background:#f2f2f2" | État de maturité
| {{#switch: {{{Maturity_level|}}}
 | Idea = Idée
 | Study = Étude
 | Prototype = Prototype
 | Certified = <span style="color:green">'''Certifié (OSHW)'''</span>
 | Obsolete = <span style="color:red">Obsolète</span>
 | #default = {{{Maturity_level|}}}
}}
|-
! style="background:#f2f2f2" | Hauteur de refoulement max. (cm)
| {{{Max_head|}}}
|-
! style="background:#e8f0ff" | Fournisseur
| {{#if:{{{Supplier|}}}|[[{{{Supplier|}}}]]}}
|-
! style="background:#f2f2f2" | Réf. fournisseur
| {{{Supplier_reference|}}}
|-
! style="background:#e8f0ff" | Fabricant
| {{#if:{{{Manufacturer|}}}|[[{{{Manufacturer|}}}]]}}
|-
! style="background:#f2f2f2" | Réf. fabricant
| {{{Manufacturer_reference|}}}
|-
! style="background:#f2f2f2" | Cas d'emploi (Parents)
| {{#arraymap:{{{Part_of|}}}|,|@@@|[[@@@]]|,&#32;}}
|-
! style="background:#f2f2f2" | Composants enfants (BOM)
| 
{{#ask: [[Part_of::{{FULLPAGENAME}}]]
 |?Item_ref = Réf.
 |?Maturity_level = Maturité
 |format=table
 |default=''Aucun sous-composant déclaré.''
 |class=wikitable sortable
}}
|-
! style="background:#f2f2f2" | Exemplaires physiques
|
{{#ask:[[Category:Physical item]][[Instance_of::{{FULLPAGENAME}}]]
 |?Inventory_ref=Réf. inventaire
 |?Inventory_site=Site
 |format=table
 |default=''Aucun exemplaire physique enregistré.''
}}
|}

[[Category:Referenced item]]
</includeonly>
```

### Diff proposé

```diff
 |Supplier={{{Supplier|}}}
 |Supplier_reference={{{Supplier_reference|}}}
+|Sourcing_year={{{Sourcing_year|}}}
 |Manufacturer={{{Manufacturer|}}}
 |Manufacturer_reference={{{Manufacturer_reference|}}}
```

```diff
 ! style="background:#f2f2f2" | Réf. fournisseur
 | {{{Supplier_reference|}}}
+|-
+! style="background:#f2f2f2" | Année d'obtention
+| {{{Sourcing_year|}}}
 |-
 ! style="background:#e8f0ff" | Fabricant
```

Placé dans le groupe « fournisseur » (`Supplier`, `Supplier_reference`,
`Sourcing_year`), avant `Manufacturer` — cohérent avec la définition de la
propriété (« année d'obtention du lot »), pas de fond `#e8f0ff` particulier
(pas un lien vers une autre page, une valeur numérique brute comme
`Max_head`).

### Diff proposé — Correctif (filtre de catégorie manquant)

Même défaut que celui corrigé en tâche 6bis sur `Modèle:Physical item` —
l'autre moitié de la « correction n° 5 » (décompte informel des corrections
en attente à travers les rapports du lot 9, fermée sur le côté physique en
tâche 6bis). La requête « Composants enfants (BOM) » n'a aucun filtre de
catégorie, contrairement à « Exemplaires physiques » juste en dessous
(`[[Category:Physical item]]` déjà présent). `Part_of` est partagé par
plusieurs classes de conception : sans filtre, un enfant non référencé
portant accidentellement le même `Part_of` remonterait dans le tableau.

```diff
 ! style="background:#f2f2f2" | Composants enfants (BOM)
 | 
-{{#ask: [[Part_of::{{FULLPAGENAME}}]]
+{{#ask: [[Category:Referenced item]] [[Part_of::{{FULLPAGENAME}}]]
  |?Item_ref = Réf.
  |?Maturity_level = Maturité
  |format=table
  |default=''Aucun sous-composant déclaré.''
  |class=wikitable sortable
 }}
```

Édition séparée, résumé `[Correctif]` — pas une tâche du lot 9, pas de
numéro de lot.

### Note — `+sep=,` déjà présent sur `Part_of`

En relisant l'état actuel de `Modèle:Referenced item` pour ce diff, `Part_of`
porte déjà `|+sep=,` juste après lui — fait lors d'un lot antérieur à ce
travail, rien à faire ici.

**Mais ceci ne correspond pas à la « correction en attente n° 3 »** telle
qu'établie dans les rapports du lot 9 (`lot-9-cadrage-plantes.md` lignes
96-98, `lot-9-tache0-rapport.md` ligne 155) : ce numéro y désigne
constamment la troncature au tiret de `Module:Base36`
(`clean:match("[%w]+")`), un défaut distinct, non lié à `+sep=,`, et
confirmé **toujours ouvert** dans ces mêmes rapports. Par ailleurs
`CLAUDE.md` lui-même (section « Corrections en attente sur les modèles »)
n'a jamais listé que deux points, jamais de n° 3 — vérifié sur l'historique
git du fichier depuis sa création (commit 7701949).

Je n'ai donc **pas** noté que la correction n° 3 serait caduque : ce serait
faux et contredirait le constat du lot sur la troncature Base36, toujours
valide. Si un numéro différent était voulu pour le fait « `+sep=,` déjà en
place sur `Part_of` de `Referenced item` », à préciser — ce fait en lui-même
est confirmé exact, seul le rattachement au n° 3 ne l'est pas.

## 2. Formulaire:Referenced item

### État actuel (relevé, wikitexte complet)

```
<includeonly>
{{{for template|Referenced item}}}
{| class="formtable"
! Référence (Base 36) :
| {{{field|Item_ref|mandatory|default={{#invoke:Base36|next|{{#ask: [[Category:Functional item||Organic item||Referenced item]] [[Item_ref::+]] |?Item_ref= |sort=Item_ref |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }} }}}
|-
! Description technique :
| {{{field|Item_description|input type=textarea|rows=3}}}
|-
! Item Organique correspondant :
| {{{field|Corresponds_to_organic|input type=combobox|values from category=Organic item}}}
|-
! Maturité :
| {{{field|Maturity_level|input type=dropdown|values=Idea,Study,Prototype,Certified,Obsolete|labels=Idée,Étude,Prototype,Certifié,Obsolète}}}
|-
! S'intègre dans (Parents) :
| {{{field|Part_of|input type=tokens|values from category=Referenced item|list}}}
|-
! Hauteur de refoulement max. (cm) :
| {{{field|Max_head|input type=text}}}
|-
! Fournisseur :
| {{{field|Supplier|input type=combobox|values from property=Supplier}}}
|-
! Réf. fournisseur :
| {{{field|Supplier_reference|input type=text}}}
|-
! Fabricant :
| {{{field|Manufacturer|input type=combobox|values from property=Manufacturer}}}
|-
! Réf. fabricant :
| {{{field|Manufacturer_reference|input type=text}}}
|}
{{{end template}}}
</includeonly>
```

### Diff proposé

```diff
 ! Réf. fournisseur :
 | {{{field|Supplier_reference|input type=text}}}
+|-
+! Année d'obtention : {{#info: Année d'obtention du lot dont provient cet item référencé — reprend la description de la propriété. Distingue par exemple deux lots de la même espèce chez le même fournisseur, achetés des années différentes.}}
+| {{{field|Sourcing_year|input type=text}}}
 |-
 ! Fabricant :
 | {{{field|Manufacturer|input type=combobox|values from property=Manufacturer}}}
```

Champ `Sourcing_year`, non obligatoire (comme demandé), `input type=text` —
même choix que `Max_head`, seul autre champ numérique du formulaire, plutôt
qu'un widget dédié non confirmé disponible pour le type `Number` de Page
Forms sur ce wiki.

## Résumés d'édition prévus (si validé)

1. `[Lot 9][Tâche 7bis] Ajout du paramètre Sourcing_year (#set + affichage) — Modèle:Referenced item`
2. `[Correctif] Filtre Category:Referenced item sur la requête Composants enfants (BOM) — Modèle:Referenced item`
3. `[Lot 9][Tâche 7bis] Ajout du champ Sourcing_year (non obligatoire) — Formulaire:Referenced item`

Modèle avant formulaire, comme en tâche 6bis, ses deux éditions séparées,
chaque écriture relue avant la suivante.
