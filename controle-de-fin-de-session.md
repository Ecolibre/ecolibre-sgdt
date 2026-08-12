# Contrôle de fin de session — répartition de l'information

Procédure à exécuter à la fin de chaque session de travail sur le wiki SGDT,
avant de clore la conversation. Objectif : vérifier que tout ce qui a été
établi pendant la session est consigné **une fois**, **au bon endroit**, et
que rien d'important ne reste seulement dans le fil de discussion — lequel
disparaît.

À invoquer ainsi : « Applique `controle-de-fin-de-session.md`. »

---

## Règles de routage

Chaque élément établi pendant la session va à **une seule** destination.

| Destination | Ce qui y va |
|---|---|
| **Récapitulatif technique** (wiki) | Conventions et mécanismes qui contraignent toute écriture future : syntaxe, types, cardinalités, nommage, structure des modèles et formulaires, décisions d'architecture. Le test : « quelqu'un qui écrira une page dans six mois doit-il le savoir pour ne pas se tromper ? » |
| **Limites connues** (wiki) | Ce que le système ne sait pas faire ou fait mal : réglages hors de portée de l'API, comportements de MediaWiki ou des extensions qui piègent, contournements en vigueur. Le test : « quelqu'un va-t-il buter là-dessus et croire à une erreur de sa part ? » |
| **Feuille de route / reste à faire** (wiki) | Chantiers ouverts, non planifiés, sans échéance. Le test : « est-ce une intention plutôt qu'un fait ? » |
| **Dépôt** — `CLAUDE.md`, rapports de session | Méthode de travail, outillage, incidents de session, leçons sur la façon de conduire les écritures. Rien de tout cela n'est une donnée du wiki. |

**Jamais sur le wiki, sous aucune forme :** noms d'hôtes, chemins
d'installation, comptes système, mots de passe, contenu de
`LocalSettings.php`, détails d'accès SSH. Ces informations vont dans le dépôt,
qui n'est pas public au même titre. Si un élément de la session en contient,
le signaler explicitement dans le rendu plutôt que de le router en silence.

---

## Procédure

1. **Recenser.** Établir la liste de tout ce que la session a produit comme
   fait durable : décision d'architecture, convention découverte, limite
   rencontrée, chantier ouvert, correction d'une affirmation antérieure.
   Inclure ce qui a été **infirmé** : une hypothèse réfutée est un fait, et
   sa réfutation évite de la reprendre plus tard.

2. **Router.** Attribuer une destination à chaque élément selon le tableau
   ci-dessus. Un élément qui ne rentre nulle part est probablement un détail
   de session : le dire, ne pas le forcer dans une case.

3. **Vérifier.** Lire réellement chaque page de destination concernée
   (`wiki-get.sh`) et constater si l'élément y figure déjà, sous quelle
   forme. Ne jamais présumer du contenu d'une page sans l'avoir lue.

4. **Rendre compte** au format ci-dessous.

5. **Ne rien écrire** avant validation explicite. Proposer les diffs, pas
   les appliquer.

---

## Format de rendu

| Élément établi | Destination | Déjà présent ? | Action proposée |
|---|---|---|---|

Puis, séparément :

- **Éléments sans destination** — ce qui reste dans le fil et n'a pas
  vocation à être consigné, avec la raison.
- **Éléments écartés pour sécurité** — ce qui ne doit pas figurer sur le
  wiki public.
- **Contradictions** — tout endroit où la session contredit ce que le wiki
  affirme aujourd'hui. À signaler avant tout, c'est le plus coûteux à
  laisser passer.
- **Diffs proposés**, page par page, non appliqués.

---

## Pièges observés

- **Ne pas recopier un rapport de session sur le wiki.** Le rapport raconte
  comment on est arrivé au résultat ; le wiki n'énonce que le résultat.
- **Une leçon de méthode n'est pas une convention du wiki.** « Relancer la
  session avant d'écrire » va dans `CLAUDE.md`, pas dans le récapitulatif
  technique.
- **Une hypothèse réfutée doit être consignée comme réfutée**, pas effacée :
  sans quoi elle sera reformulée à la session suivante.
- **Vérifier avant d'affirmer qu'une page est en tort.** Il est déjà arrivé
  qu'un document de cadrage affirme qu'une page du wiki portait une
  information fausse, alors qu'elle était correcte.
- **Un fait mesuré et une cause établie sont deux choses différentes.**
  Consigner ce qui a été constaté ; ne pas promouvoir une hypothèse
  plausible au rang d'explication.
