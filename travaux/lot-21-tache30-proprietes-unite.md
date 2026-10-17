# Lot 21, tâche 30 — les sept propriétés que porte une page d'unité

Date : 14 octobre 2026 (horloge UTC du conteneur, 21:05 à 21:11). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

Sept écritures sur le wiki, sept créations par `bin/wiki-put.sh … --createonly`, une page à la fois, dans l'ordre de la consigne :

| Page | Résumé de modification | pageid | newrevid | Horodatage |
|---|---|---|---|---|
| `Attribut:Unit symbol` | `[Lot 21][Tâche 30] Création de la propriété Unit symbol (Texte, symbole d'unité tapé à la saisie)` | 687 | 1620 | 2026-10-14T21:06:27Z |
| `Attribut:Unit alias` | `[Lot 21][Tâche 30] Création de la propriété Unit alias (Texte, autres écritures acceptées à la saisie)` | 688 | 1621 | 2026-10-14T21:06:32Z |
| `Attribut:Unit dimension` | `[Lot 21][Tâche 30] Création de la propriété Unit dimension (Page, dimension physique de l'unité)` | 689 | 1622 | 2026-10-14T21:06:38Z |
| `Attribut:Conversion factor` | `[Lot 21][Tâche 30] Création de la propriété Conversion factor (Nombre, facteur vers l'unité principale de la dimension)` | 690 | 1623 | 2026-10-14T21:06:43Z |
| `Attribut:UCUM code` | `[Lot 21][Tâche 30] Création de la propriété UCUM code (Texte, code de l'unité dans la nomenclature UCUM)` | 691 | 1624 | 2026-10-14T21:06:49Z |
| `Attribut:SI status` | `[Lot 21][Tâche 30] Création de la propriété SI status (Texte, énumération fermée de la place dans le SI)` | 692 | 1625 | 2026-10-14T21:06:54Z |
| `Attribut:External equivalent` | `[Lot 21][Tâche 30] Création de la propriété External equivalent (URL, équivalent dans un vocabulaire externe)` | 693 | 1626 | 2026-10-14T21:06:59Z |

Les sept appels ont rendu `"new": true` et `"result": "Success"`, code de sortie 0.

Contenu : exactement celui de chaque bloc de la consigne. Contrôles avant envoi : 5 lignes par fichier, 10 pour `SI status` ; aucune ligne `Property_domain` ni `Imported from` (`grep -c` : 0 pour les sept) ; le « µ » d'`Unit alias`, dans ses deux occurrences, est U+00B5 (signe micro, octets `c2 b5`). Contrôle après coup, une fois `_CHGPRO` disparue (voir Écarts, point 1) : wikitexte relu par `bin/wiki-get.sh` et comparé par `diff` au fichier envoyé ; pour chaque page, seule la dernière ligne diffère (`5c5`, `10c10` pour `SI status`), par l'absence de saut de ligne final, que MediaWiki retire de tout wikitexte enregistré.

Aucune autre page écrite : aucune page d'unité, de dimension, aucun modèle, aucune page `MediaWiki:Smw import` ; ni les propriétés et pages créées auparavant dans le lot, ni `Attribut:Nominal diameter`, `Attribut:Secondary diameter`, `Attribut:Power rating`, `Attribut:Max thickness`, ni les bacs à sable `Test lot21b`, `Test lot21c`, `Test lot21d` et leurs modèles et propriétés d'essai.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas non plus.

**Étape 3 — absence des sept pages.** Les sept `"missing": true`, ns 102.

**Étape 4 — écritures.** Voir ci-dessus. `bin/wiki-login.sh` lancé avant : `Success Cywil`.

**Étape 5 — attente de la propagation.**
- `result: Success` confirmé pour les sept.
- 21:07:05 UTC : les sept pages ne portaient que `_CHGPRO` et `_SKEY`.
- 21:09:47 UTC (relecture suivante, après une pause de deux minutes) : `_CHGPRO` disparue des sept. Faits directs, descriptions omises ici (présentes et conformes sur les sept) :

| Page | `_TYPE` | `Property_cardinality` | `Property_range` | `_PVAL` | `_MDAT` |
|---|---|---|---|---|---|
| `Unit symbol` | `…#_txt` | single | symbole d'unité | — | 1/2026/10/14/21/6/27/0 |
| `Unit alias` | `…#_txt` | multiple | écriture acceptée à la saisie | — | 1/2026/10/14/21/6/32/0 |
| `Unit dimension` | `…#_wpg` | single | page de dimension | — | 1/2026/10/14/21/6/38/0 |
| `Conversion factor` | `…#_num` | single | nombre pur | — | 1/2026/10/14/21/6/43/0 |
| `UCUM code` | `…#_txt` | single | code UCUM | — | 1/2026/10/14/21/6/49/0 |
| `SI status` | `…#_txt` | single | énumération fermée | unité de base, unité dérivée, multiple ou sous-multiple, acceptée avec le SI, hors SI | 1/2026/10/14/21/6/54/0 |
| `External equivalent` | `…#_uri` | multiple | adresse d'un vocabulaire externe | — | 1/2026/10/14/21/6/59/0 |

(`…` = `http://semantic-mediawiki.org/swivt/1.0`.) Chaque page porte aussi `_SKEY` à son nom.

**Délais réels de disparition de `_CHGPRO`.** Présente sur les sept à 21:07:05, absente des sept à 21:09:47. L'instant exact entre ces deux lectures n'est pas mesuré ; les bornes sont donc, par page :

| Page | Écrite à | Délai |
|---|---|---|
| `Unit symbol` | 21:06:27 | entre 38 s et 3 min 20 s |
| `Unit alias` | 21:06:32 | entre 33 s et 3 min 15 s |
| `Unit dimension` | 21:06:38 | entre 27 s et 3 min 9 s |
| `Conversion factor` | 21:06:43 | entre 22 s et 3 min 4 s |
| `UCUM code` | 21:06:49 | entre 16 s et 2 min 58 s |
| `SI status` | 21:06:54 | entre 11 s et 2 min 53 s |
| `External equivalent` | 21:06:59 | entre 6 s et 2 min 48 s |

Pendant l'attente, aucune requête autre que la lecture des faits n'a été émise sur ces pages. `bin/wiki-wait-jobs.sh` n'a pas été lancé.

**Étape 6 — la vérification qui tranche.** Lancée à 21:10:01 UTC, après disparition de `_CHGPRO` des sept pages. Requête exactement celle de la consigne.

Les onze typeid lus dans `query.printrequests`, tels quels (l'entrée au libellé vide, colonne du sujet, rendait `_wpg` et est ignorée) :

| Libellé | typeid | Rôle |
|---|---|---|
| `Unit symbol` | `_txt` | créée |
| `Unit alias` | `_txt` | créée |
| `Unit dimension` | `_wpg` | créée |
| `Conversion factor` | `_num` | créée |
| `UCUM code` | `_txt` | créée |
| `SI status` | `_txt` | créée |
| `External equivalent` | `_uri` | créée |
| `Work package status` | `_txt` | témoin Texte |
| `Property domain` | `_wpg` | témoin Page |
| `Planting rank` | `_num` | témoin Nombre |
| `Foaf:homepage` | `_uri` | témoin URL |

Les quatre témoins rendent chacun le type de leur genre : la lecture discrimine, elle est valide.

**Conclusion, propriété par propriété.**
- `Unit symbol` : `_txt`, comme `Work package status`. **Conforme ; elle a franchi la barrière du type résolu.**
- `Unit alias` : `_txt`, comme `Work package status`. **Conforme ; barrière franchie.**
- `UCUM code` : `_txt`, comme `Work package status`. **Conforme ; barrière franchie.**
- `SI status` : `_txt`, comme `Work package status`. **Conforme ; barrière franchie.**
- `Conversion factor` : `_num`, comme `Planting rank`. **Conforme ; barrière franchie.**
- `External equivalent` : `_uri`, comme `Foaf:homepage`. **Conforme ; barrière franchie.**
- `Unit dimension` : `_wpg`, comme `Property domain`. **Elle rend le type voulu.** La barrière ne mord pas sur une propriété de type Page, puisqu'un gel rendrait lui aussi `_wpg` : elle n'a rien franchi, la lecture constate seulement que son type résolu est celui voulu.

Aucune propriété autre que `Unit dimension` ne rend `_wpg` : **aucun gel.** Rien n'a été réparé ni réécrit.

**Étape 7 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Questions posées hors consigne

Aucune.

## Écarts et surprises

1. **Lecture du wikitexte pendant l'attente de `_CHGPRO`, aux tâches 24 à 27.** `bin/wiki-get.sh` émet `action=parse&page=…&prop=wikitext`. Ce n'est ni une lecture de faits ni `intestactions`, seules sondes que CLAUDE.md permet pendant l'attente. Aux tâches 24, 25, 26 et 27, je l'avais lancé juste après chaque écriture de propriété, donc pendant l'attente, sans le signaler. Aucune de ces propriétés n'a gelé, mais la règle n'était pas respectée. Je ne sais pas si un `action=parse` sur une page de propriété peut résoudre un type : ce n'est pas mesuré. Ici, la comparaison du wikitexte a été repoussée après l'étape 6.
2. **Un `cd` dans une commande composée.** Pour compter les lignes des sept fichiers de contenu, j'ai écrit `cd <scratchpad> && wc … && grep … ; grep … | od …`. CLAUDE.md n'admet un `cd` que seul, dans une commande à part. Cette commande ne faisait aucun appel à `bin/`. Le répertoire courant a été ramené à la racine du dépôt, par l'outil puis par un `cd` seul, et vérifié par `pwd` avant le premier appel à `bin/`.
3. **Boucles.** La lecture des faits des sept pages s'est faite par une boucle, conformément au seuil de six éléments de CLAUDE.md. La comparaison du wikitexte, qui associe à chaque titre un fichier différent, a été déroulée en sept commandes enchaînées : une boucle sur des paires aurait demandé un découpage de chaîne, moins lisible.
4. **Affichage tronqué.** La ligne `Property_description_FR` de `SI status` s'est affichée terminée par « � » : `cut -c` a coupé un caractère accentué en son milieu. Ce n'est pas la donnée : la comparaison du wikitexte est sans écart.
5. **Rafale sans gel.** Sept propriétés créées en 32 secondes, aucune gelée. Sur la journée du 14 octobre 2026 : douze propriétés créées par les tâches 24 à 27 et 30, dont neuf d'un type que le gel peut abîmer, aucune gelée. Cela confirme, sans rien prouver de plus, que la rafale ne décide pas du gel (CLAUDE.md).
6. **Propagation un peu plus lente qu'aux tâches 25 à 27** : la borne haute passe d'environ 2 min 20 s à 3 min 20 s. L'écart entre les deux lectures, de 2 min 42 s, ne permet pas de dire si le délai réel a changé.
7. **Dates.** Par l'horloge UTC du conteneur, toutes les propriétés et pages du lot citées par la consigne comme créées « hier et aujourd'hui » l'ont été le 14 octobre 2026. Sans conséquence.
8. `origin/main` n'avait pas bougé depuis la tâche 29 (`909b17d`) : aucune avance rapide nécessaire avant le commit.
