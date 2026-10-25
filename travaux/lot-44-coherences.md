# Lot 44 — trois incohérences et une règle, 25 octobre 2026

Correction du motif de « Où lancer cette procédure », passage de la page du
lot 44 à quatre rubriques, orthographe de « coût » sur « Choix imposés par
l'outil », et nouvelle règle dans `CLAUDE.md` sur les copies de `pages/`.
Session Claude Code hébergée (cloud), branche de travail
`ccr-4b59dccc-xydpag`.

**L'écriture 3 n'a pas été faite** : la consigne est irréalisable telle
qu'écrite (voir la question A). Les écritures 1 et 2 et la modification de
`CLAUDE.md` sont faites et vérifiées.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` au départ : sortie vide, aucun arrêt.
- `git fetch origin` : `origin/main` sur `6224526`, comme la branche de
  travail ; `Already up to date`.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.

## 2. Contrôles avant écriture

| Page | `lastrevid` | Catégories | Copie locale |
|---|---|---|---|
| Procédure de clôture d'un lot | 1695 | Page de suivi | pas de copie à jour dans `pages/` |
| Lot 44 — Mémoire des choix contraints et clôture des travaux | 1692 | Lot | `pages/Lot_44.txt` identique octet pour octet |
| Choix imposés par l'outil | 1687 | Page de suivi | `pages/Choix_imposes_par_l_outil.txt` identique octet pour octet |

Chaînes à remplacer, comptées sur le wikitexte relu par `bin/wiki-get.sh` :

| Chaîne | Annoncé | Trouvé |
|---|---|---|
| Paragraphe d'ouverture de « Où lancer cette procédure » | 1 | 1 (ligne 7) |
| Ligne « Chaque entrée porte trois choses… » | 1 | 1 (ligne 23) |
| `'''Cout d'une reprise.'''` | 6 | 6 (lignes 11, 16, 21, 26, 31, 36) |
| `couterait` | 1 | 1 (ligne 1) |
| **`cout` sans accent, toutes formes** | — | **9 occurrences** : les 6 rubriques, `couterait`, et **deux autres** : « Le cout est déjà payé » (ligne 16, entrée 2) et « Le cout est ailleurs » (ligne 26, entrée 4) |

## 3. Écritures

`bin/wiki-login.sh` : `Success Cywil`. Les fichiers modifiés ont été
produits par un script de scratchpad, `coherences.py`, montré avant son
lancement. Il s'arrêtait si une ligne à remplacer était absente ou
multiple. Diffs contrôlés avant envoi : **une seule ligne remplacée** sur
chaque page.

| N° | Page | Résumé | Révision |
|---|---|---|---|
| 1 | Procédure de clôture d'un lot | `[Lot 44] Où lancer la procédure : le motif corrigé, la règle inchangée` | 1695 → **1696**, 18:54:30 UTC ; la ligne 7 remplacée par les deux paragraphes et leur ligne vide (7 926 → 8 255 octets) |
| 2 | Lot 44 — Mémoire des choix contraints et clôture des travaux | `[Lot 44] Quatre rubriques, comme la page publiée` | 1692 → **1697**, 18:54:32 UTC ; la ligne 23 remplacée (8 122 → 8 142 octets) |
| 3 | Choix imposés par l'outil | — | **non faite**, révision 1687 inchangée |

Chaque écriture a été précédée d'une relecture de son `lastrevid`, inchangé.
La copie locale `pages/Lot_44.txt` a reçu le même remplacement par l'outil
de modification de fichier, et reste identique à la page publiée.

## 4. Modification du dépôt

`CLAUDE.md` : la ligne d'ancrage « Les copies locales de pages vont dans
`pages/`. » est présente une seule fois. Le paragraphe a été inséré juste
après, précédé d'une ligne vide, avec l'outil de modification de fichier.
`git diff --numstat` : **9 lignes ajoutées, 0 supprimée**.

## 5. Vérifications

### Vérification décisive

| Contrôle | Résultat |
|---|---|
| `bin/wiki-verify.sh` | `IDENTIQUE` sur les trois pages. Pour « Choix imposés par l'outil », la comparaison porte sur la page non modifiée (révision 1687) et sa copie locale |
| « Choix imposés par l'outil » : une liste de six entrées et 24 sous-rubriques | inchangée, puisque non écrite : une `<ol>`, six entrées, 24 sous-rubriques, mesuré sur la révision 1687 lors des tâches précédentes |
| Faits du lot 44 | `Work_package_number` 44, `Work_package_status` ouvert, `Work_package_opening_date` 2026-10-19, deux recoupements, aucun `_ERRC`. Inchangés |

**Réussie pour les écritures 1 et 2 ; l'écriture 3 reste à faire.**

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| Procédure, rendu | 0 `error`, aucun lien rouge, `Page de suivi` seule |
| Procédure, sections | les six titres, inchangés : « Où lancer cette procédure », puis 1 à 5 |
| Procédure, bloc `pre` | une seule balise ; contenu rendu identique octet pour octet à celui de la révision 1695 (`cmp`) |
| Lot 44, rendu | 0 `error`, aucun lien rouge, `Lot` seule ; 2 tableaux et 19 `li`, comme avant |
| `CLAUDE.md` | diff : uniquement des lignes ajoutées (9) |

## Questions

**A.** *Contexte* : l'écriture 3 demande deux remplacements « et rien
d'autre », puis exige qu'après eux le mot « cout » sans accent n'apparaisse
plus nulle part sur la page. Les deux remplacements ne couvrent que sept
occurrences sur neuf. Il reste « Le cout est déjà payé » (entrée 2, rubrique
« Coût d'une reprise ») et « Le cout est ailleurs » (entrée 4, même
rubrique). Les comptes annoncés étaient exacts, donc la règle 4 ne
s'appliquait pas à la lettre ; mais faire l'écriture aurait violé soit
« rien d'autre », soit la postcondition. *Question* : faut-il aussi corriger
ces deux occurrences ? *Suggestion* : oui, dans une seule écriture qui porte
les huit remplacements (six rubriques, « coûterait », et les deux « coût »
minuscules), avec le même résumé.

**B.** *Contexte* : le « reste du wiki » n'écrit pas partout « coût ». Le
paragraphe ajouté le 23 octobre à la page du lot 44 porte « couterait »
(ligne 35), et le complément du 25 octobre à la procédure de clôture porte
« couterait » et « cout » (ligne 67). Ces deux textes ont été fournis ainsi.
*Question* : faut-il aligner aussi ces deux pages ? *Suggestion* : oui, dans
le même passage que A, une écriture par page.

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- **L'écriture 3 n'a pas été faite**, pour le motif de la question A. Le
  rapport compte donc deux écritures sur le wiki au lieu de trois.
- Faits de la nouvelle règle de `CLAUDE.md` vérifiés : `pages/` compte bien
  **119** fichiers ; trois copies du *Récapitulatif technique*
  (`Recapitulatif_technique.txt`, `Recapitulatif_technique.wikitext.txt`,
  `Recapitulatif_technique_SGDT.wikitext.txt`), et deux des *Limites
  connues* si l'on compte `Limites_connues.txt` et
  `Limites_connues_SGDT.draft.txt`. Il faut aussi compter cinq fragments
  d'ajout et une correction (`Limites_connues_ajout_*`,
  `Limites_connues_correction_lot21.txt`), plus deux fragments du
  *Récapitulatif* : c'est exactement le risque que la règle décrit. Les deux
  copies de procédure du lot 34 existent. Leur dernier commit date du
  8 octobre 2026 (« [Lot 21][Tâche 15] Correction après dégel »), et non du
  3 octobre. Je n'ai pas vérifié la date de leur contenu : le 3 octobre
  peut être juste pour ce contenu et faux pour le commit.
- Faits du nouveau paragraphe de la procédure : ils reprennent ceux de la
  page du lot 44 (recherche qui rend des extraits de transcription réelle,
  second outil qui ouvre une conversation à un endroit donné, mesure du
  19 octobre 2026). Ils ne sont pas vérifiables depuis cette session.

## Poussée

Commit poussé sur `main`, et sur la branche désignée `ccr-4b59dccc-xydpag`.
