# Lot 10 — Tâche 3 : proposition du jeu de propriétés d'outil

**Date :** 18 août 2026. **Aucune écriture.** Travail sur papier, fait pendant
l'indisponibilité du wiki.

Le cadrage exige que ce jeu soit arrêté **en entier avant la première
écriture** : chaque page de propriété doit être complète du premier coup, le
verrou pouvant se refermer, et le plafond de 85 caractères sur
`Property_range` rejette silencieusement au stockage.

---

## 1. La confrontation à l'existant — quatre candidates sur huit tombent

Établie sur les rapports du dépôt, **à revérifier sur le wiki vivant** dès
qu'il répond : c'est lui qui fait foi, et la liste des 89 propriétés relevée en
tâche 0 n'a pas été versée au dépôt.

| Besoin | Verdict |
|---|---|
| Marque | **`Manufacturer`** existe — type `Page`, sur `Referenced item`, câblée au modèle et au formulaire depuis le lot 6 |
| Modèle | **`Manufacturer_reference`** existe — type `Code`. C'est la référence produit du fabricant, donc le modèle |
| Numéro de série | **`Serial_number`** existe — `single`, sur `Physical item` |
| Fournisseur | **`Supplier`** et **`Supplier_reference`** existent, distincts du fabricant |
| Origine d'acquisition | **`Procurement_route`** **n'existe pas** — vérifié sur le wiki vivant le 19 août 2026 (`browsebysubject` vide, absente des 90 pages de l'espace `Attribut:`). `lot-9-tache0-rapport.md` §6 et `lot-9-amendement-1.md` le disaient déjà : reliquat du lot 7, jamais exécuté. |

**Le lot a donc besoin de cinq propriétés neuves**, pas quatre. C'est dans la
fourchette de quatre à six annoncée au cadrage. Le modèle avait déjà ce qu'il
fallait pour identifier un objet sourcé — marque, modèle, fournisseur ; il lui
manque encore de dire *comment* l'objet a été obtenu, et ce que la machine
*sait faire*, pas seulement ce qu'elle *est*.

---

## 2. Correspondance avec la classe Equipment d'OKW

| Propriété OKW | Côté SGDT |
|---|---|
| Classification de l'équipement (URL Wikipédia) | `External_classification` — déjà en place |
| Procédé réalisé (URL Wikipédia) | `Realizes_function` vers un item de procédé — **plus riche que le champ OKW**, l'URL est portée par le procédé |
| Make | `Manufacturer` |
| Model | `Manufacturer_reference` |
| Serial number | `Serial_number` |
| Location | `Located_at` |
| Condition | **différée**, voir §5 |
| Quantity | sans objet — un item physique par exemplaire |
| Power rating | **`Power_rating`**, à créer |
| Materials worked | **`Materials_worked`**, à créer |
| Notes | `Item_description` |
| Throughput, maintenance, usage, tolérance, firmware, onduleur | hors périmètre |

**Sans contrepartie OKW, à consigner comme tel :** `Max_thickness` et
`Measured_quantities`. OKW n'a pas de champ d'épaisseur pour ce type de
machine, et ne modélise pas les instruments de mesure — la spécification
documente où fabriquer, pas ce qu'il y a dans un atelier.

---

## 3. Les cinq propriétés à créer

Toutes sur `Referenced item` : c'est le niveau où existe un objet réel, avec
des caractéristiques réelles. Un type d'outil ne consomme pas de watts, un
modèle précis si — c'est aussi ce qui distingue les deux fers à souder, et donc
ce qui justifie l'arbitrage « un organique, deux référencés ».

### `Procurement_route`

```
[[Has type::Text]]
[[Property_description_FR::Mode d'obtention de l'objet référencé.]]
[[Property_description_EN::How the referenced object was obtained.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Referenced item]]
[[Property_range::valeurs laissées émerger]]
```
**Motif :** c'est elle qui rend dicible le banc auto-construit, et donc qui
fait exister l'épreuve du niveau référencé « plan à fabriquer soi-même »
prévue au cadrage. L'absence de `Supplier` ne peut pas en tenir lieu — SMW ne
sait pas interroger l'absence d'une propriété. Elle ne réencode ni `Supplier`
ni `Manufacturer_reference`, qui existent déjà : elle dit le mode d'obtention,
pas la source. Reprise d'un reliquat du lot 7, jamais exécuté.

### `Power_rating`

```
[[Has type::Number]]
[[Property_description_FR::Puissance nominale de l'équipement.]]
[[Property_description_EN::Nominal power rating of the equipment.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Referenced item]]
[[Property_range::W]]
```
Suit la convention `Max_head` : type `Number`, unité portée par la portée.
Correspondance OKW : Power Rating, en watts également.

### `Max_thickness`

```
[[Has type::Number]]
[[Property_description_FR::Épaisseur maximale de matière que l'équipement peut travailler.]]
[[Property_description_EN::Maximum material thickness the equipment can work.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Referenced item]]
[[Property_range::mm]]
```
C'est elle qui permettra de démentir un faux positif de domaine de pratique :
la machine à souder par point tient 0,2 mm d'acier nickelé, pas la tôle de
carrosserie. Sans elle, `Practice_domain` ne peut être ni complété ni contredit.

### `Materials_worked`

```
[[Has type::Page]]
[[Property_description_FR::Matériaux que l'équipement peut travailler.]]
[[Property_description_EN::Materials the equipment can work.]]
[[Property_cardinality::multiple]]
[[Property_domain::Category:Referenced item]]
[[Property_range::valeurs laissées émerger]]
```

### `Measured_quantities`

```
[[Has type::Text]]
[[Property_description_FR::Grandeurs physiques que l'instrument permet de mesurer.]]
[[Property_description_EN::Physical quantities the instrument can measure.]]
[[Property_cardinality::multiple]]
[[Property_domain::Category:Referenced item]]
[[Property_range::valeurs laissées émerger]]
```
C'est elle qui tranche la question du multimètre : un seul procédé, et les
grandeurs en propriété — jamais un nœud par grandeur.

---

## 4. Pourquoi `Page` pour les matériaux et `Text` pour les grandeurs

La règle qui les sépare, et qui vaut au-delà de ce lot :

> **Une valeur devient une page quand elle portera un jour des données
> propres. Sinon elle reste du texte.**

Un matériau portera une classification externe, des propriétés physiques, et
sera cité aussi bien par la capacité d'un outil que par la composition d'une
pièce : c'est un référent partagé, donc un nœud — le même raisonnement qu'à
l'arbitrage 2.1 pour les procédés. Une grandeur mesurée ne portera jamais
rien : c'est une étiquette dans une liste courte, vouée à devenir une
énumération fermée quand les valeurs se seront stabilisées.

Le type `Page` **ne coûte rien maintenant** : aucune page de matériau n'est à
créer, les valeurs se stockent et les liens restent rouges. C'est exactement ce
qui a été fait au lot 6 pour `Supplier` et `Manufacturer`, également typées
`Page` sans qu'aucune page de fournisseur n'existe. Le jour où les matériaux
méritent une branche, tout pointe déjà au bon endroit.

---

## 5. Ce qui est délibérément écarté

**`Equipment_condition`** — l'équivalent outil de `Specimen_status`, et une
propriété OKW à part entière. Écartée parce qu'aucun des cinq outils de
l'échantillon n'est en panne : la créer serait la créer à vide, et une
propriété non éprouvée dans le lot qui la crée n'est pas éprouvée du tout. Elle
viendra avec le premier outil en réparation, ou au lot 11 avec le prêt et
l'emprunt, où elle prend tout son sens.

**Toutes les sous-propriétés spécialisées d'OKW** — nombre d'axes, dimensions
de plateau, vitesse de broche, tolérance ISO 2768, firmware. Aucun outil de
l'échantillon ne les appelle.

---

## 6. Contraintes d'écriture, à ne pas relire au moment de taper

1. **Chaque page complète à sa première écriture.** Le verrou ne s'est pas
   manifesté depuis le 17 août, mais il est intermittent et sa cause reste
   inconnue.
2. **Aucun `Allows value`.** Une énumération fermée exigerait une seconde
   écriture le jour où une valeur manque.
3. **`Property_range` sous 85 caractères.** Les cinq valeurs proposées font
   entre 1 et 24 caractères. Contrôle à appliquer quand même.
4. **Le point décimal, jamais la virgule**, pour les deux propriétés `Number` —
   `0.2` et non `0,2`. Le type `Number` rejette la virgule au stockage sans
   rien signaler.
5. **Vérifier le magasin, pas le wikitexte**, après chaque création, et
   l'absence de clé `_ERR*`.

---

## 7. Avant d'écrire

1. **Revérifier la confrontation du §1 sur le wiki vivant.** Les cinq
   propriétés réputées exister le sont d'après les rapports du dépôt. Si l'une
   manque, ou si son type ou son domaine diffère, il faut le savoir avant et
   non après.
2. **Vérifier qu'aucune des quatre nouvelles ne collisionne** avec une des 89.
3. **Vérifier que `Modèle:Referenced item` et `Formulaire:Referenced item`
   devront être câblés** pour ces quatre propriétés — sinon les valeurs
   passées au modèle seront inertes, comme au §1.3 de la tâche 2. C'est une
   modification de modèle en service, donc garde-fou 6 : à soumettre à Cyril
   avec le diff, pas à décider en séance.
4. **Leçon retenue sur `Procurement_route` (§1) :** l'affirmation erronée
   « existe depuis le lot 9 » venait d'un résumé, pas des rapports du dépôt —
   `lot-9-tache0-rapport.md` §6 et `lot-9-amendement-1.md` disaient
   l'inverse, et étaient disponibles au moment d'écrire le §1. Un résumé
   n'est pas une source.
