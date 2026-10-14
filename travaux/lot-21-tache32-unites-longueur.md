# Lot 21, tâche 32 — le modèle d'unité, sa catégorie et les trois unités de la dimension longueur

Date : 14 octobre 2026 (horloge UTC du conteneur, 21:34 à 21:40). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

Cinq écritures sur le wiki, cinq créations par `bin/wiki-put.sh … --createonly`, une page à la fois, dans l'ordre de la consigne :

| Page | Résumé de modification | pageid | newrevid | Horodatage |
|---|---|---|---|---|
| `Modèle:Unit` | `[Lot 21][Tâche 32] Création du modèle des pages d'unité` | 699 | 1632 | 2026-10-14T21:35:41Z |
| `Catégorie:Unité` (demandée sous `Category:`) | `[Lot 21][Tâche 32] Création de la catégorie des unités` | 700 | 1633 | 2026-10-14T21:35:47Z |
| `Mètre` | `[Lot 21][Tâche 32] Création de la page d'unité Mètre, unité principale de la dimension longueur` | 701 | 1634 | 2026-10-14T21:35:53Z |
| `Millimètre` | `[Lot 21][Tâche 32] Création de la page d'unité Millimètre` | 702 | 1635 | 2026-10-14T21:35:58Z |
| `Micromètre` | `[Lot 21][Tâche 32] Création de la page d'unité Micromètre, avec ses deux alias de saisie` | 703 | 1636 | 2026-10-14T21:36:04Z |

Les cinq appels ont rendu `"new": true` et `"result": "Success"`, code de sortie 0.

Contenu : exactement celui de chaque bloc de la consigne. Contrôles avant envoi : 33, 5, 13, 13 et 14 lignes ; 92 accolades ouvrantes et 92 fermantes dans le modèle ; `|+sep=,` en ligne 6, immédiatement sous `|Unit alias={{{alias|}}}` en ligne 5 ; les deux « µ » de `Micromètre` sont U+00B5 (signe micro, octets `c2 b5`). Contrôle après coup : wikitexte relu par `bin/wiki-get.sh` et comparé par `diff` au fichier envoyé ; pour chaque page, seule la dernière ligne diffère (`33c33`, `5c5`, `13c13`, `13c13`, `14c14`), par l'absence de saut de ligne final, que MediaWiki retire de tout wikitexte enregistré.

Aucune autre page écrite : ni `Dimension longueur`, ni aucune page de grandeur, ni la page du lot ; ni les propriétés et pages créées auparavant dans le lot, ni `Attribut:Nominal diameter`, `Attribut:Secondary diameter`, `Attribut:Power rating`, `Attribut:Max thickness`, ni les bacs à sable `Test lot21b`, `Test lot21c`, `Test lot21d` et leurs modèles et propriétés d'essai.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas non plus.

**Étape 3 — absence des cinq pages.** Les cinq `"missing": true` : `Micromètre`, `Millimètre`, `Mètre` (ns 0), `Catégorie:Unité` (ns 14), `Modèle:Unit` (ns 10). L'API a normalisé `Category:Unité` en `Catégorie:Unité`.

**Étapes 4, 5 et 6 — écritures.** Voir ci-dessus. `bin/wiki-login.sh` lancé avant : `Success Cywil`.

**Étape 7 — vérification par les valeurs.** Requête lancée à 21:38:24 UTC, 2 min 20 s après la dernière écriture, exactement celle de la consigne. Trois pages rendues (`"count":3`). Typeid des colonnes : `Unit symbol` `_txt`, `Conversion factor` `_num`, `Unit alias` `_txt`, `SI status` `_txt`, `Unit dimension` `_wpg`, `UCUM code` `_txt`.

| Page | Unit symbol | Conversion factor | Unit alias | SI status | Unit dimension | UCUM code |
|---|---|---|---|---|---|---|
| `Mètre` | `m` | `1` | (aucun) | unité de base | Dimension longueur (`"exists":""`) | `m` |
| `Micromètre` | `µm` | `1.0e-6` | `micron`, `um` | multiple ou sous-multiple | Dimension longueur (`"exists":""`) | `um` |
| `Millimètre` | `mm` | `0.001` | (aucun) | multiple ou sous-multiple | Dimension longueur (`"exists":""`) | `mm` |

Les trois points décisifs, un à un :

- **Les facteurs, tels qu'ils sont rendus.** Par `action=ask` (nombres JSON) : `Mètre` → `1`, `Millimètre` → `0.001`, `Micromètre` → `1.0e-6`. Par les faits (`smwbrowse`, chaînes) : `'1'`, `'0.001'`, `'1.0E-6'`. Aucun n'est absent, nul, arrondi ni faux : **les écritures françaises `0,001` et `0,000001` sont stockées exactes**, aux notations de SMW près (point décimal, exposant pour le micromètre).
- **Le découpage des alias.** `Micromètre` rend **deux valeurs distinctes** : `micron` et `um` par `action=ask`, qui les trie, et `um` puis `micron` dans les faits, dans l'ordre de saisie. Aucune valeur ne contient de virgule : **le séparateur `+sep=,` a été pris en compte.**
- **Le statut SI** est rendu sur les trois pages : `unité de base` pour `Mètre`, `multiple ou sous-multiple` pour `Millimètre` et `Micromètre`. Aucune valeur n'a été refusée.

**Étape 8 — vérification par la structure.** Lancée à 21:38:37 UTC, par `action=smwbrowse&browse=subject` au lieu de `action=browsebysubject` (voir Écarts, point 1) ; même hôte, même sujet `Micromètre`, même `format=json&formatversion=2`. Sortie telle quelle :

```
{"query":{"subject":"Micromètre#0##","data":[{"property":"Conversion_factor","dataitem":[{"type":1,"item":"1.0E-6"}]},{"property":"Preferred_label","dataitem":[{"type":9,"item":"Micromètre#0##_MLa3a96bace363a54de3cfb63dff051910"},{"type":9,"item":"Micromètre#0##_ML7d3f2a4b389958a71f7baf516994d27e"}]},{"property":"SI_status","dataitem":[{"type":2,"item":"multiple ou sous-multiple"}]},{"property":"UCUM_code","dataitem":[{"type":2,"item":"um"}]},{"property":"Unit_alias","dataitem":[{"type":2,"item":"um"},{"type":2,"item":"micron"}]},{"property":"Unit_dimension","dataitem":[{"type":9,"item":"Dimension_longueur#0##"}]},{"property":"Unit_symbol","dataitem":[{"type":2,"item":"µm"}]},{"property":"_INST","dataitem":[{"type":9,"item":"Unité#14##"}]},{"property":"_MDAT","dataitem":[{"type":6,"item":"1/2026/10/14/21/36/4/0"}]},{"property":"_SKEY","dataitem":[{"type":2,"item":"Micromètre"}]}],"sobj":[{"subject":"Micromètre#0##_MLa3a96bace363a54de3cfb63dff051910","data":[{"property":"_LCODE","dataitem":[{"type":2,"item":"fr"}]},{"property":"_SKEY","dataitem":[{"type":2,"item":"Micromètre#micromètre;fr"}]},{"property":"_TEXT","dataitem":[{"type":2,"item":"micromètre"}]}]},{"subject":"Micromètre#0##_ML7d3f2a4b389958a71f7baf516994d27e","data":[{"property":"_LCODE","dataitem":[{"type":2,"item":"en"}]},{"property":"_SKEY","dataitem":[{"type":2,"item":"Micromètre#micrometre;en"}]},{"property":"_TEXT","dataitem":[{"type":2,"item":"micrometre"}]}]}],"serializer":"SMW\\Serializers\\SemanticDataSerializer","version":2},"meta":{"type":"subject"}}
```

Lecture, point par point contre l'attendu :
- `Preferred_label` : deux sous-objets, `micromètre`/`fr` et `micrometre`/`en` — oui ;
- `Unit_alias` : deux valeurs, `um` et `micron` — oui ;
- `Unit_symbol` (`µm`), `Unit_dimension` (`Dimension_longueur`), `Conversion_factor` (`1.0E-6`, type numérique), `UCUM_code` (`um`), `SI_status` (`multiple ou sous-multiple`) — présents ;
- `_INST` vers `Unité#14##` — oui ;
- aucune autre propriété non préfixée d'un souligné : oui. Pas d'`External_equivalent` (paramètre vide, non stocké), pas de `_ERRC`.

**Concordance.** Pour `Micromètre`, les deux lectures disent la même chose : même facteur (`1.0e-6` et `1.0E-6` sont deux écritures de la même valeur), mêmes deux alias, même statut SI, même symbole, même code UCUM, même dimension. **Elles concordent.**

**Conclusion.** Les deux points que la tâche devait éprouver sont mesurés, et favorablement. En locale française, un facteur de type Number écrit avec une virgule décimale, jusqu'à `0,000001`, est stocké exact. La liste d'alias est découpée en deux valeurs par `+sep=,`. Rien n'a été corrigé ni réécrit.

**Étape 9 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Contrôles supplémentaires, en lecture seule

- **Catégories et liens** (`prop=categories|links`) : `Modèle:Unit`, aucune catégorie et aucun lien ; `Catégorie:Unité`, aucune catégorie, un lien vers `Modèle:Unit`, qui existe ; `Mètre`, `Millimètre`, `Micromètre`, chacune la seule catégorie `Catégorie:Unité`, sans catégorie de suivi, et un seul lien, vers `Dimension longueur`, page inexistante : c'est le lien rouge voulu par la consigne.
- **Faits de `Catégorie:Unité`** : `_MDAT` et `_SKEY` seulement.
- **Faits de `Mètre` et de `Millimètre`** : mêmes propriétés que `Micromètre`, hormis `Unit_alias`, absente puisque le paramètre est vide ; facteurs `'1'` et `'0.001'` ; ni `External_equivalent`, ni `_ERRC`.
- **Octets du symbole stocké** : `Unit_symbol` de `Micromètre` vaut `c2 b5` suivi de `m`, soit U+00B5 : le signe micro est stocké tel qu'écrit, sans normalisation.
- **Rendu de `Micromètre`** (`action=parse`, texte débarrassé de ses balises) : tableau « Unité » complet, puis la section « Les alias de saisie ». Aucune balise d'erreur, aucun avertissement SMW, un seul lien rouge (`Dimension longueur`).

## Questions posées hors consigne

Aucune question reçue hors consigne. La réponse au point A de la tâche 30 figure en tête de cette consigne : voir Écarts, point 2. Une question nouvelle à Cyril, point A ci-dessous.

**A.** Contexte : les consignes des tâches 29 et 32 prescrivent `action=browsebysubject` pour la vérification par la structure. CLAUDE.md, section « Outils disponibles », dit que ce module ne doit plus être employé : j'ai substitué les deux fois `action=smwbrowse&browse=subject`, qui rend le même bloc `query`. Question : faut-il remplacer cet appel dans le modèle de consigne dont tu pars ? Suggestion : oui, par `curl -sS -G "https://wiki.ecolibre.org/api.php" --data-urlencode "action=smwbrowse" --data-urlencode "browse=subject" --data-urlencode 'params={"subject":"Titre","ns":0}' --data-urlencode "format=json" --data-urlencode "formatversion=2"`, que j'ai employé tel quel.

## Écarts et surprises

1. **`browsebysubject` remplacé par `smwbrowse` à l'étape 8**, pour la même raison qu'à la tâche 29 : CLAUDE.md fait foi. L'appel déprécié n'a pas été émis. Voir A.
2. **Réponse au point A de la tâche 30, prise en compte.** La lecture de la source par `bin/wiki-get.sh` (`action=parse&prop=wikitext`) ne résout aucun type et reste permise pendant l'attente de `_CHGPRO`. Le point 1 des écarts de la tâche 30 n'était donc pas une infraction. Le rapport de la tâche 30 n'est pas modifié : il garde la trace de la question.
3. **Les paramètres vides ne sont pas stockés.** `Unit alias` vide sur `Mètre` et `Millimètre`, `External equivalent` vide sur les trois pages : aucune valeur stockée, aucune erreur. Mesuré par les faits des trois pages.
4. **Le tableau affiche la saisie, pas la valeur stockée.** Il montre `0,000001` et `um,micron` tels que tapés, puisque le modèle affiche `{{{facteur}}}` et `{{{alias}}}` bruts. Ce n'est pas une erreur, mais l'affichage ne prouve rien du stockage : c'est la lecture des faits qui l'établit.
5. **Le signe micro et la lettre grecque mu.** Le symbole stocké est U+00B5 (signe micro), celui de la consigne. La lettre grecque mu (U+03BC) a la même apparence et sera tapée par certains claviers. Une chaîne qui en contient ne sera pas égale au symbole. Je n'ai rien mesuré de la reconnaissance à la saisie. C'est un point à garder pour la tâche du bloc de déclaration, qui pourrait ajouter `μm` (U+03BC) aux alias.
6. `origin/main` n'avait pas bougé depuis la tâche 31 (`145f633`) : aucune avance rapide nécessaire avant le commit.
