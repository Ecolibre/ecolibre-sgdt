# Lot 21, tâche 44 — la purge rend-elle saisissable une écriture ajoutée au bloc après coup

Date : 16 octobre 2026 (horloge UTC du conteneur, 13:01 à 13:20). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## En bref

- **Non.** La purge de `Attribut:Test lot21e longueur` a changé son `touched`, de 2026-10-15T21:05:04Z à 2026-10-16T13:01:58Z. Elle n'a changé ni ses faits, identiques avant et après avec `micrometre` dans le `_CONV`, ni la saisie.
- Sur `Test lot21j`, écrite 2 min 19 s après la purge, `304 micrometre` est refusée (`smw_unitnotallowed`). C'est le même refus que pour `204 micrometre` sur `Test lot21g`, avant la purge. Les six autres écritures passent sur les deux pages.
- Juste avant la purge, à 13:01:45, un aperçu refusait encore `micrometre`, 15 h 59 min 58 s après son ajout au bloc. Le témoin `205 micromètre` passait.
- Les trois phrases de `Test lot21h` et `Test lot21i` sont corrigées, à raison de deux lignes par page. Les faits de ces pages sont inchangés, hors `_MDAT`.
- La mesure dément deux affirmations du wiki, l'une sur `Catégorie:Dimension`, l'autre sur la page du lot ; voir A.

## Ce qui a été écrit

| Page | Révision | Taille | Horodatage | Résumé de modification |
|---|---|---|---|---|
| `Test lot21j` | création, 1660 | 648 octets | 2026-10-16T13:04:14Z | `[Lot 21][Tâche 44] Page d'essai : les sept écritures de Test lot21g sur la même propriété, après sa purge` |
| `Test lot21h` | 1658 → 1661 | 596 → 697 octets | 2026-10-16T13:06:47Z | `[Lot 21][Tâche 44] Correction : la propriété transclut le bac à sable Test lot21f, dont le bloc n'a jamais porté micrometre` |
| `Test lot21i` | 1659 → 1662 | 589 → 696 octets | 2026-10-16T13:06:52Z | `[Lot 21][Tâche 44] Correction : la propriété n'était pas en retard, son bloc n'a jamais porté micrometre` |

Les trois appels à `bin/wiki-put.sh` ont rendu `"result": "Success"`. `Test lot21j` a été créée avec `--createonly` et a rendu `"new": true`. Les deux autres pages ont été écrites sans `--createonly`, comme le prévoit la consigne. Les trois sources publiées, relues par `bin/wiki-get.sh`, sont **identiques octet pour octet** aux fichiers préparés (`cmp`). Le fichier de `Test lot21j` reproduit le texte de la consigne. Une ligne de Python a vérifié qu'il ne diffère de `Test lot21g` que par la première ligne, les nombres et l'intitulé de l'écriture `micrometre` ; `µ` y est le caractère U+00B5.

Une purge, qui n'est pas une écriture : `Attribut:Test lot21e longueur`, à 13:01:55, par `bin/wiki-purge.sh` (étape 4), sur l'autorisation donnée dans ta réponse A.

Aucune autre page n'a été écrite ni purgée. Rien n'a été touché sur :
- `Test lot21g` ;
- `Dimension longueur` ;
- les propriétés d'essai, à part cette purge ;
- les bacs à sable ;
- les quatre propriétés interdites.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas. `Test lot21j` était absente (`"missing": true`). `protection: []` sur elle et sur les deux pages à corriger.

**Étape 3 — état avant purge.** Faits de `Attribut:Test lot21e longueur`, lus à 13:01:36, sans filtre, tels quels :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : une longueur, pour éprouver la transclusion du bloc de déclaration depuis une page de dimension. Ne pas supprimer sans consigne."]
_CONV -> ['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micrometre, micromètre']
_MDAT -> ['1/2026/10/15/15/27/4/0']
_SKEY -> ['Test lot21e longueur']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['mm, m']
```

Le `_CONV`, tel quel, est `['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micrometre, micromètre']`. Il porte `micrometre` : la mesure garde son objet.

`touched`, lu par `action=query&prop=info` dans la même minute : `2026-10-15T21:05:04Z`, inchangé depuis la tâche 42. La propriété n'a qu'une révision, la 1642, et la page qu'elle transclut est `Dimension longueur`.

*Aperçu*, sans enregistrement, lancé à 13:01:45 :
- requête `action=parse`, avec `text=[[Test lot21e longueur::204 micrometre]] / [[Test lot21e longueur::205 micromètre]]` ;
- la seconde annotation sert de témoin ;
- la chaîne a été décodée avant l'envoi, pour vérifier ce qui partait.

Rendu, tel quel :

```
<div class="mw-parser-output"><p>204 micrometre<span class="smw-highlighter" data-type="4" data-state="inline" data-title="Avertissement" title="« micrometre » n’est pas déclaré comme une unité valide de mesure pour cette propriété."><span class="smwtticon warning"></span><span class="smwttcontent">« micrometre » n’est pas déclaré comme une unité valide de mesure pour cette propriété.</span></span> / <span class="smw-highlighter" data-type="3" data-state="inline" data-title="Conversion d’unité" title="0,205 mm 2,05e-4 m "><span class="smwtext">205 micromètre</span><span class="smwttcontent">0,205&#160;mm &lt;br /&gt;2,05e-4&#160;m &lt;br /&gt;</span></span>
</p></div>
```

**L'écriture est toujours refusée** : « micrometre » n'est pas déclaré comme une unité valide. Le témoin `205 micromètre` est converti (0,205 mm ; 2,05e-4 m). L'étape 4 a donc eu lieu.

**Étape 4 — purger.** `bin/wiki-purge.sh "Attribut:Test lot21e longueur"`, lancé à 13:01:55 après `bin/wiki-login.sh` (`Success Cywil`). Réponse, telle quelle :

```
{
    "batchcomplete": true,
    "purge": [
        {
            "ns": 102,
            "title": "Attribut:Test lot21e longueur",
            "purged": true,
            "linkupdate": true
        }
    ]
}
```

Faits relus à 13:04:05, soit 2 min 10 s après la purge, sans filtre, tels quels :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : une longueur, pour éprouver la transclusion du bloc de déclaration depuis une page de dimension. Ne pas supprimer sans consigne."]
_CONV -> ['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micrometre, micromètre']
_MDAT -> ['1/2026/10/15/15/27/4/0']
_SKEY -> ['Test lot21e longueur']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['mm, m']
```

Le `diff` avec les faits d'avant la purge ne montre aucune différence.

| | Avant la purge (13:01:36) | Après la purge (13:04:05) |
|---|---|---|
| `_CONV` | `['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micrometre, micromètre']` | identique |
| `touched` | `2026-10-15T21:05:04Z` | **`2026-10-16T13:01:58Z`** |
| `_MDAT` | `['1/2026/10/15/15/27/4/0']` | identique |

**Le `touched` a changé**, trois secondes après l'appel de purge. Les faits n'ont pas changé.

**Étape 5 — refaire les sept écritures.** `Test lot21j` a été créée à 13:04:14 (révision 1660), 2 min 19 s après l'appel de purge. Son lien vers `Test lot21g` figure dans `list=backlinks` de `Test lot21g`, contrôlé à 13:04:25. Faits lus à 13:06:26, soit 2 min 12 s après l'écriture, tels quels :

```
Test_lot21e_longueur -> ['0.000301', '0.000302', '0.000303', '0.000305', '0.000306', '0.000307']
_ERRC -> ['Test_lot21j#0##_ERR72e9f912c9378b7ae4536ea40b50daf7']
_MDAT -> ['1/2026/10/16/13/4/14/0']
_SKEY -> ['Test lot21j']
```

Détail de la `_ERRC` (JSON brut de `smwbrowse`, bloc `sobj`) :

```
Test_lot21j#0##_ERR72e9f912c9378b7ae4536ea40b50daf7 | _ERRP -> ['Test_lot21e_longueur#102##']
Test_lot21j#0##_ERR72e9f912c9378b7ae4536ea40b50daf7 | _ERRT -> ['[2,"smw_unitnotallowed","micrometre"]']
Test_lot21j#0##_ERR72e9f912c9378b7ae4536ea40b50daf7 | _SKEY -> ['Test lot21j# ERR72e9f912c9378b7ae4536ea40b50daf7']
```

Avertissement rendu (`bin/wiki-warnings.sh`), tel quel :

```
=== Test lot21j ===
- « micrometre » n’est pas déclaré comme une unité valide de mesure pour cette propriété.
```

Il est identique, octet pour octet, à celui de `Test lot21g` (`md5sum`, ligne de titre exclue).

Écritures passées et refusées. Une écriture est **passée** quand sa valeur figure dans les faits de la page. Elle est **refusée** quand sa valeur en est absente et qu'une `_ERRC` la nomme. Les valeurs sont stockées en mètres. La dernière colonne rappelle, pour comparaison, le résultat de l'écriture correspondante sur `Test lot21g` (tâche 43, même propriété, avant la purge).

| Écriture sur `Test lot21j` | Valeur attendue (m) | Après la purge | `Test lot21g`, avant la purge |
|---|---|---|---|
| `301 µm` (symbole) | 0.000301 | passée | `201 µm` passée |
| `302 um` (alias ASCII) | 0.000302 | passée | `202 um` passée |
| `303 micron` (alias courant) | 0.000303 | passée | `203 micron` passée |
| `304 micrometre` (libellé anglais, ajouté au bloc après la création de la propriété) | 0.000304 | **refusée** (`smw_unitnotallowed`) | `204 micrometre` **refusée** |
| `305 micromètre` (libellé français) | 0.000305 | passée | `205 micromètre` passée |
| `0,306 millimetre` (libellé anglais du millimètre) | 0.000306 | passée | `0,206 millimetre` passée |
| `0,000307 metre` (libellé anglais du mètre) | 0.000307 | passée | `0,000207 metre` passée |

**Étape 6 — corriger les trois phrases.**
- Copies d'origine gardées dans le scratchpad, hors du dépôt : `Test lot21h`, 596 octets, et `Test lot21i`, 589 octets. Elles sont identiques aux versions publiées à la tâche 43 (`cmp`). Les révisions, 1658 et 1659, ont été revérifiées à 13:06:40, juste avant l'écriture.
- Remplacements faits par un programme Python du scratchpad (`t44-remplacer.py`), affiché en entier avant son lancement. Il ne produit la copie d'une page que si chacune de ses chaînes est trouvée exactement une fois.
- Résultat : chaque chaîne a été trouvée **une fois**, en ligne 1 et en ligne 9 de chaque page. Après remplacement, aucune chaîne cherchée ne subsiste, et chaque remplacement figure une fois.
- Après écriture, les deux sources publiées sont identiques octet pour octet aux copies prévues (`cmp`).

Diff entre la copie d'origine et la version publiée, tel quel, pour `Test lot21h` :

```
1c1
< Page d'essai du lot 21 : les mêmes écritures, avec la propriété qui porte encore l'ancienne ligne. Ne pas supprimer sans consigne.
---
> Page d'essai du lot 21 : les mêmes écritures, avec une propriété qui transclut le bac à sable Test lot21f et non la page de dimension ; son bloc n'a jamais porté l'écriture micrometre. Ne pas supprimer sans consigne.
9c9
< Libellé anglais, ajouté à la tâche 42 : [[Test lot21f longueur::204 micrometre]]
---
> Libellé anglais, absent du bloc de cette propriété : [[Test lot21f longueur::204 micrometre]]
```

Et pour `Test lot21i` :

```
1c1
< Page d'essai du lot 21 : les mêmes écritures, avec la propriété en retard une fois purgée. Ne pas supprimer sans consigne.
---
> Page d'essai du lot 21 : les mêmes écritures, avec cette même propriété une fois purgée ; son bloc n'a jamais porté l'écriture micrometre, et la purge ne pouvait donc rien y changer. Ne pas supprimer sans consigne.
9c9
< Libellé anglais, ajouté à la tâche 42 : [[Test lot21f longueur::204 micrometre]]
---
> Libellé anglais, absent du bloc de cette propriété : [[Test lot21f longueur::204 micrometre]]
```

Contrôle de plus : les faits des deux pages, relus à 13:07:11, ne diffèrent de ceux de la tâche 43 que par `_MDAT`. Les mêmes six valeurs sont stockées, avec la même `_ERRC` sur `micrometre` : le réenregistrement n'a rien changé à ce que ces pages stockent.

**Étape 7 — relevé final.** `.claude/settings.local.json` n'existe toujours pas (relevé à 13:07:17). Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Ce que ces mesures établissent

- La purge de `Attribut:Test lot21e longueur` a été prise en compte, puisque son `touched` a changé.
- Elle n'a rien changé à ses faits, ni à la saisie de `micrometre` sur cette propriété. L'écriture était refusée avant la purge, à l'aperçu de 13:01:45 comme sur `Test lot21g` à la tâche 43. Elle l'est encore après, sur `Test lot21j`, enregistrée 2 min 19 s après la purge.
- Les six autres écritures passent, avant comme après.
- Ces mesures ne disent rien de ce qui rendrait `micrometre` saisissable sur cette propriété.

## Où la mesure contredit ce qui est écrit sur le wiki

CLAUDE.md demande de chercher où est écrite une chose qu'une mesure infirme. J'ai lancé une recherche plein texte (`list=search`, `srnamespace=*`) sur trois expressions exactes : « écritures équivalentes », « acceptés à la saisie » et « acceptées à la saisie ». Quatre pages répondent, dont deux affirment ce que la mesure dément. La recherche ne porte que sur ces trois expressions : une affirmation formulée autrement lui échapperait.

`Catégorie:Dimension` (révision 1654), ligne 5, telle quelle :

```
Une ligne du bloc se compose toujours de la même façon, et des seuls champs que porte la page de l'unité : le nombre d'unités contenues dans une unité principale, puis le symbole, puis les alias acceptés à la saisie, puis le libellé anglais, puis le libellé français. Ainsi "1000 mm, millimetre, millimètre", et "1000000 µm, um, micron, micrometre, micromètre". L'ordre va du plus court au plus long ; Semantic MediaWiki tient tout ce qui suit le symbole pour des écritures équivalentes, et c'est le symbole qui s'affiche.
```

Cette ligne affirme que « Semantic MediaWiki tient tout ce qui suit le symbole pour des écritures équivalentes ». Or `micrometre` suit le symbole dans la ligne du micromètre de `Dimension longueur`, et il n'est pas accepté à la saisie sur `Test lot21e longueur`.

`Lot 21 — Grandeurs et unités` (révision 1638), ligne 31, telle quelle :

```
'''Toute unité convertible par un coefficient peut être acceptée, à condition d'être déclarée.''' Une valeur saisie dans une unité dont la conversion n'est pas déclarée n'est pas stockée, et une erreur la signale : le système ne devine jamais un coefficient. Déclarer l'unité, avec son coefficient vers l'unité principale, suffit pour qu'elle soit acceptée et convertie, qu'elle appartienne au SI ou non. Règle posée le 4 octobre 2026 : les documents techniques à reprendre emploient beaucoup d'unités hors du SI, et chacune doit pouvoir s'y ramener. Deux exceptions à la règle du coefficient : les températures, dont le décalage d'origine relève du type Temperature, et les grandeurs logarithmiques comme le décibel, qui n'ont pas de coefficient.
```

Cette ligne affirme que « Déclarer l'unité, avec son coefficient vers l'unité principale, suffit pour qu'elle soit acceptée et convertie ». Or `micrometre` est déclaré dans le `_CONV` stocké de `Test lot21e longueur`, avec le coefficient de sa ligne, et il n'y est pas accepté.

Les deux autres pages ne sont pas démenties :
- `Micromètre` (révision 1650), ligne 14, telle quelle :

```
Le symbole µm demande un caractère que tout le monde n'a pas sous la main, et l'usage courant dit volontiers "micron". Les deux écritures sont acceptées à la saisie et ramènent à cette page, sans que le symbole affiché change.
```

Les alias que porte cette page sont `um` et `micron` (fait `Unit_alias`), et ils passent sur les deux propriétés éprouvées.
- `Modèle:Unit`, où « Alias acceptés à la saisie » n'est que l'intitulé d'une ligne de tableau.

## Contrôles supplémentaires, en lecture seule

- Révisions et protections des pages juste avant l'écriture.
- `list=backlinks` de `Test lot21g`.
- Faits des deux pages corrigées, et tailles par `prop=info`.
- Recherche plein texte, lecture des phrases citées ci-dessus, et faits de `Micromètre`.
- Avertissement rendu de `Test lot21j`.

## Questions posées hors consigne

Aucune question reçue hors consigne. Les réponses aux points A et B de la tâche 43 figurent en tête de cette consigne. L'autorisation de purge de la réponse A a servi à l'étape 4, et les corrections de la réponse B sont celles de l'étape 6. Une question nouvelle à Cyril, point A ci-dessous.

**A.** Contexte : deux affirmations du wiki sont démenties par la mesure faite sur la propriété qui transclut le bloc de `Dimension longueur`.
- Sur `Catégorie:Dimension` : « Semantic MediaWiki tient tout ce qui suit le symbole pour des écritures équivalentes ».
- Sur la page du lot : « Déclarer l'unité, avec son coefficient vers l'unité principale, suffit pour qu'elle soit acceptée et convertie ».

Sur `Test lot21e longueur`, `micrometre` est déclaré dans le `_CONV` stocké, mais il est refusé à la saisie. C'est mesuré de cinq minutes à seize heures après son ajout au bloc (tâches 42 à 44), avant comme après une purge de la propriété. La consigne interdisait d'écrire sur ces deux pages, et je n'y ai pas touché. Or, selon CLAUDE.md, une mesure qui contredit une page n'est pas terminée tant que cette page n'est pas corrigée.

Question : faut-il restreindre ces deux phrases ?

Suggestion : oui, dans une tâche ultérieure, en ajoutant à chacune la restriction mesurée, sans rien supposer de plus. Par exemple : « Mesuré les 15 et 16 octobre 2026 : une écriture ajoutée au bloc après la création de la propriété qui le transclut figure dans les déclarations stockées de cette propriété, mais reste refusée à la saisie, même après une purge de la propriété (Test lot21g, Test lot21j). » L'entrée correspondante irait dans les *Limites connues* à la clôture du lot.

## Écarts et surprises

1. **Une mesure qui contredit deux pages du wiki** ; voir A. Les pages n'ont pas été corrigées, puisque la consigne interdisait d'y écrire.
2. **Recherche plein texte limitée par défaut à l'espace principal.** Une première recherche de « écritures équivalentes » n'a rendu aucun résultat, alors que `Catégorie:Dimension` porte l'expression. Sans `srnamespace`, `list=search` ne cherche que dans l'espace principal. Relancée avec `srnamespace=*`, la recherche trouve la page. Une absence établie par une recherche sans `srnamespace=*` ne prouve donc rien hors de l'espace principal. Ce point ne figure pas dans CLAUDE.md.
3. **Même identifiant d'erreur avant et après la purge.** La `_ERRC` de `Test lot21j` porte le même suffixe que celle de `Test lot21g`, `_ERR72e9f912c9378b7ae4536ea40b50daf7`. C'est cohérent avec l'observation 6 de la tâche 43 : l'identifiant dépend de la propriété et du message, pas de la page.
4. **Lectures faites au-delà de la consigne, toutes sans écriture** :
   - transclusion de la propriété ;
   - `list=backlinks` ;
   - faits des pages corrigées et de `Micromètre` ;
   - recherche plein texte et phrases citées ;
   - avertissement rendu de `Test lot21j`.
5. **Outils** :
   - un programme Python du scratchpad, `t44-remplacer.py`, affiché en entier avant son lancement ;
   - des lignes de Python en commande ;
   - des fichiers temporaires dans le scratchpad.

   Le rapport a été assemblé par substitution de repères, pour citer octet pour octet les faits, les rendus, les diffs et les phrases.
6. `origin/main` n'avait pas bougé depuis la tâche 43 (`d6aea25`) : aucune avance rapide n'a été nécessaire avant le commit.
