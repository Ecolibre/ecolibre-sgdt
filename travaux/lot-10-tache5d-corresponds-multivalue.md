# Lot 10 — tâche 5, bloc 4 : Corresponds_to_organic devient multivaluée

Date : 2026-08-29. Aucun item créé. Quatre pages modifiées : la propriété
`Corresponds_to_organic`, le modèle et le formulaire `Referenced item`, et
l'item référencé `Machine à souder par points SUNKKO 709AD`.

**Motif** : la SUNKKO 709AD brase aussi à l'étain. Elle relève de deux items
organiques — « Machine à souder par point » et « Fer à souder ». Tant que
`Corresponds_to_organic` était monovaluée, la vue « Braser tendre » était
fausse par omission. Ce bloc lève la limite.

---

## Étape 1 — lectures préalables (aucune écriture)

### a) Attribut:Corresponds_to_organic (revid lu : 266)

```
[[Has type::Page]]
[[Property_description_FR::Lien vers l'item organique (logique) que cet item référencé implémente.]]
[[Property_description_EN::Link to the organic (logical) item that this referenced item implements.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Referenced item]]
[[Property_range::Organic item]]
```

### b) Modèle:Referenced item (revid lu : 1096)

Bloc `#set` — état pertinent :
```
 9 |Part_of={{{Part_of|}}}
10 |+sep=,
11 |Corresponds_to_organic={{{Corresponds_to_organic|}}}
12 |Max_head={{#invoke:Nombre|virgule|{{{Max_head|}}}}}
```
**Le `+sep=,` de la ligne 10 se rattache à `Part_of` (ligne 9)**, pas à
`Corresponds_to_organic`. **Aucun `+sep` entre `Corresponds_to_organic` et
`Max_head`** — l'insertion demandée est sans danger pour `Max_head`.

Affichage, ligne 36 :
`| {{#if:{{{Corresponds_to_organic|}}}|[[{{{Corresponds_to_organic|}}}]]}}`
Le patron arraymap cible est déjà employé pour `Materials_worked` (l. 58),
`Part_of` (l. 85), `Wanted_by` (l. 107) :
`{{#arraymap:{{{X|}}}|,|@@@|[[@@@]]|,&#32;}}`.

### c) Formulaire:Referenced item (revid lu : 1097)

Ligne 11 :
`| {{{field|Corresponds_to_organic|input type=combobox|values from category=Organic item}}}`
Patron `tokens|list` déjà employé pour `Part_of`, `Materials_worked`,
`Measured_quantities`.

### d) Machine à souder par points SUNKKO 709AD (revid lu : 823)

```
{{Referenced item
|Item_ref=002N
|Item_description=Machine de soudage par points à transformateur d'inversion, pour batteries.
|Corresponds_to_organic=Machine à souder par point
|Max_thickness=0,2
|Materials_worked=acier nickelé
|Procurement_route=acheté
|Manufacturer=SUNKKO
|Manufacturer_reference=709AD
|Power_rating=3200
}}
```

### e) État de référence — `[[Corresponds_to_organic::+]]`

**37 items référencés** portent la propriété (sur 38 au total : seul
`Batterie défaillante récupérée` ne la porte pas — item modèle de la batterie
CWL, hors sujet). Chacun porte **une seule valeur**. Liste complète et
valeurs : voir le tableau de non-régression de l'étape 3.

### f) prop=info + protection sur Attribut:Corresponds_to_organic

`protection: []`, `restrictiontypes: [edit, move]`. **Aucune protection
native.** (Rappel garde-fou 5 : ne dit rien de Lockdown ni d'un verrou SMW —
mais l'écriture 2a a réussi, cf. infra.)

### Garde-fou d'arrêt — non déclenché

| Condition | Constat |
|---|---|
| Page de propriété protégée ? | non (`protection: []`) |
| Fer à souder (002O) existe ? | oui (créé au bloc 3, `Item_ref -> 002O`) |

---

## Étape 2 — écritures

`bin/wiki-login.sh` relancé avant (`Success Cywil`). Ordre : propriété →
modèle → formulaire → item (le modèle avant l'item, pour éviter un lien rouge
transitoire sur la page du SUNKKO).

### 2a — Attribut:Corresponds to organic (revid 266 → 1108)

Résumé : `[Lot 10][Tâche 5] Corresponds_to_organic passe en cardinalité
multiple + phrase de justification dans la description FR`

Page complète en une seule écriture (verrou de propagation). Diff :
```
-[[Property_description_FR::Lien vers l'item organique (logique) que cet item référencé implémente.]]
+[[Property_description_FR::Lien vers l'item organique (logique) que cet item référencé implémente. Multivaluée : un modèle du commerce peut implémenter plusieurs solutions techniques à la fois, comme une station qui soude par points et brase à l'étain.]]
-[[Property_description_EN::Link to the organic (logical) item that this referenced item implements.]]
+[[Property_description_EN::Link to the organic (logical) item that this referenced item implements. Multivalued: a commercial model may implement several technical solutions at once, such as a station that both spot-welds and solders.]]
-[[Property_cardinality::single]]
+[[Property_cardinality::multiple]]
```
`Has type`, `Property_domain`, `Property_range` inchangés.

### 2b — Modèle:Referenced item (revid 1096 → 1109)

Résumé : `[Lot 10][Tâche 5] Corresponds_to_organic multivaluée : +sep=, dans
le #set après la propriété, arraymap à l'affichage (patron
Materials_worked/Part_of/Wanted_by)`

Diff (deux changements, rien d'autre) :
```
@@ bloc #set @@
 |Corresponds_to_organic={{{Corresponds_to_organic|}}}
+|+sep=,
 |Max_head={{#invoke:Nombre|virgule|{{{Max_head|}}}}}

@@ affichage « Item Organique associé » @@
-| {{#if:{{{Corresponds_to_organic|}}}|[[{{{Corresponds_to_organic|}}}]]}}
+| {{#arraymap:{{{Corresponds_to_organic|}}}|,|@@@|[[@@@]]|,&#32;}}
```
Le `+sep=,` inséré est en ligne 12 ; il se rattache à `Corresponds_to_organic`
(ligne 11) et ne touche pas `Max_head`. Le `#if` disparaît : `#arraymap` sur
valeur vide ne rend rien, comme pour les trois autres propriétés
multivaluées.

### 2c — Formulaire:Referenced item (revid 1097 → 1110)

Résumé : `[Lot 10][Tâche 5] champ Corresponds_to_organic : combobox →
tokens|list (saisie multivaluée, patron Materials_worked/Measured_quantities)`

Diff (une ligne, cellule de libellé intacte) :
```
-| {{{field|Corresponds_to_organic|input type=combobox|values from category=Organic item}}}
+| {{{field|Corresponds_to_organic|input type=tokens|values from category=Organic item|list}}}
```

Garde-fou 6 : modèle + formulaire en service, accord explicite de Cyril pour
ce bloc.

### 2d — Machine à souder par points SUNKKO 709AD (revid 823 → 1111)

Résumé : `[Lot 10][Tâche 5] Corresponds_to_organic = Machine à souder par
point, Fer à souder (rattachement au second organique, brasage à l'étain)`

Diff (un seul paramètre) :
```
-|Corresponds_to_organic=Machine à souder par point
+|Corresponds_to_organic=Machine à souder par point, Fer à souder
```
Ordre voulu : « Machine à souder par point » reste l'organique principal
(il a donné son nom à l'exemplaire physique CWL-0008).

---

## Étape 3 — vérification après écriture

File de travaux SMW **figée à 11 jobs** (`bin/wiki-wait-jobs.sh`). Les
requêtes `action=ask` directes sont à jour ; seuls les blocs `#ask` **rendus
dans les pages** peuvent être en retard.

### browsebysubject sur la SUNKKO — deux valeurs distinctes

```
Corresponds_to_organic -> ['Machine_à_souder_par_point#0##', 'Fer_à_souder#0##']
```
**Deux valeurs distinctes, découpées.** Pas de valeur unique
« Machine à souder par point, Fer à souder », donc **aucune page fantôme
portant la virgule** : le `+sep=,` est bien appliqué.

Reste des faits, intact :
```
Item_ref               -> ['002N']              ✅
Procurement_route       -> ['acheté']            ✅
Power_rating            -> ['3200']              ✅
Max_thickness           -> ['0.2']               ✅
Materials_worked        -> ['Acier_nickelé#0##'] ✅
Manufacturer            -> ['SUNKKO#0##']        ✅
Manufacturer_reference  -> ['709AD']
Item_description        -> ['Machine de soudage par points…']
_INST                   -> ['Referenced_item#14##']
```
Aucune clé `_ERR` / `_ERRC`.

### browsebysubject sur Attribut:Corresponds to organic — six assertions

```
_TYPE                 -> swivt/1.0#_wpg          (Has type::Page)          ✅
Property_description_FR -> '…implémente. Multivaluée : un modèle du commerce…' ✅
Property_description_EN -> '…implements. Multivalued: a commercial model…'      ✅
Property_cardinality  -> ['multiple']                                       ✅
Property_domain       -> ['Referenced_item#14##']                           ✅
Property_range        -> ['Organic item']                                   ✅
```
**Les six assertions présentes. `Property_cardinality = multiple`.**
**Aucune clé `_CHGPRO`** : la propriété a propagé proprement, pas besoin de
`runJobs.php` pour elle.

### Non-régression — les 37 items portant Corresponds_to_organic

Requête `[[Corresponds_to_organic::+]]` avant / après. **37 items avant,
37 après. Un seul changement : la SUNKKO. 36/37 strictement identiques.**

| # | Item référencé | Corresponds_to_organic (après) | |
|---|---|---|---|
| 1 | Ail éléphant Armand 2026 | Ail éléphant | = |
| 2 | Bidon 220L bleu plastique Borde | Bidon 220L | = |
| 3 | Bourrache La Closerie D'Olt 2026 | Bourrache | = |
| 4 | Brocoli vivace La Closerie D'Olt 2026 | Brocoli vivace | = |
| 5 | Capucine tubéreuse Bene Bonno 2026 | Capucine tubéreuse | = |
| 6 | Chayote La Closerie D'Olt 2026 | Chayote | = |
| 7 | Chayote origine inconnue | Chayote | = |
| 8 | Chou Daubenton Saint-André-de-Valborgne 2023 | Chou Daubenton | = |
| 9 | Consoude B14 Escuroux 2025 | Consoude B14 | = |
| 10 | Consoude naine Escuroux 2025 | Consoude naine | = |
| 11 | Crosnes du Japon Armand 2026 | Crosnes du Japon | = |
| 12 | Fer à souder Quicko T12-942 | Fer à souder | = |
| 13 | Fraisier X origine inconnue | Fraisier X | = |
| 14 | Fraisier musqué origine inconnue | Fraisier musqué | = |
| 15 | Framboisier classique Haute-Loire 2020 | Framboisier classique | = |
| 16 | Framboisier jaune Pas-de-Calais 2024 | Framboisier jaune | = |
| 17 | Groseillier Armand 2026 | Groseillier | = |
| 18 | Groseillier à maquereau Dunkerque 2024 | Groseillier à maquereau | = |
| 19 | Helianthi Le Jardin d'Emerveille 2025 | Helianthi | = |
| 20 | Hysope La Closerie D'Olt 2026 | Hysope | = |
| 21 | Hémérocalle Armand 2026 | Hémérocalle | = |
| 22 | **Machine à souder par points SUNKKO 709AD** | **Machine à souder par point, Fer à souder** | **≠ CHANGÉ (voulu)** |
| 23 | Menthe X origine inconnue | Menthe X | = |
| 24 | Menthe bergamote Escuroux 2025 | Menthe bergamote | = |
| 25 | Mini banc de mesure Ecolibre | Support de maintien de cellule | = |
| 26 | Miscanthus La Closerie D'Olt 2025 | Miscanthus | = |
| 27 | Miscanthus La Closerie D'Olt 2026 | Miscanthus | = |
| 28 | Multimètre GVDA GD112C | Multimètre | = |
| 29 | Oignon rocambole Escuroux 2025 | Oignon rocambole | = |
| 30 | Paulownia Escuroux 2025 | Paulownia | = |
| 31 | Persil japonais La Closerie D'Olt 2025 | Persil japonais | = |
| 32 | Poireau perpétuel Escuroux 2025 | Poireau perpétuel | = |
| 33 | Roquette sauvage La Closerie D'Olt 2026 | Roquette sauvage | = |
| 34 | Sarrasin vivace Escuroux 2025 | Sarrasin vivace | = |
| 35 | Tomates Camille Buisson 2026 | Tomates | = |
| 36 | Yacon La Closerie D'Olt 2025 | Yacon | = |
| 37 | Égopode Escuroux 2025 | Égopode | = |

38ᵉ item référencé — `Batterie défaillante récupérée` — sans
`Corresponds_to_organic` avant comme après. Non affecté.

Aucune valeur ne contient de virgule → aucune page fantôme sur les 37.

### Rendu — Machine à souder par points SUNKKO 709AD (après purge)

Ligne **« Item Organique associé »** →
**« Machine à souder par point , Fer à souder »** : **deux liens bleus
séparés par une virgule**. Pas de lien rouge entre les deux organiques.

*Deux liens rouges subsistent sur la page — `acier nickelé` (Materials_worked)
et `SUNKKO` (Manufacturer) — pages non encore créées. Préexistants, sans
rapport avec ce bloc (paramètres non touchés), hors périmètre.*

### Rendu — Fer à souder (organique, après purge)

Bloc **« Implémenté par (Solution technique) »** →
**« Fer à souder Quicko T12-942 (Réf. SMW : 002S) , Machine à souder par
points SUNKKO 709AD (Réf. SMW : 002N) »** : **deux solutions référencées**,
le Quicko et le SUNKKO. Aucun lien rouge.

### Rendu — Braser tendre (procédé, après purge)

Bloc **« Solutions organiques (Comment) »** → **rendu vide** au moment du
rapport (en-têtes « Réf. | Description » seuls).

**Ce n'est pas une perte de donnée.** Requête directe
`[[Realizes_function::Braser tendre]]` → **« Fer à souder » (002O)**. Le fait
est stocké et interrogeable ; seul le `#ask` embarqué dans la page n'est pas
reconstruit, faute de jobs (file figée à 11). Même artefact qu'aux blocs 2
et 3. Se remplira au vidage de la file.

### Contrôle final — la requête qui motivait le bloc

```
[[Category:Physical item]][[Instance_of.Corresponds_to_organic::Fer à souder]]
```
→ **deux exemplaires, exactement comme attendu** :

| Page | Inventory_ref |
|---|---|
| Fer à souder — Atelier appartement (CWL-0009) | CWL-0009 (le Quicko) |
| Machine à souder par point — Atelier appartement (CWL-0008) | CWL-0008 (le SUNKKO) |

**La chaîne de propriétés `Instance_of.Corresponds_to_organic::` fonctionne
telle quelle.** C'est la requête à réutiliser pour la tâche 6, sans
adaptation.

---

## Écarts constatés

**Aucun écart imputable aux écritures.** Les quatre écritures ont réussi ;
`Corresponds_to_organic` rend deux valeurs distinctes sur la SUNKKO sans page
fantôme ; les six assertions de la propriété sont directement lisibles
(`multiple` compris, pas de `_CHGPRO`) ; 36/37 items non touchés ; la requête
finale rend les deux exemplaires visés.

**Points ouverts, tous liés à la file de travaux SMW figée à 11 jobs** — hors
périmètre du bloc :

1. Le bloc « Solutions organiques » de **Braser tendre** rend vide alors que
   la donnée est correcte (requête directe OK). Se corrigera au vidage de la
   file.
2. `bin/wiki-wait-jobs.sh` signale la file figée depuis le bloc 1 (4 → 9 →
   11 jobs au fil des blocs). La consigne prévoyait
   `cd /home/fuzzy/mediawiki/mediawiki-1.39/ && SERVER_NAME=wiki.ecolibre.org php maintenance/runJobs.php`
   **uniquement si un `_CHGPRO` apparaissait sur la propriété** — ce qui
   **n'est pas le cas**. Cette commande relève de Cyril seul ; elle n'a pas
   été lancée. La lancer viderait la file et reconstruirait tous les `#ask`
   en retard accumulés sur les blocs 2 à 4.

*Deux liens rouges préexistants sur la page SUNKKO (`acier nickelé`,
`SUNKKO`) — signalés pour mémoire, sans rapport avec ce bloc.*
