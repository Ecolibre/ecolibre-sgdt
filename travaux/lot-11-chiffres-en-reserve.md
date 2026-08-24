# Lot 11 — bloc Chiffres : état « en réserve » manquant

2026-08-21. `Avancement du jardin-forêt`, section `== Chiffres ==`.

## 1. Wikitexte actuel du bloc

```
* En place : {{#ask: [[Category:Physical item]] [[Located_at::Le Buisson de Cerzat||Jardin de Chilhac||Terrasse de Chilhac]] [[Specimen_status::en place]] |format=count}}
* Repris : {{#ask: [[Category:Physical item]] [[Located_at::Le Buisson de Cerzat||Jardin de Chilhac||Terrasse de Chilhac]] [[Specimen_status::repris]] |format=count}}
* Souffrant : {{#ask: [[Category:Physical item]] [[Located_at::Le Buisson de Cerzat||Jardin de Chilhac||Terrasse de Chilhac]] [[Specimen_status::souffrant]] |format=count}}
* Mort : {{#ask: [[Category:Physical item]] [[Located_at::Le Buisson de Cerzat||Jardin de Chilhac||Terrasse de Chilhac]] [[Specimen_status::mort]] |format=count}}
* Remplacé : {{#ask: [[Category:Physical item]] [[Located_at::Le Buisson de Cerzat||Jardin de Chilhac||Terrasse de Chilhac]] [[Specimen_status::remplacé]] |format=count}}
```

Cinq états seulement — `en réserve` (porté par `ECL-0042`, vérifié en
tâche 0) n'a pas de ligne. Cohérent avec l'écart constaté : 39 au lieu
des 40 annoncées.

## 2. Diff proposé — une ligne, calquée sur les cinq existantes

```diff
 * Remplacé : {{#ask: [[Category:Physical item]] [[Located_at::Le Buisson de Cerzat||Jardin de Chilhac||Terrasse de Chilhac]] [[Specimen_status::remplacé]] |format=count}}
+* En réserve : {{#ask: [[Category:Physical item]] [[Located_at::Le Buisson de Cerzat||Jardin de Chilhac||Terrasse de Chilhac]] [[Specimen_status::en réserve]] |format=count}}
```

Même forme exacte que les cinq lignes existantes — seule la valeur
`Specimen_status` change (`en réserve`, valeur confirmée présente en
tâche 0). Rien d'autre touché dans le bloc.

Non écrit — en attente de validation.
