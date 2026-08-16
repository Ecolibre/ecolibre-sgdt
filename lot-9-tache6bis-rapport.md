# Lot 9 — Tâche 6bis : rapport

Étape intermédiaire avant la tâche 7. Trois écritures faites, dans cet
ordre, chacune relue avant la suivante. Vérification par formulaire laissée
à Cyril (pas d'accès navigateur ce tour-ci — voir « Vérification » plus bas).

## Corrections apportées à la proposition avant écriture

La proposition initiale (`lot-9-tache6bis-proposition.md`) nommait le
paramètre de modèle `location`, en pensant éviter une collision avec la
propriété SMW `Located_at`. Cyril a signalé que cette collision n'existe
pas — paramètre de modèle et propriété SMW vivent dans deux espaces de noms
distincts — et que la convention du projet (posée en tâche 4, sur les cinq
champs du bloc facette végétale : `Planting_date`, `Planting_rank`,
`Planted_count`, `Specimen_status`, `Propagated_from`) veut que le paramètre
porte le nom exact de la propriété qu'il alimente. Corrigé : le paramètre
est `Located_at`, partout (modèle et formulaire).

**Dette de nommage notée, non traitée** : `site_code`, `model_link`, `sn`,
`physical_parent` restent sur l'ancienne convention (paramètre ≠ propriété).
Antérieurs à la règle posée en tâche 4, ce n'est pas une raison de
l'étendre à un champ neuf — mais ce n'est pas non plus le lieu de les
rebaptiser rétroactivement : un renommage de paramètre côté modèle efface
silencieusement la valeur de tout item déjà créé, au premier ré-enregistrement
par formulaire (même mécanisme que le défaut du lot 8). À traiter, si décidé
un jour, comme une migration dédiée, hors du périmètre de cette tâche.

Deuxième correction : la requête « Éléments contenus » du modèle physique
n'avait aucun filtre de catégorie, contrairement à celle du modèle
organique qui reste dans sa classe par construction. `Part_of` étant
partagée par plusieurs classes de conception, un enfant non physique
portant accidentellement le même `Part_of` aurait pu remonter dans le
tableau. Un décompte informel des corrections en attente à travers les
rapports du lot 9 (`lot-9-cadrage-plantes.md` 1.7–1.9,
`lot-9-amendement-1.md`) était déjà à 4 (au-delà des deux seules listées
formellement dans `CLAUDE.md`) ; celle-ci en est la cinquième. Corrigée en
édition séparée, résumé `[Correctif]`, sans numéro de lot.

## Écritures faites

Wikitexte des deux pages relevé avant chaque écriture (guardrail « lire
avant d'écrire ») ; `prop=info|protection` vérifié sur les deux pages avant
la première écriture — aucune restriction native (`protection: []`), ce qui
ne garantit pas l'absence de restriction Lockdown invisible à cette requête.

1. **`Modèle:Physical item`**, revid 543 (depuis 354) — `[Lot 9][Tâche 6bis]
   Ajout du paramètre Located_at (#set + affichage)`. Ajout de
   `|Located_at={{{Located_at|}}}` au `#set`, et d'une ligne d'affichage
   « Se trouve à (Lieu) » sur fond `#e8f0ff`, juste après « Installé dans »,
   même fond pour marquer visuellement la paire à ne pas confondre.
2. **`Modèle:Physical item`**, revid 544 (depuis 543) — `[Correctif] Filtre
   Category:Physical item sur la requête Éléments contenus`. La requête
   passe de `{{#ask: [[Part_of::{{FULLPAGENAME}}]] ...}}` à
   `{{#ask: [[Category:Physical item]] [[Part_of::{{FULLPAGENAME}}]] ...}}`.
3. **`Formulaire:Physical item`**, revid 545 (depuis 527) — `[Lot 9][Tâche
   6bis] Ajout du champ Located_at (combobox, values from category=Lieu, non
   obligatoire)`. Champ ajouté après « Installé dans », combobox,
   `values from category=Lieu`, sans flag `mandatory`, avec un `#info`
   reprenant la distinction déjà rédigée dans `Catégorie:Lieu` entre
   `Located_at` (« se trouve à », vers un lieu) et `physical_parent`
   (« installé dans », vers un autre item physique).

Wikitexte relu après chacune des trois écritures pour confirmer le contenu
effectivement stocké (`result: Success` ne suffit pas — leçon de la tâche 6).

## Vérification

Demandée initialement : créer un item physique de test par le formulaire,
`Se trouve à = Le Buisson de Cerzat`, vérifier par `browsebysubject` que
`Located_at` est stockée, rouvrir par formulaire et vérifier que le champ
revient rempli.

Non faite par moi cette fois : pas d'accès navigateur cette session
(extension Claude in Chrome déclinée), et les scripts disponibles bloquent
délibérément `pfautoedit` — l'API de soumission de formulaire sans
navigateur — donc pas de moyen de passer par le vrai formulaire sans
navigateur. Cyril fait ce test lui-même (comme en tâche 5) et rapportera la
référence de l'item de test à supprimer.

Fait à la place, sur demande de Cyril : `action=parse` sur les deux pages
après écriture, `prop=text|wikitext`. Les deux rendent sans erreur — aucune
occurrence de marqueur d'erreur (`error`, `Erreur`, `Lua error`, `Script
error`, `strip marker`, `Cite error`) dans le HTML produit, et le
`wikitext` retourné correspond au contenu écrit. Ceci confirme l'absence
d'erreur de syntaxe wikitexte/Lua/SMW à l'analyse, mais **ne prouve pas**
que Page Forms mappe correctement le champ `Located_at` du formulaire au
paramètre du même nom côté modèle, ni que la valeur survit à une réédition
par formulaire — c'est précisément ce que le test de Cyril couvrira.

## Suite

En attente : suppression de l'item de test une fois la vérification du
comportement de réédition par formulaire faite par Cyril (couvert par la
correction ci-dessous entre-temps).

## Correction sur Modèle:Lieu, révélée par le test de Cyril

Le test manuel (item `Test 260915c`, `Located_at` correctement stockée)
a montré que la requête « Présents ici » du modèle `Lieu` ne le faisait pas
remonter au `Le Buisson de Cerzat`. Cause : `sort=Planting_rank` sur un
`#ask` en `format=ul` — SMW exclut de l'ensemble de résultats toute page qui
ne porte pas la propriété servant au tri, pas seulement les valeurs vides
d'une propriété affichée. `Test 260915c` n'a pas de `Planting_rank`
(propriété de facette végétale, un item de test n'en porte pas). Même
défaut pour `Jardin de Chilhac` et `Terrasse de Chilhac` : leurs plantations
existantes n'ont pas non plus de rang renseigné, donc les deux auraient été
vides pour la même raison, silencieusement.

`Inventory_number` est la seule propriété que porte tout item physique par
construction du formulaire (`ref_number`, calculé automatiquement,
`mandatory`) — remplace `Planting_rank` comme critère de tri. Le rang
devient une colonne affichée et triable au clic plutôt qu'un critère de tri
qui excluait.

### Diff appliqué

```diff
 {{#ask: [[Category:Physical item]] [[Located_at::{{FULLPAGENAME}}]]
- |format=ul
- |sort=Planting_rank
+ |?Planting_rank = Rang
+ |?Planting_date = Planté le
+ |?Specimen_status = État
+ |format=table
+ |sort=Inventory_number
  |order=asc
  |default=''Aucun item physique rattaché à ce lieu.''
+ |class=wikitable sortable
 }}
```

**Écriture** : `Modèle:Lieu`, revid 547 (depuis 534) — résumé `[Correctif]`,
sans numéro de lot (bug préexistant révélé par le test, hors périmètre de
la tâche 6bis). Wikitexte relevé avant écriture, protection vérifiée
(`protection: []`, comme pour les deux autres pages), relu après écriture
pour confirmer le contenu stocké.

### Vérification post-écriture

Les trois pages de lieu purgées (`bin/wiki-purge.sh`) puis relues par
`action=parse` :

- **`Le Buisson de Cerzat`** : `Test 260915c` apparaît bien dans le tableau
  « Présents ici » (colonnes Rang/Planté le/État vides pour cet item de
  test, qui ne porte aucune des trois propriétés de facette — attendu).
- **`Jardin de Chilhac`** et **`Terrasse de Chilhac`** : `default=` s'affiche
  toujours correctement en `format=table` — SMW rend le message par défaut
  tel quel (`<i>Aucun item physique rattaché à ce lieu.</i>`) sans
  l'envelopper dans une structure de tableau vide.

Confirmé indépendamment par `browsebysubject` sur `Test_260915c` :
`Located_at` = `Le_Buisson_de_Cerzat`, `Inventory_number` = `0003`.
