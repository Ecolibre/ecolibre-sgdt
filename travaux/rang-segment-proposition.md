# [Amendement] Le rang devient un segment — proposition

**Date : 25 août 2026. Lecture et proposition seulement, aucune écriture.**

Deux corrections de cadrage à annoncer d'emblée, l'une et l'autre vérifiées
en ligne :

> **La tâche 4 est déjà faite.** `Attribut:Planting rank` **ne parle plus** de
> « rang ordinal, multiples de dix » : elle a été réécrite en mètres le
> **24 août 2026**, page comprise, pas seulement requalifiée. Il reste bien
> une réécriture à proposer — pour dire *début de segment* — mais ce n'est
> pas celle annoncée.

> **Les diffs de la tâche 5 ne portent pas sur les pages nommées.**
> `Planting_rank` n'est câblé ni dans `Modèle:Physical item` ni dans
> `Formulaire:Physical item` : il vit dans **`Modèle:Physical facet plant`**
> et **`Formulaire:Physical item/bloc facette végétal`**. Les deux pages
> nommées dans la consigne ne contiennent pas une seule occurrence de
> `Planting_rank`.

---

## 1. `Attribut:Planting rank` — état réel

### Ce que la page porte aujourd'hui

```
[[Has type::Number]]
[[Property_description_FR::Position de l'exemplaire, en mètres entiers depuis l'origine du lieu où il se trouve — non comparable d'un lieu à l'autre.]]
[[Property_description_EN::Position of the specimen, in whole metres from the origin of the location it is in — not comparable across locations.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::mètres entiers depuis l'origine du lieu, non comparable d'un lieu à l'autre]]
```

**Aucune mention d'ordinal ni de multiples de dix.** L'historique le confirme :

```
2026-08-24T23:20  rev 875  [Amendement] Property_range aligné sur la casse et la ponctuation…
2026-08-24T23:09  rev 869  [Amendement][Attribut:Planting rank] Description et Property_range corrigés — mè…
2026-08-15T14:31  rev 507  [Lot 9][Tâche 1] Création de la propriété Planting_rank
```

Et le magasin est à jour — ce n'est pas seulement le wikitexte :

```
Property_range -> ["mètres entiers depuis l'origine du lieu, non comparable d'un lieu à l'autre"]
_TYPE          -> ['…swivt/1.0#_num']
```

75 caractères, sous le plafond de 85 : la valeur est bien stockée, pas
rejetée.

**Sur le verrou.** La page s'est écrite **deux fois hier sans encombre**. Il
n'y a donc aucune trace de `smw-change-propagation-protection` sur elle. Mais
`prop=info` ne voit pas ce verrou et il est intermittent : la seule façon de
savoir est de tenter l'écriture. Leçon retenue de `CLAUDE.md` — *un blocage
déduit n'est pas un blocage constaté*, et le refus coûte moins cher que la
dette.

### Combien de plantations portent un rang : **2 sur 40**

```
plantations (physique + facette végétale) : 40
  portant Planting_rank  : 2
  portant Planted_count  : 4
  portant les deux       : 2
  sans rang              : 38
```

Les deux seules valeurs en place :

```
rang=2    nb=1   Menthe bergamote — Le Buisson de Cerzat (ECL-0026)
rang=15   nb=1   Menthe X — Le Buisson de Cerzat (ECL-0023)
```

**Ni l'une ni l'autre n'est un multiple de dix.** L'ancienne convention
ordinale n'a donc laissé aucune trace dans les données non plus : `2` et `15`
se lisent déjà comme des mètres. La migration est complète — page et données.

**Conséquence pratique : le coût de cet amendement est nul côté données.**
38 plantations sur 40 n'ont pas de rang du tout, et les 2 qui en ont un
deviennent des débuts de segment sans être touchées.

---

## 2. `Attribut:Planted count` — elle existe, et elle ne se confond pas avec le segment

```
[[Has type::Number]]
[[Property_description_FR::Nombre d'individus mis en terre lors de cette plantation, quand il est pertinent de le compter. Absence de valeur : non compté, pas zéro.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::nombre d'individus]]
```

**4 plantations sur 40 la renseignent :**

```
nb=1   rang=-    Ail éléphant — Le Buisson de Cerzat (ECL-0041)
nb=3   rang=-    Ail éléphant — Le Buisson de Cerzat (ECL-0042)
nb=1   rang=15   Menthe X — Le Buisson de Cerzat (ECL-0023)
nb=1   rang=2    Menthe bergamote — Le Buisson de Cerzat (ECL-0026)
```

### Comment elle se répond avec un segment — deux lectures, je ne tranche pas

**Lecture A — les deux sont orthogonales, on garde les deux.** Le nombre dit
*combien d'individus*, le segment dit *sur quelle longueur*. Trente pieds sur
trois mètres et trente pieds sur trente mètres sont deux plantations
différentes, et seul le couple les distingue. C'est la lecture qui donne le
plus d'information, et elle ne demande aucune décision : les deux propriétés
coexistent, chacune facultative.

**Lecture B — le segment rend le compte inutile pour les touffes.** Une touffe
de poireau perpétuel sur trois mètres, on ne compte pas ses pieds : la
description de `Planted_count` prévoit d'ailleurs explicitement l'absence
(« non compté, pas zéro »). Dans cette lecture, `Planted_count` reste pour les
plantations dénombrables — les trois ails éléphant — et le segment prend le
relais pour les masses continues. Les deux ne seraient alors presque jamais
renseignées ensemble.

**Ce que disent les données actuelles** : les 4 valeurs sont `1`, `3`, `1`,
`1` — que des petits nombres dénombrables, et jamais une masse. Elles ne
départagent pas les deux lectures, mais elles montrent que `Planted_count` a
jusqu'ici servi au dénombrement fin, ce qui **penche vers la lecture B** sans
la démontrer.

**Ce qu'il faudrait pour trancher : une vraie touffe saisie.** La question se
règlera au premier poireau perpétuel étendu — pas sur le papier.

---

## 3. La propriété de fin — proposée

### Nom : `Planting_rank_end`

Vérifié **libre** en ligne, comme les deux autres candidats (`Planting_end`,
`Planting_span_end`).

Je recommande `Planting_rank_end` pour une raison précise : dans la liste
alphabétique de l'espace `Attribut:`, elle se range **immédiatement après**
`Planting_rank`. Qui découvre l'une voit l'autre. `Planting_end` est plus
court mais se range entre `Planting_date` et `Planting_period`, loin du début
dont il est la fin.

### La page

```
[[Has type::Number]]
[[Property_description_FR::Fin du segment occupé par cette plantation, en mètres entiers depuis l'origine du lieu. Facultative : laissée vide pour une plantation ponctuelle, qui n'occupe qu'un point. N'a de sens qu'avec un Planting_rank, qui en marque le début.]]
[[Property_description_EN::End of the strip occupied by this planting, in whole metres from the origin of the location. Optional: left empty for a point planting. Meaningful only together with Planting_rank, which marks its start.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::mètres entiers depuis l'origine du lieu, fin de segment]]
```

Les trois exigences de description y sont : la fin en mètres depuis l'origine
du lieu ; le caractère facultatif et le vide pour une plantation ponctuelle ;
et le fait qu'elle n'a de sens qu'avec un début.

**Domaine `Category:Physical item`**, comme `Planting_rank` et
`Planted_count` — bien que le câblage se fasse dans le modèle de facette. Les
trois propriétés déclarent déjà ce domaine ; en changer pour celle-ci seule
créerait une asymétrie sans gain.

### `Property_range` compté par script

```
Plafond Keyword : 85 caracteres

 80 car  OK   mètres entiers depuis l'origine du lieu, fin du segment ouvert par Planting_rank
 55 car  OK   mètres entiers depuis l'origine du lieu, fin de segment      <= RETENU
 58 car  OK   fin de segment, en mètres entiers depuis l'origine du lieu

Temoins deja stockes :
  75 car  Planting_rank    mètres entiers depuis l'origine du lieu, non comparable d'un lieu à l'autre
  18 car  Planted_count    nombre d'individus
  33 car  Owned_by         acteur (organisation ou personne)
```

**Je retiens la forme à 55 caractères, pas la plus explicite.** La variante à
80 passe le plafond, mais de 5 caractères seulement — et c'est précisément ce
plafond qui a fait perdre silencieusement six `Property_range` du lot 7
(entrée 40 de *Limites connues*). Une marge de 5 caractères sur une contrainte
qui échoue sans message ne vaut pas le gain de précision, d'autant que la
description, elle, n'a pas de plafond et dit déjà tout.

Second motif : la forme retenue **fait la paire** avec la réécriture proposée
au §4 — `…, début de segment` (57 car) et `…, fin de segment` (55 car) se
lisent comme deux moitiés d'une même phrase.

### Sur le séparateur décimal

`Planting_rank` dit « mètres **entiers** » : la question ne devrait pas se
poser. Elle se posera quand même, parce qu'une fin de segment invite plus
naturellement à la demi-mesure qu'un point de départ (« ça s'arrête vers
18,5 »). Le rappel est donc porté par l'infobulle du formulaire (§5), là où la
personne saisit : **la virgule, jamais le point**, qui est rejeté sans message
sur une propriété `Number` — la valeur n'est alors pas stockée du tout.

---

## 4. Réécriture proposée de `Planting_rank`

Non pas pour dire les mètres — c'est déjà fait — mais pour dire le **début de
segment**. Le texte actuel dit « Position de l'exemplaire », ce qui ne laisse
pas deviner qu'une fin peut suivre.

```
[[Has type::Number]]
[[Property_description_FR::Début du segment occupé par cet exemplaire, en mètres entiers depuis l'origine du lieu où il se trouve — non comparable d'un lieu à l'autre. Seule valeur nécessaire pour une plantation ponctuelle ; Planting_rank_end en donne la fin quand elle occupe plusieurs mètres.]]
[[Property_description_EN::Start of the strip occupied by this specimen, in whole metres from the origin of the location it is in — not comparable across locations. The only value needed for a point planting; Planting_rank_end gives the end when it spans several metres.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::mètres entiers depuis l'origine du lieu, début de segment]]
```

Ce qui change : « Position de l'exemplaire » → « Début du segment occupé par
cet exemplaire » ; ajout de la phrase sur le cas ponctuel et le renvoi à
`Planting_rank_end` ; `Property_range` passe de 75 à **57 caractères**, et
perd « non comparable d'un lieu à l'autre » — l'information reste dans la
description, où elle a toujours été, et la portée gagne la symétrie avec la
nouvelle propriété.

**Trois lignes modifiées, `Has type`, `Property_cardinality` et
`Property_domain` intactes.** Aucune valeur existante n'est invalidée : les
rangs `2` et `15` deviennent des débuts sans être touchés.

---

## 5. Les deux diffs — sur les bonnes pages

### 5.a `Modèle:Physical facet plant` — +2 / −1

```diff
@@ -6,6 +6,7 @@
  {{#set:
  |Planting_date={{{Planting_date|}}}
  |Planting_rank={{{Planting_rank|}}}
+|Planting_rank_end={{{Planting_rank_end|}}}
  |Specimen_status={{{Specimen_status|}}}

@@ -24,7 +25,7 @@
  ! style="background:#f2f2f2; width:30%;" | Rang le long de la butte
-| {{#if:{{{Planting_rank|}}}|{{{Planting_rank}}}|''—''}}
+| {{#if:{{{Planting_rank|}}}|{{{Planting_rank}}}{{#if:{{{Planting_rank_end|}}}|&#32;→ {{{Planting_rank_end}}}|}}|''—''}}
```

**Pas de rang nouveau dans le tableau** — la fin s'ajoute *dans* la cellule
existante, ce qui répond exactement à l'exigence : une colonne de fin vide sur
38 lignes sur 40 ferait du bruit. La ligne d'affichage est donc **remplacée**,
pas ajoutée : c'est la seule suppression des deux diffs, et elle est
volontaire.

**Le comportement a été vérifié en ligne, sur les quatre cas** — par
`action=expandtemplates`, avant d'écrire quoi que ce soit ici :

```
rang vide, fin vide              -> ''—''
rang=15, fin vide                -> 15
rang=15, fin=18                  -> 15&#32;→ 18     (rendu HTML : « 15 → 18 »)
rang vide, fin=18 (incohérent)   -> ''—''
```

**Le `&#32;` n'est pas une coquetterie : sans lui, l'affichage est faux.** Ma
première version écrivait `| → {{{…}}}`, avec une espace nue. Rendu réel :
**`15→ 18`**, sans espace avant la flèche — `#if` rogne l'espace de tête de
ses arguments. Mesuré, puis corrigé. `&#32;` est déjà le patron maison, employé
dans `Modèle:Organic item` (`|,&#32;`). Rendu HTML vérifié : `15 → 18`.

*Alternative possible : `&nbsp;`, qui empêcherait « 15 » et « → 18 » de se
séparer en fin de ligne. Rendu vérifié aussi (`15\xa0→ 18`). Je propose
`&#32;` pour rester sur le patron déjà en place, mais `&nbsp;` se défend.*

### 5.b `Formulaire:Physical item/bloc facette végétal` — +3 / −0

```diff
@@ -8,6 +8,9 @@
  ! Rang le long de la butte :
  | <nowiki>{{{field|Planting_rank|input type=text}}}</nowiki>
  |-
+! Fin du rang : {{#info: Laisser vide pour une plantation ponctuelle : la fiche affiche alors le seul début. Renseigner pour une touffe ou une ligne qui occupe plusieurs mètres — la fiche affiche « 15 → 18 ». Mètres entiers ; une décimale s'écrirait avec la virgule, jamais le point, qui est rejeté sans message.}}
+| <nowiki>{{{field|Planting_rank_end|input type=text}}}</nowiki>
+|-
  ! Nombre d'individus :
  | <nowiki>{{{field|Planted_count|input type=text}}}</nowiki>
```

**Le `<nowiki>` est reconduit**, comme sur les six champs voisins. Ce n'est pas
décoratif : c'est l'idiome qui permet à cette sous-page d'être lisible seule
sans que Page Forms interprète ses champs hors contexte. Vérifié en ligne que
le bloc rend bien de vrais champs une fois transclus — le formulaire émet
`name="Physical facet plant[num][Planting_rank]"`, et aucune balise `nowiki`
ne survit au rendu.

Placement **juste après le rang**, avant le nombre d'individus : le début et la
fin se saisissent d'affilée.

### Périmètre : 40 pages en service

`Modèle:Physical facet plant` est transclus par **40 pages**, toutes dans
l'espace principal — les 40 plantations. C'est un modèle en service au sens du
garde-fou 6 : les deux diffs sont à valider avant écriture.

---

## 6. La colonne *Rang* d'`Avancement du jardin-forêt`

La table unique imprime aujourd'hui :

```
|?Planting_rank = Rang
```

**Elle continuerait de fonctionner sans être touchée** — elle afficherait le
début, et tairait la fin. C'est correct mais incomplet.

**Ce que je propose, et que je n'écris pas :** ajouter la fin comme seconde
colonne, sans chercher à recomposer « 15 → 18 » dans la table.

```
|?Planting_rank = Rang
|?Planting_rank_end = Fin
```

**Pourquoi deux colonnes ici alors qu'une seule cellule dans la fiche** — les
deux situations n'ont pas la même contrainte :

- Sur la **fiche d'un exemplaire**, une ligne « Fin du rang » vide serait du
  bruit permanent sur 38 fiches. D'où la fusion dans la cellule.
- Dans la **table de la page d'avancement**, la colonne *Rang* est **déjà vide
  sur 38 lignes sur 40**. Une colonne *Fin* vide n'ajoute donc presque rien au
  bruit existant, et elle apporte quelque chose que la fusion coûterait cher à
  obtenir : **le tri**. `class=wikitable sortable` permet de trier sur une
  colonne numérique ; une cellule contenant « 15 → 18 » n'est plus un nombre
  et ne se trie plus.

**Un `#ask` ne peut pas fusionner deux propriétés dans une colonne** sans
passer par `format=template`, c'est-à-dire un modèle d'affichage
supplémentaire à créer et à maintenir. Le rapport coût/bénéfice est mauvais
pour une donnée présente sur 2 lignes.

**À faire seulement quand la donnée existera.** Aujourd'hui la colonne *Fin*
serait vide sur les 40 lignes : rien ne presse, et c'est une écriture séparée.

---

## 7. Ce qui manque, ce qui est de trop

### 7.1 Rien ne garantit que la fin soit après le début

`Planting_rank=18` avec `Planting_rank_end=15` s'enregistrerait sans un mot.
SMW ne compare pas deux propriétés entre elles, et Page Forms ne valide pas
au-delà du type. Trois options :

1. **Ne rien faire** et compter sur la relecture. C'est ce que fait déjà le
   modèle pour tout le reste.
2. Un contrôle d'affichage : `{{#ifexpr: {{{Planting_rank_end}}} < {{{Planting_rank}}} | ⚠ }}`
   dans le modèle — visible, sans blocage, une ligne de plus.
3. Une vraie validation, qui demanderait une extension.

**Je recommande la 1 pour ce lot** : deux valeurs existent, le risque est
théorique. La 2 devient intéressante le jour où la saisie se fait en nombre.
À noter pour qui écrirait la 2 : `#ifexpr` sur un paramètre vide déclenche une
erreur d'expression — il faut un `{{#if:}}` autour.

### 7.2 Une fin sans début est invisible

Mesuré au §5.a, quatrième cas : `Planting_rank` vide et `Planting_rank_end=18`
rend **`—`**. La fin est stockée mais **jamais affichée** — l'exact patron
d'échec silencieux que ce dépôt traque. La description dit bien « n'a de sens
qu'avec un début », mais elle ne l'empêche pas.

C'est le défaut le plus réel de la proposition, et **il est acceptable** : la
donnée n'est pas perdue, elle est dans le magasin, et le cas suppose une
saisie déjà incohérente. Mais il doit être écrit quelque part — je propose de
le porter dans la documentation du modèle plutôt que dans *Limites connues*,
qui recense des limites de l'outil, pas des choix de ce modèle-ci.

### 7.3 Le rang reste sans unité à l'affichage

La cellule affiche `15`, pas `15 m`. Le lecteur qui n'a pas lu la page de
propriété ne sait pas que c'est un mètre — et l'en-tête dit « Rang le long de
la butte », un mot qui vient de l'ancienne convention ordinale. **L'en-tête,
lui, n'a pas suivi la requalification du 24 août.** « Position le long de la
butte (m) » serait plus juste. Ce n'est pas dans le périmètre demandé et je ne
l'ai pas mis dans le diff : à décider à part, parce que ça touche l'en-tête de
40 fiches.

### 7.4 Ce qui est de trop : rien, mais une tentation à écarter

La tentation serait d'ajouter une **longueur** calculée (`fin − début`). Elle
ne doit pas être une propriété : elle est dérivable, donc elle se calculerait
à l'affichage si le besoin venait, et une propriété dérivée qui diverge de ses
sources est pire que pas de propriété du tout.

### 7.5 Deux notes de méthode

**La consigne nommait deux pages qui ne portent pas la propriété.** J'ai
vérifié avant de proposer, plutôt que de produire des diffs inapplicables. Le
réflexe qui a servi : `grep` sur le wikitexte des deux modèles, zéro
occurrence, puis recherche de la vraie page. Une consigne n'est pas une source
plus sûre qu'une lecture.

**La tâche 4 partait d'un état périmé de moins de vingt-quatre heures.** La
page avait été corrigée la veille au soir (revs 869 et 875 du 24 août à 23 h).
C'est exactement la leçon déjà consignée dans `CLAUDE.md` — *lire l'état du
wiki avant de raisonner, pas seulement avant d'écrire* — et elle vaut aussi
pour les états décrits par une consigne.

---

## Avant d'écrire

1. Trancher §2 : les deux lectures de `Planted_count` face au segment. Ça ne
   change aucune écriture, seulement ce que dit la description.
2. Confirmer le nom `Planting_rank_end` et la portée à 55 caractères (§3).
3. Confirmer `&#32;` plutôt que `&nbsp;` (§5.a).
4. Confirmer que la réécriture de `Planting_rank` (§4) est souhaitée — elle
   n'est pas indispensable au fonctionnement, seulement à la clarté.
5. Ordre, si validé : **`Attribut:Planting rank end`, puis
   `Attribut:Planting rank` (réécriture), puis `Modèle:Physical facet plant`,
   puis le bloc de formulaire** — modèle avant formulaire, comme toujours.
6. La colonne de la page d'avancement (§6) est une écriture séparée, à faire
   quand une plantation portera réellement une fin.
