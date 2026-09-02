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
  verrou observé fin lot 9 : le rapport `travaux/lot-9-tache0-rapport.md` §10
  constatait déjà, au moment où le verrou bloquait, une file **vide**
  (`showJobs.php --group`), une purge qui ne reprogrammait aucun job, et un
  `rebuildData.php --page` sans effet sur le verrou. Le verrou était
  **orphelin** — il n'attendait aucun job, donc aucune file non vidée ne
  pouvait en être la cause. Benjamin rapporte par ailleurs que
  `$wgJobRunRate` valait déjà `1`. Le cron reste utile : il rend la
  propagation prompte au lieu de dépendre du trafic — mais il ne prévient pas
  nécessairement une récidive du même verrou.

### 2.2 Configuration

- **Collation `uca-fr` — FAIT, appliqué côté serveur les 18-19 août 2026.**
  Le tri du wiki, jusque-là binaire, est désormais linguistique (`uca-fr`).
  Le correctif « tri alphabétique » de `Modèle:Lieu` du 19 août 2026 en
  découlait déjà. Vérifié le 29 août 2026 et revérifié le 31 : sur les 38
  items référencés triés par ordre alphabétique, « Égopode Escuroux 2025 »
  se classe 13ᵉ, entre « Crosnes du Japon Armand 2026 » et « Fer à souder
  Quicko T12-942 » — le « É » est trié avec le « E ». L'interdit de tout tri
  alphabétique qui pesait sur les lots 9 et 10 est levé. L'historique de la
  demande est conservé ci-dessous : c'est lui qui explique pourquoi le
  réglage est double (`$wgCategoryCollation` + `$smwgEntityCollation`) et
  pourquoi l'ordre des scripts compte — à relire pour le wiki de l'Atelier
  du Dôme.

  Constat initial du 17 août 2026 : le tri SMW se faisait sur les points de
  code. `Égopode` (`É` = U+00C9) tombait après `Yacon` (`Y` = U+0059), et
  `Hémérocalle` après `Hysope`. Mesuré en prévisualisation sur `Le Buisson
  de Cerzat`, sans écriture. **Conséquence, tant que le réglage n'avait pas
  changé : aucune vue du wiki ne pouvait reposer sur un tri alphabétique.**

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
- **`$smwgChangePropagationProtection` — un verrou mesuré sur trois
  pages, pas une règle générale.** Deux versions précédentes de cette
  entrée ont chacune généralisé depuis un cas unique, sans le vérifier :
  d'abord un incident ponctuel du 15 août, puis « le verrou se
  redéclenche à chaque création de propriété ». **Ce que le mesuré dit
  au 25 août 2026, et rien de plus** :
  - **Éditer une page de propriété existante fonctionne : six cas, aucun
    refus.** Les cinq propriétés du lot 7 (`Edible_parts`, `Plant_habit`,
    `Propagation_method`, `Root_system`, `Seed_treatment`) et
    `Attribut:Planting rank` sont toutes des pages du 15 août 2026 —
    créées avec les 15 pages `Attribut:` de l'incident initial, pas le
    21. `Property_range` corrigé sur les six le 25 août 2026, du premier
    coup, sans aucun refus.
  - **Trois pages sont restées bloquées, pas une seule — puis se sont
    débloquées d'elles-mêmes, avant le 31 août 2026, revérifié le
    2 septembre 2026** : `Attribut:INSEE
    code`, depuis sa création le 21 août 2026 (lot 11, tâche 1) — cinq
    refus `smw-change-propagation-protection` identiques, répartis sur
    quatre jours ; et depuis le 27 août 2026,
    `Attribut:Casc parent` et `Attribut:Casc lineage`, toutes deux
    blanchies la veille (26 août) en préparation de leur suppression.
    Code d'erreur vérifié le 27 août par
    `action=query&prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full`
    sur les deux : `smw-change-propagation-protection` dans les deux
    cas, identique à celui d'`INSEE code`.
  - **`protection: []` reste vide sur les trois, tout du long** — mesuré
    à nouveau le 27 août sur les deux Casc. Ce verrou est **invisible à
    `prop=info` seul**, quel que soit le nombre de pages concernées : il
    ne se lit que par `intestactions`, jamais par le champ `protection`.
  - **Les deux pages Casc sont à supprimer, pas à corriger.** Elles ne
    portent plus de contenu utile (blanchies), et l'objectif n'est pas
    de leur rendre un `Has type` mais de les faire disparaître. **Le
    déblocage demandé sert donc la suppression, pas une réécriture** —
    différent de la demande sur `INSEE code`, où le but reste de
    corriger `Property_range` puis de garder la page.
  - **L'anomalie n'est donc pas le verrou lui-même, mais qu'il ne se
    lève pas sur ces pages précises.** Un verrou temporaire à la création
    d'une propriété, le temps que sa propagation se termine, est le
    comportement documenté de SMW — cohérent avec les trois refus
    essuyés juste après la création d'`INSEE_code`. **Mais aucun des six
    cas déjà mesurés ne teste une création** : les six sont des pages
    existantes, éditées après coup. Si une création déclenche
    normalement un verrou temporaire qui se lève de lui-même, ça reste
    **non testé** — le seul cas de création disponible est justement
    celui qui ne s'est jamais levé, ce qui ne permet pas de trancher.
    Les deux Casc ajoutent un troisième déclencheur possible, distinct
    d'une création : **un blanchiment retirant `Has type` avant
    suppression**, qui semble avoir déclenché sa propre propagation,
    elle aussi coincée.

  **Demande à fuzzy** — deux pistes, pas une certitude sur laquelle
  trancher depuis ce côté-ci, à appliquer aux trois pages :
  1. Vérifier `$smwgChangePropagationProtection` dans
     `LocalSettings_ecolibre.php` (valeur actuelle jamais lue
     directement depuis ici).
  2. **Vider la file de travaux — probablement suffisant à lever ce
     verrou précis**, un verrou de propagation attendant par
     construction qu'un job s'exécute. Note pour fuzzy : un vidage de
     file n'avait *pas* suffi sur le verrou orphelin de la section 2.1
     de cette page (`lot-9-tache0-rapport.md` §10, file déjà vide au
     moment du blocage) — deux cas qui se ressemblent en surface, pas
     nécessairement la même cause.

  Pour `Attribut:Casc parent` et `Attribut:Casc lineage`, le déblocage
  demandé n'a qu'un seul usage prévu : les supprimer aussitôt débloquées.

- **`$smwgNamespacesWithSemanticLinks` — les espaces `Modèle` (10),
  `Formulaire` (106) et `Module` (828) n'y sont pas.** À discuter avec fuzzy,
  **pas à poser comme une évidence** : voir la réserve ci-dessous, qui peut
  très bien conclure au statu quo.

  **Le mesuré, le 25 août 2026.** Aucune page de ces trois espaces ne porte le
  moindre fait SMW — `browsebysubject` rend vide sur `Modèle:Physical item`,
  `Modèle:Lieu`, `Modèle:Documentation`, `Formulaire:Physical item/doc`. Et
  `[[Object_description_FR::+]]` rend **0 page** sur tout le wiki, alors que
  cinq pages `/doc` portent bien cette annotation dans leur wikitexte.

  **Conséquence visible :** les 18 appels `#show` du
  [Récapitulatif technique](https://wiki.ecolibre.org/wiki/R%C3%A9capitulatif_technique_du_Syst%C3%A8me_de_Gestion_de_Donn%C3%A9es_Techniques)
  retombent tous sur leur `default=`, et la page affiche « Non documenté » /
  « No description » partout depuis sa création.

  **Deux causes distinctes, à ne pas confondre** — les 18 `#show` visent
  9 pages `/doc`, à raison de deux appels (FR et EN) par page :

  | Cause | Pages visées | Ce qui la corrigerait |
  |---|---|---|
  | Espace non sémantique | **5** — `Template:Functional item/doc`, `Pending translation/doc`, `Physical item/doc`, `Referenced item/doc`, `Module:Source/doc` | cette demande |
  | **Page inexistante** | **4** — `Template:Documentation/doc`, `Template:MermaidLine/doc`, `Template:Organic item/doc`, `Module:Base36/doc` | créer les pages, sans rien demander à personne |

  Activer les espaces ne réglerait donc que cinq cas sur neuf. Les quatre
  autres relèvent d'une écriture ordinaire, à faire indépendamment.

  > **Réserve, et elle est la raison d'être de cette entrée.** SMW désactive
  > `NS_TEMPLATE` par défaut **à dessein** : une page de modèle deviendrait
  > sujet de ses propres annotations, et tout `#set` écrit dans un modèle
  > annoterait la page du modèle en plus des pages qui le transcluent. Les
  > sous-pages `/doc` **partagent cet espace de noms** — on ne peut pas
  > l'activer pour elles seules. Le gain (cinq descriptions affichées sur une
  > page de documentation) est à mettre en balance avec ce risque, qui porte
  > sur les quatre modèles d'items en service.
  >
  > **Piste alternative à soumettre en même temps :** déplacer les
  > descriptions hors de l'espace `Modèle`, ou remplacer les `#show` du
  > récapitulatif par du texte écrit à la main. Aucune des deux ne demande
  > quoi que ce soit à l'adminsys.

  Rien n'a été modifié ni demandé à ce jour : entrée de constat, ouverte.

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
