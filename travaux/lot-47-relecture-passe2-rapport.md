# Lot 47 - Relecture de la conception au regard de la cible - rapport de la passe 2

Rédigé le 16 novembre 2026 par la conversation claude.ai "passe 2 sur 3 : l'ordre des lots" (l'architecte), au terme de ses échanges avec Cyril du même jour. Ce rapport est un texte fourni : l'exécuteur le verse tel quel.

Il fait suite au rapport de la passe 1, `lot-47-relecture-passe1-rapport.md`, dont il ne rejoue aucun arbitrage.

## 0. La question, la réponse, la méthode

La question posée : dans quel ordre mener les travaux, lots existants et chapitres du cahier des charges confondus, et quel sort donner à chacun des 47 lots ?

La réponse, en quatre points :
- Le critère proposé par la passe 1 (classer un lot par ce qu'il apprend au cahier des charges) ne suffit pas seul. Il devient le deuxième test d'un crible à quatre tests (section 1).
- Sur 47 lots : 14 sont clos sans suite, 12 poursuivis, 8 réduits, 10 suspendus, 1 laissé ouvert en attente, 1 absorbé par un autre, 1 versé au cahier des charges des piliers 2 et 3 (section 3). Aucun sujet n'est abandonné.
- Les deux cahiers des charges ont un plan, et chaque chapitre a sa place dans l'ordre (section 4).
- Huit prochains travaux sont ordonnés (section 5). Un ordre n'est pas un calendrier.

La méthode : les 47 pages de lot ont été lues en entier le 16 novembre 2026, leur état mesuré par l'API, et chaque sort tient à un motif écrit. Les coûts se disent en conversations et en consignes, d'après le nombre de fichiers de rapport que chaque lot a laissés dans `travaux/` : ce sont des repères, pas des mesures.

## 1. Le critère

### 1.1 Ce que le critère de la passe 1 classe mal

Analyse de l'architecte, acceptée par Cyril le 16 novembre 2026 (point 1).

- Le reste du lot 21. Sa conception est arrêtée et consignée depuis le 13 octobre 2026 ; ce qui reste apprend surtout à l'outil. Or les lots 7 et 46 en dépendaient en chaîne, et la deuxième question d'épreuve n'a aucun cas réel : aucune fiche ne porte de caractéristique. Le critère ne voit pas le verrou.
- Le lot 46, circuit d'eau. La passe 1 le rangeait dans l'usage réel qui n'apprend rien. Les deux premières questions d'épreuve citent pourtant ce cas ("pomper de l'eau", "débit, hauteur"). C'est un banc d'essai. Le vrai angle mort est le remplissage, par exemple les dates de plantation, les rangs et les photos qui restent au lot 9.
- La sauvegarde (lot 36). Angle mort confirmé : une ligne pour le cahier, et toute sa matière protégée.
- Les clôtures en retard. Angle mort à moitié : une clôture apprend au cahier. Celles des lots 6 et 8 ont touché la page Choix imposés par l'outil les 10 et 12 novembre 2026, et celle du lot 6 a fait remonter la règle d'entrée dans l'arbre fonctionnel ainsi que l'analyse du circuit d'eau. Ce que le critère ne voit pas, c'est que leur source s'efface.
- Les lots dont le coût croît avec le contenu : titres (41), vocabulaires (19), références (16).
- Ce qui passe dans le monde physique : une référence imprimée sur une étiquette survit à tout changement d'outil.

Deux limites de plus : le critère classe sans élaguer, alors qu'un lot de modèle coûte de 11 à 49 consignes ; et il ignore l'attente d'une réponse extérieure, qui ne coûte aucun quota.

### 1.2 Le crible retenu

Quatre tests, dans cet ordre :
1. Protéger. Le lot protège-t-il ce qui ne se refait pas, quel que soit l'outil : le contenu du wiki, un identifiant imprimé, une source qui s'efface ? Si oui, il passe d'abord, réduit à son plus petit geste.
2. Apprendre. Écrit-il une exigence ou un chapitre du cahier des charges ? De trois façons : directement ; comme banc d'essai, un cas réel qui éprouve une question ; comme verrou d'un lot qui apprend. Le rang suit celui de la question servie.
3. Coût du retard. Son coût croît-il à chaque page saisie ? Si oui, il passe avant la prochaine saisie en nombre, ou jamais.
4. Sinon, suspendre, motif et date écrits sur la page, jusqu'à ce qu'un cas réel rouvre le lot.

Règle de coupe : avant de poursuivre un lot, le réduire au plus petit périmètre qui donne la leçon.

Garde-fou sur le test 2 : un verrou ne compte que si le lot qu'il débloque figure dans les prochains travaux.

Ce que le crible classe mal à son tour : la valeur de vitrine. Les lots 14 et 15 sont suspendus, alors qu'ils pèseraient si le wiki devait convaincre un tiers par sa seule lecture.

### 1.3 Un fait qui change la lecture du test 4

Précisé par Cyril le 16 novembre 2026 (sa réponse au point 6) : ce wiki n'est pas seulement un terrain d'exploration. Il sera le logiciel en service, avec des données réelles dont l'inventaire d'outils, tant que la migration vers un autre outil n'est pas faite, et cette migration n'est pas proche. Le produit attendu reste le cahier des charges. Conséquence : l'usage en production compte comme un cas réel pour rouvrir un lot suspendu, et la saisie en nombre aura bien lieu ici, après la livraison du lot 21.

## 2. Les trois recommandations de la passe 1

Confirmées toutes les trois, avec des précisions. Appliquées sans objection de Cyril (points 2, 3 et 4).

R4, lot "transformation". Le lot 43 absorbe la nomenclature quantifiée du lot 7. Preuve : le fichier OWL (extraction du dossier de la passe 1, commit 58b6bf0) porte déjà une seule construction pour quatre usages. Sa classe CompositionRelation exige une quantité et une unité, et se décline en Composition_Item, Composition_ItemFamily, Consumption et Production. Deux précisions, tirées de la page "Remplacer un rayon sur une roue à moyeu moteur" :
- Composer n'est pas consommer. La réparation consomme un rayon et son écrou ; la roue se compose de ses rayons et a été achetée montée, si bien qu'aucune transformation connue ne peut porter sa composition. Un lot qui ne chiffrerait que les entrées d'une transformation ne traiterait pas la question "avec quelles pièces" pour un assemblage acheté.
- Une pièce ou un outil se désigne au niveau où on le connaît. La page nomme sa pièce au niveau organique, puis au niveau référencé pour l'intervention réelle, et l'un de ses quatre outils par sa seule fonction.
Une divergence reste à trancher avant l'ouverture du lot : la composition vit au niveau organique dans le fichier OWL, au niveau référencé sur le wiki. Le lot 7 garde la réception d'un achat et la quantité possédée. Sa propriété Max_flow est caduque depuis le 8 octobre 2026, le lot 21 ayant décidé une propriété par grandeur : la dépendance du lot 46 passe du lot 7 au lot 21.

R5, lot 31 réduit à sa première couche. Aucune question d'épreuve n'exige la compétence par domaine ni la confiance transitive. La seule qui parle de confiance se traite avec la source, le déclarant, la date et le nombre de "je l'ai déjà fait". Le déclarant d'une offre ou d'une entité va au cahier des piliers 2 et 3 ; le lot 31 garde la provenance d'une donnée du wiki, et dépend du lot 21.

R6, lot 30 versé au cahier des piliers 2 et 3, dépendance au lot 29 levée. Une exigence de plus pour ce cahier : les conditions d'accès portent sur un exemplaire, et les exemplaires vivent sur le wiki ; le cahier doit donc permettre de citer un exemplaire par une adresse qui dure. Cette décision d'adresse est aussi celle du lot 39 (vers quoi pointe le code d'une étiquette). Le lot 29 se réduit à une question posée à l'Assemblée Virtuelle.

## 3. Le sort des 47 lots

État mesuré le 16 novembre 2026 : 14 clos, 26 identifiés, 3 livrés, 4 ouverts (21, 24, 44, 47).

Clos, sans suite (14) : 1, 2, 3, 4, 5, 6, 8, 12, 13, 22, 27, 28, 33, 34.

| Lot | Sort | Motif |
|---|---|---|
| 7 Nomenclature et réception | réduit | Garde la réception d'un achat et la quantité possédée ; après le lot 43 |
| 9, 10, 11 | poursuivis | Restent livrés jusqu'à leur clôture, portée par le lot 45 |
| 14 Navigation | suspendu | L'exigence est écrite ; son coût ne croît pas avec le contenu |
| 15 Images | suspendu | Idem ; se rouvre quand la saisie de photos reprend en nombre |
| 16 Module de références | réduit | Détection des doublons seule, avant la saisie en nombre |
| 17 Arbre fonctionnel | suspendu | La question servie a déjà son emplacement ; à cadrer avec le lot 25 |
| 18 Domaines de pratique | suspendu | Attend le lot 19 |
| 19 Vocabulaire et multilingue | réduit | Règle pour le neuf ; le patron existe depuis le lot 21 |
| 20 External Data | suspendu | Attend la migration du serveur, sans date |
| 21 Grandeurs et unités | réduit | Livraison sur les trois valeurs déjà en production ; la liste complète des grandeurs sort |
| 23 Priorisation | suspendu | Sa page écarte un calcul sur petit effectif ; lié au lot 32 |
| 24 Adminsys autonome | ouvert, en attente | Rien d'exécutable avant la migration du serveur |
| 25 Axe taxonomique | poursuivi | Seul lot à porter la question des familles et variantes ; après le lot 21 |
| 26 Renommage des propriétés | suspendu | La règle vaut déjà pour le neuf |
| 29 Alignement PAIR | réduit | Une question à l'Assemblée Virtuelle |
| 30 Mise à disposition | versé au cahier | Piliers 2 et 3 ; page à l'état "abandonné", avec renvoi |
| 31 Qualification et confiance | réduit | Provenance d'une donnée ; dépend du lot 21 |
| 32 Suivi des tâches | suspendu | Gros lot ; une liste suffit à l'ordre arrêté |
| 35 Récupération des fichiers | absorbé | Par le lot 36 ; page à l'état "abandonné", avec renvoi |
| 36 Sauvegarde du wiki | poursuivi | Élargi : absorbe le lot 35, devient régulière |
| 37 Consultation hors ligne | suspendu | Une sauvegarde restaurée sur le miroir se lit déjà sans réseau |
| 38 Écriture hors ligne | suspendu | Exigence de premier rang pour la cible ; gros lot ici |
| 39 Format des étiquettes | réduit | Sa décision structurante seule, prise avec le cahier des piliers 2 et 3 |
| 40 Wiki privé CWL | poursuivi | Après la livraison du lot 21, pour ne porter le modèle qu'une fois |
| 41 Convention de titre | réduit | D'abord la règle des pages neuves, avant la saisie en nombre |
| 42 État de conception | poursuivi | Petit lot ; à cadrer avec le lot 31 |
| 43 Modes opératoires | poursuivi | Élargi à la nomenclature quantifiée ; dépend du lot 21 |
| 44 Choix contraints et clôtures | poursuivi | Travaux visibles ; reste sa clôture |
| 45 Clôture des lots 9 à 11 | poursuivi | Après la passe 3, une clôture à la fois |
| 46 Circuit d'eau | poursuivi | Banc d'essai ; dépend du lot 21 |
| 47 Relecture de la conception | poursuivi | Passe 3 à mener |

Sur le wiki, chaque lot touché porte en tête de sa page une section "Place dans la feuille de route". Les états "abandonné" des lots 30 et 35 disent seulement que ces lots ne seront pas menés à part : l'énumération des états n'a pas d'autre valeur pour le dire.

Relations modifiées : 7 dépend de 21 et 43 ; 31 dépend de 21 ; 37 dépend de 36 ; 40 dépend de 12 et 21 ; 43 dépend de 21 ; 46 dépend de 21 ; 30 et 36 ne dépendent plus de rien.

## 4. Le plan des cahiers des charges

Cahier du logiciel, tenu sur le wiki, quatre chapitres :
1. Le tableau d'épreuve. Écrit : section 1 du rapport de la passe 1. Révisé quand un lot change un verdict.
2. Le modèle de référence, table à quatre colonnes (schéma de 2017, fichier OWL, wiki, cible). À écrire, au rang 5.
3. Les exigences nées de l'outil. En cours sans le dire : la page Choix imposés par l'outil, la section 2.5 du rapport de la passe 1, les Limites connues. Chaque clôture y verse.
4. Les fonctions hors modèle. Ajout de la passe 2 : une liste de renvois vers ce que les lots suspendus ont tranché (navigation, images, sources externes, hors ligne, sauvegarde, étiquettes, fédération, suivi des tâches). Écrite avec le chapitre 2.

Cahier des piliers 2 et 3, tenu en fichier dans le dépôt, huit chapitres, ceux de la recommandation R8 de la passe 1. État : le chapitre 1 est prêt ; les chapitres 3 et 8 sont des transcriptions d'arbitrages rendus ; les chapitres 2, 4, 5 et 6 sont à écrire ; le chapitre 7, les volumes attendus, attend Cyril. Le chapitre 2 reçoit la matière du lot 30 et s'éprouve sur trois cas réels à choisir par Cyril ; le chapitre 4 demande la décision d'adresse.

Aucun lot permanent ne porte un cahier : chaque chapitre naît d'un lot qui se clôt.

## 5. L'ordre des prochains travaux

Accepté par Cyril le 16 novembre 2026 (point 8).

| Rang | Travail | Ce qu'il débloque | Coût (repère) |
|---|---|---|---|
| 1 | Sauvegarde de précaution, par correctif | Rien en aval : protège la matière des cahiers | 1 session locale, 1 à 2 consignes |
| 2 | Clôture du lot 44 | Le lot 45 ; une mesure fraîche du coût d'une clôture | 1 à 4 consignes |
| 3 | Passe 3 du lot 47 | Le coût des ouvertures et clôtures suivantes | 1 conversation |
| 4 | Cahier des piliers 2 et 3, envoyé à Open Atlas | Le choix du support de ces piliers ; la matière du lot 30 | 1 conversation, 1 à 2 consignes |
| 5 | Modèle de référence | La cible du lot 43 ; fournisseurs en organisations ; le lot 25 | 1 conversation, 1 à 2 consignes |
| 6 | Lot 21, livraison réduite | Les lots 46, 43, 7, 31, 40 | 11 à 16 consignes, clôture en plus |
| 7 | Lot 46, circuit d'eau | Premier cas réel ; matière d'épreuve du lot 43 | 6 à 12 consignes |
| 8 | Lot 43 élargi | Les questions sur la fabrication, la réparation, l'entretien | 26 à 49 consignes |

Motif de l'ordre : les deux documents (rangs 4 et 5) sont le produit, coûtent peu, et l'un déclenche une attente extérieure qui ne consomme rien. Le lot 21 est le poste le plus incertain : 49 tâches déjà.

En marge, sans rang : le lot 36 après la passe 3 ; le lot 16 réduit et la première tâche du lot 41 avant la saisie en nombre de l'inventaire ; les fournisseurs et fabricants en organisations après le rang 5 ; les clôtures des lots 9, 10 et 11 après la passe 3 ; le lot 24 en attente.

Viennent ensuite : le lot 25, le lot 7 réduit, le lot 31 réduit avec le lot 42, le lot 40 après la livraison du lot 21.

## 6. Arbitrages

Tous du 16 novembre 2026. Les numéros sont ceux des points de la conversation de la passe 2.

Rendus par Cyril :
- Point 1 : le crible à quatre tests, accepté.
- Point 8 : l'ordre des prochains travaux, accepté sur proposition de l'architecte.
- Point 6 : Cyril précise que le wiki sera le logiciel en service (section 1.3) et s'en remet à l'architecte pour le chemin.
- Point 9 : la migration du serveur n'a pas de date. Cyril attend, tant que d'autres travaux avancent sans elle.
- Point 10 : aucun dump plus récent que celui du 9 octobre 2026. Cyril souhaite une sauvegarde très bientôt, puis régulière et automatique.
- Point 11 : le quota permet de lire davantage.

Appliqués par leur décision par défaut, sans objection de Cyril : points 2 (R4), 3 (R5), 4 (R6), 5 (tableau des sorts), 7 (plan des cahiers).

Décidés par l'architecte, sur la délégation du point 6 et les réponses 9 et 10, et soumis à Cyril le même jour (points 12 et 13) : le lot 40 est poursuivi après la livraison du lot 21, et non suspendu ; les lots 16 et 41 se mènent, réduits, avant la saisie en nombre ; le lot 19 se réduit à une règle pour le neuf ; le lot 36 n'est pas réduit, il devient régulier ; le lot 24 reste ouvert en attente.

## 7. Ce qui n'a pas pu être vérifié

- L'état du lot 44 vu de sa conversation : ses travaux sont visibles, sa page dit encore "ouvert".
- L'existence et la lisibilité des conversations des lots 9, 10, 11, 21 et 24.
- Les rapports de `travaux/` : comptés par leur nom, non lus. 108 fichiers sur 350 ne portent aucun numéro de lot. Les coûts sont donc des repères.
- Les pages de suivi, hors Notes en attente de rangement : titres seulement.
- Le nombre de vocabulaires encore en chaînes (lot 19) et de pages de fournisseur manquantes.
- Valueflows, PAIR, Open Know-Where, Communecter, QUDT, NextGraph : rien de remesuré depuis la passe 1.
- Le serveur : ni sa migration, ni ce qui y est sauvegardé.

## 8. Ce qui a été vérifié, et comment

Toutes les mesures sont du 16 novembre 2026, par l'API en lecture anonyme.

- État des 47 lots : action=ask, recoupé avec le paramètre d'état du wikitexte des 47 pages (identique partout) et avec smwbrowse sur douze lots.
- Dernière modification du wiki : 16 novembre 2026 à 5 h 48 UTC, la création de la page du lot 47. Dépôt au commit b019405.
- Lot 21 : 1 dimension, 3 unités, 7 rôles, aucune page de grandeur, aucune propriété de grandeur parmi 163 pages de propriété, aucun sous-objet de caractéristique, 21 propriétés d'essai. Dernière écriture étiquetée le 19 octobre 2026. 49 fichiers de rapport.
- Lot 44 : la page Choix imposés par l'outil existe, la procédure de clôture d'un lot a été complétée le 8 novembre 2026, la page Procédure de clôture d'une conversation existe, les lots 1 à 6 et 8 sont clos, le fichier controle-de-fin-de-session.md n'est plus dans le dépôt.
- Fichiers téléversés : 100 fichiers, 453,8 Mo, le dernier du 4 novembre 2026. La page du lot 35 en comptait 79 pour 392,5 Mo le 10 octobre.
- Titres : 94 pages de l'espace principal portent un tiret cadratin, dont les 47 pages de lot. 40 valeurs de relation citent un titre de lot, sur 22 pages.
- Effectifs : 27 items fonctionnels, 49 organiques, 42 référencés, 50 physiques, 4 organisations, 15 lieux. Supplier sur 35 items référencés, Manufacturer sur 3, Part_of sur aucun.
- Fichiers de rapport par lot, d'après leur nom : 2 à 6 pour un petit lot (lots 33, 34, 27), 11 à 16 pour un lot de modèle (lots 28, 13, 12, 22), 26 à 49 pour un gros lot (lots 9, 11, 21). Le lot 44 en compte 22, pour sept clôtures et trois travaux.
- Pages lues en entier : les 47 pages de lot, Gestion des lots, Notes en attente de rangement, le modèle des pages de lot, la page du mode opératoire du rayon. Fichiers lus : methode-de-travail.md, CLAUDE.md, le rapport de la passe 1, les parties A, B, D (en partie), E1, E2, E6 à E8 et F de son dossier.

## 9. Décisions mineures prises par l'architecte

- La section ajoutée aux pages de lot s'appelle "Place dans la feuille de route" et se place en tête, sous le modèle.
- Une dépendance vers un lot clos n'est pas retirée des paramètres : la page dit qu'elle est levée de fait.
- La page Notes en attente de rangement n'est pas touchée : ses deux notes devenues sans objet sortiront quand le lot du cahier des piliers 2 et 3 aura sa page.
- L'ordre s'écrit en liste sur la page du lot 47, avec un renvoi depuis Gestion des lots. Aucune propriété de rang.

## 10. Relevé pour la passe 3

Non traité ici, à reprendre dans la passe 3 :
- Le lot 45 a-t-il besoin d'être un lot pour porter trois clôtures ?
- Une clôture doit-elle mettre à jour les chapitres 1 et 2 du cahier du logiciel ?
- Le lot 44 a laissé 22 fichiers de rapport et 62 écritures étiquetées sur le wiki.
- Trois réponses de cette conversation ne sont pas arrivées à Cyril, qui a dû renvoyer son message. Les tours longs, où l'architecte lit beaucoup avant de répondre, sont en cause : une réponse courte d'abord, le travail lourd ensuite.
