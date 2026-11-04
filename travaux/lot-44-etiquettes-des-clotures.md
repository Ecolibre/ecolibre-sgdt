# Lot 44 — page du lot 2 corrigée, règle des résumés dans la méthode, étiquette des clôtures dans la procédure

Exécuté le 4 novembre 2026, dans une session Claude Code cloud, sur la
branche `claude/focused-wright-wr4tlb`. Trois écritures : deux sur le wiki,
réussies du premier coup, et une dans le dépôt, le commit `df5c355`. Les trois
vérifications passent ; celle qui tranche, la première, rend « s'exportait
en » 0 fois, « aurait produit » 1 fois, et aucune page sur l'adresse déduite.

## Étape 0 — état du dépôt

`git fetch origin`, puis `git status --porcelain` : sortie vide, aucun arrêt,
au premier passage comme à la reprise après l'échange ci-dessous. `HEAD` et
`origin/main` au même commit, `fb98608`, les deux fois : rien à mettre à jour.
`.claude/settings.local.json` : absent, au début comme à la fin de la tâche,
donc aucune règle.

## Contrôle des résumés, et échange par le canal direct

La consigne demandait de vérifier les résumés contre le garde-fou 2 de
`CLAUDE.md` et de signaler avant d'écrire celui qui ne le respecterait pas.
Contrôle fait avant toute écriture :

- étape 1, `[Lot 44][Correctif] page du lot 2, déduction distinguée de la
  mesure` : conforme ;
- étape 2 : c'est un message de commit, pas un résumé de modification du
  wiki, et le garde-fou 2 ne s'y applique pas ;
- étape 3, `[Lot 44][Procédure] étiquette des clôtures menées dans le
  lot 44` : jugé non conforme, parce que « Procédure » dit sur quoi porte
  l'écriture, et non à quel titre elle est faite. Le mot double le titre de la
  page, que chaque ligne de l'historique affiche déjà, et il est ambigu : le
  lot 44 mène deux travaux de procédure.

Deux points ont été soumis à Cyril, et **rien n'a été écrit avant ses
réponses** :

- **A**, le résumé de l'étape 3, avec la suggestion
  `[Lot 44][Complément] étiquette des clôtures menées dans le lot 44`.
- **B**, la seconde précision de l'étape 3. Elle omettait la révision 1714,
  étiquetée `[Lot 6]`, et la révision 1716, du 1er novembre, hors des dates
  citées.

Réponses de Cyril :

- **A** : « Remplacé. Le résumé de l'étape 3 devient :
  `[Lot 44][Complément] étiquette des clôtures menées dans le lot 44`. Ton
  analyse est juste : [Procédure] dit sur quoi porte l'écriture, pas à quel
  titre elle est faite. »
- **B** : « Amendé. » La seconde précision a été remplacée entièrement par un
  texte fourni, celui qui figure au diff de l'étape 3 ; la première précision
  ne change pas, et le reste de la consigne non plus.

## Lectures et mesures préalables

- Page du lot 2 : identique au fichier envoyé le 2 novembre pour la révision
  1722, et l'ancrage de l'étape 1 y figure une fois.
- Procédure de clôture d'un lot : identique à la révision 1724, écrite plus
  tôt le même jour, et le paragraphe sur la forme des résumés y figure une
  fois, ligne 87.
- Protections, par `prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full` :
  `protection: []` et aucun motif de refus, sur les deux pages.
- Faits sur lesquels repose le texte amendé, vérifiés avant d'écrire :
  - les révisions 1710 à 1722 sont exactement les treize écritures des deux
    clôtures, contiguës : de 1710 à 1716 pour le lot 1, de 1717 à 1722 pour
    le lot 2 ; la 1709 est une écriture du lot 44, la 1723 le correctif de
    l'entrée 74 ;
  - la révision 1714, du 29 octobre à 20:55:48 UTC, porte sur la page
    « Lot 6 — Durcissement du module de références », étiquetée `[Lot 6]` ;
  - du 8 au 13 août 2026, le compte a fait 191 modifications, dont 38
    étiquetées `[Lot 6]`, par exemple la révision 358,
    `[Lot 6][Tâche 6] Récapitulatif technique — lien croisé…`. Chercher
    `[Lot 6]` remonterait donc bien les écritures d'août du lot 6.

## Écritures

| Étape | Cible | Révision ou commit | Heure (UTC) | Résumé ou message | Méthode |
|---|---|---|---|---|---|
| 1 | Lot 2 — Vocabulaires et intégrité des classes | 1722 → 1726 | 22:28:39 | `[Lot 44][Correctif] page du lot 2, déduction distinguée de la mesure` | `wiki-put.sh` |
| 2 | `methode-de-travail.md` | `df5c355` | — | `methode-de-travail : les résumés fournis dans une consigne suivent le garde-fou 2` | outil d'édition, puis `git commit` |
| 3 | Procédure de clôture d'un lot | 1724 → 1727 | 22:30:16 | `[Lot 44][Complément] étiquette des clôtures menées dans le lot 44` | `wiki-put.sh` |

Session rouverte par `bin/wiki-login.sh` avant la première écriture
(`Success`, compte `Cywil`). Les deux écritures du wiki rendent
`result: Success`, et `bin/wiki-verify.sh` a rendu `IDENTIQUE` après
chacune. Le commit, d'après `git show --stat df5c355` : un fichier,
`methode-de-travail.md | 2 ++`, 2 ajouts, aucune suppression, la ligne et le
saut de ligne qui la sépare de la suivante.

Chaque texte fourni a été recopié deux fois, dans un fichier à part puis dans
la copie de la page, et les deux recopies concordent.

Choix laissés à l'exécuteur, signalés comme le veut la méthode :

- **Étape 2, texte délégué.** La ligne est placée en fin de section, après
  celle sur l'orthographe, l'autre règle qui porte sur un texte destiné au
  wiki. La forme est citée mot pour mot,
  « Format en usage depuis le lot 6 : `[Lot X][<à quel titre>] <action>` »,
  et un contrôle a établi qu'elle figure telle quelle dans le garde-fou 2.
  La phrase du milieu est de moi et n'était pas demandée : « L'exécuteur
  applique un résumé fourni mot pour mot, et un résumé de modification ne se
  corrige plus une fois écrit : l'erreur d'une consigne passe telle quelle
  dans l'historique. » Elle donne le motif de la règle ; elle se retire sans
  rien casser. La mesure reprend les termes de la consigne, avec « du wiki »
  ajouté, et renvoie au rapport qui l'a établie.
- **Étape 3, placement.** « Ajouter deux précisions » au paragraphe : elles
  ont été ajoutées comme deux phrases à la fin du paragraphe, dans l'ordre
  donné, plutôt qu'en liste, puisque la section 3 n'en contient aucune. Les
  retours à la ligne de la consigne à l'intérieur de la première précision,
  dont un tombait dans `<code><nowiki>…</nowiki></code>`, ont été supprimés :
  ils venaient de la mise en page, pas du texte.

## Les trois diffs

### Étape 1

```diff
--- av/lot2.txt
+++ lot2-1726.txt
@@ -10,7 +10,7 @@
 
 == Ce qui est déjà tranché ==
 
-'''L'URI de base d'un vocabulaire importé est l'espace de noms de l'ontologie, jamais l'adresse de son document de spécification.''' Motif : SMW concatène le terme directement à l'URI de base, de sorte qu'une adresse de spécification produit des URI syntaxiquement valides et sémantiquement muettes - <code>Owl:differentFrom</code> s'exportait en <code>https://www.w3.org/TR/owl2-syntax/differentFrom</code>. Décidé le 25 juillet 2026. Le comportement de concaténation est consigné dans les [[Limites connues du Système de Gestion de Données Techniques]].
+'''L'URI de base d'un vocabulaire importé est l'espace de noms de l'ontologie, jamais l'adresse de son document de spécification.''' Motif : SMW concatène le terme directement à l'URI de base, de sorte qu'une adresse de spécification produit des URI syntaxiquement valides et sémantiquement muettes - <code>Owl:differentFrom</code> aurait produit <code><nowiki>https://www.w3.org/TR/owl2-syntax/differentFrom</nowiki></code>, par déduction et non par lecture de l'export, qui n'a jamais été fait avant la correction. Décidé le 25 juillet 2026. Le comportement de concaténation est consigné dans les [[Limites connues du Système de Gestion de Données Techniques]].
 
 '''L'adresse de spécification garde sa place après le <code><nowiki>|</nowiki></code> de la première ligne, comme libellé lisible.''' Motif : elle est utile au lecteur et sans effet sur la concaténation. Décidé le 25 juillet 2026, appliqué sur owl et sur skos.
 
```

### Étape 2

```diff
diff --git a/methode-de-travail.md b/methode-de-travail.md
index 590c7d0..8201398 100644
--- a/methode-de-travail.md
+++ b/methode-de-travail.md
@@ -62,6 +62,8 @@ Enfin, sa première ligne nomme son destinataire, et elle annonce les demandes d
 
 Le texte destiné au wiki suit l'orthographe traditionnelle, celle qu'emploie le reste du wiki : coût, apparaît, connaît, entraîner, boîte. Sur son état au 19 octobre 2026, six familles de mots y donnent cinquante et une formes traditionnelles et aucune forme rectifiée. L'exécuteur ne corrigera pas une forme rectifiée de lui-même, puisque la règle du texte fourni lui interdit de retoucher ce qu'on lui donne : il la signalera, et il faudra une écriture de plus. Constaté le 28 octobre 2026, treize occurrences introduites sur trois pages entre le 20 et le 25 octobre.
 
+Tout résumé de modification fourni dans une consigne suit la forme que prescrit le garde-fou 2 de `CLAUDE.md` : « Format en usage depuis le lot 6 : `[Lot X][<à quel titre>] <action>` ». L'exécuteur applique un résumé fourni mot pour mot, et un résumé de modification ne se corrige plus une fois écrit : l'erreur d'une consigne passe telle quelle dans l'historique. La convention est mesurée comme largement abandonnée : 38 modifications du wiki sur 43, entre le 19 octobre et le 4 novembre 2026, n'ont pas de second crochet, sur cinq lots différents (relevé du 4 novembre 2026, `travaux/lot-44-entree-74-et-resumes.md`).
+
 ## Format des échanges
 
 Chaque réponse de l'architecte est faite de points numérotés. La disposition interne d'un point est décrite plus bas, à la section "La forme d'un point". Le numéro est annoncé avant que le point soit développé, parce que Cyril lit au fil et répond en cours de route. Le but est qu'il puisse répondre « point N : ok » sans retaper un raisonnement identique à la recommandation.
```

### Étape 3

```diff
--- av/procedure.txt
+++ procedure-1727.txt
@@ -84,7 +84,7 @@
 
 Un arbitrage peut vivre dans un document du dépôt sans figurer sur la page du lot. C'est le cas du dixième, dont le cadrage porte sept décisions « à ne pas rejouer » qu'aucune page du wiki ne mentionne. Le raisonnement peut rester dans le dépôt ; la décision, non. Vérifier que chaque arbitrage d'un document de cadrage a son énoncé et son motif, en une phrase, sur la page du lot, avec le permalien pour le détail. Sans cela, un contributeur qui n'a pas le dépôt rejouera une question déjà tranchée.
 
-Chaque écriture de la clôture porte un résumé de modification à la forme que prescrit le garde-fou 2 de <code>CLAUDE.md</code>, dans le dépôt du projet. Il dit, mot pour mot : « Format en usage depuis le lot 6 : <code><nowiki>[Lot X][<à quel titre>] <action></nowiki></code> — et non <code><nowiki>[Lot X] <point> — <action></nowiki></code> comme l'écrivait cette règle jusqu'au lot 8. » Et : « Le second crochet indique à quel titre l'écriture a lieu : une tâche numérotée quand l'écriture en relève (<code><nowiki>[Tâche 7]</nowiki></code>), un libellé explicite sinon (<code><nowiki>[Complément]</nowiki></code>, <code><nowiki>[Clôture]</nowiki></code>, <code><nowiki>[Amendement]</nowiki></code>…). » Les clôtures des lots 1 et 2 ne l'ont pas suivie : aucune de leurs treize écritures, du 29 octobre au 2 novembre 2026, ne porte de second crochet, par exemple <code><nowiki>[Lot 2] Clôture - arbitrages consignés</nowiki></code>.
+Chaque écriture de la clôture porte un résumé de modification à la forme que prescrit le garde-fou 2 de <code>CLAUDE.md</code>, dans le dépôt du projet. Il dit, mot pour mot : « Format en usage depuis le lot 6 : <code><nowiki>[Lot X][<à quel titre>] <action></nowiki></code> — et non <code><nowiki>[Lot X] <point> — <action></nowiki></code> comme l'écrivait cette règle jusqu'au lot 8. » Et : « Le second crochet indique à quel titre l'écriture a lieu : une tâche numérotée quand l'écriture en relève (<code><nowiki>[Tâche 7]</nowiki></code>), un libellé explicite sinon (<code><nowiki>[Complément]</nowiki></code>, <code><nowiki>[Clôture]</nowiki></code>, <code><nowiki>[Amendement]</nowiki></code>…). » Les clôtures des lots 1 et 2 ne l'ont pas suivie : aucune de leurs treize écritures, du 29 octobre au 2 novembre 2026, ne porte de second crochet, par exemple <code><nowiki>[Lot 2] Clôture - arbitrages consignés</nowiki></code>. Une clôture menée dans le cadre du lot 44 étiquette ses écritures <code><nowiki>[Lot 44][Clôture du lot N]</nowiki></code> : l'étiquette dit quel lot fait le travail, non sur quoi il porte. Les clôtures des lots 1 et 2, du 29 octobre au 2 novembre 2026, ont étiqueté <code><nowiki>[Lot 1]</nowiki></code> et <code><nowiki>[Lot 2]</nowiki></code>, à une exception près : la révision 1714, du 29 octobre, porte <code><nowiki>[Lot 6]</nowiki></code>, parce qu'elle écrivait sur la page de ce lot. Un inventaire du lot 44 par ses résumés couvre donc les révisions 1710 à 1722, et ne peut pas se faire par étiquette seule : chercher <code><nowiki>[Lot 6]</nowiki></code> remonterait aussi les écritures d'août du lot 6 lui-même. Les résumés de modification étant immuables, cet écart ne se corrige pas.
 
 == 4. Vérifier les points ouverts déclarés ==
 
```

## Vérifications

1. **Qui tranche : la page du lot 2.** Relue par `action=parse` après
   l'écriture : « s'exportait en » **0 fois** (1 avant), « aurait produit »
   **1 fois** (0 avant), une seule ligne modifiée, l'état `clos` inchangé.
   `list=exturlusage` sur `https://www.w3.org/TR/owl2-syntax/differentFrom` :
   **aucune page**. Plus tôt le même jour, la même adresse était trouvée sur
   la page du lot 2, et seulement là. Requête témoin sur le préfixe
   `https://www.w3.org/TR/owl2-syntax` : trois pages, `MediaWiki:Smw import
   owl`, `Attribut:Owl:differentFrom` et le Récapitulatif technique, toutes
   sur `https://www.w3.org/TR/owl2-syntax/`, l'adresse du libellé lisible.
   La requête pouvait donc détecter une présence ; elle ne voit plus la page
   du lot 2. Au rendu, l'adresse s'affiche comme du texte, et le seul lien
   externe de la page reste le permalien du rapport du lot.
2. **Annotations** : `[[Item_ref::+]]` **118**, `[[Part_of::+]]` **23**,
   aucune des deux pages écrites parmi les résultats. Mesuré une fois le
   `_MDAT` de chacune égal à l'heure de sa nouvelle révision. Le lot 2 garde
   `Work_package_status -> clos` et `Work_package_closure_date -> 1/2026/11/2`.
3. **La procédure et la méthode.** Procédure relue par `action=parse` : les
   deux précisions y figurent une fois chacune, dans le paragraphe sur la
   forme des résumés, ligne 87. Au rendu, les formes s'affichent
   littéralement, dont `[Lot 44][Clôture du lot N]`, `[Lot 1]`, `[Lot 2]` et
   `[Lot 6]`. `methode-de-travail.md`, lu dans le commit `df5c355` : la ligne
   y figure une fois, à l'intérieur de la section « Ce qu'une consigne doit
   contenir ».

Contrôles complémentaires, non demandés : la procédure ne porte que les faits
`_INST` (Page de suivi), `_MDAT` et `_SKEY` ; catégories Lot et Page de
suivi, sans catégorie de suivi ; aucun lien vers une page inexistante sur
l'une ni sur l'autre page.

## Écarts et surprises

- **Le résumé de l'étape 3 et la seconde précision ont été corrigés avant
  écriture**, par l'échange A et B tracé plus haut. C'est le contrôle exigé
  par la consigne elle-même qui l'a permis.
- **Un premier relevé d'août a rendu 0 écriture `[Lot 6]`, à tort.** La
  première page de `list=usercontribs` sur tout le mois, 500 contributions en
  remontant depuis le 31 août, portait l'indication `continue` et n'atteignait
  pas les dates du lot 6. Rien n'en a été conclu ; resserrée sur le 8 au
  13 août, la fenêtre a rendu 38 écritures. Un relevé tronqué ne vaut pas
  absence.
- **La révision 1725 est apparue entre deux écritures de la journée** :
  2026-11-04 à 21:53:03 UTC, téléversement d'une nouvelle version de
  `Fichier:Logo Ecolibre 135x135.png` par le compte `Cywil`. Sans rapport
  avec cette tâche ; elle explique seulement le saut de 1724 à 1726.
- **Le paragraphe de la procédure dit maintenant deux fois « Les clôtures des
  lots 1 et 2 »**, une fois pour le second crochet manquant, une fois pour
  l'étiquette de lot. Les deux phrases ne se contredisent pas, mais elles
  pourraient se fondre un jour.
- **La phrase de motif ajoutée à `methode-de-travail.md` est de moi** ; voir
  les choix laissés à l'exécuteur.
- Aucune autre question n'a été posée par le canal direct pendant
  l'exécution.
