# Lot 9 — Tâche 0 — Reconnaissance (aucune écriture)

**Exécuté le 13 août 2026.** Toutes les lectures ci-dessous viennent d'appels
API en direct (`wiki-get.sh` / `wiki-api.sh` / `browsebysubject`), pas de
copie locale ni de mémoire de session précédente.

---

## 0. À lire en premier — deux conditions d'arrêt déclenchées

Le cadrage prévoit que le lot s'arrête si l'une de ses trois conditions se
vérifie. **Deux se vérifient.** Rien n'a été écrit ; ceci est un signalement,
pas un contournement.

### Blocage A — le lien vers un item référencé est obligatoire, et incompatible avec les 3 items de lieu

`Formulaire:Physical item` a un champ `model_link` marqué **`mandatory`**,
restreint à `values from category=Referenced item`. Il alimente la propriété
`Instance_of` (déjà documentée : domaine `Physical_item`, portée
`Referenced item`, cardinalité `single`). C'est le lien vers le niveau
supérieur que cherchait le point 2 — il existe déjà, il est obligatoire, et
il pointe bien vers un item référencé.

Il convient très bien aux **5 plants** de la tâche 7 : chacun aura son item
référencé (provenance + année) à instancier via ce même champ.

Il **ne convient à aucun des 3 items de lieu** de la tâche 6 (Le Buisson de
Cerzat, Jardin de Chilhac, Terrasse de Chilhac) : un lieu n'est l'instance
d'aucun « modèle d'origine ». Les deux seuls items référencés existants
aujourd'hui sont `Batterie défaillante récupérée` et `Bidon 220L bleu
plastique Borde` — aucun gabarit de « lieu » n'existe dans cette catégorie et
en créer un serait un contresens sémantique.

**À trancher par Cyril** avant la tâche 6 : rendre le champ facultatif
seulement pour le cas lieu (risque : le formulaire est partagé, une
modification touche aussi les 5 plants et les items techniques existants) ;
ou trouver un autre chemin pour les lieux (formulaire séparé, valeur
sentinelle, item référencé générique « Aucun / lieu physique »). Aucune
option n'a été retenue ici — c'est un arbitrage, pas une reconnaissance.

### Blocage B — le mécanisme de facette réellement en place n'est pas celui décrit aux tâches 2 et 4

Le cadrage (tâches 2 et 4) suppose un champ `Item_facet` en `checkboxes`,
`show on select` vers un bloc, avec le piège « doit être enregistré sur la
page sinon les cases se décochent ». **Ce n'est pas le mécanisme utilisé.**

Le mécanisme réel, documenté dans `lot-8-amendement-1.md` et confirmé par
lecture directe de `Formulaire:Organic item` et `Modèle:Organic facet
plant` :

- Pas de champ de sélection. Le bloc facette est un **gabarit à instance
  optionnelle** de Page Forms :
  `{{{for template|Organic facet plant|multiple|minimum instances=0|maximum instances=1|add button text=Ajouter les caractéristiques végétales}}}`.
  Un bouton « Ajouter » fait apparaître le bloc ; rien à cocher.
- `Item_facet` **n'est pas un champ de formulaire**. Il est émis
  automatiquement par le modèle de facette lui-même :
  `{{#if:{{{Taxon_name|}}}|{{#set:...|Item_facet=Facette végétal}} ...}}` —
  conditionné sur la présence de `Taxon_name`, pas sur une case cochée.
- La table d'affichage est **hors** du `{{#if:}}` (comme l'exige la
  contrainte déjà payée deux fois au lot 8) ; seuls le `#set` et la
  catégorisation sont dedans.
- Catégorie réellement émise : `[[Category:Item à facette végétal]]` — pas
  un nom déduit, celui-là précisément.

**Conséquence :** les tâches 2 et 4 du cadrage, telles qu'écrites, décrivent
un montage abandonné (le commentaire dans le wikitexte le dit explicitement :
« le mécanisme retenu … est l'ajout d'instance de modèle (amendement 1), pas
un champ de sélection »). Il faut les réécrire pour coller au montage réel
avant exécution — copier le motif `for template|...|multiple|minimum
instances=0|maximum instances=1` de `Modèle:Organic facet plant`, pas
inventer un `show on select`.

Le cadrage ne cite pas `lot-8-amendement-1.md` dans ses prérequis de lecture ;
c'est probablement l'origine de l'écart.

---

## 1. Nom réel du formulaire des items physiques

`Formulaire:Physical item` (pageid 64) — confirmé par `list=allpages` sur le
namespace 106, pas déduit. Existe aussi `Formulaire:Physical item/doc`
(pageid 68).

## 2. `Modèle:Physical item` et le formulaire, lus en entier

**Convention de nommage des paramètres — ancienne, confirmée.** Les
paramètres du modèle (`site_code`, `ref_number`, `description`, `model_link`,
`physical_parent`, `sn`) ne portent pas le nom des propriétés qu'ils
alimentent (`Inventory_site`, `Inventory_number`, `Item_description`,
`Instance_of`, `Part_of`, `Serial_number`). C'est bien l'écart signalé au §3
du cadrage — vérifié, pas supposé.

**Propriété portant la référence :** `Inventory_number` (param `ref_number`),
plus `Inventory_site` (param `site_code`) et une propriété calculée
`Inventory_ref` = concaténation `{{{site_code}}}-{{{ref_number}}}`.
**Ces trois propriétés existent déjà sur le wiki**, avec documentation
complète (voir §3 ci-dessous).

**Propriété reliant au niveau supérieur :** `Instance_of` (param
`model_link`) — voir Blocage A.

**Numérotation automatique déjà en place.** Le champ `ref_number` du
formulaire calcule sa valeur par défaut ainsi :
```
{{#invoke:Base36|next|{{#ask: [[Category:Physical item]] [[Inventory_site::{{Préfixe site}}]]
 [[Inventory_number::+]] |?Inventory_number= |sort=Inventory_number |order=desc
 |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }}
```
C'est déjà, concrètement, la « seconde banque Base 36 » de la décision 1.7 :
filtrée sur `Category:Physical item` et `Inventory_site`, indépendante de la
séquence commune (`Item_ref`, filtrée sur `Category:Functional item||Organic
item||Referenced item` dans `Formulaire:Organic item`). Rien à construire ici,
seulement à réutiliser.

`{{Préfixe site}}` retourne déjà `ECL` (constante de site existante,
documentée sur `Registre des préfixes de site` selon sa propre doc).

## 3. Les trois items physiques existants

| Item | site_code | ref_number | model_link (Instance_of) |
|---|---|---|---|
| Batterie de récupération trotinette 1 | `CWL` | `0007` | Batterie défaillante récupérée |
| Bidon 220L Bleu 1 | `ECL` | `0001` | Bidon 220L bleu plastique Borde |
| Bidon 220L Bleu 2 | `ECL` | `0002` | Bidon 220L bleu plastique Borde |

Aucun des trois n'utilise `Item_ref`. Ils relèvent déjà de la séquence
`Inventory_number`/`Inventory_site`, filtrée par site (`CWL` = un
partenaire, `ECL` = ce site). **La décision 1.7 est donc déjà appliquée dans
les faits** ; le prochain item ECL prendra `0003` automatiquement via le
formulaire, sans action manuelle. La « correction en attente n° 2 » de
`CLAUDE.md` (les objets physiques rejoignent-ils la séquence commune) est en
réalité déjà tranchée par l'usage : non, et depuis avant ce lot.

**`Attribut:Inventory number` existe déjà**, entièrement documenté :

- `Property_description_FR` : « Rang d'un exemplaire physique dans la
  séquence de numérotation de son détenteur. Identifiant Base 36 de
  4 caractères, sans préfixe. »
- `Property_domain` : `Physical_item`
- `Property_range` : « identifiant Base 36, 4 caractères »
- `Property_cardinality` : `single`
- Type SMW : `_keyw` (Keyword), pas `_txt` (Text)
- Modifiée le 2026-07-26, donc avant ce cadrage.

**Conséquence pour la tâche 1 :** ne pas recréer `Inventory_number` — la page
existe déjà et correspond à la décision 1.7. Seules 7 des 8 propriétés
listées en tâche 1 sont réellement à créer.

## 4. `Module:Base36`

Lu en entier, lecture seule, non modifié.

- `p.next` prend **une seule chaîne** en argument (`frame.args[1]`), la
  nettoie (`clean:match("[%w]+")` — s'arrête au premier caractère non
  alphanumérique, confirmant la correction en attente n° 3 sur le tiret),
  l'interprète en base 36, incrémente, reformate sur 4 caractères.
- Il ne connaît **ni propriété ni catégorie** : c'est l'appelant (le
  `#ask` dans le formulaire) qui décide quelle population interroger. Les
  « deux banques » sont donc déjà une question de requête, pas de module —
  aucune modification requise pour ce lot, conforme au périmètre annoncé.
- `p.findGaps` existe (détection de trous) ; aucune détection de doublons
  (correction en attente n° 1, toujours ouverte).

## 5. Mécanisme de facette réellement en place

Voir Blocage B ci-dessus pour le détail. Résumé : gabarit à instance
optionnelle Page Forms, pas de champ `Item_facet`, catégorie
`Item à facette végétal`, `#if` sur `Taxon_name` entourant uniquement le
`#set` et la catégorisation.

## 6. `Procurement_route`

**N'existe pas.** `browsebysubject` sur `Attribut:Procurement_route`
retourne `data: []`. La page n'apparaît pas non plus dans la liste complète
des 73 pages du namespace `Attribut:` (102) obtenue par `list=allpages`.

Ceci lève la contradiction notée au §3 du cadrage dans le sens du dépôt : le
lot 7 n'est pas exécuté, la propriété n'existe pas. Pour la tâche 7 : ne pas
la renseigner, ne pas la créer — conforme à l'instruction « sinon ne pas la
créer dans ce lot ».

## 7. Type `Date`

**Aucune propriété du wiki n'a `Has type::Date`** — vérifié par
`action=ask` sur `[[Has type::Date]]`, 0 résultat. Aucun précédent à
reprendre pour `Property_range`. À proposer et faire valider avant
d'écrire `Planting_date` et `Image_date`, comme prévu par le cadrage.

## 8. Inventaire des plantes photographiées (73 fichiers, découpage sur le tiret)

**Deux défauts de nommage supplémentaires trouvés en ligne**, distincts des
deux corrigés le 12 août (`badfilename`) — ceux-ci ont été acceptés sans
avertissement par MediaWiki car ils ne contiennent pas d'espace, mais ils
cassent le découpage sur le tiret désormais formalisé dans `CLAUDE.md` :

- `ECL-Buisson_CerzatHysope-2026-08-08_01.jpg` — tiret manquant entre
  `Cerzat` et `Hysope` (devrait être `Buisson_Cerzat-Hysope`).
- `ECL-Jardin_Cyril_Chilhac-Oignon_rocambole_2026-08-09_01.jpg` — underscore
  à la place du tiret avant la date (devrait être
  `Oignon_rocambole-2026-08-09_01.jpg`).

Ces deux fichiers sont exclus du tableau ci-dessous (comptés « lieu = valeur
corrompue » sinon) et signalés séparément — ils devront être renommés sur le
wiki avant d'être fiables pour l'annotation par script de la tâche 8, comme
les deux fichiers du 12 août l'ont été localement avant téléversement.

**33 plantes distinctes, 3 lieux, 71 photos correctement découpées sur 73 :**

| Lieu | Photos | Plage de dates |
|---|---|---|
| Buisson_Cerzat | 52 | 2026-08-05 → 2026-08-08 |
| Jardin_Cyril_Chilhac | 14 | 2026-08-05 → 2026-08-09 |
| Terrasse_Cyril_Chilhac | 5 | 2026-08-09 |

| Plante | Photos | Plage de dates | Lieu(x) |
|---|---|---|---|
| Ail_elephant | 4 | 2026-08-07 → 2026-08-08 | Buisson_Cerzat |
| Bourrache | 1 | 2026-08-08 | Buisson_Cerzat |
| Brocoli_vivace | 1 | 2026-08-08 | Buisson_Cerzat |
| Capucine_tubereuse | 1 | 2026-08-08 | Buisson_Cerzat |
| Chayote | 1 | 2026-08-08 | Buisson_Cerzat |
| Chou_Daubenton | 6 | 2026-08-08 → 2026-08-09 | Buisson_Cerzat, Jardin_Cyril_Chilhac |
| Consoude_B14 | 1 | 2026-08-08 | Buisson_Cerzat |
| Consoude_naine | 1 | 2026-08-08 | Buisson_Cerzat |
| Couleuvre_verte_et_jaune | 5 | 2026-08-05 | Buisson_Cerzat |
| Crosne_du_Japon | 1 | 2026-08-08 | Buisson_Cerzat |
| Egopode | 1 | 2026-08-08 | Buisson_Cerzat |
| Fraisier_X | 1 | 2026-08-08 | Buisson_Cerzat |
| Fraisier_X2 | 1 | 2026-08-08 | Buisson_Cerzat |
| Framboisier_classique | 2 | 2026-08-09 | Jardin_Cyril_Chilhac |
| Framboisier_jaune | 3 | 2026-08-09 | Jardin_Cyril_Chilhac |
| Gainage_cable | 1 | 2026-08-07 | Buisson_Cerzat |
| Groseiller | 1 | 2026-08-09 | Terrasse_Cyril_Chilhac |
| Groseiller_a_maquereau | 2 | 2026-08-09 | Jardin_Cyril_Chilhac |
| Helianthi | 1 | 2026-08-08 | Buisson_Cerzat |
| Hemerocalle | 4 | 2026-08-08 | Buisson_Cerzat |
| Menthe_X | 1 | 2026-08-08 | Buisson_Cerzat |
| Menthe_X_&_Chayote | 1 | 2026-08-09 | Terrasse_Cyril_Chilhac |
| Menthe_bergamote | 1 | 2026-08-08 | Buisson_Cerzat |
| Miscanthus | 4 | 2026-08-08 | Buisson_Cerzat |
| Oignon_rocambole | 1 (+1 mal nommée, voir ci-dessus) | 2026-08-08 | Buisson_Cerzat |
| Paulownia | 2 | 2026-08-08 | Buisson_Cerzat |
| Persil_japonais | 2 | 2026-08-09 | Terrasse_Cyril_Chilhac |
| Poireau_perpetuel | 13 | 2026-08-05 → 2026-08-09 | Buisson_Cerzat, Jardin_Cyril_Chilhac |
| Raboutage_cable_gaine | 2 | 2026-08-05 | Buisson_Cerzat |
| Roquette_sauvage | 2 | 2026-08-08 → 2026-08-09 | Buisson_Cerzat, Terrasse_Cyril_Chilhac |
| Sarrasin_vivace | 1 | 2026-08-08 | Buisson_Cerzat |
| Tomates | 1 | 2026-08-08 | Buisson_Cerzat |
| Yacon | 1 | 2026-08-08 | Buisson_Cerzat |
| **Hysope (mal nommée, voir ci-dessus)** | 1 | 2026-08-08 | Buisson_Cerzat |

`Couleuvre_verte_et_jaune` (5 photos) et `Gainage_cable` /
`Raboutage_cable_gaine` (3 photos) ne sont pas des plantes — faune et
infrastructure photographiées dans le même lot. À exclure du choix des cinq
plants.

**Meilleurs candidats pour les cinq plants** (photos multiples, dates
cohérentes, hors faune/infrastructure) : `Poireau_perpetuel` (13, deux lieux),
`Chou_Daubenton` (6, deux lieux), `Ail_elephant` (4), `Hemerocalle` (4),
`Miscanthus` (4). Simple lecture des volumes, pas une recommandation
horticole — le choix reste à Cyril.

## 9. Protection des pages

`prop=info&inprop=protection` sur les pages identifiées comme à modifier —
aucune protection native trouvée sur aucune :

| Page | Protection native |
|---|---|
| `Formulaire:Physical item` | aucune |
| `Modèle:Physical item` | aucune |
| `Facette végétal` | aucune |
| `Récapitulatif technique du Système de Gestion de Données Techniques` | aucune |
| `Limites connues du Système de Gestion de Données Techniques` | aucune |
| `Feuille de route du Système de Gestion de Données Techniques` | aucune |

Cohérent avec la mémoire de session : ce wiki n'a pas de protection native en
usage. **Lockdown reste invisible à `prop=info` et peut restreindre sans
apparaître ici** — rappel du garde-fou n° 5 de `CLAUDE.md`, pas vérifié
autrement qu'en essayant d'écrire.

---

## 10. Complément post-tâche 0 — verrou de propagation SMW sur les modifications (constaté en tâche 1, le 15 août)

Consigné ici sur demande explicite de Cyril, bien que découvert pendant
l'exécution de la tâche 1, parce que c'est une limite du wiki de la même
nature que les points ci-dessus (à connaître avant d'écrire, pas un incident
isolé).

**Constat :** toute tentative d'édition (hors création) sur une page
`Attribut:` créée dans cette session échoue avec l'erreur API
`smw-change-propagation-protection` :

> This page is locked to prevent accidental data modification while a change
> propagation update is run. The process may take a moment before the page is
> unlocked as it depends on the size and frequency of the job queue scheduler.

**Portée du test.** Une tentative d'écriture à blanc (contenu strictement
identique, aucun changement) sur les 13 pages `Attribut:` créées aujourd'hui
autres que celles visées par une correction (`Planting_date`, `Planting_rank`,
`Planted_count`, `Located_at`, `Sourcing_year`, `Located_in`, `Place_name`,
`Postal_address`, `Latitude`, `Longitude`, `Depicts_specimen`, `Image_date`,
`Image_location`) a échoué avec la même erreur, sur les 13. Une seule
tentative par page, sans insister. **Le verrou touche donc l'ensemble des 15
pages créées aujourd'hui, pas seulement les deux visées par une correction.**

**Cause et remède, d'après la documentation SMW (`Help:Change propagation`,
paramètre `$smwgChangePropagationProtection`) :** le verrou tient tant que le
`ChangePropagationDispatchJob` associé n'a pas été exécuté. Purger la page
(`bin/wiki-purge.sh`) n'aide pas — cela ne fait qu'empiler un nouveau job sans
en accélérer le traitement. La levée du verrou est côté serveur
(exécution de `runJobs.php`, ou dépannage via `$smwgChangePropagationProtection`),
donc hors du périmètre de ce compte bot — du ressort de fuzzy/admin serveur.

**Conséquence pratique retenue pour la suite du lot :** les créations de
pages passent sans problème (le verrou ne bloque que l'édition d'une page
déjà verrouillée) ; **les modifications ne passent pas** tant que le job n'a
pas tourné. Ne pas retenter en boucle une édition bloquée par ce code
d'erreur — attendre un signal explicite que le verrou est levé (nouvelle
tentative isolée, pas de boucle serrée).

**Diagnostic serveur effectué le 16 août 2026 — trois résultats négatifs, à ne
pas refaire.** L'hypothèse de travail ci-dessus (« le verrou tient tant que le
`ChangePropagationDispatchJob` n'a pas tourné ») a été testée en direct sur
`serveur3.initiative.place`, avec `SERVER_NAME=wiki.ecolibre.org` sur chaque
commande. Les trois pistes échouent :

1. **`showJobs.php --group` rend une file vide.** Il n'y a aucun
   `ChangePropagationDispatchJob` en attente — donc rien à exécuter, et
   `runJobs.php` n'a rien à traiter qui puisse lever le verrou. C'est le
   résultat qui invalide l'hypothèse : le verrou n'attend pas un job, il
   survit à son absence.
2. **La purge ne reprogramme aucun job.** `bin/wiki-purge.sh` sur une page
   verrouillée laisse la file vide — la purge ne recrée pas le job manquant,
   contrairement à ce que la note ci-dessus laissait espérer.
3. **`rebuildData.php --page` traite la page sans relâcher le verrou.** Le
   traitement se déroule normalement, et la page reste verrouillée après.

**Conclusion : verrou orphelin.** Le drapeau de protection subsiste sans job
associé pour le consommer, et aucune commande de maintenance en lecture ou en
reconstruction ne le retire. **Le seul levier restant est
`$smwgChangePropagationProtection`** dans la configuration du site
(`LocalSettings_ecolibre.php`), **côté fuzzy** — hors de portée de Cyril par
convention de gouvernance (voir `demandes-adminsys.md`), et hors de portée du
compte bot en tout état de cause.

**Ne pas refaire ce diagnostic** : les trois commandes ci-dessus ont été
passées, leur résultat est négatif et consigné. Toute nouvelle tentative de
lever le verrou par la file de travaux ou par `rebuildData` perdra du temps
sans rien changer.

**Restent dues, non appliquées :**
- Correction sur `Attribut:Propagated_from` : retrait de la restriction
  « sur le même terrain » (`Property_description_FR`/`EN`).
- Correction sur `Attribut:Specimen_status` : ajout de la valeur `en réserve`
  (`Allows value` + `Property_description_FR`/`EN` révisées).

**Correction du 15 août 2026 — `Allows value` rejette, il n'avertit pas.**
Vérifié par Cyril sur `Test 260915a` : `Specimen_status=en réserve` ne
remonte pas dans Spécial:Parcourir, alors que `Specimen_status=en place`
(saisi sur un autre item de test) y remonte normalement. Ceci contredit ce
qui avait été supposé ailleurs dans le lot (tâche 4) — qu'un avertissement
« Has improper value for » serait affiché mais la valeur tout de même
stockée. Ce n'est pas le cas : tant que `en réserve` n'est pas dans
`Allows value` de `Attribut:Specimen_status`, la valeur est **rejetée**, pas
seulement signalée.

**Conséquence pratique, propagée au modèle de facette :** `Specimen_status`
porte le `#if` qui déclenche `Modèle:Physical facet plant` (décision actée
en tâche 2). Une valeur rejetée équivaut à un champ vide pour ce `#if`. Tant
que le verrou SMW n'est pas levé, une plantation saisie avec le statut
`en réserve` n'émet **ni facette, ni catégorie, ni ligne de récapitulatif**
— la donnée saisie au formulaire est silencieusement perdue au niveau du
modèle, pas seulement mal affichée en page Attribut.

---

## Résumé — ce qui doit revenir à Cyril avant toute écriture

1. **Blocage A** : comment traiter le lien obligatoire `model_link` →
   `Referenced item` pour les 3 items de lieu, qui n'ont pas de modèle
   d'origine naturel.
2. **Blocage B** : les tâches 2 et 4 du cadrage doivent être réécrites pour
   le mécanisme réel (gabarit à instance optionnelle), pas le mécanisme
   supposé (checkbox + show on select).
3. Tâche 1 : ne pas recréer `Inventory_number`, déjà présente et documentée
   — 7 propriétés à créer, pas 8.
4. Deux fichiers déjà en ligne à renommer (tiret manquant / underscore à la
   place du tiret) avant de servir de source fiable à la tâche 8 :
   `ECL-Buisson_CerzatHysope-2026-08-08_01.jpg` et
   `ECL-Jardin_Cyril_Chilhac-Oignon_rocambole_2026-08-09_01.jpg`.
5. Le choix des cinq plantes (point 8) et la formule de `Property_range`
   pour le type `Date` (point 7), comme déjà prévu au cadrage.

Aucune des trois conditions d'arrêt du cadrage n'était censée porter sur les
tâches 2/4 (elle vise le point 5), mais l'écart trouvé au point 5 a la même
gravité pratique — je le remonte au même niveau.
