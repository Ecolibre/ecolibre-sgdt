# Lot 22 — Tâche 5 — Montage du miroir local du wiki

Exécuteur : Claude Code, 9 octobre 2026. Aucune écriture sur le wiki de
production : seules des lectures d'API (`siteinfo`) y ont été faites.

**Résultat : le miroir tourne sur http://localhost:8080/wiki/. La
vérification qui tranche passe : MediaWiki 1.39.11, PHP 7.4.33, et les 26
extensions et habillages de la production aux mêmes versions, sans aucun
écart.**

## Étape 1 — État du dépôt

`git status --porcelain` : vide. `.claude/settings.local.json` : `allow` et
`deny` vides. Aucun arrêt.

## Étape 2 — Permission

- `"Bash(docker:*)"` ajoutée à la fin de `allow` dans `.claude/settings.json`.
  Comptes avant : `deny 17 ask 4 allow 42` ; après : `deny 17 ask 4 allow 43`.
- Ligne ajoutée en fin du tableau des permissions de
  `installation-nouveau-poste.md`, avec le motif et la date de la consigne.

## Étape 3 — Fichiers du miroir

Créés sous `miroir/` : `Dockerfile`, `apache-miroir.conf`, `compose.yml`,
`LocalSettings_miroir.php`, `miroir.env.exemple`,
`ecarts-avec-la-production.md`, `README.md`.

### Écarts entre le Dockerfile de la consigne et celui retenu

1. **Sources apt basculées vers `archive.debian.org`** (une ligne `sed` avant
   `apt-get update`). Motif : la première construction a échoué sur des 404
   (`libmagickwand`, `libicu-dev`, `libpng-dev`…) : `php:7.4-apache` repose
   sur Debian 11 (bullseye), dont les paquets ne sont plus sur
   `deb.debian.org`. Basculement essayé d'abord dans un conteneur jetable,
   où `apt-get update` a réussi.
2. **Configuration Apache ajoutée** (`apache-miroir.conf`, copiée dans
   `conf-available` et activée par `a2enconf`), comme la consigne le
   demandait. Les règles de réécriture sont dans le bloc
   `<Directory /var/www/html>` : une première version les plaçait au niveau
   serveur, et `/wiki/Titre` rendait 404 alors que `/index.php?title=Titre`
   rendait 200. L'hôte virtuel par défaut de l'image n'hérite pas des règles
   de réécriture du niveau serveur. Ajouts du même fichier : aucun PHP
   exécuté dans `images/`, accès web refusé à `cache/`.
3. Un fichier `php-miroir.ini` (limites de téléversement à 100 Mo, mémoire à
   256 Mo) a été écrit puis **retiré avant toute construction** : les valeurs
   PHP de la production ne sont pas connues, et les inventer aurait été un
   écart non déclaré. Le miroir garde les valeurs PHP par défaut de l'image
   (`upload_max_filesize` à 2 Mo, `memory_limit` à 128 Mo). Les téléversements
   lourds ne s'éprouvent donc pas sur le miroir tel quel.

Critère d'acceptation, mesuré dans le conteneur : `php -m` liste `mbstring`,
`intl`, `calendar`, `mysqli`, `gd`, `zip`, `xml`, `dom`, `fileinfo`, `iconv`,
`ctype`, `json`, `apcu` et `Zend OPcache` ; `/usr/bin/convert` (lien vers
`/etc/alternatives/convert`) et `/usr/bin/diff3` existent ; `rewrite_module`
est chargé.

### compose.yml

Conforme à la consigne, à un point près : **deux réseaux au lieu d'un**.
`db` et `memcached` ne sont que sur le réseau `interne`, déclaré
`internal: true` : aucune route vers l'extérieur. `wiki` est sur `interne`
et sur un second réseau, `sortie`. Motif : Docker ne publie pas de port pour
un conteneur relié uniquement à un réseau interne ; sans le second réseau,
`127.0.0.1:8080` ne répondrait pas. Ajouts : un contrôle de santé sur `db`
(`healthcheck.sh` de l'image MariaDB), dont dépend `wiki`, et le nom du
projet `ecolibre-miroir`.

Les variables s'interpolent depuis `miroir.env`, passé par `--env-file`. Le
dump est monté en lecture seule sur `/dump/ecolibre.sql.gz` dans `db`.

### LocalSettings_miroir.php

Les réglages que la consigne ne détaillait pas (règles Lockdown de l'espace
CWL, WikiEditor, VisualEditor, VEForAll, logo, licence, ConfirmEdit,
courriel, CleanChanges) ont été demandés à Cyril (points A et B, voir plus
bas), qui a fourni les blocs de production. Ils sont repris tels quels :

- les accents des commentaires ont été rétablis à sa demande (« Privé »,
  « l'accès », « l'ÉDITER », « Intégration ») ; « LIRER » a été laissé tel
  quel, comme en production ;
- le bloc VisualEditor précède le bloc CWL, qui ajoute ensuite `NS_CWL` et
  `NS_CWL_TALK` à `$wgVisualEditorAvailableNamespaces` ;
- `$wgRightsPage` est déclaré à la chaîne vide, comme en production.

**Mise au net signalée, sans effet de comportement :** les extensions que la
production charge deux fois ne le sont qu'une fois. Lockdown est chargée à sa
place dans la liste ordonnée des extensions (entre Mermaid et ConfirmEdit) ;
le second `wfLoadExtension( 'Lockdown' )` du bloc CWL est laissé en
commentaire, avec une ligne qui dit pourquoi.

Les neuf écarts sont marqués « ÉCART n » dans le fichier et décrits dans
`miroir/ecarts-avec-la-production.md`. Question du captcha choisie :
« Combien de pattes a une araignée ? (en chiffres) », réponse `8`.

## Étape 4 — Montage

- `/home/spheres/miroir-wiki/miroir.env` créé en mode 600 par un script
  Python du scratchpad (`secrets.token_hex`) : deux mots de passe de 32
  caractères hexadécimaux, une clé secrète de 64, une clé de mise à jour de
  16. Hors du dépôt : `git ls-files --error-unmatch` répond « est hors du
  dépôt ». `openssl` n'a pas servi.
- Cœur décompressé dans `/home/spheres/miroir-wiki/coeur/mediawiki-1.39`.
  `extensions/SemanticMediaWiki/.smw.json` est présent et range l'état de SMW
  sous la clé `mediawiki_ecolibre_prod` : c'est pourquoi le nom de la base du
  miroir est resté celui de la production (voir « Écarts et surprises »).
- `images/ecolibre` et `cache/ecolibre` créés vides, puis attribués à
  `www-data` (uid 33) **depuis un conteneur** : en mode sans privilèges,
  l'uid 33 du conteneur n'est pas un utilisateur de l'hôte, et un `chmod` sur
  l'hôte aurait dû ouvrir les dossiers à tous. Aucun `chmod` n'a été lancé.
- Image construite, `db` et `memcached` lancés (`--wait`, base saine), dump
  restauré par `docker compose exec -T db` avec le client `mariadb` du
  conteneur. Contrôle préalable : le dump ne contient ni `CREATE DATABASE` ni
  `USE`. Résultat : **97 tables, dont 39 de SMW**, comme annoncé.
- `wiki` lancé. `maintenance/update.php` n'a jamais été lancé, et rien ne l'a
  réclamé.

## Étape 5 — Vérifications

### 1. Version, PHP et extensions — QUI TRANCHE : passe

`generator` : MediaWiki 1.39.11. `phpversion` : 7.4.33. `wikiid` :
`mediawiki_ecolibre_prod`.

| Extension | Production (consigne) | Miroir | État |
|---|---|---|---|
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

26 attendues, 26 sur le miroir, aucune absente, aucune en trop, aucune
version différente. Recoupement supplémentaire : la même requête sur
wiki.ecolibre.org, en direct, rend une liste nom-version strictement égale à
celle du miroir.

### 2. Comptes de pages

| | Production (en direct) | Miroir |
|---|---|---|
| pages | 564 | 564 |
| articles | 205 | 205 |
| éditions | 1516 | 1515 |
| images | 79 | 79 |
| utilisateurs | 2 | 2 |
| actifs | 1 | 1 |
| administrateurs | 2 | 2 |
| travaux en file | 0 | 3 |

Une édition d'écart, postérieure au dump de 13 h 15. Les trois travaux en
file du miroir n'ont pas été exécutés (estimation, non demandé).

### 3. SMW répond

Page choisie par une requête `ask` sur le miroir (`[[Item_ref::+]]`,
première réponse) : **« Acheminer l'eau au point d'usage »**.
`action=smwbrowse` sur le miroir :

```
Item_ref -> ['000P']
Part_of -> ["S'hydrater#0##", 'Irriguer#0##']
_ASK -> [deux requêtes enregistrées]
_INST -> ['Functional_item#14##']
_MDAT -> ['1/2026/8/9/21/28/6/0']
_SKEY -> ["Acheminer l'eau au point d'usage"]
```

### 4. Une page s'affiche

`http://localhost:8080/wiki/Acheminer_l%27eau_au_point_d%27usage` : HTTP 200.
`http://localhost:8080/wiki/Accueil` : HTTP 200. Le rendu ne contient aucune
erreur Scribunto ni alerte d'installation SMW ; `{{#invoke:Base36|next}}`
s'évalue par `expandtemplates` (le moteur Lua autonome fonctionne).

### 5. Mode sans privilèges

- `docker info` : contexte `rootless`, options de sécurité
  `name=seccomp,profile=builtin name=rootless name=cgroupns`.
- `id -nG` : `spheres adm cdrom sudo dip plugdev kvm lpadmin lxd
  sambashare` — pas de groupe `docker`.
- `systemctl is-active docker.service` : `inactive` ; `docker.socket` :
  `inactive` ; les deux `disabled`. Le démon utilisateur
  (`systemctl --user`) est `active`.

### 6. Aucun secret dans le dépôt

`git status --porcelain` avant indexation : `M .claude/settings.json`,
`M installation-nouveau-poste.md`, `?? miroir/`. Recherche, dans les 7
fichiers suivis sous `miroir/`, des quatre valeurs secrètes de `miroir.env`
(mot de passe de la base, mot de passe root, clé secrète, clé de mise à
jour) : 0 occurrence pour chacune. `miroir.env` est hors du dépôt.

### 7. `.claude/settings.local.json`

Toujours vide (`allow: []`, `deny: []`), au début et à la fin de la tâche.

### 8. Espace disque

`/` : 22 Go disponibles sur 92 Go (76 % utilisés), contre 24 Go au début de
la tâche. `/home/spheres/miroir-wiki` : 478 Mo.

## Confirmations demandées pendant la tâche

Une commande a été refusée par Cyril : une lecture de l'archive du cœur par
`tar -tzf … | grep` suivie de `tar -tzf … | wc -l`. Interruption, puis
« reprenons » : la tâche a repris par la décompression, sans relancer cette
commande.

## Questions posées ou réponses rendues hors consigne

- **A.** La consigne demandait l'espace CWL « avec Lockdown, à l'identique »
  sans en donner les règles ; l'API ne les expose pas et `Serveur3/` m'est
  interdit. Réponse de Cyril : le bloc de production, collé, repris tel quel
  avec les accents rétablis et un seul chargement de Lockdown.
- **B.** Même manque pour les réglages WikiEditor, VisualEditor, VEForAll, la
  troisième ligne de licence, le logo et ConfirmEdit. Réponse de Cyril : les
  blocs de production (logo, WikiEditor, VisualEditor, CleanChanges,
  ConfirmEdit, licence, courriel), repris tels quels ; ils ne comptent pas
  comme écarts.

## Écarts et surprises

- **Debian 11 a quitté les miroirs courants.** L'image `php:7.4-apache` ne se
  construit plus sans basculer apt vers `archive.debian.org`. Cela vaudra pour
  toute reconstruction future ; le README le dit.
- **Le nom de la base du miroir n'est pas libre.** SMW range son état dans
  `.smw.json` sous l'identifiant du wiki, qui vaut le nom de la base
  (`mediawiki_ecolibre_prod`). Sous un autre nom, SMW se serait déclaré non
  installé et aurait réclamé `update.php`. Le miroir garde donc le nom de
  production ; c'est dans l'écart 4, dont seuls le serveur, le compte et le
  mot de passe diffèrent.
- **Réécriture d'URL au niveau serveur inopérante** dans l'image
  `php:7.4-apache` (voir les écarts du Dockerfile). Corrigé, et noté dans le
  dépannage du README.
- **Le compte `spheres` est dans les groupes `sudo` et `lxd`.** Il n'est pas
  dans `docker`, comme exigé. Mais l'appartenance à `lxd` donne, comme
  `docker`, un accès équivalent à la racine de la machine. Hors du périmètre
  de cette tâche ; signalé.
- **`$wgSharedTables[] = "actor"`** est repris à l'identique ; sans
  `$wgSharedDB`, il n'a aucun effet, ni ici ni, semble-t-il, en production.
  Rien n'en dépend sur le miroir.
- **Le montage de `LocalSettings_miroir.php` a créé un fichier vide
  `LocalSettings.php`** dans le cœur, côté hôte : c'est le point de montage
  créé par Docker. Normal, noté dans le README.
- **Valeurs PHP par défaut** (téléversement limité à 2 Mo) : voir l'écart 3
  du Dockerfile.
- Le cœur porte 40 extensions sur disque, dont 19 non chargées (AbuseFilter,
  CiteThisPage, CookieConsent, Gadgets, ImageMap, InputBox, Interwiki, Math,
  Moderation, MultimediaViewer, OATHAuth, PageImages, PdfHandler, Poem,
  SecureLinkFixer, SpamBlacklist, SyntaxHighlight_GeSHi, TextExtracts,
  TitleBlacklist) — comptées par l'inventaire du dossier, pas par une
  requête ; sans effet, puisque non chargées, comme en production.
