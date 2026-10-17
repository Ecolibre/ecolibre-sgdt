# Lot 21, tâche 24 — création de `Attribut:Characteristic mode`

Date : 14 octobre 2026. Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

Une seule écriture sur le wiki : création de `Attribut:Characteristic mode` par `bin/wiki-put.sh … --createonly`.

- Résumé : `[Lot 21][Tâche 24] Création de la propriété Characteristic mode (Texte, énumération fermée spécification/mesure)`
- Réponse de l'API : `"new": true`, `"result": "Success"`, pageid 673, `newrevid` 1605, `newtimestamp` 2026-10-14T16:57:39Z.
- Contenu : exactement les sept lignes de la consigne, sans ajout ni retrait. Relu par `bin/wiki-get.sh` et comparé par `diff` au fichier envoyé : seule différence, l'absence de saut de ligne final, que MediaWiki retire de tout wikitexte enregistré.

Aucune autre page écrite. Aucune page employant la propriété. Les pages `Attribut:Nominal diameter`, `Attribut:Secondary diameter`, `Attribut:Power rating`, `Attribut:Max thickness` et les bacs à sable `Test lot21b`, `Test lot21c`, `Test lot21d` n'ont été ni écrits ni interrogés.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide. Aucun fichier suivi modifié, aucun fichier non suivi.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle.

**Étape 3 — absence de la page.** `"missing": true`, ns 102. Le fichier de rapport n'existait pas non plus.

**Étape 4 — écriture.** Voir ci-dessus. `bin/wiki-login.sh` lancé avant : `Success Cywil`.

**Étape 5 — vérification.**
- `result: Success` confirmé.
- `bin/wiki-wait-jobs.sh` : cinq essais à `jobs=4`, puis « FILE FIGEE a 4 travaux », code de sortie 2. Fausse alerte connue (leçon de CLAUDE.md : estimation plafonnée, pas un décompte) ; rien n'a été réécrit.
- Premier passage `bin/wiki-api.sh --facts` sans filtre, à 16 h 57 UTC environ : seules `_CHGPRO` (portant en JSON `Property_cardinality`, les deux descriptions, `Property_range`, `_MDAT`, `_PVAL` = spécification, mesure, `_SKEY`, `_TYPE` = `#_txt`) et `_SKEY`. Pas un échec de stockage ; page non réécrite.
- Deuxième lecture, quelques minutes plus tard : toujours `_CHGPRO`.
- Troisième lecture, à 17 h 01 UTC : `_CHGPRO` disparue. Faits directs :
  - `Property_cardinality -> ['single']`
  - `Property_description_EN` et `Property_description_FR` présents, texte conforme
  - `Property_range -> ['énumération fermée']`
  - `_MDAT -> ['1/2026/10/14/16/57/39/0']`
  - `_PVAL -> ['spécification', 'mesure']`
  - `_SKEY -> ['Characteristic mode']`
  - `_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_txt']`

**Étape 6 — vérification qui tranche.** Lancée à 17 h 01 UTC, après disparition de `_CHGPRO` (voir Écarts). Requête exactement celle de la consigne.

Typeid lus dans `query.printrequests`, tels quels :

| Libellé | typeid |
|---|---|
| (vide — colonne du sujet, ignorée) | `_wpg` |
| `Characteristic mode` | `_txt` |
| `Work package status` (témoin) | `_txt` |

Le témoin rend son type, la lecture est donc valide. **La propriété créée rend `_txt`, le même typeid que le témoin : elle est conforme et a franchi la barrière du type résolu.** La deuxième propriété de structure peut être créée.

**Étape 7 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Questions posées hors consigne

Aucune.

## Écarts et surprises

1. **Délai entre l'étape 5 et l'étape 6, ajouté par l'exécuteur.** La consigne disait, si `_CHGPRO` portait encore les valeurs, de passer à l'étape suivante. CLAUDE.md (barrière avant d'employer une propriété neuve) interdit en revanche toute requête nommant une propriété créée tant que `_CHGPRO` n'a pas disparu de ses faits, seules les lectures de faits et `intestactions` étant permises pendant l'attente. J'ai appliqué CLAUDE.md : la requête `action=ask` de l'étape 6 n'a été émise qu'après disparition de `_CHGPRO`, environ quatre minutes après la création. La consigne et la règle sont à mettre d'accord pour les trois propriétés suivantes.
2. **`bin/wiki-wait-jobs.sh` a de nouveau annoncé « FILE FIGEE » à 4 travaux**, alors que la file de propagation s'est vidée d'elle-même en quatre minutes. Même fausse alerte que celle consignée dans CLAUDE.md ; dette d'outillage toujours ouverte.
3. **Création isolée, non gelée.** Pour le compte de l'entrée 59 : cette création isolée a rendu le bon type résolu dès la première lecture autorisée.
4. **Environnement.** Session cloud : le proxy sortant a cette fois laissé passer wiki.ecolibre.org (contraire de l'incident du 24 août 2026). La session de travail tournait sur la branche `claude/fervent-carson-98rx72`, identique à `origin/main` (7d0f236) au moment du commit ; poussée vers `main` comme demandé.
