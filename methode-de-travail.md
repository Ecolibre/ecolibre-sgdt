# Méthode de travail — projet SGDT

Ce fichier décrit comment le projet se conduit, pas ce qu'il contient. Pour le SGDT lui-même, le wiki fait autorité : voir `Catégorie:Page de suivi`.

Écrit au terme du lot 13, premier lot mené entièrement sous cette forme. Une règle qui n'a servi qu'une fois n'est pas encore une règle : à relire après deux lots de plus.

## Qui fait quoi

Trois intervenants, et un seul lien entre eux.

**Cyril** décide. Il ne code pas et n'a pas l'intention d'apprendre. Il arbitre, relaie, et vérifie ce qu'il voit à l'écran.

**Claude conversationnel**, dit l'architecte, lit le wiki et le dépôt, mesure, propose, rédige les consignes, et vérifie les rapports par ses propres mesures. Il n'écrit jamais sur le wiki.

**Claude Code**, l'exécuteur, écrit sur le wiki et dans le dépôt, vérifie ce qu'il a écrit, et rend un rapport.

Les deux Claude ne communiquent pas. Ils ne savent l'un de l'autre que ce que Cyril transmet, et ce que le wiki et le dépôt portent. Toute information qui ne passe pas par l'un de ces trois canaux est perdue.

## Le cycle

1. L'architecte mesure l'état réel et propose.
2. Cyril arbitre, point par point.
3. L'architecte rédige une consigne complète, prête à coller.
4. Cyril la colle à Claude Code.
5. Claude Code exécute, vérifie, et écrit un rapport dans `travaux/`.
6. Cyril transmet le rapport.
7. L'architecte vérifie lui-même, indépendamment du rapport.

L'étape 7 n'est pas une formalité. Sur le lot 13, elle a rattrapé deux affirmations fausses déjà écrites sur le wiki.

## Format des échanges

Chaque nouveau sujet est un point numéroté, dans cet ordre : le contexte ou le problème, puis la question, puis la suggestion de l'architecte. Le numéro est annoncé avant que le sujet soit développé, parce que Cyril lit au fil et répond en cours de route.

Le but est qu'il puisse répondre « point N : ok, go » sans retaper un raisonnement identique à la recommandation.

Une consigne à la fois. Jamais de consigne tant qu'un arbitrage reste ouvert : les réponses obligeraient à la réécrire, et le quota est une ressource.

Une consigne corrigée est redonnée entière, prête à copier. Jamais de passage à remplacer.

Quand Cyril travaille sur téléphone, les rapports doivent tenir en un seul bloc copiable.

## Ce qu'une consigne doit contenir

Le contexte, en trois lignes : d'où l'on part, ce que fait cette tâche.

Les règles impératives propres à la tâche, y compris ce qu'il ne faut pas faire.

Les étapes, avec le contenu exact à écrire quand il y en a. Pas de « rédige un texte qui dit que » : le texte est fourni, sinon il sera inventé.

Les vérifications, en nommant celle qui tranche. Une consigne qui demande dix contrôles sans dire lequel décide obtient dix « conforme ».

Le rapport attendu, avec une section « Écarts et surprises ».

Et l'instruction de n'afficher qu'une ligne dans le terminal : le chemin du fichier.

## Les règles de vérification

**Ne jamais s'appuyer sur un résumé, le sien compris.** Vérifier sur le wiki ou dans le dépôt avant d'affirmer, et dire d'où vient ce qu'on avance. C'est la règle la plus importante et la plus souvent enfreinte.

**Un `result: Success` ne prouve pas que la donnée est stockée.** Vérifier après écriture, par `browsebysubject`.

**Ne pas conclure une absence d'une mesure qui ne détecte pas l'absence.** Constater qu'aucune page n'existe ne prouve pas que la chose n'existe pas. Sur ce wiki, la négation d'une propriété se compile silencieusement en sa forme positive.

**Signaler un écart plutôt que le lisser.** Quand une consigne annonce un résultat que la mesure dément, c'est la consigne qui a tort. Ne jamais modifier une donnée pour faire correspondre un compte attendu.

## Cadrages, pas instructions

Pour un lot à venir, on écrit un cadrage, jamais une consigne exécutable.

Un arbitrage vieillit lentement, une mesure vieillit vite. Les décisions et leurs motifs tiennent des mois ; les points de départ, les risques et les périmètres détaillés se périment en quelques jours et produisent une confiance fausse. Ils se réécrivent en dix minutes à l'ouverture du lot, contre le wiki réel.

Une idée écartée se consigne avec son motif et sa date. Sans le motif, elle revient.

## Où vit quoi

**Le wiki fait autorité.** Un contributeur sans dépôt et sans assistant doit pouvoir tout comprendre depuis lui. `Catégorie:Page de suivi` est le point d'entrée.

**`travaux/`** porte les rapports d'exécution, jamais le wiki : ils citent de la syntaxe que le wiki lirait comme de vraies annotations.

**`CLAUDE.md`** porte les règles opératoires de Claude Code.

**Ce fichier** porte le protocole. Il n'a de sens que pour l'outillage, d'où sa place dans le dépôt.

## Limites de l'outillage, mesurées

L'architecte ne peut pas lire l'horodatage des messages d'une conversation passée. Contournement : il demande « retrouve la date de l'échange qui commence par… » et Cyril la retrouve au Ctrl+F.

La recherche dans les conversations rend des extraits et des résumés générés, pas le texte. Elle ne vaut pas relecture, et un résumé retient des affirmations en perdant leur adresse et leur motif.

**Conséquence directe : la clôture d'un lot se fait dans la conversation qui l'a mené**, seul endroit où le texte intégral est disponible. Voir la page `Procédure de clôture d'un lot`.
