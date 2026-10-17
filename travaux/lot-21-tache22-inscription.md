# Lot 21, tâche 22 — Inscription des arbitrages et de l'exemple éprouvé

Session du 14 octobre 2026. Environnement Claude Code hébergé (cloud), branche `ccr-ad6f0bcb-wsc18c`, session wiki ouverte par `bin/wiki-login.sh` sous le compte `Cywil` (id 4). Une seule écriture sur le wiki, sur `Lot 21 — Grandeurs et unités` : révision 1478 → 1598, le 14 octobre 2026 à 10:50:18 UTC.

## Étape 0 — État du dépôt

`git status` au début :

```
On branch ccr-ad6f0bcb-wsc18c
Your branch is up to date with 'origin/ccr-ad6f0bcb-wsc18c'.

nothing to commit, working tree clean
```

Branche courante : `ccr-ad6f0bcb-wsc18c`. Aucune ligne M, A, D ou R, aucune ligne ??.

Après `git fetch origin main`, `origin/main` et `HEAD` sont tous deux sur `5dee059`, le commit du rapport de la tâche 21 : il n'y avait rien à ramener.

`travaux/lot-21-tache22-inscription.md` n'existait pas (`ls` : « No such file or directory »).

`.claude/settings.local.json` était absent au début et l'est encore à la fin (`ls -la .claude/` ne montre que `commands/` et `settings.json`). Il ne porte donc aucune règle.

## Révision de départ de la page

Lecture `prop=info|revisions`, à 10:46:19 UTC :

```
"pageid": 532, "title": "Lot 21 — Grandeurs et unités", "lastrevid": 1478, "length": 29336,
"touched": "2026-10-09T11:00:12Z", "protection": [], "actions": {"edit": []}
"revid": 1478, "parentid": 1474, "user": "Cywil", "timestamp": "2026-10-09T11:00:12Z",
"comment": "[Lot 21][Tâche 18] Risques connus : six gels sur sept levés"
```

La révision de départ est **1478**, comme l'annonce la consigne : la page n'avait pas changé. Elle n'a aucune protection native, et `intestactions` ne signale aucun empêchement d'écriture.

Le wikitexte récupéré par `bin/wiki-get.sh` dans `pages/Lot_21.txt` fait 29 336 octets. `git status` n'a ensuite signalé aucune modification : la copie du dépôt était déjà la révision 1478, à l'octet près. Une copie a été gardée dans le scratchpad (`lot21_avant.txt`) pour le diff.

Ancres, comptées avant toute modification par un script de lecture (`ancres.py`, contenu affiché dans le terminal avant son lancement) :

```
1.1 lignes commençant par l'ancre : [33] | occurrences dans tout le texte : 1
1.5 lignes commençant par l'ancre : [142] | occurrences dans tout le texte : 1
1.6 lignes commençant par l'ancre : [57] | occurrences dans tout le texte : 1
1.2 lignes égales à l'ancre : [91] | occurrences dans tout le texte : 1
1.3 lignes égales à l'ancre : [83] | occurrences dans tout le texte : 1
1.4 occurrences du bloc entier : 1
espaces insécables U+00A0 : 0 | U+202F : 0
```

Chaque ancre est présente une fois et une seule. Le bloc de 1.4 a été cherché d'un seul tenant, la phrase d'introduction, la ligne vide et les quatre puces. Le texte ne contient aucune espace insécable, ce qui rend la comparaison exacte fiable.

Les six modifications ont été appliquées à `pages/Lot_21.txt` par l'outil d'édition de fichier. Cet outil refuse un remplacement dont le texte d'origine est absent ou multiple, ce qui revérifie l'unicité de chaque ancre. La révision a été relue à 10:50:13 UTC, juste avant l'écriture : toujours 1478. Écriture :

```
bin/wiki-put.sh "Lot 21 — Grandeurs et unités" pages/Lot_21.txt "[Lot 21][Tâche 22] Arbitrages rendus, syntaxe de requête mesurée, l'unité appartient à une dimension"
→ "result": "Success", "pageid": 532, "oldrevid": 1478, "newrevid": 1598, "newtimestamp": "2026-10-14T10:50:18Z"
```

## Diff complet

Le diff ci-dessous est la sortie de `diff -u` entre la copie de la révision 1478 et `pages/Lot_21.txt` tel qu'il a été écrit. Seules les deux lignes d'en-tête de fichier sont retirées. La page passe de 29 336 à 35 477 octets. Les deux exemples protégés par `<nowiki>` sont l'objet de l'écart 1.

```diff
@@ -30,7 +30,7 @@
 
 '''Toute unité convertible par un coefficient peut être acceptée, à condition d'être déclarée.''' Une valeur saisie dans une unité dont la conversion n'est pas déclarée n'est pas stockée, et une erreur la signale : le système ne devine jamais un coefficient. Déclarer l'unité, avec son coefficient vers l'unité principale, suffit pour qu'elle soit acceptée et convertie, qu'elle appartienne au SI ou non. Règle posée le 4 octobre 2026 : les documents techniques à reprendre emploient beaucoup d'unités hors du SI, et chacune doit pouvoir s'y ramener. Deux exceptions à la règle du coefficient : les températures, dont le décalage d'origine relève du type Temperature, et les grandeurs logarithmiques comme le décibel, qui n'ont pas de coefficient.
 
-'''Les déclarations d'unités se partagent par un modèle transclus.''' Mesuré le 4 octobre 2026 : trois propriétés appelant le même modèle portent les mêmes unités, et une propriété peut en déclarer une en propre en plus. Précisé le 8 octobre 2026 : ce modèle transclus est le bloc de déclaration porté par la page de grandeur. Voir « La conception arrêtée ».
+'''Les déclarations d'unités se partagent par un modèle transclus.''' Mesuré le 4 octobre 2026 : trois propriétés appelant le même modèle portent les mêmes unités, et une propriété peut en déclarer une en propre en plus. Précisé le 8 octobre 2026 : ce modèle transclus est le bloc de déclaration porté par la page de grandeur. Voir « La conception arrêtée ». Corrigé le 13 octobre 2026 : ce bloc est porté par la dimension, non par la grandeur. Voir « L'unité appartient à une dimension ».
 
 '''La spécification et la mesure sont portées par des sous-objets.''' Mesuré le 4 octobre 2026 : les sous-objets sont stockés, et une requête les traverse jusqu'à trois sauts, de l'item jusqu'à la page de grandeur en passant par le sous-objet et l'unité.
 
@@ -54,7 +54,7 @@
 
 '''Trois propriétés par grandeur : la valeur, le minimum, le maximum.''' <code>Diameter</code>, <code>Diameter min</code>, <code>Diameter max</code>. Les comparateurs sur des bornes de ce genre ont été mesurés le 4 octobre 2026. Les deux autres formes envisagées, un rôle de borne porté par le sous-objet ou deux bornes dans un sous-objet distinct, multiplieraient les sous-objets pour économiser des propriétés, c'est-à-dire déplaceraient la complexité là où elle se voit le moins.
 
-'''Toute valeur de grandeur est portée par un sous-objet, sans exception.''' Le mode scalaire disparaît. Un item peut porter deux diamètres, et un scalaire n'en loge qu'un : la forme dépendrait alors de l'item, et une requête devrait chercher à deux endroits sans savoir lequel. Prix accepté : plus aucune valeur ne s'écrit en une ligne. Gain : une seule forme, donc aucun choix à la saisie, et un seul mécanisme de sélection au lieu de deux.
+'''Toute valeur de grandeur est portée par un sous-objet, sans exception.''' Le mode scalaire disparaît. Un item peut porter deux diamètres, et un scalaire n'en loge qu'un : la forme dépendrait alors de l'item, et une requête devrait chercher à deux endroits sans savoir lequel. Prix accepté : plus aucune valeur ne s'écrit en une ligne. Gain : une seule forme, donc aucun choix à la saisie, et un seul mécanisme de sélection au lieu de deux. Éprouvé le 13 octobre 2026 sur la fiche de la machine à souder SUNKKO 709AD : onze lignes deviennent dix, le modèle de saisie tenant sur une ligne par caractéristique. Le prix de cette décision est donc faible, à condition que ce modèle existe.
 
 '''Le mode est porté par une propriété, <code>Characteristic mode</code>, en énumération fermée à deux valeurs : spécification et mesure.''' Une catégorie ne conviendrait pas, un sous-objet n'en portant pas (mesuré le 5 octobre 2026). Deux valeurs seulement : la provenance d'une mesure, son incertitude et la façon dont elle a été obtenue relèvent du [[Lot 31 — Qualification des données et confiance entre pairs|lot 31]], et une énumération fermée est ce qu'il y a de plus coûteux à enrichir une fois le verrou posé (entrée 65).
 
@@ -80,6 +80,22 @@
 
 '''La reprise des propriétés existantes ne migre rien : elle réécrit les pages porteuses.''' <code>Max thickness</code> à 0,2 devient un sous-objet portant une épaisseur de 0,2 mm, en mode spécification, avec le rôle maximal. Trois valeurs sur deux pages. Les anciennes propriétés restent en place et se vident, et leur sort appartient au [[Lot 26 — Renommage des propriétés par domaine|lot 26]]. '''Aucune écriture n'a donc lieu sur les quatre pages de propriété existantes''', ce qui écarte tout risque de verrou sur elles. La règle d'ordre inscrite aux risques connus le 6 octobre 2026, écrire l'unité puis changer le type, devient sans objet.
 
+'''L'unité appartient à une dimension, non à une grandeur.''' Arrêté le 13 octobre 2026, sur l'épreuve de l'exemple. L'épaisseur, le diamètre, la longueur et la largeur sont des grandeurs de dimension longueur, et le millimètre les sert toutes. Le bloc de déclaration d'unités est donc porté par la dimension, écrit une fois, et toutes les grandeurs de cette dimension le transcluent. Conséquence : la ligne « dimension » d'une page de grandeur, écartée le 6 octobre 2026 comme inutile faute de mécanisme qui s'en serve, devient la charnière du modèle.
+
+'''Le socle n'a pas de domaine, et c'est ce qui le définit.''' Le [[Lot 26 — Renommage des propriétés par domaine|lot 26]] veut qu'une propriété dont l'espace de valeurs n'a de sens qu'à l'intérieur d'une facette porte ce domaine dans son nom. Une grandeur physique n'est propre à aucune facette : <code>Diameter</code> vaut pour une pompe, un tube, un arbre. Le socle en est donc exempté, et il est le seul ensemble de propriétés que leur absence de domaine qualifie. Le contraste avec <code>Quantity symbol</code>, qui en porte un, dit à lui seul lequel des deux est partagé.
+
+'''Les noms du socle.''' Le nom nu pour une grandeur, <code>Diameter</code>, et non <code>Quantity diameter</code> ni <code>Diameter value</code> : c'est le mot que porte la page de grandeur, et il se traduit directement en identifiant externe. Les bornes en suffixe, <code>Diameter min</code> et <code>Diameter max</code>, pour que les trois propriétés d'une grandeur restent groupées dans une liste alphabétique. Quatre propriétés de structure, qui ne portent aucune grandeur mais disent comment une valeur s'attache : <code>Characteristic mode</code>, <code>Characteristic role</code>, <code>Characteristic of</code>, <code>Tolerance as written</code>. Vérifié le 13 octobre 2026 : <code>Characteristic of</code> ne recoupe pas <code>Contained in</code>, créée par le [[Lot 12 — Contenants et étiquetage|lot 12]], qui désigne le contenant physique d'un exemplaire.
+
+'''Les noms des pages de grandeur et d'unité.''' Celles-là ont un domaine et suivent la convention du lot 26 : <code>Quantity label</code>, <code>Quantity symbol</code>, <code>Quantity main unit</code>, <code>Quantity admitted units</code>, <code>Quantity datatype</code>, <code>Quantity dimension</code>, <code>Quantity external id</code> ; <code>Unit label</code>, <code>Unit symbol</code>, <code>Unit aliases</code>, <code>Unit factor</code>, <code>Unit of dimension</code>, <code>Unit ucum</code>, <code>Unit external id</code>, <code>Unit si status</code>.
+
+'''Le vocabulaire des rôles est porté par des pages, non par une énumération fermée.''' Arrêté le 13 octobre 2026. Un rôle est une notion partagée, comme une grandeur ou une unité : « nominal » veut dire la même chose dans tous les ateliers, et une page porte ses libellés par langue, ce dont le [[Lot 19 — Vocabulaire et multilingue|lot 19]] a besoin. L'argument de la validation tombe de lui-même, le formulaire présentant une liste déroulante alimentée par ces pages, où une faute de frappe est impossible. Premiers rôles : nominal, extérieur, intérieur, hors tout, utile, maximal admissible, minimal admissible. '''À ne pas confondre avec les bornes :''' <code>Diameter max</code> est la borne haute de la tolérance d'un diamètre donné, tandis que le rôle « maximal admissible » qualifie de quel diamètre on parle. L'épaisseur maximale soudable d'une soudeuse est une caractéristique en soi, qui a elle-même un nominal et des bornes. La distinction doit figurer sur la page du rôle, pas seulement ici.
+
+'''La syntaxe des requêtes de seuil, mesurée le 13 octobre 2026.''' Une requête sur une grandeur rend des sous-objets, le scalaire ayant disparu. Pour remonter à l'item, la condition s'écrit <code><nowiki>[[Has subobject.Diameter::...]]</nowiki></code>, '''sans signe moins''' : la forme avec le signe moins ne rend rien. Et le comparateur <code>></code> n'est pas strict sur une Quantity avec unité, la condition <code>>0,3 mm</code> étant compilée en <code>≥0,0003 m</code> ; <code>>></code> l'est. La requête juste est donc de la forme <code><nowiki>{{#ask: [[Has subobject.Thickness::>>0,3 mm]] }}</nowiki></code>. '''Un contributeur qui écrit <code>></code> obtient un résultat de trop sans la moindre erreur''' : la forme à employer doit figurer sur la page de grandeur, à côté du bloc de déclaration, et pas seulement dans les Limites connues.
+
+'''La granularité d'une grandeur suit la référence externe.''' Une longueur, une largeur, une hauteur, un diamètre et une épaisseur ont la même dimension physique, et une propriété par grandeur stricte n'en ferait qu'une. La découpe est donc prise sur QUDT, qui sert déjà de clé de jointure entre wikis, et non inventée ici : inventer une découpe que personne d'autre n'aura ruinerait la jointure. '''À vérifier avant d'arrêter la liste des premières grandeurs''', QUDT n'étant pas joignable depuis l'environnement d'exécution.
+
+'''Le formulaire est une pièce du modèle, pas un confort.''' Éprouvé le 13 octobre 2026 : la fiche reste lisible pour qui connaît le modèle, mais personne ne devinera « maximal admissible » ni la forme <code>>></code> sans liste déroulante ni aide à la saisie. Le lot ne l'avait pas prévu ; il doit l'être avant la première saisie par un contributeur.
+
 == Ce qui est écarté, et pourquoi ==
 
 '''Traiter dans ce lot les quatre besoins du lot 9.''' Écarté le 4 octobre 2026. Le motif de la règle, un seul mécanisme, est satisfait par une construction conçue une fois et réemployée ; la déployer ici pour les quatre ferait de ce lot celui de la réception, de la récolte, de la présence et de la qualification à la fois.
@@ -88,7 +104,7 @@
 
 '''Une grandeur « écart de température », distincte de la température.''' Envisagée le 6 octobre 2026, parce que le type Temperature applique le décalage d'origine à un écart et le rend faux. Écartée le 8 octobre 2026 : les tolérances se stockant en bornes absolues, il n'existe plus d'écart nulle part, et une borne absolue est une température ordinaire. La mesure du décalage garde sa valeur d'avertissement, et justifie précisément ce choix. Si un écart devait un jour être stocké tel quel, il faudrait une grandeur distincte.
 
-'''Une page d'unité portant deux appartenances.''' Envisagée le 6 octobre 2026 pour le degré Celsius, unité de deux grandeurs à la fois. Tombe avec la précédente : une unité appartient à une grandeur, sans exception.
+'''Une unité appartenant à une grandeur.''' Posé le 6 octobre 2026, écarté le 13 octobre 2026. L'exemple écrit sur la fiche de la machine à souder SUNKKO 709AD a montré que la ligne ne se remplit pas : le millimètre sert l'épaisseur, le diamètre, la longueur et la largeur. Il aurait fallu répéter la page d'unité par grandeur, ou la rendre multivaluée vers une dizaine de grandeurs, et répéter le bloc de déclaration autant de fois. Une unité appartient donc à une dimension.
 
 '''Le bloc de déclaration engendré par une requête sur les pages d'unité.''' Écarté le 8 octobre 2026. Une requête s'exécuterait au moment d'analyser une page de propriété, et son résultat déciderait du type des données ; si elle rendait les unités dans un autre ordre, l'unité d'affichage par défaut changerait sans que personne ait rien touché. C'est ajouter une pièce mobile à l'endroit le plus rigide du système. L'automatisation se reposera quand la fédération aura des dizaines de grandeurs.
 
@@ -114,12 +130,10 @@
 
 Les descriptions des propriétés de diamètre nominal et secondaire prescrivent le point décimal, que l'installation rejette, et le diamètre secondaire sépare ses valeurs par la virgule, qui découpe une virgule décimale (entrée 57 des Limites connues). Aucune valeur n'en dépend. Depuis le 8 octobre 2026, ces deux propriétés ne sont plus reprises par ce lot : elles se vident et leur sort appartient au [[Lot 26 — Renommage des propriétés par domaine|lot 26]]. Il n'y a donc plus lieu de les corriger ici, non parce qu'une écriture les verrouillerait, ce verrou se levant en quelques jours, mais parce qu'elles ne sont plus du ressort de ce lot.
 
-Quatre arbitrages restent à rendre avant la première écriture dans l'espace Attribut, et les deux premiers seuls sont bloquants :
+Les quatre arbitrages ouverts le 8 octobre 2026 ont été rendus le 13, et figurent dans « La conception arrêtée ». Il reste deux choses à faire avant la première écriture dans l'espace Attribut :
 
-* le vocabulaire des rôles, et sa forme : énumération fermée, ou pages d'un vocabulaire ouvert ;
-* les noms des propriétés, celles du socle comme celles que portent les pages de grandeur et d'unité. Le motif n'est pas le verrou, qui se lève en quelques jours, mais la fédération : un nom de propriété engage tous les wikis partenaires, et le renommer relève d'un lot entier, le [[Lot 26 — Renommage des propriétés par domaine|lot 26]] ;
-* le nom du champ qui conserve la forme d'origine d'une tolérance ;
-* la liste des grandeurs à créer en premier.
+* vérifier sur QUDT la granularité d'une grandeur, c'est-à-dire si la longueur, la largeur, la hauteur, le diamètre et l'épaisseur y sont des grandeurs distinctes. QUDT n'étant pas joignable depuis l'environnement d'exécution, cette lecture se fait hors de lui ;
+* arrêter la liste des premières grandeurs, qui s'en déduit et se règle sur l'inventaire d'outils à saisir.
 
 Le lot n'est bloqué par rien d'autre. Les opérations côté serveur, dont l'examen du verrou de propagation, restent en attente de la migration et ne commandent plus aucune étape de ce lot.
 
@@ -139,7 +153,7 @@
 * Ce risque ne concerne plus ce lot depuis le 8 octobre 2026 : la reprise des propriétés existantes ne change aucun type, elle réécrit les pages porteuses. Il reste valable pour tout lot qui changerait le type d'une propriété en production.
 * Une propriété neuve se crée une à la fois, sous réserve de la barrière du type résolu. Compte au 8 octobre 2026 : vingt-cinq propriétés créées du 4 au 6 octobre, dont sept ont gelé sur le type par défaut, en deux épisodes seulement, une rafale de six et une création isolée. Ni la rafale ni l'isolement ne prédisent le gel. Six de ces sept gels se sont levés d'eux-mêmes en deux à quatre jours ; le septième n'était pas levé le 9 octobre 2026, après cinq (entrée 59 des Limites connues). Un gel coûte donc le plus souvent une attente, et parfois un nom. Le verrou d'écriture, lui, est fréquent, ne gêne pas l'usage (entrée 63), et se lève seul en quelques jours (entrée 62). Une déclaration neuve n'a donc pas à être juste du premier coup : elle a à être corrigible quelques jours plus tard, ce qu'elle est. La rédaction du 8 octobre 2026, qui annonçait onze créations isolées toutes correctes, était fausse : dix sur onze.
 * Une page de propriété d'essai se supprime directement, jamais après avoir été vidée : le blanchiment la verrouille (entrée 33 des Limites connues).
-* Ajouter une unité à une grandeur modifie une déclaration partagée par toutes ses propriétés, qui se réanalysent alors : l'effet sur le verrou de propagation n'est pas mesuré.
+* Ajouter une unité à une grandeur modifie une déclaration partagée par toutes ses propriétés, qui se réanalysent alors : l'effet sur le verrou de propagation n'est pas mesuré. Depuis le 13 octobre 2026, cette déclaration est partagée par toutes les grandeurs d'une même dimension, donc par davantage de propriétés encore.
 
 == Dépendances ==
 
```

## Vérifications

### a. Celle qui tranche — contenu écrit

```
bin/wiki-verify.sh "Lot 21 — Grandeurs et unités" pages/Lot_21.txt
IDENTIQUE : Lot 21 — Grandeurs et unités
```

Sortie 0.

### b. Structure

La page a été relue depuis le wiki après écriture (`lot21_apres.txt`, 35 477 octets), et la révision 1478 a été analysée de la même façon pour comparaison. Script de lecture : `structure.py`, contenu affiché dans le terminal avant son lancement. Un paragraphe y est une ligne de texte non vide qui n'est ni un titre, ni une puce, ni une ligne du modèle `{{Lot}}` ; les puces sont comptées à part. Sur cette page, chaque paragraphe tient sur une ligne et les paragraphes sont séparés par une ligne vide.

| Section, dans l'ordre | Rév. 1478 : ligne, paragraphes, puces | Rév. 1598 : ligne, paragraphes, puces |
|---|---|---|
| (avant le premier titre : le modèle `{{Lot}}`) | 1, 0, 0 | 1, 0, 0 |
| Ce qui est déjà tranché | 11, 17, 0 | 11, 17, 0 |
| La conception arrêtée | 47, 17, 0 | 47, **25**, 0 |
| Ce qui est écarté, et pourquoi | 83, 5, 0 | 99, 5, 0 |
| Ce qui est exclu du périmètre | 95, 7, 0 | 111, 7, 0 |
| Points ouverts | 111, 4, 4 | 127, 4, **2** |
| Point de départ | 126, 2, 3 | 140, 2, 3 |
| Risques connus | 136, 0, 5 | 150, 0, 5 |
| Dépendances | 144, 2, 0 | 158, 2, 0 |

Les deux paragraphes de « Dépendances » comptent la ligne finale « Voir aussi la [[Gestion des lots]]. », placée après le séparateur `----`.

« La conception arrêtée » (ligne 47) précède bien « Ce qui est écarté, et pourquoi » (ligne 99). Les huit paragraphes ajoutés y figurent, en fin de section, dans l'ordre de la consigne :

```
ajouté, ligne 83 : '''L'unité appartient à une dimension, non à une grandeur.'''
ajouté, ligne 85 : '''Le socle n'a pas de domaine, et c'est ce qui le définit.'''
ajouté, ligne 87 : '''Les noms du socle.'''
ajouté, ligne 89 : '''Les noms des pages de grandeur et d'unité.'''
ajouté, ligne 91 : '''Le vocabulaire des rôles est porté par des pages, non par une énumération fermée.'''
ajouté, ligne 93 : '''La syntaxe des requêtes de seuil, mesurée le 13 octobre 2026.'''
ajouté, ligne 95 : '''La granularité d'une grandeur suit la référence externe.'''
ajouté, ligne 97 : '''Le formulaire est une pièce du modèle, pas un confort.'''
```

### c. Lignes

Les trois lignes concernées, recopiées en entier depuis la page relue (`grep -n`) :

```
33:'''Les déclarations d'unités se partagent par un modèle transclus.''' Mesuré le 4 octobre 2026 : trois propriétés appelant le même modèle portent les mêmes unités, et une propriété peut en déclarer une en propre en plus. Précisé le 8 octobre 2026 : ce modèle transclus est le bloc de déclaration porté par la page de grandeur. Voir « La conception arrêtée ». Corrigé le 13 octobre 2026 : ce bloc est porté par la dimension, non par la grandeur. Voir « L'unité appartient à une dimension ».
57:'''Toute valeur de grandeur est portée par un sous-objet, sans exception.''' Le mode scalaire disparaît. Un item peut porter deux diamètres, et un scalaire n'en loge qu'un : la forme dépendrait alors de l'item, et une requête devrait chercher à deux endroits sans savoir lequel. Prix accepté : plus aucune valeur ne s'écrit en une ligne. Gain : une seule forme, donc aucun choix à la saisie, et un seul mécanisme de sélection au lieu de deux. Éprouvé le 13 octobre 2026 sur la fiche de la machine à souder SUNKKO 709AD : onze lignes deviennent dix, le modèle de saisie tenant sur une ligne par caractéristique. Le prix de cette décision est donc faible, à condition que ce modèle existe.
156:* Ajouter une unité à une grandeur modifie une déclaration partagée par toutes ses propriétés, qui se réanalysent alors : l'effet sur le verrou de propagation n'est pas mesuré. Depuis le 13 octobre 2026, cette déclaration est partagée par toutes les grandeurs d'une même dimension, donc par davantage de propriétés encore.
```

Chaque ajout se trouve sur la même ligne que son ancre. Les lignes 34, 58 et 157 sont vides (`cat -A` les montre réduites à `$`), et la ligne 158 est `== Dépendances ==`. Le texte de chaque ajout se trouve sur une seule ligne de la page : `grep -c` en compte 3 pour les trois ajouts. Aucun saut de ligne n'a été introduit.

### d. Renvois

**Mentions « entrée NN ».** Les *Limites connues* ont été relues le 14 octobre 2026 : 66 765 octets, identiques à la lecture du 13 octobre (`diff -q`), et 72 entrées numérotées. Le script de lecture `renvois.py` relève chaque mention dans la page écrite et lui associe le titre de l'entrée NN, c'est-à-dire de la NN-ième ligne `# ` de la liste. Il y a 16 mentions : 12 de la forme « entrée NN des Limites connues », dont une avec lien, et 4 de la forme courte « (entrée NN) », dans une phrase qui parle des Limites connues. Elles visent 11 entrées distinctes.

| Ligne | Mention, avec son contexte | Titre de l'entrée NN | Correspond |
|---|---|---|---|
| 17 | « tenait ce motif pour déjà employé sur ce wiki, ce que dément l'entrée 2 des [[Limites connues…]] » | 2 — L'arbre fonctionnel est devenu un graphe orienté acyclique. | oui, voir plus bas |
| 17 | « orifice de raccord de l'entrée 10 des Limites connues » | 10 — `Thread_designation` et `Secondary_diameter` ne disent pas quel filetage va avec quel diamètre sur un raccord à plusieurs orifices. | oui |
| 25 | « toute écriture modifiant le type d'une propriété la verrouille aussitôt (entrée 62 des Limites connues) » | 62 — Toute écriture qui modifie le type d'une propriété la verrouille aussitôt, et le verrou se lève seul en quelques jours. | oui |
| 25 | « Un verrou n'empêche d'ailleurs ni le stockage ni la requête (entrée 63) » | 63 — Un verrou de propagation n'empêche ni le stockage d'une valeur ni sa requête. | oui |
| 25 | « ce qui retire sa raison d'être à la règle d'écriture unique (entrée 62 des Limites connues) » | 62 | oui |
| 29 | « dans la dernière chez Temperature (entrée 61 des Limites connues) » | 61 — L'unité d'affichage par défaut est la première déclarée chez Quantity et la dernière chez Temperature. | oui |
| 43 | « une tolérance de 2 °C y est stockée 275,15 sans la moindre erreur (entrée 60 des Limites connues) » | 60 — Le décalage d'origine du type Temperature s'applique aussi aux écarts et aux tolérances, ce qui les rend faux. | oui |
| 45 | « chez Temperature, la dernière (entrée 61 des Limites connues) » | 61 | oui |
| 53 | « Le recoupement entre lots ne se déclarant que d'un côté (entrée 51 des Limites connues) » | 51 — Le recoupement entre lots ne se déclare que d'un côté. | oui |
| 59 | « une énumération fermée est ce qu'il y a de plus coûteux à enrichir une fois le verrou posé (entrée 65) » | 65 — Enrichir une énumération fermée modifie la déclaration de la propriété, et diffère le changement suivant. | oui |
| 131 | « le diamètre secondaire sépare ses valeurs par la virgule, qui découpe une virgule décimale (entrée 57 des Limites connues) » | 57 — La virgule décimale se heurte au séparateur de valeurs multiples. | oui |
| 152 | « Le verrou se lève seul en quelques jours (entrée 62 des Limites connues) » | 62 | oui |
| 154 | « le septième n'était pas levé le 9 octobre 2026, après cinq (entrée 59 des Limites connues) » | 59 — Le type résolu d'une propriété peut rester le type par défaut alors que sa page porte le bon type. | oui |
| 154 | « Le verrou d'écriture, lui, est fréquent, ne gêne pas l'usage (entrée 63) » | 63 | oui |
| 154 | « et se lève seul en quelques jours (entrée 62) » | 62 | oui |
| 155 | « le blanchiment la verrouille (entrée 33 des Limites connues) » | 33 — Blanchir une page de propriété avant de la supprimer la verrouille. | oui |

Le titre de l'entrée 2 ne suffit pas à juger, d'où une lecture du texte entier. L'entrée dit qu'« il n'existe aucun patron de résolution à recopier » et que l'affirmation contraire, selon laquelle `Board_lineage` et `Module:Board` matérialisaient la fermeture transitive, portait sur trois pages « absentes du wiki ». Or l'amendement 1 du lot 9, `travaux/lot-9-amendement-1.md`, ligne 131, écrit : « Le motif est déjà employé sur ce wiki (`Board_lineage` / `Module:Board` ». L'entrée 2 dément donc bien ce que la ligne 17 lui fait démentir.

Les mentions situées dans les lignes modifiées par cette tâche n'ont pas bougé. Les huit paragraphes ajoutés n'en contiennent aucune.

**Liens vers les lots 12, 19 et 26.** Les trois pages existent : `Lot 12 — Contenants et étiquetage` (pageid 485), `Lot 19 — Vocabulaire et multilingue` (pageid 491) et `Lot 26 — Renommage des propriétés par domaine` (pageid 537), aucune ne rendant `missing`. Dans `action=parse&prop=links` de la page écrite, toutes trois portent `exists: true`.

### e. Rendu

`action=parse&prop=text` sur la page écrite : 49 265 octets de HTML, contre 42 982 avant l'écriture.

- **Avertissements de Semantic MediaWiki : aucun.** Le HTML ne contient aucune occurrence de `data-type="4"`, `data-type="5"`, `smw-warning`, `smwtticon` ni `class="error`, comme avant l'écriture.
- **Liens vers une page inexistante : aucun.** Aucun lien `class="new"` n'apparaît, ni avant ni après. `action=parse&prop=links` rend 12 liens, aucun avec `exists: false`, et la liste est identique avant et après, titre par titre : les liens ajoutés vers les lots 12, 19 et 26 existaient déjà ailleurs dans la page.
- **Catégories** : `Lot` seulement, avant comme après.
- **Les deux exemples protégés s'affichent en texte littéral** : `<code>[[Has subobject.Diameter::...]]</code>` et `<code>{{#ask: [[Has subobject.Thickness::&gt;&gt;0,3 mm]] }}</code>`.
- **Faits SMW de la page** (`bin/wiki-api.sh --facts`) : mêmes propriétés avant et après, les sept `Work_package_*` du modèle `{{Lot}}`, trois `_ASK` aux mêmes identifiants, `_INST`, `_SKEY`. Seul `_MDAT` change, en `1/2026/10/14/10/50/18/0`. Aucune annotation ni requête nouvelle.

### f. Propriétés de production intactes

Lecture connectée, avec `meta=userinfo` dans la même requête : `"id": 4`, `"name": "Cywil"`. Aucun avertissement de session expirée sur stderr ; la chaîne contient `intestactions`, ce qui déclenche le contrôle de session de `bin/wiki-api.sh`.

| Propriété | Révision | `intestactions` (`edit`) |
|---|---|---|
| Attribut:Nominal diameter | 342 | `[]`, aucun verrou |
| Attribut:Secondary diameter | 343 | `[]`, aucun verrou |
| Attribut:Power rating | 803 | `[]`, aucun verrou |
| Attribut:Max thickness | 804 | `[]`, aucun verrou |

## Écarts et surprises

1. **Deux exemples du bloc 1.3 ont été protégés par `<nowiki>`, contrairement au texte fourni.** La consigne écrit `<code>[[Has subobject.Diameter::...]]</code>` et `<code>{{#ask: [[Has subobject.Thickness::>>0,3 mm]] }}</code>`. `CLAUDE.md` établit que `<code>` ne protège rien et que seul `<nowiki>` échappe ; le patron maison est `<code><nowiki>…</nowiki></code>`. Écrit tel quel, le premier exemple aurait été lu comme une annotation, et sa valeur « ... » serait devenue un lien vers une page inexistante, cas déjà vécu le 4 octobre 2026 avec la même page « ... ». Le second aurait exécuté une vraie requête sur la page du lot, et l'exemple aurait disparu du texte affiché. J'ai donc écrit `<code><nowiki>[[Has subobject.Diameter::...]]</nowiki></code>` et `<code><nowiki>{{#ask: [[Has subobject.Thickness::>>0,3 mm]] }}</nowiki></code>`. Rien d'autre n'a changé : le texte affiché est exactement celui de la consigne. Les mesures confirment le résultat (vérification e) : les deux exemples s'affichent en texte littéral, et la page ne porte aucun fait, aucune requête ni aucun lien nouveau. Je l'ai annoncé dans le terminal avant l'écriture. Voir la question A.

2. **La consigne se contredit sur les fichiers du dépôt.** Les règles impératives disent « Aucun fichier du dépôt n'est modifié, hors le rapport », mais l'étape 1 fait récupérer la page dans `pages/Lot_21.txt` et y appliquer les six modifications, et la fin de tâche fait commiter « pages/Lot_21.txt et le rapport ». J'ai suivi les étapes : `pages/Lot_21.txt` est modifié et commité, et aucun autre fichier du dépôt n'est touché. Comme la copie du dépôt était déjà la révision 1478 à l'octet près, le commit ne porte sur ce fichier que les six modifications.

3. **Phrases de la page, non visées par la consigne, que le texte inscrit contredit désormais.** Numéros de ligne dans la révision 1598 :
   - ligne 45 : « la page de grandeur devra porter les déclarations toutes faites, à recopier ». Le bloc est désormais porté par la dimension (ajouts 1.1 et 1.3).
   - ligne 61 : « Son vocabulaire et sa forme restent à arrêter. », à propos du rôle. Le paragraphe ajouté ligne 91 dit le contraire : « Arrêté le 13 octobre 2026 ».
   - ligne 67, « Ce que porte une page de grandeur » : « La dimension physique et la grandeur de base dont elle dérive n'y figurent pas : aucun mécanisme ne s'en servirait ». Le paragraphe ajouté ligne 83 fait de cette ligne « dimension » « la charnière du modèle ». La même ligne 67 met aussi sur la page de grandeur « le bloc de déclaration tout fait, à transclure ».
   - ligne 69, « Ce que porte une page d'unité » : « la grandeur dont elle est une unité ». Contredit par 1.2 (« Une unité appartient donc à une dimension ») et par le nom `Unit of dimension` de la ligne 89.
   - ligne 71 : « '''Le bloc de déclaration est écrit à la main sur la page de grandeur, et transclus par les propriétés.''' ». Contredit par 1.1 et par la ligne 83.
   - ligne 81 : « avec le rôle maximal ». Le vocabulaire arrêté ligne 91 ne connaît que « maximal admissible ». C'est un simple écart de terme.
   - ligne 145, « Point de départ » : « remplacée par un bloc de déclaration transclus depuis la page de grandeur ».

   Je n'ai rien corrigé : ces lignes sont hors de la consigne. Voir la question B.

4. **Mon compte intermédiaire du relevé d était faux dans le terminal.** J'y ai écrit « 17 mentions » ; le compte exact est 16, sur 11 entrées distinctes, comme le dit la vérification d.

5. **Commandes employées que la liste de la consigne ne nomme pas** : `tee`, `wc`, `cp`, `sed`, `cat -A`, `cut`, `ls`, `date` et `echo`, toutes de lecture ou de copie dans le scratchpad, et toutes dans la liste d'autorisations de `.claude/settings.json`. Je ne vois pas les fenêtres de confirmation : je ne sais pas lesquelles en ont ouvert une.

6. **Scripts du scratchpad** : `ancres.py`, `structure.py` et `renvois.py`. Tous trois sont en lecture seule, et leur contenu a été affiché dans le terminal avant leur lancement.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

**A.** Contexte : j'ai protégé par `<nowiki>` les deux exemples de syntaxe du bloc 1.3, pour qu'ils ne s'exécutent pas sur la page du lot (écart 1). Le texte affiché est celui de la consigne, mais le wikitexte en diffère sur ces deux points. Question : gardes-tu cette protection ? Suggestion : oui. Et que les consignes suivantes donnent directement leurs exemples sous la forme `<code><nowiki>…</nowiki></code>`, pour que le texte fourni puisse être recopié mot pour mot sans ce cas.

**B.** Contexte : sept phrases de la révision 1598, aux lignes 45, 61, 67, 69, 71, 81 et 145, disent encore que le bloc de déclaration est porté par la page de grandeur, que l'unité appartient à une grandeur, que la dimension est inutile et que le vocabulaire des rôles reste à arrêter (écart 3). Question : faut-il les reprendre ? Suggestion : oui, par une consigne courte qui donne le texte de remplacement de chacune, rédigée après relecture de la révision 1598. Sans cela, la page dira deux choses contraires à quelques paragraphes d'écart.
