# Lot 21, tâche 16 — Trois corrections de suite

Session du 9 octobre 2026, exécutée par Claude Code.

## Étape 0 — État du dépôt

`git status --short` : aucune ligne. Dépôt propre.

`travaux/lot-21-tache16-corrections.md` : absent avant la tâche (`ls` : « Aucun fichier ou dossier de ce nom »).

`.claude/settings.local.json`, au début comme à la fin de la tâche : `allow` et `deny` vides, aucune règle.

Ancres : chacune trouvée une fois et une seule (`grep -c` = 1 pour l'ancre de CLAUDE.md, les deux lignes de l'ancre de `bin/wiki-api.sh`, et les deux ancres de la page du lot).

## Les trois diffs

### Étape 1 — CLAUDE.md

```diff
@@ -280,7 +280,7 @@ Ce que Cyril peut lancer seul, et ce qui relève de fuzzy : voir
-  Le fait `_TYPE` porté par la page de propriété ne vaut pas barrière : mesuré le 4 octobre 2026, six propriétés portaient le bon `_TYPE` tout en étant résolues en `_wpg`, et toutes les valeurs des pages qui les employaient sont tombées en type Page sans qu'aucune purge ni réécriture ne les en sorte. Une propriété dont le type résolu est faux est perdue : ne pas chercher à la réparer, abandonner le nom et recréer sous un autre.
+  Le fait `_TYPE` porté par la page de propriété ne vaut pas barrière : mesuré le 4 octobre 2026, six propriétés portaient le bon `_TYPE` tout en étant résolues en `_wpg`, et toutes les valeurs des pages qui les employaient sont tombées en type Page sans qu'aucune purge ni réécriture ne les en sorte. Une propriété dont le type résolu est faux ne s'emploie pas : attendre et revérifier, sans rien réparer et sans changer de nom. Le gel se résorbe de lui-même en deux à quatre jours (entrée 59 des Limites connues), mesuré du 4 au 8 octobre 2026.
```

Rien d'autre ne change dans CLAUDE.md.

### Étape 2 — Lot 21 — Grandeurs et unités

Révision 1472 → 1474, résumé `[Lot 21][Tâche 16] Motifs corrigés dans les points ouverts`. Copie locale : `pages/Lot_21.txt`.

```diff
115c115
< […] leur sort appartient au [[Lot 26 — Renommage des propriétés par domaine|lot 26]]. Elles sont libres au 8 octobre 2026 et doivent le rester, les corriger les verrouillant pour rien.
---
> […] leur sort appartient au [[Lot 26 — Renommage des propriétés par domaine|lot 26]]. Il n'y a donc plus lieu de les corriger ici, non parce qu'une écriture les verrouillerait, ce verrou se levant en quelques jours, mais parce qu'elles ne sont plus du ressort de ce lot.
120c120
< * les noms des propriétés, celles du socle comme celles que portent les pages de grandeur et d'unité, puisqu'une déclaration neuve doit être juste du premier coup ;
---
> * les noms des propriétés, celles du socle comme celles que portent les pages de grandeur et d'unité. Le motif n'est pas le verrou, qui se lève en quelques jours, mais la fédération : un nom de propriété engage tous les wikis partenaires, et le renommer relève d'un lot entier, le [[Lot 26 — Renommage des propriétés par domaine|lot 26]] ;
```

Le début de la ligne 115 (abrégé ici par `[…]`) est inchangé. Protection native de la page avant écriture : `protection: []`.

### Étape 3 — bin/wiki-api.sh

```diff
@@ -50,6 +50,12 @@
 # connecté : un contrôle sur chaque appel doublerait toutes les lectures.
 # Ajouté le 8 octobre 2026 (lot 21, tâche 15), après une lecture de verrou
 # faussée par une session expirée à la tâche 14.
+#
+# Pour éprouver ce cas : pointer SGDT_PRIVE sur un dossier contenant un
+# .cookies.txt vide. Renommer le vrai fichier ne teste rien : le script
+# retombe alors dans le cas « aucun fichier de cookies trouvé », où il n'y a
+# rien à avertir. Seul un fichier présent mais périmé déclenche
+# l'avertissement.
 set -euo pipefail
```

Rien d'autre ne change dans le script.

## Les cinq vérifications

### a. Celle qui tranche

```
$ bin/wiki-verify.sh "Lot 21 — Grandeurs et unités" pages/Lot_21.txt
IDENTIQUE : Lot 21 — Grandeurs et unités
verify exit 0
```

Contrôles complémentaires : catégories de la page = `Catégorie:Lot` seule ; le lien vers *Lot 26 — Renommage des propriétés par domaine* est présent dans `prop=links`, et la page du lot 21 figure dans `list=backlinks` du lot 26.

### b. Cohérence

**Règle « Barrière avant d'employer une propriété neuve » de CLAUDE.md**, relue en entier : aucune phrase n'en contredit une autre.
- « sans qu'aucune purge ni réécriture ne les en sorte » et « le gel se résorbe de lui-même » ne se contredisent pas : aucune action ne lève le gel, seul le temps le fait.
- La phrase nouvelle et le quatrième paragraphe (« Ce n'est ni une perte, ni une raison de changer de nom ») disent la même chose.
- Il y a une redite, mais pas de contradiction : le délai de deux à quatre jours figure maintenant deux fois, dans le deuxième paragraphe (phrase nouvelle) et dans le quatrième (« Le gel du type résolu se résorbe de la même façon, en deux à quatre jours »).
- Le dernier paragraphe dit qu'« une création isolée a échoué ». Ce n'est pas faux, mais le mot « échoué » date du temps où le gel passait pour définitif : il désigne un gel, aujourd'hui connu pour être temporaire.

**Section « Points ouverts » de la page du lot** (lignes 111 à 124) : aucune contradiction. Les deux puces bloquantes restent bloquantes, et seul le motif de la seconde a changé. Le paragraphe des diamètres et la puce des noms disent tous deux que le verrou se lève en quelques jours.

### c. Script

Connecté :

```
$ bin/wiki-api.sh "action=query&prop=info&intestactions=edit&titles=Attribut:Max%20thickness&format=json&formatversion=2"
{
    "batchcomplete": true,
    "query": {
        "pages": [
            {
                "pageid": 409,
                "ns": 102,
                "title": "Attribut:Max thickness",
                "contentmodel": "wikitext",
                "pagelanguage": "fr",
                "pagelanguagehtmlcode": "fr",
                "pagelanguagedir": "ltr",
                "touched": "2026-08-19T12:22:56Z",
                "lastrevid": 804,
                "length": 298,
                "new": true,
                "actions": {
                    "edit": true
                }
            }
        ]
    }
}
exit 0
```

Avec `SGDT_PRIVE` pointé sur un dossier du scratchpad contenant un `.cookies.txt` vide, créé par `touch` (taille 0) ; le vrai fichier de cookies n'a pas été touché :

```
AVERTISSEMENT: session expirée — le résultat d'intestactions sera celui d'un visiteur anonyme. Relancer bin/wiki-login.sh.
{
    "batchcomplete": true,
    "query": {
        "pages": [
            {
                "pageid": 409,
                "ns": 102,
                "title": "Attribut:Max thickness",
                "contentmodel": "wikitext",
                "pagelanguage": "fr",
                "pagelanguagehtmlcode": "fr",
                "pagelanguagedir": "ltr",
                "touched": "2026-08-19T12:22:56Z",
                "lastrevid": 804,
                "length": 298,
                "new": true,
                "actions": {
                    "edit": false
                }
            }
        ]
    }
}
exit 0
```

L'avertissement sort bien. `edit: false` est la réponse d'un visiteur anonyme, pas celle d'un verrou.

### d. Renvois

J'ai relevé les mentions de la forme « entrée NN des Limites connues », plus les formes abrégées « (entrée NN) ». Pour chaque mention, j'ai comparé son contexte au titre de l'entrée NN, dans la liste `# ` de la page *Limites connues* lue ce jour (65 entrées).

| Ligne | Entrée | Sujet de l'entrée | Contexte sur la page du lot | Concordance |
|---|---|---|---|---|
| 17 | 2 | Arbre fonctionnel en graphe orienté acyclique ; `Board_lineage`/`Module:Board` absents du wiki | dément que le motif soit « déjà employé sur ce wiki » | oui : l'amendement 1 du lot 9 (`travaux/lot-9-amendement-1.md`, l. 131) citait précisément `Board_lineage` / `Module:Board` comme précédent |
| 17 | 10 | Filetages et diamètres d'un raccord à plusieurs orifices | « orifice de raccord » | oui |
| 25 | 62 (×2) | Toute écriture modifiant le type verrouille, et le verrou se lève seul | verrous, règle d'écriture unique | oui |
| 25 | 63 | Un verrou n'empêche ni stockage ni requête | idem | oui |
| 29 | 61 | Unité d'affichage par défaut : première chez Quantity, dernière chez Temperature | idem | oui |
| 43 | 60 | Décalage d'origine de Temperature appliqué aux écarts | tolérance de 2 °C stockée 275,15 | oui |
| 45 | 61 | idem | ordre des unités d'affichage | oui |
| 53 | 51 | Recoupement entre lots déclaré d'un seul côté | idem | oui |
| 59 | 65 | Énumération fermée non enrichissable une fois verrouillée | coût d'enrichir une énumération fermée | oui (voir Écarts) |
| 115 | 57 | Virgule décimale contre séparateur de valeurs multiples | diamètre secondaire séparé par virgules | oui |
| 138 | 62 | Verrou après changement de type, levée seule | idem | oui |
| 140 | 59 | Type résolu resté par défaut | gel du type | oui |
| 140 | 63, 62 | voir ci-dessus | verrou fréquent, sans gêne, levé seul | oui |
| 141 | 33 | Blanchir une page de propriété la verrouille | idem | oui |

Aucun renvoi faux. Le renvoi nouveau de CLAUDE.md (entrée 59) concorde lui aussi.

### e. Propriétés intactes

```
{"title":"Attribut:Nominal diameter","lastrevid":342,"edit":true}
{"title":"Attribut:Secondary diameter","lastrevid":343,"edit":true}
{"title":"Attribut:Power rating","lastrevid":803,"edit":true}
{"title":"Attribut:Max thickness","lastrevid":804,"edit":true}
```

Lecture faite connecté (`intestactions=edit`) : les révisions attendues sont présentes, et aucune des quatre propriétés n'est verrouillée.

## Écarts et surprises

- **L'entrée 65 des Limites connues contredit maintenant l'entrée 62.** Elle dit qu'enrichir une énumération fermée verrouillée est « impossible », et prescrit : « En attendant que le verrou soit réparé, une valeur manquante se dit en prose […] jamais en ajoutant une valeur à l'énumération. » Or l'entrée 62 et la tâche 15 établissent que le verrou se lève seul en quelques jours : l'ajout est différé, pas impossible, et il n'y a rien à « réparer ». La ligne 59 de la page du lot, qui y renvoie (« ce qu'il y a de plus coûteux à enrichir une fois le verrou posé »), reste juste dans sa formulation. Non corrigé : hors du périmètre de cette tâche.
- **La révision de la page passe de 1472 à 1474.** La révision 1473 est celle du lot 22, tâche 3, sur *Lot 22 — Miroir local*, ce matin à 10 h 24 (UTC). Rien d'anormal.
- **Une redite dans la règle « Barrière » de CLAUDE.md.** Le délai de deux à quatre jours y figure désormais deux fois (voir b). Pas de contradiction.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

**A.** L'entrée 65 des Limites connues tient encore le verrou pour un obstacle définitif (« impossible », « en attendant que le verrou soit réparé »), ce que démentent l'entrée 62 et la tâche 15. Faut-il la corriger, et à quel titre ? Ma suggestion : une réécriture complète de *Limites connues* par `wiki-put.sh`, dans une tâche ultérieure du lot 21. L'entrée deviendrait : un ajout de valeur verrouille la propriété et ne peut être suivi d'un second qu'après la levée du verrou, en quelques jours ; la prose sert seulement pendant ce délai.
