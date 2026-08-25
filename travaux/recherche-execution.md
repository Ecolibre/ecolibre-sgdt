# [Amendement] Section *Recherché*, entrée `#count`, ménage du bac à sable

**Date : 25 août 2026. Trois écritures, toutes réussies.**

L'ajustement demandé est appliqué : le libellé de la ligne de statistique est
**« Espèces recherchées — non comptées dans le total ci-dessus : »**. Le reste
du diff est parti tel quel, sans autre modification.

| Rang | Page | oldrevid → newrevid | Diff |
|---|---|---|---|
| 1 | `Avancement du jardin-forêt` | 983 → **990** | **+50 / −0** |
| 2 | `Limites connues du SGDT` | 866 → **991** | **+1 / −0** |
| 3 | `Utilisateur:Cywil/Bac à sable` | 989 → **992** | remise à l'état d'accueil |

L'ordre demandé a été tenu : le bac à sable n'a été vidé **qu'après**
l'écriture de l'entrée du §2 — les quatre essais en étaient la preuve.

---

## 1. `Avancement du jardin-forêt` — la section *Recherché*

Page relue en ligne juste avant écriture et comparée au wikitexte ayant servi
au diff : **identique**, aucune modification hors session.

**50 lignes ajoutées, 0 supprimée.** La seule ligne que `diff` marque en
retrait est l'ancienne dernière (« Espèces distinctes… ») : contenu
rigoureusement identique, elle gagne seulement le retour à la ligne final que
MediaWiki retire au stockage. Relecture après écriture : écart nul avec le
fichier proposé.

Ce qui a été posé :

- `== Recherché ==` entre `== Plantations ==` et `== Photos ==`, avec deux
  sous-sections `=== Espèces recherchées ===` et
  `=== Provenances recherchées ===` ;
- le commentaire wikitexte expliquant qu'un souhait sur une espèce déjà
  présente **reste affiché** — vouloir un deuxième pied est légitime — et que
  la colonne montre ce qui existe au lieu de masquer le souhait ;
- la colonne `?-Corresponds_to_organic.-Instance_of = Exemplaires déjà
  présents`, **sans `#count`** ;
- le commentaire disant pourquoi le filtre végétal du référencé passe par une
  sous-requête (il n'existe pas de `Referenced facet plant`) ;
- la ligne de statistique, **en dernier**, après « Espèces distinctes ».

---

## 2. `Limites connues du SGDT` — entrée 29

**Une seule ligne ajoutée, aucune supprimée.** La page passe de **28 à
29 entrées** numérotées, l'entrée nouvelle se plaçant à la suite de celle sur
`format=count` via `action=ask` — les deux décrivent la même famille de
défaut.

Texte réellement en place :

> **Le modificateur `#count` sur une chaîne de propriétés en impression est
> accepté sans erreur et n'a aucun effet :** la colonne rend la liste des
> valeurs, sous le libellé demandé. Mesuré le 25 août 2026 sur
> `?-Corresponds_to_organic.-Instance_of#count`, par comparaison cellule par
> cellule avec la même chaîne sans le modificateur : colonnes identiques. Ni
> refus, ni message. Pour un nombre, il faut une requête séparée.

La chaîne de syntaxe est écrite `<code><nowiki>…</nowiki></code>`, patron
maison — c'est ce que le contrôle du §4 vérifie.

---

## 3. `Utilisateur:Cywil/Bac à sable` — remis à l'état d'accueil

La page ne porte plus que sa ligne d'origine :

```
Page bac à sable — sert aux tests du lot 9 (voir CLAUDE.md, lot-9-cadrage-plantes.md).
```

Les quatre essais du jour (A : la chaîne inverse ; B : la tentative `#count` ;
C : un cran seulement ; D : le cas à zéro sur les 34 organiques) sont retirés.
La page est **vidée, pas supprimée** : `CLAUDE.md` la désigne comme la page
d'essai du projet.

---

## 4. Les vérifications, pages purgées

### Les deux tables rendent leur message par défaut

```
message par defaut rendu : Aucune espèce recherchée pour le moment.   True
message par defaut rendu : Aucune provenance précise recherchée.      True
section Recherché                  presente : True
section Espèces_recherchées        presente : True
section Provenances_recherchées    presente : True
```

Rendu réel de la section :

> **Recherché** → **Espèces recherchées** : *Aucune espèce recherchée pour le
> moment.* → **Provenances recherchées** : *Aucune provenance précise
> recherchée.*

C'est l'état attendu : `Wanted_by` a été créée aujourd'hui et **aucune page
ne la porte encore**. Les deux tables sont vides parce que la donnée l'est,
pas parce que la requête échoue — les trois requêtes avaient été soumises au
wiki et acceptées, colonnes constituées, avant d'être écrites.

À noter : `default=` **fonctionne bien ici**, contrairement au cas de
l'entrée 37 de *Limites connues* où il ne s'affiche pas en `format=gallery`.
Le défaut est propre à la galerie ; en `format=table` le repli rend
normalement.

### Le bloc *Chiffres* — inchangé

| | Rendu |
|---|---|
| En place | 37 |
| Repris | 1 |
| Souffrant | 0 |
| Mort | 1 |
| Remplacé | 0 |
| En réserve | 1 |
| **somme des états** | **40** |
| **Total des plantations** | **40** |
| Espèces distinctes | **30** |
| **Espèces recherchées** | **0** |

```
total == 40           : True
somme des etats == 40 : True
especes == 30         : True
recherchees == 0      : True
```

Fin de page rendue, telle qu'un lecteur la voit :

> Total des plantations : 40
> Espèces distinctes (organiques rejointes via Instance_of →
> Corresponds_to_organic) : 30
> Espèces recherchées — non comptées dans le total ci-dessus : 0

**Le souhait n'a pas contaminé le total.** Les trois chiffres de la page
d'avant sont identiques après l'ajout, et la quatrième ligne se lit comme une
ligne à part.

### Aucune accolade nue, aucun marqueur d'erreur

```
'{{{' : False      class=error  : False
'{{#' : False      strip marker : False
```

### `browsebysubject` sur *Limites connues* — aucune annotation parasite

```
_MDAT -> ['1/2026/8/25/14/58/54/0']
_SKEY -> ['Limites connues du Système de Gestion de Données Techniques']

cles presentes        : ['_MDAT', '_SKEY']
ANNOTATIONS PARASITES : AUCUNE
```

**Le `<nowiki>` a tenu.** La page qui avait porté trois annotations parasites
(`X -> !+`, `Main_image -> !+`, `Item_ref -> +`) n'en porte aucune.

Une précision, parce que le contrôle demandé attendait « `_MDAT`, `_SKEY`,
`_ASK` » : **il n'y a pas de `_ASK`**, et c'est normal — la page ne contient
aucun `{{#ask:}}`. Elle décrit des requêtes, elle n'en exécute pas. L'absence
d'`_ASK` est donc un signe de plus que rien ne s'y est exécuté par accident,
pas un manque.

### Le bac à sable est propre

```
_MDAT -> ['1/2026/8/25/14/59/9/0']
_SKEY -> ['Cywil/Bac à sable']
```

Deux clés internes. Les `_ASK` des quatre essais ont disparu avec eux.

### Erreurs de traitement SMW : toujours 1

```
COUNT 1
 - Attribut:INSEE code
```

Même page, préexistante. Les trois écritures n'ont introduit aucune
annotation rejetée.

---

## 5. Ce qui reste

**Rien à écrire de mon côté.** La section attend sa première donnée : le jour
où Cyril coche une organisation dans le champ « Souhaité par » d'un item
organique ou référencé, les tables se remplissent sans qu'aucune page soit
modifiée.

**Les 12 pages d'essai du lot 11 attendent leur suppression par Cyril**,
inventoriées au §3 de `travaux/recherche-proposition.md`, avec l'ordre à
tenir : les deux pages `Test lot11 sujet` **avant** les deux
`Attribut:Test lot11 …`, faute de quoi deux sujets resteraient annotés par
des propriétés inexistantes. Aucun script de `bin/` ne porte l'action
`delete` — délibérément.

Rappel du seul point noté au passage : les deux pages `Attribut:Test lot11 …`
disparaîtront **d'elles-mêmes** du tableau du *Récapitulatif technique*, qui
liste les propriétés par requête et non à la main.
