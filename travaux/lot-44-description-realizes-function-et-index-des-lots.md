# Lot 44 — description de `Realizes_function` au pluriel, et entrée 77 des Limites connues sur l'index des lots

Exécuté le 7 novembre 2026, entre 21 h 05 et 21 h 40 UTC, dans une session
Claude Code cloud, sur la branche `claude/nifty-einstein-i9t8kk`. Deux
écritures sur le wiki, réussies du premier coup, avec un arrêt entre les
deux et une réponse de Cyril. Les trois vérifications passent ; celle qui
tranche, la première, rend 76, 77 et 0.

## Étape 0 — état du dépôt

`git fetch origin`, puis `git status --porcelain` : sortie vide, aucun arrêt,
aux deux passages, au début puis à la reprise après l'échange. `HEAD` et
`origin/main` au même commit, `f667434`, les deux fois : rien à mettre à
jour. `.claude/settings.local.json` : absent au début, à la reprise et à la
fin de la tâche, donc aucune règle.

Session wiki : `bin/wiki-login.sh` rend `Success Cywil` avant toute lecture.

## Arrêt avant l'étape 2, et canal direct

L'étape 1 faite et vérifiée, la tâche s'est arrêtée avant l'étape 2. La
consigne disait que ce que relèverait le rapport serait seulement consigné,
sans nouveau correctif. Mais l'écart portait sur le texte à écrire : écrit
tel quel, il serait resté sur les Limites connues. Un point a été soumis à
Cyril :

- **A** : l'entrée fournie était démentie sur trois points. Elle datait la
  mesure des « 6 et 7 novembre 2026, aux clôtures des lots 4 et 5 », alors
  que les deux clôtures ont eu lieu le 7 novembre, à 15:44 et 20:43 UTC. Ses
  « quatorze puis trente secondes » étaient les chiffres du seul lot 5 ; pour
  le lot 4, c'était 35 et 74 secondes. Et son titre, « ne suit pas un
  changement d'état sans purge », était démenti par deux des cinq clôtures
  consignées dans `travaux/` : celles des lots 1 et 3, où l'index a suivi
  sans purge. Je proposais un texte de remplacement.

Réponse de Cyril, recopiée telle quelle :

```text
A. Remplacé. Écris ton texte, tel que tu l'as proposé, à la place de
l'entrée fournie. Le résumé ne change pas :

[Lot 44][Complément] l'index des lots demande une purge après un changement d'état

Puis les vérifications 1 et 3, le rapport, le commit et la poussée, comme
prévu.
```

L'entrée écrite est donc mon texte, accepté par Cyril, et non celui de la
consigne. Pour la trace, l'entrée fournie, qui n'a pas été écrite, était :

```text
# '''L'index des lots ne suit pas un changement d'état sans purge.''' Mesuré les 6 et 7 novembre 2026, aux clôtures des lots 4 et 5 : après le passage de <code><nowiki>Work_package_status</nowiki></code> de <code>livré</code> à <code>clos</code> sur la page du lot, [[Gestion des lots]] affichait encore l'ancien état quatorze puis trente secondes après l'écriture, et n'a montré le nouveau qu'après un <code><nowiki>action=purge</nowiki></code>. Les faits stockés sur la page du lot, eux, étaient à jour immédiatement. Conséquence : lire l'index pour vérifier qu'une écriture a pris mène à conclure qu'elle a échoué. Vérifier sur la page du lot, et purger l'index ensuite. Le suivi des dépendances de requêtes est pourtant actif depuis le 26 juillet 2026 ; pourquoi il ne couvre pas ce cas n'est pas établi.
```

## Lectures et mesures préalables

- `Attribut:Realizes function` lu par `bin/wiki-get.sh`
  (`action=parse&prop=wikitext`), puis de nouveau juste avant d'écrire :
  identique, révision 303 du 27 juillet 2026. Six lignes ; les deux lignes à
  remplacer y figurent une fois, lignes 2 et 3. Protection, par
  `prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full` :
  `protection: []` et aucun motif de refus, donc aucun verrou de propagation.
- Limites connues : relues juste avant l'ajout, identiques à la révision
  1742 écrite lors de la tâche précédente ; 76 entrées, la liste finit la
  page ; `prop=extlinks` : 0.
- Les cinq clôtures sur lesquelles repose l'entrée, d'après leurs rapports
  et les mesures de cette session :
  - lot 1, 29 octobre 2026 : « Sans purge, la ligne du lot 1 affiche
    « clos » » (`travaux/lot-1-cloture.md`), sans délai noté ;
  - lot 2, 2 novembre 2026 : encore « livré » une minute après l'écriture,
    puis « clos » après purge (`travaux/lot-2-cloture.md`) ;
  - lot 3, 6 novembre 2026 : déjà « clos » moins d'une minute après
    l'écriture, sans purge (`travaux/lot-3-cloture.md`) ;
  - lot 4, 7 novembre 2026 : encore « livré » à 35 puis 74 secondes, puis
    « clos » après purge (`travaux/lot-4-cloture.md`) ;
  - lot 5, 7 novembre 2026 : encore « livré » à 14 puis 30 secondes, puis
    « clos » après purge (`travaux/lot-5-cloture.md`).
  Dans les cinq cas, les faits stockés sur la page du lot étaient à jour dès
  la première lecture.
- Le suivi des dépendances de requêtes actif depuis le 26 juillet 2026 est
  documenté dans `travaux/lot-6-consolide.md`,
  `travaux/recap-maj-consolidee.md` et `travaux/sgdt-etat-des-lieux.md`. Il
  n'a pas été mesuré dans cette tâche.

## Écritures

| Étape | Page | Révision | Heure (UTC) | Résumé | Outil |
|---|---|---|---|---|---|
| 1 | Attribut:Realizes function | 303 → 1746 | 21:08:39 | `[Lot 44][Correctif] la description de Realizes_function passe au pluriel` | `bin/wiki-put.sh` |
| 2 | Limites connues du Système de Gestion de Données Techniques | 1742 → 1747 | 21:37:20 | `[Lot 44][Complément] l'index des lots demande une purge après un changement d'état` | `bin/wiki-append.sh` |

Les deux ont rendu `result: Success`, et `bin/wiki-verify.sh` a rendu
`IDENTIQUE` après chacune ; pour l'étape 2, la comparaison s'est faite avec
la page relue juste avant l'ajout, suivie du texte ajouté. Les deux résumés
sont ceux de la consigne, mot pour mot.

- **Écriture 1** : substitution exacte des deux lignes, recopiées telles
  quelles dans des fichiers ; les quatre autres lignes sont inchangées. Les
  faits de la propriété étaient lisibles dès la première lecture, vingt
  secondes après l'écriture, sans `_CHGPRO`, et `intestactions` ne rendait
  toujours aucun motif de refus.
- **Écriture 2** : `bin/wiki-append.sh` a passé son pré-contrôle (76 entrées,
  la liste finit la page) et ses deux post-contrôles (76 → 77, l'ajout est
  la dernière entrée ; au rendu, une seule liste numérotée).

## Les deux diffs

Les deux sont calculés sur les états de la page complétés chacun d'un saut
de ligne final, que le wiki ne garde pas. Le second est sans lignes de
contexte (`diff -U0`) : les entrées voisines sont longues, et aucune n'a
changé.

### Étape 1

```diff
--- realizes-303.txt
+++ realizes-1746.txt
@@ -1,6 +1,6 @@
 [[Has type::Page]]
-[[Property_description_FR::Lien vers la fonction technique que cet item organique réalise.]]
-[[Property_description_EN::Link to the technical function that this organic item realizes.]]
+[[Property_description_FR::Lien vers la ou les fonctions techniques que cet item organique réalise.]]
+[[Property_description_EN::Link to the technical function or functions that this organic item realizes.]]
 [[Property_cardinality::multiple]]
 [[Property_domain::Category:Organic item]]
 [[Property_range::Functional item]]
```

### Étape 2

```diff
--- limites-1742.txt
+++ limites-1747.txt
@@ -103,0 +104 @@
+# '''L'index des lots ne suit pas toujours un changement d'état sans purge.''' Relevé sur les cinq clôtures faites du 29 octobre au 7 novembre 2026 : après le passage de <code><nowiki>Work_package_status</nowiki></code> de <code>livré</code> à <code>clos</code> sur la page du lot, [[Gestion des lots]] a montré le nouvel état sans purge pour les lots 1 et 3, le second en moins d'une minute ; pour les lots 2, 4 et 5, il affichait encore l'ancien état au bout d'une minute, de soixante-quatorze secondes et de trente secondes, et n'a montré le nouveau qu'après un <code><nowiki>action=purge</nowiki></code>. Les faits stockés sur la page du lot, eux, étaient à jour dès la première lecture. Conséquence : lire l'index pour vérifier qu'une écriture a pris peut mener à conclure qu'elle a échoué. Vérifier sur la page du lot, et purger l'index ensuite. Le suivi des dépendances de requêtes est pourtant actif depuis le 26 juillet 2026 ; pourquoi il couvre certains cas et pas d'autres n'est pas établi.
```

## Vérifications

1. **Qui tranche : les Limites connues.** **76** entrées avant, **77**
   après : une entrée de plus, et une seule. La nouvelle est la dernière
   entrée et la dernière ligne de la page, elle y figure une fois, et la
   page de départ est intacte devant elle. Au rendu, la page n'a qu'une
   liste numérotée, de 77 éléments, dont elle est le dernier.
   `prop=extlinks` : **0** lien externe, sans suite ; le rendu n'en porte
   aucun non plus.
2. **`Attribut:Realizes function`** porte « la ou les fonctions
   techniques », une fois dans son wikitexte, et le fait
   `Property_description_FR -> Lien vers la ou les fonctions techniques que
   cet item organique réalise.` Il garde `Property_cardinality -> multiple`,
   ainsi que son type, `_wpg`, son domaine, `Organic item`, et sa portée,
   `Functional item`.
3. **Comptes**, par `action=ask` avec `limit=500`, sans suite pour aucun,
   après les deux écritures : `[[Has type::+]]` **161**, `[[Item_ref::+]]`
   **118**, `[[Realizes_function::+]]` **14**, avec 14 valeurs et un type
   résolu `_wpg`. Ce sont les comptes relevés lors de la clôture du lot 5,
   vers 20 h 44 UTC le même jour ; ils n'ont pas été remesurés au début de
   cette tâche.

Contrôles complémentaires, non demandés :

- Annotations (`smwbrowse`) : les Limites connues ne portent que `_INST`
  (`Page de suivi`), `_MDAT`, égal à l'heure de la révision 1747, et
  `_SKEY`. Aucun `_ERRC`.
- Catégories : `Catégorie:Page de suivi` seule, aucune catégorie de suivi.
- Rendu de la nouvelle entrée : le code est affiché tel quel,
  `Work_package_status`, `livré`, `clos` et `action=purge`, et son seul lien
  mène à `Gestion des lots`, qui existe.

## Écarts et surprises

Consignés, sans correctif, comme le demande la consigne.

- **L'entrée écrite est un texte de l'exécuteur**, accepté par Cyril au
  point A. Elle diffère de celle de la consigne par :
  - son titre, « ne suit pas toujours » ;
  - le relevé des cinq clôtures, avec leurs délais ;
  - « dès la première lecture » au lieu de « immédiatement » ;
  - « peut mener » au lieu de « mène » ;
  - sa dernière proposition, « pourquoi il couvre certains cas et pas
    d'autres ».
- **Le résumé de l'étape 2 dit plus que l'entrée.** Gardé tel quel sur la
  réponse de Cyril, il annonce « l'index des lots demande une purge après un
  changement d'état », alors que l'entrée dit « pas toujours ». Un résumé ne
  se corrige pas une fois écrit.
- **Aucune des cinq observations n'a attendu plus de 74 secondes.** Que
  l'index finisse par suivre de lui-même au-delà n'est pas mesuré : chaque
  fois qu'il n'avait pas suivi, la purge a été faite aussitôt.
- **Le délai du lot 1 n'est pas connu**, son rapport ne le notant pas :
  l'entrée ne lui en attribue aucun.
