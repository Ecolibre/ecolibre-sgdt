# Lot 49 — correctif hors lot sur la règle d'écriture des pages de propriété

Date : 19 novembre 2026. Exécuteur : Claude Code, session cloud, branche `claude/pensive-mayer-sss3kv`.

Consigne : remplacer, sur la page du lot 49, la phrase qui reprenait une règle retirée (« page de propriété écrite une seule fois, dans sa forme définitive ») par la règle en vigueur. Écriture `[Correctif]`, le lot 49 n'étant pas ouvert. Rien d'autre n'a été écrit sur le wiki.

## Page modifiée

| | |
|---|---|
| Titre | Lot 49 — Licence et provenance des fichiers |
| pageid | 724 |
| Révision avant | 1805 (2026-11-18T23:07:05Z), seule révision de la page |
| Révision après | 1806 (2026-11-19T12:49:40Z) |
| Résumé | `[Correctif] Règle retirée sur l'écriture des pages de propriété, remplacée par celle des Limites connues` |
| Taille | 3 539 octets, puis 3 701 |

## Contrôles avant écriture

- **Étape 1** : `git status --porcelain` vide. `.claude/settings.local.json` absent, donc aucune règle. Branche alignée sur `origin/main` après `git fetch origin`.
- **Étape 2** : la page a été trouvée dans `Catégorie:Lot` (49 membres), pageid 724. Révision courante 1805 (`lastrevid` et `revid`), inchangée. Le wikitexte relu est identique octet pour octet à la relecture faite après la création, le 18 novembre.
- **Étape 3** : le passage ancien figurait une seule fois. Le remplacement a été fait par un script Python de session (`remplace49.py`, son contenu a été affiché avant l'exécution), qui n'écrit que si le compte vaut 1. Le `diff` entre l'avant et l'après porte sur une seule ligne, la ligne 45 (le point « Les noms des propriétés »). Le fichier compte 53 sauts de ligne avant comme après : la ligne modifiée reste une seule ligne physique.

## Contrôles après écriture (étape 5)

| Contrôle | Méthode | Résultat |
|---|---|---|
| Contenu identique au fichier envoyé | `bin/wiki-verify.sh` | **Passe** : « IDENTIQUE », code de sortie 0. |
| Passage ancien absent | `grep -c` sur la page relue par `bin/wiki-get.sh` | **Passe** : 0 occurrence. |
| Passage nouveau présent une fois | `grep -c` sur la page relue, phrase nouvelle complète | **Passe** : 1 occurrence. |
| Faits sémantiques inchangés | `bin/wiki-api.sh --facts` | **Passe** : `Work_package_number -> 49`, `Work_package_status -> identifié`. `Work_package_summary` : une seule valeur, identique au résumé de la révision 1805 (comparaison exacte de chaînes). `_MDAT` porte l'heure de la révision 1806 : les faits lus sont bien ceux de la nouvelle révision. `_INST` porte toujours `Lot` seule. |

Contrôle complémentaire, non demandé : `prop=links` montre toujours un seul lien, vers `Gestion des lots`. La phrase nouvelle cite les Limites connues sans lien, comme la consigne la donnait.

## Relevé de `.claude/settings.local.json`

- Début de tâche : fichier absent, aucune règle.
- Fin de tâche : fichier absent, aucune règle.

## Questions posées et réponses rendues hors consigne

Aucune.

## Écarts et surprises

1. **`bin/wiki-verify.sh` répondait déjà au point A du rapport du 18 novembre** (`travaux/lots-48-49-pages.md`). Son en-tête dit que `bin/wiki-get.sh` ne rend jamais de saut de ligne final, alors que l'outil d'écriture de fichier en ajoute presque toujours un, et que la comparaison ignore ce seul octet. Le 18 novembre, j'ai comparé par `diff` à la main, puis traité ce même octet à part. Avec `bin/wiki-verify.sh`, le contrôle aurait rendu « IDENTIQUE » sans qu'il soit besoin d'en parler. Ma comparaison donnait le même résultat, mais l'outil prévu existait et je ne l'ai pas employé. Le point A est donc réglé.
2. Aucun autre écart.
