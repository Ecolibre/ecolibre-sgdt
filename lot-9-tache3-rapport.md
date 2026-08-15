# Lot 9 — Tâche 3 — Rapport d'écriture

**Exécuté le 15 août 2026, session Claude Code, compte `Cywil`.**

## Corrections appliquées avant écriture

Voir `lot-9-tache3-proposition.md`, section « Corrections appliquées avant
écriture » : `#set` de `Depicts_specimen` corrigé (assignation directe +
`+sep=;` immédiatement après, `#arraymap` retiré du `#set` — il n'y était
d'aucune utilité et la position de `+sep=` était de toute façon fautive) ;
séparateur d'affichage `;&#32;` remplacé par `; `. Note de séquencement
ajoutée : ne pas filtrer la requête photos de `Modèle:Physical facet plant`
sur `Category:Photo de plantation` avant la fin de la tâche 8.

## Écriture sur le wiki

- **Page :** `Modèle:Specimen photo`
- **Méthode :** `bin/wiki-put.sh` avec `--createonly`.
- **Résultat API :** `result: Success`, `new: true`, `pageid: 284`,
  `oldrevid: 0`, `newrevid: 522`.
- **Résumé d'édition exact :**
  `[Lot 9][Tâche 3] Création du modèle d'annotation des photos de plantation`
- **Contenu exact écrit :** voir `lot-9-tache3-proposition.md` (wikitexte
  final, avec les 2 corrections appliquées avant écriture).

## Test de multivaluation sur `Utilisateur:Cywil/Bac à sable`

1. **Lecture préalable** de la page (garde-fou n°1) : contenu existant sans
   rapport avec ce test (`Test 4a — Piste 1 (#arraymap comme normaliseur de
   l'espace après délimiteur)`, débris d'un test antérieur du lot 8).
2. **Écriture du test** : `{{Specimen photo|Depicts_specimen=Page A;Page B}}`
   — `result: Success`, `pageid: 110`, `oldrevid: 328`, `newrevid: 523`.
   Résumé : `[Lot 9][Tâche 3] Test à blanc — vérification du multivalué
   Depicts_specimen (nettoyage à suivre)`.
3. **Purge puis `browsebysubject` sans filtre :**
   ```
   Depicts_specimen -> ['Page_A#0##', 'Page_B#0##']
   _INST -> ['Photo_de_plantation#14##']
   _MDAT -> [...]
   _SKEY -> ['Cywil/Bac à sable']
   ```
   **Deux `dataitem` distincts** (`Page_A`, `Page_B`), pas une chaîne unique
   `Page A;Page B` — le multivalué fonctionne. `_INST` confirme en plus la
   catégorisation (`Category:Photo de plantation`), cohérente avec
   `Depicts_specimen` renseignée.
4. **Nettoyage** : contenu antérieur restauré à l'identique. `result:
   Success`, `oldrevid: 523`, `newrevid: 524`. Résumé : `[Lot 9][Tâche 3]
   Nettoyage après test — restauration du contenu antérieur`.

Aucun verrou `smw-change-propagation-protection` rencontré sur ces deux
écritures (page `Utilisateur:`, pas `Attribut:`).

## Suite

Tâche 3 terminée. Tâche 4 (bloc de formulaire, sous-page
`Formulaire:Physical item/bloc facette végétal`) reste à faire.
