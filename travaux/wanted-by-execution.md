# [Amendement] `Wanted_by` — exécution

**Date : 25 août 2026. Six écritures, toutes réussies, aucune interruption.**

Décisions appliquées : pas d'auto-extinction, tous les souhaits seront
affichés ; bleu `#e8f0ff` en dernier rang des deux modèles ; ni date, ni
priorité, ni quantité ; ordre attribut → modèles → formulaires.

**Sur l'auto-extinction, la correction était juste et je la consigne :**
j'avais testé la sous-requête **positive**
(`Corresponds_to_organic::<q>…</q>`, 32 résultats) et proposé une exclusion
qui ne s'en déduit pas — SMW n'a pas de négation. Le §6.1.2 de la
proposition présentait donc comme mesuré un mécanisme qui ne l'était pas.
Et le §6.3 du même document le contredisait déjà : vouloir un deuxième pied
est légitime. Une proposition ne devrait pas se contredire d'un paragraphe
à l'autre.

---

## 1. Les six écritures

| Rang | Page | oldrevid → newrevid | Diff appliqué |
|---|---|---|---|
| 1 | `Attribut:Wanted by` | 0 → **984** | création, `--createonly` |
| 2 | `Modèle:Organic item` | 407 → **985** | **+5 / −0** |
| 3 | `Modèle:Referenced item` | 817 → **986** | **+5 / −0** |
| 4 | `Formulaire:Organic item` | 411 → **987** | **+3 / −0** |
| 5 | `Formulaire:Referenced item` | 818 → **988** | **+3 / −0** |
| 6 | `Utilisateur:Cywil/Bac à sable` | 862 → **989** | essai du §3 |

Résumé identique sur les six : `[Amendement] Wanted_by — items souhaités`.

Les quatre pages de production ont été **relues en ligne juste avant**
d'être écrites et comparées au wikitexte ayant servi aux diffs de la
proposition : **identiques**, aucune modification hors session. Chacune
relue après écriture, et comparée à la fois au fichier proposé (écart nul)
et à l'état d'avant (le diff attendu, rien d'autre).

### Ce qui a réellement changé dans les modèles

```
Modèle:Organic item                    Modèle:Referenced item
12a13,14                               22a23,24
> |Wanted_by={{{Wanted_by|}}}          > |Wanted_by={{{Wanted_by|}}}
> |+sep=,                              > |+sep=,
47a50,52                               98a101,103
> |-                                   > |-
> ! …#e8f0ff" | Souhaité par           > ! …#e8f0ff" | Souhaité par
> | {{#arraymap:{{{Wanted_by|}}}|…}}   > | {{#arraymap:{{{Wanted_by|}}}|…}}
```

**Zéro ligne supprimée dans les quatre pages.** Les deux lignes du `#set`
sont placées en fin de bloc : le `|+sep=,` suit immédiatement sa propriété,
et aucune ligne existante ne se retrouve séparée du sien.

---

## 2. Contrôle intermédiaire entre les rangs 3 et 4

Avant de toucher aux formulaires : les 34 organiques et les 35 référencés
rendent-ils encore, et le nouveau rang s'affiche-t-il vide ?

Les 69 pages purgées puis rendues une par une, cinq contrôles par page —
présence du rang « Souhaité par » ; absence d'accolades non substituées ;
absence de marqueur d'erreur ; `<table>`/`</table>` en nombre égal ; **rang
apparié à sa cellule, et cellule effectivement vide**.

```
Organic item    : 34 pages controlees   rendu conforme : 34   soucis : 0
Referenced item : 35 pages controlees   rendu conforme : 35   soucis : 0
```

Rien d'abîmé : les formulaires pouvaient partir.

---

## 3. La question du bac à sable — réponse mesurée

> Peut-on afficher, en colonne d'une table d'organiques, le nombre ou la
> liste des exemplaires physiques existants ?

**La liste : oui. Le nombre : non.**

### La liste fonctionne, y compris à plusieurs valeurs

```
|?-Corresponds_to_organic.-Instance_of = Exemplaires physiques
```

La chaîne à deux crans traverse bien organique ← référencé ← physique.
Rendu réel sur le bac à sable :

```
Ail éléphant   | Allium ampeloprasum | ECL-0003, ECL-0041, ECL-0042
Bourrache      | Borago officinalis  | ECL-0004
Chayote        | Sechium edule       | ECL-0007, ECL-0025
Chou Daubenton | Brassica oleracea…  | ECL-0008, ECL-0009
```

*(références abrégées ici ; la colonne rend les titres complets)*

Vérifié sur les 34 organiques, pas seulement sur un échantillon :

```
organiques interroges       : 34
  avec au moins un exemplaire : 32
  colonne VIDE                : 2   (Cuve de récupération d'eau,
                                     Transfert d'eau par vases communicants)
  a plusieurs exemplaires     : 9   (jusqu'a 3 : Ail éléphant, Poireau perpétuel)
```

**Recoupé par un second canal**, pour ne pas conclure sur l'affichage seul :
pour trois cas multivalués, le nombre rendu par la chaîne a été comparé à
une requête directe par sous-requête. `chaine=3 / requete directe=3`,
`2 / 2`, `2 / 2` — **aucun écart**. La chaîne ne tronque pas à la première
valeur.

Le cas à zéro exemplaire rend une **cellule vide**, sans erreur ni message.

### Le nombre ne fonctionne pas — et il échoue en silence

`|?-Corresponds_to_organic.-Instance_of#count = Combien` est **accepté sans
erreur** et rend… **exactement la même liste**, sous un autre libellé.
Comparaison des deux colonnes rendues, cellule par cellule :

```
table A, lignes : 9
table B, lignes : 9
colonnes IDENTIQUES : True

=> '#count' n'a produit AUCUN effet : ni compte, ni erreur.
```

**C'est le cas de figure le plus dangereux** : pas un refus visible, pas un
message, une colonne qui a l'air de marcher. Quelqu'un qui écrirait `#count`
en se fiant à l'absence d'erreur croirait afficher un nombre et afficherait
une liste. À consigner comme tel.

### Ce que j'en conclus pour la section *Recherché*

**La colonne « exemplaires existants » est disponible, en liste.** Si Cyril
veut un nombre, il faudra soit s'en passer, soit afficher la liste et laisser
le lecteur compter — trois entrées se comptent à l'œil, et au-delà la liste
est plus informative qu'un nombre.

**Rien n'a été écrit sur *Avancement du jardin-forêt***, comme demandé. Le
bac à sable porte les quatre essais (A : la chaîne ; B : la tentative de
compte ; C : un cran seulement ; D : le cas à zéro sur les 34) — à supprimer
ou à garder selon ce que Cyril préfère.

---

## 4. Les contrôles après écriture

### `browsebysubject` — aucune annotation perdue, aucun `Wanted_by` parasite

**Un organique** (`Hysope`) :

```
Item_facet -> ['Facette_végétal#0##']
Item_ref   -> ['0019']
Taxon_name -> ['Hyssopus officinalis']
_INST      -> ['Organic_item#14##', 'Item_à_facette_végétal#14##']
```

**Un référencé** (`Hysope La Closerie D'Olt 2026`) :

```
Corresponds_to_organic -> ['Hysope#0##']
Item_ref               -> ['0023']
Sourcing_year          -> ['2026']
Supplier               -> ["La_Closerie_D'Olt#0##"]
_INST                  -> ['Referenced_item#14##']
```

Toutes les annotations préexistantes sont intactes — la modification du
`#set` n'en a délogé aucune. Et **aucun `Wanted_by`** n'apparaît : le
paramètre étant vide, `#set` ne stocke rien, ce qui est le comportement
attendu.

Élargi à tout le wiki, pour ne pas conclure sur deux pages :

```
pages portant Wanted_by : 0
```

La propriété existe, personne ne la porte encore. C'est l'état voulu :
contrairement à `Owned_by`, il n'y avait rien à rétro-remplir.

### Erreurs de traitement SMW : toujours 1

```
COUNT 1
 - Attribut:INSEE code
```

Même page, préexistante. Les six écritures n'ont introduit aucune
annotation rejetée. `Property_range` faisait 33 caractères, sous le plafond
de 85 du type `Keyword`, compté par script avant envoi.

### Les deux formulaires, chargés en lecture seule

GET sur `Spécial:FormEdit`, jamais d'enregistrement. Le champ est comparé au
**témoin** de chaque formulaire — un champ `tokens` déjà en service — pour
que le verdict repose sur une comparaison et non sur une lecture isolée :

```
Formulaire:Organic item
  Parent organique (témoin)  <select name="Organic item[Part_of][]"
                              class="pfTokens createboxInput" multiple=""
                              autocompletesettings="Organic item,list,,">
  Souhaité par               <select name="Organic item[Wanted_by][]"
                              class="pfTokens createboxInput" multiple=""
                              autocompletesettings="Organisation,list,,">

Formulaire:Referenced item
  Matériaux travaillés (témoin) <select name="Referenced item[Materials_worked][]"
                                 class="pfTokens createboxInput" multiple=""
                                 autocompletesettings="Materials_worked,list,,">
  Souhaité par                  <select name="Referenced item[Wanted_by][]"
                                 class="pfTokens createboxInput" multiple=""
                                 autocompletesettings="Organisation,list,,">
```

| | Attendu | Constaté |
|---|---|---|
| Champ présent | oui | **oui, dans les deux** |
| Widget `tokens` | `pfTokens` | **`pfTokens createboxInput`**, identique au témoin |
| Multivalué | `multiple` | **`multiple=""`** |
| **Sans défaut** | aucun `value` | **aucun attribut `value`** |
| Cible d'autocomplétion | `Organisation` | **`Organisation,list,,`** |

Position : **dernier champ des deux formulaires**, comme prévu.

```
Organic    : Item_ref · Item_description · Realizes_function · Part_of ·
             External_classification · Wanted_by
Referenced : … · Materials_worked · Measured_quantities · Wanted_by
```

**Aucune page n'a été créée** par ces consultations : les deux cibles
d'essai ressortent `missing`.

**Une note de méthode, parce que le premier contrôle a menti.** Page Forms
émet **deux** balises par champ : un `<input type="hidden">` et le widget
réel. Une première lecture, tombée sur la balise cachée, concluait « widget
tokens : False » — un faux négatif. Le `<select>` porte en outre
`name="…[Wanted_by][]"`, avec des crochets finaux qu'un filtre sur le nom
exact rate. Il faut lire la balise qui **suit le libellé**, pas la première
qui porte le nom. Troisième faux négatif de la journée dû à une clé
d'accès mal choisie, après `"Inventory site"` et `_PVAL`.

---

## 5. État final

- `Attribut:Wanted by` créée : type `Page`, cardinalité `multiple`, **deux
  lignes `Property_domain`** (Organic item, Referenced item), portée
  `acteur (organisation ou personne)` — identique au caractère près à celle
  d'`Owned_by`.
- Les deux modèles stockent et affichent `Wanted_by`, en dernier rang bleu.
- Les deux formulaires proposent le champ, en `tokens`, multivalué, **sans
  défaut**.
- 69 pages d'item rendent correctement, rang vide.
- 0 page porte encore un souhait ; erreurs SMW inchangées à 1.
- La colonne « exemplaires existants » est utilisable **en liste**, pas en
  nombre.

**Reste à faire, hors de cet amendement :** la section `== Recherché ==` sur
*Avancement du jardin-forêt*, une fois que Cyril aura dit s'il veut la
colonne des exemplaires existants. Les deux requêtes de la section sont
prêtes au §5 de `travaux/wanted-by-proposition.md` ; leur syntaxe a été
soumise au wiki et acceptée.
