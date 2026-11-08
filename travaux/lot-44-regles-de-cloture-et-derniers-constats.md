# Lot 44 — deux règles de clôture, leur renvoi, la note sur les fonctions réalisées, et les branches de session dans `CLAUDE.md`

Exécuté le 8 novembre 2026, vers 18 h 05 UTC, dans une session Claude Code
cloud, sur la branche `claude/nifty-einstein-i9t8kk`. Quatre écritures,
trois sur le wiki et une dans le dépôt, toutes réussies du premier coup,
sans arrêt ni question. Les trois vérifications passent ; celle qui tranche,
la première, compte 11 notes avant et 12 après. Dernière écriture de la
série : ce que ce rapport relève est consigné et ne donne lieu à aucun
correctif, selon la règle que l'étape 1 vient d'inscrire.

## Étape 0 — état du dépôt

`git fetch origin`, puis `git status --porcelain` : sortie vide, aucun arrêt.
`HEAD` et `origin/main` au même commit, `a34d594` : rien à mettre à jour.
`.claude/settings.local.json` : absent, au début comme à la fin de la tâche,
donc aucune règle.

Session wiki : `bin/wiki-login.sh` rend `Success Cywil` avant toute lecture.

## Lectures préalables

- Les trois pages ont été lues par `bin/wiki-get.sh`
  (`action=parse&prop=wikitext`), puis de nouveau juste avant chaque
  écriture : identiques. Révisions de départ : Procédure de clôture d'un lot
  1727, Procédure de clôture d'une conversation 1709, Notes en attente de
  rangement 1721. Protections, par
  `prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full` :
  `protection: []` et aucun motif de refus, sur les trois.
- Procédure de clôture d'un lot : « == 3. Ranger chaque trouvaille == »,
  ligne 67, se termine ligne 87, par le paragraphe sur les résumés de
  modification, avant « == 4. Vérifier les points ouverts déclarés == »,
  ligne 89. « == 5. Clore == », ligne 97, ne porte qu'un paragraphe,
  ligne 99. La page se termine par `[[Catégorie:Page de suivi]]`,
  ligne 101.
- Procédure de clôture d'une conversation : l'endroit qui traite du
  rangement des trouvailles est « == 3. Router == », ligne 65, qui envoie
  chaque élément recensé à sa destination. Elle se termine ligne 85, avant
  « == 4. Vérifier avant d'écrire == », ligne 87.
- Notes en attente de rangement : 11 notes de niveau 2. La plus récente,
  « Le séparateur multivalué de Part_of n'a jamais rien séparé », du
  02/11/26, commence ligne 12, après la ligne « Les notes les plus récentes
  sont en haut. » et une ligne vide. Chaque note porte son titre, sa ligne
  d'attribution, puis son texte juste dessous : la forme du bloc fourni. La
  page se termine par `[[Catégorie:Page de suivi]]`.
- `CLAUDE.md` : le paragraphe « Pousser en fin de session » occupe les
  lignes 681 à 703 ; son dernier sous-paragraphe, « Sans cela le travail
  reste invisible… », finit ligne 703, et la puce suivante, « Rapatrier en
  début de tâche », commence ligne 704, sans ligne vide entre les deux.

## Écritures

| N° | Cible | Révision ou commit | Heure (UTC) | Résumé ou message | Outil |
|---|---|---|---|---|---|
| 1 | Procédure de clôture d'un lot | 1727 → 1748 | 18:04:50 | `[Lot 44][Complément] ce qui se corrige, et quand une clôture s'arrête` | `bin/wiki-put.sh` |
| 2 | Procédure de clôture d'une conversation | 1709 → 1749 | 18:05:15 | `[Lot 44][Complément] renvoi aux deux règles de la clôture d'un lot` | `bin/wiki-put.sh` |
| 3 | Notes en attente de rangement | 1721 → 1750 | 18:05:39 | `[Lot 44][Complément] la plupart des items organiques n'ont pas de fonction` | `bin/wiki-put.sh` |
| 4 | `CLAUDE.md` | commit `c1b9aea` | 18:06 | le message de la consigne | outil d'édition de fichier, puis `git commit` |

Les trois écritures du wiki ont rendu `result: Success`, et
`bin/wiki-verify.sh` a rendu `IDENTIQUE` après chacune. Les textes ont été
recopiés tels quels dans des fichiers, puis insérés en se repérant sur les
titres voisins, chaque insertion précédée d'une ligne vide. Les résumés et le
message de commit sont ceux de la consigne, mot pour mot, le message suivi
des deux lignes d'attribution. `git show --stat c1b9aea` : `CLAUDE.md`,
9 insertions, aucune suppression.

Choix faits là où la consigne les laissait :

- **Écriture 1** : les deux ajouts en une seule édition, la consigne donnant
  un seul résumé. L'ajout à la section 5 est placé avant
  `[[Catégorie:Page de suivi]]`, qui reste la dernière ligne de la page.
- **Écriture 2** : le renvoi est à la fin de « 3. Router », pour la raison
  dite plus haut.
- **Écriture 4** : le nouveau sous-paragraphe vient après le dernier
  sous-paragraphe de « Pousser en fin de session », à la même indentation
  de deux espaces, précédé d'une ligne vide, et la puce « Rapatrier »
  reste collée à lui comme elle l'était au précédent.

Un premier calcul de l'écriture 1 s'est arrêté sur une assertion mal placée,
qui visait la troisième ligne au-dessus de la catégorie au lieu de la
quatrième. Rien n'avait été envoyé ; le calcul corrigé est celui qui a été
écrit.

## Les quatre diffs

Les trois diffs du wiki sont calculés sur les états de la page complétés
chacun d'un saut de ligne final, que le wiki ne garde pas, avec une seule
ligne de contexte (`diff -U1`) : les lignes voisines sont de longs
paragraphes inchangés.

### Écriture 1

```diff
--- cloture-lot-1727.txt
+++ cloture-lot-1748.txt
@@ -88,2 +88,10 @@
 
+=== Ce qui se corrige, et ce qui se note ===
+
+Une phrase se corrige si quelqu'un qui agit dessus fait fausse route. Sinon elle se consigne et on avance.
+
+Une date fausse d'un jour dans un motif, un nom de variable, une coquille dans un message de commit : on note, on ne corrige pas. Une propriété décrite au singulier alors qu'elle est multivaluée, un objet de lot qui annonce un travail jamais fait, une page qui décrit une conception abandonnée : on corrige, parce qu'un lecteur en tirerait une action fausse.
+
+Ce critère est né des clôtures des lots 1 à 5, menées du 29 octobre au 7 novembre 2026, qui ont produit une dizaine de tours d'échanges pour des corrections ne changeant aucune décision.
+
 == 4. Vérifier les points ouverts déclarés ==
@@ -100,2 +108,8 @@
 
+=== Une clôture écrit une fois ===
+
+Ce que la vérification des écritures de clôture révèle ne déclenche pas un nouveau tour : il se consigne dans le rapport et part avec la clôture suivante.
+
+Quand aucune clôture ne doit suivre, la dernière d'une conversation par exemple, accumuler reviendrait à jeter : une écriture finale unique rassemble alors ce qui reste, et la série s'arrête là, quoi que révèle sa propre vérification.
+
 [[Catégorie:Page de suivi]]
```

### Écriture 2

```diff
--- cloture-conversation-1709.txt
+++ cloture-conversation-1749.txt
@@ -86,2 +86,4 @@
 
+Les deux règles de la [[Procédure de clôture d'un lot]], « Ce qui se corrige, et ce qui se note » et « Une clôture écrit une fois », valent ici de la même façon.
+
 == 4. Vérifier avant d'écrire ==
```

### Écriture 3

```diff
--- notes-1721.txt
+++ notes-1750.txt
@@ -11,2 +11,6 @@
 
+== Sept items organiques sur dix ne réalisent aucune fonction ==
+''Cyril, le 07/11/26 - clôture des lots 1 à 5''
+Mesuré le 7 novembre 2026 : 49 items organiques, dont 14 portent un <code><nowiki>Realizes_function</nowiki></code> et 35 n'en portent aucun. La chaîne fonctionnel-organique est donc interrompue pour la plupart des items organiques, et une requête sur les fonctions réalisées ne rend que moins d'un tiers du parc. Ce n'est pas un défaut de modèle : les liens n'ont simplement pas été saisis.
+
 == Le séparateur multivalué de Part_of n'a jamais rien séparé ==
```

### Écriture 4

```diff
diff --git a/CLAUDE.md b/CLAUDE.md
index c6f1a6e..c220f90 100644
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -701,6 +701,15 @@ sur la banque physique est notée ici. À traiter avec le lot de numérotation.
   `main`. Un rapport commité sur une branche de session et jamais poussé a
   déjà laissé huit jours une correction d'ontologie hors de `main`, trouvée
   par hasard le 29 octobre 2026.
+
+  **Les branches de session s'accumulent sur `origin` sans que personne les
+  regarde.** Neuf y dormaient au 29 octobre 2026, dont une qui portait depuis
+  huit jours une correction d'ontologie absente de `main`, trouvée par accident
+  en cherchant autre chose. La règle de poussée ci-dessus empêche que cela
+  recommence pour les nouvelles ; elle ne dit rien des anciennes.
+  `git rev-list --count origin/main..<branche>` sur chaque branche distante
+  suffit à les contrôler : tout compte non nul signale du travail que `main`
+  ignore.
 - **Rapatrier en début de tâche, systématiquement, et de nouveau si la
   poussée est refusée.** Avant la première écriture d'une tâche, lancer
   `git fetch origin`, et fusionner `origin/main` si la branche est en
```

## Vérifications

1. **Qui tranche : les Notes en attente de rangement**, relues par
   `action=parse` après l'écriture. **11** notes avant, **12** après : une
   de plus, et une seule. La nouvelle est en tête, et les titres des onze
   autres suivent dans le même ordre. L'introduction est identique au
   caractère près, de même que tout ce qui suit la nouvelle note, c'est-à-dire
   les onze notes antérieures et la fin de page ; entre les deux, il n'y a
   que le bloc fourni et une ligne vide. La page se termine toujours par
   `[[Catégorie:Page de suivi]]`. Elle ne porte, comme sa règle le veut,
   aucune annotation sémantique : seulement `_INST` (`Page de suivi`),
   `_MDAT`, égal à l'heure de la révision 1750, et `_SKEY`.
2. **Les deux procédures.** Sur la procédure de clôture d'un lot, chaque
   ajout figure une fois, le premier à la fin de la section 3, le second à
   la fin de la section 5, avant la catégorie, qui reste la dernière ligne.
   Au rendu, ce sont deux sous-sections de niveau 3, « Ce qui se corrige, et
   ce qui se note » sous « 3. Ranger chaque trouvaille », et « Une clôture
   écrit une fois » sous « 5. Clore ». Sur la procédure de clôture d'une
   conversation, le renvoi figure une fois, à la fin de « 3. Router ». Elle
   ne recopie aucune des cinq phrases des deux règles (0 sur 5), ni aucun de
   quatre fragments cherchés à part : « fait fausse route », « une dizaine
   de tours », « part avec la clôture suivante », « accumuler reviendrait à
   jeter ». Seuls les deux titres de règle y sont cités, entre guillemets,
   dans le renvoi.
3. **Comptes**, par `action=ask` avec `limit=500`, sans suite pour aucun :
   `[[Has type::+]]` **161**, `[[Item_ref::+]]` **118**,
   `[[Realizes_function::+]]` **14**, `[[Category:Organic item]]` **49**.
   Inchangés.

Contrôles complémentaires, non demandés :

- Annotations (`smwbrowse`) : les deux procédures ne portent que `_INST`
  (`Page de suivi`), `_MDAT`, égal à l'heure de leur nouvelle révision, et
  `_SKEY`. Aucun `_ERRC`.
- Catégories : `Catégorie:Page de suivi` seule, sur les trois pages ; aucune
  catégorie de suivi. Liens externes : 0 sur les trois. Liens
  (`generator=links`) : 10 cibles sur les trois pages, aucune inexistante.

## Écarts et surprises

Consignés, sans correctif, selon la règle inscrite à l'étape 1.

- **Le contrôle que décrit le nouveau paragraphe de `CLAUDE.md` rend un
  faux positif sur la seule branche qu'il signale aujourd'hui.** Mesuré le
  8 novembre 2026, après avoir complété l'historique du clone, superficiel
  jusque-là, par `git fetch --unshallow origin` : `origin` porte `main` et
  11 branches de session, deux `ccr-…` et neuf `claude/…`, celle de cette
  session comprise. `git branch -r --no-merged origin/main` n'en rend
  qu'une, `origin/claude/peaceful-turing-dfhp4z`. `git rev-list --count`
  y compte **2** commits, du 21 octobre 2026 : `522ca3b`, « Ontologie :
  Tolerence et fullfil corrigés dans OSE… », et `60d4e4d`, « Rapport :
  correction de l'orthographe des noms d'entités d'OSE ». Ce travail est
  pourtant dans `main`. `git cherry origin/main
  origin/claude/peaceful-turing-dfhp4z` marque les deux commits d'un
  « - », c'est-à-dire qu'un correctif équivalent y figure déjà, et
  `travaux/ontologie-2026-10-21-orthographe-ose.md` y est entré par le
  commit `34ab988`, de même date et de même titre. « Tout compte non nul
  signale du travail que `main` ignore » ne tient donc pas quand le travail
  a rejoint `main` sous d'autres hashes. Il s'agit vraisemblablement de la
  branche trouvée le 29 octobre 2026, dont la correction a été reprise dans
  `main` depuis ; ce n'est pas établi.
- **« Neuf y dormaient au 29 octobre 2026 » n'a pas pu être vérifié** : git
  ne garde pas la date de création d'une branche distante.
- **La note est datée du 07/11/26 et a été écrite le 8 novembre 2026**, vers
  18 h 05 UTC. Ses chiffres datent bien du 7 novembre, mesurés lors de la
  clôture du lot 5 ; ils restent exacts le 8 : 49 items organiques, et
  14 pages portant `Realizes_function`.
- **La consigne écrit « révèlerait »**, forme rectifiée ; l'orthographe
  traditionnelle du wiki écrit « révélerait ». Le mot n'est pas passé sur
  le wiki : les textes écrits n'emploient que « révèle », au présent,
  identique dans les deux orthographes.
