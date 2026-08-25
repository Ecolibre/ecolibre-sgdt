# Lot 11 — révision des titres : exécution

2026-08-24/25. Suite de `lot-11-titres-revision.md` (propositions), après
validation de Cyril avec trois corrections. Écritures faites cette
session, sous le libellé `[Amendement]` — aucune ne relève d'une tâche
numérotée du cadrage.

## Corrections apportées à la proposition précédente

### 1. Coût d'un renommage — 29, pas 82

Erreur d'interprétation dans `lot-11-titres-revision.md` (section 3c) :
j'avais additionné les 29 pages `Located_at` et les 53 pages `Fichier:`
comme un coût unique de renommage. **Ce n'est pas le même coût.**

- Les **29 pages `Located_at`** portent une propriété SMW dont la valeur
  stockée est le titre exact de la page. Un renommage sans reparse laisse
  cette valeur pointer sur l'ancien titre — fausse jusqu'à reparse.
  **C'est le coût réel d'un renommage** : 29 pages à purger pour que la
  valeur stockée converge.
- Les **53 pages `Fichier:`** portent un lien wiki ordinaire
  (`[[Le Buisson de Cerzat]]`), pas une propriété SMW. Un lien ordinaire
  traverse une redirection sans rien casser — MediaWiki laisse une
  redirection de l'ancien titre vers le nouveau à tout déplacement (sauf
  suppression explicite). Ce compte ne devient pertinent que si on
  envisage de **supprimer** la redirection après coup, pas pour le
  renommage lui-même.

**Coût réel d'un renommage de `Le Buisson de Cerzat` : 29 pages à
purger**, pas 82.

### 2. Infobulle décimale — testée, résultat net

Test fait sur `Utilisateur:Cywil/Bac à sable`, propriété `Latitude`,
trois valeurs successives, `browsebysubject` après chacune :

| Valeur tapée | Stocké (`Latitude`) | `_ERRC` | Message affiché |
|---|---|---|---|
| `45,171420` | `45.17142` | absent | — |
| `45.171420` | **rien** | présent | « .171420 » ne peut pas être affecté à un type de nombre déclaré avec la valeur 45. |
| `45.171,420` | **rien** | présent | « .171,420 » ne peut pas être affecté à un type de nombre déclaré avec la valeur 45. |

**Résultat net, pas ambigu** : un point est **rejeté**, pas silencieusement
mal interprété. SMW consomme les chiffres avant le premier point comme
valeur candidate (« 45 »), puis échoue à assigner le reste et pose une
erreur `_ERRC`, visible en surbrillance sur la page rendue (vérifié par
`action=parse`, pas seulement supposé depuis `_ERRC`). **Le cas vicieux
signalé par Cyril (point lu comme séparateur de milliers, `45171420` sans
erreur) ne se produit pas** — l'échec est net et visible, aucune valeur
n'est enregistrée dans les trois cas où le point apparaît.

Ce résultat contredit l'infobulle de la v2 (`lot-11-tache3-proposition-v2.md`),
qui affirmait « un point est converti automatiquement » — faux, mesuré
maintenant. Infobulle réécrite en conséquence (section suivante).

Page bac à sable blanchie après le test (revid final, contenu identique à
avant : une seule ligne). `browsebysubject` relu après blanchiment :
seuls `_MDAT`/`_SKEY` restent, aucun fait résiduel (`Latitude`, `_ERRC`
absents).

### 3. `CLAUDE.md` — texte remplacé, pas de généralisation

Écrit tel que dicté, sans la généralisation de la session précédente
(« en environnement web » devient « dans un environnement Claude Code
hébergé (cloud Anthropic), le 24 août 2026 », avec le code HTTP observé —
403 au CONNECT). Voir section « Écritures » ci-dessous.

### 4. Infobulle de `Place_name` — le quand, pas le quoi

Remplacée par le texte de Cyril : {{#info: À remplir seulement si le nom
d'usage diffère du titre — par exemple quand le titre a dû être qualifié
pour rester unique.}} — voir wikitexte complet plus bas.

## Écritures faites

Session ouverte par `bin/wiki-login.sh` (`Success Cywil`) avant la
première écriture.

### a) `Modèle:Lieu` — les deux retours en arrière

Relu avant écriture (89 lignes, identique à la copie de la session
précédente — pas de modification hors session entre-temps). Diff
appliqué :
```diff
-| {{#if:{{{Place_name|}}}|{{{Place_name}}}|'''Nom d'usage non renseigné'''}}
+| {{#if:{{{Place_name|}}}|{{{Place_name}}}|{{PAGENAME}}}}
...
-{{#if:{{{Place_name|}}}||[[Category:Lieu sans nom d'usage]]}}
 [[Category:Lieu]]
```
Résumé : `[Amendement][Modèle:Lieu] Retour au repli {{PAGENAME}} sur Nom
d'usage, retrait de la catégorisation conditionnelle — titre = nom du
lieu`. `oldrevid` 858 → `newrevid` 863. **Relu après écriture** : contenu
identique au fichier envoyé (seul écart : fin de ligne finale, sans
portée).

### b) `Modèle:Préfixe lieu` — création, `createonly=1`

Vérifié absent avant écriture (`wiki-get.sh` → « doesn't exist »).
Wikitexte de la v1 de tâche 3 (`lot-11-tache3-proposition.md`, section 3),
repris à l'identique — code `LOC`, documentation dans `<noinclude>`.
Résumé : `[Amendement][Modèle:Préfixe lieu] Création — code LOC, patron de
Modèle:Préfixe site`. `pageid` 434, `newrevid` 864. **Relu après
écriture** : identique au fichier envoyé.

### c) `Formulaire:Lieu` — création, `createonly=1`

Vérifié absent avant écriture. Wikitexte corrigé — les trois retraits
demandés plus l'infobulle `Place_name` (correction 4) :

```
<includeonly>
{{{info|add title=Ajouter un Lieu|edit title=Modifier le Lieu}}}
{{{for template|Lieu}}}
{| class="formtable"
! Nom d'usage : {{#info: À remplir seulement si le nom d'usage diffère du titre — par exemple quand le titre a dû être qualifié pour rester unique.}}
| {{{field|Place_name}}}
|-
! Type : {{#info: Texte libre — terrain, bâtiment, pièce... La diversité réelle des lieux ne se prête pas encore à une liste fermée.}}
| {{{field|Location_type|input type=text}}}
|-
! Code de site :
| {{{field|Location_site|mandatory|default={{Préfixe lieu}}|size=5}}}
|-
! Référence : {{#info: Calculée automatiquement à l'ouverture du formulaire — voir la mise en garde sur le calcul à l'affichage avant de créer plusieurs lieux en parallèle.}}
| {{{field|Location_number|mandatory|default={{#invoke:Base36|next|{{#ask: [[Category:Lieu]] [[Location_site::{{Préfixe lieu}}]] [[Location_number::+]] |?Location_number= |sort=Location_number |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }}|placeholder=0001}}}
|-
! Code INSEE : {{#info: Uniquement pour un lieu de type commune. Laisser vide pour tout autre type de lieu.}}
| {{{field|INSEE_code|input type=text|placeholder=43044}}}
|-
! Lieu parent : {{#info: « Se trouve dans » (Located_in) — un lieu parent unique, ou aucun pour un lieu de premier niveau (une commune, par exemple).}}
| {{{field|Located_in|input type=combobox|values from category=Lieu}}}
|-
! Adresse postale :
| {{{field|Postal_address}}}
|-
! Latitude : {{#info: Décimales avec la virgule (45,171420). Un point est rejeté par SMW : avertissement visible sur la page, aucune valeur n'est enregistrée.}}
| {{{field|Latitude}}}
|-
! Longitude : {{#info: Décimales avec la virgule (3,488276). Un point est rejeté par SMW : avertissement visible sur la page, aucune valeur n'est enregistrée.}}
| {{{field|Longitude}}}
|}
{{{end template}}}

{{{standard input|free text}}}
{{{standard input|save}}}
</includeonly>
```

L'infobulle de `Longitude` généralise le résultat mesuré sur `Latitude` —
même type SMW (`_num`), même famille de propriété, pas retesté séparément
sur `Longitude` elle-même : signalé, pas caché.

Résumé : `[Amendement][Formulaire:Lieu] Création — sans page name=, sans
mapping property=, Place_name facultatif, infobulle décimale corrigée par
test`. `pageid` 435, `newrevid` 865. **Relu après écriture** : identique
au fichier envoyé.

### d) Purge des quatre lieux, catégorie vidée

`bin/wiki-purge.sh "Atelier appartement|Jardin de Chilhac|Le Buisson de
Cerzat|Terrasse de Chilhac"` — les 4 `purged: true, linkupdate: true`.

**`bin/wiki-wait-jobs.sh` signale une file figée** (8 travaux, cinq
essais sans variation) — comme lors d'une session précédente (3 travaux
figés). Ça n'a pas empêché la vérification directe : la mise à jour des
liens déclenchée par `forcelinkupdate=1` sur la purge est synchrone côté
SMW pour ce genre de recalcul de catégorie conditionnelle, confirmée par
lecture immédiate, pas supposée depuis le flag `linkupdate`.

`action=query&list=categorymembers&cmtitle=Category:Lieu sans nom
d'usage` → `[]`. **Catégorie vidée.** La page de catégorie elle-même
n'a pas été touchée — aucune action `delete` n'a été tentée (le compte
bot n'a de toute façon pas ce droit, voir `lot-11-titres-revision.md`
section 2).

## Vérifications en lecture seule

- **Rendu des quatre lieux** (`action=parse`) : les quatre affichent
  désormais leur titre dans la ligne « Nom d'usage » (`Le Buisson de
  Cerzat`, `Atelier appartement`, `Jardin de Chilhac`, `Terrasse de
  Chilhac`) — le repli `{{PAGENAME}}` fonctionne. Les quatre restent
  membres de `Category:Lieu` (`categorymembers` recontrôlé après purge).
- **Compteur du Buisson** : `#ask [[Located_at::Le Buisson de Cerzat]]`
  → `count: 29`, inchangé.
- **`Special:FormEdit/Lieu` — non chargée, limite d'outillage rencontrée
  et signalée plutôt que contournée.** `WebFetch` sur cette URL (deux
  formes testées, `index.php?title=` et `/wiki/`) renvoie HTTP 400 sans
  corps exploitable — pas d'authentification possible par cet outil, et
  l'accès direct au fichier de cookies (`.cookies.txt`, requis pour un
  `curl` authentifié hors script) est bloqué par les permissions de cette
  session (`ls` déjà refusé). **Je n'ai donc pas vu le rendu réel de la
  page spéciale.** Ce qui suit est déduit du wikitexte et de l'état des
  données, pas observé :
  - **Neuf champs** : le formulaire écrit en c) porte exactement neuf
    `{{{field|...}}}` (Nom d'usage, Type, Code de site, Référence, Code
    INSEE, Lieu parent, Adresse postale, Latitude, Longitude) — compté
    dans le wikitexte envoyé, pas dans un rendu.
  - **Défaut de Référence** : `action=ask` sur `[[Category:Lieu]]
    [[Location_number::+]]` → `results: [], count: 0` — **aucun lieu ne
    porte de `Location_number`**, confirmé en lecture directe, pas
    supposé. La formule du champ retombe donc sur `default=0000` de
    l'`#ask` interne, puis `{{#invoke:Base36|next|0000}}`. Le
    comportement de `Base36|next` sur `0000` → `0001` n'a pas été
    retesté ici : il s'appuie sur le même module déjà vérifié pour les
    items physiques (lot 9), pas re-mesuré dans cette session. **Si
    Cyril veut une confirmation par un rendu réel plutôt que par cette
    déduction, il faudra soit un accès aux cookies que cette session n'a
    pas, soit un chargement manuel de la page par lui.**

## Note pour la tâche 7 — non rédigée, juste consignée

Le titre étant désormais le nom du lieu : un nom positionnel (« zone
basse », « planche 1 ») collisionnera au deuxième site qui en a une, et
se périmera si le lieu est déplacé physiquement sans renommage de la
page. La discipline de nommage des lieux devient donc une règle de
documentation à écrire pour la tâche 7 — pas traitée ici, seulement
signalée comme demandé.

## Résumé des écritures

| Cible | Action | Résumé | Revid |
|---|---|---|---|
| `Utilisateur:Cywil/Bac à sable` | test ×3 puis blanchiment | `[Amendement] Test lot 11 — Latitude=...` (×3), `[Amendement] Blanchiment après test lot 11...` | 859–862 |
| `Modèle:Lieu` | édition | `[Amendement][Modèle:Lieu] ...` | 863 |
| `Modèle:Préfixe lieu` | création (`createonly`) | `[Amendement][Modèle:Préfixe lieu] ...` | 864 |
| `Formulaire:Lieu` | création (`createonly`) | `[Amendement][Formulaire:Lieu] ...` | 865 |
| 4 pages de lieu | purge | — (pas une édition, pas de résumé) | — |
| `CLAUDE.md` (dépôt) | édition locale | remplacement du point sur l'environnement cloud (section 3) | — |

Rien commité ni poussé dans cette session — à faire séparément si Cyril
le demande.
