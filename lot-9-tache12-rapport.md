# Lot 9 — Tâche 12 : rapport

Trois points, tous exécutés. Aucune `Main_image` renseignée sur une
plantation — c'est le choix de Cyril, la propriété est seulement rendue
saisissable.

## 1. `mw-collapsible` — fonctionne sur ce wiki

**Réponse : oui.** Le module est chargé, le point 3 pouvait donc s'appuyer
dessus.

La preuve ne pouvait pas venir de `action=parse` : le lien « Afficher » est
produit par JavaScript, il n'existe pas dans le HTML du parseur, et
`parse.modules` ne liste que les modules demandés par le parseur
(`ext.smw.style`, `ext.smw.tooltips`) — pas ceux que le skin ajoute. Une
lecture de `parse` seule aurait donné un faux négatif.

Test réellement discriminant, sur le HTML servi par le wiki :

| Page | `jquery.makeCollapsible` dans `RLPAGEMODULES` |
|---|---|
| Bac à sable **avec** un `<div class="mw-collapsible mw-collapsed">` | **oui** |
| `Facette végétal` (sans `mw-collapsible`) | **non** |

Le module n'apparaît que sur la page qui contient la classe : le chargement
conditionnel est donc câblé et fonctionne. Vérifié une troisième fois en fin
de tâche sur la page d'avancement elle-même, une fois modifiée : le module y
est chargé.

Bac à sable lu avant le test et **restauré à l'identique** après (revid 734),
conformément à sa vocation.

## 2. `Attribut:Main_image` — créée (revid 735)

```
[[Has type::Page]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::fichier image]]
```

Descriptions FR et EN portant le motif demandé : la propriété est portée par
la plantation et non par la photo, pour que le choix se lise en un accès
direct depuis l'item au lieu de balayer l'espace `Fichier:`, qui comptera des
dizaines de milliers d'entrées.

Créée avec `--createonly` (`new: true`). Vérifiée par `browsebysubject` :
`_TYPE` = `_wpg` (Page), les cinq faits stockés. Ils ressortent pour l'instant
encapsulés dans `_CHGPRO` — la file de propagation de SMW, comportement
connu sur une page `Attribut:` fraîchement écrite, sans incidence sur le
contenu.

### Modèle et formulaire — les deux ensemble, jamais l'un sans l'autre

- **`Modèle:Physical facet plant`** (revid 738) : paramètre ajouté au `#set`,
  et ligne d'affichage « Photo principale » dans le groupe *Photos*, avec
  `''non choisie''` comme état vide.
- **`Formulaire:Physical item/bloc facette végétal`** (revid 739) : champ
  `Main_image`, `input type=text|uploadable`, **non obligatoire**, sous un
  nouveau sous-titre *Photos*. Le bloc **passe de cinq à six champs**.

Le champ suit la convention déjà en place sur les deux propriétés d'image du
bloc organique (`Seedling_image`, `Mature_image`) : `input type=text|uploadable`,
saisie du nom de fichier **sans** préfixe. Le bloc de formulaire enveloppe
chaque définition de champ dans `<nowiki>` — convention existante de cette
page, respectée à l'identique plutôt que corrigée.

**Un écart délibéré avec ces deux propriétés organiques, à signaler.** Elles
stockent le nom nu (`X.jpg`), ce qui, pour une propriété de type Page, désigne
une page de l'espace principal — pas le fichier. Sur `Main_image`, le modèle
préfixe donc à l'écriture :

```
|Main_image={{#if:{{{Main_image|}}}|Fichier:{{{Main_image|}}}|}}
```

Vérifié en bac à sable : la valeur est alors stockée comme
`ECL-…jpg#6##` — espace de noms 6, le vrai fichier. **C'est cette forme qui
rend le point 3 possible** ; le nom nu ne l'aurait pas permis. Le `#if`
évite d'écrire un `Fichier:` seul quand le champ est vide. `Seedling_image` et
`Mature_image` gardent l'ancienne forme : les corriger sort du périmètre, mais
l'écart est maintenant connu.

## 3. Page d'avancement — galeries scindées (revid 740)

### La forme retenue, et pourquoi (réponse à la question posée)

`Main_image` est portée par la plantation, pas par la photo. Trois formes
testées en bac à sable, sur des faits réels :

| Forme | Résultat |
|---|---|
| `#ask` sur les plantations, `|?Main_image`, `format=gallery` | **rien** — la galerie n'utilise pas un `|?printout` comme source d'image |
| `#ask` sur les plantations, `|?Main_image`, `format=table` | fonctionne, la vignette s'affiche dans la cellule |
| `#ask` sur les **fichiers**, `[[-Main_image::+]]`, `format=gallery` | **fonctionne, et c'est la forme retenue** |

**Forme retenue : la propriété inversée `[[-Main_image::+]]`.** Elle interroge
les fichiers — « les photos qui sont la photo principale de quelque chose » —
donc `format=gallery` fonctionne nativement, sans détour. Elle satisfait aussi
la contrainte demandée : les deux requêtes portent bien le même filtre
`[[Category:Photo de plantation]] [[Image_location::<lieu>]]`.

C'est le même patron d'inversion que celui déjà employé pour le compte
d'espèces distinctes en tâche 9, et il vaut d'être noté : **une propriété
portée « à l'envers » de ce qu'on veut afficher n'oblige pas à changer le
modèle de données, elle oblige à inverser la requête.**

### Structure posée sur chacun des trois lieux

1. **Photos principales** — `[[-Main_image::+]]`, `format=gallery`, encadrée
   d'un `#ifexpr` sur un `format=count` préalable :
   ```
   {{#ifexpr: {{#ask: … [[-Main_image::+]] |format=count}} > 0 | <galerie> | ''Aucune photo principale choisie pour ce lieu.'' }}
   ```
   C'est exactement le contournement consigné en tâche 10 pour le `default=`
   inerte en `format=gallery` — première mise en œuvre réelle. À noter :
   `{{#if:}}` **ne convient pas** ici, `format=count` rendant `0`, une chaîne
   non vide que `#if` tient pour vraie ; il faut `#ifexpr` et une comparaison
   numérique.
2. **Autres photos** — dans un `<div class="mw-collapsible mw-collapsed">`,
   titre en gras, contenu dans un `<div class="mw-collapsible-content">`.

### Limite assumée, écrite sur la page elle-même

**Semantic MediaWiki n'a pas d'opérateur de négation.** Le bloc replié ne peut
donc pas exclure la photo principale : il contient toutes les photos du lieu.
Deux syntaxes candidates testées avant de conclure, aucune ne convient :

- `[[-Main_image::!+]]` — rend **le même résultat que `+`** (1 sur 45 au moment
  du test) : le `!` est absorbé sans erreur ni effet. Piège silencieux.
- `[[!-Main_image::+]]` — erreur SMW explicite (« contient un caractère « ! »
  répertorié comme faisant partie du libellé de la propriété ») et la requête
  rend les 45.

Plutôt que de laisser le titre mentir, une ligne en italique est écrite dans
le bloc : *« Toutes les photos du lieu, la photo principale comprise :
Semantic MediaWiki ne sait pas exclure une valeur d'une requête. »* Le titre
demandé, « Autres photos », est conservé.

## Vérification après purge

`action=parse&prop=text` sur la page publiée :

- **Tableaux de plantations : 29 / 6 / 5** — inchangés, la modification n'a
  pas touché aux requêtes de la tâche 9.
- **3 blocs `mw-collapsible mw-collapsed`**, chacun avec son
  `mw-collapsible-content`.
- **3 galeries « Autres photos » : 12 / 12 / 5 vignettes** (les deux premières
  plafonnées par `limit=12`).
- **3 fois « Aucune photo principale choisie pour ce lieu. »** — attendu et
  correct : aucune `Main_image` n'est renseignée, comme demandé. Ces trois
  messages deviendront des galeries dès que Cyril fera ses choix, sans
  retoucher la page.
- Aucun lien rouge, aucune erreur d'expression, section *Chiffres* intacte
  (37 / 1 / 0 / 1 / 0, total 40, 30 espèces).
- `jquery.makeCollapsible` présent dans `RLPAGEMODULES` de la page réelle :
  le repli est actif pour un lecteur.

## Nettoyage

Le bac à sable a porté deux séries de tests (`mw-collapsible`, puis un
`#set` réel de `Main_image` pour valider le stockage et l'inversion). Il est
**restauré à son contenu d'origine** (revid 737) et `browsebysubject` confirme
qu'il ne porte plus que `_MDAT` et `_SKEY` : **plus aucune `Main_image`
stockée nulle part**, ce qui importait — le fait de test faisait remonter
« 1 photo principale » dans les requêtes du point 3 tant qu'il existait.

---

# Tâche 12 (suite) — doublon du bloc replié : trois formes testées, aucune retenue

**Décision : l'état actuel est conservé.** La page d'avancement n'a pas été
modifiée (elle reste à la revid 740), et la phrase qui explique le doublon
reste en place. Les trois formes proposées ont été testées sur des données
réelles avant de conclure — aucune ne tient, et deux échouent sur un point de
principe, pas de réglage.

Rappel de l'objectif : exprimer le complément **par construction** — « les
photos des plantations sans photo principale, plus les photos surnuméraires
des autres » — et non par négation.

## (b) `[[Main_image::!+]]` — la forme la plus prometteuse, et elle est morte

Testée en premier parce que c'était la seule qui, si elle marchait, donnait
directement la bonne sémantique. Test discriminant possible sans rien écrire :
**aucune plantation ne porte `Main_image`**, donc « plantations sans photo
principale » au Buisson doit valoir **29** si la syntaxe fonctionne, et **0**
si le `!` est absorbé.

| Requête (Buisson de Cerzat) | Résultat | Lecture |
|---|---|---|
| `[[Category:Physical item]] [[Located_at::…]]` | **29** | témoin |
| `… [[Main_image::+]]` | **0** | cohérent : aucune principale choisie |
| `… [[Main_image::!+]]` | **0** | ✗ devrait valoir 29 |
| `… [[!Main_image::+]]` | **29 + erreur SMW** | ✗ condition ignorée |

`[[Main_image::!+]]` rend 0 : le `!` n'est pas interprété comme « propriété
absente », il restreint comme `+`. `[[!Main_image::+]]` produit une erreur
explicite (« contient un caractère « ! » répertorié comme faisant partie du
libellé de la propriété ») et la condition est **purement ignorée** — la
requête rend les 29, ce qui aurait pu passer pour un succès si l'on n'avait
pas lu le message. **Semantic MediaWiki 4.2.0 sur ce wiki n'a aucune forme de
« propriété absente ».** C'est la conclusion générale, valable au-delà de
cette tâche.

## (a) `limit` puis `offset` — la prémisse est fausse deux fois

La forme suppose « si l'ordre est stable et identique entre les deux ». Il ne
l'est pas :

1. **Par construction, les deux requêtes n'ont pas le même ensemble de
   résultats.** La première est filtrée par `[[-Main_image::+]]`, la seconde
   non : la première n'est pas le préfixe de la seconde, c'est un
   sous-ensemble dispersé. Un `offset=N` sur la seconde saute les N premières
   de *sa* liste, pas les N principales — il masquerait des photos ordinaires
   et laisserait passer les principales.
2. **Même l'ordre n'est pas discriminant.** `sort=Image_date` sur les
   45 photos du Buisson : **38 portent la même date (8 août 2026)** et 7 la
   date du 7 août. Le tri est donc à égalité sur 38 valeurs, et l'ordre à
   l'intérieur du bloc est ce que rend le moteur, sans garantie. Une photo
   principale choisie par Cyril tomberait n'importe où dans ce bloc.

Vérifié sur le rendu réel des 16 premières lignes : toutes datées du 8 août.

## (c) `format=template` avec comparaison — le primitif marche, la forme non

Testé en bac à sable, avec un fait `Main_image` réel posé puis retiré :

```
{{#show: <page> |?Main_image |link=none}}  →  Fichier:ECL-Buisson Cerzat-Hysope-2026-08-08 01.jpg
{{#ifeq: <ce résultat> | <nom complet du fichier> | OUI | NON }}  →  OUI
```

Le mécanisme est donc réalisable : `#show` rend bien le nom préfixé, et la
comparaison au nom de page du fichier est exacte. `|link=none` est
indispensable — sans lui, `#show` rend l'**image** (la valeur étant une page
de l'espace `Fichier:`) et la comparaison porterait sur du HTML.

Trois raisons de ne pas le retenir, la première étant rédhibitoire :

1. **20 photos sur 65 ont un `Depicts_specimen` multivalué** (16 à deux
   valeurs, 4 à trois — Poireau perpétuel, Miscanthus, Ail éléphant, la photo
   Menthe/Chayote). Le modèle recevrait plusieurs plantations et n'aurait pas
   *une* `Main_image` à comparer. Il faudrait afficher la photo si elle
   diffère de la principale de *chacune* — une boucle sur une valeur
   multivaluée à l'intérieur d'un modèle de résultat. Ce n'est plus une
   comparaison, c'est un traitement.
2. **Un `#show` par photo**, soit ~64 sous-requêtes pour les trois lieux
   aujourd'hui, et davantage à chaque photo ajoutée — sur une page dont la
   raison d'être est de grossir.
3. **`format=template` ne rend pas une galerie** : il faudrait produire à la
   main le balisage que `format=gallery` donne gratuitement.

Un mécanisme qu'on ne peut pas valider aujourd'hui, de surcroît : tant
qu'aucune `Main_image` n'est renseignée — et c'est le cas voulu, le choix
revient à Cyril — la branche « les noms diffèrent » ne peut être exercée sur
les données réelles. Le mettre en production reviendrait à livrer non testé.

## Ce qui reste en place

Le bloc replié affiche toutes les photos du lieu, sous le titre « Autres
photos », avec la ligne en italique qui le dit. Le doublon est une photo par
lieu au maximum, une fois les choix faits : un défaut mineur, visible et
expliqué, plutôt qu'une mécanique fragile posée à trois jours de la réunion.

**Si la question revient plus tard**, la voie la moins mauvaise n'est aucune
des trois : ce serait une seconde propriété booléenne posée par le même
formulaire (« cette photo est la principale »), portée par le fichier — ce qui
rendrait le complément exprimable par `[[Est_principale::non]]`, une valeur
présente, jamais une absence. Coût : un champ de plus à tenir cohérent avec
`Main_image`, donc deux sources de vérité pour un même fait. À ne faire que si
le doublon devient gênant à l'usage.

## Hygiène

Le bac à sable a servi aux tests (b) et (c), avec un `#set` réel de
`Main_image`. **Restauré à son contenu d'origine** (revid 742), et vérifié
ensuite que `{{#ask: [[Main_image::+]] |format=count}}` rend **0** sur
l'ensemble du wiki : aucun fait de test ne subsiste, la page d'avancement
n'est pas polluée.
