# Lot 10 — cadrage

**Date de rédaction :** 17 août 2026
**Objet :** poser le référentiel des procédés techniques et y rattacher cinq
outils, de bout en bout.
**État amont :** lot 9 clos. Dette de propriétés soldée le 17 août
(revids 779 à 782). Écriture sur pages `Attribut:` rétablie, mais le verrou
est intermittent.

---

## 1. Objectif

Éprouver le modèle sur un échantillon délibérément petit — **cinq outils** —
choisi pour mettre le modèle en défaut plutôt que pour couvrir le parc.
Le domaine retenu est la réparation et le recyclage de batteries endommagées.

| Outil | Ce qu'il éprouve |
|---|---|
| Fer à souder, 2 tailles | Un organique et deux exemplaires, ou deux organiques ? |
| Machine à souder par point | Le cas simple — sert de pilote |
| Multimètre | Un nœud par grandeur mesurée, ou un nœud et des propriétés ? |
| Boîtier de cycles charge/décharge | Un outil qui mesure sans rien transformer |
| Mini banc de mesure, auto-construit | Le niveau référencé « plan à fabriquer », et le cas d'un outil sans procédé propre |

**Ce que le lot 10 ne fait pas.** Il ne répond pas à « qui sait percer ».
Il n'y a aucune personne sur le wiki, et la compétence relève de la couche
provenance. Le lot 10 répond à « quel outil réalise tel procédé, et où il
est ». C'est utile, c'est autre chose, et il faut que ce soit dit avant la
clôture plutôt qu'après.

---

## 2. Arbitrages tranchés — à ne pas rejouer

**2.1 — Un procédé est un item fonctionnel, jamais une valeur de propriété.**
Titre au verbe infinitif nu : « Braser », pas « Braser à l'étain » ni
« Brasage ». La formulation du lot 6 « le procédé réalisé se porte comme une
propriété » est périmée : une valeur de propriété ne peut ni porter un
alignement externe, ni être la cible de `pair:hasSkill`. L'autre moitié de
l'arbitrage tient : **pas un item fonctionnel par outil**. Cinq outils
tomberont sur trois ou quatre procédés partagés.

**2.2 — Plusieurs racines sœurs, pas de chapeau.**
Aucun mot ne nomme une activité et couvre à la fois « braser » et « mesurer ».
Tout candidat est soit un métier, soit une catégorie déguisée. Une racine par
famille, chacune au verbe infinitif, créée quand l'échantillon la réclame.
Le wiki aura plusieurs racines fonctionnelles à côté d'« Assurer les besoins
vitaux » : c'est normal, pas un défaut à réparer.

La **DIN 8580** reste la référence écrite pour la famille qui transforme la
matière — six groupes : former par apport, déformer, séparer, assembler,
revêtir, modifier les propriétés du matériau. On ne crée que les groupes que
l'échantillon touche. Un squelette à six branches vides serait un classement
imposé, pas un référentiel.

**2.3 — Le procédé est porté par l'organique.**
`Realizes_function`, multivaluée depuis le lot 5, depuis l'item organique vers
le procédé. Pas depuis l'exemplaire physique : une machine à souder par point
soude par points quel que soit l'exemplaire. Les limites de capacité —
puissance, matériaux travaillés, grandeurs mesurées — sont des propriétés,
pas des procédés distincts.

**2.4 — `Practice_domain` sur le procédé, pas sur l'outil.**
Multivaluée. Un seul endroit à corriger quand le vocabulaire bouge, et l'outil
s'y raccroche par sous-requête. Vocabulaire **émergent**, jamais prédéfini :
la propriété se crée **ouverte, sans `Allows value`**. « La vue plombier » est
une requête, pas un classement.

**2.5 — La compétence est une arête, pas un nœud.**
Ce qui appartient à la personne, c'est la relation personne → procédé, plus
ses qualifications : niveau, date, qui l'atteste, avec quelle confiance. Même
construction que les assertions sourcées du lot 9. Hors périmètre ici — mais
c'est la raison pour laquelle le procédé doit avoir une identité stable dès
maintenant : `pair:hasSkill` a pour cible un `pair:Skill`, et le jour venu le
procédé portera un second type plutôt que de faire naître un vocabulaire de
compétences parallèle. Dupliquer le référentiel tuerait la requête fédérée qui
le motive.

**2.6 — Convention de description de propriété.** *(nouvelle, tirée du 17 août)*
Une `Property_description_FR/EN` dit **ce que la propriété veut dire**. Elle
n'énumère pas les valeurs autorisées — `Allows value` est sur la même page et
fait foi. Elle n'énonce **aucune règle que rien n'applique** : la clause « sur
le même terrain » de `Propagated_from` a décrit pendant des semaines une
contrainte qu'aucune annotation n'opposait, et le cas inter-terrains passait
sans le moindre avertissement. Une règle écrite mais non appliquée est pire
que pas de règle : elle produit de la confiance sans objet.

---

## 3. Règle de profondeur

La profondeur ne se fixe pas d'avance, elle se tranche à chaque hésitation.
Trois questions dans l'ordre — on ne descend d'un niveau que si les trois
passent :

1. **Quelqu'un dirait-il ces mots-là** pour décrire ce qu'il sait faire, ou ce
   que sa machine fait ? « Braser » oui ; « braser de l'étain sur du cuivre »
   non.
2. **Deux outils du parc le réalisent-ils autrement l'un que l'autre ?** Un
   procédé qu'un seul outil réalisera jamais est une capacité de cet outil,
   pas un nœud.
3. **La distinction tient-elle dans une propriété ?** Grandeur, matériau,
   précision, puissance : si elle y tient, c'est une propriété, pas un fils.

Chaque nœud créé porte **en une ligne le motif qui l'a fait naître**. Sans ce
motif, le lot 11 rejouera l'arbitrage à zéro.

---

## 4. Ce qui reste ouvert, à trancher sur pièces

- Le nombre de racines et leurs noms exacts.
- Les deux fers à souder : un organique et deux exemplaires, ou deux
  organiques ? La question se tranche par la règle 3 — si la différence tient
  dans une propriété de puissance ou de panne, c'est un seul organique.
- Le multimètre : « Mesurer une grandeur électrique » en un nœud, ou un nœud
  par grandeur ? La règle 3 penche pour le nœud unique et une propriété
  listant les grandeurs, mais c'est à vérifier sur le cas.
- Le mini banc auto-construit a-t-il un procédé propre, ou est-il un support
  sans `Realizes_function` ? Un item sans procédé est légitime : il ne faut
  pas lui en inventer un pour remplir la case.

---

## 5. Tâches

### Tâche 0 — reconnaissance et solde du reliquat

- État réel du wiki, pas les rapports du dépôt : propriétés existantes,
  dernier numéro de conception attribué, dernier `Inventory_number`, état des
  correctifs ouverts sur `Module:Base36`.
- Relever les **noms de champs OKW** pour l'équipement, avec la source citée.
  Le lot 6 demande de les reprendre plutôt que d'en inventer.
- Solder deux reliquats du 17 août :
  - descriptions de `Foliage_persistence` et `Life_cycle` — retirer
    l'énumération recopiée, conformément à 2.6 ;
  - consigner la **demande de collation SMW** dans `demandes-adminsys.md` :
    `$wgCategoryCollation` et `$smwgEntityCollation` tous deux à `uca-fr`
    (les laisser différer produit un tri incohérent), puis
    `updateEntityCollation.php` côté SMW et `updateCollation.php` côté
    MediaWiki. Dépendance à vérifier : l'extension PHP `intl`.
    **À noter dans la demande :** aucun de ces scripts ne réclame root, et
    Cyril appartient au groupe `fuzzy` — vérifier les droits en écriture sur
    `LocalSettings_ecolibre.php` avant de mobiliser l'adminsys.
- Rapport.

### Tâche 1 — proposition d'arbre des procédés

**Aucune écriture sur le wiki à cette tâche.** Pour chacun des cinq outils :
une phrase décrivant ce qu'il fait, puis le ou les verbes qu'on en extrait.
Appliquer la règle de profondeur, cas par cas, en montrant le raisonnement.

Livrable : un arbre proposé — racines, groupes touchés, verbes — avec pour
chaque nœud sa ligne de motif, et pour chaque procédé les valeurs de
`Practice_domain` envisagées. À valider avant écriture.

**Point de vigilance.** Les cinq outils viennent d'un seul domaine. Si
`Practice_domain` ne reçoit que « électronique », sa multivaluation ne sera
jamais éprouvée et le référentiel sera celui d'un atelier, pas d'une
fédération. « Braser » vit aussi en plomberie : les domaines connus hors
électronique se renseignent dès le premier nœud, sans qu'il faille posséder un
second outil.

### Tâche 2 — création du référentiel

Après validation de la tâche 1. Propriété `Practice_domain` créée **complète
en une seule écriture**, ouverte, sans `Allows value`. Puis les items
fonctionnels des procédés retenus.

### Tâche 3 — propriétés d'outil

Jeu minimal, aligné OKW, **arrêté en entier avant la première écriture**.
Chaque page de propriété complète à sa première écriture. Aucune énumération
fermée dans ce lot.

### Tâche 4 — outil pilote

La machine à souder par point : un procédé, un exemplaire, acquise. Chaîne
complète — organique, référencé, physique — plus le lien `Realizes_function`.
C'est l'épreuve du modèle avant la série ; si quelque chose casse, ça casse
ici, sur un cas et non sur cinq.

### Tâche 5 — la série

Les quatre autres outils, chacun avec son arbitrage écrit et sa ligne de
motif. Les questions du §4 se tranchent ici, sur pièces.

### Tâche 6 — la vue et la consignation

Une page listant procédé → outils, et la requête par domaine de pratique.
Aucun tri alphabétique dans ces vues tant que la collation n'a pas changé.
Mise à jour du guide de saisie et de la feuille de route.

### Tâche 7 — clôture

Rapport : ce qui a été fait, ce qui a échoué, ce qui reste ouvert, et les
arbitrages datés.

---

## 6. Risques connus

**Le verrou intermittent sur les pages `Attribut:`.** Il s'est refermé puis
rouvert deux fois sans que la cause soit établie. Conséquence pratique :
chaque page de propriété complète à sa première écriture, et aucune
énumération fermée — une valeur ajoutée plus tard exigerait une seconde
écriture qui peut être refusée.

**La collation binaire.** Le tri SMW est sur les points de code : les noms
accentués tombent après `z`. Aucune vue de ce lot ne doit reposer sur un tri
alphabétique tant que la demande de la tâche 0 n'a pas abouti.

**`_PVAL` peut mentir.** Après ajout d'une valeur autorisée, la lecture de la
page de propriété peut rendre l'ancienne liste alors que la contrainte à jour
est déjà appliquée. La vérification qui fait foi est le ré-enregistrement d'un
item réel, puis la lecture de ses faits.

**Le biais d'échantillon.** Cinq outils d'un seul domaine. Le vocabulaire
produit sera incomplet — et il faut qu'il le soit d'un manque **connu** :
les familles « manutentionner », « accéder », « éclairer » ne seront pas
touchées. À écrire dans la clôture, pas à découvrir au lot 11.

---

## 7. Critères de clôture

- Les cinq outils existent en chaîne complète, chacun rattaché à au moins un
  procédé — sauf le banc, si l'arbitrage conclut qu'il n'en porte pas.
- Chaque nœud de l'arbre porte sa ligne de motif.
- `Practice_domain` porte au moins une valeur hors électronique.
- La vue procédé → outils rend le compte attendu, compteur affiché.
- Le rapport dit ce que le lot ne couvre pas.
