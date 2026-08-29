# Lot 10 — tâche 6 : la vue « Procédés et outils » et le guide de saisie

Date : 29 août 2026. Trois pages créées (`Modèle:Procédés et outils/ligne`,
`Procédés et outils`, `Guide de saisie`), une modifiée (`Feuille de route du
SGDT`). Deux pages de test à supprimer par Cyril.

---

## Étape 1 — découverte : les trois formes essayées

Parcours sur `[[Category:Procédé]]` = **5 procédés** : Assembler, Braser
tendre, Maintenir en position, Mesurer une grandeur électrique, Souder par
points.

`|?Realizes_function` sur un procédé rend **vide** : la propriété est portée
par l'organique et pointe *vers* le procédé. Il faut l'inverse `-Realizes_function`.

### Forme A — parcours des procédés avec sous-requête `#ask` imbriquée

**Testée pour de bon**, pas seulement en théorie : gabarit jetable
`Modèle:Test lot10 ligne` + page `Utilisateur:Cywil/Bac à sable/Lot10 vue`,
rendus via `action=parse`. Un `#ask` imbriqué dans un modèle appelé en
`format=template` par un `#ask` extérieur **fonctionne sur cette
installation**. Sortie réelle du test :

```
Assembler                        → Aucun exemplaire disponible pour ce procédé.
Braser tendre                    → CWL-0009 (0009, Atelier appartement)
                                   CWL-0008 (0008, Atelier appartement)
Maintenir en position            → CWL-000B (000B, Atelier appartement)
Mesurer une grandeur électrique  → CWL-000A (000A, Atelier appartement)
Souder par points                → CWL-0008 (0008, Atelier appartement)
```

Le `|default` de la sous-requête rend bien le message d'absence sur la ligne
Assembler. **Forme retenue.**

### Forme B — impression par chaîne inverse

`[[Category:Procédé]] |?-Realizes_function` remonte aux organiques
(fonctionne). **SMW enchaîne bien les inverses** :
`|?-Realizes_function.-Corresponds_to_organic.-Instance_of` rend directement
les exemplaires physiques —

```
Assembler                        → (rien)
Braser tendre                    → CWL-0009, CWL-0008
Maintenir en position            → CWL-000B
Mesurer une grandeur électrique  → CWL-000A
Souder par points                → CWL-0008
```

Et une chaîne mixte inverse→directe passe aussi :
`|?-Realizes_function.-Corresponds_to_organic.-Instance_of.Inventory_number`
et `.Located_at` rendent les colonnes correspondantes.

**Données exactes, une seule requête, une seule page.** C'est d'ailleurs
l'idiome déjà employé sur *Avancement du jardin-forêt*
(`?-Corresponds_to_organic.-Instance_of`). **Écartée pour un seul motif :**
le `|default` d'un `#ask` en table s'applique à la table entière, pas par
cellule — la ligne Assembler rend des cellules vides, sans le message
d'absence explicitement demandé par la consigne (section 2 et vérif.
étape 5). La chaîne d'impression triple est aussi peu lisible à froid.

### Forme C — deux tableaux séparés (repli)

- Table procédés `|?-Realizes_function` : rend les procédés avec leurs
  organiques, procédés sans outil compris.
- Table `[[Category:Physical item]][[Instance_of.Corresponds_to_organic.Realizes_function::+]]`
  avec `|?Instance_of.Corresponds_to_organic.Realizes_function`,
  `|?Inventory_number`, `|?Located_at` : rend une ligne par exemplaire — mais
  **ratisse plus large que les 5 outils** (y remontent « Bidon 220L Bleu 1 »
  → « Stocker l'eau non potable », etc. : d'autres physiques ont un procédé
  via la chaîne). Aucun procédé sans outil dans cette seconde table.

Fonctionnelle, mais deux tables à recouper mentalement et pas de message
d'absence par procédé. Non retenue.

### Choix

**Forme A.** C'est la seule qui rend le message d'absence par procédé (exigé),
et une fois le gabarit lu une fois, la page principale est un simple
`{{#ask: [[Category:Procédé]] |format=template |template=… }}` — lisible dans
six mois. Le prix est une page de plus (`Modèle:Procédés et outils/ligne`),
sous-page dédiée, non transclue ailleurs.

### Collation reconfirmée

`[[Category:Referenced item]] |?Item_ref |sort= |order=asc` : « Égopode
Escuroux 2025 » ressort **13e sur 38**, entre « Crosnes du Japon » et « Fer à
souder », plus après « Yacon ». Tri alphabétique **utilisé** dans les deux
vues.

---

## Étape 2 — page « Procédés et outils » (revid 1119)

Gabarit `Modèle:Procédés et outils/ligne` (revid 1118) d'abord, pour éviter
un lien rouge transitoire.

Structure de la page :

1. **Intro** — à quoi sert la page (quel geste réalisable avec quel objet
   possédé, où il est rangé), et le fait qu'un procédé sans outil y apparaît
   quand même avec une ligne le signalant. Rappel : aucun procédé nommé en
   dur.
2. **« Procédés et exemplaires disponibles »** — table wikitable,
   `{{#ask: [[Category:Procédé]] |format=template |template=Procédés et outils/ligne |link=none |limit=200 }}`.
   Chaque ligne : le procédé, puis une sous-requête
   `[[Category:Physical item]][[Instance_of.Corresponds_to_organic.Realizes_function::<procédé>]]`
   avec `|?Inventory_number`, `|?Located_at`, `|sort=Inventory_number`,
   `|default=Aucun exemplaire disponible pour ce procédé.`
3. **« Procédés par domaine de pratique »** —
   `{{#ask: [[Category:Procédé]] |?Item_ref |?Practice_domain |format=table |class=wikitable sortable }}`.
   Note dessous, en clair : `Practice_domain` ouverte et non hiérarchisée ;
   Assembler et Maintenir en position n'en portent aucun ; SMW exclut des
   filtres les pages sans la propriété — invisibles dans toute vue filtrée
   par domaine.
4. **« Limites connues »**, datée 29 août 2026 : (a) procédés sans domaine
   absents des vues filtrées ; (b) la page s'arrête aux exemplaires
   physiques, organique et référencé se consultent depuis les items ou la
   page du procédé ; (c) ni repliage ni graphe — lot ultérieur.

Pas de catégorie de classe. Pied de page : renvois vers *Guide de saisie*,
*Feuille de route*, *Limites connues du SGDT*.

**Piège évité** : le lien `[[Récapitulatif technique…]]` du *Guide de saisie*
était replié sur deux lignes à la première écriture (revid 1120) → lien cassé
silencieusement. Corrigé revid 1121, remis sur une ligne, vérifié : plus
aucun `[[` littéral au rendu.

---

## Étape 3 — page « Guide de saisie » (revid 1121)

**Recherche préalable d'un équivalent** : l'index plein-texte de ce wiki est
hors service (`list=search` rend `totalhits: 0` même sur « organique »).
Contrôle fait autrement — balayage des **193 titres de l'espace principal**,
des espaces `Projet` (4, vide), `Aide` (12, vide). Aucune page de guide de
saisie / contribution / how-to d'item sous quelque titre que ce soit. La
page n'existait pas ; le cadrage parlait à tort d'une « mise à jour ».

**Portée étroite, annoncée en première ligne** : « Cette page décrit un seul
parcours de saisie : ajouter un outil. » Les autres parcours suivront.

Contenu :

- **Ordre de création + pourquoi** : fonction → organique → référencé →
  exemplaire physique, chaque niveau ayant besoin que le précédent existe
  pour pointer dessus (`Realizes_function`, `Corresponds_to_organic`,
  `Instance_of`). Précision : la fonction existe le plus souvent déjà — on ne
  crée un item fonctionnel que si aucun procédé ne convient, jamais un
  procédé par outil.
- **Ce qui se met à quel niveau** (tableau) : geste + `Practice_domain` au
  fonctionnel ; type d'outil sans marque à l'organique ; `Manufacturer` /
  `Manufacturer_reference` + specs au référencé ; exemplaire + `Located_at` +
  propriétaire au physique.
- **Conventions de titre** (tableau) : verbe à l'infinitif (fonction), nom
  commun (organique), objet + marque + désignation (référencé),
  « nom courant — lieu (RÉFÉRENCE) » avec tiret cadratin (physique). Jamais
  de virgule dans un titre.
- **Pièges en consignes** : référence Base 36 relue à froid, jamais calculée
  d'avance ; référence libérée jamais réattribuée (`000J`, `CWL-0007`) ;
  décimales à la virgule (SMW FR rejette le point, valeur perdue en silence) ;
  numéros d'inventaire en base 36, `000A` suit `0009` ; `Practice_domain` sur
  le procédé et jamais sur l'outil (champ absent des formulaires d'outil).
- **Vérifier après coup** : un enregistrement réussi ne prouve pas le
  stockage ; contrôler le bloc « Solutions organiques » du procédé et la vue
  *Procédés et outils*.
- Note sur le formulaire comme voie d'entrée, et l'avertissement « rouvrir un
  item par formulaire n'est jamais neutre ».

**Syntaxe SMW** : la page n'en cite aucune sous forme exécutable — les noms
de propriétés sont en `<code>` sans `::`, aucun `{{#…}}`, aucun `[[X::Y]]`.
Les seuls `[[ ]]` sont des liens de navigation.

---

## Étape 4 — Feuille de route (revid 1122)

Section **« Lots livrés »** ajoutée avant le pied de page, en tête une phrase
italique : *section transitoire, sera fusionnée dans une page de gestion des
lots qui n'existe pas encore — ne pas anticiper ce regroupement ni renommer
cette page.* Puis une entrée lot 10 (référentiel des procédés posé, 5 outils
raccordés, `Corresponds_to_organic` multivaluée, vues créées ; restent
ouverts : 2 outils incomplets, correctifs `Module:Base36` n° 1 et 3).

Rien d'autre touché sur la page.

---

## Étape 5 — vérifications

### Rendu de « Procédés et outils » (après purge)

| Procédé | Exemplaires rendus |
|---|---|
| **Assembler** | *Aucun exemplaire disponible pour ce procédé.* ✅ (ligne vide attendue) |
| **Braser tendre** | CWL-0008 (0008, Atelier appartement) **et** CWL-0009 (0009, Atelier appartement) — **deux** ✅ |
| **Maintenir en position** | CWL-000B (000B, Atelier appartement) — **un** ✅ |
| **Mesurer une grandeur électrique** | CWL-000A (000A, Atelier appartement) — **un** ✅ |
| **Souder par points** | CWL-0008 (0008, Atelier appartement) — **un** ✅ |

Les cinq attentes de la consigne sont satisfaites.

Table « par domaine de pratique » : 5 lignes, triable, ordre alphabétique
(Assembler, Braser tendre, Maintenir en position, Mesurer…, Souder…).
Assembler (002H) et Maintenir en position (002L) : colonne domaine **vide**,
comme documenté. Braser tendre → plomberie, électronique. Mesurer → électricité,
électronique, énergie. Souder par points → électronique, énergie.

### browsebysubject sur les pages créées

| Page | Faits SMW |
|---|---|
| `Procédés et outils` | `_ASK`, `_MDAT`, `_SKEY` — **aucune propriété du modèle de données** (`_ASK` = métadonnée de requête, présente sur toute page à `#ask` ; *Avancement du jardin-forêt* en porte 13) ✅ |
| `Guide de saisie` | `_MDAT`, `_SKEY` seuls ✅ |

### Liens (list=backlinks)

Tous résolus : `Procédés et outils` ↔ `Guide de saisie` ; les deux pointent
vers `Feuille de route` et `Limites connues du SGDT` ; le gabarit pointe vers
`Procédés et outils`. Aucun `[[` littéral au rendu des trois pages.

### File de travaux

7 jobs à la fin (0 au début, mes écritures en ont ajouté ~7). `runJobs.php`
**non lancé** — il faut un accès SSH au serveur (`/home/fuzzy/…` absent de la
machine de travail) et les rendus mesurés sont **déjà corrects** : la vue
*Procédés et outils* s'appuie sur des `#ask` directs, à jour indépendamment
de la file. Rappel CLAUDE.md : file non vide ≠ panne.

---

## Écarts et points ouverts

1. **Deux pages de test à supprimer** (le bot ne sait pas supprimer) :
   `Modèle:Test lot10 ligne` et `Utilisateur:Cywil/Bac à sable/Lot10 vue`,
   toutes deux blanchies avec la mention « à supprimer ». Elles ont servi à
   prouver que le `#ask` imbriqué fonctionne.
2. **`Modèle:Procédés et outils/ligne`** est une page de plus à maintenir,
   conséquence du choix de la Forme A. Non transclue ailleurs ; sa `<noinclude>`
   dit de ne pas la transclure hors de `Procédés et outils`.
3. **File de travaux à 7 jobs** — `runJobs.php` à lancer par Cyril s'il veut
   reconstruire les blocs `#ask` en cache sur d'autres pages. Sans effet sur
   les livrables de cette tâche.
4. **Index plein-texte du wiki hors service** (`list=search` rend 0 partout).
   Signalé pour mémoire — sans rapport avec cette tâche, mais la recherche
   d'un guide équivalent a dû se faire par balayage des titres.
