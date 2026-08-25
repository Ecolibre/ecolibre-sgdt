# Lot 11 — révision : le titre d'un lieu est son nom

2026-08-24. Décision changée par Cyril : le titre d'une page de lieu est le
**nom** du lieu. `LOC-NNNN` reste la référence, stockée dans
`Location_number` et affichée par `Modèle:Lieu`, jamais dans le titre. Les
rapports `lot-11-tache2-*` et `lot-11-tache3-*` disent le contraire : ils
sont antérieurs à ce changement, non modifiés ici — ce fichier les corrige,
il ne les remplace pas.

**Vérifié avant toute chose : aucune écriture liée à `page name=` /
`mapping property=` n'a eu lieu.** `Formulaire:Lieu` n'existe pas sur le
wiki (`allpages` namespace 106, préfixe `Lieu` → liste vide ;
confirmation croisée avec `lot-11-tache3-proposition-v2.md`, qui l'annonçait
déjà non créé). `Modèle:Lieu` est dans son état de tâche 2 : la ligne
`Nom d'usage` retombe sur `'''Nom d'usage non renseigné'''`, pas sur
`{{PAGENAME}}`, et la catégorisation conditionnelle est en place (lignes 22
et 88 du wikitexte actuel, lu à l'instant). Rien à annuler côté écriture —
seulement à corriger côté proposition. Tout ce qui suit reste à l'état de
proposition, comme demandé.

Session ouverte par `bin/wiki-login.sh` (`Success Cywil`) : le wiki était
joignable depuis cette session — point utile pour la section 5.

## 1. Diff proposé — `Modèle:Lieu`, deux retours en arrière sur la tâche 2

Wikitexte actuel relu intégralement (89 lignes). Deux points touchés,
strictement — Référence (lignes 24-25) et la requête des enfants directs
(lignes 49-63) ne bougent pas.

### a) Nom d'usage — repli sur `{{PAGENAME}}`

Ligne 22 actuelle :
```
| {{#if:{{{Place_name|}}}|{{{Place_name}}}|'''Nom d'usage non renseigné'''}}
```
Proposée :
```
| {{#if:{{{Place_name|}}}|{{{Place_name}}}|{{PAGENAME}}}}
```
C'est exactement la ligne d'avant tâche 2 (`lot-11-tache2-execution.md`,
ligne 84 du diff qui l'a remplacée) — un retour, pas une nouvelle
rédaction.

### b) Retrait de la catégorisation conditionnelle

Ligne 88 actuelle, à supprimer :
```
{{#if:{{{Place_name|}}}||[[Category:Lieu sans nom d'usage]]}}
```
`Place_name` redevient facultatif : rien ne le rend obligatoire ailleurs
dans le modèle (`{{{Place_name|}}}` reste le seul usage, en `#set` ligne 6
et dans le repli ci-dessus). La ligne 89 (`[[Category:Lieu]]`) ne bouge
pas.

Tout le reste du fichier (89 lignes : `#set`, tableau, filiation, items
physiques, `Documentation`) est identique avant et après. Pas d'écriture
faite ici — proposition seule, à valider par Cyril avant tout
`wiki-put.sh`.

## 2. Catégorie:Lieu sans nom d'usage — vider ou supprimer ?

État actuel constaté : la page de catégorie existe (pageid 433, sous
`Catégorie:SGDT`, 857 octets, dernière modif 2026-08-23) et porte
aujourd'hui les 4 lieux existants comme membres (`categorymembers`) —
`Atelier appartement`, `Jardin de Chilhac`, `Le Buisson de Cerzat`,
`Terrasse de Chilhac` — puisqu'aucun n'a encore de `Place_name`.

**Les deux gestes ne coûtent pas la même chose, et ne font pas la même
chose :**

- **Vider** (retirer les membres) est automatique et gratuit dès que le
  point 1b est écrit : plus aucune page n'entre dans la catégorie, et les
  4 membres actuels en sortent à leur prochaine analyse (`forcelinkupdate`
  via `wiki-purge.sh` sur les 4, pour ne pas attendre le prochain
  enregistrement naturel). Le compte bot a le droit d'édition nécessaire —
  confirmé (`action=query&meta=userinfo&uiprop=rights` : `edit`, `purge`
  présents).
- **Supprimer** la page de catégorie elle-même (la coquille, son texte de
  description) est un geste distinct, et **le compte bot n'a pas le droit
  `delete`** — confirmé par la même requête `userinfo` : absent de la
  liste des droits (`move`, `upload`, `purge`… présents, `delete` non).
  Une catégorie vidée mais non supprimée reste une page réelle, qui
  remontera dans `Special:UnusedCategories` une fois vide.

**Réponse : vider suffit pour l'objectif immédiat** — plus aucun lieu mal
classé, plus aucune annotation trompeuse. La suppression de la page
elle-même est un geste de rangement, pas une nécessité fonctionnelle ; si
Cyril la veut, c'est une demande pour `demandes-adminsys.md` (fuzzy), à
grouper avec d'autres suppressions plutôt qu'à traiter seule pour une page.
Option intermédiaire non exécutée ici : blanchir le contenu descriptif
pour signaler « catégorie retirée du lot 11 » sans attendre une
suppression — possible côté bot (`edit`), à faire seulement si Cyril le
demande.

## 3. Coût réel d'un renommage de lieu — mesure en lecture seule

### a) `Special:DoubleRedirects` aujourd'hui

```
action=query&list=querypage&qppage=DoubleRedirects
→ "results": []
```
Aucune double redirection recensée actuellement sur le wiki. Réserve :
`DoubleRedirects` est une page spéciale mise en cache
(`QueryPage`/`querycache`), pas nécessairement recalculée en continu —
ce résultat reflète l'état du dernier rebuild du cache, pas forcément
l'instant présent à la seconde près. Aucun moyen trouvé en lecture pour
dater ce cache précisément (pas de champ de date exposé par
`list=querypage`).

### b) MediaWiki corrige-t-il seul les doubles redirections au déplacement ?

**Je ne peux pas l'établir depuis cette session** : l'établir en pratique
demanderait de déplacer une page pour observer le résultat, une écriture
hors du périmètre de cette tâche (lecture seule demandée). Je ne le
suppose pas.

Ce que je peux dire, à titre de connaissance générale du logiciel
MediaWiki (pas une vérification faite sur ce wiki) : un déplacement crée
une redirection de l'ancien titre vers le nouveau, mais ne réécrit pas les
redirections *existantes* qui pointaient déjà vers l'ancien titre — c'est
précisément ce que `Special:DoubleRedirects` sert à repérer après coup,
et ce que le script de maintenance `fixDoubleRedirects.php` corrige,
séparément du déplacement lui-même. Si Cyril veut une réponse vérifiée sur
ce wiki précis plutôt qu'une connaissance générale du logiciel, il faut un
test réel (créer une redirection jetable, déplacer sa cible, relire
`DoubleRedirects`) — pas fait ici, à valider avant d'en faire une règle du
dépôt.

### c) Combien de pages pointent vers `Le Buisson de Cerzat` ?

Croisement `list=backlinks` (limite 500, une seule page de résultats,
`continue` absent → liste complète) et `Located_at` stocké (`#ask`,
`meta.count`) :

| Source | Décompte |
|---|---|
| `backlinks`, espace principal (ns 0) | 29 |
| `backlinks`, espace Fichier (ns 6) | 53 |
| `backlinks`, total | **82** |
| `#ask [[Located_at::Le Buisson de Cerzat]]` | 29 |

**Les 29 pages ns 0 et les 29 résultats `Located_at` sont exactement le
même ensemble** (comparaison titre à titre faite, pas seulement le
compte) — cohérent : ce sont les 29 items physiques rattachés à ce lieu,
dont le titre contient déjà le nom du lieu et dont le modèle affiche un
lien `[[Located_at]]`. Les 53 pages `Fichier:` sont les photos du lot 9
dont la page de description porte un lien vers ce lieu, hors du champ
SMW `Located_at` (qui vit sur les items, pas sur les fichiers) — d'où
l'écart entre `backlinks` et `#ask`.

**Réponse : 82 pages à purger après un renommage de `Le Buisson de
Cerzat`** — 29 items physiques + 53 fichiers média. Aucun lieu enfant ne
pointe vers lui via `Located_in` aujourd'hui (les 29 ns 0 sont tous des
items physiques, aucune page de lieu) : pas de coût de filiation en plus
pour ce lieu précis, mais ce serait à recompter pour un lieu qui a des
enfants.

## 4. `Formulaire:Lieu` — proposition remontrée, patron maison

Reprend `lot-11-tache3-proposition-v2.md`, avec les trois retraits
demandés. Le patron maison (`Formulaire:Physical item`, relu en tâche 3)
n'a pas de `page name=` : le titre se saisit à la main à l'ouverture de
`Special:FormEdit/Lieu`, comme pour les quatre formulaires existants.

**Un quatrième changement, non demandé explicitement mais rendu
nécessaire par les trois autres** : l'infobulle de `Place_name` en v2
justifiait le caractère obligatoire du champ par le fait que « le titre
porte la référence LOC-NNNN, pas le nom » — cette justification devient
fausse une fois `page name=` retiré et le titre saisi à la main. Réécrite
en conséquence ci-dessous ; signalé pour que Cyril la valide comme les
trois autres, pas glissé sans le dire.

**Infobulle du séparateur décimal (Latitude/Longitude) : reportée telle
quelle depuis la v2, non revérifiée dans cette session** — Cyril a demandé
qu'elle reste à vérifier avant écriture ; le point 1 de
`lot-11-tache3-proposition-v2.md` la donne déjà comme vérifiée
(`Attribut:Latitude`/`Longitude` en type `_num`, même famille que
`Max_head`/`Power_rating`), mais cette session ne l'a pas recontrôlée —
à confirmer par Cyril ou par une nouvelle lecture avant le
`wiki-put.sh`.

```
<includeonly>
{{{info|add title=Ajouter un Lieu|edit title=Modifier le Lieu}}}
{{{for template|Lieu}}}
{| class="formtable"
! Nom d'usage : {{#info: Facultatif — si vide, le titre de la page sert d'affichage par repli.}}
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
! Latitude : {{#info: Décimales avec la virgule. Un point est converti automatiquement ; un nombre mêlant point et virgule est refusé.}}
| {{{field|Latitude}}}
|-
! Longitude : {{#info: Décimales avec la virgule. Un point est converti automatiquement ; un nombre mêlant point et virgule est refusé.}}
| {{{field|Longitude}}}
|}
{{{end template}}}

{{{standard input|free text}}}
{{{standard input|save}}}
</includeonly>
```

Changements par rapport à la v2 : `page name=` retiré de `{{{info|...}}}`
(point 4a de la consigne) ; `mandatory` retiré de `Place_name`, infobulle
réécrite (point 4c) ; `mapping property=Place_name` retiré de
`Located_in`, infobulle reprise à l'identique de la v1 — sans la phrase
sur l'affichage du nom d'usage, devenue sans objet puisque `combobox`
affichera de nouveau directement les titres, qui sont des noms lisibles
(point 4b). Rien d'autre ne change : Code de site, Référence (calcul
Base36), Code INSEE, Adresse postale, Latitude/Longitude restent ceux de
la v2. `Modèle:Préfixe lieu` (proposé en v1, jamais créé) n'est pas
concerné par cette révision.

## 5. `CLAUDE.md` — diff proposé, environnement web cloud

**Non vérifié par cette session** : `bin/wiki-login.sh` a répondu
`Success Cywil` ici, donc cette session-ci pouvait joindre le wiki. La
note ci-dessous documente un environnement différent (Claude Code sur le
cloud Anthropic), constaté par Cyril ailleurs, pas quelque chose que
cette session a reproduit. Proposée telle que dictée, à valider par Cyril
avant écriture — en particulier la date d'observation, absente de sa
consigne, non inventée ici.

Insertion proposée : nouvelle puce en fin de section
« Leçons de méthode (wiki et outillage) », juste avant
« ## Garde-fous d'exécution (dépôt git) ».

```diff
   `_CHGPRO` en portait six, et « en réserve » était pourtant déjà
   acceptée à l'enregistrement. **La vérification qui fait foi est le
   ré-enregistrement d'un item réel portant la nouvelle valeur, puis la lecture
   de ses faits** — pas la lecture de la page de propriété. Conclure « la valeur
   n'est pas prise en compte » depuis `_PVAL` seul est un faux négatif.
 
+- **En environnement web (Claude Code sur le cloud Anthropic),
+  wiki.ecolibre.org est injoignable** — le proxy refuse l'hôte. Seul le
+  travail sur les fichiers du dépôt est possible. Symptôme : `wiki-api.sh`
+  renvoie une sortie vide avec un code de sortie 0, sans message.
+
 - **`bin/wiki-api.sh` ne réencode pas la chaîne de paramètres.** Un espace
   non encodé dans un titre fait échouer `curl` en silence (code de sortie 3,
   aucun message API). Toujours passer les titres contenant un espace en
```

Pas écrit — proposition seule, comme le reste de ce rapport.

## Résumé — rien écrit sur le wiki

Toutes les écritures de ce rapport sont des propositions (`Modèle:Lieu`,
`Formulaire:Lieu`, `Catégorie:Lieu sans nom d'usage`, `CLAUDE.md`). Seules
des lectures ont eu lieu contre le wiki : `wiki-login.sh`, `wiki-get.sh`
(×2), `wiki-api.sh` (allpages, userinfo, querypage DoubleRedirects,
backlinks, ask, categorymembers, query titres). Rien purgé, rien
enregistré.
