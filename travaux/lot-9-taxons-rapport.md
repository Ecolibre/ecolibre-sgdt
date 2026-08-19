# Lot 9 — Complément : `Taxon_name` botanique sur les 30 items organiques

## Écart d'énoncé, tranché sans demander

La consigne annonçait « 20 items » mais la liste en comptait **21** (Ail
éléphant, ajouté en fin de liste), et le contrôle final demandé disait
« 21 renseignés, 9 vides ». 21 + 9 = 30 = le nombre d'items organiques
végétaux. C'est donc le titre qui glissait, pas la liste : les 21 ont été
traités.

Effectif vérifié en ligne : `Category:Organic item` compte **33** membres, dont
3 non végétaux (`Bidon 220L`, `Cuve de récupération d'eau`, `Transfert d'eau
par vases communicants`) — **30 plantes**, exactement les 30 transclusions de
`Modèle:Organic facet plant`.

## 1. Les 21 noms botaniques — écrits et vérifiés

Valeur **remplacée**, jamais ajoutée : substitution sur `|Taxon_name=` dans
l'appel de `{{Organic facet plant}}`, une seule occurrence par page.
**21/21 en `Success`** (revids 743 à 763).

Résumé d'édition, identique sur les 21 :
`[Lot 9][Complément] Taxon_name — remplacement du nom courant par le nom
botanique ; source : nomenclature botanique établie, aucune base de données
particulière`

### Le signe multiplication passe intact

Trois valeurs portent le signe hybride : `Symphytum × uplandicum`,
`Mentha × piperita var. citrata`, `Allium × proliferum`.

Contrôlé **avant** écriture (les trois sources sont bien U+00D7, `0xd7`, pas la
lettre `x`) **et après**, sur la valeur telle que stockée par SMW
(`browsebysubject`) : les trois rendent `ord(c) == 0xd7`, et aucune ne contient
de ` x ` isolé. Le caractère traverse donc sans dommage la chaîne
fichier → `wiki-put.sh` → MediaWiki → magasin SMW.

## 2. Les 9 vidés — mais pas avant d'avoir corrigé la garde du modèle

### Le problème trouvé avant d'écrire

`Modèle:Organic facet plant` gardait **tout** son bloc derrière
`{{#if:{{{Taxon_name|}}}|` — le `#set` des 37 propriétés, l'émission
d'`Item_facet::Facette végétal` **et** `[[Category:Item à facette végétal]]`.

Vider `Taxon_name` sur les 9 les aurait donc silencieusement **sortis de la
facette végétale** : 9 plantes disparaissant de toute requête de facette, sans
erreur ni trace. Signalé avant toute écriture, arbitré par Cyril.

### Motif de la correction, tel qu'arrêté

Le `#if` sur `Taxon_name` confondait deux choses différentes : « le bloc est
vide » et « le nom scientifique est inconnu ». Ces 9 items **sont** des
plantes ; ignorer leur binôme ne les fait pas sortir de la facette. Le gabarit
Page Forms étant à instance optionnelle (`minimum instances=0`), **la présence
de l'appel de modèle suffit** à signifier que la facette s'applique — c'est la
garde correcte.

Émission rendue **inconditionnelle**, et non déplacée sur un autre champ :
contrairement à `Specimen_status` au niveau physique, **aucune** des 37
propriétés du bloc organique n'est garantie, donc aucune ne peut servir de
garde. Le motif est écrit en commentaire dans le modèle lui-même, pour qu'il
survive à l'édition suivante.

`Modèle:Organic facet plant`, revid 764, résumé `[Correctif]` — bug de modèle
préexistant, sans numéro de lot.

### Les trois comptages, tous identiques

Le risque de l'émission inconditionnelle était l'inverse du précédent : faire
**entrer** dans la facette un item qui aurait l'appel de modèle sans rien
dedans. Contrôlé par liste complète, pas seulement par total.

| Moment | Membres de `Category:Item à facette végétal` | Liste identique à la référence |
|---|---|---|
| **Avant** toute écriture | **70** | référence |
| Après correction de la garde + purge des 30 | **70** | **oui** — 0 entré, 0 sorti |
| Après vidage des 9 + purge des 30 | **70** | **oui** — 0 entré, 0 sorti |

Relevé de référence pris avant d'écrire, comme demandé : les 70 titres, plus
la liste des **30/30** items organiques portant `Item_facet`. La comparaison
finale est faite titre à titre, pas sur le total — un total identique peut
masquer une entrée et une sortie qui se compensent.

Aucun item n'est entré : les 30 transclusions de `Modèle:Organic facet plant`
étaient déjà toutes dans la catégorie avant la correction, il n'existait donc
aucun appel « vide » à faire entrer.

### Écriture des 9

**9/9 en `Success`** (revids 765 à 773). Résumé :
`[Lot 9][Complément] Taxon_name vidé — le nom courant n'est pas un taxon et
une valeur fausse est pire qu'absente ; source de référence : nomenclature
botanique établie, aucune base de données particulière`

## 3. Vérification finale sur les 30

`browsebysubject`, page par page :

- **21/21** portent le nom botanique attendu, valeur exacte.
- **9/9** ne portent plus aucun `Taxon_name`.
- **0 écart.**
- **30/30 portent toujours `Item_facet`** — y compris les 9 vidés, ce qui était
  tout l'objet de la correction de garde.

## 4. `Limites connues` — deux entrées ajoutées (n° 24 et 25)

1. **SMW 4.2.0 n'exprime ni la négation ni l'absence de propriété.**
   `[[X::!+]]` rend zéro résultat au lieu des pages dépourvues de `X` —
   vérifié sur `Main_image` : **0 au lieu de 29**, sans erreur ni
   avertissement. `[[!X::+]]` produit une erreur explicite **et la condition
   est purement ignorée**, la requête rendant l'ensemble non filtré — ce qui
   peut passer pour un succès si l'on ne lit pas le message. Parade
   consignée : matérialiser le complément par une propriété **positive**, pas
   chercher une négation.
2. **Conséquence acceptée sur `Avancement du jardin-forêt`** : le bloc replié
   « Autres photos » contient aussi la photo principale, avec le rappel des
   trois contournements testés et écartés.

Une précision a aussi été ajoutée à l'entrée existante sur le `default=` en
`format=gallery` : `{{#if:}}` ne convient pas comme garde, `format=count`
rendant `0` — chaîne non vide, donc vraie pour `#if` ; il faut `#ifexpr`.

## 5. Deux défauts que j'ai introduits, et corrigés

Signalés parce qu'ils relèvent d'un même piège, et qu'il vaut mieux qu'il soit
connu que tu.

**a. Une syntaxe de requête citée en exemple est *exécutée*, pas affichée.**
Les `[[X::!+]]`, `[[!X::+]]` et `[[Main_image::!+]]` que j'avais écrits dans
des balises `<code>` ont été interprétés par SMW comme de vraies annotations :
`browsebysubject` sur la page montrait `X -> !+` et `Main_image -> !+`.
`<code>` protège l'affichage, **pas** l'analyseur. Le fait `Main_image` était
le plus nuisible : il faisait remonter la page *Limites connues* à 1 dans
`{{#ask: [[Main_image::+]] |format=count}}`, alors que la valeur juste est 0.

Corrigé en `[Correctif]` (revid 775) : les quatre syntaxes enveloppées de
`<nowiki>`. **Dont une préexistante** — l'entrée n° 8 citait
`[[Item_ref::+]]` en clair depuis sa rédaction et créait le fait
`Item_ref -> +` sur la page ; corrigée au passage.

**b. Une fonction d'analyseur citée en exemple est exécutée elle aussi.**
Mon `{{#ifexpr: … > 0}}` d'illustration s'évaluait réellement et produisait
« Erreur d'expression : caractère de ponctuation « … » non reconnu » dans le
rendu. Corrigé en `[Correctif]` (revid 776), avec les deux `{{#if:}}` de la
même entrée.

**Leçon** : sur les pages de documentation, tout exemple de syntaxe wiki ou
SMW doit être enveloppé de `<nowiki>`, et le contrôle après écriture doit
inclure `browsebysubject` **sur la page de documentation elle-même** — une
page qui décrit le modèle de données peut le polluer.

État final vérifié : 24 entrées, **0 erreur d'expression, 0 lien rouge, aucun
fait parasite** (la page ne porte plus que `_MDAT` et `_SKEY`), et
`{{#ask: [[Main_image::+]] |format=count}}` est revenu à **0**.
