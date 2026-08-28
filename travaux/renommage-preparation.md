# Préparation — renommage grandeur nature d'« Extrémité de tranchée »

**Aucune écriture, aucun renommage effectués ici.** Cyril fera le
renommage à la main par l'interface : `Extrémité de tranchée` →
`Butte de l'extrémité amont de la tranchée principale`, redirection
laissée. Premier renommage de lieu en production, et premier à
traverser plusieurs propriétés à la fois (`Located_at`, `Image_location`,
potentiellement `Located_in`).

## 1. Corrections courtes

### Commentaire de galerie — *Avancement du jardin-forêt*

Réécrit. Résumé : `[Correctif] Commentaire de galerie — état des photos
à jour`. `oldrevid` 990 → `newrevid` 1078. Seul le bloc `<!-- -->`
au-dessus de la section Photos a été touché — rien d'autre sur la page
(diff local vérifié avant écriture : neuf lignes remplacées par huit,
aucune autre différence).

Ancien texte : décrivait l'état du 25 août (45 photos encore sur *Le
Buisson de Cerzat*, aucune sur *Butte de la tranchée*) comme justification
de l'absence de filtre par lieu — devenu faux depuis les deux séries
d'écritures des 27-28 août.

Nouveau texte : dit que `Image_location` est à jour sur les 73 photos,
et que l'absence de filtre est un choix délibéré (indépendance vis-à-vis
de tout redécoupage futur), pas un pis-aller en attente de correction.
Mécanique de la galerie inchangée — seul le motif documenté change.

### 41 items / 40 plantations — écart expliqué et prouvé

**Confirmé, pas seulement plausible.** L'unique item avec `Located_at`
qui n'entre pas dans le compte de 40 est `Machine à souder par point —
Atelier appartement (ECL-0043)`. Recoupé sur deux canaux :

- `ask` : `[[Located_at::Atelier appartement]]` ne retourne que cet item,
  et sa colonne « Catégorie » liste uniquement `Catégorie:Physical item`
  — pas `Catégorie:Item à facette végétal`.
- `browsebysubject` sur la page : `_INST -> ['Physical_item#14##']`
  seul, aucune seconde catégorie. Concorde avec `ask`.

C'est bien la seule explication de l'écart : une machine à souder n'a
pas de facette végétale, donc n'apparaît jamais dans une table filtrée
sur `Category:Item à facette végétal` comme celle d'*Avancement du
jardin-forêt*. 41 items physiques avec `Located_at`, 40 avec la facette
végétale, 1 sans (celui-ci) — l'arithmétique est complète, pas une
coïncidence.

## 2. Relevé avant renommage — état actuel d'« Extrémité de tranchée »

### Items avec `Located_at` vers ce lieu (2)

- `Consoude B14 — Le Buisson de Cerzat (ECL-0010)`
- `Consoude naine — Le Buisson de Cerzat (ECL-0011)`

### Pages `Fichier:` avec `Image_location` vers ce lieu (2)

- `Fichier:ECL-Buisson Cerzat-Consoude B14-2026-08-08 01.jpg`
- `Fichier:ECL-Buisson Cerzat-Consoude naine-2026-08-08 01.jpg`

### Lieux avec `Located_in` vers ce lieu (0)

Aucun — *Extrémité de tranchée* n'a pas de lieu enfant. Le renommage ne
traverse donc pas cette propriété-là, malgré le nom de la tâche
(« premier à traverser plusieurs propriétés ») : `Located_at` et
`Image_location`, deux propriétés, pas trois.

### `list=backlinks`, tous espaces confondus (5)

| Titre | Espace | Origine du lien |
|---|---|---|
| Consoude B14 — Le Buisson de Cerzat (ECL-0010) | 0 | `Located_at` |
| Consoude naine — Le Buisson de Cerzat (ECL-0011) | 0 | `Located_at` |
| Fichier:ECL-Buisson Cerzat-Consoude B14-2026-08-08 01.jpg | 6 | `Image_location` |
| Fichier:ECL-Buisson Cerzat-Consoude naine-2026-08-08 01.jpg | 6 | `Image_location` |
| Avancement du jardin-forêt | 0 | lien généré dans la colonne « Lieu » du tableau `#ask` (aucune mention en dur dans le wikitexte — vérifié, aucun `[[Extrémité de tranchée]]` littéral sur cette page) |

Recherche plein texte (`srsearch="Extrémité de tranchée"`, complément à
`backlinks` pour attraper une mention en prose sans lien) : mêmes deux
items, rien de plus. Aucune mention orpheline hors des cinq backlinks.

### Littéral stocké — un item et une photo, avant renommage

```
Consoude B14 — Le Buisson de Cerzat (ECL-0010)
  Located_at -> ['Extrémité_de_tranchée#0##']

Fichier:ECL-Buisson Cerzat-Consoude B14-2026-08-08 01.jpg
  Image_location -> ['Extrémité_de_tranchée#0##']
```

Référence pour la mesure d'après-renommage : le littéral doit basculer
sur le nouveau nom après purge, comme établi par le test à un seul
renommage (entrée n° 26 de *Limites connues*) et par le test à double
renommage (entrée n° 32).

## 3. Ce qu'il faudra purger après, et dans quel ordre

Le renommage lui-même (fait par Cyril, redirection laissée) ne touche
aucun fait stocké : les quatre pages annotantes garderont leur littéral
sur l'ancien nom jusqu'à leur propre reparse. L'ordre proposé, fondé sur
le mécanisme mesuré (résolution de redirection au reparse, propagée par
la file de travaux) :

1. **Purger les deux items** (`Consoude B14 — Le Buisson de Cerzat
   (ECL-0010)`, `Consoude naine — Le Buisson de Cerzat (ECL-0011)`) —
   fait basculer leur `Located_at` stocké sur le nouveau nom.
2. **Purger les deux pages `Fichier:`** (mêmes deux photos) — même
   mécanisme pour `Image_location`.
3. **Attendre le vidage de la file de travaux** (`bin/wiki-wait-jobs.sh`)
   avant toute lecture de contrôle — la bascule du littéral dépend de la
   file, pas seulement de la purge elle-même (mesuré sur les deux tests
   précédents : la purge déclenche, la file doit ensuite se vider).
4. **Purger `Avancement du jardin-forêt`** — sa table est générée par
   `#ask` à partir de `Located_at`, donc se corrigera d'elle-même dès
   que les deux items du point 1 auront basculé ; la purger en plus
   évite de dépendre du délai d'invalidation automatique du cache de
   requête SMW, déjà vu lent ailleurs dans ce projage (entrée sur la
   propagation de changement, *Limites connues*).
5. **Vérifier, pas supposer** : `browsebysubject` sur les deux items et
   les deux photos (le littéral doit porter le nom final) ; `ask` en
   liste (jamais `format=count`) sur l'ancien nom, qui doit rendre 0 ;
   `Special:DoubleRedirects`, qui ne doit montrer aucune chaîne (un seul
   renommage laisse une redirection simple, pas une chaîne) ; et un
   contrôle visuel du tableau « Plantations » d'*Avancement du
   jardin-forêt*, dont la colonne « Lieu » doit afficher le nouveau nom
   sur les deux lignes Consoude.

**Non prévu dans cette liste, à surveiller** : la page elle-même,
devenue redirection sous l'ancien titre. Rien à purger côté contenu —
mais si un futur test ou une future lecture s'appuie sur le titre
`Extrémité de tranchée` en s'attendant à un lieu réel plutôt qu'à une
redirection, la confusion viendra de là, pas d'un défaut de purge.

Aucune écriture faite dans cette tâche. Prêt pour le renommage par
Cyril.
