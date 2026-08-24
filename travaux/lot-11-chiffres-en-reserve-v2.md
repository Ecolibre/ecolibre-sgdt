# Lot 11 — bloc Chiffres : ligne « En réserve » écrite et vérifiée

2026-08-21. Suite de `travaux/lot-11-chiffres-en-reserve.md`.

## 1. Écrit, relu

Page relue avant écriture (identique à la copie déjà en main — les cinq
lignes de compteurs inchangées). Diff appliqué sans modification, une
ligne ajoutée après `Remplacé`. Résumé : `[Correctif] Bloc Chiffres —
ajout du compteur « En réserve », absent de l'énumération (total à 39
pour 40 plantations)` (pageid 396, revid 853).

**Relu après écriture** : `diff` entre le fichier envoyé et la page
récupérée — aucune différence.

## 2. Rendu vérifié — 40 au total, pas de purge nécessaire

Six valeurs relevées sur le rendu (`action=parse`), dès le premier
contrôle, sans avoir eu besoin de purger :

| État | Compte |
|---|---|
| En place | 37 |
| Repris | 1 |
| Souffrant | 0 |
| Mort | 1 |
| Remplacé | 0 |
| En réserve | 1 |

Somme : 37+1+0+1+0+1 = **40**, conforme au nombre de plantations annoncé
par la page. `En réserve` affiche **1**, cohérent avec `ECL-0042`,
seule plantation connue dans cet état (tâche 0).
