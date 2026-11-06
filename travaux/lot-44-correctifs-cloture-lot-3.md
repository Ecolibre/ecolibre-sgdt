# Lot 44 — deux correctifs après la clôture du lot 3 : orthographe du point ouvert du lot 21, limite du tableau des propriétés

Exécuté dans la nuit du 6 au 7 novembre 2026, vers 23 h 10 UTC, dans une
session Claude Code cloud, sur la branche `claude/focused-wright-wr4tlb`.
Deux écritures sur le wiki, réussies du premier coup. Les trois vérifications
passent ; celle qui tranche, la première, compte 161 lignes de données dans
le tableau rendu. Un contrôle complémentaire mesure le plafond réel des
requêtes en ligne de SMW : 500.

## Étape 0 — état du dépôt

`git fetch origin`, puis `git status --porcelain` : sortie vide, aucun arrêt.
`HEAD` et `origin/main` au même commit, `163d505` : rien à mettre à jour.
`.claude/settings.local.json` : absent, au début comme à la fin de la tâche,
donc aucune règle.

Session wiki : `bin/wiki-login.sh` rend `Success`, compte `Cywil`.

## Lectures préalables

- Les deux pages ont été lues par `bin/wiki-get.sh`
  (`action=parse&prop=wikitext`) juste avant d'écrire : identiques aux
  révisions 1730 (lot 21) et 1729 (Récapitulatif), écrites lors de la clôture
  du lot 3. Protections, par
  `prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full` :
  `protection: []` et aucun motif de refus, sur les deux.
- Lot 21 : « Vingt-et-une propriétés d'essai » et « dont ces vingt-et-une »
  y figurent une fois chacune ; « vingt-et-une », toute casse confondue,
  2 fois ; « vingt et une », 0 fois. La page porte aussi « vingt-cinq
  propriétés », à l'orthographe traditionnelle, qui ne change pas.
- Récapitulatif : la ligne ` |limit=200` y figure une fois, ligne 23, dans le
  `#ask` qui s'ouvre ligne 14 sous le titre de la section 1, ligne 9 ; la
  chaîne `limit=200` n'apparaît nulle part ailleurs sur la page.
- Mesure de départ de la vérification 1, sur le rendu, avant l'écriture : le
  tableau `sortable wikitable smwtable` de la section 1 comptait 162 balises
  `<tr>`, 1 ligne d'en-tête et 161 lignes de données, sans lien vers d'autres
  résultats. Avec 161 propriétés, l'ancienne limite de 200 ne tronquait donc
  encore rien.

## Écritures

| Étape | Page | Révision | Heure (UTC) | Résumé |
|---|---|---|---|---|
| 1 | Lot 21 — Grandeurs et unités | 1730 → 1732 | 23:11:23 | `[Lot 44][Correctif] orthographe traditionnelle sur le point ouvert du lot 21` |
| 2 | Récapitulatif technique du Système de Gestion de Données Techniques | 1729 → 1733 | 23:11:56 | `[Lot 44][Correctif] limite du tableau des propriétés portée à 500` |

Les deux par `bin/wiki-put.sh`, `result: Success`, et `bin/wiki-verify.sh` a
rendu `IDENTIQUE` après chacune. Avant chaque écriture, un contrôle a établi
que la page envoyée ne différait de la page lue que par les remplacements
demandés : les deux occurrences pour le lot 21, de taille identique en
octets ; la seule ligne de limite pour le Récapitulatif. Les deux résumés
suivent le garde-fou 2.

## Les deux diffs

### Étape 1

```diff
--- av/lot21.txt
+++ lot21-1732.txt
@@ -137,7 +137,7 @@
 
 Le lot n'est bloqué par rien d'autre. Les opérations côté serveur, dont l'examen du verrou de propagation, restent en attente de la migration et ne commandent plus aucune étape de ce lot.
 
-Vingt-et-une propriétés d'essai créées par ce lot figurent dans le tableau des propriétés du [[Récapitulatif technique du Système de Gestion de Données Techniques]], qui est la spécification du système : leurs noms commencent par <code><nowiki>Test lot21</nowiki></code>. Mesuré le 6 novembre 2026 : 161 propriétés portent un <code><nowiki>Has type</nowiki></code>, dont ces vingt-et-une. Elles sont à retirer avant la clôture de ce lot, par suppression directe de leur page et jamais après blanchiment, comme cette page le rappelle déjà. Relevé lors de la clôture du lot 3.
+Vingt et une propriétés d'essai créées par ce lot figurent dans le tableau des propriétés du [[Récapitulatif technique du Système de Gestion de Données Techniques]], qui est la spécification du système : leurs noms commencent par <code><nowiki>Test lot21</nowiki></code>. Mesuré le 6 novembre 2026 : 161 propriétés portent un <code><nowiki>Has type</nowiki></code>, dont ces vingt et une. Elles sont à retirer avant la clôture de ce lot, par suppression directe de leur page et jamais après blanchiment, comme cette page le rappelle déjà. Relevé lors de la clôture du lot 3.
 
 == Point de départ ==
 
```

### Étape 2

```diff
--- av/recap.txt
+++ recap-1733.txt
@@ -20,7 +20,7 @@
  |?Property_domain=Domaine
  |?Property_range=Portée
  |format=table
- |limit=200
+ |limit=500
  |sort=Has type
 }}
 
```

## Vérifications

1. **Qui tranche : le tableau rendu.** Par `action=parse` avec
   `prop=text|revid` : la révision rendue est bien la 1733. Le tableau
   `sortable wikitable smwtable` de la section 1 compte **162 balises
   `<tr>`**, soit 1 ligne d'en-tête et **161 lignes de données**, numérotées
   de 1 à 161 par leur attribut `data-row-number`. Le compte égale 161 : rien
   n'est tronqué.
2. **Lot 21**, relue par `action=parse` : « vingt-et-une », toute casse
   confondue, **0 fois** ; « vingt et une », **2 fois**.
3. **Annotations** : `[[Has type::+]]`, `limit=500`, **161**, avec 161
   résultats rendus ; `[[Item_ref::+]]`, **118**.

Contrôle complémentaire, non demandé, parce que la vérification 1 ne pouvait
pas le détecter (voir les écarts) : le plafond des requêtes en ligne, mesuré
par trois prévisualisations `action=parse&text=…`, qui n'enregistrent rien :

- `{{#ask: [[Modification date::+]] |format=count}}` rend **598** ;
- le même ensemble en `format=ul` avec `limit=500` rend **500** éléments ;
- avec `limit=1000`, il rend encore **500** éléments.

Le plafond de SMW pour une requête en ligne au format liste est donc de 500
sur cette installation. La nouvelle limite du tableau l'atteint sans le
dépasser. Que le format tableau ait le même plafond est une déduction, et
non une mesure : aucun tableau du wiki ne dépasse aujourd'hui 500 lignes pour
le vérifier.

## Écarts et surprises

### Question

**A.** Le plafond des requêtes en ligne n'a pas d'entrée dans les Limites
connues, à ma connaissance. Mesuré ci-dessus : 500 éléments rendus pour
`limit=500` comme pour `limit=1000`, sur un ensemble de 598 pages. Une
recherche de `limit=`, « limite de », « plafon » et « 500 » sur la page des
Limites connues ne trouve rien sur ce plafond ; c'est une recherche par
mots-clés, pas une lecture de chaque entrée. Faut-il l'y consigner ?
Suggestion : une entrée datée qui donne la mesure, faite sur le format liste,
et qui présente comme une déduction son extension aux autres formats, dont
le tableau des propriétés.

### Constats

- **La vérification 1 ne pouvait pas détecter un plafond inférieur à 500.**
  Avec 161 propriétés, un plafond compris entre 161 et 499 aurait rendu les
  mêmes 161 lignes. Le compte de 161 prouve que le tableau n'est pas tronqué
  aujourd'hui, pas que la limite de 500 est effective. D'où le contrôle
  complémentaire.
- **L'ancienne limite ne tronquait encore rien** : 161 lignes de données
  avant l'écriture comme après. Le correctif est préventif.
- **Le « hier » de la consigne** désigne bien l'ajout du 6 novembre : il était
  0 h 10 le 7 novembre, heure de Paris, au début de la tâche.
- Aucune question n'a été posée par le canal direct pendant l'exécution.
