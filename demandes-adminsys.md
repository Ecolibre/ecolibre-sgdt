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

- **`$smwgChangePropagationProtection` — lever le verrou orphelin.**
  15 pages `Attribut:` créées le 15 août 2026 sont verrouillées en
  modification (`smw-change-propagation-protection`). Deux corrections de
  données restent dues et impossibles de ce fait : le retrait de la
  restriction « sur le même terrain » sur `Attribut:Propagated_from`, et
  l'ajout de la valeur `en réserve` sur `Attribut:Specimen_status` — cette
  seconde laissant aujourd'hui une plantation réelle (`ECL-0042`) sans statut
  stocké.

  **Diagnostic déjà fait, résultats négatifs, à ne pas refaire** (détail dans
  `lot-9-tache0-rapport.md` §10) : la file de travaux est **vide**
  (`showJobs.php --group`), la purge ne reprogramme aucun job, et
  `rebuildData.php --page` traite la page sans relâcher le verrou. Le verrou
  est **orphelin** : il n'attend aucun job. Le seul levier restant est le
  paramètre de configuration, donc `LocalSettings_ecolibre.php`.

- **Un cron sur `runJobs.php` — la cause racine.** La file de travaux ne se
  vide pas d'elle-même sous le seul trafic de lecture. Tant qu'aucune
  exécution régulière n'est en place, les jobs s'accumulent et les
  symptômes reviendront. **Cyril peut proposer de s'en charger** — c'est une
  tâche planifiée, pas une modification de configuration du wiki.

### 2.2 Configuration

- **Collation `uca-fr` — le tri du wiki est aujourd'hui binaire.** Constat du
  17 août 2026 : le tri SMW se fait sur les points de code. `Égopode`
  (`É` = U+00C9) tombe après `Yacon` (`Y` = U+0059), et `Hémérocalle` après
  `Hysope`. Mesuré en prévisualisation sur `Le Buisson de Cerzat`, sans
  écriture. **Conséquence : aucune vue du wiki ne peut reposer sur un tri
  alphabétique** tant que ce réglage n'a pas changé.

  Demandé, dans `LocalSettings_ecolibre.php` :

  ```php
  $wgCategoryCollation = 'uca-fr';
  $smwgEntityCollation = 'uca-fr';
  ```

  **Les deux, et à la même valeur** : les laisser différer produit un tri
  incohérent entre les catégories et les requêtes.

  Puis, **dans cet ordre** : `updateEntityCollation.php` côté SMW, qui met à
  jour en masse le champ `smw_sort` ; puis `updateCollation.php` côté
  MediaWiki. Préfixer `SERVER_NAME=wiki.ecolibre.org` et utiliser `php7.4`.

  **Dépendance à vérifier avant tout** : l'extension PHP `intl`, dont
  dépendent les collations `uca-`. Commande : `php7.4 -m | grep intl`.

  **À vérifier avant de mobiliser l'adminsys** : aucun de ces deux scripts ne
  réclame `root`, et Cyril appartient au groupe `fuzzy`. Contrôler d'abord les
  droits en écriture sur `LocalSettings_ecolibre.php` — **si le groupe a
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

### 2.3 Infrastructure

- **Migration Scaleway.**
- **Wiki Atelier du Dôme.**
- **Dump SQL et archive des images**, pour constituer le miroir local.

### 2.4 Gouvernance

- **Financement de l'hébergement.**
- **Politique de sauvegarde.**
- **Rotation du mot de passe de `mediawiki_ecolibre_prod`**, exposé en
  juillet 2026.
