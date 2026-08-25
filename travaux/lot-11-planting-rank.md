# Lot 11 — Planting_rank en mètres : exécution

2026-08-24/25. Trois écritures, toutes faites cette session, sous le
libellé `[Amendement]`. Session ouverte par `bin/wiki-login.sh`
(`Success Cywil`) avant la première écriture ; chaque page relue
juste avant son écriture puis juste après, comme l'exige CLAUDE.md.

## 1. `Limites connues du Système de Gestion de Données Techniques`

Diff écrit tel que proposé dans `lot-11-erreurs-nombre.md`, sans
modification — relecture immédiatement avant écriture : identique à la
copie sur laquelle le diff avait été construit, aucune dérive hors
session. Un seul paragraphe touché (ligne 35 du wikitexte) :

```diff
-# '''<code>"result": "Success"</code> à l'écriture ne prouve pas que la donnée est stockée.''' L'API MediaWiki confirme l'enregistrement du '''wikitexte''' ; les contraintes de Semantic MediaWiki s'appliquent ensuite, et un rejet ne remonte pas à l'appel d'écriture. Deux cas rencontrés dans le lot 9, tous deux silencieux à l'écriture : le type <code>Number</code> en locale FR '''rejette le point décimal''' — <code>45.171420</code> est lu comme <code>45</code>, le reste étant écarté comme texte parasite ; il faut la virgule (<code>45,171420</code>), la valeur étant re-normalisée au point en interne, donc lisible normalement par tout <code>#ask</code> ou export. Constaté le 15 août 2026 sur les trois pages de lieu, dont <code>Latitude</code>/<code>Longitude</code> étaient totalement absentes des faits stockés. '''Seule une relecture après coup''' (<code>action=browsebysubject</code>, ou <code>action=parse&prop=text</code> qui affiche l'avertissement SMW en tête de page rendue) '''établit ce qui est réellement en base.'''
+# '''<code>"result": "Success"</code> à l'écriture ne prouve pas que la donnée est stockée.''' L'API MediaWiki confirme l'enregistrement du '''wikitexte''' ; les contraintes de Semantic MediaWiki s'appliquent ensuite, et un rejet ne remonte pas à l'appel d'écriture — '''silence côté <code>action=edit</code> seulement, pas côté SMW.''' Deux cas rencontrés dans le lot 9, tous deux invisibles à l'écriture mais posant un fait <code>_ERRC</code> côté SMW : le type <code>Number</code> en locale FR '''rejette le point décimal''' — sur <code>45.171420</code>, SMW ne parvient à assigner ni <code>45</code> ni le reste, '''la propriété reste entièrement non renseignée''', un avertissement s'affiche en tête de la page rendue (<code>action=parse&prop=text</code>) et le fait <code>_ERRC</code> correspondant est posé. Il faut la virgule (<code>45,171420</code>), la valeur étant re-normalisée au point en interne, donc lisible normalement par tout <code>#ask</code> ou export. Constaté le 15 août 2026 sur les trois pages de lieu, dont <code>Latitude</code>/<code>Longitude</code> étaient totalement absentes des faits stockés. '''Seule une relecture après coup''' (<code>action=browsebysubject</code>, ou <code>action=parse&prop=text</code>) '''établit ce qui est réellement en base — mais cette classe d'erreur est détectée par [[Erreurs de traitement SMW]]''' (<code><nowiki>[[_ERRC::+]]</nowiki></code>), à la différence d'une annotation fausse mais syntaxiquement valide comme <code>Item_ref::+</code>, qu'aucune erreur ne signale et que seul <code>action=browsebysubject</code> révèle.
```

Résumé : `[Amendement][Limites connues du SGDT] Précise l'entrée sur le
rejet du point décimal — _ERRC posé, détectable, à distinguer d'une
annotation fausse mais valide`. `oldrevid` 848 → `newrevid` 866. **Relu
après écriture** : identique au fichier envoyé. `browsebysubject` sur
cette page : seuls `_MDAT`/`_SKEY` — aucune pollution (le lien
`[[Erreurs de traitement SMW]]` est un lien normal, et
`<code><nowiki>[[_ERRC::+]]</nowiki></code>` comme `<code>Item_ref::+</code>`
ne portent pas de double crochets hors `<nowiki>`, donc aucune annotation
réelle produite).

## 2. `Planting_rank` en mètres — ECL-0023 et ECL-0026

Décision de Cyril : le rang se compte en mètres entiers depuis l'origine
du lieu. `A-1.5` = 1,5 tronçon de dix mètres = 15 m ; `A-0.2` = 0,2
tronçon de dix mètres = 2 m. Le point décimal était la seule cause du
rejet (diagnostic de `lot-11-erreurs-nombre.md`) — la correction ne
touche donc que `Planting_rank`, rien d'autre.

### ECL-0023 — `Menthe X — Le Buisson de Cerzat (ECL-0023)`

Relu avant écriture, identique à la copie de la session précédente.
```diff
-|Planting_rank=A-1.5
+|Planting_rank=15
```
Tout le reste du bloc (`site_code`, `ref_number`, `model_link`,
`Located_at=Le Buisson de Cerzat`, `Planting_date`, `Specimen_status`,
`Planted_count`, `Propagated_from`) inchangé — vérifié par diff complet
avant écriture, pas seulement sur la ligne visée.

### ECL-0026 — `Menthe bergamote — Le Buisson de Cerzat (ECL-0026)`

```diff
-|Planting_rank=A-0.2
+|Planting_rank=2
```
Même vérification : seul `Planting_rank` change, `Located_at=Le Buisson
de Cerzat` intact (la butte de la tranchée n'existe pas encore comme
lieu, rattachement prévu en tâche 6 — pas anticipé ici).

Résumé identique sur les deux pages : `[Amendement] Planting_rank en
mètres — correction de deux valeurs rejetées depuis leur saisie`.
`newrevid` 867 (ECL-0023) et 868 (ECL-0026). **Relues après écriture** :
identiques aux fichiers envoyés.

## 3. `Attribut:Planting rank` — description et `Property_range` corrigés

Wikitexte lu avant écriture (6 lignes, propriétés SMW en `[[...]]`
directement, pas de section `<noinclude>` documentaire séparée sur cette
page). La description mentait sur deux points : « la butte », comme s'il
n'y en avait qu'une, et « multiples de dix » présenté comme la donnée
elle-même plutôt que comme un pas d'insertion — confusion dont la tâche
6bis du lot 9 avait déjà noté la trace côté propriété de tri
(`CLAUDE.md`, section cadrage lieux).

**Vérification de longueur faite avant écriture** (`Property_range` est
`Keyword`, plafond 85 caractères, confirmé par `Limites connues du
SGDT` point 5) : la valeur retenue fait **76 caractères**, comptée par
script avant l'appel `wiki-put.sh`, pas estimée à l'œil.

```diff
 [[Has type::Number]]
-[[Property_description_FR::Position de l'exemplaire le long de la butte, numérotée de dix en dix pour permettre l'insertion sans renumérotation.]]
-[[Property_description_EN::Position of the specimen along the mound, numbered in steps of ten to allow insertion without renumbering.]]
+[[Property_description_FR::Position de l'exemplaire, en mètres entiers depuis l'origine du lieu où il se trouve — non comparable d'un lieu à l'autre.]]
+[[Property_description_EN::Position of the specimen, in whole metres from the origin of the location it is in — not comparable across locations.]]
 [[Property_cardinality::single]]
 [[Property_domain::Category:Physical item]]
-[[Property_range::rang ordinal, multiples de dix]]
+[[Property_range::Mètres entiers depuis l'origine du lieu, non comparable d'un lieu à l'autre.]]
```

**Une seule tentative d'écriture, comme demandé.** Résumé :
`[Amendement][Attribut:Planting rank] Description et Property_range
corrigés — mètres depuis l'origine du lieu, pas la butte, pas une
convention arbitraire de dix`. `oldrevid` 507 → `newrevid` 869. **Pas de
verrou rencontré** : `action=edit` a répondu `Success` directement, à la
différence des quinze pages `Attribut:` sous
`smw-change-propagation-protection` documentées dans `CLAUDE.md` — celle-ci
n'y est apparemment pas soumise. Relue après écriture : identique au
fichier envoyé.

## Vérifications

- **`browsebysubject` sur les deux plantations** : `Planting_rank`
  stocké (`15` sur ECL-0023, `2` sur ECL-0026), `_ERRC` absent des faits
  des deux pages — disparu sur les deux.
- **`Erreurs de traitement SMW`** : compte passé de 8 à **6**, confirmé
  par deux lectures indépendantes — `action=ask` en liste (`meta.count:
  6`, pas `format=count`, qui reste le chemin API cassé documenté dans
  `Limites connues du SGDT` point sur `format=count`) et le rendu de la
  page elle-même (`action=parse&prop=text` → « Nombre de pages en
  erreur : 6 »). **Déjà à jour sans purge** — la page affichait 6 dès la
  première lecture après les deux corrections, la ré-annotation ayant
  suffi à invalider le cache. Les six pages qui restent, toutes déjà
  documentées dans `Limites connues du SGDT` (dépassement des 85
  caractères de `Property_range`, lot 7 + `INSEE_code`) :
  `Attribut:Edible parts`, `Attribut:INSEE code`, `Attribut:Plant
  habit`, `Attribut:Propagation method`, `Attribut:Root system`,
  `Attribut:Seed treatment`.

## Résumé des écritures

| Cible | Action | Revid |
|---|---|---|
| `Limites connues du Système de Gestion de Données Techniques` | édition | 848 → 866 |
| `Menthe X — Le Buisson de Cerzat (ECL-0023)` | édition | 811 → 867 |
| `Menthe bergamote — Le Buisson de Cerzat (ECL-0026)` | édition | 809 → 868 |
| `Attribut:Planting rank` | édition | 507 → 869 |

Rien commité ni poussé dans cette session.
