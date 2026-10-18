# Lot 21, tâche 45 — un réenregistrement de la page de propriété rend-il saisissable une écriture ajoutée au bloc après coup

Date : 18 octobre 2026 (horloge UTC du conteneur, 19:50 à 20:05). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## En bref

- **La question n'a pas pu être éprouvée, car l'écriture passait déjà avant tout réenregistrement.** À l'étape 3, le 18 octobre à 19:50:58, un aperçu accepte `204 micrometre` sur `Test lot21e longueur` et le convertit en 0,204 mm. Comme le prévoit la consigne, l'étape 4 a été sautée : **la page de propriété n'a pas été écrite**.
- **Confirmé sur une écriture enregistrée.** Sur `Test lot21k`, enregistrée à 19:51:53, les sept écritures passent, `404 micrometre` comprise, sans `_ERRC` ni avertissement.
- Le changement a eu lieu entre deux mesures, sans que sa cause soit mesurée :
  - le dernier refus mesuré est celui de `Test lot21j`, le 16 à 13:04:14, soit 16 h 2 min 27 s après l'ajout de l'alias au bloc ;
  - la première acceptation mesurée date du 18 à 19:50:58, soit 70 h 49 min 11 s après cet ajout.
- Entre ces deux instants, la propriété n'a reçu aucune révision, et ses faits sont identiques. Son `touched` est resté celui de la purge de la tâche 44, 2026-10-16T13:01:58Z. Le journal des modifications récentes ne montre aucun changement du wiki sur la période, en dehors de la création de `Test lot21k`.
- Les témoins `Test lot21g` et `Test lot21j` n'ont pas été retraités : ils gardent leur `_ERRC` sur `micrometre`.

## Ce qui a été écrit

| Page | Révision | Taille | Horodatage | Résumé de modification |
|---|---|---|---|---|
| `Test lot21k` | création, 1663 | 679 octets | 2026-10-18T19:51:53Z | `[Lot 21][Tâche 45] Page d'essai : les sept écritures de Test lot21g et Test lot21j sur la même propriété` |

L'appel à `bin/wiki-put.sh --createonly` a rendu `"new": true` et `"result": "Success"`. La source publiée, relue par `bin/wiki-get.sh`, est **identique octet pour octet** au fichier préparé (`cmp`). Ce fichier reproduit le texte de la consigne. Une ligne de Python a vérifié qu'il ne diffère de `Test lot21j` que par sa première ligne et par les nombres, et que `µ` y est le caractère U+00B5. Ses deux liens, vers `Test lot21g` et vers `Test lot21j`, figurent dans `list=backlinks`.

**Aucune écriture sur `Attribut:Test lot21e longueur`** : l'étape 4 a été sautée, comme la consigne le prévoit quand l'écriture passe déjà. Aucune autre page n'a été écrite ni purgée. Rien n'a été touché sur :
- `Dimension longueur` ;
- les témoins `Test lot21g` à `Test lot21j` ;
- les deux phrases du wiki dont nous avons parlé ;
- les quatre propriétés interdites.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas. `Test lot21k` était absente (`"missing": true`, `protection: []`). La propriété était sans protection (`protection: []`), et `intestactions` rendait `"edit": true`, en session ouverte (`Success Cywil`).

**Étape 3 — état avant.** Faits de `Attribut:Test lot21e longueur`, lus à 19:50:48, sans filtre, tels quels :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : une longueur, pour éprouver la transclusion du bloc de déclaration depuis une page de dimension. Ne pas supprimer sans consigne."]
_CONV -> ['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micrometre, micromètre']
_MDAT -> ['1/2026/10/15/15/27/4/0']
_SKEY -> ['Test lot21e longueur']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['mm, m']
```

- `_CONV`, tel quel : `['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micrometre, micromètre']`. Il porte `micrometre`.
- `_TYPE`, tel quel : `['http://semantic-mediawiki.org/swivt/1.0#_qty']`.
- `touched`, lu par `action=query&prop=info` à 19:50:48 : `2026-10-16T13:01:58Z`, celui de la purge de la tâche 44. La propriété n'a qu'une révision, la 1642, et elle transclut `Dimension longueur`.

*Aperçu*, sans enregistrement, lancé à 19:50:58. Le texte est celui de la tâche 44 : `[[Test lot21e longueur::204 micrometre]] / [[Test lot21e longueur::205 micromètre]]`, la seconde annotation servant de témoin. La chaîne a été décodée avant l'envoi. Rendu, tel quel :

```
<div class="mw-parser-output"><p><span class="smw-highlighter" data-type="3" data-state="inline" data-title="Conversion d’unité" title="0,204 mm 2,04e-4 m "><span class="smwtext">204 micrometre</span><span class="smwttcontent">0,204&#160;mm &lt;br /&gt;2,04e-4&#160;m &lt;br /&gt;</span></span> / <span class="smw-highlighter" data-type="3" data-state="inline" data-title="Conversion d’unité" title="0,205 mm 2,05e-4 m "><span class="smwtext">205 micromètre</span><span class="smwttcontent">0,205&#160;mm &lt;br /&gt;2,05e-4&#160;m &lt;br /&gt;</span></span>
</p></div>
```

**L'écriture passe désormais.** `204 micrometre` est convertie (0,204 mm ; 2,04e-4 m), comme le témoin `205 micromètre` (0,205 mm ; 2,05e-4 m). Heure notée : 2026-10-18T19:50:58Z. L'étape 4 a donc été sautée.

Même écriture, même propriété, aux tâches 44 et 45 :

| Heure (UTC) | Délai depuis l'ajout de `micrometre` au bloc (15 octobre, 21:01:47) | Résultat |
|---|---|---|
| 16 octobre, 13:01:45 (tâche 44, aperçu avant la purge) | 15 h 59 min 58 s | `204 micrometre` refusée |
| 16 octobre, 13:04:14 (tâche 44, `Test lot21j` enregistrée après la purge) | 16 h 2 min 27 s | `304 micrometre` refusée |
| 18 octobre, 19:50:58 (tâche 45, aperçu) | 70 h 49 min 11 s | `204 micrometre` **convertie** |
| 18 octobre, 19:51:53 (tâche 45, `Test lot21k` enregistrée) | 70 h 50 min 6 s | `404 micrometre` **stockée** |

**Étape 4 — réenregistrer la propriété.** **Sautée**, selon la consigne. Il n'y a pas de diff, puisque la page n'a pas été écrite. À défaut d'un état « après réenregistrement », voici l'état relu en fin de tâche, à 19:54:57 :
- les faits sont identiques à ceux de l'étape 3 (`diff` vide), donc même `_CONV` et même `_TYPE` ;
- le `touched` est toujours `2026-10-16T13:01:58Z`, et la révision toujours la 1642.

**Étape 5 — refaire les sept écritures.** `Test lot21k` a été créée à 19:51:53 (révision 1663). Faits lus à 19:54:08, soit 2 min 15 s après l'écriture, tels quels :

```
Test_lot21e_longueur -> ['0.000401', '0.000402', '0.000403', '0.000404', '0.000405', '0.000406', '0.000407']
_MDAT -> ['1/2026/10/18/19/51/53/0']
_SKEY -> ['Test lot21k']
```

Aucune `_ERRC`, et le JSON brut de `smwbrowse` ne contient aucun sous-objet. Avertissements rendus (`bin/wiki-warnings.sh`), tels quels :

```
=== Test lot21k ===
Aucun avertissement.
```

Écritures passées et refusées. Une écriture est **passée** quand sa valeur figure dans les faits de la page. Les valeurs sont stockées en mètres. Les deux dernières colonnes rappellent, pour comparaison, les écritures correspondantes des deux témoins, sur la même propriété.

| Écriture sur `Test lot21k` | Valeur attendue (m) | Résultat | `Test lot21g` (tâche 43) | `Test lot21j` (tâche 44, après purge) |
|---|---|---|---|---|
| `401 µm` (symbole) | 0.000401 | passée | passée | passée |
| `402 um` (alias ASCII) | 0.000402 | passée | passée | passée |
| `403 micron` (alias courant) | 0.000403 | passée | passée | passée |
| `404 micrometre` (libellé anglais, ajouté au bloc après la création de la propriété) | 0.000404 | **passée** | refusée | refusée |
| `405 micromètre` (libellé français) | 0.000405 | passée | passée | passée |
| `0,406 millimetre` (libellé anglais du millimètre) | 0.000406 | passée | passée | passée |
| `0,000407 metre` (libellé anglais du mètre) | 0.000407 | passée | passée | passée |

Aucune écriture refusée sur `Test lot21k`.

**Étape 6 — relevé final.** `.claude/settings.local.json` n'existe toujours pas (relevé à 19:54:21). Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Ce que ces mesures établissent

- Sur `Test lot21e longueur`, `micrometre` passe désormais à la saisie, à l'aperçu comme à l'enregistrement.
- Ce changement s'est produit entre le 16 à 13:04:14 et le 18 à 19:50:58. Pendant cet intervalle, il n'y a eu :
  - aucune révision de la propriété ;
  - aucune révision de `Dimension longueur` ;
  - aucun changement des faits stockés de la propriété ;
  - aucune modification du wiki recensée par le journal des modifications récentes.
- Ce journal ne recense ni les purges, ni les travaux de la file, ni l'expiration d'un cache, ni un script lancé sur le serveur. Il ne permet donc pas d'exclure un événement de cette nature.
- Ces mesures ne disent pas ce qui a produit le changement, ni à quel moment de l'intervalle il s'est produit.
- **L'effet d'un réenregistrement de la page de propriété n'a pas été éprouvé** : la question de la tâche reste sans réponse.

## Contrôles supplémentaires, en lecture seule

Faits des deux témoins, lus à 19:55:46, tels quels. `Test lot21g` :

```
Test_lot21e_longueur -> ['0.000201', '0.000202', '0.000203', '0.000205', '0.000206', '0.000207']
_ERRC -> ['Test_lot21g#0##_ERR72e9f912c9378b7ae4536ea40b50daf7']
_MDAT -> ['1/2026/10/15/21/48/44/0']
_SKEY -> ['Test lot21g']
```

`Test lot21j` :

```
Test_lot21e_longueur -> ['0.000301', '0.000302', '0.000303', '0.000305', '0.000306', '0.000307']
_ERRC -> ['Test_lot21j#0##_ERR72e9f912c9378b7ae4536ea40b50daf7']
_MDAT -> ['1/2026/10/16/13/4/14/0']
_SKEY -> ['Test lot21j']
```

Ces faits sont identiques à ceux des tâches 43 et 44 (`diff` vide), et les `touched` n'ont pas changé depuis la création des pages : `Test lot21g` 2026-10-15T21:48:45Z, `Test lot21j` 2026-10-16T13:04:15Z. `Dimension longueur` a toujours pour dernière révision la 1655, avec un `touched` de 2026-10-15T21:01:48Z.

Journal des modifications récentes, tous espaces de noms, du 16 à 13:07:00 jusqu'à la lecture, faite à 19:52 environ (`list=recentchanges`, `rcend=2026-10-16T13:07:00Z`), tel quel :

```
2026-10-18T19:51:53Z | new | Test lot21k | Cywil | [Lot 21][Tâche 45] Page d'essai : les sept écritures de Test lot21g et Test lot21j sur la même propriété
```

## Questions posées hors consigne

Aucune question reçue hors consigne. La réponse au point A de la tâche 44 figure en tête de cette consigne : la correction des deux phrases est différée, et rien n'a été écrit sur ces deux pages. Deux questions nouvelles à Cyril, points A et B ci-dessous.

**A.** Contexte : la restriction à écrire change encore. Elle ne peut être ni « reste refusée », ni « reste refusée tant que la page de propriété n'a pas été réenregistrée ». L'écriture est en effet devenue saisissable sans réenregistrement, ni modification recensée du wiki, à un moment situé entre 16 h et 70 h 49 min après son ajout au bloc.

Question : quelle restriction écrire sur les deux phrases ?

Suggestion : n'écrire que ce qui est mesuré. Par exemple : « Mesuré du 15 au 18 octobre 2026 : une écriture ajoutée au bloc après la création de la propriété qui le transclut figure aussitôt dans les déclarations stockées de cette propriété, mais elle n'est pas aussitôt acceptée à la saisie. Elle était encore refusée 16 h après l'ajout, même après une purge de la propriété, et elle était acceptée 70 h 49 min après, sans réenregistrement ni autre modification du wiki (Test lot21g, Test lot21j, Test lot21k). » Si la règle doit dire combien de temps attendre, il faudrait d'abord mesurer ce délai plus finement, sur un bac à sable : ajouter une écriture à un bloc, puis faire un aperçu à intervalles réguliers, sans purge ni réenregistrement, jusqu'à ce qu'elle passe.

**B.** Contexte : la première ligne de `Test lot21k` a été dictée pour le cas où l'étape 4 a lieu. Elle dit « après réenregistrement de celle-ci ». L'étape 4 ayant été sautée, la page est fausse sur ce point. Je l'ai écrite telle que dictée.

Question : faut-il la corriger ?

Suggestion : oui, dans une tâche ultérieure. On remplacerait « après réenregistrement de celle-ci » par « sans réenregistrement de celle-ci, l'écriture micrometre passant déjà à l'aperçu le 18 octobre 2026 ».

## Écarts et surprises

1. **L'écriture passait avant l'épreuve.** La consigne prévoyait ce cas, et l'étape 4 a été sautée. Pour éprouver un réenregistrement, il faudrait une écriture encore refusée ; il n'y en a plus sur cette propriété.
2. **Première ligne dictée inexacte dans ce cas** ; voir B.
3. **Date du commentaire dicté.** Le commentaire prévu pour l'étape 4 portait « Réenregistrée le 16 octobre 2026 », alors que la tâche a été exécutée le 18. Il aurait été écrit avec une date fausse si l'étape 4 avait eu lieu ; il ne l'a pas été.
4. **`origin/main` avait avancé.** Quatre commits sont arrivés depuis la tâche 44 :
   - `b90ab66`, fichiers OWL de 2017 ;
   - `3a8a23e`, rapport de dépôt ;
   - `e9fbe5f`, fusion de la tâche 44 ;
   - `2a0e5ea`, rapport de fusion et de poussée.

   La branche locale a été avancée sur `2a0e5ea` par avance rapide (`git merge --ff-only`), avant l'écriture du rapport et avec un arbre de travail propre. Aucun fichier de cette tâche n'était concerné.
5. **Les témoins ne sont pas retraités.** `Test lot21g` et `Test lot21j` gardent les faits de leur enregistrement, `_ERRC` comprise. Ils disent qu'une écriture était refusée à leur date, pas qu'elle l'est encore.
6. **Lectures faites au-delà de la consigne, toutes sans écriture** :
   - `intestactions` sur la propriété ;
   - `list=backlinks` des deux pages liées ;
   - faits et `touched` des témoins et de `Dimension longueur` ;
   - journal des modifications récentes ;
   - faits de la propriété en fin de tâche.
7. **Outils** : fichiers temporaires dans le scratchpad, lignes de Python en commande, et aucun programme du scratchpad. Le rapport a été assemblé par substitution de repères, pour citer octet pour octet les faits, les rendus et le journal.
