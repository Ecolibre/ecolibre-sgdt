# Saisie du 14 octobre 2026 — précisions d'outillage et correction d'une légende

Suite de `travaux/saisie-2026-10-14-page-mode-operatoire.md`. Hors lot,
étiquette de résumé `[Saisie]`. Session Claude Code hébergée (cloud), branche
locale `claude/clever-clarke-o1jkjc`.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` : sortie vide, aucun arrêt.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.
- `origin/main` avait avancé de `d678a64` à `c802463` (lot 21, tâche 23 :
  `pages/Lot_21.txt` et `travaux/lot-21-tache23-reprise.md`, sans
  modification de `CLAUDE.md`). La branche locale a été mise à niveau par
  `git merge --ff-only origin/main` avant tout travail.

## 2. Session

`bin/wiki-login.sh` : `Success Cywil`.

## 3. Révision lue

« Remplacer un rayon sur une roue à moyeu moteur » : **révision 1601**
(Cywil, 2026-10-14T10:59:37Z, 7 064 octets, sha1 `4ab82da5…`), conforme au
repère. Aucune protection native. Le wikitexte a été lu en entier par
`bin/wiki-get.sh`.

## 4. Les quatre remplacements

Occurrences comptées sur le texte courant, avant toute écriture, par
`bin/wiki-get.sh "…" | grep -o -F -e "<chaîne cherchée>" | wc -l`. Ce comptage
compte chaque occurrence, même si plusieurs tombent sur la même ligne.

| N° | Chaîne cherchée | Occurrences | Ligne | Résultat |
|---|---|---|---|---|
| 1 | `* Un outil solide pour déformer le rayon.` | **1** | 14 | remplacée |
| 2 | `* Un [[Outil de serrage d'écrou de rayon de vélo\|outil de serrage d'écrou de rayon]].` | **1** | 17 | remplacée |
| 3 | `Terminer le serrage avec l'[[Outil de serrage d'écrou de rayon de vélo\|outil de serrage d'écrou de rayon]].` | **1** | 82 | remplacée |
| 4 | `Fichier:Réduction longueur rayon 74mm.jpg\|Réduction de la longueur du rayon de 74 mm` | **1** | 95 | remplacée |

Aucune chaîne absente, aucune en double : aucun arrêt.

Le fichier envoyé a été écrit avec l'outil d'écriture de fichier, sans saut
de ligne final, comme le texte rendu par `bin/wiki-get.sh`. Avant l'envoi,
`bin/wiki-get.sh "…" | diff - <fichier>` a montré exactement les quatre
lignes 14, 17, 82 et 95, sans autre différence. Le `lastrevid` a été relu
juste avant l'écriture : toujours 1601.

## 5. Écriture

`bin/wiki-put.sh`, résumé « [Saisie] Précisions d'outillage et correction
d'une légende » : `Success`, **révision 1603**, `oldrevid` 1601, 7 395 octets.
La page n'a donc reçu aucune autre écriture entre la lecture et l'écriture.

## 6. Vérifications

### Comparaison décisive

Révision 1601, relue par son identifiant
(`action=query&revids=1601&prop=revisions&rvprop=content&rvslots=main`),
comparée par `diff -u` au texte envoyé :

- **4 lignes modifiées** (14, 17, 82, 95), **0 ajoutée, 0 supprimée** ;
- sortie de `diff` : 8 lignes de contenu, 4 `<` et 4 `>`, en trois blocs. Les
  remplacements 1 et 2 tombent dans le même bloc, séparés par deux lignes
  inchangées ;
- aucune autre différence, y compris en fin de fichier.

Complément : le contenu stocké de la révision 1603, comparé par `cmp` au
texte envoyé, est **identique octet pour octet**. **Réussie.**

### Vérifications secondaires, sur le rendu de la révision 1603

| Contrôle | Attendu | Mesuré | Verdict |
|---|---|---|---|
| Images | 17 | 17 balises `img`, 17 sources distinctes, 17 `gallerybox`, `prop=images` : 17 | conforme |
| Galeries | 9 | 9 | conforme |
| Vignettes isolées | aucune | 0 image hors des galeries, 0 `div class="thumb t…"` | conforme |
| Liens rouges | un seul, « Démonter un pneu de vélo » | un seul, « Démonter un pneu de vélo » | conforme |
| Classe `error` | aucune | 0 | conforme |
| Titres | 6 de niveau 2, 12 de niveau 3 | 6 et 12 | conforme |
| Catégories | aucune | aucune, cachées comprises | conforme |

Contrôles en plus :
- la nouvelle légende « Rayon de 74 mm raccourci, à côté d'un rayon intact »
  figure dans le rendu, et l'ancienne n'y est plus ;
- 11 liens internes, comme à la révision 1601 : aucun lien ajouté ;
- faits SMW de la page : `_MDAT` et `_SKEY` seulement.

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- **Contrôle des précisions sur les photos**, en lecture seule, sur des
  versions de 1 000 px de large. Les miniatures de 360 px de la tâche
  précédente ne suffisaient pas.
  - « Serrage écrou G12.jpg » : clé ronde à huit encoches. Je lis nettement
    12, 14, 10, 13, 11 et 15 ; deux autres chiffres, inclinés, me semblent
    être 14 et 15, sans certitude. « Numérotées de 10 à 15 » est donc
    cohérent avec la photo. **Que l'encoche 12 convienne à l'écrou ne se
    voit pas sur la photo** : le rayon passe dans le trou central de la clé,
    qui n'est engagée sur aucun écrou. C'est la réserve déjà faite sur la
    légende « Serrage de l'écrou » de cette photo ; cette tâche ne touchait
    pas cette légende, qui reste telle quelle.
  - « Possibilité de tordre le rayon dans l'autre sens.jpg » (étape 7) :
    l'œil de la clé mixte entoure un rayon et la main tient le côté fourche
    comme levier. C'est conforme au remplacement 1. Ma lecture de la
    miniature, à la tâche précédente, me faisait croire à une prise par la
    fourche : elle était fausse, et c'est la version agrandie qui tranche. La
    clé porte les marquages « DEXTER » et « 10 ».
- La révision 1602, intercalée entre 1601 et 1603, est d'une autre session,
  sur « Lot 21 — Grandeurs et unités » (« [Lot 21][Tâche 23] … »). Elle est
  sans rapport avec cette page, comme le confirme l'`oldrevid` de
  l'écriture.
- Une miniature de 1 000 px demandée directement par `curl` a d'abord rendu
  une erreur 404 : le wiki ne génère une taille de miniature qu'une fois
  qu'elle a été demandée à l'API (`iiurlwidth`). Après cette demande, le
  téléchargement a réussi. Aucune écriture : c'est le wiki qui génère la
  miniature, à la demande.
