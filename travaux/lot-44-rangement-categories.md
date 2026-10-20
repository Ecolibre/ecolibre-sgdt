# Lot 44 — rangement des pages de développement en catégories, 20 octobre 2026

Rangement de « Comment ce wiki est tenu » et de « Guide de saisie » dans
`Catégorie:Documentation SGDT`, description de cette catégorie, et
remplacement de la liste tenue à la main du pied de page de « Gestion des
lots » par un renvoi aux deux catégories. Session Claude Code hébergée
(cloud), branche de travail `ccr-4b59dccc-xydpag`.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` au départ : sortie vide, aucun arrêt.
- `git fetch origin` : `origin/main` sur `1004f44`, comme la branche de
  travail ; aucune mise à niveau nécessaire.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.

## 2. Contrôles avant écriture

| Contrôle | Mesure | Résultat |
|---|---|---|
| « Comment ce wiki est tenu » sans catégorie | `prop=categories` (cachées comprises) : aucune ; wikitexte : aucune occurrence de « Catégorie » ni de « Category » suivie d'un deux-points | conforme (`lastrevid` 1331) |
| « Guide de saisie » sans catégorie | mêmes mesures : aucune | conforme (`lastrevid` 1235) |
| `Catégorie:Documentation SGDT` existe et ne contient que ses deux lignes parentes | wikitexte de 52 octets, exactement `[[Catégorie : Documentation]]` puis `[[Catégorie : SGDT]]` | conforme (`lastrevid` 60) |
| `Catégorie:Page de suivi` existe | oui | conforme (`lastrevid` 1260) |
| Membres de `Catégorie:Documentation SGDT` | **20** (`categorymembers` et `categoryinfo`) | relevé |
| Membres de `Catégorie:Page de suivi` | **8** (`categorymembers` et `categoryinfo`) | relevé |
| Ligne à remplacer dans « Gestion des lots » | présente mot pour mot, une seule fois (ligne 41 sur 43) | conforme (`lastrevid` 1686) |

Les huit membres de `Catégorie:Page de suivi` : « Choix imposés par
l'outil », « Gestion des lots », « Limites connues du Système de Gestion de
Données Techniques », « Miroir local du wiki », « Notes en attente de
rangement », « Procédure d'ouverture d'un lot », « Procédure de clôture d'un
lot », « Récapitulatif technique du Système de Gestion de Données
Techniques ».

## 3. Préparation et contrôle des diffs

Les quatre pages ont été relues entières par `bin/wiki-get.sh` dans le
scratchpad. Les quatre fichiers modifiés ont été produits par un script de
scratchpad, `rangement.py`, montré avant son lancement. Il s'arrêtait si
l'une des pages finissait par un saut de ligne inattendu, si la page de
catégorie contenait autre chose que ses deux lignes, ou si la ligne du pied
de page était absente ou multiple. Il contrôlait aussi la règle 2.

Diffs obtenus, et rien d'autre :

- « Comment ce wiki est tenu » : deux lignes ajoutées en fin de page, une
  ligne vide puis `[[Catégorie:Documentation SGDT]]` (4 979 → 5 014 octets) ;
- « Guide de saisie » : même ajout (6 315 → 6 350 octets) ;
- `Catégorie:Documentation SGDT` : quatre lignes ajoutées en tête, les deux
  paragraphes et une ligne vide après chacun ; les deux lignes parentes
  intactes (52 → 472 octets) ;
- « Gestion des lots » : la ligne 41 remplacée par les deux lignes demandées,
  séparées par une ligne vide (3 592 → 3 673 octets).

**Règle 2, vérifiée avant l'envoi de l'écriture 4** : dans le texte ajouté,
trois liens vers une catégorie, un sur la page de catégorie et deux dans le
pied de page de « Gestion des lots ». Tous les trois portent le deux-points
de tête (`[[:Catégorie:…`). Aucune forme sans deux-points.

Juste avant l'envoi, les quatre `lastrevid` ont été relus : 1331, 1235, 60
et 1686, inchangés depuis la lecture.

## 4. Écritures

`bin/wiki-login.sh` : `Success Cywil`.

| N° | Page | Résumé | Révision |
|---|---|---|---|
| 1 | Comment ce wiki est tenu | `[Lot 44] Rangement : Documentation SGDT` | 1331 → **1688**, 13:03:16 UTC |
| 2 | Guide de saisie | `[Lot 44] Rangement : Documentation SGDT` | 1235 → **1689**, 13:03:17 UTC |
| 3 | Catégorie:Documentation SGDT | `[Lot 44] Description : ce qui distingue cette catégorie des pages de suivi` | 60 → **1690**, 13:03:20 UTC |
| 4 | Gestion des lots | `[Lot 44] Pied de page : renvoi aux deux catégories plutôt qu'une liste à tenir à la main` | 1686 → **1691**, 13:03:21 UTC |

Quatre écritures sur le wiki, pas une de plus.

## 5. Vérifications

### Vérification décisive

| Contrôle | Résultat |
|---|---|
| `Catégorie:Documentation SGDT` : deux membres de plus | **22** (20 avant), et les deux nouveaux sont « Comment ce wiki est tenu » et « Guide de saisie » ; `categoryinfo` : 22 pages, 0 sous-catégorie |
| `Catégorie:Page de suivi` : autant de membres qu'avant | **8** (8 avant), mêmes huit pages ; `categoryinfo` : 8 pages, 0 sous-catégorie. Aucune page n'y a été rangée par erreur |
| « Gestion des lots » : une seule catégorie | `Catégorie:Page de suivi`, seule |

**Réussie.**

`Catégorie:Documentation SGDT` porte toujours ses deux catégories parentes,
`Catégorie:Documentation` et `Catégorie:SGDT`, et rien d'autre : le lien de
sa description ne l'a pas rangée dans `Page de suivi`.

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| `bin/wiki-verify.sh` sur les quatre pages | `IDENTIQUE` quatre fois, contre les fichiers envoyés |
| Classe `error` | 0 sur chacune des quatre pages |
| Liens rouges | aucun sur chacune (`class="new"` : 0, aucun lien vers une page inexistante) |
| « Gestion des lots », compteurs | inchangés : total 45, En cours 3, Faits 17, À venir 25, Abandonnés 0 |
| « Gestion des lots », tableaux | trois tableaux rendus avec 3, 17 et 25 lignes de données ; la section « Abandonnés » rend toujours « Aucun lot abandonné. » |
| Liens de catégorie du pied de page | rendus vers `/wiki/Catégorie:Page_de_suivi` et `/wiki/Catégorie:Documentation_SGDT`, deux pages de l'espace Catégorie, et non vers des pages de contenu |
| Lien de la description de catégorie | rendu vers `/wiki/Catégorie:Page_de_suivi` |

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- **« Choix imposés par l'outil » n'a plus aucun lien entrant.** Mesuré après
  l'écriture 4 par `list=backlinks` : liste vide. Son seul renvoi était le
  pied de page de « Gestion des lots », que cette consigne a retiré. Elle
  reste trouvable par `Catégorie:Page de suivi`, comme le veut le nouveau
  pied de page, mais aucune page ne la cite plus. Le texte du lot 44 ne la
  lie volontairement pas (règle 7 de la création de la page du lot). Je le
  signale seulement.
- Les trois pages retirées du pied de page restent atteignables par l'une des
  deux catégories : « Choix imposés par l'outil » et « Notes en attente de
  rangement » sont dans `Page de suivi`, « Registre des facettes » est dans
  `Documentation SGDT`. Aucune n'est devenue invisible à la navigation par
  catégorie.
- Les deux lignes parentes de `Catégorie:Documentation SGDT` s'écrivent avec
  une espace de part et d'autre du deux-points (`[[Catégorie : SGDT]]`), alors
  que la ligne ajoutée aux deux pages n'en porte pas. Les deux formes rangent
  correctement ; la consigne fixait la seconde.
- Aucune copie locale de ces quatre pages n'existait dans `pages/`. Les
  fichiers envoyés sont restés dans le scratchpad de la session ; je n'en ai
  pas créé dans le dépôt, la consigne n'en demandant pas.

## Poussée

Commit poussé sur `main`, et sur la branche désignée `ccr-4b59dccc-xydpag`.
