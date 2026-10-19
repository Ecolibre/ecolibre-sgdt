# Lot 21, tâche 48 — mettre le facteur des unités au sens de QUDT et de Q2U

Date : du 18 au 19 octobre 2026, à l'horloge UTC du conteneur. Les écritures ont eu lieu le 18, de 20:50 à 20:53. La session a ensuite été interrompue, et les étapes 11 et 12 ont été faites le 19, de 10:26 à 10:40, avec le rapport. Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## En bref

- Les dix remplacements ont été faits, sur huit pages, et aucun n'a échoué : chaque chaîne cherchée se trouvait exactement une fois. Aucune des huit pages n'est restée à mi-chemin.
- Chaque version publiée est identique octet pour octet à sa copie prévue.
- **Le bloc de `Dimension longueur` n'a pas bougé.** Il est toujours à la révision 1655, et le `_CONV` de `Attribut:Test lot21e longueur` porte toujours `1 m`, `1000 mm` et `1000000 µm`.
- **Les valeurs rendues sont celles attendues** : `Mètre` 1, `Millimètre` 0.001, `Micromètre` 1e-06, avec le type `_num`.
- Sur `Attribut:Conversion factor`, seules les deux descriptions ont changé. Le type, la cardinalité et la portée sont intacts.
- Quatre passages du wiki décrivent encore l'ancien sens, dont la portée de la propriété, que la consigne interdisait de toucher ; voir A. Une phrase de la page du lot dit encore « non mesuré » un effet qui l'a été depuis ; voir B.

## Ce qui a été écrit

Huit écritures, faites le 18 octobre par `bin/wiki-put.sh`, sans `--createonly`, une page à la fois et dans cet ordre :

| Page | Révision | Taille | Horodatage | Résumé de modification |
|---|---|---|---|---|
| `Attribut:Conversion factor` | 1670 → 1672 | 1 594 → 1 319 octets | 2026-10-18T20:51:53Z | `[Lot 21][Tâche 48] Descriptions : facteur au sens courant de QUDT et de Q2U, inversé dans le bloc de déclaration` |
| `Modèle:Unit` | 1652 → 1673 | 1 696 → 1 744 octets | 2026-10-18T20:51:58Z | `[Lot 21][Tâche 48] Facteur au sens courant : documentation du paramètre et intitulé « Facteur vers l'unité principale »` |
| `Millimètre` | 1649 → 1674 | 545 → 546 octets | 2026-10-18T20:52:03Z | `[Lot 21][Tâche 48] Facteur au sens courant : 0,001` |
| `Micromètre` | 1650 → 1675 | 449 → 450 octets | 2026-10-18T20:52:08Z | `[Lot 21][Tâche 48] Facteur au sens courant : 0,000001` |
| `Mètre` | 1651 → 1676 | 517 → 519 octets | 2026-10-18T20:52:14Z | `[Lot 21][Tâche 48] Phrase sur les facteurs alignée sur le sens courant` |
| `Catégorie:Unité` (demandée sous `Category:`) | 1669 → 1677 | 870 → 934 octets | 2026-10-18T20:52:19Z | `[Lot 21][Tâche 48] Facteur de la page d'unité au sens courant, inversé dans le bloc de déclaration` |
| `Catégorie:Dimension` (demandée sous `Category:`) | 1668 → 1678 | 2 421 → 2 802 octets | 2026-10-18T20:52:25Z | `[Lot 21][Tâche 48] Le nombre de la ligne du bloc est l'inverse du facteur porté par la page d'unité` |
| `Lot 21 — Grandeurs et unités` | 1671 → 1679 | 39 685 → 39 724 octets | 2026-10-18T20:52:30Z | `[Lot 21][Tâche 48] Réserve : nombre inverse du facteur de la page d'unité, au sens courant depuis le 18 octobre 2026` |

Les huit appels ont rendu `"result": "Success"`. `Modèle:Unit` est transclus par les trois pages d'unité. Sa modification relève du garde-fou 6 de CLAUDE.md, et cette consigne la valide. Je l'ai écrit avant les pages d'unité.

Aucune autre page n'a été écrite. Rien n'a été touché sur :
- `Dimension longueur` et son bloc ;
- les bacs à sable ;
- les quatre propriétés interdites.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide. `origin/main` et la branche locale étaient au même commit, `bb0cbb9`.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas.

**Étape 3 — lecture des huit pages.** Copies gardées dans le scratchpad, hors du dépôt, aux tailles annoncées par l'API. Les huit pages sont sans protection (`protection: []`), et `intestactions` rend `"edit": true` en session ouverte (`Success Cywil`). Révisions et tailles d'origine : voir le tableau ci-dessus.

État de référence, relevé juste avant les écritures, à 20:51:38 :
- `Attribut:Conversion factor` : `_TYPE` `…#_num`, cardinalité `single`, portée « nombre d'unités par unité principale » ;
- valeurs : `Mètre` 1, `Millimètre` 1000, `Micromètre` 1000000 ;
- `_CONV` d'essai : `1 m`, `1000 mm`, `1000000 µm`.

**Étapes 4 à 9 — remplacements.** Ils ont été faits par un programme Python du scratchpad, `t48-remplacer.py`, affiché en entier avant son lancement. Ce programme ne produit la copie d'une page que si chacune de ses chaînes est trouvée exactement une fois. Il compte aussi les `[[`, `::` et `{{` avant et après.

| Étape | Page | Chaîne cherchée (début) | Occurrences | Ligne |
|---|---|---|---|---|
| 4, premier | `Attribut:Conversion factor` | « Nombre d'unités de celle-ci contenues… » | 1 | 2 |
| 4, deuxième | `Attribut:Conversion factor` | « Number of these units contained… » | 1 | 3 |
| 5, premier | `Modèle:Unit` | « Le paramètre facteur porte le nombre d'unités… » | 1 | 2 |
| 5, deuxième | `Modèle:Unit` | « ! style=… \| Unités par unité principale » | 1 | 21 |
| 6 | `Millimètre` | `\|facteur=1000` | 1 | 6 |
| 6 | `Micromètre` | `\|facteur=1000000` | 1 | 7 |
| 6 | `Mètre` | « Les autres unités de cette dimension se comptent… » | 1 | 13 |
| 7 | `Catégorie:Unité` | « Le nombre d'unités contenues dans une unité principale est l'inverse… » | 1 | 3 |
| 8 | `Catégorie:Dimension` | « le nombre d'unités contenues dans une unité principale, puis le symbole… » | 1 | 5 |
| 9 | `Lot 21 — Grandeurs et unités` | « Déclarer l'unité, avec le nombre d'unités… » | 1 | 31 |

Résultat après remplacement :
- chaque remplacement figure une fois ;
- aucune chaîne cherchée ne subsiste, sauf sur `Catégorie:Dimension`, où c'est attendu : le texte de remplacement reprend la chaîne cherchée telle quelle, puis ajoute trois phrases ;
- le nombre de `[[`, `::` et `{{` est inchangé sur les huit pages.

**Aucun remplacement n'a échoué.**

**Étape 10 — écriture et comparaison.** Les révisions ont été revérifiées à 20:51:51, juste avant la première écriture : elles n'avaient pas bougé. Les huit sources publiées, relues par `bin/wiki-get.sh`, sont **identiques octet pour octet** aux copies prévues. Voici les diffs entre chaque copie d'origine et la version publiée, tels quels.

`Attribut:Conversion factor`. Les deux lignes modifiées, 2 et 3, se suivent : `diff` les réunit en un seul bloc. Les lignes 1, 4 et 5 (type, cardinalité, portée) sont inchangées.

```
2,3c2,3
< [[Property_description_FR::Nombre d'unités de celle-ci contenues dans une unité principale de sa dimension : 1000 pour le millimètre, puisqu'un mètre vaut mille millimètres. C'est le sens qu'attend Semantic MediaWiki dans le bloc de déclaration porté par la page de dimension, où cette valeur se recopie telle quelle. Elle est l'inverse du facteur de conversion au sens courant, qui vaudrait 0,001, et c'est ce sens courant qu'emploient QUDT et l'ontologie Q2U : une équivalence externe ne se recopie donc pas, elle s'inverse. Ce sens tient au format du bloc de déclaration de Semantic MediaWiki et non au modèle : hors de cet outil, rien n'empêcherait de revenir au sens courant en inversant les valeurs. Nombre pur, sans unité.]]
< [[Property_description_EN::Number of these units contained in one main unit of its dimension: 1000 for the millimetre, since a metre is a thousand millimetres. This is the sense Semantic MediaWiki expects in the declaration block carried by the dimension page, where the value is copied as it stands. It is the inverse of the conversion factor in the usual sense, which would be 0.001, and that usual sense is the one QUDT and the Q2U ontology use: an external equivalence is therefore not copied but inverted. This sense follows from the format of the Semantic MediaWiki declaration block, not from the model: outside that tool, nothing would prevent returning to the usual sense by inverting the values. A pure number, with no unit.]]
---
> [[Property_description_FR::Facteur qui ramène une valeur exprimée dans cette unité à l'unité principale de sa dimension : 0,001 pour le millimètre, puisqu'un millimètre vaut un millième de mètre. C'est le sens courant, celui de QUDT et celui de l'ontologie Q2U dont ce projet est issu : une équivalence externe se compare donc directement, sans conversion. Semantic MediaWiki attend l'inverse dans le bloc de déclaration porté par la page de dimension, 1000 pour le millimètre : cette valeur est la seule de la ligne du bloc qui ne s'y recopie pas telle quelle, elle s'y inverse. Nombre pur, sans unité.]]
> [[Property_description_EN::Factor converting a value expressed in this unit to the main unit of its dimension: 0.001 for the millimetre, since a millimetre is one thousandth of a metre. This is the usual sense, the one used by QUDT and by the Q2U ontology this project grew from, so an external equivalence compares directly, without conversion. Semantic MediaWiki expects the inverse in the declaration block carried by the dimension page, 1000 for the millimetre: this value is the only one on a block line that is not copied as it stands, but inverted. A pure number, with no unit.]]
```

`Modèle:Unit`, deux endroits :

```
2c2
< Modèle d'une page d'unité. Paramètres : libellé fr, libellé en, symbole, alias, dimension, facteur, code UCUM, statut SI, équivalent externe. Les alias se séparent par des virgules. Le paramètre facteur porte le nombre d'unités de celle-ci contenues dans une unité principale de sa dimension : 1000 pour le millimètre, puisqu'un mètre vaut mille millimètres. Le modèle pose seul la catégorie.
---
> Modèle d'une page d'unité. Paramètres : libellé fr, libellé en, symbole, alias, dimension, facteur, code UCUM, statut SI, équivalent externe. Les alias se séparent par des virgules. Le paramètre facteur porte le facteur qui ramène une valeur de cette unité à l'unité principale de sa dimension : 0,001 pour le millimètre. C'est le sens de QUDT et de Q2U ; le bloc de déclaration, lui, attend l'inverse. Le modèle pose seul la catégorie.
21c21
< ! style="background:#f2f2f2; width:34%;" | Unités par unité principale
---
> ! style="background:#f2f2f2; width:34%;" | Facteur vers l'unité principale
```

`Millimètre` :

```
6c6
< |facteur=1000
---
> |facteur=0,001
```

`Micromètre` :

```
7c7
< |facteur=1000000
---
> |facteur=0,000001
```

`Mètre`. Les lignes « \ No newline at end of file » ne signalent pas une modification : la ligne modifiée est la dernière de la page, sans saut de ligne final ni avant ni après.

```
13c13
< C'est dans le mètre que Semantic MediaWiki stocke les valeurs de toutes les grandeurs de dimension longueur, quelle que soit l'unité employée à la saisie. Les autres unités de cette dimension se comptent par rapport à lui : mille millimètres dans un mètre, un million de micromètres. Le facteur du mètre vaut donc 1.
\ No newline at end of file
---
> C'est dans le mètre que Semantic MediaWiki stocke les valeurs de toutes les grandeurs de dimension longueur, quelle que soit l'unité employée à la saisie. Les facteurs des autres unités de cette dimension y ramènent : un millimètre vaut un millième de mètre, un micromètre un millionième. Celui du mètre vaut donc 1.
\ No newline at end of file
```

`Catégorie:Unité` :

```
3c3
< Une page d'unité porte le nom développé de l'unité, "Millimètre" et non "mm" : un titre se lit, un symbole se tape. Les champs d'une page d'unité contiennent tous ceux dont une ligne du bloc de déclaration a besoin, et ils s'y recopient dans l'ordre que fixe la [[:Category:Dimension|catégorie Dimension]], à qui le bloc appartient. Le nombre d'unités contenues dans une unité principale est l'inverse du facteur de conversion au sens courant : un mètre vaut mille millimètres, et c'est 1000 qui s'écrit, non 0,001.
---
> Une page d'unité porte le nom développé de l'unité, "Millimètre" et non "mm" : un titre se lit, un symbole se tape. Les champs d'une page d'unité contiennent tous ceux dont une ligne du bloc de déclaration a besoin, et ils s'y recopient dans l'ordre que fixe la [[:Category:Dimension|catégorie Dimension]], à qui le bloc appartient. Le facteur porté par une page d'unité est celui du sens courant, 0,001 pour le millimètre, qui est aussi celui de QUDT et de Q2U. Le bloc de déclaration attend l'inverse, 1000 : c'est la seule valeur de la ligne qui ne se recopie pas telle quelle.
```

`Catégorie:Dimension` :

```
5c5
< Une ligne du bloc se compose toujours de la même façon, et des seuls champs que porte la page de l'unité : le nombre d'unités contenues dans une unité principale, puis le symbole, puis les alias acceptés à la saisie, puis le libellé anglais, puis le libellé français. Ainsi "1000 mm, millimetre, millimètre", et "1000000 µm, um, micron, micrometre, micromètre". L'ordre va du plus court au plus long ; Semantic MediaWiki tient tout ce qui suit le symbole pour des écritures équivalentes à la saisie, et c'est le symbole qui s'affiche dans un résultat de requête.
---
> Une ligne du bloc se compose toujours de la même façon, et des seuls champs que porte la page de l'unité : le nombre d'unités contenues dans une unité principale, puis le symbole, puis les alias acceptés à la saisie, puis le libellé anglais, puis le libellé français. Un seul de ces champs ne se recopie pas tel quel : le nombre, qui est l'inverse du facteur porté par la page de l'unité. Celle-ci porte 0,001 pour le millimètre, au sens de QUDT et de Q2U ; la ligne du bloc porte 1000, au format que Semantic MediaWiki impose. Une inversion oubliée ne passe pas inaperçue : une épaisseur de 0,2 millimètre serait stockée comme 200 mètres. Ainsi "1000 mm, millimetre, millimètre", et "1000000 µm, um, micron, micrometre, micromètre". L'ordre va du plus court au plus long ; Semantic MediaWiki tient tout ce qui suit le symbole pour des écritures équivalentes à la saisie, et c'est le symbole qui s'affiche dans un résultat de requête.
```

`Lot 21 — Grandeurs et unités` :

```
31c31
< '''Toute unité convertible par un coefficient peut être acceptée, à condition d'être déclarée.''' Une valeur saisie dans une unité dont la conversion n'est pas déclarée n'est pas stockée, et une erreur la signale : le système ne devine jamais un coefficient. Déclarer l'unité, avec le nombre d'unités qu'en contient une unité principale, suffit pour qu'elle soit acceptée et convertie, qu'elle appartienne au SI ou non. Deux réserves mesurées depuis : ce nombre est l'inverse du coefficient au sens courant, mille pour le millimètre et non un millième, et une écriture ajoutée à une ligne du bloc après la création d'une propriété n'est pas acceptée dans l'immédiat : dans le seul cas mesuré, elle l'a été après un délai compris entre seize et soixante et onze heures, sans autre intervention de notre part. Règle posée le 4 octobre 2026 : les documents techniques à reprendre emploient beaucoup d'unités hors du SI, et chacune doit pouvoir s'y ramener. Deux exceptions à la règle du coefficient : les températures, dont le décalage d'origine relève du type Temperature, et les grandeurs logarithmiques comme le décibel, qui n'ont pas de coefficient.
---
> '''Toute unité convertible par un coefficient peut être acceptée, à condition d'être déclarée.''' Une valeur saisie dans une unité dont la conversion n'est pas déclarée n'est pas stockée, et une erreur la signale : le système ne devine jamais un coefficient. Déclarer l'unité, avec le nombre d'unités qu'en contient une unité principale, suffit pour qu'elle soit acceptée et convertie, qu'elle appartienne au SI ou non. Deux réserves mesurées depuis : ce nombre est l'inverse du facteur porté par la page de l'unité, laquelle suit depuis le 18 octobre 2026 le sens courant de QUDT et de Q2U, et une écriture ajoutée à une ligne du bloc après la création d'une propriété n'est pas acceptée dans l'immédiat : dans le seul cas mesuré, elle l'a été après un délai compris entre seize et soixante et onze heures, sans autre intervention de notre part. Règle posée le 4 octobre 2026 : les documents techniques à reprendre emploient beaucoup d'unités hors du SI, et chacune doit pouvoir s'y ramener. Deux exceptions à la règle du coefficient : les températures, dont le décalage d'origine relève du type Temperature, et les grandeurs logarithmiques comme le décibel, qui n'ont pas de coefficient.
```

**Étape 11 — le bloc n'a pas bougé.** Faits de `Attribut:Test lot21e longueur`, lus le 19 à 10:26:37, sans filtre, tels quels :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : une longueur, pour éprouver la transclusion du bloc de déclaration depuis une page de dimension. Ne pas supprimer sans consigne."]
_CONV -> ['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micrometre, micromètre']
_MDAT -> ['1/2026/10/15/15/27/4/0']
_SKEY -> ['Test lot21e longueur']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['mm, m']
```

Le `_CONV` porte toujours `1 m, metre, mètre`, `1000 mm, millimetre, millimètre` et `1000000 µm, um, micron, micrometre, micromètre`. Les trois nombres sont inchangés, et les faits sont identiques à ceux d'avant les écritures (`diff` vide). `Dimension longueur` est toujours à sa révision 1655.

Valeurs de `Conversion factor`, lues le 19 à 10:26:39 par la commande `curl` de la consigne, exactement. Réponse brute, telle quelle :

```
{"query":{"printrequests":[{"label":"","key":"","redi":"","typeid":"_wpg","mode":2,"format":false},{"label":"Conversion factor","key":"Conversion_factor","redi":"","typeid":"_num","mode":1,"format":""},{"label":"Unit symbol","key":"Unit_symbol","redi":"","typeid":"_txt","mode":1,"format":""}],"results":{"Mètre":{"printouts":{"Conversion factor":[1],"Unit symbol":["m"]},"fulltext":"Mètre","fullurl":"https://wiki.ecolibre.org/wiki/M%C3%A8tre","namespace":0,"exists":"1","displaytitle":""},"Micromètre":{"printouts":{"Conversion factor":[1.0e-6],"Unit symbol":["µm"]},"fulltext":"Micromètre","fullurl":"https://wiki.ecolibre.org/wiki/Microm%C3%A8tre","namespace":0,"exists":"1","displaytitle":""},"Millimètre":{"printouts":{"Conversion factor":[0.001],"Unit symbol":["mm"]},"fulltext":"Millimètre","fullurl":"https://wiki.ecolibre.org/wiki/Millim%C3%A8tre","namespace":0,"exists":"1","displaytitle":""}},"serializer":"SMW\\Serializers\\QueryResultSerializer","version":2,"meta":{"hash":"2768877ab93b0b39bdb8f976024cb3ab","count":3,"offset":0,"source":"","time":"0.009927"}}}
```

| Page | `Conversion factor` rendu | `Unit symbol` | Attendu |
|---|---|---|---|
| `Mètre` | `1` | `m` | 1 |
| `Millimètre` | `0.001` | `mm` | 0,001 |
| `Micromètre` | `1e-06` | `µm` | 0,000001 |

Les trois valeurs sont présentes, non nulles et conformes, dans l'écriture de SMW. Le type de la colonne est `_num`. Aucune valeur n'est absente.

**Étape 12 — relevé final.** `.claude/settings.local.json` n'existe toujours pas (relevé le 19 à 10:28:32). Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Contrôles supplémentaires, en lecture seule

- **Reprise après l'interruption** : le 19 à 10:26, les huit pages étaient toujours aux révisions 1672 à 1679, celles de mes écritures. `Dimension longueur` (1655) et `Attribut:Test lot21e longueur` (1642) n'avaient pas bougé.
- **`Attribut:Conversion factor`** :
  - les faits ne diffèrent de ceux d'avant l'écriture que par les deux descriptions et par `_MDAT` ;
  - `_TYPE` reste `…#_num`, `Property_cardinality` `single`, et `Property_range` « nombre d'unités par unité principale » ;
  - il n'y a ni `_CHGPRO` ni `_ERRC`.
- **Pages d'unité** : `Conversion_factor` vaut `'1'` sur `Mètre`, `'0.001'` sur `Millimètre` et `'1.0E-6'` sur `Micromètre`, sans `_ERRC`. Le rendu de `Millimètre` montre la ligne « Facteur vers l'unité principale » avec `0,001`.
- **Pages de documentation** :
  - `Catégorie:Dimension` et `Catégorie:Unité` ne portent que `_MDAT` et `_SKEY` ;
  - `Modèle:Unit` ne porte aucun fait, l'espace Modèle n'étant vraisemblablement pas sémantique ici ;
  - la page du lot porte les mêmes clés qu'aux tâches 46 et 47 ;
  - aucune catégorie de suivi n'est apparue : seulement `Catégorie:Lot` sur la page du lot et `Catégorie:Unité` sur les trois unités ;
  - les liens des sept autres pages pointent vers quatre cibles, qui existent toutes.
- **Où l'ancien sens est encore écrit.** J'ai cherché dans les sources publiées des huit pages, puis sur tout le wiki (`list=search`, `srnamespace=*`), les expressions « unités par unité principale », « nombre d'unités », « mille millimètres » et « facteur de conversion ». La recherche ne porte que sur ces expressions ; résultats en A.
  - `Dimension longueur`, ligne 12, a aussi répondu : « Le nombre qui précède chaque symbole est le nombre d'unités de celle-ci contenues dans une unité principale […] ». Cette phrase décrit le nombre du bloc, qui reste 1000 : elle est toujours exacte.

## Questions posées hors consigne

Aucune question reçue hors consigne. La réponse au point A de la tâche 47 figure en tête de cette consigne. Le sens courant de QUDT y est dit mesuré par l'architecte. La consignation de l'erreur du pouce y est renvoyée au chantier de l'ontologie, et rien n'a donc été écrit sur `ontologie/README.md`. Deux questions nouvelles à Cyril, points A et B ci-dessous.

**A.** Contexte : quatre passages du wiki décrivent encore l'ancien sens du facteur, ou une recopie qui n'est plus telle quelle.
1. `Attribut:Conversion factor`, portée : « nombre d'unités par unité principale ». La consigne interdisait d'y toucher.
2. Page du lot, ligne 69 : « Le trio symbole, alias, facteur est exactement ce qu'attend une ligne de déclaration : une page d'unité porte donc déjà tout ce qu'il faut pour l'écrire. »
3. Page du lot, ligne 71 : « une ligne par unité, recopiée du symbole et du facteur portés par les pages d'unité ».
4. `Catégorie:Dimension`, ligne 5 : « des seuls champs que porte la page de l'unité : le nombre d'unités contenues dans une unité principale, puis le symbole… ». La page d'unité porte désormais l'inverse, ce que la phrase ajoutée par cette tâche dit juste après.

Question : faut-il les aligner ?

Suggestion : oui, dans une tâche ultérieure :
- la portée deviendrait « facteur vers l'unité principale » ;
- la ligne 69 dirait « Le trio symbole, alias, facteur donne tout ce qu'attend une ligne de déclaration, le facteur une fois inversé » ;
- la ligne 71 dirait « recopiée du symbole et des alias portés par les pages d'unité, avec l'inverse de leur facteur » ;
- sur `Catégorie:Dimension`, « des seuls champs que porte la page de l'unité » deviendrait « des champs que porte la page de l'unité, le facteur une fois inversé ».

**B.** Contexte : la ligne 71 de la page du lot finit par « L'effet d'une modification du bloc sur les propriétés qui le transcluent n'est pas mesuré : voir les risques connus. » Or il a été mesuré depuis, des tâches 36 à 45. Le retraitement des propriétés suit en quelques minutes ; l'acceptation à la saisie d'une écriture ajoutée au bloc n'a eu lieu qu'entre la seizième et la soixante et onzième heure dans le seul cas mesuré. Selon CLAUDE.md, une mesure qui contredit une page n'est pas terminée tant que la page n'est pas corrigée.

Question : faut-il mettre cette phrase à jour ?

Suggestion : oui, dans la même tâche que A, en la remplaçant par un renvoi aux mesures. Par exemple : « L'effet d'une modification du bloc a été mesuré du 15 au 18 octobre 2026 : voir la catégorie Dimension. »

## Écarts et surprises

1. **Décompte de la consigne.** Le contexte annonce « Dix remplacements sur sept pages », alors que les règles nomment huit pages (« soit huit en tout »). Dix remplacements ont été faits, sur ces huit pages.
2. **Interruption de la session**, après les diffs de l'étape 10, le 18 vers 20:53, jusqu'à la reprise le 19 à 10:26. Les étapes 11 et 12 et le rapport ont été faits le 19, après avoir vérifié que les pages n'avaient pas bougé entre-temps. Les valeurs de l'étape 11 ont donc été lues environ 13 h 30 après les écritures. Ce que montrent les `_MDAT`, c'est que les faits relus sont ceux des enregistrements du 18 ; ils ne montrent pas qu'ils étaient là plus tôt.
3. **Ancien sens encore écrit à quatre endroits** ; voir A. **Une phrase « non mesuré » dépassée** ; voir B.
4. **Retraitement après la modification du modèle.** `Millimètre` et `Micromètre` ont un `touched` de 20:53:06, postérieur à leur propre enregistrement. Ils ont été invalidés 1 min 8 s après l'écriture de `Modèle:Unit`, à 20:51:58. Le `touched` de `Mètre` est resté à l'heure de son enregistrement, 20:52:14. Leurs faits sont ceux attendus. C'est une observation, sans conséquence ici.
5. **`curl` de l'étape 11** : la commande dictée est une lecture GET anonyme, sans cookie. Je l'ai lancée telle quelle, au lieu de passer par `bin/wiki-api.sh`. Ce n'est pas une écriture.
6. **Lectures faites au-delà de la consigne, toutes sans écriture** :
   - protections et `intestactions` ;
   - état de référence avant écriture ;
   - faits de la propriété et des unités ;
   - contrôles des pages de documentation ;
   - rendu de `Millimètre` ;
   - recherche de l'ancien sens, et source de `Dimension longueur`.
7. **Outils** : un programme Python du scratchpad, `t48-remplacer.py`, affiché en entier avant son lancement ; lignes de Python en commande ; fichiers temporaires dans le scratchpad. Le rapport a été assemblé par substitution de repères, pour citer les diffs, les faits et la réponse de l'API octet pour octet.
8. `origin/main` n'avait pas bougé depuis la tâche 47 : il était toujours à `bb0cbb9` à la vérification du 19 à 10:28. Aucune intégration n'a été nécessaire avant le commit.
