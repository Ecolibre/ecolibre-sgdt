# Lot 21, tâche 49 — aligner les derniers passages restés sur l'ancien sens

Date : 19 octobre 2026 (horloge UTC du conteneur, 16:15 à 16:30). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## En bref

- Les cinq remplacements ont été faits sur trois pages, et aucun n'a échoué : chaque chaîne cherchée se trouvait exactement une fois.
- Chaque version publiée est identique octet pour octet à sa copie prévue. Les endroits modifiés sont ceux attendus : un sur `Attribut:Conversion factor`, trois sur la page du lot (dont deux sur la même ligne, que `diff` montre donc en deux blocs), un sur `Catégorie:Dimension`.
- **La portée de `Attribut:Conversion factor` vaut désormais « facteur vers l'unité principale ».** Le type résolu reste `_num`, comme celui du témoin, et les valeurs des unités sont inchangées.
- Trois points restent à reprendre, relevés par la relecture et la recherche faites après les écritures, et détaillés en A, B et C :
  - les deux phrases écrites par cette tâche sur la page du lot omettent les libellés, qu'une ligne du bloc reprend pourtant (A) ;
  - une puce des risques connus dit encore « non mesuré » un effet mesuré en partie (B) ;
  - `Dimension longueur` porte encore la formule d'affichage que la tâche 46 a restreinte ailleurs (C).

## Ce qui a été écrit

Trois écritures par `bin/wiki-put.sh`, sans `--createonly`, une page à la fois :

| Page | Révision | Taille | Horodatage | Résumé de modification |
|---|---|---|---|---|
| `Attribut:Conversion factor` | 1672 → 1680 | 1 319 → 1 313 octets | 2026-10-19T16:16:57Z | `[Lot 21][Tâche 49] Portée alignée sur le sens courant : facteur vers l'unité principale` |
| `Lot 21 — Grandeurs et unités` | 1679 → 1681 | 39 724 → 40 300 octets | 2026-10-19T16:17:03Z | `[Lot 21][Tâche 49] Facteur inversé dans la ligne du bloc, bloc invisible à l'affichage, effet d'une modification du bloc mesuré` |
| `Catégorie:Dimension` (demandée sous `Category:`) | 1678 → 1682 | 2 802 → 2 826 octets | 2026-10-19T16:17:09Z | `[Lot 21][Tâche 49] Champs de la page d'unité repris dans la ligne du bloc, à une inversion près` |

Les trois appels ont rendu `"result": "Success"`. Sur `Attribut:Conversion factor`, seule la ligne de portée a changé : le type, la cardinalité et les deux descriptions sont intacts. Aucune autre page n'a été écrite. Rien n'a été touché sur :
- le bloc de `Dimension longueur` ;
- les pages d'unité ;
- `Modèle:Unit` et `Catégorie:Unité` ;
- les bacs à sable ;
- les quatre propriétés interdites.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide. `origin/main` et la branche locale étaient au même commit, `5e6374a`.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas.

**Étape 3 — lecture des trois pages.** Les copies sont gardées dans le scratchpad, hors du dépôt, aux tailles annoncées par l'API. Les trois pages sont sans protection (`protection: []`). `intestactions` rend `"edit": true` en session ouverte (`Success Cywil`).

| Page | Révision courante | Taille |
|---|---|---|
| `Attribut:Conversion factor` | 1672 | 1 319 octets |
| `Lot 21 — Grandeurs et unités` | 1679 | 39 724 octets |
| `Catégorie:Dimension` | 1678 | 2 802 octets |

**Étapes 4 à 6 — remplacements.** Ils ont été faits par un programme Python du scratchpad, `t49-remplacer.py`, affiché en entier avant son lancement. Ce programme ne produit la copie d'une page que si chacune de ses chaînes est trouvée exactement une fois. Il compte aussi les `[[`, `::` et `{{` avant et après.

| Étape | Page | Chaîne cherchée (début) | Occurrences | Ligne |
|---|---|---|---|---|
| 4 | `Attribut:Conversion factor` | `[[Property_range::nombre d'unités par unité principale]]` | 1 | 5 |
| 5, premier | `Lot 21 — Grandeurs et unités` | « Le trio symbole, alias, facteur… » | 1 | 69 |
| 5, deuxième | `Lot 21 — Grandeurs et unités` | « Écrit à la main, une ligne par unité, recopiée… » | 1 | 71 |
| 5, troisième | `Lot 21 — Grandeurs et unités` | « L'effet d'une modification du bloc… n'est pas mesuré… » | 1 | 71 |
| 6 | `Catégorie:Dimension` | « et des seuls champs que porte la page de l'unité : … » | 1 | 5 |

Après remplacement :
- aucune chaîne cherchée ne subsiste, et chaque remplacement figure une fois ;
- le nombre de `[[`, `::` et `{{` est inchangé sur les trois pages.

**Aucun remplacement n'a échoué.**

**Étape 7 — écriture et comparaison.** Les révisions ont été revérifiées à 16:16:51, juste avant les écritures : elles n'avaient pas bougé. Les trois sources publiées, relues par `bin/wiki-get.sh`, sont **identiques octet pour octet** aux copies prévues (`cmp`). Voici les diffs entre chaque copie d'origine et la version publiée, tels quels.

`Attribut:Conversion factor`, **un endroit**. Les lignes « \ No newline at end of file » ne signalent pas une modification : la ligne modifiée est la dernière de la page, sans saut de ligne final ni avant ni après.

```
5c5
< [[Property_range::nombre d'unités par unité principale]]
\ No newline at end of file
---
> [[Property_range::facteur vers l'unité principale]]
\ No newline at end of file
```

`Lot 21 — Grandeurs et unités`, **trois endroits** : le premier en ligne 69, les deux autres en ligne 71. Comme ces deux-là sont dans la même ligne, `diff` en fait un seul bloc, `71c71`.

```
69c69
< '''Ce que porte une page d'unité.''' Les libellés par langue ; le symbole, c'est-à-dire la chaîne exacte qu'un contributeur tape ; les alias acceptés à la saisie, pour qui n'a pas les caractères sous la main ; '''la dimension dont elle est une unité''', et non une grandeur, corrigé le 13 octobre 2026 ; le facteur de conversion vers l'unité principale de cette dimension ; le code UCUM ; une équivalence vers un identifiant externe ; son appartenance au SI et à quel titre. Le trio symbole, alias, facteur est exactement ce qu'attend une ligne de déclaration : une page d'unité porte donc déjà tout ce qu'il faut pour l'écrire.
---
> '''Ce que porte une page d'unité.''' Les libellés par langue ; le symbole, c'est-à-dire la chaîne exacte qu'un contributeur tape ; les alias acceptés à la saisie, pour qui n'a pas les caractères sous la main ; '''la dimension dont elle est une unité''', et non une grandeur, corrigé le 13 octobre 2026 ; le facteur de conversion vers l'unité principale de cette dimension ; le code UCUM ; une équivalence vers un identifiant externe ; son appartenance au SI et à quel titre. Le symbole, les alias et le facteur sont tout ce qu'attend une ligne de déclaration : une page d'unité porte donc déjà de quoi l'écrire. Un seul de ces champs ne s'y recopie pas tel quel, le facteur, que la ligne porte inversé depuis le 18 octobre 2026 : voir la catégorie Dimension.
71c71
< '''Le bloc de déclaration est écrit à la main sur la page de dimension, et transclus par les propriétés.''' Écrit à la main, une ligne par unité, recopiée du symbole et du facteur portés par les pages d'unité : un lecteur voit exactement ce qui sera déclaré. Porté par la dimension et non par la grandeur, corrigé le 13 octobre 2026 : le millimètre sert l'épaisseur, le diamètre, la longueur et la largeur, et le bloc s'écrit donc une fois pour toutes les grandeurs de dimension longueur. Transclus plutôt que recopié dans chaque propriété, parce que la liste des unités admises appartient à la dimension et non à chacune de ses propriétés, ce qui est tout l'objet du lot. L'effet d'une modification du bloc sur les propriétés qui le transcluent n'est pas mesuré : voir les risques connus.
---
> '''Le bloc de déclaration est écrit à la main sur la page de dimension, et transclus par les propriétés.''' Écrit à la main, une ligne par unité, reprise du symbole, des alias et du facteur portés par les pages d'unité, ce dernier inversé depuis le 18 octobre 2026. Il n'apparaît pas à l'affichage de la page de dimension : des balises l'empêchent de s'y exécuter, Semantic MediaWiki refusant les déclarations d'unités hors de l'espace Attribut, et il se lit en ouvrant cette page en modification. Porté par la dimension et non par la grandeur, corrigé le 13 octobre 2026 : le millimètre sert l'épaisseur, le diamètre, la longueur et la largeur, et le bloc s'écrit donc une fois pour toutes les grandeurs de dimension longueur. Transclus plutôt que recopié dans chaque propriété, parce que la liste des unités admises appartient à la dimension et non à chacune de ses propriétés, ce qui est tout l'objet du lot. L'effet d'une modification du bloc sur les propriétés qui le transcluent a été mesuré du 15 au 18 octobre 2026 : elles en reçoivent bien la nouvelle version, mais une écriture ajoutée à une ligne n'est pas acceptée à la saisie dans l'immédiat. Voir la catégorie Dimension, qui porte le détail de la mesure.
```

`Catégorie:Dimension`, **un endroit** :

```
5c5
< Une ligne du bloc se compose toujours de la même façon, et des seuls champs que porte la page de l'unité : le nombre d'unités contenues dans une unité principale, puis le symbole, puis les alias acceptés à la saisie, puis le libellé anglais, puis le libellé français. Un seul de ces champs ne se recopie pas tel quel : le nombre, qui est l'inverse du facteur porté par la page de l'unité. Celle-ci porte 0,001 pour le millimètre, au sens de QUDT et de Q2U ; la ligne du bloc porte 1000, au format que Semantic MediaWiki impose. Une inversion oubliée ne passe pas inaperçue : une épaisseur de 0,2 millimètre serait stockée comme 200 mètres. Ainsi "1000 mm, millimetre, millimètre", et "1000000 µm, um, micron, micrometre, micromètre". L'ordre va du plus court au plus long ; Semantic MediaWiki tient tout ce qui suit le symbole pour des écritures équivalentes à la saisie, et c'est le symbole qui s'affiche dans un résultat de requête.
---
> Une ligne du bloc se compose toujours de la même façon, et des seuls champs que porte la page de l'unité, à une inversion près : le nombre d'unités contenues dans une unité principale, puis le symbole, puis les alias acceptés à la saisie, puis le libellé anglais, puis le libellé français. Un seul de ces champs ne se recopie pas tel quel : le nombre, qui est l'inverse du facteur porté par la page de l'unité. Celle-ci porte 0,001 pour le millimètre, au sens de QUDT et de Q2U ; la ligne du bloc porte 1000, au format que Semantic MediaWiki impose. Une inversion oubliée ne passe pas inaperçue : une épaisseur de 0,2 millimètre serait stockée comme 200 mètres. Ainsi "1000 mm, millimetre, millimètre", et "1000000 µm, um, micron, micrometre, micromètre". L'ordre va du plus court au plus long ; Semantic MediaWiki tient tout ce qui suit le symbole pour des écritures équivalentes à la saisie, et c'est le symbole qui s'affiche dans un résultat de requête.
```

**Étape 8 — vérifier la portée.** Faits de `Attribut:Conversion factor`, lus à 16:17:34, soit 37 s après l'écriture, sans filtre, tels quels :

```
Property_cardinality -> ['single']
Property_description_EN -> ['Factor converting a value expressed in this unit to the main unit of its dimension: 0.001 for the millimetre, since a millimetre is one thousandth of a metre. This is the usual sense, the one used by QUDT and by the Q2U ontology this project grew from, so an external equivalence compares directly, without conversion. Semantic MediaWiki expects the inverse in the declaration block carried by the dimension page, 1000 for the millimetre: this value is the only one on a block line that is not copied as it stands, but inverted. A pure number, with no unit.']
Property_description_FR -> ["Facteur qui ramène une valeur exprimée dans cette unité à l'unité principale de sa dimension : 0,001 pour le millimètre, puisqu'un millimètre vaut un millième de mètre. C'est le sens courant, celui de QUDT et celui de l'ontologie Q2U dont ce projet est issu : une équivalence externe se compare donc directement, sans conversion. Semantic MediaWiki attend l'inverse dans le bloc de déclaration porté par la page de dimension, 1000 pour le millimètre : cette valeur est la seule de la ligne du bloc qui ne s'y recopie pas telle quelle, elle s'y inverse. Nombre pur, sans unité."]
Property_range -> ["facteur vers l'unité principale"]
_MDAT -> ['1/2026/10/19/16/16/57/0']
_SKEY -> ['Conversion factor']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_num']
```

- La portée porte la nouvelle valeur, « facteur vers l'unité principale ».
- Comparés aux faits lus juste avant l'écriture, seuls `Property_range` et `_MDAT` ont changé.
- `_TYPE` reste `…#_num`, et il n'y a ni `_CHGPRO` ni `_ERRC`.
- **Le type résolu est inchangé.** Un `action=ask` lancé à 16:17:40 sur la catégorie des unités rend `_num` pour `Conversion factor`, comme pour le témoin `Planting rank`. Il rend aussi les valeurs inchangées : `Mètre` 1, `Millimètre` 0.001, `Micromètre` 1e-06.

**Étape 9 — relevé final.** `.claude/settings.local.json` n'existe toujours pas (relevé à 16:18:40). Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Contrôles supplémentaires, en lecture seule

- **Pages de documentation** :
  - `Catégorie:Dimension` ne porte que `_MDAT` et `_SKEY` ;
  - la page du lot porte les mêmes clés qu'aux tâches 46 à 48 ;
  - aucune catégorie de suivi n'est apparue, seulement `Catégorie:Lot` sur la page du lot ;
  - les liens de la propriété et de la catégorie pointent vers une cible, qui existe.
- **Recherche des passages restants.** J'ai cherché sur tout le wiki (`list=search`, `srnamespace=*`) plusieurs expressions, puis lu les pages qui répondaient :
  - « voit exactement » : aucune page ;
  - « unités par unité principale » : aucune page ;
  - « tels quels » : aucune page ;
  - « telle quelle » : cinq pages. Sur `Catégorie:Unité` et `Attribut:Conversion factor`, c'est le texte nouveau. Sur la page du lot, ligne 65, la phrase parle de la tolérance. Les deux autres pages sont étrangères au lot ;
  - « bloc de déclaration » : treize pages. J'ai lu `Modèle:Dimension`, `Attribut:Quantity dimension`, `Attribut:Main unit` et `Dimension longueur` : elles sont exactes, sauf la ligne 14 de `Dimension longueur` (voir C). Les neuf autres pages sont de deux sortes :
    - quatre bacs à sable ou propriétés d'essai (`Test lot21e`, `Test lot21f` et leurs propriétés), exclus de la consigne et que je n'ai pas relus à ce titre ;
    - cinq pages alignées aux tâches 48 et 49 : `Catégorie:Unité`, `Modèle:Unit`, `Attribut:Conversion factor`, `Catégorie:Dimension` et la page du lot.
  - Dans la page du lot, j'ai aussi cherché « verrou de propagation », qui renvoie à la puce des risques connus (voir B).

  Cette recherche ne porte que sur ces expressions : une phrase formulée autrement lui échapperait.

## Questions posées hors consigne

Aucune question reçue hors consigne. Les réponses aux points A et B de la tâche 48 figurent en tête de cette consigne et ont été appliquées. La réponse B relève un cinquième passage que je n'avais pas vu ; voir l'écart 1. Trois questions nouvelles à Cyril, points A, B et C ci-dessous.

**A.** Contexte : les deux phrases écrites par cette tâche sur la page du lot ne nomment pas les libellés.
- Ligne 69 : « Le symbole, les alias et le facteur sont tout ce qu'attend une ligne de déclaration ».
- Ligne 71 : « reprise du symbole, des alias et du facteur ».

Une ligne du bloc reprend pourtant aussi les libellés anglais et français. C'est la règle de composition écrite sur `Catégorie:Dimension` depuis la tâche 42, et c'est aussi ce que montre le bloc réel, par exemple `1000 mm, millimetre, millimètre`. La première phrase contredit donc `Catégorie:Dimension`.

Question : faut-il les compléter ?

Suggestion : oui, dans une tâche ultérieure. On écrirait « Le symbole, les alias, les deux libellés et le facteur sont tout ce qu'attend une ligne de déclaration », et « reprise du symbole, des alias, des libellés et du facteur ».

**B.** Contexte : la dernière puce des risques connus de la page du lot (ligne 156) dit « l'effet sur le verrou de propagation n'est pas mesuré ». Telle quelle :

```
* Ajouter une unité à une grandeur modifie une déclaration partagée par toutes ses propriétés, qui se réanalysent alors : l'effet sur le verrou de propagation n'est pas mesuré. Depuis le 13 octobre 2026, cette déclaration est partagée par toutes les grandeurs d'une même dimension, donc par davantage de propriétés encore.
```

Ce point a été mesuré en partie depuis, pour une écriture ajoutée à une ligne existante. Après l'ajout de `micrometre` au bloc, à la tâche 42, les faits de la propriété qui le transclut n'ont montré aucune `_CHGPRO` aux tâches 42 à 44. Sa page restait modifiable à la tâche 45 : `intestactions` rendait `"edit": true` le 18 à 19:50. L'ajout d'une ligne entière, c'est-à-dire d'une unité, n'a pas été mesuré.

Question : faut-il compléter cette puce ?

Suggestion : oui, à la même occasion. On ajouterait : « Mesuré du 15 au 18 octobre 2026 pour une écriture ajoutée à une ligne existante : aucune `_CHGPRO` dans les faits de la propriété qui transclut le bloc, et sa page restait modifiable trois jours après. L'ajout d'une ligne entière n'est pas mesuré. »

**C.** Contexte : la ligne 14 de `Dimension longueur` dit encore, sans restriction, « avec le type Quantity, c'est la première déclarée qui s'affiche ». Telle quelle :

```
L'ordre de la dernière ligne décide de l'unité d'affichage par défaut : avec le type Quantity, c'est la première déclarée qui s'affiche.
```

La tâche 46 a restreint la même affirmation sur `Catégorie:Dimension`, en précisant « dans un résultat de requête ». Une annotation écrite dans une page s'affiche en effet telle qu'elle a été saisie, comme l'a mesuré la tâche 35.

Question : faut-il la restreindre ici aussi ?

Suggestion : oui, en ajoutant « dans un résultat de requête », sans toucher au bloc. Écrire sur `Dimension longueur` fait retraiter les propriétés qui la transcluent, comme l'a mesuré la tâche 42. Leur `_CONV` ne devrait pas changer, puisque le bloc reste le même.

## Écarts et surprises

1. **Le cinquième passage m'avait échappé à la tâche 48** : « un lecteur voit exactement ce qui sera déclaré ». Ma recherche portait sur l'ancien sens du facteur, pas sur l'affichage du bloc. C'est l'architecte qui l'a relevé.
2. **Phrases nouvelles incomplètes** ; voir A.
3. **« Plus aucune phrase du wiki » n'est pas établi.** Le contexte de la consigne annonce qu'après cette tâche, plus aucune phrase du wiki ne décrira l'ancien sens du facteur ni l'ancien comportement du bloc. Ma recherche, limitée aux expressions citées plus haut, a trouvé deux passages encore à reprendre (B et C), et elle ne prouve pas qu'il n'y en ait pas d'autres.
4. **Présentation du diff de la page du lot** : trois remplacements, mais deux blocs de `diff`, parce que deux remplacements touchent la même ligne.
5. **Lectures faites au-delà de la consigne, toutes sans écriture** :
   - protections et `intestactions` ;
   - faits de la propriété avant l'écriture, et type résolu après ;
   - faits, catégories et liens des pages écrites ;
   - recherche des passages restants et lecture des pages qui répondaient.
6. **Outils** : un programme Python du scratchpad, `t49-remplacer.py`, affiché en entier avant son lancement, des lignes de Python en commande, et des fichiers temporaires dans le scratchpad. Le rapport a été assemblé par substitution de repères, pour citer les diffs, les faits et les phrases octet pour octet.
7. `origin/main` n'avait pas bougé depuis la tâche 48 : il était toujours à `5e6374a` à la vérification de 16:18:40. Aucune intégration n'a été nécessaire avant le commit.
