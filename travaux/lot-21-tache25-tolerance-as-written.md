# Lot 21, tâche 25 — création de `Attribut:Tolerance as written`

Date : 14 octobre 2026. Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

Une seule écriture sur le wiki : création de `Attribut:Tolerance as written` par `bin/wiki-put.sh … --createonly`.

- Résumé : `[Lot 21][Tâche 25] Création de la propriété Tolerance as written (Texte libre, forme d'origine de la tolérance)`
- Réponse de l'API : `"new": true`, `"result": "Success"`, pageid 674, `newrevid` 1607, `newtimestamp` 2026-10-14T19:59:33Z.
- Contenu : exactement les cinq lignes de la consigne. Relu par `bin/wiki-get.sh` et comparé par `diff` au fichier envoyé : seule différence, l'absence de saut de ligne final, que MediaWiki retire de tout wikitexte enregistré.

Aucune autre page écrite. Aucune page employant la propriété. Ni `Attribut:Characteristic mode`, ni `Attribut:Nominal diameter`, `Attribut:Secondary diameter`, `Attribut:Power rating`, `Attribut:Max thickness`, ni les bacs à sable `Test lot21b`, `Test lot21c`, `Test lot21d` n'ont été écrits ou interrogés.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle.

**Étape 3 — absence de la page.** `"missing": true`, ns 102. Le fichier de rapport n'existait pas non plus.

**Étape 4 — écriture.** Voir ci-dessus. `bin/wiki-login.sh` lancé avant : `Success Cywil`.

**Étape 5 — attente de la propagation.**
- `result: Success` confirmé.
- 19:59:36 UTC (3 s après l'écriture) : faits sans filtre = `_CHGPRO` (portant en JSON les valeurs) et `_SKEY` seulement.
- 20:01:43 UTC : `_CHGPRO` disparue. Faits directs :
  - `Property_cardinality -> ['single']`
  - `Property_description_EN` et `Property_description_FR` présents, texte conforme
  - `Property_range -> ['texte libre']`
  - `_MDAT -> ['1/2026/10/14/19/59/33/0']`
  - `_SKEY -> ['Tolerance as written']`
  - `_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_txt']`
- **Délai réel de disparition de `_CHGPRO` : au plus 2 min 10 s** (absente à la première relecture après l'écriture de 19:59:33 ; l'instant exact entre 19:59:36 et 20:01:43 n'est pas mesuré).
- `bin/wiki-wait-jobs.sh` n'a pas été lancé, conformément à la consigne. Aucune lecture de `intestactions`, aucune requête nommant la propriété pendant l'attente.

**Étape 6 — vérification qui tranche.** Lancée à 20:01:48 UTC, après disparition de `_CHGPRO`. Requête exactement celle de la consigne.

Typeid lus dans `query.printrequests`, tels quels :

| Libellé | typeid |
|---|---|
| (vide — colonne du sujet, ignorée) | `_wpg` |
| `Tolerance as written` | `_txt` |
| `Work package status` (témoin) | `_txt` |

Le témoin rend son type, la lecture est valide. **La propriété créée rend `_txt`, le même typeid que le témoin : elle est conforme et a franchi la barrière du type résolu.**

**Étape 7 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Questions posées hors consigne

Aucune.

## Écarts et surprises

1. **`origin/main` avait avancé depuis la tâche 24** (`ed75d39`, cadrage du lot 43). Branche locale avancée en avance rapide (`git merge --ff-only origin/main`) avant le commit du rapport, sans aucun conflit ; aucune réécriture d'historique.
2. **Propagation deux fois plus rapide qu'à la tâche 24** (au plus deux minutes contre environ quatre). Deux créations isolées, deux types résolus justes : pour le compte de l'entrée 59 des Limites connues.
3. Rien d'autre.
