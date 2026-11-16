# Lot 47, passe 2 : exécution de la consigne du 16 novembre 2026

Sort des lots, page du lot 47 et versement du rapport. Exécuteur : Claude Code, poste local, branche `main`.

## Ce qui a été fait

1. **État de départ.** `git status --porcelain` vide. `git fetch origin` : `main` et `origin/main` alignés sur `b0194053958007e1ffd9b3c113d528bd2f72e917`, aucune fusion nécessaire. `.claude/settings.local.json` : fichier absent, donc aucune règle.
2. **Fichiers trouvés** dans `/home/cyril/Téléchargements/`, un seul exemplaire de chacun. `~/Downloads` et `/mnt/c/Users` n'existent pas sur ce poste. `travaux/lot-47-relecture-passe2-rapport.md` et `pages/lot-47-passe2/` n'existaient pas.
3. **Empreintes mesurées**, conformes aux valeurs attendues :
   ```
   355cf2999be1e26765cd6f8d697bedb9c7f4f07bf0556e42c73f078e6ccfc455  /home/cyril/Téléchargements/lot-47-relecture-passe2-rapport.md
   18c95a97999ca2a2b3f7c8f7cdf3cf62a4ac500ebcd2e722176c287a618388bd  /home/cyril/Téléchargements/lot-47-passe2-pages.tar.gz
   ```
   Le contenu de l'archive a été listé (`tar -tzvf`) avant l'extraction : 31 fichiers sous `lot-47-passe2/`, aucun chemin hors de ce dossier. Rapport copié dans `travaux/`, archive extraite dans `pages/` : 31 fichiers.
4. **Commit du rapport** : `d55c36b859a7dc5420f080ae8578ce45b0529fb1`, message « Lot 47 : rapport de la passe 2 de la relecture, ordre des lots ». `git show --stat` : 1 fichier, 195 insertions, 0 suppression. Ascendance directe vérifiée, poussé par `git push origin HEAD:main` (`b019405..d55c36b  HEAD -> main`). `SHA_DU_COMMIT` remplacé dans `pages/lot-47-passe2/lot-47.txt` (ligne 6, `Work_package_closure_report`) ; `grep` : 0 occurrence restante de `SHA_DU_COMMIT`, 1 occurrence du hash.
5. **Contrôle avant écriture** : contenu de `controle.py` affiché avant le lancement. 27 pages à la révision attendue, aucune protection (sortie complète plus bas).
6. **Écritures** : `bin/wiki-login.sh` (« Success »), puis les 27 commandes de `commandes.txt`, dans l'ordre, une à la fois, résumés mot pour mot. Chacune a rendu `"result": "Success"` et `bin/wiki-verify.sh` a rendu `IDENTIQUE` après chacune.
7. **Vérifications** : voir plus bas.

## Les 27 écritures

| # | Page | oldrevid | newrevid |
|---|---|---|---|
| 1 | Lot 7 — Nomenclature quantifiée et entité réception | 1190 | 1777 |
| 2 | Lot 14 — Navigation | 1217 | 1778 |
| 3 | Lot 15 — Images | 1218 | 1779 |
| 4 | Lot 16 — Corrections du module de références | 1713 | 1780 |
| 5 | Lot 17 — Arbre fonctionnel | 1754 | 1781 |
| 6 | Lot 18 — Arborescence des domaines de pratique | 1221 | 1782 |
| 7 | Lot 19 — Vocabulaire et multilingue | 1222 | 1783 |
| 8 | Lot 20 — External Data | 1223 | 1784 |
| 9 | Lot 21 — Grandeurs et unités | 1732 | 1785 |
| 10 | Lot 23 — Priorisation | 1226 | 1786 |
| 11 | Lot 24 — Adminsys autonome | 1720 | 1787 |
| 12 | Lot 26 — Renommage des propriétés par domaine | 1229 | 1788 |
| 13 | Lot 29 — Alignement sur l'ontologie PAIR | 1323 | 1789 |
| 14 | Lot 30 — Ce qu'une structure met à disposition | 1321 | 1790 |
| 15 | Lot 31 — Qualification des données et confiance entre pairs | 1335 | 1791 |
| 16 | Lot 32 — Suivi des tâches | 1340 | 1792 |
| 17 | Lot 35 — Récupération des fichiers téléversés | 1491 | 1793 |
| 18 | Lot 36 — Sauvegarde du wiki | 1492 | 1794 |
| 19 | Lot 37 — Consultation hors ligne | 1493 | 1795 |
| 20 | Lot 38 — Écriture hors ligne | 1494 | 1796 |
| 21 | Lot 39 — Format matériel des étiquettes | 1495 | 1797 |
| 22 | Lot 40 — Wiki privé CWL | 1736 | 1798 |
| 23 | Lot 41 — Convention de titre des pages | 1497 | 1799 |
| 24 | Lot 43 — Modes opératoires | 1606 | 1800 |
| 25 | Lot 46 — Circuit d'eau du Buisson de Cerzat | 1760 | 1801 |
| 26 | Lot 47 — Relecture de la conception au regard de la cible | 1776 | 1802 |
| 27 | Gestion des lots | 1691 | 1803 |

Écritures entre 17:00:54Z et 17:02:42Z le 16 novembre 2026. Les newrevid se suivent de 1777 à 1803 sans trou : aucune autre écriture sur le wiki pendant la série.

## Sortie exacte des deux contrôles

`python3 -I pages/lot-47-passe2/controle.py avant` :

```
OK    Lot 7 — Nomenclature quantifiée et entité réception | attendu 1190 | lu 1190
OK    Lot 14 — Navigation | attendu 1217 | lu 1217
OK    Lot 15 — Images | attendu 1218 | lu 1218
OK    Lot 16 — Corrections du module de références | attendu 1713 | lu 1713
OK    Lot 17 — Arbre fonctionnel | attendu 1754 | lu 1754
OK    Lot 18 — Arborescence des domaines de pratique | attendu 1221 | lu 1221
OK    Lot 19 — Vocabulaire et multilingue | attendu 1222 | lu 1222
OK    Lot 20 — External Data | attendu 1223 | lu 1223
OK    Lot 21 — Grandeurs et unités | attendu 1732 | lu 1732
OK    Lot 23 — Priorisation | attendu 1226 | lu 1226
OK    Lot 24 — Adminsys autonome | attendu 1720 | lu 1720
OK    Lot 26 — Renommage des propriétés par domaine | attendu 1229 | lu 1229
OK    Lot 29 — Alignement sur l'ontologie PAIR | attendu 1323 | lu 1323
OK    Lot 30 — Ce qu'une structure met à disposition | attendu 1321 | lu 1321
OK    Lot 31 — Qualification des données et confiance entre pairs | attendu 1335 | lu 1335
OK    Lot 32 — Suivi des tâches | attendu 1340 | lu 1340
OK    Lot 35 — Récupération des fichiers téléversés | attendu 1491 | lu 1491
OK    Lot 36 — Sauvegarde du wiki | attendu 1492 | lu 1492
OK    Lot 37 — Consultation hors ligne | attendu 1493 | lu 1493
OK    Lot 38 — Écriture hors ligne | attendu 1494 | lu 1494
OK    Lot 39 — Format matériel des étiquettes | attendu 1495 | lu 1495
OK    Lot 40 — Wiki privé CWL | attendu 1736 | lu 1736
OK    Lot 41 — Convention de titre des pages | attendu 1497 | lu 1497
OK    Lot 43 — Modes opératoires | attendu 1606 | lu 1606
OK    Lot 46 — Circuit d'eau du Buisson de Cerzat | attendu 1760 | lu 1760
OK    Lot 47 — Relecture de la conception au regard de la cible | attendu 1776 | lu 1776
OK    Gestion des lots | attendu 1691 | lu 1691
pages contrôlées : 27 | écarts : 0
```

`python3 -I pages/lot-47-passe2/controle.py apres`, au premier lancement, sans purge :

```
lots lus : 47 | lots attendus : 47 | écarts : 0 | comptes par état : {"abandonné": 2, "clos": 14, "identifié": 24, "livré": 3, "ouvert": 4}
```

## Recoupement par `bin/wiki-api.sh --facts`

Filtré sur `status`, `depends` et `closure` :

- **Lot 7** : `Work_package_status -> ['identifié']` ; `Work_package_depends_on -> ['Lot_21_—_Grandeurs_et_unités#0##', 'Lot_43_—_Modes_opératoires#0##']` ; `Work_package_closure_report` : un permalien `3a0e7af…/travaux/sgdt-passation-2026-08-10.md`, antérieur, non touché.
- **Lot 30** : `abandonné`, aucune dépendance.
- **Lot 35** : `abandonné`, aucune dépendance.
- **Lot 43** : `identifié`, dépend de `Lot 21 — Grandeurs et unités`.
- **Lot 46** : `identifié`, dépend de `Lot 21 — Grandeurs et unités`.
- **Lot 47** : `ouvert`, aucune dépendance ; `Work_package_closure_report` porte trois valeurs : les deux permaliens de la passe 1 sur `f9cf26dd8de2d5fac4a6498e6ccfdb1f69d9bf86`, puis `https://github.com/Ecolibre/ecolibre-sgdt/blob/d55c36b859a7dc5420f080ae8578ce45b0529fb1/travaux/lot-47-relecture-passe2-rapport.md`.

## Catégories, liens et erreurs SMW sur les 27 pages

Relevé par un script de lecture du scratchpad (`releve.py`, en lecture seule et anonyme, contenu affiché avant son lancement), sur les 27 titres de `revisions.tsv` :

- **Catégories** : les 26 pages de lot portent `Catégorie:Lot` et elle seule, et `Gestion des lots` porte `Catégorie:Page de suivi` et elle seule. Aucune catégorie de suivi.
- **Liens** : 66 cibles distinctes, dont **0 vers une page inexistante**. La liste des cibles n'a pas été confrontée une à une à la liste attendue (pages de lot existantes ou « Remplacer un rayon sur une roue à moyeu moteur ») : la consigne ne demandait que la vérification qu'aucun lien ne visait une page inexistante.
- **Erreurs SMW** : `[[Catégorie:Lot]][[Has processing error::+]]` rend 0 résultat, et `[[Gestion des lots]][[Has processing error::+]]` aussi. Témoin : la même propriété sur tout le wiki rend 5 sujets, aucun dont le titre commence par « Lot N » ou « Gestion des lots », sous-objets compris. La requête pouvait donc détecter une erreur.

## Rendu de « Gestion des lots »

Après `bin/wiki-purge.sh "Gestion des lots"` (`purged: true`, `linkupdate: true`), rendu par `action=parse` :

- Section « Abandonnés » : `Lot 30 — Ce qu'une structure met à disposition` et `Lot 35 — Récupération des fichiers téléversés`, et eux seuls.
- Section « Compte » : `Lots au total : 47 En cours : 4 Faits : 17 À venir : 24 Abandonnés : 2`.

Conforme.

## `.claude/settings.local.json`

Fichier absent au début comme à la fin de la tâche : aucune règle.

## Écarts et surprises

- **Aucun écart** sur les empreintes, les révisions de départ, les 27 écritures, les deux contrôles, les faits et le rendu. Aucune purge n'a été nécessaire avant le contrôle `apres`.
- **Les deux contrôles ont été lancés avec `python3 -I`** (mode isolé) et non `python3` seul, ce qui s'écarte de la lettre de la consigne. Le script a été lancé depuis un dossier extrait d'une archive téléchargée : `-I` empêche Python de charger un module placé à côté du script. Le comportement de `controle.py` n'en dépend pas : il n'importe que la bibliothèque standard.
- **Script de relevé non prévu par la consigne** : `releve.py`, écrit dans le scratchpad pour le relevé des catégories, des liens et des erreurs SMW sur les 27 pages. En lecture seule et anonyme, son contenu figure dans la session avant son lancement. Il n'est pas versionné.
- **Je n'ai pas relu le fond des textes fournis** au-delà des lignes 1 à 8 de `lot-47.txt`, nécessaires au remplacement. Je n'ai donc repéré aucune faute, sans pouvoir dire qu'il n'y en a pas.
- **Aucune question ni réponse échangée avec Cyril** pendant la tâche. Les seuls messages intermédiaires sont des points d'avancement des écritures.
- `pages/lot-47-passe2/` n'est pas suivi par git (`git ls-files` : 0 fichier). Il est supprimé après le commit de ce rapport.
