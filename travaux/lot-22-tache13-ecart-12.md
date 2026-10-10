# Lot 22 — Tâche 13 — Écart 12 et rapport de clôture

Exécuteur : Claude Code, 10 octobre 2026 (date relevée par `date` : sam.
10 oct. 2026 13:06:05 CEST). Écritures dans le dépôt seulement, aucune
écriture sur le wiki. Le lot reste « ouvert ».

**Résultat : l'écart 12 est écrit, le compte passe de onze à douze dans les
trois fichiers où il figure, le rapport de clôture est écrit
(`travaux/lot-22-cloture.md`). Les six contrôles passent.**

## Étape 1 — État du dépôt

`git status --porcelain` : vide. `.claude/settings.local.json` : `allow` et
`deny` vides.

## Étape 2 — L'écart 12

**Mesure faite dans cette tâche**, clé `phpsapi` de
`action=query&meta=siteinfo&siprop=general` :

| Wiki | `phpsapi` | `phpversion` | `generator` |
|---|---|---|---|
| production (`bin/wiki-api.sh`) | `fpm-fcgi` | 7.4.33 | MediaWiki 1.39.11 |
| miroir (`curl` sur `localhost:8080`) | `apache2handler` | 7.4.33 | MediaWiki 1.39.11 |

**Texte ajouté** en fin de `miroir/ecarts-avec-la-production.md` :

> ## 12. PHP sous FPM en production, en module Apache sur le miroir
>
> La production fait tourner PHP en `fpm-fcgi` ; le miroir en
> `apache2handler`, le module PHP chargé dans Apache par l'image
> `php:7.4-apache`. Mesuré par la clé `phpsapi` de
> `action=query&meta=siteinfo` : `fpm-fcgi` sur `wiki.ecolibre.org`,
> `apache2handler` sur `localhost:8080`, le 10 octobre 2026 ; la sonde de la
> tâche 6 du lot 22 avait déjà relevé `apache2handler` sur le miroir le
> 9 octobre 2026.
>
> Motif : aucun choix. L'image officielle du miroir est construite autour du
> module Apache ; personne n'avait relevé le mode de la production avant la
> tâche 13 du lot 22. Passer le miroir en FPM serait un chantier que personne
> n'a demandé : l'écart documenté vaut mieux.
>
> Ce que l'écart emporte : FPM a ses propres limites de durée de requête et
> son propre gestionnaire de processus (nombre de processus, recyclage), que
> le module Apache n'a pas. Un essai qui porte sur un délai d'exécution, une
> requête longue ou le nombre de requêtes servies en parallèle ne se
> transpose donc pas du miroir à la production.
>
> Ce que l'écart n'emporte pas : les dix limites PHP vérifiées en tâche 6
> (`miroir/php-miroir.ini`) restent justes. Elles avaient été comparées aux
> valeurs vues par Apache ; les fichiers `apache2/php.ini` et `fpm/php.ini`
> de la production portent les mêmes valeurs, mesuré le 9 octobre 2026. Le
> résultat de la tâche 6 était juste, mais il l'était par chance : elle
> comparait le miroir au fichier que la production ne lit pas.

Dans l'en-tête du même fichier, « L'écart 10 porte sur l'image PHP »
devient « Les écarts 10 et 12 portent sur l'image PHP » : le SAPI vient de
l'image `php:7.4-apache` choisie dans `miroir/Dockerfile`, et non de
`LocalSettings_miroir.php`.

**Fichiers où le compte a changé, de onze à douze :**

| Fichier | Ligne | Après |
|---|---|---|
| `miroir/ecarts-avec-la-production.md` | 5 | « l'un de ces douze écarts » |
| `miroir/README.md` | 46 | « les douze écarts et leur motif » |
| `miroir/LocalSettings_miroir.php` | 5 | « compte exactement douze écarts » |

La page « Miroir local du wiki » n'a pas été touchée.

## Étape 3 — Le rapport de clôture

**Lot servi de modèle : le lot 34.** Requête `action=ask` sur
`[[Work_package_closure_report::+]]` : dix-sept lots renseignés. Parmi eux,
un seul rapport de clôture d'un seul fichier nommé comme celui demandé, et
le plus récent : `travaux/lot-34-cloture.md`. Page *Lot 34 — Consignes
permanentes et aiguillage des messages* lue par l'API, lien suivi jusqu'au
fichier au commit qu'il cite (`03e07e9`, lu par `git show`). Forme reprise :
titre « Lot N — Clôture : … », paragraphe d'en-tête (date, exécuteur,
consigne), sections par sujet, tableaux pour les relevés, « Écarts et
surprises » en fin.

Les rapports de clôture des lots 9 et 11 ont aussi été lus. Ni eux ni celui
du lot 34 ne sont un bilan de lot : ce sont les rapports de la tâche qui
écrivait la clôture. La forme est donc reprise du lot 34, le contenu est
celui demandé par la consigne.

Écrit : `travaux/lot-22-cloture.md`, sept sections : livré, coût, mesures et
rangement, routes écartées, ce qui reste ouvert, erreurs de l'architecte, ce
que les refus de Cyril ont changé, plus « Écarts et surprises ». Aucun
chemin local du poste, aucun mot de passe, aucune valeur secrète. Les
permaliens ne peuvent pas citer le commit qui contient le fichier : il donne
les chemins dans le dépôt et renvoie au SHA donné en fin de session.

## Étape 4 — Vérifications

1. **QUI TRANCHE — passe.** `git grep -n -i "onze\|11 écart" -- miroir/` :
   aucune occurrence (code de sortie 1). `git grep -n -i "douze" --
   miroir/` :
   - `miroir/LocalSettings_miroir.php:5` : « # miroir compte exactement
     douze écarts, décrits dans » ;
   - `miroir/README.md:46` : « | `ecarts-avec-la-production.md` | les
     douze écarts et leur motif | » ;
   - `miroir/ecarts-avec-la-production.md:5` : « peut-être de l'un de ces
     douze écarts, et d'eux seuls. »
2. **Le miroir n'a pas bougé — passe.** `git diff --stat` sur
   `miroir/Dockerfile`, `miroir/compose.yml` et
   `miroir/LocalSettings_miroir.php` : un seul fichier, une insertion, une
   suppression, la ligne 5 de `LocalSettings_miroir.php` (« onze » →
   « douze »). Dockerfile et compose.yml inchangés.
3. **Le miroir tourne — passe.** `curl` sur
   `http://localhost:8080/wiki/Accueil` : **200**.
4. **Aucune écriture sur le wiki — passe.** `list=recentchanges` du
   9 octobre 23:00 UTC à maintenant : six modifications, la dernière étant
   la révision **1488** (*Lot 24 — Adminsys autonome*, 2026-10-09
   23:24:51 UTC). Aucune révision au-delà.
5. **Aucun secret dans le dépôt — passe.** Les quatre valeurs de
   `miroir.env` (mot de passe de la base, mot de passe root, clé secrète,
   clé de mise à jour) cherchées par `git grep -c -F` dans tout ce que git
   suit, après indexation des deux rapports : 0 occurrence pour chacune.
   Les valeurs n'ont pas été affichées : seuls leur nom, leur longueur et
   le compte sont sortis.
6. **`.claude/settings.local.json`** : `allow` et `deny` vides, au début et
   à la fin.

## Questions posées ou réponses rendues hors consigne

Aucune question posée en cours de tâche. Questions laissées pour la
consigne de clôture :

- **A.** Le rapport de clôture doit dire, pour chaque erreur de
  l'architecte, ce qui l'a attrapée. Pour le masquage qui a affiché le mot
  de passe et pour le motif d'exclusion de l'archive, aucun rapport du
  dépôt ne le dit : `CLAUDE.md` (règle 8) et `demandes-adminsys.md`
  constatent l'erreur sans dire qui l'a vue. Je l'ai écrit tel quel plutôt
  que de le supposer. Qui ou quoi les a attrapées ? Suggestion : que la
  consigne de clôture fournisse la réponse, et me fasse compléter la
  section 6 du rapport de clôture avant d'en construire le permalien.
- **B.** L'en-tête de `miroir/LocalSettings_miroir.php` dit maintenant
  « douze écarts », mais la suite décrit toujours « les dix qui relèvent
  de ce fichier » et « le dixième » qui porte sur l'image : il ne dit pas
  où est le douzième. La consigne limitait la modification de ce fichier à
  la seule ligne de compte. Faut-il compléter la phrase suivante ?
  Suggestion : oui, dans une tâche ultérieure, « les dixième et douzième
  portent sur l'image PHP (miroir/Dockerfile) ». C'est un commentaire,
  sans effet sur le miroir qui tourne.
- **C.** La page du lot 22 sur le wiki porte encore « onze » deux fois :
  « Ils sont onze au 9 octobre 2026 » dans « Ce qui est déjà tranché », et
  « les onze écarts » dans « Fichiers produits ». La consigne n'excluait que
  la page *Miroir local du wiki*. Faut-il les porter à douze dans la
  consigne de clôture ? Suggestion : oui, dans la même écriture que l'état
  clos et le permalien du rapport.

## Écarts et surprises

- **Les fichiers `php.ini` de la production n'ont pas pu être vérifiés.**
  L'égalité des valeurs entre `apache2/php.ini` et `fpm/php.ini`, « mesuré
  le 9 octobre 2026 », est citée de la consigne : aucun rapport du dépôt ne
  la porte, et `Serveur3/`, `ssh` et `sudo` m'étaient interdits. Seul le
  SAPI a été mesuré dans cette tâche.
- **Dates du lot.** La consigne donnait treize tâches « le 9 et le 10
  octobre » ; `git log` place les tâches 1 et 2 le 8 octobre, avant
  l'ouverture. Écrit tel que mesuré dans le rapport de clôture.
- **Pas de date de livraison sur le wiki.** La page du lot ne porte pas de
  `Work_package_delivery_date` (requête `action=ask`), alors que la
  consigne dit le lot « livré » le 9 octobre. À écrire par la consigne de
  clôture.
- **Origine des règles.** La consigne attribuait les règles 8 et 9 aux deux
  refus de Cyril. D'après les rapports des tâches 6, 9 et 11 : la règle 9
  vient des refus des tâches 6 et 9 ; la règle 8 vient des deux filtres de
  l'architecte ; le refus de la tâche 6 a produit la règle 7 et l'écart 11,
  d'où la vérification de la tâche 7. Les rapports consignent aussi un
  troisième refus, en tâche 5 (lecture de l'archive du cœur par `tar
  -tzf`), sans règle qui en découle. Le rapport de clôture suit les
  rapports.
- **`LocalSettings_miroir.php` est monté dans le conteneur en marche.** La
  ligne modifiée est un commentaire : le miroir en marche lit le fichier
  modifié, sans effet de comportement (contrôle 3 : 200).
