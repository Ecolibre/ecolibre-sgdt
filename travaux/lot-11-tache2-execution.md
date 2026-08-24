# Lot 11 — tâche 2 : exécution du diff sur Modèle:Lieu

2026-08-23. Trois corrections reprises telles quelles, puis écriture.

## Corrections reprises

**1 — Placement de la catégorie de maintenance.** Parent relu de
`Catégorie:Lieu` : `[[Catégorie:SGDT]]`, seule catégorie de fermeture de
la page. `Catégorie:Lieu sans nom d'usage` créée sous ce même parent
(`[[Catégorie:SGDT]]`), à côté de `Catégorie:Lieu` et non dessous — le
wikitexte proposé en v2 est repris à l'identique, avec `[[Catégorie:Lieu]]`
remplacé par `[[Catégorie:SGDT]]` en dernière ligne, et un paragraphe
ajouté expliquant pourquoi (SMW résout les sous-catégories dans ses
requêtes ; une catégorie de maintenance greffée sous `Catégorie:Lieu`
risquerait de faire remonter des lieux incomplets dans des requêtes qui
interrogent la classe).

**2 — Ligne Référence avec `#if`.** Remplacée par :
```
| {{#if:{{{Location_number|}}}|{{{Location_site|}}}-{{{Location_number}}}|'''Référence non attribuée'''}}
```

**3 — `mainlabel=Référence`** ajouté à la requête des enfants directs.

## a) Écriture — Catégorie:Lieu sans nom d'usage

`createonly=1`, résumé `[Lot 11][Tâche 2] Création de la catégorie de
maintenance Lieu sans nom d'usage, sous Catégorie:SGDT`. `result:
Success`, `pageid: 433`, `newrevid: 857`.

Relue après écriture — conforme au wikitexte proposé, caractère pour
caractère :

```
Lieux dont le nom d'usage (`Place_name`) est vide. Catégorie de
maintenance, posée automatiquement par [[:Modèle:Lieu|Modèle:Lieu]]
quand le champ est vide — jamais à ajouter à la main, au même titre que
[[:Catégorie:Lieu|Catégorie:Lieu]] elle-même.

Existe parce que SMW n'a pas de négation exploitable en requête :
<code><nowiki>[[Place_name::!+]]</nowiki></code> ne renvoie aucun
résultat. Une catégorie conditionnelle est le seul moyen de lister ces
lieux d'un coup plutôt qu'un par un.

Placée à côté de [[:Catégorie:Lieu|Catégorie:Lieu]], pas dessous : une
catégorie de maintenance n'est pas une appartenance de classe, et SMW
résout les sous-catégories dans ses requêtes — la greffer sous
Catégorie:Lieu risquerait de faire remonter des lieux incomplets dans des
requêtes qui interrogent la classe.

[[Catégorie:SGDT]]
```

## b) Écriture — Modèle:Lieu

Relu juste avant écriture : inchangé depuis la dernière lecture de la
session (identique au wikitexte déjà cité en v1/v2), pas de protection
native. Résumé `[Lot 11][Tâche 2] Modèle:Lieu — quatre champs de
référence, enfants directs, repli visible sur Nom d'usage et Référence`.
`result: Success`, `pageid: 289`, `oldrevid: 801`, `newrevid: 858`.

Relu après écriture — conforme au diff corrigé, caractère pour
caractère (seul écart : absence de retour à la ligne final, normal,
déjà observé sur toutes les écritures précédentes de ce lot) :

```diff
--- Modèle:Lieu (avant, revid 801)
+++ Modèle:Lieu (après, revid 858)
@@ -8,6 +8,10 @@
 |Latitude={{{Latitude|}}}
 |Longitude={{{Longitude|}}}
 |Located_in={{{Located_in|}}}
+|Location_number={{{Location_number|}}}
+|Location_site={{{Location_site|}}}
+|Location_type={{{Location_type|}}}
+|INSEE_code={{{INSEE_code|}}}
 }}
 
 {| class="wikitable" style="width:100%"
@@ -15,7 +19,13 @@
 ! colspan="2" style="background:#dfe8d8; text-align:left;" | Identification
 |-
 ! style="background:#f2f2f2; width:30%;" | Nom d'usage
-| {{#if:{{{Place_name|}}}|{{{Place_name}}}|{{PAGENAME}}}}
+| {{#if:{{{Place_name|}}}|{{{Place_name}}}|'''Nom d'usage non renseigné'''}}
+|-
+! style="background:#f2f2f2; width:30%;" | Référence
+| {{#if:{{{Location_number|}}}|{{{Location_site|}}}-{{{Location_number}}}|'''Référence non attribuée'''}}
+|-
+! style="background:#f2f2f2; width:30%;" | Type
+| {{#if:{{{Location_type|}}}|{{{Location_type}}}|''non renseigné''}}
 |-
 ! style="background:#f2f2f2; width:30%;" | Adresse postale
 | {{#if:{{{Postal_address|}}}|{{{Postal_address}}}|''non renseignée''}}
@@ -28,11 +38,34 @@
 ! style="background:#f2f2f2; width:30%;" | Longitude
 | {{#if:{{{Longitude|}}}|{{{Longitude}}}|''non renseignée''}}
 |-
+! style="background:#f2f2f2; width:30%;" | Code INSEE
+| {{#if:{{{INSEE_code|}}}|{{{INSEE_code}}}|''non renseigné''}}
+|-
 ! colspan="2" style="background:#dfe8d8; text-align:left;" | Filiation
 |-
 ! style="background:#f2f2f2; width:30%;" | Lieu parent
 | {{#if:{{{Located_in|}}}|[[{{{Located_in}}}]]|''—''}}
 |-
+! style="background:#f2f2f2; width:30%;" | Enfants directs
+|
+'''{{#ask: [[Located_in::{{FULLPAGENAME}}]] |format=count}}''' lieu(x) rattaché(s) directement à celui-ci.
+
+{{#ask: [[Located_in::{{FULLPAGENAME}}]]
+ |?Place_name = Nom
+ |?Location_type = Type
+ |format=table
+ |sort=
+ |order=asc
+ |limit=200
+ |mainlabel=Référence
+ |default=''Aucun lieu rattaché directement à celui-ci.''
+ |class=wikitable sortable
+}}
+
+<!-- Emplacement réservé : requête par lignage (Location_lineage, cascade
+     complète des descendants) — à ajouter après le test de cascade.
+     Lot 11, tâche 2. Ne pas rouvrir le reste du modèle pour ça. -->
+|-
 ! colspan="2" style="background:#dfe8d8; text-align:left;" | Items physiques à ce lieu
 |-
 ! style="background:#f2f2f2; width:30%;" | Présents ici
@@ -52,5 +85,6 @@
 }}
 |}
 
+{{#if:{{{Place_name|}}}||[[Category:Lieu sans nom d'usage]]}}
 [[Category:Lieu]]
```

## Vérifications

File de travaux à `jobs=5` au moment de vérifier, `bin/wiki-wait-jobs.sh`
l'a signalée figée (cinq essais sans variation) plutôt que d'attendre
indéfiniment. Vérifications faites malgré tout par `action=parse` (reparse
à froid, ne dépend pas de la file) et, en doublon, par lecture directe des
quatre URLs normalement servies — les deux concordent partout, donc le
cache de rendu de ces quatre pages n'est pas affecté par la file figée.
Ce qui reste potentiellement en attente dans la file concerne autre chose
(propagation de propriété SMW, pas l'invalidation de cache de ces pages) —
signalé, non creusé, hors périmètre de cette vérification.

### 1. Les quatre pages rendent-elles encore ?

Oui, les quatre — `action=parse` sans erreur (pas de `class="error"`,
pas de `{{{` résiduel, pas de « Script error » ni « Lua error »), et
rendu normalement servi identique :

| Page | `action=parse` | Rendu normalement servi |
|---|---|---|
| Le Buisson de Cerzat | OK | OK, à jour |
| Jardin de Chilhac | OK | OK, à jour |
| Terrasse de Chilhac | OK | OK, à jour |
| Atelier appartement | OK | OK, à jour |

Sur les quatre, la ligne Référence affiche `'''Référence non attribuée'''`
(aucune n'a encore `Location_number`) — cohérent avec la correction 2 et
avec le fait qu'aucune des quatre ne porte encore les nouveaux champs.

### 2. Le compteur d'items physiques du Buisson affiche-t-il toujours 29 ?

Oui — **29**, revérifié à l'instant sur le rendu à froid
(`'''{{#ask: ... |format=count}}'''` non touché par ce diff) et recompté
ligne par ligne dans la table qui suit (29 lignes distinctes portant un
titre `ECL-00NN`). Aucun changement par rapport aux vérifications de la
tâche 0 et de la tâche 2 v1.

### 3. Les quatre lieux apparaissent-ils dans Catégorie:Lieu sans nom d'usage ?

**Oui, les quatre** : `Atelier appartement`, `Jardin de Chilhac`, `Le
Buisson de Cerzat`, `Terrasse de Chilhac` — liste complète de
`categorymembers` sur la catégorie, rien de plus, rien de moins. La
catégorisation conditionnelle du `#set`/`#if` s'est donc propagée aux
quatre pages transcluses sans délai perceptible, malgré la file de
travaux figée à 5 — cette propagation-là passe apparemment par
l'invalidation de cache déclenchée à la sauvegarde du modèle, pas par un
job différé. Rien à signaler comme manquant.

### 4. browsebysubject sur Le Buisson de Cerzat — aucune annotation parasite

```
Latitude -> ['45.17142']
Longitude -> ['3.488276']
_ASK -> [4 sous-objets — deux requêtes (comptage + table) désormais sur
          cette page au lieu d'une seule : items physiques et enfants
          directs]
_INST -> ['Lieu#14##', "Lieu_sans_nom_d'usage#14##"]
_MDAT -> ['1/2026/8/15/20/7/32/0']
_SKEY -> ['Le Buisson de Cerzat']
```

**Aucune annotation parasite.** Ni `Location_number`, ni `Location_site`,
ni `Location_type`, ni `INSEE_code` n'apparaissent comme faits : les
quatre `#set` ne stockent rien quand le paramètre correspondant est vide,
comme les cinq champs déjà en place avant ce diff (`Place_name`,
`Postal_address`, `Located_in` non plus, pour la même raison, déjà
absents avant l'écriture). `_INST` porte exactement les deux catégories
attendues, aucune autre. `_MDAT` inchangé (20/07/32 le 15 août) — normal,
c'est l'horodatage de la dernière édition de la page `Le Buisson de
Cerzat` elle-même, pas du modèle qu'elle transclut ; rien n'a touché
cette page directement ici.
