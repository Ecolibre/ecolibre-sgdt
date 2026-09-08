# Lot 28 — Tâche 5 : livraison du lot

## Historique de la tâche

Un premier passage s'est arrêté à l'étape 2 : la consigne annonçait une
taille cible de 8721 octets pour le fichier après remplacement, alors que le
calcul (et la mesure) donnaient 8722 octets — la remplacement de `ouvert`
(6 octets UTF-8) par `livré` (6 octets UTF-8, `é` codé sur 2 octets) est
neutre en taille, et l'ajout de la ligne `|Work_package_delivery_date=2026-09-08`
(38 octets) précédée d'un saut de ligne ajoute 39 octets : 8683 + 39 = 8722.
L'arrêt a été signalé, la consigne corrigée en conséquence, et ce second
passage l'a reprise avec la valeur corrigée.

## Révision et taille

| | Révision | Taille |
|---|---|---|
| Avant | 1308 | 8683 octets |
| Après | 1309 | 8722 octets |

## Diff intégral

```diff
3c3
< |Work_package_status=ouvert
---
> |Work_package_status=livré
4a5
> |Work_package_delivery_date=2026-09-08
```

Une ligne modifiée, une ligne ajoutée, dans le bloc du modèle. Aucune autre
différence.

## Résultat des cinq vérifications

1. **Diff avant/après écriture** : ci-dessus. Conforme.
2. **Taille après écriture** (`prop=revisions&rvprop=size`) : 8722 octets,
   revid 1309. Conforme.
3. **Faits stockés** (`browsebysubject`) : `Work_package_status` = « livré »,
   `Work_package_delivery_date` = `1/2026/9/8` (8 septembre 2026),
   `Work_package_opening_date` toujours `1/2026/9/6` (6 septembre 2026),
   `Work_package_overlaps` toujours trois valeurs (Lot 21, Lot 25, Lot 27).
   Conforme.
4. **Index « Gestion des lots »** (`action=parse&prop=text`, sans purge) :
   le Lot 28 apparaît dans la table « Faits », ligne « livré », « Ouvert le
   6 septembre 2026 », « Livré le 8 septembre 2026 ». Les comptes de
   synthèse lisent « En cours : 1 », « Faits : 12 », « À venir : 15 », total
   28. Conforme, **dès la première lecture après écriture** — aucun délai
   de propagation constaté, aucune purge nécessaire.
5. **Faits `_ERRC` sur le wiki** (`action=ask&query=[[_ERRC::+]]`) : zéro
   résultat. Conforme.

## Délai de l'index

Aucun. La première lecture de « Gestion des lots » après l'écriture a
directement montré le Lot 28 dans « Faits » avec les comptes attendus.

## Écarts et surprises

La taille annoncée dans la consigne d'origine (8721 octets) était fausse
d'un octet ; la valeur correcte, 8722, a été établie lors du premier passage
(arrêt signalé) et confirmée ici par calcul et par mesure. Le contexte de ce
second passage portait déjà la valeur corrigée, qui s'est vérifiée à
l'écriture. Aucun autre écart : toutes les autres affirmations du contexte
(révisions, tailles, comptes de l'index, absence de délai) se sont vérifiées
telles quelles.
