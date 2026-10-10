# Lot 22 — Tâche 15 — Correctif après clôture : six permaliens et une date

Exécuteur : Claude Code, 10 octobre 2026 (date relevée par `date` : sam.
10 oct. 2026 13:27:06 CEST). Une seule page du wiki écrite : *Lot 22 —
Miroir local*. Correctif de fait sur une page close, pas une réouverture :
état, dates, rapport de clôture et `Work_package_produces` non touchés.

**Résultat : les six permaliens de la page pointent sur `20ea2a2`, où le
fichier des écarts en porte douze ; le compte est daté du 10 octobre 2026.
Révision 1489 → 1490. Les six contrôles passent.**

## Révisions

| Page | Avant | Après | Horodatage |
|---|---|---|---|
| Lot 22 — Miroir local | 1489 | **1490** | 2026-10-10T11:28:52Z |

Résumé : `[Lot 22][Correctif] Six permaliens reconstruits sur l'état final,
et le compte de douze daté du 10 octobre`.

## Étape 1 — État du dépôt

`git status --porcelain` : vide. `.claude/settings.local.json` : `allow` et
`deny` vides. Dernier commit poussé, `HEAD` égal à `origin/main` après
`git fetch` : **`20ea2a2cc9d5084d0b7f4fcfb78bc3d0665274c6`** (rapport de la
tâche 14). Titre lu dans `Catégorie:Lot` : « Lot 22 — Miroir local ».
Révision lue avant écriture : **1489**, `protection: []`.

## Étape 2 — Les six permaliens

Relevés dans le wikitexte de la 1489, tous les permaliens `blob` : sept,
dont celui du rapport de clôture (`302e513`, `Work_package_closure_report`,
non touché) et les six à reconstruire. Compte conforme à celui de
l'architecte.

| # | Section | Ancienne URL | Nouvelle URL |
|---|---|---|---|
| 1 | Points ouverts | https://github.com/Ecolibre/ecolibre-sgdt/blob/123d68cb2d8abaf44aa8dd1f2b38705e9d35e63b/miroir/ecarts-avec-la-production.md | https://github.com/Ecolibre/ecolibre-sgdt/blob/20ea2a2cc9d5084d0b7f4fcfb78bc3d0665274c6/miroir/ecarts-avec-la-production.md |
| 2 | Fichiers produits | https://github.com/Ecolibre/ecolibre-sgdt/blob/ed14a89f7e003b126614f9b955eb6c03b69e2b27/miroir/README.md | https://github.com/Ecolibre/ecolibre-sgdt/blob/20ea2a2cc9d5084d0b7f4fcfb78bc3d0665274c6/miroir/README.md |
| 3 | Fichiers produits | https://github.com/Ecolibre/ecolibre-sgdt/blob/ed14a89f7e003b126614f9b955eb6c03b69e2b27/miroir/compose.yml | https://github.com/Ecolibre/ecolibre-sgdt/blob/20ea2a2cc9d5084d0b7f4fcfb78bc3d0665274c6/miroir/compose.yml |
| 4 | Fichiers produits | https://github.com/Ecolibre/ecolibre-sgdt/blob/ed14a89f7e003b126614f9b955eb6c03b69e2b27/miroir/Dockerfile | https://github.com/Ecolibre/ecolibre-sgdt/blob/20ea2a2cc9d5084d0b7f4fcfb78bc3d0665274c6/miroir/Dockerfile |
| 5 | Fichiers produits | https://github.com/Ecolibre/ecolibre-sgdt/blob/ed14a89f7e003b126614f9b955eb6c03b69e2b27/miroir/LocalSettings_miroir.php | https://github.com/Ecolibre/ecolibre-sgdt/blob/20ea2a2cc9d5084d0b7f4fcfb78bc3d0665274c6/miroir/LocalSettings_miroir.php |
| 6 | Fichiers produits | https://github.com/Ecolibre/ecolibre-sgdt/blob/ed14a89f7e003b126614f9b955eb6c03b69e2b27/miroir/ecarts-avec-la-production.md | https://github.com/Ecolibre/ecolibre-sgdt/blob/20ea2a2cc9d5084d0b7f4fcfb78bc3d0665274c6/miroir/ecarts-avec-la-production.md |

**Avant écriture**, les six nouvelles URL rendent **200** chacune.

**Lecture du fichier des écarts à ce SHA** (`raw.githubusercontent.com`,
`20ea2a2`) : « peut-être de l'un de ces **douze** écarts », et douze
sections, de « ## 1. `$wgServer` » à « ## 12. PHP sous FPM en production,
en module Apache sur le miroir ». Aucune occurrence de « onze ».

## Étape 3 — L'écriture

Texte produit par deux substitutions `sed` sur le wikitexte de la 1489,
limitées au segment `blob/<SHA>/` des deux SHA périmés, et une troisième
sur la phrase « Ils sont douze au 9 octobre 2026. ». Différence mot à mot
avec la 1489 (`git diff --no-index --word-diff`), sept changements et
aucun autre :

- `9` → `10` dans « Ils sont douze au 10 octobre 2026. » ;
- les six URL ci-dessus, libellés inchangés.

Copie locale : `pages/Lot_22_correctif_permaliens.txt`.

## Étape 4 — Vérifications

1. **QUI TRANCHE — passe.** Les six permaliens relus dans la 1490 :

   | Code | URL |
   |---|---|
   | 200 | https://github.com/Ecolibre/ecolibre-sgdt/blob/20ea2a2cc9d5084d0b7f4fcfb78bc3d0665274c6/miroir/ecarts-avec-la-production.md |
   | 200 | https://github.com/Ecolibre/ecolibre-sgdt/blob/20ea2a2cc9d5084d0b7f4fcfb78bc3d0665274c6/miroir/README.md |
   | 200 | https://github.com/Ecolibre/ecolibre-sgdt/blob/20ea2a2cc9d5084d0b7f4fcfb78bc3d0665274c6/miroir/compose.yml |
   | 200 | https://github.com/Ecolibre/ecolibre-sgdt/blob/20ea2a2cc9d5084d0b7f4fcfb78bc3d0665274c6/miroir/Dockerfile |
   | 200 | https://github.com/Ecolibre/ecolibre-sgdt/blob/20ea2a2cc9d5084d0b7f4fcfb78bc3d0665274c6/miroir/LocalSettings_miroir.php |
   | 200 | https://github.com/Ecolibre/ecolibre-sgdt/blob/20ea2a2cc9d5084d0b7f4fcfb78bc3d0665274c6/miroir/ecarts-avec-la-production.md |

   La page GitHub du fichier des écarts, lue par `curl`, contient « ces
   douze écarts » et « 12. PHP sous FPM », et pas « ces onze écarts ».
2. **Faits — passe.** `bin/wiki-api.sh --facts` avant et après : seule
   `_MDAT` change (`1/2026/10/10/11/23/25/0` → `1/2026/10/10/11/28/52/0`).
   Après : `Work_package_status` `clos`, `opening_date` `1/2026/10/9`,
   `delivery_date` `1/2026/10/9`, `closure_date` `1/2026/10/10`,
   `closure_report` le permalien sur `302e513`, `produces`
   `Miroir_local_du_wiki`.
3. **Wikitexte relu — passe.** La 1490 relue par `bin/wiki-get.sh` est
   identique au fichier envoyé (`diff` vide). Le fichier envoyé ne diffère
   de la 1489 que par les sept changements de l'étape 3, mesurés mot à mot
   sur la page entière.
4. **Catégories et liens — passe.** `prop=categories` : `Catégorie:Lot`
   seule. `generator=links` : `Gestion des lots`, `Lot 20 — External
   Data`, `Attribut:Work package status`, `Miroir local du wiki`, aucun
   `missing`.
5. **Plus aucun SHA périmé — passe.** `grep -c -E "ed14a89|123d68c"` sur la
   1490 : 0. « douze au 10 octobre 2026 » : 1 occurrence.
6. **`.claude/settings.local.json`** : `allow` et `deny` vides, au début et
   à la fin.

## Questions posées ou réponses rendues hors consigne

Aucune.

## Écarts et surprises

- **Mon point H comptait cinq permaliens, il y en avait six.** Je n'avais
  regardé que « Fichiers produits » ; celui de « Points ouverts », ajouté
  en tâche 12, m'avait échappé. C'est l'architecte qui l'a relevé, par une
  mesure.
- **Le permalien du rapport de clôture reste sur `302e513`.** C'est voulu :
  il fige le rapport tel que validé. `20ea2a2` porte le même contenu pour
  ce fichier, mais la consigne interdisait d'y toucher.
- **Les nouveaux permaliens figent un état, ils ne le suivent pas.** Si un
  fichier de `miroir/` change encore, ils redeviendront périmés comme les
  anciens.
