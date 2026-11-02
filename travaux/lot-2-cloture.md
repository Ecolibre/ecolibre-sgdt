# Lot 2 — clôture : arbitrages consignés, état clos

Exécuté le 2 novembre 2026, dans une session Claude Code cloud, sur la branche
`claude/focused-wright-wr4tlb`. Six écritures sur le wiki, sur cinq pages,
toutes réussies du premier coup. Les quatre vérifications passent ; celle qui
tranche, la troisième, rend 118 et 23, avant comme après les écritures.

## Étape 0 — état du dépôt

`git fetch origin`, puis `git status --porcelain` : sortie vide, aucun arrêt.
`HEAD` et `origin/main` au même commit, `2b59b31` : copie à jour, rien à
fusionner. Clone superficiel (`git rev-parse --is-shallow-repository` rend
`true`) ; aucune conclusion de ce rapport ne repose sur un `git log`.
`.claude/settings.local.json` : absent, au début comme à la fin de la tâche,
donc aucune règle.

Session wiki : `bin/wiki-login.sh` rend `Success`, compte `Cywil`.

## Lectures préalables

Avant la première écriture, chaque page cible a été lue par `bin/wiki-get.sh`
(`action=parse&prop=wikitext`), puis relue juste avant son écriture et
comparée à la première lecture : identique chaque fois. Pour l'étape 6, la
page du lot 2 a été relue après l'étape 1 et comparée au fichier envoyé à
l'étape 1 : identique.

Protections, par `prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full`
sur les cinq pages : `protection: []` et aucun motif de refus à l'écriture.
Révisions de départ : lot 2 1185, Limites connues 1712, Récapitulatif 1693,
lot 24 1488, Notes 1716.

Chaque ancrage a été trouvé une fois et une seule :

- étape 1 : la fin de l'appel de modèle, `}}`, dernière ligne de la page ;
- étape 2 : la page se termine par l'entrée 73, une ligne `# ` (pré-contrôle
  de `bin/wiki-append.sh`) ;
- étape 3 : `pointaient jusque-là vers les documents de spécification.`,
  dernier paragraphe de la section « Vocabulaires externes importés », suivi
  de `== Règles métier ==` ;
- étape 4 : `À traiter comme un confort, pas comme une urgence.`, dernier
  paragraphe de « Points ouverts », suivi de `== Dépendances ==` ;
- étape 5 : `== Date de clôture absente de l'index des lots ==`, note du
  31/10/26, la première sous « Les notes les plus récentes sont en haut. » ;
- étape 6 : `|Work_package_status=livré`, et la ligne
  `|Work_package_delivery_date=2026-07-25` suivie de
  `|Work_package_closure_report=`.

Les pages de référence de `CLAUDE.md` ont été récupérées avant la première
écriture. Seules les pages cibles et *Gestion des lots* ont alors été lues en
entier ; *Catégorie:Page de suivi* et *Procédure de clôture d'un lot* ne
l'ont été qu'après les écritures. Rien dans ces deux pages ne contredit ce
qui a été fait : l'étape 5 de la procédure prescrit la même purge de l'index.

Comptes de départ de la vérification 3, mesurés avant toute écriture :
`[[Item_ref::+]]` 118 ; `[[Part_of::+]]` 23 ;
`[[Category:Referenced item]]` 42 ;
`[[Category:Referenced item]][[Part_of::+]]` 0. Ce sont les chiffres que la
note de l'étape 5 inscrit : ils ont été remesurés avant d'être écrits.

## Écritures

| Étape | Page | Révision | Heure (UTC) | Résumé | Méthode |
|---|---|---|---|---|---|
| 1 | Lot 2 — Vocabulaires et intégrité des classes | 1185 → 1717 | 22:01:10 | `[Lot 2] Clôture - arbitrages consignés` | `wiki-put.sh` |
| 2 | Limites connues du Système de Gestion de Données Techniques | 1712 → 1718 | 22:01:37 | `[Lot 2] Clôture - concaténation de l'URI de base d'un import` | `wiki-append.sh` |
| 3 | Récapitulatif technique du Système de Gestion de Données Techniques | 1693 → 1719 | 22:02:10 | `[Lot 2] Clôture - précaution après changement d'URI d'import` | `wiki-put.sh` |
| 4 | Lot 24 — Adminsys autonome | 1488 → 1720 | 22:02:46 | `[Lot 2] Clôture - trois réglages de configuration portés au lot 24` | `wiki-put.sh` |
| 5 | Notes en attente de rangement | 1716 → 1721 | 22:03:21 | `[Lot 2] Clôture - le multivalué de Part_of reste non exercé` | `wiki-put.sh`, page entière |
| 6 | Lot 2 — Vocabulaires et intégrité des classes | 1717 → 1722 | 22:03:49 | `[Lot 2] Clôture - état clos au 2 novembre 2026` | `wiki-put.sh` |

Les six rendent `result: Success`. Après chaque `wiki-put.sh`,
`bin/wiki-verify.sh` a rendu `IDENTIQUE`. Étape 2 : pré-contrôle à 73
entrées, post-contrôle 73 → 74, l'ajout est la dernière entrée, un seul bloc
`<ol>` au rendu.

Préparation : chaque texte fourni a été recopié une fois dans un fichier à
part, puis une seconde fois dans la copie de la page, par remplacement exact
de l'ancrage. Avant chaque écriture, le fichier de page contenait le texte du
fichier à part une fois et une seule : les deux recopies concordent. Le
fichier d'ajout de l'étape 2 est exactement un saut de ligne suivi du texte
fourni.

## Les six diffs

### Étape 1

```diff
--- av/lot2.txt
+++ lot2-etape1.txt
@@ -5,4 +5,12 @@
 |Work_package_opening_date=2026-07-25
 |Work_package_delivery_date=2026-07-25
 |Work_package_closure_report=https://github.com/Ecolibre/ecolibre-sgdt/blob/3a0e7af4e6b4d2e0ade4e1d645d568311e04afad/travaux/ecolibre-sgdt-lot2.md
-}}
\ No newline at end of file
+}}
+
+== Ce qui est déjà tranché ==
+
+'''L'URI de base d'un vocabulaire importé est l'espace de noms de l'ontologie, jamais l'adresse de son document de spécification.''' Motif : SMW concatène le terme directement à l'URI de base, de sorte qu'une adresse de spécification produit des URI syntaxiquement valides et sémantiquement muettes - <code>Owl:differentFrom</code> s'exportait en <code>https://www.w3.org/TR/owl2-syntax/differentFrom</code>. Décidé le 25 juillet 2026. Le comportement de concaténation est consigné dans les [[Limites connues du Système de Gestion de Données Techniques]].
+
+'''L'adresse de spécification garde sa place après le <code><nowiki>|</nowiki></code> de la première ligne, comme libellé lisible.''' Motif : elle est utile au lecteur et sans effet sur la concaténation. Décidé le 25 juillet 2026, appliqué sur owl et sur skos.
+
+'''Une catégorie d'item ne s'ajoute jamais à la main.''' Motif : trois pages de documentation de formulaire portaient <code><nowiki>[[Category:X]]</nowiki></code> sans deux-points initial, au milieu d'une phrase, et s'étaient ainsi déclarées membres d'une classe, faussant le recensement des quatre classes. Décidé le 25 juillet 2026. La règle est posée sur chaque page de catégorie d'item.
\ No newline at end of file
```

### Étape 2

Sans contexte. La ligne `-` puis `+` de l'entrée 73 ne vient que du saut de
ligne final : son texte est inchangé.

```diff
--- av/limites.txt
+++ limites-1718.txt
@@ -100 +100,2 @@
-# '''Une requête d'égalité distingue la casse sur une propriété de type <code>Code</code>, et l'ignore sur une propriété de type <code>Keyword</code>.''' Mesuré le 29 octobre 2026, avec contre-épreuve : <code><nowiki>[[Inventory_number::ZZZZ]]</nowiki></code> rend 0, la requête discrimine donc bien. Sur <code>Inventory_number</code>, de type <code>Keyword</code>, <code><nowiki>[[Inventory_number::000C]]</nowiki></code> et <code><nowiki>[[Inventory_number::000c]]</nowiki></code> rendent la même page. Sur <code>Item_ref</code>, de type <code>Code</code>, <code><nowiki>[[Item_ref::002Y]]</nowiki></code> rend sa page et <code><nowiki>[[Item_ref::002y]]</nowiki></code> ne rend rien. La valeur restituée garde sa casse dans les deux cas : c'est l'appariement qui diffère, pas le stockage. Conséquence pour le contrôle d'unicité du lot 16 : une minuscule échappe à un contrôle écrit en majuscules sur la banque de conception, et n'y échappe pas sur la banque d'inventaire.
\ No newline at end of file
+# '''Une requête d'égalité distingue la casse sur une propriété de type <code>Code</code>, et l'ignore sur une propriété de type <code>Keyword</code>.''' Mesuré le 29 octobre 2026, avec contre-épreuve : <code><nowiki>[[Inventory_number::ZZZZ]]</nowiki></code> rend 0, la requête discrimine donc bien. Sur <code>Inventory_number</code>, de type <code>Keyword</code>, <code><nowiki>[[Inventory_number::000C]]</nowiki></code> et <code><nowiki>[[Inventory_number::000c]]</nowiki></code> rendent la même page. Sur <code>Item_ref</code>, de type <code>Code</code>, <code><nowiki>[[Item_ref::002Y]]</nowiki></code> rend sa page et <code><nowiki>[[Item_ref::002y]]</nowiki></code> ne rend rien. La valeur restituée garde sa casse dans les deux cas : c'est l'appariement qui diffère, pas le stockage. Conséquence pour le contrôle d'unicité du lot 16 : une minuscule échappe à un contrôle écrit en majuscules sur la banque de conception, et n'y échappe pas sur la banque d'inventaire.
+# '''L'URI de base d'un import de vocabulaire est concaténée telle quelle au terme, sans séparateur ajouté.''' Mesuré sur owl : avant correction, <code>MediaWiki:Smw import owl</code> portait <code>https://www.w3.org/TR/owl2-syntax/</code> et <code>Attribut:Owl:differentFrom</code> s'exportait en <code>https://www.w3.org/TR/owl2-syntax/differentFrom</code>, URI bien formée mais inexistante ; après correction en <code>http://www.w3.org/2002/07/owl#</code>, l'export rend <code>http://www.w3.org/2002/07/owl#differentFrom</code>, vérifié par <code>Spécial:Export RDF</code> le 29 octobre 2026. Conséquence déduite et non mesurée, sur skos : son URI de base, <code>http://www.w3.org/TR/skos-reference</code>, ne se terminait ni par <code>/</code> ni par <code>#</code>, de sorte qu'un terme s'y serait soudé - <code>skos-referenceConcept</code>. Aucun attribut skos n'existait pour le vérifier. Les deux URI ont été corrigées le 25 juillet 2026.
\ No newline at end of file
```

### Étape 3

```diff
--- av/recap.txt
+++ recap-etape3.txt
@@ -425,6 +425,8 @@
 Les URI de owl et de skos ont été corrigées le 25 juillet 2026 ; elles
 pointaient jusque-là vers les documents de spécification.
 
+Après un changement d'URI de base, les attributs qui dépendent de cet import sont réenregistrés sans modification, puis leur export RDF est vérifié. Que ce réenregistrement soit nécessaire n'a pas été mesuré : c'est une précaution, et l'export RDF est le contrôle qui tranche.
+
 == Règles métier ==
 
 Ces contraintes sont énoncées dans les info-bulles des formulaires. Elles sont
```

### Étape 4

```diff
--- av/lot24.txt
+++ lot24-etape4.txt
@@ -25,6 +25,8 @@
 
 Le verrou de propagation de changement bloque l'écriture d'une page pendant un temps qui se compte en jours. Les quinze pages touchées les 15 et 16 août 2026 étaient toutes rouvertes avant le 31 août, sans intervention. Deux pages du lot 13 sont bloquées depuis le 2 septembre 2026. Désactiver le réglage supprimerait l'attente, mais ce n'est pas un incident : ni le vidage de la file, ni la purge, ni la reconstruction ciblée ne l'accélèrent, et le temps suffit. À traiter comme un confort, pas comme une urgence.
 
+Trois réglages de <code><nowiki>LocalSettings.php</nowiki></code> sont demandés depuis le 25 juillet 2026 et n'appartenaient jusqu'ici à aucun lot : <code><nowiki>$wgNamespacePermissionLockdown</nowiki></code>, <code><nowiki>$wgGroupPermissions</nowiki></code>, et les réglages <code><nowiki>$smwg*</nowiki></code> autres que celui des dépendances de requêtes. Le [[Récapitulatif technique du Système de Gestion de Données Techniques]] les liste sous « Ce qui reste à documenter ». Leur enjeu a changé depuis : Lockdown étant écarté parce que SMW ne consulte pas les droits de lecture, le cloisonnement réel d'un wiki partenaire repose sur ces réglages, et aucune promesse de confidentialité ne peut être tenue devant un tiers avant de les avoir lus. Relevé lors de la clôture du lot 2.
+
 == Dépendances ==
 
 Rien en amont, mais tout changement de configuration se vérifie d'abord sur le miroir local du lot 22. L'incident du 18 août 2026, qui a mis le wiki hors service pour tout le monde faute d'une étape omise, est le motif de cette règle.
```

### Étape 5

```diff
--- av/notes.txt
+++ notes-etape5.txt
@@ -9,6 +9,10 @@
 Cette page ne porte aucune annotation sémantique et n'entre dans aucune requête.
 Les notes les plus récentes sont en haut.
 
+== Le séparateur multivalué de Part_of n'a jamais rien séparé ==
+''Cyril, le 02/11/26 - clôture du lot 2''
+Le <code><nowiki>+sep=,</nowiki></code> posé sur <code><nowiki>Part_of</nowiki></code> dans <code>Modèle:Referenced item</code> le 25 juillet 2026 n'a encore jamais été exercé. Mesuré le 2 novembre 2026 : <code><nowiki>[[Category:Referenced item]][[Part_of::+]]</nowiki></code> rend 0, sur 42 items référencés ; 23 pages portent la propriété dans tout le wiki, aucune n'est un item référencé. Le contrôle à faire le jour où un item référencé recevra deux parents : vérifier que la propriété y stocke deux valeurs de type Page, et non un littéral unique contenant une virgule.
+
 == Date de clôture absente de l'index des lots ==
 ''Cyril, le 31/10/26 - clôture du lot 1''
 L'index [[Gestion des lots]] n'affiche pas la date de clôture. Le fait <code><nowiki>Work_package_closure_date</nowiki></code> est bien stocké sur les pages de lot, vérifié sur le lot 1 le 29 octobre 2026, mais la requête de l'index ne le demande pas : ses colonnes sont numéro, état, objet, ouvert le, livré le, documents. Ajouter une colonne touche l'index de tous les lots et relève de la convention des pages de lot.
```

### Étape 6

```diff
--- lot2-1717.txt
+++ lot2-etape6.txt
@@ -1,9 +1,10 @@
 {{Lot
 |Work_package_number=2
-|Work_package_status=livré
+|Work_package_status=clos
 |Work_package_summary=Corriger les URI de base owl et skos, et retirer les catégorisations parasites.
 |Work_package_opening_date=2026-07-25
 |Work_package_delivery_date=2026-07-25
+|Work_package_closure_date=2026-11-02
 |Work_package_closure_report=https://github.com/Ecolibre/ecolibre-sgdt/blob/3a0e7af4e6b4d2e0ade4e1d645d568311e04afad/travaux/ecolibre-sgdt-lot2.md
 }}
 
```

## Vérifications

1. **Textes mot pour mot.** Les cinq pages relues par `action=parse` après la
   dernière écriture. Chaque texte fourni, pris comme un bloc entier, y figure
   une fois et une seule, à l'endroit prévu :
   - lot 2 : le bloc de l'étape 1 suit immédiatement `}}` ;
     `Work_package_status=clos`, et plus aucune occurrence de `livré` sur la
     page ; `Work_package_closure_date=2026-11-02` entre la date de livraison
     et le rapport de clôture, ce dernier inchangé ;
   - Limites connues : 74 entrées, la dernière ligne de la page est l'entrée
     fournie, et la page égale l'état d'avant suivi de cette seule ligne ;
   - Récapitulatif : le paragraphe suit celui qui date la correction d'owl et
     de skos, et précède `== Règles métier ==` ;
   - lot 24 : le paragraphe clôt « Points ouverts » et précède
     `== Dépendances ==` ;
   - Notes : voir la vérification 4.
2. **Gestion des lots.** Faits stockés sur la page du lot 2 (`smwbrowse`) :
   `Work_package_status -> clos`, `Work_package_closure_date -> 1/2026/11/2`.
   L'index rendu affichait encore « livré » à 22:05:00 UTC, une minute après
   l'écriture, et son `touched` était resté au `2026-10-20T13:03:22Z`. Purgé
   par `bin/wiki-purge.sh "Gestion des lots"` : `purged: true`,
   `linkupdate: true`. Après la purge, la ligne du lot 2 affiche « clos ».
   Compte de l'index : 45 lots, 3 en cours, 17 faits, 25 à venir,
   0 abandonné ; la somme égale le total.
3. **Qui tranche : annotations parasites.** Mesuré après les six écritures,
   une fois vérifié que le magasin SMW avait traité les cinq pages : le
   `_MDAT` de chacune égale l'heure de sa nouvelle révision.
   - `[[Item_ref::+]]` : **118** (118 avant) ;
   - `[[Part_of::+]]` : **23** (23 avant), liste identique avant et après,
     aucune des cinq pages écrites ;
   - `[[Category:Referenced item]]` : 42 (42 avant), aucune des cinq pages
     écrites ;
   - `[[Category:Referenced item]][[Part_of::+]]` : 0 (0 avant).

   Les contrôles passent : aucun `<nowiki>` ne manque.
4. **Notes.** 10 notes avant, 11 après. La nouvelle est la première sous la
   phrase d'en-tête et une ligne vide la suit. La page se termine toujours par
   `[[Catégorie:Page de suivi]]`. Retirer le bloc ajouté et sa ligne vide rend
   exactement la page d'avant : les notes antérieures sont intactes. Au rendu,
   11 sections, la nouvelle en tête.

Contrôles complémentaires, non demandés :

- Faits (`smwbrowse`) : Limites connues et Notes ne portent que `_INST`
  (Page de suivi), `_MDAT` et `_SKEY` ; le Récapitulatif, `_INST` (SGDT et
  Page de suivi), `_MDAT`, `_SKEY` et les `_ASK` de ses requêtes ; les lots 2
  et 24, les faits de leur modèle `Lot` et ses `_ASK`. Aucun `_ERRC`.
- Catégories : `Catégorie:Lot` pour les deux lots, `Catégorie:Page de suivi`
  pour les trois autres, plus `Catégorie:SGDT` pour le Récapitulatif ; aucune
  catégorie de suivi.
- Liens (`generator=links`) : 212 cibles sur les cinq pages, dont deux
  inexistantes, `Attribut:Has type` et `Attribut:Imported from`, liées depuis
  le seul Récapitulatif ; voir « Écarts et surprises ». Les deux liens ajoutés
  sont enregistrés : le lot 2 figure parmi les 28 pages qui lient les Limites
  connues, le lot 24 parmi les 15 qui lient le Récapitulatif.
- Rendu du lot 2 : une section « Ce qui est déjà tranché », trois énoncés en
  gras rendus entiers malgré les apostrophes, `[[Category:X]]` et `|` affichés
  comme du texte.
- Export RDF de `Attribut:Owl:differentFrom`, relu le 2 novembre 2026 :
  `<owl:ObjectProperty rdf:about="http://www.w3.org/2002/07/owl#differentFrom">`,
  conforme à l'entrée 74.
- Historique des pages d'import. `MediaWiki:Smw import owl`, révision 7
  (2025-03-23, import par défaut de SMW) : première ligne
  `https://www.w3.org/TR/owl2-syntax/ | [https://www.w3.org/TR/owl2-syntax/ Web Ontology Language (OWL)]` ;
  révision 253 (2026-07-25, 20:14:20 UTC) :
  `http://www.w3.org/2002/07/owl# | [https://www.w3.org/TR/owl2-syntax/ Web Ontology Language (OWL)]`.
  `MediaWiki:Smw import skos`, révision 5 :
  `http://www.w3.org/TR/skos-reference | [http://www.w3.org/TR/skos-reference Simple Knowledge Organization System (SKOS)]` ;
  révision 254 (20:14:51 UTC) :
  `http://www.w3.org/2004/02/skos/core# | [http://www.w3.org/TR/skos-reference Simple Knowledge Organization System (SKOS)]`.
  Le libellé après le `|` figurait déjà dans l'import par défaut : la
  correction l'a conservé, ce que dit bien « garde sa place ».
- La règle « ne doit jamais être ajoutée à la main » figure sur les quatre
  pages de catégorie d'item, Functional, Organic, Referenced et Physical,
  comme l'affirme l'étape 1.
- Les deux renvois de l'étape 4 sont exacts : la sous-section « Ce qui reste
  à documenter » du Récapitulatif liste bien les trois réglages, et l'entrée
  48 des Limites connues porte le constat sur Lockdown.

## Écarts et surprises

- **La moitié « avant correction » de l'entrée 74 n'a pas de mesure dans le
  dépôt.** L'entrée dit « Mesuré sur owl : avant correction, […]
  `Attribut:Owl:differentFrom` s'exportait en
  `https://www.w3.org/TR/owl2-syntax/differentFrom` ». Dans `travaux/`, cette
  adresse n'apparaît que dans le cadrage du lot 2 (`ecolibre-sgdt-lot2.md`,
  § 2, « Conséquence actuelle »), rédigé avant l'exécution. Le rapport du
  25 juillet 2026 (`rapport-2026-07-25.md`, § 3.1) précise que le contrôle par
  `Spécial:Export RDF` n'a pas été exécuté ce jour-là, l'écriture sur
  l'espace `MediaWiki:` ayant été refusée au compte. Ce qui est mesuré : la
  première ligne de l'import avant correction (révision 7, voir plus haut) et
  l'export après correction. Si l'export d'avant n'a pas été lu ailleurs,
  dans la conversation par exemple, la phrase présente une déduction comme
  une mesure. Écrite telle quelle, puisque le texte était fourni.
- **L'export corrigé avait déjà été vérifié le 26 juillet 2026**, pendant la
  session du lot 3 (`rapport-2026-07-26.md`, § 2.4). L'entrée cite le
  29 octobre 2026, que je n'ai pas de quoi vérifier ; les deux dates peuvent
  être justes. Relu de nouveau le 2 novembre 2026, conforme.
- **Les URI écrites entre balises `<code>` sans `<nowiki>` deviennent des
  liens externes cliquables.** Ce ne sont pas des exemples de syntaxe, et
  elles n'ont produit ni annotation ni lien interne. Mesuré par
  `prop=extlinks` : la page du lot 2 gagne un lien externe, vers
  `https://www.w3.org/TR/owl2-syntax/differentFrom` ; les Limites connues, qui
  ne contenaient aucune adresse `w3.org` avant l'écriture, en gagnent cinq,
  dont ce même lien vers une adresse que l'entrée dit elle-même inexistante.
  Le Récapitulatif écrit déjà ses URI de base de la même façon. Si ces liens
  ne sont pas voulus, un `<nowiki>` autour de chaque URI les supprimerait : une
  écriture de plus par page.
- **Deux liens vers des pages inexistantes, `Attribut:Has type` et
  `Attribut:Imported from`, partent du Récapitulatif.** Ils existaient avant
  l'écriture, puisque le diff de l'étape 3 n'ajoute aucun lien. Leur origine
  probable est la requête du tableau des propriétés, en tête de page, dont les
  colonnes `?Has type` et `?Imported from` renvoient aux pages de ces deux
  propriétés spéciales ; je ne l'ai pas vérifié.
- **Les résumés fournis ne suivent pas la forme de `CLAUDE.md`.** Le garde-fou
  2 prescrit `[Lot X][<à quel titre>] <action>` ; les six résumés de la
  consigne portent `[Lot 2] Clôture - <action>`, sans second crochet.
  Appliqués tels quels, comme à la clôture du lot 1, qui avait la même forme.
  L'étiquette de lot figure sur les six, ce qui préserve la datation.
- **L'index n'a pas bougé de lui-même dans la minute qui a suivi
  l'écriture**, et la purge a suivi aussitôt, comme le prévoit la consigne :
  cette mesure ne dit donc rien du délai du suivi des dépendances de
  requêtes. Comme pour le lot 1, l'index n'affiche pas la date de clôture, ce
  que la note du 31/10/26 consigne déjà.
- **Identifiants du wiki.** Ni `../ecolibre-sgdt-prive/` ni `.env` n'existent
  dans cette session cloud ; `bin/wiki-login.sh` a lu `WIKI_API`, `WIKI_USER`
  et `WIKI_PASS` dans l'environnement, comme le script le prévoit, et a écrit
  le fichier de cookies dans le dépôt (`.cookies.txt`, ignoré par git, non
  commité).
- **Un refus et une erreur, sans conséquence.** La commande
  `git check-ignore -v .cookies.txt; ls -la .cookies.txt`, lancée pour
  vérifier que le fichier de cookies était bien ignoré, a été refusée
  (« denied ») : l'interdiction `Read(./.cookies.txt)` s'applique aussi au
  shell, comme le note `CLAUDE.md`. Non renouvelée : `git status --porcelain`
  vide suffit à établir que rien d'autre que ce rapport n'est à commiter. Une
  lecture de l'historique des deux pages d'import en un seul appel a rendu
  `invalidparammix`, `rvlimit` n'admettant qu'un titre ; refaite page par
  page.
- Aucune question n'a été posée par le canal direct pendant l'exécution.
