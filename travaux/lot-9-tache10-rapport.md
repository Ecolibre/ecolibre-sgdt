# Lot 9 — Tâche 10 : rapport de documentation

Quatre écritures wiki, une modification locale. `prop=info&inprop=protection`
vérifié sur les quatre titres **avant** la première écriture : `protection: []`
partout (ce qui n'exclut pas une restriction Lockdown invisible à cette
requête — aucune n'est apparue). Wikitexte courant relu page par page avant
chaque édition. Purge des quatre pages puis `action=parse&prop=text` : rendu
contrôlé, aucun marqueur d'erreur réel.

## 1. Feuille de route — revid 725

Entrée « Lot 9 (plantes) » : la question de la date de plantation est
**fermée en la consignant**, pas supprimée. Sous-entrée datée du 16 août 2026 :
la date est portée par l'exemplaire planté (`Planting_date` sur l'item
physique), motif inclus — sur une même planche, deux plantes associées
peuvent être mises en terre à deux dates différentes, une date portée par la
planche serait donc fausse pour l'une des deux. Le motif est écrit avec la
décision : sans lui, l'hypothèse « la date appartient à la planche » se
reposerait à la première planche créée.

La seconde question — **compatibilité CC BY-SA des sources botaniques** —
reste ouverte, et l'entrée dit désormais explicitement pourquoi le lot ne l'a
pas fermée : n'ayant renseigné des fiches d'espèce que `Taxon_name`, le lot
n'a repris aucune donnée botanique externe.

Résumé : `[Lot 9][Tâche 10] Fermeture de la question de la date de plantation
(portée par l'exemplaire, motif des cultures associées) ; question CC BY-SA
laissée ouverte`.

## 2. Récapitulatif technique — revid 727

Quatre sections ajoutées, aucune existante réécrite :

- **« Les lieux sont hors de la chaîne »** (sous « Les quatre classes ») :
  `Category:Lieu` n'est pas un cinquième niveau, c'est un ensemble d'items
  physiques désignés par `Located_at` ; le motif du choix (les planches
  s'inséreront entre le lieu et la plantation sans toucher au modèle de la
  plantation) ; et la distinction `Located_at` / `physical_parent`.
- **« Numérotation des items physiques : deux banques de références »** —
  la section existante, d'une phrase, est développée en tableau des deux
  banques (`Item_ref` / `Inventory_number`) plus les trois points qui en
  découlent : valeur stockée non préfixée (avec le motif `Module:Base36`),
  deux propriétés donc pas de collision entre un `0003` physique et un `0003`
  fonctionnel, `ECL` désigne le wiki producteur et pas une classe.
- **« Une même facette peut vivre à plusieurs niveaux »** (sous « Facettes ») :
  la facette végétale portée par `Organic facet plant` et `Physical facet
  plant`, les deux émettant le même `Item_facet` et la même catégorie ; d'où
  la **règle du filtre de classe sur toute requête de facette**, énoncée comme
  règle et non comme remarque.
- **« La maille d'une plantation »** : le triplet espèce × lieu × date, avec
  le cas réel qui l'illustre (`Poireau perpétuel — Le Buisson de Cerzat` en
  deux items, `ECL-0032` et `ECL-0033` : deux mises en terre, pas un doublon),
  et `Propagated_from` pour la filiation.

**Non ajouté, volontairement** : la convention de nommage des fichiers média,
que le cadrage (`lot-9-cadrage-plantes.md`, tâche 10) demandait sur cette page.
La consigne de cette tâche énumère cinq points précis et ne la reprend pas ;
elle est par ailleurs déjà écrite dans `CLAUDE.md`. Signalé pour arbitrage
plutôt que tranché seul.

## 3. Limites connues — revid 726

Quatre entrées ajoutées (n° 20 à 23), chacune avec sa date de constat et le
cas réel qui l'a révélée :

1. **Un tri SMW exclut** les pages sans la propriété de tri, il n'ordonne pas
   seulement. Cas : `Modèle:Lieu`, `sort=Planting_rank`, aucune plantation
   sans rang ne remontait. Règle écrite : une propriété partiellement
   renseignée est une colonne (`|?X`), jamais un critère (`|sort=X`).
2. **`"result": "Success"` ne prouve pas que la donnée est stockée** :
   l'API confirme l'enregistrement du wikitexte, les contraintes SMW
   s'appliquent ensuite. Cas du type `Number` en locale FR, qui rejette le
   point décimal — `45.171420` lu comme `45` — et exige la virgule, la valeur
   étant re-normalisée au point en interne. Constaté sur les trois pages de
   lieu, `Latitude`/`Longitude` absentes des faits stockés.
3. **`Allows value` rejette la valeur**, il n'avertit pas seulement. Cas
   `Specimen_status` = `en réserve`. Précision ajoutée, vérifiée en tâche 7 :
   le rejet **ne porte que sur la propriété fautive**, pas sur tout le `#set`
   — la page reste dans un état mixte, correcte en wikitexte et incomplète en
   base, sans qu'aucun affichage ne le signale. Erreur lisible seulement via
   `_ERRC`/`_ERRT`.
4. **`default=` inerte en `format=gallery`**, avec le contournement
   (encadrer la galerie d'un `{{#if:}}` sur un `#ask ... format=count`).

## 4. Facette végétal — revid 728

Page enrichie sans rien retirer : le commentaire HTML sur « Végétal » nom en
apposition et le `{{Facet}}` sont conservés, `classes`, `display_models` et
`properties` mis à jour pour couvrir les deux niveaux. Trois sections
ajoutées :

- **« Les deux niveaux de la facette »** : tableau organique / physique et ce
  que chacun porte, la mention explicite que les deux émettent le même
  `Item_facet` (« c'est délibéré »), l'avertissement que créer une « Facette
  végétal physique » distincte serait une erreur, et la règle du filtre de
  classe.
- **« Ce que dit le niveau référencé, et ce qu'il ne dit pas »**, portant la
  phrase demandée telle quelle : *le référencé dit ce type, de cette source,
  cette année-là ; il ne dit ni combien ni quel jour* — avec le motif de sa
  présence ici (sans elle, référencé et entité réception fusionneront).
- **« `Propagation_method` n'est pas la provenance »** : tableau à deux lignes
  (l'espèce vs l'exemplaire), illustré par la menthe — se multiplie par
  division en général, mais *ce* pied-là vient d'une division du pied de la
  terrasse ou d'un achat daté.

## 5. `CLAUDE.md` — numérotation réconciliée

La section « Corrections en attente sur les modèles » (deux entrées) devient
« Corrections sur les modèles — liste unique et numérotation de référence »,
un tableau de cinq entrées numérotées, **fermées comprises**, avec la mention
que cette liste fait foi.

| N° | Objet | État |
|---|---|---|
| 1 | Détection des doublons du module d'audit Base36 | ouverte |
| 2 | Objets physiques dans la séquence Base36 | fermée (lot 9 : deux banques) |
| 3 | `Module:Base36` s'arrête au tiret | ouverte |
| 4 | `+sep=,` sur `Part_of` de `Modèle:Referenced item` | fermée (déjà en place) |
| 5 | Filtre de catégorie sur les requêtes `Part_of` | fermée (revids 544 et 549) |

Règle posée : **les entrées fermées ne sont ni supprimées ni renumérotées**,
sinon un renvoi passé pointerait sur autre chose — c'est exactement ce qui
avait produit le désaccord sur « la n° 3 » entre `CLAUDE.md` (qui n'a jamais
eu de n° 3) et les rapports du lot 9 (où le n° 3 désigne la troncature au
tiret). Une correction nouvelle prend le numéro suivant.

Les numéros retenus sont ceux de la numérotation informelle du lot 9, pas une
renumérotation : les renvois déjà écrits dans `lot-9-cadrage-plantes.md`,
`lot-9-amendement-1.md` et les rapports de tâches restent justes.

Ajout d'une note distinguant ces corrections de `Template:Item numbering
audit`, qui interroge `[[Item_ref::+]]` sans filtre de catégorie et ne voit
donc pas la banque physique (`Inventory_number`) — aucune donnée corrompue,
audit simplement aveugle à la seconde banque.

## Point resté ambigu, non tranché seul

La numérotation informelle du lot ne dit nulle part ce qu'est la
« correction n° 4 » : `lot-9-cadrage-plantes.md` 1.9 y renvoie (« même
famille que la correction en attente n° 4 ») sans jamais la définir, et
`lot-9-tache6bis-rapport.md` se contente de constater que le décompte
« était déjà à 4 ». La lecture retenue — n° 4 = le `+sep=,` de `Part_of`,
seule correction non numérotée par ailleurs et effectivement close — est
cohérente avec l'énoncé de cette tâche, qui liste ce point parmi les fermées.
Si Cyril avait un autre n° 4 en tête, c'est la seule ligne du tableau à
revoir.

## Vérification du rendu

Les quatre pages purgées puis relues par `action=parse&prop=text`. Trois
marqueurs relevés à la recherche automatique, tous les trois **antérieurs à
ces éditions et bénins**, vérifiés un par un :

- *Récapitulatif technique*, trois liens rouges (`A`, `Fichier:X`, `...`) :
  les exemples littéraux `[[a|b]]` et `[[File:x|150px]]` de la section
  « Contraintes de rédaction des modèles », qui existait avant.
- *Récapitulatif technique*, « strip marker » : un commentaire dans le code
  Lua de `Module:Base36`, affiché par `#invoke:Source`.
- *Limites connues*, « error- » : la chaîne
  `smw-constraint-error-allows-value-list` que j'ai moi-même écrite dans le
  texte de l'entrée n° 22.

Les `smw-highlighter` du *Récapitulatif technique* sont les info-bulles des
propriétés prédéfinies dans le tableau `[[Has type::+]]`, pas des
avertissements. Aucune des quatre pages ne porte de nouveau lien rouge.
