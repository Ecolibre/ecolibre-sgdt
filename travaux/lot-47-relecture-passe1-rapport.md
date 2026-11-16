# Lot 47 - Relecture de la conception au regard de la cible - rapport de la passe 1

Rédigé le 16 novembre 2026 par la conversation claude.ai "passe 1 sur 3 : la conception" (l'architecte), au terme de ses échanges avec Cyril du même jour. Ce rapport est un texte fourni : l'exécuteur le verse tel quel.

Pièce jointe au même commit : `lot-47-relecture-passe1-dossier.md`, le dossier de la passe (cible, questions d'épreuve, fil de 2022, extractions de l'ontologie, du wiki et des lots).

## 0. La question, la réponse, la méthode

La question posée : la conception actuelle, c'est-à-dire l'ontologie de 2017 et le modèle porté par le wiki, peut-elle accueillir la cible du service sans être refaite ? Consigne de lecture de Cyril : on juge la conception, pas le remplissage. Un item absent n'est pas un défaut ; un emplacement absent en est un.

La réponse :
- Oui pour le pilier 1 (gestion de données techniques). Les quatre niveaux, fonctionnel, organique, référencé, physique, tiennent face aux dix-neuf questions d'épreuve. L'architecte n'a trouvé aucun cas concret qui les mette en défaut.
- Non en l'état pour les piliers 2 (cartographie des ressources) et 3 (réseau d'échange), mais sans rien refaire. Tout ce qui manque se trouve du côté de l'acteur, que l'ontologie de 2017 range sous "ZeMiscConcept" (Entity, Location, Skill) et qui est devenu le centre de la cible : treize questions sur dix-neuf passent par lui.

La méthode : pour chaque question d'épreuve, suivre le chemin dans l'ontologie, puis sur le wiki, et conclure présent, partiel ou absent. Chaque fait porteur d'une conclusion a été vérifié sur sa source le 16 novembre 2026 (section 8).

Vocabulaire : "item industriel" dans l'ontologie et dans le fil de 2022 désigne le niveau que le wiki appelle "item référencé".

## 1. Tableau d'épreuve

Ce tableau est écrit pour devenir le premier chapitre du cahier des charges du logiciel. Bilan : 2 emplacements présents, 12 partiels, 5 absents.

| Question | Chemin dans l'ontologie de 2017 | Chemin sur le wiki | Verdict, et ce qui manque |
|---|---|---|---|
| Q1 "J'ai un besoin : quelles solutions existent ?" | FunctionalItem (composes) -> satisfiedBy -> OrganicItem | Functional item, Part_of, inverse de Realizes_function | Présent |
| Q2 "Laquelle convient à mon cas chiffré ?" | Requirement (Be/Do, mini-maxi, cible-tolérance) sur le fonctionnel, Specification sur l'organique | Sous-objet de caractéristique du lot 21, défini mais porté par aucune page ; Max_head, Power_rating au référencé | Partiel. Le lien "telle spécification satisfait telle exigence" (fulfils) est déclaré et jamais câblé ; aucune place pour les chiffres de l'usager |
| Q3 "Plusieurs tailles ou variantes : laquelle ?" | OrganicItemFamily, hasMember, Parameterization | Rien : facettes et diamètres seulement, lot 25 identifié | Partiel. Présent dans l'ontologie, absent du wiki |
| Q4 "Comment me le procurer ?" | IndustrialItem -> industrializes ; Production et Consumption (quantité, unité) ; deliveredBy Entity | Referenced item : Supplier, Procurement_route, Design_source, Part_of sans quantité | Partiel. Pas de quantité sur le wiki, pas d'emplacement pour le plan et sa licence, le fournisseur n'est pas une organisation |
| Q5 "Comment le fabriquer, le réparer, l'entretenir ?" | IndustrialTransformation : durée, coût, une seule MachineModel, entrées et sorties | Une page sans classe ; procédés marqués au fonctionnel ; lot 43 identifié | Partiel. Ni compétence, ni réparation, ni entretien, ni texte d'instruction |
| Q6 "Qui, près de chez moi, a l'outil ou le savoir-faire, et à quelles conditions ?" | MachineInstance -> hostedBy Entity -> localizedBy Location ; Skill sans aucune relation | Physical item -> Owned_by, Located_at (coordonnées), Instance_of ; page Procédés et outils | Partiel. Outil : présent. Savoir-faire et conditions d'accès : absents |
| Q7 "Qui peut s'occuper de la fabrication de mon projet ?" | Aucun concept de projet ni de prestation | Aucun | Absent |
| Q8 "Qui a déjà fabriqué quoi ?" | Aucun lien direct entre une entité et un item fabriqué. Le schéma de 2017 dessine une traçabilité complète au niveau physique, absente du fichier OWL (section 2.4) | Physical item -> Instance_of ; rien sur qui a fabriqué | Absent. L'emplacement retenu est léger : une déclaration "je l'ai déjà fait" (section 4, arbitrage du point 12) |
| Q9 "Qui peut me le fabriquer et me le livrer, et en a-t-il le droit ?" | deliveredBy Entity ; rien sur le statut | Organisation : quatre propriétés descriptives | Absent |
| Q10 "D'où vient cette information, puis-je m'y fier ?" | Rien | Characteristic_mode, Documentation_source (végétal), historique des pages ; lot 31 identifié | Absent, hors deux amorces locales |
| Q11 "Qui le propose, et contre quoi ?" | Entity -> offers -> OrganicItem : un lien nu, sans contrepartie | Rien | Absent |
| Q12 "Je ne trouve pas : où le dire, en public ou en privé ?" | Entity -> needs -> OrganicItem, seulement si l'item existe | Wanted_by, une seule valeur | Partiel. Besoin en langage ordinaire et visibilité privée : absents |
| Q13 "Voici ce que j'ai, ce que je sais faire : qui en a besoin ?" | Croisement offers et needs sur l'organique | Owned_by croisé avec Wanted_by par Instance_of | Partiel. Rien pour "disponible à céder", rien pour le savoir-faire |
| Q14 "Quelles boucles d'échange peut-on fermer ?" | Graphe offers et needs, limité aux items | Demandes seulement | Partiel. Pas d'offre, pas de service, pas de monnaie acceptée |
| Q15 "Comment contribuer pour faciliter mon propre projet ?" | needs d'un fournisseur lisible ; aucun déclarant | Wanted_by ; fournisseurs en pages nues | Partiel. Rien ne dit qui déclare au nom de qui |
| Q16 "Que me manque-t-il pour ce projet ?" | Entrées et machines requises ; Entity n'est reliée à aucun PhysicalItem | Owned_by présent ; pas de quantité, pas de projet | Partiel |
| Q17 "Quand faut-il le faire ?" | Rien | Périodes de la facette végétale, Planting_date | Partiel. Rien pour l'entretien périodique d'un objet |
| Q18 "Qu'est-ce que je possède, où, dans quel état ?" | Presque rien | Inventory_ref, Located_at, Contained_in, Storage_rank, Service_status, Owned_by | Présent. Le wiki a dépassé l'ontologie |
| Q19 Scénario de démarchage d'une entité | offers et needs, sans déclarant | Organisation (description libre), exemplaires, Wanted_by | Partiel. Ouverture à une monnaie, achats souhaités hors items existants, déclaration pour un tiers : absents |

Le texte complet des questions est en partie B du dossier.

## 2. Diagnostic

### 2.1 Ce qui manque (emplacements)

- L'acteur complet : personne ou organisation, statut et capacité à livrer, canal de mise en relation. Le wiki a la classe Organisation et prévoit une classe déduite Acteur avec une future classe Personne (page Catégorie:Organisation) ; la page Catégorie:Acteur n'existe pas.
- La proposition, offre ou demande, comme objet à part entière. C'est le manque central (Q6, Q7, Q9, Q11 à Q15, Q19).
- La compétence et la prestation : Skill est une classe orpheline de l'ontologie, rien sur le wiki (Q5, Q6, Q7, Q13).
- Le projet : un ensemble de besoins chiffrés d'un acteur (Q7, Q16). Cyril l'avait noté le 1er septembre 2026 dans les Notes en attente de rangement.
- Le déclarant et la source d'une affirmation (Q10, Q15, Q19).
- La déclaration "je l'ai déjà fait" entre un acteur et un item (Q8).

### 2.2 Ce qui est mal placé

- Le souhait porté par l'item (Wanted_by) ou par un lien nu (needs, offers). Une demande doit pouvoir viser n'importe quel niveau, y compris une fonction pour un besoin en langage ordinaire ; l'ontologie ne la laisse viser que l'organique.
- Le coût, entier à unité unique, posé sur la transformation type de l'ontologie. Un prix est le fait d'une offre, et la cible le veut mixte.
- Le fournisseur et le fabricant, pages nues à côté d'Organisation alors que ce sont des acteurs (entrées 12 et 38 des Limites connues).
- Sourcing_year et Supplier au niveau référencé : ils décrivent un achat, pas le moyen de se procurer.
- Le cœur industriel de 2017 (transformation, consommation, production), "le plus important" selon le fil de 2022, n'a aucun équivalent sur le wiki.

### 2.3 Ce qui est juste et ne doit pas bouger

- Les quatre niveaux et leur chaîne.
- La séparation type, modèle, exemplaire, pour les items comme pour les machines.
- Exigence, spécification, mesure, et le sous-objet de caractéristique qui les porte.
- Lieux et organisations hors de la chaîne.
- Les facettes, invention du wiki absente de l'ontologie. Une recette s'y loge comme une transformation avec ses ingrédients, un programme embarqué comme une source de conception rattachée à un item référencé.
- Appartenance et localisation portées par l'exemplaire.
- La règle "on modélise à partir de cas réels, pas avant".
- Le critère d'entrée dans l'arbre fonctionnel, "une fonction entre dans l'arbre si elle survit au changement de solution" (lot 17, tranché le 9 août 2026). Il admet une fonction à solution unique, et même sans solution connue : c'est ce que demande Q12.

### 2.4 Le schéma de 2017 en dit plus que le fichier OWL

Les figures du fil de 2022 (pages 6 et 7 du PDF) relient PhysicalItem à IndustrialItem (concretizes), PhysicalItem à PhysicalTransformation (has input, has output), PhysicalTransformation à IndustrialTransformation (realises) et à MachineInstance (executed by). Dans le fichier OWL, concretizes est déclarée sans domaine ni emploi, "input", "output" et "realises" n'ont aucune occurrence, et PhysicalTransformation n'apparaît que pour sa déclaration. Le niveau physique n'est donc pas un oubli de conception : c'est une conception dessinée et jamais écrite dans le fichier.

Deux constats confirmés par les mêmes figures : la transformation industrielle n'y est reliée qu'à un modèle de machine, la compétence n'apparaissant que dans la réponse de Cyril du 7 décembre 2022 ; Entity, Location et Skill ne figurent sur aucune figure des huit pages lues.

Conséquence : le modèle a trois sources, le schéma de 2017, le fichier OWL et le wiki, qui divergent deux à deux.

### 2.5 Ce qui ne tient qu'à l'outil

À porter au cahier des charges comme exigences du logiciel, et non comme défauts du modèle :
- des relations à plusieurs termes de plein droit (les sous-objets en sont le contournement) ;
- des droits d'accès par objet (entrée 48 des Limites connues : Lockdown ne protège rien). Cette exigence unique couvre la demande privée et la confidentialité par item ;
- des contraintes réellement appliquées (domaine, portée, cardinalité ne sont que des annotations sur le wiki) ;
- le parcours de graphe au-delà de quatre sauts (entrée 68) et la négation (entrée 23) ;
- les calculs de distance et de cycles (Q6, Q14).

## 3. Recommandations

Huit recommandations, dans leur état après arbitrage. Les effets sur la feuille de route sont des propositions pour la passe 2 : la passe 1 ne modifie aucune page de lot existante.

R1 - Ne pas construire les piliers 2 et 3 dans Semantic MediaWiki. Accepté par Cyril (point 3). On arrête toute modélisation de ces piliers sur le wiki et on produit leur cahier des charges, neutre vis-à-vis de l'outil, envoyé à Open Atlas tel quel. Retire : le lot 30 comme lot de modélisation sur le wiki (il devient un chapitre), la note "Couche sociale au-dessus du wiki" du 5 octobre 2026, le retournement de Wanted_by. Coût : un document, aucune écriture de modèle.

R2 - La proposition devient un objet, décrit dans les termes de Valueflows. Appliqué sans objection (point 4). Une offre ou une demande porte : qui, dans quel sens, quoi (item de n'importe quel niveau, prestation ou texte libre), contre quoi (plusieurs contreparties), conditions, zone, visibilité, déclarant, date. Le prix et le projet s'y logent. On ne reprend de Valueflows que la couche des propositions : sa couche d'évènements économiques trace les échanges, ce que Cyril a écarté. Remplace : needs et offers de l'ontologie, Wanted_by, l'objet du lot 30. Coût : rédaction, plus une épreuve sur trois cas réels à choisir par Cyril.

R3 - Le fournisseur et le fabricant sont des organisations. Appliqué sans objection (point 5), puis réduit (point 17) : le concept d'acteur unique existe déjà comme intention sur le wiki, la recommandation se limite à faire viser des organisations par Supplier et Manufacturer. Les personnes n'entrent pas sur le wiki public ; elles vivent sur la plateforme à comptes. Coût : un petit lot de migration, 35 items référencés portent Supplier et 3 portent Manufacturer.

R4 - Un seul lot "transformation", qui fusionne le lot 43 et la nomenclature quantifiée du lot 7. Appliqué sans objection (point 6), motifs revus (point 16) : Q4, Q5 et Q16. La transformation type porte des entrées chiffrées, des ressources requises et une durée. Changements d'ontologie que cela suppose : executedBy passe de "exactement une MachineModel" à plusieurs ressources, machine ou compétence. L'application datée d'une opération sur un exemplaire ne repose que sur l'arbitrage du 13 octobre 2026 du lot 43 ; elle sert l'entretien, pas Q8. La réception d'une facture reste au lot 7. Coût : le lot le plus lourd du pilier 1, dépendant du lot 21.

R5 - Réduire le lot 31 à sa première couche. Appliqué sans objection (point 7). On garde "qui déclare, d'après quelle source, quand", exigé par Q10, Q15 et Q19. La confiance transitive entre pairs n'est exigée par aucune question d'épreuve : elle est consignée avec ce motif, à rouvrir sur un cas réel. Coût : nul, c'est un retrait.

R6 - Lever la dépendance du lot 30 envers le lot 29. Appliqué sans objection (point 8). L'alignement visé pour les piliers 2 et 3 devient Valueflows ; PAIR reste une question posée à l'Assemblée Virtuelle. Coût : nul.

R7 - Le modèle de référence vit dans le cahier des charges. Accepté par Cyril (point 9), complété (point 15). Le fichier OWL n'est pas tenu à jour en parallèle ; il sera réécrit à la fin. Le chapitre 2 du cahier des charges est une table de correspondance à quatre colonnes : schéma de 2017, fichier OWL, wiki, cible. Coût : une conversation, les extractions D et E du dossier existent. Reste à savoir avec qui l'ontologie sera réécrite le moment venu.

R8 - Plan du cahier des charges macroscopique des piliers 2 et 3, pour Open Atlas. Appliqué sans objection (point 10). Huit chapitres :
1. Les questions d'épreuve Q6 à Q16 et Q19, telles quelles.
2. Les objets : acteur, lieu, ressource, compétence, proposition, projet, avec leurs champs.
3. Les règles : pas de trace des transactions, pas de moyen de paiement, comptes sans coordonnées publiées, visibilité publique ou privée, prix mixte, déclaration pour un tiers.
4. La liaison avec le SGDT : la plateforme cite les items du wiki par leur adresse et les lit par l'API.
5. Les calculs attendus : rapprochement entre offre et demande, boucles, distance.
6. Les questions à Open Atlas : quels éléments existent déjà, leur modèle de données, l'export, l'hébergement, la maintenance, la licence.
7. Les volumes attendus.
8. Ce qui n'est pas demandé.

Sur une meilleure idée qu'Open Atlas : l'architecte n'en a pas de vérifiée. Sa seule proposition est de ne pas choisir l'outil avant leur réponse. Une feuille de route hREA de mars 2026 cite Bonfire comme plateforme du Fediverse portant Valueflows : piste non examinée.

## 4. Arbitrages de Cyril

Rendus le 15 novembre 2026, avant la passe (règles du jeu) :
- Tout est contestable, preuve à l'appui : un cas concret, pris dans les questions d'épreuve, que le choix contesté empêche de traiter. Les quatre niveaux sont tenus pour acquis sauf preuve de ce genre.
- Semantic MediaWiki est un support temporaire, terrain d'exploration dont le produit attendu est un cahier des charges ; la migration envisagée est NextGraph quand il sera mûr.
- Pour les piliers 2 et 3, le support est ouvert.
- Le service ne garde pas la trace des transactions et ne passe pas par un moyen de paiement d'Écolibre.
- La mise en relation passe par une plateforme à comptes, sans obligation de publier ses coordonnées.

Rendus le 16 novembre 2026, dans la conversation de la passe 1 (les numéros sont ceux des points de cette conversation) :
- Point 3 : arrêt de la modélisation des piliers 2 et 3 sur le wiki, accepté.
- Point 9 : le modèle vit dans le cahier des charges, avec une table de correspondance, accepté.
- Point 12 : "qui a déjà fabriqué quoi" se traite comme sur un site de recettes, en cochant "je l'ai déjà fait". Beaucoup plus simple qu'une traçabilité de fabrication.
- Point 16 : cette déclaration est un lien direct entre un acteur et un item. Rien n'y est obligatoire ; la date, la machine et l'exemplaire restent des champs que l'on peut remplir. Elle sert aussi Q10 : un plan déjà réalisé par plusieurs acteurs inspire davantage confiance.
- Point 13 : un contributeur peut déclarer une offre, un besoin ou une entité pour le compte d'une organisation, avec la mention "déclaré par X, non confirmé". Un particulier ne se déclare que lui-même. Motif de la limite, signalé par l'architecte sans valeur d'avis juridique : les ressources d'un particulier sont des données personnelles.
- Point 14 : le statut d'un acteur et sa capacité à livrer (peut facturer, est assuré) sont déclarés par lui, avec leur déclarant et leur date, sans vérification par Écolibre.
- Points 17 et 18 : confrontation avec la section 10 et classement de la tension de règle, acceptés (section 5).
- Point 19 : le fil de 2022 et les sections 1 à 6 du texte de cible vont dans le dépôt public ; ses sections 7 à 9 et les réponses de Cyril du 15 novembre 2026 n'y vont pas.

Points appliqués par leur décision par défaut, sans objection de Cyril : 1 (tableau), 2 (diagnostic), 4 (R2), 5 (R3), 6 (R4), 7 (R5), 8 (R6), 10 (R8), 15 (schéma de 2017 comme troisième source).

## 5. Confrontation avec la section 10 du texte de cible

La section 10 est une analyse antérieure de Claude, du 14 novembre 2026, corrigée par la conversation de cadrage. Elle a été retenue jusqu'au premier diagnostic pour ne pas l'orienter.

Ce qui concorde :
- "Base" recouvre deux choses. Les quatre niveaux sont la base du pilier 1, pas celle du projet.
- Les trois entités de la section 10 (demande, acteur, offre) sont dans le diagnostic. Les questions d'épreuve en exigent trois de plus : la compétence, le projet, le déclarant.
- Les corrections 1 à 3 de la conversation de cadrage sont confirmées par les mesures du 16 novembre 2026 (section 8).

Ce que la confrontation a fait changer : R3. L'architecte avait présenté "un seul concept d'acteur" comme une nouveauté, alors que la page Catégorie:Organisation déclare déjà Acteur comme classe déduite.

Deux écarts maintenus :
- Demande et offre sont deux entités dans la section 10, un seul objet à deux sens ici. Motif : une boucle d'échange (Q14) compare ce que l'un offre à ce que l'autre demande ; il faut la même forme des deux côtés.
- La section 10 situe ces entités "au contact du niveau référencé". Une demande doit pouvoir viser n'importe quel niveau. Le durcissement du niveau référencé ne bloque donc pas leur conception.

Sur la position de Cyril rapportée en section 10 ("le projet n'est pas assez mûr sur cette base pour développer dès maintenant les autres aspects") : l'analyse de l'architecte est qu'elle est juste pour la construction, rien des piliers 2 et 3 ne se construisant maintenant, et qu'elle ne vaut pas pour la conception, leur cahier des charges pouvant s'écrire dès maintenant sans rien coûter au wiki.

La tension de règle annoncée par la section 10 n'existe pas sur le wiki. La phrase "on ne crée un niveau que là où il y a un vrai choix" ne se trouve que dans `travaux/sgdt-etat-des-lieux.md`, où elle est à tenir pour périmée. Elle est absente de Catégorie:Functional item et du Guide de saisie, lus en entier ; la recherche plein texte ne la trouve pas, mais son index est partiel (entrée 35 des Limites connues), ce qui interdit d'affirmer qu'elle n'est sur aucune page. Ce qui reste est du remplissage : 35 items organiques sur 49 ne réalisent aucune fonction.

Les pratiques sans objet : pas de changement. L'arbre fonctionnel nomme déjà des actes (les cinq procédés), et l'ontologie n'oblige pas une transformation à produire un item.

## 6. État des standards, vérifié le 16 novembre 2026

- Valueflows : son journal des versions porte une 1.0.0-rc.1 de janvier 2026, qui ajoute le moyen d'échange. Sa classe Proposal couvre les offres et demandes publiées, contrepartie attendue comprise. C'est une version candidate, pas encore une 1.0. Retenu pour la proposition (R2).
- Data Food Consortium : vivant, dernier dépôt de l'ontologie sur AgroPortal en janvier 2026, mais propre aux plateformes alimentaires. Écarté comme socle.
- Open Know-Where : non remesuré. Le lot 30 a mesuré le 6 septembre 2026, sur sa release 2, qu'il ne porte ni le prêt ni les compétences.
- PAIR : état actuel non établi. Seul indice, qui porte sur un réutilisateur et non sur PAIR : le projet Carto4CH s'en est détaché à l'été 2023 au profit de sa propre ontologie.
- NextGraph : encore en alpha d'après ses diapositives de FOSDEM 2026. Rien n'a été testé.

## 7. Ce qui n'a pas pu être vérifié

- Les fonctions actuelles de Communecter : rien de mesuré au-delà de la note de Cyril du 5 octobre 2026.
- Open Know-How et Open Know-Where : non remesurés.
- L'ontologie des unités et grandeurs, importée par le fichier OWL : non lue.
- Les pages 9 à 32 du fil de 2022 : le PDF fourni n'en porte que les huit premières.
- Des pages de lot, seules celles des lots 7, 17, 25, 28, 30, 31, 43 et 46 ont été lues, et pour la plupart leur début seulement (objet et arbitrages).
- Les trois cas réels sur lesquels éprouver la proposition restent à choisir.

## 8. Ce qui a été vérifié, et comment

Toutes les mesures sont du 16 novembre 2026.

Ontologie : fichier `ontologie/OSE_BusinessOntology/OSE_BusinessOntology.owl` de la branche main, au commit 58b6bf0 du 13 novembre 2026, relu par rdflib. 1 470 triplets, comme dans l'extraction du dossier.
- Skill n'est citée par aucune propriété ni restriction.
- PhysicalItem, PhysicalTransformation, PhysicalCapability, PhysicalParameter et PhysicalProperty n'ont aucune restriction.
- executedBy, sur IndustrialTransformation, vaut "exactement 1, seulement MachineModel".
- offers et needs, sur Entity, ne visent que OrganicItem. Entity n'a que quatre restrictions : localizedBy, hosts, offers, needs.
- concretizes, fulfils, emits, receives, orders et delivers sont déclarées sans domaine ni emploi.
- Aucun libellé, aucun commentaire, aucun individu nommé.

Wiki, par l'API en lecture anonyme :
- Effectifs par action=ask : 27 items fonctionnels, 49 organiques, 42 référencés, 50 physiques, 4 organisations (AliExpress, Amazon, CWL, Ecolibre), 15 lieux, 46 lots.
- Une seule valeur de Wanted_by. Design_source et Part_of au niveau référencé : aucune valeur. Characteristic_mode : aucune page. Service_status : un exemplaire. Realizes_function : 14 items organiques sur 49.
- Les 163 pages de propriété ont été listées : aucune ne porte compétence, offre, prix, monnaie, contact, personne, statut juridique, durée ou étape.
- Premières révisions : Catégorie:Organisation, Attribut:Owned by et Attribut:Wanted by datent du 25 août 2026. Supplier et Manufacturer sont de type Page, Procurement_route de type Text.
- Pages lues en entier ou par section : Notes en attente de rangement, Récapitulatif technique (sections 5, 8, 9, 16, 17), Catégorie:Organisation, Catégorie:Functional item, Guide de saisie, Procédure d'ouverture d'un lot, et les pages de lot citées en section 7.
- Dernière modification du wiki constatée : 12 novembre 2026 à 23 h 24 UTC. Aucun lot ne porte le numéro 47.

Fil de 2022 : les huit pages du PDF fourni par Cyril, figures comprises.

Limite de ces mesures : les effectifs viennent d'action=ask seul, sans recoupement par smwbrowse. Ils concordent avec ceux du dossier, mesurés la veille par une autre conversation.

## 9. Décisions mineures prises par l'architecte

- Un seul verdict par question, l'écart entre ontologie et wiki étant dit dans la dernière colonne.
- La numérotation Q1 à Q19 du dossier est conservée.
- Aucun classement des lots au-delà de ce que chaque recommandation retire : c'est l'objet de la passe 2.
- Dans la version du dossier versée au dépôt, la dernière phrase du quatrième point de la section 2 du texte de cible a été retirée, au même motif que sa section 8, qui reste hors du dépôt.

## 10. Sources externes

- Valueflows, journal des versions : https://valueflows.gitbook.io/valueflows/changelog
- Valueflows, spécification : https://valueflo.ws/
- hREA Strategic Roadmap, mars 2026 : https://sensorica.github.io/nondominium/hREA/strategic-roadmap.html
- Data Food Consortium sur AgroPortal : https://agroportal.lirmm.fr/ontologies/DFC
- Carto4CH, remplacement de PAIR par HeCo : https://portal.carto4ch.huma-num.fr/en/blog/tags/pair
- NextGraph, diapositives de FOSDEM 2026 : https://fosdem.org/2026/events/attachments/CRSTQ8-nextgraph/slides/267598/nextgraph_v8pnpxa.pdf
- Fil du forum de l'Assemblée Virtuelle, sujet 745, 5 décembre 2022 : repris en partie C du dossier.
