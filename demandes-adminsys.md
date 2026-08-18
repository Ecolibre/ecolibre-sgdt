# Demandes à l'adminsys — ce que Cyril fait seul, ce qui relève de fuzzy

État au 16 août 2026, fin du lot 9.

## La règle de partage, et son motif

Cyril dispose d'un accès SSH `clibert` sur `serveur3.initiative.place` et
appartient au groupe `fuzzy` : il a donc, **techniquement**, un droit
d'écriture sur `LocalSettings_ecolibre.php`.

**Règle retenue : il ne modifie pas ce fichier sans accord préalable.** C'est
une question de **gouvernance, pas de permission** — la distinction est le
fond de cette page. La configuration du site reste du côté de l'adminsys, même
quand le verrou technique ne l'impose pas. Un droit d'écriture n'est pas un
mandat.

Rappel qui vaut pour tout ce qui suit : le cœur MediaWiki
(`/home/fuzzy/mediawiki/mediawiki-1.39/`) est **partagé par toute la ferme**,
et l'aiguilleur teste `$_SERVER['SERVER_NAME']`, absent en CLI. **Toute
commande de maintenance se préfixe `SERVER_NAME=wiki.ecolibre.org`** — voir
`CLAUDE.md`, section *Serveur*.

---

## 1. Ce que Cyril peut faire seul, sans rien demander

Aucune de ces trois actions ne modifie la configuration : elles lisent, ou
elles font tourner ce qui est déjà prévu pour tourner.

| Action | Commande | Remarque |
|---|---|---|
| Exécuter la file de travaux à la main | `SERVER_NAME=wiki.ecolibre.org php maintenance/runJobs.php` | Le préfixe est **obligatoire** |
| Tout diagnostic en lecture | `showJobs.php`, `getConfiguration.php`, `action=siteinfo` | Aucune écriture |
| Reconstruire les données SMW d'une page ciblée | `SERVER_NAME=wiki.ecolibre.org php maintenance/rebuildData.php --page "Titre"` | **`--page` uniquement**, jamais sur l'ensemble du wiki |

---

## 2. Ce qui exige une décision de fuzzy

Par ordre d'urgence.

### 2.1 Bloquant

- **Un cron sur `runJobs.php` — FAIT, mais pas la cause racine.** Benjamin
  l'a mis en place le 17 août 2026 : la file de travaux ne se vide plus au
  seul gré du trafic de lecture, et se traite désormais à intervalle
  régulier. Il ne faut pourtant pas lire ce cron comme l'explication du
  verrou observé fin lot 9 : le rapport `lot-9-tache0-rapport.md` §10
  constatait déjà, au moment où le verrou bloquait, une file **vide**
  (`showJobs.php --group`), une purge qui ne reprogrammait aucun job, et un
  `rebuildData.php --page` sans effet sur le verrou. Le verrou était
  **orphelin** — il n'attendait aucun job, donc aucune file non vidée ne
  pouvait en être la cause. Benjamin rapporte par ailleurs que
  `$wgJobRunRate` valait déjà `1`. Le cron reste utile : il rend la
  propagation prompte au lieu de dépendre du trafic — mais il ne prévient pas
  nécessairement une récidive du même verrou.

### 2.2 Configuration

- **Collation `uca-fr` — le tri du wiki est aujourd'hui binaire.** Constat du
  17 août 2026 : le tri SMW se fait sur les points de code. `Égopode`
  (`É` = U+00C9) tombe après `Yacon` (`Y` = U+0059), et `Hémérocalle` après
  `Hysope`. Mesuré en prévisualisation sur `Le Buisson de Cerzat`, sans
  écriture. **Conséquence : aucune vue du wiki ne peut reposer sur un tri
  alphabétique** tant que ce réglage n'a pas changé.

  > **Incident du 18 août 2026.** Cette demande, telle qu'elle était rédigée
  > jusqu'ici — deux commandes seulement, sans passage préalable par
  > `setupStore.php` — a mis le wiki hors service pour tout le monde, pages
  > et API confondues (`ERROR_SCHEMA_INVALID_KEY`) : `$smwgEntityCollation`
  > change la clé de version que SMW attend, et SMW refuse de servir tant que
  > cette clé n'a pas été appliquée par une exécution de `setupStore.php` (ou
  > `update.php`). L'étape manquante était celle-là, pas les deux qui
  > suivent. Cette mise en garde reste sur la page parce qu'elle sera relue —
  > pour le wiki de l'Atelier du Dôme notamment.

  Demandé, dans `LocalSettings_ecolibre.php` :

  ```php
  $wgCategoryCollation = 'uca-fr';
  $smwgEntityCollation = 'uca-fr';
  ```

  **Les deux, et à la même valeur** : les laisser différer produit un tri
  incohérent entre les catégories et les requêtes.

  Puis, **dans cet ordre** :
  1. `setupStore.php` côté SMW, **sans l'option `--delete`** — qui viderait
     le magasin. C'est cette exécution qui applique la clé de version que le
     nouveau réglage de collation exige ; `maintenance/update.php` est
     l'alternative que la page d'erreur de SMW nomme elle-même, et couvre la
     même étape côté cœur MediaWiki.
  2. `updateEntityCollation.php` côté SMW, qui met à jour en masse le champ
     `smw_sort`.
  3. `updateCollation.php` côté MediaWiki.

  Préfixer chaque commande `SERVER_NAME=wiki.ecolibre.org` et utiliser
  `php7.4`.

  **Dépendance à vérifier avant tout** : l'extension PHP `intl`, dont
  dépendent les collations `uca-`. Commande : `php7.4 -m | grep intl`.

  **À vérifier avant de mobiliser l'adminsys** : aucun de ces trois scripts
  ne réclame `root`, et Cyril appartient au groupe `fuzzy`. Contrôler d'abord
  les droits en écriture sur `LocalSettings_ecolibre.php` — **si le groupe a
  l'écriture, ce n'est pas une demande adminsys**, seulement une modification
  de configuration à faire dans le cadre de gouvernance rappelé en tête de
  page.

- **Autoriser le SVG dans `$wgFileExtensions`.** Interdit aujourd'hui, ce qui
  ferme la porte aux dessins vectoriels sur un système de données techniques.
  **Réserve de sécurité à porter dans la demande** : un fichier SVG peut
  contenir du script, et son autorisation demande donc un arbitrage de
  l'adminsys, pas seulement un ajout à une liste.
- **Extension Page Exchange.**
- **Répertoire de déploiement du vocabulaire.**
- **Script de création de wiki.**
- **`$smwgChangePropagationProtection` — en réserve, la demande n'est plus
  bloquante.** Le verrou orphelin qui bloquait 15 pages `Attribut:` créées le
  15 août 2026 n'empêche plus rien d'observable : les deux corrections de
  données qu'il retenait sont faites — `en réserve` ajouté aux valeurs
  autorisées d'`Attribut:Specimen_status`, et le retrait de la restriction
  « sur le même terrain » sur `Attribut:Propagated_from`. Depuis le
  17 août 2026, une douzaine d'écritures sur des pages `Attribut:` sont
  passées sans refus. **Recours si le symptôme revient** :
  `$smwgChangePropagationProtection = false` dans
  `LocalSettings_ecolibre.php`.

### 2.3 Infrastructure

- **Migration Scaleway.**
- **Wiki Atelier du Dôme.**
- **Dump SQL et archive des images — FAIT.** Benjamin, 17 août 2026 :
  `mediawiki_ecolibre_prod.sql.gz` et `mediawiki_images_ecolibre.tar.gz`,
  déposés dans le répertoire `mediawiki-1.39`.

### 2.4 Gouvernance

- **Financement de l'hébergement.**
- **Politique de sauvegarde.**
- **Rotation du mot de passe de `mediawiki_ecolibre_prod`**, exposé en
  juillet 2026.
