# [Amendement] *Avancement du jardin-forêt* — exécution de la variante B

**Date : 25 août 2026. Une écriture, réussie.**

Page réécrite d'un seul tenant (revid 853 → **983**). Résumé :
`[Amendement] Avancement — critère Owned_by + facette végétale, plus aucun
lieu nommé en dur`.

Motif de la variante B, tel que retenu par Cyril : la lecture par
emplacement existe déjà sur chaque page de lieu, dans le bloc « Présents
ici » posé automatiquement par `Modèle:Lieu`. La variante A aurait rebâti à
la main, sur une page qui se périme, ce que treize pages de lieu font sans
entretien.

---

## 1. Les trois corrections, vérifiées avant l'écriture

Contrôlées par script sur le fichier source, avant qu'il parte :

### 1 — Le bloc « Plantations par lieu » est retiré

```
'group=' present        : False
'Plantations par lieu'  : False
```

Il reposait sur un `|group=` que je n'avais **pas** mesuré sur cette
installation. La table triée par lieu donne déjà la répartition ; un
construit non vérifié n'avait pas à être écrit.

### 2 — La galerie porte le commentaire demandé

Le commentaire wikitexte placé au-dessus dit que la galerie **contourne** la
divergence sans la résoudre, et donne le chiffre :

> Cette galerie ne pose aucune condition de lieu, et c'est un contournement,
> pas une solution : `Image_location` n'a pas suivi la migration de
> `Located_at` faite en tâche 5. Au 25 août 2026, 45 photos portent encore
> `Image_location=Le Buisson de Cerzat`, lieu où plus aucune plantation ne se
> trouve, et aucune ne porte `Butte de la tranchée`. Conditionner la galerie
> sur un lieu la viderait donc en silence, comme cela est arrivé aux tables
> d'items. […] La divergence des deux vocabulaires de lieu reste entière et
> se corrige ailleurs.

### 3 — L'introduction ne nomme plus aucun lieu

Les huit noms de lieux connus du wiki, cherchés dans l'introduction **et**
dans tout le corps hors commentaires :

```
Le Buisson de Cerzat     intro:False  hors commentaire:False
Jardin de Chilhac        intro:False  hors commentaire:False
Terrasse de Chilhac      intro:False  hors commentaire:False
Butte de la tranchée     intro:False  hors commentaire:False
Zone basse               intro:False  hors commentaire:False
Zone haute               intro:False  hors commentaire:False
Atelier appartement      intro:False  hors commentaire:False
Terrain de Cyril         intro:False  hors commentaire:False
```

**Aucun lieu n'est nommé nulle part sur la page, hors des deux commentaires
d'explication** — et ceux-là ne conditionnent rien : ils expliquent pourquoi
il ne faut pas en nommer.

L'introduction ne donne plus non plus de nombre écrit à la main. « 40
plantations » et « 17 des 40 » étaient du texte figé, faux dès que la donnée
bouge ; le nombre est maintenant une requête.

---

## 2. Ce qui a été écrit

11 appels `#ask`, contre 20 auparavant. La condition est la même partout :

```
[[Category:Physical item]] [[Owned_by::Ecolibre]] [[Category:Item à facette végétal]]
```

| Bloc | Contenu |
|---|---|
| Introduction | le compte des plantations, en requête |
| `== Plantations ==` | une table, colonne `Lieu`, `sort=Located_at,Inventory_number` |
| `== Photos ==` | une galerie sans condition de lieu + le commentaire du §1.2 |
| `== Chiffres ==` | six comptes par état, un total, une jointure d'espèces |

Relue après écriture et comparée au fichier source : **identique**, au seul
retour à la ligne final que MediaWiki retire au stockage.

---

## 3. Les cinq vérifications, page purgée

### La table : 40 lignes, colonne Lieu remplie sur les 40

```
tables rendues             : 1
lignes de donnees          : 40
colonnes  : ['', 'Lieu', 'Planté le', 'État', 'Provenance', 'Rang']
lignes sans valeur de Lieu : 0
```

Le tri par lieu fonctionne — début et fin de table :

```
Ail éléphant … (ECL-0003)      | Butte de la tranchée | 17 novembre 2025 | repris
Bourrache … (ECL-0004)         | Butte de la tranchée |                  | en place
Brocoli vivace … (ECL-0005)    | Butte de la tranchée |                  | en place
…
Chayote — Terrasse de Chilhac (ECL-0025)      | Terrasse de Chilhac | | en place
Persil japonais — Terrasse … (ECL-0031)       | Terrasse de Chilhac | | en place
Roquette sauvage — Terrasse … (ECL-0036)      | Terrasse de Chilhac | | en place
```

### Le bloc *Chiffres*

| | Avant (faux) | Après (rendu) |
|---|---|---|
| En place | 11 | **37** |
| Repris | 0 | **1** |
| Souffrant | 0 | 0 |
| Mort | 0 | **1** |
| Remplacé | 0 | 0 |
| En réserve | 0 | **1** |
| **Total** | **11** | **40** |
| Espèces distinctes | 11 | **30** |

```
total == 40           : True
somme des etats == 40 : True
especes == 30         : True
lignes de table == 40 : True
```

**Les deux comptes se recoupent** : le total rendu par sa propre requête vaut
40, et la somme des six états vaut 40 aussi. Aucune plantation n'échappe à
l'énumération des états, et aucune n'est comptée deux fois.

### Aucune accolade nue, aucun marqueur d'erreur

```
'{{{' dans le rendu   : False
'{{#' dans le rendu   : False
class="error"         : False
'Expression error'    : False
strip marker residuel : False
intro nomme un lieu   : False
```

La galerie rend 24 vignettes, la limite posée.

### `browsebysubject` : aucune annotation parasite

```
_ASK  -> 10 sous-objets de suivi de requête
_MDAT -> ['1/2026/8/25/14/21/56/0']
_SKEY -> ['Avancement du jardin-forêt']
```

Trois clés, toutes internes. **Aucune annotation de propriété, aucune
catégorie.** Les `[[Category:…]]` et `[[Owned_by::Ecolibre]]` écrits sur la
page sont des **conditions de requête**, pas des annotations : ils vivent
dans un `{{#ask:}}` et SMW ne les stocke pas comme faits de la page. C'est le
piège inverse de celui consigné dans `CLAUDE.md` — un exemple de syntaxe
écrit hors requête, lui, serait bien exécuté comme annotation.

La forme est la même qu'avant l'écriture (`_ASK`, `_MDAT`, `_SKEY`), avec
**10 sous-objets au lieu de 17** : moins de requêtes. À noter, pour qui
recompterait : 10 et non 11, parce que le compte de l'introduction et le
« Total des plantations » sont **la même requête** — SMW n'en suit qu'une.

### Erreurs de traitement SMW : toujours 1

```
COUNT 1
 - Attribut:INSEE code
```

Même page, préexistante. L'écriture n'a introduit aucune annotation rejetée.

---

## 4. Ce que la page ne règle pas, et qui reste ouvert

**La divergence `Image_location` / `Located_at`.** 45 photos portent encore
`Le Buisson de Cerzat`, zéro porte `Butte de la tranchée`. La galerie
globale contourne le problème — elle ne peut plus se vider en silence — mais
l'association photo ↔ lieu est perdue tant que les fichiers ne sont pas
réannotés. Le commentaire dans le wikitexte le dit à qui rouvrira la page.
C'est le seul travail que la variante B ne pouvait pas absorber.

**Les titres de 29 pages d'item.** Elles s'appellent encore
« *… — Le Buisson de Cerzat (ECL-00xx)* » alors que leur `Located_at` vaut
`Butte de la tranchée`. Aucune requête n'en dépend, mais la contradiction est
désormais **visible côté à côté** dans la nouvelle table : le titre en
première colonne dit un lieu, la colonne *Lieu* en dit un autre. Question de
renommage, à cadrer séparément.

**Aucune autre page du wiki n'est concernée.** Le balayage du wikitexte brut
des 346 pages de sept espaces de noms n'avait trouvé qu'une seule page
nommant un lieu en dur dans une requête : celle-ci. Elle ne le fait plus.
