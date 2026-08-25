# Lot 11 — le verrou de propagation, v2 : deux corrections puis écriture

2026-08-25. Corrige deux défauts de `lot-11-verrou-mesure.md`, puis écrit
les deux fichiers (dépôt git, pas le wiki).

## 1. Erreur de fait corrigée — date de création de `Attribut:Planting rank`

`lot-11-verrou-mesure.md` affirmait « créée le 24 août 2026 ». Faux.
Vérifié :
```
action=query&titles=Attribut:Planting rank&prop=revisions&rvdir=newer&rvlimit=1&rvprop=timestamp|ids
→ revid 507, parentid 0, timestamp 2026-08-15T14:31:36Z
```
`parentid: 0` marque la première révision. **`Attribut:Planting rank`
date du 15 août 2026**, comme les cinq propriétés du lot 7 — elle a été
**éditée**, pas créée, les 24 et 25 août. Corrigé dans les deux fichiers
ci-dessous.

## 2. Surcorrection retirée — ce que les six cas mesurent vraiment

`lot-11-verrou-mesure.md` concluait « le verrou n'est ni systématique à
la création, ni lié à une date de création ». **Aucune des preuves
disponibles ne teste une création** : les six pages corrigées le 25 août
(les cinq du lot 7 + `Planting rank`, toutes du 15 août) sont des pages
**existantes**, éditées après coup. Le seul cas de création disponible,
`Attribut:INSEE code`, a justement été refusé trois fois juste après sa
création le 21 août — cohérent avec le comportement documenté de SMW
(verrouiller une page de propriété le temps de sa propagation).

Reformulé pour ne dire que le mesuré, dans les deux fichiers :
- éditer une page de propriété **existante** fonctionne : six cas, aucun
  refus ;
- une seule page reste bloquée, `Attribut:INSEE code`, depuis sa création
  le 21 août : cinq refus sur quatre jours ;
- l'anomalie n'est pas le verrou lui-même (comportement normal documenté
  de SMW à la création) mais qu'il ne se lève pas sur cette page précise ;
- si une création déclenche un verrou temporaire normal qui se lève de
  lui-même : **non testé** — le seul cas disponible est justement celui
  qui ne s'est jamais levé.

Le renvoi au verrou orphelin de `lot-9-tache0-rapport.md` §10 (file de
travaux déjà vide au moment du blocage) est conservé tel quel — utile
pour la demande à fuzzy, indépendant des deux corrections ci-dessus.

## a) `demandes-adminsys.md` — écrit

Section `$smwgChangePropagationProtection` (## 2.2 Configuration)
réécrite. Relu après écriture, contenu conforme :

```
- **`$smwgChangePropagationProtection` — un verrou mesuré sur une seule
  page, pas une règle générale.** Deux versions précédentes de cette
  entrée ont chacune généralisé depuis un cas unique, sans le vérifier :
  d'abord un incident ponctuel du 15 août, puis « le verrou se
  redéclenche à chaque création de propriété ». **Ce que le mesuré dit
  au 25 août 2026, et rien de plus** :
  - **Éditer une page de propriété existante fonctionne : six cas, aucun
    refus.** Les cinq propriétés du lot 7 (`Edible_parts`, `Plant_habit`,
    `Propagation_method`, `Root_system`, `Seed_treatment`) et
    `Attribut:Planting rank` sont toutes des pages du 15 août 2026 —
    créées avec les 15 pages `Attribut:` de l'incident initial, pas le
    21. `Property_range` corrigé sur les six le 25 août 2026, du premier
    coup, sans aucun refus.
  - **Une seule page reste bloquée : `Attribut:INSEE code`, depuis sa
    création le 21 août 2026** (lot 11, tâche 1) — cinq refus
    `smw-change-propagation-protection` identiques, répartis sur quatre
    jours, jamais corrigée depuis.
  - **L'anomalie n'est donc pas le verrou lui-même, mais qu'il ne se
    lève pas sur cette page précise.** Un verrou temporaire à la création
    d'une propriété, le temps que sa propagation se termine, est le
    comportement documenté de SMW — cohérent avec les trois refus
    essuyés juste après la création d'`INSEE_code`. **Mais aucun des six
    cas mesurés ne teste une création** : les six sont des pages
    existantes, éditées après coup. Si une création déclenche
    normalement un verrou temporaire qui se lève de lui-même, ça reste
    **non testé** — le seul cas de création disponible est justement
    celui qui ne s'est jamais levé, ce qui ne permet pas de trancher.

  **Demande à fuzzy** — deux pistes, pas une certitude sur laquelle
  trancher depuis ce côté-ci :
  1. Vérifier `$smwgChangePropagationProtection` dans
     `LocalSettings_ecolibre.php` (valeur actuelle jamais lue
     directement depuis ici).
  2. **Vider la file de travaux — probablement suffisant à lever ce
     verrou précis**, un verrou de propagation attendant par
     construction qu'un job s'exécute. Note pour fuzzy : un vidage de
     file n'avait *pas* suffi sur le verrou orphelin de la section 2.1
     de cette page (`lot-9-tache0-rapport.md` §10, file déjà vide au
     moment du blocage) — deux cas qui se ressemblent en surface, pas
     nécessairement la même cause.
```

## b) `CLAUDE.md` — écrit, validé tel quel

Puce ajoutée en fin de section « Leçons de méthode (wiki et outillage) »,
avant « ## Garde-fous d'exécution (dépôt git) ». Relu après écriture,
contenu conforme :

```
- **Un blocage déduit n'est pas un blocage constaté.** Le 21 août 2026,
  une écriture refusée sur `Attribut:INSEE code` a fait conclure que les
  cinq propriétés du lot 7 étaient sous le même verrou. Personne ne
  l'avait testé. Le 25 août, les cinq se sont écrites du premier coup.
  **Avant de déclarer une correction impossible, tenter l'écriture sur
  un cas — le refus coûte moins cher que la dette.**
```

Écritures locales au dépôt git — aucune écriture sur le wiki dans cette
session. Rien commité ni poussé.
