# Lot 9 — Tâche 4 — Rapport d'écriture

**Exécuté le 15 août 2026, session Claude Code, compte `Cywil`.**

## Correction appliquée avant écriture

Voir `lot-9-tache4-proposition.md`, section « Amendement — décision sur le
point ouvert du §3 » : `en réserve` ajouté en tête de `values=` du champ
`Specimen_status`, **avant** la levée du verrou de propagation SMW sur
`Attribut:Specimen_status` (revérifié en direct juste avant écriture,
`browsebysubject` : `_PVAL` toujours limité aux 5 valeurs d'origine).
Décision de Cyril, motif consigné : le blocage touche un job serveur, pas une
décision en attente ; propager ce blocage au formulaire interdirait de
saisir une réserve, ce qui n'est pas acceptable — un avertissement « Has
improper value for » jusqu'à la levée du verrou l'est. Deux `{{#info:}}`
ajoutés (`Specimen_status`, `Propagated_from`), même emplacement que les
`#info` déjà en place sur `Formulaire:Physical item`.

## Écritures sur le wiki

### a. `Formulaire:Physical item/bloc facette végétal`

- **Méthode :** `bin/wiki-put.sh` avec `--createonly`.
- **Résultat API :** `result: Success`, `new: true`, `pageid: 285`,
  `oldrevid: 0`, `newrevid: 526`.
- **Résumé d'édition exact :**
  `[Lot 9][Tâche 4] Création du bloc de facette végétale, niveau physique`
- **Contenu exact écrit :** voir `lot-9-tache4-proposition.md` §4, avec la
  correction de valeurs et les deux `#info` de l'amendement.

### b. `Formulaire:Physical item`

- **Lecture préalable immédiate** (garde-fou n°1) : wikitexte relu en direct
  juste avant écriture, identique au relevé du §2 de la proposition —
  aucune modification hors session depuis le 15 août 2026.
- **Méthode :** `bin/wiki-put.sh` (édition, page existante).
- **Résultat API :** `result: Success`, `pageid: 64`, `oldrevid: 311`,
  `newrevid: 527`.
- **Résumé d'édition exact :**
  `[Lot 9][Tâche 4] Ajout du bloc de facette végétale au formulaire`
- **Diff appliqué :** insertion de la section `== Facettes ==` +
  `{{Formulaire:Physical item/bloc facette végétal}}`, entre
  `{{{end template}}}` et `{{{standard input|free text}}}` — conforme au
  §5 de la proposition.
- **Retour arrière disponible :** wikitexte intégral relevé au §2 de
  `lot-9-tache4-proposition.md` (oldrevid 311).

## Vérification de rendu

`action=parse&page=Formulaire:Physical item&prop=text` juste après
l'écriture (b) : `newrevid: 527` pris en compte par le cache d'analyse
(`Cache expiry` renouvelé), aucune erreur dans le rapport de limites
(`Complications: []`) ni dans le texte rendu. Sortie vide attendue : tout le
contenu du formulaire est sous `<includeonly>`, comme c'était déjà le cas
avant cette tâche — la vue directe de la page ne rend jamais ce bloc, seule
la transclusion via `{{{for template}}}` le fait.

**Portée de cette vérification, à ne pas surestimer :** tout le formulaire
étant sous `<includeonly>`, une sortie vide sans erreur est exactement ce
qu'on obtiendrait aussi si le bloc de facette était cassé — `action=parse`
ne distingue pas les deux cas. Ce test établit seulement l'absence d'erreur
de syntaxe wiki (balises Page Forms bien fermées, template transclus sans
erreur de parsing), pas le bon fonctionnement du bloc en formulaire. Seule
l'ouverture réelle du formulaire (tâche 5, à la main par Cyril) peut établir
que les champs s'affichent et s'enregistrent correctement.

## État des deux écritures vis-à-vis des garde-fous

- Aucune protection native ni sur `Formulaire:Physical item` ni sur la
  sous-page (`prop=info|protection` vérifié juste avant écriture,
  `protection: []` sur les deux).
- Aucune référence Base36 créée.
- `createonly=1` utilisé sur la création (a) ; aucun `bot=1` sur aucun des
  deux appels.

## Suite

Tâche 4 terminée. Tâche 5 (vérification en bac à sable, notamment le widget
`input type=date` sur `Planting_date`, premier usage de ce type sur ce wiki)
non entamée, conformément à la consigne de ne pas enchaîner.
