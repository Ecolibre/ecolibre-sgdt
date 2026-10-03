# Lot 21, tâche 3 — inscription des résultats de la mesure

Exécuté le 4 octobre 2026 (heure de Paris) par Claude Code, sur consigne
« Pour Claude Code. ».

## Résultat

- Trois entrées ont été ajoutées à la fin des *Limites connues*, n° 55, 56
  et 57, par `bin/wiki-append.sh`.
- La page *Lot 21 — Grandeurs et unités* a été remplacée par le texte
  fourni, par `bin/wiki-put.sh`.

Aucune autre page n'a été touchée. Les douze pages d'essai de la tâche 2
restent en place.

## Départ

- `git status` : aucune ligne modifiée, ajoutée, supprimée ou renommée.
  Six fichiers non suivis dans `travaux/`, qui ne comptent pas.
- Les cinq fichiers nommés n'existaient pas.
- Révisions courantes, conformes à l'attendu :
  - *Limites connues du Système de Gestion de Données Techniques*
    (pageid 144) : **1390** ;
  - *Lot 21 — Grandeurs et unités* (pageid 532) : **1391**.
- `bin/wiki-login.sh` : `Success Cywil`.

## Les trois ajouts

Chaque fichier d'ajout contient une ligne vide, puis la ligne « # »
fournie.

| Entrée | Fichier | Pré-contrôle | Révision | Horodatage (UTC) | Post-contrôle | Rendu |
|---|---|---|---|---|---|---|
| 55 | `pages/Limites_connues_ajout_lot21_55.txt` | **54** entrées avant ajout, la liste finit la page | 1390 → **1411** | 2026-10-03T23:49:50Z | 54 → 55, dernière entrée | 1 bloc `<ol>` |
| 56 | `pages/Limites_connues_ajout_lot21_56.txt` | **55** entrées avant ajout | 1411 → **1412** | 2026-10-03T23:49:58Z | 55 → 56, dernière entrée | 1 bloc `<ol>` |
| 57 | `pages/Limites_connues_ajout_lot21_57.txt` | **56** entrées avant ajout | 1412 → **1413** | 2026-10-03T23:50:07Z | 56 → 57, dernière entrée | 1 bloc `<ol>` |

Le script n'a affiché aucun avertissement.

## La page du lot

- Fichier : `pages/Lot_21_mesure.txt`.
- Résumé : `[Lot 21][Tâche 3] Résultats de la mesure — arbitrages, points
  ouverts, point de départ`.
- Révision : 1391 → **1414**, le 2026-10-03 à 23:50:45Z.

## Vérifications

**a. Celle qui tranche : faits stockés du lot 21.** Tout est conforme.
- `Work_package_status` : `ouvert`.
- `Work_package_revises` : trois valeurs, lots 8, 9 et 10.
- `Work_package_closure_report` : une valeur,
  `https://github.com/Ecolibre/ecolibre-sgdt/blob/90b0a66d221e2a791ab1194136048f786983c630/travaux/lot-21-tache2-mesure.md`.
- `Work_package_overlaps` : inchangé, lots 12, 26 et 31.
- Inchangés aussi : `Work_package_number` 21,
  `Work_package_opening_date` 1/2026/10/2, `Work_package_summary`.
- Faits techniques : `_ASK` (3), `_INST` (Lot), `_MDAT`, `_SKEY`.
- **Aucun fait `_ERRC`.**

**b. Contenu.** `bin/wiki-verify.sh` rend `IDENTIQUE : Lot 21 — Grandeurs
et unités`, sortie 0. Conforme.

**c. Liens et catégories du lot 21.** 12 liens, tous `"exists": true`.
Une seule catégorie, `Lot`. Conforme. Les 12 liens :
- lots 7, 8, 9, 10, 12, 19, 26, 28 et 31 ;
- *Gestion des lots* ;
- *Limites connues…* ;
- `Attribut:Work package status`, posé par le modèle.

**d. Limites connues.** Conforme.
- `--facts` : `_INST` (Page_de_suivi), `_MDAT` (2026/10/3 23:50:07) et
  `_SKEY`, rien d'autre.
- `action=parse&prop=categories` : une seule catégorie, `Page_de_suivi`.

## Écarts et surprises

1. **Une phrase de l'arbitrage sur le type Quantity va au-delà de la
   mesure.** La page écrit : « La valeur est stockée dans l'unité
   principale et se relit exactement dans l'unité de saisie : 800 L/h,
   stocké en mètres cubes par seconde, se relit 800 L/h. »
   Le relevé 8d de la tâche 2 montre autre chose. Sans unité demandée
   (colonne `?Test lot21 débit` de Q1), l'affichage se fait dans la
   **première unité d'affichage déclarée** (`Display units`, ici L/h), et
   non dans l'unité de saisie :
   - le sous-objet `mesure`, saisi `0,000215 m³/s`, s'affiche `774 L/h` ;
   - `spec`, saisi `0,0216 ML/j` pour le débit max, s'affiche `900 L/h` en
     colonne 1 de Q10.

   L'exemple de 800 L/h est exact, mais seulement parce que L/h est aussi
   la première unité d'affichage. Le texte a été écrit tel que fourni :
   l'écart n'apparaît dans aucune des vérifications de l'étape 5, et je ne
   l'ai relevé qu'après écriture, en relisant le texte contre la mesure.
   Voir la question A.
2. **La révision 1410 n'est pas de cette tâche.** Elle a été faite sur le
   wiki entre la fin de la tâche 2 (révision 1409) et le premier ajout
   (révision 1411). Je ne l'ai pas examinée.
3. **Le lien « @@@@ » de l'entrée 52** n'a pas été touché, comme demandé.
   Il ne fait apparaître aucune catégorie de suivi : la page ne porte que
   `Page_de_suivi`.
4. Le permalien de l'amendement 1 du lot 8, cité par le nouveau texte,
   vise `c73d88a5931d1ceec88964029c97f6774f21ce6b`. C'est bien le dernier
   commit de `travaux/lot-8-amendement-1.md` (vérifié par `git log -1`
   avant l'écriture).

## Échanges avec Cyril hors consigne

Aucun.

## Questions

**A.** La page du lot 21 affirme qu'une quantité « se relit exactement
dans l'unité de saisie ». Or, d'après la mesure de la tâche 2,
l'affichage par défaut se fait dans la première unité d'affichage
déclarée, quelle que soit l'unité de saisie. Seule la demande explicite
d'une unité (`#m³/s`, `#ML/j`) affiche une autre unité. Faut-il corriger
la phrase ?
Suggestion : la remplacer, dans une prochaine écriture de la page, par
« La valeur est stockée dans l'unité principale et se relit sans perte
dans toute unité déclarée : par défaut dans la première unité
d'affichage, sur demande dans n'importe quelle autre ». Il faudrait aussi
reprendre l'exemple : `0,000215 m³/s` saisi se relit 774 L/h.
