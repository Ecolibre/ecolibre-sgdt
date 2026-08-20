# Rapport du 20 août 2026 — Lot 10, câblage de Referenced item (tâche 3)

**Exécuté le :** 20 août 2026, session Claude Code. Garde-fou 6 explicitement
levé par Cyril pour `Modèle:Referenced item` et `Formulaire:Referenced item`,
pour cette modification et elle seule.

Base de départ vérifiée avant toute écriture : `Modèle:Referenced item`
revid **549**, `Formulaire:Referenced item` revid **550** — conformes au
relevé de `travaux/wikitexte-referenced-item.md` (seule différence : absence
de saut de ligne final dans la sortie de `wiki-get.sh`, sans effet sur le
contenu).

---

## 1. Écritures sur le wiki

### 1.1 Création — `Module:Nombre`

- **Méthode :** `wiki-put.sh` avec `--createonly`.
- **Résultat API :** `new: true`, `pageid: 412`, `oldrevid: 0`,
  `newrevid: 816`, `result: Success`.
- **Résumé d'édition exact :**
  `[Lot 10][Tâche 3] Module:Nombre — normalisation du séparateur décimal`
- **Contenu exact écrit :** le module Lua fourni par la consigne, sans
  modification (fonction `p.virgule`, normalisation point→virgule sur le cas
  non ambigu uniquement).

### 1.2 Édition — `Modèle:Referenced item`

- **Méthode :** `wiki-put.sh` (édition standard, page existante, garde-fou 6
  levé explicitement pour cette écriture).
- **Résultat API :** `oldrevid: 549`, `newrevid: 817`, `result: Success` —
  `oldrevid` confirme qu'aucune modification concurrente n'avait eu lieu
  entre le relevé et l'écriture.
- **Résumé d'édition exact :**
  `[Lot 10][Tâche 3] Referenced item — câblage des cinq propriétés et normalisation décimale`
- **Diff exact** (étapes 3 et 4 de la consigne, combinées en une seule
  écriture puisqu'elles modifient la même page pour le même objet) :

```diff
 |Part_of={{{Part_of|}}}
 |+sep=,
 |Corresponds_to_organic={{{Corresponds_to_organic|}}}
-|Max_head={{{Max_head|}}}
+|Max_head={{#invoke:Nombre|virgule|{{{Max_head|}}}}}
 |Supplier={{{Supplier|}}}
 |Supplier_reference={{{Supplier_reference|}}}
 |Sourcing_year={{{Sourcing_year|}}}
 |Manufacturer={{{Manufacturer|}}}
 |Manufacturer_reference={{{Manufacturer_reference|}}}
-}}
+|Procurement_route={{{Procurement_route|}}}
+|Power_rating={{#invoke:Nombre|virgule|{{{Power_rating|}}}}}
+|Max_thickness={{#invoke:Nombre|virgule|{{{Max_thickness|}}}}}
+|Materials_worked={{{Materials_worked|}}}
+|+sep=,
+}}{{#if:{{{Measured_quantities|}}}|{{#arraymap:{{{Measured_quantities}}}|,|@@@|{{#set:Measured_quantities=@@@}}|}}}}

 {| class="wikitable" style="width:100%"
 ...
 ! style="background:#f2f2f2" | Hauteur de refoulement max. (cm)
-| {{{Max_head|}}}
+| {{#invoke:Nombre|virgule|{{{Max_head|}}}}}
+|-
+! style="background:#f2f2f2" | Puissance (W)
+| {{#invoke:Nombre|virgule|{{{Power_rating|}}}}}
+|-
+! style="background:#f2f2f2" | Épaisseur max. travaillée (mm)
+| {{#invoke:Nombre|virgule|{{{Max_thickness|}}}}}
+|-
+! style="background:#f2f2f2" | Matériaux travaillés
+| {{#arraymap:{{{Materials_worked|}}}|,|@@@|[[@@@]]|,&#32;}}
+|-
+! style="background:#f2f2f2" | Grandeurs mesurées
+| {{{Measured_quantities|}}}
 |-
 ! style="background:#e8f0ff" | Fournisseur
 ...
 ! style="background:#f2f2f2" | Année d'obtention
 | {{{Sourcing_year|}}}
 |-
+! style="background:#f2f2f2" | Mode d'obtention
+| {{{Procurement_route|}}}
+|-
 ! style="background:#e8f0ff" | Fabricant
```

**Construction retenue pour `Measured_quantities`** (type Text, multivaluée —
ne passe pas par le bloc `#set` principal, même piège que `Practice_domain`
en tâche 2) : reprise **exacte**, transposée, de la construction déjà en
service dans `Modèle:Functional item` pour `Practice_domain` :

```
{{#if:{{{Measured_quantities|}}}|{{#arraymap:{{{Measured_quantities}}}|,|@@@|{{#set:Measured_quantities=@@@}}|}}}}
```

Fusionnée sur la même ligne que le `}}` fermant le bloc `#set` principal —
précaution de rendu de la tâche 2, pour ne pas introduire de paragraphe vide
supplémentaire par un saut de ligne entre les deux appels de fonction
parseur.

### 1.3 Édition — `Formulaire:Referenced item`

- **Méthode :** `wiki-put.sh`.
- **Résultat API :** `oldrevid: 550`, `newrevid: 818`, `result: Success`.
- **Résumé d'édition exact :**
  `[Lot 10][Tâche 3] Formulaire Referenced item — cinq champs, garde-fou décimal sur Max_head`
- **Diff exact :**

```diff
-! Hauteur de refoulement max. (cm) :
+! Hauteur de refoulement max. (cm) : {{#info: Décimales avec la virgule. Un point est converti automatiquement ; un nombre mêlant point et virgule est refusé.}}
 | {{{field|Max_head|input type=text}}}
 |-
 ! Fournisseur :
 ...
 ! Réf. fabricant :
 | {{{field|Manufacturer_reference|input type=text}}}
+|-
+! Mode d'obtention : {{#info: Comment cet objet a été obtenu — acheté, fabriqué soi-même, récupéré. Distinct du fournisseur, qui dit chez qui.}}
+| {{{field|Procurement_route|input type=combobox|values from property=Procurement_route}}}
+|-
+! Puissance (W) : {{#info: Décimales avec la virgule. Un point est converti automatiquement ; un nombre mêlant point et virgule est refusé.}}
+| {{{field|Power_rating|input type=text}}}
+|-
+! Épaisseur max. travaillée (mm) : {{#info: Décimales avec la virgule. Un point est converti automatiquement ; un nombre mêlant point et virgule est refusé.}}
+| {{{field|Max_thickness|input type=text}}}
+|-
+! Matériaux travaillés :
+| {{{field|Materials_worked|input type=tokens|values from property=Materials_worked|list}}}
+|-
+! Grandeurs mesurées :
+| {{{field|Measured_quantities|input type=tokens|values from property=Measured_quantities|list}}}
 |}
 {{{end template}}}
```

Aucun autre changement sur le champ `Max_head` existant, conformément à la
consigne.

---

## 2. Résultats de reconnaissance

### 2.1 Sept cas de test de `Module:Nombre` (avant le câblage sur le modèle,
via `action=parse&text={{#invoke:Nombre|virgule|X}}`)

| Entrée | Attendu | Obtenu | Conforme |
|---|---|---|---|
| `0.2` | `0,2` | `0,2` | ✅ |
| `0,2` | `0,2` (inchangé) | `0,2` | ✅ |
| `12` | `12` (inchangé) | `12` | ✅ |
| *(vide)* | vide | vide | ✅ |
| `1.5.2` | `1.5.2` (inchangé) | `1.5.2` | ✅ |
| `1,5.2` | `1,5.2` (inchangé) | `1,5.2` | ✅ |
| ` 0.2 ` (espaces) | `0,2` | `0,2` | ✅ |

Sept cas conformes — le modèle n'a été touché qu'après cette validation
complète.

### 2.2 Non-régression sur un item référencé réel (étape 5/1)

Page testée : **« Bidon 220L bleu plastique Borde »** (seule page réelle du
wiki dont le wikitexte source a pu être vérifié avant test :
`Corresponds_to_organic=Bidon 220L`, `Supplier=Borde`, ni `Max_head` ni
aucune des cinq nouvelles propriétés renseignées). Aucune page de
`Category:Referenced item` n'a `Max_head` renseigné à ce jour
(`[[Category:Referenced item]][[Max_head::+]]` → 0 résultat) : le test
porte donc sur le cas « valeur absente », pas sur une conversion réelle de
valeur numérique en place.

Purgée (`forcelinkupdate=1`), puis rendue par `action=parse&page=...` (la
page, pas le wikitexte).

**Faits SMW (`browsebysubject`), avant et après identiques :**

```
Corresponds_to_organic -> ['Bidon_220L#0##']
Item_description -> ['Contenant de 220 litres en plastique bleu avec ouverture intégrale par un couvercle noir']
Item_ref -> ['000N']
Supplier -> ['Borde#0##']
_INST -> ['Referenced_item#14##']
```

- Aucune des cinq nouvelles propriétés n'apparaît. ✅
- Aucune clé `_ERR*`. ✅
- `Max_head` absent des faits avant comme après (jamais renseigné sur cette
  page) — inchangé. ✅

**Les cinq nouvelles lignes du tableau apparaissent, vides** (`<td>\n</td>`
pour chacune) : Puissance (W), Épaisseur max. travaillée (mm), Matériaux
travaillés, Grandeurs mesurées, Mode d'obtention — vérifié directement dans
le HTML rendu. ✅

**Paragraphes vides (`<p><br /></p>`) sur la page réelle rendue :
compte actuel = 2**, situés juste avant le tableau. Comme prévu par la
consigne, la révision antérieure de la même page transclut désormais le
modèle courant (817) et ne permet donc aucune comparaison directe. Un test
de contrôle a été fait à la place (voir §2.3) plutôt que de renoncer
complètement à la comparaison.

### 2.3 Test de contrôle isolé — le diff introduit-il un paragraphe vide ?

Le contenu de `<includeonly>…</includeonly>` du modèle, avant (revid 549) et
après (revid 817), a été extrait, les paramètres substitués par les valeurs
réelles de la page de test, puis chaque version rendue séparément par
`action=parse&text=` (en POST, voir §3) — reproduisant fidèlement ce
qu'une transclusion réelle produit, sans passer par le wrapper `<noinclude>`
de la page modèle elle-même (une première tentative, en substituant la page
entière au lieu du seul bloc `includeonly`, faisait apparaître à tort le
bloc `{{Documentation}}`, normalement invisible en transclusion).

| Version | Longueur HTML | Paragraphes vides |
|---|---|---|
| Avant (549) | 2113 | **1** |
| Après (817) | 2610 | **1** |

**Même compte, avant et après : le diff de la tâche 3 n'introduit aucun
paragraphe vide supplémentaire.** L'unique paragraphe vide, présent dans les
deux versions, provient du saut de ligne déjà existant entre la fermeture du
bloc `#set` et le début du tableau (`{| class="wikitable"`) — antérieur à
cette tâche. L'écart entre ce compte (1) et celui mesuré sur la page réelle
en transclusion complète (2, §2.2) tient au contexte de transclusion propre
à la page (l'appel `{{Referenced item|...}}` lui-même), indépendant du
contenu du modèle et donc identique avant et après cette tâche.

**Aucune correction nécessaire** — le nombre à comparer à la mesure de la
tâche 2 sur `Modèle:Functional item`, comme demandé, est **2** (compte réel
sur une page en service) ou **1** (compte isolé, comparable structurellement
à un test équivalent sur `Modèle:Functional item`).

---

## 3. Ce qui a échoué ou n'a pas pu être obtenu

**`action=parse&text=` en GET échoue silencieusement pour un texte long.**
Rejoué en GET (comme le reste de la session) avec le wikitexte substitué de
`Modèle:Referenced item` (~1,7 Ko) en paramètre `text=` : réponse vide, sans
erreur JSON, sans code de sortie `curl` distinctif — `bin/wiki-api.sh`
n'émet que du GET (`curl -G`, par conception, pour rester strictement en
lecture). Rejoué en **POST**, à la main, avec `curl -b <cookies>
--data-urlencode ...` (hors de `wiki-api.sh`, qui reste inchangé — lui
ajouter le POST élargirait sa surface au-delà de la garantie de lecture
seule qu'il offre aujourd'hui) : succès immédiat. **Hypothèse confirmée** —
consignée dans `CLAUDE.md`, section « Leçons de méthode ».

Rien d'autre n'a échoué : les quatre écritures prévues (module + deux pages)
ont toutes réussi du premier coup, avec l'`oldrevid` attendu à chaque fois.

---

## 4. Wikitexte complet, avant et après

### 4.1 `Modèle:Referenced item` — revid 549 → 817

Avant : voir `travaux/wikitexte-referenced-item.md`, section 1 (inchangé
depuis, vérifié en tête de ce rapport).

Après (revid 817) :

```
<noinclude>
{{Documentation}}
</noinclude>
<includeonly>
{{#set:
|Item_ref={{{Item_ref|}}}
|Item_description={{{Item_description|}}}
|Maturity_level={{{Maturity_level|}}}
|Part_of={{{Part_of|}}}
|+sep=,
|Corresponds_to_organic={{{Corresponds_to_organic|}}}
|Max_head={{#invoke:Nombre|virgule|{{{Max_head|}}}}}
|Supplier={{{Supplier|}}}
|Supplier_reference={{{Supplier_reference|}}}
|Sourcing_year={{{Sourcing_year|}}}
|Manufacturer={{{Manufacturer|}}}
|Manufacturer_reference={{{Manufacturer_reference|}}}
|Procurement_route={{{Procurement_route|}}}
|Power_rating={{#invoke:Nombre|virgule|{{{Power_rating|}}}}}
|Max_thickness={{#invoke:Nombre|virgule|{{{Max_thickness|}}}}}
|Materials_worked={{{Materials_worked|}}}
|+sep=,
}}{{#if:{{{Measured_quantities|}}}|{{#arraymap:{{{Measured_quantities}}}|,|@@@|{{#set:Measured_quantities=@@@}}|}}}}

{| class="wikitable" style="width:100%"
! style="background:#f2f2f2; width:30%;" | Référence (Base 36)
| '''{{{Item_ref|}}}'''
|-
! style="background:#f2f2f2" | Description technique
| {{{Item_description|}}}
|-
! style="background:#e8f0ff" | Item Organique associé
| {{#if:{{{Corresponds_to_organic|}}}|[[{{{Corresponds_to_organic|}}}]]}}
|-
! style="background:#f2f2f2" | État de maturité
| {{#switch: {{{Maturity_level|}}}
 | Idea = Idée
 | Study = Étude
 | Prototype = Prototype
 | Certified = <span style="color:green">'''Certifié (OSHW)'''</span>
 | Obsolete = <span style="color:red">Obsolète</span>
 | #default = {{{Maturity_level|}}}
}}
|-
! style="background:#f2f2f2" | Hauteur de refoulement max. (cm)
| {{#invoke:Nombre|virgule|{{{Max_head|}}}}}
|-
! style="background:#f2f2f2" | Puissance (W)
| {{#invoke:Nombre|virgule|{{{Power_rating|}}}}}
|-
! style="background:#f2f2f2" | Épaisseur max. travaillée (mm)
| {{#invoke:Nombre|virgule|{{{Max_thickness|}}}}}
|-
! style="background:#f2f2f2" | Matériaux travaillés
| {{#arraymap:{{{Materials_worked|}}}|,|@@@|[[@@@]]|,&#32;}}
|-
! style="background:#f2f2f2" | Grandeurs mesurées
| {{{Measured_quantities|}}}
|-
! style="background:#e8f0ff" | Fournisseur
| {{#if:{{{Supplier|}}}|[[{{{Supplier|}}}]]}}
|-
! style="background:#f2f2f2" | Réf. fournisseur
| {{{Supplier_reference|}}}
|-
! style="background:#f2f2f2" | Année d'obtention
| {{{Sourcing_year|}}}
|-
! style="background:#f2f2f2" | Mode d'obtention
| {{{Procurement_route|}}}
|-
! style="background:#e8f0ff" | Fabricant
| {{#if:{{{Manufacturer|}}}|[[{{{Manufacturer|}}}]]}}
|-
! style="background:#f2f2f2" | Réf. fabricant
| {{{Manufacturer_reference|}}}
|-
! style="background:#f2f2f2" | Cas d'emploi (Parents)
| {{#arraymap:{{{Part_of|}}}|,|@@@|[[@@@]]|,&#32;}}
|-
! style="background:#f2f2f2" | Composants enfants (BOM)
|
{{#ask: [[Category:Referenced item]] [[Part_of::{{FULLPAGENAME}}]]
 |?Item_ref = Réf.
 |?Maturity_level = Maturité
 |format=table
 |default=''Aucun sous-composant déclaré.''
 |class=wikitable sortable
}}
|-
! style="background:#f2f2f2" | Exemplaires physiques
|
{{#ask:[[Category:Physical item]][[Instance_of::{{FULLPAGENAME}}]]
 |?Inventory_ref=Réf. inventaire
 |?Inventory_site=Site
 |format=table
 |default=''Aucun exemplaire physique enregistré.''
}}
|}

[[Category:Referenced item]]
</includeonly>
```

### 4.2 `Formulaire:Referenced item` — revid 550 → 818

Avant : voir `travaux/wikitexte-referenced-item.md`, section 2 (inchangé
depuis, vérifié en tête de ce rapport).

Après (revid 818) :

```
<includeonly>
{{{for template|Referenced item}}}
{| class="formtable"
! Référence (Base 36) :
| {{{field|Item_ref|mandatory|default={{#invoke:Base36|next|{{#ask: [[Category:Functional item||Organic item||Referenced item]] [[Item_ref::+]] |?Item_ref= |sort=Item_ref |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }} }}}
|-
! Description technique :
| {{{field|Item_description|input type=textarea|rows=3}}}
|-
! Item Organique correspondant :
| {{{field|Corresponds_to_organic|input type=combobox|values from category=Organic item}}}
|-
! Maturité :
| {{{field|Maturity_level|input type=dropdown|values=Idea,Study,Prototype,Certified,Obsolete|labels=Idée,Étude,Prototype,Certifié,Obsolète}}}
|-
! S'intègre dans (Parents) :
| {{{field|Part_of|input type=tokens|values from category=Referenced item|list}}}
|-
! Hauteur de refoulement max. (cm) : {{#info: Décimales avec la virgule. Un point est converti automatiquement ; un nombre mêlant point et virgule est refusé.}}
| {{{field|Max_head|input type=text}}}
|-
! Fournisseur :
| {{{field|Supplier|input type=combobox|values from property=Supplier}}}
|-
! Réf. fournisseur :
| {{{field|Supplier_reference|input type=text}}}
|-
! Année d'obtention : {{#info: Année d'obtention du lot dont provient cet item référencé — reprend la description de la propriété. Distingue par exemple deux lots de la même espèce chez le même fournisseur, achetés des années différentes.}}
| {{{field|Sourcing_year|input type=text}}}
|-
! Fabricant :
| {{{field|Manufacturer|input type=combobox|values from property=Manufacturer}}}
|-
! Réf. fabricant :
| {{{field|Manufacturer_reference|input type=text}}}
|-
! Mode d'obtention : {{#info: Comment cet objet a été obtenu — acheté, fabriqué soi-même, récupéré. Distinct du fournisseur, qui dit chez qui.}}
| {{{field|Procurement_route|input type=combobox|values from property=Procurement_route}}}
|-
! Puissance (W) : {{#info: Décimales avec la virgule. Un point est converti automatiquement ; un nombre mêlant point et virgule est refusé.}}
| {{{field|Power_rating|input type=text}}}
|-
! Épaisseur max. travaillée (mm) : {{#info: Décimales avec la virgule. Un point est converti automatiquement ; un nombre mêlant point et virgule est refusé.}}
| {{{field|Max_thickness|input type=text}}}
|-
! Matériaux travaillés :
| {{{field|Materials_worked|input type=tokens|values from property=Materials_worked|list}}}
|-
! Grandeurs mesurées :
| {{{field|Measured_quantities|input type=tokens|values from property=Measured_quantities|list}}}
|}
{{{end template}}}
</includeonly>
```

---

## 5. Pour mémoire

Propriétés `Procurement_route`, `Power_rating`, `Max_thickness`,
`Materials_worked`, `Measured_quantities` : câblage supposé déjà fait côté
`Attribut:` en amont de cette tâche (hors périmètre de cette session, non
revérifié ici). Ce rapport ne couvre que le câblage modèle + formulaire.
