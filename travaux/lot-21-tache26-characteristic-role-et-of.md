# Lot 21, tâche 26 — création de `Attribut:Characteristic role` et `Attribut:Characteristic of`

Date : 14 octobre 2026. Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

Deux écritures sur le wiki, deux créations par `bin/wiki-put.sh … --createonly` :

| Page | Résumé de modification | pageid | newrevid | Horodatage |
|---|---|---|---|---|
| `Attribut:Characteristic role` | `[Lot 21][Tâche 26] Création de la propriété Characteristic role (Page, rôle de la valeur portée par le sous-objet)` | 675 | 1608 | 2026-10-14T20:08:36Z |
| `Attribut:Characteristic of` | `[Lot 21][Tâche 26] Création de la propriété Characteristic of (Page, partie de l'item visée par la caractéristique)` | 676 | 1609 | 2026-10-14T20:08:41Z |

Les deux appels ont rendu `"new": true` et `"result": "Success"`, code de sortie 0.

Contenu : exactement les cinq lignes de la consigne pour chacune. Relu par `bin/wiki-get.sh` et comparé par `diff` au fichier envoyé : pour chaque page, seule différence, l'absence de saut de ligne final, que MediaWiki retire de tout wikitexte enregistré.

Aucune autre page écrite. Aucune page employant ces propriétés, aucune page de rôle. Ni `Attribut:Characteristic mode`, ni `Attribut:Tolerance as written`, ni `Attribut:Nominal diameter`, `Attribut:Secondary diameter`, `Attribut:Power rating`, `Attribut:Max thickness`, ni les bacs à sable `Test lot21b`, `Test lot21c`, `Test lot21d` n'ont été écrits ou interrogés.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas non plus.

**Étape 3 — absence des deux pages.** `Attribut:Characteristic of` et `Attribut:Characteristic role` : `"missing": true` toutes deux, ns 102.

**Étapes 4 et 5 — écritures.** Voir ci-dessus. `bin/wiki-login.sh` lancé avant : `Success Cywil`.

**Étape 6 — attente de la propagation.**
- `result: Success` confirmé pour chacune.
- 20:08:46 UTC : faits sans filtre des deux pages = `_CHGPRO` (portant en JSON les valeurs) et `_SKEY` seulement.
- 20:10:56 UTC (relecture suivante, après une pause de deux minutes) : `_CHGPRO` disparue des deux. Faits directs :

  `Attribut:Characteristic role`
  - `Property_cardinality -> ['single']`
  - `Property_description_EN` et `Property_description_FR` présents, texte conforme
  - `Property_range -> ['page de rôle de caractéristique']`
  - `_MDAT -> ['1/2026/10/14/20/8/36/0']`
  - `_SKEY -> ['Characteristic role']`
  - `_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_wpg']`

  `Attribut:Characteristic of`
  - `Property_cardinality -> ['single']`
  - `Property_description_EN` et `Property_description_FR` présents, texte conforme
  - `Property_range -> ["partie d'item définie par le lot 12"]`
  - `_MDAT -> ['1/2026/10/14/20/8/41/0']`
  - `_SKEY -> ['Characteristic of']`
  - `_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_wpg']`

- **Délais réels de disparition de `_CHGPRO`** : présente sur les deux à 20:08:46, absente des deux à 20:10:56. Soit au plus 2 min 20 s pour `Characteristic role` (écrite à 20:08:36) et au plus 2 min 15 s pour `Characteristic of` (écrite à 20:08:41). L'instant exact entre les deux lectures n'est pas mesuré.
- `bin/wiki-wait-jobs.sh` n'a pas été lancé. Aucune lecture de `intestactions`, aucune requête nommant les propriétés pendant l'attente.

**Étape 7 — lecture des types résolus.** Lancée à 20:11:04 UTC, après disparition de `_CHGPRO` des deux pages. Requête exactement celle de la consigne.

Typeid lus dans `query.printrequests`, tels quels :

| Libellé | typeid |
|---|---|
| (vide — colonne du sujet, ignorée) | `_wpg` |
| `Characteristic role` | `_wpg` |
| `Characteristic of` | `_wpg` |
| `Property domain` (témoin Page) | `_wpg` |
| `Work package status` (témoin Texte) | `_txt` |

Les deux témoins rendent chacun leur type : la lecture distingue bien Page de Texte, elle est valide.

**Conclusion.** `Characteristic role` et `Characteristic of` rendent `_wpg`, le même typeid que `Property domain` : elles rendent le type voulu. **La barrière du type résolu ne mord pas sur une propriété de type Page** : un gel rendrait lui aussi `_wpg`, et cette lecture ne distingue donc pas un gel d'une déclaration réussie. Ces deux propriétés n'ont rien franchi ; la lecture constate seulement que leur type résolu est celui voulu. Rien d'anormal n'a été relevé ; rien n'a été réparé ni réécrit.

**Étape 8 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Questions posées hors consigne

Aucune.

## Écarts et surprises

1. **Numérotation dans la consigne.** Le troisième paragraphe du contexte parle de « la lecture du type résolu de l'étape 8 ». Dans la consigne, cette lecture est l'étape 7 ; l'étape 8 est le relevé final des autorisations. J'ai compris l'étape 7, seule à lire un type résolu.
2. **Propagation régulière.** Trois créations le même jour (tâches 24, 25 et 26) : `_CHGPRO` a disparu en environ quatre minutes, puis en au plus deux minutes, puis en au plus deux minutes vingt pour deux propriétés créées à cinq secondes d'écart.
3. `origin/main` n'avait pas bougé depuis la tâche 25 (`09388f4`) : aucune avance rapide nécessaire avant le commit.
