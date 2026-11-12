# Lot 44 — clôture du lot 8 : arbitrages et idées écartées, garde de facette corrigée, deux entrées de registre

Exécuté le 12 novembre 2026, de 22 h 57 à 23 h 00 UTC pour les écritures, dans
une session Claude Code cloud, sur la branche `claude/zen-thompson-jx1aci`.
Cinq écritures sur cinq pages, toutes réussies du premier coup, sans arrêt ni
échange avec Cyril en cours d'exécution. Les textes sont ceux de la consigne,
au caractère près, vérifié par programme, hors un retrait d'affichage de
trois espaces, non recopié (premier constat). La vérification qui tranche passe :
après purge, `Ajouter une facette` ne porte plus que
`Catégorie:Documentation SGDT`, et `Catégorie:Facette` compte deux membres,
`Facette raccord` et `Facette végétal`.

## Étape 0 — état du dépôt

`git status --porcelain` : sortie vide, au début et avant l'écriture de ce
rapport ; aucun arrêt. `git fetch origin` : `HEAD` et `origin/main` au même
commit, `730f3ee`, rien à fusionner. Le clone est superficiel
(`git rev-parse --is-shallow-repository` rend `true`) : rien n'a été conclu
d'un `git log`. `.claude/settings.local.json` : absent au début et à la fin de
la tâche, donc aucune règle.

Session wiki : `bin/wiki-login.sh` rend `Success Cywil` au début, pour les
lectures, puis de nouveau juste avant la première écriture, comme le demande
la consigne. Le dossier `../ecolibre-sgdt-prive/` n'existe pas dans cette
session : `.cookies.txt` est écrit à la racine du dépôt, où
`git check-ignore -v` le confirme ignoré (`.gitignore:4`).

## Lectures et mesures préalables

- **Révisions de départ** : lot 8, 1351 ; `Ajouter une facette`, 418, du
  11 août 2026, jamais modifiée depuis ; `Modèle:Organic facet fitting`, 1763 ;
  `Choix imposés par l'outil`, 1755 ; Limites connues, 1747.
- **Protections**, par `prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full` :
  `protection: []` et aucun motif de refus, sur les cinq pages.
- **Relecture juste avant chaque écriture** : chaque page a été comparée, par
  `bin/wiki-verify.sh`, à la copie lue au départ. `IDENTIQUE` les cinq fois.
- **Ancrages** : chacun des anciens textes 2a, 2b, 3a et 3b figure une seule
  fois sur sa page ; les deux bornes de 2c sont uniques et encadrent un bloc
  de sept lignes, les lignes 14 à 20. Sur la page du lot 8,
  « == Points ouverts == » est unique et c'est la dernière section. Sur
  `Choix imposés par l'outil`, la ligne `----` est unique, précédée d'une
  ligne vide puis du dernier sous-point de la sixième entrée. Les Limites
  connues comptent 77 entrées, et la liste finit la page.
- **Catégorie:Facette avant les écritures** : trois membres, `Ajouter une
  facette`, `Facette raccord`, `Facette végétal` ; la requête SMW
  `[[Category:Facette]]` en rend trois aussi. `Ajouter une facette` portait
  `Catégorie:Documentation SGDT` et `Catégorie:Facette`, et ses faits
  `_INST` les deux mêmes. Elle tenait cette seconde catégorie de deux
  sources : le lien
  `<code>[[Category:Facette]]</code>`, non échappé, de l'étape 1 ; et
  l'exemple `<code>{{Facet|…}}</code>` de la même étape, qui transcluait
  réellement `Modèle:Facet`. Ce modèle émet lui-même `[[Category:Facette]]`,
  et son tableau s'affichait au milieu de la page : un `<table>` au rendu.
- **Modèle:Organic facet fitting** : zéro transclusion par `list=embeddedin`,
  au début puis juste avant l'écriture. Le bloc de formulaire
  `Formulaire:Organic item/bloc facette raccord` porte bien
  `minimum instances=0|maximum instances=1`, comme le dit le commentaire
  écrit.
- **Faits des textes, vérifiés avant d'écrire** :
  - `Modèle:Organic facet plant`, révision 764 du 2026-08-16T21:12:11Z,
    résumé « [Correctif] Émission inconditionnelle du #set et de la catégorie
    de facette — la garde sur Taxon_name confondait bloc vide et nom
    scientifique inconnu » : la correction du 16 août 2026 est confirmée ;
  - sa révision de création, 406 du 11 août 2026, annonce 37 propriétés, et
    son `#set` en compte 37 hors `Item_facet` : « trente-sept » est confirmé ;
  - `PageForms 5.8.1` et `SemanticMediaWiki 4.2.0`, par `meta=siteinfo` ;
  - `Lot 25 — Axe taxonomique` et `Attribut:Pollination requirement`
    existent ; `Attribut:Potential use`, `Attribut:Pollination type` et
    `Facette contenant` n'existent pas ;
  - le §5 de `travaux/lot-8-cadrage-facettes.md` laisse bien `Potential_use`
    « à confirmer ou à renverser », et recommande de ne pas créer de facette
    `Contenant` dès le lot 8.
- **Rendus de départ** : `Ajouter une facette`, cinq `<ol>` d'un seul `<li>`
  chacun, un `<table>`, un `<pre>` ; `Choix imposés par l'outil`, un `<ol>`,
  six `<ul>`, trente `<li>`.

## Écritures

| N° | Page | Révision | Heure (UTC) | Résumé | Outil |
|---|---|---|---|---|---|
| 1 | Lot 8 — Facettes de type d'item | 1351 → 1767 | 22:57:49 | `[Lot 44][Clôture du lot 8] arbitrages et idées écartées consignés` | `bin/wiki-put.sh` |
| 2 | Ajouter une facette | 418 → 1768 | 22:58:14 | `[Lot 44][Clôture du lot 8] correction de la garde prescrite et protection des exemples` | `bin/wiki-put.sh` |
| 3 | Modèle:Organic facet fitting | 1763 → 1769 | 22:58:51 | `[Lot 44][Clôture du lot 8] émission inconditionnelle, alignement sur la facette végétale` | `bin/wiki-put.sh` |
| 4 | Choix imposés par l'outil | 1755 → 1770 | 22:59:26 | `[Lot 44][Clôture du lot 8] entrée sur le mécanisme de facette` | `bin/wiki-put.sh` |
| 5 | Limites connues du Système de Gestion de Données Techniques | 1747 → 1771 | 22:59:54 | `[Lot 44][Clôture du lot 8] Page Forms ne sait pas masquer un bloc de modèle entier` | `bin/wiki-append.sh` |

Les cinq ont rendu `result: Success`, et `bin/wiki-verify.sh` a rendu
`IDENTIQUE` après chacune ; pour la cinquième, contre la page de départ
suivie d'un saut de ligne et de l'entrée. `bin/wiki-append.sh` a fait ses
propres contrôles : 77 entrées avant l'ajout et la liste finit la page ; 77
puis 78 entrées après, l'ajout étant la dernière ; au rendu, un seul `<ol>`.

Méthode : les textes de la consigne ont été recopiés dans des fichiers, puis
appliqués par un programme, par remplacement exact, en exigeant que chaque
ancien texte figure une seule fois. La section A est insérée devant
« == Points ouverts == », la section B ajoutée en fin de page, chacune
séparée de ce qui l'entoure par une ligne vide, comme l'est la section
existante. L'entrée de la tâche 4 est collée à la dernière ligne de la
sixième entrée, sans ligne vide, pour que la liste continue, et précède la
ligne vide et le `----`. L'indentation de trois espaces de certains textes de
la consigne n'a pas été recopiée : voir le premier constat.

## Les diffs

### Écriture 1, en schéma

Les deux ajouts sont les sections A et B de la consigne, au caractère près.
Le paragraphe des « Points ouverts » paraît retiré puis remis : la
révision 1351 n'avait pas de saut de ligne final, et il est inchangé.

```diff
@@ -8,6 +8,28 @@
 |Work_package_produces=Catégorie:Facette,Modèle:Facet,… (ligne inchangée)
 }}
 
+== Ce qui est déjà tranché ==
+
+(les six paragraphes de la section A, une ligne chacun, séparés par une ligne vide)
+
 == Points ouverts ==
 
-La page [[Ajouter une facette]] est rangée dans … (inchangée)
+La page [[Ajouter une facette]] est rangée dans … (inchangée)
+
+== Ce qui est écarté, et pourquoi ==
+
+(les trois paragraphes de la section B, une ligne chacun, séparés par une ligne vide)
```

### Écriture 2

```diff
--- ajouter (avant)
+++ ajouter (après)
@@ -7,17 +7,10 @@
 existantes.
 
 # '''Créer la page de registre.''' Nouvelle page nommée <code>Facette
-&lt;nom&gt;</code>, portant <code>{{Facet|covers=…|excludes=…|classes=…
-|display_models=…|properties=…}}</code> puis <code>[[Category:Facette]]</code>.
+&lt;nom&gt;</code>, portant <code><nowiki>{{Facet|covers=...|excludes=...|classes=...|display_models=...|properties=...}}</nowiki></code> puis <code><nowiki>[[Category:Facette]]</nowiki></code>.
 Le champ « exclut » n'est pas décoratif : c'est lui qui empêche, plus tard,
 la création d'une facette qui recouvre à moitié une existante.
-# '''Créer le modèle d'affichage.''' <code>Modèle:&lt;Classe&gt; facet
-&lt;nom&gt;</code> : un <code>#set</code> reprenant les propriétés de la
-facette, un tableau d'affichage, le tout enveloppé dans
-<code>{{#if:{{{champ_clé|}}}|…}}</code> (le champ clé étant le champ
-obligatoire de la facette) pour qu'un appel vide n'émette ni annotation ni
-catégorie. Émet <code>Item_facet=Facette &lt;nom&gt;</code> et
-<code>[[Category:Item à facette &lt;nom&gt;]]</code>.
+# '''Créer le modèle d'affichage.''' (le texte de l'étape 2 de la consigne, sur une seule ligne)
 # '''Créer le bloc de formulaire.''' Sous-page <code>Formulaire:&lt;Classe
 item&gt;/bloc facette &lt;nom&gt;</code>, contenant une section multi-instance
 à zéro ou une instance :
```

Le remplacement 2a joint les deux lignes de l'ancien exemple : la suite de la
ligne, avec le remplacement 2b, se trouve donc sur la même ligne que lui.

### Écriture 3

```diff
--- fitting (avant)
+++ fitting (après)
@@ -1,7 +1,14 @@
 <noinclude>
 {{Documentation}}
 </noinclude>
-<includeonly>{{#if:{{{Nominal_diameter|}}}|
+<includeonly><!-- Émission INCONDITIONNELLE du #set et de la catégorie : la présence de
+l'appel de ce modèle suffit à signifier que la facette s'applique. Le
+gabarit Page Forms est à instance optionnelle (minimum instances=0), donc
+l'appel n'existe que si l'utilisateur a ajouté la facette. Une garde sur
+Nominal_diameter confondrait le bloc est vide et le diamètre nominal est
+inconnu : un raccord dont on ignore le diamètre sortirait silencieusement
+de sa facette. Aligné le 12 novembre 2026 sur Modèle:Organic facet plant,
+corrigé le 16 août 2026 pour le même motif. -->
 {{#set:
 |Connection_gender={{{Connection_gender|}}}
 |Thread_designation={{#arraymap:{{{Thread_designation|}}}|,|@@@|@@@|,}}
@@ -18,7 +25,6 @@
 }}
 
 [[Category:Item à facette raccord]]
-}}
 
 {| class="wikitable" style="width:100%"
 |+ Facette raccord
```

### Écriture 4, en schéma

```diff
@@ -34,6 +34,11 @@
 #* '''Ce qui l'impose.''' C'est le seul mécanisme d'import de Semantic MediaWiki. … (inchangée)
 #* '''Sans cette contrainte.''' Les alignements seraient des données comme les autres, … (inchangée)
 #* '''Coût d'une reprise.''' Les alignements se transposent sans difficulté, … (inchangée)
+# '''Le bouton d'ajout d'une facette.'''
+#* '''Le choix.''' … (les quatre sous-points de l'entrée de la consigne, une ligne chacun)
+#* '''Ce qui l'impose.''' …
+#* '''Sans cette contrainte.''' …
+#* '''Coût d'une reprise.''' …
 
 ----
```

### Écriture 5

Une ligne ajoutée en fin de page, l'entrée de la consigne, devenue
l'entrée 78. Rien d'autre : la page relue est exactement la révision 1747,
un saut de ligne, et l'entrée.

## Vérifications

1. **Textes mot pour mot.** Les cinq pages relues par `action=parse` après
   la dernière écriture, puis comparées par programme aux textes de la
   consigne. Pour chaque page : chaque texte fourni y figure une fois, chaque
   ancien texte remplacé zéro fois, et défaire les insertions et les
   remplacements redonne exactement la révision de départ, donc rien d'autre
   n'a changé :
   - lot 8 : section A une fois, juste devant « == Points ouverts == » ;
     section B une fois, en fin de page ; sans elles, la révision 1351 ;
   - `Ajouter une facette` : 2a, 2b et 2c une fois chacun, leurs anciens
     textes zéro fois ; défaits, la révision 418 ;
   - le modèle : 3a et 3b une fois, leurs anciens textes zéro fois ; défaits,
     la révision 1763 ;
   - `Choix imposés par l'outil` : l'entrée une fois, juste devant la ligne
     vide et le `----` ; 7 entrées ; sans elle, la révision 1755 ;
   - Limites connues : l'entrée une fois, dernière ligne de la page ;
     78 entrées ; la page égale la révision 1747 suivie de l'entrée.
2. **Qui tranche : Catégorie:Facette.** Après
   `bin/wiki-purge.sh "Ajouter une facette"` (`purged: true`,
   `linkupdate: true`, `touched` à 22:58:25), `prop=categories` sur
   `Ajouter une facette` rend **`Catégorie:Documentation SGDT` seule**, et
   `Catégorie:Facette` compte **deux membres, `Facette raccord` et
   `Facette végétal`**. Côté SMW, `[[Category:Facette]]` rend les deux mêmes,
   et les faits de `Ajouter une facette` se réduisent à `_INST`
   (`Documentation_SGDT`), `_MDAT` (22:58:14) et `_SKEY`. La page ne
   transclut plus aucun modèle, `Modèle:Facet` compris.
3. **Tâche 3.** Le modèle relu ne contient plus aucun `{{#if:`, et une seule
   paire `<includeonly>`, ligne 4, et `</includeonly>`, ligne 52. L'écart
   entre le nombre de `{{` et celui de `}}` vaut 0 avant comme après. Mis à
   l'épreuve par `action=parse` sur un texte, sans rien enregistrer : l'appel
   vide `{{Organic facet fitting}}` pose désormais la catégorie
   `Item à facette raccord` ; l'appel avec `Connection_gender=M` et
   `Nominal_diameter=20` pose la même, rend un tableau et aucun `}}` parasite.

Contrôles complémentaires, non demandés :

- **Annotations** (`smwbrowse`) : la page du lot 8 porte les faits de son
  appel de modèle, `Work_package_status` toujours à `livré`, plus trois
  `_ASK`, `_INST` (`Lot`), `_MDAT` et `_SKEY` ; `Choix imposés par l'outil`
  et les Limites connues, `_INST` (`Page_de_suivi`), `_MDAT` et `_SKEY` ; le
  modèle, `_SKEY` seul. Chaque `_MDAT` est l'heure de l'écriture. Aucun
  `_ERRC`.
- **Catégories** : inchangées sur quatre pages ; `Ajouter une facette` a
  perdu `Catégorie:Facette`. Une seule catégorie de suivi sur les cinq,
  « Pages avec des liens de fichiers brisés » sur le modèle, antérieure :
  voir les constats.
- **Liens** (`generator=links`) : 25 cibles sur les cinq pages, une seule
  inexistante, `Modèle:Organic facet fitting/doc`, appelée par
  `{{Documentation}}`, antérieure elle aussi. Le lien vers le lot 25 est
  enregistré : `list=backlinks` sur `Lot 25 — Axe taxonomique` rend la page
  du lot 8.
- **Rendus** : page du lot 8, trois sections dans l'ordre voulu, les éléments
  de code affichés tels quels, `{{#info:}}` compris, aucun `<pre>` ;
  `Choix imposés par l'outil`, un `<ol>`, sept `<ul>`, trente-cinq `<li>`,
  sept entrées, la dernière « Le bouton d'ajout d'une facette. » ;
  `Ajouter une facette`, plus aucun `<table>`, un `<pre>`, les exemples
  affichés tels quels dans leur `<code>`, et quatre `<ol>` : voir le point C.

## Écarts et surprises

### Questions

**A.** Le point ouvert de la page du lot 8 est résolu par la tâche 2, mais la
page le dit toujours ouvert. Il dit : « La page Ajouter une facette est
rangée dans Catégorie:Facette : elle apparaît donc dans la liste du Registre
des facettes comme si elle en était une. » Depuis la révision 1768, elle n'y
est plus. La consigne disait de ne toucher à rien d'autre sur cette page : le
paragraphe est intact. Faut-il le retirer des « Points ouverts » ?
Suggestion : le remplacer par une phrase qui le dit résolu le 12 novembre
2026 par la révision 1768 de `Ajouter une facette`, après la purge du
point B, pour que la page et le registre disent la même chose.

**B.** Le `Registre des facettes` affiche toujours trois facettes. Sa liste
est une requête `#ask` sur `[[Category:Facette]]`, et cette requête rend
désormais deux résultats par `action=ask`. Le rendu de la page, lui, listait
encore « Ajouter une facette, Facette raccord, Facette végétal » à 23:04:17,
six minutes après l'écriture 2, et son `touched` est resté au
2026-08-12T12:34:17Z : le retrait de `Ajouter une facette` de la catégorie
n'a pas invalidé son cache. Je ne l'ai pas purgé, la consigne demandant de signaler plutôt que
de corriger. Faut-il le purger ? Suggestion : oui, par
`bin/wiki-purge.sh "Registre des facettes"`, puis vérifier que la liste
rendue ne compte plus que deux facettes. Le symptôme est celui de l'entrée 77
des Limites connues, qui ne parle que de l'index des lots : c'en est un
second cas, sur une autre page et pour un changement de catégorie.

**C.** Les listes numérotées de `Ajouter une facette` sont cassées depuis la
révision 418. Chaque étape y est repliée sur plusieurs lignes ; au rendu,
seule la première reste dans l'élément de liste, la suite tombe dans un
paragraphe, et l'étape suivante ouvre une nouvelle liste numérotée 1. Mesuré
avant les écritures : cinq `<ol>` d'un seul `<li>`. Le remplacement 2c met
l'étape 2 sur une seule ligne, si bien que l'étape 3 la suit directement et
rejoint sa liste : la numérotation affichée passe de 1, 1, 1, 1, 1 à
1, 1, 2, 1, 1, en quatre `<ol>` pour cinq `<li>`. Dans l'étape 1, un
`<code>` ouvert en fin de première ligne ne se ferme qu'à la ligne suivante
(`<code>Facette` puis `&lt;nom&gt;</code>`), ce qui produit au rendu un
élément `<code>` vide. Faut-il remettre chaque étape sur une seule ligne
logique ? Suggestion : joindre les lignes de suite des étapes 1, 3, 4 et 5
par une espace unique, sans changer aucun autre caractère. L'étape 3 contient
un bloc `<pre>` de plusieurs lignes et un paragraphe après lui : y ouvrir le
`<pre>` sur la ligne de l'étape et poursuivre après `</pre>` sur la même
ligne, la balise masquant ses sauts de ligne au découpage en listes. Ce
dernier point est à éprouver d'abord au bac à sable. Contrôle qui tranche :
un seul `<ol>` de cinq `<li>` au rendu.

**D.** Il manque des guillemets dans la phrase sur la garde, qui se lit
comme cassée. `Modèle:Organic facet plant`, sur lequel 3a dit s'aligner,
écrit : « Une garde sur Taxon_name confondrait « le bloc est vide » et « le
nom scientifique est inconnu » ». Le texte de 3a, écrit tel que fourni,
porte : « Une garde sur Nominal_diameter confondrait le bloc est vide et le
diamètre nominal est inconnu ». Même chose dans l'étape 2 écrite en 2c :
« confondrait deux choses différentes, le bloc est vide et cette valeur-là
est inconnue ». Si la consigne d'origine portait des guillemets, ils se sont
perdus en route. Faut-il les remettre ? Suggestion : une écriture par page,
qui ajoute les guillemets et rien d'autre. Sur le modèle, qui reste à zéro
transclusion, autour de « le bloc est vide » et de « le diamètre nominal est
inconnu », cette seconde expression étant repliée sur deux lignes entre
« est » et « inconnu ». Sur `Ajouter une facette`, autour de « le bloc est
vide » et de « cette valeur-là est inconnue ».

### Constats

- **L'indentation des textes 3a et 3b, et de la première ligne de 2a, n'a
  pas été recopiée.** La consigne les montre en retrait de trois espaces ;
  la page n'a pas ce retrait, et les anciens textes ne s'y trouvaient qu'une
  fois ce retrait ôté. Je l'ai donc ôté des nouveaux textes comme des
  anciens : les lignes du commentaire du modèle commencent en première
  colonne, comme celles de `Modèle:Organic facet plant`. Aucun autre
  caractère n'a changé.
- **Le remplacement 2a change l'ellipse « … » en trois points.** Appliqué
  tel que fourni. Ailleurs sur la page, les exemples de l'étape 3 gardent
  l'ellipse.
- **« l'arbitrage a tenu quinze lots »**, dans la section B, est écrit tel
  que fourni, mais mon compte donne autre chose. D'après les états de l'index
  des lots, 46 lots par `action=ask` sur `[[Category:Lot]]`, treize lots ont
  été ouverts après le lot 8 : 9, 10 et 11 livrés, 12, 13, 22, 27, 28, 33 et
  34 clos, 21, 24 et 44 ouverts. Les vingt-cinq autres numéros au-delà de 8
  sont à l'état identifié. Je ne sais pas ce que compte « quinze ».
- **« à l'ouverture du lot »**, dans le sous-point « Sans cette contrainte »
  de la nouvelle entrée 7 de `Choix imposés par l'outil`, ne porte pas de
  numéro. Sur cette page, le lot 8 n'est nommé qu'au sous-point suivant.
  Écrit tel que fourni.
- **Une forme rectifiée préexiste sur `Choix imposés par l'outil`** :
  l'entrée 2, sous-point « Sans cette contrainte », porte « pas une chaine de
  caractères à découper ». Non touchée.
- **Le lot 8 reste à l'état `livré`.** La consigne ne demandait pas le
  passage à `clos`, et `Work_package_status` n'a pas changé.
- **Les liens enregistrés de la page du lot 8 étaient en retard.** Avant
  l'écriture, `prop=links` en donnait 10 quand le rendu en listait 12 ;
  après, 13, soit les 12 plus le lot 25. Je n'ai pas relevé lesquels
  manquaient. Pendant ce retard, un `list=backlinks` sur les deux pages
  manquantes ne voyait pas la page du lot 8 ; l'écriture l'a résorbé.
- **La catégorie de suivi et le lien rouge du modèle sont antérieurs.**
  « Pages avec des liens de fichiers brisés » vient de `{{Documentation}}`,
  qui appelle `Fichier:Template-info.svg`, absent du wiki, et le lien rouge
  vers `Modèle:Organic facet fitting/doc` du même modèle. Déjà relevé dans
  `travaux/lot-6-cloture.md`. Seize pages portent cette catégorie, presque
  toutes des modèles.
- **Canal direct** : aucun échange avec Cyril pendant l'exécution.
  Confirmations : je ne les vois pas ; `.claude/settings.local.json` est
  absent au début et à la fin, donc aucune autorisation permanente n'a été
  inscrite.
