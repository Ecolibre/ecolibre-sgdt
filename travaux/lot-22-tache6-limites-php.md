# Lot 22 — Tâche 6 — Limites PHP, modules, file de travaux

Exécuteur : Claude Code, 9 octobre 2026. Deux consignes, interrompues par un
refus de Cyril puis reprises sous le même numéro. Aucune écriture sur le wiki
de production.

**Résultat : la vérification qui tranche passe toujours (MediaWiki 1.39.11,
PHP 7.4.33, 26 extensions et habillages sur 26, 0 échec). Les dix limites PHP
vues par Apache sont celles de la production. Le miroir compte désormais onze
écarts.**

## Étape 1 — État du dépôt

`git status --porcelain` : vide. `.claude/settings.local.json` : `allow` et
`deny` vides.

## Étape 2 — Les limites PHP

`miroir/php-miroir.ini` porte les dix valeurs relevées par Cyril, avec en
tête leur provenance (valeurs vues par Apache en production, 9 octobre 2026).
`date.timezone` n'y est pas déclaré, comme pour l'Apache de production.
`max_input_vars = 1000` y est écrit pour mémoire : c'est le défaut de PHP,
non déclaré en production. Le Dockerfile le copie dans
`/usr/local/etc/php/conf.d/miroir.ini`.

| Réglage | Attendu (production) | Mesuré sur le miroir, sous Apache |
|---|---|---|
| `memory_limit` | 128M | 128M |
| `upload_max_filesize` | 2M | 2M |
| `post_max_size` | 8M | 8M |
| `max_execution_time` | 30 | 30 |
| `max_input_time` | 60 | 60 |
| `max_file_uploads` | 20 | 20 |
| `max_input_vars` | 1000 | 1000 |
| `opcache.enable` | 1 | 1 |
| `opcache.memory_consumption` | 512 | 512 |
| `opcache.max_accelerated_files` | 32000 | 32000 |

Dix sur dix. Mesuré par la sonde décrite plus bas (SAPI `apache2handler`).
Même mesure : `date.timezone` vide, comme en production pour Apache ; apcu en
5.1.28, comme en production.

## Étape 3 — Les modules

Production : 64 modules. Miroir avant la tâche : 40. Miroir après : 43.

**Présents des deux côtés (43, après ajout) :** apcu, bcmath, calendar, Core,
ctype, curl, date, dom, exif, fileinfo, filter, ftp, gd, hash, iconv, intl,
json, libxml, mbstring, mysqli, mysqlnd, openssl, pcntl, pcre, PDO,
pdo_sqlite, Phar, posix, readline, Reflection, session, SimpleXML, sodium,
SPL, sqlite3, standard, tokenizer, xml, xmlreader, xmlwriter, Zend OPcache,
zip, zlib.

**Absents du miroir (24 avant, 21 après) :** FFI, geoip, gettext, igbinary,
imagick, imap, memcache, pdo_mysql, pdo_pgsql, pgsql, pspell, redis, shmop,
soap, sockets, sysvmsg, sysvsem, sysvshm, tidy, xmlrpc, xsl ; et, avant
ajout, bcmath, exif, pcntl.

**Présents seulement sur le miroir :** aucun.

Comparaison faite par script, sur la sortie de `php -m` dans l'image. Le
nombre de modules vu par Apache (43, par `get_loaded_extensions()` dans la
sonde) est le même.

### Méthode de recherche de l'emploi

Un script a cherché, ligne par ligne, les appels caractéristiques de chacun
des 24 modules (par exemple `bcadd(`, `exif_read_data(`, `pcntl_fork(`,
`new Redis(`, `pg_connect(`, `XSLTProcessor`) dans les fichiers `.php` de
`includes/`, `maintenance/`, `languages/`, `vendor/`, `skins/`, `mw-config/`
et des 21 dossiers d'extensions chargées (qui portent les 26 noms), sous
`/home/spheres/miroir-wiki/coeur/mediawiki-1.39`. Dossiers de tests exclus,
lignes de commentaire écartées. Puis lecture du code autour de chaque
résultat pour savoir s'il est atteint dans la configuration d'Ecolibre.
Limite de la méthode : une recherche par motif trouve les appels directs, pas
un appel construit dynamiquement.

### Modules ajoutés

- **bcmath** — `vendor/wikimedia/base-convert/src/Functions.php`, fonction
  `Wikimedia\base_convert()`, lignes 77 à 86 : avec `bcmath` chargé et sans
  `gmp` (cas de la production), la conversion passe par `bcmul`, `bcadd`,
  `bccomp`, `bcdiv`, `bcmod` ; sans `bcmath`, par une autre branche en PHP
  pur. Elle est appelée à chaque enregistrement de révision par
  `includes/Revision/SlotRecord.php`, `SlotRecord::base36Sha1()`, ligne 631
  (`\Wikimedia\base_convert( sha1( $blob ), 16, 36, 31 )`). Le résultat
  attendu est le même, mais le miroir doit passer par le même chemin de code
  que la production.
- **exif** — `includes/media/Exif.php`, `Exif::__construct()`, ligne 416 :
  `exif_read_data()`. Garde : `$wgShowEXIF` vaut par défaut
  `function_exists( 'exif_read_data' )` (`includes/MainConfigSchema.php`,
  ligne 1410). Vrai en production, faux sur le miroir sans le module : sans
  lui, un téléversement JPEG ne produirait pas les mêmes métadonnées.
- **pcntl** — `includes/libs/filebackend/FSFileBackend.php`,
  `FSFileBackend::getFileNotFoundRegex()`, ligne 1032 : `pcntl_strerror()`,
  sous garde `function_exists`, sur le chemin des opérations de fichiers. Et
  `includes/ForkController.php` (`pcntl_fork`, `pcntl_wait`…) pour les
  scripts de maintenance lancés en parallèle.

### Modules laissés de côté — écart 10

- **FFI, geoip, gettext, memcache, pdo_mysql, pdo_pgsql, pspell, shmop,
  soap, sysvmsg, sysvsem, sysvshm, tidy, xmlrpc, xsl** : aucun appel trouvé.
  Pour `memcache` : MediaWiki ne parle qu'à l'extension `memcached` ou à son
  client PHP pur, jamais à `memcache`.
- **imap** : un seul appel, `imap_8bit()`, dans
  `vendor/pear/mail_mime/Mail/mimePart.php`, ligne 613, à l'intérieur d'un
  bloc mis en commentaire `/* … */`. Code mort.
- **igbinary** : seulement dans
  `includes/libs/objectcache/MemcachedPeclBagOStuff.php`, lignes 463 et 478.
  Or `CACHE_MEMCACHED` vaut `'memcached-php'` (`includes/Defines.php`,
  ligne 88), c'est-à-dire `MemcachedPhpBagOStuff`. Non atteint.
- **imagick** : `includes/media/BitmapHandler.php`, lignes 300 et 623, et
  `includes/media/SvgHandler.php`, ligne 382. `BitmapHandler::getScalerType()`
  choisit `'im'`, la commande `convert`, dès que `$wgUseImageMagick` est vrai :
  c'est le cas. Le SVG n'est pas autorisé dans `$wgFileExtensions`. Non
  atteint.
- **pgsql** : `includes/libs/rdbms/database/DatabasePostgres.php` et trois
  appels `pg_escape_bytea` dans SMW, tous sur le chemin PostgreSQL. La base
  est MariaDB.
- **redis** : `includes/libs/redis/RedisConnectionPool.php`, ligne 249,
  seulement si un cache ou une file Redis est configuré. Aucun ne l'est.
- **sockets** : `includes/deferred/CdnCacheUpdate.php` (purges HTCP,
  `$wgHTCPRouting`), `includes/libs/UDPTransport.php` et
  `includes/debug/logger/monolog/LegacyHandler.php` (journaux UDP),
  `maintenance/rebuildLocalisationCache.php` (seulement avec `--threads`).
  Rien de cela n'est configuré.

L'écart 10 est décrit dans `miroir/ecarts-avec-la-production.md`, avec sa
liste, son motif et la conséquence : un essai qui ajouterait l'un de ces
usages ne s'éprouve pas sans y ajouter d'abord le module.

## Étape B de la reprise — Écart 11 : la file de travaux

`$wgJobRunRate = 0;` ajouté à `miroir/LocalSettings_miroir.php`, marqué
« ÉCART 11 », avec son motif. L'écart est décrit dans
`miroir/ecarts-avec-la-production.md`, avec les deux façons de le lever :
lancer `runJobs.php` délibérément, ou retirer la ligne et recréer le service.

Le service `wiki` a été recréé (`up -d --force-recreate`), sans
reconstruction d'image. Le fichier est monté seul : un conteneur ne voit pas
la nouvelle version d'un fichier monté seul que l'éditeur a remplacé. Valeur
effective lue dans le conteneur par `maintenance/getConfiguration.php` :
`{"wgJobRunRate":0}`.

File vidée par `runJobs.php` via `docker compose exec -u www-data` :
**1 travail exécuté**, un `htmlCacheUpdate` sur « Procédure de clôture d'un
lot », issu d'une édition de 11 h 15 présente dans le dump, terminé `good`.

### Compte des écarts porté à onze

- `miroir/ecarts-avec-la-production.md` : introduction (« onze écarts »,
  « 1 à 9 et 11 » dans `LocalSettings_miroir.php`, le 10 dans l'image), et
  sections 10 et 11 ajoutées.
- `miroir/LocalSettings_miroir.php` : en-tête (« onze écarts », dix dans ce
  fichier, le dixième dans l'image).
- `miroir/README.md` : tableau des fichiers (« écarts 1 à 9 et 11 », « les
  onze écarts »), et une ligne pour `php-miroir.ini`.

Le rapport de la tâche 5 (`travaux/lot-22-tache5-miroir.md`), qui dit
« neuf », n'a pas été retouché : c'est le récit daté de cette tâche.

## Étape C de la reprise — La règle d'annonce

Ajoutée à `CLAUDE.md`, section « Garde-fous d'exécution (toute édition sur
le wiki) », comme point 7, dans la forme des six points existants (liste
numérotée, intitulé en gras). Datée du 09/10/2026, avec son motif.

## La sonde `limites_tache6.php`

- **Ce qu'elle était :** un fichier PHP jetable de 13 lignes, écrit par
  Claude Code dans le scratchpad de la session, puis copié par `docker cp`
  dans le conteneur `ecolibre-miroir-wiki-1`, à
  `/var/www/html/limites_tache6.php`. Ce chemin est le montage de
  `/home/spheres/miroir-wiki/coeur/mediawiki-1.39/` : le fichier s'est donc
  trouvé à la racine du MediaWiki du miroir, côté hôte aussi.
- **Ce qu'elle faisait :** elle affichait en texte brut le SAPI, onze
  réglages lus par `ini_get` (les dix limites plus `date.timezone`), la
  version d'apcu et le nombre de modules chargés. Elle ne lisait ni fichier,
  ni variable d'environnement, ni base, et n'écrivait rien.
- **Pourquoi :** les valeurs demandées sont celles vues par Apache ; on ne
  les obtient qu'en exécutant du PHP sous Apache.
- **Servie une fois :** à la requête `curl` de Claude Code. Le journal du
  conteneur `wiki` compte 1 requête la visant. Ce journal couvre toute sa
  durée de vie : le conteneur avait été recréé avant le dépôt. Le port n'est
  lié qu'à 127.0.0.1.
- **Disparue :** absente côté hôte (`ls` : « Aucun fichier ou dossier de ce
  nom ») et côté conteneur (`ls` dans le conteneur : « No such file or
  directory »).
- **Son dépôt aurait dû être annoncé au préalable**, avec son contenu, son
  chemin et sa durée de vie. Il n'a été décrit qu'après coup. C'est l'objet
  de la règle ajoutée à `CLAUDE.md`.

## Étape D — Vérifications

### 1. QUI TRANCHE — passe

Sortie complète de `verif1.py`, lancé une seule fois avant l'étape B :

```
generator: MediaWiki 1.39.11 | phpversion: 7.4.33 | wikiid: mediawiki_ecolibre_prod | server: http://localhost:8080
| MinervaNeue | — | — | ok |
| MonoBook | — | — | ok |
| Timeless | 0.9.1 | 0.9.1 | ok |
| Vector | 1.0.0 | 1.0.0 | ok |
| CategoryTree | — | — | ok |
| Cite | — | — | ok |
| MyVariables | 4.5 | 4.5 | ok |
| ParserFunctions | 1.6.1 | 1.6.1 | ok |
| TemplateData | 0.1.2 | 0.1.2 | ok |
| Scribunto | — | — | ok |
| Mermaid | 6.0.2 | 6.0.2 | ok |
| Clean Changes | 2022-07-28 | 2022-07-28 | ok |
| VEForAll | 0.5.2 | 0.5.2 | ok |
| Lockdown | — | — | ok |
| CodeEditor | — | — | ok |
| VisualEditor | 0.1.2 | 0.1.2 | ok |
| WikiEditor | 0.5.3 | 0.5.3 | ok |
| Nuke | — | — | ok |
| PageForms | 5.8.1 | 5.8.1 | ok |
| Renameuser | — | — | ok |
| Replace Text | 1.7 | 1.7 | ok |
| UserMerge | 1.10.1 | 1.10.1 | ok |
| SemanticMediaWiki | 4.2.0 | 4.2.0 | ok |
| SemanticResultFormats | 4.2.1 | 4.2.1 | ok |
| ConfirmEdit | 1.6.0 | 1.6.0 | ok |
| QuestyCaptcha | — | — | ok |
miroir: 26 attendu: 26 échecs: 0
```

**Le compte d'échecs vaut zéro.** Réserve : ce passage a eu lieu avant
l'ajout de `$wgJobRunRate` et la recréation du conteneur. Le changement ne
touche aucune extension, mais `verif1.py` n'a pas été relancé après.

### 2. Les dix limites vues par Apache

Voir le tableau de l'étape 2 : dix sur dix, valeurs reprises de la mesure
déjà faite, sans nouvelle sonde.

### 3. SMW et l'URL courte — passe

Sortie complète de `verif3.py`, lancé une seule fois :

```
Item_ref -> ['000P']
Part_of -> ["S'hydrater#0##", 'Irriguer#0##']
_ASK -> ["Acheminer_l'eau_au_point_d'usage#0##_QUERY016a8554cf4f56e9d1f3e24be62556f6", "Acheminer_l'eau_au_point_d'usage#0##_QUERYc99c22e093de19f10fed70df48ea6bc7"]
_INST -> ['Functional_item#14##']
_MDAT -> ['1/2026/8/9/21/28/6/0']
_SKEY -> ["Acheminer l'eau au point d'usage"]
HTTP 200 http://localhost:8080/wiki/Acheminer_l%27eau_au_point_d%27usage
```

`Item_ref` 000P, `Part_of` à deux valeurs, `_INST` Functional_item, `_MDAT`
au 1/2026/8/9/21/28/6/0, HTTP 200.

### 4. File à zéro, et une lecture ne la fait plus bouger

Mesure qui tranche : la table `job` de la base du miroir, lue par le client
`mariadb` du conteneur `db`.

- Après `runJobs.php` : 0 ligne.
- Avant un appel à `api.php` (`siteinfo&siprop=statistics`) : 0. L'appel
  rend `"jobs":0`. Après l'appel : 0.

Avec une file vide, ce test montre qu'une lecture n'ajoute pas de travail.
Il ne peut pas montrer qu'elle n'en aurait pas exécuté : il n'y en avait
aucun à exécuter. Ce point-là est établi par la valeur effective
`wgJobRunRate = 0`. Voir aussi « Écarts et surprises » sur `showJobs.php`.

### 5. Mode sans privilèges intact

- `docker info` : `[name=seccomp,profile=builtin name=rootless name=cgroupns]`.
- `id -nG` : `spheres adm cdrom sudo dip plugdev kvm lpadmin lxd sambashare`
  — pas de groupe `docker`.
- `systemctl is-active docker.service` : `inactive`.

### 6. Aucun secret dans le dépôt

Les quatre valeurs de `miroir.env` ont été cherchées dans les 8 fichiers
suivis sous `miroir/` (`Dockerfile`, `LocalSettings_miroir.php`, `README.md`,
`apache-miroir.conf`, `compose.yml`, `ecarts-avec-la-production.md`,
`miroir.env.exemple`, `php-miroir.ini`) : 0 occurrence pour chacune.

### 7. `.claude/settings.local.json`

Vide (`allow: []`, `deny: []`) au début de la tâche, à la reprise, et à la
fin.

### 8. La sonde

Absente côté hôte et côté conteneur. **1 requête** la visait dans le journal
du conteneur `wiki` : celle de Claude Code. Détail dans la section consacrée
à la sonde.

## Questions posées ou réponses rendues hors consigne

- **Refus de Cyril.** Une commande devait lancer trois contrôles d'un coup :
  vérifier l'absence de la sonde, lancer deux fois `verif1.py` (une fois pour
  ses deux dernières lignes, une fois pour la première) et lancer
  `verif3.py`. Cyril l'a refusée pour trois raisons :
  1. le contenu des deux scripts n'était pas montré dans le message de
     lancement, contrairement à la règle de `CLAUDE.md` ;
  2. la sonde déposée dans une installation web méritait d'être nommée,
     pas vérifiée en passant ;
  3. lancer deux fois `verif1.py`, c'était doubler le travail, sans garantie
     que les deux exécutions voient le même état.

  Réponse rendue, sans rien lancer : le contenu complet des deux scripts, ce
  qu'ils lisent et écrivent, une description de la sonde, et quatre
  commandes séparées, chacune lancée une fois. Parmi elles, le comptage des
  requêtes visant la sonde dans le journal a été ajouté de moi-même. Dans
  cette réponse, j'ai signalé qu'une requête de lecture peut exécuter un
  travail de la file (`$wgJobRunRate` par défaut).

  **Ce que ce refus a changé :**
  - la reprise de la tâche avec l'écart 11 ;
  - la règle d'annonce, point 7 des garde-fous du wiki dans `CLAUDE.md` ;
  - l'interdiction, pour la suite de la tâche, de déposer un fichier dans
    un arbre servi sans l'annoncer ;
  - chaque script lancé une seule fois, sa sortie complète gardée.

## Écarts et surprises

- **La file annoncée par le relevé de la tâche 5 ne contenait plus que 1
  travail, et non 3.** Au relevé de la tâche 5, `$wgJobRunRate` valait
  encore 1 : les requêtes de vérification de la tâche 5 et de la première
  partie de cette tâche ont probablement exécuté les deux autres. C'est le
  phénomène que l'écart 11 supprime. La base du miroir a donc déjà été
  modifiée par des lectures avant l'écart 11, faiblement : deux travaux au
  plus, de nature inconnue.
- **`showJobs.php` a annoncé 1 travail alors que la table `job` était vide.**
  Juste après `runJobs.php`, `showJobs.php` rendait 1 et `showJobs.php --list`
  ne listait rien. La table `job`, lue en base, contenait 0 ligne. Quelques
  minutes plus tard, `showJobs.php` rendait 0. Le compte de `showJobs.php`
  est une taille de file gardée en cache, pas un décompte. C'est le même
  piège que celui déjà noté dans `CLAUDE.md` pour
  `siteinfo&siprop=statistics` et `bin/wiki-wait-jobs.sh`, mais côté
  serveur cette fois. Sur le miroir, la mesure qui tranche est la table
  `job`.
- **Recréer le conteneur est nécessaire pour qu'un changement de
  `LocalSettings_miroir.php` prenne.** Un simple redémarrage peut ne pas
  suffire : le fichier est monté seul, et l'outil d'édition le remplace au
  lieu de le réécrire sur place. `ecarts-avec-la-production.md` dit
  `--force-recreate` pour la levée de l'écart 11 ; le README ne le dit pas
  encore pour un changement de configuration en général.
- **La règle d'annonce a été rangée dans « toute édition sur le wiki ».** Le
  miroir est un wiki, et la section « dépôt git » convenait moins. Si Cyril
  la préfère ailleurs, c'est un déplacement sans changement de texte.
- `verif1.py` n'a pas été relancé après l'écart 11 (voir la réserve de la
  vérification 1).
