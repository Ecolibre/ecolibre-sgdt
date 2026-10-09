# Lot 22, tâche 3 — Fusion des deux cadrages sur la page du lot

Date : 9 octobre 2026. Exécuteur : Claude Code, poste spheres.

## Résultat

- Page : `Lot 22 — Miroir local` (pageid 533), titre relevé dans `Catégorie:Lot` par `list=categorymembers`, non fabriqué.
- Révision avant : **1470** (8 octobre 2026, 21:15:09 UTC, `[Lot 22][Tâche 2] Accent sur la capitale de « À mesurer » dans Points ouverts`). Conforme à l'attendu, écriture autorisée.
- Révision après : **1473** (9 octobre 2026, 10:24:38 UTC).
- Résumé de modification : `[Lot 22][Tâche 3] Fusion des deux cadrages : section Objet, exclusions complétées en style à amorce, points ouverts tenant compte du dump du 17 août 2026, dépendance au lot 24`
- Protection native avant écriture : aucune (`protection: []`).

## Étape 1 — État du dépôt

`git status --porcelain` : sortie vide, aucune ligne M, A, D, R ni `??`.
`.claude/settings.local.json` au début : `allow: []`, `deny: []`, aucune règle.

## Diff appliqué (1470 → 1473)

```diff
@@ -4,6 +4,10 @@
 |Work_package_summary=Monter un miroir local du wiki, pour éprouver un changement de configuration avant de le demander en production.
 }}
 
+== Objet ==
+
+Ce lot naît d'un incident. Le 18 août 2026, une modification de configuration appliquée directement sur la production a mis le wiki hors service pour tout le monde, pages et API confondues, faute d'une étape préalable que personne n'avait identifiée. Le lot 24 en a tiré sa règle, tout changement de configuration se vérifie d'abord sur le miroir local, et il reste à l'arrêt tant que ce miroir n'existe pas.
+
 == Ce qui est déjà tranché ==
 
 '''Docker plutôt qu'une installation native.''' La production tourne sur PHP 7.4, en fin de vie, et l'état doit pouvoir être remis à zéro entre deux essais.
@@ -20,22 +24,32 @@
 
 == Ce que le lot exclut ==
 
-La disponibilité du wiki quand le réseau internet est coupé : archive consultable hors ligne, export statique, machine allumée en permanence. Objectif distinct, arbitré le 8 octobre 2026, traité après ce lot.
+'''Toute écriture du miroir vers la production.''' Le miroir lit le serveur, il n'écrit jamais dessus : ni page, ni fichier, ni référence Base 36. Un réglage éprouvé sur le miroir est ensuite appliqué par le lot 24, ou demandé à l'adminsys.
+
+'''Les essais eux-mêmes.''' Le lot livre le miroir et la marche à suivre pour le remonter ; il n'éprouve aucun réglage particulier. Le premier réglage à éprouver relève du lot 24, l'installation d'extension du lot 20.
+
+'''Toute montée de version.''' Le miroir reproduit la production telle qu'elle est : PHP 7.4, MediaWiki 1.39.11, Semantic MediaWiki 4.2.0. Éprouver un changement de version est un autre sujet, qui demanderait un second miroir pour servir de témoin.
 
-L'hébergement du wiki public, que ce soit depuis une machine chez Cyril ou sur une machine louée, ainsi que la sortie du wiki de la ferme hébergée par l'adminsys.
+'''Toute synchronisation continue avec la production.''' Le miroir est une photo restaurée à la demande, jamais un réplica tenu à jour.
 
-Toute écriture du miroir vers la production : le miroir lit le serveur, il n'écrit jamais dessus.
+'''La politique de sauvegarde de la production.''' Un miroir restauré à la demande n'est pas une sauvegarde. La question relève de la gouvernance, pas de ce lot.
+
+'''La disponibilité du wiki quand le réseau internet est coupé.''' Archive consultable hors ligne, export statique, machine allumée en permanence : objectif distinct, arbitré le 8 octobre 2026, traité après ce lot.
+
+'''L'hébergement du wiki public.''' Que ce soit depuis une machine chez Cyril ou sur une machine louée, ainsi que la sortie du wiki de la ferme hébergée par l'adminsys.
 
 == Points ouverts ==
 
-La route de récupération du dump n'est pas arrêtée : mysqldump depuis le compte de Cyril, ou script de maintenance MediaWiki. À mesurer à l'ouverture du lot.
+La route de récupération du dump. Un dump de la base et une archive des images ont été déposés sur le serveur par l'adminsys le 17 août 2026, dans le répertoire mediawiki-1.39 : c'est la route la plus courte, et la seule qui ne demande rien à personne ni aucune commande sur la base de production. À revérifier à l'ouverture, les fichiers peuvent avoir été retirés depuis. À défaut, mysqldump depuis le compte de Cyril, ou un script de maintenance MediaWiki.
+
+L'âge de cette base. Un dump du 17 août 2026 suffit pour éprouver un réglage, mais pas pour relire du contenu récent : tout ce qui a été écrit depuis y manque. Le choix se fait à l'ouverture, selon l'usage visé.
 
 L'espace disque libre du poste spheres et la présence de Docker n'ont jamais été mesurés.
 
 == Dépendances ==
 
-Rien en amont. Le lot 20 en dépend, puisqu'il installe une extension et modifie la configuration du site.
+Rien en amont. Le lot 20 en dépend, puisqu'il installe une extension et modifie la configuration du site. Le lot 24, ouvert depuis le 10 septembre 2026, en dépend aussi : sa règle veut que tout changement de configuration soit éprouvé d'abord sur ce miroir.
```

Les trois exclusions existantes sont reprises sans changement de fond, passées au style à amorce en gras comme le demandait la consigne ; le texte écrit est celui de la consigne, mot pour mot.

## Vérifications

| Contrôle | Mesure | Résultat |
|---|---|---|
| Identité du wikitexte | `prop=revisions` sur la révision 1473, comparé en Python au texte fourni privé de son saut de ligne final | **identique** (4194 caractères relus, 4195 fournis, la différence est le saut de ligne final) |
| Faits `Work_package_number` / `Work_package_status` | `bin/wiki-api.sh --facts` | `22` et `identifié`, inchangés |
| Annotations parasites | `--facts` sans filtre, avant et après | mêmes clés avant et après : `Work_package_number`, `Work_package_status`, `Work_package_summary`, `_ASK` (trois requêtes, mêmes empreintes), `_INST` (Lot), `_MDAT`, `_SKEY` ; seul `_MDAT` a changé. Aucune annotation nouvelle. |
| Catégories | `prop=categories` | `Catégorie:Lot` seulement, aucune catégorie de suivi |
| Liens | `prop=links` | `Gestion des lots`, `Lot 20 — External Data`, `Attribut:Work package status` ; les trois pages existent (vérifié par `action=query&titles=`), aucun lien vers une page inexistante |

`.claude/settings.local.json` en fin de tâche : voir le commit, toujours `allow: []`, `deny: []`.

## Questions posées ou réponses rendues hors consigne

Aucune.

## Écarts et surprises

- Le numéro de révision après écriture est 1473 et non 1471 : les révisions 1471 et 1472 existaient déjà, écrites le 8 octobre 2026 à 21:21:11 UTC sur deux autres pages (`Limites connues du SGDT` et `Lot 21 — Grandeurs et unités`, résumés `[Lot 21][Tâche 15]…`). Aucune n'a touché la page du lot 22, dont la révision courante était bien 1470 au moment de la lecture.
- La page nomme le lot 24 à trois endroits sans lien vers lui ; seul le lot 20 est lié, et ce lien vient vraisemblablement du modèle `Lot`, pas du texte. Non modifié, conformément à la consigne.
