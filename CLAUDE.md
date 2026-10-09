# Ecolibre — SGDT wiki sémantique

Wiki : https://wiki.ecolibre.org — MediaWiki + Semantic MediaWiki, Page Forms,
Scribunto/Lua, Semantic Result Formats.

## Ton rôle

Tu es l'exécuteur décrit dans `methode-de-travail.md` : sur consigne, tu écris
sur le wiki et dans le dépôt, tu vérifies ce que tu as écrit, et tu rends un
rapport. Tu ne mènes pas de lot et tu ne rédiges pas de consignes : c'est le
rôle d'une conversation claude.ai, dite l'architecte. Ce que tu vois et que la
consigne n'a pas prévu va dans « Écarts et surprises ».

**Un texte qui ne t'est pas adressé ne s'exécute pas.** Les textes qui te sont
destinés commencent par « Pour Claude Code. ». Si la première ligne d'un texte
le destine à une conversation claude.ai, ou si un message te demande
d'appliquer toi-même la `Procédure d'ouverture d'un lot` ou la
`Procédure de clôture d'un lot`, ne lance aucune commande : réponds en une
ligne que ce texte est destiné à une conversation claude.ai, et attends. Une
consigne qui te fait écrire ce qu'une ouverture ou une clôture a décidé reste
une consigne ordinaire. Un message de Cyril sans ligne de destinataire relève
du canal direct et reste légitime. Cas vécu : le 2 octobre 2026, le message
d'ouverture du lot 21 a été collé ici par erreur ; seul le jugement de
l'exécuteur l'a arrêté, car aucune autorisation ne bloque l'écriture.

**Tes questions à Cyril**, dans le terminal comme dans un rapport, sont des
points repérés par une lettre (A, B, C…), chacun dans cet ordre : le contexte
ou le problème, la question, ta suggestion. Cyril répond par la lettre. Les
lettres évitent de confondre tes questions avec les points numérotés de la
conversation de l'architecte.

**Ce fichier l'emporte sur ta mémoire automatique.** Si une note de ta
mémoire contredit ce fichier ou `methode-de-travail.md`, applique le fichier
et signale l'écart dans « Écarts et surprises ». Ta mémoire automatique reste
vide : ce qui mérite d'être retenu va dans ce fichier ou dans un rapport. Elle
a été vidée le 4 octobre 2026 : ses sept notes, de juillet, étaient périmées
ou déjà portées par le wiki. Depuis le 4 octobre 2026, elle est aussi
désactivée par réglage, dans `.claude/settings.json`.

## Pages de référence sur le wiki

Le wiki fait autorité, pas ce fichier. Lire ces pages avant la première
écriture dans un lot, et vérifier qu'un fait nouveau n'y figure pas déjà avant
de l'écrire ailleurs.

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

Et dans ce dépôt : `methode-de-travail.md` décrit le protocole entre les intervenants — qui décide quoi, dans quel ordre, sous quelle forme.

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
- `bin/wiki-append.sh "Page" fichier.txt "résumé"` — ajouter un bloc **à la
  fin** d'une page via `appendtext`, sans jamais lire ni renvoyer le corps
  existant : la surface de corruption d'un ajout est nulle. **Périmètre
  strict — réservé aux pages qui se terminent par la cible d'ajout** (liste
  numérotée ouverte, journal). Le script refuse, avant toute écriture, si la
  dernière ligne de contenu (hors commentaire HTML final) ne commence pas
  par `# `, ou si une ligne vide sépare cette dernière entrée d'un
  commentaire final (l'ajout couperait la liste au rendu). Le fichier
  d'ajout doit commencer par exactement un saut de ligne puis `# ` et
  contenir une seule ligne `# `. Contrôles après écriture : wikitexte
  (l'ajout est la dernière entrée, +1) et rendu (pas de seconde liste
  numérotée). Jamais `bot=1`, jamais `createonly` (`nocreate=1`, la page
  doit exister). **N'aide en rien à corriger une entrée existante** :
  reformuler ou compléter une entrée au milieu de la page reste une
  réécriture complète par `wiki-put.sh`. *Limites connues du SGDT* a été
  réorganisée le 6 septembre 2026 (provenance en tête, liste en fin de
  page, commentaire garde-fou placé avant la liste) pour rendre ce
  script utilisable sur elle.
- `bin/wiki-api.sh "chaîne de paramètres"` — exécuter n'importe quel appel de
  lecture de l'API MediaWiki en GET (`smwbrowse`, `siteinfo`, `allpages`,
  `backlinks`, `expandtemplates`, `intestactions`…) ; lecture seule stricte,
  refuse les actions d'écriture connues du cœur MediaWiki et des extensions
  locales (`pfautoedit`, `sfautoedit`, `smwtask`), et tout paramètre `action=`
  dupliqué. `--facts "subject=...&ns=..."` : raccourci pour
  `action=smwbrowse&browse=subject`, affiche une ligne `propriété -> [valeurs]`
  par fait au lieu du JSON brut. Il appelait `action=browsebysubject` jusqu'au
  7 octobre 2026 : ce module est déprécié par Semantic MediaWiki depuis la
  3.0.0 et supprimé en 7.0.0 ; il fonctionne encore ici, en 4.2.0, mais ne
  doit plus être employé. `action=purge` exige une requête POST : hors du
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

**Ni la skill docs ni un connecteur de documents ne remplacent `travaux/`.**
Les skills et les connecteurs synchronisés depuis le compte claude.ai, Claude
Docs ou Google Drive par exemple, sont présents dans chaque session ; un
rapport ou un document destiné à une conversation s'écrit pourtant toujours
ici, en markdown.

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

   **L'étiquette de lot ne se remplace jamais : un correctif écrit pendant
   un lot porte les deux, dans l'ordre `[Lot N][Correctif]`.** La datation
   d'un lot et l'inventaire de ce qu'il a touché se lisent tous deux dans
   les résumés de modification : une écriture sans étiquette de lot en
   sort. Constaté sur le lot 13, où quatorze écritures sur quatre-vingt-huit
   sont devenues orphelines.
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
7. **Un fichier déposé dans un arbre servi par un serveur web s'annonce au
   préalable**, avec son contenu, son chemin et sa durée de vie prévue. Vaut
   pour le miroir local comme pour tout autre serveur. Le retrait se vérifie
   par une mesure — absence du fichier, nombre de requêtes qui l'ont visé
   dans le journal —, pas par le code de retour de la commande de
   suppression. Ajoutée le 09/10/2026 : la sonde `limites_tache6.php` de la
   tâche 6 du lot 22, déposée à la racine du MediaWiki du miroir, n'avait été
   décrite qu'après coup.

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
- **Barrière avant d'employer une propriété neuve.** Aucune page employant une propriété nouvellement créée ne se crée avant que le **type résolu à l'exécution** de cette propriété soit le bon. Le lire dans `query.printrequests[].typeid` d'un `action=ask` portant sur cette propriété, pour l'entrée dont le label n'est pas vide ; l'entrée au label vide est la colonne du sujet et vaut toujours `_wpg`. Lire dans la même requête une propriété témoin au type connu : si le témoin ne rend pas son type, c'est la lecture qui est en cause.

  Le fait `_TYPE` porté par la page de propriété ne vaut pas barrière : mesuré le 4 octobre 2026, six propriétés portaient le bon `_TYPE` tout en étant résolues en `_wpg`, et toutes les valeurs des pages qui les employaient sont tombées en type Page sans qu'aucune purge ni réécriture ne les en sorte. Une propriété dont le type résolu est faux ne s'emploie pas : attendre et revérifier, sans rien réparer et sans changer de nom à la première constatation. Six gels sur sept se sont levés d'eux-mêmes en deux à quatre jours ; le septième n'était pas levé le 9 octobre 2026, après cinq (entrée 59 des Limites connues). Passé une semaine, recréer la propriété sous un autre nom.

  **Le verrou d'écriture n'est pas un critère.** `smw-change-propagation-protection` n'empêche ni le stockage ni la requête : mesuré le 5 octobre 2026, une propriété verrouillée stocke et répond exactement comme une propriété libre de même type. Ne jamais éliminer ni abandonner une propriété parce que sa page est verrouillée. Le verrou se lit sans rien écrire par `intestactions`, et il se consigne.

  **En revanche il retarde toute correction.** Toute écriture qui modifie le type d'une propriété la verrouille en moins de trois minutes. Mesuré du 4 au 8 octobre 2026 : quinze pages de propriété d'essai verrouillées le 6 octobre étaient toutes libres le 8 à 21 h 11, soit un délai de quelques heures à quatre jours selon les cas. **Conséquence réelle :** une déclaration de propriété ne se corrige pas le jour même, mais quelques jours plus tard. Ce n'est ni une perte, ni une raison de changer de nom, ni une raison de tout figer d'avance. Les rédactions des 6 et 8 octobre 2026, qui tenaient le verrou pour définitif et prescrivaient d'écrire une page de propriété une seule fois dans sa forme définitive, étaient fausses et sont retirées.

  Après avoir créé une propriété, n'émettre aucune requête nommant cette propriété tant que `_CHGPRO` n'a pas disparu de ses faits ; la seule sonde autorisée pendant cette attente est la lecture des faits de la page et celle de `intestactions`, qui ne résolvent aucun type. Ce n'est pas la rafale qui décide : mesuré les 4 et 5 octobre 2026, une rafale de huit créations a rendu le bon type résolu, et une création isolée a gelé. Compte complet du 4 au 6 octobre 2026 : vingt-cinq propriétés créées, sept gelées, en deux épisodes seulement. Sur la durée d'un gel, voir ci-dessus.

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
  gère pas `action=smwbrowse`, et la lecture du wikitexte ne montre pas
  ce qui est stocké. C'est `bin/wiki-api.sh` qui s'en charge, avec son
  raccourci dédié :
  ```
  bin/wiki-api.sh --facts "subject=NOM_DE_PAGE&ns=0"
  ```
  Une ligne `propriété -> [valeurs]` par fait. Pour le JSON brut — utile quand
  on veut la sérialisation exacte plutôt que l'affichage :
  ```
  bin/wiki-api.sh "action=smwbrowse&browse=subject&params=%7B%22subject%22:%22NOM_DE_PAGE%22,%22ns%22:0%7D&format=json&formatversion=2"
  ```
  `ns:0` convient aussi pour une page d'un autre espace de noms : le titre
  complet, préfixe compris (`Attribut:…`), suffit à la résoudre. Le bloc
  `query` est celui que rendait `browsebysubject` ; `smwbrowse` y ajoute un
  bloc `meta`.
  Rappel du piège d'encodage : `bin/wiki-api.sh` ne réencode pas sa chaîne de
  paramètres, donc `%20` pour les espaces et `%26` pour un `&` dans un titre.
  Un seul `dataitem` contenant le séparateur = découpage non appliqué.
  Propriété absente = le `#set` ne reçoit pas le paramètre. **L'affichage ne
  prouve rien** : `#arraymap` rogne les espaces, `#set` non — deux liens
  corrects peuvent masquer une donnée fausse.

  **Piège spécifique aux pages `Attribut:`/`Property:`** : les propriétés
  spéciales de SMW (`Allows value`, `Has type`…) s'affichent dans
  `smwbrowse` sous leur nom interne (`_PVAL`, `_TYPE`…), pas sous leur
  nom d'affichage. Filtrer sur le nom d'affichage donne un faux « absente ».
  Toujours faire un premier passage sans filtre pour voir les clés réelles.

  **Et `_PVAL` peut être en retard sur ce qui est réellement appliqué.** Après
  l'ajout d'une valeur autorisée, `smwbrowse` (alors `browsebysubject`) sur
  la page de propriété peut rendre l'**ancienne** liste alors que la
  contrainte à jour est déjà appliquée — et **purger la page de propriété n'y
  change rien**. Mesuré le 17 août 2026 sur `Specimen_status` : `_PVAL`
  rendait cinq valeurs quand la charge `_CHGPRO` en portait six, et « en réserve » était pourtant déjà
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
  `smwbrowse` **sur cette page**, pour vérifier qu'elle ne porte que
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
  catégorie de suivi apparue sans qu'on l'ait posée, comme celle des liens
  de fichiers brisés, signale une syntaxe non échappée, invisible au
  wikitexte et capable de vivre des semaines. Complète le contrôle
  `smwbrowse` de la leçon précédente : celui-ci voit les annotations
  parasites, celui-là les liens parasites.

  **Ce contrôle ne suffit pas : examiner aussi les _liens_ de la page**
  (`prop=links`), et n'en trouver aucun vers une page inexistante. Un lien
  vers une page ordinaire inexistante ne pose aucune catégorie de suivi :
  seuls les liens de fichiers brisés en posent une. Constaté le 4 octobre
  2026 : deux exemples dans une balise `<code>` sans `<nowiki>`, l'un dans
  l'entrée 52 des *Limites connues*, l'autre dans le *Récapitulatif
  technique*, créaient des liens vers des pages inexistantes (« @@@@ » et
  « ... ») sans qu'aucune catégorie le signale. La liste des pages demandées
  du wiki (`list=querypage&qppage=Wantedpages`) les a révélés.

- **Deux contrôles distincts, qui ne se recouvrent pas.** `Erreurs de
  traitement SMW` (`[[_ERRC::+]]`) voit les valeurs **rejetées** par SMW.
  `smwbrowse` sans filtre sur une page voit les annotations
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
  (`Has type`, `Property_range`… absents de `smwbrowse`, alors
  `browsebysubject`). **Ce n'est pas un échec de stockage.** Relire après
  vidage de la file plutôt que réécrire. Constaté le 19 août 2026, seize
  jobs en attente (`action=query&meta=siteinfo&siprop=statistics`, clé `jobs`).

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

- **Pour savoir ce qu'une session de Claude Code a fait, la mesure qui
  tranche est sa transcription**, conservée sous `~/.claude/projects/`, un
  dossier par répertoire de lancement. Elle liste chaque commande lancée et
  chaque fichier écrit. La recouper par git (`reflog`, `FETCH_HEAD`) et par
  les modifications récentes du wiki ; les dates de fichiers ne prouvent rien
  après une bascule de poste. Méthode employée le 3 octobre 2026 pour établir
  ce qu'avait laissé la session qui avait reçu par erreur le message
  d'ouverture du lot 21.

- **L'outil de lecture de fichier peut rendre une version dépassée d'un
  fichier modifié hors de lui.** Le 3 octobre 2026, il a montré
  `.claude/settings.local.json` sans les deux règles que des confirmations
  venaient d'y inscrire, alors que `grep` et `python3` les voyaient. Avant de
  modifier un fichier que l'outillage a pu changer, le relire par une
  commande.
- `sleep` au premier plan est bloqué par l'environnement Claude Code, avec le message « Blocked: sleep 60 followed by… ». Pour une pause fixe, lancer `sleep` en arrière-plan et attendre sa notification de fin. Pour attendre la file de travaux, `bin/wiki-wait-jobs.sh`. Mesuré le 4 octobre 2026, lot 21 tâche 8.
- Un fichier d'ajout ne contient qu'une seule entrée, et `bin/wiki-append.sh` ne s'appelle qu'une fois par entrée. Cinq entrées ajoutées ensemble coûtent une seule révision mais se défont ensemble ; cinq appels coûtent cinq révisions et chacune s'annule seule. La règle existait déjà et une consigne du 6 octobre 2026 l'a contredite : c'est la consigne qui était en tort.

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
  guillemets, `cd` suivi d'une redirection, commentaire `#` dans un programme
  passé en ligne. Ces confirmations ne signalent aucun danger et ne peuvent
  être levées par aucune permission : elles se suppriment en amont, par la
  façon d'écrire.

  **Le critère : simplifier tant que la commande reste lisible et que la
  simplification supprime effectivement la confirmation.** Une boucle sur
  trois appels identiques sans traitement est à dérouler ; une boucle sur
  huit appels avec traitement en sortie est à garder — la dérouler donnerait
  vingt-quatre lignes pour éviter une fenêtre, ce qui est plus lourd que le
  mal.

  **Pas de variable de chemin.** Écrire le chemin du scratchpad en toutes
  lettres dans chaque commande, jamais par une variable abrégée du type
  `S=/tmp/…`. Une variable dans une redirection ou un argument déclenche un
  contrôle de forme à elle seule : sur les confirmations relevées entre le
  11 septembre et le 3 octobre 2026, c'est devenu la première cause, devant
  toutes les autres réunies. La consigne précédente, qui recommandait de
  garder la variable pour la lisibilité, était une erreur d'arbitrage :
  elle échangeait quelques lignes de lecture contre une fenêtre par commande.
  Quand le chemin complet rend la commande illisible, écrire un script dans
  le scratchpad avec le chemin en dur et l'appeler, plutôt que d'abréger par
  une variable. Ne pas se placer dans le scratchpad par `cd` : le répertoire
  courant persiste d'une commande à l'autre dans Claude Code, et les appels
  `bin/wiki-*.sh` qui suivent, relatifs à la racine du dépôt, ne se
  résoudraient plus. Un `cd` reste admis seul, dans une commande à part sans
  redirection, pour un travail qui ne fait aucun appel à `bin/` — à condition
  de revenir à la racine du dépôt par un `cd` seul dès la fin de ce travail.
  Un répertoire courant laissé ailleurs fait échouer le premier appel `bin/`
  qui suit, éventuellement bien plus tard et sans rapport apparent avec la
  cause.

  Cas particuliers vérifiés sur 89 confirmations analysées :
  - **Attente de la file de travaux** : appeler `bin/wiki-wait-jobs.sh`,
    jamais une boucle d'interrogation en ligne. Le script est versionné,
    plafonné, et détecte une file figée.
  - **Vérification après écriture** : appeler `bin/wiki-verify.sh`.
  - **Relevé d'avertissements SMW** : appeler `bin/wiki-warnings.sh`.
  - **Écrire un fichier** : utiliser l'outil d'écriture de fichier, jamais
    `cat > fichier << EOF`. Cela vaut aussi pour un fichier `.py` destiné à
    être exécuté ensuite — l'écrire par redirection déplace la confirmation
    du programme vers la redirection au lieu de la supprimer.
  - **Python d'une ou deux lignes** : en ligne, en acceptant la confirmation.
    Au-delà, ou dès que le programme resservira : un fichier `.py`, écrit
    avec l'outil d'écriture de fichier.
  - Répéter deux fois la même construction refusée est le signe qu'il faut
    en faire un script dans `bin/`, versionné et autorisé nommément.
- **Toute boucle d'attente porte un plafond.** Nombre d'essais borné,
  intervalle fixé, sortie garantie, et affichage de la progression à chaque
  essai. Une boucle `until` ou `while` sans limite peut ne jamais rendre la
  main et fige la session. Trois occurrences relevées entre le 21 août et le
  11 septembre 2026, dont deux alors que `bin/wiki-wait-jobs.sh` existait
  déjà et faisait exactement cela. Une attente qui n'aboutit pas est un
  résultat à documenter, pas un obstacle à contourner par une attente plus
  longue.
- **Afficher le contenu d'un script du scratchpad avant de l'exécuter.**
  Une fenêtre de confirmation qui n'affiche qu'un chemin ne permet pas de
  décider. La règle d'écrire les programmes dans des fichiers plutôt qu'en
  ligne a pour effet de sortir leur contenu du champ de vision de Cyril :
  ce complément le remet. Le contenu va dans le même message que le
  lancement, pas dans un tour séparé.
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
- **Les permissions vont dans `.claude/settings.json`, jamais dans
  `.claude/settings.local.json`, ni dans la configuration personnelle de
  Claude Code (`~/.claude/settings.json`, `~/.claude.json`).** Le fichier
  local n'est pas versionné : ses règles échappent à la relecture par diff,
  à la documentation dans
  `installation-nouveau-poste.md`, et à l'archive distante. L'inventaire du
  3 octobre 2026 y a trouvé 75 règles accumulées à l'insu de Cyril, dont
  trois contournaient des protections écrites : `Read(//proc/**)` donnait
  accès aux variables d'environnement des processus, donc au mot de passe du
  compte bot chargé par `set -a; source .env` malgré le `deny Read(./.env)` ;
  une règle suivant la variable `$SCRATCH` autorisait un script n'importe où
  elle pointerait ; une autre rendait permanente une exception que ce fichier
  réserve au cas par cas. Le fichier local doit rester vide. Toute règle
  nécessaire est proposée pour `settings.json`, avec son motif, et documentée.
  L'inventaire du 4 octobre 2026 n'a trouvé dans cette configuration
  personnelle ni autorisation, ni hook, ni serveur MCP.
- **Ne jamais proposer d'ajouter à `allow` une règle qui désigne un chemin
  variable, un fichier hors du dépôt, ou un répertoire entier.** Une règle
  d'`allow` nomme un exécutable du dépôt ou une commande, jamais un chemin
  qu'une variable peut déplacer.
- **Au début et à la fin de chaque tâche, vérifie que
  `.claude/settings.local.json` ne porte aucune règle.** Cite mot pour mot
  dans le rapport toute règle que tu y trouves. C'est le contrôle après coup
  des demandes de confirmation : le bouton « ne plus me demander » y inscrit
  ses règles, à l'insu de celui qui clique. Sur le lot 34, ce relevé a prouvé
  à chaque tâche qu'aucune autorisation permanente n'avait été ajoutée, là
  où l'aperçu et l'annonce ne prouvaient rien. Ajoutée le 4 octobre 2026.

## Ne jamais faire
- Ne pas toucher au `composer.json` de MediaWiki (utiliser `composer.local.json`).
- Ne pas commiter `.env` ni `.cookies.txt`.
- ne jamais passer bot=1 sur une écriture
