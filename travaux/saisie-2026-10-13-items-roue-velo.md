# Saisie du 13 octobre 2026 — items et organisations du dossier roue de vélo

Tâche de saisie hors lot, étiquette de résumé `[Saisie]`. Exécutée depuis une
session Claude Code hébergée (cloud), branche locale
`claude/clever-clarke-o1jkjc`, au même commit que `origin/main` (`a4c7b63`).

## 1. État du dépôt et des permissions locales

- `git status --porcelain` : sortie vide, aucun arrêt.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.

## 2. Session

`bin/wiki-login.sh` : `Success Cywil`, code de sortie 0.

## 3. Mesure du maximum Base 36

Commande (requête sur les trois classes de conception, tri décroissant sur
`Item_ref`) :

```
bin/wiki-api.sh "action=ask&query=%5B%5BCategory:Functional%20item%7C%7COrganic%20item%7C%7CReferenced%20item%5D%5D%5B%5BItem_ref::%2B%5D%5D%7C%3FItem_ref%7Csort=Item_ref%7Corder=desc%7Climit=5&format=json&formatversion=2"
```

Résultat : **0033**, porté par « Caisse en carton 39 x 30 x 20 cm »
(suivi de 0032, 0031, 0030, 002Z). Conforme au repère du 13 octobre.

Contrôles complémentaires :
- même requête **sans filtre de catégorie** : même maximum, 0033 ;
- `[[Item_ref::0034||…||003A||003a]]` avant écriture : zéro résultat.
- `Item_ref` est résolu en type `_cod` (Code) : le tri est lexical, ce qui
  est sans conséquence sur des références à quatre caractères complétées par
  des zéros, chiffres avant lettres.

## 4. Comptes avant écriture

| Catégorie | Mesuré | Repère |
|---|---|---|
| Organic item | 42 | 42 |
| Organisation | 2 | 2 |

Aucun écart. Les huit pages à créer étaient toutes `missing`, aucune
protection native sur les douze pages consultées.

## 5–7. Écritures

| Page | Référence | Résumé | Révision |
|---|---|---|---|
| Rayon de vélo | 0034 | [Saisie] Création de l'item organique | 1579 |
| Chambre à air de vélo | 0035 | [Saisie] Création de l'item organique | 1580 |
| Fond de jante de vélo | 0036 | [Saisie] Création de l'item organique | 1581 |
| Clé Allen | 0037 | [Saisie] Création de l'item organique | 1582 |
| Tournevis plat | 0038 | [Saisie] Création de l'item organique | 1583 |
| Roue de vélo à moyeu moteur | 0039 | [Saisie] Création de l'item organique | 1584 |
| Outil de serrage d'écrou de rayon de vélo | 003A | [Saisie] Passage en item organique | 1585 (sur 1577) |
| AliExpress | — | [Saisie] Création de l'organisation | 1586 |
| Amazon | — | [Saisie] Création de l'organisation | 1587 |

Les huit créations avec `--createonly`. La page « Outil de serrage d'écrou de
rayon de vélo » a été lue avant réécriture : son contenu était exactement les
trois lignes de fichier attendues (contrôle octet par octet), elle a donc été
réécrite sans `--createonly`.

## 8. Vérifications

### Vérification décisive — `bin/wiki-api.sh --facts "subject=<Titre>&ns=0"`

| Page | Fait `Item_ref` | Autres faits |
|---|---|---|
| Rayon de vélo | `['0034']` | Item_description, _INST Organic_item |
| Chambre à air de vélo | `['0035']` | Item_description, _INST Organic_item |
| Fond de jante de vélo | `['0036']` | Item_description, _INST Organic_item |
| Clé Allen | `['0037']` | Item_description, Realizes_function Assembler, _INST Organic_item |
| Tournevis plat | `['0038']` | Item_description, Realizes_function Assembler, _INST Organic_item |
| Roue de vélo à moyeu moteur | `['0039']` | Item_description, _INST Organic_item |
| Outil de serrage d'écrou de rayon de vélo | `['003A']` | Item_description, Realizes_function Assembler, _INST Organic_item |

Les sept références sont stockées avec la valeur attribuée. Les deux
organisations portent `Organisation_description`, `Organisation_website` et
`_INST Organisation`.

### Vérifications secondaires

| Contrôle | Avant | Après | Attendu |
|---|---|---|---|
| Catégorie:Organic item (`categoryinfo`, recoupé par `categorymembers`) | 42 | 49 | +7 |
| Catégorie:Organisation | 2 | 4 (AliExpress, Amazon, CWL, Ecolibre) | +2 |

- Unicité : `[[Item_ref::0034||0035||0036||0037||0038||0039||003A]]` après
  écriture rend exactement sept pages, les sept attendues, une par
  référence. Aucune n'était portée avant (zéro résultat, étape 3).
- Pages de la règle 4, `lastrevid` inchangé avant et après :
  « Remplacement de rayons de la roue motorisée d'Anton » 1576,
  « Roue motorisée d'Anton » 1573, « Jante 20" moteur Anton » 1574.

Aucune vérification en échec.

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- La révision 1578, intercalée entre la dernière révision du dossier roue
  (1577) et la première de cette tâche (1579), n'est pas de cette session :
  `Utilisateur:Cywil/Bac à sable/Essai session cloud`, par Cywil, le
  13 octobre 2026 à 20 h 48 UTC, résumé « [Correctif] Essai d'écriture depuis
  une session cloud, outillage bin/ sans .env ».
- La session s'est ouverte sans `../ecolibre-sgdt-prive/` ni `.env` dans le
  dépôt : `SGDT_PRIVE` est vide et le dossier voisin n'existe pas. C'est le
  chargement depuis l'environnement introduit par le commit `a4c7b63` qui a
  servi. La description de `CLAUDE.md` (« `wiki-login.sh`/`wiki-put.sh`/
  `wiki-purge.sh` échouent avec un message donnant les deux chemins
  cherchés ») ne mentionne pas encore ce troisième chemin.
- Le proxy de l'environnement hébergé a laissé passer wiki.ecolibre.org en
  lecture comme en écriture, à la différence du refus constaté le
  24 août 2026 (Leçons de méthode de `CLAUDE.md`).
- Poussée : la consigne demande `git push origin HEAD:main` ; la session
  hébergée désigne de son côté la branche `claude/clever-clarke-o1jkjc`.
  La consigne explicite a été suivie.
