# Lot 22 — Tâche 10 — Correction d'un chiffre

Exécuteur : Claude Code, 9 octobre 2026. Une seule écriture sur le wiki : la
page du lot, par `bin/wiki-put.sh`. Le lot reste « ouvert ».

**Résultat : le recompte donne 18 extensions sans version déclarée, les mêmes
dix-huit que la liste de Cyril. La page du lot passe de « 17 » à « 18 »,
révision 1482 → 1483, sans aucun autre changement. Les cinq contrôles
passent.**

## Étape 1 — État du dépôt

`git status --porcelain` : vide. `.claude/settings.local.json` : `allow` et
`deny` vides.

## Étape 2 — Le recompte

**Mesure :** sur le cœur décompressé, dans
`/home/spheres/miroir-wiki/coeur/mediawiki-1.39/extensions/`, chaque
`extension.json` a été lu comme du JSON, et l'on a cherché la clé `version`
**au premier niveau** de l'objet. Ce n'est pas une recherche de texte : une
clé `version` imbriquée plus bas, ou `manifest_version`, ne compte pas.

```
40 dossiers | 0 sans extension.json | 18 sans version: AbuseFilter CategoryTree Cite CiteThisPage CodeEditor Gadgets ImageMap Lockdown MultimediaViewer Nuke PageImages PdfHandler Poem Renameuser Scribunto SecureLinkFixer SpamBlacklist TextExtracts
```

**Total : 18 sans version déclarée, donc 22 qui en déclarent une**, sur 40
dossiers. Tous les dossiers ont un `extension.json`.

Comparaison nom par nom avec la liste de Cyril :

| # | Liste de Cyril (serveur) | Recompte (cœur décompressé) |
|---|---|---|
| 1 | AbuseFilter | AbuseFilter |
| 2 | CategoryTree | CategoryTree |
| 3 | Cite | Cite |
| 4 | CiteThisPage | CiteThisPage |
| 5 | CodeEditor | CodeEditor |
| 6 | Gadgets | Gadgets |
| 7 | ImageMap | ImageMap |
| 8 | Lockdown | Lockdown |
| 9 | MultimediaViewer | MultimediaViewer |
| 10 | Nuke | Nuke |
| 11 | PageImages | PageImages |
| 12 | PdfHandler | PdfHandler |
| 13 | Poem | Poem |
| 14 | Renameuser | Renameuser |
| 15 | Scribunto | Scribunto |
| 16 | SecureLinkFixer | SecureLinkFixer |
| 17 | SpamBlacklist | SpamBlacklist |
| 18 | TextExtracts | TextExtracts |

**Identiques, aucun nom en plus ni en moins.** Le compte valant 18, la
correction a été faite.

## Étape 3 — La correction

**Titre de la page :** lu dans `Catégorie:Lot` (`list=categorymembers`),
« Lot 22 — Miroir local ».

**Révision avant : 1482.** Elle a été vérifiée par `prop=info` avant
l'écriture.

**Préparation :** le wikitexte de la révision 1482 a été lu par
`bin/wiki-get.sh`. La phrase « dont 17 ne déclarent aucune version » y
figurait **une seule fois**. Les deux autres « 17 » de la page sont des dates
(« 17 août 2026 ») et n'ont pas été touchés. La phrase a été remplacée par
`sed`, sur son texte exact, et le `diff` ne montrait qu'une ligne changée, la
ligne 28.

**Écriture :** `bin/wiki-put.sh`, résumé « [Lot 22][Tâche 10] Correction : 18
extensions sans version déclarée, et non 17 ». **Révision après : 1483.**

## Étape 4 — Vérifications

1. **QUI TRANCHE — passe.** Faits de la page par `bin/wiki-api.sh --facts`.

   | Fait | Avant (1482) | Après (1483) |
   |---|---|---|
   | `Work_package_number` | `22` | `22` |
   | `Work_package_opening_date` | `1/2026/10/9` | `1/2026/10/9` |
   | `Work_package_status` | `ouvert` | `ouvert` |
   | `Work_package_summary` | inchangé | inchangé |
   | `_ASK` | les trois mêmes requêtes | les trois mêmes requêtes |
   | `_INST` | `Lot#14##` | `Lot#14##` |
   | `_SKEY` | `Lot 22 — Miroir local` | inchangé |
   | `_MDAT` | `1/2026/10/9/22/55/4/0` | `1/2026/10/9/23/0/28/0` |

   Aucune annotation nouvelle : seule `_MDAT` a changé.

2. **Wikitexte relu — passe.** La révision 1483 a été relue par
   `bin/wiki-get.sh` et comparée octet par octet (`cmp -l`) à la révision
   1482 lue avant l'écriture. Les deux font 6 731 octets, et **un seul octet
   diffère** : l'octet 2782, `7` (octal 067) devenu `8` (octal 070). Le
   reste de la page est identique au caractère près.
3. **`prop=categories`** : `Catégorie:Lot` seulement.
4. **`prop=links`** : trois liens, `Gestion des lots`, `Lot 20 — External
   Data` et `Attribut:Work package status`, aucun vers une page inexistante.
5. **`.claude/settings.local.json`** : vide au début et à la fin.

## Questions posées ou réponses rendues hors consigne

- **Arrêt sur la procédure de clôture.** La première version de la consigne
  de la tâche 10 me demandait, à son étape 4, d'appliquer moi-même la
  *Procédure de clôture d'un lot* après la correction. `CLAUDE.md` me
  l'interdit : un message qui me demande d'appliquer cette procédure ne
  s'exécute pas. J'ai donc répondu en une ligne que ce texte relevait d'une
  conversation claude.ai, **sans lancer aucune commande**, pas même celles
  des étapes 1 à 3. Cyril a retiré l'étape 4 et renvoyé la consigne,
  restreinte à la correction. La clôture reste à la conversation claude.ai,
  qui enverra ensuite des consignes d'écriture ordinaires.

## Écarts et surprises

- **Un seul caractère a changé, pas deux.** La vérification 2 parlait des
  « deux caractères du nombre ». Comme seul le chiffre des unités passe de 7
  à 8, la mesure montre exactement un octet différent. Ce n'est pas un écart
  de résultat, seulement une précision de compte.
- **La liste de Cyril vient du serveur, la mienne du cœur décompressé.** Les
  deux sont identiques, ce qui confirme aussi que l'archive du 9 octobre a
  bien transporté les `extension.json` tels qu'ils sont en production.
