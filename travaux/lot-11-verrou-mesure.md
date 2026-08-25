# Lot 11 — le verrou de propagation, mesuré plutôt que déduit

2026-08-25. Deux diffs proposés, aucune écriture. Base : les cinq
écritures réussies et les cinq refus identiques accumulés depuis le 21
août 2026 sur `Attribut:INSEE code` (`lot-11-tache1-execution.md` : trois
tentatives ; `lot-11-tache1-cloture.md` : une tentative ; ce lot,
`lot-11-property-range.md` : une tentative — 3+1+1 = 5), et les cinq
propriétés du lot 7 corrigées le 25 août sans aucun refus
(`lot-11-property-range.md`).

## 1. `demandes-adminsys.md` — troisième réécriture de l'entrée `$smwgChangePropagationProtection`

La version en place (lignes 118-136) contient une généralisation jamais
vérifiée — la mienne, posée dans `lot-11-dette-post-tache1.md` puis
recopiée ici : « le verrou frappe toute page de propriété pendant sa
propre propagation de changement… à chaque création de propriété ».
**Mesuré faux le 25 août** : cinq créations de propriété n'ont déclenché
aucun verrou.

```diff
-- **`$smwgChangePropagationProtection` — verrou structurel, pas un incident
-  ponctuel du 15 août.** Cette entrée décrivait jusqu'ici un verrou orphelin,
-  propre aux 15 pages `Attribut:` créées le 15 août 2026, et débloqué depuis.
-  Faux : constaté à nouveau le 21 août 2026 sur `Attribut:INSEE code`, créée
-  le jour même (lot 11, tâche 1) — trois tentatives de correction dans la
-  même session, trois refus `smw-change-propagation-protection` identiques.
-  **Le verrou frappe toute page de propriété pendant sa propre propagation
-  de changement : il se redéclenche à chaque création de propriété**, pas
-  seulement lors de l'incident du 15 août — donc sur ce lot et les suivants,
-  à chaque fois qu'une propriété est créée.
-  Bloque à ce jour, en plus d'`INSEE_code` : les cinq propriétés du lot 7
-  (`Edible_parts`, `Plant_habit`, `Propagation_method`, `Root_system`,
-  `Seed_treatment`), dont le `Property_range` est cassé pour une raison
-  distincte (plafond `Keyword` de 85 caractères — voir
-  `Limites connues du SGDT` et `Erreurs de traitement SMW` sur le wiki) et
-  attend une correction retenue par ce même verrou. **Demande à fuzzy** :
-  `$smwgChangePropagationProtection = false` dans
-  `LocalSettings_ecolibre.php` — la protection empêche aujourd'hui une
-  correction légitime aussi souvent qu'un accident.
+- **`$smwgChangePropagationProtection` — un verrou mesuré sur une seule
+  page, pas une règle générale.** Deux versions précédentes de cette
+  entrée ont chacune généralisé depuis un seul cas, sans le vérifier :
+  d'abord un incident ponctuel du 15 août, puis « le verrou se
+  redéclenche à chaque création de propriété ». **Aucune des deux ne
+  tient à l'épreuve du mesuré, au 25 août 2026** :
+  - **Une seule page reste verrouillée sur tout le wiki :
+    `Attribut:INSEE code`**, depuis sa création le 21 août 2026.
+  - **Cinq tentatives d'écriture sur cette page, cinq refus
+    identiques** (`smw-change-propagation-protection`), la dernière le
+    25 août — jamais corrigée depuis sa création.
+  - **Les cinq propriétés du lot 7 qu'on croyait verrouillées par le
+    même mécanisme** (`Edible_parts`, `Plant_habit`,
+    `Propagation_method`, `Root_system`, `Seed_treatment`) **ne
+    l'étaient pas** : `Property_range` corrigé sur chacune le 25 août
+    2026, du premier coup, sans aucun refus.
+  - **`Attribut:Planting rank`, créée le 24 août 2026, s'édite
+    normalement** — plusieurs écritures les 24 et 25 août, aucun refus.
+  - **Le verrou n'est donc ni systématique à la création d'une
+    propriété, ni lié à une date de création : c'est une propagation
+    bloquée sur une page précise**, pas un régime qui s'applique à toute
+    création de propriété.
+
+  **Demande à fuzzy** — deux pistes, pas une certitude sur laquelle
+  trancher depuis ce côté-ci :
+  1. Vérifier `$smwgChangePropagationProtection` dans
+     `LocalSettings_ecolibre.php` (valeur actuelle jamais lue
+     directement depuis ici).
+  2. **Vider la file de travaux — probablement suffisant à lever ce
+     verrou précis**, un verrou de propagation attendant par
+     construction qu'un job s'exécute. Note pour fuzzy : un vidage de
+     file n'avait *pas* suffi sur le verrou orphelin de la section 2.1
+     de cette page (`lot-9-tache0-rapport.md` §10, file déjà vide au
+     moment du blocage) — deux cas qui se ressemblent en surface, pas
+     nécessairement la même cause.
```

Pas écrit — proposition seule, comme demandé.

## 2. `CLAUDE.md` — la leçon la plus transférable de la session

Insertion proposée : nouvelle puce en fin de section « Leçons de méthode
(wiki et outillage) », juste avant « ## Garde-fous d'exécution (dépôt
git) » — même emplacement que la puce ajoutée plus tôt dans cette
session sur l'environnement cloud.

```diff
   de SMW doit d'abord se vider. Une première lecture peut ne montrer
   qu'une clé `_CHGPRO` portant les valeurs en JSON, sans aucun fait direct
   (`Has type`, `Property_range`… absents de `browsebysubject`). **Ce n'est
   pas un échec de stockage.** Relire après vidage de la file plutôt que
   réécrire. Constaté le 19 août 2026, seize jobs en attente
   (`action=query&meta=siteinfo&siprop=statistics`, clé `jobs`).
 
 - **Le 24 août 2026, dans un environnement Claude Code hébergé (cloud
   Anthropic), le proxy sortant a refusé wiki.ecolibre.org (403 au
   CONNECT).** Ni lecture ni écriture ; seul le travail sur les fichiers du
   dépôt était possible. Symptôme trompeur : `wiki-api.sh` renvoie une
   sortie vide avec un code de sortie 0, sans message. Une sortie vide ne
   signifie donc pas toujours « aucun résultat » — elle peut signifier
   « rien n'est sorti de la machine ».
 
+- **Un blocage déduit n'est pas un blocage constaté.** Le 21 août 2026,
+  une écriture refusée sur `Attribut:INSEE code` a fait conclure que les
+  cinq propriétés du lot 7 étaient sous le même verrou. Personne ne
+  l'avait testé. Le 25 août, les cinq se sont écrites du premier coup.
+  **Avant de déclarer une correction impossible, tenter l'écriture sur
+  un cas — le refus coûte moins cher que la dette.**
+
 ## Garde-fous d'exécution (dépôt git)
```

Pas écrit — proposition seule, comme demandé.
