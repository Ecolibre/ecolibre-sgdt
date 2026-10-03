# Correctif hors lot — formulaire par défaut de quatre classes

Exécuté le 3 octobre 2026 par Claude Code, sur consigne « Pour Claude Code. »,
en `[Correctif]` hors lot.

## Résultat

Les six pages ont été écrites en une édition chacune. Après écriture, la
vérification qui tranche rend l'onglet « Modifier avec formulaire » sur les
six pages témoins, dont quatre seulement après purge.

| Page | Révision lue | Nouvelle révision | Horodatage (UTC) |
|---|---|---|---|
| Catégorie:Physical item (113) | 300 | 1384 | 2026-10-03T21:14:50Z |
| Catégorie:Referenced item (112) | 307 | 1385 | 2026-10-03T21:14:51Z |
| Catégorie:Lot (497) | 1337 | 1386 | 2026-10-03T21:14:52Z |
| Catégorie:Lieu (288) | 1082 | 1387 | 2026-10-03T21:14:53Z |
| Récapitulatif technique du Système de Gestion de Données Techniques (27) | 1297 | 1388 | 2026-10-03T21:15:00Z |
| Lot 24 — Adminsys autonome (535) | 1334 | 1389 | 2026-10-03T21:15:02Z |

Les six révisions lues étaient celles qu'indiquait la consigne.

## Relevé de départ

**Étape 0.**
- `git status` : aucune ligne M, A, D ou R. Six lignes `??` dans
  `travaux/` (helianthi-insee, notes-fusion, rangs-correction,
  rangs-separateur, remise-a-niveau-6-septembre, wanted-by-etat), non
  comptées.
- `git log -1 --oneline` : `f06c2b6 [Correctif] CLAUDE.md — retour à la
  racine du dépôt après un cd admis`.
- Règles permanentes, `jq '.permissions.allow | length'
  .claude/settings.local.json` : **0**.
- Aucun des sept fichiers nommés par la consigne n'existait.

**1a. Pages qui déclarent un formulaire par défaut** (`pageswithprop`,
`PFDefaultForm`) : deux, comme attendu.
- Catégorie:Functional item → Functional item
- Catégorie:Organic item → Organic item

**1b. Onglet `ca-formedit` en anonyme** : conforme à l'attendu.

| curid | Page | Classe (vérifiée par `prop=categories`) | Compte |
|---|---|---|---|
| 356 | Ail éléphant — Le Buisson de Cerzat (ECL-0003) | Physical item | 0 |
| 324 | Ail éléphant Armand 2026 | Referenced item | 0 |
| 514 | Lot 1 — Corrections de schéma | Lot | 0 |
| 444 | Appartement de Chilhac | Lieu | 0 |
| 401 | Assembler | Functional item | 1 |
| 109 | Bidon 220L | Organic item | 1 |

**1c. Révisions courantes** : 113 → 300, 112 → 307, 497 → 1337,
288 → 1082, 27 → 1297, 535 → 1334, identiques à l'attendu.

**1d. Faits et catégories des deux pages de texte.**
- Récapitulatif (27) :
  - `_ASK` : 17 requêtes ;
  - `_INST` : SGDT, Page_de_suivi ;
  - `_MDAT` ;
  - `_SKEY`.
  - Catégories : Page de suivi, SGDT.
- Lot 24 (535) :
  - `Work_package_number` 24 ;
  - `Work_package_opening_date` 2026/9/10 ;
  - `Work_package_status` ouvert ;
  - `Work_package_summary` ;
  - `_ASK` : 3 requêtes ;
  - `_INST` : Lot ;
  - `_MDAT` ;
  - `_SKEY`.
  - Catégorie : Lot.

## Modifications

Chaque ancre figurait exactement une fois (`grep -c -F`), et chacune était
suivie d'une ligne vide, laissée en place.

| Page | Ancre | Insertion ou remplacement |
|---|---|---|
| Catégorie:Physical item | `Referenced item → '''Physical item''' → (aucun — terminus de la chaîne)` (ligne 16) | `{{#default_form:Physical item}}` |
| Catégorie:Referenced item | `Organic item → '''Referenced item''' → Physical item` (ligne 13) | `{{#default_form:Referenced item}}` |
| Catégorie:Lot | `L'index des lots est sur [[Gestion des lots]].` (ligne 19) | `{{#default_form:Lot}}` |
| Catégorie:Lieu | `physique à un lieu.` (ligne 63) | `{{#default_form:Lieu}}` |
| Récapitulatif technique | ligne `''Forms allow users…''` (ligne 574) | la règle fournie, sous `<code><nowiki>` |
| Lot 24 — Adminsys autonome | ligne 18, « Homogénéiser les onglets d'édition… » | remplacée par le texte fourni |

Diff avant envoi (`bin/wiki-get.sh | diff - pages/…`) :
- sur les cinq insertions, deux lignes ajoutées (la ligne fournie et une
  ligne vide), rien de retiré ;
- sur le lot 24, une ligne remplacée (`18c18`).

Ces diffs étaient exactement ceux attendus. Les écritures sont parties sans
validation, comme le prévoyait la consigne. Tous les résumés étaient ceux
fournis, et `bin/wiki-login.sh` a été lancé juste avant la première
écriture. Après chaque écriture, `bin/wiki-verify.sh` a rendu
`IDENTIQUE` (sortie 0) sur les six pages.

Copies locales :
- `pages/Categorie_Physical_item_formulaire_par_defaut.txt`
- `pages/Categorie_Referenced_item_formulaire_par_defaut.txt`
- `pages/Categorie_Lot_formulaire_par_defaut.txt`
- `pages/Categorie_Lieu_formulaire_par_defaut.txt`
- `pages/Recapitulatif_regle_formulaire_par_defaut.txt`
- `pages/Lot_24_onglets_edition.txt`

## Vérifications

**1. Celle qui tranche : onglet `ca-formedit` en anonyme sur les six pages.**

| curid | Classe | Juste après écriture | Après purge |
|---|---|---|---|
| 356 | Physical item | 0 | **1** |
| 324 | Referenced item | 0 | **1** |
| 514 | Lot | 0 | **1** |
| 444 | Lieu | 0 | **1** |
| 401 | Functional item | 1 | non purgée |
| 109 | Organic item | 1 | non purgée |

Purge des quatre pages en un appel de `bin/wiki-purge.sh` : `purged:true`
et `linkupdate:true` sur chacune. Une seule nouvelle mesure ensuite,
comme prévu. Résultat : 1 sur les six.

**2. `pageswithprop` `PFDefaultForm`** : six pages, conformes.
- Catégorie:Functional item → Functional item
- Catégorie:Organic item → Organic item
- Catégorie:Referenced item → Referenced item
- Catégorie:Physical item → Physical item
- Catégorie:Lieu → Lieu
- Catégorie:Lot → Lot

Ni le Récapitulatif ni la page du lot 24 n'y figurent : le `nowiki` a
joué son rôle.

**3. Le formulaire déclaré existe** : un seul lien en espace 106 par
catégorie, avec `exists:true`.
- 113 → `Formulaire:Physical item`
- 112 → `Formulaire:Referenced item`
- 497 → `Formulaire:Lot`
- 288 → `Formulaire:Lieu`

**4. Diff calculé par le wiki** (`action=compare`) : conforme sur les six.
- 300→1384, 307→1385, 1337→1386, 1082→1387 : sur chacune, deux lignes
  ajoutées (une vide, puis `{{#default_form:…}}`) après l'ancre, rien de
  retiré.
- 1297→1388 : deux lignes ajoutées après la ligne `''Forms allow…''`,
  rien de retiré.
- 1334→1389 : une ligne remplacée, contexte inchangé.

**5. Faits et catégories des deux pages de texte** : mêmes propriétés et
mêmes catégories qu'au départ.
- Récapitulatif : les mêmes 17 `_ASK`, `_INST` SGDT et Page_de_suivi,
  `_SKEY`. Seul `_MDAT` passe à 2026/10/3 21:15:00. Catégories : Page de
  suivi, SGDT.
- Lot 24 : les mêmes quatre `Work_package_*`, 3 `_ASK`, `_INST` Lot,
  `_SKEY`. Seul `_MDAT` passe à 2026/10/3 21:15:02. Catégorie : Lot.

**6. Règles permanentes** : `jq '.permissions.allow | length'
.claude/settings.local.json` rend **0**, inchangé.

## Confirmations demandées

Je ne vois pas, de mon côté, quelles commandes ont ouvert une fenêtre de
confirmation dans ton terminal. Aucune n'a été refusée. Seules les deux
formes annoncées par la consigne pouvaient en déclencher une. Les voici,
chaque commande employée une fois par page.

- Lecture enregistrée dans `pages/` (six fois, étape « Pour chaque
  page », point 1) :
  `bin/wiki-get.sh "Titre" > pages/<fichier>`
- Lectures enchaînées par `|` :
  - diff avant envoi, six fois :
    `bin/wiki-get.sh "Titre" | diff - pages/<fichier>`
  - relevé 1b, refait aux vérifications 1 et en complément (douze mesures
    plus quatre après purge, plus deux en écart) :
    `curl -s "https://wiki.ecolibre.org/index.php?curid=N" | grep -c 'id="ca-formedit"'`
  - contrôle de la classe des six pages témoins :
    `bin/wiki-api.sh "action=query&pageids=…&prop=categories&clcategories=…" | jq -c …`
  - vérification 2 : `bin/wiki-api.sh "…pageswithprop…" | jq -c '.query.pageswithprop[]'`
  - vérification 3, quatre fois :
    `bin/wiki-api.sh "action=parse&pageid=N&prop=links…" | jq -c '.parse.links[] | select(.ns==106)'`
  - vérification 4, six fois :
    `bin/wiki-api.sh "action=compare&fromrev=…&torev=…" | jq -r '.compare.body'`
  - vérification 5 : `bin/wiki-api.sh "…prop=categories…pageids=27%7C535…" | jq -c …`
  - écarts : `categoryinfo`, puis deux `categorymembers`, chacun suivi de
    `| jq -c …`.

Aucune autre forme n'a été employée :
- aucun `python3` en ligne ;
- rien d'écrit hors du dépôt ;
- les modifications de fichiers sont passées par l'outil d'édition, et ce
  rapport par l'outil d'écriture.

## Écarts et surprises

1. **Les autres pages des quatre classes ne montrent pas toutes l'onglet.**
   La déclaration posée sur la catégorie n'invalide pas aussitôt le cache
   de rendu des pages membres. Les quatre pages témoins ne l'ont affiché
   qu'après purge. Deux pages non purgées, mesurées en complément de la
   même façon après les écritures :
   - 394, *Ail éléphant — Le Buisson de Cerzat (ECL-0041)*, Physical item :
     **1** ;
   - 413, *Atelier appartement*, Lieu : **0**.

   Le rattrapage est donc partiel et sans règle visible : invalidation
   différée par la file de travaux, ou absence de version en cache pour
   certaines pages. Je ne l'ai pas établi. Effectifs des classes
   (`categoryinfo`) :
   - Physical item : 47 pages ;
   - Referenced item : 39 ;
   - Lot : 34 ;
   - Lieu : 13.

   Je n'ai purgé que les quatre pages que la consigne prévoyait.
2. **La page du lot 24 est elle-même dans Catégorie:Lot.** Elle hérite
   donc du formulaire `Lot` par défaut, comme toutes les pages de lot.
   C'est la conséquence voulue, mais c'est aussi la première page touchée
   par le nouveau point ouvert qu'elle porte.
3. Le diff du wiki présente chaque insertion comme « ancre, +ligne vide,
   +ligne fournie, ligne vide d'origine », et `diff` comme un ajout après
   la ligne vide d'origine. Les deux lectures décrivent le même contenu,
   conforme à la règle d'insertion.

## Questions

**A.** Les pages des quatre classes qui n'ont pas encore été rendues à
nouveau peuvent rester sans onglet. Constaté sur 413 ; 394 l'a déjà. Une
purge en masse touche jusqu'à 133 pages et n'est couverte par aucune
consigne. Faut-il la lancer ?
Suggestion : d'abord remesurer 413 dans quelques heures. Si elle rend
toujours 0, purger les membres des quatre catégories par lots, avec
`bin/wiki-purge.sh`, sous une consigne qui le prévoit. Puis consigner le
fait dans *Limites connues* : une déclaration `#default_form` sur une
catégorie ne se propage pas aux pages membres déjà en cache.
