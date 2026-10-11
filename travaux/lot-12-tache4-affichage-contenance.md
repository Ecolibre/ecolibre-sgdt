# Lot 12 — tâche 4 sur 5 : brancher l'affichage de la contenance

Date : 11 octobre 2026.

Trois modèles écrits : un créé (`Modèle:Lieu par contenance`), deux modifiés
(`Modèle:Physical item`, `Modèle:Lieu`). Aucune donnée touchée. Toutes les
vérifications demandées sont conformes.

## État du dépôt et règles locales au départ

- `git status` : seul `travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md`
  non suivi, hors compte comme prévu.
- `.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Lectures

`CLAUDE.md` ; sur le wiki : `Lot 12 — Contenants et étiquetage` (rév. 1503),
`Modèle:Physical item` (rév. 1501), `Modèle:Lieu` (rév. 863), `Pile 1`.
`Modèle:Lieu par contenance` absent avant création. Aucune protection native
sur les trois pages (`protection: []`). Les révisions des deux modèles ont été
relues inchangées juste avant leur écriture.

## Mesures avant

Par `action=ask` en liste (longueur de `results`, aucune suite de pagination).

| Mesure | Attendu | Mesuré |
|---|---|---|
| Physical item | 50 | 50 |
| Lieu | 15 | 15 |
| Porteurs de `Located_at` | 45 | 45 |
| Porteurs de `Contained_in` | 2 | 2 |

Fiche du fer à souder, rendu avant écriture : `Se trouve à (Lieu)` suivi
d'aucune valeur (la ligne suivante est directement `Appartient à
(Propriétaire)`). Conforme : vide.

## Prévisualisations

Chaque page a été rendue avant écriture par `action=parse` en POST, sans
sauvegarde ni cookie, via un script du scratchpad (`preview.py`, affiché avant
exécution) qui reprend le bloc `<includeonly>` du nouveau modèle et y
substitue les paramètres réels de la page visée.

- `Modèle:Lieu par contenance`, paramètre = la sacoche (cas du fer) :
  `Pile 1` ; paramètre = la caisse (cas de la sacoche) : `Pile 1` ; paramètre
  vide : rendu vide. Aucune classe d'erreur.
- `Modèle:Physical item` modifié : sur le fer, `Se trouve à (Lieu)` → `Pile 1`,
  rien d'autre de changé ; sur la caisse, `Se trouve à (Lieu)` → `Pile 1` par
  la voie directe. Aucune accolade parasite ; le diff local ne touche qu'une
  ligne, terminée par exactement sept accolades.
- `Modèle:Lieu` modifié : sur Pile 1, `Rangés ici` → 2 items ; sur Atelier
  appartement → 0 et texte de repli. Le diff local n'ajoute que les douze
  lignes prévues, après la ligne 85.

## Pages écrites

| Page | Résumé | Result | Révision |
|---|---|---|---|
| Modèle:Lieu par contenance | `[Lot 12][Tâche 4] modèle de remontée du lieu à travers les contenants` | Success, création (`--createonly`) | 1516 |
| Modèle:Physical item | `[Lot 12][Tâche 4] le lieu se calcule par la contenance quand il n'est pas porté` | Success | 1517 (précédente 1501) |
| Modèle:Lieu | `[Lot 12][Tâche 4] la fiche de lieu fait remonter les items rangés dans ses contenants` | Success | 1518 (précédente 863) |

Codes de sortie 0 pour les trois.

## Vérifications

File : `bin/wiki-wait-jobs.sh` a annoncé « FILE FIGEE a 9 travaux » ; après
une pause de cinq minutes en arrière-plan, « FILE FIGEE a 29 travaux ». Voir
Écarts. Estimation de l'API à 0 en fin de tâche.

Purge par `bin/wiki-purge.sh` avant toute relecture : fer, sacoche, caisse,
Pile 1, Atelier appartement, Entrée à droite, Ail éléphant (ECL-0003), Zone
basse, puis Butte de la tranchée et les trois items cités au point 8 ; tous
`purged` et `linkupdate`.

1. **Fer à souder**, rendu `action=parse` :
   - `Rangé dans (Contenant)` : « Sacoche à outils — Atelier appartement (CWL-000D) » ;
   - `Se trouve à (Lieu)` : « Pile 1 », et c'est un lien : HTML de la cellule
     `<td><a href="/wiki/Pile_1" title="Pile 1">Pile 1</a>` ;
   - `Contient` : « Cet item ne contient aucun sous-élément physique. »
   Conforme.
2. **Sacoche** :
   - `Rangé dans (Contenant)` : « Caisse en carton — Atelier appartement (CWL-000C) » ;
   - `Se trouve à (Lieu)` : « Pile 1 », lien (`<a href="/wiki/Pile_1" …>`) ;
   - `Contient` : table « Réf. » avec « Fer à souder — Atelier appartement (CWL-0009) | CWL-0009 ».
   Conforme.
3. **Caisse** :
   - `Rangé dans (Contenant)` : vide ;
   - `Se trouve à (Lieu)` : « Pile 1 » (voie directe, `Located_at`) ;
   - `Contient` : « Sacoche à outils — Atelier appartement (CWL-000D) | CWL-000D ».
   Conforme.
4. **Pile 1** :
   - `Présents ici` : « 1 item(s) physique(s) rattaché(s) à ce lieu. », table
     Rang / Planté le / État avec la seule ligne « Caisse en carton — Atelier
     appartement (CWL-000C) », colonnes vides ;
   - `Rangés ici` : « 2 item(s) physique(s) rangé(s) dans un contenant présent
     ici. », table « Dans » : « Fer à souder — Atelier appartement (CWL-0009) »
     → « Sacoche à outils — Atelier appartement (CWL-000D) » ; « Sacoche à
     outils — Atelier appartement (CWL-000D) » → « Caisse en carton — Atelier
     appartement (CWL-000C) ».
   Conforme.
5. **Atelier appartement** :
   - `Présents ici` : « 3 item(s) physique(s) rattaché(s) à ce lieu. » :
     « Machine à souder par point — Atelier appartement (CWL-0008) »,
     « Mini banc de mesure — Atelier appartement (CWL-000B) »,
     « Multimètre — Atelier appartement (CWL-000A) » ;
   - `Rangés ici` : « 0 item(s) physique(s) rangé(s) dans un contenant présent
     ici. » puis « Aucun item rangé dans un contenant présent ici. »
   Conforme.
6. **Entrée à droite** :
   - `Lieu parent` : « Atelier appartement » ;
   - `Enfants directs` : « 1 lieu(x) rattaché(s) directement à celui-ci. »,
     table Référence / Nom / Type : « Pile 1 | (vide) | pile » ;
   - `Présents ici` : « 0 item(s) physique(s) rattaché(s) à ce lieu. » puis
     « Aucun item physique rattaché à ce lieu. » ;
   - `Rangés ici` : « 0 item(s) … » puis « Aucun item rangé dans un contenant
     présent ici. »
   Conforme.
7. **Non-régression sur le jardin.** Le rendu d'avant n'avait pas été relevé
   avant l'écriture : il a été reconstitué en rendant l'**ancienne** version
   des modèles (copies des révisions 1501 et 863) avec les paramètres réels de
   chaque page, par la même prévisualisation sans écriture.
   - `Ail éléphant — Le Buisson de Cerzat (ECL-0003)` : `Se trouve à (Lieu)` :
     « Butte de la tranchée », comme avec l'ancien modèle. Toute la partie
     « Physical item » est identique ligne à ligne à l'ancien rendu ; la
     facette végétale (date 2025-11-17, statut « repris », photos) suit.
   - `Zone basse` : `Présents ici` : « 0 item(s) physique(s) rattaché(s) à ce
     lieu. » / « Aucun item physique rattaché à ce lieu. », identique à
     l'ancien rendu ; `Rangés ici` : « 0 … » / « Aucun item rangé dans un
     contenant présent ici. »
   - Complément, `Butte de la tranchée`, lieu réel de l'ail : `Présents ici` :
     « 27 item(s) physique(s) rattaché(s) à ce lieu. », mêmes 27 lignes avec
     mêmes rangs, dates et états que l'ancien rendu ; `Rangés ici` : 0 et
     texte de repli.
   Conforme.
8. **Erreurs et avertissements.** Recherche dans le HTML des classes
   contenant `error`, `warning`, `smw-highlighter`, `smwttinline` ou
   `smw-callout` : aucune sur les neuf rendus (les sept demandés, plus Butte
   de la tranchée et Zone basse comptée à part). Le filtre a été éprouvé sur
   un témoin rendu sans écriture : une expression fautive et une requête à
   cinq sauts y produisent `class="error"`, `class="smw-highlighter"` et
   `class="smwtticon warning"` ; il sait donc détecter ce qu'il cherche.
   Recoupé par `bin/wiki-warnings.sh` sur les neuf pages : « Aucun
   avertissement. » pour chacune.
   Complément : les trois items physiques sans lieu ni contenant (voir
   Écarts) ont été rendus, puisque pour eux la cascade s'exécute avec un
   paramètre vide : `Se trouve à (Lieu)` vide, aucune classe d'erreur.
9. **Comptes après** : 50 Physical item, 15 Lieu, 45 porteurs de
   `Located_at`, 2 porteurs de `Contained_in`. Inchangés.
10. **Faits des trois modèles** par `bin/wiki-api.sh --facts` :
    `Modèle:Lieu par contenance` et `Modèle:Physical item` : aucun fait ;
    `Modèle:Lieu` : `_SKEY` seul. Aucune annotation parasite, mais la mesure
    ne pouvait pas en voir (voir Écarts). Contrôles complémentaires sur
    `Modèle:Lieu par contenance` : `prop=categories` vide ; `prop=links` : un
    seul lien, vers `Limites connues du Système de Gestion de Données
    Techniques`, page existante. Par construction, les `#show` du modèle sont
    dans `<includeonly>` et ne s'exécutent pas sur la page du modèle.

## Règles locales à la fin

`.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Écarts et surprises

- **La vérification 10 ne pouvait rien détecter : l'espace Modèle ne paraît
  pas sémantique sur cette installation.** Aucun des modèles lus ne porte
  `_MDAT`, que reçoit pourtant toute page d'un espace sémantique à
  l'enregistrement, y compris le nouveau modèle juste créé. Témoins :
  `Modèle:Organic item` (en service) ne porte aucun fait ;
  `Modèle:Préfixe site` et `Modèle:Lieu` ne portent que `_SKEY`. Une
  annotation écrite dans la documentation d'un modèle ne serait donc pas
  stockée, et une lecture des faits sur un modèle ne prouve rien. Je n'ai pas
  lu la configuration (`$smwgNamespacesWithSemanticLinks`) : c'est une
  déduction de quatre mesures concordantes, pas un fait lu. Le contrôle qui
  porte pour un modèle est celui des catégories et des liens, fait ici.
- **La file n'était pas figée, elle grossissait** : 9 travaux annoncés après
  les écritures, 29 après la pause de cinq minutes, 0 en fin de tâche.
  Vraisemblablement les mises à jour des pages qui transcluent les deux
  modèles. La consigne ne prévoyait qu'une pause ; j'ai poursuivi sans
  seconde pause, puisque ni les données ni les `#set` ne changeaient et que
  chaque page a été purgée avant sa relecture. Le libellé « FILE FIGEE » de
  `bin/wiki-wait-jobs.sh` s'est trompé une fois de plus, sur une file qui
  changeait de taille entre deux appels.
- **Le rendu d'avant de la vérification 7 n'avait pas été relevé avant
  l'écriture**, faute d'être demandé à l'étape 3. Il a été reconstitué en
  rendant les anciennes révisions des modèles sur les données actuelles,
  méthode valable puisque les données n'ont pas changé. Une consigne qui
  demande « comme avant » gagnerait à demander ce relevé dans les mesures
  avant.
- **Zone basse ne porte aucun item physique**, donc « Présents ici
  inchangée » y était vrai à 0 contre 0 et ne prouvait presque rien. J'ai
  ajouté Butte de la tranchée, lieu de l'ail, qui en porte 27 : identique.
- **Trois items physiques ne portent ni lieu ni contenant** : `Batterie de
  récupération trotinette 1`, `Bidon 220L Bleu 1`, `Bidon 220L Bleu 2`. Leurs
  titres ne suivent pas la convention « — lieu (SITE-nnnn) » des autres
  exemplaires, et leur ligne `Appartient à (Propriétaire)` est vide. Rien n'y
  a été touché. Ce sont eux qu'une page de contrôle de la tâche 5 trouverait
  sans lieu calculable.
- La table « Présents ici » d'une fiche de lieu porte toujours les colonnes
  Rang / Planté le / État, vides pour la caisse sur Pile 1 (déjà signalé en
  tâche 3, hors du périmètre de cette tâche).
- `Modèle:Lieu par contenance` n'appelle pas `{{Documentation}}`, à la
  différence de `Modèle:Physical item` et `Modèle:Lieu` : sa documentation est
  écrite directement dans `<noinclude>`, comme le donnait la consigne.
- Le témoin d'erreur rendu en vérification 8 confirme au passage l'entrée des
  Limites connues sur la profondeur : une requête `format=count` à cinq sauts
  rend « 0 » suivi de l'avertissement de restriction. Sans l'avertissement
  visible, ce 0 passerait pour un résultat.
