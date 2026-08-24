# Lot 11 — tâche 2 : proposition de diff pour Modèle:Lieu

2026-08-23. Lecture seule sur le modèle et la catégorie ; seule écriture
réelle : deux essais `{{DISPLAYTITLE:}}` sur la page bac à sable
(`Utilisateur:Cywil/Bac à sable`), demandés au point 5, page restaurée à son
contenu d'origine ensuite. **Modèle:Lieu et Catégorie:Lieu n'ont pas été
touchés.** Ce document propose un diff, il ne l'applique pas.

Périmètre confirmé avant d'écrire quoi que ce soit : seule
`Modèle:Lieu` transclut `Location_lineage` nulle part aujourd'hui (le champ
n'existe pas encore), donc rien à « rouvrir » de ce côté. `embeddedin` sur
`Modèle:Lieu` : 4 pages (`Le Buisson de Cerzat`, `Jardin de Chilhac`,
`Terrasse de Chilhac`, `Atelier appartement`), les quatre avec `Located_in=`
vide — aucune n'a de lieu parent aujourd'hui, donc la future requête
« enfants directs » proposée au point 3e ne changera l'affichage d'aucune
page existante tant qu'aucun `Located_in` n'est renseigné.

## 1. Wikitexte actuel relu

`Modèle:Lieu` et `Catégorie:Lieu` relus à l'instant par `wiki-get.sh`.
`Modèle:Lieu` est inchangé depuis la dernière lecture de ce lot (même
structure : un `#set` à cinq champs, un tableau à trois sections
Identification / Coordonnées / Filiation, puis la requête des items
physiques). Le contenu de `Catégorie:Lieu` est cité au point 6.

## 2. Vérifié avant de proposer quoi que ce soit — la ligne de comptage est présente

**Le signalement d'absence ne se reproduit pas.** Sur le rendu de
`Le Buisson de Cerzat`, la ligne s'affiche, avec la valeur `29` :

> **29** item(s) physique(s) rattaché(s) à ce lieu.

Vérifié deux fois, par les deux voies déjà utilisées dans
`lot-11-cle-de-tri.md` :
- `action=parse&page=Le Buisson de Cerzat&prop=text` (reparse à froid,
  contourne le cache de rendu) : ligne présente, `29`.
- Lecture directe de `https://wiki.ecolibre.org/wiki/Le_Buisson_de_Cerzat`
  (le rendu normalement servi, cache compris) : ligne présente, `29`,
  identique caractère pour caractère.

Comme pour le motif « 26 + 3 » de la tâche 0, cette observation-là aussi
vient d'une lecture qui ne reflète plus l'état actuel. Je ne cherche pas
à expliquer l'écart avec ce qui avait été signalé — juste à rapporter que
la ligne existe bel et bien aujourd'hui, dans le wikitexte comme dans les
deux rendus testés.

## 3. Diff proposé sur Modèle:Lieu

Diff unifié (`diff -u` entre le wikitexte actuel et la version proposée) :

```diff
--- Modèle:Lieu (actuel)
+++ Modèle:Lieu (proposé)
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
@@ -28,11 +38,32 @@
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
```

Le reste du modèle (`#set` des cinq champs existants, section Coordonnées
pour Latitude/Longitude, requête des items physiques, catégorie de
fermeture) est inchangé.

### a) Quatre `#set` nouveaux

`Location_number`, `Location_site`, `Location_type`, `INSEE_code`, même
forme que les cinq existants (`{{{Nom|}}}`, pas de valeur par défaut au
niveau du modèle — voir point c). Les quatre propriétés existent déjà côté
`Attribut:` (créées le 21/08/2026, `Property_domain=Lieu`), donc rien à
créer de ce côté :

| Propriété | `_TYPE` | `Property_range` |
|---|---|---|
| `Location_number` | Keyword | identifiant Base 36, 4 caractères, sans préfixe |
| `Location_site` | Keyword | code de site à trois lettres, `LOC` réservé à ce wiki |
| `Location_type` | Keyword | texte libre (terrain, bâtiment, pièce…) |
| `INSEE_code` | Keyword | — |

**Aparté sans rapport direct avec ce diff, à signaler quand même** :
`Attribut:INSEE code` porte une erreur de traitement SMW (`_ERRC`) — « Le
mot-clé dépasse la valeur maximale de 85 caractères. » Le type Keyword
plafonne à 85 caractères et la description longue du champ (`Property_
description_EN`) le dépasse sur sa propre page de définition. Ça ne touche
que la page de définition de la propriété elle-même, pas les valeurs
d'instance à venir (un code INSEE tient sur 5 caractères) — donc ça
n'affecte pas ce diff. Je le signale, je ne le corrige pas : hors
périmètre de la tâche 2.

### b) Quatre lignes d'affichage — désaccord de comptage à trancher

La consigne parle de « quatre lignes d'affichage » pour Identification
(type, référence) et Coordonnées (INSEE). Je ne trouve que **trois**
lignes visibles distinctes derrière ces quatre propriétés : `Type`,
`Référence` (qui combine `Location_site` et `Location_number` en une
seule ligne affichée, sur le modèle de `Inventory_ref` dans `Modèle:
Physical item` — voir point c) et `Code INSEE`. `Location_site` et
`Location_number` n'ont chacun aucune ligne isolée dans mon diff — ils
n'existent qu'à l'intérieur de la ligne `Référence` composée.

Je ne tranche pas seul : soit la consigne comptait par erreur (trois
lignes, pas quatre), soit une ligne `Site` séparée (affichant `Location_
site` seul, en plus de la `Référence` composée) est voulue malgré la
redondance apparente avec la ligne `Référence`. Le diff ci-dessus prend
la première lecture (trois lignes) ; à confirmer avant écriture.

Ordre choisi dans la section Identification : Nom d'usage, Référence,
Type, Adresse postale — la référence juste après le nom d'usage parce que
ce sont les deux identifiants de la ligne. Ajustable sans coût.

### c) Référence affichée — pas de `LOC` en dur, par cohérence avec l'existant

Le diff écrit `{{{Location_site|}}}-{{{Location_number|}}}`, **sans**
valeur par défaut sur `Location_site`. Raison : ce n'est pas une intuition,
c'est le patron déjà en place. `Modèle:Physical item` compose sa référence
affichée ainsi :

```
|Inventory_ref={{{site_code|}}}-{{{ref_number|}}}
```

Aucun `ECL` en dur dans ce modèle-là non plus. Le défaut `ECL` vit dans
`Formulaire:Physical item` (`default={{Préfixe site}}`), qui délègue
lui-même à `Modèle:Préfixe site` — un point de vérité unique, réutilisable,
documenté (« se règle une fois à l'installation et ne change plus »).

Écrire `{{{Location_site|LOC}}}` dans `Modèle:Lieu` casserait cette
symétrie et poserait un second risque propre à `Location_site` : la
propriété n'est *pas* garantie de valoir toujours `LOC` — sa description
dit explicitement que `LOC` est réservé à ce wiki mais n'exclut pas qu'un
lieu porte un jour le code d'un site partenaire, exactement comme
`Inventory_site` pour les items physiques. Un défaut `LOC` en dur dans le
modèle afficherait silencieusement `LOC-0001` pour un lieu dont le champ
serait resté vide par oubli, au lieu de laisser apparaître le trou
(`-0001`, visiblement incomplet). Recommandation : pas de `LOC` en dur ici
non plus ; si un défaut est voulu à la saisie, il ira dans le futur
`Formulaire:Lieu` (tâche 7), sur le modèle de `{{Préfixe site}}` — un
`{{Préfixe lieu}}` dédié, pas une chaîne recopiée.

### d) Repli du Nom d'usage — avertissement visible, plus de `{{PAGENAME}}`

```
| {{#if:{{{Place_name|}}}|{{{Place_name}}}|'''Nom d'usage non renseigné'''}}
```

Gras plutôt qu'italique : les autres replis du modèle (`''non
renseignée''` pour l'adresse, la latitude, la longitude) sont des champs
secondaires où l'absence est un non-événement. Le Nom d'usage est
désormais le seul endroit lisible pour un humain sur la page — d'où un
avertissement qui se voit, pas la même italique discrète.

Non inclus dans le diff, à décider séparément : une catégorie de
maintenance (`[[Category:Lieu — nom d'usage manquant]]`, posée seulement
quand `Place_name` est vide) permettrait de lister tous les lieux
incomplets d'un coup plutôt que de les découvrir un par un en visitant
chaque page. Je ne l'ai pas mise dans le diff pour rester au plus près de
ce qui a été demandé ; à ajouter d'un mot si voulu.

### e) Requête des enfants directs — tri explicite `sort=` vide

```
{{#ask: [[Located_in::{{FULLPAGENAME}}]]
 |?Location_type = Type
 |format=table
 |sort=
 |order=asc
 |limit=200
 |default=''Aucun lieu rattaché directement à celui-ci.''
 |class=wikitable sortable
}}
```

`sort=` vide, comme la requête des items physiques du même modèle — pas
une absence de choix, un choix délibéré. Rejeté : trier sur `Location_
number` en exclurait tout lieu qui ne l'a pas encore renseigné (exactement
le piège que la consigne demande d'éviter, et de fait : les 4 lieux
existants n'ont aujourd'hui *aucun* des quatre nouveaux champs renseignés
— un tri dessus les exclurait tous). Trier sur `Place_name` ou `Location_
type` aurait le même défaut, ce sont des champs facultatifs. La clé de tri
par défaut (`_SKEY`, dérivée du titre de page) est la seule propriété
garantie présente sur chaque page — et `lot-11-cle-de-tri.md` vient de
vérifier, il y a deux jours puis reconfirmé aujourd'hui, que ce `sort=`
vide produit un ordre alphabétique complet et stable sur cette même
requête appliquée aux items physiques. Même choix, même garantie, même
modèle.

### f) Commentaire de réservation

Inclus dans le diff ci-dessus, juste après la requête des enfants directs
et avant la fermeture de la ligne du tableau :

```
<!-- Emplacement réservé : requête par lignage (Location_lineage, cascade
     complète des descendants) — à ajouter après le test de cascade.
     Lot 11, tâche 2. Ne pas rouvrir le reste du modèle pour ça. -->
```

## 4. Requête des items physiques — non touchée, pas d'argument pour la changer

`sort=` vide sur `[[Category:Physical item]] [[Located_at::{{FULLPAGENAME}}]]`
n'apparaît nulle part dans le diff proposé. Elle rend les 29 résultats
dans un ordre alphabétique stable, vérifié à nouveau aujourd'hui (point 2
et `lot-11-cle-de-tri.md` section 5). Je ne vois pas de raison d'y
toucher, et ce n'est de toute façon pas dans le périmètre annoncé pour
cette tâche.

## 5. Test DISPLAYTITLE — fonctionne, mais restreint à une variante de casse

Deux écritures sur `Utilisateur:Cywil/Bac à sable`, restaurée à son
contenu d'origine ensuite (résumés `[Lot 11][Tâche 2]`) :

**Essai 1** — `{{DISPLAYTITLE:Test lisible — LOC-0001}}` (titre
complètement différent, ce qui serait le cas d'usage réel pour un lieu
`LOC-0001` affiché comme « Le Buisson de Cerzat ») :
`action=parse&prop=displaytitle` renvoie le titre de page brut, inchangé.
**Sans effet.**

**Essai 2** — `{{DISPLAYTITLE:utilisateur:Cywil/Bac à sable}}` (seule la
casse de la première lettre change) : `displaytitle` renvoie bien
`utilisateur:Cywil/Bac à sable`, `u` minuscule. **Effectif.**

Les deux essais ensemble montrent que `DISPLAYTITLE` est activé sur ce
wiki mais soumis à la restriction par défaut de MediaWiki
(`$wgRestrictDisplayTitle`) : seule une variante de casse du titre réel
est acceptée, un titre réellement différent est ignoré silencieusement
(pas d'erreur, pas de trace — le rendu affiche simplement le titre de
page tel quel). Pour l'usage visé — afficher « Le Buisson de Cerzat » sur
une page titrée `LOC-0001` — **`DISPLAYTITLE` ne conviendrait pas**, avec
ou sans changement du modèle : ce n'est pas une histoire de savoir
l'invoquer correctement, c'est une restriction du site qui bloquerait tout
usage de ce type. Solution déjà dans le diff proposé : la ligne `Nom
d'usage` du tableau porte ce rôle, pas le titre de la page.

## 6. Signalé, non corrigé — documentation de Catégorie:Lieu obsolète

Section « Champs » de `Catégorie:Lieu`, citée telle quelle :

> `Place_name` ne recopie pas le titre de la page : elle sert uniquement
> aux lieux dont le nom d'usage diffère du titre (abréviation, nom local,
> alias). Laissée vide, la page affiche le titre par défaut — inutile de
> la dupliquer quand les deux coïncident.

Vrai tant que les titres de page étaient des noms de lieu. Faux dès que
les titres deviennent des références `LOC-NNNN` (le sens même du diff
proposé au point 3) : le titre et le nom d'usage ne coïncideront plus
jamais, et le repli sur `{{PAGENAME}}` disparaît du modèle au point d)
précisément pour cette raison. Cette section devra être réécrite pour
dire l'inverse — `Place_name` devient obligatoire en pratique, pas un cas
particulier — mais pas ici : à reprendre en tâche 7, avec le reste de la
documentation de `Catégorie:Lieu` qui suppose encore l'ancien schéma de
titrage.
