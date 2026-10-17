# Lot 21, tâche 31 — les propriétés d'une page de grandeur et d'une page de dimension

Date : 14 octobre 2026 (horloge UTC du conteneur, 21:18 à 21:24). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

Cinq écritures sur le wiki, cinq créations par `bin/wiki-put.sh … --createonly`, une page à la fois, dans l'ordre de la consigne :

| Page | Résumé de modification | pageid | newrevid | Horodatage |
|---|---|---|---|---|
| `Attribut:Quantity symbol` | `[Lot 21][Tâche 31] Création de la propriété Quantity symbol (Texte, symbole usuel de la grandeur)` | 694 | 1627 | 2026-10-14T21:19:39Z |
| `Attribut:Quantity dimension` | `[Lot 21][Tâche 31] Création de la propriété Quantity dimension (Page, dimension physique de la grandeur)` | 695 | 1628 | 2026-10-14T21:19:45Z |
| `Attribut:Quantity type` | `[Lot 21][Tâche 31] Création de la propriété Quantity type (Texte, énumération fermée Quantity ou Temperature)` | 696 | 1629 | 2026-10-14T21:19:51Z |
| `Attribut:Corresponds to property` | `[Lot 21][Tâche 31] Création de la propriété Corresponds to property (Page, propriété portant les valeurs de la grandeur)` | 697 | 1630 | 2026-10-14T21:19:56Z |
| `Attribut:Main unit` | `[Lot 21][Tâche 31] Création de la propriété Main unit (Page, unité principale de la dimension)` | 698 | 1631 | 2026-10-14T21:20:02Z |

Les cinq appels ont rendu `"new": true` et `"result": "Success"`, code de sortie 0.

Contenu : exactement celui de chaque bloc de la consigne. Contrôles avant envoi : 5 lignes par fichier, 7 pour `Quantity type` ; aucune ligne `Property_domain` ni `Imported from` (`grep -c` : 0 pour les cinq). Contrôle après la lecture du type résolu : wikitexte relu par `bin/wiki-get.sh` et comparé par `diff` au fichier envoyé ; pour chaque page, seule la dernière ligne diffère (`5c5`, `7c7` pour `Quantity type`), par l'absence de saut de ligne final, que MediaWiki retire de tout wikitexte enregistré.

Aucune autre page écrite : aucune page de grandeur, de dimension ou d'unité, aucun modèle, aucune page `MediaWiki:Smw import`, et la page du lot n'a pas été corrigée ; ni les propriétés et pages créées auparavant dans le lot, ni `Attribut:Nominal diameter`, `Attribut:Secondary diameter`, `Attribut:Power rating`, `Attribut:Max thickness`, ni les bacs à sable `Test lot21b`, `Test lot21c`, `Test lot21d` et leurs modèles et propriétés d'essai.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas non plus.

**Étape 3 — absence des cinq pages.** Les cinq `"missing": true`, ns 102.

**Étape 4 — écritures.** Voir ci-dessus. `bin/wiki-login.sh` lancé avant : `Success Cywil`.

**Étape 5 — attente de la propagation.**
- `result: Success` confirmé pour les cinq.
- 21:20:08 UTC, première lecture des faits, sans filtre : **aucune des cinq pages ne portait `_CHGPRO`** ; toutes portaient déjà leurs faits directs. Voir Écarts, point 1.
- 21:22:50 UTC, relecture de confirmation après une pause de deux minutes : mêmes clés, toujours sans `_CHGPRO`.

Faits directs relevés (descriptions omises ici, présentes et conformes sur les cinq) :

| Page | `_TYPE` | `Property_cardinality` | `Property_range` | `_PVAL` | `_MDAT` |
|---|---|---|---|---|---|
| `Quantity symbol` | `…#_txt` | single | symbole de grandeur | — | 1/2026/10/14/21/19/39/0 |
| `Quantity dimension` | `…#_wpg` | single | page de dimension | — | 1/2026/10/14/21/19/45/0 |
| `Quantity type` | `…#_txt` | single | énumération fermée | Quantity, Temperature | 1/2026/10/14/21/19/51/0 |
| `Corresponds to property` | `…#_wpg` | single | page de propriété | — | 1/2026/10/14/21/19/56/0 |
| `Main unit` | `…#_wpg` | single | page d'unité | — | 1/2026/10/14/21/20/2/0 |

(`…` = `http://semantic-mediawiki.org/swivt/1.0`.) Chaque page porte aussi `_SKEY` à son nom.

**Délais réels de disparition de `_CHGPRO` : non mesurables.** La clé n'a été vue sur aucune des cinq pages. La première lecture est venue entre 6 et 29 secondes après chaque écriture : 29 s pour `Quantity symbol`, 23 s pour `Quantity dimension`, 17 s pour `Quantity type`, 12 s pour `Corresponds to property`, 6 s pour `Main unit`. Cette mesure ne distingue pas une clé jamais posée d'une clé disparue dans ce délai. Elle établit seulement que la clé était absente à ces instants, puis à nouveau à 21:22:50.

Pendant l'étape 5, aucune requête autre que la lecture des faits n'a été émise sur ces pages. `bin/wiki-wait-jobs.sh` n'a pas été lancé.

**Étape 6 — lecture des types résolus.** Lancée à 21:23:00 UTC. Requête exactement celle de la consigne.

Les sept typeid lus dans `query.printrequests`, tels quels (l'entrée au libellé vide, colonne du sujet, rendait `_wpg` et est ignorée) :

| Libellé | typeid | Rôle |
|---|---|---|
| `Quantity symbol` | `_txt` | créée, type Texte |
| `Quantity dimension` | `_wpg` | créée, type Page |
| `Quantity type` | `_txt` | créée, type Texte |
| `Corresponds to property` | `_wpg` | créée, type Page |
| `Main unit` | `_wpg` | créée, type Page |
| `Work package status` | `_txt` | témoin Texte |
| `Property domain` | `_wpg` | témoin Page |

Les deux témoins rendent chacun le type de leur genre : la lecture discrimine, elle est valide.

**Conclusion, propriété par propriété.**
- `Quantity symbol` : `_txt`, comme `Work package status`. **Conforme ; elle a franchi la barrière du type résolu.**
- `Quantity type` : `_txt`, comme `Work package status`. **Conforme ; barrière franchie.**
- `Quantity dimension` : `_wpg`, comme `Property domain`. **Elle rend le type voulu.**
- `Corresponds to property` : `_wpg`, comme `Property domain`. **Elle rend le type voulu.**
- `Main unit` : `_wpg`, comme `Property domain`. **Elle rend le type voulu.**

Pour ces trois dernières, **la barrière ne mord pas sur une propriété de type Page** : un gel rendrait lui aussi `_wpg`. La lecture constate leur type sans rien éprouver, et elles n'ont rien franchi.

Ni `Quantity symbol` ni `Quantity type` ne rend `_wpg` : **aucun gel.** Rien n'a été réparé ni réécrit.

**Étape 7 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Questions posées hors consigne

Aucune.

## Écarts et surprises

1. **`_CHGPRO` non observée, pour la première fois du lot.** Aux tâches 24 à 27 et 30, toute propriété créée portait `_CHGPRO` à la première lecture, faite entre 3 et 38 secondes après son écriture (heure non relevée à la tâche 24, mais lecture lancée aussitôt après l'écriture) ; à la tâche 30, les sept la portaient encore à 21:07:05, y compris celle écrite 38 secondes plus tôt. Ici, 6 à 29 secondes après les écritures, aucune des cinq ne la portait, et les faits directs étaient déjà stockés. La cause n'est pas mesurée : file de travaux vidée plus vite ce soir-là, ou propagation non déclenchée, rien ne permet de trancher. J'ai considéré la condition de l'étape 5 remplie, et j'ai ajouté une relecture des faits deux minutes plus tard, seule sonde permise, avant de lancer l'étape 6.
2. **Ordre des lectures.** Le wikitexte n'a été relu qu'après la lecture du type résolu, comme je l'ai proposé au point A de la tâche 30, resté sans réponse à ce jour. Pendant l'attente, seules les lectures de faits ont été émises.
3. **Bilan de la journée du 14 octobre 2026.** Dix-sept propriétés créées par les tâches 24 à 27, 30 et 31. Onze sont d'un type que le gel peut abîmer : aucune n'a gelé. Six sont de type Page, sur lesquelles la barrière ne mord pas.
4. **Page du lot.** Elle range encore `Main unit` parmi les propriétés de la page de grandeur. Comme demandé, elle n'a pas été touchée ; la correction relève d'une tâche ultérieure.
5. `origin/main` n'avait pas bougé depuis la tâche 30 (`b817bf1`) : aucune avance rapide nécessaire avant le commit.
