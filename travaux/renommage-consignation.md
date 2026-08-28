# Consignation du renommage en production

Suite de `renommage-mesure.md`. Renommage fait à la main par Cyril :
`Extrémité de tranchée` → `Butte de l'extrémité amont de la tranchée
principale`, redirection laissée.

---

## 1. Entrée n° 34 de *Limites connues du SGDT* — ÉCRITE

`Limites connues du Système de Gestion de Données Techniques`
(pageid 144), résumé
`[Correctif] Limites connues — renommage en production, la convergence
se fait sans purge`.

`oldrevid` 1077 → `newrevid` 1081.

Contrôle post-écriture (`browsebysubject` sur la page) : elle ne porte
que `_MDAT` et `_SKEY`. Aucune annotation parasite — les exemples de
syntaxe sont tous en `<code><nowiki>…</nowiki></code>`.

Texte de l'entrée (une seule ligne `#`, ajoutée après l'entrée n° 33,
avant le `----` final) :

> **Un renommage de lieu avec redirection laissée fait converger seul
> le littéral stocké des propriétés de type `Page` qui visaient ce
> lieu — sans purge, et sans reparse des pages annotantes** (leur
> `_MDAT` reste antérieur au renommage). Premier cas **en production**,
> mesuré le 28 août 2026 : `Extrémité de tranchée` renommé à la main en
> `Butte de l'extrémité amont de la tranchée principale`, redirection
> laissée. Immédiatement après, `action=browsebysubject` lit le
> **nouveau** nom dans `Located_at` sur les deux items concernés et
> dans `Image_location` sur les deux pages de fichier, alors que le
> `_MDAT` des quatre pages est antérieur au renommage : c'est la
> propagation de changement déclenchée par le renommage lui-même qui
> réécrit l'annotation, pas un reparse. **Corrige les entrées n° 26 et
> n° 32**, toutes deux menées en bac à sable, qui tenaient la purge
> pour **nécessaire** à cette bascule : elle ne l'est pas. La purge
> sert au cache de page et à `pagelinks` — jamais au stockage SMW.
> **Deuxième correction : une requête sur l'*ancien* nom continue de
> rendre les résultats**, avec un `meta.hash` **identique** à la même
> requête sur le nouveau nom —
> `[[Located_at::Extrémité de tranchée]]` et
> `[[Located_at::Butte de l'extrémité amont de la tranchée principale]]`
> compilent vers la même requête, de même pour `Image_location`. SMW
> normalise la condition vers la cible de la redirection **avant** de
> compiler la requête : ce n'est pas une entrée d'index périmée, c'est
> la même requête. **Conséquence : la redirection est porteuse de
> données jusque dans les requêtes.** La supprimer casserait les
> quatre annotations d'un seul coup — lien mort, et surtout perte de la
> résolution en requête — sans toucher au wikitexte des quatre pages,
> qui porte toujours l'ancien nom en toutes lettres dans son
> `[[Located_at::…]]` / `[[Image_location::…]]`. **Deux couches à
> distinguer :** le stockage SMW converge seul, mais `pagelinks` et le
> cache de page restent sur l'ancien nom jusqu'à une purge avec
> `forcelinkupdate` — mesuré sur *Avancement du jardin-forêt*, dont la
> colonne « Lieu » générée par `#ask` affichait déjà le nouveau nom en
> rendu direct, mais qui figurait encore dans `list=backlinks` de
> l'ancien titre jusqu'à sa propre purge.

Faits chiffrés à l'appui (relevés dans `renommage-mesure.md`) :
`meta.hash` `Located_at` = `f6f9af30…` sur l'ancien comme sur le
nouveau nom ; `meta.hash` `Image_location` = `a80d1f9b…` de même.

---

## 2. Correction de *Catégorie:Lieu* — DIFF PROPOSÉ, PAS ÉCRIT

Section « Renommer un lieu », sous-sections 3 et 4. Deux blocs à
changer. La purge reste dans la procédure — seul le *pourquoi* est
faux, et le contrôle par « zéro sur l'ancien nom » est à retirer.

### Bloc A — étape 3, ouverture

**Actuel :**

```
=== 3. Purger toutes les pages recensées ===

C'est le reparse de ces pages qui fait basculer la valeur stockée vers le
nouveau titre.
```

**Proposé :**

```
=== 3. Purger toutes les pages recensées ===

'''Le renommage seul, redirection laissée, fait déjà basculer la valeur
stockée vers le nouveau titre''' — par la propagation de changement de SMW,
sans reparse des pages annotantes (mesuré en production le 28 août 2026, voir
[[Limites connues du Système de Gestion de Données Techniques|Limites connues
du SGDT]] n° 34). '''La purge ne sert pas à cette bascule.''' Elle rafraîchit
le cache de page et les liens indexés — <code><nowiki>pagelinks</nowiki></code>,
donc <code><nowiki>list=backlinks</nowiki></code> et les tableaux
<code><nowiki>#ask</nowiki></code> déjà rendus sur d'autres pages — qui restent
sur l'ancien titre tant que la page porteuse n'est pas reparsée. Sans la
purge, le stockage est juste mais l'affichage peut mentir pendant un délai
indéterminé.
```

Le paragraphe suivant (« Ordre de grandeur… », inchangé) reste
pertinent : le recensement propriété par propriété est toujours
nécessaire, ne serait-ce que pour savoir quelles pages purger pour le
cache.

### Bloc B — étape 4, paragraphe de contrôle final

**Actuel :**

```
Contrôler enfin sur deux ou trois pages de chaque famille — un item, un
fichier, un lieu enfant — en lisant les faits '''réellement stockés''', pas en
regardant la fiche. L'affichage suit la redirection et paraîtra correct dans
tous les cas : il ne prouve rien.
```

**Proposé :**

```
Contrôler enfin sur deux ou trois pages de chaque famille — un item, un
fichier, un lieu enfant — en lisant les faits '''réellement stockés'''
(<code><nowiki>action=browsebysubject</nowiki></code>), pas en regardant la
fiche. L'affichage suit la redirection et paraîtra correct dans tous les cas :
il ne prouve rien.

'''Ne pas attendre zéro d'une requête inverse sur l'ancien titre.''' Tant que
la redirection est en place, SMW normalise la condition vers sa cible avant de
compiler : <code><nowiki>[[Located_at::ancien titre]]</nowiki></code> rend
exactement le même résultat, et le même
<code><nowiki>meta.hash</nowiki></code>, que
<code><nowiki>[[Located_at::nouveau titre]]</nowiki></code>. L'ancien titre
reste une porte d'entrée valide vers les données. Le seul contrôle qui a du
sens est positif : lire le littéral stocké et vérifier qu'il porte le nouveau
titre.
```

### Résumé d'écriture proposé

`[Correctif] Catégorie:Lieu — la purge ne fait pas converger le stockage,
et l'ancien nom reste interrogeable`

**Arrêt ici. En attente de validation de Cyril avant d'écrire.**

---

## 3. Noté, pas traité — défaut d'outillage `wiki-purge.sh`

`bin/wiki-purge.sh` émet à **chaque appel** :

```
"warnings": { "main": { "warnings": "Unrecognized parameter: token." } }
```

Bénin — le `batchcomplete: true` et le `purged: true` sont là, la purge
a lieu. Mais c'est du bruit permanent qui masquerait un vrai
avertissement le jour où il s'en présente un.

À corriger avec les deux autres défauts d'outillage déjà en attente :

1. **`wiki-purge.sh`** — paramètre `token` passé là où l'API ne
   l'attend pas (probablement en query string au lieu du corps POST,
   ou en double).
2. **Code de sortie 0 sur sortie vide** — un `wiki-api.sh` qui ne sort
   rien renvoie quand même 0 (déjà consigné : proxy sortant refusé le
   24 août, file figée, etc. — une sortie vide n'est pas « aucun
   résultat »).
3. **Écriture en remplacement complet là où `appendtext` suffirait** —
   `wiki-put.sh` réécrit toute la page pour ajouter une entrée en fin
   de liste (cas de l'entrée n° 34 ci-dessus : toute la page
   *Limites connues* réécrite pour une ligne ajoutée).

Un seul passage d'outillage pour les trois.
