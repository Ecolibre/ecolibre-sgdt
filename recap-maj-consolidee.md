# Mise à jour consolidée du Récapitulatif technique

**Page cible :** `Récapitulatif technique du Système de Gestion de Données Techniques`
(`Récapitulatif technique` est une redirection vers elle)
**Établi le :** 26 juillet 2026, après les lots 1, 2 et 3
**Remplace :** `recap-maj-post-lot2.md`, jamais appliqué et désormais périmé sur
deux points — la configuration et les classes.

**Principe :** une seule ligne existante modifiée. Les sept sections sont en
ajout pur.

---

## 0. Avertissement d'ancrage

Le wikitexte courant n'a pas pu être relu depuis la conversation. Les
placements sont décrits par section, pas par chaîne exacte.

**La session doit relire la page en direct** avant d'écrire, placer chaque bloc
à l'endroit décrit, et rapporter un diff qui ne contient que des lignes
ajoutées — à la seule exception du `#ask` du §1.

Le dump du 25 juillet correspond encore à l'état de la page : elle n'a pas bougé
depuis.

---

## 1. La seule modification — le `#ask` du tableau des propriétés

Le `#ask` de la première section n'affiche aujourd'hui que trois colonnes :
`Has type`, `Property_description_FR`, `Property_description_EN`.

Ajouter quatre affichages à la suite :

```
|?Imported from=Vocabulaire externe
|?Property_cardinality=Cardinalité
|?Property_domain=Domaine
|?Property_range=Portée
```

**Condition préalable :** vérifier que `Spécial:Export RDF` sur
`Attribut:Owl:differentFrom` renvoie `2002/07/owl` et non `TR/owl2-syntax`. Sans
cela, la colonne « Vocabulaire externe » afficherait une correspondance fausse
en évidence.

Résumé : `[Récap] Colonnes vocabulaire et schéma dans le tableau des propriétés`

**À prévoir :** le tableau passera à dix-neuf lignes. Les trois propriétés de
schéma créées au lot 3 portent un `Has type`, donc le `#ask` les ramasse comme
les autres. Ce n'est pas une anomalie.

Huit lignes sur dix-neuf auront les colonnes de schéma vides : les quatre
propriétés de description et les quatre propriétés importées ne relèvent pas du
modèle métier. Une case vide est une information juste.

---

## 2. Blocs à insérer

Sept sections. Placement recommandé dans l'ordre donné, après le tableau des
propriétés et avant la section des modèles. Si l'organisation de la page ne s'y
prête pas, remonter la question plutôt que de choisir.

**Attention :** tout lien vers une catégorie doit porter le `:` initial
(`[[:Category:X]]`). Sans lui, la page se catégorise elle-même — c'est le bug
corrigé trois fois au lot 2, et le contrôle final vérifie qu'il n'a pas été
réintroduit ici.

---

### 2.1 — Les quatre classes (lacunes 6 et 10)

```wikitext
== Les quatre classes ==

Les catégories d'items ne servent pas à la navigation : elles valent
appartenance à une classe et deviendront des <code>rdf:type</code> à l'export.
Elles sont posées exclusivement par les modèles et ne doivent jamais être
ajoutées à la main.

Elles forment une chaîne de quatre niveaux, du besoin à l'objet posé sur le
terrain.

{| class="wikitable"
! Classe !! Rôle dans la chaîne !! Posée par !! Lien vers le niveau suivant !! Effectif
|-
| [[:Category:Functional item|Functional item]] || la fonction à assurer || [[:Modèle:Functional item|Modèle:Functional item]] || <code>Realizes_function</code> (depuis l'organique) || {{#ask: [[Category:Functional item]] |format=count}}
|-
| [[:Category:Organic item|Organic item]] || le type d'objet qui réalise la fonction || [[:Modèle:Organic item|Modèle:Organic item]] || <code>Corresponds_to_organic</code> (depuis le référencé) || {{#ask: [[Category:Organic item]] |format=count}}
|-
| [[:Category:Referenced item|Referenced item]] || le moyen de se procurer l'objet || [[:Modèle:Referenced item|Modèle:Referenced item]] || <code>Instance_of</code> (depuis le physique) || {{#ask: [[Category:Referenced item]] |format=count}}
|-
| [[:Category:Physical item|Physical item]] || l'exemplaire présent sur un site || [[:Modèle:Physical item|Modèle:Physical item]] || terminus || {{#ask: [[Category:Physical item]] |format=count}}
|}

La définition complète de chaque classe figure sur sa page de catégorie.

Le découplage entre le troisième et le deuxième niveau est le ressort du
modèle : le niveau de maturité qualifie une '''voie d'approvisionnement''', pas
un objet. Un fournisseur peut devenir obsolète pendant que l'item organique et
les exemplaires en service restent parfaitement valides.

Les effectifs sont calculés en direct et ne peuvent pas se périmer.
```

---

### 2.2 — Lire le tableau des propriétés

```wikitext
== Lire le tableau des propriétés ==

Trois colonnes décrivent le schéma plutôt que le contenu :

* '''Cardinalité''' — <code>single</code> ou <code>multiple</code>, nombre de valeurs admises.
* '''Domaine''' — la ou les classes auxquelles la propriété s'applique.
* '''Portée''' — la classe visée, ou la nature de la valeur littérale attendue.

Ces trois colonnes préfigurent un schéma SHACL, où elles deviendront
respectivement <code>sh:maxCount</code>, <code>sh:targetClass</code> et
<code>sh:datatype</code> ou <code>sh:class</code>.

Convention d'écriture, à tenir : le domaine s'écrit sous la forme
<code>Category:Nom</code>, la portée sous la forme <code>Nom</code> seul.
```

---

### 2.3 — Vocabulaires externes importés (lacune 4)

```wikitext
== Vocabulaires externes importés ==

Quatre vocabulaires sont déclarés via le mécanisme d'import de Semantic
MediaWiki. Chaque page <code>MediaWiki:Smw import <nom></code> porte en première
ligne l'URI de base du vocabulaire, puis la liste des termes autorisés.

L'URI de base est l'''espace de noms de l'ontologie'', et non l'adresse de son
document de spécification : SMW concatène le terme directement à cette URI. Une
adresse de spécification produirait des URI syntaxiquement valides et
sémantiquement muettes.

{| class="wikitable"
! Vocabulaire !! URI de base !! Attributs qui en dérivent
|-
| foaf || <code>http://xmlns.com/foaf/0.1/</code> || <code>Foaf:name</code>, <code>Foaf:homepage</code>, <code>Foaf:knows</code>
|-
| owl || <code>http://www.w3.org/2002/07/owl#</code> || <code>Owl:differentFrom</code>
|-
| schema.org (v14.0) || <code>https://schema.org/</code> || aucun
|-
| skos || <code>http://www.w3.org/2004/02/skos/core#</code> || aucun
|}

Les quatre attributs dérivés ne sont utilisés nulle part à ce jour : ils
préparent la modélisation des personnes et des organisations.

L'espace de noms <code>MediaWiki:</code> exige le droit
<code>editinterface</code>. Ces pages ne sont modifiables ni par un compte
ordinaire, ni par un compte robot.

Les URI de owl et de skos ont été corrigées le 25 juillet 2026 ; elles
pointaient jusque-là vers les documents de spécification.
```

---

### 2.4 — Règles métier (lacune 8)

```wikitext
== Règles métier ==

Ces contraintes sont énoncées dans les info-bulles des formulaires. Elles sont
reprises ici parce qu'une contrainte qui ne vit que dans une aide de saisie
n'est pas opposable.

* Le titre d'un item fonctionnel est un '''verbe à l'infinitif'''.
* Une référence est un identifiant '''Base 36 de quatre caractères''', en majuscules.
* Un nom de tableau kanban '''ne contient pas de virgule'''.
* Un nom d'item référencé '''ne contient pas de virgule''' — depuis le 25 juillet 2026, la virgule sert de séparateur de valeurs pour <code>Part_of</code> dans <code>Modèle:Referenced item</code>.
```

---

### 2.5 — Règles implicites (lacune 9)

```wikitext
== Règles implicites ==

Ces règles ne sont lisibles qu'en lisant le code des modèles et des modules.
Les consigner ici est le seul moyen qu'elles survivent à leur auteur.

* La '''séquence Base 36 est partagée''' entre les items fonctionnels, organiques et référencés : le calcul du numéro suivant interroge les trois catégories ensemble. Les items physiques en sont exclus et leur référence est saisie à la main.
* Le module de numérotation '''détecte les trous de séquence, mais pas les doublons'''.
* <code>Part_of</code> est déclarée <code>multiple</code>, mais n'est réellement multivaluée que '''pour les items référencés''' — où elle sert de nomenclature, une même référence pouvant entrer dans plusieurs ensembles. Aux trois autres niveaux elle est alimentée par une liste déroulante à valeur unique. Semantic MediaWiki attache la cardinalité à la propriété et non au couple classe-propriété : seul un schéma SHACL saura exprimer la nuance.
* Les '''libellés de formulaire sont en français''', les '''noms de propriétés et de catégories en anglais'''. C'est une convention, pas une contrainte technique.
* Cette page apparaît dans les transclusions des quatre modèles d'items, parce qu'elle en affiche le code source via <code>#invoke:Source</code>. Ce n'est '''pas''' une instance de classe, et tout recensement doit l'écarter.
```

---

### 2.6 — Requêtes portées par les pages (lacune 3)

```wikitext
== Requêtes portées par les pages ==

Le comportement du système ne réside pas seulement dans les modèles. Dix
requêtes sont portées directement par des pages.

{| class="wikitable"
! Page !! Nombre !! Formats employés
|-
| Cette page || 1 || tableau des propriétés (<code>[[Has type::+]]</code>)
|-
| [[:Category:Functional item|Category:Functional item]] || 5 || <code>tree</code>, graphe Mermaid via <code>template</code>, <code>outline</code>, <code>table</code>, <code>datatable</code>
|-
| [[:Category:Organic item|Category:Organic item]] || 4 || <code>tree</code>, <code>outline</code>, <code>table</code>, <code>datatable</code>
|}

Les catégories des items référencés et physiques ne portent aucune requête.
```

---

### 2.7 — Configuration hors wiki (lacune 7)

```wikitext
== Configuration hors wiki ==

=== Socle logiciel ===

MediaWiki 1.39.11, langue <code>fr</code>. Semantic MediaWiki 4.2.0, Semantic
Result Formats 4.2.1, Page Forms 5.8.1, Mermaid 6.0.2, Scribunto.

Extensions ayant un effet sur les droits ou permettant des modifications en
masse, à connaître avant toute automatisation : '''Lockdown''', '''Nuke''',
'''Replace Text''', '''UserMerge'''.

=== Espaces de noms ===

102 <code>Attribut</code>, 106 <code>Formulaire</code>, 108 <code>Concept</code>,
828 <code>Module</code>.

=== Types de fichiers autorisés ===

png, gif, jpg, jpeg, webp, pdf, doc, docx, odt, xls, xlsx, ods, ppt, pptx, odp,
tiff, bmp, ico.

'''Le format svg n'est pas autorisé''', ce qui interdit le téléversement de
dessins vectoriels — contrainte notable pour un système de données techniques.

=== Suivi des dépendances de requêtes ===

<code>$smwgEnabledQueryDependencyLinksStore</code> est activé depuis le
26 juillet 2026. Une page contenant un <code>#ask</code> se rafraîchit
automatiquement quand les données qu'elle interroge changent, sans purge
manuelle. C'est un prérequis du kanban.

Deux limites : les requêtes à conditions génériques utilisant <code>~</code> ne
sont pas suivies, et la file de travaux doit tourner pour que les
rafraîchissements s'appliquent.

=== Droits ===

Aucune protection n'est posée page par page. Le contrôle d'accès s'exerce par
groupe et par espace de noms, via les droits d'utilisateur et l'extension
Lockdown. Une interrogation des protections ne permet donc '''pas''' de prévoir
si une écriture sera acceptée : un refus doit être traité comme un résultat
normal.

=== Ce qui reste à documenter ===

Relevés dans <code>LocalSettings.php</code>, non exposés par l'API :
<code>$wgNamespacePermissionLockdown</code>, <code>$wgGroupPermissions</code>,
et les autres réglages <code>$smwg*</code>.
```

---

## 3. Contrôles après écriture

1. Le tableau des propriétés affiche dix-neuf lignes et quatre nouvelles
   colonnes. Onze lignes renseignées en cardinalité, huit vides.
2. `list=categorymembers` sur les quatre classes renvoie exactement 19, 2, 0, 0.
   **C'est le contrôle qui compte** : cette mise à jour introduit une vingtaine
   de liens de catégorie dans une page qui n'en portait aucun. Tout écart
   signifie qu'un `:` initial manque.
3. Les quatre `#ask` d'effectif de la section « Les quatre classes » affichent
   les mêmes chiffres que le contrôle précédent.
4. La page reste hors des quatre catégories : `list=categorymembers` ne doit
   jamais la retourner.

---

## 4. État des lacunes après cette mise à jour

| Lacune | État |
|---|---|
| 1 — kanban | en attente de l'import ; prérequis technique levé le 26 juillet |
| 2 — `Serial_number` | comblée, affichage automatique |
| 3 — requêtes hors modèles | comblée ici |
| 4 — vocabulaires | comblée ici |
| 5 — cardinalité, domaine, portée | comblée ici et par le lot 3 |
| 6 — catégories comme classes | comblée ici et par le lot 3 |
| 7 — configuration | comblée ici, sauf `LocalSettings.php` |
| 8 — règles métier | comblée ici |
| 9 — règles implicites | comblée ici |
| 10 — volumétrie et droits | comblée ici |

**Question ouverte :** la page anglaise « System for Technical Data Management »
doit-elle recevoir le même traitement ? Rien n'a été fait de ce côté, et la
dupliquer mécaniquement n'est pas nécessairement le bon choix — une
spécification bilingue peut aussi diverger volontairement.
