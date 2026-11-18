# Lots 48 et 49 — création des pages de lot

Date : 18 novembre 2026. Exécuteur : Claude Code, session cloud, branche `claude/pensive-mayer-sss3kv`.

Consigne : créer les pages des lots 48 et 49 à partir de la demande du projet de coordination examinée le 18 novembre 2026. Rien d'autre n'a été écrit sur le wiki.

## Pages créées

| Lot | Titre | pageid | Révision | Horodatage (UTC) |
|---|---|---|---|---|
| 48 | Lot 48 — Espaces de formation verrouillés | 723 | 1804 | 2026-11-18T23:06:58Z |
| 49 | Lot 49 — Licence et provenance des fichiers | 724 | 1805 | 2026-11-18T23:07:05Z |

Les deux créations sont passées par `bin/wiki-put.sh ... --createonly`, avec les résumés prescrits :

- `[Lot 48][Création] Création de la page du lot : demande de coordination, mesures et décisions du 18 novembre 2026`
- `[Lot 49][Création] Création de la page du lot : demande de coordination, mesures et décisions du 18 novembre 2026`

## Contrôles avant écriture

- **Étape 1, état du dépôt** : `git status --porcelain` vide, aucune ligne bloquante. `.claude/settings.local.json` absent, donc aucune règle.
- **Étape 2, lots existants** : `Catégorie:Lot` comptait 47 membres, numérotés de 1 à 47 sans trou (comparaison de la liste triée des numéros à `range(1, 48)`). Aucun lot 48 ni 49.
- **Étape 3, séparateur** : relevé dans le titre du lot 47 rendu par l'API (`Lot 47 — Relecture de la conception au regard de la cible`) : espace U+0020, tiret cadratin U+2014, espace U+0020. Les deux titres ont été construits par programme à partir de ce séparateur, puis comparés à ceux passés en argument à `wiki-put.sh` : identiques. `prop=info` : les deux titres `missing`, `protection: []`.

## Contrôles après écriture (étape 6)

| Contrôle | Méthode | Résultat |
|---|---|---|
| Wikitexte relu identique au fichier | `bin/wiki-get.sh`, puis `diff` et comparaison octet par octet | **Passe** pour les deux pages. Le `diff` brut ne signale qu'une différence : le saut de ligne final de mes fichiers, ajouté par l'outil d'écriture après le marqueur de fin et retiré par MediaWiki à l'enregistrement. Fichier privé de ce seul saut de ligne final et page relue : identiques octet pour octet. Voir Écarts. |
| Faits sémantiques | `bin/wiki-api.sh --facts` (méthode `smwbrowse` prescrite par CLAUDE.md) | **Passe**. Lot 48 : `Work_package_number -> 48`, `Work_package_status -> identifié`. Lot 49 : `49`, `identifié`. `Work_package_summary` : une seule valeur par page, identique au résumé du fichier (comparaison exacte de chaînes). `_INST` porte `Lot` et rien d'autre. |
| Membres de `Catégorie:Lot` | `list=categorymembers` | **Passe** : 49 membres, numérotés de 1 à 49 sans trou. |
| Liens internes | `prop=links`, puis `generator=links` pour l'existence des cibles | **Passe** : chaque page porte un seul lien, vers `Gestion des lots` (pageid 484, existante). Aucun lien vers une page inexistante. Catégories : `Catégorie:Lot` seule, aucune catégorie de suivi. |

## Relevé de `.claude/settings.local.json`

- Début de tâche : fichier absent, aucune règle.
- Fin de tâche : fichier absent, aucune règle.

## Questions posées et réponses rendues hors consigne

Aucune.

## Écarts et surprises

1. **Saut de ligne final.** Le contenu fourni s'arrête sur `Voir aussi la [[Gestion des lots]].` ; l'outil d'écriture de fichier a terminé chaque fichier par un saut de ligne, que MediaWiki retire toujours en fin de page. Le `diff` brut n'est donc pas vide, sur cette seule ligne et pour cette seule raison. J'ai considéré le contrôle comme passé, puisque le contenu compris entre les marqueurs est identique octet pour octet à la page relue. Si l'architecte tient au `diff` vide au sens strict, il faut écrire le fichier sans saut de ligne final.
2. **Une phrase du lot 49 reprend une règle retirée.** Le point ouvert « Les noms des propriétés » donne parmi les conventions à tenir : « page de propriété écrite une seule fois, dans sa forme définitive ». CLAUDE.md, section « Barrière avant d'employer une propriété neuve », dit que les rédactions des 6 et 8 octobre 2026 qui prescrivaient cela « étaient fausses et sont retirées » : le verrou `smw-change-propagation-protection` se lève en quelques heures à quatre jours, et une déclaration se corrige quelques jours plus tard. J'ai publié le texte tel que fourni, comme le veut la consigne. La phrase est à reprendre à l'ouverture du lot 49 ou par un correctif.
3. **Les nouveaux titres emploient le tiret cadratin**, que le lot 48 lui-même dit voué à être remplacé par le lot 41. C'est conforme à la consigne (séparateur recopié depuis le lot 47) ; deux titres de plus à renommer quand le lot 41 sera mené.
4. **Clone superficiel.** `git rev-parse --is-shallow-repository` rend `true` dans cette session cloud. Sans incidence ici : aucune conclusion n'a été tirée d'un `git log`.
5. **Branches distantes.** Le `git fetch origin` a fait apparaître douze branches `claude/...` et `ccr-...` sur `origin`. Je ne les ai pas examinées : hors consigne.
