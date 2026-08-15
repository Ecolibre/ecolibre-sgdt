# Lot 9 — Tâche 3 — Wikitexte de `Modèle:Specimen photo`

**Écrit sur le wiki** (`newrevid: 522`, voir `lot-9-tache3-rapport.md`).

Modèle d'annotation des pages `Fichier:`, trois paramètres nommés d'après
leurs propriétés (`Depicts_specimen`, `Image_date`, `Image_location`), tel
que prévu par la tâche 3 du cadrage (`lot-9-cadrage-plantes.md`).

## Décisions intégrées (données par Cyril)

1. **`Depicts_specimen` multivaluée, séparateur point-virgule** — jamais la
   virgule, délimiteur du système partout ailleurs dans le modèle (règle déjà
   consignée dans `CLAUDE.md`). Motif pratique : une photo peut représenter
   plusieurs plantations (cas déjà rencontré au lot 9, ex.
   `Menthe_X_&_Chayote`). Éclatement par `+sep=;` seul dans le `#set` — pas
   de `#arraymap` à ce stade, corrigé au point ci-dessous.
2. **Les trois annotations posées sans garde** : le `#set` n'est enveloppé
   dans aucun `#if`. `Image_date` et `Image_location` peuvent donc être
   renseignées même sur une photo qui ne représente aucune plantation (cas
   réel identifié en tâche 0 : `Couleuvre_verte_et_jaune`,
   `Gainage_cable`/`Raboutage_cable_gaine` — faune et infrastructure
   photographiées dans le même lot que les plantes).
3. **`#if` limité à la catégorisation** : `[[Category:Photo de plantation]]`
   n'est émise que si `Depicts_specimen` est renseignée.
4. **Table d'affichage courte, hors du `#if`**, mêmes conventions visuelles
   que `Modèle:Physical facet plant` (`class="wikitable" style="width:100%"`,
   en-têtes de section `colspan="2"` fond `#dfe8d8`, lignes fond `#f2f2f2`).

## Écart assumé par rapport au motif organique/physique (décision 3)

Dans `Modèle:Organic facet plant` et `Modèle:Physical facet plant`, le `#set`
**et** la catégorisation sont enveloppés dans le même `#if`, sur le même
champ clé (`Taxon_name`, `Specimen_status`) : ces modèles portent un bloc de
facette **entièrement optionnel**, ajouté ou non par un geste explicite
(instance de gabarit Page Forms), donc une seule condition suffit à
distinguer « bloc actif » de « bloc absent ».

`Modèle:Specimen photo` n'a pas cette structure : c'est une annotation
posée par script sur des pages `Fichier:` déjà existantes (tâche 8), pas un
bloc optionnel ajouté par formulaire. Les trois propriétés ne sont pas
solidaires les unes des autres : une photo de faune ou d'infrastructure peut
légitimement porter une date et un lieu de prise de vue sans jamais
représenter de plantation. Gate le `#set` entier sur `Depicts_specimen`
interdirait d'annoter `Image_date`/`Image_location` sur ces photos-là — perte
de donnée réelle, pas hypothétique (5 photos de faune, 3 d'infrastructure
déjà identifiées en tâche 0, point 8). Seule la catégorie sémantique « Photo
de plantation », qui affirme spécifiquement un contenu végétal, a besoin
d'être conditionnée. D'où l'écart : un `#if` unique, mais placé sur la
catégorisation seule, pas sur le `#set`.

## Wikitexte écrit

Relu en direct sur le wiki, identique à `newrevid: 522`.

```wikitext
<noinclude>
{{Documentation}}
</noinclude>
<includeonly>
{{#set:
|Depicts_specimen={{{Depicts_specimen|}}}
|+sep=;
|Image_date={{{Image_date|}}}
|Image_location={{{Image_location|}}}
}}

{{#if:{{{Depicts_specimen|}}}|[[Category:Photo de plantation]]}}

{| class="wikitable" style="width:100%"
|+ Annotation de la photo
! colspan="2" style="background:#dfe8d8; text-align:left;" | Photo
|-
! style="background:#f2f2f2; width:30%;" | Plantation(s) représentée(s)
| {{#if:{{{Depicts_specimen|}}}|{{#arraymap:{{{Depicts_specimen|}}}|;|@@@|[[@@@]]|; }}|''non renseignée''}}
|-
! style="background:#f2f2f2; width:30%;" | Date de prise de vue
| {{#if:{{{Image_date|}}}|{{{Image_date}}}|''non renseignée''}}
|-
! style="background:#f2f2f2; width:30%;" | Lieu
| {{#if:{{{Image_location|}}}|[[{{{Image_location}}}]]|''non renseigné''}}
|}
</includeonly>
```

## Corrections appliquées avant écriture (2)

1. **`#set` de `Depicts_specimen` corrigé.** La première version enveloppait
   la valeur dans un `#arraymap` avant de lui appliquer `+sep=;` — double
   défaut : `+sep=` s'applique à la propriété qui le **précède**, pas à
   celle qui le suit (rappel déjà consigné dans `CLAUDE.md` ; même défaut que
   `Part_of` de `Modèle:Referenced item`, en limite connue), et
   l'`#arraymap` était de toute façon inutile ici — avec un délimiteur
   d'entrée et de sortie identiques et aucune transformation par élément, il
   rend `a;b` à partir de `a;b`. Remplacé par l'assignation directe de la
   valeur brute, `+sep=;` juste après, qui suffit seule à découper le
   multivalué à l'écriture SMW. L'`#arraymap` reste utile et conservé **dans
   la table d'affichage** (ligne « Plantation(s) représentée(s) »), où il
   sert réellement à transformer chaque valeur en lien `[[@@@]]`.
2. **Séparateur d'affichage corrigé** : `;&#32;` (entité HTML inutile ici)
   remplacé par `; ` (point-virgule suivi d'une espace simple), pour la
   lisibilité du wikitexte.

## Note de séquencement — ne pas toucher avant la fin de la tâche 8

**Ne pas basculer la requête photos de `Modèle:Physical facet plant`
(actuellement filtrée sur `Depicts_specimen::{{FULLPAGENAME}}`) vers un
filtre sur `Category:Photo de plantation`, avant la fin de la tâche 8.**
Tant que les 71 photos correctement nommées n'ont pas toutes été annotées
par ce modèle, la catégorie n'est peuplée que partiellement : un filtre de
requête dessus masquerait des photos déjà correctement annotées mais pas
encore recatégorisées, ou plus généralement toute photo pour laquelle la
tâche 8 n'est pas encore passée. La dette croisée notée ci-dessus (bascule
possible vers la catégorie) reste donc ouverte et **à réexaminer
explicitement après la tâche 8**, pas avant.

## Points à noter, non bloquants

- Le paramètre `Image_location` attend une page de la classe `Lieu` (type
  `Page`, cf. `Attribut:Image_location`) ; aucune validation de catégorie
  n'est faite ici, cohérent avec l'absence générale de contrôle de ce type
  dans les modèles déjà en place sur ce wiki.

## État

Écrit sur le wiki. Voir `lot-9-tache3-rapport.md` pour le résultat de
l'écriture et le test de multivaluation.
