# Lot 21, tâche 40 — remettre les facteurs de conversion dans le sens attendu par le bloc de déclaration

Date : 15 octobre 2026 (horloge UTC du conteneur, 19:58 à 20:05). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## En bref

- Les quatre pages ont été corrigées, et chaque diff montre exactement ce que la consigne attendait.
- `action=ask` rend **mètre `1`, millimètre `1000`, micromètre `1000000`**. La modification devait changer un fait : c'est l'apparition de ces nouvelles valeurs qui fait foi, et elles sont là.
- `Attribut:Conversion factor` reste de type nombre : `_TYPE` vaut `…#_num` dans les faits, et le type résolu `_num` est égal à celui du témoin `Planting rank`. Aucun `_ERRC`, aucune `_CHGPRO` observée.
- Le tableau de `Modèle:Unit` affiche désormais « Facteur vers l'unité principale : 1000 » sur `Millimètre` ; voir A.

## Ce qui a été écrit

Quatre écritures, par `bin/wiki-put.sh`, sans `--createonly`, une page à la fois :

| Page | Révision | Taille | Horodatage | Résumé de modification |
|---|---|---|---|---|
| `Attribut:Conversion factor` | 1623 → 1648 | 580 → 963 octets | 2026-10-15T19:59:52Z | `[Lot 21][Tâche 40] Conversion factor : nombre d'unités par unité principale, sens attendu par le bloc de déclaration` |
| `Millimètre` | 1635 → 1649 | 546 → 545 octets | 2026-10-15T19:59:58Z | `[Lot 21][Tâche 40] Facteur dans le sens du bloc de déclaration : 1000 millimètres par mètre` |
| `Micromètre` | 1636 → 1650 | 450 → 449 octets | 2026-10-15T20:00:03Z | `[Lot 21][Tâche 40] Facteur dans le sens du bloc de déclaration : 1000000 micromètres par mètre` |
| `Mètre` | 1634 → 1651 | 459 → 517 octets | 2026-10-15T20:00:08Z | `[Lot 21][Tâche 40] Phrase sur les facteurs alignée sur le sens du bloc de déclaration` |

Les quatre appels ont rendu `"result": "Success"`, code de sortie 0. Aucune autre page écrite. `Dimension longueur`, son bloc de déclaration, `Modèle:Unit` et `Catégorie:Unité` n'ont pas été touchés.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas.

**Étape 3 — lecture des quatre pages.**
- Révisions courantes : celles de leur création (tâches 30 et 32), soit 1623, 1635, 1636 et 1634 ; `protection: []` sur les quatre.
- `intestactions=edit`, session ouverte (`Success Cywil`) : `"edit": true` sur les quatre. Pas de verrou SMW, en particulier sur la page de propriété, où `prop=info` ne l'aurait pas vu.
- Copies gardées dans le scratchpad, hors du dépôt : 580, 546, 450 et 459 octets, comme annoncé par l'API.
- Faits de référence : propriété `_TYPE` = `…#_num` ; `Conversion_factor` = `0.001` sur `Millimètre`, `1.0E-6` sur `Micromètre`, `1` sur `Mètre`.

**Étapes 4 à 7 — remplacements.** Faits par un programme Python du scratchpad (`t40-remplacer.py`), affiché en entier avant son lancement. Il porte les six paires de chaînes de la consigne. Pour chaque page, il ne produit la copie modifiée que si toutes ses chaînes sont trouvées exactement une fois. Résultat : chaque chaîne trouvée **une fois**, aux lignes 2, 3 et 5 de la propriété, en ligne 6 de `Millimètre`, en ligne 7 de `Micromètre` et en ligne 13 de `Mètre`. Après remplacement, aucune chaîne cherchée ne subsiste et chaque remplacement figure une fois.

**Étape 8 — écriture et comparaison.**
- Révisions revérifiées juste avant les écritures (19:59:44 UTC) : inchangées.
- Après écriture, les quatre sources publiées, relues par `bin/wiki-get.sh`, sont **identiques octet pour octet aux copies prévues** (`cmp`).
- Diffs entre chaque copie d'origine et la version publiée, tels quels.

`Attribut:Conversion factor` (trois lignes modifiées, 2, 3 et 5 ; `diff` réunit les lignes voisines 2 et 3 en un seul bloc) :

```
2,3c2,3
< [[Property_description_FR::Facteur multiplicatif qui ramène une valeur exprimée dans cette unité à l'unité principale de sa dimension : 0,001 pour le millimètre, l'unité principale de la dimension longueur étant le mètre. Nombre pur, sans unité.]]
< [[Property_description_EN::Multiplying factor bringing a value expressed in this unit back to the main unit of its dimension: 0.001 for the millimetre, the main unit of the length dimension being the metre. A pure number, with no unit.]]
---
> [[Property_description_FR::Nombre d'unités de celle-ci contenues dans une unité principale de sa dimension : 1000 pour le millimètre, puisqu'un mètre vaut mille millimètres. C'est le sens qu'attend Semantic MediaWiki dans le bloc de déclaration porté par la page de dimension, où cette valeur se recopie telle quelle. Elle est l'inverse du facteur de conversion au sens courant, qui vaudrait 0,001. Nombre pur, sans unité.]]
> [[Property_description_EN::Number of these units contained in one main unit of its dimension: 1000 for the millimetre, since a metre is a thousand millimetres. This is the sense Semantic MediaWiki expects in the declaration block carried by the dimension page, where the value is copied as it stands. It is the inverse of the conversion factor in the usual sense, which would be 0.001. A pure number, with no unit.]]
5c5
< [[Property_range::nombre pur]]
\ No newline at end of file
---
> [[Property_range::nombre d'unités par unité principale]]
\ No newline at end of file
```

`Millimètre` (un endroit) :

```
6c6
< |facteur=0,001
---
> |facteur=1000
```

`Micromètre` (un endroit) :

```
7c7
< |facteur=0,000001
---
> |facteur=1000000
```

`Mètre` (un endroit) :

```
13c13
< C'est dans le mètre que Semantic MediaWiki stocke les valeurs de toutes les grandeurs de dimension longueur, quelle que soit l'unité employée à la saisie. Les facteurs de conversion des autres unités de cette dimension y ramènent, et celui du mètre vaut donc 1.
\ No newline at end of file
---
> C'est dans le mètre que Semantic MediaWiki stocke les valeurs de toutes les grandeurs de dimension longueur, quelle que soit l'unité employée à la saisie. Les autres unités de cette dimension se comptent par rapport à lui : mille millimètres dans un mètre, un million de micromètres. Le facteur du mètre vaut donc 1.
\ No newline at end of file
```

Les lignes « \ No newline at end of file » ne signalent pas une modification. La ligne modifiée est la dernière de la page, et celle-ci n'a de saut de ligne final ni avant ni après.

**Étape 9 — la vérification qui tranche.** Requête lancée à 20:02:43 UTC, 2 min 35 s après la dernière écriture, exactement celle de la consigne. Sortie telle quelle :

```
{"query":{"printrequests":[{"label":"","key":"","redi":"","typeid":"_wpg","mode":2,"format":false},{"label":"Conversion factor","key":"Conversion_factor","redi":"","typeid":"_num","mode":1,"format":""},{"label":"Unit symbol","key":"Unit_symbol","redi":"","typeid":"_txt","mode":1,"format":""}],"results":{"Mètre":{"printouts":{"Conversion factor":[1],"Unit symbol":["m"]},"fulltext":"Mètre","fullurl":"https://wiki.ecolibre.org/wiki/M%C3%A8tre","namespace":0,"exists":"1","displaytitle":""},"Micromètre":{"printouts":{"Conversion factor":[1000000],"Unit symbol":["µm"]},"fulltext":"Micromètre","fullurl":"https://wiki.ecolibre.org/wiki/Microm%C3%A8tre","namespace":0,"exists":"1","displaytitle":""},"Millimètre":{"printouts":{"Conversion factor":[1000],"Unit symbol":["mm"]},"fulltext":"Millimètre","fullurl":"https://wiki.ecolibre.org/wiki/Millim%C3%A8tre","namespace":0,"exists":"1","displaytitle":""}},"serializer":"SMW\\Serializers\\QueryResultSerializer","version":2,"meta":{"hash":"2d914d4aa26321c8e822cd9d3d403202","count":3,"offset":0,"source":"","time":"0.005996"}}}
```

| Page | `Conversion factor` rendu | `Unit symbol` | Attendu |
|---|---|---|---|
| `Mètre` | `1` | `m` | 1 |
| `Millimètre` | `1000` | `mm` | 1000 |
| `Micromètre` | `1000000` | `µm` | 1000000 |

Trois pages, les trois valeurs attendues, aucune absente, nulle ou fausse. Typeid de la colonne : `Conversion factor` `_num`, `Unit symbol` `_txt`. Selon la règle de CLAUDE.md sur le retraitement différé, la modification devant changer un fait, c'est l'apparition des nouvelles valeurs qui fait foi : elles sont apparues. Les faits des trois pages le confirment : `Conversion_factor` vaut `'1'`, `'1000'` et `'1000000'`, avec les `_MDAT` des nouvelles révisions, et aucune ne porte de `_ERRC`.

Faits de `Attribut:Conversion factor`, lus après la pause, tels quels :

```
Property_cardinality -> ['single']
Property_description_EN -> ['Number of these units contained in one main unit of its dimension: 1000 for the millimetre, since a metre is a thousand millimetres. This is the sense Semantic MediaWiki expects in the declaration block carried by the dimension page, where the value is copied as it stands. It is the inverse of the conversion factor in the usual sense, which would be 0.001. A pure number, with no unit.']
Property_description_FR -> ["Nombre d'unités de celle-ci contenues dans une unité principale de sa dimension : 1000 pour le millimètre, puisqu'un mètre vaut mille millimètres. C'est le sens qu'attend Semantic MediaWiki dans le bloc de déclaration porté par la page de dimension, où cette valeur se recopie telle quelle. Elle est l'inverse du facteur de conversion au sens courant, qui vaudrait 0,001. Nombre pur, sans unité."]
Property_range -> ["nombre d'unités par unité principale"]
_MDAT -> ['1/2026/10/15/19/59/52/0']
_SKEY -> ['Conversion factor']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_num']
```

Le type n'a pas bougé : `_TYPE` vaut toujours `…#_num`. Aucun `_ERRC`. Par `action=ask`, `Conversion factor` se résout en `_num`, comme le témoin de type Nombre `Planting rank`, lu dans la même requête. À la première lecture, 31 s après l'écriture, les faits portaient déjà les nouvelles valeurs, sans `_CHGPRO`.

**Étape 10 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Questions posées hors consigne

Aucune question reçue hors consigne. Une question nouvelle à Cyril, point A ci-dessous.

**A.** Contexte : la valeur portée par la page d'unité suit maintenant la nouvelle convention, mais deux textes décrivent encore l'ancienne.
- Le tableau de `Modèle:Unit` affiche le paramètre `facteur` sous l'intitulé « Facteur vers l'unité principale ». Constaté au rendu de `Millimètre` : « Facteur vers l'unité principale » puis « 1000 », ce qui se lit comme si un millimètre valait mille mètres.
- `Catégorie:Unité` dit que « le facteur de conversion vers l'unité principale de la dimension » est ce qu'attend une ligne du bloc de déclaration.

La consigne interdisait d'écrire sur ces deux pages, et elles n'ont pas été touchées. `Modèle:Unit` est transclus par les trois pages d'unité : sa modification relève du garde-fou 6 de CLAUDE.md, et donc de ta validation. Question : faut-il les aligner ? Suggestion : oui, dans une tâche ultérieure. Dans le modèle, l'intitulé deviendrait par exemple « Unités par unité principale ». Dans la catégorie, « le facteur de conversion vers l'unité principale de la dimension » deviendrait « le nombre d'unités contenues dans une unité principale de la dimension ».

## Écarts et surprises

1. **Intitulé du modèle et texte de la catégorie restés dans l'ancien sens** ; voir A.
2. **Pas de `_CHGPRO` après la modification de la propriété.** Seules ses descriptions et sa portée changeaient, pas son type. Les faits étaient à jour dès la première lecture, 31 s après l'écriture.
3. **Présentation du diff de la propriété** : trois lignes modifiées, en deux blocs, parce que les lignes 2 et 3 se suivent.
4. **Lectures faites au-delà de la consigne, toutes sans écriture** : `intestactions` avant d'écrire ; relevé de référence des faits ; faits des trois unités après écriture ; type résolu avec un témoin de type Nombre ; rendu de `Millimètre` et texte de `Catégorie:Unité`, pour étayer A.
5. **Outils** : programme Python du scratchpad, affiché avant son lancement ; fichiers temporaires dans le scratchpad. Rapport assemblé par substitution de repères, pour citer les diffs, la sortie de `action=ask` et les faits octet pour octet.
6. `origin/main` n'avait pas bougé depuis la tâche 39 (`ffdeb84`) : aucune avance rapide nécessaire avant le commit.
