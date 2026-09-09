# Lot 28 — Clôture 5 : le lot est clos

## Révision et taille

| | Révision | Taille |
|---|---|---|
| Avant | 1315 | 9875 octets |
| Après | 1324 | 11226 octets |

Les deux valeurs de départ annoncées se sont vérifiées. Les deux ancres
(`Work_package_status=livré` et `Work_package_delivery_date=2026-09-08`)
n'apparaissaient qu'une seule fois avant écriture.

## Diff

```diff
3c3
< |Work_package_status=livré
---
> |Work_package_status=clos
5a6,7
> |Work_package_closure_date=2026-09-09
> |Work_package_closure_report=https://github.com/Ecolibre/ecolibre-sgdt/blob/70c23eef9a043038f93982b752a30bd67bf70e36/travaux/lot-28-creation-page.md,[…8 autres adresses, même commit, mêmes chemins que ceux listés dans la consigne…],https://github.com/Ecolibre/ecolibre-sgdt/blob/70c23eef9a043038f93982b752a30bd67bf70e36/travaux/lot-28-cloture4-lots-29-30-et-methode.md
```

Une ligne modifiée, deux lignes ajoutées. Rien d'autre.

## Résultat des sept vérifications

1. **Diff** : ci-dessus. Conforme.
2. **Taille après écriture** (`prop=revisions&rvprop=size`) : **11226
   octets**, revid 1324. Conforme.
3. **Faits stockés** (`browsebysubject`, JSON brut pour compter précisément
   les éléments de la propriété multivaluée) :
   - `Work_package_status` = « clos »
   - `Work_package_closure_date` = `1/2026/9/9` (9 septembre 2026)
   - `Work_package_closure_report` compte **exactement 10 valeurs**, et les
     dix adresses lues correspondent une à une, dans le même ordre, à
     celles écrites — aucune coupure, aucune adresse tronquée.

   Conforme sur les trois points.
4. **Lecture de l'index avant purge** : encore l'ancien état — 28 lots au
   total, « En cours : 1, Faits : 12, À venir : 15, Abandonnés : 0 »,
   aucune trace des lots 29 et 30 ni de l'état « clos » du lot 28.
5. **Purge** : nécessaire, appliquée. `bin/wiki-purge.sh "Gestion des
   lots"` a renvoyé `"purged": true, "linkupdate": true`. Après relecture :
   **30 lots au total**, « En cours : 1, Faits : 12, À venir : 17,
   Abandonnés : 0 » (1+12+17+0 = 30). Les lots 29 et 30 figurent dans
   « À venir ».
6. **Comptes définitifs et ligne du lot 28** : comptes ci-dessus (30 au
   total). La ligne du lot 28 rend : État = « clos », Ouvert le 6 septembre
   2026, Livré le 8 septembre 2026 — le lot reste compté dans « Faits »
   (12, inchangé par rapport à avant purge), l'index ne distinguant donc
   pas « livré » et « clos » en deux compteurs séparés, mais en un seul
   état agrégé « Faits ». Aucune colonne « Clos » distincte n'existe dans
   cet index.
7. **Faits `_ERRC` sur le wiki** (`action=ask&query=[[_ERRC::+]]`) : zéro
   résultat. Conforme.

## État de l'index avant et après purge

| | Total | En cours | Faits | À venir | Abandonnés |
|---|---|---|---|---|---|
| Avant purge | 28 | 1 | 12 | 15 | 0 |
| Après purge | 30 | 1 | 12 | 17 | 0 |

## Écarts et surprises

Un point mérite d'être noté sans être un écart au sens strict : la consigne
anticipait un affichage du type « Faits : 12, Clos : … » comme critère de
conformité de l'index. Mesuré : l'index ne porte pas de colonne « Clos »
séparée — le lot 28, passé de « livré » à « clos », reste compté dans
« Faits » avant comme après la purge (12 dans les deux cas). L'écart entre
les deux lectures ne vient donc pas d'un changement de compteur pour le
lot 28, mais de l'apparition des lots 29 et 30 dans « À venir » (15 → 17)
et du passage du total (28 → 30). La purge a bien résolu un cache de rendu,
comme l'annonçait le contexte, mais le signal qui le prouve est le total et
le compte « À venir », pas un compteur « Clos » qui n'existe pas dans ce
modèle d'index.

Aucun autre écart : révisions, tailles, forme du diff, absence de coupure
sur les dix permaliens et absence de faits `_ERRC` se sont tous vérifiés
tels qu'annoncés.

Le lot 28 est clos.
