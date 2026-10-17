# Lot 21, tâche 41 — aligner deux textes sur le sens des facteurs

Date : 15 octobre 2026 (horloge UTC du conteneur, 20:34 à 20:42). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## En bref

- `Modèle:Unit` et `Catégorie:Unité` corrigés, avec exactement les endroits attendus : deux sur le modèle, un sur la catégorie.
- Rendu de `Millimètre` : la ligne qui porte `1000` a pour intitulé **« Unités par unité principale »**. Le changement est visible depuis l'invalidation des pages d'unité, à 20:38:03 UTC, **2 min 9 s** après l'écriture du modèle. `Mètre` et `Micromètre` ont changé au même instant.
- Faits de `Millimètre` inchangés, sans `_ERRC`.
- Un écart de fond sur la nouvelle phrase de la catégorie : voir A.

## Ce qui a été écrit

Deux écritures, par `bin/wiki-put.sh`, sans `--createonly`, une page à la fois :

| Page | Révision | Taille | Horodatage | Résumé de modification |
|---|---|---|---|---|
| `Modèle:Unit` | 1632 → 1652 | 1 516 → 1 696 octets | 2026-10-15T20:35:54Z | `[Lot 21][Tâche 41] Intitulé « Unités par unité principale », et sens du paramètre facteur dans la documentation` |
| `Catégorie:Unité` (demandée sous `Category:`) | 1633 → 1653 | 671 → 852 octets | 2026-10-15T20:36:00Z | `[Lot 21][Tâche 41] Sens du nombre recopié dans le bloc de déclaration : unités par unité principale` |

Les deux appels ont rendu `"result": "Success"`, code de sortie 0. Aucune autre page écrite. `Mètre`, `Millimètre` et `Micromètre` n'ont pas été écrites : leur nouvel affichage vient du modèle qu'elles transcluent.

`Modèle:Unit` est un modèle en service, transclus par `Mètre`, `Millimètre` et `Micromètre` (`list=embeddedin`). Sa modification relève du garde-fou 6 de CLAUDE.md, et elle est validée par cette consigne.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas.

**Étape 3 — lecture des deux pages.** Révisions de création (tâche 32) : `Modèle:Unit` 1632, 1 516 octets ; `Catégorie:Unité` 1633, 671 octets ; `protection: []` sur les deux. Copies gardées dans le scratchpad, hors du dépôt, aux mêmes tailles.

**Étapes 4 et 5 — remplacements.** Faits par un programme Python du scratchpad (`t41-remplacer.py`), affiché en entier avant son lancement, qui ne produit la copie d'une page que si toutes ses chaînes sont trouvées exactement une fois. Chaque chaîne a été trouvée **une fois** : l'intitulé en ligne 21 du modèle, la phrase de documentation en ligne 2, la phrase de la catégorie en ligne 3. Après remplacement, aucune chaîne cherchée ne subsiste et chaque remplacement figure une fois.

**Étape 6 — écriture et comparaison.** Révisions revérifiées juste avant les écritures (20:35:49 UTC) : inchangées. `bin/wiki-login.sh` : `Success Cywil`. Les deux sources publiées, relues par `bin/wiki-get.sh`, sont **identiques octet pour octet aux copies prévues** (`cmp`). Diffs entre chaque copie d'origine et la version publiée, tels quels.

`Modèle:Unit`, **deux endroits** :

```
2c2
< Modèle d'une page d'unité. Paramètres : libellé fr, libellé en, symbole, alias, dimension, facteur, code UCUM, statut SI, équivalent externe. Les alias se séparent par des virgules. Le modèle pose seul la catégorie.
---
> Modèle d'une page d'unité. Paramètres : libellé fr, libellé en, symbole, alias, dimension, facteur, code UCUM, statut SI, équivalent externe. Les alias se séparent par des virgules. Le paramètre facteur porte le nombre d'unités de celle-ci contenues dans une unité principale de sa dimension : 1000 pour le millimètre, puisqu'un mètre vaut mille millimètres. Le modèle pose seul la catégorie.
21c21
< ! style="background:#f2f2f2; width:34%;" | Facteur vers l'unité principale
---
> ! style="background:#f2f2f2; width:34%;" | Unités par unité principale
```

`Catégorie:Unité`, **un endroit** :

```
3c3
< Une page d'unité porte le nom développé de l'unité, "Millimètre" et non "mm" : un titre se lit, un symbole se tape. Le symbole, les alias acceptés à la saisie et le facteur de conversion vers l'unité principale de la dimension sont exactement ce qu'attend une ligne du bloc de déclaration porté par la page de dimension.
---
> Une page d'unité porte le nom développé de l'unité, "Millimètre" et non "mm" : un titre se lit, un symbole se tape. Le symbole, les alias acceptés à la saisie et le nombre d'unités contenues dans une unité principale de la dimension sont exactement ce qu'attend une ligne du bloc de déclaration porté par la page de dimension, où ils se recopient tels quels. Ce nombre est l'inverse du facteur de conversion au sens courant : un mètre vaut mille millimètres, et c'est 1000 qui s'écrit, non 0,001.
```

**Étape 7 — la vérification.** Comme la consigne le prévoit, la vérification a porté sur le rendu, pas sur les faits. La ligne du tableau de `Millimètre` qui porte `1000` a été lue par `action=parse&page=Millimètre&prop=text`, et le `touched` de la page par `prop=info` :

| Heure (UTC) | Délai depuis l'écriture du modèle | `touched` de `Millimètre` | Intitulé rendu |
|---|---|---|---|
| 20:35:34 | (avant l'écriture) | 19:59:58 | Facteur vers l'unité principale |
| 20:36:15 | 21 s | 19:59:58 | Facteur vers l'unité principale |
| 20:38:26 | 2 min 32 s | **20:38:03** | **Unités par unité principale** |

Ligne rendue avant, telle quelle :

```
<tr>
<th style="background:#f2f2f2; width:34%;">Facteur vers l'unité principale
</th>
<td>1000
</td></tr>
```

Ligne rendue après, telle quelle :

```
<tr>
<th style="background:#f2f2f2; width:34%;">Unités par unité principale
</th>
<td>1000
</td></tr>
```

**Délai.** Le rendu a changé entre 21 s et 2 min 32 s après l'écriture du modèle. Le `touched` de `Millimètre`, comme ceux de `Mètre` et de `Micromètre`, est passé à 20:38:03, soit **2 min 9 s** après l'écriture : c'est l'instant où les trois pages ont été invalidées. Aucune page n'a été réécrite pendant l'attente. En complément, `Mètre` rend « Unités par unité principale » avec `1`, et `Micromètre` avec `1000000`.

Faits de `Millimètre`, lus après le changement du rendu, tels quels :

```
Conversion_factor -> ['1000']
Preferred_label -> ['Millimètre#0##_ML9ee8e8a04f153ba54049286bf69bf4ad', 'Millimètre#0##_ML1da5d6f7fd44f8bb6303e084343377db']
SI_status -> ['multiple ou sous-multiple']
UCUM_code -> ['mm']
Unit_dimension -> ['Dimension_longueur#0##']
Unit_symbol -> ['mm']
_INST -> ['Unité#14##']
_MDAT -> ['1/2026/10/15/19/59/58/0']
_SKEY -> ['Millimètre']
```

Aucun `_ERRC`. Ce sont les mêmes faits qu'à la tâche 40 (`Conversion_factor` `1000`, `_MDAT` de la révision 1649) : la modification du modèle ne touchait aucun fait, et ceux-ci ne prouvent donc rien sur le retraitement. C'est le rendu qui l'établit.

**Étape 8 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Contrôles supplémentaires, en lecture seule

- Faits de `Catégorie:Unité` : `_MDAT` et `_SKEY` seulement.
- Catégories et liens : `Modèle:Unit`, ni catégorie ni lien ; `Catégorie:Unité`, aucune catégorie, un lien vers `Modèle:Unit`, qui existe.

## Questions posées hors consigne

Aucune question reçue hors consigne. La réponse au point A de la tâche 40 figure en tête de cette consigne et a été appliquée. Une question nouvelle à Cyril, point A ci-dessous.

**A.** Contexte : la phrase écrite sur `Catégorie:Unité` dit que le symbole, les alias acceptés à la saisie et le nombre d'unités « sont exactement ce qu'attend une ligne du bloc de déclaration […], où ils se recopient tels quels ». Le bloc réel de `Dimension longueur`, lu dans sa source, ne correspond pas à cette recopie.
- Il porte aussi les noms des unités : `1 m, metre, mètre` et `1000 mm, millimetre, millimètre`, alors que `Mètre` et `Millimètre` n'ont aucun alias. Ces noms sont leurs libellés `Preferred label` en et fr.
- La ligne du micromètre, `1000000 µm, um, micron, micromètre`, porte les deux alias et le libellé français, mais pas le libellé anglais `micrometre`, que portent les deux autres lignes. Je n'ai pas essayé de saisie `micrometre`. D'après la déclaration, elle ne serait pas reconnue, alors que `millimetre` l'est.

La consigne imposait le texte, et je n'ai touché ni à la catégorie au-delà, ni au bloc. Question : faut-il fixer la règle de composition d'une ligne du bloc ? Par exemple : nombre, symbole, alias, puis libellés en et fr. Suggestion : oui, dans une tâche ultérieure. Il s'agirait d'arrêter cette règle, de compléter la ligne du micromètre par `micrometre`, et d'ajuster la phrase de la catégorie pour qu'elle nomme aussi les libellés.

## Écarts et surprises

1. **La phrase de la catégorie décrit une recopie que le bloc actuel ne suit pas tout à fait** ; voir A.
2. **Délai de retraitement observé par le rendu** : 2 min 9 s par le `touched`, contre 4 min 29 s à la tâche 36. Une seconde mesure, qui confirme seulement que le délai varie.
3. **Lectures faites au-delà de la consigne, toutes sans écriture** : `list=embeddedin` du modèle ; rendu et `touched` de référence avant l'écriture ; rendus et `touched` de `Mètre` et de `Micromètre` ; faits, catégories et liens des pages écrites.
4. **Outils** : programme Python du scratchpad, affiché avant son lancement ; fichiers temporaires dans le scratchpad. Rapport assemblé par substitution de repères, pour citer les diffs et les faits octet pour octet.
5. `origin/main` n'avait pas bougé depuis la tâche 40 (`59addf4`) : aucune avance rapide nécessaire avant le commit.
