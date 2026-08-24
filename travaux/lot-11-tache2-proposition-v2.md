# Lot 11 — tâche 2 : proposition de diff pour Modèle:Lieu (v2, corrigée)

2026-08-23, suite à relecture. Toujours **aucune écriture sur Modèle:Lieu,
Catégorie:Lieu, ni Catégorie:Lieu sans nom d'usage** — uniquement de la
lecture pour les six points ci-dessous. Reprend `lot-11-tache2-
proposition.md` (v1) point par point ; ce qui n'est pas mentionné n'a pas
changé.

## 1. Défaut corrigé — `?Place_name` en première colonne, et recherche ailleurs

Corrigé dans le diff (section finale) : la requête des enfants directs
porte maintenant `|?Place_name = Nom` en premier `?`, avant `|?Location_
type = Type`. Le lien vers la page reste (colonne implicite de sujet,
toujours affichée par `format=table`), le nom lisible s'ajoute à côté —
pas à la place.

**Recherche ailleurs sur le wiki.** Sites vérifiés par lecture directe du
wikitexte (la recherche plein texte est inutilisable ici : elle indexe le
rendu, pas le wikitexte, donc un nom de paramètre comme `Located_in`
n'y apparaît jamais — vérifié, zéro résultat sur `Located_in` alors que
le paramètre existe dans plusieurs pages) :

- `Avancement du jardin-forêt` : requêtes sur `Category:Physical item`
  et `Category:Photo de plantation`, aucune sur `Category:Lieu` — les
  lieux y apparaissent seulement comme valeur de `Located_at`, jamais
  comme sujet de requête. **Pas concerné.**
- `Récapitulatif technique` : aucune mention de lieu. **Pas concerné.**
- `Récapitulatif technique du Système de Gestion de Données Techniques` :
  mentionne `Category:Lieu` uniquement en prose documentaire, entre
  balises `<code>`, aucun `#ask`. **Pas concerné.**
- `Accueil`, `Semer et planter` : aucune mention de lieu. **Pas concerné.**
- Rétro-liens vers `Catégorie:Lieu` (`list=backlinks`) : uniquement les
  pages `Attribut:` des propriétés à domaine `Lieu` (liens de
  documentation, pas des requêtes) et `Récapitulatif technique du
  SGDT` déjà cité. Aucune autre page ne référence la catégorie.

**Un endroit en souffrirait, hors `#ask`** : le **listage automatique de
catégorie** que MediaWiki affiche de lui-même en bas de `Catégorie:Lieu`.
Ce n'est pas une requête qu'on écrit, c'est un comportement intégré — il
énumère les pages membres par leur titre réel, sans passer par SMW ni par
aucun `?print`. Avec des titres `LOC-NNNN`, cette liste deviendra aussi
illisible que l'aurait été la table des enfants directs, et rien ne
permet de la personnaliser à ce niveau : le test du point 5
(`DISPLAYTITLE` restreint à une variante de casse) s'applique telle
quelle ici aussi. Signalé, non corrigé — hors périmètre de `Modèle:Lieu`.

## 2. Comptage des lignes — confirmé à trois, inchangé

Pas de changement au découpage : `Référence`, `Type`, `Code INSEE`. Le
diff v2 reprend exactement la structure de la v1 sur ce point.

## 3. `Location_site` sans défaut — confirmé, inchangé

`{{{Location_site|}}}-{{{Location_number|}}}` conservé tel quel, sans
`LOC` en dur. Argumentaire inchangé depuis la v1 (précédent `Inventory_
ref` de `Modèle:Physical item`, défaut porté par le formulaire via un
futur `{{Préfixe lieu}}`, pas par le modèle).

## 4. Catégorie de maintenance ajoutée

**Raison retenue** : SMW n'a pas de négation exploitable en requête —
`[[Place_name::!+]]` renvoie zéro résultat, pas « tout sauf ». Une
catégorie posée conditionnellement au `#set` est le seul moyen de
lister d'un coup les lieux sans nom d'usage plutôt que de les découvrir
un par un.

**Nom retenu : `Lieu sans nom d'usage`.** Ni tiret cadratin, ni virgule —
vérifié caractère par caractère contre la contrainte rappelée (la virgule
est délimiteur multivaleur dans tout le système).

Ajout dans le diff, juste avant `[[Category:Lieu]]` en fin de modèle :

```
{{#if:{{{Place_name|}}}||[[Category:Lieu sans nom d'usage]]}}
```

**Wikitexte proposé pour la page de catégorie elle-même**
(`Catégorie:Lieu sans nom d'usage`, à créer avec `--createonly`) :

```
Lieux dont le nom d'usage (`Place_name`) est vide. Catégorie de
maintenance, posée automatiquement par [[:Modèle:Lieu|Modèle:Lieu]]
quand le champ est vide — jamais à ajouter à la main, au même titre que
[[:Catégorie:Lieu|Catégorie:Lieu]] elle-même.

Existe parce que SMW n'a pas de négation exploitable en requête :
<code><nowiki>[[Place_name::!+]]</nowiki></code> ne renvoie aucun
résultat. Une catégorie conditionnelle est le seul moyen de lister ces
lieux d'un coup plutôt qu'un par un.

[[Catégorie:Lieu]]
```

Rattachée à `Catégorie:Lieu` plutôt qu'à `Catégorie:SGDT` directement :
c'est un sous-ensemble de ses membres, pas une catégorie indépendante.
`<nowiki>` autour de l'exemple `[[Place_name::!+]]`, pas de simples
backticks — les deux pièges (backticks, `<code>` seul) sont déjà
documentés dans `CLAUDE.md` comme ayant produit de fausses annotations à
deux reprises.

## 5. Correction du rapport v1 — Property_range, pas Property_description_EN

**Ma v1 se trompait de champ.** J'avais attribué le dépassement des 85
caractères sur `Attribut:INSEE code` à `Property_description_EN`. Faux :
c'est `Property_range` — 90 caractères, dépassement mesuré et documenté
dans `lot-11-tache1-cloture.md` (tableau des 6 pages touchées par le
plafond `Keyword`/85 caractères, ligne `Attribut:INSEE code | 90 | +5`).
Les deux descriptions (`_EN` et `_FR`), pourtant longues elles aussi,
sont bien stockées en fait direct — revérifié à l'instant par
`browsebysubject`, aucune erreur dessus.

Reconfirmé aujourd'hui que l'erreur est toujours active : `browsebysubject`
sur `Attribut:INSEE code` porte encore `_ERRC` et n'a aucun fait
`Property_range`, `_MDAT` inchangé depuis le 21/08/2026 — la correction
esquissée dans `lot-11-tache1-cloture.md` (« Property_range raccourci à
« code INSEE commune, 5 caractères — 0 initial possible, 2A/2B Corse » »)
ne semble pas avoir été appliquée sur le wiki. Aparté sans rapport avec ce
diff, comme en v1 : je le signale, je ne le corrige pas ici.

## 6. Quatrième lieu non prévu — `Atelier appartement`

**Existe bel et bien**, `embeddedin` sur `Modèle:Lieu` le confirme (4
pages, pas 3). `lot-11-cadrage-lieux.md` ne le mentionne nulle part et
annonce explicitement « Trois lieux existent » avec « trois
transclusions » — grep sur le cadrage, zéro occurrence de « atelier » ou
« appartement ». Le cadrage a été écrit avant la création de cette page,
ou sans en tenir compte.

**Wikitexte complet** (relevé à l'instant, inchangé depuis sa création) :

```
{{Lieu
|Place_name=
|Postal_address=
|Latitude=
|Longitude=
|Located_in=
}}
```

**Champs renseignés : aucun.** Les cinq paramètres existent mais sont
tous vides — comme les trois autres lieux, `Place_name` et `Located_in`
compris. Créée le 20/08/2026 (`_MDAT` et première révision concordent),
cinq jours après le lot de création du 15/08/2026 qui a produit la
plupart des items physiques de Cerzat — pas la même session.

**Items physiques rattachés par `Located_at` : un seul.** `Machine à
souder par point — Atelier appartement (ECL-0043)`, `Inventory_number`
`0043` (suite immédiate de la banque physique après `0042`, même préfixe
`ECL`), créée le même jour que le lieu qui l'héberge. `Item_description`
sur la page : « Rangée dans une caisse, dans l'appartement. »

**Place dans l'arbre amendé : nulle part, en l'état.** L'arbre du
cadrage (`lot-11-cadrage-lieux.md`, section 2) organise tout sous deux
communes, `Cerzat (43044)` et `Chilhac (43070)`, avec des sous-lieux
agricoles (terrain, jardin, terrasse) en dessous. `Atelier appartement`
n'a ni code postal, ni commune, ni rien de géographique renseigné, et son
seul item rattaché est un outil d'atelier, pas une plantation — nature de
lieu entièrement différente des dix pages prévues par le cadrage. Rien
dans le nom ni le contenu de la page ne le rattache à Cerzat ou à
Chilhac : le seul indice de provenance est le préfixe `ECL` de son item
physique, partagé par tous les items du wiki, pas spécifique à un lieu.
Le classer sous l'un des deux embranchements existants serait une
supposition non fondée dans les données. Je ne tranche pas : soit un
troisième embranchement au même niveau que Cerzat et Chilhac, soit une
page hors du périmètre de ce lot — à décider par Cyril avant la tâche 5
(création des dix pages), pas ici.

## Diff corrigé — Modèle:Lieu

```diff
--- Modèle:Lieu (actuel)
+++ Modèle:Lieu (proposé, v2)
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
+| {{{Location_site|}}}-{{{Location_number|}}}
+|-
+! style="background:#f2f2f2; width:30%;" | Type
+| {{#if:{{{Location_type|}}}|{{{Location_type}}}|''non renseigné''}}
 |-
 ! style="background:#f2f2f2; width:30%;" | Adresse postale
 | {{#if:{{{Postal_address|}}}|{{{Postal_address}}}|''non renseignée''}}
@@ -28,11 +38,33 @@
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
@@ -52,5 +84,6 @@
 }}
 |}
 
+{{#if:{{{Place_name|}}}||[[Category:Lieu sans nom d'usage]]}}
 [[Category:Lieu]]
```

Changements par rapport au diff v1 : ajout de `|?Place_name = Nom` dans
la requête des enfants directs (point 1) et ajout de la ligne `{{#if:
{{{Place_name|}}}||[[Category:Lieu sans nom d'usage]]}}` avant la
catégorie de fermeture (point 4). Le reste — quatre `#set`, trois lignes
d'affichage, `Référence` sans défaut, requête des items physiques
inchangée, commentaire de réservation — identique à la v1.

Deux écritures encore nécessaires avant que ce diff soit complet, ni
l'une ni l'autre faite ici : la page `Catégorie:Lieu sans nom d'usage`
elle-même (wikitexte ci-dessus, point 4), et la mise à jour de
`Catégorie:Lieu` (section « Champs », signalée en tâche 2 v1 point 6,
toujours en attente de la tâche 7).
