# Lot 9 — Tâche 4 — Préparation : bloc de formulaire, item physique

**Aucune écriture sur le wiki.** Préparation et proposition uniquement.

## 1. Nom réel du formulaire et de ses sous-pages

`action=query&list=allpages&apnamespace=106&apprefix=Physical item` — deux
pages, pas déduites :

| pageid | Titre |
|---|---|
| 64 | `Formulaire:Physical item` |
| 68 | `Formulaire:Physical item/doc` |

**Aucune sous-page `/bloc facette végétal` n'existe.** Le nom proposé plus
bas (`Formulaire:Physical item/bloc facette végétal`) est une création par
analogie avec `Formulaire:Organic item/bloc facette végétal` — analogie
assumée pour un nom à **créer**, différent de « déduire le nom d'une page
déjà existante », ce que la tâche interdisait.

## 2. Wikitexte actuel de `Formulaire:Physical item` — relevé avant toute modification

Relu en direct le 15 août 2026 (`bin/wiki-get.sh`), intégral, avant toute
modification. **C'est le retour arrière en cas de problème.**

```wikitext
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

{{{standard input|free text}}}
{{{standard input|save}}}
</includeonly>
```

## 3. Point de dépendance vérifié avant de proposer les valeurs du formulaire

`browsebysubject` sur `Attribut:Specimen_status`, relu à l'instant : **la
correction « ajout de en réserve » reste bloquée** par le verrou de
propagation SMW consigné en `lot-9-tache0-rapport.md` §10 — `_PVAL` ne porte
encore que les 5 valeurs d'origine (`en place`, `repris`, `souffrant`,
`mort`, `remplacé`). La liste de valeurs du champ `Specimen_status` proposée
ci-dessous reflète donc l'**état réellement stocké aujourd'hui**, pas
l'état visé par la correction en attente. **À revoir quand la correction
sera passée** — ajouter `en réserve` en tête de la liste `values=` du champ
formulaire, symétriquement à `Allows value`.

**Ce point est révisé plus bas.** Voir « Amendement — décision sur le point
ouvert du §3 » : la conclusion effectivement écrite sur le wiki est
l'inverse de ce qui précède — `en réserve` a été ajouté en tête de
`values=` sans attendre la levée du verrou. Une lecture de ce seul §3
conclurait à l'opposé de ce qui a été fait ; l'amendement fait foi.

## 4. Wikitexte proposé pour `Formulaire:Physical item/bloc facette végétal`

Montage copié à l'identique de `Formulaire:Organic item/bloc facette
végétal` (relu en direct) : `<nowiki>` ligne par ligne autour de chaque
balise Page Forms (`for template`, `field`, `end template`), contrainte de
double passe de parsing confirmée au lot 8.

```wikitext
<nowiki>{{{for template|Physical facet plant|label=Caractéristiques de plantation|multiple|minimum instances=0|maximum instances=1|add button text=Ajouter les caractéristiques de plantation}}}</nowiki>
{| class="formtable"
! colspan="2" | ''Plantation''
|-
! Date de plantation :
| <nowiki>{{{field|Planting_date|input type=date}}}</nowiki>
|-
! Rang le long de la butte :
| <nowiki>{{{field|Planting_rank|input type=text}}}</nowiki>
|-
! Nombre d'individus :
| <nowiki>{{{field|Planted_count|input type=text}}}</nowiki>
|-
! colspan="2" | ''État et filiation''
|-
! Statut :
| <nowiki>{{{field|Specimen_status|mandatory|input type=dropdown|values=en place,repris,souffrant,mort,remplacé}}}</nowiki>
|-
! Issu de :
| <nowiki>{{{field|Propagated_from|input type=combobox|values from category=Physical item}}}</nowiki>
|}
<nowiki>{{{end template}}}</nowiki>
```

Choix de saisie par champ :
- `Planting_date` (`Has type::Date`) : `input type=date`, premier usage de ce
  type de champ sur ce wiki (aucun précédent trouvé lors de la tâche 0) — à
  vérifier en bac à sable (tâche 5) que le widget produit une valeur lisible
  par SMW.
- `Planting_rank`, `Planted_count` (`Has type::Number`) : `input type=text`,
  cohérent avec le traitement des propriétés `Number` déjà en place
  (`Adult_height`, `Adult_width`… dans le bloc organique).
- `Specimen_status` : `mandatory` (seul champ obligatoire du bloc, sert de
  garde au `#if` du modèle — décision déjà actée en tâche 2), `dropdown`
  avec les 5 valeurs **actuellement stockées** (voir §3).
- `Propagated_from` (`Has type::Page`, cardinalité `single`) : `combobox`
  avec `values from category=Physical item`, même motif que `physical_parent`
  et `model_link` déjà en place sur ce même formulaire.

## 5. Diff proposé pour `Formulaire:Physical item`

Une seule insertion, après `{{{end template}}}` de la section de classe et
avant les lignes `{{{standard input|...}}}` — même emplacement que les blocs
de facette sur `Formulaire:Organic item`.

```diff
 {{{end template}}}
 
+== Facettes ==
+{{Formulaire:Physical item/bloc facette végétal}}
+
 {{{standard input|free text}}}
 {{{standard input|save}}}
```

## Amendement — décision sur le point ouvert du §3

Revérifié en direct le 15 août 2026 (`browsebysubject` sur
`Attribut:Specimen_status`) juste avant écriture : `_PVAL` porte toujours
exactement les 5 valeurs d'origine, aucun changement depuis la rédaction du
§3.

**Décision de Cyril : ne pas attendre la levée du verrou.** `en réserve` est
ajouté en tête de `values=` du champ `Specimen_status` dès cette écriture,
avant que `Allows value` sur `Attribut:Specimen_status` porte cette valeur
côté propriété.

Motif consigné : la correction de la propriété n'est pas en attente d'une
décision mais d'un job serveur bloqué (verrou de propagation SMW, cf.
`lot-9-tache0-rapport.md` §10). Aligner le formulaire sur l'état actuellement
bloqué de la propriété propagerait ce blocage au formulaire. Un avertissement
« Has improper value for » tant que le verrou n'est pas levé est acceptable ;
l'impossibilité de saisir une réserve au formulaire ne l'est pas.

Valeur finale du champ, formulaire divergent de `Allows value` jusqu'à
correction de la propriété :
```
values=en réserve,en place,repris,souffrant,mort,remplacé
```

Deux `{{#info:}}` ajoutés en tête de cellule, même emplacement que les
`#info` déjà en place sur `Formulaire:Physical item` (§2) :
- `Propagated_from` : « Liste tous les items physiques, y compris non
  végétaux. Choisir une plantation. »
- `Specimen_status` : « en réserve : matériel conservé avant mise en terre. »

## État

Écriture en cours (tâche 4), conformément à la décision ci-dessus. Voir
`lot-9-tache4-rapport.md` pour le résultat.
