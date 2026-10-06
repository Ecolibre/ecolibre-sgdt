# Lot 21, tâche 13 — Inscription des résultats

Rapport d'exécution du 6 octobre 2026. La tâche ne mesure rien : elle inscrit
les résultats des tâches 1 à 12 sur trois pages du wiki et dans deux fichiers
du dépôt.

## Étape 0 — État du dépôt

- `git status --short` : vide, aucun fichier suivi modifié.
- `travaux/lot-21-tache13-inscription.md` : absent avant la tâche.
- `.claude/settings.local.json` au début : `"allow": []`, `"deny": []`, aucune
  règle. Même constat en fin de tâche (voir plus bas).

## Étape 1 — Cinq entrées aux Limites connues

Ajoutées en **cinq appels** à `bin/wiki-append.sh`, et non en un seul : voir
« Écarts et surprises », point 1, et la question A posée à Cyril. Chaque appel
porte le résumé prescrit `[Lot 21][Tâche 13] Cinq entrées issues des mesures du lot`.
Chaque appel a passé ses trois contrôles : pré-contrôle, wikitexte (+1 entrée)
et rendu (une seule liste `<ol>` sur la page).

| N° | Révision | Titre en gras |
|---|---|---|
| 59 | 1458 | Le type résolu d'une propriété peut rester le type par défaut alors que sa page porte le bon type. |
| 60 | 1459 | Le décalage d'origine du type Temperature s'applique aussi aux écarts et aux tolérances, ce qui les rend faux. |
| 61 | 1460 | L'unité d'affichage par défaut est la première déclarée chez Quantity et la dernière chez Temperature. |
| 62 | 1461 | Toute écriture qui modifie le type d'une propriété la verrouille aussitôt, et le verrou ne se lève pas. |
| 63 | 1462 | Un verrou de propagation n'empêche ni le stockage d'une valeur ni sa requête. |

Révision de départ : 1426, avec 58 entrées. Numéros relevés en comptant les
lignes commençant par `# ` dans le wikitexte relu après le dernier ajout
(`pages/Limites_connues.txt`), soit 63 entrées. Le texte de chaque entrée est
celui de la consigne, recopié sans modification.

## Étape 2 — Récapitulatif technique : diff

Révision 1417 → 1463, résumé
`[Lot 21][Tâche 13] Types de données disponibles et lecture du verrou de propagation`.
Les deux ancres (2.1, 2.2) ont été trouvées une fois chacune.

```diff
--- /tmp/claude-1000/-home-spheres-ecolibre-sgdt/2ee78590-cee1-4faa-a5e1-8673dcf858e0/scratchpad/Recapitulatif_technique.txt	2026-10-06 16:39:34.596540368 +0200
+++ pages/Recapitulatif_technique.txt	2026-10-06 16:39:34.613002233 +0200
@@ -495,6 +495,12 @@
 102 <code>Attribut</code>, 106 <code>Formulaire</code>, 108 <code>Concept</code>,
 828 <code>Module</code>.
 
+=== Types de données disponibles ===
+
+Dix-neuf types sont déclarés sur cette installation, relevé de <code>Spécial:Types</code> du 6 octobre 2026 : Booléen, Date, Nombre, Texte, Annotation-URI, URL, Code, Text, Coordonnées géographiques, External identifier, Keyword, Page, Quantité, Enregistrement, Monolingual text, Reference, Adresse électronique, Numéro de téléphone, Température.
+
+Trois sont employés par le lot 21 et méritent d'être signalés. '''Quantité''' porte une valeur et son unité, avec des conversions déclarées par coefficient. '''Température''' gère le décalage d'origine entre kelvin, degré Celsius, degré Fahrenheit et degré Rankine, ce qui le rend juste pour une température absolue et faux pour un écart. '''Monolingual text''' porte un texte et son code de langue : chaque valeur est stockée dans un sous-objet conteneur portant <code>_TEXT</code> et <code>_LCODE</code>, et une requête de la forme <code>texte@fr</code> la retrouve.
+
 === Types de fichiers autorisés ===
 
 png, gif, jpg, jpeg, webp, pdf, doc, docx, odt, xls, xlsx, ods, ppt, pptx, odp,
@@ -534,6 +540,12 @@
 si une écriture sera acceptée : un refus doit être traité comme un résultat
 normal.
 
+Une exception utile : le verrou de propagation de Semantic MediaWiki
+(<code>smw-change-propagation-protection</code>) se lit à l'avance, sans rien
+écrire, par <code>action=query&prop=info&intestactions=edit&intestactionsdetail=full</code>.
+Le champ <code>protection</code> reste vide, parce que ce verrou n'est pas une
+protection MediaWiki : il s'exerce dans le code de l'extension.
+
 === Ce qui reste à documenter ===
 
 Relevés dans <code>LocalSettings.php</code>, non exposés par l'API :
```

## Étape 3 — Page du lot 21 : diff

Révision 1415 → 1464, résumé `[Lot 21][Tâche 13] Inscription des résultats mesurés`.
Les six ancres (3.1 à 3.6) ont été trouvées une fois chacune.

```diff
--- /tmp/claude-1000/-home-spheres-ecolibre-sgdt/2ee78590-cee1-4faa-a5e1-8673dcf858e0/scratchpad/Lot_21.txt	2026-10-06 16:39:34.596597883 +0200
+++ pages/Lot_21.txt	2026-10-06 16:39:34.613217940 +0200
@@ -22,11 +22,11 @@
 
 '''Les valeurs se normalisent à l'écriture, vers un socle commun d'unités.''' Le modèle doit pouvoir comparer un débit en mètres cubes par seconde et un débit en litres par heure : sans cela, un partenaire qui publierait des mètres cubes par heure là où Ecolibre écrit des litres par heure ne serait pas comparable. Les unités admises sont appelées à former un socle commun à la fédération, décidé collectivement ; un wiki partenaire peut employer temporairement une unité nouvelle avant qu'elle ne le rejoigne, après concertation.
 
-'''Les propriétés existantes changent sur place.''' On ne crée pas de propriétés neuves pour déprécier les anciennes. Rien n'est urgent : quand une écriture est bloquée, on attend que le verrou se lève plutôt que de le contourner par un doublon — il se lève de lui-même, en quelques jours (entrée 14 des Limites connues).
+'''Les propriétés existantes changent sur place.''' On ne crée pas de propriétés neuves pour déprécier les anciennes. Rien n'est urgent, mais la règle d'attente posée le 4 octobre 2026 ne tient plus : mesuré du 4 au 6 octobre 2026, aucun des quinze verrous observés ne s'est levé, et toute écriture modifiant le type d'une propriété la verrouille aussitôt (entrée 62 des Limites connues). Une page de propriété doit donc être écrite une seule fois, dans sa forme définitive, unités comprises : la correction d'une description et le changement de type d'une même propriété n'en font qu'une. Un verrou n'empêche d'ailleurs ni le stockage ni la requête (entrée 63) ; il n'empêche que de revenir sur la déclaration.
 
-'''L'unité principale d'une grandeur est son unité SI cohérente.''' Décision provisoire du 4 octobre 2026, datée, à rouvrir au premier partenaire. Le Bureau international des poids et mesures pose qu'une grandeur n'a qu'une seule unité SI, et le SI est le seul système d'unités convenu à l'échelle mondiale : c'est le consensus auquel ce lot avait choisi de se fier. Pour une température Celsius, c'est le degré Celsius, lui-même unité SI cohérente. Les unités d'usage — litre par heure, millimètre — restent admises à la saisie et à l'affichage, converties à l'écriture. Les grandeurs hors du SI se traitent au cas par cas.
+'''L'unité principale d'une grandeur est son unité SI cohérente.''' Décision provisoire du 4 octobre 2026, datée, à rouvrir au premier partenaire. Le Bureau international des poids et mesures pose qu'une grandeur n'a qu'une seule unité SI, et le SI est le seul système d'unités convenu à l'échelle mondiale : c'est le consensus auquel ce lot avait choisi de se fier. Pour une température, c'est le kelvin. Le degré Celsius est bien une unité SI, mais le kelvin en est l'unité de base, et c'est en kelvins que le type Temperature stocke, le degré Celsius restant l'unité de saisie et d'affichage. Corrigé le 6 octobre 2026 : la rédaction du 4 octobre désignait le degré Celsius, ce que la mesure dément. Les unités d'usage — litre par heure, millimètre — restent admises à la saisie et à l'affichage, converties à l'écriture. Les grandeurs hors du SI se traitent au cas par cas.
 
-'''Le mode scalaire est porté par le type Quantity, et les températures par le type Temperature.''' Mesuré en bac à sable le 4 octobre 2026 (rapport lié en tête de page). En locale française, la virgule décimale est acceptée, dans les valeurs comme dans les facteurs de conversion. La valeur est stockée dans l'unité principale ; elle s'affiche par défaut dans la première unité d'affichage déclarée, et sur demande dans toute autre unité déclarée : saisies en litres par heure, en mètres cubes par seconde et en mégalitres par jour, les trois valeurs d'essai se sont relues exactes en litres par heure. Les requêtes comparent d'une unité à l'autre. Cet arbitrage révise la convention du [[Lot 8 — Facettes de type d'item|lot 8]] — type Number, unité écrite dans la portée de la propriété — ([https://github.com/Ecolibre/ecolibre-sgdt/blob/c73d88a5931d1ceec88964029c97f6774f21ce6b/travaux/lot-8-amendement-1.md amendement 1 du lot 8], section 6).
+'''Le mode scalaire est porté par le type Quantity, et les températures par le type Temperature.''' Mesuré en bac à sable le 4 octobre 2026 (rapport lié en tête de page). En locale française, la virgule décimale est acceptée, dans les valeurs comme dans les facteurs de conversion. La valeur est stockée dans l'unité principale ; elle s'affiche par défaut dans la première unité d'affichage déclarée chez Quantity et dans la dernière chez Temperature (entrée 61 des Limites connues), et sur demande dans toute autre unité déclarée : saisies en litres par heure, en mètres cubes par seconde et en mégalitres par jour, les trois valeurs d'essai se sont relues exactes en litres par heure. Les requêtes comparent d'une unité à l'autre. Cet arbitrage révise la convention du [[Lot 8 — Facettes de type d'item|lot 8]] — type Number, unité écrite dans la portée de la propriété — ([https://github.com/Ecolibre/ecolibre-sgdt/blob/c73d88a5931d1ceec88964029c97f6774f21ce6b/travaux/lot-8-amendement-1.md amendement 1 du lot 8], section 6).
 
 '''Toute unité convertible par un coefficient peut être acceptée, à condition d'être déclarée.''' Une valeur saisie dans une unité dont la conversion n'est pas déclarée n'est pas stockée, et une erreur la signale : le système ne devine jamais un coefficient. Déclarer l'unité, avec son coefficient vers l'unité principale, suffit pour qu'elle soit acceptée et convertie, qu'elle appartienne au SI ou non. Règle posée le 4 octobre 2026 : les documents techniques à reprendre emploient beaucoup d'unités hors du SI, et chacune doit pouvoir s'y ramener. Deux exceptions à la règle du coefficient : les températures, dont le décalage d'origine relève du type Temperature, et les grandeurs logarithmiques comme le décibel, qui n'ont pas de coefficient.
 
@@ -34,6 +34,16 @@
 
 '''La spécification et la mesure sont portées par des sous-objets.''' Mesuré le 4 octobre 2026 : les sous-objets sont stockés, et une requête les traverse jusqu'à trois sauts, de l'item jusqu'à la page de grandeur en passant par le sous-objet et l'unité.
 
+'''Un mode se vise par le filtre de classe.''' Mesuré le 5 octobre 2026 : une requête sur une propriété rend la page et ses sous-objets mêlés, mais la même requête portant en plus la catégorie de la classe ne rend que la page. Les sous-objets ne portent pas <code>_INST</code>, seul le sujet principal le porte. Les deux autres pistes envisagées — une propriété distincte par mode, un marqueur de mode porté par le sous-objet — sont donc inutiles.
+
+'''Une unité manquante est rendue impossible par la forme de la saisie, pas par un contrôle.''' Mesuré le 5 octobre 2026 : un champ pour le nombre et une liste pour l'unité, assemblés par un modèle, produisent une annotation valide ; le nombre passe par <code>Module:Nombre</code>, qui remplace le point décimal par la virgule dans le seul cas non ambigu, si bien que « 0.9 » et « 0,9 » donnent la même valeur stockée. Si l'unité est vide, le modèle ne rend rien et aucune annotation n'est écrite : le sous-objet d'essai correspondant n'existe pas. Si le nombre est douteux, « 1.2.3 » par exemple, la valeur est refusée visiblement et recensée dans les erreurs de traitement. Ce point ouvert est clos.
+
+'''Les libellés par langue sont portés par le type Monolingual text.''' Mesuré le 5 octobre 2026 : chaque libellé est stocké dans un sous-objet conteneur portant son texte et son code de langue, et une requête de la forme <code>débit volumique@fr</code> trouve la page. L'affichage rend les deux langues avec leur code. L'affichage filtré sur une seule langue n'a pas été mesuré. C'est le motif que réemploiera le [[Lot 19 — Vocabulaire et multilingue|lot 19]].
+
+'''Une tolérance de température n'emploie pas le type Temperature.''' Mesuré le 5 octobre 2026 : ce type applique le décalage d'origine à un écart comme à une valeur absolue, et une tolérance de 2 °C y est stockée 275,15 sans la moindre erreur (entrée 60 des Limites connues). Une température absolue emploie Temperature, qui gère aussi le degré Fahrenheit nativement ; un écart, une tolérance ou une plage emploie Quantity avec le degré Celsius et le kelvin au facteur 1.
+
+'''L'ordre des unités d'affichage s'écrit à l'envers selon le type.''' Chez Quantity, la première unité déclarée s'affiche ; chez Temperature, la dernière (entrée 61 des Limites connues). Une température absolue qui doit s'afficher en degrés Celsius se déclare donc <code>Display units::K, °C</code>. Les deux règles étant inverses, la page de grandeur devra porter les déclarations toutes faites, à recopier : personne ne retiendra une règle inversée.
+
 == Ce qui est écarté, et pourquoi ==
 
 '''Traiter dans ce lot les quatre besoins du lot 9.''' Écarté le 4 octobre 2026. Le motif de la règle, un seul mécanisme, est satisfait par une construction conçue une fois et réemployée ; la déployer ici pour les quatre ferait de ce lot celui de la réception, de la récolte, de la présence et de la qualification à la fois.
@@ -60,11 +70,7 @@
 
 Le choix de l'unité principale reste une décision collective, qui engage tous les ateliers partenaires : celui du 4 octobre 2026, l'unité SI cohérente, est provisoire et se rouvre au premier partenaire.
 
-Une saisie sans unité doit devenir impossible : sur une propriété de type Quantity, elle est acceptée en silence dans l'unité principale (entrée 56 des Limites connues).
-
-Une requête sur une propriété rend l'item et ses sous-objets mêlés : le 4 octobre 2026, une requête sur le débit a rendu, pour une seule pompe d'essai, la valeur scalaire, la spécification, la mesure et une valeur saisie sans unité. La conception doit dire comment une requête vise un mode : une propriété distincte par mode, un marqueur de mode porté par le sous-objet, ou le filtre de classe, qui devrait écarter les sous-objets puisqu'ils ne portent pas de catégorie — à vérifier.
-
-Les descriptions des propriétés de diamètre nominal et secondaire prescrivent le point décimal, que l'installation rejette, et le diamètre secondaire sépare ses valeurs par la virgule, qui découpe une virgule décimale (entrée 57 des Limites connues). À corriger lors de leur migration dans ce lot : aucune valeur n'en dépend aujourd'hui.
+Les descriptions des propriétés de diamètre nominal et secondaire prescrivent le point décimal, que l'installation rejette, et le diamètre secondaire sépare ses valeurs par la virgule, qui découpe une virgule décimale (entrée 57 des Limites connues). Aucune valeur n'en dépend aujourd'hui. Ces deux pages sont libres au 6 octobre 2026 et doivent le rester : les corriger maintenant les verrouillerait et interdirait ensuite le changement de type (entrée 62). La correction de la description et la migration du type s'écrivent donc ensemble, en une seule écriture par propriété.
 
 == Point de départ ==
 
@@ -78,7 +84,8 @@
 
 == Risques connus ==
 
-* Changer le type d'une propriété qui porte déjà des données déclenche la propagation de changement de Semantic MediaWiki, qui peut verrouiller la page de propriété plusieurs jours (entrée 14 des Limites connues). Ce n'est pas un incident : consigner ce qui n'a pas pu s'écrire, et y revenir.
+* Changer le type d'une propriété qui porte déjà une valeur fonctionne, et verrouille la page ensuite. Mesuré le 6 octobre 2026 : le passage de Temperature à Quantity a été accepté sur une propriété libre, la valeur stockée est passée de 275,15 à 2 en moins de trois minutes sans qu'il faille réécrire la page porteuse, et la page de propriété était verrouillée dans le même temps (entrée 62 des Limites connues). Le risque n'est donc pas de ne pas pouvoir migrer, mais de ne plus pouvoir revenir sur la déclaration.
+* La valeur recalculée l'est à partir de la saisie portée par la page de l'item. Une valeur saisie sans unité, comme les nombres nus que portent aujourd'hui les propriétés de production, n'a pas été mesurée dans ce cas. '''Ordre à suivre à la migration : écrire d'abord l'unité sur les pages porteuses, puis seulement changer le type de la propriété.'''
 * Une page de propriété d'essai se supprime directement, jamais après avoir été vidée : le blanchiment la verrouille (entrée 33 des Limites connues).
 * Ajouter une unité à une grandeur modifie une déclaration partagée par toutes ses propriétés, qui se réanalysent alors : l'effet sur le verrou de propagation n'est pas mesuré.
 
```

## Correspondance N1 à N5 appliquée

| Marque | Numéro | Employée en |
|---|---|---|
| N1 | 59 | aucune marque N1 dans les textes de remplacement |
| N2 | 60 | 3.6 (tolérance de température) |
| N3 | 61 | 3.2 et 3.6 (ordre des unités d'affichage) |
| N4 | 62 | 3.3, 3.4 et 3.5 (verrouillage au changement de type) |
| N5 | 63 | 3.3 (le verrou n'empêche ni stockage ni requête) |

## Étape 4 — CLAUDE.md : diff

Ancre : la puce entière, de « - **Barrière avant d'employer une propriété
neuve.** » jusqu'à « …recréer sous un autre. », lignes 278 à 282 avant la
modification. Trouvée une fois. Rien d'autre ne change dans le fichier.

```diff
diff --git a/CLAUDE.md b/CLAUDE.md
index 1cc81e8..1442d64 100644
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -275,11 +275,15 @@ Ce que Cyril peut lancer seul, et ce qui relève de fuzzy : voir
   badfilename de MediaWiki (espace parasite) — vérifier les noms avant de
   téléverser, pas après.
 - Page bac à sable pour les essais : `Utilisateur:Cywil/Bac à sable`.
-- **Barrière avant d'employer une propriété neuve.** Aucune page employant une propriété nouvellement créée ne se crée avant que cette propriété ait franchi deux volets, mesurés dans le même tour :
-  1. le type résolu à l'exécution est le bon. Le lire dans `query.printrequests[].typeid` d'un `action=ask` portant sur cette propriété, pour l'entrée dont le label n'est pas vide ; l'entrée au label vide est la colonne du sujet et vaut toujours `_wpg` ;
-  2. une écriture sur la page de propriété est acceptée, `nochange` compris.
+- **Barrière avant d'employer une propriété neuve.** Aucune page employant une propriété nouvellement créée ne se crée avant que le **type résolu à l'exécution** de cette propriété soit le bon. Le lire dans `query.printrequests[].typeid` d'un `action=ask` portant sur cette propriété, pour l'entrée dont le label n'est pas vide ; l'entrée au label vide est la colonne du sujet et vaut toujours `_wpg`. Lire dans la même requête une propriété témoin au type connu : si le témoin ne rend pas son type, c'est la lecture qui est en cause.
 
-  Le fait `_TYPE` porté par la page de propriété ne vaut pas barrière. Mesuré le 4 octobre 2026, lots 21 tâches 6 à 8 : six propriétés portaient le bon `_TYPE` tout en étant résolues en `_wpg` et verrouillées par `smw-change-propagation-protection`, file de travaux à 0 et `_CHGPRO` absent. Les valeurs des pages qui les employaient sont tombées en type Page, et rien n'a pu les en sortir. Après avoir créé une propriété, n'émettre aucune requête nommant cette propriété tant que `_CHGPRO` n'a pas disparu de ses faits ; la seule sonde autorisée pendant cette attente est la lecture des faits de la page, qui ne résout aucun type. Ce n'est pas la rafale qui décide : mesuré les 4 et 5 octobre 2026, une rafale de huit créations a réussi, une création isolée a échoué. Une propriété dont le type résolu est faux est perdue : ne pas chercher à la réparer, abandonner le nom et recréer sous un autre.
+  Le fait `_TYPE` porté par la page de propriété ne vaut pas barrière : mesuré le 4 octobre 2026, six propriétés portaient le bon `_TYPE` tout en étant résolues en `_wpg`, et toutes les valeurs des pages qui les employaient sont tombées en type Page sans qu'aucune purge ni réécriture ne les en sorte. Une propriété dont le type résolu est faux est perdue : ne pas chercher à la réparer, abandonner le nom et recréer sous un autre.
+
+  **Le verrou d'écriture n'est pas un critère.** `smw-change-propagation-protection` n'empêche ni le stockage ni la requête : mesuré le 5 octobre 2026, une propriété verrouillée stocke et répond exactement comme une propriété libre de même type. Ne jamais éliminer ni abandonner une propriété parce que sa page est verrouillée. Le verrou se lit sans rien écrire par `intestactions`, et il se consigne.
+
+  **En revanche il fige la déclaration.** Toute écriture qui modifie le type d'une propriété la verrouille en moins de trois minutes, et aucun verrou observé entre le 4 et le 6 octobre 2026 ne s'est levé. Une page de propriété s'écrit donc une seule fois, dans sa forme définitive, type, conversions, unités d'affichage et description comprises. Ne jamais corriger une description sur une propriété dont le type doit encore changer : les deux écritures n'en font qu'une.
+
+  Après avoir créé une propriété, n'émettre aucune requête nommant cette propriété tant que `_CHGPRO` n'a pas disparu de ses faits ; la seule sonde autorisée pendant cette attente est la lecture des faits de la page et celle de `intestactions`, qui ne résolvent aucun type. Ce n'est pas la rafale qui décide : mesuré les 4 et 5 octobre 2026, une rafale de huit créations a réussi, une création isolée a échoué.
 
 ## Corrections sur les modèles — liste unique et numérotation de référence
 
```

## Étape 5 — demandes-adminsys.md : diff

Trois remplacements, chaque ancre trouvée une fois. Pour le titre (point 1),
l'ancre s'étendait sur deux lignes, de « Sept propriétés d'essai figées »
jusqu'à « 2026.** » : le titre était déjà replié sur deux lignes, et « jusqu'à la
fin de la ligne » aurait coupé le titre au milieu. Le nouveau titre est replié
de la même façon ; la suite de la ligne (« Les six pages ») et les lignes
suivantes du paragraphe sont inchangées.

```diff
diff --git a/demandes-adminsys.md b/demandes-adminsys.md
index 38f1991..8384974 100644
--- a/demandes-adminsys.md
+++ b/demandes-adminsys.md
@@ -193,8 +193,8 @@ Par ordre d'urgence.
   Pour `Attribut:Casc parent` et `Attribut:Casc lineage`, le déblocage
   demandé n'a qu'un seul usage prévu : les supprimer aussitôt débloquées.
 
-- **Sept propriétés d'essai figées sur le type par défaut et verrouillées
-  en écriture - constat des 4 et 5 octobre 2026.** Les six pages
+- **Quinze propriétés d'essai verrouillées en écriture, dont sept figées
+  sur le type par défaut - constat des 4 au 6 octobre 2026.** Les six pages
   `Attribut:Test lot21b débit`, `puissance`, `température`, `tolérance
   temp`, `écart température` et `libellé`, plus `Attribut:Test lot21c
   température`, refusent toute écriture avec
@@ -220,13 +220,17 @@ Par ordre d'urgence.
   établie : demander le type d'une propriété avant la fin de sa
   propagation le fige sur la valeur par défaut.
 
-  **À rapprocher de l'entrée `$smwgChangePropagationProtection`
-  ci-dessus.** Les trois pages verrouillées d'août 2026 s'étaient
-  débloquées d'elles-mêmes au bout de plusieurs jours. Ici, aucun dégel
-  après quatorze heures sur les six premières. Le verrou d'écriture et le
-  type résolu faux sont deux symptômes distincts : rien ne dit que le
-  second se répare quand le premier tombe. À revérifier dans quelques
-  jours, par `intestactions` et par le `typeid`, sans rien écrire.
+  **À rapprocher de l'entrée `$smwgChangePropagationProtection` ci-dessus.**
+  Les trois pages verrouillées d'août 2026 s'étaient débloquées d'elles-mêmes au
+  bout de plusieurs jours. Ici, aucun dégel : sur dix-sept pages de propriété
+  d'essai créées entre le 4 et le 6 octobre 2026, quinze sont verrouillées, les
+  plus anciennes depuis trente-sept heures au 6 octobre. Deux faits mesurés
+  depuis : toute écriture qui modifie le type d'une propriété la verrouille en
+  moins de trois minutes, y compris sur une page qui était libre ; et le verrou
+  n'empêche ni le stockage ni la requête, seulement la modification de la page de
+  propriété. Verrou et type résolu faux sont donc deux symptômes distincts, qui
+  ne vont pas toujours ensemble : sept pages ont les deux, huit n'ont que le
+  verrou.
 
   **Ce qu'on aimerait savoir.** Où le type résolu d'une propriété est-il
   mis en cache, et comment le vide-t-on ? Comment lève-t-on ce verrou ?
@@ -234,10 +238,12 @@ Par ordre d'urgence.
   propriétés, et un nom brûlé n'est pas acceptable pour une propriété
   réelle du modèle.
 
-  **Contournement en attendant.** Une propriété figée est perdue : on
-  l'abandonne et on recrée sous un autre nom, en n'émettant aucune requête
-  la nommant tant que `_CHGPRO` n'a pas disparu. Règle inscrite dans
-  `CLAUDE.md`.
+  **Contournement en attendant.** Une propriété au type résolu faux est perdue :
+  on l'abandonne et on recrée sous un autre nom. Une propriété seulement
+  verrouillée reste utilisable telle quelle. Mais sa déclaration est figée : une
+  page de propriété doit être écrite une seule fois, dans sa forme définitive,
+  type, conversions, unités d'affichage et description comprises. Règles
+  inscrites dans `CLAUDE.md`.
 
   En attente de la migration Scaleway. À tenter d'abord par nous-mêmes
   côté serveur. Rien n'a été demandé à fuzzy.
```

## Vérifications

**a. Pages identiques.** `bin/wiki-verify.sh` contre le fichier local envoyé :

- Limites connues, relue par `bin/wiki-get.sh` dans `pages/Limites_connues.txt`
  après le dernier ajout : `IDENTIQUE`, sortie 0.
- Récapitulatif technique, `pages/Recapitulatif_technique.txt` : `IDENTIQUE`, sortie 0.
- Lot 21, `pages/Lot_21.txt` : `IDENTIQUE`, sortie 0.

**b. Numérotation.** Les cinq titres et leurs numéros figurent dans le tableau
de l'étape 1. Les marques sur la page du lot 21, une par une :

- N2 → entrée 60, « Le décalage d'origine du type Temperature s'applique aussi
  aux écarts et aux tolérances » : c'est bien l'entrée voulue en 3.6, sur la
  tolérance de température stockée 275,15.
- N3 → entrée 61, « L'unité d'affichage par défaut est la première déclarée chez
  Quantity et la dernière chez Temperature » : c'est bien l'entrée voulue en
  3.2 et 3.6, sur l'ordre des unités d'affichage.
- N4 → entrée 62, « Toute écriture qui modifie le type d'une propriété la
  verrouille aussitôt » : c'est bien l'entrée voulue en 3.3, 3.4 et 3.5.
- N5 → entrée 63, « Un verrou de propagation n'empêche ni le stockage d'une
  valeur ni sa requête » : c'est bien l'entrée voulue en 3.3.

Les renvois anciens que le texte conserve pointent toujours juste : entrée 14
(verrou `smw-change-propagation-protection`, citée dans l'entrée 62), entrée 56
(quantité saisie sans unité), entrée 57 (virgule décimale contre séparateur).

**c. Rendu.** `action=parse&prop=text|links|categories` sur les trois pages,
avant et après :

| Page | Liens vers une page inexistante | Avertissements SMW | Catégories |
|---|---|---|---|
| Limites connues | aucun, avant comme après | aucun | Page_de_suivi |
| Récapitulatif technique | `Attribut:Has type`, `Attribut:Imported from`, avant comme après | aucun (4 marqueurs `smw-highlighter` avant comme après, aucun d'avertissement) | SGDT, Page_de_suivi |
| Lot 21 | aucun, avant comme après ; le lien vers le lot 19 aboutit | aucun | Lot |

Rien de nouveau. Les faits SMW des trois pages (`--facts`) ne montrent aucune
annotation parasite : ni `Display units` ni autre propriété issue des exemples
entre `<code>`. Le Récapitulatif ne porte que `_INST`, `_MDAT`, `_SKEY` et ses
`_ASK`. Les Limites connues ne portent que `_INST`, `_MDAT` et `_SKEY`. La page
du lot porte ses faits `Work_package_*` habituels.

**d. Erreurs.** `[[_ERRC::+]]` : **1** par `action=ask`, **1** par rendu en
ligne `format=count`, avant comme après. Le seul sujet est
`Utilisateur:Cywil/Bac à sable/Lot21c pompe#saisie-douteux`, celui qu'annonçait
la consigne. Aucun sujet nouveau.

**e. Propriétés intactes.** `prop=info&intestactions=edit&intestactionsdetail=full` :

| Page | Révision | `intestactions.edit` |
|---|---|---|
| Attribut:Nominal diameter | 342 | `[]` (libre) |
| Attribut:Secondary diameter | 343 | `[]` (libre) |
| Attribut:Power rating | 803 | `[]` (libre) |
| Attribut:Max thickness | 804 | `[]` (libre) |

Les quatre révisions sont celles attendues, et aucune page n'est verrouillée.
Aucune page `Attribut:` n'a été écrite, ni aucune page d'essai Test lot21b ou
Test lot21c.

**`.claude/settings.local.json` en fin de tâche** : `"allow": []`, `"deny": []`,
aucune règle.

## Écarts et surprises

1. **`bin/wiki-append.sh` ne sait ajouter qu'une entrée par appel.** Son contrôle
   local exige que le fichier d'ajout contienne exactement une ligne `# `, et son
   post-contrôle attend +1 entrée. Un fichier de cinq entrées aurait été refusé
   avant toute écriture. La consigne demandait « en une seule fois » : j'ai posé
   la question A à Cyril avant d'écrire (voir plus bas). Résultat : cinq
   révisions (1458 à 1462) au lieu d'une, toutes sous le résumé prescrit. Le
   corps existant de la page n'a jamais été renvoyé. Ce que `CLAUDE.md` dit du
   script (« contenir une seule ligne `# ` ») le disait déjà : la consigne
   aurait pu le prévoir.
2. **Titre de l'entrée adminsys sur deux lignes.** La consigne disait de
   remplacer le titre « jusqu'à la fin de la ligne ». Or le titre se terminait
   sur la ligne suivante (« …octobre 2026.** »). J'ai remplacé le titre entier,
   jusqu'au `**` fermant, et laissé intact le reste de la seconde ligne.
3. **Aucune marque N1 dans les textes de remplacement.** La correspondance
   relève N1 = 59, mais aucun texte de la consigne ne l'emploie. Le texte 3.6
   renvoie à l'entrée sur le type résolu sans la numéroter, et l'entrée 63
   elle-même dit « l'entrée sur le type résolu, plus haut ». C'est peut-être
   voulu ; je le signale parce que la vérification b ne demandait que N2 à N5.
4. Je n'ai lancé aucune attente de file de travaux : aucune étape ne touchait à
   une propriété, et aucune lecture n'en a eu besoin. `bin/wiki-wait-jobs.sh`
   n'a pas servi.

## Échanges avec Cyril hors consigne

- **Question A**, posée dans le terminal avant l'étape 1. Contexte : le script
  d'ajout refuse un fichier de cinq entrées. Question : comment procéder ?
  Ma suggestion : cinq appels successifs, même résumé. Réponse de Cyril :
  « Cinq appels ». Appliqué.

## Questions

B. Contexte : `bin/wiki-append.sh` impose une entrée par appel, si bien qu'un ajout
   groupé coûte autant de révisions que d'entrées. Question : faut-il lui
   permettre un fichier de plusieurs entrées (post-contrôle à +k) ? Ou bien
   faut-il que les consignes prévoient un appel par entrée ? Ma suggestion :
   garder le script tel quel, car un appel par entrée rend chaque ajout
   annulable seul, et inscrire dans `methode-de-travail.md` qu'un ajout de k
   entrées se fait en k appels.
