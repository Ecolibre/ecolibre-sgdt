# Lot 21, tâche 33 — mise à jour de la page du lot

Date : 15 octobre 2026 (horloge UTC du conteneur, 15:05 à 15:12). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

Une seule écriture sur le wiki, par `bin/wiki-put.sh`, sans `--createonly` :

- page : `Lot 21 — Grandeurs et unités` (pageid 532) ;
- résumé : `[Lot 21][Tâche 33] Actualisation : unité principale portée par la dimension, et section Avancement de l'exécution` ;
- réponse de l'API : `"result": "Success"`, `oldrevid` 1602, `newrevid` 1637, `newtimestamp` 2026-10-15T15:08:05Z, code de sortie 0.

Aucune autre page écrite.

## Révisions et tailles

| | Révision | Taille selon l'API | Copie locale | Sauts de ligne |
|---|---|---|---|---|
| Avant | 1602 (2026-10-14T11:05:18Z, Cywil, `[Lot 21][Tâche 23] Sept phrases alignées sur la dimension et sur les rôles arrêtés`) | 36 266 octets | 36 266 octets | 163 |
| Après | 1637 (2026-10-15T15:08:05Z) | 39 259 octets | 39 259 octets | 179 |

Écart : + 2 993 octets, + 16 lignes. Les copies locales n'ont pas de saut de ligne final : `bin/wiki-get.sh` rend le wikitexte octet pour octet (`print(…, end="")`).

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas non plus.

**Étape 3 — lecture et copie.** Révision courante 1602, comme attendu ; `length` 36 266 octets ; `protection: []`. Wikitexte gardé dans `lot21-avant.txt`, dans le scratchpad de la session, hors du dépôt (voir Écarts, point 2) : 36 266 octets, identique en taille à ce que l'API annonce.

**Étapes 4 et 5 — remplacements.** Faits sur la copie par un programme Python de 21 lignes (`lot21-remplacer.py`, dans le scratchpad), dont le contenu a été affiché avant son lancement. Il lit les deux chaînes de recherche et leurs remplacements dans quatre fichiers écrits à l'identique de la consigne. Il compte les occurrences, s'arrête sans rien produire si l'une n'est pas exactement 1, puis remplace chaque chaîne une seule fois. Résultat :

- première chaîne (`le nom de la propriété correspondante ; … un identifiant externe.`) : **1 occurrence**, en ligne 67 ;
- seconde chaîne (`== Dépendances ==`) : **1 occurrence**, en ligne 158, qu'elle occupe entière (`'== Dépendances =='`), donc pas un fragment d'un titre de niveau 3 ;
- chaque remplacement commence, ou finit, par sa chaîne de recherche : vérifié ;
- taille prévue : 39 259 octets.

Le diff prévu, calculé avant toute écriture, montrait déjà exactement deux endroits (`67c67` et `156a157,172`).

**Étape 6 — écriture et vérification.**
- Révision revérifiée juste avant l'écriture (15:07:54 UTC) : toujours 1602, 36 266 octets. `bin/wiki-put.sh` n'envoie pas de `basetimestamp` et ne détecterait pas une modification concurrente : ce contrôle en tenait lieu.
- `bin/wiki-login.sh` relancé avant l'écriture : `Success Cywil`.
- Wikitexte publié relu par `bin/wiki-get.sh` dans `lot21-publie.txt`, puis comparé à la copie modifiée : **`diff` vide, et `cmp` sans écart** ; 39 259 octets des deux côtés. Pas même de différence de saut de ligne final, la copie n'en portant pas.
- Diff entre la copie d'origine et la version publiée : **deux endroits modifiés, et rien d'autre**, cité ci-dessous.

## Diff entre l'avant (révision 1602) et l'après (révision 1637), tel quel

Produit par `diff lot21-avant.txt lot21-publie.txt`, format normal de `diff` :

```
67c67
< '''Ce que porte une page de grandeur.''' Les libellés par langue en Monolingual text ; le symbole usuel ; une définition en une phrase ; '''la dimension physique''', en lien, qui porte le bloc de déclaration et les unités ; l'unité principale, en lien vers une page d'unité ; le type à employer, Quantity ou Temperature ; le nom de la propriété correspondante ; la forme à employer dans une requête de seuil ; une équivalence vers un identifiant externe. Corrigé le 13 octobre 2026 : la version du 8 octobre écartait la dimension comme inutile, faute d'un mécanisme qui s'en serve, et plaçait sur la grandeur les unités admises et le bloc de déclaration. L'épreuve de l'exemple a montré l'inverse, et la dimension est devenue la charnière du modèle. Une page de grandeur reste une page ordinaire, qui s'enrichit plus tard sans risque.
---
> '''Ce que porte une page de grandeur.''' Les libellés par langue en Monolingual text ; le symbole usuel ; une définition en une phrase ; '''la dimension physique''', en lien, qui porte le bloc de déclaration et les unités ; l'unité principale, en lien vers une page d'unité ; le type à employer, Quantity ou Temperature ; le nom de la propriété correspondante ; la forme à employer dans une requête de seuil ; une équivalence vers un identifiant externe. Corrigé le 14 octobre 2026 : l'unité principale n'est pas portée par la page de grandeur mais par la page de dimension, avec le bloc de déclaration dont elle fait partie ; la ligne qui la place ici est restée en arrière de la correction du 13 octobre. Corrigé le 13 octobre 2026 : la version du 8 octobre écartait la dimension comme inutile, faute d'un mécanisme qui s'en serve, et plaçait sur la grandeur les unités admises et le bloc de déclaration. L'épreuve de l'exemple a montré l'inverse, et la dimension est devenue la charnière du modèle. Une page de grandeur reste une page ordinaire, qui s'enrichit plus tard sans risque.
156a157,172
> 
> == Avancement de l'exécution ==
> 
> Exécution ouverte le 14 octobre 2026, la conception étant close.
> 
> '''La granularité d'une grandeur est vérifiée.''' QUDT distingue la longueur, la largeur, la hauteur, le diamètre et l'épaisseur comme cinq grandeurs distinctes, chacune rattachée à la longueur et portant le même vecteur de dimension. La découpe fine du lot est donc confirmée par la référence externe. Une version cible de QUDT reste à arrêter avant d'inscrire des équivalences, les fiches lues se réclamant de versions différentes.
> 
> '''La dimension du modèle est le vecteur de dimension, et non la grandeur de tête.''' Arrêté le 14 octobre 2026. QUDT porte deux choses là où le lot n'en nommait qu'une : un vecteur de dimension, et une grandeur de tête dont les autres descendent. La page de dimension se règle sur le vecteur, ce qui évite qu'une même page soit à la fois dimension et grandeur.
> 
> '''Les titres suivent la convention du wiki.''' Une page de vocabulaire porte sa famille en préfixe, comme les pages de la catégorie Facette : "Rôle nominal", "Dimension longueur". Les pages d'unité et de grandeur restent nues, "Millimètre" et "Épaisseur", le préfixe ne servant qu'à écarter une collision.
> 
> '''Dix-sept propriétés créées le 14 octobre 2026, aucune gelée.''' Quatre de structure : le mode, le rôle, le rattachement, et la tolérance telle qu'écrite. Une de vocabulaire, le libellé par langue, partagée par tous les vocabulaires du wiki et destinée aussi au lot 19. Sept pour la page d'unité : symbole, alias de saisie, dimension, facteur de conversion, code UCUM, place dans le Système international, équivalence externe. Cinq pour la page de grandeur et la page de dimension : symbole usuel, dimension, type à employer, propriété correspondante, unité principale.
> 
> '''Onze pages créées le 14 octobre 2026.''' Le modèle, la catégorie et les sept rôles de caractéristique ; le modèle, la catégorie et les trois unités de la dimension longueur, le mètre, le millimètre et le micromètre. Deux points non mesurés ont été tranchés à cette occasion : un facteur décimal saisi avec une virgule est stocké exact, et une liste d'alias est bien découpée en valeurs distinctes.
> 
> '''Ce qui reste.''' Le bloc de déclaration porté par la page de dimension, qui est la pièce la plus délicate et n'est pas éprouvée ; les pages de grandeur ; les trois propriétés par grandeur ; le modèle de caractéristique ; le formulaire de saisie ; les équivalences externes vers QUDT, laissées vides partout faute d'avoir lu les adresses ; enfin la liste complète des grandeurs, qui attend l'inventaire d'outils, et la reprise des trois valeurs de production.
```

Lecture :
- **`67c67`** : la ligne 67, paragraphe « Ce que porte une page de grandeur », reçoit la correction du 14 octobre 2026 juste après « un identifiant externe. ». Le reste de la ligne est inchangé.
- **`156a157,172`** : seize lignes insérées après la ligne 156. Ce sont une ligne vide, le titre `== Avancement de l'exécution ==` et les sept paragraphes de la section, séparés par des lignes vides. La ligne vide et le titre `== Dépendances ==` qui suivaient restent tels quels. `diff` présente le remplacement de la ligne de titre comme une insertion devant elle, ce qui revient au même.

Aucune modification non voulue.

## Contrôles supplémentaires, en lecture seule

- **Faits SMW de la page, avant et après** (`bin/wiki-api.sh --facts`) : seul `_MDAT` change (`1/2026/10/14/11/5/18/0` → `1/2026/10/15/15/8/5/0`). `Work_package_status` (`ouvert`), `Work_package_number`, les dates, les lots liés, le résumé, les deux requêtes `_ASK`, `_INST` (`Lot`) sont identiques.
- **Catégories** après écriture : `Catégorie:Lot`, seule.
- **Texte inséré** : aucun `[[`, `{{` ni `::` dans les deux remplacements (`grep -c` : 0). Il ne crée donc ni lien, ni modèle, ni annotation.

**Étape 7 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Questions posées hors consigne

Aucune question reçue hors consigne. La réponse au point A de la tâche 32 figure en tête de cette consigne et clôt ce point : rien d'autre à corriger de mon côté. Une question nouvelle à Cyril, point A ci-dessous.

**A.** Contexte : le paragraphe écrit sur la page dit « '''Onze pages créées le 14 octobre 2026.''' Le modèle, la catégorie et les sept rôles de caractéristique ; le modèle, la catégorie et les trois unités de la dimension longueur ». L'énumération compte quatorze pages : deux modèles (`Modèle:Characteristic role`, `Modèle:Unit`), deux catégories (`Catégorie:Rôle de caractéristique`, `Catégorie:Unité`), sept rôles et trois unités. C'est ce que montrent les rapports des tâches 28, 29 et 32. Sans les modèles ni les catégories, on en compterait dix ; aucun décompte ne donne onze. La consigne interdisait toute autre modification : le texte a été écrit tel quel. Question : faut-il corriger « Onze » en « Quatorze » ? Suggestion : oui, dans une tâche ultérieure, par un remplacement exact de ce seul mot et la même vérification par diff.

## Écarts et surprises

1. **Ordre des deux notes de correction en ligne 67.** La chaîne cherchée s'arrêtait juste avant une note existante, « Corrigé le 13 octobre 2026 : la version du 8 octobre écartait la dimension… ». La note du 14 octobre se trouve donc placée avant celle du 13 : le paragraphe lit les corrections de la plus récente à la plus ancienne. C'est le remplacement exact demandé, et je n'ai rien réordonné. Une remise dans l'ordre chronologique serait une écriture à part.
2. **Fichiers temporaires dans le scratchpad, et non dans `/tmp/lot21-avant.txt`.** La consigne citait `/tmp` en exemple. Les consignes de la session placent les fichiers temporaires dans le scratchpad, qui est lui aussi hors du dépôt. Fichiers : `lot21-avant.txt`, `lot21-apres-prevu.txt`, `lot21-publie.txt`, `lot21-diff.txt`, `lot21-faits-avant.txt`, `lot21-faits-apres.txt`, les quatre fichiers de chaînes et le programme.
3. **Un programme du scratchpad pour les remplacements.** Le second remplacement fait sept paragraphes, avec apostrophes, guillemets et accents : l'écrire dans une commande en ligne aurait été illisible et fragile. Le programme a été affiché en entier dans le message qui le lançait.
4. **Diff inséré dans ce rapport par concaténation.** Pour le citer octet pour octet, le rapport a été assemblé par `cat` à partir de deux parties écrites avec l'outil d'écriture de fichier et du fichier `lot21-diff.txt`, plutôt que recopié à la main.
5. **« Dix-sept propriétés […], aucune gelée. »** C'est exact pour les onze propriétés d'un type que le gel peut abîmer : leur type résolu a été lu et il est le bon. Pour les six de type Page, la lecture ne distingue pas un gel d'une déclaration réussie : on sait seulement qu'elles rendent le type voulu. Nuance sans conséquence pratique, qui n'appelle pas de correction.
6. `origin/main` n'avait pas bougé depuis la tâche 32 (`9652924`) : aucune avance rapide nécessaire avant le commit.
