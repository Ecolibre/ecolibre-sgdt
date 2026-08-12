# Lot 9 — amendement 1

**Rédigé le 13 août 2026**, après le rapport de tâche 0 (`lot-9-tache0-rapport.md`)
et les arbitrages de Cyril. Amende `lot-9-cadrage-plantes.md` : les articles non
mentionnés ici restent en vigueur tels quels.

**Prérequis de lecture ajouté, omis par le cadrage initial : `lot-8-amendement-1.md`.**
C'est lui qui décrit le mécanisme de facette réellement en place ; le cadrage
décrivait celui du cadrage du lot 8, remplacé depuis.

---

## 1. Décisions corrigées

### 1.4 (remplacée) — Un lieu est une classe à part, hors de la chaîne à quatre niveaux

La décision initiale faisait du lieu un item physique. La tâche 0 a établi que
`Formulaire:Physical item` porte un champ `model_link` **obligatoire**, restreint
à `Category:Referenced item`, qui alimente `Instance_of`. Aucun lieu n'est
l'instance d'un modèle d'origine. La décision initiale reposait donc sur une
hypothèse fausse, découverte par lecture — cas d'école de la règle « lire l'état
réel avant de raisonner ».

**Le lieu devient sa propre classe.** Motifs :

- il n'a ni fonction à remplir, ni solution qui la remplit, ni route
  d'approvisionnement, ni niveau de maturité ;
- son parent est **unique**, là où `Part_of` est multivaluée sur les classes de
  conception : une cardinalité différente est déjà la moitié d'une classe ;
- `Part_of` signifie « est un composant de ». Un plant n'est pas un composant de
  son terrain, il s'y trouve. La relation est `Located_at`, pas `Part_of` — ce
  qui évite au passage d'ajouter un usage inter-niveaux à une propriété dont les
  requêtes manquent déjà de filtre de catégorie (limite connue).

Ce n'est pas la cinquième classe que le projet diffère : la réception est un
événement daté portant des quantités ; le lieu est une entité stable portant un
arbre de contenance. `Instance_of` reste obligatoire sur la classe physique.

### 1.7 (remplacée) — La seconde banque existe déjà

`Inventory_number` et `Inventory_site` existent depuis le 26 juillet, entièrement
documentées, et la numérotation par filtre `Category:Physical item` +
`Inventory_site` fonctionne. Rien à construire, rien à allouer à la main au sens
d'un mécanisme nouveau, aucune modification de `Module:Base36`.

L'arbitrage n° 2 du cadrage est **sans objet**. Ce qui subsiste de la décision :
la valeur stockée reste non préfixée, `ECL` reste un affichage, et
`Module:Base36` s'arrêtant au tiret reste la raison de ne jamais stocker de
valeur préfixée.

**Ceci ferme la correction en attente n° 2 de `CLAUDE.md`** : les items physiques
ne rejoignent pas la séquence commune, ils ont la leur, et c'est déjà le cas.

### 1.11 (nouvelle) — La maille de l'item physique est la plantation

Un item physique végétal est une **plantation** : une espèce, mise en terre à un
lieu, à une date. Clé : `espèce × lieu × date de mise en terre`.

- Un massif de poireaux perpétuels planté au printemps et un second issu des
  bulbilles du premier, planté en août, sont **deux items**.
- La roquette sauvage du terrain et celle de la terrasse sont **deux items**, le
  lieu faisant partie de la clé.
- Toutes les photos d'un même massif planté le même jour se rattachent au **même
  item**.

Ce n'est pas la résolution générale de « vingt carottes ne sont pas vingt items
physiques » : c'est la règle pour les plantations de vivaces, et elle doit être
écrite comme telle dans la page de registre `Facette végétal`. Le semis en lot
reste ouvert.

Ce qui justifie cette maille est la décision 1.1 : la date individualise. C'est
donc elle qui définit la maille, pas l'individu biologique.

**`Planted_count`** — nombre d'individus mis en terre à cette plantation,
facultatif, renseigné quand c'est pertinent. Attribut de l'événement de
plantation : il ne se met pas à jour. Un recensement ultérieur est une
observation datée, donc lot 7. **Propriété absente ≠ zéro** : absente signifie
non compté.

### 1.12 (nouvelle) — Filiation entre plantations

Le cas des bulbilles est arrivé avant le lot qui devait le traiter. Une
plantation issue d'une autre plantation du même terrain porte
**`Propagated_from`**, type Page, simple, facultative, d'item physique vers item
physique.

**Portée à ne pas dépasser :** la relation est de plantation à plantation, jamais
d'individu à individu. La filiation pied mère → bouture au sens strict reste
renvoyée. À écrire dans la page de registre, faute de quoi la propriété sera
promue plus tard en quelque chose qu'elle n'est pas.

**Conséquence sur le niveau référencé :** une plantation auto-multipliée pointe
par `Instance_of` vers **le même item référencé que sa plantation mère**. La
génétique est identique — c'est précisément ce que le référencé porte selon la
décision 1.2. `Propagated_from` enregistre la route réelle, `Instance_of` la
provenance génétique. Aucun item référencé supplémentaire n'est créé pour une
multiplication maison.

### 1.13 (nouvelle) — La localisation n'est pas datée

`Located_in` (lieu → lieu parent) et `Located_at` (item physique → lieu) sont
**simples et sans date**. Un lieu ne se déplace pas ; un arbre planté non plus.

Ce qui varie dans le temps — un camion, une épicerie ambulante, un outil prêté —
n'est ni le lieu ni l'objet : c'est une **présence**, relation entre une entité,
un lieu et une fenêtre temporelle. Donner plusieurs parents à un lieu pour
modéliser une tournée encoderait le temps dans une structure qui n'en a pas, et
se paierait sur tous les lieux fixes.

**À consigner comme observation d'architecture :** c'est la troisième fois que le
modèle bute sur le même objet manquant — la réception (quantité, date, route),
la récolte (événement daté et répété), la présence (entité, lieu, créneau). Trois
besoins, une seule construction. Le jour où l'un des trois sera traité, il devra
l'être pour les trois.

---

## 2. Tâches modifiées

### Tâche 0-bis — Compléments de reconnaissance. Aucune écriture.

1. **`Spécial:Version` : l'extension Maps est-elle installée ?** Elle conditionne
   le type des coordonnées (voir tâche 6). Si absente, c'est une demande
   d'installation à fuzzy, hors périmètre de Cyril, et le lot applique le repli.
2. **Relire `lot-8-amendement-1.md`, `Modèle:Organic facet plant` et
   `Formulaire:Organic item`** pour relever le montage exact du gabarit à
   instance optionnelle, à copier à l'identique.
3. **Dénombrer les plantations** depuis `plants-2026-08.tsv` une fois rempli, et
   en déduire le nombre d'items organiques et référencés à créer. Ce chiffre
   conditionne le découpage en sessions.

### Tâche 1 (révisée) — Les propriétés

`Inventory_number` existe : ne pas la créer. À créer :

| Propriété | Type | Porteur | Cardinalité |
|---|---|---|---|
| `Planting_date` | Date | item physique | single |
| `Planting_rank` | Number | item physique | single |
| `Specimen_status` | Text, énumération fermée | item physique | single |
| `Planted_count` | Number | item physique | single |
| `Propagated_from` | Page | item physique | single |
| `Located_at` | Page | item physique | single |
| `Sourcing_year` | Number | item référencé | single |
| `Located_in` | Page | lieu | single |
| `Place_name` | Text | lieu | single |
| `Postal_address` | Text | lieu | single |
| coordonnées | voir tâche 6 | lieu | single |
| `Depicts_specimen` | Page | page `Fichier:` | multiple |
| `Image_date` | Date | page `Fichier:` | single |
| `Image_location` | Page | page `Fichier:` | single |

`Property_range` des propriétés de type `Date` : **`date de calendrier`**, formule
validée par Cyril, textuelle, dans la ligne de la convention `Max_head`.

Le point de convention sur le domaine des propriétés de page `Fichier:` reste
ouvert et à faire valider avant écriture (arbitrage 4 du cadrage).

### Tâches 2 et 4 (à réécrire avant exécution)

Le mécanisme décrit par le cadrage — champ `Item_facet` en cases à cocher plus
`show on select` — **n'existe pas**. Le mécanisme réel est un gabarit Page Forms
à instance optionnelle (`multiple|minimum instances=0|maximum instances=1`),
`Item_facet` étant émis par le modèle.

Réécrire les deux tâches depuis le montage relevé en tâche 0-bis point 2, en le
copiant à l'identique plutôt qu'en le réinventant.

**Point ouvert, à faire valider par Cyril :** au niveau organique, `Item_facet`
est émis quand `Taxon_name` est rempli. Le bloc physique n'a pas de `Taxon_name`.
Recommandation : **émission inconditionnelle**, l'instance étant déjà opt-in — sa
seule présence signifie que la facette s'applique. À confronter au précédent
organique avant d'écrire : si le garde sur `Taxon_name` existe pour une raison
non visible ici, elle vaudra aussi au niveau physique.

Reste valable sans changement : la contrainte de rédaction (pas de table wiki
dans l'argument d'un `{{#if:}}`), l'échappement HTML des accolades dans la
sous-page transcluse, et le test de réouverture par formulaire.

### Tâche 6 (remplacée) — La classe Lieu

- `Catégorie:Lieu`, `Modèle:Lieu`, pas de formulaire dans ce lot : trois pages
  s'écrivent en wikitexte.
- Pas de référence Base 36 : les lieux sont peu nombreux et nommés. À
  réexaminer le jour où ils se compteront par dizaines.
- Trois pages : Le Buisson de Cerzat, Jardin de Chilhac, Terrasse de Chilhac.

**Coordonnées.** Si Maps est installée, type natif `Geographic coordinate`, une
seule propriété. Sinon, repli en deux propriétés `Latitude` et `Longitude` de
type `Number` : la donnée est stockée sans être cartographiée, et ne sera pas à
ressaisir le jour de l'installation.

Saisie à la main pour trois lieux. Le géocodage depuis une adresse existe
(Nominatim, OpenStreetMap), mais automatiser un appel externe pour trois valeurs
coûte plus cher que les trois valeurs.

**Précision à choisir par Cyril avant écriture :** une terrasse est un domicile,
et le wiki public est la cible à terme. Centroïde du site ou point exact — la
décision se prend maintenant, pas après publication.

### Tâche 7 (révisée) — Génération depuis le tableau

Entrée unique : `plants-2026-08.tsv`. Une ligne = une plantation.

Pour chaque ligne :

- **item organique** — une seule page par espèce, quel que soit le nombre de
  plantations. `Taxon_name` seul plus la facette ; les 37 propriétés restent
  vides.
- **item référencé** — un par `espèce × provenance × année`. Plusieurs
  plantations peuvent partager le même. Une plantation auto-multipliée réutilise
  le référencé de sa mère (décision 1.12).
- **item physique** — `Instance_of`, `Located_at`, `Planting_date`,
  `Planting_rank`, `Specimen_status`, `Planted_count` si renseigné,
  `Propagated_from` si applicable, `Item_facet`, `Inventory_number`.

**Convention de titre**, à valider par Cyril :
`<Nom courant> — <lieu> — <AAAA-MM>`. Jamais de virgule, la virgule étant le
délimiteur multi-valeurs du modèle.

**Attribution explicite des références.** Vu le volume, ne pas laisser le module
calculer page après page : lire le maximum courant **une fois**, puis écrire
`Inventory_number` littéralement dans chaque page. Motif : le module lit le
magasin SMW, la file de travaux ne se vide pas par le trafic de lecture, et
quarante écritures rapprochées risquent de lire le même maximum périmé — le
doublon que le module d'audit ne sait pas détecter (correction en attente n° 1).

Conditions strictes, à respecter sans exception : lecture du maximum **en ligne**
et immédiatement avant ; toutes les écritures dans **une seule session** ; aucune
création d'item physique par le formulaire pendant ce temps ; **contrôle de
doublons après coup** par une requête comptant les valeurs d'`Inventory_number`.
Ce contrôle est une requête, pas une modification du module : la correction n° 1
reste due.

### Tâche 8 (révisée) — Annotation des photos

Les 71 photos correctement nommées peuvent toutes être annotées, tous les plants
existant désormais. Rattachement par le champ `<plante>` du nom de fichier, et
par le champ `<lieu>` — deux plantations d'une même espèce sur un même lieu se
départagent par `Image_date` comparée aux dates de plantation.

Les deux fichiers au nommage défectueux restent hors périmètre : ré-téléversement
sous nom correct en tâche 11, pas de renommage.

---

## 3. Ce qui ne change pas

Décisions 1.1, 1.2, 1.3, 1.5, 1.6, 1.8, 1.9, 1.10 ; conventions du §2 ; tâches 3,
5, 9, 10, 11 ; conditions d'arrêt.

`Procurement_route` n'existe pas — le dépôt avait raison contre la note
d'architecture. Le lot ne la crée pas, elle appartient au lot 7.

---

## 4. Volume et découpage

L'estimation initiale de vingt écritures est caduque. Ordre de grandeur réel :
~30 items organiques, ~20 référencés, ~40 plants, 3 lieux, 13 propriétés, 3
modèles, un bloc de formulaire, une page récapitulative, 71 annotations de
fichiers, quatre éditions de documentation — **environ 200 écritures**.

C'est tenable uniquement parce que tout se génère depuis un tableau unique. **Le
chemin critique n'est plus le wiki mais le remplissage de `plants-2026-08.tsv`.**

Découpage en sessions :

1. Tâche 0-bis, puis tâches 1 à 5 — schéma, mécanisme, test bac à sable.
2. Tâche 6 — les trois lieux.
3. Tâche 7 — génération depuis le TSV, en une seule session pour la contrainte
   d'attribution des références.
4. Tâches 8 et 9 — annotation et page récapitulative, purge, vérification du
   rendu réel.
5. Tâches 10 et 11 — documentation, après la réunion.

**Repli si le temps manque avant la réunion :** la page récapitulative peut
afficher les photos par nom de fichier plutôt que par requête sémantique. Moins
élégant, et ça tient debout devant Mathieu.

---

## 5. Restant à trancher

1. Maps installée ou non — lecture, pas arbitrage.
2. Précision des coordonnées : centroïde ou point exact.
3. Convention de titre des items physiques.
4. Formule de `Property_domain` pour les propriétés de page `Fichier:`.
5. Émission conditionnelle ou non d'`Item_facet` au niveau physique.
