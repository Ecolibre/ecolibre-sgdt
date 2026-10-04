# Correctif du 5 octobre 2026 — avertissement de l'audit de conception, limite du tri alphabétique

Consigne hors lot : les deux écritures portent `[Correctif]`. Écritures horodatées par le wiki le 4 octobre 2026 à 22:18-22:19 (UTC) ; il était le 5 octobre en heure locale.

## Étape 0 — état du dépôt

`git status` : propre, aucune ligne. `.claude/settings.local.json` au début et à la fin : `allow` et `deny` vides, aucune règle.

## Étape 1 — Modèle:Item numbering audit

- Texte de départ conforme : deux lignes, le titre en gras puis l'appel `findGaps` sur `Item_ref` (revid 239).
- Écriture du contenu complet : revid 239 → **1425**, résumé `[Correctif] signaler qu'un trou de la liste peut être une référence brûlée`. Modification d'un modèle en service validée par Cyril (règle 6), selon la consigne.

## Étape 2 — Limites connues du Système de Gestion de Données Techniques

- Mon comptage avant écriture : **57** lignes commençant par `# ` (revid 1416).
- Entrée collation `uca-fr` retrouvée en **n° 41** (« La contrainte de collation binaire est levée : le tri du wiki est linguistique »), seule entrée mentionnant `uca`. La référence « entrée 41 » du texte est donc gardée telle quelle.
- Ajout par `bin/wiki-append.sh` d'une entrée unique (fichier : un saut de ligne, puis une seule ligne `# `) : revid 1416 → **1426**, résumé `[Correctif] consigner le tri alphabétique des banques Base 36 et la règle de saisie`. Pré-contrôle du script : 57 entrées, la liste finit la page ; post-contrôle : 57 → 58, l'ajout est la dernière entrée ; rendu : un seul bloc `<ol>`.

## Vérifications

1. **Administration SGDT** (rendu après purge) : sous l'audit de la banque de conception, la liste montre **000J seul**, suivie de la nouvelle phrase en italique. Liste ECL : **105** rangs, 000A … 0043, identique à hier. Liste CWL : **7** rangs, 0001 … 0007.
2. **Limites connues** (rendu) : **un seul** bloc `<ol>` sur la page ; la dernière entrée est celle qui vient d'être ajoutée.
3. **Limites connues** (wikitexte relu) : **58** lignes `# ` ; la 41e est toujours celle de la collation, la 58e est la nouvelle.

Contrôles complémentaires sur les Limites connues : `browsebysubject` ne montre que `_INST` (Page de suivi), `_MDAT` et `_SKEY`, donc les deux exemples `<nowiki>` n'ont créé aucune annotation ; aucun lien vers une page inexistante (`prop=links`, aucun `exists: false`).

## Écarts et surprises

- Aucun écart avec les textes de départ, aucun comptage divergent, aucune demande de confirmation hors cadre, aucune question posée.
- J'ai purgé Administration SGDT avant de lire son rendu, sans attendre de voir une liste vide ou tronquée. La purge a été faite par précaution, la consigne ne la demandait pas.
