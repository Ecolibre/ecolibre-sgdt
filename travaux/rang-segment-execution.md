# [Amendement] Le rang devient un segment — exécution

**Date : 25 août 2026. Quatre écritures, toutes réussies.**

Décisions appliquées : **lecture A** pour `Planted_count` — aucune restriction
d'usage écrite dans les descriptions ; nom `Planting_rank_end` et portée à
55 caractères ; **`&nbsp;` des deux côtés de la flèche** ; pas de contrôle que
la fin suive le début ; colonne de la page d'avancement laissée pour plus tard.

Le nouvel en-tête **« Position depuis l'origine du lieu (m) »** remplace
« Rang le long de la butte » dans le modèle **et** dans le bloc de formulaire.
La correction était juste : « butte » ne convenait plus — les 40 plantations
se répartissent entre `Butte de la tranchée`, `Jardin de Chilhac` et
`Terrasse de Chilhac`, et le wiki porte aussi `Au pied du pylône électrique`,
qui n'est pas une butte.

| Rang | Page | oldrevid → newrevid | Diff |
|---|---|---|---|
| 1 | `Attribut:Planting rank end` | 0 → **993** | création |
| 2 | `Attribut:Planting rank` | 875 → **994** | réécriture |
| 3 | `Modèle:Physical facet plant` | 738 → **995** | **+3 / −2** |
| 4 | `Formulaire:Physical item/bloc facette végétal` | 739 → **996** | **+4 / −1** |

Résumé identique sur les quatre : `[Amendement] Rang en segment — début et fin
facultative`.

---

## 1. `&nbsp;` des deux côtés — revérifié avant d'écrire

Le changement de séparateur modifiait le patron : les quatre cas ont donc été
repassés par `expandtemplates`, **puis par `action=parse`** pour voir le rendu
HTML réel et pas seulement le wikitexte produit.

```
--- wikitexte produit ---
rang vide, fin vide              -> ''—''
rang=15, fin vide                -> 15
rang=15, fin=18                  -> 15&nbsp;→&nbsp;18
rang vide, fin=18 (incohérent)   -> ''—''

--- rendu HTML réel ---
rang vide, fin vide              -> '—'                  (0 espace insécable)
rang=15, fin vide                -> '15'                 (0 espace insécable)
rang=15, fin=18                  -> '15\xa0→\xa018'      (2 espaces insécables)
rang vide, fin=18 (incohérent)   -> '—'                  (0 espace insécable)
```

**Les deux espaces sont bien insécables** (`\xa0`) : l'intervalle ne peut plus
se couper en fin de ligne, ni entre « 15 » et la flèche, ni entre la flèche et
« 18 ». La vérification par le wikitexte seul n'aurait pas suffi — il rend
`&nbsp;` littéralement, sans dire ce que le navigateur en fera.

---

## 2. Les quatre écritures

### Rang 2 — `Attribut:Planting rank` : **aucun verrou**

Une seule tentative, comme demandé. **Elle est passée du premier coup** :
`"result": "Success"`, revid 875 → 994. Aucun
`smw-change-propagation-protection`, aucun refus.

C'est cohérent avec ce que la proposition relevait : la page s'était déjà
écrite deux fois la veille au soir sans encombre. Et c'est une confirmation de
plus de la leçon de `CLAUDE.md` — *un blocage déduit n'est pas un blocage
constaté* : tenter l'écriture coûtait un appel, la supposer bloquée aurait
coûté une dette.

Ce qui a changé sur la page : « Position de l'exemplaire » devient « **Début
du segment** occupé par cet exemplaire », la phrase sur le cas ponctuel et le
renvoi à `Planting_rank_end` sont ajoutés, et `Property_range` passe de
75 à **57 caractères** (`mètres entiers depuis l'origine du lieu, début de
segment`). `Has type`, `Property_cardinality` et `Property_domain` sont
intacts.

**Aucune restriction d'usage n'a été écrite** sur le rapport entre le segment
et `Planted_count`, ni dans l'une ni dans l'autre description — lecture A
tenue : les deux propriétés restent orthogonales et facultatives, et la
question de savoir si l'on compte les pieds d'une touffe reste ouverte.

### Rang 3 — `Modèle:Physical facet plant`

```
8a9
> |Planting_rank_end={{{Planting_rank_end|}}}
26,27c27,28
< ! style="…" | Rang le long de la butte
< | {{#if:{{{Planting_rank|}}}|{{{Planting_rank}}}|''—''}}
---
> ! style="…" | Position depuis l'origine du lieu (m)
> | {{#if:{{{Planting_rank|}}}|{{{Planting_rank}}}{{#if:{{{Planting_rank_end|}}}|&nbsp;→&nbsp;{{{Planting_rank_end}}}|}}|''—''}}
```

Une ligne ajoutée au `#set`, deux lignes remplacées à l'affichage — l'en-tête
et la valeur. **Pas de rang nouveau dans le tableau** : la fin s'affiche dans
la cellule existante, ce qui évite une ligne vide sur 38 fiches sur 40.

### Rang 4 — `Formulaire:Physical item/bloc facette végétal`

```
8c8
< ! Rang le long de la butte :
---
> ! Position depuis l'origine du lieu (m) :
9a10,12
> |-
> ! Fin du segment : {{#info: …}}
> | <nowiki>{{{field|Planting_rank_end|input type=text}}}</nowiki>
```

Le `<nowiki>` est reconduit, comme sur les six champs voisins. L'infobulle
porte le rappel du séparateur décimal : **la virgule, jamais le point**, qui
est rejeté sans message sur une propriété `Number`.

Les quatre pages ont été relues après écriture : **écart nul** avec les
fichiers proposés dans les quatre cas.

---

## 3. Les vérifications

### Les 40 plantations rendent, avec le nouvel en-tête

Les 40 purgées puis rendues une par une, six contrôles chacune — nouvel
en-tête présent ; **ancien en-tête absent** ; pas d'accolade non substituée ;
pas de marqueur d'erreur ; `<table>`/`</table>` en nombre égal ; cellule
appariée à son en-tête.

```
plantations controlees : 40
  rendu conforme       : 40
  soucis               : 0
```

### ECL-0023 et ECL-0026 — inchangés

```
Menthe X — Le Buisson de Cerzat (ECL-0023)           cellule = '15'
Menthe bergamote — Le Buisson de Cerzat (ECL-0026)   cellule = '2'
```

Et les 38 autres :

```
{'—': 38}
```

Aucune n'a bougé : le nouveau `#if` imbriqué rend exactement ce que rendait
l'ancien quand la fin est vide, ce qui est le cas des 40.

### `browsebysubject` — `Planting_rank` intact sur les deux

```
Menthe X — … (ECL-0023)              Menthe bergamote — … (ECL-0026)
  Planting_rank  -> ['15']             Planting_rank  -> ['2']
  Planted_count  -> ['1']              Planted_count  -> ['1']
  Located_at     -> ['Butte…']         Planting_date  -> ['1/2025/11/17']
  Owned_by       -> ['Ecolibre#0##']   Owned_by       -> ['Ecolibre#0##']
  Specimen_status-> ['en place']       Specimen_status-> ['en place']
```

Toutes les annotations préexistantes sont là — la modification du `#set` n'en
a délogé aucune, et `Planting_rank` porte toujours les mêmes valeurs. **Aucune
clé `_ERR*`.**

Élargi à tout le wiki :

```
pages portant Planting_rank     : 2   (15 et 2, les mêmes qu'avant)
pages portant Planting_rank_end : 0
```

La propriété de fin existe et personne ne la porte encore — l'état voulu.

### Le formulaire, chargé en lecture seule

```
Physical facet plant[num][Planting_rank]      <input class="createboxInput" size="35">
Physical facet plant[num][Planting_rank_end]  <input class="createboxInput" size="35">

nouveau libelle present : True
ancien libelle present  : False
libelle Fin du segment  : True
nowiki survivant        : False
```

Le champ est là, même forme que son voisin, juste après lui. Le nouveau
libellé s'affiche, l'ancien a disparu, et aucune balise `nowiki` ne survit au
rendu — l'idiome de la sous-page fonctionne comme avant.

**Aucune page n'a été créée** par cette consultation : les deux cibles d'essai
ressortent `missing`.

### Erreurs de traitement SMW : toujours 1

```
COUNT 1
 - Attribut:INSEE code
```

Même page, préexistante. Les quatre écritures n'ont introduit aucune
annotation rejetée — les deux `Property_range` de 55 et 57 caractères passent
largement sous le plafond de 85.

*(La file de travaux affichait 11 et n'a pas bougé. Comme les fois
précédentes, ça n'a pas empêché les faits d'être lisibles : le compteur est
une estimation de propagation, pas un état de stockage — entrée 42 de*
Limites connues*.)*

---

## 4. Proposé, non écrit — la documentation du modèle de facette

**`Modèle:Physical facet plant/doc` n'existe pas.** Vérifié : seules quatre
pages `/doc` existent sur le wiki (`Functional item`, `Physical item`,
`Referenced item`, `Pending translation`). Le `{{Documentation}}` du modèle
pointe donc aujourd'hui dans le vide.

La proposition est donc de **créer** la page, sur le patron exact de
`Modèle:Physical item/doc`, avec le §7.2 consigné dedans :

```
=== Présentation (Overview) ===
[[Object_description_FR::Facette végétale d'un item physique : ce qui n'a de sens que pour une plantation — date, position, statut, filiation, photos.]]
[[Object_description_EN::Plant facet of a physical item: what only makes sense for a planting — date, position, status, lineage, photos.]]

Ce bloc ne s'ajoute qu'aux items physiques qui sont des plantations. Il pose
lui-même la catégorie [[:Catégorie:Item à facette végétal|Item à facette
végétal]], et il ne la pose que si <code><nowiki>Specimen_status</nowiki></code>
est renseigné : un bloc au statut vide n'annote rien et n'entre dans aucune
requête.

=== La position est un segment ===

<code><nowiki>Planting_rank</nowiki></code> donne le '''début''', en mètres
entiers depuis l'origine du lieu.
<code><nowiki>Planting_rank_end</nowiki></code> donne la '''fin''', et reste
vide pour une plantation ponctuelle. La fiche affiche alors le seul début —
« 15 » — et « 15 → 18 » quand les deux sont renseignés.

'''Une fin sans début est stockée mais jamais affichée.''' Si
<code><nowiki>Planting_rank_end</nowiki></code> est renseigné alors que
<code><nowiki>Planting_rank</nowiki></code> est vide, la valeur entre bien
dans le magasin SMW et reste interrogeable par
<code><nowiki>#ask</nowiki></code>, mais la fiche rend un tiret : l'affichage
est conditionné au début, puisqu'une fin seule ne situe rien. Mesuré le
25 août 2026. '''Rien n'empêche non plus une fin antérieure au début''' — SMW
ne compare pas deux propriétés entre elles et le formulaire ne valide que le
type. Les deux cas relèvent de la relecture, pas d'un contrôle automatique.

'''<code><nowiki>Planted_count</nowiki></code> et le segment sont
indépendants.''' Le nombre dit combien d'individus, le segment sur quelle
longueur : trente pieds sur trois mètres et trente pieds sur trente mètres
sont deux plantations différentes. Les deux sont facultatifs, et l'absence de
<code><nowiki>Planted_count</nowiki></code> signifie « non compté », pas zéro.

=== Code Source (Source Code) ===
<div style="background-color: #f9f9f9; border: 1px dashed #2f6fab; padding: 1em;">
{{#invoke:Source|get|Template:Physical facet plant}}
</div>

[[Catégorie:Documentation SGDT]]
```

**Deux points à savoir avant de l'écrire :**

- Les deux `Object_description_FR/EN` sont de **vraies annotations, et c'est
  voulu** : `Récapitulatif technique` les lit par `{{#show: …/doc
  |?Object_description_FR}}`. C'est le seul endroit du wiki où une annotation
  sur une page de documentation est légitime. Tout le reste passe en
  `<code><nowiki>…</nowiki></code>` — d'où les balises ci-dessus, sans
  lesquelles `Planting_rank` et consorts s'écriraient en annotations
  parasites.
- Créer cette page **ajoutera une ligne au tableau du *Récapitulatif
  technique*** si celui-ci liste les modèles de facette. À vérifier avant
  d'écrire, pas après.

---

## 5. Ce qui reste

- **La colonne de la page d'avancement** (`|?Planting_rank_end = Fin`) attend
  une vraie donnée, comme décidé. Aujourd'hui elle serait vide sur les
  40 lignes.
- **La documentation du §4** attend le feu vert.
- **Aucune plantation ne porte encore de fin.** La première touffe saisie sera
  l'épreuve réelle du dispositif — et tranchera aussi, en passant, la question
  laissée ouverte au §2 de la proposition : compte-t-on les pieds d'une touffe,
  ou seulement son étendue ?
