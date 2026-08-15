# Lot 9 — Tâche 2 — Rapport d'écriture

**Exécuté le 15 août 2026, session Claude Code, compte `Cywil`.**

## Écriture sur le wiki

- **Page :** `Modèle:Physical facet plant`
- **Méthode :** `bin/wiki-put.sh` avec `--createonly`.
- **Résultat API :** `result: Success`, `new: true`, `pageid: 283`,
  `oldrevid: 0`, `newrevid: 521`.
- **Résumé d'édition exact :**
  `[Lot 9][Tâche 2] Création du modèle de facette végétale au niveau physique`
- **Contenu exact écrit :** voir `lot-9-tache2-proposition.md` (wikitexte
  final, avec les 4 corrections appliquées avant écriture).

## Contrôle post-écriture

**Aucun contrôle `browsebysubject`** — cette page vit dans l'espace de noms
`Modèle:` (10), pas `Attribut:` (102). Le verrou
`smw-change-propagation-protection` documenté en tâche 1
(`lot-9-tache0-rapport.md` §10) porte sur les pages de propriété, pas sur les
pages de modèle. Sans objet ici, conformément à l'instruction de Cyril.

Aucune autre vérification effectuée à ce stade (pas d'item physique existant
pour tester le rendu réel du modèle en situation — prévu en tâche 5,
« Vérifications fonctionnelles », sur `Utilisateur:Cywil/Bac à sable`).

## Corrections intégrées avant écriture

Voir `lot-9-tache2-proposition.md`, section « Corrections appliquées avant
écriture » : cellules vides explicites (4 champs), `{{FULLPAGENAME}}` au lieu
de `{{PAGENAME}}` dans le `#ask`, existence de `Modèle:Documentation`
vérifiée (pageid 35, bloc `noinclude` conservé), dette technique consignée
(requête photos sans filtre de classe, décision 1.9 non appliquée ici — à
reprendre en tâche 3).

## Correction post-rapport sur `lot-9-tache2-proposition.md`

Le bloc de wikitexte de ce fichier contenait encore la version d'avant les 4
corrections (`{{PAGENAME}}`, cellules de valeur nues) au moment de la
première rédaction de ce rapport, alors que ce même rapport renvoyait à ce
fichier pour « le contenu exact écrit ». Corrigé : le bloc a été remplacé par
le wikitexte relu en direct sur le wiki (`action=parse&prop=wikitext`),
identique à `newrevid: 521`, et la section renommée « Wikitexte proposé » →
« Wikitexte écrit » avec mention de la révision. Aucune écriture sur le wiki
pour cette correction — fichier local seulement.

## Suite

Tâche 2 terminée. Tâche 3 (`Modèle:Specimen photo`) et tâche 4 (bloc de
formulaire) restent à faire, dans cet ordre selon le cadrage.
