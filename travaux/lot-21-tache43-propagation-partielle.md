# Lot 21, tâche 43 — pourquoi deux propriétés transcluant le même bloc ne déclarent pas les mêmes unités

Date : 15 et 16 octobre 2026, horloge UTC du conteneur : de 21:47 à 21:56 le 15, puis de 08:32 à 08:45 le 16, après une interruption de la session. Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## En bref

- **Les deux propriétés ne transcluent pas le même bloc.** `Attribut:Test lot21e longueur` transclut `Dimension longueur`. `Attribut:Test lot21f longueur` transclut `Test lot21f`, comme le montrent `prop=templates` et sa source. `Test lot21f` n'a qu'une révision, celle de la tâche 36, et son bloc n'a jamais porté `micrometre`. Les deux `_CONV` diffèrent donc parce que leurs sources diffèrent, et non parce qu'un retraitement a été manqué. Le rapport de la tâche 42 l'avait établi, à son étape 8 et en écart 1.
- **Test lot21g**, sur `Test lot21e longueur` : six écritures sur sept passent. Seule `204 micrometre` est refusée (`smw_unitnotallowed`), 46 min 57 s après l'ajout de cet alias au bloc, alors que le `_CONV` de la propriété le déclare. Les deux autres écritures sans accent, `millimetre` et `metre`, passent.
- **Test lot21h**, sur `Test lot21f longueur` : même résultat, seule `204 micrometre` est refusée. Ce refus est conforme à son `_CONV`, qui ne déclare pas cet alias.
- **Purge de `Attribut:Test lot21f longueur`** : son `touched` a changé, mais pas son `_CONV`, ni 2 min 9 s après la purge, ni 10 h 38 min 56 s après. La source que la purge relit ne porte pas `micrometre`.
- **Test lot21i**, après la purge : même résultat que Test lot21h.
- Lecture de plus, sans écriture, le 16 à 08:36:06, soit 11 h 34 min 19 s après l'ajout de l'alias : dans un aperçu, `204 micrometre` est encore refusée sur `Test lot21e longueur`, alors que `205 micromètre` y est acceptée.

## Ce qui a été écrit

Trois créations par `bin/wiki-put.sh` avec `--createonly`, une page à la fois :

| Page | Révision | Taille | Horodatage | Résumé de modification |
|---|---|---|---|---|
| `Test lot21g` | création, 1657 | 627 octets | 2026-10-15T21:48:44Z | `[Lot 21][Tâche 43] Page d'essai : sept écritures d'unité sur la propriété qui porte la ligne complétée` |
| `Test lot21h` | création, 1658 | 596 octets | 2026-10-15T21:51:31Z | `[Lot 21][Tâche 43] Page d'essai : les mêmes écritures sur la propriété qui porte encore l'ancienne ligne` |
| `Test lot21i` | création, 1659 | 589 octets | 2026-10-16T08:33:07Z | `[Lot 21][Tâche 43] Page d'essai : les mêmes écritures sur la propriété à l'ancienne ligne, après sa purge` |

Les trois appels ont rendu `"new": true` et `"result": "Success"`. Les trois sources publiées, relues par `bin/wiki-get.sh`, sont **identiques octet pour octet** aux fichiers préparés (`cmp`). Ces fichiers reproduisent le texte de la consigne :
- `Test lot21h` ne diffère de `Test lot21g` que par sa première ligne et par le nom de la propriété dans les sept annotations ;
- `Test lot21i` ne diffère de `Test lot21h` que par sa première ligne.

Les deux points ont été contrôlés par `diff`, puis par une ligne de Python qui refait les remplacements. Le symbole `µ` est le caractère U+00B5 dans les trois fichiers, comme dans les blocs de `Dimension longueur` et de `Test lot21f`.

Une purge, qui n'est pas une écriture : `Attribut:Test lot21f longueur`, le 15 à 21:53:54, par `bin/wiki-purge.sh` (étape 7).

Aucune autre page n'a été écrite ni purgée. Rien n'a été touché sur :
- `Dimension longueur` ;
- les deux propriétés d'essai, en dehors de cette purge ;
- les bacs à sable `Test lot21b` à `Test lot21f` ;
- les quatre propriétés interdites.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas. Les trois pages à créer étaient absentes (`"missing": true`, `protection: []`).

**Étape 3 — dater l'écart.** Faits lus à 21:47:46 et 21:47:47 UTC le 15, sans filtre, tels quels.

`Attribut:Test lot21e longueur` :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : une longueur, pour éprouver la transclusion du bloc de déclaration depuis une page de dimension. Ne pas supprimer sans consigne."]
_CONV -> ['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micrometre, micromètre']
_MDAT -> ['1/2026/10/15/15/27/4/0']
_SKEY -> ['Test lot21e longueur']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['mm, m']
```

`Attribut:Test lot21f longueur` :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : éprouve la transclusion d'un bloc de déclaration protégé par includeonly. Ne pas supprimer sans consigne."]
_CONV -> ['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micromètre']
_MDAT -> ['1/2026/10/15/17/21/47/0']
_SKEY -> ['Test lot21f longueur']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['mm, m']
```

Ces deux sorties sont recopiées de l'affichage de l'étape 3. Chacune a été comparée par `diff` à une relecture ultérieure, et les deux se sont révélées identiques. La première a été relue à 21:54:18. La seconde l'a été à 21:56:03, puis le 16 à 08:32:50.

Les deux `_CONV` ne diffèrent que sur la ligne du micromètre :
- `1000000 µm, um, micron, micrometre, micromètre` pour la première ;
- `1000000 µm, um, micron, micromètre` pour la seconde.

Le type (`_qty`) et les unités d'affichage (`mm, m`) sont les mêmes.

`touched` et transclusions, lus par `action=query&prop=info|templates|revisions` à 21:47:48 :

| Propriété | `touched` | Révisions | Page transcluse |
|---|---|---|---|
| `Attribut:Test lot21e longueur` | `2026-10-15T21:05:04Z` | une seule : 1642, 2026-10-15T15:27:04Z | `Dimension longueur` |
| `Attribut:Test lot21f longueur` | `2026-10-15T17:23:05Z` | une seule : 1645, 2026-10-15T17:21:47Z | `Test lot21f` |

*Datation de l'écart.* L'écart date de la tâche 42.
- `Dimension longueur` a reçu `micrometre` à sa révision 1655, le 15 à 21:01:47.
- Le `touched` de `Attribut:Test lot21e longueur`, 21:05:04, est postérieur à cette révision. Selon le rapport de la tâche 42, son `_CONV` portait la nouvelle ligne dès 21:06:33.
- `Attribut:Test lot21f longueur` ne pouvait pas recevoir cette ligne, car elle ne transclut pas `Dimension longueur`. Sa source, telle quelle :

```
[[Has type::Quantity]]
{{:Test lot21f}}
[[Property_description_FR::Propriété d'essai du lot 21 : éprouve la transclusion d'un bloc de déclaration protégé par includeonly. Ne pas supprimer sans consigne.]]
```

La page qu'elle transclut, `Test lot21f`, n'a qu'une révision, 1644, du 15 à 17:21:40 (tâche 36). Sa source, telle quelle :

```
Page d'essai du lot 21, créée pour éprouver si un bloc de déclaration d'unités placé entre des balises includeonly imbriquées dans onlyinclude s'exécute bien à la transclusion sans s'exécuter sur cette page. Ne pas supprimer sans consigne.

<onlyinclude><includeonly>[[Corresponds to::1 m, metre, mètre]]
[[Corresponds to::1000 mm, millimetre, millimètre]]
[[Corresponds to::1000000 µm, um, micron, micromètre]]
[[Display units::mm, m]]</includeonly></onlyinclude>
```

Chaque `_CONV` reproduit ligne pour ligne le bloc de la page que sa propriété transclut. Comme les deux diffèrent toujours, les étapes 6 et 7 ont eu lieu.

**Étape 4 — essai sur la propriété à jour.** `Test lot21g` a été créée à 21:48:44 (révision 1657).

**Étape 5 — résultat.** Faits lus à 21:50:55, soit 2 min 11 s après l'écriture, tels quels :

```
Test_lot21e_longueur -> ['0.000201', '0.000202', '0.000203', '0.000205', '0.000206', '0.000207']
_ERRC -> ['Test_lot21g#0##_ERR72e9f912c9378b7ae4536ea40b50daf7']
_MDAT -> ['1/2026/10/15/21/48/44/0']
_SKEY -> ['Test lot21g']
```

Détail de la `_ERRC`, lu dans le JSON brut de `smwbrowse` (bloc `sobj`) :

```
Test_lot21g#0##_ERR72e9f912c9378b7ae4536ea40b50daf7 | _ERRP -> ['Test_lot21e_longueur#102##']
Test_lot21g#0##_ERR72e9f912c9378b7ae4536ea40b50daf7 | _ERRT -> ['[2,"smw_unitnotallowed","micrometre"]']
Test_lot21g#0##_ERR72e9f912c9378b7ae4536ea40b50daf7 | _SKEY -> ['Test lot21g# ERR72e9f912c9378b7ae4536ea40b50daf7']
```

Avertissement visible au rendu (`bin/wiki-warnings.sh`), tel quel :

```
=== Test lot21g ===
- « micrometre » n’est pas déclaré comme une unité valide de mesure pour cette propriété.
```

La liste des écritures passées et refusées est plus bas, dans la section « Les trois listes ».

**Étape 6 — essai sur la seconde propriété.** `Test lot21h` a été créée à 21:51:31 (révision 1658). Faits lus à 21:53:39, soit 2 min 8 s après, tels quels :

```
Test_lot21f_longueur -> ['0.000201', '0.000202', '0.000203', '0.000205', '0.000206', '0.000207']
_ERRC -> ['Test_lot21h#0##_ERR65e83f317e8d51292f95cb22909e2c6e']
_MDAT -> ['1/2026/10/15/21/51/31/0']
_SKEY -> ['Test lot21h']
```

```
Test_lot21h#0##_ERR65e83f317e8d51292f95cb22909e2c6e | _ERRP -> ['Test_lot21f_longueur#102##']
Test_lot21h#0##_ERR65e83f317e8d51292f95cb22909e2c6e | _ERRT -> ['[2,"smw_unitnotallowed","micrometre"]']
Test_lot21h#0##_ERR65e83f317e8d51292f95cb22909e2c6e | _SKEY -> ['Test lot21h# ERR65e83f317e8d51292f95cb22909e2c6e']
```

L'avertissement rendu est identique, octet pour octet, à celui de `Test lot21g` : `md5sum` de la ligne d'avertissement, la ligne de titre étant exclue.

**Étape 7 — purger, puis recommencer.**

*Ce que fait `bin/wiki-purge.sh`*, lu en entier avec l'assistant qu'il appelle, `bin/_wiki-csrf.sh` :
- il charge le fichier `.env` s'il le trouve, sinon il exige la variable `WIKI_API`, qui donne l'adresse de l'API ; il exige aussi le fichier de cookies de la session ;
- il refuse tout appel qui n'a pas exactement un argument, la liste des titres ;
- il vérifie que la session est ouverte, par `bin/_wiki-csrf.sh`. Cet assistant fait une lecture GET `action=query&meta=tokens`, et il échoue si l'API est injoignable ou si la session a expiré. Le jeton obtenu n'est pas réutilisé ;
- il envoie une seule requête POST : `action=purge`, `titles=` la liste, `forcelinkupdate=1`, `format=json`, `formatversion=2`. Le fichier de cookies est lu, puis mis à jour par `curl` (`-b` et `-c`), comme pour toute requête de session.

Le script ne contient aucune autre action ni aucun autre paramètre. C'est la purge de MediaWiki :
- elle invalide le cache de rendu des pages nommées ;
- avec `forcelinkupdate=1`, elle refait leur analyse et met à jour leurs tables de liens et leurs autres données secondaires.

Elle ne supprime aucune révision ni aucun contenu, et je l'ai donc exécutée.

Purge lancée à 21:53:54. Réponse, telle quelle :

```
{
    "batchcomplete": true,
    "purge": [
        {
            "ns": 102,
            "title": "Attribut:Test lot21f longueur",
            "purged": true,
            "linkupdate": true
        }
    ]
}
```

*Effet sur le `_CONV`* :

| Heure (UTC) | Délai depuis la purge | `touched` | `_CONV` |
|---|---|---|---|
| 15 octobre, 21:47:47 et 21:47:48 (étape 3) | avant la purge | 17:23:05 | sans `micrometre` |
| 15 octobre, 21:56:03 | 2 min 9 s | **21:53:56** | sans `micrometre` ; faits identiques à ceux de l'étape 3 |
| 16 octobre, 08:32:50 | 10 h 38 min 56 s | 21:53:56 | sans `micrometre` ; faits identiques à ceux de l'étape 3 |

La purge a été prise en compte : le `touched` est passé à 21:53:56, deux secondes après l'appel. Mais le `_CONV` ne porte pas `micrometre`, ni à 2 min, ni à près de 11 h. Il reproduit toujours le bloc de `Test lot21f`, qui ne déclare pas cet alias. Il n'y a donc aucun délai à mesurer, faute d'effet.

La session a été interrompue après la lecture de 21:56:03. Aucune relecture n'a eu lieu entre 2 et 10 min après la purge ; la suivante est celle du 16 à 08:32:50. Voir l'écart 4.

*Test lot21i.* Créée le 16 à 08:33:07 (révision 1659), soit 10 h 39 min 13 s après la purge. Entre la purge et cette écriture, rien n'a été écrit ni purgé sur la propriété : le `touched` est resté à 21:53:56 et les faits sont identiques. Faits de la page lus à 08:35:20, soit 2 min 13 s après, tels quels :

```
Test_lot21f_longueur -> ['0.000201', '0.000202', '0.000203', '0.000205', '0.000206', '0.000207']
_ERRC -> ['Test_lot21i#0##_ERR65e83f317e8d51292f95cb22909e2c6e']
_MDAT -> ['1/2026/10/16/8/33/7/0']
_SKEY -> ['Test lot21i']
```

```
Test_lot21i#0##_ERR65e83f317e8d51292f95cb22909e2c6e | _ERRP -> ['Test_lot21f_longueur#102##']
Test_lot21i#0##_ERR65e83f317e8d51292f95cb22909e2c6e | _ERRT -> ['[2,"smw_unitnotallowed","micrometre"]']
Test_lot21i#0##_ERR65e83f317e8d51292f95cb22909e2c6e | _SKEY -> ['Test lot21i# ERR65e83f317e8d51292f95cb22909e2c6e']
```

L'avertissement rendu est identique, octet pour octet, à celui des deux autres pages.

**Étape 8 — relevé final.** `.claude/settings.local.json` n'existe toujours pas, relevé le 16 à 08:37:09. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Les trois listes

Une écriture est **passée** quand sa valeur figure dans les faits de la page. Elle est **refusée** quand sa valeur en est absente et qu'une `_ERRC` la nomme. Les valeurs sont stockées en mètres.

| Écriture | Valeur attendue (m) | `Test lot21g`, sur `Test lot21e longueur` | `Test lot21h`, sur `Test lot21f longueur` | `Test lot21i`, sur `Test lot21f longueur` purgée |
|---|---|---|---|---|
| `201 µm` (symbole) | 0.000201 | passée | passée | passée |
| `202 um` (alias ASCII) | 0.000202 | passée | passée | passée |
| `203 micron` (alias courant) | 0.000203 | passée | passée | passée |
| `204 micrometre` (libellé anglais) | 0.000204 | **refusée** (`smw_unitnotallowed`) | **refusée** (`smw_unitnotallowed`) | **refusée** (`smw_unitnotallowed`) |
| `205 micromètre` (libellé français) | 0.000205 | passée | passée | passée |
| `0,206 millimetre` (libellé anglais du millimètre) | 0.000206 | passée | passée | passée |
| `0,000207 metre` (libellé anglais du mètre) | 0.000207 | passée | passée | passée |

Chaque page porte une seule `_ERRC`, qui nomme `micrometre` et la propriété de la page.

## Ce que ces mesures établissent, et ce qu'elles n'établissent pas

Ce qui est mesuré :
- Sur chacune des deux propriétés, `millimetre` et `metre`, sans accent, passent à la saisie. `micromètre`, avec accent, passe aussi.
- Sur chacune des deux propriétés, `micrometre` est refusé.
- Sur `Test lot21f longueur`, ce refus est conforme au `_CONV` stocké, qui ne déclare pas `micrometre`.
- Sur `Test lot21e longueur`, ce refus contredit le `_CONV` stocké, qui le déclare. Il est mesuré deux fois :
  - à l'enregistrement d'une page, à 21:48:44, soit 46 min 57 s après l'ajout de l'alias au bloc ;
  - par un aperçu, le 16 à 08:36:06, soit 11 h 34 min 19 s après cet ajout.

  Les aperçus de la tâche 42, qui portaient sur cette même propriété, le montraient déjà jusqu'à 30 min.
- Des sept écritures, `micrometre` est la seule ajoutée au bloc après la création de la propriété. La propriété a été créée à 15:27:04, huit secondes après le bloc (15:26:56) ; l'alias a été ajouté à 21:01:47.

Ce qui n'est pas mesuré :
- La cause du refus sur `Test lot21e longueur`. La purge de l'étape 7 portait sur l'autre propriété et ne dit rien de celle-ci.
- La reconnaissance d'une écriture sur une propriété où elle n'a pas été essayée.

## Contrôles supplémentaires, en lecture seule

- Transclusions des deux propriétés (`prop=templates`).
- Sources de `Attribut:Test lot21f longueur` et de `Test lot21f`.
- Historiques de `Test lot21f` et de `Dimension longueur`. Ce dernier compte quatre révisions : 1641 (15:26:56, tâche 35), 1646 (17:25:34, tâche 36), 1647 (19:16:42, tâche 37) et 1655 (21:01:47, tâche 42).
- Détail des `_ERRC` dans le JSON brut de `smwbrowse`, et avertissements rendus des trois pages (`bin/wiki-warnings.sh`).
- Transcription de cette session : les aperçus `200 micrometre` de la tâche 42 ne nomment que `Test lot21e longueur`. Aucune occurrence de cette écriture n'y nomme `Test lot21f longueur`.
- **Aperçu de saisie sur `Test lot21e longueur`**, le 16 à 08:36:06, sans sauvegarde : `action=parse`, avec `text=` deux annotations, `204 micrometre` puis `205 micromètre` comme témoin. Rendu, tel quel :

```
<div class="mw-parser-output"><p>204 micrometre<span class="smw-highlighter" data-type="4" data-state="inline" data-title="Avertissement" title="« micrometre » n’est pas déclaré comme une unité valide de mesure pour cette propriété."><span class="smwtticon warning"></span><span class="smwttcontent">« micrometre » n’est pas déclaré comme une unité valide de mesure pour cette propriété.</span></span> / <span class="smw-highlighter" data-type="3" data-state="inline" data-title="Conversion d’unité" title="0,205 mm 2,05e-4 m "><span class="smwtext">205 micromètre</span><span class="smwttcontent">0,205&#160;mm &lt;br /&gt;2,05e-4&#160;m &lt;br /&gt;</span></span>
</p></div>
```

`204 micrometre` reste refusée, tandis que `205 micromètre` est convertie (0,205 mm ; 2,05e-4 m). Un premier essai, à 08:35:53, portait un témoin mal encodé ; voir l'écart 5.

## Questions posées hors consigne

Aucune question reçue hors consigne. Les réponses aux points A et B de la tâche 42 figurent en tête de cette consigne. La mesure qu'appelait la réponse A a été faite ; la réponse B ne demandait aucune écriture. Deux questions nouvelles à Cyril, points A et B ci-dessous.

**A.** Contexte : la question se resserre. Les deux `_CONV` diffèrent parce que les deux propriétés ne transcluent pas la même page, et aucun retraitement n'a été manqué. Reste un fait sans explication mesurée. `Test lot21e longueur` est la seule propriété qui transclut `Dimension longueur`. Sur elle, `micrometre` est déclaré dans le `_CONV` stocké, mais il est refusé à la saisie, encore 11 h 34 min après l'ajout de l'alias. Les deux autres libellés sans accent y passent. L'explication vraisemblable, non mesurée, serait une mise en cache des déclarations d'unités que le retraitement par la file n'aurait pas rafraîchie. Si elle se confirmait, un alias ajouté au bloc d'une dimension ne prendrait pas effet à la saisie de lui-même.

Question : faut-il éprouver la purge sur la propriété qui transclut réellement le bloc ?

Suggestion : oui, dans une tâche ultérieure et sur ton autorisation explicite. On purgerait `Attribut:Test lot21e longueur` par `bin/wiki-purge.sh`, on relirait ses faits, puis on créerait une nouvelle page d'essai, `Test lot21j` par exemple, avec les mêmes sept écritures sur cette propriété.
- Si `micrometre` passe, la purge de chaque propriété qui transclut un bloc modifié deviendrait une étape de toute modification de bloc.
- S'il reste refusé, la purge de la propriété ne suffit pas, et la cause est à chercher ailleurs.

Dans les deux cas, le résultat irait dans les *Limites connues* à la clôture du lot. Il éclairerait aussi la réserve de ta réponse B sur la règle de composition.

**B.** Contexte : deux textes dictés, écrits tels quels, sont inexacts pour la seconde propriété.
- Sur `Test lot21h` et `Test lot21i`, la ligne « Libellé anglais, ajouté à la tâche 42 » est fausse pour `Test lot21f longueur`, dont le bloc n'a jamais reçu `micrometre`.
- La première ligne de `Test lot21i` parle de « la propriété en retard ». Or cette propriété n'est pas en retard : son `_CONV` reproduit sa propre source.

Question : faut-il corriger ces deux pages ?

Suggestion : oui, dans la même tâche que A. Par exemple « Libellé anglais, absent de ce bloc » sur les deux pages, et « avec la propriété à l'ancienne ligne, une fois purgée » sur `Test lot21i`.

## Écarts et surprises

1. **Prémisse inexacte, déjà signalée à la tâche 42.** La consigne pose que « deux propriétés transcluent le bloc de Dimension longueur ». Ce n'est pas le cas : `Attribut:Test lot21f longueur` transclut `Test lot21f`. Le rapport de la tâche 42 l'avait établi à son étape 8 (« Ce n'est pas un retraitement manquant ») et en écart 1. J'ai exécuté les étapes telles qu'écrites, puisque leur condition, deux `_CONV` différents, était remplie. Mais l'étape 7 ne pouvait pas faire apparaître `micrometre` : elle a servi de témoin, et non d'épreuve.
2. **L'essai de la tâche 42 portait sur la première propriété.** La réponse A envisage que le refus constaté à la tâche 42 ait porté sur la seconde. Il portait en fait sur `Test lot21e longueur`, comme le confirme la transcription de la session. Le tableau du rapport de la tâche 42 ne nommait pas la propriété, ce qui laissait place au doute : c'est une imprécision de ce rapport.
3. **Deux textes dictés inexacts pour la seconde propriété** ; voir B.
4. **Interruption de la session**, entre la lecture de 21:56:03 le 15 et la reprise le 16 à 08:32:34.
   - La relecture « jusqu'à dix minutes » de l'étape 7 n'a pas pu se faire dans ce délai. La lecture suivante a eu lieu 10 h 38 min 56 s après la purge.
   - `Test lot21i` a été écrite 10 h 39 min 13 s après la purge, au lieu de quelques minutes. Les faits de la propriété, relus juste avant l'écriture (08:32:50), étaient identiques à ceux de l'étape 3 : l'essai a donc porté sur les mêmes déclarations que prévu.
   - En revanche, il a permis de mesurer `Test lot21e longueur` à 11 h 34 min, par l'aperçu complémentaire.
5. **Témoin mal encodé dans le premier aperçu complémentaire.** À 08:35:53, j'ai écrit `micro%C3%A8tre` au lieu de `microm%C3%A8tre`. Le témoin rendu était donc « microètre », et il a été refusé, comme il se devait. J'ai refait l'aperçu à 08:36:06, après avoir décodé la chaîne pour vérifier ce qui partait. Seul ce second aperçu est retenu. Le rendu du premier, tel quel :

```
<div class="mw-parser-output"><p>204 micrometre<span class="smw-highlighter" data-type="4" data-state="inline" data-title="Avertissement" title="« micrometre » n’est pas déclaré comme une unité valide de mesure pour cette propriété."><span class="smwtticon warning"></span><span class="smwttcontent">« micrometre » n’est pas déclaré comme une unité valide de mesure pour cette propriété.</span></span> / 205 microètre<span class="smw-highlighter" data-type="4" data-state="inline" data-title="Avertissement" title="« microètre » n’est pas déclaré comme une unité valide de mesure pour cette propriété."><span class="smwtticon warning"></span><span class="smwttcontent">« microètre » n’est pas déclaré comme une unité valide de mesure pour cette propriété.</span></span>
</p></div>
```

6. **Même identifiant d'erreur sur deux pages.** La `_ERRC` de `Test lot21h` et celle de `Test lot21i` portent le même suffixe, `_ERR65e83f317e8d51292f95cb22909e2c6e`. L'identifiant semble dériver de la propriété et du message, et non de la page. C'est une observation, sans conséquence ici.
7. **Deux commandes contraires aux règles de forme de CLAUDE.md.**
   - Après la création de `Test lot21g`, j'ai écrit `echo "code de sortie : $?"`, alors que la règle exclut toute variable. C'était superflu : la réponse JSON et le code de sortie rendu par l'outil suffisent. Je ne l'ai pas refait ensuite.
   - Pour un premier contrôle des citations de ce rapport, j'ai placé la commande dans le scratchpad par un `cd` suivi d'un `grep`, dans une même commande, alors que la règle n'admet le `cd` que seul. L'environnement a aussitôt remis le répertoire courant à la racine du dépôt. Aucun appel à `bin/` n'a suivi dans ce répertoire. Le contrôle final a été refait sans `cd`, avec des chemins complets.
8. **Lectures faites au-delà de la consigne, toutes sans écriture** :
   - transclusions et historiques ;
   - sources de la seconde propriété et de son bac à sable ;
   - JSON brut des faits ;
   - avertissements rendus ;
   - transcription de la session ;
   - deux aperçus de saisie sur `Test lot21e longueur`.
9. **Outils** : fichiers temporaires dans le scratchpad, et lignes de Python en commande, sans programme du scratchpad. Le rapport a été assemblé par substitution de repères, pour citer octet pour octet les faits, les sources, les erreurs et les rendus.
10. `origin/main` n'avait pas bougé depuis la tâche 42 (`3412d4a`) : aucune avance rapide n'a été nécessaire avant le commit.
