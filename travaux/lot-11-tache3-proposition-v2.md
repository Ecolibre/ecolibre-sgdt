# Lot 11 — tâche 3 : proposition pour Formulaire:Lieu (v2, corrigée)

2026-08-24. Toujours aucune écriture — `Formulaire:Lieu`, `Modèle:Préfixe
lieu` n'existent pas, `Formulaire:Physical item` n'a pas été touché
(point 3, mesure demandée, pas de correction). Reprend `lot-11-tache3-
proposition.md` (v1) point par point ; ce qui n'est pas mentionné n'a pas
changé (point 4).

## 1. Séparateur décimal — wikitexte en virgule, SMW stocké en point

Pas de contradiction, les deux relevés étaient exacts, chacun sur une
couche différente. Vérifié à l'instant, les deux côte à côte sur la même
page :

**Wikitexte de `Le Buisson de Cerzat`** (`bin/wiki-get.sh`) :
```
{{Lieu
|Place_name=
|Postal_address=
|Latitude=45,171420
|Longitude=3,488276
|Located_in=
}}
```

**`browsebysubject` sur la même page** :
```
Latitude -> ['45.17142']
Longitude -> ['3.488276']
```

**Le wikitexte porte la virgule** (`45,171420`, telle que tapée à la
création de la page) ; **le triplet SMW stocké porte le point**
(`45.17142`, la forme canonique après normalisation numérique). Les deux
propriétés sont de type `_num` (`Attribut:Latitude`, `Attribut:Longitude`,
`Property_range=degrés décimaux`, vérifié à cette occasion) — même
famille de type que `Max_head`/`Power_rating` dans `Formulaire:Referenced
item`, dont l'infobulle documente déjà ce comportement (virgule acceptée
en saisie, convertie ; point seul accepté aussi ; un mélange des deux
dans la même valeur est rejeté silencieusement).

**Infobulle ajoutée** sur `Latitude` et `Longitude` dans le formulaire,
texte identique à celui de `Max_head`/`Power_rating` — même patron, même
risque, même formulation :

```
! Latitude : {{#info: Décimales avec la virgule. Un point est converti automatiquement ; un nombre mêlant point et virgule est refusé.}}
| {{{field|Latitude}}}
|-
! Longitude : {{#info: Décimales avec la virgule. Un point est converti automatiquement ; un nombre mêlant point et virgule est refusé.}}
| {{{field|Longitude}}}
```

Le refus en v1 visait `INSEE_code` (une contrainte de validation que le
modèle ne porte pas), pas la documentation d'un piège de saisie déjà
connu et déjà documenté ailleurs sur ce même patron — la remarque tient,
corrigé.

## 2. Lieu parent illisible — `mapping property=Place_name`, vérifié disponible

**Version installée : Page Forms 5.8.1** (`action=query&meta=siteinfo&
siprop=extensions`, vcs-date 2025-03-18). Aucun formulaire existant sur ce
wiki n'utilise `mapping property=` (les quatre formulaires relus en v1
n'en portent aucun) : pas de précédent local à citer, vérification faite
par la documentation de l'extension plutôt que par un test en écriture.

**Documentation officielle** (`Extension:Page_Forms/Values, mappings and
autocompletion`) : le paramètre existe, cité tel quel —

> « mapping property=*property name* — Used for fields that select pages
> with 'combobox', 'tokens', 'listbox', and 'dropdown' input types. For
> each possible value, displays a SMW property from that page rather than
> the title of the page, but saves the title of the selected page(s) as
> the field value. »

`combobox` (le type utilisé pour `Located_in`) fait partie des types
couverts. Introduit en **version 3.4** (16 septembre 2015, notes de
version : « "mapping property=", "mapping cargo table=" and "mapping
cargo field=" parameters added to "field" tag ») — largement antérieur à
la version installée. **Supporté, sans réserve de version.**

Point important de la citation, à ne pas manquer : la liste affiche la
propriété mappée, **mais enregistre toujours le titre de la page**
choisie comme valeur du champ — `Located_in` continuera de stocker
`LOC-0002`, pas le nom affiché. Exactement le comportement voulu : lisible
à la sélection, référence stockée intacte.

**Correction appliquée** :

```
! Lieu parent : {{#info: « Se trouve dans » (Located_in) — un lieu parent unique, ou aucun pour un lieu de premier niveau (une commune, par exemple). La liste affiche le nom d'usage des lieux existants, pas leur référence.}}
| {{{field|Located_in|input type=combobox|values from category=Lieu|mapping property=Place_name}}}
```

**Réserve résiduelle, mineure** : si un lieu candidat n'a pas encore de
`Place_name` (les quatre lieux existants, avant leur rattachement en
tâche 5), le comportement d'affichage de `mapping property=` pour ce
cas précis n'est pas documenté dans la page consultée — vraisemblablement
un repli sur le titre, à vérifier en pratique au premier essai réel du
formulaire plutôt qu'en lecture. Situation transitoire : `Place_name`
devient obligatoire pour toute nouvelle création (tâche 3, ce
formulaire), et les quatre lieux existants seront rattachés avec un nom
d'usage en tâche 5. Signalé, pas bloquant.

## 3. Même défaut en production — `Formulaire:Physical item`, mesure demandée, non modifié

Ligne en cause, en service, inchangée :
```
! Se trouve à : {{#info: ...}}
| {{{field|Located_at|input type=combobox|values from category=Lieu}}}
```

**C'est la même correction qu'au point 2** : ajouter `|mapping
property=Place_name}}}`. Rien de spécifique à `Located_in` ne la rend
inapplicable ici — même widget (`combobox`), même catégorie source
(`Category:Lieu`), même propriété de mappage (`Place_name`), même
support de version. Techniquement :

```
| {{{field|Located_at|input type=combobox|values from category=Lieu|mapping property=Place_name}}}
```

**Non appliqué ici**, comme demandé — à titre de mesure de ce qui
changerait avant toute décision, pas de correction :

- **Portée** : c'est le champ par lequel passent les 40 plantations
  déjà enregistrées et toute future création d'item physique — pas une
  page de test, une page en service quotidien.
- **Régression provoquée par le lot 11, pas préexistante** : tant que
  les titres de lieu restent des noms (`Le Buisson de Cerzat`), ce
  sélecteur est déjà lisible ; il ne devient illisible qu'après la
  bascule des titres en `LOC-NNNN` (tâche 5). Le lot qui crée le
  problème est donc aussi celui qui peut le corriger avant qu'il ne se
  manifeste — mais seulement si la tâche 5 (retitrage) n'intervient pas
  avant que ce champ soit corrigé, sans quoi il y aurait une fenêtre où
  `Formulaire:Physical item` afficherait des références opaques pour de
  vrai, en production.
- **Rien d'autre à mesurer trouvé en lecture** : le patron de la ligne
  est identique à celui de `Located_in` proposé au point 2, aucune
  différence de widget, de type de propriété ou de cardinalité qui
  changerait le risque technique de l'ajout lui-même. La seule variable
  est l'ordonnancement — corriger ce champ avant, pendant, ou après la
  tâche 5 — qui reste un choix de Cyril, pas une question technique.

## 4. Inchangé — validé tel quel

Écart assumé sur `page name=` et sa justification, analyse de la
collision de titre (point 5 de la v1), règle « un lieu à la fois » pour
la tâche 5, refus de recopier l'infobulle de `site_code` (fond faux pour
`LOC`) : identiques à la v1, non repris ici in extenso.

## 5. Noté, non construit — l'appartement est à Chilhac

Cyril a répondu : l'appartement (`Atelier appartement`, quatrième lieu
non prévu par le cadrage, signalé en tâche 2 v2 point 6) se rattache à
la commune de **Chilhac**, pas à Cerzat. Le rattachement exact —
`Located_in` vers `Jardin de Chilhac`, `Terrasse de Chilhac`, ou un
nouveau sous-lieu de Chilhac propre à l'atelier — reste à trancher.
Rien construit ici : à reprendre en tâche 5, avec la création des dix
pages de lieu et le rattachement des trois lieux existants déjà prévu
par le cadrage.

## Formulaire:Lieu — proposition corrigée, intégrale

```
<includeonly>
{{{info|add title=Ajouter un Lieu|edit title=Modifier le Lieu|page name=<Location_site>-<Location_number>}}}
{{{for template|Lieu}}}
{| class="formtable"
! Nom d'usage : {{#info: Seul élément lisible de la page — le titre porte la référence LOC-NNNN, pas le nom. Toujours renseigner.}}
| {{{field|Place_name|mandatory}}}
|-
! Type : {{#info: Texte libre — terrain, bâtiment, pièce... La diversité réelle des lieux ne se prête pas encore à une liste fermée.}}
| {{{field|Location_type|input type=text}}}
|-
! Code de site :
| {{{field|Location_site|mandatory|default={{Préfixe lieu}}|size=5}}}
|-
! Référence : {{#info: Calculée automatiquement à l'ouverture du formulaire — voir la mise en garde sur le calcul à l'affichage avant de créer plusieurs lieux en parallèle.}}
| {{{field|Location_number|mandatory|default={{#invoke:Base36|next|{{#ask: [[Category:Lieu]] [[Location_site::{{Préfixe lieu}}]] [[Location_number::+]] |?Location_number= |sort=Location_number |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }}|placeholder=0001}}}
|-
! Code INSEE : {{#info: Uniquement pour un lieu de type commune. Laisser vide pour tout autre type de lieu.}}
| {{{field|INSEE_code|input type=text|placeholder=43044}}}
|-
! Lieu parent : {{#info: « Se trouve dans » (Located_in) — un lieu parent unique, ou aucun pour un lieu de premier niveau (une commune, par exemple). La liste affiche le nom d'usage des lieux existants, pas leur référence.}}
| {{{field|Located_in|input type=combobox|values from category=Lieu|mapping property=Place_name}}}
|-
! Adresse postale :
| {{{field|Postal_address}}}
|-
! Latitude : {{#info: Décimales avec la virgule. Un point est converti automatiquement ; un nombre mêlant point et virgule est refusé.}}
| {{{field|Latitude}}}
|-
! Longitude : {{#info: Décimales avec la virgule. Un point est converti automatiquement ; un nombre mêlant point et virgule est refusé.}}
| {{{field|Longitude}}}
|}
{{{end template}}}

{{{standard input|free text}}}
{{{standard input|save}}}
</includeonly>
```

Changements par rapport à la v1 : infobulle décimale sur `Latitude` et
`Longitude` (point 1), `|mapping property=Place_name` ajouté à `Located_
in` et phrase ajoutée à son infobulle (point 2). Le reste — ordre des
champs, `page name=`, construction de `Location_number`, absence de
`Location_lineage` et de bloc facette — identique à la v1.

`Modèle:Préfixe lieu` (proposé en v1) et le reste de l'analyse de la v1
(patron `Formulaire:Physical item` relu intégralement, absence de `page
name=` sur les quatre formulaires existants, ce qui ne se transpose pas
du patron) ne changent pas et ne sont pas reproduits ici.
