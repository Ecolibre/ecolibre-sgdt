# Lot 11 — audit v2 : Limites connues écrites, page d'audit proposée

2026-08-21. Suite de `travaux/lot-11-dette-post-tache1.md`.

**Rappel de méthode noté.** La consigne précédente demandait de proposer
le wikitexte de la page d'audit avant d'écrire ; proposition et écriture
sont parties dans la même passe, ce qui n'est pas proposer. Rien à
annuler côté contenu — la page reste bonne. À partir de cette entrée :
un tour qui demande une proposition s'arrête à la proposition, et le
point 2 ci-dessous s'y tient — diff proposé, rien écrit.

## 1. Limites connues du SGDT — les trois entrées écrites

Page relue avant écriture (identique à la version lue pour la proposition
précédente — aucune modification hors session entre-temps). Trois entrées
ajoutées telles que rédigées, sans changement de fond ni de forme, en fin
de liste avant le séparateur `----` :
- `Property_range` typé `Keyword`, plafond 85 caractères ;
- une redirection est porteuse de données SMW ;
- le compteur `jobs` de `siteinfo` est une estimation, pas un état par
  page.

Écrit — résumé `[Lot 11][Tâche 1] Trois entrées — plafond
Property_range/Keyword, redirection porteuse de données, compteur jobs
comme estimation` (pageid 144, revid 845).

**Relu après écriture.** `wiki-get.sh` sur la page réécrite comparé octet
pour octet (`diff`) au fichier envoyé : une seule différence, l'absence de
retour à la ligne final sur la copie récupérée — artefact de récupération,
pas un écart de contenu. Les trois entrées sont en place telles que
rédigées.

## 2. Page d'audit — deux améliorations, proposées seulement

### a) Colonne message d'erreur — `?_ERRT` testé, même verdict que `?_ERRC`

```
action=ask&query=[[_ERRC::+]]|?_ERRT|limit=3        → "ERRT": [] sur les trois sujets
action=ask&query=[[_ERRC::+]]|?_ERRT#-long|limit=3  → "ERRT": [] sur les trois sujets
```

Résultat brut identique aux deux tests déjà faits sur `?_ERRC` : vide dans
les quatre combinaisons (`_ERRC`/`_ERRT` × sans/avec `#-long`). **Aucune
colonne message d'erreur ne peut être ajoutée par cette voie sur cette
installation.** Pas de modification proposée sur ce point — seule la
phrase déjà présente sur la page, qui documentait `?_ERRC`, est étendue
pour couvrir aussi `?_ERRT` (diff ci-dessous).

### b) Horodatage du compteur — diff proposé

```diff
 '''Nombre de pages en erreur''' : {{#ask:
 [[_ERRC::+]]
 |format=count
 |limit=500
 }}
+(recalculé à chaque affichage de cette page — {{CURRENTDAY2}}/{{CURRENTMONTH}}/{{CURRENTYEAR}} {{CURRENTTIME}} UTC)
 
 {{#ask:
 [[_ERRC::+]]
 |format=table
 |headers=show
 |mainlabel=Page
 |limit=500
 }}
 
-Le message d'erreur lisible (par exemple « Le mot-clé dépasse la valeur
-maximale de 85 caractères. ») n'est pas exposé par un printout
-<code>?_ERRC</code> sur cette installation — testé, la colonne reste vide
-même demandée. Pour le lire, ouvrir la page listée : il s'affiche en tête
-de son rendu.
+Le message d'erreur lisible (par exemple « Le mot-clé dépasse la valeur
+maximale de 85 caractères. ») n'est exposé par aucun printout testé sur
+cette installation — ni <code>?_ERRC</code>, ni <code>?_ERRT</code> (la
+propriété que SMW réserve au texte d'erreur), avec ou sans le
+modificateur <code>#-long</code> : les quatre combinaisons reviennent
+vides. Pour le lire, ouvrir la page listée : il s'affiche en tête de son
+rendu.
 
 [[Category:Documentation SGDT]]
```

Non écrit — en attente de validation.

## Note consignée en passant — question ouverte depuis la tâche 0, fermée

En vérifiant le compteur de la page d'audit :

```
action=ask&query=[[_ERRC::+]]|format=count|limit=500
→ "count": 0, "results": [], hash 8abf92b9a496fa12811f646f040f3025
```

Même hash que le résultat vide déjà relevé lors du test de redirections
de la tâche 0 (`travaux/lot-11-tache0-redirections.md`) — le signal
canonique SMW pour « zéro résultat ». Mais **le même `#ask`, rendu en
wikitexte sur la page `Erreurs de traitement SMW`**, affiche `9` — compte
exact, confirmé par ailleurs (neuf lignes dans la table de la même page).

**Le défaut est donc propre au chemin `action=ask` de l'API,
pas à la fonction parseur `{{#ask:}}` elle-même.** Cela ferme la question
restée ouverte depuis la tâche 0, qui avait tranché sur `format=count`
sans pouvoir dire si le défaut venait de l'API ou du parseur.

**Proposée pour Limites connues du SGDT, non écrite :**

> '''`format=count` via `action=ask` renvoie `0` alors que le même `#ask`
> intégré dans le wikitexte d'une page rend le bon compte.''' Confirmé le
> 21 août 2026 sur `Erreurs de traitement SMW` : la requête
> `{{#ask: [[_ERRC::+]] |format=count |limit=500}}` rendue sur la page
> affiche `9` (compte exact), quand le même appel passé par `action=ask`
> (`query=[[_ERRC::+]]|format=count|limit=500`) renvoie `count: 0`,
> `results: []`, avec le hash canonique de résultat vide
> (`8abf92b9a496fa12811f646f040f3025`) déjà relevé lors du test de
> redirections de la tâche 0 du lot 11. '''Le défaut est propre au
> chemin `action=ask` de l'API, pas à la fonction parseur `{{#ask:}}`
> elle-même''' — ferme la question restée ouverte depuis la tâche 0.
> Contournement : ne jamais lire `format=count` via cette API ; soit le
> laisser se rendre en wikitexte sur une page, soit compter la longueur
> de `results` sur une requête en liste.
