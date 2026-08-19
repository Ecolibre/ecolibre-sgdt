# Lot 10 — Tâche 1 : proposition d'arbre des procédés

**Date :** 17 août 2026. **Aucune écriture sur le wiki.**
Établie à partir des cinq descriptions fournies par Cyril, en appliquant la
règle de profondeur du §3 du cadrage.

---

## 1. L'arbre proposé — quatre nœuds pour cinq outils

```
Assembler                          (groupe « Fügen » de la DIN 8580)
├── Braser tendre                  ← fer à souder
└── Souder par points              ← machine à souder par point

Mesurer une grandeur électrique    ← multimètre, boîtier de cycles

Maintenir en position              ← mini banc de mesure
```

Trois racines sœurs, pas de chapeau. Cinq outils, quatre procédés, dont un
partagé par deux outils : l'arbitrage 2.1 tient, on ne crée pas un item
fonctionnel par outil.

**Pourquoi pas de racine « Transformer la matière » au-dessus d'Assembler.**
`Assembler` est le seul des six groupes de la DIN 8580 que l'échantillon
touche. Poser le parent reviendrait à créer une branche à cinq enfants vides,
ce que le §2.2 interdit. L'appartenance à la DIN se consigne dans la ligne de
motif et dans l'alignement externe, pas par une page parente.

**Pourquoi pas de racine « Mesurer » au-dessus de la mesure électrique.**
Même raison : un seul procédé de mesure dans l'échantillon, le parent serait
vide. Il s'insérera le jour où « Mesurer une longueur » ou « Contrôler une
planéité » arrivera, et l'insertion ne coûtera qu'une reprise de `Part_of` sur
les enfants.

---

## 2. Les quatre nœuds, avec leur motif

### `Assembler`

**Motif :** groupe de la DIN 8580 réellement touché par l'échantillon ; deux
enfants distincts le justifient comme parent, il ne serait pas créé pour un
seul.
**Alignement :** à vérifier en tâche 2.

### `Braser tendre` ← fer à souder

**Motif :** l'apport fond, le métal de base non — c'est ce qui le sépare du
soudage. Nommé au niveau où existe un référent externe stable.
**Alignement :** `https://en.wikipedia.org/wiki/Soldering` — c'est l'exemple
que la spécification OKW donne elle-même pour classer un procédé.
**Redirection à créer :** `Souder à l'étain` → `Braser tendre`. Le mot courant
du domaine doit mener au nœud, sinon le référentiel est juste et introuvable.
**Domaines de pratique proposés :** électronique, plomberie. À compléter par
Cyril, pas par moi.

**Point à trancher — le nom.** J'avais dit « Braser » tout court, au motif
qu'un seul outil brase et que la question 2 de la règle ne passait pas. Je
propose de corriger, et ce n'est pas un revirement sur le **nombre** de nœuds :
il y en a toujours un seul. C'est son **niveau** qui change, et pour une raison
qui n'était pas au dossier hier : l'anglais sépare là où le français regroupe.
Wikipédia a `Soldering` et `Brazing` comme deux articles, sans article commun.
« Braser » n'aurait donc **aucun référent externe** — or un nœud sans ancre est
un mot local, exactement ce que le référentiel existe pour éviter. Quand
« Braser fort » arrivera, il sera un frère, pas un fils ; et si un parent
« Braser » devient utile, il s'insère après coup sans toucher aux alignements.

### `Souder par points` ← machine à souder par point

**Motif :** fusion du métal de base par effet Joule entre deux électrodes.
Procédé distinct du précédent, pas une variante — c'est le cas qui justifie de
préciser l'acte plutôt que de dire « Souder » (arbitrage 2.7).
**Alignement :** `https://en.wikipedia.org/wiki/Spot_welding`
**Domaines proposés :** carrosserie, tôlerie, assemblage de cellules.
Deux domaines sur trois sont hors électronique : la multivaluation de
`Practice_domain` est éprouvée dès le second nœud, sans acheter d'outil.

### `Mesurer une grandeur électrique` ← multimètre + boîtier de cycles

**Motif :** deux outils le réalisent, différemment — la question 2 passe
franchement. Les grandeurs mesurées (tension, intensité, résistance,
continuité, capacité) tiennent dans une propriété multivaluée : la question 3
interdit d'en faire des fils.
**Alignement :** à établir en tâche 2 — voir §4, c'est le point faible.
**Domaines proposés :** électronique, électricité, énergie.

**Ce que ça tranche.** Question 3 du §4 du cadrage : un seul nœud, pas un par
grandeur. Le boîtier et le multimètre partagent le procédé et diffèrent par la
liste des grandeurs.

**Observation, sans conséquence pour l'instant.** Le boîtier est le seul outil
de l'échantillon qui **agit sur l'objet pour le mesurer** : il charge et
décharge la cellule, donc il la laisse dans un autre état. Le multimètre lit
sans rien changer. Si cette distinction devient utile — « lesquels de mes
outils modifient ce qu'ils mesurent ? » — elle se dira en propriété sur
l'outil, jamais en nœud séparé.

### `Maintenir en position` ← mini banc de mesure

**Motif :** le banc serre la cellule entre deux boulons et offre deux points de
raccordement. Sa fonction n'est pas de mesurer — il ne mesure rien — mais de
tenir l'objet pendant qu'un autre outil mesure.
**Alignement :** à établir en tâche 2, voir §4.
**Domaines proposés :** à discuter, voir la réserve ci-dessous.

**Ce que ça tranche.** Question 4 du §4 du cadrage : **oui**, le banc porte un
procédé propre. Il ne fallait pas lui en inventer un, mais il n'en fallait pas
lui refuser un non plus. « Mise en position » et « maintien en position » sont
le couple canonique de la conception mécanique française — c'est le vocabulaire
du domaine, pas une invention pour remplir la case.

**Réserve honnête sur la règle de profondeur.** La question 2 ne passe pas :
un seul outil de l'échantillon le réalise. Mais la question 2 est un proxy —
elle demande « ce nœud sera-t-il partagé ? » et le mesure sur le parc. Sur cinq
outils, le proxy est faible : tout étau, tout gabarit, tout serre-joint réalise
ce procédé. **Proposition d'amendement au §3 du cadrage :** quand la question 2
échoue, se demander si elle échoue faute de partage ou faute d'échantillon.

---

## 3. Un défaut dans le marqueur de branche du §2.2

Le cadrage propose de distinguer un procédé d'une fonction de service par
**la présence d'une valeur de `Practice_domain`**. Le premier cas réel le met
déjà en défaut : `Maintenir en position` est réalisé par à peu près tout le
monde dans tous les métiers. Lui coller « tous domaines » serait un
remplissage, et le laisser vide casserait le marqueur.

**Correction proposée :** un marqueur explicite plutôt que gratuit — une
catégorie posée à la main sur chaque page de procédé, `[[Catégorie:Procédé]]`.
Une ligne par page, interrogeable directement, indépendante de
`Practice_domain`, et **sans toucher au modèle en service** — donc sans
garde-fou 6.

Sa faiblesse : c'est une convention, elle s'oublie. Tant que la branche tient
sur quatre pages, le risque est nul. Si elle grossit, il faudra que le
formulaire la pose.

---

## 4. Ce que l'alignement externe ne couvre pas

La classification par Wikipédia que recommande OKW est faite pour les
**procédés de fabrication**. Elle couvre proprement `Braser tendre` et
`Souder par points`. Elle ne couvre ni la mesure ni le maintien en position :
`Multimeter` et `Fixture` sont des articles d'**outil**, pas de procédé.

Deux conséquences.

1. **Décider en tâche 2** si ces deux nœuds s'alignent sur Wikidata plutôt que
   sur Wikipédia. La portée de `External_classification` — « URL Wikipédia ou
   Wikidata » — a bien fait de prévoir les deux.
2. **À consigner dans la clôture** : la limite n'est pas dans le modèle, elle
   est dans le standard. OKW documente où fabriquer, pas ce qu'il y a dans un
   atelier. Les familles hors fabrication y sont mal servies.

---

## 5. Les deux fers à souder — question 2 du §4 tranchée

**Un seul organique, deux référencés, deux physiques.**

La différence entre les deux fers est une différence de taille, donc de
puissance et de panne : la question 3 de la règle de profondeur l'attribue à
des propriétés, pas à des items distincts. Le niveau **référencé** existe
précisément pour porter la marque et le modèle : deux modèles différents font
deux référencés sous le même organique `Fer à souder`, et chaque exemplaire
possédé fait un physique.

C'est aussi le cas qui montre pourquoi le procédé se porte sur l'organique
(arbitrage 2.3) : les deux fers brasent tendre, quelle que soit leur taille.

---

## 6. Bilan des questions ouvertes du §4 du cadrage

| Question | Réponse proposée |
|---|---|
| Nombre et noms des racines | Trois : `Assembler`, `Mesurer une grandeur électrique`, `Maintenir en position` |
| Deux fers : un organique ou deux ? | Un organique, deux référencés, deux physiques |
| Multimètre : un nœud ou plusieurs ? | Un seul, les grandeurs en propriété multivaluée |
| Le banc porte-t-il un procédé ? | Oui — `Maintenir en position` |

---

## 7. Ce qu'il faut de Cyril avant la tâche 2

1. **Valider ou refuser `Braser tendre`** plutôt que `Braser` (§2).
2. **Valider la catégorie comme marqueur** de branche à la place de la
   présence de `Practice_domain` (§3), ce qui amende le §2.2 du cadrage.
3. **Compléter les domaines de pratique** — je n'en propose que ce dont je suis
   sûr ; le vocabulaire doit émerger de lui, pas de moi.
4. **Documentation des outils : pas nécessaire ici.** L'arbre ne dépend
   d'aucune fiche technique. Elle le deviendra à la tâche 4, pour le niveau
   référencé : marque, modèle, puissance, numéro de série. À garder pour le
   pilote.
