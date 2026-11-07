# Lot 4 — clôture : arbitrages et écart consignés, circulation entre wikis portée au lot 40, extraction du module consignée, état clos

Exécuté le 7 novembre 2026, dans une session Claude Code cloud, sur la
branche `claude/nifty-einstein-i9t8kk`. Quatre écritures sur le wiki, sur
trois pages, toutes réussies du premier coup, après un arrêt avant écriture
et quatre réponses de Cyril. Les quatre vérifications passent ; celle qui
tranche, la troisième, rend 75, 76 et 0. L'index des lots n'a suivi qu'après
purge.

## Étape 0 — état du dépôt

`git fetch origin`, puis `git status --porcelain` : sortie vide, aucun arrêt,
aux deux passages, au début puis à la reprise après l'échange. `HEAD` et
`origin/main` au même commit, `7659361`, les deux fois : rien à mettre à
jour. Le clone est superficiel (`git rev-parse --is-shallow-repository` rend
`true`) : aucune conclusion n'a été tirée de `git log` dans cette tâche.
`.claude/settings.local.json` : absent au début, à la reprise et à la fin de
la tâche, donc aucune règle.

Session wiki : `bin/wiki-login.sh` rend `Success Cywil` au début, puis de
nouveau à la reprise, avant la première écriture.

## Arrêt avant écriture, et échanges par le canal direct

Quatre points ont été soumis à Cyril avant toute écriture :

- **A** : la dernière phrase du texte de l'étape 3, « Le module normalise la
  casse par `mw.text.trim(clean):upper()` depuis le lot 6, mais l'extraction
  n'a pas changé », est démentie par l'historique de `Module:Base36`. Le
  module n'a que trois révisions, 162 du 3 avril 2026, 235 et 237 du 7 avril
  2026 ; la normalisation de la casse apparaît à la révision 235, en même
  temps que l'extraction, et le module n'a plus été modifié depuis.
- **B** : le même texte disait « qui emploie `clean:match("[%w]+")` à deux
  endroits ». La chaîne exacte n'y figure qu'une fois, dans `p.next`, ligne
  13 ; dans `p.findGaps`, ligne 60, c'est `clean_ref:match("[%w]+")`.
- **C** : la section « Points ouverts » du lot 40 est une liste à puces de
  trois éléments ; le texte fourni à l'étape 2 était un paragraphe, qui serait
  venu après la liste, hors d'elle.
- **D** : le texte de l'étape 1 disait « dépendent d'un réglage serveur que
  personne ne peut modifier », là où le rapport de la phase 3 du lot 4
  écrivait « que personne ne peut modifier avant le retour de l'adminsys » ;
  selon `demandes-adminsys.md`, le réglage relève de l'adminsys.

Réponse de Cyril, recopiée telle quelle :

```text
A. Remplacé. Dans l'entrée de l'étape 3, remplace la dernière phrase par la
tienne :

Le module normalise aussi la casse, par <code><nowiki>mw.text.trim(clean):upper()</nowiki></code> ; extraction et normalisation datent toutes deux de sa révision du 7 avril 2026, et il n'a pas été modifié depuis.

B. Précisé. Dans la même entrée, remplace :

qui emploie <code><nowiki>clean:match("[%w]+")</nowiki></code> à deux endroits

par :

qui emploie <code><nowiki>:match("[%w]+")</nowiki></code> à deux endroits, dans <code><nowiki>p.next</nowiki></code> et dans <code><nowiki>p.findGaps</nowiki></code>

C. Quatrième puce, et au format de ses voisines. Les trois puces
existantes ne sont pas en gras ; la mienne l'était. Remplace entièrement le
texte de l'étape 2 par celui-ci, à ajouter en quatrième puce de la liste :

* Comment un exemplaire passe du wiki qui le détient au wiki central : copie manuelle, export et import de pages, ou transclusion inter-wikis. Le [[Lot 4 — Numérotation des items physiques|lot 4]] a garanti que la référence d'inventaire survit au déplacement, pas la façon de déplacer. Question distincte du portage du modèle et postérieure à lui : elle se pose une fois CWL en service avec son propre inventaire. Relevée lors de la clôture du lot 4.

D. Remplacé. Dans l'étape 1, section des options écartées, remplace :

que personne ne peut modifier

par :

qui relève de l'administrateur système

Les quatre résumés, les vérifications et le rapport sont inchangés.
Exécute les quatre étapes dans l'ordre.
```

Les remplacements A, B et D ont été appliqués par substitution exacte des
chaînes données, et le texte C recopié entier. Les textes écrits sont ceux
de la consigne, modifiés par ces quatre réponses et par elles seules.

## Lectures et mesures préalables

- Les trois pages ont été lues par `bin/wiki-get.sh`
  (`action=parse&prop=wikitext`) avant l'échange, puis de nouveau juste avant
  chaque écriture : identiques. Révisions de départ : lot 4 1349, lot 40
  1496, Limites connues 1734. Protections, par
  `prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full` :
  `protection: []` et aucun motif de refus, sur les trois.
- Ancrages : la page du lot 4 ne porte que l'appel de modèle, terminé par
  `}}` ; `|Work_package_status=livré` y figure une fois, et
  `|Work_package_delivery_date=2026-07-26` est suivi directement de
  `|Work_package_closure_report=`, sans `Work_package_closure_date`. La
  section « Points ouverts » du lot 40 occupe les lignes 38 à 42, trois
  puces, ligne 43 vide, « == Dépendances == » ligne 44. Les Limites connues
  comptent 75 entrées, la liste finit la page et son commentaire garde-fou la
  précède.
- Tirets des titres : U+2014 dans les deux titres de lot, et une seule
  occurrence dans le texte de l'étape 2, U+2014 elle aussi.
- Faits sur lesquels reposent les textes, vérifiés avant d'écrire :
  - étape 1 : les trois arbitrages figurent dans
    `travaux/ecolibre-sgdt-lot4-rev2.md`, en-tête et §1 (volumétrie,
    autonomie des partenaires, code de site donnée de l'item, préfixe du wiki
    simple valeur par défaut, `Inventory_ref` composé par le modèle), et
    l'écart dans `travaux/ecolibre-sgdt-lot4-phase3.md`, §0 ; les deux sont
    datés du 26 juillet 2026. `Modèle:Physical item` porte toujours
    `|Inventory_site={{{site_code|}}}`, `|Inventory_number={{{ref_number|}}}`
    et `|Inventory_ref={{{site_code|}}}-{{{ref_number|}}}`, et
    `Formulaire:Physical item` pré-remplit `site_code` par `{{Préfixe site}}` ;
  - les fonctions de chaîne de ParserFunctions sont toujours désactivées :
    `meta=siteinfo&siprop=functionhooks` rend 110 fonctions, parmi lesquelles
    ni `sub`, ni `len`, ni `pos`, ni `replace`, ni `explode`, et
    `{{#sub:ECL-0001|4}}` ressort tel quel par `action=expandtemplates` ;
  - étape 2 : `travaux/ecolibre-sgdt-lot4-rev2.md`, §5, laissait ouverte la
    question du mécanisme de publication d'un exemplaire d'un wiki vers un
    autre ; celle du portage du modèle est la deuxième puce des « Points
    ouverts » du lot 40 ;
  - étape 3 : `Module:Base36` lu en entier, 101 lignes. L'extraction est
    ligne 13 dans `p.next` (`clean = clean:match("[%w]+") or ""`) et ligne 60
    dans `p.findGaps` (`clean_ref = clean_ref:match("[%w]+")`), la
    normalisation de la casse lignes 15 et 59. Mesuré par
    `action=expandtemplates`, qui n'enregistre rien :
    `{{#invoke:Base36|next|ECL-0001}}` rend `0ECM`,
    `{{#invoke:Base36|next|0001}}` rend `0002`, et
    `{{#invoke:Base36|findGaps|A-0001}}` rend `0001` à `0009`, sans erreur
    dans aucun cas. `ECL` vaut 18 597 en base 36, et son successeur, 18 598,
    s'écrit `ECM` ;
  - historique de `Module:Base36` : 162 (2026-04-03T20:24:37Z, création),
    235 (2026-04-07T16:07:11Z) et 237 (2026-04-07T16:15:52Z, révision
    courante). La 162 ne porte ni `match` ni `upper` ; la 235 introduit les
    deux ; la 237 ajoute `p.findGaps`. Le rapport de la phase 2 du lot 4,
    `travaux/rapport-2026-07-26.md`, §2.3, lisait déjà la normalisation le
    26 juillet 2026, et la page du lot 6 cite la consigne de ses rapports :
    « ne pas toucher à Module:Base36 ni à Item_ref » ;
  - appelants du module : sept pages, qui lui passent toutes une valeur de
    numérotation, jamais une référence. Les formulaires des items
    fonctionnels, organiques et référencés lui passent `Item_ref`, celui des
    items physiques `Inventory_number`, filtré sur `{{Préfixe site}}`, et
    celui des lieux `Location_number`, filtré sur `{{Préfixe lieu}}`. Les
    deux modèles d'audit, `Modèle:Item numbering audit` et
    `Modèle:Inventory numbering audit`, lui passent `Item_ref` et
    `Inventory_number`. Les valeurs stockées sont toutes alphanumériques et
    en majuscules : 118 `Item_ref`, 50 `Inventory_number`, 15
    `Location_number` ;
  - le fait n'était pas déjà aux Limites connues : les entrées 11, 40, 58 et
    69 citent le module ou la séquence, aucune l'extraction. Il figure en
    revanche au Récapitulatif technique, comme motif de la valeur stockée non
    préfixée : voir les constats.
- Comptes de départ, par `action=ask` avec `limit=500`, sans suite pour
  aucun : `[[Has type::+]]` 161, `[[Item_ref::+]]` 118,
  `[[Inventory_number::+]]` 50, `[[Category:Physical item]]` 50.
  `prop=extlinks` sur les Limites connues : 0. Index : le lot 4 en
  « livré » ; 45 lots, 3 en cours, 17 faits, 25 à venir, 0 abandonné.

## Écritures

| Étape | Page | Révision | Heure (UTC) | Résumé | Outil |
|---|---|---|---|---|---|
| 1 | Lot 4 — Numérotation des items physiques | 1349 → 1735 | 15:43:14 | `[Lot 44][Clôture du lot 4] arbitrages et écart consignés` | `bin/wiki-put.sh` |
| 2 | Lot 40 — Wiki privé CWL | 1496 → 1736 | 15:43:36 | `[Lot 44][Clôture du lot 4] circulation d'un exemplaire entre wikis portée au lot 40` | `bin/wiki-put.sh` |
| 3 | Limites connues du Système de Gestion de Données Techniques | 1734 → 1737 | 15:43:55 | `[Lot 44][Clôture du lot 4] extraction alphanumérique du module de numérotation` | `bin/wiki-append.sh` |
| 4 | Lot 4 — Numérotation des items physiques | 1735 → 1738 | 15:44:17 | `[Lot 44][Clôture du lot 4] état clos au 7 novembre 2026` | `bin/wiki-put.sh` |

Les quatre ont rendu `result: Success`, et `bin/wiki-verify.sh` a rendu
`IDENTIQUE` après chacune ; pour l'étape 3, la comparaison s'est faite avec
la page relue juste avant l'ajout, suivie du texte ajouté.
`bin/wiki-append.sh`, employé comme pour l'entrée 75 parce que la liste
finit la page, a passé son pré-contrôle (75 entrées, la liste finit la page)
et ses deux post-contrôles (75 → 76, l'ajout est la dernière entrée ; au
rendu, une seule liste numérotée). Les quatre résumés sont ceux de la
consigne, mot pour mot.

## Les quatre diffs

### Étape 1

```diff
--- lot4-1349.txt
+++ lot4-1735.txt
@@ -6,4 +6,16 @@
 |Work_package_delivery_date=2026-07-26
 |Work_package_closure_report=https://github.com/Ecolibre/ecolibre-sgdt/blob/3a0e7af4e6b4d2e0ade4e1d645d568311e04afad/travaux/ecolibre-sgdt-lot4-phase3.md,https://github.com/Ecolibre/ecolibre-sgdt/blob/3a0e7af4e6b4d2e0ade4e1d645d568311e04afad/travaux/ecolibre-sgdt-lot4-rev2.md
 |Work_package_produces=Modèle:Préfixe site,Registre des préfixes de site
-}}
\ No newline at end of file
+}}
+
+== Ce qui est déjà tranché ==
+
+'''La séquence d'inventaire est séparée de la séquence de conception.''' Motif : un exemplaire se compte par dizaines là où une fonction se compte par unités, et les faire partager une séquence de quatre caractères reviendrait à l'épuiser pour de l'inventaire au détriment du savoir de conception. Second motif : chaque partenaire doit pouvoir numéroter son inventaire sans demander à personne si un numéro est libre. Décidé le 26 juillet 2026.
+
+'''Le code de site est une donnée de l'item, jamais une propriété du wiki qui l'héberge.''' Motif : un exemplaire peut être publié sur un wiki qui n'est pas celui de son détenteur, et il doit y garder sa référence. Le préfixe du wiki ne sert que de valeur par défaut à la création. C'est une révision de la première version de ce lot, qui faisait l'inverse et aurait réétiqueté tout exemplaire republié. Décidé le 26 juillet 2026.
+
+'''Le modèle compose <code><nowiki>Inventory_ref</nowiki></code> à partir du code de site et du numéro, stockés séparément.''' Motif : deux champs qui portent la même information ne peuvent pas diverger si l'un est dérivé de l'autre. Et le module de numérotation ne voit ainsi jamais de référence préfixée, ce qui lui ferait rendre un résultat faux sans erreur. Décidé le 26 juillet 2026.
+
+== Ce qui est écarté, et pourquoi ==
+
+'''Isoler le numéro d'une référence préfixée par <code><nowiki>{{#sub:}}</nowiki></code>.''' Motif : les fonctions de chaîne de ParserFunctions sont désactivées par défaut et dépendent d'un réglage serveur qui relève de l'administrateur système. Et même disponibles, elles feraient reposer la numérotation sur un découpage à position fixe, qui casserait le jour où un code de site ferait deux ou quatre lettres. Remplacé par le stockage du numéro à part. Écarté le 26 juillet 2026.
```

### Étape 2

```diff
--- lot40-1496.txt
+++ lot40-1736.txt
@@ -40,6 +40,7 @@
 * La machine hôte : la tour, ou le troisième poste, qui peut rester allumé et serait atteint par le réseau local depuis une session lancée sur la tour.
 * Comment le modèle se porte : export et import de pages, ou réécriture depuis le dépôt.
 * Si le préfixe CWL se configure, ou s'il reste un affichage comme ECL l'est aujourd'hui.
+* Comment un exemplaire passe du wiki qui le détient au wiki central : copie manuelle, export et import de pages, ou transclusion inter-wikis. Le [[Lot 4 — Numérotation des items physiques|lot 4]] a garanti que la référence d'inventaire survit au déplacement, pas la façon de déplacer. Question distincte du portage du modèle et postérieure à lui : elle se pose une fois CWL en service avec son propre inventaire. Relevée lors de la clôture du lot 4.
 
 == Dépendances ==
 
```

### Étape 3

Diff sans lignes de contexte (`diff -U0`), calculé sur les deux états de la
page complétés chacun d'un saut de ligne final : l'ajout ne touche aucune
autre ligne, et sans ce saut de ligne l'entrée 75 paraîtrait retirée puis
rajoutée.

```diff
--- limites-1734.txt
+++ limites-1737.txt
@@ -102,0 +103 @@
+# '''Le module de numérotation Base 36 extrait sa valeur par une correspondance alphanumérique, qui s'arrête au premier caractère non alphanumérique.''' Mesuré le 7 novembre 2026 sur <code>Module:Base36</code>, qui emploie <code><nowiki>:match("[%w]+")</nowiki></code> à deux endroits, dans <code><nowiki>p.next</nowiki></code> et dans <code><nowiki>p.findGaps</nowiki></code>. Une référence préfixée comme <code><nowiki>ECL-0001</nowiki></code> y devient donc <code><nowiki>ECL</nowiki></code>, et <code><nowiki>tonumber("ECL", 36)</nowiki></code> réussit, ces trois lettres formant un nombre Base 36 valide : le module rend un résultat faux sans déclencher la moindre erreur. Rien ne lui passe de référence préfixée aujourd'hui, le lot 4 ayant stocké le numéro d'inventaire à part pour cette raison même. Le module normalise aussi la casse, par <code><nowiki>mw.text.trim(clean):upper()</nowiki></code> ; extraction et normalisation datent toutes deux de sa révision du 7 avril 2026, et il n'a pas été modifié depuis.
```

### Étape 4

```diff
--- lot4-1735.txt
+++ lot4-1738.txt
@@ -1,9 +1,10 @@
 {{Lot
 |Work_package_number=4
-|Work_package_status=livré
+|Work_package_status=clos
 |Work_package_summary=Séparer la séquence d'inventaire de la séquence de conception, avec Inventory_site, Inventory_number en base 36 et Inventory_ref.
 |Work_package_opening_date=2026-07-26
 |Work_package_delivery_date=2026-07-26
+|Work_package_closure_date=2026-11-07
 |Work_package_closure_report=https://github.com/Ecolibre/ecolibre-sgdt/blob/3a0e7af4e6b4d2e0ade4e1d645d568311e04afad/travaux/ecolibre-sgdt-lot4-phase3.md,https://github.com/Ecolibre/ecolibre-sgdt/blob/3a0e7af4e6b4d2e0ade4e1d645d568311e04afad/travaux/ecolibre-sgdt-lot4-rev2.md
 |Work_package_produces=Modèle:Préfixe site,Registre des préfixes de site
 }}
```

## Vérifications

1. **Textes mot pour mot.** Les trois pages relues par `action=parse` après
   la dernière écriture :
   - lot 4 : le bloc de l'étape 1 y figure une fois, entier, juste après
     l'appel de modèle, et chacune de ses six lignes non vides une fois ;
     `Work_package_status=clos`, plus aucune occurrence de « livré » ;
     `Work_package_closure_date=2026-11-07` en ligne 7, entre la date de
     livraison et le rapport de clôture ; `Work_package_closure_report`,
     `Work_package_produces` et les quatre autres paramètres inchangés ;
   - lot 40 : la puce y figure une fois, quatrième et dernière de la section
     « Points ouverts » ;
   - Limites connues : l'entrée y figure une fois, dernière entrée et
     dernière ligne de la page.
2. **Gestion des lots.** Faits stockés sur la page du lot 4 (`smwbrowse`) :
   `Work_package_status -> clos`, `Work_package_closure_date -> 1/2026/11/7`,
   `_MDAT` égal à l'heure de la révision 1738. L'index rendu affichait encore
   le lot 4 en « livré » à 15:44:52 et à 15:45:31, soit 35 et 74 secondes
   après l'écriture, son `touched` restant au 2 novembre 2026, 22:05:10 UTC.
   Purgé par `bin/wiki-purge.sh "Gestion des lots"` : `purged: true`,
   `linkupdate: true`. Relu à 15:45:40 : lot 4 en « clos », `touched`
   2026-11-07T15:45:40Z. Compte de l'index : 45 lots, 3 en cours, 17 faits,
   25 à venir, 0 abandonné ; la somme égale le total.
3. **Qui tranche : les Limites connues.** **75** entrées avant, **76**
   après ; la nouvelle est la dernière, dans le wikitexte comme au rendu, où
   la page n'a qu'une liste numérotée, de 76 éléments, dont elle est le
   dernier. `prop=extlinks` : **0** lien externe, sans suite ; le rendu n'en
   porte aucun non plus.
4. **Comptes**, par `action=ask` avec `limit=500`, sans suite pour aucun :
   `[[Has type::+]]` **161**, `[[Item_ref::+]]` **118**,
   `[[Inventory_number::+]]` **50**, `[[Category:Physical item]]` **50**.
   Inchangés.

Contrôles complémentaires, non demandés :

- Annotations (`smwbrowse`) : les pages des lots 4 et 40 ne portent que les
  faits de leur appel de modèle, plus `_ASK`, `_INST` (`Lot`), `_MDAT` et
  `_SKEY` ; pour le lot 4, les trois `_ASK` sont ceux d'avant l'écriture. Les
  Limites connues ne portent que `_INST` (`Page de suivi`), `_MDAT` et
  `_SKEY`. Chaque `_MDAT` est égal à l'heure de la nouvelle révision. Aucun
  `_ERRC`.
- Catégories : `Catégorie:Lot` pour les deux lots, `Catégorie:Page de suivi`
  pour les Limites connues ; aucune catégorie de suivi.
- Liens (`generator=links`) : 14 cibles sur les trois pages, aucune
  inexistante. `list=backlinks` sur la page du lot 4 rend `Gestion des lots`
  et `Lot 40 — Wiki privé CWL` : le lien ajouté est enregistré.
- Rendu : lot 4, deux sections, quatre énoncés en gras, le code affiché
  littéralement, `Inventory_ref` et `{{#sub:}}` ; lot 40, quatre puces dans
  « Points ouverts », la nouvelle sans gras ; Limites connues, les huit
  éléments de code de la nouvelle entrée affichés littéralement, de
  `Module:Base36` à `mw.text.trim(clean):upper()`, et aucun lien dans
  l'entrée.
- Orthographe : aucune forme rectifiée relevée dans les textes écrits ;
  « chaîne » y est à la forme traditionnelle.

## Écarts et surprises

### Questions

Lettres E à G, à la suite des quatre points du canal direct.

**E.** Le Récapitulatif technique date la banque d'inventaire du lot 9. Sa
section « Numérotation : trois banques de références » écrit « items
physiques : décision du lot 9, 13 août 2026 ». La page du lot 4 la date
désormais du 26 juillet 2026, d'après les rapports du lot 4, et le lot 9
lui-même l'avait constaté : `travaux/lot-9-amendement-1.md`, §1.7,
« `Inventory_number` et `Inventory_site` existent depuis le 26 juillet »,
puis « L'arbitrage n° 2 du cadrage est **sans objet** ». Faut-il corriger le
Récapitulatif ? Suggestion : « items physiques : lot 4, 26 juillet 2026 »,
par une écriture de résumé `[Lot 44][Correctif] <action>`.

**F.** Le Récapitulatif contredit le deuxième arbitrage qui vient d'être
consigné. Même section, premier des « Cinq points qui en découlent » :
« `ECL` est produit à l'affichage par le modèle, à partir d'une constante de
site ; `ECL-0003` apparaît partout à l'écran, jamais en base. » Mesuré le
7 novembre 2026 : 50 pages portent `Inventory_ref`, stocké en type Keyword
avec son préfixe, et sur les 50 il vaut exactement `Inventory_site`, un
tiret, `Inventory_number`. `Inventory_site` vaut `ECL` sur 44 d'entre elles
et `CWL` sur 6, sur un wiki dont le préfixe est `ECL` : le code de site est
bien une donnée de l'item, et la référence préfixée est en base. Ce qui
reste vrai : la valeur de numérotation, `Inventory_number`, est non
préfixée, et c'est la seule que le module reçoit. Faut-il reformuler ce
point ? Suggestion : dire que la valeur de numérotation est non préfixée,
que le préfixe vient d'`Inventory_site` et que le modèle compose
`Inventory_ref`, avec renvoi à la nouvelle entrée 76 des Limites connues
pour le motif.

**G.** La page du lot 6 annonce un durcissement du module dont l'historique
ne porte aucune trace. Son objet : « Durcir le module Base36, basculer
Item_ref, […] ». Mesuré le 7 novembre 2026 : `Module:Base36` n'a aucune
révision postérieure au 7 avril 2026, et le lot 6 a couru du 9 au 10 août
2026. Ses points ouverts relèvent déjà la contradiction pour « basculer
Item_ref », en citant la consigne de ses rapports, « ne pas toucher à
`Module:Base36` ni à `Item_ref` », mais pas pour le durcissement. Ce pourrait
être l'origine du « depuis le lot 6 » corrigé au point A ; ce n'est pas
établi. Faut-il le consigner ? Suggestion : une phrase dans les points
ouverts du lot 6, à côté de celle sur `Item_ref`, lors de sa clôture.

### Constats

- **L'index des lots n'a suivi qu'après purge**, à la différence de la
  clôture du lot 3, où il avait suivi en moins d'une minute sans purge et
  sans que son `touched` bouge. Ici, 35 puis 74 secondes après l'écriture, il
  affichait encore « livré », avec le même `touched` qu'alors, le 2 novembre
  2026 à 22:05:10 UTC. Deux observations de sens contraire : aucune règle à
  en tirer.
- **`list=embeddedin` ne voit pas les formulaires qui appellent
  `Module:Base36`.** Il rend quatre pages : les deux modèles d'audit,
  `Administration SGDT`, qui les transclut, et le Récapitulatif, qui
  n'appelle pas le module mais affiche son code par `Module:Source`. Les cinq
  formulaires qui l'appellent, dans la valeur par défaut d'un champ, n'y
  figurent pas. L'affirmation « Rien ne lui passe de référence préfixée
  aujourd'hui » a été établie par la lecture des cinq formulaires et des deux
  modèles d'audit, puis des valeurs stockées : une vérification par
  `embeddedin` seul aurait manqué cinq appelants sur sept.
- **Une troisième séquence passe par le module**, celle des lieux,
  `Location_number`, appelée par `Formulaire:Lieu` ; ses 15 valeurs sont non
  préfixées. L'entrée 76 reste exacte, puisqu'elle parle de ce que le module
  reçoit.
- **Le fait de l'entrée 76 figurait déjà au Récapitulatif**, comme motif de
  la valeur stockée non préfixée : « `Module:Base36` utilise
  `clean:match("[%w]+")`, qui s'arrête au tiret ». Les deux textes ne se
  contredisent pas ; celui des Limites connues est mesuré et plus précis. La
  même imprécision qu'au point B figure au Récapitulatif et dans la
  correction n° 3 du tableau de `CLAUDE.md`, qui écrivent tous deux
  `clean:match("[%w]+")` pour les deux fonctions. Rien n'a été modifié ni
  dans l'un ni dans l'autre.
