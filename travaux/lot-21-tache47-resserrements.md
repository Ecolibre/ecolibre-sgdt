# Lot 21, tâche 47 — resserrer trois formulations, rétablir un antécédent, et noter le sens du coefficient chez QUDT et Q2U

Date : 18 octobre 2026 (horloge UTC du conteneur, 20:39 à 20:55). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## En bref

- Les six remplacements ont été faits : cinq sur quatre pages du wiki, et un dans CLAUDE.md. Aucun n'a échoué, chaque chaîne cherchée se trouvant exactement une fois.
- Chaque version publiée est identique octet pour octet à la copie prévue. Les diffs montrent les endroits attendus : deux lignes sur `Attribut:Conversion factor`, et une ligne sur chacune des trois autres pages.
- Sur `Attribut:Conversion factor`, seules les deux descriptions ont changé. Le type, la cardinalité et la portée sont intacts. Le type résolu reste `_num`, comme celui du témoin, et les valeurs des trois unités sont inchangées (1, 1000, 1000000).
- L'affirmation sur Q2U est vérifiée dans le fichier du dépôt : son `coefficient` suit le sens courant, avec 0.001 pour le millimètre. Le même fichier donne 0.0245 pour le pouce, qui vaut 0,0254 m ; voir A. L'affirmation sur QUDT n'a pas été vérifiée.

## Ce qui a été écrit

Quatre écritures par `bin/wiki-put.sh`, sans `--createonly`, une page à la fois :

| Page | Révision | Taille | Horodatage | Résumé de modification |
|---|---|---|---|---|
| `Catégorie:Dimension` (demandée sous `Category:`) | 1664 → 1668 | 2 216 → 2 421 octets | 2026-10-18T20:40:38Z | `[Lot 21][Tâche 47] Resserrement : purge sans effet dans l'immédiat, effet différé non écarté, sans autre intervention de notre part` |
| `Catégorie:Unité` (demandée sous `Category:`) | 1665 → 1669 | 823 → 870 octets | 2026-10-18T20:40:44Z | `[Lot 21][Tâche 47] Antécédent rétabli : le nombre d'unités contenues dans une unité principale` |
| `Attribut:Conversion factor` | 1648 → 1670 | 963 → 1 594 octets | 2026-10-18T20:40:50Z | `[Lot 21][Tâche 47] Descriptions : sens courant chez QUDT et Q2U, équivalence externe à inverser, sens tenant au format du bloc` |
| `Lot 21 — Grandeurs et unités` | 1666 → 1671 | 39 591 → 39 685 octets | 2026-10-18T20:40:55Z | `[Lot 21][Tâche 47] Resserrement : pas acceptée dans l'immédiat, délai de seize à soixante et onze heures dans le seul cas mesuré` |

Les quatre appels ont rendu `"result": "Success"`. Dans le dépôt, seul `CLAUDE.md` a été modifié, en plus de ce rapport.

Aucune autre page n'a été écrite. Rien n'a été touché sur :
- les modèles ;
- les pages d'unité et de dimension, dont le bloc de `Dimension longueur` ;
- les bacs à sable ;
- les quatre propriétés interdites.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide. `origin/main` et la branche locale étaient au même commit, `ee21ec0`.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas.

**Étape 3 — lecture des quatre pages.** Copies gardées dans le scratchpad, hors du dépôt, aux tailles annoncées par l'API. Les quatre pages sont sans protection (`protection: []`), et `intestactions` rend `"edit": true` en session ouverte (`Success Cywil`). Sur la page de propriété, cela montre qu'aucun verrou SMW n'était posé.

| Page | Révision courante | Taille |
|---|---|---|
| `Catégorie:Dimension` | 1664 | 2 216 octets |
| `Catégorie:Unité` | 1665 | 823 octets |
| `Attribut:Conversion factor` | 1648 | 963 octets |
| `Lot 21 — Grandeurs et unités` | 1666 | 39 591 octets |

**Étapes 4 à 7 — remplacements.** Ils ont été faits par un programme Python du scratchpad, `t47-remplacer.py`, affiché en entier avant son lancement. Ce programme ne produit la copie d'une page que si chacune de ses chaînes est trouvée exactement une fois. Il compte aussi les `[[` et les `::` avant et après remplacement.

| Étape | Page | Chaîne cherchée (début) | Occurrences | Ligne |
|---|---|---|---|---|
| 4 | `Catégorie:Dimension` | « une purge n'y changeant rien ; elle a été acceptée… » | 1 | 7 |
| 5 | `Catégorie:Unité` | « Ce nombre est l'inverse du facteur de conversion… » | 1 | 3 |
| 6, premier | `Attribut:Conversion factor` | « Elle est l'inverse du facteur de conversion au sens courant, qui vaudrait 0,001… » | 1 | 2 |
| 6, deuxième | `Attribut:Conversion factor` | « It is the inverse of the conversion factor in the usual sense… » | 1 | 3 |
| 7 | `Lot 21 — Grandeurs et unités` | « et une écriture ajoutée à une ligne du bloc… » | 1 | 31 |

Après les remplacements, aucune chaîne cherchée ne subsiste, et chaque remplacement figure une fois. Le nombre de `[[` et de `::` est le même avant et après sur les quatre pages : aucune annotation ni aucun lien n'ont été ajoutés. **Aucun remplacement n'a échoué.**

**Étape 8 — écriture et comparaison.** Les révisions ont été revérifiées juste avant les écritures, à 20:40:30 : elles n'avaient pas bougé. Les quatre sources publiées, relues par `bin/wiki-get.sh`, sont **identiques octet pour octet** aux copies prévues (`cmp`). Voici les diffs entre chaque copie d'origine et la version publiée, tels quels.

`Catégorie:Dimension`, **un endroit** :

```
7c7
< Une écriture ajoutée à une ligne du bloc après la création d'une propriété qui le transclut n'est pas acceptée tout de suite. Mesuré du 15 au 18 octobre 2026 : elle figurait aussitôt dans les déclarations stockées de la propriété, et restait pourtant refusée à la saisie seize heures après son ajout, une purge n'y changeant rien ; elle a été acceptée entre la seizième et la soixante et onzième heure, sans aucune intervention, sans nouvelle révision de la propriété et sans trace au journal. Il n'y a donc rien à réparer dans ce cas : il faut attendre.
---
> Une écriture ajoutée à une ligne du bloc après la création d'une propriété qui le transclut n'est pas acceptée tout de suite. Mesuré du 15 au 18 octobre 2026 : elle figurait aussitôt dans les déclarations stockées de la propriété, et restait pourtant refusée à la saisie seize heures après son ajout, une purge n'y changeant rien dans l'immédiat ; elle a été acceptée entre la seizième et la soixante et onzième heure, sans autre intervention de notre part, sans nouvelle révision de la propriété et sans trace au journal. La purge ayant précédé l'acceptation, un effet différé de sa part n'est pas écarté, et le journal ne montre ni les travaux de la file, ni ce qui tourne sur le serveur. Il n'y a donc rien à réparer dans ce cas : il faut attendre.
```

`Catégorie:Unité`, **un endroit** :

```
3c3
< Une page d'unité porte le nom développé de l'unité, "Millimètre" et non "mm" : un titre se lit, un symbole se tape. Les champs d'une page d'unité contiennent tous ceux dont une ligne du bloc de déclaration a besoin, et ils s'y recopient dans l'ordre que fixe la [[:Category:Dimension|catégorie Dimension]], à qui le bloc appartient. Ce nombre est l'inverse du facteur de conversion au sens courant : un mètre vaut mille millimètres, et c'est 1000 qui s'écrit, non 0,001.
---
> Une page d'unité porte le nom développé de l'unité, "Millimètre" et non "mm" : un titre se lit, un symbole se tape. Les champs d'une page d'unité contiennent tous ceux dont une ligne du bloc de déclaration a besoin, et ils s'y recopient dans l'ordre que fixe la [[:Category:Dimension|catégorie Dimension]], à qui le bloc appartient. Le nombre d'unités contenues dans une unité principale est l'inverse du facteur de conversion au sens courant : un mètre vaut mille millimètres, et c'est 1000 qui s'écrit, non 0,001.
```

`Attribut:Conversion factor`, **deux endroits**, les lignes 2 et 3. Comme elles se suivent, `diff` les réunit en un seul bloc, `2,3c2,3`. Les lignes 1, 4 et 5 (type, cardinalité, portée) n'apparaissent pas : elles sont inchangées.

```
2,3c2,3
< [[Property_description_FR::Nombre d'unités de celle-ci contenues dans une unité principale de sa dimension : 1000 pour le millimètre, puisqu'un mètre vaut mille millimètres. C'est le sens qu'attend Semantic MediaWiki dans le bloc de déclaration porté par la page de dimension, où cette valeur se recopie telle quelle. Elle est l'inverse du facteur de conversion au sens courant, qui vaudrait 0,001. Nombre pur, sans unité.]]
< [[Property_description_EN::Number of these units contained in one main unit of its dimension: 1000 for the millimetre, since a metre is a thousand millimetres. This is the sense Semantic MediaWiki expects in the declaration block carried by the dimension page, where the value is copied as it stands. It is the inverse of the conversion factor in the usual sense, which would be 0.001. A pure number, with no unit.]]
---
> [[Property_description_FR::Nombre d'unités de celle-ci contenues dans une unité principale de sa dimension : 1000 pour le millimètre, puisqu'un mètre vaut mille millimètres. C'est le sens qu'attend Semantic MediaWiki dans le bloc de déclaration porté par la page de dimension, où cette valeur se recopie telle quelle. Elle est l'inverse du facteur de conversion au sens courant, qui vaudrait 0,001, et c'est ce sens courant qu'emploient QUDT et l'ontologie Q2U : une équivalence externe ne se recopie donc pas, elle s'inverse. Ce sens tient au format du bloc de déclaration de Semantic MediaWiki et non au modèle : hors de cet outil, rien n'empêcherait de revenir au sens courant en inversant les valeurs. Nombre pur, sans unité.]]
> [[Property_description_EN::Number of these units contained in one main unit of its dimension: 1000 for the millimetre, since a metre is a thousand millimetres. This is the sense Semantic MediaWiki expects in the declaration block carried by the dimension page, where the value is copied as it stands. It is the inverse of the conversion factor in the usual sense, which would be 0.001, and that usual sense is the one QUDT and the Q2U ontology use: an external equivalence is therefore not copied but inverted. This sense follows from the format of the Semantic MediaWiki declaration block, not from the model: outside that tool, nothing would prevent returning to the usual sense by inverting the values. A pure number, with no unit.]]
```

`Lot 21 — Grandeurs et unités`, **un endroit** :

```
31c31
< '''Toute unité convertible par un coefficient peut être acceptée, à condition d'être déclarée.''' Une valeur saisie dans une unité dont la conversion n'est pas déclarée n'est pas stockée, et une erreur la signale : le système ne devine jamais un coefficient. Déclarer l'unité, avec le nombre d'unités qu'en contient une unité principale, suffit pour qu'elle soit acceptée et convertie, qu'elle appartienne au SI ou non. Deux réserves mesurées depuis : ce nombre est l'inverse du coefficient au sens courant, mille pour le millimètre et non un millième, et une écriture ajoutée à une ligne du bloc après la création d'une propriété n'est acceptée qu'au bout de plusieurs jours, sans qu'aucune intervention y change rien. Règle posée le 4 octobre 2026 : les documents techniques à reprendre emploient beaucoup d'unités hors du SI, et chacune doit pouvoir s'y ramener. Deux exceptions à la règle du coefficient : les températures, dont le décalage d'origine relève du type Temperature, et les grandeurs logarithmiques comme le décibel, qui n'ont pas de coefficient.
---
> '''Toute unité convertible par un coefficient peut être acceptée, à condition d'être déclarée.''' Une valeur saisie dans une unité dont la conversion n'est pas déclarée n'est pas stockée, et une erreur la signale : le système ne devine jamais un coefficient. Déclarer l'unité, avec le nombre d'unités qu'en contient une unité principale, suffit pour qu'elle soit acceptée et convertie, qu'elle appartienne au SI ou non. Deux réserves mesurées depuis : ce nombre est l'inverse du coefficient au sens courant, mille pour le millimètre et non un millième, et une écriture ajoutée à une ligne du bloc après la création d'une propriété n'est pas acceptée dans l'immédiat : dans le seul cas mesuré, elle l'a été après un délai compris entre seize et soixante et onze heures, sans autre intervention de notre part. Règle posée le 4 octobre 2026 : les documents techniques à reprendre emploient beaucoup d'unités hors du SI, et chacune doit pouvoir s'y ramener. Deux exceptions à la règle du coefficient : les températures, dont le décalage d'origine relève du type Temperature, et les grandeurs logarithmiques comme le décibel, qui n'ont pas de coefficient.
```

**Étape 9 — CLAUDE.md.** Le remplacement a été fait par un second programme Python du scratchpad, `t47-claude.py`, affiché en entier avant son lancement. Les sept lignes cherchées, indentation comprise, ont été trouvées **une fois**, à partir de la ligne 361. Après remplacement, elles ne subsistent plus, et le texte de remplacement figure une fois. Le fichier passe de 833 à 837 lignes. Sortie de `git diff CLAUDE.md`, telle quelle :

```
diff --git a/CLAUDE.md b/CLAUDE.md
index 6b4a0c8..187ec62 100644
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -360,11 +360,15 @@ sur la banque physique est notée ici. À traiter avec le lot de numérotation.
   stockées de la propriété qui transclut le bloc, et reste pourtant refusée à
   la saisie pendant des heures. Mesuré du 15 au 18 octobre 2026 : refusée
   encore seize heures après son ajout, une purge avec `forcelinkupdate` n'y
-  changeant rien, puis acceptée entre la seizième et la soixante et onzième
-  heure sans aucune intervention, sans nouvelle révision de la propriété et
-  sans trace au journal. Ne rien réparer, ne pas réenregistrer la propriété,
-  ne pas conclure à un échec : attendre et remesurer. Le délai exact n'est pas
-  mesuré.
+  changeant rien dans l'immédiat, puis acceptée entre la seizième et la
+  soixante et onzième heure sans autre intervention de notre part, sans
+  nouvelle révision de la propriété et sans trace au journal. La purge ayant
+  précédé l'acceptation, un effet différé de sa part n'est pas écarté, et le
+  journal ne montre ni les travaux de la file, ni ce qui tourne sur le
+  serveur. Ne rien réparer, ne pas réenregistrer la propriété, ne pas conclure
+  à un échec : attendre et remesurer. Le délai exact n'est pas mesuré ; dans
+  le seul cas observé, il était compris entre seize et soixante et onze
+  heures.
 
 - **Un retour à la ligne à l'intérieur de `[[ ]]` casse silencieusement un
   lien MediaWiki.** Aucune erreur d'API à l'écriture, mais le lien est absent
```

`git diff --stat` : `CLAUDE.md | 14 +++++++++-----`, soit 9 insertions et 5 suppressions. `git` garde les deux premières lignes, communes aux deux textes. Les cinq suivantes sont remplacées par neuf.

**Étape 10 — relevé final.** `.claude/settings.local.json` n'existe toujours pas (relevé à 20:42:20). Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Contrôles supplémentaires, en lecture seule

- **`Attribut:Conversion factor`** :
  - les faits, lus à 20:41:53, ne diffèrent de ceux d'avant l'écriture que par les deux descriptions et par `_MDAT` ;
  - `_TYPE` reste `…#_num`, `Property_cardinality` reste `single`, et `Property_range` reste « nombre d'unités par unité principale » ;
  - il n'y a ni `_CHGPRO` ni `_ERRC` ;
  - un `action=ask` lancé à 20:42:02 sur la catégorie des unités rend un type résolu `_num` pour `Conversion factor`, comme pour le témoin `Planting rank`. Il rend aussi les valeurs inchangées : `Mètre` 1, `Millimètre` 1000, `Micromètre` 1000000.
- **Pages de documentation** :
  - `Catégorie:Dimension` et `Catégorie:Unité` ne portent que `_MDAT` et `_SKEY` ;
  - la page du lot porte les mêmes clés qu'à la tâche 46 : faits de lot, requêtes, `_INST` et `_MDAT` ;
  - aucune catégorie de suivi n'est apparue : `Catégorie:Lot` seule sur la page du lot, aucune catégorie sur les trois autres pages ;
  - les liens des deux catégories et de la propriété pointent vers trois cibles, qui existent toutes.
- **Q2U**, lu dans `ontologie/Q2U_Ontology/Q2U_Ontology.owl`. La propriété `coefficient` (domaine `MultipliedAndDividedUnit`) vaut :
  - `0.001` pour le millimètre et `0.01` pour le centimètre, tous deux multiples du mètre ;
  - `60.0` pour la minute et `3600.0` pour l'heure, multiples de la seconde ;
  - `12.0` pour la douzaine.

  C'est le sens courant : un millimètre vaut 0,001 mètre. L'affirmation écrite sur la propriété est donc conforme à ce fichier. Le même fichier donne `0.0245` pour le pouce (`MultipliedAndDividedUnit_1`, multiple du mètre) ; voir A.

## Questions posées hors consigne

Aucune question reçue hors consigne. Les réponses aux points A et B de la tâche 46 figurent en tête de cette consigne et ont été appliquées : formulations reprises, et antécédent rétabli mot pour mot. Une question nouvelle à Cyril, point A ci-dessous.

**A.** Contexte : la description de `Attribut:Conversion factor` fait désormais de Q2U une référence pour les équivalences externes. Elle dit que ces équivalences s'inversent au lieu de se recopier. Or `Q2U_Ontology.owl` donne au pouce un coefficient de `0.0245` mètre, alors que le pouce vaut exactement 0,0254 m. Ce sont vraisemblablement deux chiffres intervertis. Le fichier est déposé tel quel, sans retouche, selon `ontologie/README.md`, et rien dans le dépôt ne signale cette valeur.

Question : faut-il consigner cette erreur, pour qu'aucune équivalence ne la reprenne ?

Suggestion : oui, dans une tâche ultérieure, par une ligne dans `ontologie/README.md`, sans toucher au fichier OWL. Par exemple : « `Q2U_Ontology.owl` donne 0.0245 pour le pouce (`MultipliedAndDividedUnit_1`), alors que le pouce vaut exactement 0,0254 m : valeur à ne pas reprendre. »

## Écarts et surprises

1. **Une erreur dans l'ontologie Q2U** ; voir A. Je l'ai trouvée en vérifiant l'affirmation de la consigne sur le sens du coefficient, ce que la consigne ne demandait pas.
2. **L'affirmation sur QUDT n'a pas été vérifiée.** Aucune copie de QUDT n'est dans le dépôt, et la consigne ne demandait pas de la consulter. Elle est écrite telle que dictée.
3. **Présentation du diff de la propriété** : deux lignes modifiées, réunies par `diff` en un seul bloc parce qu'elles se suivent.
4. **Noms des catégories.** La consigne écrit `Category:Dimension` et `Category:Unité`. J'ai lu et écrit sous les noms français, qui désignent les mêmes pages (identifiants 705 et 700).
5. **Lectures faites au-delà de la consigne, toutes sans écriture** :
   - protections et `intestactions` ;
   - révisions revérifiées avant écriture ;
   - faits de la propriété avant et après l'écriture, et son type résolu ;
   - faits, catégories et liens des pages écrites ;
   - lecture de `ontologie/Q2U_Ontology/Q2U_Ontology.owl` et de `ontologie/README.md`.
6. **Outils** : deux programmes Python du scratchpad, `t47-remplacer.py` et `t47-claude.py`, affichés en entier avant leur lancement, et des fichiers temporaires dans le scratchpad. Le rapport a été assemblé par substitution de repères, pour citer les diffs octet pour octet.
7. `origin/main` n'avait pas bougé depuis la tâche 46 : il était toujours à `ee21ec0` à la vérification de 20:42:20. Aucune intégration n'a été nécessaire avant le commit.
