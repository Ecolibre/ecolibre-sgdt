# Lot 22 — Tâche 12 — Rangement des trouvailles de la clôture

Exécuteur : Claude Code, 10 octobre 2026 (date relevée par `date` :
2026-10-10 01:24 CEST). Quatre pages du wiki écrites, aucune autre. Le lot
reste « ouvert ».

**Résultat : les quatre écritures sont faites et les sept contrôles
passent.** L'entrée 67 des *Limites connues* a été reformulée sur un point
de fait (Debian 12 et non Debian 11), avec l'accord de Cyril et les deux
apports de l'architecte.

## Révisions

| Page | Avant | Après |
|---|---|---|
| Lot 22 — Miroir local | 1483 | 1485 |
| Limites connues du Système de Gestion de Données Techniques | 1481 | 1486 |
| Notes en attente de rangement | 1457 | 1487 |
| Lot 24 — Adminsys autonome | 1389 | 1488 |

Les révisions de départ attendues par la consigne (1483 et 1481) ont été
vérifiées avant toute écriture.

## Étape 1 — État du dépôt

`git status --porcelain` : vide. `.claude/settings.local.json` : `allow` et
`deny` vides. Dernier commit, poussé :
`123d68cb2d8abaf44aa8dd1f2b38705e9d35e63b`.

**Titres lus dans `Catégorie:Lot`** : « Lot 22 — Miroir local » et « Lot 24
— Adminsys autonome ».

## Étape 2 — Le permalien

https://github.com/Ecolibre/ecolibre-sgdt/blob/123d68cb2d8abaf44aa8dd1f2b38705e9d35e63b/miroir/ecarts-avec-la-production.md

Construit sur `123d68c`, le commit de la tâche 11. Il rend **200** avant les
écritures, et 200 après.

## Étape 3 — Page du lot 22

**Ordre des champs**, relevé dans `Modèle:Lot` : `number`, `status`,
`summary`, `opening_date`, `delivery_date`, `closure_date`,
`closure_report`, `depends_on`, `overlaps`, `revises`, `produces`. La page
ne portait que les quatre premiers, donc `produces` vient juste après
`opening_date`. Le modèle déclare `+sep=,` sur ce champ.

**Diff complet entre la révision 1483 et la 1485** :

```
5a6
> |Work_package_produces=Miroir local du wiki
33a35,42
> == Ce qui est écarté, et pourquoi ==
>
> '''Reconstruire le miroir depuis l'image officielle de MediaWiki, plutôt que copier le cœur de production.''' 18 des 40 extensions du disque ne déclarent aucune version. Écarté le 9 octobre 2026.
>
> '''Mettre le compte qui pilote Docker dans le groupe docker.''' Cela équivaut à lui donner la racine de la machine. Écarté le 9 octobre 2026.
>
> Le raisonnement détaillé est sur la page [[Miroir local du wiki]].
>
54c63
< Vingt et un modules PHP de la production manquent au miroir, aucun n'étant atteint par la configuration d'Ecolibre ; un essai qui en emploierait un demande de l'ajouter d'abord.
---
> Vingt et un modules PHP de la production manquent au miroir, aucun n'étant atteint par la configuration d'Ecolibre ; un essai qui en emploierait un demande de l'ajouter d'abord. La liste à jour est dans le [https://github.com/Ecolibre/ecolibre-sgdt/blob/123d68cb2d8abaf44aa8dd1f2b38705e9d35e63b/miroir/ecarts-avec-la-production.md fichier des écarts avec la production].
56c65
< == Pages produites ==
---
> == Fichiers produits ==
```

Ce diff correspond aux quatre modifications demandées :

- **a)** ajout du champ `Work_package_produces` ;
- **c)** nouvelle section « Ce qui est écarté, et pourquoi » ;
- **d)** renvoi vers la liste des écarts dans « Points ouverts » ;
- **b)** « Pages produites » renommée « Fichiers produits ».

Rien d'autre n'a changé : ni le statut ni les dates.

## Étape 4 — Limites connues, entrée 67

**Forme et numéro**, relevés dans le wikitexte de la révision 1481 :
66 lignes `# `, donc l'entrée suivante est la **67**. Une ligne par entrée :
affirmation en gras, mesure datée, règle en gras, code entre `<code>`.

**Ajout** par `bin/wiki-append.sh`. Le script a confirmé lui-même :
« 66 → 67 entrées », la dernière est bien l'ajout, une seule liste `<ol>` au
rendu.

**Reformulation.** La consigne faisait dire « PHP 7.4 sur Debian 11 » du
socle de production. C'est contredit par la mesure : la production rend
`dbversion` « 10.11.18-MariaDB-0+deb12u1-log », un paquet Debian 12. Le
point A a été posé avant toute écriture. Cyril a validé la reformulation et
transmis deux apports de l'architecte :

- la fin de vie de PHP 7.4, le 28 novembre 2022 ;
- la séparation, écrite comme telle, entre ce qui est mesuré et ce qui est
  déduit. Seules les deux valeurs de `siteinfo` sont présentées comme mesure.

Résumé de modification employé, celui fourni par Cyril : « [Lot 22][Tâche
12] Limites connues : le socle PHP 7.4 de la production est en fin de vie
depuis novembre 2022, et son image Docker a quitté les miroirs apt ».

**Texte intégral ajouté**, une seule ligne :

```
# '''Le socle PHP 7.4 de la production est en fin de vie depuis le 28 novembre 2022, et son image Docker officielle, <code>php:7.4-apache</code>, ne se construit plus sans basculer ses sources apt vers <code>archive.debian.org</code>.''' Depuis sa fin de vie, PHP 7.4 ne reçoit plus aucun correctif de sécurité : c'est ce qui donne son poids à cette entrée. Constaté le 9 octobre 2026 en montant le miroir local du lot 22 : l'image <code>php:7.4-apache</code>, bâtie sur Debian 11, échouait à la construction sur des paquets introuvables (erreurs 404 sur <code>deb.debian.org</code>), Debian 11 ayant quitté les miroirs courants ; elle se construisait une fois ses sources basculées vers <code>archive.debian.org</code>. '''Mesuré''' par <code>siteinfo</code> sur la production le 9 octobre 2026 : <code>phpversion</code> 7.4.33, <code>dbversion</code> 10.11.18-MariaDB-0+deb12u1-log. '''Déduit, non mesuré''' : la base venant du paquet Debian 12, le système de production est très probablement Debian 12, et son PHP 7.4 ne vient donc pas des dépôts Debian, qui fournissent PHP 8.2 en Debian 12 ; seul l'adminsys peut dire d'où il vient. '''Règle : toute reconstruction d'une image sur ce socle demande le basculement vers <code>archive.debian.org</code>, et toute montée de version du socle demande son propre lot.'''
```

## Étape 5 — Notes en attente de rangement

**Forme**, relevée sur la page :

- titre de niveau 2 ;
- ligne d'auteur et de date en italique ;
- corps du texte.

La page précise que « les notes les plus récentes sont en haut » : la note a
donc été placée avant « Couche sociale au-dessus du wiki ».

**Ligne d'auteur.** C'est le point B, tranché par Cyril : « Cyril, le
10/10/26 ». L'origine de la trouvaille est dite dans le corps de la note.

**Texte intégral ajouté** (9 lignes, aucune retirée) :

```
== Ce que les refus de l'exécuteur protègent réellement ==
''Cyril, le 10/10/26''

Trouvaille de la clôture du lot 22 : l'appartenance du compte au groupe lxd a été mesurée par Claude Code en tâche 5, la porosité des refus de lecture a été relevée par l'architecte.

Les refus inscrits dans les permissions de l'exécuteur protègent de l'accident, pas d'un accès délibéré. Mesuré le 9 octobre 2026 : le compte qui fait tourner Claude Code appartient au groupe lxd, qui donne un accès équivalent à la racine de la machine, exactement comme le groupe docker qu'on s'est refusé à lui donner. Et les commandes cat et python3, qui lui sont autorisées depuis août 2026, lisent n'importe quel fichier, y compris ceux dont la lecture lui est nommément refusée.

'''À ranger''' : soit en revoyant la composition des groupes du compte, soit en écrivant ce que ces refus protègent réellement, pour ne plus leur prêter une étanchéité qu'ils n'ont pas.
```

## Étape 6 — Page du lot 24

Une phrase ajoutée en fin de « Dépendances », section qui énonce déjà la
règle de vérification préalable sur le miroir. Elle forme un paragraphe à
part, placé avant le séparateur.

**Texte intégral ajouté** :

```
Le miroir local existe depuis le 9 octobre 2026 : il est vérifié, et sa marche à suivre est écrite ; voir [[Miroir local du wiki]].
```

## Étape 7 — Vérifications

1. **QUI TRANCHE — passe.** Faits de la page du lot 22 :
   - avant : `Work_package_number` 22, `opening_date` `1/2026/10/9`,
     `status` `ouvert`, `summary`, trois `_ASK`, `_INST` Lot, `_MDAT`
     `1/2026/10/9/23/0/28/0`, `_SKEY` ;
   - après : les mêmes, plus **`Work_package_produces ->
     ['Miroir_local_du_wiki#0##']`**, une seule valeur. `_MDAT` passe à
     `1/2026/10/9/23/24/43/0`.

   Les hachages des trois `_ASK` sont identiques avant et après. Aucune autre
   annotation nouvelle.
2. **Wikitexte relu — passe.**
   - Lot 22, Lot 24 et Notes, relus par `bin/wiki-get.sh` : identiques aux
     fichiers envoyés (`diff -q`).
   - Limites connues : 67 lignes `# ` contre 66 avant. Les 91 lignes de la
     révision 1481 se retrouvent identiques en tête des 92 lignes de la 1486,
     donc les 66 entrées précédentes sont inchangées. La 92e ligne, dernière
     de la page, est égale à l'entrée du fichier d'ajout : 1 318 caractères
     de chaque côté. Comparaison faite ligne à ligne, fins de ligne exclues.
3. **Catégories inchangées** :
   - Lot 22 et Lot 24 : `Catégorie:Lot` ;
   - Notes et Limites connues : `Catégorie:Page de suivi`.

   **Liens** : aucun `missing` sur l'ensemble des liens des quatre pages
   (`generator=links`, compte 0). Lot 22 et Lot 24 lient désormais
   « Miroir local du wiki », qui existe.
4. **Faits des trois autres pages** : avant et après, seule `_MDAT` change.
   - Lot 24 : `Work_package_*`, trois `_ASK` aux mêmes hachages, `_INST`
     Lot, `_SKEY` ;
   - Notes et Limites connues : `_INST` Page de suivi et `_SKEY`.
5. **Permalien** : 200 avant et après les écritures.
6. **Aucune autre page modifiée.** `list=recentchanges` depuis 22 h 25 UTC
   rend les quatre écritures de cette tâche (révisions 1485 à 1488), puis
   les écritures 1482 à 1484 des tâches 9 à 11. Aucune autre.
7. **`.claude/settings.local.json`** : vide au début et à la fin.

## Questions posées ou réponses rendues hors consigne

- **A. Debian 11 ou Debian 12.** La consigne faisait écrire « PHP 7.4 sur
  Debian 11 » du socle de production. Or la mesure de la tâche 5 montre un
  MariaDB empaqueté pour Debian 12. Posé avant toute écriture.
  - **Réponse de Cyril :** reformuler. L'architecte y ajoute la fin de vie de
    PHP 7.4 et la séparation entre mesure et déduction. Seules les deux
    valeurs de `siteinfo` sont présentées comme mesure, et le résumé de
    modification est fourni.
- **B. Ligne d'auteur de la note.**
  - **Réponse de Cyril :** « Cyril, le 10/10/26 ». La ligne d'auteur nomme qui
    dépose, et l'origine se dit dans le corps de la note, comme pour la note
    du 5 octobre.
- **Date.** Cyril signale qu'à 1 h 22 à Paris on est le 10 octobre : les
  rapports des tâches 9 à 11, datés du 9, sont faux sur ce point. Désormais,
  la date se relève par `date`. Les mesures gardent leur date réelle (le 9
  octobre pour tout ce qui a été mesuré avant minuit).
- **Annonce d'une tâche 13** pour un douzième écart, PHP en `fpm-fcgi` en
  production contre `apache2handler` sur le miroir. Rien n'a été fait à ce
  sujet, et le miroir n'a pas été touché.

## Écarts et surprises

- **Une comparaison de contrôle a d'abord été faussée par un `cd`.** J'ai
  lancé un `cd` vers le scratchpad dans une commande séparée. Le shell est
  revenu à la racine du dépôt, et les comparaisons suivantes ont porté sur
  des fichiers inexistants. L'une d'elles a même affiché
  « derniere-identique » en comparant deux entrées vides. Rien n'a été
  conclu de cette sortie : les comparaisons ont été refaites avec des
  chemins complets. Mais c'est exactement le cas de la règle 8 ajoutée en
  tâche 11 : un contrôle qui annonce un succès sans rien avoir comparé.
  `CLAUDE.md` déconseillait déjà ce `cd`.
- **Une seconde comparaison par empreinte `md5sum` a donné un faux
  désaccord.** `sed -n` rend la dernière ligne d'un fichier sans saut de
  ligne final, ce qui change l'empreinte sans que le contenu diffère. La
  comparaison faisant foi est celle ligne à ligne, fins de ligne exclues.
- **Dates des rapports des tâches 9, 10 et 11.** Ils sont datés du 9
  octobre alors que leurs écritures ont eu lieu après minuit, heure de Paris
  (révisions 1482 à 1484, entre 22 h 55 et 23 h 12 UTC, soit entre 0 h 55 et
  1 h 12 à Paris le 10). Je ne les ai pas corrigés : ce sont des récits datés,
  et la consigne ne le demandait pas. Le signaler suffit à qui les relira.
- **La section « Ce qui est écarté, et pourquoi » double en partie deux
  éléments de « Ce qui est déjà tranché ».** Ces éléments disent la décision
  positive : le cœur copié, Docker sans privilèges. La nouvelle section dit
  la route écartée. Le recouvrement est voulu par la consigne ; je le note
  pour qui relira la page.
