# Lot 44 — entrée 74 des Limites connues réécrite, forme des résumés rappelée dans la procédure de clôture

Exécuté le 4 novembre 2026, dans une session Claude Code cloud, sur la
branche `claude/focused-wright-wr4tlb`. Deux écritures sur le wiki, réussies
du premier coup. Les quatre vérifications passent ; celle qui tranche, la
première, rend 74 entrées, « s'exportait en » 0 fois et « ne se mesure pas »
1 fois.

## Étape 0 — état du dépôt

`git fetch origin`, puis `git status --porcelain` : sortie vide, aucun arrêt.
`HEAD` et `origin/main` au même commit, `4efff8c` : copie à jour, rien à
mettre à jour. `.claude/settings.local.json` : absent, au début comme à la
fin de la tâche, donc aucune règle.

Session wiki : `bin/wiki-login.sh` rend `Success`, compte `Cywil`.

## Le résumé de modification : forme retenue

La consigne déléguait la forme au garde-fou 2 de `CLAUDE.md`, lu en entier
avant la première écriture (lignes 218 à 239). Il prévoit trois cas :
`[Lot X][<à quel titre>] <action>` en général ; `[Correctif] <action>` pour
« une écriture qui ne relève d'aucun lot en cours » ; `[Lot N][Correctif]`
pour « un correctif écrit pendant un lot ».

Pour trancher entre ces cas, deux mesures :

- lots en cours, par `action=ask` sur
  `[[Catégorie:Lot]][[Work_package_status::ouvert]]` : les lots 21, 24 et 44 ;
- page du lot 44, section « Périmètre », rubrique « Dedans » : « le
  complément de la Procédure de clôture d'un lot, qui y verse » et « la
  clôture des lots 1 à 6 et 8, livrés et jamais clos ». Sa section « Ce qui
  est déjà tranché » ajoute : « Sept des dix lots en retard se closent dans ce
  lot. »

Les deux écritures relèvent donc du lot 44, en cours : la première corrige
une écriture de la clôture du lot 2, qui est dans son périmètre ; la seconde
complète la procédure de clôture, qui y est aussi. Forme retenue :
`[Lot 44][Correctif] <action>`, pour les deux.

- Pas `[Correctif]` seul : le garde-fou le réserve aux écritures qui ne
  relèvent d'aucun lot en cours.
- Pas `[Lot 2][Correctif]` : le lot 2 est clos depuis le 2 novembre 2026, et
  une étiquette `[Lot 2]` datée du 4 novembre prolongerait sa datation
  au-delà de sa clôture.

L'action de la première écriture est celle de la consigne. Celle de la
seconde est de moi : « forme des résumés de modification rappelée ».

## Lectures préalables

Les deux pages ont été lues par `bin/wiki-get.sh`
(`action=parse&prop=wikitext`), puis relues juste avant leur écriture :
identiques chaque fois. Elles étaient aussi identiques aux copies lues le
2 novembre 2026 : Limites connues à la révision 1718, Procédure à la 1708,
inchangée depuis le 29 octobre.

Protections, par `prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full` :
`protection: []` et aucun motif de refus, sur les deux pages.

L'entrée qui commence par la chaîne donnée a été trouvée une fois et une
seule ; c'est la dernière ligne de la page, la ligne 101.

Mesures de départ : 74 entrées ; « s'exportait en » 1 fois ; « ne se mesure
pas » 0 fois ; 5 liens externes, tous vers w3.org :
`http://www.w3.org/2002/07/owl#`,
`http://www.w3.org/2002/07/owl#differentFrom`,
`http://www.w3.org/TR/skos-reference`,
`https://www.w3.org/TR/owl2-syntax/`,
`https://www.w3.org/TR/owl2-syntax/differentFrom` ;
`[[Item_ref::+]]` 118 ; `[[Part_of::+]]` 23.

## Écritures

| Étape | Page | Révision | Heure (UTC) | Résumé | Méthode |
|---|---|---|---|---|---|
| 1 | Limites connues du Système de Gestion de Données Techniques | 1718 → 1723 | 21:30:17 | `[Lot 44][Correctif] entrée 74 réécrite, déduction distinguée de la mesure` | `wiki-put.sh`, page entière |
| 2 | Procédure de clôture d'un lot | 1708 → 1724 | 21:30:58 | `[Lot 44][Correctif] forme des résumés de modification rappelée` | `wiki-put.sh` |

Les deux rendent `result: Success`, et `bin/wiki-verify.sh` a rendu
`IDENTIQUE` après chacune.

Étape 1 : `bin/wiki-append.sh` ne sait qu'ajouter ; la correction d'une
entrée existante passe par une réécriture de la page entière, comme le veut
`CLAUDE.md`. L'entrée fournie a été transcrite deux fois, indépendamment, et
les deux transcriptions sont identiques. La page envoyée est la page lue, dont
seule la dernière ligne, l'unique entrée commençant par la chaîne donnée, a
été remplacée.

Étape 2, texte délégué, placement et rédaction :

- **Placement.** La page n'a pas de section intitulée « écritures ». La
  section 3, « Ranger chaque trouvaille », est celle qui dit où s'écrit chaque
  trouvaille : le paragraphe a été ajouté à sa fin, avant « == 4. Vérifier
  les points ouverts déclarés == ». La section 5, « Clore », ne porte que
  l'écriture finale de l'état, d'où ce choix.
- **Citation.** Deux phrases du garde-fou 2, citées mot pour mot : celle du
  format, avec la forme qu'il remplace, et celle du second crochet. Les
  accents graves de `CLAUDE.md` sont rendus par
  `<code><nowiki>…</nowiki></code>`, le gras est omis. Laissés de côté : « La
  règle est le critère, pas la liste… », « Reste interdit : un crochet vide,
  ou décoratif… », et les deux paragraphes sur `[Correctif]` et
  `[Lot N][Correctif]`.
- **Le compte de treize écritures**, mesuré par `list=usercontribs` : sept
  pour la clôture du lot 1 (révisions 1710 à 1716, dont la 1714 étiquetée
  `[Lot 6]`), six pour celle du lot 2 (révisions 1717 à 1722). Aucune ne porte
  de second crochet.

## Les deux diffs

### Étape 1

Sans contexte : seule la ligne 101, l'entrée 74, change.

```diff
--- av/limites.txt
+++ limites-1723.txt
@@ -101 +101 @@
-# '''L'URI de base d'un import de vocabulaire est concaténée telle quelle au terme, sans séparateur ajouté.''' Mesuré sur owl : avant correction, <code>MediaWiki:Smw import owl</code> portait <code>https://www.w3.org/TR/owl2-syntax/</code> et <code>Attribut:Owl:differentFrom</code> s'exportait en <code>https://www.w3.org/TR/owl2-syntax/differentFrom</code>, URI bien formée mais inexistante ; après correction en <code>http://www.w3.org/2002/07/owl#</code>, l'export rend <code>http://www.w3.org/2002/07/owl#differentFrom</code>, vérifié par <code>Spécial:Export RDF</code> le 29 octobre 2026. Conséquence déduite et non mesurée, sur skos : son URI de base, <code>http://www.w3.org/TR/skos-reference</code>, ne se terminait ni par <code>/</code> ni par <code>#</code>, de sorte qu'un terme s'y serait soudé - <code>skos-referenceConcept</code>. Aucun attribut skos n'existait pour le vérifier. Les deux URI ont été corrigées le 25 juillet 2026.
\ No newline at end of file
+# '''L'URI de base d'un import de vocabulaire est concaténée telle quelle au terme, sans séparateur ajouté.''' Mesuré sur owl, après correction : <code><nowiki>MediaWiki:Smw import owl</nowiki></code> porte <code><nowiki>http://www.w3.org/2002/07/owl#</nowiki></code> depuis le 25 juillet 2026, et <code>Attribut:Owl:differentFrom</code> s'exporte en <code><nowiki>http://www.w3.org/2002/07/owl#differentFrom</nowiki></code> - lu par <code>Spécial:Export RDF</code> le 26 juillet 2026, puis de nouveau les 29 octobre et 2 novembre 2026. Avant correction, l'import portait <code><nowiki>https://www.w3.org/TR/owl2-syntax/</nowiki></code>, et ce depuis sa révision 7 du 23 mars 2025, qui est l'import livré par défaut avec SMW. L'export d'alors n'a jamais été lu : l'URI qu'il produisait se déduit de la concaténation, elle ne se mesure pas. Même déduction sur skos, dont l'URI de base, <code><nowiki>http://www.w3.org/TR/skos-reference</nowiki></code>, ne se terminait ni par <code><nowiki>/</nowiki></code> ni par <code><nowiki>#</nowiki></code> : un terme s'y serait soudé, donnant <code><nowiki>skos-referenceConcept</nowiki></code>. Aucun attribut skos n'existait pour le vérifier. Les deux URI ont été corrigées le 25 juillet 2026.
\ No newline at end of file
```

### Étape 2

```diff
--- av/procedure.txt
+++ procedure-1724.txt
@@ -84,6 +84,8 @@
 
 Un arbitrage peut vivre dans un document du dépôt sans figurer sur la page du lot. C'est le cas du dixième, dont le cadrage porte sept décisions « à ne pas rejouer » qu'aucune page du wiki ne mentionne. Le raisonnement peut rester dans le dépôt ; la décision, non. Vérifier que chaque arbitrage d'un document de cadrage a son énoncé et son motif, en une phrase, sur la page du lot, avec le permalien pour le détail. Sans cela, un contributeur qui n'a pas le dépôt rejouera une question déjà tranchée.
 
+Chaque écriture de la clôture porte un résumé de modification à la forme que prescrit le garde-fou 2 de <code>CLAUDE.md</code>, dans le dépôt du projet. Il dit, mot pour mot : « Format en usage depuis le lot 6 : <code><nowiki>[Lot X][<à quel titre>] <action></nowiki></code> — et non <code><nowiki>[Lot X] <point> — <action></nowiki></code> comme l'écrivait cette règle jusqu'au lot 8. » Et : « Le second crochet indique à quel titre l'écriture a lieu : une tâche numérotée quand l'écriture en relève (<code><nowiki>[Tâche 7]</nowiki></code>), un libellé explicite sinon (<code><nowiki>[Complément]</nowiki></code>, <code><nowiki>[Clôture]</nowiki></code>, <code><nowiki>[Amendement]</nowiki></code>…). » Les clôtures des lots 1 et 2 ne l'ont pas suivie : aucune de leurs treize écritures, du 29 octobre au 2 novembre 2026, ne porte de second crochet, par exemple <code><nowiki>[Lot 2] Clôture - arbitrages consignés</nowiki></code>.
+
 == 4. Vérifier les points ouverts déclarés ==
 
 Reprendre un à un les points ouverts inscrits à la livraison et vérifier leur état '''sur le wiki''', pas dans les rapports. Certains se ferment sans que personne l'écrive : deux des huit points du lot 10 étaient fermés depuis des semaines quand on les a vérifiés.
```

## Vérifications

1. **Qui tranche : la page des Limites connues.** Relue par `action=parse`
   après l'écriture : **74 entrées** (74 avant) ; « s'exportait en »
   **0 fois** (1 avant) ; « ne se mesure pas » **1 fois** (0 avant).
   L'entrée fournie est la dernière ligne de la page, et les 100 autres
   lignes sont inchangées. Au rendu, un seul bloc `<ol>`, de 74 éléments.
2. **Liens externes** (`prop=extlinks`) : **5 avant**, tous vers w3.org ;
   **0 après**, vers w3.org ou ailleurs. Le `touched` de la page,
   `2026-11-04T21:30:19Z`, suit l'écriture de 21:30:17, et le passage de 5 à
   0 montre à lui seul que la table des liens a été mise à jour.
3. **Annotations** : `[[Item_ref::+]]` **118** (118 avant),
   `[[Part_of::+]]` **23** (23 avant), aucune des deux pages écrites parmi
   les résultats. Mesuré une fois le `_MDAT` de chacune des deux pages égal à
   l'heure de sa nouvelle révision.
4. **La Procédure de clôture porte la forme, citée de `CLAUDE.md`.** Relue
   par `action=parse` : le paragraphe y figure une fois, à la fin de la
   section 3 ; retiré, il rend exactement la page d'avant. Ses deux
   citations, balises `<code>` et `<nowiki>` ôtées, figurent telles quelles
   dans le texte du garde-fou 2, lignes jointes, gras et accents graves ôtés.
   Au rendu, les formes s'affichent littéralement :
   `[Lot X][<à quel titre>] <action>`, `[Lot X] <point> — <action>`,
   `[Tâche 7]`, `[Complément]`, `[Clôture]`, `[Amendement]`,
   `[Lot 2] Clôture - arbitrages consignés`.

Contrôles complémentaires, non demandés : les deux pages ne portent que les
faits `_INST` (Page de suivi), `_MDAT` et `_SKEY` ; leur seule catégorie est
Page de suivi ; aucun lien vers une page inexistante sur l'une ni sur
l'autre.

## Écarts et surprises

### Questions

**A.** La page du lot 2 porte la même déduction présentée comme un fait.
Son premier arbitrage, écrit lors de la clôture du 2 novembre, dit
« `Owl:differentFrom` s'exportait en
`https://www.w3.org/TR/owl2-syntax/differentFrom` », et l'adresse, écrite
sans `<nowiki>`, y fait un lien externe cliquable vers une adresse jamais
lue : `list=exturlusage` la trouve sur cette page et nulle part ailleurs, et
une recherche de « exportait » ne rend plus que cette page. Faut-il la
corriger comme l'entrée 74 ? Suggestion : une écriture de plus, au texte
fourni par l'architecte, qui mette le verbe au conditionnel et l'adresse
sous `<nowiki>`, avec le résumé `[Lot 44][Correctif] <action>`.

**B.** La forme des résumés est abandonnée bien au-delà des deux clôtures.
Mesuré sur les modifications récentes, du 19 octobre 2026 au 4 novembre à
21:00 UTC, avant les deux écritures de cette tâche : 43 modifications, dont
5 seulement ont un second crochet, trois du lot 21 le 19 octobre et les deux
`[Lot 44][Ouverture]` du 20 octobre. Les 38 autres n'en ont pas, à partir de
la révision 1685, le 20 octobre à 12:50 UTC : lot 44, 24 ; lot 1, 6 ;
lot 2, 6 ; lot 6, 1 ; lot 45, 1. Pour la clôture du lot 2, ces résumés
venaient de la consigne, que l'exécuteur applique mot pour mot ; pour les
autres, les rapports ne disent pas d'où ils venaient, et je ne l'ai pas
établi. Le paragraphe écrit sur la procédure ne
nomme que les lots 1 et 2, comme le demandait la consigne, et la procédure
n'est lue qu'à la clôture. Faut-il porter la règle là où les résumés
s'écrivent ? Suggestion : une ligne dans `methode-de-travail.md`, section
« Ce qu'une consigne doit contenir », demandant que les résumés fournis
suivent le garde-fou 2.

**C.** Sous quelle étiquette se font les clôtures menées dans le lot 44 ?
Les clôtures des lots 1 et 2 ont étiqueté leurs écritures `[Lot 1]` et
`[Lot 2]`, alors que le périmètre du lot 44 les inclut ; les deux correctifs
de cette tâche portent `[Lot 44]`. Conséquence : un inventaire du lot 44 par
ses résumés, comme le décrit l'étape 4 de la procédure, manque les treize
écritures de clôture, et l'historique du lot 2 ne montre pas la correction
de sa propre entrée. Pour les cinq clôtures restantes, lots 3 à 6 et 8,
quelle étiquette ? Suggestion : `[Lot 44][Clôture du lot N] <action>`, qui
garde complet l'inventaire du lot qui fait le travail et dit à quel titre on
écrit.

### Constats

- **La relecture de l'export du 29 octobre 2026, citée par l'entrée 74, n'a
  pas de trace dans le dépôt** : dans `travaux/`, « Export RDF » ne figure
  que dans des fichiers de juillet et dans le rapport de clôture du lot 2.
  Je n'ai pas de quoi la vérifier ; les lectures du 26 juillet et du
  2 novembre, elles, sont consignées.
- **La recherche plein texte a rendu 0 résultat pour « owl2-syntax »**, alors
  que la page du lot 2 contient cette chaîne ; `list=exturlusage` l'a
  trouvée. Une recherche sur un fragment d'adresse ne prouve pas une
  absence.
- Aucune question n'a été posée par le canal direct pendant l'exécution.
