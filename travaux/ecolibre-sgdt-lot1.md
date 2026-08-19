# Lot 1 — Corrections de schéma SGDT

**Pour :** session Claude Code sur la machine de Cyril, répertoire `~/ecolibre-sgdt`
**Cible :** `https://wiki.ecolibre.org` — MediaWiki 1.39.11 + Semantic MediaWiki
**Compte :** `Cywil@claude-sgdt` (identifiants dans `.env`, chmod 600)
**Établi le :** 25 juillet 2026, à partir d'une lecture seule du wiki de production.

---

## 0. Pourquoi maintenant

État du corpus au moment de la rédaction (source : `Spécial:Catégories`) :

| Catégorie | Membres | Page de catégorie |
|---|---|---|
| Functional item | 20 | existe |
| Organic item | 3 | existe |
| Referenced item | 1 | **n'existe pas** (lien rouge) |
| Physical item | 0 | **n'existe pas du tout** |

**24 pages d'items au total.** Toutes les corrections ci-dessous sont donc à coût de
reprise nul ou quasi nul. Elles ne le seront plus jamais autant : après l'import
kanban (33 pages) et l'ouverture du wiki de l'Atelier du Dôme, chaque correction de
type ou de cardinalité devient une opération de migration de données.

C'est le seul argument de calendrier qui compte ici.

---

## 1. Garde-fous d'exécution

1. **Lire avant d'écrire.** Toujours récupérer le wikitexte courant
   (`action=parse&prop=wikitext`), calculer le diff, puis écrire. Jamais d'écriture
   à l'aveugle.
2. **Une modification = une édition = un résumé explicite.** Format du résumé :
   `[Lot 1] <point> — <action>`. Cela rend le lot annulable page par page.
3. **`createonly=1`** sur toute création de page. Si la page existe déjà, l'appel
   doit échouer et remonter, pas écraser.
4. **Aucune nouvelle référence Base 36 ne doit être créée.** Règle existante :
   risque de collision de compteur entre local et production.
5. **Pages protégées.** Plusieurs pages du SGDT sont protégées. Vérifier
   `prop=info&inprop=protection` avant d'écrire, et remonter si le niveau
   dépasse les droits du compte bot.
6. **Périmètre.** Les actions A et B ci-dessous sont validées. Tout le reste est
   de la reconnaissance en lecture seule ou de la rédaction à soumettre à Cyril.
   Ne pas modifier les quatre modèles d'items en dehors de l'action B.

---

## 2. Action A — Déclarer `Serial_number` (point 2)

### Diagnostic

Le tableau des propriétés du Récapitulatif est généré par
`{{#ask: [[Has type::+]] ...}}`. L'absence de `Serial_number` signifie que la page
d'attribut n'existe pas, ou n'y déclare pas `Has type`.

SMW ne laisse jamais une propriété sans type : il applique le défaut, qui est
**Page** (`_wpg`). Donc `|Serial_number={{{sn|}}}` dans `Modèle:Physical item` ne
stocke pas une chaîne, il stocke un lien vers une page inexistante. Invisible à
l'écran (le modèle affiche `{{{sn|}}}` en texte brut), bien réel en base et à
l'export RDF : propriété d'objet vers une URI de page au lieu d'un littéral.

Aucun item physique n'existe → **zéro valeur à reprendre**. Pas de `refreshData`,
pas de null edit.

### Vérification préalable

```
GET api.php?action=query&titles=Attribut:Serial%20number&prop=info&format=json&formatversion=2
```

Si la page existe déjà, **s'arrêter et remonter** : le contenu actuel doit être
examiné avant toute écriture.

### Écriture

Page : `Attribut:Serial number`
(le `_` du `#set` et l'espace du titre sont équivalents pour MediaWiki, comme
`Item_ref` / `Item ref`)

```
[[Has type::Keyword]]
[[Property_description_FR::Numéro de série attribué par le constructeur, propre à l'exemplaire physique.]]
[[Property_description_EN::Manufacturer-assigned serial number, specific to the physical instance.]]
```

Résumé d'édition : `[Lot 1] Point 2 — déclaration de la propriété Serial number (type Keyword)`

### Pourquoi `Keyword` et pas autre chose

`Spécial:Types` confirme les 18 types disponibles sur cette installation.

- `Texte` (`_txt`) — longueur arbitraire, non normalisé, comparaisons et tri non
  fiables. Le réflexe habituel, et le mauvais choix.
- `Code` (`_cod`) — variante d'affichage de Texte pour du code source. C'est ce
  qu'utilise `Item_ref`. Cohérent visuellement, mêmes limites de fond.
- **`Keyword` (`_keyw`)** — variante de Texte à longueur restreinte (255) et
  représentation normalisée. Indexé, comparable, triable, exporté en littéral
  simple. Un SN est un identifiant court, pas de la prose.
- `External identifier` (`_eid`) — théoriquement le plus juste *si* un SN se
  résolvait en URL via une `External formatter URI`. C'est rare et ça se
  déciderait constructeur par constructeur. Écarté pour l'instant.

### Contrôles après écriture

1. `action=ask` sur `[[Has type::+]]` doit maintenant retourner 16 propriétés,
   dont `Serial number`.
2. Purge du Récapitulatif :
   `action=purge&titles=R%C3%A9capitulatif%20technique%20du%20Syst%C3%A8me%20de%20Gestion%20de%20Donn%C3%A9es%20Techniques`
   Le tableau se met à jour seul, il n'y a rien à éditer sur la page elle-même.
3. `Spécial:Attributs` ne doit plus signaler `Serial number` comme propriété
   utilisée sans déclaration de type.

### Réserve à lever

La « représentation normalisée » de `Keyword` porte sur les espaces, le balisage
et la longueur. Je n'ai pas pu vérifier qu'elle **préserve la casse**. Si les
numéros de série doivent rester sensibles à la casse, tester sur le miroir local
avant de considérer le point clos. Test minimal : créer un item physique de test
avec `sn=aB12`, puis lire la valeur stockée via `action=browsebysubject`.

---

## 3. Action B — Dette n°1 : `+sep=,` sur `Part_of` (confirmée en lecture)

### Diagnostic confirmé

`Form:Referenced item` alimente `parents` en `input type=tokens|...|list`, donc
valeurs séparées par virgules. `Modèle:Referenced item` fait
`|Part_of={{{parents|}}}` sans séparateur. Les cas d'emploi multiples sont
aujourd'hui aplatis en un littéral unique.

**Il n'existe qu'un seul item référencé sur le wiki.** La reprise est donc nulle
ou d'une page. C'est maintenant ou jamais.

### Modification

Dans `Modèle:Referenced item`, insérer `|+sep=,` **immédiatement après** la ligne
`Part_of`, le paramètre `+sep` s'appliquant à l'assignation qui le précède :

```
{{#set:
|Item_ref={{{Item_ref|}}}
|Item_description={{{description|}}}
|Maturity_level={{{maturity|}}}
|Part_of={{{parents|}}}
|+sep=,
|Corresponds_to_organic={{{organic_link|}}}
}}
```

Résumé : `[Lot 1] Dette n°1 — +sep=, sur Part_of pour stockage multivalué correct`

### Conséquence à documenter (elle relève du point 8)

À partir de cette modification, la virgule devient un délimiteur pour `Part_of`
dans ce modèle. **Un nom de page d'item référencé ne doit plus contenir de
virgule.** C'est exactement la même contrainte que celle déjà retenue pour les
noms de tableaux kanban. Les deux doivent être énoncées ensemble.

### Portée : uniquement ce modèle

Les trois autres modèles alimentent `Part_of` depuis un `combobox` (valeur
unique) : `Functional item` via `Part_of`, `Organic item` via `parent`,
`Physical item` via `physical_parent`. Ils n'ont pas besoin de `+sep`, et lui en
ajouter un introduirait la contrainte « pas de virgule » sans contrepartie.

### Amélioration facultative, non incluse dans ce lot

La ligne d'affichage `| {{{parents|}}}` rend une liste de texte brut, sans liens.
Un `{{#arraymap:{{{parents|}}}|,|@@@|[[@@@]]|, }}` la rendrait cliquable.
Sans risque, mais c'est une modification d'affichage : à soumettre à Cyril
séparément plutôt qu'à glisser dans une correction de schéma.

---

## 4. Reconnaissance à exécuter (points 3, 4, 6, 7, 10)

Lecture seule. L'objectif est de rapporter les faits que je n'ai pas pu obtenir
depuis une session navigateur, pour que la rédaction du Récapitulatif s'appuie sur
l'état réel et non sur des suppositions.

### 4.1 Instantané complet du wiki — à faire en premier

Le wiki est minuscule. Récupérer l'intégralité du wikitexte une bonne fois, dans
`~/ecolibre-sgdt/dump/AAAA-MM-JJ/`, puis travailler en local :

```
GET api.php?action=query&generator=allpages&gapnamespace=<N>&gaplimit=500
        &prop=revisions&rvprop=content|timestamp|ids&rvslots=main
        &format=json&formatversion=2
```

Namespaces à parcourir : `0` (principal), `8` (MediaWiki), `10` (Modèle),
`14` (Catégorie), `102` (Attribut), `106`/`108` (Formulaire — vérifier les
identifiants réels via `siprop=namespaces`), `828` (Module).

Ce dump sert deux fois : il résout les points 3 et 6 par un simple `grep`, et il
constitue le premier des « exports complets versionnés » prévus dans la
préparation à la migration. Ne pas le jeter.

### 4.2 Point 7 — configuration hors wiki

Ce que l'API donne directement :

```
GET api.php?action=query&meta=siteinfo
        &siprop=general|namespaces|namespacealiases|fileextensions|statistics|extensions
        &format=json&formatversion=2
```

→ ferme `$wgFileExtensions` (et confirme au passage l'absence de `svg`, déjà
signalée), la liste des espaces de noms, les compteurs de pages (point 10), et
l'inventaire des extensions avec versions — ce qui rend inutile la copie manuelle
de `Spécial:Version` restée en attente.

Ce que l'API ne donne pas : les réglages `$smwg*`, dont
`$smwgEnabledQueryDependencyLinksStore`, prérequis du kanban `Board_lineage`.
Ils sont consultables **en session navigateur connectée** sur
`Spécial:SemanticMediaWiki`, onglet des paramètres de configuration, qui liste
l'ensemble des `$smwg*` effectifs. À demander à Cyril, c'est un copier-coller.

Restent hors de portée sans le sysadmin : les vhosts Nginx et tout ce qui est
au-dessus de l'applicatif. Ne pas insister.

### 4.3 Point 4 — correspondances de vocabulaire

`Catégorie:Imported vocabulary` compte **8 membres**. Le mécanisme d'import
existe donc déjà ; c'est le Récapitulatif qui ne l'expose pas. La lacune n°4 est
une lacune de documentation, pas d'implémentation.

```
GET api.php?action=query&list=categorymembers
        &cmtitle=Cat%C3%A9gorie:Imported%20vocabulary&cmlimit=500
        &format=json&formatversion=2

GET api.php?action=query&list=allpages&apnamespace=8&apprefix=Smw%20import
        &format=json&formatversion=2
```

Puis récupérer le wikitexte de chaque page `MediaWiki:Smw import <vocabulaire>` :
elle contient l'URI de base et la liste des termes autorisés. C'est la table de
correspondance recherchée, et la colonne où viendront s'inscrire les alignements
PAIR.

**Gain probable en une ligne :** `Imported from` est une propriété spéciale SMW,
donc interrogeable. Ajouter `|?Imported from=Vocabulaire externe` au `#ask` du
Récapitulatif afficherait les correspondances automatiquement, sans rien saisir.
À tester avant de le proposer comme acquis.

### 4.4 Point 3 — requêtes `#ask` hors modèles

`insource:` nécessite CirrusSearch, probablement absent. Passer par le dump du
§4.1 et grep :

```
grep -rn '#ask\|#show\|#set\|#invoke\|#arraymap\|#forminput' ~/ecolibre-sgdt/dump/
```

Rapporter : page, fonction, requête, et ce que la requête sert à afficher.
Les requêtes portées par les pages de portail et de tableau de bord sont du
comportement système au même titre que celles des modèles.

### 4.5 Point 6 — les catégories comme classes

Deux catégories d'items n'existent pas comme pages : `Referenced item` (lien
rouge) et `Physical item` (aucune trace). Elles sont pourtant posées par les
modèles et deviendront des `rdf:type` en RDF.

Livrable : créer les pages manquantes avec une définition d'une phrase, et une
section du Récapitulatif énumérant chaque catégorie, sa signification, le modèle
qui la pose, et son effectif. La reconnaissance fournit les effectifs :

```
GET api.php?action=query&list=allpages&apnamespace=14&aplimit=500&format=json&formatversion=2
GET api.php?action=query&list=categorymembers&cmtitle=<catégorie>&cmlimit=500&format=json&formatversion=2
```

À distinguer clairement : catégories-classes (`Functional item`, `Organic item`,
`Referenced item`, `Physical item`) contre catégories de maintenance
(`À traduire en anglais`, `Documentation SGDT`, `Pages avec des liens de fichiers
brisés`). Seules les premières ont vocation à devenir des classes.

### 4.6 Point 10 — volumétrie et droits

```
GET api.php?action=query&generator=allpages&gaplimit=500
        &prop=info&inprop=protection&format=json&formatversion=2
```

Croiser avec `siprop=statistics`. Rapporter le tableau des protections par
espace de noms — c'est la seule information de ce lot qui touche à la
confidentialité, et donc au dimensionnement de la ferme de wikis.

---

## 5. Point 5 — cardinalité, domaine, portée : la conception proposée

C'est le point qui prépare SHACL, et le seul qui demande une décision de fond
avant toute écriture. **Ne rien créer sans validation de Cyril.**

Proposition : rester fidèle au principe « la page est le cahier des charges »
en décrivant le schéma avec les outils du schéma lui-même. Trois nouvelles
propriétés, portées par les pages `Attribut:` :

| Propriété | Type | Valeurs | Devient en SHACL |
|---|---|---|---|
| `Property_cardinality` | Keyword | `single` / `multiple` | `sh:maxCount` |
| `Property_domain` | Page | catégories concernées | `sh:targetClass` |
| `Property_range` | Keyword | classe ou type cible | `sh:datatype` / `sh:class` |

Le `#ask` du Récapitulatif est alors étendu de trois colonnes, et le tableau des
propriétés devient un schéma lisible plutôt qu'une liste.

Premier remplissage, à valider ligne par ligne — c'est de la déduction depuis les
modèles et les formulaires, pas une lecture de spécification :

| Propriété | Cardinalité | Domaine | Portée |
|---|---|---|---|
| `Item_ref` | single | les 4 classes d'items | identifiant Base 36, 4 car. |
| `Item_description` | single | les 4 classes d'items | texte |
| `Part_of` | **multiple** pour Referenced, **single** ailleurs | les 4 classes | même classe que le sujet |
| `Realizes_function` | single | Organic item | Functional item |
| `Corresponds_to_organic` | single | Referenced item | Organic item |
| `Instance_of` | single | Physical item | Referenced item |
| `Maturity_level` | single | Referenced item | énumération fermée à 5 valeurs |
| `Serial_number` | single | Physical item | chaîne courte |

**Difficulté réelle, à trancher avec Cyril :** `Part_of` n'a pas la même
cardinalité selon la classe du sujet. En SMW, la cardinalité s'attache à la
propriété, pas au couple (classe, propriété). SHACL sait l'exprimer, SMW non.
Deux issues possibles — déclarer `multiple` partout et documenter l'usage réel,
ou scinder en deux propriétés. La première conserve les requêtes existantes, la
seconde est plus juste sémantiquement. Ne pas trancher seul.

`Maturity_level` mérite au passage sa propre remarque : l'énumération
`Idea / Study / Prototype / Certified / Obsolete` n'existe aujourd'hui que dans le
`dropdown` du formulaire et le `#switch` du modèle. Rien ne l'impose au niveau de
la propriété. C'est un cas d'école de règle implicite (point 9), et un candidat
naturel à `Allows value`.

---

## 6. Points 8 et 9 — les règles à écrire

Aucune reconnaissance nécessaire, ce sont des rédactions. Deux nouvelles sections
du Récapitulatif, à soumettre avant publication.

**Règles métier énoncées (point 8)** — aujourd'hui dispersées dans les info-box
de formulaires :

- Le titre d'un item fonctionnel est un verbe à l'infinitif.
- Un nom de tableau kanban ne contient pas de virgule.
- Un nom d'item référencé ne contient pas de virgule *(nouveau, conséquence de
  l'action B)*.
- Une référence Base 36 fait exactement 4 caractères, majuscules.

**Règles implicites lisibles seulement dans le code (point 9)** :

- La séquence Base 36 est **partagée** entre Functional, Organic et Referenced :
  le `#ask` de calcul du prochain numéro porte sur les trois catégories
  simultanément. Les items physiques en sont exclus et sont saisis manuellement —
  le formulaire n'a ni `#invoke:Base36` ni valeur par défaut, seulement un
  `placeholder`.
- Le module `Base36` détecte les trous de séquence mais **pas les doublons**.
- Les libellés de formulaire sont en français, les noms de propriétés et de
  catégories en anglais. C'est une convention, elle n'est écrite nulle part.
- `Module:Source` affiche le code source des objets techniques en préprocessant
  du `nowiki` : c'est ce qui permet au Récapitulatif de se citer lui-même sans
  exécuter ce qu'il montre.

---

## 7. Décisions en attente de Cyril

Aucune ne bloque les actions A et B.

1. **Items physiques et séquence Base 36.** Saisie manuelle maintenue, ou
   intégration à la séquence partagée ? Tant que c'est ouvert, le formulaire
   physique reste sans valeur par défaut et la règle §6 reste « exclus ».
2. **Portée d'unicité de `Serial_number`.** Un SN est unique chez un constructeur,
   pas globalement : deux constructeurs peuvent émettre le même. Un schéma de
   contrainte SMW (`unique_value_constraint`) sait l'exprimer et préfigure
   directement SHACL. À trancher avec le point 5, pas avant.
3. **Type de `Item_ref` — à regarder de près.** `Item_ref` est en `Code`, une
   variante de Texte. Or la génération du numéro suivant repose sur
   `|sort=Item_ref |order=desc |limit=1`. Le tri sur un type de la famille Texte
   n'est pas garanti par SMW ; il fonctionne ici parce que les références font
   toutes exactement 4 caractères et tiennent dans la colonne de hachage. Cela
   marche par propriété du format, pas par contrat du type. `Keyword` rendrait la
   garantie explicite. Coût aujourd'hui : réindexation de 24 pages, c'est-à-dire
   rien. Je ne le classe pas en urgence, mais c'est le même défaut que le point 2,
   sur la propriété qui est destinée à devenir l'identifiant canonique — et donc
   les futures URI `did:ng:`.
4. **Détection des doublons Base 36** dans le module d'audit — lot séparé, déjà
   identifié.

---

## 8. Ordre d'exécution recommandé

1. §4.1 — dump complet (sert de sauvegarde avant toute écriture)
2. §2 — action A (création `Attribut:Serial number`) + contrôles
3. §3 — action B (`+sep=,`) + contrôle sur l'unique item référencé
4. §4.2 à 4.6 — reconnaissance, rapport à Cyril
5. Arrêt. Les points 5, 6, 8, 9 demandent des décisions avant écriture.
