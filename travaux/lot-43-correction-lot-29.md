# Lot 43 — correction de l'attribution au lot 29, 14 octobre 2026

Correction d'une ligne de la section « Dehors » de « Lot 43 — Modes
opératoires » : la classe Personne n'était rattachée au lot 29 que par
inférence. Suite de `travaux/lot-43-creation-page.md`, point C. Session
Claude Code hébergée (cloud), branche locale `claude/clever-clarke-o1jkjc`.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` : sortie vide, aucun arrêt.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.
- `origin/main` avait avancé de `7d0f236` à `93e21b8` : un rapport du
  lot 21, tâche 24, sans modification de `CLAUDE.md` ni de
  `pages/Lot_43.txt`. La branche locale a été mise à niveau par
  `git merge --ff-only origin/main` avant tout travail.

## 2. Session

`bin/wiki-login.sh` : `Success Cywil`.

## Titre

Le titre n'a pas été retapé à l'aveugle. Il a été relu par `action=ask` sur
`[[Category:Lot]][[Work_package_number::43]]`, puis comparé en Python à la
chaîne passée en argument aux scripts : **identiques**, tiret U+2014 en
huitième position. Le contrôle comptait ici plus encore qu'à la création :
`bin/wiki-put.sh` sans `--createonly` aurait créé une seconde page sous un
titre à tiret simple, au lieu de corriger celle-ci.

## 3. Révision lue

« Lot 43 — Modes opératoires », pageid 672 : **révision 1604** (Cywil,
2026-10-14T16:53:22Z, 5 279 octets), conforme au repère. Aucune protection
native. Le texte courant, comparé par `cmp`, était identique octet pour octet
à `pages/Lot_43.txt` avant correction.

## 4. Le remplacement

Chaîne cherchée :
`* la classe Personne, lot 29, et l'état de conception, lot 42.`

- **1 occurrence** dans le texte du wiki
  (`bin/wiki-get.sh … | grep -o -F -e "…" | wc -l`) ;
- **1 occurrence** dans `pages/Lot_43.txt`, comptée de la même façon.

Le remplacement a été fait dans `pages/Lot_43.txt` avec l'outil d'édition de
fichier, qui refuse lui aussi une chaîne absente ou présente plusieurs fois.
Le fichier reste sans saut de ligne final : il se termine toujours par
`Techniques]].`.

Contrôles avant écriture :
- `bin/wiki-get.sh … | diff - pages/Lot_43.txt` : `38c38,39`, rien d'autre ;
- aucun lien replié sur deux lignes ;
- les deux pages nouvellement citées existent et ne sont pas des
  redirections : `Catégorie:Organisation` (`lastrevid` 933) et
  « Récapitulatif technique du Système de Gestion de Données Techniques »
  (`lastrevid` 1463) ;
- `lastrevid` relu juste avant l'écriture : toujours 1604.

## 5. Écriture

`bin/wiki-put.sh "Lot 43 — Modes opératoires" pages/Lot_43.txt "[Lot 43][Cadrage] Correction : la classe Personne n'est rattachée à aucun lot, le lot 29 porte sur PAIR"`
: `Success`, pageid 672 (la page existante, aucun `"new"`), `oldrevid` 1604,
**révision 1606**, 5 473 octets.

## 6. Vérifications

### Comparaison décisive

La révision 1604 a été relue par son identifiant
(`action=query&revids=1604&prop=revisions&rvprop=content&rvslots=main`),
puis comparée par `diff` au texte envoyé :

```
38c38,39
< * la classe Personne, lot 29, et l'état de conception, lot 42.
---
> * l'état de conception, lot 42 ;
> * une éventuelle classe Personne, évoquée par [[:Catégorie:Organisation]] et par le [[Récapitulatif technique du Système de Gestion de Données Techniques|récapitulatif technique]] sans être rattachée à aucun lot.
```

Une ligne remplacée par deux, et rien d'autre : trois lignes de contenu dans
la sortie de `diff`, une `<` et deux `>`, en un seul bloc. **Réussie.**

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| Classe `error` dans le rendu | 0 — conforme |
| Liens rouges | aucun — conforme |
| Les deux pages nouvellement citées existent | oui : les deux liens sont marqués existants par `action=parse`, et enregistrés dans `pagelinks` (`prop=links`) — conforme |
| Catégorie:Lot | **43** membres — conforme |
| Texte stocké et `pages/Lot_43.txt` | relus par `bin/wiki-get.sh`, comparés par `cmp` : **identiques octet pour octet** — conforme |

Contrôles en plus :
- six liens internes, tous existants : les quatre d'avant, plus les deux
  nouveaux ;
- une seule catégorie, `Catégorie:Lot`, cachées comprises. Le lien
  `[[:Catégorie:Organisation]]`, préfixé de deux-points, est bien un lien et
  n'a pas rangé la page dans cette catégorie ;
- faits SMW inchangés : `Work_package_number` 43, `Work_package_status`
  identifié, `_INST` Lot, aucun `_ERRC`.

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- La révision 1605, intercalée entre 1604 et 1606, est d'une autre session :
  création de `Attribut:Characteristic mode`, résumé « [Lot 21][Tâche 24] … ».
  Elle est sans rapport avec cette page, comme le confirme l'`oldrevid` 1604
  de l'écriture.
- Aucun autre écart.
