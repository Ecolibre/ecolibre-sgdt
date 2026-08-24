# Lot 11 — tâche 3 : proposition pour Formulaire:Lieu

2026-08-23. Lecture et proposition seulement. Aucune écriture sur le
wiki — ni `Formulaire:Lieu`, ni `Modèle:Préfixe lieu`, qui n'existent pas
encore.

## 1. Formulaire:Physical item relu intégralement — pas de `page name=`

Wikitexte complet (32 lignes, tout entre `<includeonly>`/`</includeonly>`,
pas de section `<noinclude>` sur cette page) :

```
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
|-
! Se trouve à : {{#info: ...}}
| {{{field|Located_at|input type=combobox|values from category=Lieu}}}
|}
{{{end template}}}

== Facettes ==
{{Formulaire:Physical item/bloc facette végétal}}

{{{standard input|free text}}}
{{{standard input|save}}}
```

**Le point le plus délicat de la consigne se résout par une négative :
il n'y a pas de formule `page name=` dans le `{{{info}}}` de ce
formulaire.** La ligne est `{{{info|add title=...|edit title=...}}}`
— rien d'autre. J'ai cherché la composition du titre ailleurs
(`Formulaire:Physical item/doc`, qui n'est qu'un renvoi vers le code
source via `{{#invoke:Source|get|...}}`, sans rien sur le titrage) et
sur les trois autres formulaires de la chaîne de conception, par
prudence — même constat partout :

| Formulaire | `{{{info}}}` | `page name=` |
|---|---|---|
| Functional item | `add title=`/`edit title=` seulement | absent |
| Organic item | pas de `{{{info}}}` du tout | absent |
| Referenced item | pas de `{{{info}}}` du tout | absent |
| Physical item | `add title=`/`edit title=` seulement | absent |

**Aucun formulaire de ce wiki ne calcule le titre de page.** Les titres
observés — `Ail éléphant — Le Buisson de Cerzat (ECL-0041)`, `Groseillier
à maquereau Dunkerque 2024`... — combinent un nom d'espèce ou une
description avec la référence calculée, une combinaison que Page Forms
ne peut pas produire seul à partir des seuls champs du formulaire. Le
titre est donc saisi à la main par la personne qui remplit le
formulaire, au moment d'ouvrir `Special:FormEdit/Physical item/<titre
choisi>` — le calcul de `ref_number` fournit une valeur par défaut au
*champ*, pas au *titre de la page*.

**Conséquence pour Lieu.** Un titre `LOC-NNNN` n'a, par construction,
aucun élément descriptif à taper à la main — il est entièrement dérivable
de deux champs déjà calculés/défaut avant même l'ouverture du formulaire
(`Location_site`, `Location_number`). C'est exactement le cas où Page
Forms sait faire mieux que le patron : une formule `page name=` peut
produire le titre automatiquement, avec la garantie qu'il vaut toujours
`LOC-NNNN` et rien d'autre — une garantie qu'une saisie manuelle ne peut
pas offrir (faute de frappe sur le numéro, oubli du tiret, `ECL` tapé par
réflexe...). Proposé au point 4, en écart assumé et justifié par rapport
au patron — pas un oubli.

## 2. Modèle:Préfixe site — contenu exact

```
<includeonly>ECL</includeonly><noinclude>
Code à trois lettres de l'organisation qui exploite ce wiki. Il sert de
'''valeur par défaut''' au champ de site à la création d'un item physique.

Il ne détermine pas le site d'un exemplaire déjà enregistré : un exemplaire
détenu par un partenaire et publié ici conserve le code de son détenteur. Le
code de site est une donnée de l'item, pas du wiki.

Se règle une fois à l'installation et ne change plus.

Les codes sont enregistrés dans [[Registre des préfixes de site]].
</noinclude>
```

Un seul mot en zone transcluse (`ECL`), le reste en documentation. La
partie transcluse vaut valeur par défaut de champ, jamais valeur imposée
— le champ `site_code` reste éditable pour recopier le code d'un
partenaire.

## 3. Proposé — Modèle:Préfixe lieu

`Registre des préfixes de site` (relu à cette occasion) documente déjà
`LOC` comme « réservé — lieux publics, non attribuable à un partenaire »
et précise : « Un site partenaire créant des lieux privés utilise son
propre code d'organisation, pas LOC. » Contrairement à `ECL`, qui peut
être remplacé champ par champ pour recopier l'exemplaire d'un partenaire,
`LOC` ne varie donc jamais pour un lieu créé sur ce wiki — pas de
scénario de recopie équivalent à celui de `Modèle:Préfixe site`. Le
texte de documentation ci-dessous s'écarte de celui de `Préfixe site`
pour cette raison, plutôt que de le recopier tel quel :

```
<includeonly>LOC</includeonly><noinclude>
Code réservé aux lieux publiés sur ce wiki (voir [[Registre des préfixes
de site]]). Il sert de '''valeur par défaut''' au champ de site à la
création d'un lieu.

À la différence du code de site d'un item physique, il ne varie pas d'un
lieu à l'autre sur ce wiki : un site partenaire créant ses propres lieux
utilise son code d'organisation, pas LOC — ce sont des lieux différents,
sur des wikis différents, pas des exemplaires recopiés d'une source
externe.

Se règle une fois à l'installation et ne change plus.

Le code est enregistré dans [[Registre des préfixes de site]].
</noinclude>
```

## 4. Proposé — Formulaire:Lieu

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
! Lieu parent : {{#info: « Se trouve dans » (Located_in) — un lieu parent unique, ou aucun pour un lieu de premier niveau (une commune, par exemple).}}
| {{{field|Located_in|input type=combobox|values from category=Lieu}}}
|-
! Adresse postale :
| {{{field|Postal_address}}}
|-
! Latitude :
| {{{field|Latitude}}}
|-
! Longitude :
| {{{field|Longitude}}}
|}
{{{end template}}}

{{{standard input|free text}}}
{{{standard input|save}}}
</includeonly>
```

Notes de construction, champ par champ :

- **`Place_name` obligatoire** (`mandatory`) — c'est le changement de
  statut demandé : `Catégorie:Lieu` dit encore aujourd'hui qu'il est
  facultatif « quand les deux [le nom et le titre] coïncident », phrase
  devenue fausse dès que le titre est `LOC-NNNN` (signalé en tâche 2,
  point 6, toujours en attente de correction en tâche 7).
- **`Location_type`** : `input type=text`, aucun `values=`, donc aucun
  `Allows value` — texte réellement libre, conforme à la consigne.
- **`Location_site`** : même construction que `site_code` dans le
  patron, `default={{Préfixe lieu}}`, `size=5` recopié tel quel (le
  patron l'utilise aussi pour un code à trois lettres, sans que la
  taille du champ ait besoin de correspondre exactement à la longueur
  de la valeur).
- **`Location_number`** : patron exact du numéro d'inventaire, transposé
  propriété par propriété — `Category:Physical item` → `Category:Lieu`,
  `Inventory_site`/`Inventory_number` → `Location_site`/`Location_number`.
  Le filtre `[[Location_site::{{Préfixe lieu}}]]` interroge toujours la
  banque `LOC`, jamais la valeur en cours de saisie dans le champ
  `Location_site` du même formulaire — comme le patron interroge
  toujours `{{Préfixe site}}` (`ECL`) et non le champ `site_code` en
  cours de saisie. Le `#ask` filtre sur `Location_number::+` (la valeur
  brute stockée, jamais préfixée) avant de la passer à
  `{{#invoke:Base36|next|...}}` : le module s'arrête au premier
  caractère non alphanumérique (`clean:match("[%w]+")`, relu dans
  `Module:Base36` à cette occasion) et casserait sur une valeur
  préfixée — ce que ce montage évite en ne lui passant jamais autre
  chose que `0004`, jamais `LOC-0004`. Aucun nouveau risque par rapport
  au patron déjà en service.
- **`INSEE_code`** : `input type=text`, pas de `mandatory` — facultatif,
  avec l'infobulle demandée limitant sa pertinence aux communes.
- **`Located_in`** : `input type=combobox`, pas `input type=tokens` —
  un seul lieu sélectionnable, jamais une liste. Construction identique
  à `physical_parent` dans le patron (`combobox`, `values from
  category=...`), pas à `Part_of` de `Formulaire:Referenced item` qui
  est `input type=tokens|list` pour une propriété multivaluée. `Located_
  in` est `single` côté propriété (`Property_cardinality`, vérifié en
  tâche 0/2) : le choix de widget correspond à la cardinalité réelle,
  pas seulement à la consigne.
- **`Postal_address`, `Latitude`, `Longitude`** : champs texte simples,
  sans contrainte, comme dans `Modèle:Lieu` existant. Aucune conversion
  numérique n'est imposée ici (contrairement à `Max_head`/`Power_rating`
  dans `Formulaire:Referenced item`, qui ont une infobulle sur le
  séparateur décimal) — les deux lieux déjà en place stockent leurs
  coordonnées avec une virgule (`45,171420`), pas un point ; je n'ajoute
  pas de contrainte qui n'existe pas encore côté modèle.
- **Pas de `Location_lineage`** : absent du formulaire, comme demandé et
  comme déjà acté dans `lot-11-cadrage-lieux.md` (tâche 3 : « `Location_
  lineage` n'est pas un champ de formulaire : elle est calculée [tâche
  4] »).
- **Pas de bloc facette** : voir point 6.

## 5. Signalé, non résolu — calcul à l'affichage, pas à l'enregistrement

Le `default=` de `Location_number` (comme celui de `ref_number` dans le
patron) s'évalue au moment où le formulaire s'affiche : c'est un `#ask`
sur l'état du wiki à cet instant-là, figé dans le HTML envoyé au
navigateur. Deux formulaires `Formulaire:Lieu` ouverts avant qu'aucun des
deux ne soit enregistré verraient tous les deux le même maximum actuel et
proposeraient donc le même défaut — rien ne réserve le numéro tant que la
page n'est pas sauvegardée. `Template:Item numbering audit` (module
d'audit Base36 cité dans `CLAUDE.md`, corrections sur les modèles n° 1)
ne détecte que les trous dans la séquence, pas les doublons — un tel
incident ne serait pas signalé automatiquement.

**Ce qui change avec `page name=` (point 1) : la collision devient une
collision de titre, pas seulement de fait stocké.** Pour un item
physique, deux `ref_number` identiques produiraient deux pages
distinctes (les titres portent aussi une description saisie à la main,
rarement identique) avec un `Inventory_number` en double — silencieux,
mais deux pages existent. Pour un lieu titré automatiquement `LOC-NNNN`,
la même collision viserait la **même page cible** : la seconde
sauvegarde ouvrirait ou écraserait la page déjà créée par la première,
au lieu de simplement dupliquer un fait. Risque plus sévère que sur le
patron, conséquence directe du gain proposé au point 1 — je ne tranche
pas lequel des deux compte le plus, je signale que ce n'est pas gratuit.

**Implication pour la tâche 5** (création des dix pages de lieu) :
onze/dix lieux, un seul opérateur. Le risque décrit suppose deux
formulaires ouverts *en même temps* avant enregistrement — peu probable
en usage normal, mais possible si plusieurs onglets sont ouverts par
commodité pendant une création en série. Recommandation opérationnelle,
pas une correction du formulaire : créer les lieux **un par un,
séquentiellement**, un seul onglet `Special:FormEdit/Lieu` à la fois, et
vérifier chaque page par `browsebysubject` immédiatement après
enregistrement, avant d'ouvrir le formulaire suivant — coût négligeable
sur dix pages, élimine la fenêtre de risque sans rien construire de
nouveau. Le problème de fond (pas de réservation, pas de détection de
doublon) reste ouvert, au même titre que la n° 1 de la liste des
corrections sur les modèles.

## 6. Ce qui ne se transpose pas du patron, et pourquoi

- **`model_link`** (lien obligatoire vers un `Referenced item`) — ne se
  transpose pas. Un item physique descend toujours d'un modèle technique
  dans la chaîne fonctionnel → organique → référencé → physique ;
  `Catégorie:Lieu` est explicitement « hors chaîne » (sa propre section
  « Position dans le modèle », relue en tâche 2) et n'a aucune classe de
  conception au-dessus d'elle. Aucun champ équivalent n'a de sens ici.
- **`sn`** (numéro de série constructeur) — ne se transpose pas, propre
  aux objets manufacturés. Un lieu n'a pas de numéro de série.
- **Bloc `== Facettes ==`** (`{{Formulaire:Physical item/bloc facette
  végétal}}`) — ne se transpose pas. Les facettes distinguent des
  sous-types d'item physique avec des champs spécifiques (végétal,
  raccord...) ; rien de comparable n'existe ni n'est demandé pour les
  lieux, qui restent une entité plate.
- **`description`** (textarea État/Description) — n'a pas d'équivalent
  demandé dans la liste de champs de la tâche 3. `Location_type` en
  couvre une partie (nature du lieu), mais un champ de description libre
  n'est pas dans la consigne ; je ne l'ajoute pas de ma propre initiative.
- **`physical_parent`** — se transpose, mais sous un nom et une sémantique
  différents : `Located_in`, déjà couvert au point 4. Même widget
  (`combobox`, pas `tokens`), relation différente (« se trouve dans » un
  lieu parent, pas « installé dans » un autre exemplplaire).
- **L'infobulle de `site_code`** (« à modifier uniquement pour publier
  l'exemplaire d'un partenaire ») — se transpose dans sa forme
  (`{{#info:}}` sur le champ de code de site), pas dans son fond : le
  texte a dû être réécrit pour `Location_site` plutôt que recopié, parce
  que le scénario qu'il décrit (recopier le code d'un partenaire) ne
  s'applique pas à `LOC`, réservé et non réattribuable d'après le
  `Registre des préfixes de site` lui-même. Une simple copie aurait
  affirmé quelque chose de faux sur les lieux.
