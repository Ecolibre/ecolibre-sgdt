# Ecolibre — SGDT wiki sémantique

Wiki : https://wiki.ecolibre.org — MediaWiki + Semantic MediaWiki, Page Forms,
Scribunto/Lua, Semantic Result Formats.

## Pages de référence sur le wiki

Le wiki fait autorité, pas ce fichier. Lire ces pages à l'ouverture d'un lot,
et vérifier qu'un fait nouveau n'y figure pas déjà avant de l'écrire ailleurs.

- `Catégorie:Page de suivi` — la liste de ces pages et le rôle de chacune.
  Point d'entrée.
- `Gestion des lots` — l'index des lots, construit par requête. Ne jamais y
  ajouter de ligne à la main.
- `Limites connues du Système de Gestion de Données Techniques` — les faits
  mesurés sur cette installation, les dettes et les limites assumées. Y
  chercher avant de diagnostiquer.
- `Récapitulatif technique du Système de Gestion de Données Techniques` —
  l'état du modèle de données.
- `Notes en attente de rangement` — le sas des idées non rangées.
- `Procédure de clôture d'un lot` — comment un lot passe de livré à clos.

## Outils disponibles
- `bin/wiki-login.sh` — ouvrir la session (à faire une fois par session de travail)
- `bin/wiki-get.sh "Page"` — lire le wikitexte d'une page (lecture seule, GET
  uniquement, hôte en dur ; réutilise la session de `wiki-login.sh` sans jamais
  manipuler d'identifiant)
- `bin/wiki-put.sh "Page" fichier.txt "résumé" [--createonly]` — écrire une page ;
  `--createonly` fait échouer l'appel — code de sortie non nul, `articleexists`
  sur stderr — si la page existe déjà, au lieu de l'écraser ; à utiliser pour
  toute création. (Le code de sortie n'était pas vérifié avant le 28 août 2026 :
  l'API refusait bien l'écriture, mais le script sortait 0. Corrigé, commit
  `0913ef8`.)
- `bin/wiki-api.sh "chaîne de paramètres"` — exécuter n'importe quel appel de
  lecture de l'API MediaWiki en GET (`browsebysubject`, `siteinfo`, `allpages`,
  `backlinks`, `expandtemplates`, `intestactions`…) ; lecture seule stricte,
  refuse les actions d'écriture connues du cœur MediaWiki et des extensions
  locales (`pfautoedit`, `sfautoedit`, `smwtask`), et tout paramètre `action=`
  dupliqué. `--facts "subject=...&ns=..."` : raccourci pour
  `action=browsebysubject`, affiche une ligne `propriété -> [valeurs]` par
  fait au lieu du JSON brut. `action=purge` exige une requête POST : hors du
  périmètre GET de ce script, voir `bin/wiki-purge.sh`.
- `bin/wiki-purge.sh "Titre 1|Titre 2"` — purger une ou plusieurs pages
  (POST, `forcelinkupdate=1` systématique ; `action=purge` exige POST
  mais pas de jeton CSRF). Aucun autre paramètre, aucune autre action
  que purge.
- `bin/wiki-upload.sh fichier.jpg` — téléverser un fichier local sous son nom
  de base (aucun renommage par le script) ; jamais `ignorewarnings`, jamais
  `bot=1` : un nom déjà pris fait échouer l'appel (`result` différent de
  `Success`) au lieu d'écraser, équivalent de `--createonly` côté
  `wiki-put.sh`.

  **Seule exception admise à « jamais `ignorewarnings` », et elle ne passe pas
  par ce script** : l'avertissement `duplicate-archive`, qui signale un contenu
  identique présent dans l'**archive des fichiers supprimés**, pas sur un nom
  occupé. Il bloque tout ré-téléversement d'une photo dont la version mal
  nommée a été supprimée — cas réel de la tâche 11 du lot 9. Il ne peut rien
  écraser : la cible est libre. Conditions à réunir avant de le lever, toutes
  les trois : le nom cible vérifié `missing` en ligne **immédiatement avant**
  l'appel ; l'autorisation explicite de Cyril, demandée au cas par cas ;
  et un script jetable de session, jamais une modification de
  `bin/wiki-upload.sh`, qui doit rester sans `ignorewarnings`. Tout autre
  avertissement (`exists`, `duplicate`, `badfilename`…) reste bloquant.

**Forme d'appel canonique** : toujours invoquer ces scripts en relatif à la racine
du dépôt, sous la forme `bin/wiki-get.sh ...` / `bin/wiki-put.sh ...` — jamais
`./wiki-get.sh` ni de chemin absolu. Les règles de permission dans
`.claude/settings.json` matchent sur ce préfixe exact ; un autre chemin passerait
à côté des règles `allow` et redemanderait confirmation à chaque appel.

**`.env` et `.cookies.txt` ne vivent pas dans ce dépôt** : cherchés d'abord
dans `$SGDT_PRIVE` (défaut `../ecolibre-sgdt-prive/`, voisin du dépôt), puis
dans le dépôt lui-même par compatibilité. `wiki-get.sh`/`wiki-api.sh`
dégradent en lecture anonyme si introuvables ; `wiki-login.sh`/`wiki-put.sh`/
`wiki-purge.sh` échouent avec un message donnant les deux chemins cherchés.

Les copies locales de pages vont dans `pages/`.

## Dossier `travaux/`

`travaux/` existe à la racine du dépôt et est synchronisé par **Syncthing**,
dans les deux sens, avec le téléphone Android de Cyril.

**Tout fichier destiné à être lu dans une conversation Claude — rapports de
session, cadrages, propositions et amendements de lot, notes de passation —
s'écrit dans `travaux/` et nulle part ailleurs.** Aucune copie ailleurs dans
le dépôt. Les fichiers déposés depuis le téléphone y sont lisibles
directement, sans étape intermédiaire.

**Le rapport de fin de session affiché dans le terminal est rédigé en
français, comme les fichiers de rapport eux-mêmes.** Cyril travaille en
français et relaie ces messages dans des conversations en français.

**Rien de secret n'y va** : le dépôt est public, la synchronisation
Syncthing est automatique alors que le commit ne l'est pas, et Syncthing ne
lit pas `.gitignore` — un fichier non versionné déposé dans `travaux/` est
quand même envoyé au téléphone.

`travaux/` porte le récit de la construction du système — pourquoi les
choses ont été décidées ainsi. **Ce n'est pas une zone tampon et ça n'a pas
vocation à être nettoyé.** La racine porte ce qui dit *comment* travailler :
`CLAUDE.md`, `installation-nouveau-poste.md`, `demandes-adminsys.md`,
`Serveur3/`. Cette documentation-là ne bouge pas.

**Le `.gitignore` de `travaux/` suppose que le dossier reste plat.** Seul le
markdown y est versionné (`travaux/*` puis `!travaux/*.md`) ; tout le reste
déposé depuis le téléphone reste invisible pour git tant qu'aucune exception
explicite n'est ajoutée. Un fichier placé dans un sous-dossier de `travaux/`
ne serait pas réinclus par cette négation — si un sous-dossier devient
nécessaire un jour, le `.gitignore` devra être repris.

## Serveur

| | |
|---|---|
| Accès SSH | `clibert@serveur3.initiative.place` |
| Cœur MediaWiki, **partagé** | `/home/fuzzy/mediawiki/mediawiki-1.39/` |
| Configuration du site | `LocalSettings_ecolibre.php` |
| Base de données | `mediawiki_ecolibre_prod` |

**Règle impérative — préfixer tout script de maintenance par
`SERVER_NAME=wiki.ecolibre.org`.** L'aiguilleur du cœur teste
`$_SERVER['SERVER_NAME']` pour choisir quel wiki de la ferme charger. Cette
variable **n'existe pas en CLI** : un script lancé sans elle ne cible aucun
wiki, ou pire, celui par défaut.

```
SERVER_NAME=wiki.ecolibre.org php maintenance/runJobs.php
```

**Le cœur est partagé par toute la ferme** : une commande de maintenance mal
ciblée ne touche pas seulement Ecolibre. Ne jamais lancer un script sans avoir
ciblé le wiki.

Ce que Cyril peut lancer seul, et ce qui relève de fuzzy : voir
`demandes-adminsys.md`.

## Garde-fous d'exécution (toute édition sur le wiki)
1. **Lire avant d'écrire.** Toujours récupérer le wikitexte courant
   (`wiki-get.sh` / `action=parse&prop=wikitext`), calculer le diff, le proposer,
   puis écrire. Jamais d'écriture à l'aveugle.
2. **Une modification = une édition = un résumé explicite.** Format en usage
   depuis le lot 6 : `[Lot X][<à quel titre>] <action>` — et non
   `[Lot X] <point> — <action>` comme l'écrivait cette règle jusqu'au lot 8.
   Rend le travail annulable page par page.

   **Le second crochet indique à quel titre l'écriture a lieu** : une tâche
   numérotée quand l'écriture en relève (`[Tâche 7]`), un libellé explicite
   sinon (`[Complément]`, `[Clôture]`, `[Amendement]`…). La règle est le
   critère, pas la liste — un libellé nouveau est légitime dès lors qu'il dit
   à quel titre on écrit. **Reste interdit : un crochet vide, ou décoratif**,
   qui n'apprend rien à qui relit l'historique.

   Une écriture qui ne relève d'aucun lot en cours porte `[Correctif]
   <action>`, jamais un numéro de lot : ne jamais réserver un numéro de lot
   pour une correction ponctuelle.
3. **`createonly=1`** sur toute création de page. Si la page existe déjà, l'appel
   doit échouer et remonter (code de sortie non nul), jamais écraser. Effectif
   par le code de sortie depuis le 28 août 2026 seulement — avant, `wiki-put.sh`
   affichait l'erreur `articleexists` mais sortait 0 ; un script d'orchestration
   qui testait `$?` ne voyait pas le refus.
4. **Aucune nouvelle référence Base36 ne doit être créée hors ligne** : le compteur
   est en production, toute création locale risque une collision.
5. **Pages protégées — la vérification est nécessaire et insuffisante.**
   Vérifier `prop=info&inprop=protection` avant d'écrire, et remonter si le
   niveau dépasse les droits du compte bot. Mais **cette requête n'attrape que
   les protections natives** : elle ne voit ni les restrictions de l'extension
   **Lockdown** (par espace de noms), ni les verrous posés par Semantic
   MediaWiki. Un `protection: []` ne prédit donc pas qu'une écriture passera.

   **Un refus d'écriture est un résultat normal, pas une anomalie** — à
   traiter comme tel, sans suspecter d'abord un bug de script. Deux cas
   rencontrés le 16 août 2026, tous deux **invisibles à `prop=info`** :
   `smw-change-propagation-protection` (15 pages `Attribut:` verrouillées en
   modification, verrou orphelin — voir `demandes-adminsys.md`) et
   `duplicate-archive` au téléversement (contenu identique présent dans
   l'archive des fichiers supprimés).
6. **Périmètre — la règle porte sur les modèles en service.** Ne modifier un
   modèle ou un formulaire **transclus par des pages existantes** que dans le
   cadre d'une action explicitement validée par Cyril. Cela couvre les quatre
   classes d'items (Functional, Organic, Referenced, Physical) **et les
   modèles de facette** (`Organic facet plant`, `Physical facet plant`,
   `Organic facet fitting`…), dont une modification se propage à toutes les
   pages qui les appellent.

   **Le critère est la mise en service, pas le nom** : une liste de noms sera
   toujours en retard d'un modèle. Vérifier par `list=embeddedin` plutôt que
   par cette énumération. `Modèle:Organic facet fitting` illustre la nuance —
   il est bien dans la classe visée, mais à **zéro transclusion** au 16 août
   2026, donc modifiable sans le même risque : aucune page existante n'en
   dépend.

   Le reste est reconnaissance en lecture seule, ou rédaction à soumettre
   avant publication.

## Règles impératives (modèle de données)
- **Aucune virgule dans les noms de tableaux kanban ni de pages** : la virgule est
  le délimiteur multi-valeurs partout dans le modèle.
- **Convention de nommage des fichiers média** (appliquée aux 73 photos du
  lot 9) : `ECL-<lieu>-<plante>-<AAAA-MM-JJ>_<nn>.jpg` — tiret entre les
  4 champs principaux (ECL, lieu, plante, date+numéro), underscore à
  l'intérieur d'un champ multi-mots (`Buisson_Cerzat`, `Ail_elephant`) et
  entre la date et le numéro (`2026-08-07_01`). Jamais d'espace, jamais
  d'accent. Le tiret est le séparateur de champs, l'underscore appartient au
  contenu d'un champ : un découpage se fait sur le tiret, jamais sur
  l'underscore. Deux fichiers du lot ont dû être renommés après refus
  badfilename de MediaWiki (espace parasite) — vérifier les noms avant de
  téléverser, pas après.
- Page bac à sable pour les essais : `Utilisateur:Cywil/Bac à sable`.

## Corrections sur les modèles — liste unique et numérotation de référence

**Cette liste fait foi.** Jusqu'au lot 9, deux entrées vivaient ici pendant
qu'une numérotation informelle à cinq circulait dans les rapports du lot :
« la n° 3 » désignait deux choses différentes selon le document. Les numéros
ci-dessous sont désormais les seuls valides ; les entrées fermées restent
listées avec leur numéro, jamais supprimées ni renumérotées — sans quoi un
renvoi passé pointerait sur autre chose. Une correction nouvelle prend le
numéro suivant.

| N° | Objet | État |
|---|---|---|
| 1 | **Module d'audit Base36 : détection des doublons** (en plus des trous). | **ouverte** |
| 2 | Les objets physiques rejoignent-ils la séquence Base36 auto-incrémentée ? | **fermée** — lot 9, 13/08/2026 : non, deux banques distinctes (`Item_ref` pour les trois classes de conception, `Inventory_number` pour les physiques). |
| 3 | **`Module:Base36` s'arrête au tiret** (`clean:match("[%w]+")`) : une référence préfixée serait silencieusement mal lue. C'est pourquoi `ECL` est un affichage, jamais une valeur stockée. | **ouverte** |
| 4 | `+sep=,` sur `Part_of` de `Modèle:Referenced item`. | **fermée** — était déjà en place avant le lot 9, constaté en tâche 7bis (fait vérifié en ligne, pas supposé). |
| 5 | Filtre de catégorie manquant sur les requêtes `Part_of` des modèles d'item. | **fermée** — 15/08/2026, en deux éditions `[Correctif]` : `Modèle:Physical item` (« Éléments contenus », revid 544) et `Modèle:Referenced item` (« Composants enfants / BOM », revid 549). |

Les n° 1 et 3 portent toutes deux sur `Module:Base36` : un lot dédié devrait
les traiter ensemble, hors phase de saisie.

À ne pas confondre avec les n° 1 et 3 : `Template:Item numbering audit`
interroge `[[Item_ref::+]]` **sans filtre de catégorie**, et ne voit donc pas
la banque physique, qui vit dans `Inventory_number`. Aucune donnée n'est
corrompue — l'audit est simplement aveugle à la seconde banque. L'absence de
filtre est déjà consignée dans les *Limites connues du SGDT* ; la conséquence
sur la banque physique est notée ici. À traiter avec le lot de numérotation.

## Leçons de méthode (wiki et outillage)

- **Un retour à la ligne à l'intérieur de `[[ ]]` casse silencieusement un
  lien MediaWiki.** Aucune erreur d'API à l'écriture, mais le lien est absent
  de `pagelinks` et donc de `list=backlinks`. Toujours écrire un lien sur une
  seule ligne, et contrôler par `list=backlinks` après toute édition qui en
  ajoute un. Ne jamais replier une balise `[[ ]]` pour respecter une largeur
  de ligne, même quand le titre est long.

  **Le pli peut venir de la mise en page d'un rapport, pas du texte.** Un lien
  recopié depuis un document de `travaux/` — proposition, cadrage, note de
  passation — arrive souvent replié par la largeur du document, et le pli
  n'appartient alors pas au contenu : il appartient à l'affichage. Le remettre
  sur une seule ligne au moment de la copie n'est pas une modification du
  texte, c'est ce qui le préserve. Évité de justesse le 25 août 2026 sur
  `Modèle:Physical facet plant/doc`, dont la consigne demandait de recopier un
  texte « sans modification » : le lien vers `Catégorie:Item à facette
  végétal` y était replié sur deux lignes.

- **`+sep=` est par propriété et sa position compte.** Dans un `#set`,
  `|+sep=` s'applique à la propriété qui le précède immédiatement, pas au
  bloc entier. Le déplacer casse le découpage de la propriété concernée.

- **SMW ne rogne pas les espaces des valeurs intermédiaires.** Avec
  `|+sep=,`, `A, B, C` produit `A`, ` B`, ` C`. Une propriété de type Page
  absorbe l'espace par normalisation du titre ; une propriété de type Texte
  le conserve et met en défaut ses valeurs autorisées.

- **Le widget `tokens` de Page Forms insère un espace après le délimiteur.**
  Malgré `delimiter=,`, il écrit `A, B`. À normaliser côté modèle
  (`#arraymap`), pas à espérer côté formulaire.

- **Modèle avant formulaire.** Poser un `+sep=` ou un `#arraymap` sur un
  modèle recevant une valeur unique est inerte. L'ordre inverse ouvre une
  fenêtre où des valeurs multiples peuvent être enregistrées dans un modèle
  incapable de les stocker.

- **Une vérification par formulaire n'est jamais en lecture seule.** Rouvrir
  un item pour inspecter ses champs, c'est risquer de l'enregistrer modifié
  (pré-remplissage, ré-enregistrement de valeurs déjà saisies).

- **Avant un renommage de paramètre, `embeddedin` et la recherche plein texte
  ne suffisent jamais seuls — il faut les deux, puis une lecture
  individuelle.** L'index de recherche plein texte indexe le contenu
  **rendu**, pas le wikitexte brut : un nom de paramètre de template
  disparaît du texte rendu, seule sa valeur y survit. `embeddedin` trouve les
  usages réels (transclusions) mais pas les pages qui *parlent* de l'ancien
  nom sans transclure le modèle. Aucune des deux méthodes ne suffit seule.

- **La session expire entre lecture et écriture.** Une session qui commence
  par une phase de lecture verra sa première écriture échouer sur un cookie
  périmé. Relancer `bin/wiki-login.sh` avant d'écrire.

- **Comment vérifier un fait SMW réellement stocké.** `bin/wiki-get.sh` ne
  gère pas `action=browsebysubject`, et la lecture du wikitexte ne montre pas
  ce qui est stocké. C'est `bin/wiki-api.sh` qui s'en charge, avec son
  raccourci dédié :
  ```
  bin/wiki-api.sh --facts "subject=NOM_DE_PAGE&ns=0"
  ```
  Une ligne `propriété -> [valeurs]` par fait. Pour le JSON brut — utile quand
  on veut la sérialisation exacte plutôt que l'affichage :
  ```
  bin/wiki-api.sh "action=browsebysubject&subject=NOM_DE_PAGE&format=json&formatversion=2"
  ```
  Rappel du piège d'encodage : `bin/wiki-api.sh` ne réencode pas sa chaîne de
  paramètres, donc `%20` pour les espaces et `%26` pour un `&` dans un titre.
  Un seul `dataitem` contenant le séparateur = découpage non appliqué.
  Propriété absente = le `#set` ne reçoit pas le paramètre. **L'affichage ne
  prouve rien** : `#arraymap` rogne les espaces, `#set` non — deux liens
  corrects peuvent masquer une donnée fausse.

  **Piège spécifique aux pages `Attribut:`/`Property:`** : les propriétés
  spéciales de SMW (`Allows value`, `Has type`…) s'affichent dans
  `browsebysubject` sous leur nom interne (`_PVAL`, `_TYPE`…), pas sous leur
  nom d'affichage. Filtrer sur le nom d'affichage donne un faux « absente ».
  Toujours faire un premier passage sans filtre pour voir les clés réelles.

  **Et `_PVAL` peut être en retard sur ce qui est réellement appliqué.** Après
  l'ajout d'une valeur autorisée, `browsebysubject` sur la page de propriété
  peut rendre l'**ancienne** liste alors que la contrainte à jour est déjà
  appliquée — et **purger la page de propriété n'y change rien**. Mesuré le
  17 août 2026 sur `Specimen_status` : `_PVAL` rendait cinq valeurs quand la
  charge `_CHGPRO` en portait six, et « en réserve » était pourtant déjà
  acceptée à l'enregistrement. **La vérification qui fait foi est le
  ré-enregistrement d'un item réel portant la nouvelle valeur, puis la lecture
  de ses faits** — pas la lecture de la page de propriété. Conclure « la valeur
  n'est pas prise en compte » depuis `_PVAL` seul est un faux négatif.

- **`bin/wiki-api.sh` ne réencode pas la chaîne de paramètres.** Un espace
  non encodé dans un titre fait échouer `curl` en silence (code de sortie 3,
  aucun message API). Toujours passer les titres contenant un espace en
  `%20` dans la chaîne d'appel — contrairement à `wiki-get.sh`/`wiki-put.sh`,
  qui encodent eux-mêmes via `--data-urlencode`.

- **Toute prévisualisation d'un contenu long (`action=parse&text=`,
  `action=expandtemplates`) passe en POST, jamais en GET.** `bin/wiki-api.sh`
  n'émet que du GET (`curl -G`, lecture seule stricte, voir son en-tête) : un
  `text=` de la taille d'un modèle complet dépasse la longueur d'URL
  acceptable et **la requête échoue silencieusement — réponse vide, aucune
  erreur, aucun code de sortie curl distinctif**. Rien à voir avec le piège
  d'encodage ci-dessus (celui-là produit un code de sortie 3 explicite).
  Constaté le 20 août 2026 en testant le rendu de `Modèle:Referenced item`.
  `action=parse` n'est pas une action d'écriture, mais `wiki-api.sh` ne sait
  faire que du GET : pour un `text=` long, passer par un `curl -b
  <chemin_des_cookies> --data-urlencode ...` direct, à la main, pour cette
  requête précise — jamais en modifiant `wiki-api.sh` pour lui ajouter le
  POST, ce qui élargirait sa surface au-delà de la lecture seule qu'il
  garantit aujourd'hui.

- **Lire l'état du wiki avant de raisonner, pas seulement avant d'écrire.**
  Une copie locale est une photo, pas un état — des modifications hors
  session sont possibles à tout moment (Cyril via le formulaire, un autre
  outil). Un diagnostic bâti sur une copie locale peut être faux avant même
  d'aboutir à une proposition d'écriture.

- **Un exemple de syntaxe SMW écrit dans une page de documentation crée une
  vraie annotation.** `[[Propriété::valeur]]` cité en exemple n'est pas
  affiché : il est **exécuté**, et la page de documentation se met à porter le
  fait. Constaté le 16 août 2026 sur *Limites connues du SGDT*, qui portait
  `X -> !+`, `Main_image -> !+` et `Item_ref -> +` — ce dernier depuis sa
  rédaction initiale, plusieurs lots auparavant. Le fait `Main_image` faussait
  un comptage réel du wiki (1 au lieu de 0).

  **`<code>` ne protège pas** : il met en forme, il n'échappe rien. C'est
  `<nowiki>` qui échappe, et lui seul — `<code><nowiki>[[X::Y]]</nowiki></code>`
  pour avoir les deux. Vaut aussi pour les fonctions d'analyseur : un
  `{{#ifexpr: … > 0}}` cité en exemple s'évalue et rend une erreur d'expression.

  **Contrôle à faire** après toute écriture sur une page de documentation :
  `browsebysubject` **sur cette page**, pour vérifier qu'elle ne porte que
  `_MDAT` et `_SKEY`. Une page qui décrit le modèle de données peut le polluer.

- **Les backticks ne protègent rien en wikitexte — ni `<code>`.** Un exemple
  de syntaxe SMW ou de lien écrit entre backticks, ou entre balises `<code>`,
  s'exécute comme une vraie annotation, une vraie requête ou un vrai lien.
  Seul `<nowiki>` protège, y compris à l'intérieur de `<code>` : le patron
  maison est `<code><nowiki>…</nowiki></code>`. Ce piège est passé trois
  fois : deux dans la session du 21 août 2026 (`LOC` dans
  `Attribut:Location site`, puis trois fragments dans *Limites connues*) ;
  une troisième le 31 août 2026 sur *Récapitulatif technique du SGDT*, où
  deux exemples entourés de `<code>` mais non échappés produisaient un vrai
  lien de fichier brisé et un vrai lien de page — la page en portait la
  catégorie de suivi des liens de fichiers brisés depuis la révision 1088,
  des semaines avant qu'on le voie.

  **Le contrôle qui attrape ce piège est l'examen des _catégories_ de la
  page après écriture** (`prop=categories`), pas la relecture du texte : une
  catégorie de suivi apparue sans qu'on l'ait posée — liens brisés, liens de
  fichiers brisés — signale une syntaxe non échappée, invisible au wikitexte
  et capable de vivre des semaines. Complète le contrôle `browsebysubject`
  de la leçon précédente : celui-ci voit les annotations parasites, celui-là
  les liens parasites.

- **Deux contrôles distincts, qui ne se recouvrent pas.** `Erreurs de
  traitement SMW` (`[[_ERRC::+]]`) voit les valeurs **rejetées** par SMW.
  `browsebysubject` sans filtre sur une page voit les annotations
  **acceptées à tort**. Une annotation fausse mais valide —
  `Item_ref::+` — n'apparaît que dans le second. Aucun des deux ne
  suffit seul.

- **Une convention rédigée de mémoire ne fait pas foi.** La convention de
  nommage des 73 fichiers du lot 9 a été dictée dans une forme inexacte
  (tout en underscore) et corrigée en lisant les noms réellement en place.
  Vaut pour les fichiers comme pour le wiki : lire l'état réel avant
  d'écrire une règle qui le décrit.

- **Après création ou modification d'une page de propriété, les faits ne
  sont pas lisibles immédiatement.** La file de propagation des changements
  de SMW doit d'abord se vider. Une première lecture peut ne montrer
  qu'une clé `_CHGPRO` portant les valeurs en JSON, sans aucun fait direct
  (`Has type`, `Property_range`… absents de `browsebysubject`). **Ce n'est
  pas un échec de stockage.** Relire après vidage de la file plutôt que
  réécrire. Constaté le 19 août 2026, seize jobs en attente
  (`action=query&meta=siteinfo&siprop=statistics`, clé `jobs`).

- **Le 24 août 2026, dans un environnement Claude Code hébergé (cloud
  Anthropic), le proxy sortant a refusé wiki.ecolibre.org (403 au
  CONNECT).** Ni lecture ni écriture ; seul le travail sur les fichiers du
  dépôt était possible. Symptôme trompeur : `wiki-api.sh` renvoie une
  sortie vide avec un code de sortie 0, sans message. Une sortie vide ne
  signifie donc pas toujours « aucun résultat » — elle peut signifier
  « rien n'est sorti de la machine ».

- **Un blocage déduit n'est pas un blocage constaté.** Le 21 août 2026,
  une écriture refusée sur `Attribut:INSEE code` a fait conclure que les
  cinq propriétés du lot 7 étaient sous le même verrou. Personne ne
  l'avait testé. Le 25 août, les cinq se sont écrites du premier coup.
  **Avant de déclarer une correction impossible, tenter l'écriture sur
  un cas — le refus coûte moins cher que la dette.**

- **Une mesure qui contredit une page du wiki n'est pas terminée tant que
  cette page n'est pas corrigée.** Le 28 août 2026, trois entrées de
  *Limites connues* (n° 16, 24, 25) se sont révélées démenties par des
  mesures du lot 11 lui-même, notées ailleurs et jamais reportées. **Après
  toute mesure qui infirme quelque chose, chercher où cette chose est
  écrite avant de passer à la suite.**

- **`bin/wiki-wait-jobs.sh` annonce une panne qui n'existe pas.** Il a
  signalé « FILE FIGEE » quatre fois pendant la session des 29-31 août 2026
  — à 4, 9, 11 puis 13 travaux — alors que `runJobs.php` répondait « Job
  queue is empty » côté serveur et que l'API annonçait zéro. Le nombre qu'il
  lit vient de `action=query&meta=siteinfo&siprop=statistics`, clé `jobs`,
  qui rend une **estimation plafonnée, pas un décompte** (déjà noté dans
  *Limites connues*, et constaté à 100 travaux dans
  `travaux/owned-by-execution.md` sans que le script change). **Une file
  annoncée non vide n'est pas un diagnostic de panne** et ne justifie ni de
  réécrire, ni d'attendre : le seul contrôle qui tranche est `runJobs.php`
  côté serveur. Le libellé du script (« FILE FIGEE », « FILE NON VIDE ») est
  à reprendre — dette d'outillage ouverte : un outil qui crie au loup finit
  ignoré le jour où il a raison.

- **Une mesure ne vaut que si elle mesure ce qu'on croit.** Quatre
  affirmations fausses ont été écrites dans des consignes *validées* pendant
  la session des 29-31 août 2026, toutes de la même cause :
  - deux formats de requête (`format=tree`, `format=outline`) déclarés
    inopérants parce qu'on avait cherché leur nom dans le HTML produit — un
    format ne signe pas sa sortie. Ils rendaient un arbre complet.
  - une propriété (`Main_image`) déclarée câblée nulle part après examen de
    deux modèles sur les vingt-sept de l'espace `Modèle`. Elle l'était dans
    un troisième.
  - une numérotation de correction citée de mémoire alors que le fichier
    était ouvrable.
  - une traçabilité de rapports déclarée commencer six lots trop tard, parce
    qu'un `ls` ne montrait que les fichiers nommés par lot, sans ouvrir les
    rapports datés qui portent leur numéro en titre interne.

  **Avant d'écrire une absence, dire par quelle mesure on l'a établie, et
  vérifier que cette mesure pouvait la détecter.** Une absence se prouve plus
  difficilement qu'une présence ; un contrôle par mot-clé dans une sortie ne
  prouve rien.

  **La contrepartie, et c'est elle qui a fonctionné :** ces quatre erreurs
  ont toutes été rattrapées par la vérification *exigée dans la consigne
  elle-même*, jamais par son auteur. Une consigne doit demander de vérifier
  ce qu'elle affirme — y compris contre celui qui l'écrit.

- **Le wikitexte fourni pour être collé ne s'enveloppe jamais.** Une ligne
  logique tient sur une ligne physique, même longue. Un saut de ligne à
  l'intérieur d'un élément de liste le coupe en deux au rendu, et un saut de
  ligne à l'intérieur d'un lien le casse. Les paragraphes ordinaires y
  survivent, les listes et les liens non. Incident du 12 août 2026,
  reproduit le 1er septembre 2026 sur *Notes en attente de rangement*.

## Garde-fous d'exécution (dépôt git)

- **État propre avant toute opération destructive ou massive dans le
  dépôt** — suppression, déplacement en nombre, réécriture d'un fichier
  existant. Si `git status` montre des modifications non commitées,
  commiter d'abord. Aucune permission de `.claude/settings.json` ne
  vérifie cette condition : c'est elle qui rend vraie la garantie de
  réversibilité par git. Ajoutée le 20 août 2026, après un tour de revue
  des permissions.
- **Pousser en fin de session, systématiquement.** Un commit qui n'a pas
  quitté la machine ne protège pas de la machine.
- **Écrire les commandes shell sous leur forme la plus simple.** Claude Code
  soumet à confirmation toute commande dont il ne peut pas analyser la forme
  à l'avance — boucles, substitutions `$(…)`, `<(…)`, accolades voisinant des
  guillemets. Ces confirmations ne signalent aucun danger et ne peuvent être
  levées par aucune permission : elles se suppriment en amont, par la façon
  d'écrire. Quatre règles, constatées sur dix-sept confirmations analysées le
  21 août 2026 :
  - **Attente de la file de travaux** : appeler `bin/wiki-wait-jobs.sh`,
    jamais une boucle `for` d'interrogation en ligne.
  - **Écrire un fichier** : utiliser l'outil d'écriture de fichier, jamais
    `cat > fichier << EOF`. Un contenu wikitexte fait voisiner `{{` et des
    guillemets, ce qui déclenche systématiquement une confirmation.
  - **Python** : écrire un fichier `.py` dans le scratchpad puis l'exécuter,
    jamais `python3 - <<'PYEOF'` ni `python3 -c "…"` de plus d'une ligne.
  - **Comparer une portion de fichier** : écrire l'extrait dans un fichier
    temporaire, puis `diff` sur deux fichiers. Jamais `diff a <(sed …)`.
  - Répéter deux fois la même construction refusée est le signe qu'il faut
    en faire un script dans `bin/`, versionné et autorisé nommément.
- **Ne pas conclure sur un aperçu — vérifier après coup par un compte.**
  L'affichage tronque : le 21 août 2026, un aperçu d'écriture de
  `.claude/settings.json` a montré à trois reprises un bloc `allow` amputé
  de douze entrées qui ne correspondait à aucun état réel du fichier, et un
  diff de `installation-nouveau-poste.md` a affiché un paragraphe existant
  comme mutilé alors qu'il était intact. Une écriture refusée à tort coûte
  un aller-retour ; une écriture validée à tort ne se voit pas. Donc :
  après toute écriture sur `.claude/settings.json`, afficher les trois
  comptes —
  `python3 -c "import json; d=json.load(open('.claude/settings.json'))['permissions']; print('deny', len(d['deny']), 'ask', len(d['ask']), 'allow', len(d['allow']))"` ;
  après tout commit, afficher `git show --stat <hash>` et vérifier que le
  nombre de suppressions est celui attendu. Ces deux contrôles tiennent en
  une ligne et ne dépendent d'aucun rendu. Les joindre au rapport, sans
  qu'il soit besoin de les demander.
- **Un `curl` d'écriture hors des scripts `bin/` requiert l'accord explicite
  de Cyril, à chaque fois.** Les refus posés par `wiki-api.sh` (`move` et les
  autres actions d'écriture) et par `wiki-put.sh` (espace de noms
  `MediaWiki:`) sont des garde-fous du script, pas du wiki : un `curl` direct
  ne les rencontre jamais. Ils ne valent que tant que l'outillage passe par
  les scripts. Une exception ponctuelle reste une exception — elle ne fonde
  pas un usage, et ne se reconduit pas d'elle-même au cas suivant. Si un
  besoin revient deux fois, il devient un script de `bin/`, pas une habitude.
  Ajoutée le 21 août 2026.

## Ne jamais faire
- Ne pas toucher au `composer.json` de MediaWiki (utiliser `composer.local.json`).
- Ne pas commiter `.env` ni `.cookies.txt`.
- ne jamais passer bot=1 sur une écriture
