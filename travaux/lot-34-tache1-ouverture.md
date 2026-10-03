# Lot 34 — Tâche 1 : création de la page du lot

3 octobre 2026, Claude Code (exécuteur).

## Résultat

La page **Lot 34 — Consignes permanentes et aiguillage des messages** est créée
(pageid 561, révision 1369, 2026-10-03T01:45:17Z, soit 03:45 heure de Paris).
Le texte est celui de la consigne, mot pour mot. Une seule écriture sur le wiki,
plus une purge de *Gestion des lots*.

## Ce qui a été fait

1. **État initial.**
   - `git status` : propre, à part les six fichiers non suivis déjà connus dans
     `travaux/`.
   - `list=allpages&apprefix=Lot%2034` : liste vide, aucune page ne commence par
     « Lot 34 ».
   - Contrôles ajoutés avant écriture, en lecture seule :
     - `Modèle:Lot` porte bien le paramètre `Work_package_revises` (ligne 16,
       `#set`), et sa requête inverse « lots qui le révisent » (ligne 75).
     - `prop=info&inprop=protection` sur le titre : `missing`, `protection: []`.
2. **Copie locale.** `pages/Lot_34_creation.txt`, écrite avec l'outil
   d'écriture de fichier. Elle reprend le texte compris entre DÉBUT et FIN,
   sans ces deux lignes.
3. **Écriture.** `bin/wiki-login.sh` (« Success Cywil »), puis
   `bin/wiki-put.sh … --createonly` avec le résumé
   `[Lot 34][Tâche 1] Création Lot 34 — Consignes permanentes et aiguillage des messages`.
   Réponse : `new: true`, `result: Success`, code de sortie 0.

## Vérifications

### a. Faits stockés — `bin/wiki-api.sh --facts` (le contrôle qui tranche)

| Propriété | Valeur stockée | Attendu |
|---|---|---|
| `Work_package_number` | `34` | 34 ✔ |
| `Work_package_status` | `ouvert` | ouvert ✔ |
| `Work_package_summary` | la phrase du texte fourni | identique ✔ (comparaison stricte par python entre le `dataitem` brut de `browsebysubject` et la ligne du fichier local : 225 caractères de part et d'autre, chaînes égales) |
| `Work_package_opening_date` | `1/2026/10/3` | 2026-10-03 ✔ (sérialisation interne SMW d'une date grégorienne) |
| `Work_package_revises` | `Lot_27_—_Conduite_du_projet#0##` | Lot 27 — Conduite du projet ✔ |

Autres clés : `_ASK` (trois sous-objets de requête), `_INST` (`Lot`), `_MDAT`,
`_SKEY`. Ce sont toutes des propriétés spéciales ou des sous-objets de requête.
Aucune autre propriété n'est stockée.

### b. Catégories — `prop=categories&clshow=` (catégories cachées comprises)

`Catégorie:Lot` seulement. Aucune catégorie de suivi : ni lien brisé, ni lien
de fichier brisé.

### c. Affichage par requête

- **Lot 27 — Conduite du projet** (`action=parse`) : le lot 34 y apparaît dès
  la première lecture. Pas de purge.
- **Gestion des lots** (`action=parse`) : le lot 34 est **absent** à la
  première lecture. Purge par `bin/wiki-purge.sh "Gestion des lots"`
  (`purged: true`, `linkupdate: true`). À la relecture, il figure dans la
  section « En cours », avec le lot 24 : n° 34, objet complet, « Ouvert le
  3 octobre 2026 ».

### Contrôles complémentaires

- **Texte relu en ligne** (`bin/wiki-get.sh`) et comparé à la copie locale par
  `diff` : identique.
- **Liens sortants** (`prop=links`) : `Gestion des lots` et
  `Lot 27 — Conduite du projet`, les deux liens du texte. Aucun lien cassé par
  un pli.

## Commits

- `eda3d66` — `[Lot 34][Tâche 1] Copie locale — création de la page du lot 34`
  (1 fichier, 67 insertions).
- Le présent rapport, dans un second commit.

## Écarts et surprises

- **Gestion des lots n'affichait pas le lot 34 avant purge.** C'est le piège du
  cache de rendu, déjà connu depuis le lot 13 (tâche 3d) : une page construite
  par requête reste figée jusqu'à la purge. Les faits, eux, étaient stockés dès
  l'écriture, puisque la page du lot 27 les rendait sans purge. L'étape 4c de la
  consigne prévoyait ce cas. Je n'ai purgé que la page en défaut, pas celle du
  lot 27, qui affichait déjà le lot.
- **Date d'ouverture et fuseau.** L'écriture a eu lieu le 3 octobre à 01:45 UTC,
  soit 03:45 à Paris. La date d'ouverture, 2026-10-03, est la même dans les
  deux fuseaux. Pas d'écart, mais une écriture faite entre minuit et 2 h, heure
  de Paris, porterait la veille en UTC.
- **Format de date dans `--facts`.** `1/2026/10/3` est la sérialisation interne
  de SMW (calendrier grégorien / année / mois / jour), pas une valeur fausse.
  Ce n'est pas le format `2026-10-03` que cite la consigne : la lecture brute
  n'en est pas une preuve littérale.
- **Contrôles ajoutés à la consigne.** Paramètre du modèle, protection du
  titre, relecture du texte par `diff`, liens sortants. La consigne ne les
  demandait pas. Tous en lecture, tous concluants.
- **Demandes de confirmation.** La consigne ne disait pas quelle réponse donner
  aux demandes de confirmation. C'est précisément l'un des objets du lot 34. Je
  ne sais pas quelles réponses ont été données. Les commandes les plus
  susceptibles d'en avoir déclenché sont les suivantes :
  - le `diff` avec substitution de processus `<(…)` ;
  - les deux `python3 -c` passés en tube ;
  - l'enchaînement `bin/wiki-login.sh && bin/wiki-put.sh …` ;
  - les `git add && git commit`.

  À vérifier dans `.claude/settings.local.json` : si une réponse « toujours
  autoriser » a été donnée, de nouvelles règles allow y figurent.
- **Fichier intermédiaire hors dépôt.** La relecture du texte en ligne a été
  enregistrée dans le scratchpad de la session (`lot34_lu.txt`, sous
  `/tmp/claude-1000/…`), et non dans le dépôt. Il disparaîtra avec `/tmp`.
