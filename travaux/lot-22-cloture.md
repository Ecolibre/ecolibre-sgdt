# Lot 22 — Clôture : un miroir local qui tourne, sa marche à suivre, ses douze écarts

Rédigé le 10 octobre 2026 (date relevée par `date` : sam. 10 oct. 2026
13:06 CEST), exécuteur Claude Code, consigne « Pour Claude Code. Tâche 13
du lot 22 ». Ce rapport fait le bilan du lot ; il ne le clôt pas. Le lot
reste « ouvert » sur le wiki : son passage à l'état clos sera écrit par une
consigne séparée, qui citera ce fichier par son permalien.

Forme reprise du rapport de clôture du lot 34 (`travaux/lot-34-cloture.md`,
cité par `Work_package_closure_report` sur la page *Lot 34 — Consignes
permanentes et aiguillage des messages*) : titre, paragraphe d'en-tête
(date, exécuteur, consigne), sections numérotées par sujet, tableaux pour
les relevés, section finale « Écarts et surprises ».

Chaque fait ci-dessous est mesuré dans cette tâche ou cité d'un rapport
de tâche du lot (`travaux/lot-22-tache1-cadrage.md` à
`travaux/lot-22-tache13-ecart-12.md`).

## 1. Ce que le lot a livré

| Livrable | Où |
|---|---|
| Un miroir local du wiki qui tourne : MediaWiki 1.39.11, PHP 7.4.33, base MariaDB 10.11 restaurée depuis le dump du 9 octobre 2026, memcached, URL courtes en `/wiki/`, sur le seul port `127.0.0.1:8080` | conteneurs `wiki`, `db`, `memcached` ; fichiers dans `miroir/` |
| Sa marche à suivre, pour le remonter depuis zéro, commandes exactes dans l'ordre | `miroir/README.md` |
| Sa définition : image, services, configuration, limites PHP | `miroir/Dockerfile`, `miroir/compose.yml`, `miroir/LocalSettings_miroir.php`, `miroir/php-miroir.ini`, `miroir/apache-miroir.conf`, `miroir/miroir.env.exemple` |
| La liste de ses écarts avec la production, douze, chacun avec son motif | `miroir/ecarts-avec-la-production.md` |
| Une page du wiki qui porte le pourquoi : décisions, routes écartées, raisonnement | *Miroir local du wiki* (tâche 11), déclarée par `Work_package_produces` sur la page du lot (tâche 12) |

Permaliens : ce fichier est écrit avant le commit de la tâche 13 et ne peut
pas citer son propre SHA. Les chemins ci-dessus sont relatifs à la racine
du dépôt ; les permaliens se construisent sur le SHA du commit de la tâche
13, donné dans `travaux/lot-22-tache13-ecart-12.md` et dans le rapport de
fin de session.

**La vérification qui tranche**, sur l'état livré (`$wgJobRunRate` à 0,
conteneur recréé) : MediaWiki 1.39.11, PHP 7.4.33, 26 extensions et
habillages sur 26, 0 échec (tâche 7). Les dix limites PHP du miroir sont
celles de la production, dix sur dix (tâche 6).

## 2. Le coût

Treize tâches. Dates relevées dans `git log`, par le commit de chaque
rapport de tâche :

| Tâches | Date | Objet |
|---|---|---|
| 1, 2 | 8 octobre 2026 | inscription du cadrage sur la page du lot, accent |
| 3 à 7 | 9 octobre 2026 | fusion des cadrages, ouverture (tâche 4), construction du miroir (tâche 5), limites PHP et modules (tâche 6), vérification finale sur l'état livré (tâche 7, commit `9f37183`, 23 h 57) |
| 8 à 12 | 10 octobre 2026, entre minuit et 1 h 27 | entrée 66, page du lot, correction du chiffre, page *Miroir local du wiki*, rangement des trouvailles |
| 13 | 10 octobre 2026 | écart 12, ce rapport |

Le lot a été ouvert le 9 octobre 2026 (`Work_package_opening_date`,
tâche 4) et le miroir livré et vérifié le même jour (tâche 7). Les deux
premières tâches, la veille, portaient sur le cadrage, avant l'ouverture.
La page du lot ne porte pas encore de `Work_package_delivery_date`.

## 3. Ce qui a été mesuré, et où c'est rangé

| Trouvaille | Rangée dans | Tâche |
|---|---|---|
| Le compte de `showJobs.php` est en retard sur la table `job` : la mesure qui tranche est le nombre de lignes de cette table | *Limites connues*, entrée 66 | 8 |
| Le socle PHP 7.4 de la production est en fin de vie depuis le 28 novembre 2022, et son image Docker officielle ne se construit plus sans basculer apt vers `archive.debian.org` | *Limites connues*, entrée 67 | 12 |
| Les refus inscrits dans les permissions de l'exécuteur protègent de l'accident, pas d'un accès délibéré (compte dans le groupe `lxd`) | *Notes en attente de rangement*, note « Ce que les refus de l'exécuteur protègent réellement » | 12 |
| Un fichier déposé dans un arbre servi par un serveur web s'annonce au préalable | `CLAUDE.md`, règle 7 des garde-fous du wiki | 6 |
| Un filtre se vérifie sur ce qu'il produit, jamais sur son intention | `CLAUDE.md`, règle 8 | 11 |
| Pas de script du scratchpad tant que le travail tient en quelques lignes dans la commande | `CLAUDE.md`, règle 9 | 11 |
| Mot de passe de `mediawiki_ecolibre_prod` exposé une seconde fois le 9 octobre 2026 | `demandes-adminsys.md`, section 2.4, second motif de la demande de rotation déjà ouverte | 11 |
| Le miroir existe, il est vérifié, sa marche à suivre est écrite | page *Lot 24 — Adminsys autonome*, phrase ajoutée en fin de « Dépendances » | 12 |

## 4. Les deux routes écartées

Inscrites sur la page du lot, section « Ce qui est écarté, et pourquoi »
(tâche 12), raisonnement détaillé sur *Miroir local du wiki* (tâche 11).

- **Reconstruire le miroir depuis l'image officielle de MediaWiki, plutôt
  que copier le cœur de production.** Écartée le 9 octobre 2026 : 18 des 40
  extensions du disque ne déclarent aucune version (recompte de la tâche
  10). Une reconstruction donnerait les mêmes numéros sans le même
  logiciel, et le miroir existe pour attraper l'effet de bord imprévu.
- **Mettre le compte qui pilote Docker dans le groupe `docker`.** Écartée
  le 9 octobre 2026 : cela équivaut à lui donner la racine de la machine.
  Docker tourne en mode sans privilèges, démon système éteint (mesuré en
  tâche 5).

## 5. Ce qui reste ouvert

- **Les images ne sont pas rapatriées** (écart 9). Les pages de fichier
  existent sans leur fichier ; les liens d'image et les vignettes sont
  cassés. L'archive des images du 17 août 2026 reste sur le serveur.
- **Vingt et un modules PHP de la production manquent au miroir** (écart
  10), aucun n'étant atteint par la configuration d'Ecolibre ; un essai qui
  en emploierait un demande de l'ajouter d'abord.
- **Le douzième écart, le SAPI** : la production fait tourner PHP en
  `fpm-fcgi`, le miroir en `apache2handler`. Documenté en tâche 13, non
  résorbé, volontairement : un essai qui porte sur un délai d'exécution ne
  se transpose pas. Les dix limites PHP vérifiées en tâche 6 restent
  justes : l'égalité des valeurs entre `apache2/php.ini` et `fpm/php.ini`
  de la production a été mesurée le 9 octobre 2026 par Cyril, dans son
  terminal, en session SSH, et non par l'exécuteur. Cette mesure ne vit
  que dans la conversation claude.ai : aucun fichier du dépôt ni aucune
  page du wiki ne la porte.
- **La rotation du mot de passe de `mediawiki_ecolibre_prod`**, demande à
  l'adminsys ouverte depuis juillet 2026, à laquelle ce lot a ajouté un
  second motif. Elle ne dépend pas de ce lot.

## 6. Erreurs de l'architecte

Cinq erreurs dans les consignes de ce lot. Pour chacune, ce qui l'a
attrapée.

1. **Un masquage défectueux a affiché le mot de passe de la base.** Une
   commande écrite par l'architecte, dont le masquage était censé cacher
   les secrets, a affiché le mot de passe de `mediawiki_ecolibre_prod`
   dans le terminal de Cyril, et il est passé dans une conversation
   claude.ai, le 9 octobre 2026 (`demandes-adminsys.md`, section 2.4).
   **Ce qui l'a attrapée : rien, avant qu'il ne soit trop tard.** Le filtre
   n'avait été essayé sur aucun cas où le secret était présent ; l'erreur
   s'est vue à l'affichage même du secret. L'architecte a vu le secret dans
   la sortie collée par Cyril, donc après coup (source : l'architecte,
   consigne de la tâche 14 ; aucun rapport du dépôt ne le porte). C'est de
   là que viennent la règle 8 de `CLAUDE.md` et le second motif de la
   demande de rotation.
2. **Un motif d'exclusion a laissé un fichier de configuration entrer dans
   une archive.** Un filtre de l'architecte censé tenir la configuration
   hors d'une archive ne l'a pas fait (`CLAUDE.md`, règle 8). **Ce qui
   l'a attrapée : la vérification qui tranche inscrite dans la consigne
   elle-même**, qui listait le contenu de l'archive au lieu de relire le
   motif, au premier essai. L'archive a été refaite avec le motif corrigé,
   et la nouvelle vérifiée par trois contrôles de liste. Le contrôle a
   fonctionné ; c'est le filtre qui avait échoué. Aucun rapport du dépôt ne
   la couvre : cette archive a été faite dans le terminal de Cyril, pas par
   l'exécuteur (source : l'architecte, consigne de la tâche 14).
3. **17 extensions sans version déclarée, au lieu de 18.** Chiffre inscrit
   sur la page du lot. **Ce qui l'a attrapée : la liste relevée par Cyril
   sur le serveur**, puis le recompte de la tâche 10, qui lit chaque
   `extension.json` comme du JSON et cherche la clé `version` au premier
   niveau : 18 sur 40, les mêmes dix-huit que la liste de Cyril. Corrigé
   en révision 1483.
4. **La production située sur Debian 11 au lieu de Debian 12.** La
   consigne de la tâche 12 faisait écrire « PHP 7.4 sur Debian 11 » dans
   l'entrée 67. **Ce qui l'a attrapée : ma question A de la tâche 12**,
   posée avant toute écriture, appuyée sur une mesure : la production rend
   `dbversion` « 10.11.18-MariaDB-0+deb12u1-log », un paquet Debian 12.
   Cyril a validé la reformulation.
5. **Une étape de consigne me demandait d'appliquer moi-même la procédure
   de clôture.** La première version de la consigne de la tâche 10, à son
   étape 4. **Ce qui l'a attrapée : mon refus**, en une ligne et sans
   lancer aucune commande, pas même celles des étapes 1 à 3, comme le veut
   `CLAUDE.md`. Cyril a retiré l'étape et renvoyé la consigne.

Trois des cinq ont été attrapées avant de produire leur effet : la
deuxième par le contrôle de liste, avant que l'archive défectueuse ne
serve ; la quatrième et la cinquième avant toute écriture. La troisième
l'a été après coup, le chiffre faux ayant été inscrit sur la page du lot
puis corrigé en tâche 10. La première ne l'a jamais été. Un filtre jugé
sur son intention ne se contrôle pas ; jugé sur ce qu'il produit, il se
contrôle.

## 7. Ce que les refus de Cyril ont changé

Les rapports du lot consignent trois refus de Cyril, dont deux ont produit
des règles.

- **Tâche 6 : `verif1.py` et `verif3.py`.** Une commande lançait trois
  contrôles d'un coup, sans montrer le contenu des deux scripts, en
  vérifiant en passant une sonde déposée dans une installation web, et en
  lançant deux fois le même script. Ce refus a produit : la règle 7 de
  `CLAUDE.md` (annonce d'un fichier déposé dans un arbre servi) ; l'écart
  11, puisque la réponse au refus a fait voir qu'une requête de lecture
  pouvait exécuter un travail de la file ; et, parce que la vérification de
  la tâche 6 avait eu lieu avant l'écart 11, **la vérification qui tranche
  refaite sur l'état livré en tâche 7**, 0 échec, chaque script lancé une
  seule fois.
- **Tâche 9 : `permaliens.sh`.** Un script du scratchpad dont la fenêtre de
  confirmation ne montrait que le chemin, deuxième manquement du même genre
  après la tâche 6. Ces deux refus ont produit **la règle 9 de
  `CLAUDE.md`** : pas de script du scratchpad tant que le travail tient en
  quelques lignes dans la commande.
- **Tâche 5 : une lecture de l'archive du cœur** par `tar -tzf … | grep`.
  La tâche a repris par la décompression, sans relancer la commande. Le
  rapport de la tâche 5 ne lui attribue aucune règle.

La règle 8 de `CLAUDE.md` ne vient pas d'un refus de Cyril : elle vient des
deux filtres défectueux de l'architecte (section 6, erreurs 1 et 2).

## Écarts et surprises

- **Les dates ne sont pas tout à fait celles de la consigne.** Elle
  annonçait treize tâches « le 9 et le 10 octobre 2026 » ; les tâches 1 et
  2 datent du 8 octobre, avant l'ouverture. Le lot a bien été ouvert et le
  miroir livré le même jour, le 9 octobre.
- **L'origine des règles 8 et 9 diffère de celle annoncée.** La consigne
  attribuait les règles 8 et 9 aux deux refus de Cyril. D'après les
  rapports, la règle 9 vient bien de deux refus (tâches 6 et 9) ; la règle
  8 vient des deux filtres de l'architecte ; le refus de la tâche 6 a
  produit la règle 7.
- **Ce qui a attrapé les deux filtres défectueux n'était écrit nulle part
  dans le dépôt.** Section 6, erreurs 1 et 2 : d'abord laissé tel quel
  plutôt que supposé, puis complété en tâche 14 sur la réponse de
  l'architecte, seule source.
- **La page du lot comptait encore « onze » écarts**, deux fois. L'écriture de
  clôture de la tâche 14, qui suit ce commit, les porte à douze : ce
  rapport est écrit avant elle et ne peut pas en rendre compte.
