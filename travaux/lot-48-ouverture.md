# Lot 48 — ouverture, preuve de l'héritage et arbitrages du 19 novembre 2026

Exécuteur : Claude Code, session cloud, branche `ccr-8d5eed87-mi49fj`. Date : 19 novembre 2026.
Rien n'a été configuré dans cette tâche.

## État du dépôt au début

`git fetch origin` : la branche de session était sur `2a5a377`, comme `origin/main`. Aucune fusion nécessaire. `git status --porcelain` vide.

## Preuve de l'héritage (lecture seule)

Connexion par `bin/wiki-login.sh` : `Success Cywil`.

### Compte et groupes

`action=query&meta=userinfo&uiprop=groups` :

- nom : `Cywil` (id 4) ;
- groupes : `bureaucrat`, `interface-admin`, `smwadministrator`, `sysop`, `*`, `user`, `autoconfirmed`.

### Lecture de CWL:Test — celle qui tranche

`bin/wiki-get.sh "CWL:Test"` : code de sortie 0. Le contenu vaut exactement `Essai` : oui. Longueur : 5 caractères. Le contenu n'a été ni affiché ni recopié ; la comparaison a été faite par une ligne de Python sur le fichier du scratchpad.

**Résultat : l'héritage est prouvé.** Connecté par le mot de passe de robot, le robot du SGDT lit une page de l'espace CWL réservée au groupe sysop.

### Témoin de recherche

`action=query&list=search&srsearch=Essai&srnamespace=500` : `totalhits: 0`, liste vide. **CWL:Test ne figure pas dans les résultats**, alors que la recherche est faite connecté. Voir « Écarts et surprises ».

## Page du lot

| | |
|---|---|
| Titre exact | `Lot 48 — Espaces de formation verrouillés` (pageid 723, membre de `Catégorie:Lot`, vérifié par `list=categorymembers`) |
| Révision avant | 1804 (lastrevid, conforme au relevé de l'architecte) |
| Révision après | 1808 (horodatage 2026-11-19T15:09:43Z) |
| Taille | 8736 → 10754 octets |
| Protection | `protection: []` |
| Résumé employé | `[Lot 48][Ouverture] Lot ouvert, arbitrages et mesures du 19 novembre 2026 consignés, points ouverts mis à jour` |

### Relevés avant écriture

- Faits : `Work_package_number -> 48`, `Work_package_status -> identifié`, `Work_package_summary` (le résumé d'objet du lot), trois `_ASK` (requêtes du modèle Lot), `_INST -> Lot`, `_MDAT`, `_SKEY`.
- `prop=links` : `Gestion des lots` seul.
- `prop=categories` : `Catégorie:Lot` seule.
- Contrôle préalable hors consigne, en lecture : `Modèle:Lot` porte bien le paramètre `Work_package_opening_date`, et la propriété est déjà employée par d'autres lots avec le type résolu `_dat`.

### Modifications

Script Python de session, affiché dans le message de son lancement. Chaque ligne visée comptait exactement une occurrence (R1, R2, R3, R4, R5 ×4, R6 : 1 chacune). 75 lignes avant, 81 après (+1 pour R2, +9 pour R4, −4 pour R5).

Le `diff` avant/après ne porte que sur les lignes visées : statut (R1), date d'ouverture insérée (R2), phrase ajoutée en R3, bloc de neuf lignes inséré après la ligne R4, quatre points ouverts supprimés (R5), texte V ajouté en fin de ligne R6. `diff` place la ligne vide insérée en R4 après le bloc au lieu d'avant, ce qui ne change rien au contenu : le texte qui en résulte est bien ligne R4, ligne vide, intitulé, ligne vide, D1, D2, D3, H, D4, D5, puis la ligne vide qui la suivait déjà.

## Vérifications après écriture

- `bin/wiki-verify.sh` : `IDENTIQUE : Lot 48 — Espaces de formation verrouillés`, code de sortie 0.
- Faits :
  - `Work_package_status -> ouvert` : conforme ;
  - `Work_package_opening_date -> 1/2026/11/19` : le 19 novembre 2026, conforme ;
  - `Work_package_number -> 48` : conforme ;
  - `Work_package_summary` : identique au relevé d'avant ;
  - `_INST -> Lot#14##` : Lot et rien d'autre.
  Les trois `_ASK`, `_MDAT` et `_SKEY` sont aussi présents, comme avant l'écriture.
- `prop=links` : `Gestion des lots` seul. Identique.
- `prop=categories` : `Catégorie:Lot` seule. Identique.
- `bin/wiki-purge.sh "Gestion des lots"` : `purged: true`, `linkupdate: true`. Aucune conclusion tirée de l'affichage.

## Relevé de `.claude/settings.local.json`

- Au début : fichier absent. Aucune règle.
- À la fin : fichier absent. Aucune règle.

## Questions posées et réponses rendues hors consigne

Aucune.

## Écarts et surprises

- **Le témoin de recherche plein texte échoue, connecté.** La recherche de `Essai` dans l'espace 500, faite par le robot connecté qui lit la page, rend zéro résultat. Le texte D4 écrit sur la page pose que « la même recherche, faite connecté, doit trouver la page » ; sur ce cas, elle ne la trouve pas. Le témoin ne permet donc pas, en l'état, de distinguer « la recherche cache la page aux visiteurs » de « l'index de recherche ne la contient pas ». Une sonde en lecture, hors consigne, ajoutée pour éclairer ce point : `srsearch=Test&srnamespace=500&srwhat=title`, connecté, trouve `CWL:Test` (pageid 95, `size 5`, `wordcount 1`, `snippet` vide). La page est donc dans l'index des titres. La recherche sur le texte ne la trouve pas. Ce qui se voit concorde avec la mention, dans D4, d'un index de recherche partiel ; la cause n'est pas mesurée. L'écriture n'en dépendait pas : la consigne ne s'arrêtait que si CWL:Test ne rendait pas `Essai`.
- Le texte V renvoie au « rapport d'ouverture du lot » pour le témoin connecté : c'est ce rapport, et le témoin y figure, avec un résultat négatif.
- `meta=userinfo` rend le nom du compte principal, `Cywil`, et non un nom de robot : avec un mot de passe de robot, l'API présente le compte lui-même. C'est cohérent avec l'héritage prouvé. On ne pourra pas distinguer les deux robots par ce nom, puisque le robot de formation sera lui aussi un mot de passe de robot du même compte.
- La page du lot porte trois faits `_ASK` en plus de ceux que la consigne énumère : ils viennent des requêtes de `Modèle:Lot` et figuraient déjà avant l'écriture.
