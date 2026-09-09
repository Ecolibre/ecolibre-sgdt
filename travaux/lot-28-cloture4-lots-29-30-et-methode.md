# Lot 28 — Clôture 4bis : titre du lot 30 corrigé, lots créés, quatre règles consignées

## État constaté au départ, et ce que cette tâche a corrigé

Une première tentative de cette clôture (consigne « Clôture 4 ») avait créé
la page « Lot 30 — Accès, prêt, compétences et stock » (pageid 554, revid
1320) sans vérifier au préalable la règle impérative de `CLAUDE.md` :
« Aucune virgule dans les noms de tableaux kanban ni de pages : la virgule
est le délimiteur multi-valeurs partout dans le modèle. » Ce titre porte
deux virgules. La tâche a été arrêtée avant la création du lot 29 et avant
toute modification de `methode-de-travail.md`, et une consigne de remplacement
(« Clôture 4bis ») a corrigé le tir sans `move` ni suppression : un nouveau
titre a été créé, l'ancien a été réduit à une redirection.

## Identifiants et tailles

| Page | Pageid | Révision | Taille |
|---|---|---|---|
| Lot 29 — Alignement sur l'ontologie PAIR (création) | 553 | 1319 | 1384 octets |
| Lot 29 — Alignement sur l'ontologie PAIR (liens corrigés) | 553 | 1323 | 1388 octets |
| Lot 30 — Ce qu'une structure met à disposition (création, titre définitif) | 555 | 1321 | 2160 octets |
| Lot 30 — Accès, prêt, compétences et stock (avant, page de modèle) | 554 | 1320 | 2160 octets |
| Lot 30 — Accès, prêt, compétences et stock (après, redirection) | 554 | 1322 | 66 octets |

Les deux créations (lot 29, et lot 30 sous son titre définitif) ont été
vérifiées libres avant écriture (`missing: true`), et les deux appels
`bin/wiki-put.sh` ont employé `--createonly`.

## Résultat des sept vérifications

1. **Faits stockés des deux pages de lot** (`browsebysubject`) :
   - Lot 29 : `Work_package_number` = 29, `Work_package_status` =
     « identifié ».
   - Lot 30 (titre définitif) : `Work_package_number` = 30,
     `Work_package_status` = « identifié », `Work_package_depends_on` avec
     **une seule valeur** : `Lot_29_—_Alignement_sur_l'ontologie_PAIR#0##`.

   Conforme sur les deux pages.

2. **Faits stockés de l'ancien titre** (`browsebysubject` sur « Lot 30 —
   Accès, prêt, compétences et stock ») : **résultat inattendu**. Voir
   « Écarts et surprises » — ce point ne s'est pas vérifié tel qu'annoncé.

3. **Appartenance à Catégorie:Lot** (`list=categorymembers`) : 30 membres
   au total, un par lot de 1 à 30. L'ancien titre (« Lot 30 — Accès, prêt,
   compétences et stock ») est **absent** de la liste. Les deux nouveaux
   titres y figurent. Conforme : la page devenue redirection est bien
   sortie de la catégorie, qui n'est posée que par le modèle `{{Lot}}`
   qu'elle ne transclut plus.

4. **Rendu des deux pages de lot** (`action=parse&prop=text`) : zéro lien
   `class="new"` sur chacune des deux pages. Conforme.

5. **Index « Gestion des lots »** (`action=parse&prop=text`, sans purge) :
   **non conforme, resté bloqué à l'ancien état** après trois lectures
   espacées dans le temps. Voir « Délai de l'index » ci-dessous.

6. **Diff de `methode-de-travail.md`** :

   ```diff
   @@ -40,6 +40,8 @@ Le contexte : d'où l'on part, ce que fait cette tâche, et pourquoi si ce n'est
    
    Les règles impératives propres à la tâche, y compris ce qu'il ne faut pas faire.
    
   +L'étape d'état du dépôt distingue deux cas que `git status` affiche côte à côte. Une ligne `M`, `A`, `D` ou `R` signale un fichier suivi et modifié, qu'un commit peut emporter ou qu'une opération peut écraser : elle justifie un arrêt. Une ligne `??` signale un fichier non suivi, qu'aucun `git add` nommant des chemins explicites ne peut atteindre : elle ne justifie rien. Confondre les deux fait arrêter une tâche que rien ne menaçait.
   +
    Les étapes. Deux modes, et il faut savoir lequel on emploie.
    
    Le **texte fourni** : le contenu exact à écrire, mot pour mot. C'est le cas majoritaire, et le seul acceptable dès qu'on sait d'avance ce qu'il faut écrire. « Rédige un texte qui dit que » produit un texte inventé.
   @@ -76,6 +78,12 @@ Quand Cyril travaille sur téléphone, les rapports doivent tenir en un seul blo
    
    **Exposer une incertitude plutôt que trancher pour faire propre.** Un rapport qui dit « je ne sais pas si cela contredit la phrase ou la confirme autrement » vaut mieux qu'un rapport qui choisit.
    
   +**Remesurer un chiffre avant de l'écrire dans une consigne**, y compris un chiffre qu'on vient soi-même de calculer. Sur le lot 28, quatre chiffres justes sont redevenus faux entre leur mesure et leur reprise : une date d'ouverture, un « hier », un compte de passages corrigés, une taille de fichier en octets. Aucun n'a atteint le wiki, parce que la consigne exigeait chaque fois une mesure avant écriture.
   +
   +**Vérifier les règles impératives de `CLAUDE.md` avant de faire fabriquer un nom.** Un titre de page, un nom de fichier, une valeur de propriété : ces règles disent ce que le modèle ne supporte pas, et l'architecte ne les a pas en tête. Sur le lot 28, un titre de lot à deux virgules a été écrit alors que la virgule est le délimiteur multi-valeurs et qu'aucune des 241 pages de l'espace principal n'en portait.
   +
   +**La preuve d'une poussée ne peut pas figurer dans le commit qu'elle prouve.** Au moment où `git log origin/main` devient lisible, le rapport est déjà commité : une consigne qui exige cette preuve dans le rapport force un second commit sur le même fichier. La consigne demande de pousser et de signaler un échec, rien de plus. C'est l'architecte qui vérifie, en interrogeant `origin/main` lui-même, et l'étape d'état de la tâche suivante qui confirme.
   +
    ## Ce qui rattrape les erreurs
   ```

   Quatre paragraphes ajoutés, aucun autre changement. Conforme.

7. **Faits `_ERRC` sur le wiki** (`action=ask&query=[[_ERRC::+]]`) : zéro
   résultat. Conforme.

## Délai de l'index

L'index n'a pas suivi dans le temps disponible pour cette tâche. Trois
lectures espacées de `Gestion des lots` ont toutes rendu l'état d'avant :
28 lots au total, « En cours : 1, Faits : 12, À venir : 15, Abandonnés : 0 »,
sans trace des lots 29 ni 30.

`bin/wiki-wait-jobs.sh` a été appelé une fois : cinq essais ont tous lu
`jobs=7`, sans décroissance, d'où son verdict « FILE FIGEE ». Le compte est
donc **stagnant**, pas en décroissance — mais, comme le rappellent les
*Limites connues*, ce chiffre est une estimation plafonnée de
`siteinfo&siprop=statistics`, pas un décompte fiable, et ce script a déjà
signalé à tort une file figée alors que le serveur la rapportait vide.
Aucune vérification côté serveur (`runJobs.php`) n'a été possible depuis
cette tâche, qui n'a pas d'accès SSH. **Ce point reste donc ouvert** :
l'index sera à relire à la prochaine occasion, sans purger (la purge
détruirait la mesure du délai).

## methode-de-travail.md modifié depuis la clôture du lot 28

`methode-de-travail.md`, livrable du [[Lot 27 — Conduite du projet|lot 27]],
a été modifié par cette tâche (quatre paragraphes ajoutés, commit séparé du
rapport). Signalé ici pour que la conversation du lot 27 ne le redécouvre
pas à sa clôture.

## Écarts et surprises

**Le point 2 de la consigne est faux à la mesure, et c'est un fait
important à comprendre, pas une simple faute de frappe à corriger.** La
consigne affirmait : « [l'ancien titre] ne doit plus porter AUCUN fait
Work_package_. C'est ce qui prouve que la page est sortie du modèle. »
Mesuré : `action=browsebysubject&subject=Lot 30 — Accès, prêt, compétences
et stock` renvoie exactement les mêmes faits que le titre définitif —
`Work_package_number` = 30, `Work_package_status` = « identifié »,
`Work_package_depends_on`, etc. — et le champ `subject` de la réponse JSON
porte lui-même le **nouveau** titre (`Lot_30_—_Ce_qu'une_structure_met_à_
disposition#0##`), pas l'ancien.

Cela ne signifie pas que la correction a échoué. Le point 3 (appartenance à
`Catégorie:Lot`) confirme que l'ancien titre est bien sorti du modèle de
classification : il n'apparaît plus dans les 30 membres de la catégorie,
qui n'est posée que par le modèle `{{Lot}}` que la page ne transclut plus.
Ce que révèle le point 2, c'est un mécanisme différent : Semantic MediaWiki
traite une redirection comme une **synonymie sémantique**, et
`action=browsebysubject` résout le sujet interrogé vers sa cible avant de
répondre — un fait bien documenté de SMW, où une redirection fait des deux
titres un seul sujet aux yeux du triplestore, précisément pour permettre
ce genre d'harmonisation terminologique.

Autrement dit : la virgule de l'ancien titre ne peut plus être découpée
comme délimiteur multi-valeurs par une propriété du modèle, parce que la
page ne porte plus le modèle `{{Lot}}` elle-même — c'est le résultat
recherché, et il tient. Mais elle n'est pas non plus totalement « sortie du
modèle » au sens où l'entendait la consigne : interrogée directement, elle
répond toujours, via son alias sémantique vers le titre cible. La
distinction utile n'est donc pas « la page porte des faits / n'en porte
plus », mais « la page porte le modèle et sa catégorie / n'en porte plus » —
et c'est cette seconde version qui s'est vérifiée.

Aucun autre écart : les identifiants, révisions et tailles des trois pages
concernées, l'absence de liens rouges, le diff de `methode-de-travail.md`
et l'absence de faits `_ERRC` se sont tous vérifiés tels qu'annoncés.
