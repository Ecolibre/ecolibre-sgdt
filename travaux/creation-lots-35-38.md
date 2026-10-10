# Création des lots 35 à 38

Exécuteur : Claude Code, 10 octobre 2026 (date relevée par `date` : sam.
10 oct. 2026 13:43:15 CEST au début, 13:47:05 CEST avant ce rapport). Tâche
hors lot. Quatre pages créées sur le wiki, aucune autre modifiée. Aucun lot
ouvert, aucun travail commencé : les quatre naissent « identifié ».

**Résultat : les quatre pages existent, dans `Catégorie:Lot`, avec leurs
relations. Le compte des lots passe de 34 à 38. Les sept contrôles
passent.**

## Créations

| Page | pageid | Révision | Horodatage | Résumé |
|---|---|---|---|---|
| Lot 35 — Récupération des fichiers téléversés | 604 | 1491 | 2026-10-10T11:44:11Z | `[Correctif] Création — Lot 35, récupération des fichiers téléversés` |
| Lot 36 — Sauvegarde du wiki | 605 | 1492 | 2026-10-10T11:44:12Z | `[Correctif] Création — Lot 36, sauvegarde du wiki` |
| Lot 37 — Consultation hors ligne | 606 | 1493 | 2026-10-10T11:44:12Z | `[Correctif] Création — Lot 37, consultation hors ligne` |
| Lot 38 — Écriture hors ligne | 607 | 1494 | 2026-10-10T11:44:13Z | `[Correctif] Création — Lot 38, écriture hors ligne` |

Chacune créée par `bin/wiki-put.sh … --createonly`, dans l'ordre 35 à 38,
pour que les titres cités dans les relations existent avant d'être cités.
Les quatre titres avaient été vérifiés `missing` juste avant.

## Étape 1 — État du dépôt

`git status --porcelain` : vide. `.claude/settings.local.json` : `allow` et
`deny` vides.

## Relevés avant écriture

- **Séparateur des titres** : les 34 titres de `Catégorie:Lot` emploient
  tous « ` — ` », un tiret cadratin U+2014 entouré de deux espaces
  (compte par `python3` sur la liste de l'API : 34 sur 34).
- **Forme de la page**, relevée sur *Lot 32 — Suivi des tâches* : appel
  `{{Lot}}` avec seulement les champs renseignés ; puis « Objet », « Ce qui
  est déjà tranché » (amorces en gras), « Points ouverts », « Dépendances »,
  un filet `----`, et « Voir aussi la [[Gestion des lots]]. ».
- **Champs**, relevés dans `Formulaire:Lot`, dans cet ordre :
  `Work_package_number`, `Work_package_status`, `Work_package_summary`,
  `Work_package_opening_date`, `Work_package_delivery_date`,
  `Work_package_closure_date`, `Work_package_closure_report`,
  `Work_package_produces`, `Work_package_depends_on`,
  `Work_package_overlaps`, `Work_package_revises`. Valeurs d'état :
  `identifié,cadré,ouvert,livré,clos,abandonné` (et `_PVAL` de
  `Attribut:Work package status`, identique). Les relations sont des
  listes séparées par des virgules. Ordre des champs dans les pages : celui
  de `Modèle:Lot`, comme sur la page modèle (`depends_on` avant
  `overlaps`).
- **Résumé de modification** : les créations de lots 32 et 34 portaient
  l'étiquette du lot en cours (`[Lot 13][Tâche 6]`, `[Lot 34][Tâche 1]`).
  Cette tâche ne relève d'aucun lot : `[Correctif]`, comme le veut
  `CLAUDE.md` pour toute écriture hors lot.

## Texte intégral des quatre pages

Copies locales : `pages/Lot_35.txt` à `pages/Lot_38.txt`.

### Lot 35 — Récupération des fichiers téléversés

```
{{Lot
|Work_package_number=35
|Work_package_status=identifié
|Work_package_summary=Récupérer par l'API les fichiers téléversés sur le wiki, et les déposer sur le miroir local pour que ses images s'affichent.
}}

== Objet ==

Le miroir local monté par le lot 22 porte les pages de fichier, mais pas les fichiers eux-mêmes : ses liens d'image sont cassés. Ce lot produit l'outil qui va chercher ces fichiers. Les lots 36 et 37 en ont besoin eux aussi, puisqu'ils emportent le même contenu hors du serveur.

== Ce qui est déjà tranché ==

'''Les fichiers se téléchargent par l'API, et non depuis l'archive déposée sur le serveur le 17 août 2026.''' Le wiki se lit en anonyme : cette route ne demande ni accès SSH ni intervention de quiconque, et elle se rejoue autant de fois qu'il le faut.

'''Le volume est connu.''' Mesuré le 10 octobre 2026 : 79 fichiers téléversés, 392,5 Mo au total, tous en JPEG ou en PNG, le plus gros à 7,7 Mo. Aucun fichier n'a été téléversé depuis le 17 août 2026.

'''Les vignettes ne se récupèrent pas.''' Elles se régénèrent à la demande, ImageMagick étant présent dans l'image du miroir.

'''L'archive de 495 Mo reste le repli''', si des versions anciennes de fichiers venaient un jour à manquer.

== Points ouverts ==

L'emplacement des fichiers récupérés n'est pas arrêté. Il dépend de ce que décideront les lots 36 et 37.

Personne n'a vérifié que les 79 fichiers suffisent : une page de fichier peut exister sans son fichier, et un fichier sans sa page. À mesurer.

== Dépendances ==

Rien en amont. Les lots 36 et 37 en dépendent.

----

Voir aussi la [[Gestion des lots]].
```

### Lot 36 — Sauvegarde du wiki

```
{{Lot
|Work_package_number=36
|Work_package_status=identifié
|Work_package_summary=Se doter d'une sauvegarde du wiki que l'on contrôle soi-même, et en faire la preuve en la remontant sur le miroir local.
|Work_package_depends_on=Lot 35 — Récupération des fichiers téléversés
|Work_package_overlaps=Lot 37 — Consultation hors ligne
}}

== Objet ==

Le lot 22 a exclu la sauvegarde de son périmètre, en la renvoyant à la gouvernance. Ce lot reprend le sujet par le côté où il ne demande rien à personne.

== Ce qui est déjà tranché ==

'''Il s'agit de la sauvegarde de Cyril, pas de la politique de sauvegarde du serveur.''' Celle-ci protège toute la ferme hébergée par l'adminsys, et relèvera du lot 24, avec lui.

'''Une sauvegarde n'est validée qu'une fois remontée sur le miroir local du lot 22.''' Une sauvegarde jamais restaurée n'est pas une sauvegarde, et le miroir est précisément la machine qui restaure.

'''Le dump de la base se produit par mysqldump, depuis le compte de Cyril.''' Route établie le 9 octobre 2026 : lire la base d'Ecolibre ne modifie aucune configuration et ne concerne aucun autre wiki de la ferme.

== Points ouverts ==

Rien n'est arrêté sur la destination de la sauvegarde, sa fréquence, le nombre d'exemplaires gardés, ni la machine sur laquelle tourne l'automatisme.

Une sauvegarde emporte la table des comptes, donc des empreintes de mots de passe et des adresses de courriel. Son chiffrement et l'endroit où elle est rangée ne sont pas tranchés.

La configuration de production porte des secrets. S'il faut la sauvegarder, et comment, n'est pas tranché.

== Dépendances ==

Dépend du lot 35 pour les fichiers téléversés. Recoupe le lot 37 : les deux emportent le même contenu hors du serveur.

----

Voir aussi la [[Gestion des lots]].
```

### Lot 37 — Consultation hors ligne

```
{{Lot
|Work_package_number=37
|Work_package_status=identifié
|Work_package_summary=Emporter le contenu du wiki sur une clé, pour le consulter sur une machine privée de connexion.
|Work_package_depends_on=Lot 35 — Récupération des fichiers téléversés
|Work_package_overlaps=Lot 36 — Sauvegarde du wiki
}}

== Objet ==

Objectif distinct, arbitré le 8 octobre 2026. Le lot 22 l'avait explicitement exclu de son périmètre et renvoyé après lui.

== Ce qui est déjà tranché ==

'''La consultation seulement.''' Écrire sur la copie hors ligne est l'objet du lot 38, et sort de celui-ci.

'''Rien de ce qui est emporté ne revient vers la production.'''

'''Le volume à emporter est connu.''' Mesuré le 10 octobre 2026 : 392,5 Mo de fichiers téléversés, et une base de 11 200 784 octets une fois décompressée.

== Points ouverts ==

La forme n'est pas arrêtée : export statique, copie de la base avec un wiki installé sur la machine isolée, ou wiki lancé depuis la clé.

La machine isolée n'est pas désignée. Le poste cwl-toshiba, 3,8 Go de mémoire, avait été réservé à cet objectif le 8 octobre 2026 : à confirmer.

== Dépendances ==

Dépend du lot 35. Recoupe le lot 36. Le lot 38 en dépend.

----

Voir aussi la [[Gestion des lots]].
```

### Lot 38 — Écriture hors ligne

```
{{Lot
|Work_package_number=38
|Work_package_status=identifié
|Work_package_summary=Écrire sur une copie hors ligne du wiki et en rapporter le travail, sans rompre la séquence des références Base 36.
|Work_package_depends_on=Lot 37 — Consultation hors ligne
}}

== Objet ==

Sujet soulevé le 10 octobre 2026 et volontairement laissé pour plus tard. Rien n'y est cadré, et la discussion n'a pas eu lieu.

== Ce qui est déjà tranché ==

Deux contraintes héritées, et rien d'autre.

'''Aucune référence Base 36 n'est créée hors ligne.''' Règle posée par le lot 22 : la séquence est unique et partagée, et une création locale produirait un doublon à la première synchronisation. Trouver comment lever cette contrainte est précisément l'objet de ce lot.

'''MediaWiki ne réconcilie pas deux historiques.''' Deux personnes qui écrivent sur deux copies d'un même wiki ne voient pas leurs modifications fusionner.

== Points ouverts ==

Tout. Cyril pense qu'il existe plusieurs manières de traiter la question des références Base 36 ; aucune n'a été examinée.

== Dépendances ==

Dépend du lot 37.

----

Voir aussi la [[Gestion des lots]].
```

## Vérifications

1. **QUI TRANCHE — passe.** `bin/wiki-api.sh --facts` sur les quatre :

   | Lot | `number` | `status` | `summary` | `depends_on` | `overlaps` |
   |---|---|---|---|---|---|
   | 35 | 35 | identifié | présent | — | — |
   | 36 | 36 | identifié | présent | Lot 35 — Récupération des fichiers téléversés | Lot 37 — Consultation hors ligne |
   | 37 | 37 | identifié | présent | Lot 35 — Récupération des fichiers téléversés | Lot 36 — Sauvegarde du wiki |
   | 38 | 38 | identifié | présent | Lot 37 — Consultation hors ligne | — |

   Une valeur par relation, aucune relation coupée par le séparateur. Pour
   le reste : `_MDAT`, `_SKEY`, `_INST -> ['Lot#14##']`, et **trois `_ASK`
   par page**. Ces derniers ne figuraient pas dans la liste de la
   consigne ; voir « Écarts et surprises ». Aucune autre annotation.
2. **Wikitexte relu — passe.** Relu par `bin/wiki-get.sh` et comparé au
   fichier envoyé : identique pour les quatre, au saut de ligne final près
   (MediaWiki le retire). Longueurs égales : 1 607, 1 771, 1 228 et 1 131
   caractères.
3. **Liens — passe.** `generator=links` sur les quatre : `Gestion des
   lots`, `Attribut:Work package status`, `Lot 35 — Récupération des
   fichiers téléversés`, `Lot 36 — Sauvegarde du wiki`, `Lot 37 —
   Consultation hors ligne`, aucun `missing`. Les trois titres cités dans
   les relations existent (pageids 604, 605 et 606). `prop=categories` :
   `Catégorie:Lot` seule, pour chacune.
4. **Gestion des lots** (lue par `action=parse`, sans purge) : sections
   « En cours », « Faits », « À venir », « Abandonnés », « Compte ». La
   section « À venir » liste 20 lots, dont les quatre nouveaux en fin de
   liste, chacun avec « identifié » et son objet en une phrase. Section
   « Compte » : « Lots au total : 38 », dont 2 en cours, 16 faits, 20 à
   venir et 0 abandonné.
5. **Compte total — passe.** `action=ask` sur `[[Category:Lot]]` : **34**
   avant les créations, **38** après.
6. **Aucune autre page modifiée — passe.** `list=recentchanges` de
   10:45 UTC à maintenant : les quatre créations (1491 à 1494), précédées
   des révisions 1489 et 1490 de *Lot 22 — Miroir local*, écrites par les
   tâches 14 et 15 du lot 22 avant cette tâche. Rien d'autre.
7. **`.claude/settings.local.json`** : `allow` et `deny` vides, au début et
   à la fin.

## Questions posées ou réponses rendues hors consigne

Aucune.

## Écarts et surprises

- **Trois `_ASK` par page.** La consigne attendait seulement `_MDAT`,
  `_SKEY` et `_INST` en plus des champs. Les trois `_ASK` viennent des
  requêtes intégrées à `Modèle:Lot`. La page du lot 22 en porte aussi
  trois, et la page du lot 24 en portait trois en tâche 12 du lot 22. Ce
  n'est donc pas une annotation parasite du corps, mais la consigne ne la
  prévoyait pas.
- **Les mesures citées dans les pages ne sont pas les miennes.** 79
  fichiers, 392,5 Mo, 7,7 Mo, aucun téléversement depuis le 17 août 2026,
  l'archive de 495 Mo : ces chiffres viennent de la consigne, mesurés le
  10 octobre 2026 hors de cette session. Les 11 200 784 octets de la base
  figurent déjà sur la page du lot 22. Je n'ai rien remesuré.
- **Résumé `[Correctif]` pour des créations de lot.** C'est la règle de
  `CLAUDE.md` pour une écriture hors lot ; les créations de lot passées
  portaient l'étiquette d'un lot en cours. Le libellé est un peu détourné
  de son sens, mais aucun autre n'était prévu.
- **Le point ouvert « images non rapatriées » de la page du lot 22** est
  désormais l'objet du lot 35. La page du lot 22 n'en dit rien, et cette
  tâche interdisait d'y toucher.
