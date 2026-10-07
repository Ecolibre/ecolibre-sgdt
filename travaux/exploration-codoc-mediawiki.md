# Exploration — documentation Codoc « mediawiki.md » (Open Atlas / Communecter)

Date : 7 octobre 2026. Exécuteur : Claude Code. Lecture seule : aucune écriture sur le wiki, aucune commande `bin/wiki-*.sh`, rien d'installé ni d'exécuté dans le clone.

Suite de `travaux/exploration-site-json.md` et `travaux/exploration-cocolight-serveur.md`.

## Source

- Dépôt : `https://gitlab.adullact.net/pixelhumain/codoc.git` — l'adresse avec le suffixe `.git` a fonctionné du premier coup ; l'adresse sans suffixe n'a pas été essayée. Dépôt public : clone anonyme sans identifiant.
- Clone : `~/exploration-site-json/codoc/`, `git clone --depth 1 --branch master`. Laissé en place.
- Commit de tête (`master`) : `ef15f66ce5b5e6fdbab3f72a01449d43dabeef98`, 2024-12-03 06:14:03 +0100.

## Arborescence (étape 4)

Le dépôt compte **709 fichiers suivis** (`git ls-files`), soit plus de 200 : relevé limité, comme prévu, aux répertoires de premier et deuxième niveau avec le nombre de fichiers de chacun, puis à la liste complète du répertoire `04 - Documentation technique`.

Mode de comptage : nombre de fichiers suivis contenus dans le répertoire, sous-répertoires compris (récursif). Au niveau 1, les lignes sans `/` final sont des fichiers à la racine, comptés 1. Au niveau 2, seuls les sous-répertoires figurent.

```
== NIVEAU 1 (fichiers recursifs)
21 00 - COmmunecter/
11 01 - OFFRES/
28 02 - USAGES/
13 03 - Contribuer/
38 04 - Documentation technique/
12 05 - Animer Déployer/
11 06 - Open Atlas/
4 07 - CMS/
11 08 - COstum/
3 09 - COForms/
1 10 - CObservatory/
15 11 - OCECO/
1 12 - COpen Badges/
13 13 - Smarterre/
16 14 - CODossier/
5 15 - Présentations/
2 16 - FEATURES & WISHLIST/
2 17 - COTOOLS/
6 18 - Activitypub/
11 19 - Team/
2 20 - Formation/
1 GARE CENTRALE.md
83 Images/
1 README.md
1 architecture.md
60 archives/
332 en/
1 inProgress.md
1 release.md
1 roadmap.html
1 roadmap.md
1 tmp.md
== NIVEAU 2 (fichiers recursifs)
6 00 - COmmunecter/Nos amis/
2 00 - COmmunecter/Philosophie/
19 02 - USAGES/Fonctionnalités/
1 03 - Contribuer/Tutoriels/
4 04 - Documentation technique/Installer Communecter/
1 04 - Documentation technique/architecture/
10 04 - Documentation technique/process/
2 04 - Documentation technique/stage/
2 05 - Animer Déployer/Exemples de dynamique locale/
4 05 - Animer Déployer/Lancer une dynamique locale/
4 05 - Animer Déployer/Tutoriels et ressources/
1 06 - Open Atlas/opalo/
2 07 - CMS/blocs/
6 11 - OCECO/usages/
8 13 - Smarterre/Filieres/
1 14 - CODossier/RTL/
2 14 - CODossier/cte/
3 18 - Activitypub/images/
8 19 - Team/screenshots/
19 en/01 - COmmunecter/
29 en/02 - Utiliser l'outil/
12 en/03 - Contribuer/
33 en/04 - Documentation technique/
12 en/05 - Animer Déployer/
11 en/06 - Open Atlas/
11 en/07 - COstum/
2 en/08 - COForms/
1 en/09 - CObservatory/
3 en/10 - OCECO/
4 en/11 - Smarterre/
12 en/12 - Projets/
3 en/13- CODossier/
16 en/14 - Présentations/
11 en/15 - Team/
2 en/16 - FEATURES & WISHLIST/
2 en/17 - COTOOLS/
1 en/7 - COstum/
83 en/Images/
59 en/archives/
== 04
7753 04 - Documentation technique/Installer Communecter/PHP7.md
7136 04 - Documentation technique/Installer Communecter/docker.md
1992 04 - Documentation technique/Installer Communecter/rocktchat-dev.md
6891 04 - Documentation technique/Installer Communecter/ubuntu.md
1166 04 - Documentation technique/Integration du SSO avec plusieurs applications.md
6495 04 - Documentation technique/activitypub.md
25143 04 - Documentation technique/api.md
3630 04 - Documentation technique/architecture/gulp.md
2672 04 - Documentation technique/cmsEngine.md
1142 04 - Documentation technique/codev.md
791 04 - Documentation technique/copi.md
2332 04 - Documentation technique/copytool export save import json data.md
7330 04 - Documentation technique/createelement.md
1674 04 - Documentation technique/creercostum.md
8357 04 - Documentation technique/datamodel.md
232 04 - Documentation technique/events.md
3441 04 - Documentation technique/graph.md
1020 04 - Documentation technique/index.md
3086 04 - Documentation technique/interop oceco.md
18446 04 - Documentation technique/interop.md
1405 04 - Documentation technique/introcode.md
4025 04 - Documentation technique/mediawiki.md
1771 04 - Documentation technique/process/# Geocoding - Find a Location.md
23 04 - Documentation technique/process/Import.md
13202 04 - Documentation technique/process/SearchObj.md
1795 04 - Documentation technique/process/costum.md
1621 04 - Documentation technique/process/export.md
1480 04 - Documentation technique/process/invite.md
1731 04 - Documentation technique/process/mail.md
232 04 - Documentation technique/process/news.md
6937 04 - Documentation technique/process/notification_systeme_co.html
3340 04 - Documentation technique/process/search.md
1459 04 - Documentation technique/stack.md
2664 04 - Documentation technique/stage/Laurent Després.md
437 04 - Documentation technique/stage/process interop Mediawiki.md
3010 04 - Documentation technique/test-fonctionnels
3040 04 - Documentation technique/universtechnique.md
483 04 - Documentation technique/zones cities countries.md
```

## Texte intégral de « 04 - Documentation technique/mediawiki.md » (étape 5)

- Taille : 4 025 octets, **98 lignes** (`wc -l`), sous le seuil de 600 : recopie intégrale, sans coupure.
- Dernière modification d'après `git log -1` sur ce fichier : commit `ef15f66ce5b5e6fdbab3f72a01449d43dabeef98`, **2024-12-03 06:14:03 +0100**, auteur `ANDRIATAHINA Dady Christon`. Réserve : voir « Écarts et surprises », point 1.
- Mode de recopie : le contenu a été inséré par copie d'octets depuis le fichier du clone (script Python), pas retranscrit à la main. Les espaces de fin de ligne présents dans l'original (lignes 4, 5, 12, 24, 27, 32, 36, 38, 41, 54, 58, 62, 73, 77, 81, 85 de l'original) sont conservés. Contrôle après écriture : le bloc extrait de ce rapport est identique octet pour octet au fichier source (voir « Écarts et surprises », point 5).
- Délimitation : le texte est encadré par quatre accents graves, parce que l'original contient lui-même un bloc de code à trois accents graves. Les deux lignes de commentaire HTML ci-dessous marquent le début et la fin exacts.

<!-- DEBUT DU TEXTE INTEGRAL -->
````markdown
# Mediawiki & Communecter

## Introduction
Cette partie du module interop, cherche en cas de mediawiki existant à le connecter avec communecter et de permettre via un bouton a 
créer des éléments du type de la page du wiki, ou en cas d'élément présent de fournir le lien, enfin mais nécessitant un réglage sur le 
wiki existant de marquer le wiki avec le liens de la page co.

## Initialisation du mediawiki
Dans le sub-menu-left d'un élément on clic sur @Mediawiki .

dans MediaWikiController.php
**beforeAction()** instancie **APIMediawiki** (model de relations avec le wiki) qui est enfant de **DB** (model de relations avec la bdd) 

## **interop/MediaWiki/index**


**beforeAction()** du controller instancie **APIMediawiki** (model de relations avec le wiki) qui est enfant de **DB** (model de relations avec la bdd)

le controlleur rend une vue partiel sauf pour edit qui renvoi une string.




### L'action par default du controller **actionIndex()** 
un formulaire s'ouvre lors de la premiére connection ou l'url du wiki et son nom dans communecter son rentré par l'utilisateur.
`$this->renderPartial("interop.views.create.index");`
a la validation du form direction **actionChooseCat()** 

Si wiki deja connecté renvoi vers l'index via:
`$this->renderPartial("interop.views.default.indexMediaWiki");`

### L'action **actionChooseCategory()** 
Insére les données du formulaire (url et name) puis ouvre
`$this->renderPartial("interop.views.create.chooseCat");`

un formulaire préremplie par les données de l'api du wiki sur les catégories filtrer par regex afin de coler aux catégorie du futur menu 
soit (acteurs, ressource, projet)
(les regex son en dur dans le code faire un tableau de comparaison afin d'ajouter ou enlever des mots de trie peu étre une bonne contribution en cas de contributeur volontaire ;o) 
a la validation du form direction **actionInsertCat()**

### L'action **actionInsertCat()** 
Insére les données du formulaire le wiki en db vaut désormais:
```
 "_id" : ObjectId("idmongo"),
    "name" : "name du wiki entré par l'user",
    "parent" : {
        "mongo id du parent" : {
            "type" : "type parent",
            "name" : "name parent"
        }
    },
    "url" : "url entré par l'utilisateur + '/api.php",
    "params" : {
        "actors" : [ 
            "categorie choisit par l'user",
            ...
        ],
        "classifieds" : [ 
            "categorie choisit par l'user",
            ...
        ],
        "projects" : [ 
            "categorie choisit par l'user",
            ...
        ]
    },
    "logo" : ""
}
```
renvoi vers la vue index
`return $this->renderPartial("interop.views.default.indexMediaWiki");`

### L'action **actionMenuLeft()** 
Vas chercher les données pour le menuleft des pages du wiki en fonction du button-catégorie(acteurs,ressources,projet) clicker ou du texte de la search bar.
puis les rend dans la vue `return $this->renderPartial("interop.views.menus.pages");`

### L'action **actionPage()** 
Vas chercher les données pour la page du wiki en fonction du nom de la page.
puis les rend dans la vue `return $this->renderPartial("interop.views.page.index");`

### L'action **actionEdit()** 
Ici via le modéle ApiMediawiki.php on marque la page du wiki avec un lien communecter (!! une propriétées est a créer sur le wiki distant `|pageCo=` voir avec l'administrateur du wiki.)
renvoie une string message sur le status de l'edition.

### L'action **actionDoc()** 
renvoi vers cette page



## Relations wiki et Intégration dans communecter
Dans **A propos** il ya trois boutons qui font les liens:
Un bouton **Page du Wiki** qui redirige vers la page source du wiki.
Un bouton **Site web** qui redirige vers le site de l'élement du wiki.

Le dernier bouton peu avoir deux valeurs :
**Créer dans communecter** qui ouvre un formulaire préremplie et éditable afin de créer un élément communecter.
**Page Communecter** qui redirige vers la page communecter en relation avec l'élément du wiki.

````
<!-- FIN DU TEXTE INTEGRAL -->

## Autres fichiers parlant de mediawiki, wiki, formulaire, form ou interop (étape 6)

Recherche sur les 709 fichiers suivis (`.git` exclu), insensible à la casse, dans le chemin et dans le contenu. Contenu non recopié.

Lecture des colonnes :
- `total` : nombre de correspondances de l'expression `mediawiki|wiki|formulaire|form|interop`, chemin et contenu additionnés, sans double compte (une occurrence de « mediawiki » compte 1, pas 2).
- `nom` : part de ce total trouvée dans le chemin du fichier.
- `mediawiki`, `wiki`, `formulaire`, `form`, `interop` : décompte de chaque terme pris isolément, chemin et contenu additionnés. Ces colonnes **se recouvrent** : « wiki » compte aussi les « mediawiki », « form » compte aussi les « formulaire », mais aussi « information », « format », « formation », « plateforme », etc. La colonne `form` est donc très bruitée.
- Les fichiers binaires (PDF, PNG, GIF) ont été lus comme du texte : leurs correspondances sont probablement fortuites, sauf quand elles viennent du nom (`nom` non nul).
- `04 - Documentation technique/mediawiki.md` figure dans la liste ; c'est le fichier recopié plus haut.

```
total|nom|mediawiki|wiki|formulaire|form|interop|chemin
1|0|0|0|0|1|0|00 - COmmunecter/Nos amis/transiscope.md
10|1|0|9|0|1|0|00 - COmmunecter/Nos amis/wikipedia.md
11|0|0|5|0|6|0|00 - COmmunecter/Nos amis/zerodechet.md
17|0|0|2|0|11|4|00 - COmmunecter/OpenSystem.md
17|0|0|2|0|11|4|00 - COmmunecter/Philosophie/codesocial.md
2|0|0|1|0|1|0|00 - COmmunecter/Philosophie/methode.md
7|0|0|0|0|7|0|00 - COmmunecter/abecedaire.md
36|0|0|8|0|23|5|00 - COmmunecter/codesocial.md
26|0|0|2|4|20|4|00 - COmmunecter/communecter.excalidraw
6|0|0|0|0|6|0|00 - COmmunecter/cord.md
6|0|0|3|0|3|0|00 - COmmunecter/gouvernance.md
1|0|0|0|0|1|0|00 - COmmunecter/historique.md
24|0|0|0|2|24|0|00 - COmmunecter/openatlas.md
15|0|0|0|1|15|0|00 - COmmunecter/presentation.md
2|0|0|0|0|2|0|00 - COmmunecter/presse.md
3|0|0|0|0|2|1|00 - COmmunecter/videos.md
20|1|0|0|0|20|0|01 - OFFRES/COForm.md
1|0|0|0|0|1|0|01 - OFFRES/COstum.md
2|0|0|0|1|2|0|01 - OFFRES/VISION PRODUIT.md
23|0|0|1|1|22|0|01 - OFFRES/coProduits.md
4|0|0|0|0|3|1|01 - OFFRES/community.md
1|0|0|0|0|1|0|01 - OFFRES/ecosysteme.md
2|0|0|0|0|2|0|01 - OFFRES/intelligence collective.md
4|0|0|0|0|4|0|02 - USAGES/Fonctionnalités/Concepts/elements.md
2|0|0|0|0|2|0|02 - USAGES/Fonctionnalités/Concepts/roles.md
3|0|0|0|0|3|0|02 - USAGES/Fonctionnalités/Tutoriels/modiftag.md
1|0|0|0|1|1|0|02 - USAGES/Fonctionnalités/annonces.md
4|0|0|1|0|3|0|02 - USAGES/Fonctionnalités/cartes.md
2|0|0|0|0|2|0|02 - USAGES/Fonctionnalités/espaceco.md
1|0|0|0|0|1|0|02 - USAGES/Fonctionnalités/galerie.md
7|0|0|0|0|7|0|02 - USAGES/Fonctionnalités/importer.md
3|0|0|0|1|3|0|02 - USAGES/Fonctionnalités/liste.md
7|0|0|0|1|7|0|02 - USAGES/Fonctionnalités/network.md
2|0|0|0|2|2|0|02 - USAGES/Fonctionnalités/sondages.md
5|0|0|2|3|3|0|02 - USAGES/Fonctionnalités/valeurs.md
4|0|0|1|0|3|0|02 - USAGES/fede.md
5|0|0|0|0|5|0|02 - USAGES/individu.md
7|0|0|0|0|6|1|02 - USAGES/innovation.md
1|0|0|0|0|1|0|02 - USAGES/media.md
25|0|0|0|8|25|0|02 - USAGES/par usages.md
6|0|0|1|0|5|0|03 - Contribuer/Data Journalisme.md
8|0|0|0|1|8|0|03 - Contribuer/communiquer.md
5|0|0|4|0|1|0|03 - Contribuer/documenter.md
7|0|0|2|0|5|0|03 - Contribuer/financement.md
4|0|0|1|0|3|0|03 - Contribuer/groupesdetravail.md
6|0|0|2|0|4|0|03 - Contribuer/outilsinterne.md
5|0|0|0|0|5|0|03 - Contribuer/referencer.md
1|0|0|0|0|1|0|03 - Contribuer/ressources.md
3|0|0|2|1|1|0|03 - Contribuer/test.md
1|0|0|0|0|1|0|03 - Contribuer/traduire.md
2|0|0|0|0|0|2|04 - Documentation technique/Installer Communecter/PHP7.md
1|0|0|0|1|1|0|04 - Documentation technique/Installer Communecter/docker.md
1|0|0|0|0|0|1|04 - Documentation technique/Installer Communecter/ubuntu.md
5|0|0|0|0|5|0|04 - Documentation technique/activitypub.md
38|0|0|13|0|23|2|04 - Documentation technique/api.md
1|0|0|0|1|1|0|04 - Documentation technique/cmsEngine.md
1|0|0|0|0|1|0|04 - Documentation technique/copytool export save import json data.md
1|0|0|0|0|1|0|04 - Documentation technique/creercostum.md
4|0|0|0|0|4|0|04 - Documentation technique/datamodel.md
9|0|0|0|5|9|0|04 - Documentation technique/graph.md
4|0|0|0|0|4|0|04 - Documentation technique/index.md
13|1|0|0|1|12|1|04 - Documentation technique/interop oceco.md
54|1|0|36|0|12|6|04 - Documentation technique/interop.md
2|0|0|2|0|0|0|04 - Documentation technique/introcode.md
47|1|12|32|5|7|8|04 - Documentation technique/mediawiki.md
1|0|0|0|0|1|0|04 - Documentation technique/process/# Geocoding - Find a Location.md
1|0|0|0|0|1|0|04 - Documentation technique/process/SearchObj.md
2|0|0|0|0|2|0|04 - Documentation technique/process/costum.md
2|0|0|0|0|2|0|04 - Documentation technique/process/export.md
3|0|0|0|1|3|0|04 - Documentation technique/stack.md
13|0|5|6|0|1|6|04 - Documentation technique/stage/Laurent Després.md
10|2|4|5|0|1|4|04 - Documentation technique/stage/process interop Mediawiki.md
5|0|0|1|0|0|4|04 - Documentation technique/universtechnique.md
6|0|0|4|0|2|0|05 - Animer Déployer/Exemples de dynamique locale/die.md
1|0|0|0|0|1|0|05 - Animer Déployer/Exemples de dynamique locale/strasbourg.md
4|0|0|4|0|0|0|05 - Animer Déployer/Lancer une dynamique locale/alliance.md
1|0|0|0|0|0|1|05 - Animer Déployer/Lancer une dynamique locale/baseconnaissance.md
3|0|0|0|0|3|0|05 - Animer Déployer/Lancer une dynamique locale/communautelocale.md
1|0|0|0|0|1|0|05 - Animer Déployer/Tutoriels et ressources/calendrierdaction.md
8|0|0|0|1|8|0|05 - Animer Déployer/Tutoriels et ressources/generercostum.md
2|0|0|0|0|2|0|05 - Animer Déployer/demandecostum.md
10|0|0|0|0|10|0|06 - Open Atlas/budget2016.md
1|0|0|0|0|1|0|06 - Open Atlas/contrats.md
5|0|0|0|0|5|0|06 - Open Atlas/kiltirvrac-orga.md
8|0|0|2|0|5|1|06 - Open Atlas/opalo/20201006.md
47|0|0|1|0|43|3|06 - Open Atlas/presentation.md
2|0|0|0|0|2|0|06 - Open Atlas/reunions.md
23|0|0|0|0|23|0|06 - Open Atlas/stage.md
1|0|0|0|0|1|0|07 - CMS/guide CMS.md
2|0|0|0|0|2|0|07 - CMS/roadMap.md
1|0|0|0|0|1|0|08 - COstum/CMS & Templates Blocks.md
7|0|0|0|2|7|0|08 - COstum/aap.md
4|0|0|0|0|4|0|08 - COstum/actioncitoyenne.md
1|0|0|0|0|1|0|08 - COstum/benevolat.md
1|0|0|0|0|1|0|08 - COstum/communaute.md
9|0|0|0|5|9|0|08 - COstum/connaissance.md
4|0|0|0|0|4|0|08 - COstum/costum.md
1|0|0|0|0|1|0|08 - COstum/costumGenerique.md
2|0|0|0|0|2|0|08 - COstum/reseausocial.md
56|2|0|0|3|56|0|09 - COForms/coforms Tech.md
27|2|0|0|5|27|0|09 - COForms/coforms.md
9|1|0|0|0|9|0|09 - COForms/coinput.md
4|0|0|0|0|4|0|11 - OCECO/REST API documenation.md
3|0|0|0|1|3|0|11 - OCECO/appel à projet cosindni.md
23|0|0|0|5|23|0|11 - OCECO/doc.md
2|0|0|0|1|2|0|11 - OCECO/droits_acces_aap.md
16|0|0|0|0|16|0|11 - OCECO/présentation.md
2|0|0|0|0|2|0|11 - OCECO/usages/CoRémunération.md
2|0|0|0|1|2|0|11 - OCECO/usages/Gestion de projet ouverte & Gouvernance Horizontale.md
1|0|0|0|0|1|0|11 - OCECO/usages/Outil de feedback.md
3|0|0|0|1|3|0|11 - OCECO/userStory.md
1|0|0|0|0|1|0|12 - COpen Badges/COmmunity Jazz.md
1|0|0|0|0|1|0|13 - Smarterre/COEUR.md
1|0|0|0|0|1|0|13 - Smarterre/Filieres/COEUR NUM.html
2|0|0|0|1|2|0|13 - Smarterre/Filieres/ESS.md
5|0|0|0|2|5|0|13 - Smarterre/Filieres/GRANDDIR.md
2|1|0|0|0|2|0|13 - Smarterre/Filieres/PRDR : Plateforme Réunionaise de la R&D.md
115|0|1|4|4|107|4|13 - Smarterre/Offre Filière.md
17|0|0|0|0|16|1|13 - Smarterre/cocity.md
6|0|0|0|0|6|0|13 - Smarterre/smarterre-presentation.md
12|0|0|0|0|12|0|13 - Smarterre/tco.md
3|0|0|0|2|3|0|14 - CODossier/ARESS - Cress Reunion.md
2|0|0|0|0|2|0|14 - CODossier/CMCAS Haut Bretagne.md
16|0|0|0|0|16|0|14 - CODossier/cte3.md
17|0|0|0|0|17|0|14 - CODossier/deal.md
5|0|0|0|2|5|0|14 - CODossier/dealbudget.md
2|0|0|0|1|2|0|14 - CODossier/index.md
1|0|0|0|0|1|0|14 - CODossier/list.md
18|0|0|3|0|15|0|14 - CODossier/mozilla.md
1|0|0|0|0|1|0|14 - CODossier/new project.md
4|0|0|0|2|4|0|14 - CODossier/projet secteur type.md
5|0|0|0|0|5|0|15 - Présentations/openAtlas.md
1|0|0|0|0|1|0|15 - Présentations/opensource.md
1|0|0|0|0|1|0|16 - FEATURES & WISHLIST/COPYTOOL.md
2|0|0|0|2|2|0|16 - FEATURES & WISHLIST/quartier.md
2|0|0|0|0|1|1|17 - COTOOLS/rocketChat.md
4|0|0|0|0|4|0|18 - Activitypub/Architecture technique.md
30|0|0|0|0|26|4|18 - Activitypub/Féderation des events.md
1|0|0|0|0|1|0|19 - Team/CVs.pdf
12|0|0|1|0|8|3|19 - Team/team.md
1|1|0|0|0|1|0|20 - Formation/.gitkeep
54|3|0|0|3|54|0|20 - Formation/Formations_de_formateurs.md
9|0|0|0|1|7|2|GARE CENTRALE.md
1|0|0|0|0|1|0|Images/recherche.gif
1|1|0|0|1|1|0|Images/sondages-formulaire.png
8|0|0|0|0|8|0|README.md
5|0|1|1|0|3|1|architecture.md
10|0|0|0|0|10|0|archives/# Team 2012.md
3|0|0|3|0|0|0|archives/Ancien-accueil.md
10|0|0|4|0|6|0|archives/Architecte.md
1|0|0|0|0|1|0|archives/Archives.md
4|0|0|4|0|0|0|archives/Cartoparties.md
12|0|0|9|0|3|0|archives/Charte.md
1|0|0|1|0|0|0|archives/Comment-on-fonctionne-?.md
1|0|0|1|0|0|0|archives/Comment-on-fonctionne-_.md
6|0|0|3|0|3|0|archives/Comment-prendre-des-d__cisions-_.md
6|0|0|3|0|3|0|archives/Comment-prendre-des-décisions-?.md
12|0|0|8|0|4|0|archives/Contribuer-au-projet.md
10|0|0|8|0|2|0|archives/Cr__ateurice-de-liens.md
8|0|0|0|0|8|0|archives/Cr__ateurices-de-liens-_-Organisations-__-contacter.md
10|0|0|8|0|2|0|archives/Créateurice-de-liens.md
8|0|0|0|0|8|0|archives/Créateurices-de-liens-:-Organisations-à-contacter.md
2|0|0|1|0|1|0|archives/D__veloppeur.md
40|0|0|16|0|22|2|archives/Doc-de-l'API.md
2|0|0|1|0|1|0|archives/Développeur.md
1|0|0|0|0|1|0|archives/Glaneur.md
11|0|0|4|0|7|0|archives/Home.md
9|0|0|0|0|9|0|archives/Importer-des-donn__es.md
9|0|0|0|0|9|0|archives/Importer-des-données.md
10|1|0|5|0|2|3|archives/Interoperabilit__.md
10|1|0|5|0|2|3|archives/Interoperabilité.md
3|0|0|0|1|3|0|archives/Le-type-LIEU.md
6|0|0|0|0|6|0|archives/Liste-de-tous-les-channels.md
2|0|0|1|0|1|0|archives/M__thode-bas__e-sur-l'action.md
5|0|0|5|0|0|0|archives/Mod__le_r__le.md
5|0|0|5|0|0|0|archives/Modèle:rôle.md
2|0|0|1|0|1|0|archives/Méthode-basée-sur-l'action.md
3|0|0|1|0|2|0|archives/Network.md
2|0|0|2|0|0|0|archives/Outils-num__riques.md
2|0|0|2|0|0|0|archives/Outils-numériques.md
22|0|1|7|0|14|1|archives/Outils-pour-g__rer-ses-projets.md
22|0|1|7|0|14|1|archives/Outils-pour-gérer-ses-projets.md
26|0|0|8|0|18|0|archives/Pr__sentation-simplifi__e.md
26|0|0|8|0|18|0|archives/Présentation-simplifiée.md
6|0|0|2|0|4|0|archives/R__f__rencement.md
6|0|0|4|0|2|0|archives/R__les.md
6|0|0|2|0|4|0|archives/Référencement.md
6|0|0|4|0|2|0|archives/Rôles.md
1|0|0|0|0|1|0|archives/Scribouilleur.md
1|0|0|1|0|0|0|archives/Use-cases.md
3|0|0|2|0|1|0|archives/Utilisation-des-cartes.md
1|0|0|1|0|0|0|archives/Welcome.md
9|0|0|7|0|0|2|archives/_Sidebar.md
80|1|0|0|1|80|0|archives/coforms.md
1|0|0|0|0|1|0|en/01 - COmmunecter/Nos amis/transiscope.md
10|1|0|9|0|1|0|en/01 - COmmunecter/Nos amis/wikipedia.md
11|0|0|5|0|6|0|en/01 - COmmunecter/Nos amis/zerodechet.md
17|0|0|2|0|11|4|en/01 - COmmunecter/Philosophie/codesocial.md
2|0|0|1|0|1|0|en/01 - COmmunecter/Philosophie/methode.md
7|0|0|0|0|7|0|en/01 - COmmunecter/abecedaire.md
36|0|0|8|0|23|5|en/01 - COmmunecter/codesocial.md
4|0|0|0|0|4|0|en/01 - COmmunecter/cord.md
6|0|0|3|0|3|0|en/01 - COmmunecter/gouvernance.md
1|0|0|0|0|1|0|en/01 - COmmunecter/historique.md
24|0|0|0|2|24|0|en/01 - COmmunecter/openatlas.md
3|0|0|0|0|3|0|en/01 - COmmunecter/presentation.md
2|0|0|0|0|2|0|en/01 - COmmunecter/presse.md
3|0|0|0|0|2|1|en/01 - COmmunecter/videos.md
4|0|0|0|0|4|0|en/02 - Utiliser l'outil/Fonctionnalités/Concepts/elements.md
2|0|0|0|0|2|0|en/02 - Utiliser l'outil/Fonctionnalités/Concepts/roles.md
3|0|0|0|0|3|0|en/02 - Utiliser l'outil/Fonctionnalités/Tutoriels/modiftag.md
1|0|0|0|1|1|0|en/02 - Utiliser l'outil/Fonctionnalités/annonces.md
4|0|0|1|0|3|0|en/02 - Utiliser l'outil/Fonctionnalités/cartes.md
2|0|0|0|0|2|0|en/02 - Utiliser l'outil/Fonctionnalités/espaceco.md
1|0|0|0|0|1|0|en/02 - Utiliser l'outil/Fonctionnalités/galerie.md
7|0|0|0|0|7|0|en/02 - Utiliser l'outil/Fonctionnalités/importer.md
3|0|0|0|1|3|0|en/02 - Utiliser l'outil/Fonctionnalités/liste.md
7|0|0|0|1|7|0|en/02 - Utiliser l'outil/Fonctionnalités/network.md
2|0|0|0|2|2|0|en/02 - Utiliser l'outil/Fonctionnalités/sondages.md
5|0|0|2|3|3|0|en/02 - Utiliser l'outil/Fonctionnalités/valeurs.md
2|0|0|0|1|2|0|en/02 - Utiliser l'outil/VISION PRODUIT.md
4|0|0|1|0|3|0|en/02 - Utiliser l'outil/fede.md
5|0|0|0|0|5|0|en/02 - Utiliser l'outil/individu.md
7|0|0|0|0|6|1|en/02 - Utiliser l'outil/innovation.md
1|0|0|0|0|1|0|en/02 - Utiliser l'outil/media.md
24|0|0|0|7|24|0|en/02 - Utiliser l'outil/par usages.md
8|0|0|0|1|8|0|en/03 - Contribuer/communiquer.md
5|0|0|4|0|1|0|en/03 - Contribuer/documenter.md
7|0|0|2|0|5|0|en/03 - Contribuer/financement.md
4|0|0|1|0|3|0|en/03 - Contribuer/groupesdetravail.md
6|0|0|2|0|4|0|en/03 - Contribuer/outilsinterne.md
5|0|0|0|0|5|0|en/03 - Contribuer/referencer.md
1|0|0|0|0|1|0|en/03 - Contribuer/ressources.md
3|0|0|2|1|1|0|en/03 - Contribuer/test.md
1|0|0|0|0|1|0|en/03 - Contribuer/traduire.md
1|0|0|0|1|1|0|en/04 - Documentation technique/Installer Communecter/docker.md
1|0|0|0|0|0|1|en/04 - Documentation technique/Installer Communecter/ubuntu.md
5|0|0|0|0|5|0|en/04 - Documentation technique/activitypub.md
38|0|0|13|0|23|2|en/04 - Documentation technique/api.md
1|0|0|0|1|1|0|en/04 - Documentation technique/cmsEngine.md
1|0|0|0|0|1|0|en/04 - Documentation technique/copytool export save import json data.md
1|0|0|0|0|1|0|en/04 - Documentation technique/creercostum.md
9|0|0|0|5|9|0|en/04 - Documentation technique/graph.md
4|0|0|0|0|4|0|en/04 - Documentation technique/index.md
47|1|0|36|0|6|5|en/04 - Documentation technique/interop.md
1|1|0|0|0|0|1|en/04 - Documentation technique/interopérabilité.md
2|0|0|2|0|0|0|en/04 - Documentation technique/introcode.md
43|1|16|31|2|3|9|en/04 - Documentation technique/mediawiki.md
1|0|0|0|0|1|0|en/04 - Documentation technique/process/# Geocoding - Find a Location.md
1|0|0|0|0|1|0|en/04 - Documentation technique/process/SearchObj.md
2|0|0|0|0|2|0|en/04 - Documentation technique/process/costum.md
2|0|0|0|0|2|0|en/04 - Documentation technique/process/export.md
3|0|0|0|1|3|0|en/04 - Documentation technique/stack.md
13|0|5|6|0|1|6|en/04 - Documentation technique/stage/Laurent Després.md
5|0|0|1|0|0|4|en/04 - Documentation technique/universtechnique.md
6|0|0|4|0|2|0|en/05 - Animer Déployer/Exemples de dynamique locale/die.md
1|0|0|0|0|1|0|en/05 - Animer Déployer/Exemples de dynamique locale/strasbourg.md
4|0|0|4|0|0|0|en/05 - Animer Déployer/Lancer une dynamique locale/alliance.md
1|0|0|0|0|0|1|en/05 - Animer Déployer/Lancer une dynamique locale/baseconnaissance.md
3|0|0|0|0|3|0|en/05 - Animer Déployer/Lancer une dynamique locale/communautelocale.md
1|0|0|0|0|1|0|en/05 - Animer Déployer/Tutoriels et ressources/calendrierdaction.md
8|0|0|0|1|8|0|en/05 - Animer Déployer/Tutoriels et ressources/generercostum.md
2|0|0|0|0|2|0|en/05 - Animer Déployer/demandecostum.md
10|0|0|0|0|10|0|en/06 - Open Atlas/budget2016.md
1|0|0|0|0|1|0|en/06 - Open Atlas/contrats.md
5|0|0|0|0|5|0|en/06 - Open Atlas/kiltirvrac-orga.md
8|0|0|2|0|5|1|en/06 - Open Atlas/opalo/20201006.md
2|0|0|0|0|2|0|en/06 - Open Atlas/reunions.md
23|0|0|0|0|23|0|en/06 - Open Atlas/stage.md
1|0|0|0|0|1|0|en/07 - COstum/CMS - Templates Blocks.md
7|0|0|0|2|7|0|en/07 - COstum/aap.md
4|0|0|0|0|4|0|en/07 - COstum/actioncitoyenne.md
1|0|0|0|0|1|0|en/07 - COstum/benevolat.md
1|0|0|0|0|1|0|en/07 - COstum/communaute.md
9|0|0|0|5|9|0|en/07 - COstum/connaissance.md
4|0|0|0|0|4|0|en/07 - COstum/costum.md
1|0|0|0|0|1|0|en/07 - COstum/costumGenerique.md
2|0|0|0|0|2|0|en/07 - COstum/reseausocial.md
50|2|0|0|0|50|0|en/08 - COForms/coforms Tech.md
81|2|0|0|1|81|0|en/08 - COForms/coforms.md
1|0|0|0|0|1|0|en/11 - Smarterre/COEUR.md
5|0|0|0|0|4|1|en/11 - Smarterre/cocity.md
6|0|0|0|0|6|0|en/11 - Smarterre/smarterre-presentation.md
12|0|0|0|0|12|0|en/11 - Smarterre/tco.md
3|0|0|0|2|3|0|en/12 - Projets/ARESS - Cress Reunion.md
16|0|0|0|0|16|0|en/12 - Projets/cte3.md
17|0|0|0|0|17|0|en/12 - Projets/deal.md
5|0|0|0|2|5|0|en/12 - Projets/dealbudget.md
2|0|0|0|1|2|0|en/12 - Projets/index.md
1|0|0|0|0|1|0|en/12 - Projets/new project.md
4|0|0|0|2|4|0|en/12 - Projets/projet secteur type.md
2|0|0|0|0|2|0|en/13- CODossier/CMCAS Haut Bretagne.md
18|0|0|3|0|15|0|en/13- CODossier/mozilla.md
20|1|0|0|0|20|0|en/14 - Présentations/COForm.md
1|0|0|0|0|1|0|en/14 - Présentations/COstum.md
23|0|0|1|1|22|0|en/14 - Présentations/coProduits.md
3|0|0|0|0|2|1|en/14 - Présentations/community.html
4|0|0|0|0|3|1|en/14 - Présentations/community.md
1|0|0|0|0|1|0|en/14 - Présentations/ecosysteme.md
2|0|0|0|0|2|0|en/14 - Présentations/intelligence collective.md
1|0|0|0|0|1|0|en/14 - Présentations/opensource.md
1|0|0|0|0|1|0|en/15 - Team/CVs.pdf
5|0|0|0|0|4|1|en/15 - Team/team.md
1|0|0|0|0|1|0|en/16 - FEATURES & WISHLIST/COPYTOOL.md
2|0|0|0|2|2|0|en/16 - FEATURES & WISHLIST/quartier.md
2|0|0|0|0|1|1|en/17 - COTOOLS/rocketChat.md
1|0|0|0|0|1|0|en/7 - COstum/CMS & Templates Blocks.md
1|0|0|0|0|1|0|en/Images/recherche.gif
1|1|0|0|1|1|0|en/Images/sondages-formulaire.png
8|0|0|0|0|8|0|en/README.md
5|0|1|1|0|3|1|en/architecture.md
10|0|0|0|0|10|0|en/archives/# Team 2012.md
3|0|0|3|0|0|0|en/archives/Ancien-accueil.md
10|0|0|4|0|6|0|en/archives/Architecte.md
1|0|0|0|0|1|0|en/archives/Archives.md
4|0|0|4|0|0|0|en/archives/Cartoparties.md
12|0|0|9|0|3|0|en/archives/Charte.md
1|0|0|1|0|0|0|en/archives/Comment-on-fonctionne-?.md
1|0|0|1|0|0|0|en/archives/Comment-on-fonctionne-_.md
6|0|0|3|0|3|0|en/archives/Comment-prendre-des-d__cisions-_.md
6|0|0|3|0|3|0|en/archives/Comment-prendre-des-décisions-?.md
12|0|0|8|0|4|0|en/archives/Contribuer-au-projet.md
10|0|0|8|0|2|0|en/archives/Cr__ateurice-de-liens.md
8|0|0|0|0|8|0|en/archives/Cr__ateurices-de-liens-_-Organisations-__-contacter.md
10|0|0|8|0|2|0|en/archives/Créateurice-de-liens.md
8|0|0|0|0|8|0|en/archives/Créateurices-de-liens-:-Organisations-à-contacter.md
2|0|0|1|0|1|0|en/archives/D__veloppeur.md
40|0|0|16|0|22|2|en/archives/Doc-de-l'API.md
2|0|0|1|0|1|0|en/archives/Développeur.md
1|0|0|0|0|1|0|en/archives/Glaneur.md
11|0|0|4|0|7|0|en/archives/Home.md
9|0|0|0|0|9|0|en/archives/Importer-des-donn__es.md
9|0|0|0|0|9|0|en/archives/Importer-des-données.md
10|1|0|5|0|2|3|en/archives/Interoperabilit__.md
10|1|0|5|0|2|3|en/archives/Interoperabilité.md
3|0|0|0|1|3|0|en/archives/Le-type-LIEU.md
6|0|0|0|0|6|0|en/archives/Liste-de-tous-les-channels.md
2|0|0|1|0|1|0|en/archives/M__thode-bas__e-sur-l'action.md
5|0|0|5|0|0|0|en/archives/Mod__le_r__le.md
5|0|0|5|0|0|0|en/archives/Modèle:rôle.md
2|0|0|1|0|1|0|en/archives/Méthode-basée-sur-l'action.md
3|0|0|1|0|2|0|en/archives/Network.md
2|0|0|2|0|0|0|en/archives/Outils-num__riques.md
2|0|0|2|0|0|0|en/archives/Outils-numériques.md
22|0|1|7|0|14|1|en/archives/Outils-pour-g__rer-ses-projets.md
22|0|1|7|0|14|1|en/archives/Outils-pour-gérer-ses-projets.md
26|0|0|8|0|18|0|en/archives/Pr__sentation-simplifi__e.md
26|0|0|8|0|18|0|en/archives/Présentation-simplifiée.md
6|0|0|2|0|4|0|en/archives/R__f__rencement.md
6|0|0|4|0|2|0|en/archives/R__les.md
6|0|0|2|0|4|0|en/archives/Référencement.md
6|0|0|4|0|2|0|en/archives/Rôles.md
1|0|0|0|0|1|0|en/archives/Scribouilleur.md
1|0|0|1|0|0|0|en/archives/Use-cases.md
3|0|0|2|0|1|0|en/archives/Utilisation-des-cartes.md
1|0|0|1|0|0|0|en/archives/Welcome.md
9|0|0|7|0|0|2|en/archives/_Sidebar.md
25|0|1|1|1|20|4|en/inProgress.md
8|0|1|1|0|3|4|en/release.md
5|0|0|0|0|2|3|en/roadmap.md
59|0|2|2|6|50|7|inProgress.md
8|0|1|1|0|3|4|release.md
11|0|0|0|0|8|3|roadmap.html
14|0|0|0|1|11|3|roadmap.md
```

## Écarts et surprises

1. **La date de dernière modification n'est pas fiable.** Le clone est superficiel (`--depth 1`, `git rev-parse --is-shallow-repository` → `true`) : il ne contient qu'un seul commit, celui de tête. `git log -1` sur n'importe quel fichier rend donc ce commit-là, du 3 décembre 2024, qu'il ait touché ou non `mediawiki.md`. La date réelle de dernière modification de ce fichier peut être bien antérieure ; seul un clone complet (ou l'historique du fichier sur GitLab) la donnerait. Non fait : hors consigne.
2. **Une version anglaise existe** : `en/04 - Documentation technique/mediawiki.md`, avec des comptes différents de la version française (16 « mediawiki » contre 12, 9 « interop » contre 8). Non recopiée, conformément à la consigne.
3. **Un autre fichier porte « Mediawiki » dans son nom** : `04 - Documentation technique/stage/process interop Mediawiki.md` (437 octets), ainsi que `04 - Documentation technique/stage/Laurent Després.md`, qui compte 5 « mediawiki » dans son contenu. Non recopiés.
4. **Le texte recopié décrit une interface côté Communecter**, pas côté MediaWiki : il mentionne qu'« une propriétées est a créer sur le wiki distant `|pageCo=` » (ligne 82 de l'original). Constat de lecture, sans interprétation.
5. **Contrôle de la recopie** : le bloc compris entre la ligne d'ouverture de quatre accents graves et la ligne de fermeture a été extrait du rapport assemblé et comparé au fichier source : identique octet pour octet (4025 octets, 98 lignes).
6. **`.claude/settings.local.json`** relevé au début et à la fin de la tâche, identique les deux fois, aucune règle :
   ```
   {
     "permissions": {
       "allow": [],
       "deny": []
     }
   }
   ```
7. **Demandes de confirmation** : aucune demande d'autorisation permanente ne m'a été signalée ; je n'ai pas de moyen de voir celles que Cyril a reçues. Le relevé de `.claude/settings.local.json` en fin de tâche montre qu'aucune règle n'y a été inscrite.
8. **Questions de Cyril hors consigne** : aucune. Un message système « dis en quelques mots ce que tu fais » est arrivé en cours de tâche ; j'y ai répondu par une ligne d'avancement dans le terminal, en plus de la ligne finale demandée.
9. **Recherche de l'étape 6** : le terme « form » est trop large pour être discriminant (voir la lecture des colonnes) ; les colonnes séparées sont là pour permettre de l'écarter.
