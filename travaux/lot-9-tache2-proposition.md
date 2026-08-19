# Lot 9 — Tâche 2 — Wikitexte de `Modèle:Physical facet plant`

**Écrit sur le wiki** (`newrevid: 521`, voir `lot-9-tache2-rapport.md`).
Conservé sous ce nom de fichier pour la trace des décisions et corrections,
plutôt que renommé — le titre disait « Proposition » quand la page n'existait
pas encore ; il documente maintenant ce qui a été écrit.

Relu avant rédaction : `lot-8-amendement-1.md` (mécanisme retenu §2 :
section multi-instance à instance unique sans champ pilote, `#set` et
catégorisation dans un `#if` sur un champ clé, table hors du `#if`) et
`Modèle:Organic facet plant` (gabarit réel, lu en direct sur le wiki :
`#if:{{{Taxon_name|}}}` enveloppant `#set` + catégorie, `Item_facet=Facette
végétal`, catégorie réelle `Category:Item à facette végétal`, table
wikitable avec en-têtes de section `colspan="2"` fond `#dfe8d8`, lignes fond
`#f2f2f2`).

## Décisions intégrées (données par Cyril)

1. **Garde du `#if` : `Specimen_status`** — motif identique à l'organique, on
   garde sur le champ obligatoire du bloc, pas sur un champ choisi pour son
   sens.
2. **Photos en `format=gallery`** (SRF installé), requête sur la page de la
   plantation, `sort=Image_date`, `order=desc`, sans `limit` — toutes les
   photos de la plantation, pas seulement la plus récente. Repli si le
   format se comporte mal en bac à sable : `format=template` avec un modèle
   d'une ligne `[[Fichier:{{{1}}}|200px]]` — non inclus dans la proposition
   ci-dessous, à activer seulement en cas de besoin constaté.
3. **`Located_at` exclu du bloc** : propriété de tout item physique, pas
   spécifique aux plantes. Restera portée par `Modèle:Physical item` et son
   formulaire, dans une étape distincte avant la tâche 7. Le bloc porte donc
   cinq champs : `Planting_date`, `Planting_rank`, `Specimen_status`,
   `Planted_count`, `Propagated_from`.

## Contraintes de forme rappelées

- Le tableau d'affichage reste **hors** du `#if` (les `|` d'une table wiki
  cassent l'argument d'un `#if`).
- `Item_facet=Facette végétal` écrit en dur dans le `#set`.
- Catégorisation dans le `#if`, avec le `#set`.
- Paramètres du modèle nommés à l'identique des propriétés qu'ils
  alimentent (convention du projet).

## Wikitexte écrit

Relu en direct sur le wiki (`action=parse&prop=wikitext`) le 15 août 2026,
après écriture — `newrevid: 521`. Contenu identique à celui effectivement
stocké, ce bloc n'est donc pas une reconstitution locale.

```wikitext
<noinclude>
{{Documentation}}
</noinclude>
<includeonly>
{{#if:{{{Specimen_status|}}}|
{{#set:
|Planting_date={{{Planting_date|}}}
|Planting_rank={{{Planting_rank|}}}
|Specimen_status={{{Specimen_status|}}}
|Planted_count={{{Planted_count|}}}
|Propagated_from={{{Propagated_from|}}}
|Item_facet=Facette végétal
}}

[[Category:Item à facette végétal]]
}}

{| class="wikitable" style="width:100%"
|+ Facette végétale — exemplaire
! colspan="2" style="background:#dfe8d8; text-align:left;" | Plantation
|-
! style="background:#f2f2f2; width:30%;" | Date de plantation
| {{#if:{{{Planting_date|}}}|{{{Planting_date}}}|''non renseignée''}}
|-
! style="background:#f2f2f2; width:30%;" | Rang le long de la butte
| {{#if:{{{Planting_rank|}}}|{{{Planting_rank}}}|''—''}}
|-
! style="background:#f2f2f2; width:30%;" | Nombre d'individus
| {{#if:{{{Planted_count|}}}|{{{Planted_count}}}|''non compté''}}
|-
! colspan="2" style="background:#dfe8d8; text-align:left;" | État et filiation
|-
! style="background:#f2f2f2; width:30%;" | Statut
| {{{Specimen_status|}}}
|-
! style="background:#f2f2f2; width:30%;" | Issu de
| {{#if:{{{Propagated_from|}}}|[[{{{Propagated_from}}}]]|''—''}}
|-
! colspan="2" style="background:#dfe8d8; text-align:left;" | Photos
|-
! style="background:#f2f2f2; width:30%;" | Photos de cette plantation
|
{{#ask: [[Depicts_specimen::{{FULLPAGENAME}}]]
 |sort=Image_date
 |order=desc
 |format=gallery
 |default=''Aucune photo annotée pour cette plantation.''
}}
|}
</includeonly>
```

## Corrections appliquées avant écriture (4)

1. Cellules vides remplacées par une forme explicite
   (`{{#if:{{{Planting_date|}}}|{{{Planting_date}}}|''non renseignée''}}` et
   variantes pour `Planting_rank` → `''—''`, `Planted_count` → `''non
   compté''`, `Propagated_from` → `''—''`). `Specimen_status` inchangé,
   obligatoire donc jamais vide.
2. `{{PAGENAME}}` remplacé par `{{FULLPAGENAME}}` dans le `#ask`.
3. `Modèle:Documentation` vérifié existant sur ce wiki (pageid 35) — bloc
   `noinclude` conservé tel quel.
4. Note de dette ci-dessous ajoutée.

## Dette technique consignée

**La requête photos (`{{#ask: [[Depicts_specimen::{{FULLPAGENAME}}]] …
}}`) n'a pas de filtre de classe**, contrairement à la décision 1.9 de
l'amendement 1 (« toute requête portant sur une facette porte un filtre de
classe »). Elle ne tient que parce que `Depicts_specimen` n'est employée que
sur des pages `Fichier:` — aucune autre classe ne peut aujourd'hui poser
cette propriété, donc aucune ambiguïté en pratique. Mais rien ne l'empêche
structurellement. **À reprendre quand la tâche 3 créera `Modèle:Specimen
photo`** : ajouter alors un filtre sur sa catégorie de maintenance (le
modèle d'annotation des pages `Fichier:` prévu par le cadrage), pour que la
requête reste correcte même si `Depicts_specimen` venait un jour à être
posée ailleurs.

## État

Écrit sur le wiki. Voir `lot-9-tache2-rapport.md` pour le résultat de
l'écriture.
