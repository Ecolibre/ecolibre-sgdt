# Lot 11 — clé de tri : le « 26 puis 3 appendus » ne se reproduit pas dans l'état actuel

2026-08-21. Lecture seule, rien écrit, rien corrigé, comme demandé.

**Avertissement à lire avant le reste : le constat de départ ne s'est pas
reproduit.** Voir section 2. Tout ce qui suit reste rapporté tel que
mesuré, sans rien en déduire sur la cause de l'écart entre le signalement
et l'état observé aujourd'hui.

## 1. Comparaison des clés de tri — rien ne distingue les six items

`browsebysubject` sans filtre, `_SKEY` relevé en `repr()` Python pour
exclure tout caractère invisible (espace insécable, tiret différent…) :

| Item | `_SKEY` | Longueur |
|---|---|---|
| ECL-0003 | `Ail éléphant — Le Buisson de Cerzat (ECL-0003)` | 46 |
| ECL-0020 | `Helianthi — Le Buisson de Cerzat (ECL-0020)` | 43 |
| ECL-0039 | `Yacon — Le Buisson de Cerzat (ECL-0039)` | 39 |
| ECL-0040 | `Miscanthus — Le Buisson de Cerzat (ECL-0040)` | 44 |
| ECL-0041 | `Ail éléphant — Le Buisson de Cerzat (ECL-0041)` | 46 |
| ECL-0042 | `Ail éléphant — Le Buisson de Cerzat (ECL-0042)` | 46 |

Les six `_SKEY` sont strictement identiques à leur titre de page — même
tiret cadratin (`—`, U+2014), même espacement, aucun `DEFAULTSORT`
détecté, aucun caractère caché dans le `repr()`. **Rien dans `_SKEY`
lui-même ne distingue le trio trié (0003, 0020, 0039) du trio appendu
(0040, 0041, 0042).**

## 2. Stabilité du tri — le constat ne se reproduit pas aujourd'hui

**Requête `action=ask`, `sort=` vide, `order=asc`, `limit=200`** (la
requête de `Modèle:Lieu`, transclus par `Le Buisson de Cerzat`) :
**29 résultats**, ordre alphabétique complet, `0041`/`0042` juste après
`0003` (trois « Ail éléphant » consécutifs), `0040` à sa place
alphabétique entre les deux « Miscanthus » (`0027` puis `0040`). Liste
complète, position par position :

```
1 Ail éléphant (0003)      11 Crosnes du Japon (0012)   21 Miscanthus (0040)
2 Ail éléphant (0041)      12 Égopode (0013)            22 Oignon rocambole (0028)
3 Ail éléphant (0042)      13 Fraisier musqué (0015)    23 Paulownia (0030)
4 Bourrache (0004)         14 Fraisier X (0014)         24 Poireau perpétuel (0032)
5 Brocoli vivace (0005)    15 Helianthi (0020)          25 Poireau perpétuel (0033)
6 Capucine tubéreuse (0006)16 Hémérocalle (0021)        26 Roquette sauvage (0035)
7 Chayote (0007)           17 Hysope (0022)             27 Sarrasin vivace (0037)
8 Chou Daubenton (0008)    18 Menthe bergamote (0026)   28 Tomates (0038)
9 Consoude B14 (0010)      19 Menthe X (0023)           29 Yacon (0039)
10 Consoude naine (0011)   20 Miscanthus (0027)
```

**Rendu de la page `Le Buisson de Cerzat`** (`action=parse`, table
issue de `Modèle:Lieu`) : **même ordre, terme pour terme**, 29 lignes.
Aucun écart entre la requête API et le rendu de page.

**Rendu de la table « Buisson de Cerzat » sur `Avancement du
jardin-forêt`** (`sort=Inventory_number|order=asc`, explicite,
différent du `sort=` vide de `Modèle:Lieu`) : **29 lignes, ordre
numérique complet et continu** de `0003` à `0042`, `0040`/`0041`/`0042`
à leur place en fin de séquence numérique — attendu, puisque le tri
porte explicitement sur `Inventory_number`.

**Aucune des deux pages ne montre aujourd'hui le motif « 26 puis 3
appendus hors ordre ».** Les deux rendent la totalité des 29, dans un
ordre stable et cohérent avec le paramètre de tri employé par chacune.

## 3. Tri explicite par `Inventory_number` — 29 résultats, ordre continu

Rejoué directement sur la requête de `Modèle:Lieu`
(`[[Category:Physical item]] [[Located_at::Le Buisson de Cerzat]]`),
avec `sort=Inventory_number|order=asc|limit=200` à la place de
`sort=` vide :

**29 résultats** (pas d'exclusion : `Inventory_number` est porté par
les 29 items physiques du lieu), ordre continu `0003` → `0042` sans
saut ni répétition, `0040`/`0041`/`0042` en toute fin, à leur place
numérique — même liste que celle déjà rendue sur `Avancement du
jardin-forêt` (section 2).

## 4. Ce que les trois items ECL-0040/41/42 ont en commun — relevé brut

| | ECL-0040 | ECL-0041 | ECL-0042 |
|---|---|---|---|
| Titre | Miscanthus — Le Buisson de Cerzat (ECL-0040) | Ail éléphant — Le Buisson de Cerzat (ECL-0041) | Ail éléphant — Le Buisson de Cerzat (ECL-0042) |
| `Instance_of` | Miscanthus_La_Closerie_D'Olt_2026 | Ail_éléphant_Armand_2026 | Ail_éléphant_Armand_2026 |
| `Planting_date` | absent | 1/2026/8/7 | absent |
| `Specimen_status` | en place | en place | en réserve |
| `Propagated_from` | absent | ECL-0003 | ECL-0003 |
| `_MDAT` (dernière modif) | 1/2026/8/15 21:45:58 | 1/2026/8/15 21:45:58 | 1/2026/8/15 21:45:59 |

Pour comparaison, les trois du bloc « trié » :

| | ECL-0003 | ECL-0020 | ECL-0039 |
|---|---|---|---|
| `_MDAT` | 1/2026/8/15 21:45:38 | 1/2026/8/15 21:45:47 | 1/2026/8/15 21:45:57 |

**Les six `_MDAT` s'échelonnent tous entre 21:45:38 et 21:45:59, le
15 août 2026 — une fenêtre de 21 secondes.** `0040`/`0041`/`0042` sont
les trois derniers de cette fenêtre par l'horodatage, mais `0039`
(dans le bloc « trié ») les précède d'une seule seconde (`21:45:57`
contre `21:45:58`/`21:45:59`) — l'écart temporel entre le dernier item
du bloc trié et le premier de la série appendue est minime.
`Instance_of`, forme du titre et `Specimen_status` ne dégagent aucun
point commun net aux trois : deux espèces différentes (Miscanthus,
Ail éléphant), deux états différents (en place, en réserve), un seul
sur trois (`0041`) porte une `Planting_date`.

Vérification complémentaire des horodatages de création (et non plus
de dernière modification) via `prop=revisions&rvdir=newer&rvlimit=1` :
les `pageid` sont strictement croissants et contigus sur la plage
observée — 380 (`0027`, 21:45:51) → 391 (`0038`, 21:45:57) → 392
(`0039`, 21:45:57) → 393 (`0040`, 21:45:58) → 394 (`0041`, 21:45:58) →
395 (`0042`, 21:45:59). Les 40 pages de la fenêtre relèvent donc d'un
seul lot de création séquentiel, pas de deux imports distincts : la
date de création ne sépare pas davantage le trio « trié » du trio
« appendu » que ne le fait `_MDAT`.

## 5. Re-vérification du 23 août 2026 — le constat tient toujours

Rejoué à l'identique deux jours plus tard, sans purge ni écriture :
mêmes 29 résultats, même ordre alphabétique complet sur `sort=` vide
(section 2), même rendu sur la page `Le Buisson de Cerzat` (comparé
cette fois à la fois par `action=parse` et par une lecture directe de
`https://wiki.ecolibre.org/wiki/Le_Buisson_de_Cerzat`, donc à la fois
en contournant et en passant par le cache de rendu normal — les deux
concordent), même ordre numérique continu sur `Avancement du
jardin-forêt` et sur `sort=Inventory_number` rejoué directement. Les
six `_SKEY` et les `_MDAT` relevés aujourd'hui sont identiques à ceux
du 21 août, caractère pour caractère. **Le motif « 26 puis 3 appendus
hors ordre » ne s'est donc pas reproduit une deuxième fois, sur un
intervalle de deux jours et sans aucune intervention entre-temps** —
ce qui pèse contre l'hypothèse d'un cache de rendu simplement pas
encore rafraîchi au moment du signalement initial, et pour l'hypothèse
que le signalement de départ décrivait un état déjà révolu (capture
locale antérieure au dernier recalcul de la requête, ou observation
faite avant la fin de la propagation SMW du lot de création du
15 août). Toujours sans conclusion ferme, comme demandé : seul le
constat « non reproduit deux fois » est nouveau ici.
