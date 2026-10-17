# Lot 21, tâche 42 — fixer la composition d'une ligne du bloc de déclaration

Date : 15 octobre 2026 (horloge UTC du conteneur, 21:00 à 21:35). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## En bref

- Les trois pages ont été corrigées, chacune à un seul endroit, comme attendu.
- **Le fait a changé.** Le `_CONV` de `Attribut:Test lot21e longueur` porte la nouvelle ligne `1000000 µm, um, micron, micrometre, micromètre`, apparue entre 2 min 37 s et 4 min 46 s après l'écriture du bloc. La propriété a été invalidée 3 min 17 s après (`touched`). `_UNIT` est inchangé.
- **L'effet ne suit pas.** Une saisie `200 micrometre` reste refusée 30 min après, avec « n'est pas déclaré comme une unité valide », alors que `micron`, `µm` et `millimetre` sont acceptés. Voir A.
- **`Attribut:Test lot21f longueur` ne change pas, et ne pouvait pas changer.** Elle transclut le bac à sable `Test lot21f`, pas `Dimension longueur`. La consigne l'attendait à tort.
- `Dimension longueur` ne porte aucun `_ERRC`.

## Ce qui a été écrit

Trois écritures, par `bin/wiki-put.sh`, sans `--createonly`, une page à la fois :

| Page | Révision | Taille | Horodatage | Résumé de modification |
|---|---|---|---|---|
| `Catégorie:Dimension` (demandée sous `Category:`) | 1640 → 1654 | 756 → 1 484 octets | 2026-10-15T21:01:42Z | `[Lot 21][Tâche 42] Règle de composition d'une ligne du bloc de déclaration, et rôle de la ligne des unités d'affichage` |
| `Dimension longueur` | 1647 → 1655 | 1 548 → 1 560 octets | 2026-10-15T21:01:47Z | `[Lot 21][Tâche 42] Ligne du micromètre complétée par son libellé anglais, selon la règle de composition` |
| `Catégorie:Unité` (demandée sous `Category:`) | 1653 → 1656 | 852 → 822 octets | 2026-10-15T21:01:53Z | `[Lot 21][Tâche 42] Renvoi à la règle de composition portée par la catégorie Dimension` |

Les trois appels ont rendu `"result": "Success"`, code de sortie 0. Aucune autre page écrite : ni `Mètre`, `Millimètre`, `Micromètre`, ni les lignes du mètre, du millimètre et des unités d'affichage, ni les bacs à sable.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas.

**Étape 3 — lecture des trois pages.** `Catégorie:Dimension` 1640, 756 octets ; `Dimension longueur` 1647, 1 548 octets ; `Catégorie:Unité` 1653, 852 octets ; `protection: []` sur les trois. Copies gardées dans le scratchpad, hors du dépôt, aux mêmes tailles. Relevé en même temps (`prop=templates`) : `Attribut:Test lot21e longueur` transclut `Dimension longueur`, et **`Attribut:Test lot21f longueur` transclut `Test lot21f`**. État de référence des deux propriétés : même `_CONV`, sans `micrometre`, et `_UNIT` = `mm, m`.

**Étapes 4 à 6 — remplacements.** Faits par un programme Python du scratchpad (`t42-remplacer.py`), affiché en entier avant son lancement. Il ne produit la copie d'une page que si sa chaîne est trouvée exactement une fois. Chaque chaîne a été trouvée **une fois** : ligne 5 de `Catégorie:Dimension`, ligne 18 de `Dimension longueur`, ligne 3 de `Catégorie:Unité`. Sur `Catégorie:Dimension`, la phrase cherchée reste présente une fois, puisque le remplacement s'achève sur elle. Le seul « µ » de chaque copie est U+00B5, et aucune ne contient la lettre grecque mu (U+03BC).

**Étape 7 — écriture et comparaison.** Révisions revérifiées juste avant les écritures (21:01:36 UTC) : inchangées. `bin/wiki-login.sh` : `Success Cywil`. Les trois sources publiées, relues par `bin/wiki-get.sh`, sont **identiques octet pour octet aux copies prévues** (`cmp`). Diffs entre chaque copie d'origine et la version publiée, tels quels, **un endroit chacun**.

`Catégorie:Dimension` : deux paragraphes et leurs lignes vides insérés devant la phrase sur le préfixe.

```
4a5,8
> Une ligne du bloc se compose toujours de la même façon, et des seuls champs que porte la page de l'unité : le nombre d'unités contenues dans une unité principale, puis le symbole, puis les alias acceptés à la saisie, puis le libellé anglais, puis le libellé français. Ainsi "1000 mm, millimetre, millimètre", et "1000000 µm, um, micron, micrometre, micromètre". L'ordre va du plus court au plus long ; Semantic MediaWiki tient tout ce qui suit le symbole pour des écritures équivalentes, et c'est le symbole qui s'affiche.
> 
> La dernière ligne du bloc fixe les unités d'affichage. Avec le type Quantity, c'est la première déclarée qui s'affiche, et une unité peut être admise à la saisie sans figurer là.
> 
```

`Dimension longueur` :

```
18c18
< [[Corresponds to::1000000 µm, um, micron, micromètre]]
---
> [[Corresponds to::1000000 µm, um, micron, micrometre, micromètre]]
```

`Catégorie:Unité` :

```
3c3
< Une page d'unité porte le nom développé de l'unité, "Millimètre" et non "mm" : un titre se lit, un symbole se tape. Le symbole, les alias acceptés à la saisie et le nombre d'unités contenues dans une unité principale de la dimension sont exactement ce qu'attend une ligne du bloc de déclaration porté par la page de dimension, où ils se recopient tels quels. Ce nombre est l'inverse du facteur de conversion au sens courant : un mètre vaut mille millimètres, et c'est 1000 qui s'écrit, non 0,001.
---
> Une page d'unité porte le nom développé de l'unité, "Millimètre" et non "mm" : un titre se lit, un symbole se tape. Les champs d'une page d'unité sont exactement ceux dont une ligne du bloc de déclaration a besoin, et ils s'y recopient dans l'ordre que fixe la [[:Category:Dimension|catégorie Dimension]], à qui le bloc appartient. Ce nombre est l'inverse du facteur de conversion au sens courant : un mètre vaut mille millimètres, et c'est 1000 qui s'écrit, non 0,001.
```

**Étape 8 — la vérification qui tranche.**

*Apparition de la nouvelle ligne sur `Attribut:Test lot21e longueur`.* Relevés du `touched` (`prop=info`) et du `_CONV` (faits), sans rien réécrire :

| Heure (UTC) | Délai depuis l'écriture du bloc (21:01:47) | `touched` | Ligne du micromètre dans `_CONV` |
|---|---|---|---|
| 21:02:12 | 25 s | 19:20:04 | `1000000 µm, um, micron, micromètre` (ancienne) |
| 21:04:24 | 2 min 37 s | 19:20:04 | ancienne |
| 21:06:33 | 4 min 46 s | **21:05:04** | **`1000000 µm, um, micron, micrometre, micromètre`** |

**Délai.** La nouvelle ligne est apparue entre 2 min 37 s et 4 min 46 s après l'écriture du bloc. Le `touched` de la propriété est passé à 21:05:04, soit **3 min 17 s** après. Aucune `_CHGPRO` n'a été vue.

Faits de `Attribut:Test lot21e longueur`, lus à 21:06:49 UTC, tels quels :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : une longueur, pour éprouver la transclusion du bloc de déclaration depuis une page de dimension. Ne pas supprimer sans consigne."]
_CONV -> ['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micrometre, micromètre']
_MDAT -> ['1/2026/10/15/15/27/4/0']
_SKEY -> ['Test lot21e longueur']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['mm, m']
```

Conforme : `_CONV` porte trois lignes, celle du micromètre avec `micrometre` ajouté avant `micromètre`, et `_UNIT` est inchangé.

Faits de `Attribut:Test lot21f longueur`, lus au même moment, tels quels :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : éprouve la transclusion d'un bloc de déclaration protégé par includeonly. Ne pas supprimer sans consigne."]
_CONV -> ['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micromètre']
_MDAT -> ['1/2026/10/15/17/21/47/0']
_SKEY -> ['Test lot21f longueur']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['mm, m']
```

Inchangés, et son `touched` est resté à 17:23:05. **Ce n'est pas un retraitement manquant.** Cette propriété transclut `Test lot21f`, le bac à sable de la tâche 36 (`prop=templates`), et non `Dimension longueur` : la modification du bloc ne la concerne pas. Son bloc, recopié dans le bac à sable, garde l'ancienne ligne du micromètre. Je n'ai pas écrit sur le bac à sable, comme la consigne l'interdit.

Requête de la consigne, lancée à 21:06:49 UTC, après l'apparition de la nouvelle ligne, telle quelle :

```
{"query-continue-offset":1,"query":{"printrequests":[{"label":"","key":"","redi":"","typeid":"_wpg","mode":2,"format":false},{"label":"Test lot21e longueur","key":"Test_lot21e_longueur","redi":"","typeid":"_qty","mode":1,"format":""}],"results":{"Attribut:Adult height":{"printouts":{"Test lot21e longueur":[]},"fulltext":"Attribut:Adult height","fullurl":"https://wiki.ecolibre.org/wiki/Attribut:Adult_height","namespace":102,"exists":"1","displaytitle":""}},"serializer":"SMW\\Serializers\\QueryResultSerializer","version":2,"meta":{"hash":"ca285065d80e140620ffc306015d81f5","count":1,"offset":0,"source":"","time":"0.007039"}}}
```

`Test lot21e longueur` se résout en `_qty`.

*Effet de l'ajout sur la saisie.* Pour savoir si la nouvelle écriture `micrometre` est reconnue, j'ai fait des aperçus de rendu (`action=parse`, `title=Test lot21e`, `text=` une annotation), sans sauvegarde :

| Heure (UTC) | `200 micron` | `200 micrometre` | `200 µm` | `0,2 millimetre` |
|---|---|---|---|---|
| vers 21:07 | — | refusée | — | — |
| 21:07:21 | convertie (0,2 mm ; 2,0e-4 m) | **refusée** | convertie | convertie (2,0e-4 m) |
| 21:12:47 | — | refusée | — | — |
| 21:18:01 | — | refusée, en anonyme comme en session ouverte | — | — |
| 21:23:13 | — | refusée | — | — |
| 21:31:43 | convertie | **refusée** | — | — |

Message de refus, tel que rendu (avertissement SMW, `data-title="Avertissement"`) :

```
« micrometre » n’est pas déclaré comme une unité valide de mesure pour cette propriété.
```

À 21:31:43, le `_CONV` stocké portait toujours `micrometre`. **Au plafond de trente minutes, le fait est à jour mais la conversion ne l'emploie pas.** Je n'ai ni purgé ni réécrit quoi que ce soit ; voir A.

*`Dimension longueur`.* Faits, tels quels :

```
Main_unit -> ['Mètre#0##']
Preferred_label -> ['Dimension_longueur#0##_MLcbd75d9b208d94361d77be7dfa2e4cf9', 'Dimension_longueur#0##_ML8a1a9268407e2c000f8d8e0e8491deb5']
_INST -> ['Dimension#14##']
_MDAT -> ['1/2026/10/15/21/1/47/0']
_SKEY -> ['Dimension longueur']
```

Aucun `_ERRC`.

**Étape 9 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Contrôles supplémentaires, en lecture seule

- Faits de `Catégorie:Dimension` et de `Catégorie:Unité` : `_MDAT` et `_SKEY` seulement.
- Catégories et liens : `Catégorie:Dimension`, aucune catégorie, un lien vers `Modèle:Dimension` ; `Catégorie:Unité`, aucune catégorie, liens vers `Modèle:Unit` et `Catégorie:Dimension`. Le lien préfixé `[[:Category:…]]` ne range donc pas la page dans la catégorie. `Dimension longueur`, `Catégorie:Dimension`, un lien vers `Mètre`.
- *Limites connues* : rien n'y décrit un cache des déclarations d'unités. L'entrée 79 traite du cache des pages servies aux visiteurs anonymes, et l'entrée 86 de l'ordre d'affichage.

## Questions posées hors consigne

Aucune question reçue hors consigne. La réponse au point A de la tâche 41 figure en tête de cette consigne et a été appliquée. Deux questions nouvelles à Cyril, points A et B ci-dessous.

**A.** Contexte : après la modification du bloc, le `_CONV` de la propriété qui le transclut porte bien `micrometre`. Pourtant, une saisie `200 micrometre` reste refusée trente minutes plus tard, alors que `micron`, déclaré depuis la création, est accepté. La conversion faite à l'analyse ne lit donc pas encore la déclaration à jour. Un cache des déclarations de la propriété en serait la cause vraisemblable, mais son mécanisme n'est pas mesuré. Ma recherche dans les *Limites connues* n'en donne aucune trace. Conséquence pour le lot : ajouter une unité ou un alias au bloc d'une dimension ne prendrait effet à la saisie qu'après un délai inconnu, au-delà de trente minutes. Question : comment poursuivre la mesure ? Suggestion : un nouvel essai de la même saisie, sans écriture, dans une tâche ultérieure, quelques heures plus tard. Si elle est toujours refusée, un essai explicitement autorisé : purge de `Attribut:Test lot21e longueur` par `bin/wiki-purge.sh`, puis nouvel essai. Le résultat irait dans les *Limites connues* à la clôture du lot.

**B.** Contexte : deux phrases écrites telles que dictées sont plus larges que ce qui est mesuré.
- Sur `Catégorie:Unité` : « Les champs d'une page d'unité sont exactement ceux dont une ligne du bloc de déclaration a besoin ». Une page d'unité porte aussi la dimension, le code UCUM, la place dans le SI et l'équivalent externe, qui n'entrent pas dans le bloc. `Catégorie:Dimension` dit plus justement que la ligne se compose « des seuls champs que porte la page de l'unité ».
- Sur `Catégorie:Dimension` : « c'est le symbole qui s'affiche » et « c'est la première déclarée qui s'affiche ». C'est vrai dans un résultat de requête, mesuré à la tâche 35 et consigné à l'entrée 86 des *Limites connues*. Mais une annotation écrite dans une page s'affiche telle que saisie, mesuré à la tâche 35 avec `200 µm`.

Question : faut-il resserrer ces deux phrases ? Suggestion : dans une tâche ultérieure, remplacer « sont exactement ceux dont une ligne du bloc de déclaration a besoin » par « contiennent tous ceux dont une ligne du bloc de déclaration a besoin », et ajouter « dans un résultat de requête » aux deux phrases d'affichage.

## Écarts et surprises

1. **Prémisse inexacte sur `Attribut:Test lot21f longueur`** : elle ne transclut pas `Dimension longueur`. Je l'ai établi par `prop=templates` au lieu d'attendre une ligne qui ne pouvait pas apparaître.
2. **Fait à jour, effet absent** au plafond de trente minutes ; voir A. Le premier cas de la règle de CLAUDE.md, « l'apparition de ce changement qui fait foi », est rempli pour le fait stocké, mais ne l'est pas pour le comportement à la saisie. Je ne propose rien pour la règle, qui est close : c'est une mesure, à ranger dans les *Limites connues*.
3. **Deux phrases plus larges que la mesure** ; voir B.
4. **Ordre des lectures de l'étape 8** : les faits d'abord, la requête `action=ask` ensuite, une fois la nouvelle ligne apparue et sans `_CHGPRO`. C'est l'ordre prudent pour une requête qui nomme une propriété dont une déclaration vient de changer.
5. **Deux mesures de plus du délai d'invalidation** : 3 min 17 s ici. Il faut y ajouter 3 min 22 s pour la modification de `Dimension longueur` à la tâche 37, déduits du `touched` lu au début de cette tâche (19:20:04, pour une écriture à 19:16:42). Avec 4 min 29 s (tâche 36) et 2 min 9 s (tâche 41), quatre valeurs entre deux et cinq minutes.
6. **Lectures faites au-delà de la consigne, toutes sans écriture** : transclusions et `touched` des deux propriétés ; aperçus de saisie ; recherche dans les *Limites connues* ; faits, catégories et liens des pages écrites.
7. **Outils** : programme Python du scratchpad, affiché avant son lancement ; fichiers temporaires dans le scratchpad. Rapport assemblé par substitution de repères, pour citer diffs, faits et requête octet pour octet.
8. `origin/main` n'avait pas bougé depuis la tâche 41 (`bdce8f1`) : aucune avance rapide nécessaire avant le commit.
