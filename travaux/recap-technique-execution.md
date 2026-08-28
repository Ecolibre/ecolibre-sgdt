# [Amendement] Récapitulatif technique — exécution

**Date : 28 août 2026. Une seule écriture, réussie, relue.**

Base : `travaux/recap-technique-proposition.md`, amendée par les quatre
ajustements donnés par Cyril dans sa demande — chiffre retiré, comptes
vivants regroupés (Lieu + Organisation), facettes en renvoi avec compte
vivant, deux arbitrages tranchés (section jumelle, option A). Écrite en une
seule édition, comme le résumé fourni par Cyril le laissait entendre.

---

## 1. L'écriture

| Page | oldrevid | newrevid | Résumé |
|---|---|---|---|
| `Récapitulatif technique du Système de Gestion de Données Techniques` | 1006 | 1088 | `[Amendement] Récapitulatif technique — Organisation, appartenance, souhait, segment de position, Location_lineage inutilisée` |

Wikitexte courant relu avant écriture (`bin/wiki-get.sh`, 446 lignes),
diff calculé, écrit (`bin/wiki-put.sh`), puis relu après écriture : le
texte en place est **identique** au texte prévu (`diff` vide entre le
fichier envoyé et la relecture post-écriture).

## 2. Diff réellement appliqué

### a) Comptes vivants (Lieu, Organisation), juste après le tableau des quatre classes

```diff
 La définition complète de chaque classe figure sur sa page de catégorie.
 
+Deux autres catégories tiennent le même genre d'effectif vivant, hors de
+cette chaîne :
+
+{| class="wikitable"
+! Catégorie !! Effectif
+|-
+| [[:Category:Lieu|Category:Lieu]] || {{#ask: [[Category:Lieu]] |format=count}}
+|-
+| [[:Category:Organisation|Category:Organisation]] || {{#ask: [[Category:Organisation]] |format=count}}
+|}
+
 === Les lieux sont hors de la chaîne ===
```

Une seule table à deux lignes, comme demandé — pas fusionnée dans le
tableau des quatre classes, mais adjacente, même mécanisme
(`{{#ask:}}` inline, `format=count`).

### b) Exemple périmé — option A retenue (retrait des noms)

```diff
 <code>Category:Lieu</code> n'est pas un cinquième niveau : c'est un ensemble
-d'items physiques (Le Buisson de Cerzat, Jardin de Chilhac, Terrasse de
-Chilhac) que les autres items physiques désignent par <code>Located_at</code>.
-Un lieu ne réalise pas de fonction et n'a pas de référencé au-dessus de lui.
+d'items physiques — un terrain, une parcelle, une pièce — que les autres
+items physiques désignent par <code>Located_at</code>. Un lieu ne réalise pas
+de fonction et n'a pas de référencé au-dessus de lui.
```

### c) Organisation, appartenance/souhait, Location_lineage — juste après « Les lieux sont hors de la chaîne »

Trois nouvelles sous-sections `===`, dans cet ordre, insérées avant
« Numérotation : trois banques de références » :

1. **`Organisation est hors de la chaîne, comme les lieux`** — section
   jumelle, pas généralisation, comme tranché par Cyril. Reprend le texte
   de la proposition sans changement : catégorie posée par
   `Modèle:Organisation`, aucune propriété qui la relie directement à la
   chaîne (contrairement aux lieux via `Located_at`), atteinte seulement
   par `Owned_by`/`Wanted_by`.
2. **`Appartenance et souhait : portés par l'item, pas par le lieu`** —
   texte de la proposition repris sans changement. **Aucun chiffre cité** :
   le texte proposé pour cette sous-section n'en contenait déjà aucun (le
   « 29 » signalé par Cyril n'était présent que dans la prose d'argumentaire
   du rapport de proposition, section « L'argument », jamais dans le bloc
   « Texte proposé » réellement destiné à l'écriture) — rien à corriger dans
   le wikitexte lui-même.
3. **`Location_lineage : déclarée, vide, et pourquoi`** — texte de la
   proposition repris avec une correction : le lien
   `[[Limites connues du Système de Gestion de Données Techniques]]` était
   replié sur deux lignes dans le rapport de proposition (pli de mise en
   page du document, pas du contenu). Remis sur une seule ligne avant
   écriture — piège documenté dans CLAUDE.md, qui aurait cassé le lien
   silencieusement (absent de `pagelinks`/`list=backlinks`, aucune erreur
   d'API). Le renvoi cible l'entrée n° 31 de *Limites connues*, relue à
   jour avant écriture : elle traite bien du patron `#show`→`#set` cassé
   sur une propriété de type Page, et porte déjà elle-même la phrase
   « `Location_lineage` existe pour cette raison et reste sans porteur » —
   cohérence confirmée dans les deux sens.

### d) Planting_rank_end, dans « La maille d'une plantation »

```diff
 items (<code>ECL-0032</code> et <code>ECL-0033</code>) : deux mises en terre à
 deux dates, pas un doublon.
 
+<code>Planting_rank</code> et <code>Planting_rank_end</code> bornent la
+position d'une plantation sur son lieu, en mètres entiers depuis l'origine
+de celui-ci : <code>Planting_rank</code> marque le début ; <code>
+Planting_rank_end</code>, facultative, marque la fin pour une plantation en
+ligne ou en bande — laissée vide, la plantation est ponctuelle. Aucune
+contrainte n'assure que la fin suive le début, et les deux propriétés
+restent volontairement orthogonales à <code>Planted_count</code>, qui
+compte les pieds sans en dire la disposition.
+
 Une plantation issue de la division ou du bouturage d'une autre pointe vers
```

Texte de la proposition, sans changement.

### e) Facettes — renvoi avec compte vivant (piste 2 amendée)

```diff
 {{#tag:pre|{{#invoke:Source|get|Template:Physical item}}}}
 
+Les modèles de facette ne sont pas listés ici : voir le
+[[Registre des facettes]], qui en recense actuellement {{#ask: [[Category:Facette]] |format=count}}.
+
 == 3. Formulaires de Saisie (Forms) ==
```

Renvoi vers le Registre des facettes (piste 2), amendé du compte vivant
demandé par Cyril : `{{#ask: [[Category:Facette]] |format=count}}` — même
catégorie que celle interrogée par `Registre des facettes` lui-même
(vérifié en lisant cette page avant d'écrire : `{{#ask: [[Category:Facette]]
|format=list}}`), donc le nombre affiché ici et la liste affichée là-bas
portent sur le même ensemble.

---

## 3. Les quatre vérifications demandées

**1. `Item_ref` ne doit pas réapparaître dans `browsebysubject`.**
Page purgée (`bin/wiki-purge.sh`) puis interrogée
(`action=browsebysubject&subject=...`). Quatre clés seulement :
`_ASK` (les requêtes intégrées), `_INST` (catégorie SGDT), `_MDAT`,
`_SKEY`. **`Item_ref` absent.** ✅

**2. Les comptes vivants rendent un nombre, pas un vide.**
Page rendue via `action=parse&prop=text` (POST direct à la main, comme
l'exige CLAUDE.md pour un `text=`/`page=` long — `wiki-api.sh` ne fait que
du GET). Lu dans le HTML rendu :
- `Category:Lieu` → **13**
- `Category:Organisation` → **1**
- renvoi facettes → « qui en recense actuellement **3** »

Trois nombres réels, aucun vide. ✅

**3. Aucun lien rouge introduit.**
`Category:Lieu`, `Category:Organisation` et `Registre des facettes`
vérifiés existants avant écriture (`action=query&titles=...`, tous trois
avec `pageid`). Le renvoi vers *Limites connues* pointe une page déjà
existante et déjà liée ailleurs sur cette même page. Les seuls liens
rouges présents dans le rendu (`A`, `File:x`, `...`) sont les exemples
illustratifs de la section « Contraintes de rédaction des modèles »,
antérieurs à cette édition et non touchés par elle (confirmé par grep sur
le wikitexte d'avant édition). **Aucun lien rouge nouveau.** ✅

**4. `Erreurs de traitement SMW` reste à 1.**
Mesuré avant et après par `action=ask&format=list` (jamais
`format=count`, cassé sur ce chemin — entrée n° 28 de *Limites connues*) :
longueur de `results` = **1** dans les deux cas. ✅

---

## Écart par rapport aux instructions

Un seul, mineur, corrigé avant écriture et non demandé explicitement par
Cyril : le lien vers *Limites connues* dans le texte de la proposition
était replié sur deux lignes (artefact du document `travaux/`, pas du
contenu prévu pour le wiki) — remis sur une seule ligne, conformément à la
règle CLAUDE.md sur les liens `[[ ]]` pliés, avant toute écriture. Aucun
autre écart : le chiffre « 29 » n'avait pas besoin d'être retiré du
wikitexte lui-même (il n'y figurait pas), les deux arbitrages ont été
appliqués tels que tranchés, et l'ordre d'insertion suit exactement celui
donné par Cyril.
