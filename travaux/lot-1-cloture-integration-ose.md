# Lot 1, suite de clôture : intégration de la correction d'OSE, note sur l'index des lots

Exécuté du 31 octobre au 1er novembre 2026, dans une session Claude Code cloud.
Couvre deux consignes : celle de l'intégration de la branche
`claude/peaceful-turing-dfhp4z` (étapes 0 à 5), puis celle de la suite et fin
(étapes A à E). Le rapport de la clôture proprement dite est
`travaux/lot-1-cloture.md`.

## État de départ

- Consigne 1, étape 0 : `git status --porcelain` vide. `git fetch origin`,
  `git checkout main`, `git reset --hard origin/main` : `main` sur `cf45f88`.
- Consigne 2 : `git status --porcelain` vide. `git fetch --unshallow` :
  `git rev-parse --is-shallow-repository` rend `false`. Le même rapatriement a
  montré `origin/main` avancé de cinq commits venus d'une autre copie
  (`79556fd` à `d9bea8c`, chemins et permissions), intégrés en avance rapide
  (`git merge --ff-only origin/main`) avant toute écriture.
- `.claude/settings.local.json` : absent au début et à la fin des deux
  consignes, donc aucune règle.

## Les sept commits

| Commit | Étape | Objet | `git show --stat` |
|---|---|---|---|
| `d19d313` | 1 | Cherry-pick de `522ca3b` : Tolerence et fullfil corrigés dans OSE, README complété | 3 fichiers, 212 +, 171 − |
| `34ab988` | 1 | Cherry-pick de `60d4e4d` : rapport du 21 octobre sur l'orthographe d'OSE | 1 fichier, 122 + |
| `839c0de` | 2 | Section « Ce que swowl ne rend pas » retirée de `ontologie/README.md` | 1 fichier, 12 − |
| `cd03bf3` | 3 | Note datée en tête des deux documents swowl | 2 fichiers, 14 + |
| `4df857a` | 4 | Règle « Fin de tâche : la branche de session » dans `CLAUDE.md` | 1 fichier, 13 + |
| `ad3772c` | B | Date de la note corrigée, 31 et non 29 octobre | 2 fichiers, 4 +, 4 − |
| *(ce rapport)* | E | Rapport | 1 fichier |

Les deux cherry-picks sont passés sans conflit. Les cinq premiers commits ont
été poussés sur `main` le 31 octobre (`cf45f88..4df857a`), les deux derniers
partent avec ce rapport.

L'étape 2 a supprimé les lignes 105 à 116 du README, du titre « ## Ce que
swowl ne rend pas » jusqu'à la ligne vide avant « ## Statut ». Les 12
suppressions sont celles attendues. L'étape 4 place la règle dans la
section « Garde-fous d'exécution (dépôt git) », sous « Pousser en fin de
session, systématiquement ».

## Écriture sur le wiki

| Page | Révision | Résumé |
|---|---|---|
| Notes en attente de rangement | 1547 → 1716 | `[Lot 1] Clôture - l'index n'affiche pas la date de clôture` |

La page a été lue par `bin/wiki-get.sh` (`action=parse&prop=wikitext`),
identique à la lecture du 31 octobre, puis écrite en entier par un seul
`bin/wiki-put.sh`. Diff :

```diff
11a12,15
> == Date de clôture absente de l'index des lots ==
> ''Cyril, le 31/10/26 - clôture du lot 1''
> L'index [[Gestion des lots]] n'affiche pas la date de clôture. Le fait <code><nowiki>Work_package_closure_date</nowiki></code> est bien stocké sur les pages de lot, vérifié sur le lot 1 le 29 octobre 2026, mais la requête de l'index ne le demande pas : ses colonnes sont numéro, état, objet, ouvert le, livré le, documents. Ajouter une colonne touche l'index de tous les lots et relève de la convention des pages de lot.
>
```

## Les sept vérifications

Consigne 1 :

1. **Celle qui tranche passe.** Dans `ontologie/OSE_BusinessOntology/` :
   - `git grep -c Tolerence` : 0 ;
   - `git grep -c fullfil` : 0 ;
   - `git grep -c Tolerance` : 56 dans le `.owl`, 36 dans le `.pprj` ;
   - `git grep -c fulfil` : 64 dans le `.owl`, 0 dans le `.pprj`.
2. `ontologie/README.md` : « Ce que swowl ne rend pas », 0 occurrence ;
   « ## Corrections apportées » et « ## Défauts connus, non corrigés »
   présents tous les deux.
3. `travaux/ontologie-2026-10-21-orthographe-ose.md` est sur `main`.
4. La page « Notes en attente de rangement » porte la nouvelle note, voir le
   point 5 ; `action=ask` sur `[[Item_ref::+]]` rend 118.

Consigne 2 :

5. **Celle qui tranche passe.** Relue par `action=parse`, la page fait
   **74 lignes** (70 avant), se termine par `[[Catégorie:Page de suivi]]`, et
   son contenu est identique octet pour octet au fichier envoyé. Les neuf
   notes antérieures sont intactes : tout ce qui suit le nouveau bloc, depuis
   « == Colonnes d'une fiche de lieu selon le type de lieu », est identique à
   la page d'avant, de même que l'en-tête qui le précède.
6. `action=ask` sur `[[Item_ref::+]]` rend **118**, sans la page. Ses faits
   (`smwbrowse`) se limitent à `_INST` (Page de suivi), `_MDAT` et `_SKEY` :
   elle ne porte aucune annotation et n'entre donc dans aucune requête. Le
   nom `Work_package_closure_date` cité dans la note n'a créé aucun fait :
   `[[Work_package_closure_date::+]]` rend 8 pages, la page de notes n'en
   fait pas partie. Ses quatre liens mènent à des pages existantes, et sa
   seule catégorie est « Page de suivi ».
7. `git grep -c "29 octobre"` dans `ontologie/installation-swowl.md` et
   `travaux/swowl-controle-structure.md` : 0. « 31 octobre » : 2 dans chacun.

## Écarts et surprises

- **La date de la note de l'étape 3**, signalée le 31 octobre. Le texte
  fourni disait « Note du 29 octobre 2026 » et « est entrée dans `main` le
  29 octobre », alors que l'intégration a eu lieu le 31. Le texte a d'abord
  été recopié mot pour mot, puis corrigé par la consigne suivante (commit
  `ad3772c`).
- **Le clone superficiel**, signalé le 31 octobre. Aucune conclusion
  d'historique n'en a été tirée ; levé par `git fetch --unshallow` à
  l'étape A.
- **La forme de la note sur le wiki**, posée en question A le 31 octobre.
  Ajouté « à la suite », le paragraphe brut aurait contredit les règles de
  la page, qui veulent un titre, une date, un auteur et les notes récentes
  en haut. Il se serait aussi lu comme la suite de la dernière note.
  `bin/wiki-append.sh` refusait de toute façon cette page, qui ne se termine
  pas par une entrée `# `. La consigne suivante a tranché : un bloc titré,
  placé en tête des notes et signé « Cyril, le 31/10/26 - clôture du lot 1 ».
- **Le stop-hook de la session** a signalé, le 31 octobre, cinq commits non
  poussés sur `main` pendant que j'attendais la réponse à la question A. Ils
  ont été poussés en avance rapide (`cf45f88..4df857a`) : la règle de
  l'étape 4 l'autorisait, puisque `origin/main` en était l'ancêtre direct.
- **La règle de l'étape 4 ne correspond pas tout à fait à cette session.**
  L'étape 0 m'a fait travailler sur `main` lui-même et non sur une branche
  de session. La poussée s'est faite par `git push origin HEAD:main`,
  après contrôle de l'ancêtre direct. La branche de session
  `claude/sgdt-lot1-closure-cakxxo` est restée sur `cf45f88` et n'a pas été
  mise à jour.
- **Une autre copie a poussé sur `main` entre les deux consignes** : cinq
  commits (`79556fd` à `d9bea8c`), dont `f18d3c5`, qui touche
  `ontologie/installation-swowl.md`. Intégrés en avance rapide avant
  l'étape B, sans conflit. La note datée en tête du fichier est restée
  intacte.
- **Le rapport est daté du 1er novembre** : la seconde consigne s'est
  exécutée ce jour-là, alors que la note du wiki et celle des deux documents
  swowl, fournies telles quelles, portent le 31 octobre. C'est la date de
  l'intégration dans `main`, qui reste juste.
- Aucune question n'a été posée par le canal direct pendant l'exécution, en
  dehors de la question A.
