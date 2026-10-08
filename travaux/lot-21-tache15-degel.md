# Lot 21, tâche 15 — Correction après dégel

Exécutée le 8 octobre 2026 par Claude Code, sur consigne de l'architecte.

## Étape 0 — État du dépôt

- `git status` : branche `main`, à jour avec `origin/main`, copie de travail propre. Aucune ligne M, A, D, R ni `??`.
- `travaux/lot-21-tache15-degel.md` n'existait pas.
- `.claude/settings.local.json` au début comme à la fin de la tâche : `"allow": []`, `"deny": []`. Aucune règle.
- Les deux pages relues en début de tâche étaient identiques aux copies commitées à la tâche 14 (`git diff --stat` vide après `bin/wiki-get.sh`) : aucune modification hors session entre-temps.

## Diff des Limites connues

Révision 1467 → **1471** (2026-10-08T21:21:11Z), résumé `[Lot 21][Tâche 15] Entrées 59 et 62 corrigées : le verrou et le gel se lèvent seuls`. Ancres 1.1 et 1.2 trouvées chacune une fois. Deux lignes changées, les entrées 59 et 62 :

```diff
diff --git a/pages/Limites_connues.txt b/pages/Limites_connues.txt
index 9f61782..becf7ff 100644
--- a/pages/Limites_connues.txt
+++ b/pages/Limites_connues.txt
@@ -81,10 +81,10 @@ Voir aussi le [[Récapitulatif technique du Système de Gestion de Données Tech
 # '''Une quantité saisie sans unité est stockée en silence dans l'unité principale.''' Sur une propriété de type Quantity, une valeur saisie sans unité n'est pas rejetée : elle est lue dans l'unité de facteur 1. Sur un débit déclaré en mètres cubes par seconde, « 800 » est devenu 800 m³/s, soit 2,88 milliards de litres par heure, sans aucune erreur, et cette valeur répond aux requêtes comme une valeur juste. Une unité non déclarée, elle, est rejetée et signalée. Constaté le 4 octobre 2026 en bac à sable (lot 21, tâche 2). Toute saisie de quantité doit donc imposer une unité.
 # '''La virgule décimale se heurte au séparateur de valeurs multiples.''' La virgule est le seul séparateur décimal accepté (entrée 20), et c'est aussi le séparateur de valeurs multiples du modèle. Sur une propriété numérique multivaluée séparée par des virgules, « 26,9, 33,7 » est stocké comme quatre entiers — 26, 9, 33 et 7 — sans aucune erreur ; avec un point-virgule pour séparateur, les deux décimaux sont justes. Le point décimal, lui, est rejeté par le type Number, et lu comme le début d'une unité par le type Quantity : « 0.9 m³/h » donne le nombre 0 et l'unité « .9m³/h », qui est rejetée. Constaté le 4 octobre 2026 en bac à sable (lot 21, tâche 2). Une propriété numérique multivaluée doit donc employer un autre séparateur que la virgule ; le point-virgule a été vérifié.
 # '''Le maximum d'une banque Base 36 est trouvé par un tri alphabétique, qui ne coïncide avec l'ordre numérique que sur des valeurs de même longueur.''' Les formulaires calculent le prochain numéro en triant <code>Item_ref</code> (type Code) ou <code>Inventory_number</code> (type Keyword) en ordre descendant, limite 1. Ce sont des types chaîne, donc le tri est alphabétique ; avec la collation <code>uca-fr</code> (entrée 41) les chiffres passent avant les lettres, et l'ordre alphabétique coïncide avec l'ordre Base 36 tant que toutes les valeurs font exactement quatre caractères. <code>Module:Base36</code> complète bien à quatre caractères, mais seulement tant que la valeur y tient : au-delà de <code>ZZZZ</code> il produit cinq caractères, qui se classeraient avant <code>ZZZZ</code> et figeraient le maximum. Mesuré le 5 octobre 2026 : une requête d'égalité est sensible à la casse, <code><nowiki>[[Item_ref::002y]]</nowiki></code> ne rend rien là où <code><nowiki>[[Item_ref::002Y]]</nowiki></code> rend sa page, alors que le module lit les minuscules sans broncher (<code>next(000a)</code> rend <code>000B</code>) : une valeur saisie en minuscules échapperait donc à un contrôle d'unicité écrit en majuscules. '''Règle de saisie : toute référence saisie à la main fait exactement quatre caractères, en majuscules.''' À traiter avec le lot de numérotation.
-# '''Le type résolu d'une propriété peut rester le type par défaut alors que sa page porte le bon type.''' Semantic MediaWiki ne lit pas le type sur la page de propriété au moment de stocker une valeur ou de compiler une requête : il emploie un type résolu, qui peut diverger du fait <code>_TYPE</code>. Le 4 octobre 2026, six propriétés créées en treize secondes au milieu de onze pages portaient <code>_qty</code>, <code>_tem</code> ou <code>_mlt_rec</code> dans leur <code>_TYPE</code> et étaient pourtant résolues en <code>_wpg</code> ; toutes les valeurs des pages qui les employaient ont été stockées en type Page, sans la moindre erreur. Ni purge, ni réécriture de la page porteuse, ni vidage de la file de travaux n'y a rien changé, et rien n'avait bougé trente-sept heures plus tard. Le type résolu se lit sans rien écrire, dans <code>query.printrequests[].typeid</code> d'un <code>action=ask</code> portant sur la propriété, pour l'entrée dont le libellé n'est pas vide ; l'entrée au libellé vide est la colonne du sujet et vaut toujours <code>_wpg</code>. '''Règle : vérifier le type résolu avant de créer la moindre page employant une propriété neuve.''' Une propriété dont le type résolu est faux est perdue : on l'abandonne et on recrée sous un autre nom. Cause non établie ; une propagation de changement inachevée est l'hypothèse (<code>demandes-adminsys.md</code> §2.2). Mesuré du 4 au 6 octobre 2026 (lot 21, tâches 6 à 12).
+# '''Le type résolu d'une propriété peut rester le type par défaut alors que sa page porte le bon type.''' Semantic MediaWiki ne lit pas le type sur la page de propriété au moment de stocker une valeur ou de compiler une requête : il emploie un type résolu, qui peut diverger du fait <code>_TYPE</code>. Le 4 octobre 2026, six propriétés créées en treize secondes au milieu de onze pages portaient <code>_qty</code>, <code>_tem</code> ou <code>_mlt_rec</code> dans leur <code>_TYPE</code> et étaient pourtant résolues en <code>_wpg</code> ; toutes les valeurs des pages qui les employaient ont été stockées en type Page, sans la moindre erreur. Ni purge, ni réécriture de la page porteuse, ni vidage de la file de travaux n'y a rien changé, et rien n'avait bougé trente-sept heures plus tard. Le type résolu se lit sans rien écrire, dans <code>query.printrequests[].typeid</code> d'un <code>action=ask</code> portant sur la propriété, pour l'entrée dont le libellé n'est pas vide ; l'entrée au libellé vide est la colonne du sujet et vaut toujours <code>_wpg</code>. '''Règle : vérifier le type résolu avant de créer la moindre page employant une propriété neuve.''' '''Le gel n'est pas définitif, contrairement à ce que cette entrée affirmait jusqu'au 8 octobre 2026.''' Mesuré ce jour-là à 21 h 11 : cinq des six propriétés gelées le 4 octobre rendaient de nouveau leur type déclaré, ainsi que <code>Test lot21c température</code>, gelée isolément le 5 octobre à 12 h 03. Une seule, <code>Test lot21b débit</code>, restait gelée après quatre jours. Le gel est donc un retard, pas une perte : ne pas abandonner un nom, attendre et revérifier le type résolu avant de s'en servir. Le gel reste rare et imprévisible : sur vingt-cinq propriétés créées du 4 au 6 octobre 2026, sept ont gelé, en deux épisodes seulement, une rafale de six et une création isolée ; ni la rafale ni l'isolement ne le prédisent. Cause non établie ; une propagation de changement qui n'aboutit que très lentement est l'hypothèse (<code>demandes-adminsys.md</code> §2.2). Mesuré du 4 au 8 octobre 2026 (lot 21, tâches 6 à 15).
 # '''Le décalage d'origine du type Temperature s'applique aussi aux écarts et aux tolérances, ce qui les rend faux.''' Le type Temperature stocke en kelvins et applique le décalage de 273,15 sans distinguer une valeur absolue d'un écart. Mesuré le 5 octobre 2026 : une tolérance saisie « 2 °C » sur une propriété de type Temperature est stockée 275,15 et s'affiche 275,15 K, y compris dans la colonne sans modificateur, sans aucune erreur, et une requête sur « 2 °C » y cherche 275,15. La même saisie sur une propriété de type Quantity déclarant le degré Celsius et le kelvin au facteur 1 est stockée 2 et s'affiche « 2 °C » ou « 2 K » selon la colonne. '''Règle : une température absolue emploie le type Temperature ; un écart, une tolérance ou une plage de tolérance emploie le type Quantity avec le degré Celsius et le kelvin au facteur 1.'''
 # '''L'unité d'affichage par défaut est la première déclarée chez Quantity et la dernière chez Temperature.''' <code>Display units</code> se lit dans un sens chez l'un et dans l'autre chez l'autre. Mesuré les 5 et 6 octobre 2026, trois cas de chaque côté : chez Temperature, « °C, K, °F » affiche des °F, « °C, K » des K, « K, °C » des °C ; chez Quantity, « °C, K » affiche des °C sur deux propriétés, et « L/h, m³/h, m³/s » affiche des L/h. '''Pour qu'une température absolue s'affiche en degrés Celsius, il faut donc déclarer <code>Display units::K, °C</code>''', à rebours de l'intuition, tandis qu'un écart porté par Quantity se déclare <code>°C, K</code>. Les deux règles étant inverses l'une de l'autre, elles ne se devinent pas : les déclarations toutes faites doivent figurer sur la page de grandeur.
-# '''Toute écriture qui modifie le type d'une propriété la verrouille aussitôt, et le verrou ne se lève pas.''' Mesuré le 6 octobre 2026 : une propriété libre passée du type Temperature au type Quantity a été écrite sans refus, puis portait <code>smw-change-propagation-protection</code> moins de trois minutes plus tard. Sur dix-sept pages de propriété d'essai créées entre le 4 et le 6 octobre 2026, quinze ont été verrouillées, dont certaines dès leur création et avant toute requête les nommant, et aucun de ces verrous ne s'était levé après trente-sept heures. Cela contredit l'entrée 14, où trois verrous d'août 2026 s'étaient levés d'eux-mêmes en quelques jours : la durée d'aujourd'hui n'est pas connue. '''Conséquence : le type, les conversions et les unités d'affichage d'une propriété sont à tenir pour figés dès la première écriture qui les touche.''' Une page de propriété doit être écrite une seule fois, dans sa forme définitive. Le verrou se lit sans rien écrire, par <code>action=query&prop=info&intestactions=edit&intestactionsdetail=full</code>.
+# '''Toute écriture qui modifie le type d'une propriété la verrouille aussitôt, et le verrou se lève seul en quelques jours.''' Mesuré le 6 octobre 2026 : une propriété libre passée du type Temperature au type Quantity a été écrite sans refus, puis portait <code>smw-change-propagation-protection</code> moins de trois minutes plus tard. Sur dix-sept pages de propriété d'essai créées entre le 4 et le 6 octobre 2026, quinze étaient verrouillées au 6 octobre, dont certaines dès leur création et avant toute requête les nommant. '''Au 8 octobre 2026 à 21 h 11, les dix-sept étaient libres.''' Le délai n'a pas été relevé au jour près, les relevés étant espacés : il est compris entre quelques heures et deux jours et demi pour les plus récentes, et entre un jour et demi et quatre jours pour les plus anciennes. Cela rejoint l'entrée 14, où trois verrous d'août 2026 s'étaient levés d'eux-mêmes en quelques jours. '''Conséquence : une déclaration de propriété ne se corrige pas le jour même, mais quelques jours plus tard.''' La rédaction du 6 octobre 2026, qui tenait le verrou pour définitif et prescrivait d'écrire une page de propriété une seule fois dans sa forme définitive, était fausse. Le verrou se lit sans rien écrire, par <code>action=query&prop=info&intestactions=edit&intestactionsdetail=full</code>.
 # '''Un verrou de propagation n'empêche ni le stockage d'une valeur ni sa requête.''' Il ne porte que sur la modification de la page de propriété elle-même. Mesuré le 5 octobre 2026 : trois couples de propriétés de même type et de même valeur, l'une verrouillée et l'autre libre, stockent la même valeur brute dans la même table, et les requêtes les lisent de la même façon ; deux propriétés verrouillées pendant tout leur usage ont stocké et répondu normalement. Une propriété verrouillée dont le type résolu est juste reste donc utilisable. À ne pas confondre avec le type résolu faux de l'entrée sur le type résolu, plus haut : ce sont deux symptômes distincts, qui ne vont pas toujours ensemble.
 # '''Le module d'API <code><nowiki>browsebysubject</nowiki></code>, sur lequel reposent nos vérifications de faits stockés, a été supprimé de Semantic MediaWiki à la version 7.0.0.''' Il a été déprécié à la version 3.0.0 au profit de <code><nowiki>smwbrowse</nowiki></code>, puis supprimé à la 7.0.0. wiki.ecolibre.org est en 4.2.0, où il fonctionne encore : toute montée de version majeure casserait donc les vérifications qui l'emploient. Remplacement sans perte, mesuré : <code><nowiki>action=smwbrowse&browse=subject&params={"subject":"<titre complet>","ns":0}</nowiki></code> rend le même bloc <code><nowiki>query</nowiki></code>, le titre complet suffisant à résoudre l'espace de noms, et ajoute seulement un bloc <code><nowiki>meta</nowiki></code> en fin de réponse. Mesuré le 7 octobre 2026 dans les notes de version de Semantic MediaWiki et par comparaison des deux appels sur deux pages du wiki. L'outillage du dépôt a été migré le même jour.
 # '''Une énumération fermée ne s'enrichit plus une fois le verrou de propagation posé.''' Ajouter une valeur à la liste <code>_PVAL</code> d'une propriété revient à modifier sa déclaration, donc à la verrouiller si elle ne l'est pas déjà, et c'est impossible si elle l'est. Constaté le 6 octobre 2026 sur <code>Work_package_status</code>, dont les six valeurs sont « identifié », « cadré », « ouvert », « livré », « clos » et « abandonné » : il n'en existe aucune pour un lot suspendu par une dépendance externe, et trente-quatre lots dépendent de cette propriété. Le cas se représentera pour toute énumération fermée du modèle. '''En attendant que le verrou soit réparé, une valeur manquante se dit en prose sur la page concernée, jamais en ajoutant une valeur à l'énumération.'''
\ No newline at end of file
```

## Diff de la page du lot 21

Révision 1468 → **1472** (2026-10-08T21:21:11Z), résumé `[Lot 21][Tâche 15] Correction après dégel : paragraphes dépassés datés, risques et comptes corrigés`. Les six débuts de ligne (2.1 à 2.6) et les trois ancres (2.7 à 2.9) ont été trouvés chacun une fois et une seule, contrôle fait sur les neuf avant toute modification. Neuf lignes changées, 149 lignes avant comme après.

```diff
diff --git a/pages/Lot_21.txt b/pages/Lot_21.txt
index a0917c9..c98cf19 100644
--- a/pages/Lot_21.txt
+++ b/pages/Lot_21.txt
@@ -10,7 +10,7 @@
 
 == Ce qui est déjà tranché ==
 
-'''Trois modes d'affirmation d'une valeur.''' Une valeur scalaire pour le cas simple, un sous-objet de spécification pour ce qu'annonce un fabricant, un sous-objet de mesure pour ce qu'on a constaté soi-même. Les trois ne disent pas la même chose et ne se remplacent pas.
+'''Trois modes d'affirmation d'une valeur.''' Une valeur scalaire pour le cas simple, un sous-objet de spécification pour ce qu'annonce un fabricant, un sous-objet de mesure pour ce qu'on a constaté soi-même. Les trois ne disent pas la même chose et ne se remplacent pas. Dépassé le 8 octobre 2026 : le mode scalaire a disparu, toute valeur de grandeur étant désormais portée par un sous-objet. Voir « La conception arrêtée ».
 
 '''Les grandeurs et les unités sont des pages, pas des chaînes.''' Une page porte des libellés par langue et se joint entre partenaires sur son identité, là où une chaîne ne se joint que sur elle-même. Cet arbitrage révise celui du [[Lot 10 — Procédés et outils|lot 10]], qui avait typé en texte les grandeurs que mesure un instrument, au motif qu'une grandeur ne porterait jamais de données propres ([https://github.com/Ecolibre/ecolibre-sgdt/blob/5f91eddf8f366a5e3dadcef11f94c6e27192617c/travaux/lot-10-tache3-proposition.md proposition de la tâche 3 du lot 10], section 4). Ce motif est tombé : une grandeur est nommée en plusieurs points du modèle, pas seulement par un instrument.
 
@@ -22,15 +22,15 @@
 
 '''Les valeurs se normalisent à l'écriture, vers un socle commun d'unités.''' Le modèle doit pouvoir comparer un débit en mètres cubes par seconde et un débit en litres par heure : sans cela, un partenaire qui publierait des mètres cubes par heure là où Ecolibre écrit des litres par heure ne serait pas comparable. Les unités admises sont appelées à former un socle commun à la fédération, décidé collectivement ; un wiki partenaire peut employer temporairement une unité nouvelle avant qu'elle ne le rejoigne, après concertation.
 
-'''Les propriétés existantes changent sur place.''' On ne crée pas de propriétés neuves pour déprécier les anciennes. Rien n'est urgent, mais la règle d'attente posée le 4 octobre 2026 ne tient plus : mesuré du 4 au 6 octobre 2026, aucun des quinze verrous observés ne s'est levé, et toute écriture modifiant le type d'une propriété la verrouille aussitôt (entrée 62 des Limites connues). Une page de propriété doit donc être écrite une seule fois, dans sa forme définitive, unités comprises : la correction d'une description et le changement de type d'une même propriété n'en font qu'une. Un verrou n'empêche d'ailleurs ni le stockage ni la requête (entrée 63) ; il n'empêche que de revenir sur la déclaration.
+'''Les propriétés existantes changent sur place.''' On ne crée pas de propriétés neuves pour déprécier les anciennes. Rien n'est urgent, mais la règle d'attente posée le 4 octobre 2026 ne tient plus : mesuré du 4 au 6 octobre 2026, aucun des quinze verrous observés ne s'est levé, et toute écriture modifiant le type d'une propriété la verrouille aussitôt (entrée 62 des Limites connues). Une page de propriété doit donc être écrite une seule fois, dans sa forme définitive, unités comprises : la correction d'une description et le changement de type d'une même propriété n'en font qu'une. Un verrou n'empêche d'ailleurs ni le stockage ni la requête (entrée 63) ; il n'empêche que de revenir sur la déclaration. Deux fois dépassé le 8 octobre 2026. La reprise ne change plus le type des propriétés existantes : elle réécrit les pages porteuses et laisse les anciennes propriétés se vider. Et les quinze verrous dont il est question ici se sont tous levés d'eux-mêmes avant le 8 octobre 2026 à 21 h 11, ce qui retire sa raison d'être à la règle d'écriture unique (entrée 62 des Limites connues). Voir « La conception arrêtée ».
 
 '''L'unité principale d'une grandeur est son unité SI cohérente.''' Décision provisoire du 4 octobre 2026, datée, à rouvrir au premier partenaire. Le Bureau international des poids et mesures pose qu'une grandeur n'a qu'une seule unité SI, et le SI est le seul système d'unités convenu à l'échelle mondiale : c'est le consensus auquel ce lot avait choisi de se fier. Pour une température, c'est le kelvin. Le degré Celsius est bien une unité SI, mais le kelvin en est l'unité de base, et c'est en kelvins que le type Temperature stocke, le degré Celsius restant l'unité de saisie et d'affichage. Corrigé le 6 octobre 2026 : la rédaction du 4 octobre désignait le degré Celsius, ce que la mesure dément. Les unités d'usage — litre par heure, millimètre — restent admises à la saisie et à l'affichage, converties à l'écriture. Les grandeurs hors du SI se traitent au cas par cas.
 
-'''Le mode scalaire est porté par le type Quantity, et les températures par le type Temperature.''' Mesuré en bac à sable le 4 octobre 2026 (rapport lié en tête de page). En locale française, la virgule décimale est acceptée, dans les valeurs comme dans les facteurs de conversion. La valeur est stockée dans l'unité principale ; elle s'affiche par défaut dans la première unité d'affichage déclarée chez Quantity et dans la dernière chez Temperature (entrée 61 des Limites connues), et sur demande dans toute autre unité déclarée : saisies en litres par heure, en mètres cubes par seconde et en mégalitres par jour, les trois valeurs d'essai se sont relues exactes en litres par heure. Les requêtes comparent d'une unité à l'autre. Cet arbitrage révise la convention du [[Lot 8 — Facettes de type d'item|lot 8]] — type Number, unité écrite dans la portée de la propriété — ([https://github.com/Ecolibre/ecolibre-sgdt/blob/c73d88a5931d1ceec88964029c97f6774f21ce6b/travaux/lot-8-amendement-1.md amendement 1 du lot 8], section 6).
+'''Le mode scalaire est porté par le type Quantity, et les températures par le type Temperature.''' Mesuré en bac à sable le 4 octobre 2026 (rapport lié en tête de page). En locale française, la virgule décimale est acceptée, dans les valeurs comme dans les facteurs de conversion. La valeur est stockée dans l'unité principale ; elle s'affiche par défaut dans la première unité d'affichage déclarée chez Quantity et dans la dernière chez Temperature (entrée 61 des Limites connues), et sur demande dans toute autre unité déclarée : saisies en litres par heure, en mètres cubes par seconde et en mégalitres par jour, les trois valeurs d'essai se sont relues exactes en litres par heure. Les requêtes comparent d'une unité à l'autre. Cet arbitrage révise la convention du [[Lot 8 — Facettes de type d'item|lot 8]] — type Number, unité écrite dans la portée de la propriété — ([https://github.com/Ecolibre/ecolibre-sgdt/blob/c73d88a5931d1ceec88964029c97f6774f21ce6b/travaux/lot-8-amendement-1.md amendement 1 du lot 8], section 6). La mesure reste exacte ; le mode scalaire, lui, a disparu le 8 octobre 2026. Ce qui est dit ici du type Quantity vaut désormais pour les valeurs portées par un sous-objet.
 
 '''Toute unité convertible par un coefficient peut être acceptée, à condition d'être déclarée.''' Une valeur saisie dans une unité dont la conversion n'est pas déclarée n'est pas stockée, et une erreur la signale : le système ne devine jamais un coefficient. Déclarer l'unité, avec son coefficient vers l'unité principale, suffit pour qu'elle soit acceptée et convertie, qu'elle appartienne au SI ou non. Règle posée le 4 octobre 2026 : les documents techniques à reprendre emploient beaucoup d'unités hors du SI, et chacune doit pouvoir s'y ramener. Deux exceptions à la règle du coefficient : les températures, dont le décalage d'origine relève du type Temperature, et les grandeurs logarithmiques comme le décibel, qui n'ont pas de coefficient.
 
-'''Les déclarations d'unités se partagent par un modèle transclus.''' Mesuré le 4 octobre 2026 : trois propriétés appelant le même modèle portent les mêmes unités, et une propriété peut en déclarer une en propre en plus.
+'''Les déclarations d'unités se partagent par un modèle transclus.''' Mesuré le 4 octobre 2026 : trois propriétés appelant le même modèle portent les mêmes unités, et une propriété peut en déclarer une en propre en plus. Précisé le 8 octobre 2026 : ce modèle transclus est le bloc de déclaration porté par la page de grandeur. Voir « La conception arrêtée ».
 
 '''La spécification et la mesure sont portées par des sous-objets.''' Mesuré le 4 octobre 2026 : les sous-objets sont stockés, et une requête les traverse jusqu'à trois sauts, de l'item jusqu'à la page de grandeur en passant par le sous-objet et l'unité.
 
@@ -40,7 +40,7 @@
 
 '''Les libellés par langue sont portés par le type Monolingual text.''' Mesuré le 5 octobre 2026 : chaque libellé est stocké dans un sous-objet conteneur portant son texte et son code de langue, et une requête de la forme <code>débit volumique@fr</code> trouve la page. L'affichage rend les deux langues avec leur code. L'affichage filtré sur une seule langue n'a pas été mesuré. C'est le motif que réemploiera le [[Lot 19 — Vocabulaire et multilingue|lot 19]].
 
-'''Une tolérance de température n'emploie pas le type Temperature.''' Mesuré le 5 octobre 2026 : ce type applique le décalage d'origine à un écart comme à une valeur absolue, et une tolérance de 2 °C y est stockée 275,15 sans la moindre erreur (entrée 60 des Limites connues). Une température absolue emploie Temperature, qui gère aussi le degré Fahrenheit nativement ; un écart, une tolérance ou une plage emploie Quantity avec le degré Celsius et le kelvin au facteur 1.
+'''Une tolérance de température n'emploie pas le type Temperature.''' Mesuré le 5 octobre 2026 : ce type applique le décalage d'origine à un écart comme à une valeur absolue, et une tolérance de 2 °C y est stockée 275,15 sans la moindre erreur (entrée 60 des Limites connues). Une température absolue emploie Temperature, qui gère aussi le degré Fahrenheit nativement ; un écart, une tolérance ou une plage emploie Quantity avec le degré Celsius et le kelvin au facteur 1. La mesure reste exacte, sa conclusion est dépassée depuis le 8 octobre 2026 : une tolérance se stockant en deux bornes absolues, il n'existe plus d'écart à porter, et une borne est une température ordinaire, de type Temperature. Voir « La conception arrêtée ».
 
 '''L'ordre des unités d'affichage s'écrit à l'envers selon le type.''' Chez Quantity, la première unité déclarée s'affiche ; chez Temperature, la dernière (entrée 61 des Limites connues). Une température absolue qui doit s'afficher en degrés Celsius se déclare donc <code>Display units::K, °C</code>. Les deux règles étant inverses, la page de grandeur devra porter les déclarations toutes faites, à recopier : personne ne retiendra une règle inversée.
 
@@ -48,7 +48,7 @@
 
 Arrêtée du 6 au 8 octobre 2026, après la phase de mesure. Elle déborde l'objet initial du lot, qui a été élargi en conséquence.
 
-'''Une propriété par grandeur, et non une par caractéristique.''' Décidé le 8 octobre 2026. Le wiki déclarait jusqu'ici une propriété par caractéristique : <code>Nominal diameter</code>, <code>Secondary diameter</code>, <code>Max thickness</code> et <code>Max head</code> mesurent trois fois la même grandeur, une longueur, et redéclarent trois fois leur type et leurs unités. Le socle devient une propriété par grandeur, soit quelques dizaines au lieu de centaines. Motif : deux ateliers s'accorderont sur « diamètre », jamais sur « diamètre secondaire », qui est un mot de notre catalogue et non une notion partagée. Si chaque caractéristique est une propriété, chaque partenaire invente les siennes et la jointure est perdue d'avance, ce que le SGDT veut précisément éviter. Prix accepté : les requêtes s'allongent, et la reprise des propriétés existantes devient une refonte plutôt qu'un changement de type.
+'''Une propriété par grandeur, et non une par caractéristique.''' Décidé le 8 octobre 2026. Le wiki déclarait jusqu'ici une propriété par caractéristique : <code>Nominal diameter</code>, <code>Secondary diameter</code>, <code>Max thickness</code> et <code>Max head</code> mesurent quatre fois la même grandeur, une longueur, <code>Max head</code> étant une hauteur de refoulement en centimètres, et redéclarent quatre fois leur type et leurs unités. Le socle devient une propriété par grandeur, soit quelques dizaines au lieu de centaines. Motif : deux ateliers s'accorderont sur « diamètre », jamais sur « diamètre secondaire », qui est un mot de notre catalogue et non une notion partagée. Si chaque caractéristique est une propriété, chaque partenaire invente les siennes et la jointure est perdue d'avance, ce que le SGDT veut précisément éviter. Prix accepté : les requêtes s'allongent, et la reprise des propriétés existantes devient une refonte plutôt qu'un changement de type.
 
 '''Cette décision engage le modèle entier, pas seulement ce lot.''' Le [[Lot 10 — Procédés et outils|lot 10]], dont <code>Measured_quantities</code> devient caduque ; le [[Lot 12 — Contenants et étiquetage|lot 12]], dont les contenants porteront des cotes ; le [[Lot 26 — Renommage des propriétés par domaine|lot 26]], qui renommera un socle partagé et non des noms isolés ; le [[Lot 7 — Nomenclature quantifiée et entité réception|lot 7]] et le [[Lot 19 — Vocabulaire et multilingue|lot 19]]. Le recoupement entre lots ne se déclarant que d'un côté (entrée 51 des Limites connues), aucun de ces lots ne verra passer la décision : elle est nommée ici pour qu'on la retrouve.
 
@@ -106,7 +106,7 @@ Arrêtée du 6 au 8 octobre 2026, après la phase de mesure. Elle déborde l'obj
 
 '''Le renommage des propriétés existantes.''' Il relève du [[Lot 26 — Renommage des propriétés par domaine|lot 26]].
 
-'''Les caractéristiques nouvelles.''' Le lot pose le mécanisme et y fait passer les propriétés existantes ; les nouvelles se créent ensuite, au besoin, selon ce mécanisme. Cela vaut pour les cotes des contenants, que le [[Lot 12 — Contenants et étiquetage|lot 12]] renvoie ici, et pour le débit maximal des pompes, qu'attend le lot 7.
+'''Les caractéristiques nouvelles.''' Le lot pose le mécanisme et y fait passer les propriétés existantes ; les nouvelles se créent ensuite, au besoin, selon ce mécanisme. Cela vaut pour les cotes des contenants, que le [[Lot 12 — Contenants et étiquetage|lot 12]] renvoie ici, et pour le débit maximal des pompes, qu'attend le lot 7. Dépassé le 8 octobre 2026 : le lot ne fait plus passer les propriétés existantes dans le nouveau mécanisme, il crée un socle neuf, une propriété par grandeur, et laisse les anciennes se vider. Voir « La conception arrêtée ».
 
 == Points ouverts ==
 
@@ -135,9 +135,9 @@ L'existant à reprendre est minime : trois valeurs sur deux pages, relevé du 4
 
 == Risques connus ==
 
-* Changer le type d'une propriété qui porte déjà une valeur fonctionne, et verrouille la page ensuite. Mesuré le 6 octobre 2026 : le passage de Temperature à Quantity a été accepté sur une propriété libre, la valeur stockée est passée de 275,15 à 2 en moins de trois minutes sans qu'il faille réécrire la page porteuse, et la page de propriété était verrouillée dans le même temps (entrée 62 des Limites connues). Le risque n'est donc pas de ne pas pouvoir migrer, mais de ne plus pouvoir revenir sur la déclaration.
+* Changer le type d'une propriété qui porte déjà une valeur fonctionne, et verrouille la page ensuite. Mesuré le 6 octobre 2026 : le passage de Temperature à Quantity a été accepté sur une propriété libre, la valeur stockée est passée de 275,15 à 2 en moins de trois minutes sans qu'il faille réécrire la page porteuse, et la page de propriété était verrouillée dans le même temps. Le verrou se lève seul en quelques jours (entrée 62 des Limites connues) : le risque n'est donc ni de ne pas pouvoir migrer, ni de perdre la propriété, mais de ne pas pouvoir revenir sur la déclaration avant plusieurs jours.
 * Ce risque ne concerne plus ce lot depuis le 8 octobre 2026 : la reprise des propriétés existantes ne change aucun type, elle réécrit les pages porteuses. Il reste valable pour tout lot qui changerait le type d'une propriété en production.
-* Une propriété neuve se crée sans danger, une à la fois, sous réserve de la barrière du type résolu : onze créations isolées entre le 4 et le 6 octobre 2026 ont toutes rendu le bon type. Le gel du type résolu n'est survenu qu'une fois, sur une rafale de onze pages écrites en treize secondes (entrée 59 des Limites connues). Ce qui arrive souvent est le verrou d'écriture, qui ne gêne pas l'usage (entrée 63) mais interdit de revenir sur la déclaration : une déclaration neuve doit donc être juste du premier coup.
+* Une propriété neuve se crée une à la fois, sous réserve de la barrière du type résolu. Compte au 8 octobre 2026 : vingt-cinq propriétés créées du 4 au 6 octobre, dont sept ont gelé sur le type par défaut, en deux épisodes seulement, une rafale de six et une création isolée. Ni la rafale ni l'isolement ne prédisent le gel, et le gel se résorbe de lui-même en deux à quatre jours (entrée 59 des Limites connues). Le verrou d'écriture, lui, est fréquent, ne gêne pas l'usage (entrée 63), et se lève seul en quelques jours (entrée 62). Une déclaration neuve n'a donc pas à être juste du premier coup : elle a à être corrigible quelques jours plus tard, ce qu'elle est. La rédaction du 8 octobre 2026, qui annonçait onze créations isolées toutes correctes, était fausse : dix sur onze.
 * Une page de propriété d'essai se supprime directement, jamais après avoir été vidée : le blanchiment la verrouille (entrée 33 des Limites connues).
 * Ajouter une unité à une grandeur modifie une déclaration partagée par toutes ses propriétés, qui se réanalysent alors : l'effet sur le verrou de propagation n'est pas mesuré.
 
```

## Diff de CLAUDE.md

```diff
diff --git a/CLAUDE.md b/CLAUDE.md
index 58c465b..342f1bc 100644
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -284,7 +284,7 @@ Ce que Cyril peut lancer seul, et ce qui relève de fuzzy : voir
 
   **Le verrou d'écriture n'est pas un critère.** `smw-change-propagation-protection` n'empêche ni le stockage ni la requête : mesuré le 5 octobre 2026, une propriété verrouillée stocke et répond exactement comme une propriété libre de même type. Ne jamais éliminer ni abandonner une propriété parce que sa page est verrouillée. Le verrou se lit sans rien écrire par `intestactions`, et il se consigne.
 
-  **En revanche il fige la déclaration, et c'est une panne, pas une règle du modèle.** Toute écriture qui modifie le type d'une propriété la verrouille en moins de trois minutes, et aucun verrou observé entre le 4 et le 6 octobre 2026 ne s'est levé, alors que trois verrous d'août 2026 s'étaient levés seuls en quelques jours. Un verrou temporaire le temps d'une propagation est le comportement documenté de SMW ; qu'il ne se lève pas ne l'est pas, et la cause probable est la file de travaux qui ne tourne pas. **Précaution d'exploitation, valable tant que ce défaut dure :** écrire une page de propriété une seule fois, dans sa forme définitive, type, conversions, unités d'affichage et description comprises, et ne jamais corriger une description sur une propriété dont le type doit encore changer. **Condition de sortie :** dès qu'un verrou se lève à nouveau de lui-même, cette précaution tombe et une propriété se corrige normalement.
+  **En revanche il retarde toute correction.** Toute écriture qui modifie le type d'une propriété la verrouille en moins de trois minutes. Mesuré du 4 au 8 octobre 2026 : quinze pages de propriété d'essai verrouillées le 6 octobre étaient toutes libres le 8 à 21 h 11, soit un délai de quelques heures à quatre jours selon les cas. Le gel du type résolu se résorbe de la même façon, en deux à quatre jours. **Conséquence réelle :** une déclaration de propriété ne se corrige pas le jour même, mais quelques jours plus tard. Ce n'est ni une perte, ni une raison de changer de nom, ni une raison de tout figer d'avance. Les rédactions des 6 et 8 octobre 2026, qui tenaient le verrou pour définitif et prescrivaient d'écrire une page de propriété une seule fois dans sa forme définitive, étaient fausses et sont retirées.
 
   Après avoir créé une propriété, n'émettre aucune requête nommant cette propriété tant que `_CHGPRO` n'a pas disparu de ses faits ; la seule sonde autorisée pendant cette attente est la lecture des faits de la page et celle de `intestactions`, qui ne résolvent aucun type. Ce n'est pas la rafale qui décide : mesuré les 4 et 5 octobre 2026, une rafale de huit créations a réussi, une création isolée a échoué.
 
```

## Diff de bin/wiki-api.sh

```diff
diff --git a/bin/wiki-api.sh b/bin/wiki-api.sh
index fd9cca5..e84df83 100755
--- a/bin/wiki-api.sh
+++ b/bin/wiki-api.sh
@@ -38,6 +38,18 @@
 # passé en argument ici. Cherché d'abord dans $SGDT_PRIVE (par défaut
 # ../ecolibre-sgdt-prive/, voisin du dépôt), puis dans le dépôt. Absent des
 # deux : lecture anonyme, sans échec.
+#
+# Session expirée : un fichier de cookies présent ne garantit pas une
+# session valide, et l'API répond alors en anonyme sans le dire. Seulement
+# quand la chaîne contient intestactions et qu'un fichier de cookies a été
+# trouvé, le script lit d'abord action=query&meta=userinfo avec les mêmes
+# cookies ; si la réponse décrit un anonyme, il avertit sur stderr que le
+# résultat d'intestactions sera celui d'un visiteur anonyme, puis poursuit
+# sans échouer. Si cette lecture échoue, il poursuit sans rien dire.
+# Restreint à intestactions, seule lecture dont le sens dépend d'être
+# connecté : un contrôle sur chaque appel doublerait toutes les lectures.
+# Ajouté le 8 octobre 2026 (lot 21, tâche 15), après une lecture de verrou
+# faussée par une session expirée à la tâche 14.
 set -euo pipefail
 
 readonly WIKI_API="https://wiki.ecolibre.org/api.php"
@@ -133,6 +145,21 @@ if [ -n "$COOKIES" ]; then
   CURL_OPTS+=(-b "$COOKIES")
 fi
 
+if [ -n "$COOKIES" ]; then
+  case "$PARAMS" in
+    *intestactions*)
+      USERINFO=$(curl -sS -G -b "$COOKIES" "$WIKI_API" \
+        --data "action=query&meta=userinfo&format=json" 2>/dev/null) || USERINFO=""
+      if printf '%s' "$USERINFO" | python3 -c '
+import sys, json
+sys.exit(0 if "anon" in json.load(sys.stdin)["query"]["userinfo"] else 1)
+' 2>/dev/null; then
+        echo "AVERTISSEMENT: session expirée — le résultat d'intestactions sera celui d'un visiteur anonyme. Relancer bin/wiki-login.sh." >&2
+      fi
+      ;;
+  esac
+fi
+
 # Ajoute format=json/formatversion=2 par défaut si absents de $PARAMS,
 # sans jamais dupliquer un paramètre déjà fourni par l'appelant.
 EXTRA=""
```

L'avertissement ajoute « Relancer bin/wiki-login.sh. » à ce que la consigne demandait de dire. Le contrôle accepte `userinfo.anon` dans les deux formats de réponse : la lecture supplémentaire est en `format=json` sans `formatversion`, et la clé `anon` y est présente, de valeur vide.

## Vérifications

**a. Celle qui tranche.**
- `bin/wiki-verify.sh "Lot 21 — Grandeurs et unités" pages/Lot_21.txt` : `IDENTIQUE`, sortie 0.
- `bin/wiki-verify.sh "Limites connues du Système de Gestion de Données Techniques" pages/Limites_connues.txt` : `IDENTIQUE`, sortie 0.

**b. Entrées corrigées.** 65 lignes commencent par `# `, comme avant la tâche.
- 59 : « Le type résolu d'une propriété peut rester le type par défaut alors que sa page porte le bon type. »
- 62 : « Toute écriture qui modifie le type d'une propriété la verrouille aussitôt, et le verrou se lève seul en quelques jours. »
- 63 : « Un verrou de propagation n'empêche ni le stockage d'une valeur ni sa requête. » Inchangée : la 63e ligne `# ` est identique avant et après, par `diff`.

Le titre de l'entrée 59 n'a pas changé : la correction 1.1 remplace sa fin. Le gras qu'elle introduit, « Le gel n'est pas définitif… », est au milieu de l'entrée.

**c. Renvois.** Mentions relevées sur la page du lot, et sujet de l'entrée visée :

| Mention | Occurrences | Sujet de l'entrée | Correspond |
|---|---|---|---|
| entrée 2 des Limites connues | 1 | L'arbre fonctionnel est devenu un graphe orienté acyclique ; l'entrée réfute un précédent affirmé à tort sur le wiki | oui, sur le fond : la page du lot l'invoque pour démentir un motif « déjà employé sur ce wiki » |
| entrée 10 des Limites connues | 1 | Filetage et diamètre d'un raccord à plusieurs orifices | oui (orifice de raccord) |
| entrée 33 des Limites connues | 1 | Blanchir une page de propriété la verrouille | oui |
| entrée 51 des Limites connues | 1 | Le recoupement entre lots ne se déclare que d'un côté | oui (corrigé de 49 à la tâche 14) |
| entrée 57 des Limites connues | 1 | La virgule décimale se heurte au séparateur de valeurs multiples | oui |
| entrée 59 des Limites connues | 1 | Type résolu resté au type par défaut | oui |
| entrée 60 des Limites connues | 1 | Décalage d'origine de Temperature appliqué aux écarts | oui |
| entrée 61 des Limites connues | 2 | Unité d'affichage par défaut, première ou dernière selon le type | oui |
| entrée 62 (avec ou sans « des Limites connues ») | 4 | Le verrou, qui se lève seul en quelques jours | oui |
| entrée 63 | 2 | Un verrou n'empêche ni le stockage ni la requête | oui |
| entrée 65 | 1 | Une énumération fermée ne s'enrichit plus une fois le verrou posé | oui |

Aucun renvoi faux.

**d. Paragraphes datés.** Les six lignes, en entier, numéros de ligne du fichier envoyé :

```
13: '''Trois modes d'affirmation d'une valeur.''' Une valeur scalaire pour le cas simple, un sous-objet de spécification pour ce qu'annonce un fabricant, un sous-objet de mesure pour ce qu'on a constaté soi-même. Les trois ne disent pas la même chose et ne se remplacent pas. Dépassé le 8 octobre 2026 : le mode scalaire a disparu, toute valeur de grandeur étant désormais portée par un sous-objet. Voir « La conception arrêtée ».
25: '''Les propriétés existantes changent sur place.''' On ne crée pas de propriétés neuves pour déprécier les anciennes. Rien n'est urgent, mais la règle d'attente posée le 4 octobre 2026 ne tient plus : mesuré du 4 au 6 octobre 2026, aucun des quinze verrous observés ne s'est levé, et toute écriture modifiant le type d'une propriété la verrouille aussitôt (entrée 62 des Limites connues). Une page de propriété doit donc être écrite une seule fois, dans sa forme définitive, unités comprises : la correction d'une description et le changement de type d'une même propriété n'en font qu'une. Un verrou n'empêche d'ailleurs ni le stockage ni la requête (entrée 63) ; il n'empêche que de revenir sur la déclaration. Deux fois dépassé le 8 octobre 2026. La reprise ne change plus le type des propriétés existantes : elle réécrit les pages porteuses et laisse les anciennes propriétés se vider. Et les quinze verrous dont il est question ici se sont tous levés d'eux-mêmes avant le 8 octobre 2026 à 21 h 11, ce qui retire sa raison d'être à la règle d'écriture unique (entrée 62 des Limites connues). Voir « La conception arrêtée ».
29: '''Le mode scalaire est porté par le type Quantity, et les températures par le type Temperature.''' Mesuré en bac à sable le 4 octobre 2026 (rapport lié en tête de page). En locale française, la virgule décimale est acceptée, dans les valeurs comme dans les facteurs de conversion. La valeur est stockée dans l'unité principale ; elle s'affiche par défaut dans la première unité d'affichage déclarée chez Quantity et dans la dernière chez Temperature (entrée 61 des Limites connues), et sur demande dans toute autre unité déclarée : saisies en litres par heure, en mètres cubes par seconde et en mégalitres par jour, les trois valeurs d'essai se sont relues exactes en litres par heure. Les requêtes comparent d'une unité à l'autre. Cet arbitrage révise la convention du [[Lot 8 — Facettes de type d'item|lot 8]] — type Number, unité écrite dans la portée de la propriété — ([https://github.com/Ecolibre/ecolibre-sgdt/blob/c73d88a5931d1ceec88964029c97f6774f21ce6b/travaux/lot-8-amendement-1.md amendement 1 du lot 8], section 6). La mesure reste exacte ; le mode scalaire, lui, a disparu le 8 octobre 2026. Ce qui est dit ici du type Quantity vaut désormais pour les valeurs portées par un sous-objet.
33: '''Les déclarations d'unités se partagent par un modèle transclus.''' Mesuré le 4 octobre 2026 : trois propriétés appelant le même modèle portent les mêmes unités, et une propriété peut en déclarer une en propre en plus. Précisé le 8 octobre 2026 : ce modèle transclus est le bloc de déclaration porté par la page de grandeur. Voir « La conception arrêtée ».
43: '''Une tolérance de température n'emploie pas le type Temperature.''' Mesuré le 5 octobre 2026 : ce type applique le décalage d'origine à un écart comme à une valeur absolue, et une tolérance de 2 °C y est stockée 275,15 sans la moindre erreur (entrée 60 des Limites connues). Une température absolue emploie Temperature, qui gère aussi le degré Fahrenheit nativement ; un écart, une tolérance ou une plage emploie Quantity avec le degré Celsius et le kelvin au facteur 1. La mesure reste exacte, sa conclusion est dépassée depuis le 8 octobre 2026 : une tolérance se stockant en deux bornes absolues, il n'existe plus d'écart à porter, et une borne est une température ordinaire, de type Temperature. Voir « La conception arrêtée ».
109: '''Les caractéristiques nouvelles.''' Le lot pose le mécanisme et y fait passer les propriétés existantes ; les nouvelles se créent ensuite, au besoin, selon ce mécanisme. Cela vaut pour les cotes des contenants, que le [[Lot 12 — Contenants et étiquetage|lot 12]] renvoie ici, et pour le débit maximal des pompes, qu'attend le lot 7. Dépassé le 8 octobre 2026 : le lot ne fait plus passer les propriétés existantes dans le nouveau mécanisme, il crée un socle neuf, une propriété par grandeur, et laisse les anciennes se vider. Voir « La conception arrêtée ».
```

Chaque ajout est en fin de ligne, précédé d'une espace. Aucun saut de ligne introduit : 149 lignes avant, 149 après.

**e. Script.** `bash -n` : syntaxe correcte.

1. Sans `intestactions`, connecté : `bin/wiki-api.sh "action=query&meta=userinfo"` →
   ```
   {
       "batchcomplete": true,
       "query": {
           "userinfo": {
               "id": 4,
               "name": "Cywil"
           }
       }
   }
   ```
   sortie 0.
2. Avec `intestactions` sur `Attribut:Max thickness`, connecté : `{"title":"Attribut:Max thickness","lastrevid":804,"edit":[]}`, aucun avertissement, sortie 0.
3. Renommage du fichier de cookies : **non exécuté**, Cyril ayant refusé la commande (voir Échanges). Remplacé par deux simulations qui ne touchent pas au fichier réel, avec `SGDT_PRIVE` pointé sur un dossier du scratchpad :
   - dossier vide, ce qui équivaut au renommage demandé : aucun fichier de cookies trouvé, réponse anonyme (`permissiondenied`, `confirmemail`, `lastrevid` 804), **aucun avertissement**, sortie 0. C'est le comportement spécifié : l'avertissement est réservé au cas où un fichier de cookies a été trouvé.
   - dossier contenant un `.cookies.txt` sans aucun cookie, qui simule une session expirée :
     ```
     AVERTISSEMENT: session expirée — le résultat d'intestactions sera celui d'un visiteur anonyme. Relancer bin/wiki-login.sh.
                     "lastrevid": 804,
                                 "code": "permissiondenied",
                                 "code": "confirmemail",
     ```
     sortie 0 : le script poursuit sans échouer.
   - Après ces essais, la session réelle est intacte : `meta=userinfo` rend `{"id":4,"name":"Cywil"}`.

**f. Erreurs.** `[[_ERRC::+]]` vaut **1** par `action=ask` (`meta.count` = 1) comme par le rendu en ligne `format=count` (1). Seul sujet : `Utilisateur:Cywil/Bac à sable/Lot21c pompe#saisie-douteux`. Inchangé.

**g. Propriétés intactes.** Connecté en tant que Cywil :

| Propriété | lastrevid | edit |
|---|---|---|
| Attribut:Nominal diameter | 342 | `[]` |
| Attribut:Secondary diameter | 343 | `[]` |
| Attribut:Power rating | 803 | `[]` |
| Attribut:Max thickness | 804 | `[]` |

Aucune verrouillée. Aucune écriture dans l'espace Attribut, aucune page d'essai touchée.

Contrôle hors consigne, suivant CLAUDE.md : catégories, `Page de suivi` et `Lot` seulement ; aucun lien vers une page inexistante sur les deux pages ; les Limites connues ne portent que `_INST`, `_MDAT`, `_SKEY`.

## Écarts et surprises

1. **Le test de la vérification e, tel qu'écrit, ne pouvait pas faire apparaître l'avertissement.** Renommer le fichier de cookies fait passer le script dans le cas « aucun fichier de cookies trouvé ». La spécification de l'étape 4 exclut justement ce cas de l'avertissement. Seul un fichier présent mais périmé le déclenche : c'est la simulation par fichier vide qui l'a montré.

2. **Phrases que le dégel dément et que la consigne laisse en place.**
   - **CLAUDE.md, règle « Barrière avant d'employer une propriété neuve », paragraphe sur `_TYPE`** : « Une propriété dont le type résolu est faux est perdue : ne pas chercher à la réparer, abandonner le nom et recréer sous un autre. » C'est l'inverse de ce que disent désormais l'entrée 59 et le nouveau paragraphe de la même règle (« ni une raison de changer de nom »). La consigne interdisait toute autre modification de CLAUDE.md : laissé tel quel.
   - **Même règle, dernier paragraphe** : « Ce n'est pas la rafale qui décide : mesuré les 4 et 5 octobre 2026, une rafale de huit créations a réussi, une création isolée a échoué. » Compatible avec le recomptage. Le point B du rapport de la tâche 14 est donc tranché en faveur de CLAUDE.md.
   - **Page du lot, « Points ouverts »** (texte de la tâche 14, ligne 120) : « les noms des propriétés […], puisqu'une déclaration neuve doit être juste du premier coup ». La ligne 140 dit maintenant le contraire. La même section dit aussi, ligne 115, que les deux propriétés de diamètre « doivent le rester [libres], les corriger les verrouillant pour rien » : ce n'est pas faux, mais le motif est affaibli puisque le verrou se lève.
   - **Page du lot, entrée « Le nom des propriétés » parmi les arbitrages bloquants** : son motif, une déclaration juste du premier coup, tombe. L'arbitrage reste peut-être bloquant pour d'autres raisons ; ce n'est pas à moi d'en juger.

3. **Une révision intercalée.** Les Limites connues sont passées de 1467 à 1471 et la page du lot de 1468 à 1472 : les révisions 1469 et 1470 ont été écrites ailleurs sur le wiki entre la tâche 14 et celle-ci, probablement par le relevé de l'architecte. Ce n'est pas un écart en soi, je le signale pour la traçabilité.

4. L'affirmation de 2.7 sur `Max head` a été vérifiée avant écriture : `Attribut:Max head`, révision 335, porte « Hauteur de refoulement maximale […], en centimètres » et `Property_range::cm`.

## Échanges avec Cyril hors consigne

- Le renommage de `../ecolibre-sgdt-prive/.cookies.txt` a été refusé à la confirmation, puis une première tentative de simulation, refusée elle aussi. Aucune des deux commandes ne s'est exécutée, le fichier n'a pas bougé.
- Point A, sur la façon de mener le test e : réponse « Simuler par SGDT_PRIVE ». Appliqué, sur deux dossiers du scratchpad, sans toucher au fichier réel.

## Questions

**B.** CLAUDE.md dit encore qu'une propriété au type résolu faux « est perdue » et qu'il faut « abandonner le nom » (écart 2). Faut-il le corriger ? Je suggère une consigne courte qui remplace cette phrase par « Une propriété dont le type résolu est faux ne s'emploie pas : attendre et revérifier, le gel se résorbe en deux à quatre jours (entrée 59 des Limites connues). »

**C.** Dans « Points ouverts » de la page du lot, le motif « une déclaration neuve doit être juste du premier coup » contredit maintenant les risques connus (écart 2). Faut-il le retirer, et l'arbitrage sur les noms reste-t-il bloquant ? Je suggère de retirer le motif et de garder l'arbitrage bloquant pour une autre raison : un nom de propriété engage les partenaires de la fédération, et le renommer coûte plus cher qu'un verrou de quelques jours.

**D.** Le cas « session expirée » de `bin/wiki-api.sh` ne se teste qu'avec un fichier de cookies présent et périmé. Faut-il garder cette méthode, `SGDT_PRIVE` pointé sur un fichier vide du scratchpad, comme essai de référence du script ? Je suggère de la noter dans l'en-tête du script, en une ligne.
