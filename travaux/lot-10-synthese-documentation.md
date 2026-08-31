# Lot 10 — mise à jour des pages de synthèse : plan d'insertion

**Session du 30-31 août 2026.** Tâche : mettre à jour, après le lot 10, les deux
pages de référence qui font autorité et n'ont pas bougé depuis le lot 9 :

- **« Récapitulatif technique du Système de Gestion de Données Techniques »**
  (≈ 29 100 caractères de wikitexte)
- **« Limites connues du Système de Gestion de Données Techniques »**
  (≈ 29 700 caractères de wikitexte)

plus une ligne sur **« Gestion des lots »**.

**État de ce document : plan d'insertion soumis à validation. AUCUNE écriture
wiki n'a été faite.** Le point d'arrêt après l'étape 1 tient : Cyril valide le
plan avant toute écriture sur des pages de cette taille.

Source unique autorisée : `travaux/lot-10-tache7-cloture.md` (rapport de
clôture du lot 10, y compris son §3 de rectification et sa section 8), et les
vérifications faites directement sur le wiki et consignées ci-dessous. Le
rapport de clôture a déjà porté trois affirmations fausses, corrigées ensuite ;
aucune n'est recopiée sans re-mesure. Quand une mesure contredit la consigne,
la contradiction est gardée telle quelle dans ce document — c'est
l'information la plus utile.

---

## 1. Lectures préalables faites

- Les deux pages de synthèse en entier, avec leur plan de sections (wikitexte
  récupéré par `bin/wiki-get.sh`, copies de travail hors dépôt).
- `travaux/lot-10-tache7-cloture.md` en entier (les 8 sections).
- `travaux/lot-12-cadrage-contenants.md` (rapport de création de la page de
  cadrage du lot 12) **et** la page wiki `Lot 12 — Contenants et étiquetage`
  elle-même (le rapport ne contient pas les arbitrages, seulement la mise en
  forme ; les arbitrages sont sur la page).
- `Gestion des lots` (wikitexte), `Registre des préfixes de site` (wikitexte),
  `Modèle:Functional item`, `Modèle:Referenced item`,
  `Modèle:Physical facet plant`, `Attribut:Inventory_number`,
  `Catégorie:Functional item` (wikitexte + rendu `action=parse`).
- `demandes-adminsys.md` (section 2.2, configuration).
- Inventaire des fichiers de `travaux/`, `diffs/` et de la racine du dépôt
  (pour l'étape 4).

Remarque de nommage : la page « Feuille de route » a pour titre exact
**« Feuille de route du Système de Gestion de Données Techniques »** (un premier
essai avec « Feuille de route du SGDT » renvoie « page inexistante »). Elle
n'est pas dans le périmètre de cette tâche ; noté pour éviter une fausse piste.

---

## 2. Vérifications refaites sur le wiki (30 août 2026)

Chaque élément que le plan prévoit d'ajouter a été vérifié dans son état réel
sur le wiki. Méthode : `bin/wiki-api.sh --facts` pour les faits SMW,
`action=query`/`action=ask`/`action=parse` pour le reste.

### 2.1 Procédés et marqueur de catégorie

- **`Catégorie:Procédé`** (`action=query&list=categorymembers`) : **5 membres** —
  `Assembler`, `Braser tendre`, `Maintenir en position`,
  `Mesurer une grandeur électrique`, `Souder par points`. Aucun autre.
- Facts de chacun (`--facts subject=…&ns=0`) : les cinq portent
  `_INST = Functional_item#14## + Procédé#14##` et un
  `External_classification` vers une page Wikidata (Q1480529, Q67131697,
  Q2327972, Q3859407, Q2306980).
- **Marqueur posé par le modèle, pas à la main** : `Modèle:Functional item`
  (wikitexte récupéré) contient
  `{{#ifeq:{{{Procédé|}}}|oui|[[Catégorie:Procédé]]}}`. La catégorie est
  émise par le champ de formulaire `Procédé`, valeur `oui`. Le même modèle
  accepte désormais `Practice_domain` (via
  `{{#arraymap:…|,|@@@|{{#set:Practice_domain=@@@}}}}`, jamais `+sep=,` —
  propriété Texte) et `External_classification` (dans le `#set` principal).

### 2.2 `Practice_domain`

`bin/wiki-api.sh --facts "subject=Practice_domain&ns=102"` :

| Fait | Valeur |
|---|---|
| `_TYPE` | `…swivt/1.0#_txt` (type **Text**) |
| `Property_cardinality` | `multiple` |
| `Property_domain` | `Functional_item#14##` |
| `Property_range` | `valeurs laissées émerger` |
| `Property_description_FR` | « Domaine de pratique auquel se rattache un procédé. » |

Valeurs réelles portées par les procédés :

| Procédé | `Practice_domain` |
|---|---|
| Braser tendre | électronique, plomberie |
| Souder par points | électronique, énergie |
| Mesurer une grandeur électrique | (non relu individuellement ; le rapport de clôture donne électronique, électricité, énergie) |
| **Assembler** | **aucune valeur** (fait absent) |
| **Maintenir en position** | **aucune valeur** (fait absent) |

→ La propriété est bien portée par le procédé (item fonctionnel) et jamais
par l'outil : son `Property_domain` est `Functional_item`, pas
`Referenced_item`.

### 2.3 Les cinq propriétés d'outil

`--facts` sur chacune (`ns=102`). **Toutes ont pour `Property_domain`
`Referenced_item#14##`** — ce sont des propriétés de l'item référencé, pas
d'une classe « outil » qui n'existe pas :

| Propriété | `_TYPE` | Cardinalité | `Property_range` |
|---|---|---|---|
| `Procurement_route` | `_txt` (Text) | single | valeurs laissées émerger |
| `Power_rating` | `_num` (Number) | single | `W` |
| `Max_thickness` | `_num` (Number) | single | `mm` |
| `Materials_worked` | `_wpg` (Page) | multiple | valeurs laissées émerger |
| `Measured_quantities` | `_txt` (Text) | multiple | valeurs laissées émerger |

Câblage dans `Modèle:Referenced item` (wikitexte récupéré) : les cinq sont
présentes. `Materials_worked` porte `|+sep=,` dans le `#set` ;
`Measured_quantities` est posée par un `#arraymap` séparé (comme
`Practice_domain` côté fonctionnel).

### 2.4 `Design_source`

`--facts "subject=Design_source&ns=102"` :

| Fait | Valeur |
|---|---|
| `_TYPE` | `…swivt/1.0#_uri` (type **URL**) |
| `Property_cardinality` | `single` |
| `Property_domain` | `Referenced_item#14##` |
| `Property_range` | `URL permanente vers les fichiers de conception` |

Câblée dans `Modèle:Referenced item` : ligne
`|Design_source={{{Design_source|}}}` dans le `#set`, juste après
`Procurement_route`, sans `+sep`. Ligne d'affichage « Source de conception »
dans la table. Aucun item ne la porte (le dépôt de conception n'existe pas
encore) — cohérent avec le rapport de clôture.

### 2.5 `Corresponds_to_organic` multivaluée

`--facts "subject=Corresponds_to_organic&ns=102"` :

| Fait | Valeur |
|---|---|
| `_TYPE` | `_wpg` (Page) |
| `Property_cardinality` | **`multiple`** |
| `Property_domain` | `Referenced_item#14##` |
| `Property_range` | `Organic item` |
| `Property_description_FR` | « … Multivaluée : un modèle du commerce peut implémenter plusieurs solutions techniques à la fois, comme une station qui soude par points et brase à l'étain. » |
| `_MDAT` | `1/2026/8/29/…` (modifiée le 29 août 2026, lot 10) |

Câblage `Modèle:Referenced item` : `|Corresponds_to_organic={{{…}}}` suivi de
`|+sep=,`, et affichage par `#arraymap`.

### 2.6 Banque CWL — le compte de « trois banques » est-il juste ?

- Les 4 items physiques du lot 10 (`--facts` sur `CWL-0008`, contrôle) :
  `Inventory_number = 0008`, `Inventory_ref = CWL-0008`,
  `Inventory_site = CWL`, `Owned_by = CWL`, `Located_at = Atelier appartement`.
- Un item ECL de comparaison (`ECL-0003`) : `Inventory_number = 0003`,
  `Inventory_ref = ECL-0003`, `Inventory_site = ECL`, `Owned_by = Ecolibre`.
- `Registre des préfixes de site` (wikitexte) contient déjà la ligne
  **`CWL | CWL Optéos | cwl.ecolibre.org | wiki.ecolibre.org`** (à côté de
  `ADD`, `ECL`, `LOC`).
- `action=ask` sur `[[Category:Physical item]]` : **47 items physiques**.

**Conclusion : il y a toujours exactement trois banques**, définies par
propriété et par usage :

| Banque | Propriété | Sujets |
|---|---|---|
| conception | `Item_ref` | items fonctionnels, organiques, référencés |
| inventaire | `Inventory_number` | items physiques |
| lieux | `Location_number` | lieux |

**CWL n'est pas une quatrième banque.** C'est un **second code de détenteur**
à l'intérieur de la banque « inventaire » : même propriété `Inventory_number`,
préfixe d'affichage (`Inventory_site`) qui vaut `CWL` au lieu de `ECL`. La
description de `Attribut:Inventory_number` prévoit déjà ce cas :
« Rang d'un exemplaire physique dans la séquence de numérotation **de son
détenteur** ». CWL est le premier code partenaire réellement mis en service —
le principe « un partenaire change une constante, pas N pages » cesse d'être
théorique.

### 2.7 Base 36 sur la banque inventaire

`Attribut:Inventory_number` (wikitexte) :

```
[[Has type::Keyword]]
[[Property_description_FR::Rang d'un exemplaire physique dans la séquence de
numérotation de son détenteur. Identifiant Base 36 de 4 caractères, sans préfixe.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::identifiant Base 36, 4 caractères]]
```

La page **dit « Identifiant Base 36 de 4 caractères »**. Elle n'écrit pas
littéralement « 000A suit 0009 » : cette formule vient de l'arbitrage §5 du
rapport de clôture (« Les numéros d'inventaire sont en base 36, conformément à
la définition écrite sur `Attribut:Inventory_number`. `000A` suit `0009` ;
`0010` suit `000Z` »). Elle est cohérente avec la définition, mais c'est une
glose, pas une citation.

**Contradiction à garder** (voir §4.5 pour le détail) : la phrase d'intro de
la section « Numérotation » du Récapitulatif dit que la numérotation des items
physiques est « indépendante de la séquence Base 36 des trois classes de
conception ». Lue vite, cette phrase suggère que l'inventaire n'est pas en
Base 36. C'est faux : les trois banques sont en Base 36 ; ce qui est
indépendant, c'est la séquence, pas l'encodage.

### 2.8 Types de fichiers et InstantCommons

- `action=query&meta=siteinfo&siprop=fileextensions` : **18 extensions** —
  `bmp doc docx gif ico jpeg jpg odp ods odt pdf png ppt pptx tiff webp xls
  xlsx`. **`step`, `stl`, `zip`, `svg` absents → refusés au téléversement.**
  (Correspond exactement à la liste déjà écrite dans le Récapitulatif.)
- InstantCommons : `action=query&titles=File:Example.jpg&prop=imageinfo` →
  `missing: true`, `imagerepository: ""`. Sur un wiki où InstantCommons est
  actif, `File:Example.jpg` se résout vers Commons avec un
  `imagerepository` non vide. **Ici : inactif.** Aucune extension de dépôt
  partagé dans la liste des extensions (voir §2.10).
- `demandes-adminsys.md` §2.2 porte **une seule** demande de ce registre :
  « Autoriser le SVG dans `$wgFileExtensions` ». **STEP, STL, ZIP et
  InstantCommons n'y sont l'objet d'aucune demande.**

### 2.9 Semantic Scribunto absente

`action=query&meta=siteinfo&siprop=extensions` : **26 extensions**. `Scribunto`
est présent ; **`Semantic Scribunto` est absent**. Donc Lua (Scribunto) ne
peut pas interroger SMW — c'est le motif technique nouveau derrière l'arbitrage
du lot 12 sur la cascade de lieu (voir §3, sous-section Récapitulatif 2f).

### 2.10 Liste complète des extensions installées (relevé brut)

`CategoryTree, Cite, Clean Changes, CodeEditor, ConfirmEdit, Lockdown,
Mermaid, MinervaNeue, MonoBook, MyVariables, Nuke, PageForms,
ParserFunctions, QuestyCaptcha, Renameuser, Replace Text, Scribunto,
SemanticMediaWiki, SemanticResultFormats, TemplateData, Timeless, UserMerge,
VEForAll, Vector, VisualEditor, WikiEditor`.

Pas de `Semantic Scribunto`, pas de `Page Exchange`, pas d'extension
InstantCommons (c'est de toute façon un `$wgUseInstantCommons` de config, pas
une extension — et le test §2.8 le donne inactif).

### 2.11 `Location_lineage`

`action=ask&query=[[Location_lineage::+]]|format=count` → **0**. (Requête
liste de contrôle sur `[[Category:Physical item]]|limit=3` → 3 résultats :
le chemin `action=ask` fonctionne, un 0 est bien un 0.) Toujours déclarée,
toujours sans porteur, conforme au Récapitulatif et à
`travaux/lot-11-*` (tâche 4, cascade).

### 2.12 `Main_image`

- `action=ask&query=[[Main_image::+]]` → **0 résultat** (liste vide).
- `--facts` sur un exemplaire planté réel
  (`Ail éléphant — Le Buisson de Cerzat (ECL-0042)`) : porte `Item_facet`,
  **ne porte pas `Main_image`.**
- `Modèle:Physical facet plant` (wikitexte récupéré) : `Main_image` est
  câblée deux fois — ligne de stockage
  `|Main_image={{#if:{{{Main_image|}}}|Fichier:{{{Main_image|}}}|}}` dans le
  `#set`, et ligne d'affichage
  `{{#if:{{{Main_image|}}}|[[File:{{{Main_image|}}}|200px]]|''non choisie''}}`.
- Le rapport de clôture (§3 point 6, §8) confirme aussi le câblage côté
  `Formulaire:Physical item/bloc facette végétal`
  (`{{{field|Main_image|input type=text|uploadable}}}`) et l'absence de
  `Main_image` dans `Modèle:Physical item` de base, `Modèle:Organic facet
  plant`, `Modèle:Organic facet fitting`, `Modèle:Functional item`.

→ Câblée dans la seule facette végétale, portée par aucune page.

### 2.13 `Manufacturer`

`--facts "subject=Manufacturer&ns=102"` : type `_wpg` (Page), cardinalité
`single`, `Property_range` = « page libre — aucune catégorie Fabricant dédiée
pour l'instant ». `Materials_worked` : type `_wpg` (Page), multiple (voir
§2.3). Les deux accumulent des cibles jamais créées (liens rouges) — SUNKKO,
Quicko, GVDA, Acier nickelé — d'après le rapport de clôture §4 point 5.

### 2.14 Index plein-texte

`action=query&list=search&srinfo=totalhits` :

| Terme | `totalhits` |
|---|---|
| `organique` | 0 |
| `outil` | 0 |
| `soudure` | 0 |
| `procédé` | 0 |
| `Ecolibre` | 2 |
| `Multimètre` | 3 |

Mesure du 30 août 2026, identique à celle du rapport de clôture (§3 point 5,
mesurée le 29 août). L'index ne voit qu'une fraction du corpus. Piste connue :
`rebuildtextindex.php` côté serveur (relève de Cyril, `SERVER_NAME`
obligatoire).

### 2.15 `format=tree` / `format=outline` / Mermaid sur `Catégorie:Functional item`

`action=parse&page=Catégorie:Functional item&prop=text`, analyse du HTML rendu
section par section :

| Section (`== ==` de la page) | Format | Rendu mesuré | Verdict |
|---|---|---|---|
| Hiérarchie (Format Arbre) | `format=tree`, `root=Assurer les besoins vitaux` | **1175 caractères** : arbre imbriqué complet depuis « Assurer les besoins vitaux » | **fonctionne** |
| Arborescence textuelle | `format=outline` | **1204 caractères** : liste ordonnée complète, `Assembler`, `Braser tendre`, `Maintenir en position`, `Mesurer une grandeur électrique` inclus | **fonctionne** |
| Visualisation … (Mermaid) | `{{#mermaid:}}` + `#ask format=template` | **173 caractères** : le titre de section + la note « Seuls les items ayant un parent défini… » ; `<div class="ext-mermaid">` présent (extension installée, rendu client), mais le graphe généré contient un littéral `[[SMW::off]]` en tête et une valeur `Part_of` multiple (« S'hydrater, Irriguer ») dont la virgule casse une arête | **cassé** — ne rend que titre + note |
| Tableau de bord | `format=datatable` | **0 caractère** rendu (heading seul) | ne rend rien — hors périmètre, noté pour mémoire |

**Conforme au §8 du rapport de clôture.** La consigne de la tâche 7 disait
l'inverse (que `tree`/`outline` ne rendaient rien) — cette consigne était
périmée, le §3 point 4 et le §8 du rapport l'ont déjà rectifié. Ce n'est
pas recopié : c'est re-mesuré ici, même résultat.

### 2.16 Collation

`action=ask` sur `[[Category:Referenced item]]|sort=|order=asc|limit=60` :
**38 résultats**, ordre alphabétique. Position de « Égopode Escuroux 2025 » :

```
12  Crosnes du Japon Armand 2026
13  Égopode Escuroux 2025
14  Fer à souder Quicko T12-942
```

« É » trié avec « E » ; « Hémérocalle Armand 2026 » (rang 22) tombe entre
« Helianthi … » (21) et « Hysope … » (23). **La collation est linguistique
(uca-fr), appliquée.** Elle était binaire (tri sur les points de code, accents
après `z`) — voir la contradiction ci-dessous.

**Contradiction à garder** : `demandes-adminsys.md` §2.2 décrit encore la
collation comme binaire (« le tri du wiki est aujourd'hui binaire », constat
du 17 août 2026, avec l'« Incident du 18 août 2026 » où la première version de
la demande a mis le wiki hors service). Or `travaux/rapport-2026-08-19.md`
§1.1 applique le correctif `Modèle:Lieu` « tri alphabétique, désormais permis
par la collation », et la mesure ci-dessus le confirme. **La collation a été
appliquée côté serveur les 18-19 août 2026 ; `demandes-adminsys.md` §2.2 n'a
pas été mis à jour.** C'est un fichier de la racine (« comment travailler »),
hors périmètre de cette tâche ; signalé ici, pas corrigé.

### 2.17 Lot 12 — arbitrage sur la cascade de lieu

Page wiki `Lot 12 — Contenants et étiquetage` (titre avec tiret cadratin
U+2014), section « Ce qui est tranché », arbitrage cité mot pour mot :

> **Le lieu se calcule par cascade bornée à quatre niveaux, pas par lignée
> matérialisée.** Motif : Semantic Scribunto est absente, Lua ne peut pas
> interroger SMW, donc la cascade s'écrit en wikitexte et dix niveaux
> produiraient un modèle illisible. Et une valeur calculée à l'affichage ne
> peut pas se désynchroniser, contrairement à une lignée stockée. Le lot 11 a
> déjà payé le prix d'un patron trop subtil : `#show` vers `#set` rendait des
> faits faux en silence sur une propriété de type Page.

Le lot 12 est **cadré, non exécuté**. La page est statique (aucune propriété,
aucune catégorie de classe, aucun `#ask`).

---

## 3. Plan d'insertion — Récapitulatif technique

Structure de la page (relevé) :

```
(chapeau bilingue + « Voir aussi »)
== 1. Propriétés Sémantiques ==            (+ tableau #ask [[Has type::+]])
== Les quatre classes ==
   === Les lieux sont hors de la chaîne ===
   === Organisation est hors de la chaîne, comme les lieux ===
   === Appartenance et souhait : portés par l'item, pas par le lieu ===
   === Location_lineage : déclarée, vide, et pourquoi ===
   === Numérotation : trois banques de références ===
== Facettes ==
   === Une même facette peut vivre à plusieurs niveaux ===
   === La maille d'une plantation ===
== Contraintes de rédaction des modèles ==
== Lire le tableau des propriétés ==
== Vocabulaires externes importés ==
== Règles métier ==
== Règles implicites ==
== Requêtes portées par les pages ==
== Configuration hors wiki ==
   === Socle logiciel ===
   === Espaces de noms ===
   === Types de fichiers autorisés ===
   === Suivi des dépendances de requêtes ===
   === Droits ===
   === Ce qui reste à documenter ===
== 2. Modèles de Structure ==
== 3. Formulaires de Saisie ==
== 4. Modules Lua ==
== 5. Modèles auxiliaires ==
```

La page n'a pas de numérotation de sous-sections : les « 2.4 », « 2.5 »,
« 10.3 » de la consigne sont repérés par le titre entre guillemets, pas par
un numéro réel.

Toutes les propriétés créées au lot 10 sont **domaine `Referenced item`** ou
`Functional item` : elles apparaissent déjà dans le grand tableau
auto-généré en tête de page (`{{#ask: [[Has type::+]] … }}`). Le plan
ci-dessous ne fait qu'ajouter la **prose** qui les explique, dans la section
qui l'accueille.

### 3a. Nouvelle sous-section `=== Les procédés : un sous-ensemble marqué des items fonctionnels ===`

**Où** : dans `== Les quatre classes ==`, juste après
`=== Location_lineage : déclarée, vide, et pourquoi ===` et avant
`== Facettes ==`. C'est la zone où la page range les sous-sections
thématiques par groupe de propriétés (lieux, organisation, appartenance,
lignée, numérotation).

**Pourquoi là** : un procédé *est* un item fonctionnel (arbitrage 2.1 du
lot 10), pas une classe à part ni une facette. Le décrire dans la section des
quatre classes, en sous-section, dit exactement ça : un sous-ensemble marqué,
pas un cinquième niveau. La sous-section « Organisation est hors de la
chaîne » et « Les lieux sont hors de la chaîne » servent de modèle de ton.

**Contenu** (tout vient du §2.1 et du §2.2 ci-dessus, ou du rapport de
clôture §2) :

- Cinq items fonctionnels portent `Catégorie:Procédé` : `Assembler`,
  `Braser tendre`, `Souder par points`, `Mesurer une grandeur électrique`,
  `Maintenir en position`. Chacun est aligné sur une entité Wikidata par
  `External_classification` et porte sa ligne de motif en
  `Item_description`.
- Le marqueur `Catégorie:Procédé` est **posé par le champ `Procédé=oui` de
  `Modèle:Functional item`**, jamais ajouté à la main — même règle que les
  catégories de classe.
- `Practice_domain` (Text, cardinalité multiple, domaine `Functional item`,
  aucune `Allows value`) **qualifie le procédé, jamais l'outil** (arbitrage
  2.4 du lot 10). Portée : au moins une valeur hors électronique (plomberie,
  électricité, énergie).
- Renvoi vers les pages `Procédés et outils` (vue procédé → exemplaires
  disponibles) et `Guide de saisie` (parcours « ajouter un outil »).

**Toute syntaxe SMW citée** (`Practice_domain`, `Category:Procédé`,
`External_classification`) passe en `<code><nowiki>…</nowiki></code>` ou est
écrite en toutes lettres — voir §6.

### 3b. `Design_source` et la règle du dépôt de conception

**Où** : dans la même sous-section 3a (bloc « outillage »), ou en
sous-section `=== Design_source : le wiki ne porte pas les sources ===`
immédiatement après 3a. **À trancher par Cyril** — recommandation : dans 3a,
un paragraphe, pour ne pas multiplier les sous-sections.

**Contenu** (§2.4 + rapport de clôture §2 et arbitrages §5) :

- Cinq propriétés décrivent l'outil, **toutes portées par l'item référencé** :
  `Procurement_route` (Text, single), `Power_rating` (Number, single, unité
  W), `Max_thickness` (Number, single, unité mm), `Materials_worked` (Page,
  multiple), `Measured_quantities` (Text, multiple).
- `Design_source` (URL, single, domaine `Referenced item`) : URL permanente
  **figée sur un commit**, jamais une branche.
- **Règle** : le wiki porte les rendus PNG et les plans PDF ; les sources
  STEP, STL et natives vivent dans un dépôt versionné, référencées en
  permalien par `Design_source`. Se recoupe avec
  `=== Types de fichiers autorisés ===` (STEP/STL non téléversables) —
  renvoi croisé entre les deux endroits.
- `Design_source` est vide sur tous les items aujourd'hui : le dépôt de
  conception n'existe pas encore, on a posé le réceptacle.

### 3c. `Corresponds_to_organic` multivaluée → `== Règles implicites ==`

**Où** : nouveau tiret dans `== Règles implicites ==`, juste après le tiret
existant « `Realizes_function` est multivaluée : un item organique peut
réaliser plusieurs fonctions. »

**Pourquoi là** : parallèle exact. La section liste les règles « lisibles
seulement en lisant le code des modèles ». La multivaluation de
`Corresponds_to_organic` en est une (portée par un `+sep=,` + `#arraymap`
dans `Modèle:Referenced item`).

**Contenu** (§2.5) :

- `Corresponds_to_organic` est multivaluée depuis le lot 10 : un item
  référencé (un modèle du commerce) peut implémenter plusieurs solutions
  organiques — une station qui soude par points *et* brase à l'étain.

### 3d. `== Règles métier ==` — nouveau tiret « pas de virgule »

**Où** : `== Règles métier ==` contient déjà deux tirets « ne contient pas
de virgule » (item référencé depuis le 25 juillet 2026 pour `Part_of` ; item
fonctionnel depuis que `Realizes_function` est multivaluée). J'ajoute le
troisième, en dessous.

**Contenu** :

- Un nom d'item organique **ne contient pas de virgule** — depuis que
  `Corresponds_to_organic` est multivaluée (lot 10), la virgule y sert de
  séparateur de valeurs.

### 3e. `=== Numérotation : trois banques de références ===`

**Le compte reste « trois banques ».** Aucune correction du nombre (voir
§2.6 : CWL est un second code de détenteur dans la banque « inventaire »,
pas une quatrième banque).

Deux ajouts, tous deux **dans la sous-section existante**, sans la
réorganiser :

1. **Extension du 3ᵉ point de la liste « Quatre points qui en découlent »**
   (le point « `ECL` désigne le wiki producteur … Un partenaire qui duplique
   le dispositif change une constante, pas N pages ») : ajouter une phrase —
   *Premier cas réel : `CWL` (CWL Optéos), quatre exemplaires
   `CWL-0008`…`CWL-000B` inventoriés au lot 10, code enregistré dans le
   Registre des préfixes de site. La banque inventaire est désormais à deux
   détenteurs en service.*

2. **Nouveau point dans la même liste** (elle passe de quatre à cinq points) :
   *Les trois banques sont toutes en Base 36 (`Module:Base36`), quatre
   caractères — `000A` suit `0009`, `0010` suit `000Z`. Ce qui diffère d'une
   banque à l'autre, c'est la séquence, pas l'encodage. Conforme à
   `Attribut:Inventory_number` (« Identifiant Base 36 de 4 caractères ») et à
   `Attribut:Location_number`.*

**Contradiction à garder** : la phrase d'introduction de cette sous-section
dit que la numérotation des items physiques est « indépendante de la séquence
Base 36 des trois classes de conception ». Le point 2 ci-dessus peut se lire
comme la contredisant (l'un dit « indépendante de la séquence Base 36 »,
l'autre dit « aussi en Base 36 »). **Ce n'est pas une vraie contradiction** :
« indépendante » qualifie la *séquence* (deux compteurs séparés), pas
l'*encodage*. Mais la formulation actuelle est ambiguë. **Je ne modifie pas
la phrase d'intro sans accord de Cyril** ; le nouveau point est rédigé pour
lever l'ambiguïté explicitement (« Ce qui diffère … c'est la séquence, pas
l'encodage »). Étape 5 : cette quasi-contradiction est signalée, pas
tranchée seule.

### 3f. `=== Location_lineage : déclarée, vide, et pourquoi ===` — MODIFICATION, pas simple ajout

**Le texte actuel contient une phrase périmée** :

> « **Aucune voie de remplacement n'a été arbitrée à ce jour** — ni module
> Lua, ni requête à la volée, ni abandon du besoin. »

Le lot 12 a tranché (§2.17). Cette phrase doit être **remplacée**, pas
complétée — sinon la page se contredit elle-même. Proposition de
remplacement :

- Le cadrage du lot 12 (« Lot 12 — Contenants et étiquetage ») a depuis
  tranché le principe : le lieu se calcule par **cascade bornée à quatre
  niveaux**, écrite en wikitexte et évaluée à l'affichage, plutôt que par une
  lignée matérialisée.
- **Motif nouveau** : Semantic Scribunto est absente de l'installation — Lua
  (Scribunto) ne peut donc pas interroger SMW —, la cascade ne peut pas
  s'écrire en module ; et une valeur calculée à l'affichage ne peut pas se
  désynchroniser, contrairement à une lignée stockée (même leçon que l'échec
  `#show → #set`, entrée n° 31 des Limites connues, déjà citée dans cette
  sous-section).
- Le lot 12 est **cadré, non exécuté** : `Location_lineage` reste sans
  porteur ; le besoin qu'elle portait est repris par la cascade.
- Ajouter le renvoi `[[Lot 12 — Contenants et étiquetage]]` (lien sur une
  seule ligne — le titre est long, ne jamais le replier, voir §6).

**C'est le seul endroit du plan où un passage existant est réécrit et pas
seulement complété.** À valider explicitement.

### 3g. `=== Types de fichiers autorisés ===`

Le paragraphe actuel ne parle que du SVG (« Le format svg n'est pas
autorisé, ce qui interdit le téléversement de dessins vectoriels — contrainte
notable pour un système de données techniques »).

**Ajouts** (§2.8) :

- Élargir la phrase des formats refusés : **STEP, STL** (formats de source de
  conception — d'où la règle `Design_source` : ces fichiers vivent dans un
  dépôt git, pas sur le wiki), **ZIP**, et **SVG** (dessins vectoriels).
  Vérifié le 30 août 2026 par l'API (`siteinfo/fileextensions`, 18
  extensions, aucune de ces quatre).
- **InstantCommons est inactif** : aucun dépôt de fichiers partagé, tout
  média doit être téléversé localement (test `File:Example.jpg` →
  `missing`, `imagerepository` vide).
- Renvoi vers `demandes-adminsys.md`.

**Contradiction / limite à garder** : `demandes-adminsys.md` §2.2 ne porte
aujourd'hui **que** la demande SVG. STEP, STL, ZIP et InstantCommons n'y
sont l'objet d'**aucune** demande. Le renvoi « voir `demandes-adminsys.md` »
ne vaut donc pleinement que pour le SVG. **Question ouverte pour Cyril** :
soit le renvoi reste général, soit on écrit noir sur blanc dans le
Récapitulatif que STEP/STL/ZIP/InstantCommons ne sont pas encore demandés.

### 3h. Deux motifs techniques réutilisables

Le rapport de clôture §6 les nomme « Deux motifs techniques réutilisables ».
La page n'a pas de section « motifs ». Placement proposé :

- **Motif 1** — un `#ask` imbriqué dans un modèle appelé en `format=template`
  par un `#ask` extérieur fonctionne sur cette installation (prouvé en bac à
  sable le 29 août 2026, mis en production dans `Procédés et outils` ; la
  sous-requête a son propre `|default`, donc chaque ligne porte son message
  d'absence). → **nouveau tiret dans `== Contraintes de rédaction des
  modèles ==`.** C'est une capacité de composition de modèles ; la section
  liste déjà ce genre de fait (tableau dans un `#if`, `checkboxes` +
  `delimiter`, lien coupé par un retour à la ligne).

- **Motif 2** — SMW enchaîne les chaînes de propriétés **inverses** et les
  mélange aux directes :
  `-Realizes_function.-Corresponds_to_organic.-Instance_of` descend du
  procédé jusqu'à l'exemplaire physique en une seule impression de colonne,
  et on peut ensuite chaîner une propriété directe
  (`.Inventory_number`, `.Located_at`). Aucune propriété matérialisée n'est
  nécessaire pour la navigation descendante. Déjà l'idiome de
  `Avancement du jardin-forêt`. → **nouvelle sous-section courte
  `=== Navigation par chaînes de propriétés inverses ===` en fin de
  `== Requêtes portées par les pages ==`.** Cette section parle déjà des
  pages qui portent des `#ask` (dont `Procédés et outils` et
  `Avancement du jardin-forêt`), c'est son sujet.

**Alternative** si Cyril préfère : les deux motifs réunis dans une seule
nouvelle sous-section (par exemple en fin de `== Requêtes portées par les
pages ==`). À trancher.

### 3i. `== Requêtes portées par les pages ==` — mise à jour du décompte ?

Le tableau de cette section compte les `#ask` par page (« Cette page : 1 »,
« Category:Functional item : 5 », « Category:Organic item : 4 »). Le lot 10
a ajouté des pages qui portent des requêtes : `Procédés et outils`,
`Guide de saisie` (peu ou pas de `#ask`), `Modèle:Procédés et outils/ligne`.
**Non vérifié en détail dans cette passe.** À décider : soit on complète le
tableau (mesure à faire d'abord), soit on laisse — la consigne ne le demande
pas explicitement. **Signalé, non fait.**

---

## 4. Plan d'insertion — Limites connues

Structure : une liste numérotée `#` unique sous `== Limites, dettes et faits à
retenir ==`. **34 entrées aujourd'hui** (`#` 1 → 34). Vérifié en recomptant :
l'entrée « `#show` → `#set` ne matérialise pas une fermeture transitive » est
la n° 31 (le Récapitulatif y renvoie explicitement pour `Location_lineage`),
et il y a trois entrées après elle (n° 32 chaîne à deux renommages, n° 33
blanchiment d'une page de propriété, n° 34 renommage en production).

Les nouvelles entrées prennent les **numéros 35 à 41**, dans la forme des
entrées existantes (gras d'attaque, date de mesure, lot de traitement quand
il est connu). Les entrées fermées ne sont jamais renumérotées.

### Entrée 35 — index plein-texte partiel

> **L'index de recherche plein-texte est partiel.** `organique`, `outil`,
> `soudure`, `procédé` rendent zéro résultat ; `Ecolibre` en rend deux,
> `Multimètre` trois (`action=query&list=search`, mesuré le 30 août 2026,
> déjà constaté au lot 10 tâche 4). La recherche de MediaWiki ne voit qu'une
> fraction du corpus. Piste : lancer `rebuildtextindex.php` côté serveur
> (relève de Cyril, `SERVER_NAME=wiki.ecolibre.org` obligatoire).

### Entrée 36 — bloc Mermaid de `Catégorie:Functional item`

> **Le bloc Mermaid de `Catégorie:Functional item` ne rend que son titre et
> sa note.** `{{#mermaid:}}` émet bien un `<div class="ext-mermaid">`
> (extension installée, rendu client), mais le graphe généré par le
> `#ask … format=template … template=MermaidLine` est cassé : il contient un
> littéral `[[SMW::off]]` en tête et traite la virgule d'une valeur multiple
> de `Part_of` (« S'hydrater, Irriguer ») comme une arête. **En revanche
> `format=tree` (section « Hiérarchie (Format Arbre) ») et `format=outline`
> (section « Arborescence textuelle ») de la même page rendent l'arbre
> fonctionnel complet** — 1175 et 1204 caractères rendus, mesuré le 30 août
> 2026. À ne pas confondre : la seule section morte est le bloc Mermaid. À
> réparer au lot Navigation.

Ne contredit pas l'entrée n° 2 (l'arbre fonctionnel est un graphe orienté
acyclique, `format=tree` suppose un parent unique) : la n° 2 porte sur le
multi-parent, la n° 36 sur le fait que `tree`/`outline` **rendent** malgré
tout, et que c'est Mermaid qui échoue.

### Entrée 37 — `Main_image`

> **`Main_image` est câblée dans la seule facette végétale et portée par
> aucune page.** `[[Main_image::+]]` → 0 (mesuré le 30 août 2026). Le
> câblage existe dans `Modèle:Physical facet plant` (`#set` +
> affichage `[[File:…|200px]]` avec repli « non choisie ») et dans
> `Formulaire:Physical item/bloc facette végétal` (champ `uploadable`) ;
> il est absent de `Modèle:Physical item` de base et des autres modèles de
> facette. Le lot Images doit étendre ce mécanisme aux autres facettes.

Complète la mention de passage de l'entrée n° 22 (test `[[X::!+]]` du 16 août
2026 sur `Main_image`, « qu'aucune plantation ne portait »).

### Entrée 38 — `Manufacturer` et `Materials_worked` de type Page

> **`Manufacturer` et `Materials_worked` sont de type `Page` et accumulent
> des liens rouges.** `SUNKKO`, `Quicko`, `GVDA`, `Acier nickelé` sont des
> cibles de propriété jamais créées (constaté au lot 10, tâches 4 et 5d).
> Question non tranchée : un fabricant est-il un nœud du système — comme le
> laisse entendre `Supplier` — ou une simple étiquette ? Même famille que la
> limite sur les pages de fournisseur nues (**entrée n° 12** de cette page).

**Contradiction de numérotation à garder** : le rapport de clôture du lot 10
(§4 point 5) renvoie à « la limite connue **n° 9** sur les pages de
fournisseur nues ». Dans la numérotation actuelle de la page, cette entrée
est la **n° 12** (« Les pages de fournisseur créées par la propriété
`Supplier` sont des pages nues »). Le « n° 9 » du rapport est une
numérotation périmée (le `CLAUDE.md` mentionne qu'une numérotation informelle
a circulé jusqu'au lot 9). L'entrée 38 renvoie à n° 12.

### Entrée 39 — `Assembler` et `Maintenir en position` sans `Practice_domain`

> **`Assembler` et `Maintenir en position` ne portent aucun
> `Practice_domain`** (faits absents, mesuré le 30 août 2026), et SMW exclut
> des tris **et des filtres** les pages dépourvues de la propriété : ces deux
> procédés sont invisibles dans toute vue filtrée par domaine de pratique. La
> règle sous-jacente n'est pas écrite — un procédé générique appartient-il à
> un domaine en propre ? Signalé comme observation dans la section *Limites
> connues* de la page `Procédés et outils`.

Même mécanisme que l'entrée n° 18 (« Un tri SMW exclut les pages qui ne
portent pas la propriété de tri — il n'ordonne pas seulement »), étendu au
filtre.

### Entrée 40 — référence retirée vs référence jamais utilisée

> **Le modèle ne sait pas distinguer une référence *retirée* d'une référence
> *jamais utilisée*.** `ECL-0043` (SUNKKO, renommée avant usage) et
> `CWL-0007` (batterie réinventoriée `ECL-0044`) restent vacantes à vie ; la
> séquence les voit toutes deux comme « absentes », sans dire si elles ont
> été occupées puis libérées ou jamais attribuées. Arbitrage du lot 10 :
> une référence libérée n'est jamais réattribuée. Le cadrage du lot 12
> (« Contenants et étiquetage ») pose la solution : un état de cycle de vie
> et une date d'étiquette rendent le recyclage d'une référence décidable par
> la base, sans mémoire humaine.

Prolonge les entrées n° 11 (`000J`, trou définitif) et n° 26 (`Module:Base36`,
lot de numérotation).

### Entrée 41 — la contrainte de collation est levée

> **La collation du wiki est linguistique (`uca-fr`), plus binaire.**
> Appliquée côté serveur les 18-19 août 2026 (correctif `Modèle:Lieu` du
> 19 août consécutif). Avant : tri sur les points de code, les noms accentués
> tombaient après `z` — `Égopode` après `Yacon`, `Hémérocalle` après
> `Hysope`. Mesuré le 29 août 2026 puis le 30 août 2026 : « Égopode Escuroux
> 2025 » se classe **13ᵉ sur 38** entre « Crosnes du Japon » et « Fer à
> souder Quicko T12-942 » ; le « É » est trié avec le « E ». **Les vues à tri
> alphabétique sont désormais permises** — l'interdit qui pesait sur les
> lots 9 et 10 est levé. `demandes-adminsys.md` §2.2 décrit encore l'état
> binaire : à mettre à jour.

**Contradiction avec la consigne, gardée telle quelle** : la consigne dit
« Si la page porte encore cette limite, retire-la en datant la levée. » **La
page « Limites connues » ne porte AUCUNE entrée de collation** — ni binaire,
ni tri accentué. Rien à retirer. La contrainte de collation était consignée
ailleurs : dans `demandes-adminsys.md` §2.2 (toujours en état « binaire »,
non mis à jour), dans le cadrage du lot 10 (§6, risques : « Aucune vue de ce
lot ne doit reposer sur un tri alphabétique »), et dans la section *Limites
connues* datée de la page `Procédés et outils`. J'**ajoute** donc l'entrée 41
comme fait à retenir. La page accueille ce genre d'entrée « auto-corrective »
(n° 2 sur `Board_lineage`, n° 21 sur `[[X::!+]]` sont du même genre : une
affirmation ancienne démentie par une mesure). **Si Cyril préfère que je
n'ajoute rien à « Limites connues » sur ce point, l'entrée 41 saute** et la
levée est simplement notée dans le présent rapport et, séparément, dans
`demandes-adminsys.md`.

---

## 5. Plan d'insertion — « Gestion des lots », section « Lots livrés »

**La consigne (étape 4) demande** : ajouter dans « Lots livrés » une phrase
disant que « la traçabilité documentaire commence au lot 8 », au motif que
« les rapports des lots antérieurs n'existent ni dans `travaux/`, ni à la
racine du dépôt, ni dans `diffs/`, dont les fichiers datent des 9 et 10
août ».

### 5.1 Ce que la mesure du dépôt montre — la prémisse ne tient pas

**Contradiction gardée telle quelle, c'est le point de ce paragraphe.**
Inventaire réel (`ls travaux/`, `ls diffs/`, `head` de chaque fichier) :

| Fichier | En-tête interne | Lot couvert |
|---|---|---|
| `travaux/rapport-reconnaissance.md` | « Rapport de reconnaissance — Lot 1 » (25/07/2026) | 1 |
| `travaux/rapport-2026-07-25.md` | « Rapport de session — 2026-07-25 », écritures « garde-fou §1 du Lot 1 », création `Attribut:Serial number` | 1 (et 2) |
| `travaux/rapport-2026-07-26.md` | « Rapport de session — Lot 3 » | 3 (et 4) |
| `travaux/rapport-2026-07-28.md` | « Rapport de session — Lot 5 » | 5 |
| `travaux/rapport-2026-08-09.md` | « Rapport de session — Lot 6 (Tâches 1 et 2) » | 6 |
| `travaux/rapport-2026-08-10.md` | « Rapport de session — Lot 6 (clôture Tâche 2…) » | 6 |
| `travaux/rapport-2026-08-11.md` | « Rapport de session — Lot 8 (Tâches 1, 2, 3, 4, 6, 7, 9) » | 8 |
| `travaux/rapport-2026-08-12.md` | « Rapport de session — 12 août 2026 », suite du lot 8 | 8 |
| `travaux/ecolibre-sgdt-lot1.md` … `lot5.md` | documents de lot 1 à 5 | 1-5 |
| `travaux/lot-6-consolide.md`, `lot-6-suite.md` | cadrage consolidé du lot 6 | 6 |
| `travaux/lot-8-cadrage-facettes.md`, `lot-8-tache0-rapport.md`, `lot-8-amendement-1.md`, `lot-8-amendement-2.md` | lot 8 | 8 |

**Il existe donc des rapports d'exécution pour les lots 1, 3, 5, 6 et 8**
(les lots 2 et 4 n'ont pas de rapport à leur seul nom : ils sont vraisemblablement
repliés dans les sessions du 25 et du 26 juillet, qui portent le titre d'un
seul lot mais couvrent la journée). La phrase « la traçabilité commence au
lot 8 » est **fausse**.

Ce qui est **vrai** :

- Le dossier `diffs/` ne contient que des fichiers datés des 9-10 août 2026
  (`2026-08-09-tache1.md`, `2026-08-10-tache4.md`, etc.) — ce sont des diffs
  du lot 6, pas de lots antérieurs.
- La **nomenclature `lot-N-tacheM-*.md`** (un fichier par tâche numérotée)
  ne commence qu'au **lot 8**. Avant, la trace est dans `rapport-DATE.md` +
  `ecolibre-sgdt-lotN.md`, une forme moins granulaire.
- Les dates de premier commit ne servent à rien : tous les fichiers de
  `travaux/` ont été commités le 19 août 2026 lors d'une réorganisation
  (« documents de conversation déplacés hors de la racine »).

### 5.2 Options soumises à Cyril

1. **Ne rien écrire en étape 4.** La prémisse ne tient pas ; il n'y a pas de
   fait vrai simple à consigner.
2. **Phrase corrigée**, par exemple :
   > *Les rapports d'exécution vivent dans `travaux/` et remontent au lot 1
   > (sessions datées des 25-28 juillet 2026). La nomenclature par tâche
   > (`lot-N-tacheM`) et le dossier `diffs/` ne commencent qu'aux lots 6
   > et 8 ; les lots 2 et 4 n'ont pas de rapport à leur seul nom.*
3. **La phrase de la consigne telle quelle** — non recommandé, elle est
   contredite par le contenu du dépôt.

**Aucune écriture sur `Gestion des lots` tant que Cyril n'a pas choisi.**

---

## 6. Garde-fous tenus pour toute écriture à venir (étape 5)

Rappel des contrôles à faire **après** les écritures, une fois le plan validé :

- `browsebysubject` sur les trois pages touchées (Récapitulatif, Limites
  connues, Gestion des lots) : elles ne doivent porter que `_MDAT` et
  `_SKEY`. Ces pages citent beaucoup de syntaxe SMW ; **toute mention de
  `[[Propriété::valeur]]`, de `{{#ask}}`, `{{#set}}`, `{{#ifexpr}}` doit
  passer par `<code><nowiki>…</nowiki></code>` ou être écrite en toutes
  lettres.** Les backticks ne protègent rien en wikitexte. Une page de
  documentation qui porte un fait est un bogue silencieux.
- Comparer la taille de chaque page **avant / après** : toute diminution est
  signalée et justifiée (aucun passage existant ne doit disparaître). Seul
  le passage périmé de `Location_lineage` (§3f) est réécrit, et il est
  remplacé par un texte plus long, pas supprimé.
- Vérifier qu'aucune affirmation ajoutée ne contredit une affirmation déjà
  présente ailleurs dans la même page. Contradictions déjà repérées et à ne
  pas trancher seul :
  - Récapitulatif, intro de « Numérotation » (« indépendante de la séquence
    Base 36 ») vs. nouveau point « les trois banques sont en Base 36 » —
    §3e.
  - Récapitulatif, `Location_lineage` : « Aucune voie de remplacement n'a
    été arbitrée » est le passage réécrit — §3f.
- Chaque lien interne long (`[[Lot 12 — Contenants et étiquetage]]`,
  `[[Limites connues du Système de Gestion de Données Techniques]]`,
  `[[Récapitulatif technique du Système de Gestion de Données Techniques]]`)
  s'écrit **sur une seule ligne**, jamais replié pour la largeur — un retour
  à la ligne dans `[[ ]]` casse le lien en silence.
- Une modification = une édition = un résumé `[Lot 10][<à quel titre>]
  <action>`. Le second crochet dit à quel titre on écrit (`[Récapitulatif]`,
  `[Limites connues]`, `[Gestion des lots]`, ou un libellé plus précis par
  ajout). Ne jamais réserver un numéro de lot pour une correction ponctuelle.
- `bin/wiki-login.sh` relancé juste avant la première écriture (la session
  de lecture aura expiré).

---

## 7. Divergences consigne / mesure — liste unique

À garder sous les yeux ; aucune n'est aplanie.

1. **Collation.** Consigne : « Si la page “Limites connues” porte encore
   cette limite, retire-la. » Mesure : la page ne porte aucune entrée de
   collation. La contrainte était consignée dans `demandes-adminsys.md` §2.2
   (toujours en état « binaire », non mis à jour au 30 août 2026), dans le
   cadrage du lot 10 et dans la page `Procédés et outils`. → entrée 41
   ajoutée comme fait à retenir ; à valider ou à retirer.

2. **`format=tree` / `outline`.** Consigne (tâche 7, reprise dans la présente
   demande) : implicitement, à corriger si la page dit qu'ils ne rendent
   rien. Mesure : ni le Récapitulatif ni les Limites connues ne l'affirment.
   Rien à corriger sur ce point ; l'entrée 36 documente que Mermaid, lui,
   est cassé.

3. **`Attribut:Inventory_number`.** Consigne : « conformément à la définition
   écrite sur `Attribut:Inventory_number` : 000A suit 0009 ». Mesure : la
   page dit « Identifiant Base 36 de 4 caractères », pas « 000A suit 0009 ».
   La formule est une glose cohérente (arbitrage §5 du rapport de clôture),
   pas une citation.

4. **Numérotation des limites.** Le rapport de clôture du lot 10 renvoie à la
   « limite connue n° 9 » (fournisseurs nus) ; c'est la **n° 12** dans la
   numérotation actuelle de la page. L'entrée 38 renvoie à n° 12.

5. **`demandes-adminsys.md`.** Deux points périmés découverts en passant :
   la collation y est décrite comme binaire alors qu'elle est `uca-fr` ; la
   demande SVG y est toujours ouverte (cohérent — le SVG est bien encore
   refusé). Fichier de la racine, hors périmètre de cette tâche : signalé,
   pas corrigé. Cyril tranche s'il faut une correction séparée.

6. **Étape 4 (« Gestion des lots »).** Prémisse « la traçabilité commence au
   lot 8 » contredite par le contenu du dépôt (§5.1). Trois options en
   §5.2 ; aucune écriture avant choix.

7. **Renvoi `demandes-adminsys.md` pour STEP/STL/ZIP/InstantCommons** (§3g) :
   ces quatre points ne sont l'objet d'aucune demande dans ce fichier. Le
   renvoi ne vaut pleinement que pour le SVG. À trancher : renvoi général,
   ou mention explicite de l'absence de demande.

---

## 8. Points en attente de décision de Cyril

1. Étape 4 : option 1 (ne rien écrire), 2 (phrase corrigée) ou 3 (phrase de
   la consigne) — §5.2.
2. Entrée 41 (collation dans « Limites connues ») : ajoutée ou non — §7 point 1.
3. Placement des deux motifs techniques : séparés (Motif 1 dans « Contraintes
   de rédaction des modèles », Motif 2 en sous-section de « Requêtes portées
   par les pages ») ou réunis — §3h.
4. `Design_source` : paragraphe dans la sous-section « procédés » ou
   sous-section à lui — §3b.
5. Récapitulatif, intro de « Numérotation » : la laisser telle quelle (le
   nouveau point lève l'ambiguïté) ou la retoucher — §3e.
6. Renvoi `demandes-adminsys.md` en §3g : général ou explicite sur l'absence
   de demande STEP/STL/ZIP/InstantCommons.
7. `== Requêtes portées par les pages ==` : compléter le décompte des `#ask`
   par page avec les pages du lot 10, ou laisser — §3i.
8. `demandes-adminsys.md` §2.2 (collation périmée) : correction séparée ou
   non — §7 point 5.

**Aucune écriture wiki tant que ces points ne sont pas tranchés.**
