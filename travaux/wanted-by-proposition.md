# [Amendement] `Wanted_by` — les plantes recherchées — proposition

**Date : 25 août 2026. Lecture et proposition seulement, aucune écriture.**

Les quatre pages visées sont **en production**. Les diffs du §4 sont à valider
par Cyril avant écriture (garde-fou 6).

Acquis, non rediscuté : `Wanted_by`, type **Page**, portée documentée
**« un acteur »** comme `Owned_by`, domaine **Organic item ET Referenced
item**, cardinalité **multiple**.

Tous les chiffres ci-dessous sont mesurés en ligne, et **les requêtes du §5
ont été soumises au wiki avant d'être écrites ici** — leur syntaxe est
acceptée, y compris la sous-requête.

---

## 1. Comment une propriété de type Page est câblée, des deux côtés

### Le cas le plus proche : une propriété Page **multivaluée**

C'est `Part_of` (les deux modèles) et `Materials_worked` (Referenced) qui
font foi, pas les propriétés à valeur unique : `Wanted_by` est `multiple`, et
la cardinalité change le câblage des deux côtés.

**Côté modèle — deux lignes, pas une :**

```
|Part_of={{{Part_of|}}}
|+sep=,
```

`|+sep=,` s'applique à la propriété **qui le précède immédiatement**. Sans
lui, `Ecolibre, Atelier du Dôme` serait stocké comme **une seule valeur**
au lieu de deux. C'est le seul endroit du modèle où l'ordre des lignes porte
du sens.

**Côté affichage — `#arraymap`, pas `#if` :**

```
| {{#arraymap:{{{Part_of|}}}|,|@@@|[[@@@]]|,&#32;}}
```

Une propriété Page à valeur unique s'affiche `{{#if:…|[[…]]}}` (c'est
`Corresponds_to_organic`, `Supplier`, `Manufacturer`) ; une multivaluée passe
par `#arraymap`, qui découpe **et rogne les espaces**. Le `&#32;` est
l'espace insécable de séparation à l'affichage.

**Côté formulaire — `tokens`, pas `combobox` :**

```
{{{field|Part_of|list|delimiter=,|input type=tokens|values from category=Organic item}}}
```

`|list` est ce qui autorise plusieurs valeurs ; `combobox` n'en accepte
qu'une. Les deux formulaires l'écrivent, à l'ordre des paramètres près
(`Formulaire:Organic item` place `delimiter=,` explicitement,
`Formulaire:Referenced item` l'omet sur `Part_of`).

### Le piège d'espacement, et pourquoi il ne mord pas ici

Le widget `tokens` écrit `A, B` — avec une espace après la virgule — malgré
`delimiter=,`. Et SMW **ne rogne pas** les espaces des valeurs
intermédiaires : avec `|+sep=,`, `A, B` produit `A` et ` B`.

**Ça ne pose pas de problème pour `Wanted_by`, parce qu'elle est de type
Page** : MediaWiki normalise le titre et absorbe l'espace de tête. C'est
exactement la situation de `Part_of` et `Materials_worked`, également Page,
qui fonctionnent aujourd'hui. Le piège ne mord que sur une propriété de type
Texte — ce qui a motivé le traitement à part de `Measured_quantities` dans
`Modèle:Referenced item`, avec son `#arraymap` + `#set` imbriqués.

### Le domaine multiple : une ligne par catégorie

Forme maison confirmée sur `Attribut:External classification`, la seule
propriété du wiki à domaine multiple :

```
[[Property_domain::Category:Organic item]]
[[Property_domain::Category:Referenced item]]
[[Property_domain::Category:Functional item]]
```

Répétée, jamais séparée par une virgule. C'est ce que demande la consigne, et
c'est déjà l'usage.

---

## 2. Les comptes

| Classe | Items | Dont facette végétale |
|---|---|---|
| **Organic item** | **34** | **30** |
| **Referenced item** | **35** | **0** *(voir ci-dessous)* |
| Functional item | 25 | — |

**Transclusions** (le périmètre réellement en service) :

```
Modèle:Organic item    : 35 transclusions ns0, 34 membres de catégorie
Modèle:Referenced item : 36 transclusions ns0, 35 membres de catégorie
    l'écart, dans les deux cas : Récapitulatif technique du SGDT
```

`Récapitulatif technique` n'instancie pas les modèles : il en **publie le
code source** via `{{#invoke:Source|get|…}}`. Comme pour
`Modèle:Physical item` au lot précédent, les lignes ajoutées seront donc
**publiées automatiquement** dans la documentation technique, sans édition
supplémentaire.

**Protection** : `protection: []` sur les quatre pages. Nécessaire et
insuffisant (garde-fou 5) — un refus resterait un résultat normal.

### Une découverte qui pèse sur le §5 : la facette végétale ne descend pas au référencé

```
Referenced item + Category:Item à facette végétal : 0
```

`Modèle:Physical facet plant` et `Modèle:Organic facet plant` posent tous
deux `[[Category:Item à facette végétal]]`. **Il n'existe pas de
`Referenced facet plant`.** Un item référencé végétal n'est donc reconnaissable
qu'**indirectement**, par son organique :

```
[[Category:Referenced item]] [[Corresponds_to_organic::<q>[[Category:Item à facette végétal]]</q>]]
   -> 32 résultats, syntaxe acceptée par le wiki
```

Conséquence directe : le §5 ne peut pas filtrer les deux côtés de la même
façon. Ce n'est pas un défaut de `Wanted_by`, c'est un état du modèle qu'il
faut connaître avant d'écrire la requête.

---

## 3. `Attribut:Wanted by` — proposé

Nom vérifié **libre** en ligne (`missing`).

```
[[Has type::Page]]
[[Property_description_FR::Acteur qui souhaite obtenir cet item. N'implique aucun exemplaire physique : le souhait porte sur ce qui n'est pas encore là. Sur un item organique il vise l'espèce en général ; sur un item référencé, une provenance précise.]]
[[Property_description_EN::Actor who wants to obtain this item. Implies no physical specimen: the want bears on what is not there yet. On an organic item it targets the species in general; on a referenced item, a specific provenance.]]
[[Property_cardinality::multiple]]
[[Property_domain::Category:Organic item]]
[[Property_domain::Category:Referenced item]]
[[Property_range::acteur (organisation ou personne)]]
```

Les trois exigences de description sont couvertes dans l'ordre demandé :
l'acteur qui souhaite ; l'absence d'exemplaire physique ; espèce sur
l'organique / provenance sur le référencé.

**`Property_range` compté par script**, contre le plafond de 85 caractères du
type `Keyword` :

```
Plafond Keyword : 85 caracteres

 33 car  OK       acteur (organisation ou personne)   <= RETENU
 34 car  OK       acteur souhaitant obtenir cet item
 68 car  OK       acteur (organisation ou personne), sans exemplaire physique impliqué

Temoins deja stockes :
   33 car  Owned_by (ecrite ce jour)  acteur (organisation ou personne)
    4 car  Located_at                 lieu
   24 car  Materials_worked           valeurs laissées émerger
   25 car  External_classification    URL Wikipédia ou Wikidata
```

**Portée strictement identique à celle d'`Owned_by`**, au caractère près.
C'est délibéré : les deux propriétés visent la même chose — un acteur — et une
portée qui diverge sur deux propriétés jumelles ferait croire à une
différence qui n'existe pas. La nuance « sans exemplaire physique » est portée
par la description, qui n'a pas de plafond, pas par la portée, qui en a un.

---

## 4. Les quatre diffs

Tous calculés contre le wikitexte **relu en ligne à l'instant**, et
**zéro ligne supprimée dans les quatre**.

### 4.1 `Modèle:Organic item` — +5 / −0

```diff
@@ -10,6 +10,8 @@
  |Part_of={{{Part_of|}}}
  |+sep=,
  |External_classification={{{External_classification|}}}
+|Wanted_by={{{Wanted_by|}}}
+|+sep=,
  }}

@@ -45,6 +47,9 @@
  |-
  ! style="background:#f2f2f2" | Classification externe
  | {{{External_classification|}}}
+|-
+! style="background:#e8f0ff" | Souhaité par
+| {{#arraymap:{{{Wanted_by|}}}|,|@@@|[[@@@]]|,&#32;}}
  |}
```

### 4.2 `Modèle:Referenced item` — +5 / −0

```diff
@@ -20,6 +20,8 @@
  |Max_thickness={{#invoke:Nombre|virgule|{{{Max_thickness|}}}}}
  |Materials_worked={{{Materials_worked|}}}
  |+sep=,
+|Wanted_by={{{Wanted_by|}}}
+|+sep=,
  }}{{#if:{{{Measured_quantities|}}}|{{#arraymap:…}}}}

@@ -96,6 +98,9 @@
   |format=table
   |default=''Aucun exemplaire physique enregistré.''
  }}
+|-
+! style="background:#e8f0ff" | Souhaité par
+| {{#arraymap:{{{Wanted_by|}}}|,|@@@|[[@@@]]|,&#32;}}
  |}
```

### 4.3 `Formulaire:Organic item` — +3 / −0

```diff
@@ -15,6 +15,9 @@
  |-
  ! Classification externe (URL) :
  | {{{field|External_classification|input type=text}}}
+|-
+! Souhaité par : {{#info: Acteur qui cherche à obtenir cette espèce. N'implique aucun exemplaire physique : le souhait porte sur ce qui n'est pas encore là. Ici il vise l'espèce en général ; sur un item référencé, il viserait une provenance précise.}}
+| {{{field|Wanted_by|input type=tokens|values from category=Organisation|list|delimiter=,}}}
  |}
  {{{end template}}}
```

### 4.4 `Formulaire:Referenced item` — +3 / −0

```diff
@@ -48,6 +48,9 @@
  |-
  ! Grandeurs mesurées :
  | {{{field|Measured_quantities|input type=tokens|values from property=Measured_quantities|list}}}
+|-
+! Souhaité par : {{#info: Acteur qui cherche à obtenir cette provenance précise. N'implique aucun exemplaire physique. Sur un item organique, le souhait viserait l'espèce en général.}}
+| {{{field|Wanted_by|input type=tokens|values from category=Organisation|list|delimiter=,}}}
  |}
  {{{end template}}}
```

### Choix, et ce qu'ils coûtent

**Pas de `default=`, comme demandé.** Un souhait qui se poserait tout seul sur
chaque nouvel item serait faux dès la première saisie — c'est l'inverse
d'`Owned_by`, où le défaut est légitime parce que tout ce qu'on enregistre
appartient par défaut à qui l'enregistre.

**Deux lignes dans chaque `#set`, pas une.** La cardinalité `multiple`
impose le `|+sep=,`, et il doit suivre **immédiatement** sa propriété. Les
placer en fin de `#set` les met à l'abri : aucune ligne existante ne se
retrouve séparée de son propre `+sep=`.

**Dernier rang du tableau, en bleu `#e8f0ff`.** Le bleu marque les relations
vers un acteur — c'est ce qui a été retenu pour `Owned_by` dans
`Modèle:Physical item` au lot précédent. Le dernier rang, parce qu'un souhait
dit ce qui **n'est pas là** : il se lit après tout ce que l'item possède. Sur
le référencé, il tombe ainsi juste après « Exemplaires physiques », ce qui
met l'avoir et le vouloir côte à côte. *Alternative écartée : le gris
`#f2f2f2` des rangs voisins, plus homogène localement, mais qui perdrait le
lien visuel avec `Owned_by`.*

**`values from category=Organisation` dans les deux formulaires.** Même point
qu'au lot précédent : `Catégorie:Organisation` ne contient qu'`Ecolibre`, donc
la liste n'offrira qu'une valeur. La portée dit « un acteur » ; la combobox ne
sait proposer que des organisations tant que `Catégorie:Personne` n'existe
pas. Cohérent avec `Owned_by`, et à revoir en même temps.

---

## 5. Comment la page d'avancement afficherait les souhaits

**Où : une section `== Recherché ==` entre `== Plantations ==` et
`== Photos ==`.** La page se lit alors : ce que je possède, ce que je cherche,
les photos, les chiffres. Le souhait est adjacent à la table des plantations
parce que c'est la même question — l'état du jardin — vue par son manque.

**Ce qu'il ne faut surtout pas faire : verser les souhaits dans le total.** Le
bloc *Chiffres* rend aujourd'hui 40, la somme des six états rend 40, et les
deux se recoupent. Une espèce recherchée n'est pas une plantation : la
compter dans « Total des plantations » referait mentir la page, exactement ce
qu'on vient de réparer. Un compte **séparé**, sur une ligne à part.

### Les deux requêtes — syntaxe déjà soumise au wiki

Deux tables, parce que le §2 a montré que les deux côtés ne se filtrent pas
de la même façon.

**Espèces recherchées** (l'organique porte la facette directement) :

```
{{#ask: [[Category:Organic item]] [[Wanted_by::Ecolibre]] [[Category:Item à facette végétal]]
|?Taxon_name = Nom scientifique
|?Item_ref = Réf.
|format=table
|sort=Item_ref
|order=asc
|class=wikitable sortable
|default=''Aucune espèce recherchée pour le moment.''
}}
```

**Provenances recherchées** (le référencé ne porte pas la facette — passage
obligé par l'organique) :

```
{{#ask: [[Category:Referenced item]] [[Wanted_by::Ecolibre]] [[Corresponds_to_organic::<q>[[Category:Item à facette végétal]]</q>]]
|?Corresponds_to_organic = Espèce
|?Supplier = Fournisseur
|?Sourcing_year = Année
|format=table
|sort=Item_ref
|order=asc
|class=wikitable sortable
|default=''Aucune provenance précise recherchée.''
}}
```

**Et une ligne dans *Chiffres*, hors du total :**

```
Espèces recherchées : {{#ask: [[Category:Organic item]] [[Wanted_by::Ecolibre]] [[Category:Item à facette végétal]] |format=count}}
```

Les trois formes ont été soumises au wiki : **syntaxe acceptée, 0 résultat** —
ce qui est attendu, la propriété n'existant pas encore. La sous-requête
`Corresponds_to_organic::<q>…</q>` a été validée séparément sur les données
réelles : **32 référencés végétaux**. Le jour où un souhait est saisi, la
requête travaille.

Aucun lieu n'est nommé, aucun nombre n'est écrit à la main : la section
respecte ce qui vient d'être posé sur la page.

---

## 6. Ce qui manque

### 6.1 Le vrai manque n'est ni la date, ni la priorité, ni la quantité — c'est la sortie

**Rien n'éteint un souhait.** Quand Cyril obtient la plante, il crée un item
physique — et `Wanted_by` reste, inchangé, sur l'organique. La page
d'avancement listerait indéfiniment comme « recherché » ce qui pousse déjà
dans la butte. C'est le même mécanisme que la panne qu'on vient de réparer :
une donnée qui ne se met pas à jour toute seule et que rien ne signale.

Trois façons d'y répondre, par ordre de coût croissant :

1. **Retirer la valeur à la main** quand la plante arrive. Coût nul
   aujourd'hui, mais c'est un geste à ne pas oublier — et personne ne le
   rappellera.
2. **Rendre la requête auto-extinctrice** : exclure de la table les organiques
   qui ont déjà un exemplaire physique, via la même jointure
   `Corresponds_to_organic` → `Instance_of` que le compte d'espèces de la
   page. Le souhait s'éteint alors **tout seul** à la création du premier
   exemplaire. Rien à ajouter au modèle, tout se joue dans la requête.
3. Une propriété d'état du souhait — à ne pas faire, voir 6.2.

**Je recommande le 2**, et je ne l'ai pas mis au §5 parce que ça change la
sémantique de la section : « recherché » deviendrait « recherché et pas encore
obtenu ». C'est probablement ce que Cyril veut, mais c'est à lui de le dire,
pas à la requête de le décider en silence. Mesure à l'appui : **32 organiques
ont déjà au moins un exemplaire physique** sur 34 — donc l'exclusion mordrait
réellement, ce n'est pas une précaution théorique.

### 6.2 Date, priorité, quantité — mon avis : aucune des trois, pas maintenant

**Date (« recherché depuis »)** — sert à faire vieillir une liste. Une liste de
quelques espèces ne vieillit pas. Elle deviendra utile le jour où un souhait
traîne assez pour qu'on se demande s'il est encore d'actualité — pas avant.
À noter : `Sourcing_year` existe déjà sur le référencé, mais dit l'année
d'obtention d'un lot **obtenu**, pas la date d'un souhait. Les deux ne se
confondent pas.

**Priorité** — c'est celle que j'écarte le plus franchement. Une priorité est
une énumération fermée (`haute, moyenne, basse`), donc un `Allows value`, donc
une seconde écriture le jour où une valeur manque — précisément ce que le
lot 10 s'était interdit. Et une priorité sur trois souhaits n'ordonne rien
qu'un regard n'ordonne mieux.

**Quantité** — la plus défendable des trois : « je cherche trois pieds de X »
est une phrase réelle, et `Planted_count` existe déjà côté physique, ce qui
donnerait un symétrique naturel. Je l'écarte quand même, pour une raison
précise : la quantité souhaitée porte sur un **approvisionnement**, pas sur
l'espèce. Deux personnes cherchant la même espèce en quantités différentes ne
sauraient pas où l'écrire, `Wanted_by` étant multivaluée sur l'item et non
sur le couple (item, acteur). Il faudrait un sous-objet, ce qui est un tout
autre travail.

**La règle qui les couvre toutes les trois** : une propriété non éprouvée dans
le lot qui la crée n'est pas éprouvée. Le lot n'a aujourd'hui **aucun souhait
réel** à enregistrer — les trois se créeraient à vide.

### 6.3 Trois points plus courts

**`Catégorie:Personne` n'existe toujours pas**, et la combobox ne propose
qu'`Ecolibre`. La portée dit « un acteur », le formulaire ne sait offrir
qu'une organisation. Cohérent avec `Owned_by`, à lever d'un coup pour les
deux.

**Les items fonctionnels sont hors domaine, et c'est juste.** On ne
« souhaite » pas une fonction — *Cultiver de la nourriture* n'est pas quelque
chose qu'on cherche à obtenir. Les 25 fonctionnels restent dehors.

**Un souhait sur un organique qui a déjà des exemplaires n'est pas absurde**
— vouloir un deuxième pied est légitime. C'est ce qui rend le choix 6.1.2 un
arbitrage et non une évidence : l'auto-extinction ferait disparaître ce
cas-là aussi.

### 6.4 Rien de trop

Le périmètre demandé — une propriété, deux modèles, deux formulaires — est
minimal et cohérent. Je n'ai rien à retrancher.

---

## Avant d'écrire

1. Trancher le §6.1 : souhait éteint à la main, ou requête auto-extinctrice.
   Ça ne change aucune des quatre écritures, seulement la requête du §5.
2. Confirmer le bleu `#e8f0ff` du dernier rang (§4).
3. Ordre d'écriture, si c'est validé : **`Attribut:Wanted by`, puis les deux
   modèles, puis les deux formulaires** — « modèle avant formulaire », sans
   quoi une valeur saisie serait perdue sans erreur.
4. Aucun remplissage n'est prévu : contrairement à `Owned_by`, il n'y a rien à
   rétro-remplir. La propriété naîtra vide et se remplira au premier souhait
   réel.
