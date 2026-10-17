# Lot 12 — tâche 9 : le mot Rang sur la fiche de lieu, et l'essai négatif consigné

Date : 12 octobre 2026.

Une page modifiée en deux éditions (`Modèle:Lieu`), deux entrées ajoutées aux
Limites connues. **La tâche a été amendée en cours d'exécution par Cyril**,
sur deux points que je lui ai soumis avant d'écrire :
- l'étape 5 est réduite à la colonne Rang, sans le tri ;
- une seconde entrée est ajoutée aux Limites connues, sur ce tri ;
- les deux entrées portent la date du 12 octobre 2026.

Le détail est dans « Écarts et surprises ». Les six vérifications sont
conformes, dans leur forme amendée.

## État du dépôt et règles locales au départ

- `git status` : seul `travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md`
  non suivi, hors compte comme prévu.
- `.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Lectures

`CLAUDE.md` ; `Modèle:Lieu` (rév. 1518, inchangée depuis la tâche 4) ; la fin
des Limites connues : **69 entrées** (rév. 1515), la dernière étant celle du
numéro d'inventaire ajoutée en tâche 3.

## Mesures avant

Par `action=ask` en liste (longueur de `results`, aucune suite de pagination).

| Mesure | Attendu | Mesuré |
|---|---|---|
| Porteurs de `Storage_rank` | 1 | 1 |
| Porteurs de `Service_status` | 1 | 1 |
| Porteurs de `Label_date` | 0 | 0 |
| Physical item | 50 | 50 |
| Lieu | 15 | 15 |

**Rendu des tables avant écriture**, pages purgées, extrait par un script du
scratchpad (`tables-lieu.py`, affiché avant exécution). Sa première version
coupait mal la seconde table ; je l'ai corrigée avant de relever.

Pile 1 :
- « Présents ici » : « 1 item(s) physique(s) rattaché(s) à ce lieu. »
  En-têtes `['', 'Rang', 'Planté le', 'État']`, une ligne :
  `['Caisse en carton — Atelier appartement (CWL-000C)', '', '', '']`.
- « Rangés ici » : « 2 item(s) physique(s) rangé(s) dans un contenant présent
  ici. » En-têtes `['', 'Dans']`, deux lignes :
  `['Fer à souder — Atelier appartement (CWL-0009)', 'Sacoche à outils — Atelier appartement (CWL-000D)']`,
  `['Sacoche à outils — Atelier appartement (CWL-000D)', 'Caisse en carton — Atelier appartement (CWL-000C)']`.

Butte de la tranchée :
- « Présents ici » : « 27 item(s) physique(s) rattaché(s) à ce lieu. »
  En-têtes `['', 'Rang', 'Planté le', 'État']`, **27 lignes de données**. La
  colonne « Rang » portait les positions en mètres : vide pour ECL-0003,
  54,3 pour ECL-0041, vide pour ECL-0042, puis 32,2 ; 41,4 ; 53,1 ; 22,2 ;
  26,8 ; 49,6 ; 37,1 ; 58,3 ; 48,7 ; 82 ; 42,8 ; 0,8 ; 9,7 ; 56,2 ; vide ;
  44,2 ; 68,2 ; vide ; vide ; 45,9 ; 37,5 ; 61 ; 43,2 ; 46,6.
- « Rangés ici » : « 0 item(s) … » et « Aucun item rangé dans un contenant
  présent ici. »

## Prévisualisations

Par `action=parse` en POST, sans sauvegarde (`preview-json.py`, affiché avant
exécution, puis `tables-lieu.py`).

- **Étape 5 telle que donnée** (`?Storage_rank = Rang` avec `sort=Storage_rank`
  et `order=asc`), sur Pile 1 : la table « Rangés ici » **se vide** et affiche
  « Aucun item rangé dans un contenant présent ici. », alors que le compte au
  dessus annonce toujours 2. Aucune classe d'erreur ni d'avertissement. Je ne
  l'ai pas écrite, et j'ai soumis la question à Cyril.
- Étape 4 seule, sur Pile 1 : « Présents ici » porte « Rang » = 1 pour la
  caisse ; « Rangés ici » est inchangée. Sur la Butte : 27 lignes, mêmes
  noms, positions, dates et états qu'avant, colonne « Rang » vide partout.
- Étape 5 réduite à la colonne, sans tri, sur Pile 1 : « Rangés ici » liste
  les deux items, avec « Dans » et « Rang » vide ; sur la Butte, rien ne
  change.

## Pages écrites

| Page | Résumé | Result | Révision |
|---|---|---|---|
| Modèle:Lieu (étape 4) | `[Lot 12][Tâche 9] le rang de rangement apparaît sur la fiche de lieu, la position de plantation est nommée` | Success | 1538 (précédente 1518) |
| Modèle:Lieu (étape 5, réduite) | `[Lot 12][Tâche 9] les items rangés affichent leur rang` | Success | 1539 |
| Limites connues (étape 6) | `[Lot 12][Tâche 9] une valeur hors énumération s'affiche comme valide dans la ligne de la fiche` | Success, par `bin/wiki-append.sh`, 69 → 70 | 1540 (précédente 1515) |
| Limites connues (entrée sur le tri) | `[Lot 12][Tâche 9] un tri sur une propriété écarte les pages qui ne la portent pas` | Success, par `bin/wiki-append.sh`, 70 → 71 | 1541 |

Codes de sortie 0. Session ouverte par `bin/wiki-login.sh` avant la première
écriture, et `intestactions` refait **après** connexion : `Modèle:Lieu` et
les Limites connues libres. Les diffs locaux de `Modèle:Lieu` n'ajoutaient
que les lignes prévues : à l'étape 4, la ligne 76 remplacée par deux lignes ;
à l'étape 5, une ligne ajoutée après la ligne 93. Les deux fichiers d'ajout
ont été contrôlés avant envoi :
- un saut de ligne initial unique ;
- une seule ligne, commençant par `# ` ;
- la date « 12 octobre 2026 », et aucune occurrence de « 11 octobre ».

## Vérifications

File : `bin/wiki-wait-jobs.sh` a annoncé « FILE FIGEE a 6 travaux » ; après la
pause de cinq minutes en arrière-plan, « FILE VIDE ». Purge de Pile 1, de la
Butte de la tranchée, de l'Atelier appartement et des Limites connues avant
relecture, toutes `purged` et `linkupdate`.

1. **Pile 1** (forme amendée de la vérification).
   - « Présents ici » : « 1 item(s) physique(s) rattaché(s) à ce lieu. »
     En-têtes `['', 'Rang', 'Position (m)', 'Planté le', 'État']`, ligne
     `['Caisse en carton — Atelier appartement (CWL-000C)', '1', '', '', '']`.
     La caisse affiche 1 dans Rang.
   - « Rangés ici » : « 2 item(s) physique(s) rangé(s) dans un contenant
     présent ici. » En-têtes `['', 'Dans', 'Rang']`, lignes
     `['Fer à souder — Atelier appartement (CWL-0009)', 'Sacoche à outils — Atelier appartement (CWL-000D)', '']`
     et
     `['Sacoche à outils — Atelier appartement (CWL-000D)', 'Caisse en carton — Atelier appartement (CWL-000C)', '']`.
     La sacoche et le fer sont listés, avec un Rang vide pour les deux, et le
     compte de 2 est cohérent avec les deux lignes.

   Conforme.
2. **Butte de la tranchée, non-régression.** « Présents ici » : « 27 item(s)
   physique(s) rattaché(s) à ce lieu. » En-têtes
   `['', 'Rang', 'Position (m)', 'Planté le', 'État']`. **27 lignes de
   données avant, 27 après.** Comparaison ligne à ligne : mêmes noms, mêmes
   positions (désormais sous « Position (m) »), mêmes dates, mêmes états. La
   colonne « Position (m) » rend exactement la suite relevée avant (vide,
   54,3, vide, 32,2 … 46,6). La colonne « Rang » est vide sur les 27 lignes.
   « Rangés ici » : 0 et texte de repli. Conforme.
3. **Atelier appartement.** « Présents ici » : « 3 item(s) … », en-têtes
   `['', 'Rang', 'Position (m)', 'Planté le', 'État']`, lignes « Machine à
   souder par point — Atelier appartement (CWL-0008) », « Mini banc de
   mesure — Atelier appartement (CWL-000B) », « Multimètre — Atelier
   appartement (CWL-000A) », colonnes vides. « Rangés ici » : « 0 item(s)
   … » et « Aucun item rangé dans un contenant présent ici. » Aucune erreur.
   Conforme.
4. **Limites connues** (forme amendée : +2) :
   - 71 entrées, contre 69 avant ;
   - les deux ajouts sont les deux dernières entrées, dans l'ordre de leurs
     appels ;
   - les 94 lignes d'avant sont identiques et exactement 2 lignes sont
     ajoutées. Le diff marquait aussi la ligne 94, mais seulement à cause du
     saut de ligne final ;
   - un seul bloc `<ol>` au rendu ;
   - faits : `_INST` (Page de suivi), `_MDAT`, `_SKEY`, rien d'autre ;
   - catégories : `Catégorie:Page de suivi` seule, aucune catégorie de
     suivi apparue ;
   - liens : 4, aucun vers une page inexistante ;
   - les deux mentions « 11 octobre 2026 » des entrées antérieures sont
     intactes, et les deux ajouts portent « 12 octobre 2026 ».

   Conforme.
5. **Comptes** : `Storage_rank` 1, `Service_status` 1, `Label_date` 0,
   Physical item 50, Lieu 15. Inchangés.
6. **Erreurs et avertissements** sur les trois rendus : aucune classe
   `error`, `warning`, `smw-highlighter`, `smwttinline` ni `smw-callout`.
   Recoupé par `bin/wiki-warnings.sh` : « Aucun avertissement. » pour Pile 1,
   la Butte de la tranchée et l'Atelier appartement. Conforme.

`Modèle:Lieu` en ligne est identique au fichier envoyé et ne contient aucun
`sort=Storage_rank`.

## Règles locales à la fin

`.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Écarts et surprises

- **Le tri de l'étape 5 vidait la table des items rangés.** Je l'ai constaté
  en prévisualisation, avant toute écriture. Sur cette installation, un
  `sort=` sur une propriété écarte les pages qui ne la portent pas. Or ni la
  sacoche ni le fer n'ont de rang. La table affichait son texte de repli
  pendant que le compte, au-dessus, annonçait 2, sans aucun avertissement.
  J'ai soumis la question à Cyril avant d'écrire l'étape 5. Sa réponse :
  écrire la seule colonne `|?Storage_rank = Rang`, sans `sort` ni `order`, et
  consigner la découverte par une seconde entrée aux Limites connues, dont
  il a fourni le texte.
- **Résumé de l'étape 5 adapté.** Le résumé prévu, « les items rangés
  affichent leur rang et se trient par lui », décrivait le tri retiré. J'ai
  écrit `[Lot 12][Tâche 9] les items rangés affichent leur rang`. La table
  reste triable à la demande par son en-tête, car elle est déjà `sortable`.
- **Date des deux entrées.** Le texte de l'étape 6 portait « Mesuré le
  11 octobre 2026 ». L'essai négatif date du 12 : les écritures de la
  tâche 8 sont datées du 12 octobre à 10:45 UTC, et l'essai les a suivies. Je
  l'ai signalé à Cyril avant d'écrire. Sur sa consigne, les deux entrées de
  cette tâche portent « Mesuré le 12 octobre 2026 », et rien d'autre n'a
  changé dans leurs textes. Les entrées antérieures sur la profondeur des
  chaînes et sur le numéro d'inventaire, mesurées le 11, gardent leur date.
- **L'entrée sur l'énumération affirme un point que je n'ai pas mesuré.**
  Elle se termine par « Sur une page enregistrée, une valeur refusée
  alimente aussi les erreurs de traitement ». L'essai n'a rien enregistré. Ce
  point vient de `CLAUDE.md` (les erreurs de traitement voient les valeurs
  rejetées), pas de la mesure du 12 octobre.
- **La colonne « Rang » de « Présents ici » sera vide pour presque tous les
  lieux** : seule la caisse porte un rang aujourd'hui. Sur la Butte, elle
  occupe une colonne vide en tête de la table des 27 plantations. Ce n'est
  pas une régression, mais un coût d'affichage à juger.
- Mon extracteur de tables coupait d'abord mal la seconde table : il voyait
  un compte de 2 et aucune ligne. Je l'ai corrigé avant le relevé de
  référence. Le relevé cité ci-dessus est celui de la version corrigée.
- La file annoncée figée à 6 travaux était vide après la pause.
