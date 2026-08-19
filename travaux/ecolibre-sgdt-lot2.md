# Lot 2 — Vocabulaires et intégrité des classes

**Pour :** session Claude Code, dépôt `~/ecolibre-sgdt`
**Cible :** `https://wiki.ecolibre.org` — MediaWiki 1.39.11, SMW 4.2.0
**Suite de :** Lot 1 (actions A et B exécutées le 25 juillet 2026, révisions 248 et 249)
**Établi le :** 25 juillet 2026

---

## 0. Objet et ordre

Trois actions, dans cet ordre — la lecture avant l'écriture, toujours :

| | Action | Nature |
|---|---|---|
| C | Recensement croisé des catégories-classes | lecture seule |
| D | Correction des deux URI de vocabulaire fautives | écriture, 2 pages |
| E | Correction des miscatégorisations trouvées en C | écriture, périmètre défini par C |

Les garde-fous du `CLAUDE.md` s'appliquent intégralement. Rappel du plus
important pour ce lot : **aucune correction hors de la liste produite par
l'action C**. Si le recensement révèle autre chose, on le signale, on ne le
corrige pas.

Le dump du 25 juillet (`~/ecolibre-sgdt/dump/2026-07-25/`) sert de source pour
tout ce qui est lecture de wikitexte. Ne pas re-télécharger ce qui est déjà là.

---

## 1. Action C — Recensement croisé (lecture seule)

### Le problème à résoudre

`Attribut:Item ref` affiche **21 utilisations**. Les catégories annoncent
20 items fonctionnels + 3 organiques = **23 pages**. Deux pages manquent à
l'appel. Deux explications possibles, pas exclusives : des items créés sans
référence, ou des pages qui ne sont pas des items et qui se sont retrouvées
dans une catégorie-classe — le cas déjà avéré de
`Formulaire:Physical item/doc` dans `Catégorie:Referenced item`.

L'enjeu n'est pas le comptage. C'est que les catégories `Functional item`,
`Organic item`, `Referenced item` et `Physical item` sont destinées à devenir
des `rdf:type`. Une page de documentation qui atterrit dans l'une d'elles
produit une assertion de classe fausse, qui se propagera dans tout ce qui sera
construit dessus.

### Méthode

Pour chacune des quatre catégories-classes, constituer deux ensembles :

```
GET api.php?action=query&list=categorymembers&cmtitle=Cat%C3%A9gorie:<C>
        &cmlimit=500&format=json&formatversion=2

GET api.php?action=query&list=embeddedin&eititle=Mod%C3%A8le:<C>
        &eilimit=500&format=json&formatversion=2
```

Le premier donne qui *est déclaré* dans la classe. Le second donne qui
*transclut le modèle* qui pose la classe. Un item réel est dans les deux.

Trois écarts à rapporter séparément :

1. **Dans la catégorie, pas dans les transclusions** → catégorisation
   parasite. C'est le bug avéré. Candidats à l'action E.
2. **Dans les transclusions, pas dans la catégorie** → anomalie inverse, plus
   rare, à comprendre avant toute action (transclusion depuis un `noinclude`,
   page de documentation qui appelle le modèle pour l'illustrer).
3. **Items réels sans `Item_ref`** — croiser avec :
   ```
   action=ask&query=[[Category:<C>]] [[Item_ref::+]]
   ```
   contre l'effectif de la catégorie restreint aux items réels.

### Vérification complémentaire du même bug ailleurs

Sur le dump, hors des quatre modèles d'items :

```
grep -rn '\[\[Category:\|\[\[Catégorie *:' ~/ecolibre-sgdt/dump/2026-07-25/wikitext/
```

Toute occurrence sans `:` initial dans une page `*/doc`, `Formulaire:*` ou
`Modèle:*` autre que les quatre modèles d'items est suspecte : elle catégorise
la page au lieu de pointer vers la catégorie.

### Livrable de l'action C

Un tableau dans le rapport de session, une ligne par anomalie :
page concernée, catégorie indûment portée, wikitexte fautif exact, correction
proposée. **Rien n'est écrit à ce stade.**

---

## 2. Action D — Corriger les deux URI de vocabulaire

### Diagnostic

Les pages `MediaWiki:Smw import owl` et `MediaWiki:Smw import skos` déclarent
comme URI de base l'adresse du **document de spécification**, et non l'espace
de noms de l'ontologie.

| Vocabulaire | Déclaré aujourd'hui | Valeur correcte |
|---|---|---|
| owl | `https://www.w3.org/TR/owl2-syntax/` | `http://www.w3.org/2002/07/owl#` |
| skos | `http://www.w3.org/TR/skos-reference` | `http://www.w3.org/2004/02/skos/core#` |

(`foaf` → `http://xmlns.com/foaf/0.1/` et `schema` → `https://schema.org/` sont
corrects, ne pas y toucher.)

SMW concatène le terme directement à l'URI de base. Conséquence actuelle :
`Owl:differentFrom` s'exporte en `https://www.w3.org/TR/owl2-syntax/differentFrom`,
que rien ne reconnaîtra comme `owl:differentFrom`. Le graphe est syntaxiquement
valide et sémantiquement muet.

Le cas de skos est structurellement pire — l'URI ne se termine ni par `/` ni
par `#`, donc la concaténation produirait `http://www.w3.org/TR/skos-referenceConcept`.
Le vocabulaire n'étant pas encore utilisé, les dégâts sont théoriques.

### Avant d'écrire

Relire la **première ligne réelle** de chaque page dans le dump. Le format SMW
est :

```
<URI de base>|<lien lisible vers le vocabulaire>
 terme|Type:X
 terme|Category
 ...
```

Ne modifier **que la partie située avant le `|` de la première ligne**. Les
lignes de termes ne changent pas, et le nombre de lignes du fichier doit être
identique avant et après. Vérifier ce point dans le diff.

L'adresse de spécification a sa place légitime après le `|`, comme libellé
lisible. Si elle n'y figure pas déjà, la proposer à Cyril plutôt que de
l'ajouter d'office — c'est un changement d'affichage, pas une correction.

### Écritures

Résumés d'édition :

```
[Lot 2] Action D — URI de base owl corrigée vers l'espace de noms de l'ontologie
[Lot 2] Action D — URI de base skos corrigée vers l'espace de noms de l'ontologie
```

### Reprise après écriture — étape indispensable

SMW résout l'import au moment de l'analyse de la page d'attribut, pas à
l'export. Changer la page d'import ne suffit donc pas : les attributs qui en
dépendent doivent être ré-analysés.

Une seule propriété est concernée d'après la reconnaissance :
`Attribut:Owl:differentFrom`. Un null edit suffit (`action=edit` avec le texte
inchangé, ou `action=purge&forcelinkupdate=1`).

Vérifier d'abord si d'autres attributs dépendent de ces deux imports :

```
action=ask&query=[[Imported from::+]]|?Imported from
```

### Contrôles

1. `Spécial:Export RDF` sur `Attribut:Owl:differentFrom`, syntaxe rdf, puis
   recherche de la chaîne `2002/07/owl` dans la sortie. Elle doit être
   présente ; `TR/owl2-syntax` doit avoir disparu.
2. Vérifier au passage si la propriété est utilisée quelque part :
   ```
   action=ask&query=[[Owl:differentFrom::+]]
   ```
   Si le résultat est vide, la correction est purement préventive — ce qui ne
   la rend pas moins nécessaire, mais c'est une information utile pour le
   rapport.

---

## 3. Action E — Corriger les miscatégorisations

**Périmètre : strictement la liste produite par l'action C**, et rien d'autre.

### Le cas connu

`Formulaire:Physical item/doc` porte `[[Category:Referenced item]]` sans `:`
initial, au milieu d'une phrase de documentation. La page est donc déclarée
comme item référencé.

Deux erreurs se superposent ici : la catégorisation involontaire, et le fait
que la catégorie citée n'est même pas celle que la page documente. **Lire le
contexte de la phrase avant de corriger** — l'intention était peut-être de
renvoyer vers `Catégorie:Physical item`. Si le doute subsiste, remonter la
question plutôt que de trancher.

Correction attendue dans le cas simple : ajouter le `:` initial, qui
transforme la catégorisation en simple lien.

```
[[Category:Referenced item]]   →   [[:Category:Referenced item]]
```

### Écriture

Une édition par page, résumé :

```
[Lot 2] Action E — lien de catégorie sans ':' initial, catégorisation involontaire
```

### Contrôle

Re-jouer `list=categorymembers` sur les catégories concernées. Les effectifs
doivent correspondre exactement aux transclusions du modèle correspondant.

Rapporter les effectifs corrigés — ils remplacent le tableau du §0 du Lot 1,
qui était faux sur la ligne `Referenced item`.

---

## 4. Outillage

`wiki-put.sh` ne gère pas `createonly`, ce qui a obligé à passer par curl à la
main pour l'action A du Lot 1. À corriger tant que c'est frais : ajouter un
drapeau optionnel qui transmet `createonly=1`, et refuser silencieusement
d'écraser une page existante quand il est actif.

Ce n'est pas cosmétique : le garde-fou « ne jamais écraser une page qu'on n'a
pas lue » ne vaut que s'il est dans l'outil, pas seulement dans les consignes.

---

## 5. À faire hors session — pour Cyril

### 5.1 Extraits de `LocalSettings.php`

Trois blocs, invisibles depuis l'API, qui bloquent les points 5 et 10 :

- `$smwg*` — notamment `$smwgEnabledQueryDependencyLinksStore`, prérequis du
  kanban `Board_lineage`. Consultables aussi dans l'onglet de configuration de
  `Spécial:SemanticMediaWiki`, en session connectée.
- `$wgNamespacePermissionLockdown` — l'extension **Lockdown** est installée et
  n'apparaît dans aucun appel d'API. Le contrôle d'accès de ce wiki n'est pas
  par page, il est par groupe et par espace de noms. C'est le mécanisme à
  documenter pour une ferme servant plusieurs organisations.
- `$wgGroupPermissions` — l'interdiction d'éditer pour les anonymes (groupe
  « Utilisateurs » plus adresse confirmée) en relève.

### 5.2 Deux tests sur le miroir local

Les deux sont restés ouverts et se font dans la même séance :

1. **Casse du type `Keyword`.** Créer un item physique de test avec
   `sn=aB12`, relire la valeur stockée via `action=browsebysubject`. Si la
   casse n'est pas préservée, le choix de type pour `Serial_number` est à
   revoir avant qu'il n'y ait des données réelles.
2. **`+sep=,` sur `Part_of`.** L'action B du Lot 1 est écrite mais n'a jamais
   rien séparé, faute d'item référencé réel. Créer un item de test avec deux
   parents, vérifier que `Part_of` stocke bien deux valeurs de type Page et non
   un littéral unique.

Sur le miroir, la règle « aucune nouvelle référence Base 36 » ne s'applique
pas : c'est précisément à quoi il sert.

---

## 6. Ne pas faire

- Ne pas créer `Catégorie:Referenced item` ni `Catégorie:Physical item`. Elles
  manquent, et c'est le point 6 — il demande une définition de classe, donc une
  décision de Cyril.
- Ne pas toucher `Smw import foaf` ni `Smw import schema` : leurs URI sont
  correctes.
- Ne pas ajouter la colonne `?Imported from` au Récapitulatif dans ce lot. Le
  gain est confirmé, mais l'ajouter avant la correction des URI afficherait des
  correspondances fausses en évidence.
- Ne pas corriger d'anomalie découverte en dehors de la liste de l'action C.
