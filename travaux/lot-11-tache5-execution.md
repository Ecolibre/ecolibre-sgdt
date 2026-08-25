# Lot 11, tâche 5 — création de l'arbre des lieux

2026-08-25. Arbre créé dans l'ordre demandé, un lieu à la fois, contrôle
`browsebysubject` après chaque écriture. Puis bascule des 29 plantations.
Session ouverte par `bin/wiki-login.sh` avant la première écriture.
Résumés `[Lot 11][Tâche 5]` sur les créations/complétions de lieux,
même résumé répété sur les 29 bascules (une seule action, répétée).

## Écart constaté avant de commencer — 13 lieux, pas 14

L'arbre donné en consigne compte, nœud par nœud (racines, hameau,
terrain, deux zones, trois lieux sous zones, commune Chilhac,
appartement, trois lieux sous appartement) : **13 lieux distincts**, pas
14. L'étape 2 énumère explicitement 8 créations
(`Cerzat, Chilhac, Appartement de Chilhac, Zone basse, Zone haute, Butte
de la tranchée, Extrémité de tranchée, Au pied du pylône électrique`) +
1 en étape 1 (`Terrain de Cyril au Buisson de Cerzat`) = **9 créations**,
pas 10. Les deux écarts sont de 1, cohérents entre eux (13 − 9 = 4
existantes, 14 − 10 = 4 existantes). Aucun nœud supplémentaire n'a été
inventé pour atteindre 14 : l'arbre et les étapes, explicites et
complets, ont été suivis tels quels. Signalé, pas bloquant — aucune
ambiguïté sur *quoi* créer.

## Étape 1 — le terrain en premier, LOC-0001

Vérifié absent avant création. Créé avec `Located_in=` vide :
```
{{Lieu
|Place_name=
|Postal_address=
|Latitude=
|Longitude=
|Located_in=
|Location_number=0001
|Location_site=LOC
|Location_type=
|INSEE_code=
}}
```
`browsebysubject` après écriture : `Location_number -> ['0001']`, aucun
autre lieu ne portait encore de numéro — premier numéro pris comme
demandé.

## Étape 2 — parent avant enfant, numérotation manuelle

Chaque page vérifiée absente avant création (`--createonly`), chaque
écriture suivie d'un `browsebysubject` individuel confirmant le numéro
attribué et l'absence de doublon (recoupé contre tous les numéros déjà
posés). Aucun contrôle n'a échoué — la séquence n'a jamais eu besoin de
s'arrêter.

| Ordre | Lieu | Location_number | Location_type | Located_in |
|---|---|---|---|---|
| 2 | Cerzat | 0002 | commune | *(vide, racine)* |
| 3 | Chilhac | 0003 | commune | *(vide, racine)* |
| 4 | Appartement de Chilhac | 0004 | *(vide — non donné en consigne)* | Chilhac |
| 5 | Zone basse | 0005 | *(vide)* | Terrain de Cyril au Buisson de Cerzat |
| 6 | Zone haute | 0006 | *(vide)* | Terrain de Cyril au Buisson de Cerzat |
| 7 | Butte de la tranchée | 0007 | *(vide)* | Zone basse |
| 8 | Extrémité de tranchée | 0008 | *(vide)* | Zone basse |
| 9 | Au pied du pylône électrique | 0009 | *(vide)* | Zone haute |

`Location_type` laissé vide partout où la consigne ne donnait pas de
valeur explicite — rien inventé. `Location_site=LOC` et `Place_name`
vide sur les neuf, comme demandé.

## Étape 3 — quatre pages existantes complétées

Chacune relue avant écriture (Latitude/Longitude/Place_name/
Postal_address existants préservés tels quels), puis `browsebysubject`
après :

| Ordre | Lieu | Location_number | Location_type | Located_in |
|---|---|---|---|---|
| 10 | Le Buisson de Cerzat | 0010 | hameau | Cerzat |
| 11 | Jardin de Chilhac | 0011 | jardin | Appartement de Chilhac |
| 12 | Terrasse de Chilhac | 0012 | terrasse | Appartement de Chilhac |
| 13 | Atelier appartement | 0013 | atelier | Appartement de Chilhac |

Aucun doublon à aucune étape — vérifié à chaque écriture, pas seulement
à la fin.

## Étape 4 — le terrain rattaché

`Terrain de Cyril au Buisson de Cerzat` relu, `Located_in` renseigné à
`Le Buisson de Cerzat`, tout le reste (dont `Location_number=0001`)
inchangé. `browsebysubject` après : `Located_in ->
['Le_Buisson_de_Cerzat#0##']`.

## Bascule des 29 plantations

Liste relevée avant de commencer (`#ask [[Category:Physical
item]][[Located_at::Le Buisson de Cerzat]]`, 29 résultats) :

Ail éléphant (ECL-0003, ECL-0041, ECL-0042) · Bourrache (ECL-0004) ·
Brocoli vivace (ECL-0005) · Capucine tubéreuse (ECL-0006) · Chayote
(ECL-0007) · Chou Daubenton (ECL-0008) · Consoude B14 (ECL-0010) ·
Consoude naine (ECL-0011) · Crosnes du Japon (ECL-0012) · Égopode
(ECL-0013) · Fraisier X (ECL-0014) · Fraisier musqué (ECL-0015) ·
Helianthi (ECL-0020) · Hémérocalle (ECL-0021) · Hysope (ECL-0022) ·
Menthe X (ECL-0023) · Menthe bergamote (ECL-0026) · Miscanthus
(ECL-0027, ECL-0040) · Oignon rocambole (ECL-0028) · Paulownia
(ECL-0030) · Poireau perpétuel (ECL-0032, ECL-0033) · Roquette sauvage
(ECL-0035) · Sarrasin vivace (ECL-0037) · Tomates (ECL-0038) · Yacon
(ECL-0039) — toutes suffixées « — Le Buisson de Cerzat ».

Chacune relue, seule la ligne `Located_at=Le Buisson de Cerzat` changée
en `Located_at=Butte de la tranchée`, tout le reste réécrit à l'identique
— **`Planting_rank` non touché**, y compris sur `ECL-0023` (`15`) et
`ECL-0026` (`2`), déjà corrigés dans une session précédente : diff
vérifié avant chaque écriture, une seule ligne changée à chaque fois.
29 écritures, résumé identique sur chacune : `[Lot 11][Tâche 5] Bascule
Located_at — Le Buisson de Cerzat vers Butte de la tranchée`.

## Vérifications

- **Unicité des `Location_number`** : `#ask [[Category:Lieu]]` sur les
  13 lieux, 13 numéros, `0001` à `0013`, **aucun doublon** (vérifié par
  script, pas à l'œil).
- **`Located_in`** : présent sur les 11 lieux qui ne sont pas des
  communes ; absent sur les deux communes (`Cerzat`, `Chilhac`) — comme
  attendu, un lieu racine n'a pas de parent.
- **`Le Buisson de Cerzat`** : `0` item physique rattaché
  (`Located_at::Le Buisson de Cerzat` → `count: 0`).
- **`Butte de la tranchée`** : `29` items physiques rattachés
  (`Located_at::Butte de la tranchée` → `count: 29`).
- **`Erreurs de traitement SMW`** : `1`, inchangé — `Attribut:INSEE
  code`, seule page en erreur, comme avant cette tâche. Aucune nouvelle
  erreur introduite par les 13 créations/complétions de lieux ni par les
  29 bascules.

## Ce qui n'a pas été fait

`Zone basse`/`Zone haute`/`Appartement de Chilhac`/etc. sans
`Location_type` : laissé vide faute de valeur donnée en consigne, pas
une omission — à compléter par Cyril si souhaité. Rien d'autre en
attente pour cette tâche.
