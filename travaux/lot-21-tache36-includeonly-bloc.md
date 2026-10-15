# Lot 21, tâche 36 — protéger le bloc de déclaration contre son exécution locale

Date : 15 octobre 2026 (horloge UTC du conteneur, 17:20 à 17:40). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## En bref

| Point | Résultat |
|---|---|
| Épreuve : `<includeonly>` imbriqué dans `<onlyinclude>` | **Concluante sur les six points.** Rien ne s'exécute sur la page porteuse, et la propriété qui la transclut reçoit les trois déclarations et les unités d'affichage. |
| Correction de `Dimension longueur` | **Faite**, trois remplacements, diff de trois endroits. **Les deux `_ERRC` ont disparu dès la première lecture**, dans la seconde qui a suivi l'écriture. Plus aucun avertissement au rendu. |
| Effet sur la propriété qui transclut le bloc (`Attribut:Test lot21e longueur`) | **Unités conservées.** Mesuré une fois la propriété réellement invalidée, 4 min 29 s après la modification, et non après les deux minutes prévues : voir étape 7 et B. |

## Ce qui a été écrit

Trois écritures sur le wiki, par `bin/wiki-put.sh` :

| Page | Mode | Résumé de modification | pageid | Révision | Horodatage |
|---|---|---|---|---|---|
| `Test lot21f` | `--createonly` | `[Lot 21][Tâche 36] Création du bac à sable Test lot21f : bloc de déclaration entre includeonly imbriqué dans onlyinclude` | 709 | 1644 | 2026-10-15T17:21:40Z |
| `Attribut:Test lot21f longueur` | `--createonly` | `[Lot 21][Tâche 36] Création de la propriété d'essai Test lot21f longueur (Quantity, bloc transclus depuis Test lot21f)` | 710 | 1645 | 2026-10-15T17:21:47Z |
| `Dimension longueur` | réécriture | `[Lot 21][Tâche 36] Bloc de déclaration protégé par includeonly contre son exécution sur la page, et paragraphe qui dit où le lire` | 706 | 1641 → 1646 | 2026-10-15T17:25:34Z |

Les trois appels ont rendu `"result": "Success"`, code de sortie 0. Les deux créations ont rendu `"new": true`.

Aucune autre page écrite. `Attribut:Test lot21e longueur` et `Test lot21e` n'ont été que lus. Leur invalidation à 17:30:03 vient du wiki lui-même, à la suite de la modification de `Dimension longueur`. `Mètre`, `Millimètre`, `Micromètre` et les autres bacs à sable n'ont pas été touchés.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas. `Test lot21f` et `Attribut:Test lot21f longueur` étaient `missing`. Avant toute écriture, j'ai gardé un relevé de référence des faits des trois pages que l'étape 7 compare : `Dimension longueur`, `Attribut:Test lot21e longueur` et `Test lot21e`.

**Étape 3 — bac à sable.** Contenu exactement celui de la consigne : 6 lignes ; balises dans l'ordre, `<onlyinclude><includeonly>` en ligne 3 et `</includeonly></onlyinclude>` en ligne 6 ; « µ » = U+00B5. Source relue après écriture : seule la dernière ligne diffère, par le saut de ligne final que MediaWiki retire.

**Étape 4 — propriété d'essai et attente.** Contenu exactement celui de la consigne, 3 lignes ; même contrôle de la source après écriture. Faits :
- 17:21:51 UTC, 4 s après l'écriture : `_CHGPRO` et `_SKEY`. La charge de `_CHGPRO`, lue dans les mêmes faits, portait déjà les trois `_CONV`, `_UNIT` = `mm, m` et `_TYPE` = `…#_qty` ;
- 17:24:06 UTC : `_CHGPRO` disparue.

Délai de disparition de `_CHGPRO` : entre 4 s et 2 min 19 s. Pendant l'attente, aucune requête n'a nommé la propriété.

**Étape 5 — l'épreuve.** Faits lus à 17:24:19 UTC, tels quels.

`Test lot21f` :

```
_MDAT -> ['1/2026/10/15/17/21/40/0']
_SKEY -> ['Test lot21f']
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

| Page | Point attendu | Constat |
|---|---|---|
| `Test lot21f` | aucun `_ERRC` | oui |
| `Test lot21f` | aucun `_CONV` | oui |
| `Test lot21f` | aucun `_UNIT` | oui : seuls `_MDAT` et `_SKEY` |
| `Attribut:Test lot21f longueur` | `_TYPE` comme `Attribut:Test lot21d épaisseur` | oui : `…#_qty` dans les faits, comme le témoin |
| `Attribut:Test lot21f longueur` | `_CONV`, trois lignes du bloc | oui |
| `Attribut:Test lot21f longueur` | `_UNIT`, unités d'affichage | oui : `mm, m` |

Le fait `_TYPE` ne valant pas lecture du type résolu, j'ai aussi lu celui-ci par `action=ask`, une fois `_CHGPRO` partie. `Test lot21f longueur` rend `_qty`, `Test lot21d épaisseur` `_qty` et `Work package status` `_txt` : les témoins rendent leur type, et la propriété le sien. **Épreuve concluante sur les six points.**

**Étape 6 — correction de `Dimension longueur`.**
- Copie lue dans le scratchpad, hors du dépôt : révision 1641, 1 315 octets, 22 sauts de ligne, aucune protection. Elle est identique au contenu envoyé à la tâche 35, au saut de ligne final près.
- Remplacements faits par un programme Python du scratchpad (`t36-remplacer.py`), affiché en entier avant son lancement. Chaque chaîne cherchée est trouvée **une fois** : en ligne 10, 16 et 19. Après remplacement, aucune chaîne cherchée ne subsiste et chaque remplacement figure une fois. Taille prévue : 1 546 octets.
- Révision revérifiée juste avant l'écriture (17:25:27 UTC) : toujours 1641. `bin/wiki-login.sh` relancé : `Success Cywil`.
- Écriture sans `--createonly` : révision 1646.
- Source publiée relue : 1 546 octets, **identique octet pour octet à la copie modifiée** (`cmp`).
- Diff entre la copie d'origine et la version publiée, tel quel, **trois endroits** :

```
10c10
< Ce bloc est transclus par chaque propriété de grandeur de cette dimension, qui reçoit ainsi la liste complète des unités admises sans la recopier. Il est écrit à la main, une ligne par unité, pour qu'un lecteur voie exactement ce qui sera déclaré.
---
> Ce bloc est transclus par chaque propriété de grandeur de cette dimension, qui reçoit ainsi la liste complète des unités admises sans la recopier. Il est écrit à la main, une ligne par unité, juste sous ce paragraphe. Il n'apparaît pas à l'affichage : des balises l'empêchent de s'exécuter sur cette page, où Semantic MediaWiki refuse les déclarations d'unités et les compterait comme des erreurs. Pour le lire, ouvrir cette page en modification.
16c16
< <onlyinclude>[[Corresponds to::1 m, metre, mètre]]
---
> <onlyinclude><includeonly>[[Corresponds to::1 m, metre, mètre]]
19c19
< [[Display units::mm, m]]</onlyinclude>
---
> [[Display units::mm, m]]</includeonly></onlyinclude>
```

**Étape 7 — la vérification qui tranche.** Faits lus à 17:28:07 UTC, deux minutes et demie après l'écriture, tels quels.

`Dimension longueur` :

```
Main_unit -> ['Mètre#0##']
Preferred_label -> ['Dimension_longueur#0##_MLcbd75d9b208d94361d77be7dfa2e4cf9', 'Dimension_longueur#0##_ML8a1a9268407e2c000f8d8e0e8491deb5']
_INST -> ['Dimension#14##']
_MDAT -> ['1/2026/10/15/17/25/34/0']
_SKEY -> ['Dimension longueur']
```

`Attribut:Test lot21e longueur` :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : une longueur, pour éprouver la transclusion du bloc de déclaration depuis une page de dimension. Ne pas supprimer sans consigne."]
_CONV -> ['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micromètre']
_MDAT -> ['1/2026/10/15/15/27/4/0']
_SKEY -> ['Test lot21e longueur']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['mm, m']
```

`Test lot21e` :

```
Test_lot21e_longueur -> ['0.0002']
_MDAT -> ['1/2026/10/15/15/31/59/0']
_SKEY -> ['Test lot21e']
```

- **`Dimension longueur`** : plus aucun `_ERRC`. `Main_unit`, les deux `Preferred_label` et `_INST` vers `Dimension` sont conservés. Par rapport au relevé de référence, seuls changent la disparition de `_ERRC` et le nouveau `_MDAT`.
- **`Attribut:Test lot21e longueur`** : `_CONV` et `_UNIT` identiques au relevé de référence (`diff` vide).
- **`Test lot21e`** : valeur `0.0002` conservée, identique au relevé de référence.

**Ce relevé de 17:28:07 ne mesurait pas encore l'effet de la modification sur la propriété.** Lu au même moment, le `touched` de `Attribut:Test lot21e longueur` valait `2026-10-15T15:30:04Z`, antérieur à la modification de 17:25:34. La propriété n'avait pas encore été invalidée par le wiki, et la file était estimée à 4 travaux. Ses faits inchangés montraient donc l'état d'avant. J'ai alors :
1. vérifié que la dépendance existe : `prop=templates` montre que la propriété transclut `Dimension longueur` ;
2. fait un aperçu frais du rendu de sa source dans son propre titre (`action=parse`, `title=Attribut:Test lot21e longueur`, `text=` sa source, sans sauvegarde ni cache). Le bloc modifié y donne les trois déclarations et `mm, m`, avec 0 erreur et 0 avertissement ;
3. attendu sans rien forcer, sans purge, en relevant le `touched`. À 17:32:32 UTC, il valait `2026-10-15T17:30:03Z`, **4 min 29 s après la modification**, et la file était estimée à 0 ;
4. relu les faits à 17:32:44 UTC, tels quels :

`Attribut:Test lot21e longueur`, après invalidation :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : une longueur, pour éprouver la transclusion du bloc de déclaration depuis une page de dimension. Ne pas supprimer sans consigne."]
_CONV -> ['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micromètre']
_MDAT -> ['1/2026/10/15/15/27/4/0']
_SKEY -> ['Test lot21e longueur']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['mm, m']
```

`Test lot21e`, au même moment :

```
Test_lot21e_longueur -> ['0.0002']
_MDAT -> ['1/2026/10/15/15/31/59/0']
_SKEY -> ['Test lot21e']
```

Les deux relevés sont identiques à la référence (`diff` vide), et la propriété ne porte pas de `_CHGPRO`. **La propriété qui transclut le bloc garde ses unités après la modification de celui-ci, et la valeur qui l'emploie reste la même.** Une réserve : `touched` atteste l'invalidation, pas en lui-même la mise à jour des données. Mais l'aperçu frais montre qu'un retraitement produit exactement les mêmes déclarations : que la mise à jour ait eu lieu ou non, le résultat est le même.

**Délai de disparition des `_ERRC` sur `Dimension longueur` : nul à la résolution de la mesure.** Ils étaient absents dès la première lecture, lancée dans la seconde qui a suivi l'écriture (17:25:34 UTC, `_MDAT` de la nouvelle révision déjà en place).

**Étape 8 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Contrôles supplémentaires, en lecture seule

- `bin/wiki-warnings.sh` : « Aucun avertissement. » sur `Dimension longueur`, qui en portait quatre à la tâche 35, sur `Test lot21f` et sur `Attribut:Test lot21f longueur`.
- Rendu de `Dimension longueur` : la section « Le bloc de déclaration des unités » montre ses trois paragraphes et plus aucune déclaration (0 occurrence de « Correspond » et de « µm » dans le HTML).
- Catégories et liens : `Dimension longueur`, `Catégorie:Dimension` et un lien vers `Mètre` ; `Test lot21f` et `Attribut:Test lot21f longueur`, ni catégorie ni lien.

## Questions posées hors consigne

Aucune question reçue hors consigne. La réponse au point A de la tâche 35 figure en tête de cette consigne et a été appliquée. Deux questions nouvelles à Cyril, points A et B ci-dessous.

**A.** Contexte : le paragraphe réécrit dit que le bloc est écrit « juste sous ce paragraphe ». Dans la page, deux paragraphes l'en séparent : « Le nombre qui précède chaque symbole… » et « L'ordre de la dernière ligne… ». La consigne n'autorisait aucune autre modification, et le texte a été écrit tel quel. Question : faut-il corriger ces quatre mots ? Suggestion : oui, dans une tâche ultérieure, par un remplacement exact, par exemple « à la fin de cette section ».

**B.** Contexte : l'étape 7 prévoyait deux minutes d'attente avant de lire la propriété qui transclut le bloc. Il en a fallu 4 min 29 s pour que le wiki l'invalide, et ses faits lus à deux minutes et demie montraient l'état d'avant, sans rien en signaler. Question : faut-il inscrire, dans les consignes ou dans CLAUDE.md, qu'une vérification de propagation par transclusion attend d'abord que le `touched` de la page dépendante dépasse l'heure de la modification ? Suggestion : oui. C'est une mesure en une requête (`prop=info`), et sans elle on conclut sur un état ancien.

## Écarts et surprises

1. **Lecture trop précoce prévue à l'étape 7**, corrigée en attendant l'invalidation réelle ; voir étape 7 et B. Sans le relevé du `touched`, j'aurais conclu « unités conservées » sur une propriété qui n'avait pas encore été retraitée.
2. **« Juste sous ce paragraphe »** est inexact dans le texte publié ; voir A.
3. **Lectures faites au-delà de la consigne, toutes sans écriture** : relevé de référence des trois pages ; type résolu de `Test lot21f longueur` par `action=ask` ; `touched`, transclusions et estimation de la file ; aperçu frais du rendu de la propriété ; avertissements, rendu, catégories et liens. Aucune purge n'a été faite : elle aurait forcé le retraitement que l'étape 7 voulait observer de lui-même.
4. **Fichiers temporaires dans le scratchpad**, et non dans `/tmp` : copies de `Dimension longueur` avant, prévue et publiée, diff, relevés de faits, chaînes et programme.
5. **Rapport assemblé par substitution** : les sorties de faits et le diff ont été insérés depuis leurs fichiers par un remplacement de repères, pour être cités octet pour octet.
6. `origin/main` n'avait pas bougé depuis la tâche 35 (`238abea`) : aucune avance rapide nécessaire avant le commit.
