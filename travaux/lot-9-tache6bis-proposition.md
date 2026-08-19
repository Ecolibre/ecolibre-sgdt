# Lot 9 — Tâche 6bis (proposition, aucune écriture)

Étape intermédiaire avant la tâche 7 : ajouter `Located_at` à la classe
physique, sur les deux pages ensemble (modèle + formulaire), pour éviter le
défaut du lot 8 (paramètre effacé silencieusement à la réédition par
formulaire s'il manque au formulaire).

La propriété `Attribut:Located at` existe déjà en production, correctement
typée :

```
[[Has type::Page]]
[[Property_description_FR::Lieu où se trouve cet exemplaire physique.]]
[[Property_description_EN::Place where this physical specimen is located.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::lieu]]
```

Rien à faire côté `Attribut:`. Seuls le modèle et le formulaire manquent le
paramètre.

## 1. Modèle:Physical item

### État actuel (relevé, wikitexte complet)

```
<noinclude>
{{Documentation}}
</noinclude>
<includeonly>
{{#set:
|Inventory_site={{{site_code|}}}
|Inventory_number={{{ref_number|}}}
|Inventory_ref={{{site_code|}}}-{{{ref_number|}}}
|Item_description={{{description|}}}
|Instance_of={{{model_link|}}}
|Part_of={{{physical_parent|}}}
|Serial_number={{{sn|}}}
}}

{| class="wikitable" style="width:100%"
! style="background:#f2f2f2; width:30%;" | Référence d'inventaire
| '''{{{site_code|}}}-{{{ref_number|}}}'''
|-
! style="background:#f2f2f2" | Modèle (Réf. technique)
| {{#if:{{{model_link|}}}|[[{{{model_link|}}}]]}}
|-
! style="background:#f2f2f2" | Description individuelle
| {{{description|}}}
|-
! style="background:#f2f2f2" | Numéro de série (Constructeur)
| {{{sn|''Non spécifié''}}}
|-
! style="background:#e8f0ff" | Installé dans (Parent physique)
| {{#if:{{{physical_parent|}}}|[[{{{physical_parent|}}}]]}}
|-
! style="background:#f2f2f2" | Éléments contenus (Enfants)
| 
{{#ask: [[Part_of::{{FULLPAGENAME}}]]
 |?Inventory_ref = Réf.
 |format=table
 |default=''Cet item ne contient aucun sous-élément physique.''
 |class=wikitable sortable
}}
|}

[[Category:Physical item]]
</includeonly>
```

### Diff proposé — Tâche 6bis (ajout Located_at)

```diff
 |Instance_of={{{model_link|}}}
 |Part_of={{{physical_parent|}}}
+|Located_at={{{Located_at|}}}
 |Serial_number={{{sn|}}}
```

```diff
 ! style="background:#e8f0ff" | Installé dans (Parent physique)
 | {{#if:{{{physical_parent|}}}|[[{{{physical_parent|}}}]]}}
+|-
+! style="background:#e8f0ff" | Se trouve à (Lieu)
+| {{#if:{{{Located_at|}}}|[[{{{Located_at|}}}]]}}
 |-
 ! style="background:#f2f2f2" | Éléments contenus (Enfants)
```

Nouveau paramètre de template : `Located_at`, identique au nom de la
propriété SMW qu'il alimente — pas `location`. **Correction par rapport à la
première version de cette proposition**, qui avait choisi `location` en
pensant éviter une collision de nom entre paramètre de modèle et propriété
SMW. Cette collision n'existe pas : un paramètre de modèle
(`{{{Located_at|}}}`) et une propriété SMW (`Located_at::...` dans un
`#set`) vivent dans deux espaces de noms distincts, comme le montrent déjà
les cinq champs du bloc facette végétal posé en tâche 4
(`Planting_date`, `Planting_rank`, `Planted_count`, `Specimen_status`,
`Propagated_from` — paramètre et propriété identiques, sans collision).

**Dette de nommage, non traitée ici** : les quatre champs plus anciens de ce
même formulaire (`site_code`, `model_link`, `sn`, `physical_parent`) ne
suivent pas cette convention — ils datent d'avant qu'elle ne soit établie
en tâche 4. Ce n'est pas une raison de continuer à s'en écarter sur un champ
neuf ; ce n'est pas non plus le lieu de les rebaptiser rétroactivement, ce
qui casserait la réédition par formulaire de tous les items physiques déjà
créés (paramètre renommé = valeur perdue au premier ré-enregistrement, même
mécanisme que le défaut du lot 8). À traiter, si un jour c'est décidé,
comme une migration dédiée et non comme un effet de bord de cette tâche.

Ligne d'affichage sur le même fond `#e8f0ff` que « Installé dans », pour
marquer visuellement la paire à ne pas confondre.

### Diff proposé — Correctif (filtre de catégorie manquant)

`Corrections en attente sur les modèles` de `CLAUDE.md` n'énumère
formellement que deux points, mais un décompte informel poursuivi à travers
les rapports du lot 9 (`lot-9-cadrage-plantes.md` 1.7–1.9, `lot-9-amendement-1.md`)
est rendu à 4 (doublons Base36 non détectés · séquence Base36 des items
physiques, fermée · troncature du module Base36 au tiret · requêtes de
facette sans filtre de classe). Le défaut ci-dessous en est un cinquième :
la requête « Éléments contenus » de ce modèle n'a **aucun** filtre de
catégorie, contrairement à celle de `Modèle:Organic item` qui reste dans sa
propre classe par construction (`Corresponds_to_organic`/`Part_of` n'y sont
alimentés que par du organique). Ici, `Part_of` est partagé par plusieurs
classes de conception : sans filtre, un enfant non physique portant
accidentellement le même `Part_of` remonterait dans le tableau.

```diff
 ! style="background:#f2f2f2" | Éléments contenus (Enfants)
 | 
-{{#ask: [[Part_of::{{FULLPAGENAME}}]]
+{{#ask: [[Category:Physical item]] [[Part_of::{{FULLPAGENAME}}]]
  |?Inventory_ref = Réf.
  |format=table
  |default=''Cet item ne contient aucun sous-élément physique.''
  |class=wikitable sortable
 }}
```

Édition séparée, résumé `[Correctif]` — ce n'est pas une tâche du lot 9, ne
pas lui réserver de numéro de tâche.

## 2. Formulaire:Physical item

### État actuel (relevé, wikitexte complet)

```
<includeonly>
{{{info|add title=Ajouter un Item Physique|edit title=Modifier l'Item Physique}}}
{{{for template|Physical item}}}
{| class="formtable"
! Code de site : {{#info: À modifier uniquement pour publier l'exemplaire d'un partenaire ; dans ce cas, recopier aussi le numéro depuis la source.}}
| {{{field|site_code|mandatory|default={{Préfixe site}}|size=5}}}
|-
! Numéro d'inventaire : {{#info: Calculé automatiquement pour un exemplaire de ce site. Pour publier l'exemplaire d'un partenaire, recopier son numéro d'origine plutôt que de laisser le calcul.}}
| {{{field|ref_number|mandatory|default={{#invoke:Base36|next|{{#ask: [[Category:Physical item]] [[Inventory_site::{{Préfixe site}}]] [[Inventory_number::+]] |?Inventory_number= |sort=Inventory_number |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }}|placeholder=0001}}}
|-
! Modèle d'origine :
| {{{field|model_link|input type=combobox|values from category=Referenced item|mandatory}}}
|-
! Description / État :
| {{{field|description|input type=textarea|rows=2|placeholder=Ex: Exemplaire de test, batterie neuve...}}}
|-
! Numéro de série :
| {{{field|sn|placeholder=SN-123456}}}
|-
! Installé dans :
| {{{field|physical_parent|input type=combobox|values from category=Physical item}}}
|}
{{{end template}}}

== Facettes ==
{{Formulaire:Physical item/bloc facette végétal}}

{{{standard input|free text}}}
{{{standard input|save}}}
</includeonly>
```

### Diff proposé

```diff
 ! Installé dans :
 | {{{field|physical_parent|input type=combobox|values from category=Physical item}}}
+|-
+! Se trouve à : {{#info: « Se trouve à » (Located_at) pointe vers un lieu — la machine sur son site ; différent d'« Installé dans » (physical_parent), qui pointe vers un autre item physique — une pompe dans une machine.}}
+| {{{field|Located_at|input type=combobox|values from category=Lieu}}}
 |}
 {{{end template}}}
```

Champ `Located_at` (corrigé — pas `location`, même motif que côté modèle),
combobox, `values from category=Lieu`, pas de flag `mandatory` (non
obligatoire, comme demandé). Le texte du `#info` reprend la distinction déjà
rédigée dans `Catégorie:Lieu` (« se trouve à » / `Located_at` vs « installé
dans » / `physical_parent`), reformulée sans guillemets ni apostrophes en
style wikitexte cru pour rester lisible en tooltip.

## Résumés d'édition prévus (si validé)

Trois écritures, dans cet ordre, chacune relue et vérifiée avant la suivante :

1. `[Lot 9][Tâche 6bis] Ajout du paramètre Located_at (#set + affichage) — Modèle:Physical item`
2. `[Correctif] Filtre Category:Physical item sur la requête Éléments contenus — Modèle:Physical item`
3. `[Lot 9][Tâche 6bis] Ajout du champ Located_at (combobox, values from category=Lieu, non obligatoire) — Formulaire:Physical item`

Le modèle reçoit deux éditions distinctes (une par résumé, garde-fou n° 2 de
`CLAUDE.md`) avant que le formulaire ne soit posé — aucune des deux ne rend
le modèle inutilisable seule, donc aucune ne dépend que le formulaire soit
déjà à jour.
