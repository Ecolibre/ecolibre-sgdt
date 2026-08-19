# Lot 9 — Tâche 7 : manifeste (aucune écriture)

Généré depuis `plants-2026-08.tsv` (40 plantations, commit `f99f78b` — ligne 40 lieu corrigée `Stockage`→`Buisson_Cerzat`, ligne 21 `issu_de=22` ajoutée : la menthe du Buisson est une division de celle de la terrasse, pas une acquisition distincte). Maximum `Inventory_number` lu en ligne, `Inventory_site=ECL` : **0002** (`Bidon 220L Bleu 2`) — Test 260915c supprimé, confirmé absent du résultat. Séquence des 40 items physiques : **0003 à 0042**.

Maximum `Item_ref` (banque commune Functional+Organic+Referenced) lu en ligne : **000Q** (`Transfert d'eau par vases communicants`). Séquence **000R à 002G**, organiques puis référencés. **Vérifiée par le module** (`{{#invoke:Base36|next|...}}` chaîné 62 fois par `action=parse`, pas par arithmétique) : séquence réelle identique à la séquence calculée, `I` et `O` ne sont pas sautés. Aucun décalage.

**`Sourcing_year`** (propriété `Number`, créée tâche 1, absente de `Modèle:Referenced item`/`Formulaire:Referenced item` jusqu'ici — tâche 7bis proposée pour combler ce trou) remplace l'usage d'`Item_description` envisagé dans la version précédente de ce manifeste pour porter l'année. `Item_description` des 32 référencés est laissée **vide** : `Sourcing_year` est la propriété interrogeable prévue pour ça, c'est elle qui distingue `Miscanthus 2025` de `Miscanthus 2026`, pas un texte libre.

**Aucune collision** : ni entre les 102 titres du manifeste (30 organiques + 32 référencés + 40 plantations), ni contre les 54 titres déjà en place dans l'espace principal du wiki (`list=allpages&apnamespace=0`).

## 1. Items organiques (30)

Classe `Organic item`. Une seule instance du sous-modèle facette `Organic facet plant`, avec uniquement `Taxon_name` rempli (= `nom_courant`) — toutes les autres propriétés de la facette restent vides, le TSV ne les renseigne pas. `Item_description`, `Realizes_function`, `Part_of`, `External_classification` du modèle principal restent vides.

| Titre | Item_ref | Taxon_name |
|---|---|---|
| Ail éléphant | 000R | Ail éléphant |
| Bourrache | 000S | Bourrache |
| Brocoli vivace | 000T | Brocoli vivace |
| Capucine tubéreuse | 000U | Capucine tubéreuse |
| Chayote | 000V | Chayote |
| Chou Daubenton | 000W | Chou Daubenton |
| Consoude B14 | 000X | Consoude B14 |
| Consoude naine | 000Y | Consoude naine |
| Crosnes du Japon | 000Z | Crosnes du Japon |
| Égopode | 0010 | Égopode |
| Fraisier X | 0011 | Fraisier X |
| Fraisier musqué | 0012 | Fraisier musqué |
| Framboisier classique | 0013 | Framboisier classique |
| Framboisier jaune | 0014 | Framboisier jaune |
| Groseillier | 0015 | Groseillier |
| Groseillier à maquereau | 0016 | Groseillier à maquereau |
| Helianthi | 0017 | Helianthi |
| Hémérocalle | 0018 | Hémérocalle |
| Hysope | 0019 | Hysope |
| Menthe X | 001A | Menthe X |
| Menthe bergamote | 001B | Menthe bergamote |
| Miscanthus | 001C | Miscanthus |
| Oignon rocambole | 001D | Oignon rocambole |
| Paulownia | 001E | Paulownia |
| Persil japonais | 001F | Persil japonais |
| Poireau perpétuel | 001G | Poireau perpétuel |
| Roquette sauvage | 001H | Roquette sauvage |
| Sarrasin vivace | 001I | Sarrasin vivace |
| Tomates | 001J | Tomates |
| Yacon | 001K | Yacon |

## 2. Items référencés (32)

Classe `Referenced item`. `Supplier` = `provenance` **telle quelle**, y compris `Non défini` (la propriété garde la valeur brute — seul le titre substitue « origine inconnue »). `Corresponds_to_organic` = l'organique correspondant. `Maturity_level` laissé vide : sans objet pour un moyen d'approvisionnement végétal. `Sourcing_year` = `annee_source` du TSV (vide si le TSV l'est — cas des 4 groupes à provenance « Non défini »/`annee_source` vide). `Item_description` **vide** sur les 32 (voir note ci-dessus, tâche 7bis en attente de validation avant que `Sourcing_year` soit réellement écrivable).

| Titre | Item_ref | Corresponds_to_organic | Supplier (valeur brute) | Sourcing_year | Item_description |
|---|---|---|---|---|---|
| Ail éléphant Armand 2026 | 001L | Ail éléphant | Armand | 2026 | *(vide)* |
| Bourrache La Closerie D'Olt 2026 | 001M | Bourrache | La Closerie D'Olt | 2026 | *(vide)* |
| Brocoli vivace La Closerie D'Olt 2026 | 001N | Brocoli vivace | La Closerie D'Olt | 2026 | *(vide)* |
| Capucine tubéreuse Bene Bonno 2026 | 001O | Capucine tubéreuse | Bene Bonno | 2026 | *(vide)* |
| Chayote La Closerie D'Olt 2026 | 001P | Chayote | La Closerie D'Olt | 2026 | *(vide)* |
| Chou Daubenton Saint-André-de-Valborgne 2023 | 001Q | Chou Daubenton | Saint-André-de-Valborgne | 2023 | *(vide)* |
| Consoude B14 Escuroux 2025 | 001R | Consoude B14 | Escuroux | 2025 | *(vide)* |
| Consoude naine Escuroux 2025 | 001S | Consoude naine | Escuroux | 2025 | *(vide)* |
| Crosnes du Japon Armand 2026 | 001T | Crosnes du Japon | Armand | 2026 | *(vide)* |
| Égopode Escuroux 2025 | 001U | Égopode | Escuroux | 2025 | *(vide)* |
| Fraisier X origine inconnue | 001V | Fraisier X | Non défini | — | *(vide)* |
| Fraisier musqué origine inconnue | 001W | Fraisier musqué | Non défini | — | *(vide)* |
| Framboisier classique Haute-Loire 2020 | 001X | Framboisier classique | Haute-Loire | 2020 | *(vide)* |
| Framboisier jaune Pas-de-Calais 2024 | 001Y | Framboisier jaune | Pas-de-Calais | 2024 | *(vide)* |
| Groseillier Armand 2026 | 001Z | Groseillier | Armand | 2026 | *(vide)* |
| Groseillier à maquereau Dunkerque 2024 | 0020 | Groseillier à maquereau | Dunkerque | 2024 | *(vide)* |
| Helianthi Le Jardin d'Emerveille 2025 | 0021 | Helianthi | Le Jardin d'Emerveille | 2025 | *(vide)* |
| Hémérocalle Armand 2026 | 0022 | Hémérocalle | Armand | 2026 | *(vide)* |
| Hysope La Closerie D'Olt 2026 | 0023 | Hysope | La Closerie D'Olt | 2026 | *(vide)* |
| Menthe X origine inconnue | 0024 | Menthe X | Non défini | — | *(vide)* |
| Chayote origine inconnue | 0025 | Chayote | Non défini | — | *(vide)* |
| Menthe bergamote Escuroux 2025 | 0026 | Menthe bergamote | Escuroux | 2025 | *(vide)* |
| Miscanthus La Closerie D'Olt 2025 | 0027 | Miscanthus | La Closerie D'Olt | 2025 | *(vide)* |
| Oignon rocambole Escuroux 2025 | 0028 | Oignon rocambole | Escuroux | 2025 | *(vide)* |
| Paulownia Escuroux 2025 | 0029 | Paulownia | Escuroux | 2025 | *(vide)* |
| Persil japonais La Closerie D'Olt 2025 | 002A | Persil japonais | La Closerie D'Olt | 2025 | *(vide)* |
| Poireau perpétuel Escuroux 2025 | 002B | Poireau perpétuel | Escuroux | 2025 | *(vide)* |
| Roquette sauvage La Closerie D'Olt 2026 | 002C | Roquette sauvage | La Closerie D'Olt | 2026 | *(vide)* |
| Sarrasin vivace Escuroux 2025 | 002D | Sarrasin vivace | Escuroux | 2025 | *(vide)* |
| Tomates Camille Buisson 2026 | 002E | Tomates | Camille Buisson | 2026 | *(vide)* |
| Yacon La Closerie D'Olt 2025 | 002F | Yacon | La Closerie D'Olt | 2025 | *(vide)* |
| Miscanthus La Closerie D'Olt 2026 | 002G | Miscanthus | La Closerie D'Olt | 2026 | *(vide)* |

4 groupes sans `Sourcing_year` (aucune `annee_source` dans le TSV, provenance `Non défini`) : `Fraisier X origine inconnue`, `Fraisier musqué origine inconnue`, `Menthe X origine inconnue`, `Chayote origine inconnue`. Rappel : les 5 lignes du TSV à provenance « Non défini » ne font que ces 4 référencés — `Menthe X` à Buisson_Cerzat (ligne 21) et à Terrasse de Chilhac (ligne 22) partagent désormais le même référencé à la fois par vacuité de la clé et par filiation réelle (division), les deux motifs coïncident maintenant.

## 3. Items physiques / plantations (40)

Classe `Physical item`. `Inventory_site=ECL` pour les 40. `Instance_of` = le référencé résolu (filiation comprise). `Located_at` = page de lieu. `Item_facet=Facette végétal` émis automatiquement par l'instanciation du sous-modèle `Physical facet plant`, pas une propriété à écrire manuellement. `Planting_rank` vide sur les 40.

| id | Titre | Inventory_number | Instance_of (référencé) | Located_at | Planting_date | Specimen_status | Planted_count | Propagated_from | Item_description |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Ail éléphant — Le Buisson de Cerzat (ECL-0003) | 0003 | Ail éléphant Armand 2026 | Le Buisson de Cerzat | 2025-11-17 | repris | — | — | — |
| 2 | Bourrache — Le Buisson de Cerzat (ECL-0004) | 0004 | Bourrache La Closerie D'Olt 2026 | Le Buisson de Cerzat | — | en place | — | — | — |
| 3 | Brocoli vivace — Le Buisson de Cerzat (ECL-0005) | 0005 | Brocoli vivace La Closerie D'Olt 2026 | Le Buisson de Cerzat | — | en place | — | — | — |
| 4 | Capucine tubéreuse — Le Buisson de Cerzat (ECL-0006) | 0006 | Capucine tubéreuse Bene Bonno 2026 | Le Buisson de Cerzat | — | mort | — | — | — |
| 5 | Chayote — Le Buisson de Cerzat (ECL-0007) | 0007 | Chayote La Closerie D'Olt 2026 | Le Buisson de Cerzat | — | en place | — | — | — |
| 6 | Chou Daubenton — Le Buisson de Cerzat (ECL-0008) | 0008 | Chou Daubenton Saint-André-de-Valborgne 2023 | Le Buisson de Cerzat | — | en place | — | — | — |
| 7 | Chou Daubenton — Jardin de Chilhac (ECL-0009) | 0009 | Chou Daubenton Saint-André-de-Valborgne 2023 | Jardin de Chilhac | — | en place | — | — | — |
| 8 | Consoude B14 — Le Buisson de Cerzat (ECL-0010) | 0010 | Consoude B14 Escuroux 2025 | Le Buisson de Cerzat | 2025-11-17 | en place | — | — | — |
| 9 | Consoude naine — Le Buisson de Cerzat (ECL-0011) | 0011 | Consoude naine Escuroux 2025 | Le Buisson de Cerzat | 2025-11-17 | en place | — | — | — |
| 10 | Crosnes du Japon — Le Buisson de Cerzat (ECL-0012) | 0012 | Crosnes du Japon Armand 2026 | Le Buisson de Cerzat | 2025-11-17 | en place | — | — | — |
| 11 | Égopode — Le Buisson de Cerzat (ECL-0013) | 0013 | Égopode Escuroux 2025 | Le Buisson de Cerzat | 2025-10-25 | en place | — | — | — |
| 12 | Fraisier X — Le Buisson de Cerzat (ECL-0014) | 0014 | Fraisier X origine inconnue | Le Buisson de Cerzat | — | en place | — | — | — |
| 13 | Fraisier musqué — Le Buisson de Cerzat (ECL-0015) | 0015 | Fraisier musqué origine inconnue | Le Buisson de Cerzat | 2025-11-17 | en place | — | — | — |
| 14 | Framboisier classique — Jardin de Chilhac (ECL-0016) | 0016 | Framboisier classique Haute-Loire 2020 | Jardin de Chilhac | — | en place | — | — | — |
| 15 | Framboisier jaune — Jardin de Chilhac (ECL-0017) | 0017 | Framboisier jaune Pas-de-Calais 2024 | Jardin de Chilhac | — | en place | — | — | — |
| 16 | Groseillier — Terrasse de Chilhac (ECL-0018) | 0018 | Groseillier Armand 2026 | Terrasse de Chilhac | — | en place | — | — | — |
| 17 | Groseillier à maquereau — Jardin de Chilhac (ECL-0019) | 0019 | Groseillier à maquereau Dunkerque 2024 | Jardin de Chilhac | — | en place | — | — | — |
| 18 | Helianthi — Le Buisson de Cerzat (ECL-0020) | 0020 | Helianthi Le Jardin d'Emerveille 2025 | Le Buisson de Cerzat | 2025-10-25 | en place | — | — | — |
| 19 | Hémérocalle — Le Buisson de Cerzat (ECL-0021) | 0021 | Hémérocalle Armand 2026 | Le Buisson de Cerzat | 2025-12-06 | en place | — | — | — |
| 20 | Hysope — Le Buisson de Cerzat (ECL-0022) | 0022 | Hysope La Closerie D'Olt 2026 | Le Buisson de Cerzat | — | en place | — | — | — |
| 21 | Menthe X — Le Buisson de Cerzat (ECL-0023) *(filiation ajoutée)* | 0023 | Menthe X origine inconnue | Le Buisson de Cerzat | — | en place | — | Menthe X — Terrasse de Chilhac (ECL-0024) | — |
| 22 | Menthe X — Terrasse de Chilhac (ECL-0024) | 0024 | Menthe X origine inconnue | Terrasse de Chilhac | — | en place | — | — | — |
| 23 | Chayote — Terrasse de Chilhac (ECL-0025) | 0025 | Chayote origine inconnue | Terrasse de Chilhac | — | en place | — | — | — |
| 24 | Menthe bergamote — Le Buisson de Cerzat (ECL-0026) | 0026 | Menthe bergamote Escuroux 2025 | Le Buisson de Cerzat | 2025-11-17 | en place | — | — | — |
| 25 | Miscanthus — Le Buisson de Cerzat (ECL-0027) | 0027 | Miscanthus La Closerie D'Olt 2025 | Le Buisson de Cerzat | 2025-11-17 | en place | — | — | — |
| 26 | Oignon rocambole — Le Buisson de Cerzat (ECL-0028) | 0028 | Oignon rocambole Escuroux 2025 | Le Buisson de Cerzat | 2025-11-17 | en place | — | — | — |
| 27 | Oignon rocambole — Jardin de Chilhac (ECL-0029) | 0029 | Oignon rocambole Escuroux 2025 | Jardin de Chilhac | — | en place | — | — | — |
| 28 | Paulownia — Le Buisson de Cerzat (ECL-0030) | 0030 | Paulownia Escuroux 2025 | Le Buisson de Cerzat | — | en place | — | — | — |
| 29 | Persil japonais — Terrasse de Chilhac (ECL-0031) | 0031 | Persil japonais La Closerie D'Olt 2025 | Terrasse de Chilhac | — | en place | — | — | — |
| 30 | Poireau perpétuel — Le Buisson de Cerzat (ECL-0032) | 0032 | Poireau perpétuel Escuroux 2025 | Le Buisson de Cerzat | 2025-11-17 | en place | — | — | — |
| 31 | Poireau perpétuel — Le Buisson de Cerzat (ECL-0033) | 0033 | Poireau perpétuel Escuroux 2025 | Le Buisson de Cerzat | 2026-08-07 | en place | — | Poireau perpétuel — Jardin de Chilhac (ECL-0034) | — |
| 32 | Poireau perpétuel — Jardin de Chilhac (ECL-0034) | 0034 | Poireau perpétuel Escuroux 2025 | Jardin de Chilhac | — | en place | — | — | — |
| 33 | Roquette sauvage — Le Buisson de Cerzat (ECL-0035) | 0035 | Roquette sauvage La Closerie D'Olt 2026 | Le Buisson de Cerzat | 2025-11-17 | en place | — | — | — |
| 34 | Roquette sauvage — Terrasse de Chilhac (ECL-0036) | 0036 | Roquette sauvage La Closerie D'Olt 2026 | Terrasse de Chilhac | — | en place | — | — | — |
| 35 | Sarrasin vivace — Le Buisson de Cerzat (ECL-0037) | 0037 | Sarrasin vivace Escuroux 2025 | Le Buisson de Cerzat | 2025-11-17 | en place | — | — | — |
| 36 | Tomates — Le Buisson de Cerzat (ECL-0038) | 0038 | Tomates Camille Buisson 2026 | Le Buisson de Cerzat | — | en place | — | — | — |
| 37 | Yacon — Le Buisson de Cerzat (ECL-0039) | 0039 | Yacon La Closerie D'Olt 2025 | Le Buisson de Cerzat | 2025-11-17 | en place | — | — | — |
| 38 | Miscanthus — Le Buisson de Cerzat (ECL-0040) | 0040 | Miscanthus La Closerie D'Olt 2026 | Le Buisson de Cerzat | — | en place | — | — | — |
| 39 | Ail éléphant — Le Buisson de Cerzat (ECL-0041) | 0041 | Ail éléphant Armand 2026 | Le Buisson de Cerzat | 2026-08-07 | en place | 1 | Ail éléphant — Le Buisson de Cerzat (ECL-0003) | — |
| 40 | Ail éléphant — Le Buisson de Cerzat (ECL-0042) | 0042 | Ail éléphant Armand 2026 | Le Buisson de Cerzat | — | en réserve | 3 | Ail éléphant — Le Buisson de Cerzat (ECL-0003) | **à compléter par Cyril : détail du contenant de réserve** |
