# Mesure — après renommage d'« Extrémité de tranchée »

Renommage fait à la main par Cyril :
`Extrémité de tranchée` → `Butte de l'extrémité amont de la tranchée
principale`, redirection laissée. Premier renommage de lieu en
production.

État de référence : `renommage-preparation.md` §2 — 2 items par
`Located_at`, 2 photos par `Image_location`, 0 lieu enfant, 5 backlinks
dont *Avancement du jardin-forêt* via sa colonne générée.

---

## 1. AVANT TOUTE PURGE — ce qui s'est passé tout seul

**Tout a déjà convergé, sans aucune purge.** Le renommage seul a suffi.

### Littéral stocké sur les quatre pages annotantes

`browsebysubject`, aucune purge déclenchée, file à 5 jobs au moment de
la lecture :

| Page | Propriété | Littéral stocké |
|---|---|---|
| Consoude B14 — Le Buisson de Cerzat (ECL-0010) | `Located_at` | `Butte_de_l'extrémité_amont_de_la_tranchée_principale#0##` |
| Consoude naine — Le Buisson de Cerzat (ECL-0011) | `Located_at` | `Butte_de_l'extrémité_amont_de_la_tranchée_principale#0##` |
| Fichier:ECL-Buisson Cerzat-Consoude B14-2026-08-08 01.jpg | `Image_location` | `Butte_de_l'extrémité_amont_de_la_tranchée_principale#0##` |
| Fichier:ECL-Buisson Cerzat-Consoude naine-2026-08-08 01.jpg | `Image_location` | `Butte_de_l'extrémité_amont_de_la_tranchée_principale#0##` |

Les quatre portent **le nouveau nom** dans le stockage SMW. Le `_MDAT`
de chaque page est inchangé (26/08 pour les items, 27/08 pour les
photos) : les pages n'ont pas été reparsées. C'est donc la propagation
de changement de SMW, déclenchée par le renommage lui-même (résolution
de la redirection au niveau du stockage), qui a réécrit les quatre
références — pas un reparse.

### Colonne « Lieu » du tableau d'*Avancement du jardin-forêt*

Rendu live (`action=parse`, qui rejoue le `#ask` sur le stockage
courant) : les deux lignes Consoude (`data-row-number` 2 et 3)
affichent le lien

> Butte de l'extrémité amont de la tranchée principale
> (`/wiki/Butte_de_l%27extr%C3%A9mit%C3%A9_amont_de_la_tranch%C3%A9e_principale`)

Aucune trace d'« Extrémité de tranchée » dans la colonne. La table
suit le stockage, qui a déjà basculé.

**Réserve** : `action=parse` rejoue la requête et ne dit rien de l'état
du cache de page / cache de requête SMW servi à un visiteur normal.
La donnée sous-jacente est juste ; la fraîcheur du cache visiteur
reste à vérifier après purge.

### Ancien titre

`wiki-get.sh "Extrémité de tranchée"` →
`#REDIRECTION [[Butte de l'extrémité amont de la tranchée principale]]`
— redirection simple en place.

### Conclusion de l'étape 1

C'est la première fois qu'on observe une convergence **sans purge** sur
ce mécanisme. Les tests précédents (entrées n° 26 et n° 32 de *Limites
connues*) concluaient « la purge déclenche, la file doit ensuite se
vider ». Ici le renommage a suffi à déclencher la propagation. La purge
prévue en étape 2 devient une confirmation de fraîcheur de cache, pas
une étape de convergence de données.

---

## 2. Purge

Ordre suivi (celui de la préparation §3) :

1. `wiki-purge.sh` sur les deux items → `purged: true`, `linkupdate: true`.
2. `wiki-purge.sh` sur les deux photos → `purged: true`, `linkupdate: true`.
3. `wiki-wait-jobs.sh` : **file figée à 5 travaux** (5 essais, aucun
   mouvement). La file était **déjà à 5 avant la purge** — ce sont des
   jobs bloqués, pas un effet du renommage. Rien à attendre : la
   convergence des données était acquise avant même la purge (§1).
4. *Avancement du jardin-forêt* purgé **après** contrôle (voir §3) —
   et ça a changé quelque chose : voir plus bas.

`wiki-purge.sh` émet un `warnings: "Unrecognized parameter: token."`
sur chaque appel — bénin, le `batchcomplete: true` et le `purged: true`
sont là. À signaler pour ne pas le reprendre en anomalie à chaque fois.

### Effet de la purge d'*Avancement du jardin-forêt*

**Oui, ça a changé quelque chose — au niveau des liens indexés, pas des
données.** Avant sa purge, *Avancement du jardin-forêt* figurait encore
dans `list=backlinks` de l'**ancien** titre (lien généré par sa colonne
`#ask`, table `pagelinks` datant du dernier parse réel). Après purge
avec `forcelinkupdate`, ce backlink a disparu : le reparse a régénéré
la colonne avec le lien vers le **nouveau** nom.

Donc : le rendu live (`action=parse`) montrait déjà le nouveau nom en
§1 parce qu'il rejoue le `#ask` sur le stockage courant ; mais la table
`pagelinks` et le cache de page servis à un visiteur restaient sur
l'ancien nom jusqu'à cette purge. La purge d'*Avancement* n'était pas
cosmétique.

---

## 3. Contrôles (file « vidée » — en pratique figée à 5, données déjà stables)

### `browsebysubject` sur les quatre pages annotantes

Les quatre portent le **nouveau nom** dans `Located_at` /
`Image_location`. `_MDAT` inchangé partout (purge = rafraîchissement de
cache, pas reparse) :

| Page | Propriété | Littéral | `_MDAT` |
|---|---|---|---|
| Consoude B14 (ECL-0010) | `Located_at` | `Butte_de_l'extrémité_amont_de_la_tranchée_principale#0##` | 26/08 |
| Consoude naine (ECL-0011) | `Located_at` | idem | 26/08 |
| Fichier … Consoude B14 … | `Image_location` | idem | 27/08 |
| Fichier … Consoude naine … | `Image_location` | idem | 27/08 |

### `ask` en liste — ancien nom, recoupé par le nouveau

**L'attente « 0 sur l'ancien nom » de la préparation §3 est fausse.**
SMW résout la redirection **dans la condition de requête** :

| Requête | Résultats | `meta.hash` |
|---|---|---|
| `[[Located_at::Extrémité de tranchée]]` | 2 (les deux Consoudes) | `f6f9af30…` |
| `[[Located_at::Butte de l'extrémité amont…]]` | 2 (les deux Consoudes) | `f6f9af30…` |
| `[[Image_location::Extrémité de tranchée]]` | 2 (les deux photos) | `a80d1f9b…` |
| `[[Image_location::Butte de l'extrémité amont…]]` | 2 (les deux photos) | `a80d1f9b…` |

`meta.hash` **identique** entre ancien et nouveau nom pour chaque
propriété : ce n'est pas une entrée d'index périmée sur l'ancien nom,
c'est la **même requête compilée** — SMW normalise `Extrémité de
tranchée` vers sa cible de redirection avant de bâtir la requête. La
redirection est donc porteuse de données **aussi pour les requêtes**,
pas seulement pour le littéral stocké. Un `format=count` sur l'ancien
nom aurait rendu 2 et fait croire à une non-convergence — d'où la
consigne « jamais `format=count` ».

### `list=backlinks`

| Titre interrogé | Backlinks |
|---|---|
| `Extrémité de tranchée` (ancien) | 4 — les 2 items + les 2 photos, **et plus** *Avancement* (parti après sa purge) |
| `Butte de l'extrémité amont de la tranchée principale` (nouveau) | 1 — la page de redirection `Extrémité de tranchée` elle-même |

Les 4 backlinks restants sur l'ancien titre viennent du **wikitexte**
des 4 pages annotantes, qui contient toujours
`[[Located_at::Extrémité de tranchée]]` /
`[[Image_location::Extrémité de tranchée]]` en toutes lettres. Ce sont
désormais des liens **vers une redirection**.

### `Special:DoubleRedirects`

Vide. Un seul renommage → une redirection simple, pas de chaîne.

### Erreurs de traitement SMW (`[[_ERRC::+]]`)

**Toujours 1** — `Attribut:INSEE code`, inchangé, sans rapport avec ce
renommage.

### Page du lieu sous le nouveau titre

`browsebysubject` :

- `Location_number -> ['0008']` ✓
- `Located_in -> ['Zone_basse#0##']` ✓
- `_INST -> ['Lieu#14##']` ✓
- `_SKEY -> ["Butte de l'extrémité amont de la tranchée principale"]` ✓
- « Présents ici » = `[[Located_at::<nouveau nom>]]` → les deux
  Consoudes (ECL-0010, ECL-0011). ✓

---

## 4. Ce qui a divergé entre le wikitexte et le stockage

**Le stockage SMW a basculé, le wikitexte n'a pas bougé.**

| | Wikitexte des 4 pages annotantes | Stockage SMW |
|---|---|---|
| Nom du lieu | `Extrémité de tranchée` (inchangé) | `Butte de l'extrémité amont de la tranchée principale` |
| Mécanisme | aucun reparse (`_MDAT` d'avant renommage) | propagation de changement déclenchée par le renommage |

C'est **attendu** — mais à dire explicitement : les quatre pages
annotantes contiennent toujours l'ancien nom en dur dans leur
`[[Located_at::…]]` / `[[Image_location::…]]`. La cohérence entre ce
wikitexte et le lieu réel ne tient **que par la redirection** :

- le lien `[[…::Extrémité de tranchée]]` de chaque page pointe sur la
  redirection ;
- une requête `ask` sur l'un ou l'autre nom résout la redirection et
  rend le bon résultat ;
- supprimer la redirection casserait les quatre annotations d'un coup
  (lien rouge, et surtout la résolution de requête) sans toucher au
  wikitexte.

**La redirection `Extrémité de tranchée` est porteuse de données. Elle
ne doit pas être supprimée** tant que les quatre pages annotantes n'ont
pas été réécrites pour porter le nouveau nom dans leur wikitexte (un
`replace` de paramètre, à faire dans un lot dédié si on veut se passer
de la redirection — sinon la laisser est parfaitement viable).

---

## 5. Écarts avec la préparation `renommage-preparation.md`

1. **Convergence sans purge.** La préparation supposait la purge
   nécessaire à la bascule du littéral. Le renommage seul a suffi ;
   la purge n'a servi qu'à rafraîchir le cache de page et `pagelinks`
   (utile pour *Avancement*, neutre pour les 4 pages annotantes).
2. **`ask` sur l'ancien nom ≠ 0.** Rend 2, par résolution de
   redirection dans la condition — `meta.hash` identique au nouveau
   nom. L'attente « 0 attendu » de la préparation §3/§5 est à corriger.
3. **File de travaux figée à 5**, état antérieur au renommage —
   `wiki-wait-jobs.sh` sort en code 2. Sans effet ici puisque les
   données étaient déjà stables.

## 6. À porter dans *Limites connues du SGDT* (non fait — hors périmètre de cette mesure)

Nouvelle entrée : **un renommage de lieu avec redirection laissée fait
converger seul le littéral SMW des propriétés de type Page qui le
visaient** (`Located_at`, `Image_location`), par propagation de
changement, sans purge ni reparse des pages annotantes — mais leur
wikitexte garde l'ancien nom, donc la redirection devient porteuse de
données et un `ask`/`backlinks` sur l'ancien nom continue de résoudre.
Complète les entrées n° 26 (renommage simple) et n° 32 (double
renommage), toutes deux menées sur bac à sable ; celle-ci est le
premier cas **en production** et le premier sans purge.
