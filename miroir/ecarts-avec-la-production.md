# Écarts entre le miroir et la production

À relire le jour où un essai sur le miroir donne un résultat surprenant,
**avant** de chercher la cause dans le réglage éprouvé : la surprise vient
peut-être de l'un de ces neuf écarts, et d'eux seuls.

`miroir/LocalSettings_miroir.php` reprend la configuration de production
(`LocalSettings_ecolibre.php`) avec exactement ces neuf écarts, chacun marqué
« ÉCART n » dans le fichier. Toute autre différence de comportement est une
erreur du miroir, à corriger.

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
