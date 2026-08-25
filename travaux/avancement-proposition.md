# *Avancement du jardin-forêt* — diagnostic et deux variantes

**Date : 25 août 2026. Lecture et proposition seulement, aucune écriture.**

Tous les chiffres de ce document ont été mesurés en ligne, et **les requêtes
proposées ont été exécutées avant d'être écrites ici** — aucune n'est donnée
de mémoire.

---

## 1. Ce que porte la page aujourd'hui : 20 requêtes

Le wikitexte (129 lignes) contient **20 appels `#ask`**, répartis en quatre
familles. Les conditions exactes :

### a) Trois tables d'items — **c'est ce qui est cassé**

Une par section, identiques au nom du lieu près :

```
[[Category:Physical item]] [[Located_at::Le Buisson de Cerzat]]
[[Category:Physical item]] [[Located_at::Jardin de Chilhac]]
[[Category:Physical item]] [[Located_at::Terrasse de Chilhac]]
```

Colonnes : `Planting_date`, `Specimen_status`, `Instance_of`,
`Planting_rank`. Tri `Inventory_number` ascendant, `class=wikitable
sortable`, `default` en italique.

### b) Trois `#ifexpr` + trois galeries de photo principale (6 `#ask`)

Le `#ifexpr` compte d'abord, la galerie s'affiche ensuite :

```
[[Category:Photo de plantation]] [[Image_location::<lieu>]] [[-Main_image::+]]
```

### c) Trois galeries « Autres photos »

```
[[Category:Photo de plantation]] [[Image_location::<lieu>]]
```

### d) Huit requêtes dans le bloc *Chiffres*

Six comptes par état, un total, une jointure d'espèces — **tous** portant la
même énumération de lieux en dur :

```
[[Category:Physical item]] [[Located_at::Le Buisson de Cerzat||Jardin de Chilhac||Terrasse de Chilhac]] [[Specimen_status::<état>]]
[[Category:Physical item]] [[Located_at::Le Buisson de Cerzat||Jardin de Chilhac||Terrasse de Chilhac]]
[[Category:Organic item]] [[-Corresponds_to_organic::<q>[[Category:Referenced item]][[-Instance_of::<q>[[Category:Physical item]][[Located_at::Le Buisson de Cerzat||Jardin de Chilhac||Terrasse de Chilhac]]</q>]]</q>]]
```

### Le rendu réel, relevé sur la page purgée

```
En place : 11   Repris : 0   Souffrant : 0
Mort : 0        Remplacé : 0  En réserve : 0
Total des plantations : 11
Espèces distinctes : 11
```

Les six états sont faux, le total est faux, le compte d'espèces est faux.
Et la phrase d'introduction — « 40 plantations réparties sur trois lieux
(Le Buisson de Cerzat, …) » — est fausse aussi : elle nomme un lieu qui ne
porte plus rien.

### Une dissymétrie que le diagnostic doit relever

**Les galeries de photos, elles, ne sont pas cassées.** Les tables d'items
interrogent `Located_at`, migré en tâche 5 ; les photos interrogent
`Image_location`, qui **ne l'a pas été** :

| Lieu | Items (`Located_at`) | Photos (`Image_location`) |
|---|---|---|
| Le Buisson de Cerzat | **0** | **45** |
| Butte de la tranchée | **29** | **0** |
| Jardin de Chilhac | 6 | 15 |
| Terrasse de Chilhac | 5 | 5 |

Visible à l'œil sur la page rendue : la section « Le Buisson de Cerzat »
affiche *« Aucun item physique rattaché à ce lieu »* **et douze photos
juste en dessous**. Les deux vocabulaires de lieu ont divergé.

**Conséquence pour la restructuration : corriger les tables sans toucher aux
photos déplacerait la casse au lieu de la réparer.** Les deux variantes
ci-dessous doivent en tenir compte, et aucune ne peut le régler seule — la
migration de `Image_location` est un travail distinct, signalé au §5.

*(Note annexe : les 65 photos ne portent **aucune** `Main_image`. Les trois
`#ifexpr` retombent donc tous sur « Aucune photo principale choisie pour ce
lieu ». C'est l'état actuel, indépendant de la panne.)*

---

## 2. `Modèle:Physical facet plant` — oui, il pose une catégorie

Il pose les deux, dans le même bloc :

```
|Item_facet=Facette végétal        ← propriété
[[Category:Item à facette végétal]]  ← catégorie
```

Les deux sont **à l'intérieur d'un `{{#if:{{{Specimen_status|}}}|…}}`** : un
bloc de facette dont le statut serait vide ne poserait ni l'un ni l'autre.
`Specimen_status` étant `mandatory` au formulaire, le cas ne se présente pas
aujourd'hui — mais c'est la condition réelle, pas la présence du bloc.

**La catégorie est donc le critère végétal le plus simple — à une réserve
près, vérifiée par compte et non supposée :**

```
Category:Item à facette végétal (tous espaces de noms) : 70
Physical item + Category:Item à facette végétal        : 40
Physical item + Item_facet::Facette végétal            : 40
Physical item (total)                                  : 44
```

**La catégorie seule ramènerait 70 pages, pas 40.** `Modèle:Organic facet
plant` pose exactement la même catégorie et la même propriété (vérifié dans
son wikitexte) : les 30 pages excédentaires sont les **items organiques**,
les fiches d'espèce. Le critère végétal doit donc **toujours** être combiné
à `[[Category:Physical item]]`.

Les deux formes combinées rendent le même résultat, 40 :

- `[[Category:Physical item]] [[Category:Item à facette végétal]]`
- `[[Category:Physical item]] [[Item_facet::Facette végétal]]`

**Je propose la catégorie**, pour une raison de robustesse : elle est posée
par le même `#if` que la propriété, donc elle ne peut pas en diverger, et
une condition de catégorie se lit plus vite qu'une condition de propriété
dans une requête déjà longue. La propriété reste un repli exact si la
catégorie devait un jour servir à autre chose.

### Les 4 items exclus, nommément

```
Batterie de récupération trotinette 1
Bidon 220L Bleu 1
Bidon 220L Bleu 2
Machine à souder par point — Atelier appartement (ECL-0043)
```

44 − 4 = 40. Le critère végétal sépare exactement, et c'est ce qui empêche
`Owned_by::Ecolibre` seul de suffire : les 44 portent tous la même valeur
depuis l'amendement d'aujourd'hui.

### Où sont réellement les 40

| Lieu réel | Plantations |
|---|---|
| **Butte de la tranchée** | **29** |
| Jardin de Chilhac | 6 |
| Terrasse de Chilhac | 5 |
| **Total** | **40** |

Aucune sans `Located_at`.

---

## 3. Le critère commun aux deux variantes

```
[[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]]
```

**Exécuté en ligne : 40 résultats.** C'est le socle des deux variantes et de
tout le bloc *Chiffres*.

`Owned_by::Ecolibre` est aujourd'hui redondant avec `Category:Physical item`
— les 44 le portent. Il est là pour le jour où le wiki publiera l'exemplaire
d'un partenaire : ce jour-là, la condition travaille déjà, sans qu'il faille
rouvrir la page. C'est exactement l'inverse de la liste de lieux en dur.

---

## 4. Variante A — sections par lieu

Trois sections, pour les trois lieux qui portent des plantations : **Butte de
la tranchée (29)**, **Jardin de Chilhac (6)**, **Terrasse de Chilhac (5)**.

Le défaut annoncé se vérifie : le jour où une plantation part sur *Zone
haute* ou *Au pied du pylône électrique* — deux lieux qui existent déjà et
ne portent rien — elle disparaît de la page **sans qu'aucun signal ne le
dise**. C'est très exactement la panne d'aujourd'hui, qui se rejouerait.

**Le point dur de cette variante, c'est la photo.** La section s'intitule
« Butte de la tranchée », mais ses 29 photos sont annotées
`Image_location=Le Buisson de Cerzat`. Deux issues, à trancher :

- **A1 — la section nomme la butte, la galerie interroge l'ancien nom.** La
  page fonctionne tout de suite, au prix d'une incohérence visible dans le
  wikitexte, à documenter en commentaire. C'est ce qui est écrit ci-dessous.
- **A2 — on migre d'abord `Image_location` sur les 45 photos**, puis la
  galerie interroge la butte comme la table. Plus propre, mais c'est un
  autre chantier (§5) et la page reste fausse en attendant.

### Wikitexte complet — variante A (forme A1)

```
Cette page couvre les {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] |format=count}} plantations d'Ecolibre, réparties sur les lieux ci-dessous. Elle ne prétend pas couvrir l'ensemble du jardin-forêt. L'absence de date de plantation signifie « non retrouvée », pas « non plantée ».

== Butte de la tranchée ==

{{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Located_at::Butte de la tranchée]]
|?Planting_date = Planté le
|?Specimen_status = État
|?Instance_of = Provenance
|?Planting_rank = Rang
|format=table
|sort=Inventory_number
|order=asc
|class=wikitable sortable
|default=''Aucune plantation rattachée à ce lieu.''
}}

<!-- Les photos de ce lieu sont annotées Image_location=Le Buisson de Cerzat :
     Image_location n'a pas suivi la migration de Located_at faite en tâche 5.
     Tant que les 45 fichiers n'ont pas été réannotés, la galerie interroge
     l'ancien nom. Voir travaux/avancement-proposition.md §5. -->
{{#ifexpr: {{#ask: [[Category:Photo de plantation]] [[Image_location::Le Buisson de Cerzat]] [[-Main_image::+]] |format=count}} > 0
| {{#ask: [[Category:Photo de plantation]] [[Image_location::Le Buisson de Cerzat]] [[-Main_image::+]]
|format=gallery
|sort=Image_date
|order=desc
|limit=12
}}
| ''Aucune photo principale choisie pour ce lieu.''
}}

<div class="mw-collapsible mw-collapsed">
'''Autres photos'''
<div class="mw-collapsible-content">
''Toutes les photos du lieu, la photo principale comprise : Semantic MediaWiki ne sait pas exclure une valeur d'une requête.''

{{#ask: [[Category:Photo de plantation]] [[Image_location::Le Buisson de Cerzat]]
|format=gallery
|sort=Image_date
|order=desc
|limit=12
}}
</div>
</div>

== Jardin de Chilhac ==

{{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Located_at::Jardin de Chilhac]]
|?Planting_date = Planté le
|?Specimen_status = État
|?Instance_of = Provenance
|?Planting_rank = Rang
|format=table
|sort=Inventory_number
|order=asc
|class=wikitable sortable
|default=''Aucune plantation rattachée à ce lieu.''
}}

{{#ifexpr: {{#ask: [[Category:Photo de plantation]] [[Image_location::Jardin de Chilhac]] [[-Main_image::+]] |format=count}} > 0
| {{#ask: [[Category:Photo de plantation]] [[Image_location::Jardin de Chilhac]] [[-Main_image::+]]
|format=gallery
|sort=Image_date
|order=desc
|limit=12
}}
| ''Aucune photo principale choisie pour ce lieu.''
}}

<div class="mw-collapsible mw-collapsed">
'''Autres photos'''
<div class="mw-collapsible-content">
''Toutes les photos du lieu, la photo principale comprise : Semantic MediaWiki ne sait pas exclure une valeur d'une requête.''

{{#ask: [[Category:Photo de plantation]] [[Image_location::Jardin de Chilhac]]
|format=gallery
|sort=Image_date
|order=desc
|limit=12
}}
</div>
</div>

== Terrasse de Chilhac ==

{{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Located_at::Terrasse de Chilhac]]
|?Planting_date = Planté le
|?Specimen_status = État
|?Instance_of = Provenance
|?Planting_rank = Rang
|format=table
|sort=Inventory_number
|order=asc
|class=wikitable sortable
|default=''Aucune plantation rattachée à ce lieu.''
}}

{{#ifexpr: {{#ask: [[Category:Photo de plantation]] [[Image_location::Terrasse de Chilhac]] [[-Main_image::+]] |format=count}} > 0
| {{#ask: [[Category:Photo de plantation]] [[Image_location::Terrasse de Chilhac]] [[-Main_image::+]]
|format=gallery
|sort=Image_date
|order=desc
|limit=12
}}
| ''Aucune photo principale choisie pour ce lieu.''
}}

<div class="mw-collapsible mw-collapsed">
'''Autres photos'''
<div class="mw-collapsible-content">
''Toutes les photos du lieu, la photo principale comprise : Semantic MediaWiki ne sait pas exclure une valeur d'une requête.''

{{#ask: [[Category:Photo de plantation]] [[Image_location::Terrasse de Chilhac]]
|format=gallery
|sort=Image_date
|order=desc
|limit=12
}}
</div>
</div>

== Chiffres ==

<!-- Ces comptes ne nomment aucun lieu : ils portent sur toutes les
     plantations d'Ecolibre, y compris celles d'un lieu qui n'aurait pas
     encore sa section ci-dessus. Un écart entre le total et la somme des
     sections signale précisément ce cas. -->

Plantations par état :

* En place : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Specimen_status::en place]] |format=count}}
* Repris : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Specimen_status::repris]] |format=count}}
* Souffrant : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Specimen_status::souffrant]] |format=count}}
* Mort : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Specimen_status::mort]] |format=count}}
* Remplacé : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Specimen_status::remplacé]] |format=count}}
* En réserve : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Specimen_status::en réserve]] |format=count}}

Total des plantations : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] |format=count}}

Espèces distinctes (organiques rejointes via Instance_of → Corresponds_to_organic) : {{#ask: [[Category:Organic item]] [[-Corresponds_to_organic::<q>[[Category:Referenced item]][[-Instance_of::<q>[[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]]</q>]]</q>]] |format=count}}
```

### Ce que rend cette variante — mesuré

| | |
|---|---|
| Butte de la tranchée | 29 |
| Jardin de Chilhac | 6 |
| Terrasse de Chilhac | 5 |
| **Somme des sections** | **40** |
| **Total du bloc Chiffres** | **40** |

Les deux coïncident aujourd'hui. **Le jour où ils divergeront, c'est le
signal** que le §4 dit manquant : un lieu nouveau porte des plantations sans
avoir sa section. Le commentaire dans le wikitexte le dit à qui relira.

---

## 5. Variante B — une table unique

Aucun lieu en dur nulle part. Le lieu devient une **colonne**, et le tri se
fait dessus.

`sort=Located_at,Inventory_number` a été **exécuté en ligne avant d'être
proposé** : 40 lignes, et **aucune ligne sans valeur de Lieu** — donc pas de
ligne orpheline en tête de tri.

### Wikitexte complet — variante B

```
Cette page couvre les {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] |format=count}} plantations d'Ecolibre, tous lieux confondus. Elle ne prétend pas couvrir l'ensemble du jardin-forêt. L'absence de date de plantation signifie « non retrouvée », pas « non plantée ».

La table est triée par lieu : aucun lieu n'y est nommé en dur, une plantation déplacée ou un lieu nouveau y apparaît sans que la page soit modifiée.

== Plantations ==

{{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]]
|?Located_at = Lieu
|?Planting_date = Planté le
|?Specimen_status = État
|?Instance_of = Provenance
|?Planting_rank = Rang
|format=table
|sort=Located_at,Inventory_number
|order=asc,asc
|class=wikitable sortable
|limit=200
|default=''Aucune plantation enregistrée.''
}}

== Photos ==

<!-- Aucun lieu en dur ici non plus : la galerie prend toutes les photos de
     plantation, les plus récentes d'abord. Image_location reste disponible
     comme colonne, mais ne conditionne rien — c'est ce qui évite qu'un
     changement de vocabulaire de lieu vide la galerie en silence. -->

{{#ask: [[Category:Photo de plantation]]
|format=gallery
|sort=Image_date
|order=desc
|limit=24
}}

== Chiffres ==

Plantations par état :

* En place : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Specimen_status::en place]] |format=count}}
* Repris : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Specimen_status::repris]] |format=count}}
* Souffrant : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Specimen_status::souffrant]] |format=count}}
* Mort : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Specimen_status::mort]] |format=count}}
* Remplacé : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Specimen_status::remplacé]] |format=count}}
* En réserve : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] [[Specimen_status::en réserve]] |format=count}}

Total des plantations : {{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]] |format=count}}

Plantations par lieu :

{{#ask: [[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]]
|?Located_at
|format=count
|group=Located_at
}}

Espèces distinctes (organiques rejointes via Instance_of → Corresponds_to_organic) : {{#ask: [[Category:Organic item]] [[-Corresponds_to_organic::<q>[[Category:Referenced item]][[-Instance_of::<q>[[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]]</q>]]</q>]] |format=count}}
```

**Une réserve honnête sur le « Plantations par lieu »** ci-dessus :
`|group=` n'est pas un paramètre standard de `format=count`, et je ne l'ai
**pas** vérifié en ligne sur cette installation. À tester au bac à sable
avant de l'écrire, ou à remplacer par un `format=table` sur `Located_at`. Le
reste du bloc, lui, est mesuré.

### Ce que rend cette variante — mesuré

40 lignes dans la table unique, colonne Lieu remplie sur les 40. Le bloc
*Chiffres* est identique à celui de la variante A, aux mêmes valeurs.

---

## 6. Le bloc *Chiffres*, dans les deux cas — vérifié

Aucun lieu n'y figure. Condition unique :
`[[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]]`.

| | Aujourd'hui (faux) | Proposé (mesuré) |
|---|---|---|
| En place | 11 | **37** |
| Repris | 0 | **1** |
| Souffrant | 0 | 0 |
| Mort | 0 | **1** |
| Remplacé | 0 | 0 |
| En réserve | 0 | **1** |
| **Total** | **11** | **40** |
| Espèces distinctes | 11 | **30** |

**Le total rend bien 40**, et la somme des six états rend 40 également — les
deux contrôles se recoupent, ce qui exclut qu'un état échappe à
l'énumération.

---

## 7. Autres pages nommant un lieu en dur dans une requête : **aucune**

**Une seule page du wiki est concernée, et c'est celle-ci.**

Le contrôle a demandé une méthode particulière, à consigner : **la recherche
plein texte ne peut pas trouver ces cas.** Elle indexe le rendu, et une
condition `[[Located_at::Le Buisson de Cerzat]]` écrite dans un `#ask`
n'apparaît jamais dans le texte rendu — seuls ses résultats y sont. Une
recherche sur « Le Buisson de Cerzat » remonte 30 pages, qui sont toutes des
pages **dont le titre** contient ce nom, aucune requête.

Le wikitexte brut des **346 pages** des espaces principal, Modèle, Catégorie,
Attribut, Formulaire, Projet et Aide a donc été lu et analysé : pour chaque
bloc `#ask`, `#show` ou `#ifexpr`, recherche des huit noms de lieux connus
du wiki à l'intérieur du bloc.

```
PAGES DONT UNE REQUETE NOMME UN LIEU EN DUR
  [(principal)] Avancement du jardin-forêt
        -> Jardin de Chilhac
        -> Le Buisson de Cerzat
        -> Terrasse de Chilhac
```

`Modèle:Lieu` interroge bien `Located_in` et `Located_at`, mais via
`{{FULLPAGENAME}}` — il s'adapte donc à n'importe quel lieu et ne peut pas
périmer. C'est le bon patron.

### Deux constats annexes, relevés en passant, à ne pas corriger ici

**1. Les titres de 29 pages d'item mentent sur le lieu.** Elles s'appellent
« *Tomates — Le Buisson de Cerzat (ECL-0038)* » alors que leur `Located_at`
vaut désormais `Butte de la tranchée`. Aucune requête n'en dépend — les
titres ne sont pas interrogés — mais un lecteur humain y lira une
contradiction avec la colonne Lieu de la variante B. Question de renommage,
distincte de celle-ci.

**2. `Image_location` n'a pas suivi la migration de la tâche 5.** 45 photos
portent encore `Le Buisson de Cerzat`, zéro porte `Butte de la tranchée`.
C'est ce qui rend le point A1/A2 du §4 nécessaire, et c'est le seul travail
que ni la variante A ni la variante B ne peuvent absorber. À cadrer à part.

*(Vérification faite : les deux pages que le balayage signalait avec un lieu
« étranger » — `Menthe X (ECL-0023)` et `Poireau perpétuel (ECL-0033)` — ne
sont pas des anomalies. Le nom apparaît dans leur `Propagated_from`, qui
pointe vers une plantation d'un autre lieu. Les deux sont bien sur la butte.)*

---

## 8. Pour choisir

Ce qui sépare vraiment les deux, une fois les chiffres posés :

- **A** garde la lecture par emplacement — utile pour aller voir une butte
  sur le terrain — et se périmera **à la prochaine plantation dans un lieu
  nouveau**. Le bloc *Chiffres* du §6, lui, ne se périme plus : l'écart entre
  le total et la somme des sections devient un signal, ce qui atténue le
  défaut sans le supprimer.
- **B** ne se périme jamais et coûte la lecture par emplacement — que le
  tri par lieu restitue en partie, sans les galeries de photos par lieu.

**Le point A1/A2 est à trancher avant l'écriture si c'est A qui est
retenue** ; B contourne la question en ne conditionnant aucune galerie sur
un lieu, mais perd du même coup l'association photo ↔ lieu.

Rien n'est écrit. Aucune des deux variantes n'est recommandée ici.
