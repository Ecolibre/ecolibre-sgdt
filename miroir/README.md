# Miroir local du wiki Ecolibre

Une copie du wiki de production (https://wiki.ecolibre.org), qui tourne sur
une machine de travail, pour éprouver un changement de configuration avant de
le demander en production. Créé par le lot 22 du SGDT, le 9 octobre 2026.

Le miroir n'écrit jamais sur la production et n'en lit rien en marche : il
part d'un dump de la base et d'une archive du code, pris une fois.

Avant d'interpréter un résultat surprenant, relire
[`ecarts-avec-la-production.md`](ecarts-avec-la-production.md).

Le pourquoi du miroir — ce qu'il reproduit, ce qu'il ne reproduit pas, les
routes écartées — est sur le wiki, page
[Miroir local du wiki](https://wiki.ecolibre.org/wiki/Miroir_local_du_wiki).
Ce README porte les commandes, les chemins et le dépannage.

## Ce qui tourne

| Service | Image | Rôle | Port publié |
|---|---|---|---|
| `wiki` | construite depuis `Dockerfile` (PHP 7.4 + Apache) | MediaWiki 1.39.11 | `127.0.0.1:8080` |
| `db` | `mariadb:10.11` | base `mediawiki_ecolibre_prod` | aucun |
| `memcached` | `memcached:1.6-alpine` | cache principal | aucun |

Socle de production reproduit : MediaWiki 1.39.11, PHP 7.4.33, MariaDB
10.11, Apache, memcached, URL courtes en `/wiki/`.

Le **code** de MediaWiki n'est pas dans l'image : il est copié depuis la
production (archive du cœur, 40 extensions dont 17 sans version déclarée,
qu'aucune reconstruction depuis une image officielle ne retrouverait à
l'identique) et monté dans le conteneur.

## Fichiers

Dans ce dossier, versionnés, sans aucun secret :

| Fichier | Rôle |
|---|---|
| `Dockerfile` | image PHP 7.4 + Apache et extensions PHP requises |
| `apache-miroir.conf` | URL courtes `/wiki/Titre` |
| `compose.yml` | les trois services |
| `LocalSettings_miroir.php` | configuration de production, écarts 1 à 9 et 11 |
| `php-miroir.ini` | limites PHP d'Apache relevées en production |
| `miroir.env.exemple` | noms des variables d'environnement, valeurs factices |
| `ecarts-avec-la-production.md` | les douze écarts et leur motif |

Hors du dépôt, dans le **dossier de données** (ici
`/home/spheres/miroir-wiki/`, jamais dans un dossier synchronisé) :

| Fichier | Origine |
|---|---|
| `ecolibre-AAAAMMJJ-HHMM.sql.gz` | dump de la base de production (fourni par l'adminsys) |
| `coeur-mw139-AAAAMMJJ-HHMM.tar.gz` | archive du cœur MediaWiki, sans images, cache, tests ni configuration |
| `miroir.env` | secrets du miroir, créé à l'étape 2, mode 600 |
| `coeur/` | archive décompressée, créée à l'étape 3 |

## Prérequis

- Docker en mode **sans privilèges** (rootless) déjà installé et démarré
  pour l'utilisateur courant, avec le greffon `docker compose`. Le compte
  n'est pas dans le groupe `docker`, et le démon système
  (`docker.service`) reste éteint : ne jamais le rallumer. Contrôle :

  ```
  docker info --format '{{.SecurityOptions}}'   # doit contenir name=rootless
  systemctl is-active docker.service            # doit rendre inactive
  ```

- Environ 5 Go libres (images, base, cœur décompressé).
- Le port 8080 libre sur `127.0.0.1`.
- Toutes les commandes ci-dessous se lancent **depuis la racine du dépôt**
  `ecolibre-sgdt`.

## Remonter le miroir depuis zéro

### 1. Déposer le dump et l'archive

Copier le dump et l'archive du cœur dans le dossier de données :

```
mkdir -p /home/spheres/miroir-wiki
chmod 700 /home/spheres/miroir-wiki
# y copier ecolibre-....sql.gz et coeur-mw139-....tar.gz
```

### 2. Créer `miroir.env`

Le fichier porte des mots de passe engendrés au hasard ; il ne doit jamais
entrer dans le dépôt. Adapter `MIROIR_DUMP` au nom réel du dump.

```
umask 077
cat > /home/spheres/miroir-wiki/miroir.env <<EOF
MIROIR_DATA=/home/spheres/miroir-wiki
MIROIR_DUMP=ecolibre-20261009-1315.sql.gz
MIROIR_DB_NAME=mediawiki_ecolibre_prod
MIROIR_DB_USER=miroir
MIROIR_DB_PASSWORD=$(openssl rand -hex 16)
MIROIR_DB_ROOT_PASSWORD=$(openssl rand -hex 16)
MIROIR_SECRET_KEY=$(openssl rand -hex 32)
MIROIR_UPGRADE_KEY=$(openssl rand -hex 8)
EOF
chmod 600 /home/spheres/miroir-wiki/miroir.env
```

`MIROIR_DB_NAME` doit rester `mediawiki_ecolibre_prod` : Semantic MediaWiki
range son état d'installation sous ce nom dans
`extensions/SemanticMediaWiki/.smw.json`. Sous un autre nom, SMW se déclare
non installé et réclame `update.php`, qu'il ne faut pas lancer (voir plus bas).

### 3. Décompresser le cœur et préparer images/ et cache/

```
mkdir -p /home/spheres/miroir-wiki/coeur
tar -xzf /home/spheres/miroir-wiki/coeur-mw139-20261009-1403.tar.gz -C /home/spheres/miroir-wiki/coeur
mkdir -p /home/spheres/miroir-wiki/coeur/mediawiki-1.39/images/ecolibre /home/spheres/miroir-wiki/coeur/mediawiki-1.39/cache/ecolibre
```

Contrôle : `ls /home/spheres/miroir-wiki/coeur/mediawiki-1.39/extensions/SemanticMediaWiki/.smw.json`
doit exister.

### 4. Construire l'image

```
docker compose --env-file /home/spheres/miroir-wiki/miroir.env -f miroir/compose.yml build
```

Puis donner `images/` et `cache/` à l'utilisateur du serveur web
(`www-data`, uid 33 **dans le conteneur**). En mode sans privilèges, cet uid
n'est pas un utilisateur de l'hôte : le changement de propriétaire se fait
depuis un conteneur, pas par `chown` sur l'hôte.

```
docker run --rm -v /home/spheres/miroir-wiki/coeur/mediawiki-1.39:/w ecolibre-miroir-wiki:lot22 chown -R www-data:www-data /w/images /w/cache
```

### 5. Démarrer la base et memcached

```
docker compose --env-file /home/spheres/miroir-wiki/miroir.env -f miroir/compose.yml up -d --wait db memcached
```

`--wait` rend la main quand la base répond (contrôle de santé de l'image
MariaDB).

### 6. Restaurer le dump

Par `docker compose exec`, avec le client MariaDB **du conteneur** : rien
n'est installé sur l'hôte.

```
docker compose --env-file /home/spheres/miroir-wiki/miroir.env -f miroir/compose.yml exec -T db sh -c 'gzip -dc /dump/ecolibre.sql.gz | mariadb -u root -p"$MARIADB_ROOT_PASSWORD" "$MARIADB_DATABASE"'
```

Contrôle : 97 tables, dont 39 de SMW, pour le dump du 9 octobre 2026.

```
docker compose --env-file /home/spheres/miroir-wiki/miroir.env -f miroir/compose.yml exec -T db sh -c 'mariadb -u root -p"$MARIADB_ROOT_PASSWORD" -N -e "SELECT COUNT(*), SUM(table_name LIKE \"smw%\") FROM information_schema.tables WHERE table_schema=DATABASE()" "$MARIADB_DATABASE"'
```

### 7. Démarrer le wiki

```
docker compose --env-file /home/spheres/miroir-wiki/miroir.env -f miroir/compose.yml up -d --wait wiki
```

Le miroir répond sur http://localhost:8080/wiki/.

### 8. Vérifier

```
curl -s 'http://localhost:8080/api.php?action=query&meta=siteinfo&siprop=general|extensions&format=json'
```

doit rendre `MediaWiki 1.39.11`, une `phpversion` en 7.4, et les 26
extensions et habillages de la production aux mêmes versions. Comparer à la
même requête sur https://wiki.ecolibre.org : tout écart est un échec.

Puis une page en URL courte :

```
curl -s -o /dev/null -w '%{http_code}\n' 'http://localhost:8080/wiki/Accueil'
```

## Ce qu'il ne faut jamais faire

- **Ne jamais lancer `maintenance/update.php`.** Le code et le dump sont de
  la même version : une migration de schéma fausserait le miroir. Si
  quelque chose semble l'exiger (message de SMW, erreur de table), c'est que
  le code, le dump ou `MIROIR_DB_NAME` ne correspondent pas : chercher là.
- Ne jamais publier un port ailleurs que sur `127.0.0.1`.
- Ne jamais rallumer le démon Docker système ni ajouter le compte au groupe
  `docker`.
- Ne jamais versionner `miroir.env`.

## Lancer un script de maintenance

Dans le conteneur, depuis `/var/www/html`. La variable `SERVER_NAME` de la
production (aiguilleur de la ferme) n'existe pas ici : le miroir ne porte
qu'un wiki, et `LocalSettings.php` est directement celui du miroir.

```
docker compose --env-file /home/spheres/miroir-wiki/miroir.env -f miroir/compose.yml exec -u www-data wiki php maintenance/runJobs.php
```

## Changer la configuration du miroir

**Modifier `miroir/LocalSettings_miroir.php` ne suffit pas à changer le
miroir.** Le fichier est monté seul dans le conteneur : un éditeur qui le
remplace au lieu de le réécrire sur place laisse le conteneur sur
l'ancienne version. Après tout changement de configuration — pas seulement
la levée de l'écart 11 —, recréer le conteneur :

```
docker compose --env-file /home/spheres/miroir-wiki/miroir.env -f miroir/compose.yml up -d --force-recreate --wait wiki
```

**Vérifier qu'un réglage a vraiment pris par sa valeur effective**, lue dans
le conteneur, et non par le contenu du fichier côté hôte. Par exemple, pour
`$wgJobRunRate` :

```
docker compose --env-file /home/spheres/miroir-wiki/miroir.env -f miroir/compose.yml exec -T -u www-data wiki php maintenance/getConfiguration.php --settings=wgJobRunRate --format=json
```

doit rendre `{"wgJobRunRate":0}` sur le miroir livré.

## Arrêter, redémarrer, détruire

```
# arrêter sans rien perdre
docker compose --env-file /home/spheres/miroir-wiki/miroir.env -f miroir/compose.yml stop
# redémarrer
docker compose --env-file /home/spheres/miroir-wiki/miroir.env -f miroir/compose.yml up -d --wait
# tout détruire, base comprise (volume db-data)
docker compose --env-file /home/spheres/miroir-wiki/miroir.env -f miroir/compose.yml down -v
```

Pour repartir d'une base propre (par exemple après un essai qui l'a
modifiée) : `down -v`, puis reprendre aux étapes 5 à 7.

Les fichiers écrits par le serveur web dans `images/` et `cache/`
appartiennent à un uid du conteneur et ne se suppriment pas depuis l'hôte
par un simple `rm`. Les supprimer depuis un conteneur :

```
docker run --rm -v /home/spheres/miroir-wiki/coeur/mediawiki-1.39:/w ecolibre-miroir-wiki:lot22 sh -c 'rm -rf /w/images/ecolibre/* /w/cache/ecolibre/*'
```

## Dépannage

- **La construction échoue sur des paquets en 404.** `php:7.4-apache` repose
  sur Debian 11, retirée des miroirs courants : le `Dockerfile` bascule déjà
  les sources vers `archive.debian.org`. Si l'erreur revient, vérifier que
  cette ligne `sed` est toujours là.
- **`/wiki/Titre` rend 404 alors que `/index.php?title=Titre` marche.** Les
  règles de réécriture doivent rester dans le bloc `<Directory>` de
  `apache-miroir.conf` : au niveau serveur, l'hôte virtuel par défaut ne les
  hérite pas.
- **SMW annonce une installation incomplète.** Voir l'étape 2 :
  `MIROIR_DB_NAME`, et la présence de `.smw.json` dans le cœur décompressé.
- **Un fichier `LocalSettings.php` vide apparaît dans le cœur sur l'hôte.**
  C'est le point de montage créé par Docker pour
  `LocalSettings_miroir.php` ; il est normal.
