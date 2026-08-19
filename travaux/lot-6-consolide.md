# Lot 6 consolidé — cadrage pour Claude Code

**Ce fichier remplace `lot-6bis-cadrage.md` et `lot-6ter-cadrage.md`.**
Supprimer les deux précédents pour éviter de travailler sur une version périmée.

Rien de ce qui suit n'a été écrit sur le wiki à ce jour. La session du 9 août a
effectué la reconnaissance de la Tâche 1 et proposé un diff qui n'a pas été
validé ; l'état du wiki est donc inchangé.

Réorganisation par rapport aux deux fichiers précédents : les tâches sont
groupées **par page touchée**, pas par ordre de découverte. `Modèle:Referenced
item` était modifié dans trois tâches distinctes ; il ne l'est plus que dans
une.

**Rappel des règles de `CLAUDE.md` qui s'appliquent :**

- Lire l'état courant avant toute proposition de modification.
- Proposer un diff et attendre validation avant tout `wiki-put.sh`.
- Aucune référence Base 36 créée hors production.
- Ne pas toucher à `Module:Base36` ni à `Item_ref` : la numérotation reste gelée
  tant que des items se créent.
- Un refus d'écriture est un résultat à rapporter, jamais un obstacle à
  contourner.
- Ne rien inventer quand le cadrage dit « à vérifier ». S'arrêter et demander.

**Deux conventions de session à respecter :**

- **Écrire chaque diff proposé dans un fichier avant de l'afficher**, sous
  `diffs/AAAA-MM-JJ-tacheN.md`. Cyril doit pouvoir le transmettre sans le
  recopier depuis le terminal.
- **Résumés d'édition au format `[Lot 6][Tâche N] <page> — <ce qui change>`.**
  Une modification = une édition = un résumé. L'historique du wiki est une trace
  durable ; les numéros de lot doivent y rester cohérents. Ne pas écrire
  « 6bis » ni « 6ter », ces fichiers sont périmés.

---

## Qui fait quoi

**Par défaut, tout est exécutable par Claude Code** : lire, proposer un diff,
écrire après validation, et vérifier — y compris récupérer une page rendue pour
y contrôler l'affichage. Une vérification n'est pas manuelle parce qu'elle
regarde un écran ; elle l'est seulement quand l'API ne peut pas y accéder.

**Deux cas, et deux seulement, exigent Cyril dans un navigateur :**

1. **Tester un formulaire.** `wiki-put.sh` écrit le wikitexte directement et
   court-circuite Page Forms. Le comportement réel d'un champ de saisie ne se
   manifeste qu'à travers l'interface.
2. **Trancher un go/no-go**, signalé comme tel dans la tâche concernée.

Tout le reste, y compris les contrôles d'affichage, revient à Claude Code. Si
une consigne de ce fichier semble demander une action manuelle hors de ces deux
cas, c'est une erreur de rédaction : le signaler.

---

## Règle d'ordre qui traverse tout le lot

**Modèle avant formulaire, toujours.**

Poser `+sep=,` et `#arraymap` sur un modèle qui ne reçoit encore qu'une valeur
est inerte : sans séparateur dans la valeur, rien n'est découpé, et un
`#arraymap` sur une valeur unique produit exactement le lien actuel.

L'ordre inverse ouvre une fenêtre pendant laquelle le formulaire peut
enregistrer plusieurs valeurs dans un modèle incapable de les stocker
correctement — sans erreur d'API, sans trace visible.

---

## Tâche 1 — Parents multiples sur les items fonctionnels

### Problème

`Part_of` n'accepte qu'un parent côté fonctionnel. Le correctif du lot 1 n'avait
porté que sur `Modèle:Referenced item`. Symptôme silencieux : plusieurs parents
sont stockés comme un littéral unique malformé, et l'item disparaît de l'arbre.

Cas réel : `Acheminer l'eau au point d'usage` (000P) doit avoir deux parents,
`Irriguer` (0008) et `S'hydrater` (000B). Une tentative de saisie a déjà eu
lieu ; seul `Irriguer` est enregistré, le formulaire n'ayant pas permis d'en
sélectionner deux.

### État attendu des pages (relevé le 9 août)

Relire malgré tout. **Toute divergence avec ce qui suit signifie qu'une
modification a eu lieu entre-temps : s'arrêter et la signaler.**

`Formulaire:Functional item`, champ `Part_of` :
```
{{{field|Part_of|input type=combobox|values from category=Functional item|placeholder=Sélectionner...}}}
```

`Modèle:Functional item`, stockage :
```
{{#set:
|Item_ref={{{Item_ref|}}}
|Item_description={{{Item_description|}}}
|Part_of={{{Part_of|}}}
}}
```

`Modèle:Functional item`, affichage :
```
! style="background:#f2f2f2" | Fonction parente
| [[{{{Part_of|}}}]]
```

### Modifications, dans cet ordre

**Étape 1 — `Modèle:Functional item`.** Une seule écriture pour les trois
changements.

Stockage — ajouter `|+sep=,` immédiatement après la ligne `Part_of` :
```
{{#set:
|Item_ref={{{Item_ref|}}}
|Item_description={{{Item_description|}}}
|Part_of={{{Part_of|}}}
|+sep=,
}}
```
La position est signifiante : `+sep=` s'applique à la propriété qui le précède
immédiatement, pas au bloc entier.

Affichage — remplacer le lien simple :
```
| {{#arraymap:{{{Part_of|}}}|,|@@@|[[@@@]]|,&#32;}}
```
Ne pas annoter dans l'`#arraymap` : le stockage est assuré par le `#set`.

Libellé — passer « Fonction parente » au pluriel, « Fonctions parentes ». Le
singulier devient faux dès que plusieurs parents sont possibles. C'est la même
ligne du même fichier : le faire ici évite une passe supplémentaire.

**Étape 2 — `Formulaire:Functional item`**, seulement après validation de
l'étape 1 :
```
{{{field|Part_of|list|delimiter=,|input type=tokens|values from category=Functional item|placeholder=Sélectionner...}}}
```
`list` est le paramètre indispensable. `input type=tokens` remplace `combobox`,
qui est mono-valeur par construction. **Conserver `placeholder=Sélectionner...`**
et rapporter si `tokens` ne l'honore pas — une perte assumée, pas accidentelle.

### Vérification

> **L'affichage ne prouve rien.** `#arraymap` rogne les espaces autour de chaque
> valeur ; `#set` avec `+sep=,` ne les rogne pas pour les valeurs
> intermédiaires. Deux liens bleus parfaitement corrects peuvent donc coexister
> avec une donnée stockée portant un espace parasite. Seuls `Spécial:Parcourir`
> et `browsebysubject` disent la vérité. Ne jamais conclure depuis la page
> rendue.

1. Éditer `Acheminer l'eau au point d'usage` et porter `Part_of` à
   `Irriguer,S'hydrater`. **Sans espace après la virgule.**
2. Contrôle des faits stockés :
   ```
   curl -s "https://wiki.ecolibre.org/api.php?action=browsebysubject&subject=Acheminer%20l'eau%20au%20point%20d'usage&format=json&formatversion=2" \
     | jq '.query.data[] | select(.property=="Part_of")'
   ```
   Trois issues à distinguer et à rapporter telles quelles :
   - un seul `dataitem` contenant une virgule → `+sep=,` non appliqué ;
   - deux `dataitem` propres → correct ;
   - `Part_of` absent → le `#set` ne reçoit pas le paramètre, erreur de nom.
3. **Cas du parent vide.** `Assurer les besoins vitaux` (0001) est la racine :
   c'est le seul item du wiki dont `Part_of` est vide, et personne ne l'a
   jamais testé. Le comportement d'`#arraymap` sur une chaîne vide n'est pas
   documenté par Page Forms. Récupérer la page rendue
   (`action=parse&page=Assurer les besoins vitaux&prop=text`) et inspecter la
   ligne « Fonctions parentes » :
   - vide ou absente → correct ;
   - `[[]]` ou lien vers une page au nom vide → envelopper l'`#arraymap` dans
     un test de valeur vide, et proposer le correctif.
4. Récupérer `Catégorie:Functional item` et **rapporter le comportement de
   l'arbre** sans le corriger. Voir Tâche 6.

### Étape humaine — après l'étape 2 seulement

Une seule chose n'est pas vérifiable par API, et Cyril doit la faire dans son
navigateur : **rouvrir `Acheminer l'eau au point d'usage` par le formulaire,
retirer puis resaisir les deux parents, enregistrer.**

Raison : `wiki-put.sh` écrit le wikitexte directement et court-circuite le
formulaire. Le comportement réel du champ `tokens` — notamment s'il produit
`A,B` ou `A, B` — ne se manifeste qu'à travers l'interface. Un espace émis par
le widget passerait inaperçu à tous les contrôles ci-dessus.

Après cette resaisie, refaire le contrôle 2. Si un espace apparaît, le
formulaire est en cause, pas le modèle.

---

## Tâche 2 — `Modèle:Referenced item` : trois corrections en une passe

Toutes portent sur le même fichier. Les faire séparément multiplie les
relectures de diff sans bénéfice.

**La partie C est un go/no-go : ne rien exécuter dessus sans accord explicite
de Cyril.** Si C est refusée, faire A et B seules et conserver les noms de
paramètres actuels.

### 2A — Affichage des parents en texte brut

État relevé :
```
! style="background:#f2f2f2" | Cas d'emploi (Parents)
| {{{parents|}}}
```

Le `#set` crée l'annotation sémantique que la page cible existe ou non. Sans
lien, une faute de frappe produit un fait pointant vers une page inexistante et
rien à l'écran ne le signale. Remplacer par un `#arraymap`, en reprenant la
forme réellement mise en production à la Tâche 1.

### 2B — Exemplaires physiques absents

Le modèle rend six lignes ; aucune ne liste les exemplaires physiques. Ce n'est
pas une donnée manquante mais une requête absente.

**Lire d'abord une page d'item physique existante pour confirmer le nom exact
de la propriété portant le lien vers le référencé.** Le modèle documenté dit
`Instance_of` ; le vérifier avant d'écrire. Même chose pour les noms
d'inventaire du lot 4.

```
{{#ask:[[Category:Physical item]][[Instance_of::{{FULLPAGENAME}}]]
 |?Inventory_ref=Réf. inventaire
 |?Inventory_site=Site
 |format=table
 |default=Aucun exemplaire physique enregistré.
}}
```

`$smwgEnabledQueryDependencyLinksStore` est actif depuis le 26 juillet : ne pas
ajouter de mécanisme de purge.

### 2A et 2B — FAITES le 9 août

Écrites et vérifiées (`newrevid: 322`). Ne pas les reprendre.

Une réserve à connaître : aucun des deux items référencés existants n'a de
parent renseigné, donc l'`#arraymap` de 2A n'a jamais rencontré de donnée
réelle. Le premier vrai test viendra à la saisie de la facture Weldom. Le
contrôle « rapporter tout lien rouge » n'a rien trouvé parce qu'il n'y avait
rien à trouver, pas parce que tout est sain.

### 2C — Noms de paramètres de `Referenced item` (périmètre arrêté)

**Décision prise le 9 août : cette tâche ne porte que sur `Referenced item`.**
L'audit du 9 août a montré non pas deux mais **trois** conventions de nommage
sur les quatre modèles. Les classes `Organic item` et `Physical item` sortent
du périmètre et feront l'objet d'un lot dédié.

Motif de l'exclusion : `Modèle:Physical item` compose `Inventory_ref` à partir
de `site_code` et `ref_number`. Ce n'est pas un renommage mais une refonte, et
elle touche la numérotation, gelée tant que des items se créent. Ne pas la
mélanger à une phase de saisie.

Convention retenue : nom de paramètre = nom de la propriété alimentée. C'est
celle de `Functional item`, et la seule qui rende trivial un générateur de
wikitexte — ce dont dépend l'automatisation depuis facture.

| Paramètre actuel | Propriété alimentée | Cible |
|---|---|---|
| `description` | `Item_description` | `Item_description` |
| `maturity` | `Maturity_level` | `Maturity_level` |
| `parents` | `Part_of` | `Part_of` |
| `organic_link` | `Corresponds_to_organic` | `Corresponds_to_organic` |
| `Item_ref` | `Item_ref` | inchangé |

**Pourquoi maintenant.** Les noms de paramètres sont inscrits dans le wikitexte
de chaque page appelant le modèle. Renommer oblige à réécrire toutes les pages
existantes de la classe : deux aujourd'hui, une vingtaine après la facture
Weldom. Le coût augmente à chaque saisie et ne redescend jamais.

**Périmètre d'exécution.** Trois pages, dans cet ordre :

1. `Modèle:Referenced item` — renommer les cinq paramètres. Attention : la
   ligne `#arraymap` posée en 2A porte `{{{parents|}}}` et doit suivre.
2. `Formulaire:Referenced item` — les champs doivent passer les nouveaux noms.
   Modèle et formulaire changent ensemble ou le formulaire cesse de remplir le
   modèle.
3. Les deux pages d'items référencés existantes : `Batterie défaillante
   récupérée` et `Bidon 220L bleu plastique Borde`.

### Vérification de 2C

**Capturer `browsebysubject` sur les deux items avant l'écriture**, sinon la
comparaison après ne prouve rien. Les faits stockés doivent être strictement
identiques avant et après : un renommage de paramètre ne doit rien changer aux
données.

1. Comparaison `browsebysubject` avant / après sur les deux items.
2. Rendu HTML des deux pages : aucune cellule ne doit s'être vidée.
3. Recensement de `Catégorie:Referenced item` : toujours 2 membres.
4. **Étape humaine** — rouvrir chaque item par le formulaire et vérifier que
   tous les champs sont pré-remplis. Un champ vide signifie un paramètre non
   repris côté formulaire. C'est le seul contrôle que l'API ne peut pas faire.

---

## Tâche 3 — Audit des quatre directions inverses

Le modèle a quatre liens, donc quatre réciproques possibles. Auditer et
rapporter lesquelles sont réellement rendues. **Ne corriger que celles qui
manquent, après validation.**

| Direction | Où elle devrait apparaître | État connu |
|---|---|---|
| fonction → organiques qui la réalisent | page fonctionnelle | présent |
| organique → référencés qui le fournissent | page organique | à vérifier |
| référencé → exemplaires physiques | page référencée | absent — traité en 2B |
| item → composants (BOM) | les trois niveaux | présent |

---

## Tâche 4 — Propriétés manquantes avant la saisie des raccords

**À faire après la Tâche 2**, et notamment après 2C si elle est validée : créer
des propriétés sur des modèles qu'on s'apprête à renommer serait du travail à
refaire.

Une facture Weldom du 07/03/2026 (ticket 05701/0245969, 22 lignes) va donner
lieu à la création d'items organiques et référencés. Cette tâche prépare le
terrain et **ne crée aucun item de raccord**.

### 4a. Audit préalable — deux manques suspectés

1. **Fournisseur et référence fournisseur.** Le rendu de `Bidon 220L bleu
   plastique Borde` ne montre aucune ligne fournisseur, et les champs vides y
   sont pourtant affichés. Si ces propriétés n'existent pas, la source n'est
   portée que par le titre de la page — ni requêtable, ni exportable.
   Distinguer la référence **enseigne** (`0005604982` chez Weldom) de la
   référence **fabricant**, souvent absente. Un code Weldom n'a aucune valeur
   hors de France.

2. **Classification des familles.** `Part_of` est une composition. Rien ne
   permet de demander « tous les mamelons ». Proposer une propriété plutôt
   qu'une arborescence de catégories.

### 4b. Propriétés à créer

Lire d'abord `Attribut:Item_ref` et `Attribut:Property_cardinality` et
**reproduire exactement leur syntaxe**, y compris la forme localisée des
propriétés spéciales SMW (`A pour type`, `Peut avoir la valeur` en interface
française). Ne pas supposer la forme anglaise.

Renseigner chaque propriété créée avec les trois propriétés de schéma du lot 3 :
`Property_cardinality`, `Property_domain`, `Property_range`.

| Propriété | Type | Domaine | Valeurs / unité |
|---|---|---|---|
| `Connection_gender` | Texte | Organic item | M, F, MM, FF, MF |
| `Thread_designation` | Texte | Organic item | 12x17, 15x21, 20x27, 26x34, 33x42, 40x49, 50x60 |
| `Nominal_diameter` | Nombre | Organic item | mm (tubes PE : D20, D25, D32) |
| `Connection_standard` | Texte | Organic item | filetage gaz, compression PE, raccord rapide, à butée |
| `Fitting_family` | Texte | Organic item | mamelon, manchon, coude, té, nez de robinet, vanne, adaptateur |
| `Material` | Texte | Organic item | laiton, PE, PVC, inox |
| `Max_head` | Nombre | Organic item | cm — hauteur de refoulement d'une pompe |
| `Classification_externe` | URL | Organic item | URL Wikipédia ou Wikidata du type d'objet |

**Attention aux espaces sur les propriétés multivaluées.** `Thread_designation`
sera multivaluée — un mamelon réducteur porte deux filetages. SMW ne rogne pas
les espaces des valeurs intermédiaires : `26x34, 20x27` produit `26x34` et
` 20x27`. Sur une propriété de type Texte soumise à `Peut avoir la valeur`, la
contrainte échoue silencieusement.

### 4d. Prérequis bloquant — normaliser l'espace du widget

**Constaté le 9 août, plus une hypothèse.** Le widget `tokens` de Page Forms
insère un espace après le délimiteur malgré `delimiter=,`. Le wikitexte produit
par le formulaire est `Irriguer, S'hydrater`, pas `Irriguer,S'hydrater`.

Sur `Part_of`, sans conséquence : propriété de type Page, MediaWiki normalise
le titre et absorbe l'espace. Sur les propriétés Texte du tableau ci-dessus,
l'espace survit et casse la contrainte de valeurs autorisées.

**À résoudre avant de créer ces propriétés, pas après.** Trois pistes, à
instruire et à proposer avec un diff :

1. **Normaliser dans le modèle avant le `#set`**, par exemple en enveloppant la
   valeur dans un remplacement de `, ` par `,`. Vérifier d'abord si les
   fonctions de chaîne de ParserFunctions sont activées sur ce wiki
   (`$wgPFEnableStringFunctions`) — elles sont désactivées par défaut. Piste
   privilégiée : locale, sans dépendance au comportement du widget.
2. **Ne pas utiliser `tokens`** pour ces champs, mais un type de saisie qui
   n'insère pas d'espace. À tester.
3. **Assouplir la contrainte** en déclarant les valeurs autorisées avec et sans
   espace. À écarter : ça masque le problème au lieu de le corriger.

Rapporter le résultat de l'instruction avant de créer la moindre propriété.

**Correspondance des filetages français** — diamètre intérieur × extérieur du
tube, pas une conversion de pouces :

| Désignation | Équivalent |
|---|---|
| 12x17 | 3/8″ |
| 15x21 | 1/2″ |
| 20x27 | 3/4″ |
| 26x34 | 1″ |
| 33x42 | 1″1/4 |

**Sur `Classification_externe` :** ne pas utiliser la propriété SMW
`Equivalent URI`, qui s'exporte comme une assertion d'identité. Un article
Wikipédia dénote un document, pas l'objet décrit. Une propriété dédiée de type
URL est le bon niveau d'engagement ; un `skos:closeMatch` viendra à l'export si
besoin. C'est la convention recommandée par le standard Open Know-Where pour
classer équipements, procédés et matériaux.

### 4c. Défaut de formulaire

`Bidon 220L bleu plastique Borde` porte « État de maturité : Certifié (OSHW) ».
C'est faux — c'est un bidon acheté chez un fournisseur. Vérifier si c'est la
valeur par défaut du formulaire. Si oui, proposer une valeur vide ou neutre, et
rapporter combien d'items existants portent cette valeur à tort.

---

## Tâche 5 — Ajouts à `CLAUDE.md`

Lire `CLAUDE.md` d'abord. Insérer dans la section traitant des pièges SMW ; si
elle n'existe pas, en proposer une plutôt que d'ajouter en vrac.

**1. `+sep=` est par propriété et sa position compte.**

> Dans un `#set`, `|+sep=` s'applique à la propriété qui le précède
> immédiatement, pas à l'ensemble du bloc. Plusieurs propriétés d'un même `#set`
> peuvent avoir des séparateurs différents, ou aucun. Déplacer un `+sep=` casse
> silencieusement le découpage de la propriété concernée.

**2. SMW ne rogne pas les espaces des valeurs intermédiaires.**

> Avec `|+sep=,`, SMW supprime les espaces en tête et en fin de chaîne complète
> mais conserve ceux des valeurs du milieu : `A, B, C` produit `A`, ` B`, ` C`.
> Pour une propriété de type Page, MediaWiki normalise le titre et absorbe
> l'espace. Pour une propriété de type Texte soumise à `Peut avoir la valeur`,
> la contrainte échoue silencieusement. Les formulaires ne doivent jamais
> émettre d'espace après le séparateur.

**3. Modèle avant formulaire.**

> Poser un `+sep=` ou un `#arraymap` sur un modèle recevant encore une valeur
> unique est inerte. Modifier le formulaire d'abord ouvre une fenêtre pendant
> laquelle des valeurs multiples peuvent être enregistrées dans un modèle
> incapable de les stocker. Toujours modèle d'abord, formulaire ensuite, avec
> validation entre les deux.

**4. Comment vérifier un fait SMW réellement stocké.**

> `bin/wiki-get.sh` ne gère pas `action=browsebysubject`, et la lecture du
> wikitexte ne montre pas ce qui est stocké.
>
> ```
> curl -s "https://wiki.ecolibre.org/api.php?action=browsebysubject&subject=NOM_DE_PAGE&format=json&formatversion=2" \
>   | jq '.query.data[] | select(.property=="NOM_PROPRIETE")'
> ```
>
> Un seul `dataitem` contenant le séparateur = découpage non appliqué. Propriété
> absente = le `#set` ne reçoit pas le paramètre. Équivalent humain :
> `Spécial:Parcourir`.

### Vérification

Relire `CLAUDE.md` et rapporter le nombre de lignes. Au-delà de 200, proposer un
découpage en fichiers importés par `@chemin` plutôt que de laisser grossir.

---

## Tâche 6 — Consigner deux dettes sans les corriger

Localiser d'abord où vivent les dettes techniques connues sur le wiki. Si aucune
page ne les recense, **le dire et s'arrêter** plutôt que de créer une page de sa
propre initiative.

**1. Racine de l'arbre fonctionnel codée en dur.**

> `Catégorie:Functional item` interroge l'arbre avec
> `root=Assurer les besoins vitaux`. L'ouverture d'une seconde branche racine —
> les besoins non vitaux sont envisagés — ferait disparaître ses items de
> l'affichage sans aucune erreur.

**2. L'arbre fonctionnel devient un graphe orienté acyclique.**

> Depuis la Tâche 1, un item fonctionnel peut avoir plusieurs parents.
> `format=tree` avec `parent=Part_of` suppose un parent unique. Aucune détection
> de cycle n'existe côté fonctionnel, alors qu'un cycle est désormais possible.
> Le patron de résolution existe déjà sur ce wiki : `Board_lineage` matérialise
> la fermeture réflexo-transitive de `Board_parent` et ramène n'importe quelle
> profondeur à deux sauts ; `Module:Board` porte la détection de cycle.

---

## Ordre d'exécution

| # | Tâche | Dépend de | Bloque |
|---|---|---|---|
| 1 | Parents multiples (fonctionnel) | — | la saisie fonctionnelle |
| 2 | `Modèle:Referenced item` (2A+2B, 2C sur accord) | Tâche 1 pour la forme d'`#arraymap` | la saisie Weldom |
| 3 | Audit des directions inverses | — | — |
| 4 | Propriétés de raccords | Tâche 2, surtout 2C | la saisie Weldom |
| 5 | `CLAUDE.md` | — | — |
| 6 | Consigner les dettes | — | — |

Les tâches 3, 5 et 6 sont indépendantes et peuvent être faites à tout moment.
1 → 2 → 4 est une séquence stricte. Aucune saisie d'item ne commence avant la
fin de la Tâche 4.

## Contrôle final

1. **Liens entrants** sur chaque page modifiée — un retour à la ligne dans
   `[[ ]]` casse un lien sans erreur d'API. C'est ce contrôle qui l'attrape,
   pas la relecture.
2. **Recensement de catégorie** comparé à l'état initial, pour les quatre
   classes. Un compteur de catégorie n'est pas un recensement : des pages de
   documentation peuvent s'y glisser.
3. **Séquence Base 36** — vérifier qu'aucune référence n'a été consommée. État
   connu au 9 août : séquence partagée entre les trois classes de conception,
   contiguë de 0001 à 000P, sans trou.
