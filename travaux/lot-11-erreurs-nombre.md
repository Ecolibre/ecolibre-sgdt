# Lot 11 — erreurs de type Number : ECL-0023, ECL-0026, et la doc

2026-08-25. Deux points courts, en lecture seule pour le premier, en
proposition pour le second. Rien écrit sur le wiki dans cette session.

## 1. Diagnostic — ECL-0023 et ECL-0026

### ECL-0023 — `Menthe X — Le Buisson de Cerzat (ECL-0023)`

Wikitexte relevé :
```
{{Physical item
|site_code=ECL
|ref_number=0023
|model_link=Menthe X origine inconnue
|description=
|sn=
|physical_parent=
|Located_at=Le Buisson de Cerzat
}}
{{Physical facet plant
|Planting_date=
|Planting_rank=A-1.5
|Specimen_status=en place
|Planted_count=1
|Propagated_from=Menthe X — Terrasse de Chilhac (ECL-0024)
}}
```
**Propriété fautive : `Planting_rank`. Valeur tapée : `A-1.5`.**
Message affiché (`action=parse&prop=text`) : « **"A" ne peut pas être
affecté à un type de nombre déclaré avec la valeur -1.** » `browsebysubject`
confirme : aucun fait `Planting_rank` stocké, un `_ERRC` présent, le reste
du bloc (`Instance_of`, `Inventory_number`, `Located_at`, `Planted_count`,
`Specimen_status`, `Propagated_from`…) est bien enregistré — le rejet ne
porte que sur cette propriété.

### ECL-0026 — `Menthe bergamote — Le Buisson de Cerzat (ECL-0026)`

Wikitexte relevé :
```
{{Physical item
|site_code=ECL
|ref_number=0026
|model_link=Menthe bergamote Escuroux 2025
|description=
|sn=
|physical_parent=
|Located_at=Le Buisson de Cerzat
}}
{{Physical facet plant
|Planting_date=2025-11-17
|Planting_rank=A-0.2
|Specimen_status=en place
|Planted_count=1
|Propagated_from=
}}
```
**Propriété fautive : `Planting_rank`. Valeur tapée : `A-0.2`.**
Message affiché : « **"A" ne peut pas être affecté à un type de nombre
déclaré avec la valeur -0.** » Même situation : `Planting_rank` absent des
faits stockés, `_ERRC` présent, le reste du bloc enregistré normalement
(y compris `Planting_date`, absent sur ECL-0023).

**Précision par rapport au cadrage de la question** : les deux messages
sont bien « -1 » et « -0 », mais dans l'ordre inverse de celui suggéré —
c'est **ECL-0023** qui porte « -1 » et **ECL-0026** qui porte « -0 », pas
l'inverse. Vérifié par lecture directe (`action=parse&prop=text` sur
chaque page), pas supposé.

### Le mécanisme, et une nuance par rapport au test décimal

`Attribut:Planting_rank` est de type `_num` (`Number`), avec pour
description « Position de l'exemplaire le long de la butte, numérotée de
dix en dix » (`Property_range` : « rang ordinal, multiples de dix ») — un
entier simple était attendu, pas la notation à deux temps utilisée ici
(une lettre de zone, un tiret, un rang décimal).

Le mécanisme de rejet est le même que celui mesuré sur `Latitude`/
`Longitude` (`lot-11-titres-execution.md`, section 2) : un type `Number`
qui échoue à consommer l'intégralité de la valeur tapée pose un `_ERRC`
et n'enregistre rien, plutôt que de tronquer silencieusement. Mais la
forme du message diffère d'une manière qui mérite d'être signalée plutôt
que glissée sous le même résumé : dans le test décimal, le fragment en
cause suivait la partie reconnue (`".171420"` après `45`). Ici, le
fragment en cause (`"A"`) est la **lettre de tête**, alors que la valeur
déclarée (`-1`, `-0`) provient de la **fin** de la chaîne (`-1.5`,
`-0.2`, tiret lu comme signe moins). Ce que fait exactement le parseur de
SMW entre ces deux extrémités n'a pas été établi ici — pas supposé,
seulement observé : dans les deux cas, le résultat net est le même
(rejet complet, aucune valeur stockée), mais la mécanique d'analyse du
texte n'est visiblement pas un simple balayage gauche→droite qui
s'arrêterait au premier caractère invalide.

**Aucune correction faite** — diagnostic seul, comme demandé.
`Planting_rank` reste non renseigné sur ces deux pages tant que Cyril n'a
pas tranché la notation à utiliser (l'entier « multiples de dix » du
modèle de données, ou la notation zone+rang constatée ici, qui suppose
un changement de type de propriété).

## 2. `Limites connues du Système de Gestion de Données Techniques` — diff proposé

Page relue intégralement (titre exact confirmé par recherche — le titre
court « Limites connues du SGDT » ne correspond à aucune page). L'entrée
visée est le point sur `"result": "Success"` (ligne 35 du wikitexte),
qui couvre déjà le cas décimal mais avec deux imprécisions : elle ne dit
pas que SMW détecte lui-même ce rejet (`_ERRC`), et une phrase (« `45`
est lu comme `45`, le reste étant écarté ») laisse croire qu'une partie
de la valeur est conservée — **mesuré faux** : dans les trois tests de
cette session (`lot-11-titres-execution.md`), aucune valeur partielle
n'est jamais restée, la propriété est entièrement vide dans les trois cas
où le point apparaît.

```diff
 # '''<code>"result": "Success"</code> à l'écriture ne prouve pas que la donnée est stockée.''' L'API MediaWiki confirme l'enregistrement du '''wikitexte''' ; les contraintes de Semantic MediaWiki s'appliquent ensuite, et un rejet ne remonte pas à l'appel d'écriture. Deux cas rencontrés dans le lot 9, tous deux silencieux à l'écriture : le type <code>Number</code> en locale FR '''rejette le point décimal''' — <code>45.171420</code> est lu comme <code>45</code>, le reste étant écarté comme texte parasite ; il faut la virgule (<code>45,171420</code>), la valeur étant re-normalisée au point en interne, donc lisible normalement par tout <code>#ask</code> ou export. Constaté le 15 août 2026 sur les trois pages de lieu, dont <code>Latitude</code>/<code>Longitude</code> étaient totalement absentes des faits stockés. '''Seule une relecture après coup''' (<code>action=browsebysubject</code>, ou <code>action=parse&prop=text</code> qui affiche l'avertissement SMW en tête de page rendue) '''établit ce qui est réellement en base.'''
+# '''<code>"result": "Success"</code> à l'écriture ne prouve pas que la donnée est stockée.''' L'API MediaWiki confirme l'enregistrement du '''wikitexte''' ; les contraintes de Semantic MediaWiki s'appliquent ensuite, et un rejet ne remonte pas à l'appel d'écriture — '''silence côté <code>action=edit</code> seulement, pas côté SMW.''' Deux cas rencontrés dans le lot 9, tous deux invisibles à l'écriture mais posant un fait <code>_ERRC</code> côté SMW : le type <code>Number</code> en locale FR '''rejette le point décimal''' — sur <code>45.171420</code>, SMW ne parvient à assigner ni <code>45</code> ni le reste, '''la propriété reste entièrement non renseignée''', un avertissement s'affiche en tête de la page rendue (<code>action=parse&prop=text</code>) et le fait <code>_ERRC</code> correspondant est posé. Il faut la virgule (<code>45,171420</code>), la valeur étant re-normalisée au point en interne, donc lisible normalement par tout <code>#ask</code> ou export. Constaté le 15 août 2026 sur les trois pages de lieu, dont <code>Latitude</code>/<code>Longitude</code> étaient totalement absentes des faits stockés. '''Seule une relecture après coup''' (<code>action=browsebysubject</code>, ou <code>action=parse&prop=text</code>) '''établit ce qui est réellement en base — mais cette classe d'erreur est détectée par [[Erreurs de traitement SMW]]''' (<code><nowiki>[[_ERRC::+]]</nowiki></code>), à la différence d'une annotation fausse mais syntaxiquement valide comme <code>Item_ref::+</code>, qu'aucune erreur ne signale et que seul <code>action=browsebysubject</code> révèle.
```

Trois changements, dans l'ordre où ils apparaissent dans le diff :
1. « silence côté `action=edit` seulement, pas côté SMW » — reformule ce
   que Cyril a demandé de préciser : ce n'est pas un rejet silencieux au
   sens absolu, seul l'appel d'écriture ne dit rien.
2. « la propriété reste entièrement non renseignée » remplace « le reste
   étant écarté comme texte parasite » — corrige l'imprécision mesurée
   (rien n'est conservé, ni `45` ni le reste), et ajoute que le fait
   `_ERRC` est posé au moment du rejet, pas seulement à la relecture.
3. Phrase finale ajoutée : la classe d'erreur est détectée par
   `[[Erreurs de traitement SMW]]` (`[[_ERRC::+]]`), à la différence
   d'une annotation fausse mais valide comme `Item_ref::+`.

Pas écrit — proposition seule, comme demandé.
