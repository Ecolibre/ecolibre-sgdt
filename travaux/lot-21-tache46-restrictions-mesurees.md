# Lot 21, tâche 46 — restreindre ce qui a été écrit sur le bloc et les unités

Date : 18 octobre 2026 (horloge UTC du conteneur, 20:23 à 20:40). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## En bref

- Les cinq remplacements du wiki ont été faits sur quatre pages, et aucun n'a échoué : chaque chaîne cherchée se trouvait exactement une fois. La puce de CLAUDE.md a été ajoutée : 11 lignes en plus, aucune en moins.
- Chaque version publiée est identique octet pour octet à la copie prévue. Les diffs montrent les endroits attendus : deux sur `Catégorie:Dimension`, un sur chacune des trois autres pages.
- Contrôles après écriture :
  - aucune annotation parasite sur les pages de documentation ;
  - aucune catégorie de suivi apparue ;
  - aucun lien vers une page inexistante ;
  - aucun `[[` ni `{{` ajouté ;
  - `Test lot21k` porte toujours ses sept valeurs, sans `_ERRC`.
- Trois formulations dictées vont au-delà de la mesure ; voir A. Une phrase de `Catégorie:Unité`, écrite à la tâche 41, a perdu son antécédent à la tâche 42 ; voir B.

## Ce qui a été écrit

Quatre écritures, par `bin/wiki-put.sh` sans `--createonly`, une page à la fois :

| Page | Révision | Taille | Horodatage | Résumé de modification |
|---|---|---|---|---|
| `Catégorie:Dimension` (demandée sous `Category:`) | 1654 → 1664 | 1 484 → 2 216 octets | 2026-10-18T20:24:51Z | `[Lot 21][Tâche 46] Restrictions mesurées : équivalence à la saisie, affichage dans un résultat de requête, délai d'acceptation d'une écriture ajoutée au bloc` |
| `Catégorie:Unité` (demandée sous `Category:`) | 1656 → 1665 | 822 → 823 octets | 2026-10-18T20:24:56Z | `[Lot 21][Tâche 46] Restriction : les champs d'une page d'unité contiennent tous ceux dont une ligne du bloc a besoin` |
| `Lot 21 — Grandeurs et unités` | 1638 → 1666 | 39 263 → 39 591 octets | 2026-10-18T20:25:02Z | `[Lot 21][Tâche 46] Règle de déclaration des unités : nombre d'unités par unité principale, et deux réserves mesurées` |
| `Test lot21k` | 1663 → 1667 | 679 → 748 octets | 2026-10-18T20:25:07Z | `[Lot 21][Tâche 46] Correction : sans réenregistrement de la propriété, micrometre passant déjà à l'aperçu le 18 octobre 2026` |

Les quatre appels ont rendu `"result": "Success"`. Dans le dépôt, seul `CLAUDE.md` a été modifié, en plus de ce rapport.

Aucune autre page n'a été écrite. Rien n'a été touché sur :
- les propriétés, les modèles, les pages d'unité et de dimension ;
- le bloc de `Dimension longueur` ;
- les témoins `Test lot21g` à `Test lot21j` ;
- les quatre propriétés interdites.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide. `origin/main` et la branche locale étaient au même commit, `851765c`.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas.

**Étape 3 — lecture des quatre pages.** Copies gardées dans le scratchpad, hors du dépôt, aux tailles annoncées par l'API. Les quatre pages sont sans protection (`protection: []`), et `intestactions` rend `"edit": true` en session ouverte (`Success Cywil`).

| Page | Révision courante | Taille |
|---|---|---|
| `Catégorie:Dimension` | 1654 | 1 484 octets |
| `Catégorie:Unité` | 1656 | 822 octets |
| `Lot 21 — Grandeurs et unités` | 1638 | 39 263 octets |
| `Test lot21k` | 1663 | 679 octets |

**Étapes 4 à 7 — remplacements.** Ils ont été faits par un programme Python du scratchpad, `t46-remplacer.py`, affiché en entier avant son lancement. Ce programme ne produit la copie d'une page que si chacune de ses chaînes est trouvée exactement une fois.

| Étape | Page | Chaîne cherchée (début) | Occurrences | Ligne |
|---|---|---|---|---|
| 4, premier | `Catégorie:Dimension` | « L'ordre va du plus court au plus long ; … » | 1 | 5 |
| 4, deuxième | `Catégorie:Dimension` | « Avec le type Quantity, c'est la première déclarée… » | 1 | 7 |
| 5 | `Catégorie:Unité` | « Les champs d'une page d'unité sont exactement ceux… » | 1 | 3 |
| 6 | `Lot 21 — Grandeurs et unités` | « Déclarer l'unité, avec son coefficient… » | 1 | 31 |
| 7 | `Test lot21k` | « après réenregistrement de celle-ci. » | 1 | 1 |

Après les remplacements, aucune chaîne cherchée ne subsiste, et chaque remplacement figure une fois. **Aucun remplacement n'a échoué.**

**Étape 8 — écriture et comparaison.** Les révisions ont été revérifiées juste avant les écritures, à 20:24:48 : elles n'avaient pas bougé. Les quatre sources publiées, relues par `bin/wiki-get.sh`, sont **identiques octet pour octet** aux copies prévues (`cmp`). Voici les diffs entre chaque copie d'origine et la version publiée, tels quels.

`Catégorie:Dimension`, **deux endroits**. Le paragraphe nouveau est inséré avant la ligne 7, que le second remplacement modifie : `diff` présente l'insertion et cette modification en un seul bloc, `7c7,9`.

```
5c5
< Une ligne du bloc se compose toujours de la même façon, et des seuls champs que porte la page de l'unité : le nombre d'unités contenues dans une unité principale, puis le symbole, puis les alias acceptés à la saisie, puis le libellé anglais, puis le libellé français. Ainsi "1000 mm, millimetre, millimètre", et "1000000 µm, um, micron, micrometre, micromètre". L'ordre va du plus court au plus long ; Semantic MediaWiki tient tout ce qui suit le symbole pour des écritures équivalentes, et c'est le symbole qui s'affiche.
---
> Une ligne du bloc se compose toujours de la même façon, et des seuls champs que porte la page de l'unité : le nombre d'unités contenues dans une unité principale, puis le symbole, puis les alias acceptés à la saisie, puis le libellé anglais, puis le libellé français. Ainsi "1000 mm, millimetre, millimètre", et "1000000 µm, um, micron, micrometre, micromètre". L'ordre va du plus court au plus long ; Semantic MediaWiki tient tout ce qui suit le symbole pour des écritures équivalentes à la saisie, et c'est le symbole qui s'affiche dans un résultat de requête.
7c7,9
< La dernière ligne du bloc fixe les unités d'affichage. Avec le type Quantity, c'est la première déclarée qui s'affiche, et une unité peut être admise à la saisie sans figurer là.
---
> Une écriture ajoutée à une ligne du bloc après la création d'une propriété qui le transclut n'est pas acceptée tout de suite. Mesuré du 15 au 18 octobre 2026 : elle figurait aussitôt dans les déclarations stockées de la propriété, et restait pourtant refusée à la saisie seize heures après son ajout, une purge n'y changeant rien ; elle a été acceptée entre la seizième et la soixante et onzième heure, sans aucune intervention, sans nouvelle révision de la propriété et sans trace au journal. Il n'y a donc rien à réparer dans ce cas : il faut attendre.
> 
> La dernière ligne du bloc fixe les unités d'affichage. Avec le type Quantity, c'est la première déclarée qui s'affiche dans un résultat de requête, une annotation écrite dans une page s'affichant telle qu'elle a été saisie. Une unité peut être admise à la saisie sans figurer là.
```

`Catégorie:Unité`, **un endroit** :

```
3c3
< Une page d'unité porte le nom développé de l'unité, "Millimètre" et non "mm" : un titre se lit, un symbole se tape. Les champs d'une page d'unité sont exactement ceux dont une ligne du bloc de déclaration a besoin, et ils s'y recopient dans l'ordre que fixe la [[:Category:Dimension|catégorie Dimension]], à qui le bloc appartient. Ce nombre est l'inverse du facteur de conversion au sens courant : un mètre vaut mille millimètres, et c'est 1000 qui s'écrit, non 0,001.
---
> Une page d'unité porte le nom développé de l'unité, "Millimètre" et non "mm" : un titre se lit, un symbole se tape. Les champs d'une page d'unité contiennent tous ceux dont une ligne du bloc de déclaration a besoin, et ils s'y recopient dans l'ordre que fixe la [[:Category:Dimension|catégorie Dimension]], à qui le bloc appartient. Ce nombre est l'inverse du facteur de conversion au sens courant : un mètre vaut mille millimètres, et c'est 1000 qui s'écrit, non 0,001.
```

`Lot 21 — Grandeurs et unités`, **un endroit** :

```
31c31
< '''Toute unité convertible par un coefficient peut être acceptée, à condition d'être déclarée.''' Une valeur saisie dans une unité dont la conversion n'est pas déclarée n'est pas stockée, et une erreur la signale : le système ne devine jamais un coefficient. Déclarer l'unité, avec son coefficient vers l'unité principale, suffit pour qu'elle soit acceptée et convertie, qu'elle appartienne au SI ou non. Règle posée le 4 octobre 2026 : les documents techniques à reprendre emploient beaucoup d'unités hors du SI, et chacune doit pouvoir s'y ramener. Deux exceptions à la règle du coefficient : les températures, dont le décalage d'origine relève du type Temperature, et les grandeurs logarithmiques comme le décibel, qui n'ont pas de coefficient.
---
> '''Toute unité convertible par un coefficient peut être acceptée, à condition d'être déclarée.''' Une valeur saisie dans une unité dont la conversion n'est pas déclarée n'est pas stockée, et une erreur la signale : le système ne devine jamais un coefficient. Déclarer l'unité, avec le nombre d'unités qu'en contient une unité principale, suffit pour qu'elle soit acceptée et convertie, qu'elle appartienne au SI ou non. Deux réserves mesurées depuis : ce nombre est l'inverse du coefficient au sens courant, mille pour le millimètre et non un millième, et une écriture ajoutée à une ligne du bloc après la création d'une propriété n'est acceptée qu'au bout de plusieurs jours, sans qu'aucune intervention y change rien. Règle posée le 4 octobre 2026 : les documents techniques à reprendre emploient beaucoup d'unités hors du SI, et chacune doit pouvoir s'y ramener. Deux exceptions à la règle du coefficient : les températures, dont le décalage d'origine relève du type Temperature, et les grandeurs logarithmiques comme le décibel, qui n'ont pas de coefficient.
```

`Test lot21k`, **un endroit** :

```
1c1
< Page d'essai du lot 21 : les mêmes sept écritures que [[Test lot21g]] et [[Test lot21j]], sur la même propriété, après réenregistrement de celle-ci. Ne pas supprimer sans consigne.
---
> Page d'essai du lot 21 : les mêmes sept écritures que [[Test lot21g]] et [[Test lot21j]], sur la même propriété, sans réenregistrement de celle-ci, l'écriture micrometre passant déjà à l'aperçu le 18 octobre 2026. Ne pas supprimer sans consigne.
```

**Étape 9 — CLAUDE.md.** Le remplacement a été fait par un second programme Python du scratchpad, `t46-claude.py`, affiché en entier avant son lancement. La chaîne cherchée a été trouvée **une fois**, en ligne 356 ; après remplacement, elle ne subsiste plus, et le texte de remplacement figure une fois. Le fichier passe de 822 à 833 lignes. Sortie de `git diff CLAUDE.md`, telle quelle :

```
diff --git a/CLAUDE.md b/CLAUDE.md
index 069beb1..6b4a0c8 100644
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -355,6 +355,17 @@ sur la banque physique est notée ici. À traiter avec le lot de numérotation.
   elle ne doit en changer aucun, aucune lecture ne prouve rien, et il faut
   l'écrire au lieu de conclure.
 
+- **Une écriture ajoutée à une ligne d'un bloc de déclaration d'unités n'est
+  pas acceptée tout de suite.** Elle figure aussitôt dans les déclarations
+  stockées de la propriété qui transclut le bloc, et reste pourtant refusée à
+  la saisie pendant des heures. Mesuré du 15 au 18 octobre 2026 : refusée
+  encore seize heures après son ajout, une purge avec `forcelinkupdate` n'y
+  changeant rien, puis acceptée entre la seizième et la soixante et onzième
+  heure sans aucune intervention, sans nouvelle révision de la propriété et
+  sans trace au journal. Ne rien réparer, ne pas réenregistrer la propriété,
+  ne pas conclure à un échec : attendre et remesurer. Le délai exact n'est pas
+  mesuré.
+
 - **Un retour à la ligne à l'intérieur de `[[ ]]` casse silencieusement un
   lien MediaWiki.** Aucune erreur d'API à l'écriture, mais le lien est absent
   de `pagelinks` et donc de `list=backlinks`. Toujours écrire un lien sur une
```

`git diff --stat` : `CLAUDE.md | 11 +++++++++++`, soit 11 insertions et aucune suppression. C'est ce qui était attendu : dix lignes de puce et une ligne vide.

**Étape 10 — relevé final.** `.claude/settings.local.json` n'existe toujours pas (relevé à 20:26:34). Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Contrôles supplémentaires, en lecture seule

- **Faits** (`smwbrowse`), lus à 20:26:08 :
  - `Catégorie:Dimension` et `Catégorie:Unité` ne portent que `_MDAT` et `_SKEY` ;
  - la page du lot porte ses faits de lot (`Work_package_…`), ses requêtes (`_ASK`) et `_INST` = `Lot`, sans aucun fait étranger ;
  - `Test lot21k`, réenregistrée, porte toujours les sept valeurs, de `0.000401` à `0.000407`, sans `_ERRC`.
- **Catégories** (`prop=categories`) : aucune sur les deux catégories ni sur `Test lot21k`, et `Catégorie:Lot` seule sur la page du lot. Aucune catégorie de suivi n'est apparue.
- **Liens** (`generator=links`) de `Catégorie:Dimension`, de `Catégorie:Unité` et de `Test lot21k` : cinq cibles, aucune inexistante.
- **Balisage** : sur chacune des quatre pages, le nombre de `[[` et de `{{` est le même avant et après l'écriture. Aucun lien, aucune annotation et aucun modèle n'ont été ajoutés.

## Questions posées hors consigne

Aucune question reçue hors consigne. Les réponses aux points A et B de la tâche 45 figurent en tête de cette consigne et ont été appliquées : restrictions écrites telles que dictées, et correction de `Test lot21k` reprise mot pour mot. Deux questions nouvelles à Cyril, points A et B ci-dessous.

**A.** Contexte : trois formulations dictées, écrites telles quelles, vont au-delà de la mesure.
1. « une purge n'y changeant rien » (`Catégorie:Dimension`, CLAUDE.md) et « sans qu'aucune intervention y change rien » (page du lot). L'effet de la purge n'a été mesuré que dans les minutes qui l'ont suivie : `Test lot21j` a été enregistrée 2 min 19 s après. Or la purge, faite à la seizième heure, a précédé l'acceptation. Un effet différé de la purge n'est ni mesuré ni exclu.
2. « sans aucune intervention » (`Catégorie:Dimension`, CLAUDE.md). Ce qui est mesuré : aucune action de notre part après la purge, aucune révision, aucune trace au journal. Le rapport de la tâche 45 notait que le journal ne recense ni les purges, ni les travaux de la file, ni l'expiration d'un cache, ni un script lancé sur le serveur.
3. « n'est acceptée qu'au bout de plusieurs jours » (page du lot). Ce qui est mesuré : l'acceptation a eu lieu entre la seizième et la soixante et onzième heure, donc peut-être en moins d'un jour. La formulation diffère aussi de celle de `Catégorie:Dimension`.

Question : faut-il resserrer ces formulations ?

Suggestion : oui, dans une tâche ultérieure :
- « une purge n'y changeant rien dans l'immédiat » ;
- « sans autre intervention de notre part » ;
- sur la page du lot, « n'est acceptée qu'après un délai, compris entre seize et soixante et onze heures dans le cas mesuré ».

**B.** Contexte : sur `Catégorie:Unité`, la phrase « Ce nombre est l'inverse du facteur de conversion au sens courant […] », écrite à la tâche 41, n'a plus d'antécédent. Le « nombre » dont elle parle était nommé dans la phrase précédente, que la tâche 42 a remplacée. Le diff de l'étape 8 le montre : cette phrase suit maintenant « à qui le bloc appartient ».

Question : faut-il la corriger ?

Suggestion : oui, à la même occasion que A, en remplaçant « Ce nombre est l'inverse » par « Le nombre d'unités contenues dans une unité principale est l'inverse ».

## Écarts et surprises

1. **Formulations dictées plus larges que la mesure** ; voir A.
2. **Phrase sans antécédent sur `Catégorie:Unité`**, depuis la tâche 42 ; voir B. Elle m'avait échappé à la tâche 42, qui l'a produite. Je l'ai vue en relisant le diff de l'étape 8.
3. **Décompte de la consigne.** Le contexte annonce « Six remplacements sur quatre pages du wiki, et une puce ajoutée dans CLAUDE.md ». Les étapes en décrivent cinq sur le wiki, deux, un, un et un, plus celui de CLAUDE.md : six en tout. Tous ont été faits.
4. **Noms des catégories.** La consigne écrit `Category:Dimension` et `Category:Unité`. J'ai lu et écrit sous les noms français, `Catégorie:Dimension` et `Catégorie:Unité` : ce sont les mêmes pages (identifiants 705 et 700).
5. **Une requête mal formée de ma part.** Le premier relevé des catégories a échoué : `clshow=hidden|!hidden` combine deux valeurs exclusives. Je l'ai relancé sans ce paramètre, qui rend de toute façon toutes les catégories par défaut.
6. **Lectures faites au-delà de la consigne, toutes sans écriture** :
   - protections et `intestactions` ;
   - révisions revérifiées avant écriture ;
   - faits, catégories et liens des pages écrites ;
   - comptes de balisage.
7. **Outils** : deux programmes Python du scratchpad, `t46-remplacer.py` et `t46-claude.py`, affichés en entier avant leur lancement, et des fichiers temporaires dans le scratchpad. Le rapport a été assemblé par substitution de repères, pour citer les diffs octet pour octet.
8. `origin/main` n'avait pas bougé depuis la tâche 45 : il était encore à `851765c` à la vérification de 20:26:34. Aucune intégration n'a été nécessaire avant le commit.
