# Lot 3 — Les classes et le schéma des propriétés

**Pour :** session Claude Code, dépôt `~/ecolibre-sgdt`
**Cible :** `https://wiki.ecolibre.org` — MediaWiki 1.39.11, SMW 4.2.0
**Suite de :** lots 1 et 2 (révisions 248 à 252), et de la mise à jour du Récapitulatif
**Établi le :** 26 juillet 2026

---

## 0. Prérequis — à vérifier avant de commencer

1. **Les définitions de classes du §1 ont été validées par Cyril.** Si ce n'est
   pas le cas, s'arrêter là : tout le lot en dépend.
2. **La mise à jour du Récapitulatif (dossier `recap-maj-post-lot2`) est
   passée.** L'action I de ce lot modifie le même `#ask`. Si elle n'a pas été
   faite, la faire d'abord.
3. Forme d'appel canonique des scripts : `bin/wiki-get.sh`, `bin/wiki-put.sh`.

Rappel du garde-fou le plus utile ici : sur ce wiki, **une vérification de
protection ne permet pas de prévoir si une écriture passera**. Un refus est un
résultat à rapporter, pas un obstacle à contourner.

---

## 1. Action F — Définir les quatre classes

### Ce qu'on corrige

`[[Category:Functional item]]` et ses trois sœurs sont posées par les modèles et
deviendront des `rdf:type`. Aujourd'hui, deux de ces pages n'existent pas et les
deux autres ne contiennent que des tableaux de bord. Aucune ne dit ce que la
classe *signifie*.

Une classe sans définition n'est pas une classe, c'est un tas.

### Les quatre définitions (validées par Cyril)

- **Functional item** — Une fonction à assurer, indépendamment de toute
  solution. Titre au verbe infinitif. Se décompose en sous-fonctions.
- **Organic item** — Un type d'objet ou de dispositif capable de réaliser une
  fonction, indépendamment de toute source d'approvisionnement. « Bidon 220L »
  en est un : ni le fournisseur ni le fabricant n'y figurent.
- **Referenced item** — Un moyen identifié de se procurer un item organique :
  un fournisseur, une référence fabricant, ou un plan publié à fabriquer
  soi-même. Le niveau de maturité qualifie ce moyen d'approvisionnement.
- **Physical item** — Un exemplaire concret présent sur un site, rattaché au
  moyen d'approvisionnement dont il provient. C'est ce rattachement qui permet
  de distinguer deux exemplaires identiques venus de sources différentes.

### Pages à créer

`Catégorie:Referenced item` et `Catégorie:Physical item` n'existent pas.
Les créer avec `createonly=1`, sur ce gabarit :

```wikitext
== Définition ==

<définition>

Cette catégorie est posée automatiquement par [[:Modèle:<X>|Modèle:<X>]]. Elle
ne doit jamais être ajoutée à la main : elle vaut appartenance à la classe, pas
navigation.

== Position dans la chaîne ==

<niveau amont> → '''<cette classe>''' → <niveau aval>
```

Résumé : `[Lot 3] Action F — définition de la classe <X>`

### Pages à compléter

`Catégorie:Functional item` et `Catégorie:Organic item` existent et portent
respectivement 5 et 4 requêtes. **Ne rien y réécrire.** Insérer les sections
« Définition » et « Position dans la chaîne » en tête, avant le contenu
existant, et laisser les tableaux de bord intacts.

Relire le wikitexte en direct avant écriture, et rapporter un diff qui ne
contient que des lignes ajoutées.

### Attention

Ces quatre pages parlent de catégories. **Tout lien vers une catégorie doit
porter le `:` initial** (`[[:Category:X]]`). Le bug corrigé trois fois en
action E consistait exactement en son absence.

---

## 2. Action G — Créer les trois propriétés de schéma

### Le principe

Le Récapitulatif décrit le schéma avec les outils du schéma lui-même : le
tableau des propriétés est un `#ask`, pas un tableau saisi. On étend ce principe
plutôt que d'ajouter de la prose.

Trois propriétés portées par les pages `Attribut:` :

| Propriété | Type | Ce qu'elle dit | Deviendra |
|---|---|---|---|
| `Property_cardinality` | Keyword | `single` ou `multiple` | `sh:maxCount` |
| `Property_domain` | Page | la ou les classes concernées | `sh:targetClass` |
| `Property_range` | Keyword | la classe ou le type visé | `sh:class` / `sh:datatype` |

### Pages à créer

Reprendre exactement la convention des attributs existants — `Has type` puis les
deux descriptions.

`Attribut:Property cardinality`
```wikitext
[[Has type::Keyword]]
[[Allows value::single]]
[[Allows value::multiple]]
[[Property_description_FR::Nombre de valeurs admises pour cette propriété : single ou multiple.]]
[[Property_description_EN::Number of values this property accepts: single or multiple.]]
```

`Attribut:Property domain`
```wikitext
[[Has type::Page]]
[[Property_description_FR::Classe ou classes auxquelles cette propriété s'applique.]]
[[Property_description_EN::Class or classes this property applies to.]]
```

`Attribut:Property range`
```wikitext
[[Has type::Keyword]]
[[Property_description_FR::Classe visée par la propriété, ou nature de la valeur littérale attendue.]]
[[Property_description_EN::Target class of the property, or nature of the expected literal value.]]
```

Résumé : `[Lot 3] Action G — propriété de schéma <X>`

### Limite assumée

`Property_range` mélange deux choses que SHACL distingue — une classe visée
(`sh:class`) et un type de littéral (`sh:datatype`). À seize propriétés, une
seule colonne documentaire vaut mieux que deux colonnes à moitié vides. La
convention à tenir : quand la portée est une classe, l'écrire exactement comme
dans `Property_domain`.

---

## 3. Action H — Renseigner les huit propriétés d'items

### Périmètre

Seulement les huit propriétés qui portent le modèle métier :

| Propriété | Cardinalité | Domaine | Portée |
|---|---|---|---|
| `Item_ref` | single | les 4 classes | identifiant Base 36, 4 caractères |
| `Item_description` | single | les 4 classes | texte libre |
| `Part_of` | multiple | les 4 classes | même classe que le sujet |
| `Realizes_function` | single | Organic item | Functional item |
| `Corresponds_to_organic` | single | Referenced item | Organic item |
| `Instance_of` | single | Physical item | Referenced item |
| `Maturity_level` | single | Referenced item | énumération fermée |
| `Serial_number` | single | Physical item | chaîne courte |

Les huit autres propriétés — les quatre de description et les quatre importées —
**restent vides**. Ce sont des propriétés de documentation et de vocabulaire,
pas du modèle métier. Des cellules vides dans le tableau sont une information
juste ; les remplir au jugé serait une information fausse.

### Le point à connaître sur `Part_of`

`Part_of` est déclarée `multiple` alors qu'elle n'est réellement multivaluée que
pour les items référencés — ailleurs elle est alimentée par une liste déroulante
à valeur unique.

C'est délibéré. SMW attache la cardinalité à la propriété, pas au couple
classe-propriété ; seul SHACL saura exprimer la nuance. Déclarer `multiple`
globalement ne casse aucune requête existante, là où scinder en deux propriétés
obligerait à réécrire les `#ask` des quatre modèles. La règle implicite déjà
consignée au Récapitulatif porte la nuance en attendant.

### Écriture

Ajouter les trois lignes en fin de chaque page d'attribut, sans toucher aux
lignes existantes :

```wikitext
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::chaîne courte]]
```

Pour les propriétés à domaines multiples, répéter la ligne `Property_domain`
autant de fois que nécessaire.

Résumé : `[Lot 3] Action H — schéma de <propriété>`

Huit éditions. Les enchaîner, puis rapporter les huit diffs ensemble.

---

## 4. Action I — Le tableau et l'énumération

### 4.1 Étendre le tableau des propriétés

Dans le `#ask` du Récapitulatif, ajouter trois affichages après la colonne
`Vocabulaire externe` :

```
|?Property_cardinality=Cardinalité
|?Property_domain=Domaine
|?Property_range=Portée
```

Résumé : `[Lot 3] Action I — colonnes de schéma dans le tableau des propriétés`

### 4.2 Fermer l'énumération de `Maturity_level`

Le niveau de maturité n'existe aujourd'hui que dans la liste déroulante du
formulaire et le `#switch` du modèle. Rien ne l'impose au niveau de la
propriété.

**Lire les valeurs exactes dans `Formulaire:Referenced item`** — ne pas se fier
à une liste de mémoire — puis ajouter à `Attribut:Maturity level` une ligne
`[[Allows value::<valeur>]]` par valeur.

Aucun item référencé n'existe, donc aucune valeur existante ne peut entrer en
conflit. Le risque est nul et il ne le sera plus après l'import.

Résumé : `[Lot 3] Action I — énumération fermée sur Maturity level`

---

## 5. Contrôles

1. Le tableau des propriétés affiche seize lignes et quatre nouvelles colonnes.
   Huit lignes renseignées, huit vides — l'écart est attendu.
2. `list=categorymembers` sur les quatre catégories-classes renvoie exactement
   19, 2, 0, 0. Tout autre chiffre signifie qu'une page s'est catégorisée
   elle-même : vérifier les `:` initiaux des actions F.
3. `Catégorie:Functional item` et `Catégorie:Organic item` affichent toujours
   leurs 5 et 4 requêtes.
4. `Attribut:Maturity level` ne signale aucune erreur de valeur.

---

## 6. Questions ouvertes — pour Cyril, aucune ne bloque

1. **Type de `Item_ref`.** Toujours `Code`. Le tri du calcul de référence
   suivante repose sur un type de la famille Texte, ce que SMW ne garantit pas —
   ça fonctionne parce que les références font quatre caractères. `Keyword`
   rendrait la garantie explicite. Vingt-et-une pages à réindexer.
2. **Items physiques et séquence Base 36.** Saisie manuelle maintenue, ou
   intégration à la séquence partagée ?
3. **Les quatre propriétés importées inutilisées.** `Foaf:name`,
   `Foaf:homepage`, `Foaf:knows` et `Owl:differentFrom` sont déclarées et
   employées nulle part. Jalons pour la modélisation des personnes et
   organisations, ou résidus ? La réponse décide si elles reçoivent un domaine
   et une portée.
4. **Extraits de `LocalSettings.php`** — `$smwg*`,
   `$wgNamespacePermissionLockdown`, `$wgGroupPermissions`. Le point 7 du
   Récapitulatif porte une section « à compléter » qui les attend.

---

## 7. Ne pas faire

- Ne pas réécrire les tableaux de bord de `Catégorie:Functional item` et
  `Catégorie:Organic item`. Ce lot ajoute, il ne réorganise pas.
- Ne pas renseigner de schéma sur les huit propriétés hors périmètre.
- Ne pas modifier le type de `Item_ref` : c'est la question ouverte n°1.
- Ne pas toucher aux formulaires ni aux modèles d'items. Ce lot ne concerne que
  les attributs et les catégories.
