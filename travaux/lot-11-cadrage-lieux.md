# Lot 11 — cadrage : subdivision des lieux

> **⚠️ Document d'origine du 17 août 2026. Plusieurs passages sont périmés —
> ne pas l'exécuter tel quel. Lire l'encart ci-dessous avant tout le reste.**

## État de ce document — 26 août 2026

Ce cadrage n'a **pas** été réécrit, et ne le sera pas : il porte la trace de
ce qui avait été décidé *avant* l'exécution, et c'est là sa valeur. Six
décisions ont changé en cours de lot, une tâche s'est révélée sans objet, une
autre reste ouverte. Le document ci-dessous décrit donc, sur ces points, un
projet qui n'a pas eu lieu.

**Où lire l'état à jour :**

- `lot-11-tache7-cadrage.md` **§1** — les écarts, un par un, avec leur motif.
- `lot-11-tache7-cadrage.md` **§2** — l'état réel de chaque tâche, 0 à 7.

**Les six décisions qui ont changé :**

| Décision d'origine | Ce qui a été fait |
|---|---|
| **1.4** — le titre porte la référence, `<Libellé> (ECL-NNNN)` ou `ECL-NNNN` seul | **abandonnée le 24 août.** Le titre est le **nom du lieu**, nu : `Butte de la tranchée`. La référence vit dans `Location_number`, affichée par le modèle. Le test de la tâche 0 a donné une réponse double, pas binaire, et l'arbitrage a été rendu autrement : un titre lisible vaut mieux qu'un titre stable, le renommage étant supportable (29 pages à purger, pas 82). |
| **1.5** — banque distincte, **même préfixe `ECL`** produit par `{{Préfixe site}}`, « le verrou SMW … une propriété nouvelle est la seule voie ouverte » | **la banque distincte tient ; le motif et le préfixe sont faux.** Le préfixe est **`LOC`**, porté par une propriété `Location_site` et un `Modèle:Préfixe lieu`, ni l'une ni l'autre au cadrage — un lieu public n'appartient pas à une organisation. Et le verrou n'interdisait rien (voir §3 ci-dessous). |
| **1.9** — le rang devient relatif à la planche ; sa description « ne peut pas être mise à jour (verrou SMW) » | **le rang est en mètres entiers depuis l'origine du lieu**, et depuis le 25 août c'est un **début de segment**, `Planting_rank_end` en donnant la fin facultative. Le rang ordinal (`A-1.5`) était rejeté par SMW. La description a été réécrite **deux fois** : aucun verrou sur cette page. |
| **1.10 / tâche 4** — `Location_lineage` matérialise la fermeture transitive, « qui rend l'arbre interrogeable » | **la propriété existe, zéro page ne la porte.** Le patron `#show` → `#set` ne peut pas marcher pour une propriété de type Page : `#show` rend un lien wiki, les `[[` font échouer tout le `#set`. La voie de calcul (Lua ou script) **n'a jamais été arbitrée** — la question est intacte, pas réglée. |
| **§2** — « le hameau lui-même n'est pas créé comme lieu intermédiaire dans ce lot » | **il l'a été.** `Le Buisson de Cerzat` est un lieu de type hameau, entre `Cerzat` et le terrain. Le renvoi du §6 a été consommé sans être signalé comme tel. |
| **§3 / §0** — le verrou `smw-change-propagation-protection` « bloque toute modification d'une page `Attribut:` créée le 15 août » | **une seule page est verrouillée, `Attribut:INSEE code`.** Six écritures sur des pages `Attribut:` sont passées du premier coup le 25 août. Personne n'avait tenté : le cadrage a hérité d'un constat du 15 août et l'a généralisé. |

**Passages périmés, à ne plus tenir pour vrais :**

| Passage | Ce qui est faux |
|---|---|
| **§0**, livraisons | Le préfixe est `LOC`, pas `ECL`. `Location_lineage` ne rend rien interrogeable. La migration des 29 vers leurs planches n'a pas eu lieu. |
| **§0**, exclusions | « aucune subdivision des lieux de Chilhac » : `Appartement de Chilhac` et `Atelier appartement` ont été créés. « aucune modification de page `Attribut:` existante — le verrou SMW l'interdit » : le verrou n'était pas général. |
| **Décision 1.3** | La décision tient (un redécoupage au même niveau est un renommage). Son **motif** tombe : il commandait 1.4, abandonnée. Le renommage reste possible, et son coût est mesuré — voir la procédure en quatre étapes de `lot-11-tache7-cadrage.md` §3.2. |
| **Décision 1.4** | Périmée en entier. |
| **Décision 1.5**, motif et préfixe | Voir le tableau ci-dessus. La banque distincte, elle, est en place. |
| **Décision 1.9**, verrou | Le verrou n'existait pas sur `Attribut:Planting rank`. |
| **Décision 1.10** | Non réalisée. |
| **§2**, l'arbre dessiné | N'est pas l'arbre en place. 13 lieux existent, les libellés diffèrent (`Butte de la tranchée`, `Extrémité de tranchée`, `Au pied du pylône électrique`, `Zone basse`, `Zone haute`), et deux lieux hors cadrage se sont ajoutés côté Chilhac. |
| **§3**, état attendu | Le verrou est mal généralisé. **L'écart 26/29 n'existe pas** : vérifié terme à terme contre le TSV, 29 = 29. |
| **§5**, arbitrage 1 | Tranché autrement : ni l'une ni l'autre des deux formes proposées. |
| **§5**, arbitrage 2 | **Jamais tranché.** Reste à décider. |
| **§6**, renvois au verrou | Les deux corrections dites bloquées ont été faites : la description de `Planting_rank` réécrite, `en réserve` accepté par `Specimen_status`. |

**Ce qui reste ouvert :** la **tâche 6** — quelle plantation se trouve à quel
lieu, et à quelle position. Ce n'est pas une dette technique : c'est un
**travail de terrain de Cyril**, les positions restant à relever sur place.

### Ce qui reste à décider — le lignage

La tâche 4 n'a pas été tranchée, elle a été interrompue. Quatre points
distincts, dont aucun n'est réglé, et le quatrième était ignoré jusqu'au
27 août 2026.

**1. La voie de calcul n'a jamais été arbitrée.** Le cadrage posait deux
voies — un module Lua qui calcule à l'enregistrement, ou un script rejoué
après chaque modification de l'arbre — et demandait de proposer sans trancher
seul. Le test s'est arrêté avant d'y arriver. **C'est l'arbitrage 2 du §5, et
il est intact.**

**2. Le patron `#show` → `#set` est cassé pour une propriété de type Page, et
doit être corrigé avant tout nouvel essai.** `#show` sur une propriété de type
Page rend un **lien wiki**, pas la valeur brute ; concaténé dans le `#set`
d'une autre propriété Page, les `[[` font échouer **tout le `#set`**. Et selon
que la source porte ou non une valeur, la même construction produit tantôt
cette erreur franche, tantôt **un fait faux sans aucun avertissement** — une
cascade partiellement cassée peut se présenter comme fonctionnelle. Consigné
sur le wiki, *Limites connues* n° 31. **Reprendre le test sans corriger le
patron ne mesurerait rien.**

**3. Le recalcul après déplacement d'un lieu dans l'arbre n'a jamais été
abordé.** Déplacer un lieu invalide le lignage de **tous ses descendants**. Le
cadrage l'annonçait comme « le piège à ne pas manquer » de la tâche 4 et
demandait de dire, quelle que soit la voie retenue, comment le lignage est
recalculé. La question n'a pas même été posée en exécution. Elle conditionne
le choix entre les deux voies du point 1 : un script rejoué la traite
trivialement, un calcul à l'enregistrement doit propager.

**4. `Board_lineage`, cité comme précédent, n'existe pas sur ce wiki.**
Vérifié le 27 août 2026 : `Attribut:Board lineage`, `Attribut:Board parent` et
`Module:Board` sont **tous absents**, et aucune page ne porte ces propriétés.
Le seul endroit du wiki qui les mentionne est *Limites connues* **n° 2**, qui
les présente à tort comme un patron de résolution déjà en service côté
physique. **Il n'y a donc aucun précédent fonctionnel à recopier** — le
cadrage s'appuyait sur une référence qui n'a jamais existé ici. L'entrée n° 31
le signale sur le wiki ; **l'entrée n° 2 reste à corriger.**

Ce qui a été fait hors de ce cadrage — la classe `Organisation`, `Owned_by`,
`Wanted_by`, le segment de rang, la réparation d'*Avancement du jardin-forêt*
— n'y figure évidemment pas : voir `lot-11-tache7-cadrage.md` §1.10 et §1.11.

---

**Rédigé le 17 août 2026.** À exécuter par Claude Code depuis `~/ecolibre-sgdt`.
Prérequis de lecture : `CLAUDE.md`, `lot-9-amendement-1.md` (décisions 1.4 et
1.13), `lot-9-tache6-proposition.md`, `lot-9-cloture.md`, et les pages wiki
*Catégorie:Lieu*, *Modèle:Lieu*, *Limites connues*.

Le wiki est **lisible en anonyme** : lire l'état réel plutôt que de se fier aux
rapports du dépôt, qui peuvent avoir divergé. Les écritures passent par Claude
Code.

Format des résumés d'édition : `[Lot 11][Tâche N]`. Le second crochet peut
porter un libellé plutôt qu'un numéro quand le travail relève du lot sans
relever d'une tâche. Un correctif hors lot porte `[Correctif]`.

---

## 0. Objet

Le lot 9 a créé la classe Lieu avec trois pages plates. `Located_in`, prévue
pour l'arbre, n'a jamais été employée. Le lot 11 fait vivre cet arbre.

**Ce que le lot livre :**

- une hiérarchie de lieux à profondeur non bornée, des communes aux planches ;
- une référence stable pour les lieux, sur le modèle `ECL-NNNN` ;
- `Location_type` à valeurs libres, `INSEE_code` sur les communes ;
- la fermeture transitive `Location_lineage`, qui rend l'arbre interrogeable ;
- la migration des 29 plantations du Buisson vers leurs planches, et le rang
  recompté par planche.

**Ce que le lot ne livre pas :** aucun niveau au-dessus de la commune, aucune
subdivision des lieux de Chilhac, aucune modification de page `Attribut:`
existante — le verrou SMW l'interdit (voir §3).

---

## 1. Décisions d'architecture

**1.1 — Zones et planches sont des lieux, pas des items physiques.** Le
critère : *un item physique est quelque part, un lieu est un quelque part*. Si
la question « où est-ce ? » a pour réponse la chose elle-même, c'est un lieu.

La règle « ce qui a une adresse postale est un lieu » est **écartée** : elle
n'est pas discriminante (Jardin et Terrasse de Chilhac partagent une adresse),
beaucoup de lieux n'en ont pas, et surtout `Formulaire:Physical item` porte un
`model_link` obligatoire vers un item référencé — une planche n'est l'instance
d'aucun modèle d'origine. C'est le blocage A du lot 9, à ne pas rouvrir.

Le cas mobile-et-contenant — une conserve, une caisse, un camion — reste un
item physique : `Located_at` vers un lieu, `Part_of` pour ce qu'il contient.

**1.2 — La profondeur de l'arbre n'est pas bornée et les niveaux ne sont pas
nommés dans le modèle.** « Zone » et « planche » sont des mots d'usage, jamais
des classes ni des propriétés. `Located_in` est réflexive à parent unique, elle
suffit à toute profondeur.

**1.3 — Un redécoupage au même niveau est un renommage, pas un enfantement.**
Cas donné par Cyril : le jour où une seconde tranchée existe, `zone basse` +
`zone haute` doivent devenir `zone basse` + `zone intermédiaire` + `zone haute`,
les trois au même niveau. Ce n'est pas une subdivision de la zone haute. Le
modèle doit donc rendre le renommage **peu coûteux**, ce qui commande la
décision 1.4.

**1.4 — Le titre d'un lieu porte sa référence.** Forme retenue selon le
résultat de la tâche 0 (voir §5, arbitrage 1) :

- **si SMW suit les redirections** : `<Libellé> (ECL-NNNN)`, comme les
  plantations. Renommer déplace la page, les pointeurs suivent.
- **si SMW ne les suit pas** : le titre est `ECL-NNNN` seul, le libellé vit
  dans `Place_name`. Renommer devient l'édition d'une propriété — zéro
  déplacement, zéro pointeur cassé. C'est l'usage pour lequel `Place_name` a
  été créée au lot 9 puis laissée vide.

Le lot 9 avait dispensé les lieux de référence au motif qu'ils étaient « peu
nombreux et nommés ». L'argument tombe à onze lieux nommés à froid, dont
plusieurs seront renommés.

**1.5 — Banque de références distincte.** Les lieux ne rejoignent ni
`Item_ref` (fonctionnel/organique/référencé) ni `Inventory_number` (items
physiques) : nouvelle propriété, nouvelle banque, même préfixe d'affichage
`ECL`. Motif : `Inventory_number` a pour domaine `Category:Physical item`, et
le verrou SMW interdit de modifier une page `Attribut:` existante. Une
propriété nouvelle est la seule voie ouverte.

Rappel : la valeur stockée est **non préfixée**, `ECL` est un affichage produit
par `{{Préfixe site}}`. `Module:Base36` s'arrête au tiret, une valeur préfixée
serait mal lue.

**1.6 — Le code postal n'identifie pas une commune.** Cerzat et Chilhac
partagent le 43380. L'identifiant est le **code INSEE** : Cerzat `43044`,
Chilhac `43070` (vérifiés en ligne, sources concordantes). Le code postal reste
un élément d'adresse, dans `Postal_address`.

Le code INSEE porte le département dans ses deux premiers chiffres : créer des
pages « Haute-Loire » ou « France » dupliquerait une information déjà encodée.
Rien au-dessus de la commune dans ce lot.

**1.7 — La commune est un lieu, pas une prétention à dire ce qu'est la
commune.** Le code INSEE est un **littéral de jointure**, pas un `owl:sameAs`.
Même précaution qu'au lot sur l'identité des personnes : un identifiant externe
en littéral plutôt qu'une assertion d'identité.

**1.8 — `Location_type` est descriptive et à valeurs libres.** Une planche
préparée et un pied de pylône ne sont pas la même nature de lieu, alors que
rien ne les distingue dans le modèle. `Location_type` capture cette différence
sans encoder le niveau.

**Ne pas prédéfinir le vocabulaire** — pas d'`Allows value` dans ce lot. Règle
du lot 6 : laisser les valeurs émerger, consolider après une vingtaine de
lieux. Prédéfinir reproduirait en petit la nomenclature illisible que le projet
évite.

**1.9 — Le rang se compte par planche.** `Planting_rank` devient relatif à la
planche portée par `Located_at`, non au terrain. Sa description ne peut pas
être mise à jour (verrou SMW) : la règle vit dans la page de registre en
attendant, et la correction est inscrite comme due.

**1.10 — La fermeture transitive est matérialisée, pas calculée.** SMW n'a pas
de requête transitive : un terrain ne peut pas lister ce que contiennent ses
planches. `Location_lineage` matérialise la fermeture réflexive-transitive de
`Located_in` — même solution que `Board_lineage` pour `Board_parent`, qui
ramène une requête de profondeur à une chaîne de deux sauts.

---

## 2. L'arbre à créer

```
Cerzat (43044)                     Chilhac (43070)
     │                                   │
Terrain du Buisson               Jardin de Chilhac
     │                           Terrasse de Chilhac
  ┌──┴──────────┐
zone basse    zone haute
  │               │
butte de        planche limite voisin basse
tranchée pente  planche limite voisin haute
butte de        spot pylône
tranchée haute
```

Dix pages nouvelles, trois existantes à rattacher. Le Buisson est un hameau de
Cerzat ; le hameau lui-même n'est pas créé comme lieu intermédiaire dans ce lot.

Libellés exacts, donnés par Cyril, à ne pas reformuler :
`zone basse`, `zone haute`, `butte de tranchée pente`, `butte de tranchée haute`,
`planche limite voisin basse`, `planche limite voisin haute`, `spot pylône`.

---

## 3. État attendu du wiki

Établi d'après les rapports du lot 9, **non vérifié**. Toute divergence arrête
le lot et fait l'objet d'un signalement, jamais d'un contournement.

- Trois lieux existent : `Le Buisson de Cerzat`, `Jardin de Chilhac`,
  `Terrasse de Chilhac`. `Located_in` vide sur les trois, `Place_name` vide.
- `Modèle:Lieu` porte une requête inverse en `format=table`, triée sur
  `Inventory_number`, filtrée `[[Category:Physical item]]`.
- 40 plantations portent `Located_at` vers l'un des trois lieux ; 29 vers le
  Buisson. `Planting_rank` vide sur les 40.
- **Le verrou SMW `smw-change-propagation-protection` bloque toute
  modification d'une page `Attribut:` créée le 15 août.** Les créations
  passent. À vérifier en tâche 0 : il a pu être levé par fuzzy depuis.
- Un écart signalé, non élucidé : la page `Le Buisson de Cerzat` semblait
  afficher 26 lignes là où le TSV en compte 29.

---

## 4. Tâches

### Tâche 0 — Reconnaissance. Aucune écriture.

Livrable : un fichier **et** l'affichage d'une ligne dans le terminal.

1. **Le test des redirections, qui commande la décision 1.4.** Créer une page
   de lieu bidon, y faire pointer un item physique de test par `Located_at`,
   renommer la page de lieu, purger, puis vérifier par `browsebysubject` si
   `Located_at` pointe vers le nouveau titre ou reste sur l'ancien.

   **Ce test vaut au-delà des lieux** : `Instance_of`,
   `Corresponds_to_organic`, `Propagated_from`, `Depicts_specimen` ont toutes
   le même comportement. Répondre une fois, c'est répondre pour tout le
   système. Résultat à consigner dans *Limites connues*.

   Nettoyer les pages de test après. Signaler la référence consommée.

2. **Le verrou SMW est-il levé ?** Tenter une écriture à blanc sur une page
   `Attribut:` créée le 15 août. Une seule tentative, sans insister. S'il est
   levé, deux corrections dues deviennent possibles : `en réserve` dans
   `Allows value` de `Specimen_status`, et la description de `Planting_rank`.

3. **L'écart 26/29 sur `Le Buisson de Cerzat`.** Comparer les `Located_at`
   réellement stockés aux 29 lignes de `plants-2026-08.tsv`. Dire lesquelles
   manquent et pourquoi. Ne rien corriger avant validation.

4. **Relever `Modèle:Lieu` et `Catégorie:Lieu` en entier**, ainsi que la forme
   exacte du calcul de référence dans `Formulaire:Physical item` — elle servira
   de modèle à la banque des lieux.

**Conditions d'arrêt.** Le lot s'arrête si l'écart 26/29 révèle une perte de
données, ou si le test 1 est ininterprétable.

### Tâche 1 — Les propriétés

Quatre à créer. Chacune avec ses cinq annotations d'usage
(`Property_description_FR`, `Property_description_EN`, `Property_domain`,
`Property_range`, `Property_cardinality`).

| Propriété | Type | Porteur | Cardinalité |
|---|---|---|---|
| `Location_number` | Text | Lieu | single |
| `Location_type` | Text | Lieu | single |
| `INSEE_code` | Text | Lieu | single |
| `Location_lineage` | Page | Lieu | multiple |

`Location_number` : valeur non préfixée, banque propre aux lieux.
`Location_type` : **aucun `Allows value`** dans ce lot (décision 1.8).
`INSEE_code` : type Text et non Number — un code INSEE peut commencer par un
zéro et contenir une lettre (Corse, `2A`/`2B`). Le documenter comme littéral de
jointure, pas comme assertion d'identité (décision 1.7).
`Location_lineage` : fermeture réflexive-transitive de `Located_in`, un lieu
s'y inclut lui-même.

Vérifier chaque propriété par `bin/wiki-api.sh --facts`, **sans filtre
d'abord** — les propriétés spéciales apparaissent sous leur nom interne.

### Tâche 2 — `Modèle:Lieu`

Modifications, la page existe et est en service (trois transclusions).

- Ajouter les quatre paramètres, leur `#set` et leurs lignes d'affichage.
- Afficher la référence sous la forme `ECL-{{{Location_number}}}`, préfixe issu
  de `{{Préfixe site}}`.
- Ajouter une requête des **lieux enfants directs** :
  `[[Category:Lieu]] [[Located_in::{{FULLPAGENAME}}]]`, avec `?Location_type`.
- Ajouter une requête des **items physiques du lieu et de ses descendants**,
  par `Location_lineage` — c'est elle qui rend l'arbre utile.
- La requête inverse existante trie sur `Inventory_number` : **ne pas la faire
  trier sur `Planting_rank`**. Un tri SMW exclut les pages qui ne portent pas
  la propriété de tri (leçon du lot 9, tâche 6bis) ; le rang reste une colonne.

Relever le wikitexte avant modification : c'est le retour arrière.

### Tâche 3 — Un formulaire pour les lieux

Le lot 9 s'en était dispensé pour trois pages écrites à la main. À onze lieux
et une référence auto-incrémentée, il devient nécessaire.

`Formulaire:Lieu`, sur le modèle de `Formulaire:Physical item` : calcul de
`Location_number` par `Module:Base36` filtré sur `Category:Lieu`, `Located_in`
en combobox sur `Category:Lieu`, `Location_type` en texte libre — **pas de
liste fermée**.

`Location_lineage` **n'est pas un champ de formulaire** : elle est calculée
(tâche 4).

### Tâche 4 — `Location_lineage`

La difficulté du lot. Deux voies, à arbitrer après lecture de
`Module:Base36` et de ce qui existe pour `Board_lineage` :

- **calcul à l'enregistrement**, par un module Lua qui remonte `Located_in`
  jusqu'à la racine et écrit la chaîne complète ;
- **calcul par script**, rejoué après chaque modification de l'arbre.

La seconde est plus simple et suffit à onze lieux ; la première tient à
l'échelle. Proposer, ne pas trancher seul.

**Piège à ne pas manquer :** déplacer un lieu dans l'arbre invalide le lignage
de tous ses descendants. Quelle que soit la voie retenue, dire comment le
lignage est recalculé après un déplacement.

### Tâche 5 — Les dix pages de lieu

Par le formulaire de la tâche 3 si Cyril le teste, sinon en wikitexte. Ordre
imposé : communes, puis terrain, puis zones, puis planches — un enfant n'est
jamais créé avant son parent.

Rattacher aussi les trois lieux existants : `Le Buisson de Cerzat` →
`Located_in = Cerzat` ; `Jardin de Chilhac` et `Terrasse de Chilhac` →
`Located_in = Chilhac`. Leur donner un `Location_number` et un
`Location_type`.

**Un lieu à la fois, contrôle de la référence entre chaque.** La détection de
doublons du module d'audit n'existe toujours pas.

### Tâche 6 — Migration des 29 plantations

`Located_at` passe du terrain à la planche. **C'est Cyril qui dit quelle plante
est sur quelle planche** — 29 décisions qui n'existent nulle part.

Livrable de cette tâche : un tableau à compléter par Cyril, une ligne par
plantation, colonnes `planche` et `rang`. Le rang se comptant par planche
(décision 1.9), les deux se saisissent **en une seule passe**, pas deux.

Puis génération depuis le tableau complété, avec la vérification d'usage :
`result: Success` ne prouve pas que la donnée est stockée.

### Tâche 7 — Documentation

- *Catégorie:Lieu* : la profondeur non bornée, le critère item/lieu de la
  décision 1.1, le redécoupage au même niveau, `Location_type` à valeurs
  libres, le rang par planche.
- *Limites connues* : le résultat du test des redirections, qui vaut pour
  toutes les propriétés de type Page.
- *Récapitulatif technique* : la troisième banque de références.
- `CLAUDE.md` : la correction due sur la description de `Planting_rank`, tant
  que le verrou SMW tient.

---

## 5. À trancher par Cyril

1. **La forme du titre des lieux**, après le test de la tâche 0 :
   `<Libellé> (ECL-NNNN)` ou `ECL-NNNN` seul avec le libellé dans
   `Place_name`.
2. **La voie de calcul de `Location_lineage`** : module Lua ou script.
3. **L'affectation des 29 plantations aux planches**, et leur rang.

---

## 6. Renvois

- **L'assertion sourcée** (décision 1.13 du lot 9) : quatrième occurrence de la
  relation datée, toujours ouverte.
- **La description de `Planting_rank`** et **`en réserve` dans
  `Specimen_status`** : bloquées par le verrou SMW.
- **Le hameau du Buisson** comme lieu intermédiaire entre Cerzat et le terrain.
- **Les niveaux au-dessus de la commune**, le jour où une entité hors
  département sera documentée.
- **La conserve de caïeux** : item physique `Located_at` le dôme, `Part_of`
  pour les caïeux — à faire quand les sachets de graines seront traités.
