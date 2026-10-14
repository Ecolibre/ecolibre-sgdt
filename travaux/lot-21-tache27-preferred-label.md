# Lot 21, tâche 27 — création de `Attribut:Preferred label`

Date : 14 octobre 2026. Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

Une seule écriture sur le wiki : création de `Attribut:Preferred label` par `bin/wiki-put.sh … --createonly`.

- Résumé : `[Lot 21][Tâche 27] Création de la propriété Preferred label (Monolingual text, libellé par langue des pages de vocabulaire)`
- Réponse de l'API : `"new": true`, `"result": "Success"`, pageid 677, `newrevid` 1610, `newtimestamp` 2026-10-14T20:33:59Z, code de sortie 0.
- Contenu : exactement les cinq lignes de la consigne. Relu par `bin/wiki-get.sh` et comparé par `diff` au fichier envoyé : seule différence, l'absence de saut de ligne final, que MediaWiki retire de tout wikitexte enregistré.
- Aucune ligne `Imported from` (contrôlé par `grep` sur le fichier envoyé : 0 occurrence), aucune page `MediaWiki:Smw import` créée ni lue.

Aucune autre page écrite. Aucune page employant la propriété, aucune page de vocabulaire. Ni les quatre propriétés de structure (`Characteristic mode`, `Tolerance as written`, `Characteristic role`, `Characteristic of`), ni `Attribut:Nominal diameter`, `Attribut:Secondary diameter`, `Attribut:Power rating`, `Attribut:Max thickness`, ni les bacs à sable `Test lot21b`, `Test lot21c`, `Test lot21d` et leurs propriétés d'essai n'ont été écrits. Seule la propriété d'essai `Test lot21b libellé` a été lue, comme témoin, dans la requête de l'étape 6.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas non plus.

**Étape 3 — absence de la page.** `"missing": true`, ns 102.

**Étape 4 — écriture.** Voir ci-dessus. `bin/wiki-login.sh` lancé avant : `Success Cywil`.

**Étape 5 — attente de la propagation.**
- `result: Success` confirmé.
- 20:34:03 UTC (4 s après l'écriture) : faits sans filtre = `_CHGPRO` et `_SKEY` seulement. La charge de `_CHGPRO` portait notamment `_TYPE` = `…swivt/1.0#_mlt_rec` (lu dans les faits de la page, sans requête nommant la propriété).
- 20:36:15 UTC (relecture suivante, après une pause de deux minutes) : `_CHGPRO` disparue. Faits directs :
  - `Property_cardinality -> ['multiple']`
  - `Property_description_EN` et `Property_description_FR` présents, texte conforme
  - `Property_range -> ['libellé avec code de langue']`
  - `_MDAT -> ['1/2026/10/14/20/33/59/0']`
  - `_SKEY -> ['Preferred label']`
  - `_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_mlt_rec']`
- **Délai réel de disparition de `_CHGPRO` : au plus 2 min 16 s** (présente à 20:34:03, absente à 20:36:15, pour une écriture à 20:33:59 ; l'instant exact entre les deux lectures n'est pas mesuré).
- `bin/wiki-wait-jobs.sh` n'a pas été lancé. Aucune lecture de `intestactions`, aucune requête nommant la propriété pendant l'attente.

**Étape 6 — vérification qui tranche.** Lancée à 20:36:21 UTC, après disparition de `_CHGPRO`. Requête exactement celle de la consigne.

Typeid lus dans `query.printrequests`, tels quels :

| Libellé | typeid |
|---|---|
| (vide — colonne du sujet, ignorée) | `_wpg` |
| `Preferred label` | `_mlt_rec` |
| `Test lot21b libellé` (témoin Monolingual text) | `_mlt_rec` |
| `Work package status` (témoin Texte) | `_txt` |

Les deux témoins rendent chacun leur type : la lecture discrimine, elle est valide.

**Conclusion.** `Preferred label` rend `_mlt_rec`, le même typeid que `Test lot21b libellé`, lu dans la même requête : **elle est conforme et a franchi la barrière du type résolu.** Ici la barrière mord réellement : `_mlt_rec` est distinct de `_wpg`, un gel se serait vu. Rien n'a été réparé ni réécrit.

**Étape 7 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Questions posées hors consigne

Aucune.

## Écarts et surprises

1. **Lecture supplémentaire pendant l'attente, dans le périmètre permis.** À la première relecture, j'ai extrait de la charge `_CHGPRO` les trois propriétés spéciales qu'elle portait (`_MDAT`, `_SKEY`, `_TYPE`) par un `grep` sur la sortie de `bin/wiki-api.sh --facts`. C'est une lecture des faits de la page, non une requête nommant la propriété ; elle n'a rien changé à la suite. Elle montre que `_TYPE` valait déjà `_mlt_rec` avant la fin de la propagation, ce qui, conformément à CLAUDE.md, ne valait pas barrière.
2. **Propagation régulière.** Cinq propriétés créées le 14 octobre 2026 (tâches 24 à 27) : `_CHGPRO` a disparu en environ quatre minutes pour la première, puis en au plus deux minutes et quelques secondes pour les quatre suivantes. Aucun gel sur les trois dont le type pouvait en subir un (`Characteristic mode`, `Tolerance as written`, `Preferred label`).
3. `origin/main` n'avait pas bougé depuis la tâche 26 (`319c48f`) : aucune avance rapide nécessaire avant le commit.
