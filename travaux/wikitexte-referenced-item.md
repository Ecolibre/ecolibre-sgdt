# Wikitexte courant — `Modèle:Referenced item` et `Formulaire:Referenced item`

**Relevé le :** 19 août 2026, sur le wiki vivant (`bin/wiki-get.sh`), pas
depuis une copie locale. **Aucune écriture** — ni sur le modèle, ni sur le
formulaire. Ce fichier prépare le diff pour la tâche 3 du lot 10 (ajout de
`Procurement_route`, `Power_rating`, `Max_thickness`, `Materials_worked`,
`Measured_quantities`) ; le diff sera soumis à Cyril avant toute écriture,
garde-fou 6 non levé pour ces deux pages.

---

## 1. `Modèle:Referenced item` — revid **549**

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
|Sourcing_year={{{Sourcing_year|}}}
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
! style="background:#f2f2f2" | Année d'obtention
| {{{Sourcing_year|}}}
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
{{#ask: [[Category:Referenced item]] [[Part_of::{{FULLPAGENAME}}]]
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

### Propriétés câblées dans le modèle (bloc `#set`)

| # | Propriété | Note |
|---|---|---|
| 1 | `Item_ref` | |
| 2 | `Item_description` | |
| 3 | `Maturity_level` | |
| 4 | `Part_of` | `+sep=,` — seule propriété multivaluée du bloc |
| 5 | `Corresponds_to_organic` | |
| 6 | `Max_head` | |
| 7 | `Supplier` | |
| 8 | `Supplier_reference` | |
| 9 | `Sourcing_year` | |
| 10 | `Manufacturer` | |
| 11 | `Manufacturer_reference` | |

Onze propriétés câblées. Chacune a sa ligne d'affichage dans le tableau, à
l'exception d'aucune — les onze apparaissent aussi dans le rendu.

---

## 2. `Formulaire:Referenced item` — revid **550**

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
! Année d'obtention : {{#info: Année d'obtention du lot dont provient cet item référencé — reprend la description de la propriété. Distingue par exemple deux lots de la même espèce chez le même fournisseur, achetés des années différentes.}}
| {{{field|Sourcing_year|input type=text}}}
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

### Propriétés câblées dans le formulaire, et type de champ

| # | Propriété | Type de champ |
|---|---|---|
| 1 | `Item_ref` | `text`, `mandatory`, valeur par défaut calculée via `{{#invoke:Base36\|next\|…}}` |
| 2 | `Item_description` | `textarea` (3 lignes) |
| 3 | `Corresponds_to_organic` | `combobox`, valeurs depuis `Category:Organic item` |
| 4 | `Maturity_level` | `dropdown`, valeurs `Idea,Study,Prototype,Certified,Obsolete` (libellés FR distincts) |
| 5 | `Part_of` | `tokens`, `list`, valeurs depuis `Category:Referenced item` |
| 6 | `Max_head` | `text` |
| 7 | `Supplier` | `combobox`, valeurs depuis la propriété `Supplier` |
| 8 | `Supplier_reference` | `text` |
| 9 | `Sourcing_year` | `text`, avec infobulle `{{#info:}}` reprenant la description de la propriété |
| 10 | `Manufacturer` | `combobox`, valeurs depuis la propriété `Manufacturer` |
| 11 | `Manufacturer_reference` | `text` |

Onze champs, un par propriété câblée dans le modèle — correspondance
complète entre les deux pages, aucune propriété du modèle sans champ de
formulaire, aucun champ sans propriété dans le modèle.

---

## 3. Ce qui manque pour la tâche 3

Les cinq propriétés créées en tâche 3 (`Procurement_route`, `Power_rating`,
`Max_thickness`, `Materials_worked`, `Measured_quantities`) n'apparaissent
dans aucun des deux blocs ci-dessus. Aucune modification n'a été apportée
ici — ce relevé sert de base au diff à soumettre à Cyril.
