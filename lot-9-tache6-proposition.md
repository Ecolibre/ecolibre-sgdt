# Lot 9 — Tâche 6 — Proposition (classe Lieu)

**Rien n'est écrit.** Cinq pages proposées ci-dessous : `Catégorie:Lieu`,
`Modèle:Lieu`, et trois pages de lieu. Vérifié en ligne le 15 août 2026 :
aucune des cinq n'existe (`createonly=1` ne trouvera aucun conflit).

## Rappels tranchés, non rouverts ici

- Maps n'est pas installée (tâche 0-bis) → repli en deux propriétés `Number`,
  `Latitude`/`Longitude`, déjà créées en tâche 1 et vérifiées ci-dessous par
  `browsebysubject`.
- Précision des coordonnées (§5 point 2 de l'amendement 1, laissé ouvert) :
  les six décimales fournies dans la consigne (`45.171420`, `3.488276`, etc.)
  tranchent de fait la question — reprises telles quelles, sans arrondi ni
  recalcul de centroïde. Cohérent avec `Property_description_FR` de
  `Latitude`/`Longitude`, déjà rédigée comme un choix par lieu et non une
  règle unique.
- Pas de formulaire, pas de référence Base36 (décision de l'amendement 1).
- `Located_in` vide sur les trois pages.

## Vérification faite avant d'écrire ce document

**`default=` d'un `#ask` en `format=gallery` ne s'affiche pas** (constaté
tâche 5, `Test 260915a`). Testé en direct par `action=parse` (lecture seule,
aucune sauvegarde) avec une catégorie qui n'existe pas, pour isoler le
comportement du `format` seul :

```
{{#ask: [[Category:ZZZ_Test_Inexistant_9999]] |format=list|default=AUCUN RESULTAT TEST XYZ}}
```

Rendu obtenu : `<p>AUCUN RESULTAT TEST XYZ</p>` — le texte par défaut
s'affiche normalement. **Retenu d'abord `format=list`**, plutôt que
`gallery`, précisément parce que celui-ci a l'anomalie et celui-là non,
vérifié et non supposé.

**Corrigé en `format=ul` sur demande de Cyril**, avec `sort=Planting_rank` et
`order=asc` ajoutés. Revérifié en direct, même méthode :

```
{{#ask: [[Category:ZZZ_Test_Inexistant_9999]] |format=ul|sort=Planting_rank|order=asc|default=AUCUN RESULTAT TEST XYZ}}
```

Rendu obtenu : `<p>AUCUN RESULTAT TEST XYZ</p>` — inchangé, `default=`
s'affiche toujours en `format=ul` comme en `format=list`. Retenu :
`format=ul` avec tri par `Planting_rank`.

## Propriétés existantes, vérifiées par `browsebysubject`

| Propriété | Type SMW | Domaine | Cardinalité |
|---|---|---|---|
| `Place_name` | Texte (`_txt`) | Lieu | single |
| `Postal_address` | Texte (`_txt`) | Lieu | single |
| `Latitude` | Nombre (`_num`) | Lieu | single |
| `Longitude` | Nombre (`_num`) | Lieu | single |
| `Located_in` | Page (`_wpg`) | Lieu | single |
| `Located_at` | Page (`_wpg`) | Physical item | single |

Aucune à créer, toutes déjà en place depuis la tâche 1.

## Rattachement de `Catégorie:Lieu` — validé par Cyril

Les quatre catégories de la chaîne (`Physical item`, `Referenced item`,
`Organic item`, `Functional item`) sont toutes filles de
`[[Catégorie:Item SGDT]]`. La décision 1.4 de l'amendement 1 dit explicitement
que le lieu est **hors de la chaîne à quatre niveaux**. `Catégorie:Lieu` se
rattache à `[[Catégorie:SGDT]]` (le parent commun, un cran au-dessus), pas à
`Catégorie:Item SGDT`, pour ne pas laisser sous-entendre que Lieu est une
cinquième classe d'item — exactement ce que l'amendement 1 §1.4 écarte
(« Ce n'est pas la cinquième classe que le projet diffère »).

---

## 1. `Catégorie:Lieu`

```wikitext
== Définition ==

Une entité physique stable — terrain, bâtiment, pièce — qui héberge zéro, un
ou plusieurs items physiques. Un lieu n'a ni fonction à remplir, ni solution
qui la remplit, ni route d'approvisionnement, ni niveau de maturité : ce n'est
pas une cinquième classe de la chaîne fonctionnel → organique → référencé →
physique, c'est une entité de localisation, à part.

Un lieu peut avoir un lieu parent unique (`Located_in`), à la différence de
`Part_of` qui est multivaluée sur les classes de conception. Un item physique
s'y rattache par `Located_at`, jamais par `Part_of` : un plant n'est pas un
composant de son terrain, il s'y trouve.

'''`Located_at` et `physical_parent` ne se confondent pas''', alors que la
classe physique porte les deux : `physical_parent` (champ du formulaire
physique, alimente `Part_of`) dit « installé dans » et pointe vers un autre
item physique — une pompe dans une machine. `Located_at` dit « se trouve à »
et pointe vers un lieu — la machine sur son site. Un item physique peut
renseigner l'un, l'autre, les deux, ou aucun ; jamais l'un à la place de
l'autre.

Cette catégorie est posée automatiquement par [[:Modèle:Lieu|Modèle:Lieu]].
Elle ne doit jamais être ajoutée à la main : elle vaut appartenance à la
classe, pas navigation.

== Position dans le modèle ==

Hors chaîne. Ne descend d'aucune des quatre classes de conception et n'en a
aucune comme parente ; seul [[Attribut:Located at|Located_at]] relie un item
physique à un lieu.

== Champs ==

`Place_name` ne recopie pas le titre de la page : elle sert uniquement aux
lieux dont le nom d'usage diffère du titre (abréviation, nom local, alias).
Laissée vide, la page affiche le titre par défaut — inutile de la dupliquer
quand les deux coïncident.

[[Catégorie:SGDT]]
```

## 2. `Modèle:Lieu`

Mêmes conventions visuelles que `Modèle:Physical facet plant` : wikitable,
en-têtes de section `colspan="2"` fond `#dfe8d8`, lignes d'étiquette
`#f2f2f2`, cellules vides explicites (`''non renseigné(e)''` / `''—''` selon
la nature du champ, même logique que `Planted_count` vs `Propagated_from`
dans ce modèle de référence). Exception délibérée : `Place_name` vide
n'affiche pas `''non renseigné''` mais `{{PAGENAME}}`, conformément à la
correction de Cyril — l'absence n'y est pas une donnée manquante, c'est le
cas normal quand le nom d'usage égale le titre.

```wikitext
<noinclude>
{{Documentation}}
</noinclude>
<includeonly>
{{#set:
|Place_name={{{Place_name|}}}
|Postal_address={{{Postal_address|}}}
|Latitude={{{Latitude|}}}
|Longitude={{{Longitude|}}}
|Located_in={{{Located_in|}}}
}}

{| class="wikitable" style="width:100%"
|+ Lieu
! colspan="2" style="background:#dfe8d8; text-align:left;" | Identification
|-
! style="background:#f2f2f2; width:30%;" | Nom d'usage
| {{#if:{{{Place_name|}}}|{{{Place_name}}}|{{PAGENAME}}}}
|-
! style="background:#f2f2f2; width:30%;" | Adresse postale
| {{#if:{{{Postal_address|}}}|{{{Postal_address}}}|''non renseignée''}}
|-
! colspan="2" style="background:#dfe8d8; text-align:left;" | Coordonnées
|-
! style="background:#f2f2f2; width:30%;" | Latitude
| {{#if:{{{Latitude|}}}|{{{Latitude}}}|''non renseignée''}}
|-
! style="background:#f2f2f2; width:30%;" | Longitude
| {{#if:{{{Longitude|}}}|{{{Longitude}}}|''non renseignée''}}
|-
! colspan="2" style="background:#dfe8d8; text-align:left;" | Filiation
|-
! style="background:#f2f2f2; width:30%;" | Lieu parent
| {{#if:{{{Located_in|}}}|[[{{{Located_in}}}]]|''—''}}
|-
! colspan="2" style="background:#dfe8d8; text-align:left;" | Items physiques à ce lieu
|-
! style="background:#f2f2f2; width:30%;" | Présents ici
|
{{#ask: [[Category:Physical item]] [[Located_at::{{FULLPAGENAME}}]]
 |format=ul
 |sort=Planting_rank
 |order=asc
 |default=''Aucun item physique rattaché à ce lieu.''
}}
|}

[[Category:Lieu]]
</includeonly>
```

Filtre de catégorie sur la requête inverse conforme à la décision 1.9 (toute
requête portant sur une facette/relation porte un filtre de classe) :
`[[Category:Physical item]] [[Located_at::{{FULLPAGENAME}}]]`, jamais
`Located_at` seul. `format=ul` retenu (voir vérification ci-dessus), triée
par `Planting_rank` croissant.

## 3. Les trois pages de lieu

```wikitext
{{Lieu
|Place_name=
|Postal_address=
|Latitude=45,171420
|Longitude=3,488276
|Located_in=
}}
```

```wikitext
{{Lieu
|Place_name=
|Postal_address=
|Latitude=45,155040
|Longitude=3,437188
|Located_in=
}}
```

```wikitext
{{Lieu
|Place_name=
|Postal_address=
|Latitude=45,155265
|Longitude=3,437144
|Located_in=
}}
```

`Postal_address` laissée vide : aucune adresse fournie dans la consigne, et
rien dans la tâche ne demande de la déduire ou de l'inventer. `Place_name`
laissée vide sur les trois : le nom d'usage égale le titre de page dans les
trois cas, donc redondant à saisir (correction de Cyril, voir `Champs`
ci-dessus).

**Virgule décimale, pas point.** Les valeurs de la consigne (`45.171420`,
etc.) utilisent le point ; le type `Number` de SMW sur ce wiki, en locale FR,
ne l'accepte pas. Écrit d'abord avec un point aux trois pages : `#set` a
silencieusement échoué sur `Latitude`/`Longitude` — aucune propriété stockée,
aucune exception API, seul un avertissement SMW en tête de page rendue à la
révision initiale. Repéré à la vérification post-écriture, pas avant : voir
le rapport de tâche pour le détail du diagnostic et la correction appliquée
en deuxième révision. Les trois pages ci-dessus reflètent la version
corrigée, virgule, effectivement en place sur le wiki.

---

Les trois corrections de Cyril (rattachement `Catégorie:SGDT`, `format=ul` +
tri, `Place_name` vide + distinction `Located_at`/`physical_parent`) sont
intégrées ci-dessus. Prêt pour écriture.
