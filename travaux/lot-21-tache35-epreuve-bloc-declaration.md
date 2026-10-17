# Lot 21, tâche 35 — épreuve du bloc de déclaration d'unités

Date : 15 octobre 2026 (horloge UTC du conteneur, 15:25 à 15:40). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## En bref

| Point éprouvé | Résultat |
|---|---|
| Transclusion du bloc depuis une page ordinaire (`{{:Dimension longueur}}`, balises `onlyinclude`) | **Fonctionne.** La propriété reçoit les trois `Corresponds to` et le `Display units`, et la conversion opère. Le repli vers un modèle dédié n'a pas lieu d'être. |
| Annotations parasites sur la page de dimension | **Pas sans effet.** SMW refuse ces déclarations hors d'une page de propriété : 2 `_ERRC` stockés, 4 avertissements au rendu, aucun `_CONV` ni `_UNIT` stocké sur la page. Voir A. |
| Valeur stockée | **Conforme.** `0,2 mm` et `200 µm` donnent la même valeur interne, `0.0002` m. Comme elles sont égales, SMW n'en garde qu'une. Aucun rejet, aucun avertissement. |

## Ce qui a été écrit

Cinq créations par `bin/wiki-put.sh … --createonly`, dans l'ordre de la consigne :

| Page | Résumé de modification | pageid | newrevid | Horodatage |
|---|---|---|---|---|
| `Modèle:Dimension` | `[Lot 21][Tâche 35] Création du modèle des pages de dimension` | 704 | 1639 | 2026-10-15T15:26:45Z |
| `Catégorie:Dimension` (demandée sous `Category:`) | `[Lot 21][Tâche 35] Création de la catégorie des dimensions physiques` | 705 | 1640 | 2026-10-15T15:26:50Z |
| `Dimension longueur` | `[Lot 21][Tâche 35] Création de la page Dimension longueur et de son bloc de déclaration d'unités` | 706 | 1641 | 2026-10-15T15:26:56Z |
| `Attribut:Test lot21e longueur` | `[Lot 21][Tâche 35] Création de la propriété d'essai Test lot21e longueur (Quantity, bloc de déclaration transclus depuis Dimension longueur)` | 707 | 1642 | 2026-10-15T15:27:04Z |
| `Test lot21e` | `[Lot 21][Tâche 35] Création de la page d'essai Test lot21e : une épaisseur saisie en millimètres et en micromètres` | 708 | 1643 | 2026-10-15T15:31:59Z |

Les cinq appels ont rendu `"new": true` et `"result": "Success"`, code de sortie 0.

Contenu : exactement celui de chaque bloc de la consigne. Contrôles avant envoi : 14, 7, 23, 3 et 5 lignes ; 45 accolades ouvrantes et 45 fermantes dans le modèle ; bloc `onlyinclude` en lignes 16 à 19 de `Dimension longueur`, quatre lignes ; le « µ » du bloc et celui de la page d'essai sont tous deux U+00B5 (octets `c2 b5`). Contrôle après coup des quatre premières pages : source relue par `bin/wiki-get.sh` et comparée par `diff` au fichier envoyé ; seule la dernière ligne diffère, par l'absence de saut de ligne final que MediaWiki retire.

Aucune autre page écrite. `Mètre`, `Millimètre` et `Micromètre` n'ont pas été touchées ; les bacs à sable `Test lot21b`, `Test lot21c`, `Test lot21d` et leurs propriétés n'ont été que lus (`Attribut:Test lot21d épaisseur`, témoin).

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas non plus.

**Étape 3 — absence des cinq pages.** Les cinq `"missing": true`. L'API a normalisé `Category:Dimension` en `Catégorie:Dimension`.

**Étapes 4 à 6 — modèle, catégorie, page de dimension.** Voir ci-dessus. `bin/wiki-login.sh` lancé avant : `Success Cywil`. Lecture préalable du témoin `Attribut:Test lot21d épaisseur` : il déclare ses unités par la même syntaxe, `Corresponds to` et `Display units`, écrite directement sur sa page, et ses faits portent `_CONV` et `_UNIT`.

**Étape 7 — propriété d'essai et attente.**

Faits de `Attribut:Test lot21e longueur` :
- 15:27:08 UTC, 4 s après l'écriture : `_CHGPRO` et `_SKEY` seulement ;
- 15:29:28 UTC : toujours `_CHGPRO`. Sa charge, lue dans les mêmes faits, portait déjà les trois `_CONV`, `_UNIT` = `mm, m` et `_TYPE` = `…#_qty` ;
- 15:31:45 UTC : `_CHGPRO` disparue. Faits, tels quels (première ligne tronquée à l'affichage) :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : une longueur, pour éprouver la transclusion du bloc de déclaration depuis une page de dimension. 
_CONV -> ['1 m, metre, mètre', '1000 mm, millimetre, millimètre', '1000000 µm, um, micron, micromètre']
_MDAT -> ['1/2026/10/15/15/27/4/0']
_SKEY -> ['Test lot21e longueur']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['mm, m']
```

**Délai de disparition de `_CHGPRO` : entre 2 min 24 s et 4 min 41 s** après l'écriture (présente à 15:29:28, absente à 15:31:45). Pendant l'attente, aucune requête n'a nommé la propriété et `Test lot21e` n'a pas été écrite ; `bin/wiki-wait-jobs.sh` n'a pas été lancé.

**Faits de `Dimension longueur`**, tels quels, lus à 15:27:08 puis à 15:35:43 UTC, identiques :

```
Main_unit -> ['Mètre#0##']
Preferred_label -> ['Dimension_longueur#0##_MLcbd75d9b208d94361d77be7dfa2e4cf9', 'Dimension_longueur#0##_ML8a1a9268407e2c000f8d8e0e8491deb5']
_ERRC -> ['Dimension_longueur#0##_ERRc479d19c673f1d83de7f816bbd0f204b', 'Dimension_longueur#0##_ERRcb23340515d074745cee1c862291f091']
_INST -> ['Dimension#14##']
_MDAT -> ['1/2026/10/15/15/26/56/0']
_SKEY -> ['Dimension longueur']
```

Les deux sous-objets d'erreur, tels quels :

```
_ERRP -> ['Corresponds_to#102##']
_ERRT -> ['[8,"smw-datavalue-property-restricted-declarative-use","Correspond \\u00e0"]']
_SKEY -> ['Dimension longueur# ERRc479d19c673f1d83de7f816bbd0f204b']
```

```
_ERRP -> ['Display_units#102##']
_ERRT -> ['[8,"smw-datavalue-property-restricted-declarative-use","Unit\\u00e9s de mesure"]']
_SKEY -> ['Dimension longueur# ERRcb23340515d074745cee1c862291f091']
```

**Lecture : le bloc ne laisse aucune annotation `Corresponds to` ni `Display units` sur la page de dimension, mais il y laisse deux erreurs.** SMW les refuse parce que ce sont des propriétés déclaratives, réservées aux pages de propriété ou de catégorie. Il y a une erreur stockée par propriété, et un avertissement par ligne au rendu (voir étape 10). Les autres faits sont ceux attendus du modèle. Par `action=ask`, les libellés sont `longueur`/`fr` et `length`/`en`, et l'unité principale est `Mètre`.

**Étape 8 — la barrière.** Lancée à 15:31:51 UTC, après disparition de `_CHGPRO`. Les trois typeid lus, tels quels :

| Libellé | typeid |
|---|---|
| `Test lot21e longueur` | `_qty` |
| `Test lot21d épaisseur` (témoin Quantity) | `_qty` |
| `Work package status` (témoin Texte) | `_txt` |

Les deux témoins rendent leur type. **`Test lot21e longueur` rend `_qty`, comme le témoin : conforme, barrière franchie.**

**Étape 9 — page d'essai.** Écrite à 15:31:59 UTC, voir ci-dessus.

**Étape 10 — la vérification qui tranche.** Faits de `Test lot21e`, lus à 15:34:06 UTC, deux minutes après l'écriture, tels quels :

```
Test_lot21e_longueur -> ['0.0002']
_MDAT -> ['1/2026/10/15/15/31/59/0']
_SKEY -> ['Test lot21e']
```

Les mêmes, en JSON brut (`action=smwbrowse&browse=subject`) :

```
{"query":{"subject":"Test_lot21e#0##","data":[{"property":"Test_lot21e_longueur","dataitem":[{"type":1,"item":"0.0002"}]},{"property":"_MDAT","dataitem":[{"type":6,"item":"1/2026/10/15/15/31/59/0"}]},{"property":"_SKEY","dataitem":[{"type":2,"item":"Test lot21e"}]}],"serializer":"SMW\\Serializers\\SemanticDataSerializer","version":2},"meta":{"type":"subject"}}
```

Les trois points décisifs :

- **Deux valeurs, égales.** Les faits ne portent qu'**un** élément, `0.0002`, pour deux annotations. Ce n'est pas une perte : SMW range les valeurs d'une propriété en ensemble, et deux saisies de même valeur interne n'y font qu'un élément. Trois constats l'établissent. Aucune des deux saisies n'a été rejetée : pas de `_ERRC` sur la page, aucun avertissement. Le rendu traite chacune séparément, et les deux convertissent vers `2,0e-4 m` (voir plus bas). L'élément stocké vaut exactement cette valeur. **Les deux saisies sont stockées égales ; la conversion fonctionne, y compris depuis le micromètre.**
- **Valeur interne.** `0.0002`, de type numérique (`"type":1`), et par `action=ask` : `{"value":0.0002,"unit":"m"}`. **C'est 0,2 millimètre exprimé en mètres, l'unité principale.**
- **Ni rejet ni avertissement.** `bin/wiki-warnings.sh "Test lot21e"` rend « Aucun avertissement. ». Les faits ne portent pas de `_ERRC`. Les deux infobulles du rendu sont de type « Conversion d'unité » (`data-type="3"`), pas des avertissements.

`bin/wiki-warnings.sh` sur les deux autres pages, pour la question des annotations parasites :
- `Attribut:Test lot21e longueur` : « Aucun avertissement. » ;
- `Dimension longueur` : quatre avertissements, un par ligne du bloc, tels quels :

```
- La propriété « Correspond à » est une propriété déclarative et peut être utilisée seulement sur une page de propriété ou de catégorie.
- La propriété « Correspond à » est une propriété déclarative et peut être utilisée seulement sur une page de propriété ou de catégorie.
- La propriété « Correspond à » est une propriété déclarative et peut être utilisée seulement sur une page de propriété ou de catégorie.
- La propriété « Unités de mesure » est une propriété déclarative et peut être utilisée seulement sur une page de propriété ou de catégorie.
```

**Unité d'affichage constatée.** Rendu HTML de `Test lot21e` (`action=parse&prop=text`), les deux paragraphes concernés, tels quels :

```
<p>Épaisseur saisie en millimètres&#160;: <span class="smw-highlighter" data-type="3" data-state="inline" data-title="Conversion d’unité" title="2,0e-4 m "><span class="smwtext">0,2 mm</span><span class="smwttcontent">2,0e-4&#160;m &lt;br /&gt;</span></span>
</p>

<p>La même saisie en micromètres&#160;: <span class="smw-highlighter" data-type="3" data-state="inline" data-title="Conversion d’unité" title="0,2 mm 2,0e-4 m "><span class="smwtext">200 µm</span><span class="smwttcontent">0,2&#160;mm &lt;br /&gt;2,0e-4&#160;m &lt;br /&gt;</span></span>
</p>
```

- **Sur la page, chaque valeur s'affiche dans l'unité où elle a été saisie** : `0,2 mm` pour la première, `200 µm` pour la seconde. L'infobulle donne les conversions dans les unités d'affichage déclarées : `2,0e-4 m` pour la première, `0,2 mm` puis `2,0e-4 m` pour la seconde.
- **Dans un résultat de requête, la valeur s'affiche en millimètres**, la première unité de `Display units`. Aperçu rendu de `{{#ask:[[Test lot21e]]|?Test lot21e longueur|format=table|mainlabel=-}}`, par `action=parse&text=`, sans sauvegarde : `0,2 mm`, infobulle `2,0e-4 m`.

**Étape 11 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Contrôles supplémentaires, en lecture seule

- **Catégories et liens** : `Modèle:Dimension`, ni catégorie ni lien ; `Catégorie:Dimension`, un lien vers `Modèle:Dimension` ; `Dimension longueur`, la seule catégorie `Catégorie:Dimension`, sans catégorie de suivi malgré ses deux erreurs, et un lien vers `Mètre` ; `Attribut:Test lot21e longueur`, ni catégorie ni lien ; `Test lot21e`, un lien vers `Dimension longueur`. Aucun lien vers une page inexistante.
- **Faits de `Catégorie:Dimension`** : `_MDAT` et `_SKEY` seulement.

## Questions posées hors consigne

Aucune question reçue hors consigne. Une question nouvelle à Cyril, point A ci-dessous.

**A.** Contexte : le bloc écrit entre `onlyinclude` s'exécute aussi sur la page de dimension. SMW y refuse les deux propriétés déclaratives. La page porte donc deux `_ERRC` et quatre avertissements visibles, et chaque page de dimension future en portera autant. Elle entrera dans le contrôle « Erreurs de traitement SMW » (`[[_ERRC::+]]`), qui servira alors moins à repérer les vraies erreurs. Question : garde-t-on ces erreurs comme le prix du bloc lisible sur sa page, ou cherche-t-on à les éviter ? Suggestion : éprouver d'abord, sur un bac à sable, un bloc enveloppé de `<includeonly>` à l'intérieur de `<onlyinclude>`. D'après le fonctionnement de MediaWiki, le contenu serait transclus par la propriété sans être exécuté sur la page de dimension. Mais rien n'en est mesuré ici, et le bloc ne serait plus visible au lecteur de cette page, que son texte invoque. Le repli vers un modèle dédié poserait la même question de lisibilité.

## Écarts et surprises

1. **Les annotations parasites produisent des erreurs, pas des faits.** C'est le principal résultat inattendu ; voir A.
2. **Une seule valeur stockée pour deux saisies.** La consigne attendait deux valeurs stockées égales. Le stockage n'en garde qu'une, précisément parce qu'elles sont égales. Le rendu et l'absence de `_ERRC` établissent que les deux saisies ont été acceptées et converties à l'identique.
3. **Unité d'affichage selon l'endroit.** Le texte de `Dimension longueur` dit que la première unité de la dernière ligne décide de l'unité d'affichage par défaut. C'est vrai dans un résultat de requête, où l'affichage est en millimètres, comme mesuré. Une annotation écrite dans une page s'affiche en revanche dans l'unité saisie, avec les conversions en infobulle. Nuance à porter dans la documentation, sans erreur dans le texte actuel, qui dit « par défaut ».
4. **`bin/wiki-warnings.sh` ne relève que les infobulles « Avertissement ».** Une erreur rendue sous un autre intitulé lui échapperait. D'où le complément par la lecture de `_ERRC` dans les faits. Lors de son premier lancement sur trois pages, une coupure de connexion (`curl: (35) Recv failure: Connection reset by peer`) a privé de résultat la seule `Dimension longueur`. Relancé seul, le script a rendu les quatre avertissements.
5. **Lectures faites au-delà de la consigne, toutes sans écriture** : source et faits du témoin `Attribut:Test lot21d épaisseur` ; contenu des deux sous-objets d'erreur ; charge de `_CHGPRO`, lue dans les faits ; valeur par `action=ask` ; aperçu rendu d'un `#ask` par `action=parse&text=` ; libellés et unité principale de la dimension par `action=ask` ; catégories et liens.
6. **Signe micro.** Le bloc et la saisie emploient tous deux U+00B5, et la saisie `200 µm` est reconnue. Une saisie avec la lettre grecque mu (U+03BC), d'apparence identique, n'a pas été essayée ; rien n'est déclaré pour elle (voir la tâche 32, point 5).
7. `origin/main` n'avait pas bougé depuis la tâche 34 (`ddf8133`) : aucune avance rapide nécessaire avant le commit.
