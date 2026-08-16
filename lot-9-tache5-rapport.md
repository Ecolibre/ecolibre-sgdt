# Lot 9 — Tâche 5 — Rapport

**Exécuté le 15 août 2026, session Claude Code, compte `Cywil`.** Trois
points demandés par Cyril suite au test du formulaire en direct. Aucune
écriture wiki sur les points 1 et 2 (correctifs locaux). Point 3 bloqué,
voir ci-dessous — pas de suppression effectuée.

## 1. Correction de `lot-9-tache0-rapport.md` §10

Ajout consigné : `Allows value` **rejette** la valeur hors liste, il ne se
contente pas d'avertir. Vérifié par Cyril sur `Test 260915a` :
`Specimen_status=en réserve` ne remonte pas dans Spécial:Parcourir, alors
que `Specimen_status=en place` (sur un autre item de test) y remonte
normalement. Ceci contredit ce qui avait été supposé en tâche 4 (un
avertissement « Has improper value for » affiché mais la valeur tout de
même stockée).

Conséquence explicitée dans le fichier : `Specimen_status` porte le `#if`
qui déclenche `Modèle:Physical facet plant`. Une valeur rejetée équivaut à
un champ vide pour ce `#if`. Tant que le verrou SMW n'est pas levé, une
plantation saisie en `en réserve` n'émet **ni facette, ni catégorie, ni
ligne de récapitulatif** — perte silencieuse au niveau du modèle, pas
seulement un mauvais affichage en page `Attribut:`.

## 2. Entrée ouverte dans `lot-9-cadrage-plantes.md` §5

Point 5 ajouté : `default=` d'un `#ask` en `format=gallery` ne s'affiche
pas — cellule « Photos de cette plantation » vide sur `Test 260915a` au lieu
du texte par défaut prévu. Cause non déterminée (bug SRF, syntaxe du
paramètre, ou incompatibilité propre à `format=gallery`). Reporté après la
tâche 8.

## 3. Suppression de `Test 260915a` / `Test 260915b` — bloquée

**Non exécutée.** Vérification préalable (`action=query&meta=userinfo&
uiprop=rights`) : le compte `Cywil` — bureaucrate, sysop, interface-admin,
smwadministrator d'après `usprop=groups` — **n'a pas le droit `delete`**
dans sa liste de droits effectifs. Même schéma que le blocage `editinterface`
déjà consigné (mémoire `wiki-editinterface-blocker`) : une restriction
invisible à `prop=info|protection`, ici portant sur l'action elle-même plutôt
que sur une page. Aucun script du dépôt ne couvre la suppression
(`bin/wiki-*.sh` : lecture, écriture `createonly`/édition, purge,
téléversement — pas de suppression), et forcer un appel `action=delete` brut
échouerait de toute façon avec ce compte. **Suppression à faire par Cyril
lui-même**, hors de ce qui est exécutable depuis cette session.

**Réponse à la question posée, par le calcul plutôt que par l'observation**
(puisque rien n'a été supprimé) : état actuel de `Category:Physical item`
filtré `Inventory_site::ECL`, trié décroissant sur `Inventory_number`
(`action=ask`, lecture seule) :

| Page | Inventory_number |
|---|---|
| `Test 260915b` | 0004 |
| `Test 260915a` | 0003 |
| `Bidon 220L Bleu 2` | 0002 |
| `Bidon 220L Bleu 1` | 0001 |

Une fois les deux items de test supprimés, le plus haut `Inventory_number`
restant pour `ECL` est `0002` (`Bidon 220L Bleu 2`). Vérifié en isolant le
module utilisé par le formulaire plutôt qu'en arithmétique de tête :
`{{#invoke:Base36|next|0002}}` → **`0003`** (appel `action=parse` en
lecture seule, aucune écriture). **Oui, le compteur repart de ECL-0003**,
sous réserve qu'aucun autre item physique ne soit créé entre la suppression
et la prochaine ouverture du formulaire — le calcul est fait en direct à
chaque chargement, pas mis en cache.

## Suite

Tâche 5 non terminée : la suppression des deux items de test reste à faire
par Cyril. Le reste de la vérification fonctionnelle (ouverture réelle du
formulaire, cf. portée limitée du test de rendu en tâche 4) a déjà eu lieu
de fait via `Test 260915a`/`b`, dont les résultats ont produit les points 1
et 2 ci-dessus.
