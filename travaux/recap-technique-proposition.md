# [Proposition] Récapitulatif technique — combler la prose manquante du lot 11

**28 août 2026. Proposition seulement, aucune écriture sur le wiki.**

Point 1 de la demande (règle CLAUDE.md sur le recoupement mesure/page wiki)
traité séparément, déjà écrit et commité — hors périmètre de ce rapport.

Ce rapport traite les points 2 (a-f) et 3. Page source relue intégralement
en direct (446 lignes, `bin/wiki-get.sh "Récapitulatif technique du Système
de Gestion de Données Techniques"`) avant toute proposition, comme demandé.
Tous les chiffres cités ci-dessous (0 item à *Le Buisson de Cerzat*, 26 à
*Butte de la tranchée*, aucune page ne portant `Location_lineage`) ont été
revérifiés en direct le 28 août, pas repris d'un rapport antérieur.

Le style de la page est tenu : prose qui explique le pourquoi d'un choix de
modélisation, jamais une liste plate — le tableau `{{#ask:}}` du §1 fait
déjà l'inventaire brut, la prose est ce qui dit *pourquoi* la donnée est
faite ainsi.

---

## a) La classe Organisation — section jumelle ou généralisation ?

### L'argument

La section existante, « Les lieux sont hors de la chaîne », mélange deux
étages qui n'ont pas le même degré de généralité :

- un étage **générique**, qui vaudrait pour toute entité hors chaîne :
  « ce n'est pas un cinquième niveau », « la catégorie est posée par le
  modèle, jamais à la main » ;
- un étage **propre aux lieux**, qui ne vaut pour rien d'autre : la
  distinction `Located_at`/`physical_parent`, le découplage entre le
  troisième et le deuxième niveau de la chaîne, les trois banques de
  références Base36.

Organisation partage le premier étage avec les lieux (hors chaîne, entité
d'appartenance plutôt que de localisation — le parallèle est déjà écrit
noir sur blanc dans `organisation-proposition.md` : « Organisation appelle
la même phrase, avec "entité d'appartenance" à la place de "entité de
localisation" »). Mais elle ne partage **aucun** élément du second étage —
elle n'a même pas d'équivalent : contrairement aux lieux, qui se relient à
la chaîne par `Located_at`, **Organisation n'a aujourd'hui aucune propriété
qui la relie directement à la chaîne** (elle n'est atteinte qu'indirectement,
par `Owned_by`/`Wanted_by` portés par l'item — voir b).

Généraliser le titre (« Les entités hors chaîne ») engloberait sous un même
chapeau des détails hétérogènes qui ne s'appliquent qu'à l'un des deux
sujets — exactement la logique qu'évite déjà le reste de la page, qui
préfère répéter la forme « tête de sous-section + explication propre » (les
quatre classes puis leurs trois banques) plutôt que fusionner du
dissemblable sous un intitulé plus vague.

**Recommandation : section jumelle, pas généralisation.** Même patron
d'ouverture (« n'est pas un cinquième niveau »), pour que le lecteur
reconnaisse le raisonnement déjà appris sur les lieux, puis divergence
immédiate sur ce qui est spécifique à Organisation.

### Texte proposé

À insérer juste après « Les lieux sont hors de la chaîne » (donc avant
« Numérotation : trois banques de références »), comme nouvelle
sous-section de même niveau (`===`) :

```
=== Organisation est hors de la chaîne, comme les lieux ===

<code>Category:Organisation</code> n'est pas non plus un cinquième niveau :
comme les lieux, c'est une entité posée en dehors de la chaîne fonctionnel →
organique → référencé → physique — ici une entité d'appartenance, et non de
localisation. Elle ne descend d'aucune des quatre classes de conception et
n'en a aucune comme parente.

Contrairement aux lieux, qui se relient à la chaîne par
<code>Located_at</code>, Organisation n'a aujourd'hui '''aucune propriété qui
la relie directement''' : elle n'est atteinte que par l'appartenance
(<code>Owned_by</code>) ou le souhait (<code>Wanted_by</code>), portés par
l'item et non par elle (voir ci-dessous).

La catégorie est posée automatiquement par <code>Modèle:Organisation</code>,
jamais à la main — même règle que pour les quatre classes et pour les
lieux : elle vaut appartenance à la classe, pas navigation.
```

---

## b) Owned_by et Wanted_by — avec Organisation, et pourquoi sur l'item

Cyril a raison : la décision — porter l'appartenance sur l'item, pas sur le
lieu — n'est écrite nulle part en ces termes. Elle se déduit de deux
rapports (`owned-by-proposition.md` §1, sous-section « confirme la décision
de porter sur l'item ») mais n'a jamais été formulée comme choix de
modélisation sur une page qui explique le pourquoi.

**La raison n'est pas de confort, elle est mesurée :** `Located_at` ne
remonte pas l'arbre des lieux — c'est justement ce que `Location_lineage`
devait permettre et ne permet pas (voir d). Une jointure
`Located_at → Owned_by` posée sur un lieu ne retrouverait donc aucun des
29 exemplaires plantés à *Butte de la tranchée*, qui se trouve deux crans
sous *Terrain de Cyril au Buisson de Cerzat* dans l'arbre — c'est ce
porteur-là qui recevrait l'appartenance si elle vivait sur le lieu, et la
jointure resterait vide pour tout ce qui est en dessous. Poser `Owned_by`
sur l'item est la seule façon d'obtenir une réponse pour ces cas, mesurée
sur les 44 items physiques en production. Seconde raison, indépendante de
la première : un exemplaire peut changer de lieu sans changer de
propriétaire — les deux faits n'évoluent pas ensemble, ils ne doivent donc
pas être portés par la même page.

`Wanted_by` suit une logique différente : elle ne porte jamais sur un
exemplaire, seulement sur un item organique ou référencé, parce qu'elle
vise ce qui n'est *pas encore là* (une espèce en général, ou une provenance
précise) — sans auto-extinction : un souhait reste affiché même si
l'espèce est déjà présente ailleurs sur le wiki.

### Texte proposé

Nouvelle sous-section, juste après celle du point a) :

```
=== Appartenance et souhait : portés par l'item, pas par le lieu ===

<code>Owned_by</code> (sur Physical item, cardinalité unique) et
<code>Wanted_by</code> (sur Organic item et Referenced item, cardinalité
multiple) relient un item à un acteur — aujourd'hui toujours une
Organisation, mais la portée documentée reste « un acteur » pour ne pas
fermer la porte à une future classe Personne.

Les deux propriétés sont portées par l'item, jamais par le lieu, pour une
raison mesurée : <code>Located_at</code> ne remonte pas l'arbre des lieux
(voir <code>Location_lineage</code> ci-dessous), donc une jointure posée sur
un lieu ne retrouverait pas les exemplaires situés plusieurs niveaux en
dessous de lui. Seconde raison, indépendante : un exemplaire peut changer de
lieu sans changer de propriétaire — les deux faits n'évoluent pas ensemble.

<code>Wanted_by</code> ne porte jamais sur un exemplaire : elle vise ce qui
n'est pas encore là (une espèce en général sur un item organique, une
provenance précise sur un item référencé), et n'a délibérément aucune
auto-extinction — un souhait reste affiché même après que l'espèce est
devenue présente ailleurs.
```

---

## c) Planting_rank_end — dans « La maille d'une plantation »

À ajouter dans la section existante, juste après le paragraphe sur
`Poireau perpétuel — Le Buisson de Cerzat` (`ECL-0032`/`ECL-0033`) et avant
celui sur `Propagated_from` :

```
<code>Planting_rank</code> et <code>Planting_rank_end</code> bornent la
position d'une plantation sur son lieu, en mètres entiers depuis l'origine
de celui-ci : <code>Planting_rank</code> marque le début ; <code>
Planting_rank_end</code>, facultative, marque la fin pour une plantation en
ligne ou en bande — laissée vide, la plantation est ponctuelle. Aucune
contrainte n'assure que la fin suive le début, et les deux propriétés
restent volontairement orthogonales à <code>Planted_count</code>, qui
compte les pieds sans en dire la disposition.
```

---

## d) Location_lineage — déclarée, vide, et pourquoi (le point important)

Vérifié en direct le 28 août : `Attribut:Location_lineage` existe
(`Property_domain::Category:Lieu`, `Property_cardinality::multiple`,
créée le 21 août 2026), et **aucune page du wiki ne porte de fait
`Location_lineage`** (`[[Location_lineage::+]]` rend 0 résultat). Une
personne qui la découvre dans le tableau vivant du §1 — elle y apparaît
automatiquement, comme toute propriété portant `Has type` — n'a aujourd'hui
aucun moyen de savoir, depuis cette page, qu'elle est délibérément
inutilisée plutôt qu'oubliée.

L'entrée n° 31 de *Limites connues* est le bon endroit pour le défaut
d'outillage lui-même (le patron `#show`→`#set` casse pour une propriété de
type Page, de deux façons différentes selon la donnée — erreur franche ou
fait faux silencieux) et le reste. Ce qui manque ici, sur *Récapitulatif
technique*, c'est la conséquence pour le modèle de données : la propriété
existe, elle est vide, et aucune voie de remplacement (module Lua,
requête à la volée, abandon du besoin) n'a été arbitrée à ce jour.

### Texte proposé

Nouvelle sous-section, à la suite de « Les lieux sont hors de la chaîne »
(avant ou après les sous-sections a/b selon la préférence de Cyril — elle
parle de lieux, pas d'Organisation, un rattachement direct à la section
lieux est aussi défendable) :

```
=== Location_lineage : déclarée, vide, et pourquoi ===

<code>Location_lineage</code> (portée multiple, domaine
<code>Category:Lieu</code>) est déclarée depuis le 21 août 2026 pour porter
l'ensemble des lieux ancêtres d'un lieu, lui-même inclus — la fermeture
réflexo-transitive de l'arbre des lieux, pensée pour qu'une requête puisse
remonter directement d'un exemplaire à n'importe quel ancêtre de son lieu
sans traverser <code>Located_at</code> à la main, niveau par niveau.

'''Elle ne porte aujourd'hui aucune valeur, sur aucune page.''' Le patron
envisagé pour la remplir automatiquement échoue pour toute propriété de
type Page — voir [[Limites connues du Système de Gestion de Données
Techniques]], entrée n° 31, pour le mécanisme de cet échec. '''Aucune voie
de remplacement n'a été arbitrée à ce jour''' — ni module Lua, ni requête à
la volée, ni abandon du besoin.

En attendant, remonter l'arbre d'un lieu se fait par lecture répétée de
<code>Located_at</code>, un niveau à la fois — c'est ce qui explique, entre
autres, pourquoi <code>Owned_by</code> et <code>Wanted_by</code> sont
portées par l'item plutôt que par le lieu (voir ci-dessus).
```

---

## e) Un compte vivant pour Category:Lieu

Le tableau « Les quatre classes » (§ Les quatre classes) tient un effectif
vivant par `{{#ask: [[Category:X]] |format=count}}` pour chacune des
quatre classes de conception. `Category:Lieu` n'a aujourd'hui aucun
équivalent, alors que les 13 lieux créés par le lot 11 en feraient tout
autant usage — sans compte vivant, la seule façon de savoir combien de
lieux existent est une requête ad hoc.

### Texte proposé

À la suite de « Les lieux sont hors de la chaîne » (juste avant ou juste
après « Numérotation : trois banques de références », au choix) :

```
{| class="wikitable"
! Catégorie !! Rôle !! Posée par !! Effectif
|-
| [[:Category:Lieu|Category:Lieu]] || ensemble des lieux publiés sur ce
wiki || [[:Modèle:Lieu|Modèle:Lieu]] || {{#ask: [[Category:Lieu]]
|format=count}}
|}
```

Même patron exact que le tableau des quatre classes (`{{#ask:}}` inline,
pas `action=ask` — l'entrée de *Limites connues* sur `format=count` cassé
ne concerne que le second chemin).

---

## f) L'exemple périmé : Le Buisson de Cerzat

Vérifié en direct le 28 août : `[[Located_at::Le Buisson de Cerzat]]` rend
**0** résultat ; `[[Located_at::Butte de la tranchée]]` en rend **26**. La
phrase d'ouverture de « Les lieux sont hors de la chaîne » cite pourtant
« Le Buisson de Cerzat, Jardin de Chilhac, Terrasse de Chilhac » comme
exemples d'un ensemble d'items physiques « que les autres items physiques
désignent par `Located_at` » — c'est devenu faux pour le premier des trois
depuis la bascule du 25 août (tâche 5) et le rattachement des photos
(27 août) : *Le Buisson de Cerzat* reste un lieu réel de l'arbre, mais plus
aucun item ne le désigne directement, ses anciens occupants ayant été
répartis vers ses lieux enfants.

### Deux formulations possibles

**A (recommandée) — ne plus dépendre d'un nom.** Retirer la liste
d'exemples : elle rend la phrase vraie pour n'importe quelle
configuration future de l'arbre, y compris un nouveau déplacement d'items.

```
<code>Category:Lieu</code> n'est pas un cinquième niveau : c'est un
ensemble d'items physiques — un terrain, une parcelle, une pièce — que les
autres items physiques désignent par <code>Located_at</code>.
```

**B — garder des exemples, mais des lieux actuellement peuplés.** Remplace
juste le nom fautif, au prix du même risque de péremption au prochain
déplacement d'items :

```
<code>Category:Lieu</code> n'est pas un cinquième niveau : c'est un
ensemble d'items physiques (Butte de la tranchée, Jardin de Chilhac,
Terrasse de Chilhac) que les autres items physiques désignent par
<code>Located_at</code>.
```

---

## 3. Modèles de facette absents de « Modèles de structure » — sans trancher

Lacune antérieure au lot 11, pas créée par lui : la section « 2. Modèles de
Structure » ne liste que les quatre modèles de classe
(`Functional item`, `Organic item`, `Referenced item`, `Physical item`)
depuis sa création, sur le patron `#show doc` + `{{#tag:pre|{{#invoke:
Source|get|...}}}}`. Vérifié en direct : trois modèles de facette existent
aujourd'hui (`Modèle:Facet`, `Modèle:Organic facet fitting`,
`Modèle:Organic facet plant`, `Modèle:Physical facet plant`), plus une page
`/doc` créée le 25 août par le lot 11, et aucun n'apparaît dans cette
section. `facette-doc-execution.md` §4 l'avait anticipé lors du lot 8
(« ajoutera une ligne au tableau … si celui-ci liste les modèles de
facette ») — vérifié ce jour : il ne le fait pour aucune facette,
antérieure ou non au lot 11.

**Piste 1 — les lister, sur le même patron que les quatre modèles de
classe.** Cohérent avec le reste de la section. Inconvénient : la section
grossirait à chaque facette créée, en double emploi avec le
[[Registre des facettes]], qui est déjà la liste vivante
(`{{#ask: [[Category:Facette]] |format=list}}`) — deux endroits à tenir à
jour pour la même information.

**Piste 2 — renvoyer vers le Registre des facettes plutôt que dupliquer.**
Une phrase du type « Les modèles de facette sont documentés dans
[[Registre des facettes]], pas listés ici » — cohérent avec le principe de
la page (expliquer, pas lister deux fois la même chose) et évite le
doublon. Inconvénient : la section « Modèles de Structure » cesse d'être un
inventaire technique complet en elle-même — elle documenterait les quatre
modèles de classe en détail (code source affiché) et renverrait ailleurs
pour les facettes, sans même dire combien il y en a aujourd'hui.

Aucune des deux n'est trivialement meilleure ; le choix dépend de si
Cyril veut que cette section reste un inventaire exhaustif du code des
modèles, ou qu'elle se limite aux quatre modèles de classe et renvoie pour
le reste. Proposé pour arbitrage, pas pour exécution.

---

## Périmètre non couvert

Ce rapport ne propose aucune écriture wiki : aucune des sections ci-dessus
n'a été posée sur *Récapitulatif technique*. Il ne couvre pas non plus
l'ordre exact d'insertion des sous-sections a), b), d), e) les unes par
rapport aux autres — les quatre s'enchaînent bien dans l'ordre où elles
sont présentées ici, mais Cyril peut préférer un autre agencement (par
exemple e) immédiatement après le tableau des quatre classes, avant la
section lieux, pour garder tous les effectifs vivants groupés).
