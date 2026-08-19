# Rapport de reconnaissance — Lot 1

**Exécuté le :** 25 juillet 2026, session Claude Code, compte `Cywil@claude-sgdt`.

---

## 1. Écritures réelles sur le wiki

Deux éditions, toutes deux vérifiées après coup.

### 1.1 Création — `Attribut:Serial number`

- **Méthode :** `action=edit` avec `createonly=1` (appel curl direct, `wiki-put.sh` ne
  supporte pas ce paramètre).
- **Résultat API :** `new: true`, `pageid: 111`, `oldrevid: 0`, `newrevid: 248`,
  `result: Success`.
- **Résumé d'édition exact :**
  `[Lot 1] Point 2 — déclaration de la propriété Serial number (type Keyword)`
- **Contenu exact écrit :**

```
[[Has type::Keyword]]
[[Property_description_FR::Numéro de série attribué par le constructeur, propre à l'exemplaire physique.]]
[[Property_description_EN::Manufacturer-assigned serial number, specific to the physical instance.]]
```

### 1.2 Édition — `Modèle:Referenced item`

- **Méthode :** `wiki-put.sh` (édition standard, page déjà existante, non protégée).
- **Résultat API :** `oldrevid: 175`, `newrevid: 249`, `result: Success`.
- **Résumé d'édition exact :**
  `[Lot 1] Dette n°1 — +sep=, sur Part_of pour stockage multivalué correct`
- **Diff exact (une seule ligne insérée, reste strictement identique) :**

```diff
 |Part_of={{{parents|}}}
+|+sep=,
 |Corresponds_to_organic={{{organic_link|}}}
```

- Diff vérifié programmatiquement avant écriture (`diff` sur le wikitexte récupéré
  en direct juste avant vs. après insertion) : 1171 → 1179 octets, aucune autre
  différence.

### 1.3 Contrôles post-écriture exécutés

| Contrôle | Résultat |
|---|---|
| `[[Has type::+]]` retourne 16 propriétés dont `Serial number` | ✅ confirmé (liste complète obtenue) |
| Purge du Récapitulatif | ✅ `purged: true` |
| `[[Category:Referenced item]] \|?Part_of` sur l'unique item référencé | ⚠️ voir §4 — l'item n'existe pas réellement |

---

## 2. Résultats des appels §4

### 2.1 Versions d'extensions (`siprop=extensions`)

MediaWiki **1.39.11**, langue `fr`.

| Extension | Version | vcs-version |
|---|---|---|
| MinervaNeue | — | — |
| MonoBook | — | — |
| Timeless | 0.9.1 | — |
| Vector | 1.0.0 | — |
| CategoryTree | — | — |
| Cite | — | — |
| MyVariables | 4.5 | 6351553f2395… |
| ParserFunctions | 1.6.1 | — |
| TemplateData | 0.1.2 | — |
| Scribunto | — | — |
| Mermaid | 6.0.2 | — |
| Clean Changes | 2022-07-28 | 8d297f55c3fc… |
| VEForAll | 0.5.2 | c22d36e57d42… |
| **Lockdown** | — | d8ebb2a53cfa… |
| CodeEditor | — | — |
| VisualEditor | 0.1.2 | — |
| WikiEditor | 0.5.3 | — |
| Nuke | — | — |
| PageForms | 5.8.1 | 12a19981dffc… |
| Renameuser | — | — |
| Replace Text | 1.7 | — |
| UserMerge | 1.10.1 | 5e894cbacb1d… |
| SemanticMediaWiki | 4.2.0 | — |
| SemanticResultFormats | 4.2.1 | — |
| ConfirmEdit | 1.6.0 | — |
| QuestyCaptcha | — | — |

`$wgFileExtensions` (via `siprop=fileextensions`) : png, gif, jpg, jpeg, webp, pdf,
doc, docx, odt, xls, xlsx, ods, ppt, pptx, odp, tiff, bmp, ico. **Pas de `svg`**
(confirme le point déjà signalé).

Statistiques (`siprop=statistics`) : 109 pages, 35 articles, 246 éditions,
6 images, 2 utilisateurs, 1 actif, 2 admins, 2 jobs en attente.

### 2.2 Réglages `$smwg*`

**Non obtenus.** Comme anticipé dans le document de cadrage, ces réglages ne sont
pas exposés par l'API MediaWiki/SMW (`action=query`, `action=ask`, `action=smwinfo`
n'en donnent aucun). Ils ne sont visibles que dans l'onglet configuration de
`Spécial:SemanticMediaWiki`, en session navigateur connectée. **À demander à Cyril
directement** — c'est un copier-coller, pas une investigation.

### 2.3 Pages `MediaWiki:Smw import <vocabulaire>`

Quatre pages, toutes dans `Catégorie:Imported vocabulary` (8 membres au total avec
les 4 attributs qui en découlent) :

| Page | URI de base | Termes autorisés | Attributs `Attribut:` effectivement créés |
|---|---|---|---|
| `Smw import foaf` | `http://xmlns.com/foaf/0.1/` | ~39 propriétés + 5 catégories | `Foaf:homepage`, `Foaf:knows`, `Foaf:name` |
| `Smw import owl` | `https://www.w3.org/TR/owl2-syntax/` | ~40 termes (catégories + propriétés) | `Owl:differentFrom` |
| `Smw import schema` | `https://schema.org/` (v14.0) | ~2800 termes (schema.org complet) | **aucun** |
| `Smw import skos` | `http://www.w3.org/TR/skos-reference` | ~30 termes | **aucun** |

Donc : le mécanisme d'import fonctionne et est déjà exploité pour foaf et owl ;
schema et skos sont déclarés mais inutilisés à ce jour.

**Vérifié en plus (gain signalé dans le document) :** `?Imported from` est bien
interrogeable via `#ask` sur `[[Has type::+]]` et retourne, pour les propriétés
importées, une ligne du type
`foaf homepage http://xmlns.com/foaf/0.1/  Type:URL`, vide pour les propriétés
natives. Ajouter cette colonne au `#ask` du Récapitulatif est donc un gain réel et
gratuit — testé, pas seulement supposé.

### 2.4 `#ask` trouvés hors des quatre modèles d'items

Recherche par `grep` sur le dump complet (`grep -rn '#ask'`, hors namespace Modèle) :

**`Récapitulatif technique...`** — 1 occurrence :
- Le tableau des propriétés (`[[Has type::+]]`, format table), celui qui motive
  l'action A.

**`Catégorie:Functional item`** — 5 occurrences :
- Hiérarchie en arbre (`format=tree`, `parent=Part_of`, `root=Assurer les besoins vitaux`)
- Graphe Mermaid (`format=template`, `template=MermaidLine`, imbriqué dans `{{#mermaid: ... }}`)
- Arborescence textuelle (`format=outline`)
- Liste des fonctions (`format=table`, colonnes Référence/Description/Parent)
- Tableau de bord (`format=datatable`, mêmes colonnes)

**`Catégorie:Organic item`** — 4 occurrences :
- Hiérarchie en arbre (`format=tree`, racine vide)
- Arborescence textuelle (`format=outline`)
- Liste des produits/services (`format=table`)
- Tableau de bord (`format=datatable`)

Aucun `#ask` trouvé sur les pages de Catégorie `Referenced item` ou `Physical item`
— cohérent avec le fait que ces pages de catégorie n'existent pas.

Le grep élargi (`#ask|#show|#set|#invoke|#arraymap|#forminput`) touche en plus,
hors modèles : les 8 pages `Formulaire:*` (via `#invoke:Source` pour afficher leur
propre code), et `Module:Source/doc` — attendu, ce sont des pages de
documentation qui se citent elles-mêmes, pas des requêtes fonctionnelles
supplémentaires à signaler.

---

## 3. Ce qui a échoué ou n'a pas pu être obtenu

1. **Réglages `$smwg*`** (dont `$smwgEnabledQueryDependencyLinksStore`) — hors de
   portée de l'API, nécessite une session navigateur connectée sur
   `Spécial:SemanticMediaWiki`. Non fait, à demander à Cyril.
2. **Vhosts Nginx et configuration serveur** — hors de portée, comme prévu dans le
   document de cadrage. Non tenté.
3. **Test de préservation de la casse pour le type `Keyword`** (réserve du §2 du
   document de cadrage) — nécessite un item physique de test (`sn=aB12`) suivi
   d'une lecture via `action=browsebysubject`. **Non fait** : aucun item physique
   n'existe, en créer un pour le seul test sortirait du périmètre validé (actions
   A et B seulement). Point resté ouvert.
4. **Vérification du contrôle §3 sur "l'unique item référencé"** — n'a pas pu
   aboutir positivement : l'`#ask` sur `[[Category:Referenced item]]` renvoie 0
   résultat. En creusant (`list=categorymembers` puis `list=embeddedin` sur
   `Template:Referenced item`), la cause a été identifiée : ce n'est pas un item
   réel. `Formulaire:Physical item/doc` s'y trouve par accident (lien
   `[[Category:Referenced item]]` écrit sans `:` initial au milieu d'une phrase de
   documentation, ce qui catégorise la page). **Il n'existe aucun item référencé
   réel sur le wiki**, contrairement à l'hypothèse du document de cadrage (« un
   seul item référencé »). Sans conséquence négative sur l'action B déjà écrite
   (l'impact réel est encore plus nul que prévu), mais la justification affichée
   dans le document était fondée sur un chiffre inexact. Bug de catégorisation non
   corrigé (hors périmètre de ce lot).
5. **Couverture partielle du contrôle de protection (§4.6, point 10)** — le
   contrôle `prop=info|inprop=protection` a été fait sur les namespaces 0, 2, 8,
   10, 14, 102, 106, 828 (98 pages), pas sur la totalité des 109 pages du wiki
   (namespaces Fichier, pages de discussion, etc. non couverts). Aucune protection
   trouvée sur les pages vérifiées ; le reste n'a pas été vérifié faute de
   pertinence pour le périmètre SGDT.

---

## 4. Pour mémoire

Dump complet source de ce rapport : `~/ecolibre-sgdt/dump/2026-07-25/`
(96 pages, wikitexte extrait individuellement sous `wikitext/`, manifeste dans
`index.tsv`).
