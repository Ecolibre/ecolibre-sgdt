# SGDT — passation au 10 août 2026

Document à joindre à une nouvelle conversation. Il ne reprend **pas** ce qui est
déjà écrit ailleurs : `CLAUDE.md` porte les règles de méthode, `lot-6-suite.md`
le cadrage exécuté, et la page wiki *Limites connues du Système de Gestion de
Données Techniques* les treize dettes recensées.

Il contient ce qui n'existe que dans la conversation archivée.

---

## 1. État du système

**Lot 6 clos le 10 août.** Deux jours de travail, une trentaine d'écritures,
toutes vérifiées, aucune donnée perdue.

Effectifs : 20 fonctionnels, 3 organiques, 2 référencés, 3 physiques. Séquence
Base 36 de `0001` à `000Q`, avec un trou définitif en `000J`.

Ce qui a changé :

- `Part_of` est multivalué sur les trois classes de conception (fonctionnel,
  organique, référencé). Mono-parent conservé sur le physique — un exemplaire
  n'a qu'un emplacement.
- Treize propriétés créées : raccords (`Connection_gender`,
  `Thread_designation`, `Nominal_diameter`, `Secondary_diameter`,
  `Connection_standard`, `Fitting_family`, `Material`), produit (`Max_head`,
  `External_classification`) et source (`Supplier`, `Supplier_reference`,
  `Manufacturer`, `Manufacturer_reference`).
- Les paramètres de `Modèle:Referenced item` et `Modèle:Organic item` portent
  désormais le nom des propriétés qu'ils alimentent. `Physical item` garde son
  ancienne convention.
- Les liens vides n'affichent plus `[[]]` sur les quatre modèles.
- Les exemplaires physiques remontent sur la fiche du référencé.

**Le wiki est prêt pour la saisie**, à une réserve près : voir le lot 7.

---

## 2. Décisions prises dans la conversation, écrites nulle part

### 2.1 La règle qui sépare fonction et solution

> **Une fonction entre dans l'arbre fonctionnel si elle survit au changement de
> solution. Si elle disparaît quand la solution change, c'est une fonction
> technique : elle se documente au niveau organique.**

C'est la distinction classique entre fonction de service et fonction technique.
Elle a tranché le cas du système de purge : maintenir l'amorçage d'un siphon
n'existe qu'à cause du choix du siphon, donc n'entre pas dans l'arbre. À
l'inverse, « percer un trou » survit largement au changement d'outil, donc c'est
bien une fonction.

Cette règle appartient au *Guide de saisie*, qui reste à écrire.

### 2.2 Deuxième branche racine : oui, mais pas « par compétence »

Une racine pour les procédés techniques est légitime — « Percer » ne décompose
pas « Assurer les besoins vitaux ». Mais elle doit nommer l'activité, pas la
personne : quelque chose comme « Transformer la matière », jamais « métier » ni
« compétence ». Une compétence est une propriété d'une personne et relève de la
couche provenance.

**Référence utile : la norme DIN 8580**, qui découpe les procédés de fabrication
en six groupes — former par apport de matière, déformer, séparer, assembler,
revêtir, modifier les propriétés du matériau. C'est la structure suivie par
l'arborescence Wikidata sous *manufacturing process* (Q1408288). « Percer »
tombe dans *séparer*, « souder » dans *assembler*.

**À ne pas faire maintenant.** La règle de granularité s'applique : un parc
d'outils déjà possédé ne présente aucun choix à arbitrer. Cette branche prend
son sens le jour où l'on *conçoit*, ou quand la fédération demande « qui sait
percer ».

### 2.3 Grouper les procédés par thème : une vue, pas un classement

Un classement des métiers est illisible parce qu'il tente une partition, alors
que « souder » appartient pleinement à la plomberie, à la chaudronnerie et à la
mécanique. Réponse : une propriété multivaluée `Practice_domain` sur les items
fonctionnels, et la vue plombier devient une requête d'une ligne.

**Ne pas définir le vocabulaire à l'avance** — laisser les valeurs émerger de la
saisie, consolider après une trentaine de fonctions. Prédéfinir la liste
reproduit la nomenclature illisible en plus petit.

La moitié personnelle — « ce que je sais faire » — est une jointure distincte,
qui appartient à la couche provenance.

### 2.4 Wikidata : lier ou contribuer

Règle de décision, procédé par procédé. L'item existe → lier, ne pas dupliquer.
Il n'existe pas mais le concept existe indépendamment du projet et il est
documenté → contribuer en amont, puis lier. Il n'existe pas et c'est spécifique
à Ecolibre → local, sans lien.

Le critère n'est pas « j'en ai besoin » mais « ce concept existe-t-il sans
moi ». Wikidata a des règles de notoriété qu'un procédé artisanal sans
littérature ne passe pas.

Ne rien bloquer là-dessus : lier prend deux minutes, contribuer correctement
prend des heures et les modifications sont révisables par d'autres.

### 2.5 Un axe de classification manque au niveau organique

Constaté deux fois. `Fitting_family` a été créée pour pouvoir demander « tous
les mamelons », faute de mieux. Puis le cas bidon / cuve a posé exactement la
même question : ce sont deux sortes de contenants, et `Part_of` ne sait dire que
la composition, pas la classification.

Deux occurrences du même manque : le besoin est général. `External_classification`
en porte la moitié — les articles Wikipédia ont un ancêtre commun — mais SMW ne
sait pas parcourir une hiérarchie externe. Il faudra probablement les deux :
l'externe pour l'interopérabilité, une propriété locale pour les requêtes.

**Argument de conception associé, formulé par Cyril :** la donnée sera saisie par
quelqu'un qui n'ouvrira pas un débat sur la taxonomie des contenants. Le système
doit encaisser une valeur approximative — ce qui plaide pour des propriétés
plutôt que des arborescences : une valeur se corrige en un clic, un rattachement
de mauvaise branche se propage.

---

## 3. Positionnement face à OKH, OKW et LOSH

Analysé le 9 août, conclusions inchangées.

**OKH** est une spécification de métadonnées de projets de conception, pour
l'indexation et la recherche. Son périmètre exclut les objets animés. Le niveau
fonctionnel et la référence aux composants standards y sont des *souhaits* de
feuille de route, pas des mécanismes. Le financement principal s'est arrêté en
juin 2025 ; le crawler ne tourne plus périodiquement.

**OKW** recouvre réellement l'inventaire d'outils à venir : sa classe Équipement
porte type, procédé, marque, modèle, numéro de série, localisation, état,
propriétaire, quantité, puissance, matériaux travaillés, dernière maintenance.
Sa convention de classification — coller l'URL Wikipédia du type d'objet — est
celle adoptée pour `External_classification`.

**Conclusion opératoire : aligner le vocabulaire, différer la sérialisation.**
Le SGDT est en amont d'OKH, pas en concurrence : un enregistrement OKH est un
produit possible du niveau référencé, dans le seul cas « plan à fabriquer
soi-même ». Ni OKH ni OKW ne modélisent l'exemplaire géré dans le temps, ni le
stock, ni la réception, ni la confidentialité.

**Décision prise le 10 août sur l'échelle de maturité.** Le problème :
`Idea`/`Study`/`Prototype`/`Certified`/`Obsolete` mesure où en est une
*conception*. Un bidon acheté chez Borde n'est à aucun de ces états, et les
produits du commerce seront majoritaires parmi les items référencés.

La sortie n'est pas d'ajouter une valeur « produit du commerce » — ça mêlerait
deux questions dans une propriété. Elle vient de la définition même du niveau
référencé : « un moyen de se le procurer — fournisseur, référence fabricant, ou
plan à fabriquer soi-même ». Cette distinction en trois branches n'existe nulle
part comme propriété ; elle est seulement sous-entendue par la présence ou
l'absence de certains champs.

Trois décisions, de coût croissant :

1. **Créer `Procurement_route`** (fournisseur / référence fabricant / plan à
   fabriquer). Trois valeurs, une propriété — et la limite connue n°10 disparaît.
2. **Vider `Maturity_level`** sur tout ce qui n'est pas un plan à fabriquer.
   Une maturité vide sur un produit acheté devient correcte, pas un trou.
3. **Plus tard, sans urgence : aligner les plans sur OTRL.** Son intérêt réel
   n'est pas l'échelle de conception mais son second axe, la maturité de la
   *documentation* — question distincte, qui rejoint l'idée d'un indicateur de
   maturité documentaire par item. Ne pas s'y engager tant qu'il n'y a pas de
   plan à publier : l'écosystème OKH est mince.

---

## 4. Le lot 7

### 4.1 Quantités et nomenclature — bloquant pour la facture Weldom

`Part_of` relie un composant à son assemblage **sans quantité**. La facture dit
3 × MAMELON MM 20X27, 2 × RACCORD EXPRESS F20X27 ; le modèle n'a aucun endroit
où mettre le 3.

Solution identifiée de longue date, jamais exécutée : inverser le sens de la
nomenclature — un sous-objet par ligne porté par le parent
(`BoM_component`, `BoM_quantity`, `BoM_unit`) plutôt qu'un `Part_of` sur
l'enfant. Elle était bloquée par `+sep=,`, qui est corrigé partout.

**À faire avant de saisir les vingt-deux lignes**, sinon il faudra tout
reprendre. Même calcul que le renommage des paramètres : deux items aujourd'hui,
vingt après.

### 4.2 Entité réception

Du même tissu. Une facture *est* une réception : une date, un fournisseur, des
quantités, un document propre. Elle permet aussi d'individualiser une unité
défectueuse dans un lot — un seul panneau sur cinquante.

L'architecture n'est pas tranchée : cinquième classe ou sous-objet.

### 4.3 Automatisation depuis facture

Faisable, et la facture Weldom s'y prête. Mécanique : fournisseur, code
enseigne, libellé, quantité, prix, date, numéro de ticket. Non mécanique : la
correspondance entre un libellé et un item organique. **Cible réaliste** : un
script propose un tableau de correspondances, Cyril valide, création en lot.
Jamais de création directe.

Note : `0005604982` est un code **enseigne Weldom**, pas une référence fabricant.

### 4.4 Deux propriétés décidées le 10 août, non créées

- **`Procurement_route`** sur `Referenced item` — fournisseur / référence
  fabricant / plan à fabriquer soi-même. Rend explicite la définition du niveau
  référencé et résout la limite connue n°10. À suivre du vidage de
  `Maturity_level` sur tout ce qui n'est pas un plan.
- **`Max_flow`** sur `Referenced item`, en L/h. C'est le débit, et non la
  hauteur de refoulement, qui décide de l'emploi d'une pompe plutôt qu'une
  autre — 150 L/h contre 800 L/h entre les deux pompes du puits.

### 4.5 Fichiers périmés à supprimer

`lot-6bis-cadrage.md` et `lot-6-consolide.md` sont morts depuis le 10 août et
n'ont pas pu être supprimés — le refus de `rm` par l'outil est le
fonctionnement normal de la politique d'autorisation, pas un incident. À faire
à la main, depuis l'ordinateur.

---

## 5. Chantiers de saisie non commencés

### 5.1 Le système de purge du puits

Analysé, non saisi. Trois choses à savoir avant de s'y mettre.

**Ce n'est pas une purge d'eau mais une purge d'air.** Le té et la vanne au point
haut chassent les bulles pour maintenir la colonne d'eau du siphon. L'item
organique gagnerait à s'appeler d'après ce qu'il fait — `Transfert d'eau par
vases communicants` existe déjà (000Q) et porte le bon nom.

**Il y a deux systèmes, pas un.** Le 5 V (Romellar 1,2 W, 150 L/h, refoulement
100 cm, sans batterie) et le 12 V (Memkey 19 W, 800 L/h, refoulement 500 cm, sur
batterie de trottinette récupérée, panneau DOKIO 200 W). La doc YesWiki décrit un
état antérieur : elle parle d'un panneau 30 W, d'une pompe USB 5 V et de bidons
de 200 L, là où les fiches produit donnent autre chose.

**Ce ne sont pas un système et sa panne, mais deux solutions concurrentes de la
même fonction, aux profils d'usage opposés.** Le 12 V sert aux grosses sessions
de remplissage des bidons proches des cultures, sous surveillance, parce que le
bidon destinataire peut déborder. Le 5 V est gardé pour plus tard : il remplira
lentement et sans surveillance, dès qu'un système de trop-plein existera entre
les bidons des cultures.

Statut du 5 V, précisé le 10 août : **possédé mais non déployé**. Le modèle sait
déjà le dire — un item physique dont le parent physique est vide. Rien à
inventer.

**Ce qui manque, c'est le débit.** `Max_head` a été créée parce que 100 cm contre
500 cm distinguait les deux pompes, mais ce n'est pas ce qui décide de leur
emploi : c'est 150 L/h contre 800 L/h. Ajouter `Max_flow` (L/h) au lot 7.

**Deux choses que le modèle ne sait pas dire.** Le décalage de 3 cm entre les
deux bidons, que Cyril qualifie lui-même de crucial, est une relation géométrique
entre deux items physiques : aucune des quatre relations ne l'exprime. Décision
prise : la règle de conception (« le bidon aval doit être 2 à 5 cm au-dessus »)
va sur l'item référencé, qui est un plan à fabriquer soi-même ; la valeur
constatée (« ici, 3 cm mesurés ») sur l'installation physique. En attendant, du
texte libre sous un intitulé stable.

Et le **mode dégradé** — pompe solaire et seau réalisant la même fonction, l'une
en secours de l'autre — n'a aucune expression. À noter, pas à traiter.

Note technique à consigner : la pompe Memkey ne s'amorce pas d'elle-même et
chauffe hors d'eau, immersion totale nécessaire. Sur un système dont tout
l'enjeu est l'amorçage, ça mérite d'être dans la description technique.

### 5.2 L'inventaire des outils du terrain

Reprendre les noms de propriétés d'OKW : l'inventaire devient un jeu de données
OKW sans effort supplémentaire.

**Piège à éviter :** ne pas créer un item fonctionnel par outil. Quarante outils
déjà possédés, ce sont quarante situations sans arbitrage. Le procédé réalisé se
porte comme une propriété, pas comme un item. Les outils entrent essentiellement
en organique + physique.

### 5.3 Les plantes du jardin-forêt

**Il y a une réunion en face** — avec la personne qui travaille sur le design du
jardin-forêt. C'est le seul chantier avec une échéance externe.

Hors périmètre OKH par construction, mais c'est le meilleur test du modèle : il
stresse le niveau fonctionnel, un argousier fixant l'azote, produisant un fruit
et servant de brise-vent. Le passage de `Realizes_function` en multivaluée était
le prérequis.

**Ne pas inventer d'identité végétale.** TAXREF est le référentiel taxonomique
national officiel du SINP ; son CD_NOM est l'identifiant. L'INPN, resté hors
service du 26 juillet 2025 au 22 juillet 2026 après une cyberattaque contre le
Muséum, a été reconstruit et est de nouveau exploitable depuis le 22 juillet.

**Ce que le modèle ne sait pas dire :** le lien entre le pied mère et la bouture.
Ni `Part_of`, ni `Instance_of` — une filiation entre items physiques. Même
famille de problème que la traçabilité des réceptions.

Et une remarque de format : le livrable de la réunion est probablement un
tableau, pas un wiki. Le wiki est ce qui l'héberge durablement après.

---

## 6. Questions ouvertes

- **Lockdown est-elle installée ?** `CLAUDE.md` l'affirme, l'état des lieux dit
  qu'elle a été écartée. Une vérification directe sur `LocalSettings.php`
  tranche. Reporté au 10 août faute d'accès depuis un téléphone.
- **Le format des résumés d'édition** dans `CLAUDE.md` (`[Lot X]`) ne
  correspond pas à celui réellement utilisé (`[Lot 6][Tâche N]`).
- **Les pages de fournisseur** (Borde, Weldom) sont des pages nues : cinquième
  classe, ou décision explicite de ne rien en faire ? (limite connue n°13)
- **`Bidon 220L` a pour parent `Cuve de récupération d'eau`** — rattachement par
  défaut faute de parent adéquat, à revoir quand l'axe de classification
  existera.
- **Le Guide de saisie** (§3.2 de l'état des lieux du 28 juillet) n'est toujours
  pas écrit. Il a maintenant beaucoup plus de matière : la règle fonction /
  fonction technique, les conventions de nommage, les pièges du widget.
- **La page anglaise** « System for Technical Data Management » n'a reçu aucune
  mise à jour depuis six lots.
- **Le mécanisme de publication entre wikis** n'a jamais été conçu.
- **SVG** : `$wgFileExtensions` ne l'autorise pas. Changement possible sans
  dépendance à l'adminsys — sauvegarder `LocalSettings.php` avant toute
  modification.

---

## 7. Conventions de nommage — écarts constatés

Les règles sont posées, l'application dérive :

| Règle | Constaté |
|---|---|
| Physique : objet + qualifiant (« Bidon 220 L bleu n°1 ») | `Bidon 220L Bleu 1` |
| Référencé : objet et sa source (« Bidon 220 L — Borde ») | `Bidon 220L bleu plastique Borde` |

Le second mélange les conventions : « bleu plastique » est un qualifiant de
niveau physique. Sans gravité aujourd'hui, à cadrer avant une saisie de masse.

---

## 8. Méthode — ce qui a bien marché

- **Un lot = un fichier de cadrage** : pages à lire, diff à proposer, vérification.
  Toute correction identifiée devient une tâche de lot, jamais de la prose.
- **Un diff écrit dans un fichier avant d'être affiché**, statut mis à jour après
  écriture confirmée. Sans ça, un fichier marqué « non écrit » alors qu'il l'a
  été envoie sur une fausse piste six mois plus tard.
- **L'état attendu des pages consigné dans le cadrage** : toute divergence à
  l'exécution signale une modification hors session. Détecteur gratuit.
- **Refuser de trancher seul** : l'agent a signalé trois hypothèses de cadrage
  fausses plutôt que de les contourner. C'est ce qui a évité un renommage sur un
  périmètre mal décrit.
- **Depuis un téléphone** : exiger que tout diff et tout rapport soient affichés
  intégralement dans la réponse, en plus d'être écrits dans un fichier.
