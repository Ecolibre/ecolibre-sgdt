# Lot 21, tâche 34 — correction d'un comptage sur la page du lot

Date : 15 octobre 2026 (horloge UTC du conteneur, 15:17 à 15:21). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

Une seule écriture sur le wiki, par `bin/wiki-put.sh`, sans `--createonly` :

- page : `Lot 21 — Grandeurs et unités` (pageid 532) ;
- résumé : `[Lot 21][Tâche 34] Correction du comptage : quatorze pages créées le 14 octobre 2026, et non onze` ;
- réponse de l'API : `"result": "Success"`, `oldrevid` 1637, `newrevid` 1638, `newtimestamp` 2026-10-15T15:17:49Z, code de sortie 0.

Aucune autre page écrite.

## Révisions et tailles

| | Révision | Taille selon l'API | Copie locale | Sauts de ligne |
|---|---|---|---|---|
| Avant | 1637 (2026-10-15T15:08:05Z, Cywil, `[Lot 21][Tâche 33] Actualisation : unité principale portée par la dimension, et section Avancement de l'exécution`) | 39 259 octets | 39 259 octets | 179 |
| Après | 1638 (2026-10-15T15:17:49Z) | 39 263 octets | 39 263 octets | 179 |

Écart : + 4 octets, soit « Quatorze » (8 octets) à la place de « Onze » (4 octets). Nombre de lignes inchangé.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas non plus.

**Étape 3 — lecture et copie.** Révision courante 1637, comme attendu ; `length` 39 259 octets ; `protection: []`. Wikitexte gardé dans `lot21-avant34.txt`, dans le scratchpad de la session, hors du dépôt : 39 259 octets. Il est identique octet pour octet (`cmp`) à la version publiée relue à la tâche 33 : personne n'avait écrit sur la page entre-temps.

**Étape 4 — remplacement.** La chaîne `'''Onze pages créées le 14 octobre 2026.'''` se trouve **une seule fois** (`grep -F -o … | wc -l` : 1), en tête de la ligne 170 ; « Quatorze » n'apparaissait nulle part sur la page. Remplacement fait par `sed`, chaîne littérale et point échappé, sur une copie (`lot21-apres34-prevu.txt`). Contrôles : la nouvelle chaîne s'y trouve une fois ; taille 39 263 octets ; 179 sauts de ligne, donc aucun saut de ligne final ajouté. Diff prévu, calculé avant l'écriture : une seule ligne, `170c170`.

**Étape 5 — écriture et vérification.**
- Révision revérifiée juste avant l'écriture (15:17:43 UTC) : toujours 1637, 39 259 octets.
- `bin/wiki-login.sh` relancé avant l'écriture : `Success Cywil`.
- Wikitexte publié relu par `bin/wiki-get.sh` dans `lot21-publie34.txt` : 39 263 octets, **identique octet pour octet à la copie modifiée** (`cmp` sans écart).
- Diff entre la copie d'origine et la version publiée : **une seule ligne modifiée**, la ligne 170, qui commence par le comptage, et rien d'autre. Cité ci-dessous.

## Diff entre l'avant (révision 1637) et l'après (révision 1638), tel quel

Produit par `diff lot21-avant34.txt lot21-publie34.txt`, format normal de `diff` :

```
170c170
< '''Onze pages créées le 14 octobre 2026.''' Le modèle, la catégorie et les sept rôles de caractéristique ; le modèle, la catégorie et les trois unités de la dimension longueur, le mètre, le millimètre et le micromètre. Deux points non mesurés ont été tranchés à cette occasion : un facteur décimal saisi avec une virgule est stocké exact, et une liste d'alias est bien découpée en valeurs distinctes.
---
> '''Quatorze pages créées le 14 octobre 2026.''' Le modèle, la catégorie et les sept rôles de caractéristique ; le modèle, la catégorie et les trois unités de la dimension longueur, le mètre, le millimètre et le micromètre. Deux points non mesurés ont été tranchés à cette occasion : un facteur décimal saisi avec une virgule est stocké exact, et une liste d'alias est bien découpée en valeurs distinctes.
```

Lecture : sur la ligne 170, seul le mot « Onze » devient « Quatorze ». Le reste de la ligne et le reste de la page sont inchangés. Aucune modification non voulue.

## Contrôles supplémentaires, en lecture seule

- **Faits SMW de la page, avant et après** (`bin/wiki-api.sh --facts`) : seul `_MDAT` change (`1/2026/10/15/15/8/5/0` → `1/2026/10/15/15/17/49/0`).
- **Catégories** après écriture : `Catégorie:Lot`, seule.

**Étape 6 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Questions posées hors consigne

Aucune question reçue hors consigne. La réponse au point A de la tâche 33 figure en tête de cette consigne : elle clôt ce point, et laisse en l'état l'ordre des deux phrases datées de « Ce que porte une page de grandeur », qui n'a pas été touché. Aucune question nouvelle.

## Écarts et surprises

1. **`sed` plutôt qu'un programme Python.** Un seul remplacement littéral, sur une ligne, tient dans la commande. CLAUDE.md, garde-fou 9 : pas de script du scratchpad tant que le travail tient en quelques lignes dans la commande. L'exactitude est contrôlée par le compte d'occurrences avant et après, par la taille (+ 4 octets), par le nombre de lignes et par `cmp` entre la copie et la version publiée.
2. **Fichiers temporaires dans le scratchpad**, comme à la tâche 33, et non dans `/tmp`, que la consigne citait en exemple : `lot21-avant34.txt`, `lot21-apres34-prevu.txt`, `lot21-publie34.txt`, `lot21-diff34.txt`, `lot21-faits-avant34.txt`, `lot21-faits-apres34.txt`.
3. **Diff inséré dans ce rapport par concaténation** de deux parties écrites avec l'outil d'écriture de fichier et du fichier `lot21-diff34.txt`, pour le citer octet pour octet.
4. `origin/main` n'avait pas bougé depuis la tâche 33 (`eb0d75c`) : aucune avance rapide nécessaire avant le commit.
