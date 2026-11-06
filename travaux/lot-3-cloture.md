# Lot 3 — clôture : arbitrages consignés, compte du Récapitulatif remplacé par sa règle, état clos

Exécuté le 6 novembre 2026, dans une session Claude Code cloud, sur la
branche `claude/focused-wright-wr4tlb`. Quatre écritures sur le wiki, sur
trois pages, toutes réussies du premier coup, après un arrêt avant écriture
et trois réponses de Cyril. Les quatre vérifications passent ; celle qui
tranche, la troisième, rend 161, 118, et aucune page écrite parmi les
propriétés.

## Étape 0 — état du dépôt

`git fetch origin`, puis `git status --porcelain` : sortie vide, aucun arrêt,
aux trois passages : au premier, à la reprise après l'échange, et à la reprise
après le redémarrage. `HEAD` et `origin/main` au même commit, `86808dc`, les
trois fois : rien à mettre à jour. `.claude/settings.local.json` : absent, au
début comme à la fin de la tâche, donc aucune règle.

Session wiki : `bin/wiki-login.sh` rend `Success`, compte `Cywil`, avant la
première écriture.

## Arrêt avant écriture, et échanges par le canal direct

Trois points ont été soumis à Cyril avant toute écriture :

- **A** : la chaîne de l'étape 2 n'était pas telle quelle sur le
  Récapitulatif. Elle y figurait une fois mot pour mot, mais repliée sur les
  lignes 379 à 381, coupée par deux retours à la ligne. La règle de la
  consigne imposait l'arrêt.
- **B** : le troisième arbitrage de l'étape 1 attribuait au Récapitulatif une
  convention qu'il n'énonce pas. Le texte fourni disait : « quand la portée
  est une classe, l'écrire exactement comme dans `Property_domain` ». Le
  Récapitulatif dit, lignes 376 et 377 : « le domaine s'écrit sous la forme
  `Category:Nom`, la portée sous la forme `Nom` seul ». Les données lui
  donnent raison : `Antagonist species` et `Companion species` ont pour
  portée `Organic item` et pour domaine `Catégorie:Organic item` ; `Instance
  of` a pour portée `Referenced item` ; `Item facet`, `Facette`.
- **C** : la consigne datait la clôture du 4 novembre, date et résumé, pour
  une écriture faite le 6 ; les clôtures des lots 1 et 2 avaient daté le jour
  même de l'écriture.

Réponses de Cyril :

- **A** : « Oui, remplace les lignes 379 à 381. Mais replie le remplacement
  comme la page le fait, en quatre lignes », avec les quatre lignes, qui
  figurent au diff de l'étape 2.
- **B** : « Amendé. » Le troisième arbitrage a été remplacé entièrement par le
  texte fourni, qui figure au diff de l'étape 1.
- **C** : « Le 6 novembre. » Trois changements : la date de clôture
  `2026-11-06`, le résumé « état clos au 6 novembre 2026 », et « Mesuré le
  6 novembre 2026 » dans le texte de l'étape 3, « puisque tu as refait le
  compte aujourd'hui et trouvé les mêmes 161 ».

Le reste de la consigne était inchangé.

Plus tard dans la même tâche, après les quatre écritures et les
vérifications, le processus de la session a redémarré avant la rédaction de
ce rapport. Un message de Cyril est arrivé à la reprise : sa limite
d'utilisation avait été atteinte pendant le travail puis réinitialisée,
« Veuillez continuer là où vous vous êtes arrêté ». Reprise après contrôle :
les trois pages portaient toujours les révisions 1729, 1730 et 1731,
`origin/main` n'avait pas bougé, et les fichiers de travail étaient intacts.

## Lectures et mesures préalables

- Les trois pages ont été lues par `bin/wiki-get.sh`
  (`action=parse&prop=wikitext`) avant l'échange, puis de nouveau juste avant
  d'écrire : identiques. Révisions de départ : lot 3 1348, Récapitulatif
  1719, lot 21 1681. Protections, par
  `prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full` :
  `protection: []` et aucun motif de refus, sur les trois.
- Ancrages : la page du lot 3 se termine par l'appel de modèle, où
  `Work_package_delivery_date` est suivi directement de
  `Work_package_closure_report`, `Work_package_produces` venant après ; les
  lignes 379 à 381 du Récapitulatif ; la section « Points ouverts » du lot 21
  se termine ligne 138, avant « == Point de départ == ».
- Faits sur lesquels reposent les textes, vérifiés avant d'écrire :
  - `[[Has type::+]]`, `limit=500` : 161, dont 21 pages
    `Attribut:Test lot21…`, mesuré deux fois le 6 novembre ;
    `[[Item_ref::+]]` : 118 ;
  - le tableau des propriétés du Récapitulatif est la requête
    `{{#ask: [[Has type::+]] … |limit=200 |sort=Has type}}`, sans filtre : les
    21 propriétés d'essai y figurent bien ;
  - la page du lot 21 rappelle déjà la règle, ligne 155, dans « Risques
    connus » : « Une page de propriété d'essai se supprime directement, jamais
    après avoir été vidée : le blanchiment la verrouille (entrée 33 des
    Limites connues). » ;
  - `Part_of` : `Property_cardinality -> multiple`, domaine Functional,
    Organic et Referenced item, portée « même classe que le sujet » ;
  - les quatre pages de catégorie d'item portent leurs sections
    « Définition » et « Position dans la chaîne ».

## Écritures

| Étape | Page | Révision | Heure (UTC) | Résumé |
|---|---|---|---|---|
| 1 | Lot 3 — Classes et schéma des propriétés | 1348 → 1728 | 21:54:31 | `[Lot 44][Clôture du lot 3] arbitrages consignés` |
| 2 | Récapitulatif technique du Système de Gestion de Données Techniques | 1719 → 1729 | 21:55:17 | `[Lot 44][Clôture du lot 3] le compte des cases vides remplacé par sa règle` |
| 3 | Lot 21 — Grandeurs et unités | 1681 → 1730 | 21:56:06 | `[Lot 44][Clôture du lot 3] propriétés d'essai du lot 21 portées à ses points ouverts` |
| 4 | Lot 3 — Classes et schéma des propriétés | 1728 → 1731 | 21:56:56 | `[Lot 44][Clôture du lot 3] état clos au 6 novembre 2026` |

Les quatre par `bin/wiki-put.sh`, toutes `result: Success`, et
`bin/wiki-verify.sh` a rendu `IDENTIQUE` après chacune. Les quatre résumés
suivent le garde-fou 2 et l'étiquette des clôtures menées dans le lot 44.

Chaque texte fourni a été recopié deux fois, dans un fichier à part puis dans
la copie de la page, et les deux recopies concordent. À l'étape 2, les quatre
lignes, jointes par des espaces, redonnent exactement le texte d'une ligne de
la consigne d'origine.

## Les quatre diffs

### Étape 1

```diff
--- av/lot3.txt
+++ lot3-1728.txt
@@ -6,4 +6,12 @@
 |Work_package_delivery_date=2026-07-26
 |Work_package_closure_report=https://github.com/Ecolibre/ecolibre-sgdt/blob/3a0e7af4e6b4d2e0ade4e1d645d568311e04afad/travaux/ecolibre-sgdt-lot3.md
 |Work_package_produces=Catégorie:Referenced item,Catégorie:Physical item
-}}
\ No newline at end of file
+}}
+
+== Ce qui est déjà tranché ==
+
+'''<code><nowiki>Part_of</nowiki></code> est déclarée <code>multiple</code> globalement, alors qu'elle n'est réellement multivaluée qu'au niveau référencé.''' Motif : Semantic MediaWiki attache la cardinalité à la propriété et non au couple classe-propriété. Déclarer <code>multiple</code> ne casse aucune requête existante, là où scinder en deux propriétés obligerait à réécrire les <code><nowiki>#ask</nowiki></code> des quatre modèles d'items. Seul un schéma SHACL saura exprimer la nuance. Décidé le 26 juillet 2026.
+
+'''Huit propriétés ont été laissées sans schéma, délibérément''' : les quatre de description et les quatre importées. Motif : elles ne relèvent pas du modèle métier, et une case vide est une information juste là où une case remplie au jugé serait une information fausse. Décidé le 26 juillet 2026.
+
+'''<code><nowiki>Property_range</nowiki></code> confond <code>sh:class</code> et <code>sh:datatype</code>, que SHACL distingue.''' Motif : à seize propriétés, une seule colonne documentaire valait mieux que deux colonnes à moitié vides. La convention qui en découle est énoncée dans le [[Récapitulatif technique du Système de Gestion de Données Techniques]] : le domaine s'écrit sous la forme <code><nowiki>Category:Nom</nowiki></code>, la portée sous la forme <code><nowiki>Nom</nowiki></code> seul, le nom de classe étant le même des deux côtés. Décidé le 26 juillet 2026.
\ No newline at end of file
```

### Étape 2

```diff
--- av/recap.txt
+++ recap-1729.txt
@@ -376,9 +376,10 @@
 Convention d'écriture, à tenir : le domaine s'écrit sous la forme
 <code>Category:Nom</code>, la portée sous la forme <code>Nom</code> seul.
 
-Onze lignes ont ces trois colonnes vides : les propriétés de description, les
-propriétés importées et les propriétés de schéma elles-mêmes ne décrivent pas
-le modèle métier. La case vide est une information, pas un oubli.
+Les propriétés de description, les propriétés importées et les propriétés de
+schéma elles-mêmes ne décrivent pas le modèle métier : leurs trois colonnes
+restent vides, et la case vide est une information, pas un oubli. Le nombre de
+ces lignes n'est pas donné ici, parce qu'il change à chaque propriété ajoutée.
 
 <code>Property_domain</code>, <code>Property_range</code> et
 <code>Property_cardinality</code> sont des conventions du projet, pas des
```

### Étape 3

```diff
--- av/lot21.txt
+++ lot21-1730.txt
@@ -137,6 +137,8 @@
 
 Le lot n'est bloqué par rien d'autre. Les opérations côté serveur, dont l'examen du verrou de propagation, restent en attente de la migration et ne commandent plus aucune étape de ce lot.
 
+Vingt-et-une propriétés d'essai créées par ce lot figurent dans le tableau des propriétés du [[Récapitulatif technique du Système de Gestion de Données Techniques]], qui est la spécification du système : leurs noms commencent par <code><nowiki>Test lot21</nowiki></code>. Mesuré le 6 novembre 2026 : 161 propriétés portent un <code><nowiki>Has type</nowiki></code>, dont ces vingt-et-une. Elles sont à retirer avant la clôture de ce lot, par suppression directe de leur page et jamais après blanchiment, comme cette page le rappelle déjà. Relevé lors de la clôture du lot 3.
+
 == Point de départ ==
 
 Les trois hypothèses du travail préparatoire d'août 2026 ont toutes été tranchées entre le 6 et le 8 octobre 2026, et leur résolution figure ci-dessus.
```

### Étape 4

```diff
--- lot3-1728.txt
+++ lot3-1731.txt
@@ -1,9 +1,10 @@
 {{Lot
 |Work_package_number=3
-|Work_package_status=livré
+|Work_package_status=clos
 |Work_package_summary=Définir les quatre classes sur leurs pages de catégorie, et créer les propriétés qui décrivent les propriétés : cardinalité, domaine et portée.
 |Work_package_opening_date=2026-07-26
 |Work_package_delivery_date=2026-07-26
+|Work_package_closure_date=2026-11-06
 |Work_package_closure_report=https://github.com/Ecolibre/ecolibre-sgdt/blob/3a0e7af4e6b4d2e0ade4e1d645d568311e04afad/travaux/ecolibre-sgdt-lot3.md
 |Work_package_produces=Catégorie:Referenced item,Catégorie:Physical item
 }}
```

## Vérifications

1. **Textes mot pour mot.** Les trois pages relues par `action=parse` après
   la dernière écriture :
   - lot 3 : le bloc de l'étape 1 y figure une fois, juste après l'appel de
     modèle ; `Work_package_status=clos`, plus aucune occurrence de
     « livré » ; `Work_package_closure_date=2026-11-06` entre la date de
     livraison et le rapport de clôture, ce dernier et
     `Work_package_produces` inchangés ;
   - Récapitulatif : les quatre lignes y figurent une fois, « Onze lignes »
     0 fois, le reste de la page inchangé ;
   - lot 21 : le paragraphe y figure une fois, à la fin de « Points
     ouverts », le reste de la page inchangé.
2. **Gestion des lots.** Faits stockés sur la page du lot 3 (`smwbrowse`) :
   `Work_package_status -> clos`, `Work_package_closure_date -> 1/2026/11/6`.
   L'index rendu affichait déjà le lot 3 en « clos » à 21:57:44 UTC, moins
   d'une minute après l'écriture. Aucune purge n'a donc été faite, la
   consigne ne la demandant que si l'index n'avait pas bougé. Compte de
   l'index : 45 lots, 3 en cours, 17 faits, 25 à venir, 0 abandonné ; la
   somme égale le total.
3. **Qui tranche : annotations parasites.** Mesuré une fois le `_MDAT` de
   chacune des trois pages égal à l'heure de sa nouvelle révision :
   - `[[Has type::+]]`, `limit=500` : **161**, avec 161 résultats rendus et
     aucune suite, donc sans troncature ;
   - `[[Item_ref::+]]` : **118** ;
   - pages écrites parmi les résultats de `[[Has type::+]]` : **0**.
4. **Les quatre pages de catégorie d'item** portent toujours leurs deux
   sections, « Définition » et « Position dans la chaîne », deux sur deux
   pour chacune. Aucune n'a été modifiée par cette tâche : dernières
   révisions 257 et 258 (26 juillet), 1385 (3 octobre) et 1521 (11 octobre).

Contrôles complémentaires, non demandés :

- Catégories : `Catégorie:Lot` pour les deux lots, `Catégorie:Page de suivi`
  et `Catégorie:SGDT` pour le Récapitulatif ; aucune catégorie de suivi.
- Liens (`generator=links`) : 217 cibles sur les trois pages, dont deux
  inexistantes, `Attribut:Has type` et `Attribut:Imported from`, liées depuis
  le Récapitulatif par les en-têtes de la requête de son tableau ; elles
  existaient déjà et ont été signalées le 2 novembre. Les liens ajoutés vont
  tous vers le Récapitulatif, qui existe.
- Rendu du lot 3 : une section « Ce qui est déjà tranché », trois énoncés en
  gras, et le code affiché littéralement : `Part_of`, `multiple`, `#ask`,
  `Property_range`, `sh:class`, `sh:datatype`, `Category:Nom`, `Nom`.
- Le compte remplacé n'était écrit nulle part ailleurs : une recherche de
  « onze lignes » ne rend que la page du lot 21, où l'expression parle de la
  fiche d'une machine à souder, et « colonnes vides » ne rend rien.

## Écarts et surprises

### Question

**A.** Le texte fourni de l'étape 3 porte une forme rectifiée. « Vingt-et-une »
et « vingt-et-une » sont des formes de l'orthographe rectifiée de 1990 ;
l'orthographe traditionnelle, celle du wiki, écrit « vingt et une ». Le seul
autre emploi de ce nombre sur le wiki, sur la page du lot 22, s'écrit
« Vingt et un ». Écrit tel quel, comme le veut la règle du texte fourni.
Faut-il le corriger ? Suggestion : une écriture de plus sur la page du lot 21,
qui remplace les deux occurrences du même paragraphe, avec un résumé de la
forme `[Lot 44][Correctif] <action>`.

### Constats

- **L'index a suivi sans purge, alors que son `touched` est resté au
  2 novembre 2026, 22:05:10 UTC**, l'heure de la purge faite lors de la
  clôture du lot 2. Ce qui l'a rafraîchi n'est pas établi.
- **Le tableau des propriétés du Récapitulatif est limité à 200 lignes**, pour
  161 propriétés aujourd'hui. Au-delà de 200, il tronquerait sans le dire,
  exactement le piège que la consigne rappelle pour `action=ask`. Rien
  d'urgent : la suppression des 21 propriétés d'essai le ramènera à 140.
- **Le processus de la session a redémarré** entre les vérifications et la
  rédaction de ce rapport ; voir le canal direct plus haut.
