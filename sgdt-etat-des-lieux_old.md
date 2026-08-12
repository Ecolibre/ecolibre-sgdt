# SGDT — état des lieux au 28 juillet 2026

Document de passation, à joindre à une nouvelle conversation pour reprendre le
travail sans tout réexpliquer.

**Wiki :** `https://wiki.ecolibre.org` — MediaWiki 1.39.11, SMW 4.2.0
**Dépôt de travail :** `~/ecolibre-sgdt`, avec `CLAUDE.md`, `bin/wiki-get.sh`,
`bin/wiki-put.sh`, `.claude/settings.json` et la commande `/rapport`
**Compte robot :** `Cywil@claude-sgdt`, restreint à créer et modifier des pages

---

## 1. Où en est le système

Le modèle a quatre niveaux, chaînés du besoin à l'objet posé sur le terrain :

**fonctionnel** (une fonction à assurer, titre au verbe infinitif) →
**organique** (un type d'objet qui la réalise, sans source d'approvisionnement)
→ **référencé** (un moyen de se le procurer : fournisseur, référence fabricant,
ou plan à fabriquer soi-même) → **physique** (un exemplaire concret sur un
site).

Les liens sont `Realizes_function`, `Corresponds_to_organic` et `Instance_of`.
`Part_of` assure la composition à chacun des quatre niveaux.

Effectifs au 28 juillet : 19 fonctionnels, 2 organiques, 2 référencés,
3 physiques.

---

## 2. Ce qui a été fait, lot par lot

**Lot 1** — `Serial_number` déclarée (type Keyword) ; `+sep=,` sur `Part_of`
dans `Modèle:Referenced item`, sans quoi une nomenclature à plusieurs parents
était aplatie en un littéral unique.

**Lot 2** — URI de base de `owl` et `skos` corrigées : elles pointaient vers
les documents de spécification au lieu des espaces de noms d'ontologie, ce qui
produisait des URI syntaxiquement valides et sémantiquement muettes. Trois
catégorisations parasites corrigées (`[[Category:X]]` sans `:` initial dans des
pages de documentation).

**Lot 3** — Les quatre classes définies sur leurs pages de catégorie. Trois
propriétés de schéma créées (`Property_cardinality`, `Property_domain`,
`Property_range`), renseignées sur les huit propriétés du modèle métier,
préfigurant `sh:maxCount`, `sh:targetClass` et `sh:datatype`.

**Lot 4** — Numérotation d'inventaire des items physiques, séparée de la
séquence de conception : `Inventory_site` (code à trois lettres),
`Inventory_number` (Base 36, 4 caractères), `Inventory_ref` composée par le
modèle. Séquences indépendantes par code de site. `Item_ref` ne s'applique plus
aux items physiques.

**Lot 5** — `Realizes_function` passée en multivaluée (un item organique peut
réaliser plusieurs fonctions). Registre des préfixes enrichi, catégorisé et
relié depuis trois pages. Règles du Récapitulatif remises à jour.

**Hors lots** — `$smwgEnabledQueryDependencyLinksStore` activé le 26 juillet :
une page contenant un `#ask` se rafraîchit automatiquement quand les données
changent. C'était le prérequis technique du kanban.

Le `Récapitulatif technique` couvre désormais les dix lacunes identifiées au
départ, sauf le kanban (pas encore importé) et les trois réglages serveur.

---

## 3. À faire ensuite, par ordre

### 3.1 Remplir le wiki — priorité

La chaîne du système de purge de puits, de bout en bout. C'est le seul moyen de
savoir si le modèle tient à l'usage : trois jours de travail ont porté sur des
mécanismes dont peu ont tourné sur de vraies données.

Points à observer pendant la saisie, parce qu'ils décideront de la suite :
- les arbres fonctionnel et organique restent-ils vraiment parallèles ?
- la granularité proposée (§5) tient-elle sur un système réel ?
- le niveau de maturité veut-il dire quelque chose à l'usage ?
- `Part_of` en nomenclature se comporte-t-il comme prévu ?

### 3.2 Rédiger le guide de saisie

Page `Guide de saisie du Système de Gestion de Données Techniques`, pendant du
Récapitulatif : l'un dit ce que le système **est**, l'autre ce qu'on **en
fait**. Objectif à terme : que sa lecture suffise à Claude Code pour remplir le
wiki de façon autonome à partir d'un listing de composants.

Huit sections prévues : quand créer quoi, règles de décision par classe,
conventions de nommage, ordre de création, ce qui est obligatoire, chercher
avant de créer, un exemple complet de bout en bout, erreurs fréquentes.

Une page destinée à piloter un agent ne peut contenir aucun « ça dépend ».
Elle doit être écrite **après** la saisie du §3.1, à partir de ce qui aura
réellement coincé.

### 3.3 Lot 6 — numérotation

- Durcir `Module:Base36` : normaliser la casse à la lecture, détecter les
  doublons (aujourd'hui il ne détecte que les trous de séquence)
- Basculer `Item_ref` de `Code` vers `Keyword`

L'ordre est contraint : le durcissement d'abord, la bascule ensuite. Le tri du
calcul de référence suivante repose sur un type de la famille Texte, ce que SMW
ne garantit pas — ça fonctionne parce que les références font toutes quatre
caractères, donc par propriété du format et non par contrat du type.

**À ne pas faire pendant une session de saisie** : la numérotation doit rester
stable tant que des items se créent.

### 3.4 Import kanban

33 pages, `Board_parent`, `Board_lineage`. Suspendu par Cyril. Le prérequis
technique est levé. À décider.

---

## 4. Décisions ouvertes

**Deux points traités par un dernier passage Claude Code le 28 juillet** — à
vérifier s'ils ont bien été faits : la colonne « wiki faisant autorité » ajoutée
au registre (la règle est tranchée, seule la colonne manquait), et les
info-bulles du formulaire physique.

Sur ce second point, le mécanisme correct est la fonction d'analyse
`{{#info: texte}}`, placée dans la cellule du libellé juste après celui-ci — et
non un paramètre de la balise `field`. Elle produit une icône ⓘ ouvrant une
bulle, et accepte du balisage wiki à l'intérieur (liens, listes, gras). Ni
`info=` ni `description=` ne fonctionnent comme paramètres de champ ; seul
`placeholder=` affiche quelque chose, et il écrit à l'intérieur du champ.

**Le mécanisme de publication entre wikis.** Comment un exemplaire passe du
wiki d'un partenaire au wiki central : copie manuelle, export/import, autre ?
La transclusion inter-wikis est un cul-de-sac — elle affiche du texte mais
n'enregistre aucune annotation sémantique sur le wiki cible, donc rien ne
devient interrogeable. Jamais conçu.

**La page anglaise** « System for Technical Data Management » n'a reçu aucune
des mises à jour des cinq lots. La dupliquer mécaniquement n'est pas
nécessairement le bon choix.

---

## 5. Conventions et règles établies

À ne pas remettre en question sans raison — elles ont été tranchées.

**Nommage** — fonctionnel : verbe à l'infinitif. Organique : nom commun sans
marque ni fournisseur (« Bidon 220 L »). Référencé : l'objet et sa source
(« Bidon 220 L — Borde »). Physique : l'objet et un qualifiant distinctif
(« Bidon 220 L bleu n°1 »).

**Granularité** — on ne crée un niveau que là où il y a un vrai choix. Une
fonction si plusieurs sortes de solutions sont envisageables. Un organique s'il
faut nommer le type de solution indépendamment de sa provenance. Un référencé
s'il faut réellement se le procurer. Un physique si on possède un exemplaire
qu'on veut suivre. Une vis achetée en boîte n'a ni fonction ni item physique.

**Un système est un item comme un autre**, à chacun des quatre niveaux. Les
arbres fonctionnel et organique sont parallèles, reliés nœud à nœud par
`Realizes_function`.

**Pas de virgule** dans un nom d'item fonctionnel ni d'item référencé : elle
sert de séparateur de valeurs pour `Realizes_function` et `Part_of`.

**Un code de site a un seul wiki qui fait autorité.** Lui seul attribue de
nouveaux numéros ; les autres recopient une référence existante. Les codes sont
uniques sur toute la fédération et ne se réemploient jamais. `ECL` = Ecolibre,
`CWL` = activité indépendante de Cyril.

**Lockdown est écarté.** SMW ne consulte pas les droits de lecture de
MediaWiki : ses requêtes puisent dans ses propres tables. Un espace de noms
verrouillé reste interrogeable. La confidentialité réelle passe donc
obligatoirement par un wiki propre au partenaire.

---

## 6. En attente de tiers

**L'adminsys** (un ami bénévole, de retour vers le 9 août) — trois extraits de
`LocalSettings.php` : `$wgNamespacePermissionLockdown`, `$wgGroupPermissions`,
et les réglages `$smwg*` restants. La question a changé de nature : ce n'est
plus de la documentation, c'est un prérequis avant d'accueillir un partenaire à
qui l'on promettra que ses stocks restent privés. À croiser avec : par où un
wiki partenaire pourrait-il fuir — API, export RDF de SMW, flux, caches.

**Un wiki incubateur**, une seule demande à lui faire, jamais renouvelée : un
bac à sable où les prospects essaient l'outil. Tout y est visible de tous, et
on le dit. La confidentialité, c'est un wiki à soi — pas de demi-mesure.

---

## 7. Sujets déportés dans d'autres conversations

**Visibilité déclarée et visibilité appliquée** — deux axes qui se composent :
quels items sont publiés, et quels faits le sont parmi eux. MediaWiki ne peut
pas appliquer une confidentialité fine ; la publication étant une copie
contrôlée, la déclaration suffit pour l'instant, et l'intention sera prête pour
NextGraph.

**Traçabilité des réceptions** — le certificat de composition chimique
appartient à la livraison, pas à la nuance d'acier ni à un exemplaire. Et sur
50 panneaux, un seul peut être défectueux. Piste : une entité de réception, et
l'individualisation d'une unité à la demande.

---

## 8. Dettes techniques connues, non corrigées

- Le filtre de catégorie du calcul de référence suivante est **recopié à
  l'identique dans les trois formulaires de conception**. Modifier l'un sans
  les autres ferait diverger les séquences en silence.
- `Template:Item numbering audit` interroge `[[Item_ref::+]]` **sans filtre de
  catégorie** : la détection des trous porte sur tout le wiki.
- `bin/wiki-get.sh` ne gère ni `list=allpages` ni `action=browsebysubject` — ce
  dernier est le seul moyen de lire les faits SMW réellement stockés, et a dû
  être appelé en curl direct.
- `$wgFileExtensions` n'autorise pas le `svg`, ce qui interdit le téléversement
  de dessins vectoriels sur un système de données techniques.
- La page portail et le Récapitulatif ne se citent pas mutuellement de façon
  systématique ; plusieurs pages restent difficiles à trouver par navigation.

---

## 9. Leçons de méthode, pour `CLAUDE.md`

- **Un retour à la ligne à l'intérieur de `[[ ]]` casse silencieusement un
  lien.** Aucune erreur d'API, lien absent du graphe interne. Trouvé par le
  contrôle des liens entrants, pas par la relecture.
- **Une vérification de protection ne permet pas de prévoir si une écriture
  passera.** Les restrictions d'espace de noms n'y apparaissent pas. Un refus
  est un résultat à rapporter, jamais un obstacle à contourner.
- **Un compteur de catégorie n'est pas un recensement.** Trois pages de
  documentation s'y étaient glissées.
- **Le contrôle final n'est pas une formalité.** Il a attrapé le bug de lien,
  l'écart de recensement et l'absence de la colonne d'autorité.
- **Ne rien inventer quand le cadrage dit « probablement ».** S'arrêter et
  demander.
