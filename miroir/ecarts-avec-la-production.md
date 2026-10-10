# Écarts entre le miroir et la production

À relire le jour où un essai sur le miroir donne un résultat surprenant,
**avant** de chercher la cause dans le réglage éprouvé : la surprise vient
peut-être de l'un de ces douze écarts, et d'eux seuls.

`miroir/LocalSettings_miroir.php` reprend la configuration de production
(`LocalSettings_ecolibre.php`) ; les écarts 1 à 9 et 11 y sont marqués « ÉCART n ».
Les écarts 10 et 12 portent sur l'image PHP (`miroir/Dockerfile`). Les limites PHP
d'Apache (`miroir/php-miroir.ini`) sont celles de la production et ne sont
pas un écart. Toute autre différence de comportement est une erreur du
miroir, à corriger.

Une mise au net sans effet de comportement n'est pas comptée : les extensions
que la production charge deux fois, dont Lockdown, ne sont chargées qu'une
fois sur le miroir.

## 1. `$wgServer`

`http://localhost:8080` au lieu de `https://wiki.ecolibre.org`.

Motif : le miroir n'est joignable que sur l'interface locale de la machine.
Les liens absolus produits par MediaWiki (API, flux, `fullurl`) pointent donc
vers `localhost:8080`, en HTTP et non en HTTPS. Un comportement lié à HTTPS
(cookies `Secure`, contenus mixtes) ne s'éprouve pas sur le miroir.

## 2. `$wgMemCachedServers`

`[ 'memcached:11211' ]` au lieu de la prise unix de la production.

Motif : memcached tourne dans son propre conteneur et se joint par le réseau
interne de compose. Le type de cache (`CACHE_MEMCACHED`) est le même ; seul le
transport change. Le cache démarre vide à chaque création du conteneur.

## 3. `$wgPingback = false`

Motif : le miroir ne doit envoyer aucune statistique d'installation à
mediawiki.org, où elle se compterait comme un second wiki Ecolibre.

## 4. Base de données : `$wgDBserver`, `$wgDBname`, `$wgDBuser`, `$wgDBpassword`

Lus par `getenv()` (variables `MIROIR_DB_*`), au lieu des valeurs de
production en dur.

Motif : la base du miroir est un conteneur MariaDB 10.11 local, avec son
propre compte et son propre mot de passe, qui ne doivent pas vivre dans le
dépôt. Le **nom** de la base reste `mediawiki_ecolibre_prod` : c'est
l'identifiant du wiki sous lequel Semantic MediaWiki range son état dans
`extensions/SemanticMediaWiki/.smw.json`. Un autre nom ferait déclarer à SMW
une installation incomplète.

## 5. `$wgSecretKey`

Lue par `getenv()`, engendrée au hasard pour le miroir.

Motif : la clé de production ne quitte pas la production. Conséquence : les
sessions et jetons de la production ne valent rien sur le miroir, et
inversement.

## 6. `$wgUpgradeKey`

Lue par `getenv()`, engendrée au hasard pour le miroir.

Motif : même raison que l'écart 5. Elle ne sert qu'à l'installateur web, qui
ne doit pas servir sur le miroir.

## 7. `$wgEmergencyContact` et `$wgPasswordSender`

`miroir@localhost.invalide` au lieu des adresses de production.

Motif : aucun courriel ne doit partir du miroir au nom d'Ecolibre. Le
conteneur n'a d'ailleurs aucun serveur de courrier configuré : un envoi
échouera. Les réglages de courriel eux-mêmes (`$wgEnableEmail`,
`$wgEmailAuthentication`, notifications) sont ceux de la production.

## 8. Question et réponse du captcha

Un couple local (`$wgCaptchaQuestions`), sans rapport avec celui de la
production.

Motif : la réponse de production est un secret de fait. Les déclencheurs
(`$wgCaptchaTriggers`) et les exemptions (`skipcaptcha`) sont, eux, ceux de la
production.

## 9. `images/` et `cache/` vides

`images/ecolibre` et `cache/ecolibre` existent mais sont vides.

Motif : l'archive du cœur a été prise sans images ni cache. Les pages de
fichier existent, avec leurs métadonnées en base, mais sans leur fichier :
les liens d'image et les vignettes sont cassés. C'est attendu. Un essai qui
porte sur l'affichage d'images ne se fait pas sur le miroir sans y avoir
d'abord recopié les fichiers concernés.

## 10. Modules PHP absents du miroir

La production charge 64 modules PHP sous Apache (relevé du 9 octobre 2026) ;
le miroir en charge 43. Les 21 absents :
`FFI`, `geoip`, `gettext`, `igbinary`,
`imagick`, `imap`, `memcache`, `pdo_mysql`, `pdo_pgsql`, `pgsql`, `pspell`,
`redis`, `shmop`, `soap`, `sockets`, `sysvmsg`, `sysvsem`, `sysvshm`,
`tidy`, `xmlrpc`, `xsl`.

Motif : aucun n'est employé par MediaWiki 1.39 ni par les 26 extensions et
habillages chargés, **dans la configuration d'Ecolibre**. Mesuré par une
recherche des appels de chaque module dans le cœur, son `vendor/`, les
habillages et les extensions chargées (tests exclus), le 9 octobre 2026 :

- aucun appel du tout : `FFI`, `geoip`, `gettext`, `memcache`,
  `pdo_mysql`, `pdo_pgsql`, `pspell`, `shmop`, `soap`, `sysvmsg`,
  `sysvsem`, `sysvshm`, `tidy`, `xmlrpc`, `xsl` ;
- `imap` : un seul appel, dans du code mis en commentaire
  (`vendor/pear/mail_mime/Mail/mimePart.php`) ;
- `igbinary` : seulement dans `MemcachedPeclBagOStuff`, alors que
  `CACHE_MEMCACHED` désigne `MemcachedPhpBagOStuff` (client PHP pur) ;
- `imagick` : seulement pour les vignettes quand `$wgUseImageMagick` est
  faux, et pour le SVG ; Ecolibre réduit ses images par la commande
  `convert` et n'autorise pas le SVG ;
- `pgsql` : seulement pour une base PostgreSQL ; la base est MariaDB ;
- `redis` : seulement si un cache ou une file Redis est configuré ; aucun
  ne l'est ;
- `sockets` : seulement pour les purges HTCP (`$wgHTCPRouting`), les
  journaux UDP et `rebuildLocalisationCache.php --threads` ; aucun n'est
  configuré.

Conséquence : un essai qui ajouterait l'un de ces usages (Redis, purges
HTCP, `$wgUseImageMagick = false`, journaux UDP…) ne s'éprouve pas sur le
miroir sans y avoir d'abord ajouté le module correspondant.

## 11. `$wgJobRunRate = 0`

Aucun travail de la file n'est exécuté pendant une requête web. La
production laisse la valeur par défaut, 1 : chaque requête web y exécute en
moyenne un travail en attente.

Motif : sur le miroir, une requête de lecture ne doit pas modifier la base,
sinon une mesure ne se répète pas. Avec la valeur par défaut, un simple
appel à `api.php` peut exécuter un travail en attente (mise à jour de liens,
propagation SMW…) et changer ce que l'appel suivant lira.

Conséquence : les travaux s'accumulent dans la file tant qu'on ne les lance
pas. Les effets différés d'une écriture (tables de liens, faits SMW
propagés, catégories) n'apparaissent pas d'eux-mêmes.

Pour lever l'écart, quand on veut éprouver quelque chose qui dépend des
travaux :

- soit lancer la file délibérément, au moment choisi :

  ```
  docker compose --env-file /home/spheres/miroir-wiki/miroir.env -f miroir/compose.yml exec -u www-data wiki php maintenance/runJobs.php
  ```

- soit remettre la valeur par défaut, en retirant la ligne
  `$wgJobRunRate = 0;` de `LocalSettings_miroir.php`, puis relancer le
  service `wiki` (`up -d --force-recreate wiki`), et l'y remettre après
  l'essai.

## 12. PHP sous FPM en production, en module Apache sur le miroir

La production fait tourner PHP en `fpm-fcgi` ; le miroir en
`apache2handler`, le module PHP chargé dans Apache par l'image
`php:7.4-apache`. Mesuré par la clé `phpsapi` de
`action=query&meta=siteinfo` : `fpm-fcgi` sur `wiki.ecolibre.org`,
`apache2handler` sur `localhost:8080`, le 10 octobre 2026 ; la sonde de la
tâche 6 du lot 22 avait déjà relevé `apache2handler` sur le miroir le
9 octobre 2026.

Motif : aucun choix. L'image officielle du miroir est construite autour du
module Apache ; personne n'avait relevé le mode de la production avant la
tâche 13 du lot 22. Passer le miroir en FPM serait un chantier que personne
n'a demandé : l'écart documenté vaut mieux.

Ce que l'écart emporte : FPM a ses propres limites de durée de requête et
son propre gestionnaire de processus (nombre de processus, recyclage), que
le module Apache n'a pas. Un essai qui porte sur un délai d'exécution, une
requête longue ou le nombre de requêtes servies en parallèle ne se
transpose donc pas du miroir à la production.

Ce que l'écart n'emporte pas : les dix limites PHP vérifiées en tâche 6
(`miroir/php-miroir.ini`) restent justes. Elles avaient été comparées aux
valeurs vues par Apache ; les fichiers `apache2/php.ini` et `fpm/php.ini`
de la production portent les mêmes valeurs, mesuré le 9 octobre 2026. Le
résultat de la tâche 6 était juste, mais il l'était par chance : elle
comparait le miroir au fichier que la production ne lit pas.
