# Lot 11 — nettoyage de Récapitulatif technique et distinction des deux contrôles

2026-08-21. Suite de `travaux/lot-11-itemref-pollution.md`. Points 1 et 4 :
diff proposé, arrêt à la proposition, rien écrit. Point 2 : confirmé sans
action. Point 3 : correction actée dans ce rapport, non consignée ailleurs.

## 1. Récapitulatif technique — diff proposé, rien écrit

Page relue avant de construire le diff (identique à la copie déjà en main
pour `travaux/lot-11-itemref-pollution.md` — aucun changement hors
session entre-temps).

```diff
 * <code>Template:Item numbering audit</code> interroge <code>[[Item_ref::+]]</code> '''sans aucun filtre de catégorie''' : la détection des trous porte sur tout le wiki, pas sur une classe.
+* <code>Template:Item numbering audit</code> interroge <code><nowiki>[[Item_ref::+]]</nowiki></code> '''sans aucun filtre de catégorie''' : la détection des trous porte sur tout le wiki, pas sur une classe.
```

```diff
 | Cette page || 1 || tableau des propriétés (<code>[[Has type::+]]</code>)
+| Cette page || 1 || tableau des propriétés (<code><nowiki>[[Has type::+]]</nowiki></code>)
```

Seuls ces deux fragments touchés — un `<nowiki>` ajouté à chaque fois,
rien d'autre modifié sur la ligne ni sur la page. Les `#ask`, `#show` et
transclusions `{{#tag:pre|{{#invoke:Source|...}}}}` restent tels quels,
intentionnels.

Résumé prévu : `[Correctif] Échapper deux exemples de syntaxe SMW
exécutés par erreur — annotation Item_ref parasite et Has type hors page
de propriété`.

Non écrit — en attente de validation.

## 2. Occurrences cosmétiques — laissées, comme demandé

`<code>[[a|b]]</code>` et `<code>[[File:x|150px]]</code>` (section
« Contraintes de rédaction des modèles ») : aucune propriété SMW en jeu,
aucun fait parasite possible, seulement un lien ou une image mal rendus.
Non touchées.

## 3. Classement de « + » — l'explication par les points de code retirée

Le rapport précédent expliquait le classement de `+` par sa position
dans les points de code (ASCII/Unicode). **Ce n'est pas établi.** Sous
une collation ICU — et `uca-fr` est justement demandée dans
`demandes-adminsys.md` pour ce wiki — l'ordre des caractères de
ponctuation ne suit pas nécessairement les points de code. Le fait
mesuré reste solide (`+` en tête d'un tri ascendant, absent des dix
premiers d'un tri descendant, position 95 sur 95) : c'est un résultat
observé directement, indépendant de toute théorie sur sa cause. La
tentative d'explication est retirée ; le fait, lui, tient. Non consignée
nulle part comme un fait établi, conformément à la demande.

## 4. CLAUDE.md — distinction des deux contrôles, diff proposé

Insertion juste après la nouvelle entrée sur les backticks (elle-même
juste après la leçon existante sur les exemples de syntaxe SMW), avant
« Une convention rédigée de mémoire ne fait pas foi » :

```diff
 - **Les backticks ne protègent rien en wikitexte.** Un exemple de syntaxe
   SMW écrit entre backticks s'exécute comme une vraie annotation ou une
   vraie requête. Seul `<nowiki>` protège. Ce piège est passé deux fois
   dans la session du 21 août 2026 (`LOC` dans `Attribut:Location site`,
   puis trois fragments dans *Limites connues*). Le patron maison est
   `<code><nowiki>…</nowiki></code>`.
 
+- **Deux contrôles distincts, qui ne se recouvrent pas.** `Erreurs de
+  traitement SMW` (`[[_ERRC::+]]`) voit les valeurs **rejetées** par SMW.
+  `browsebysubject` sans filtre sur une page voit les annotations
+  **acceptées à tort**. Une annotation fausse mais valide —
+  `Item_ref::+` — n'apparaît que dans le second. Aucun des deux ne
+  suffit seul.
+
 - **Une convention rédigée de mémoire ne fait pas foi.** La convention de
   nommage des 73 fichiers du lot 9 a été dictée dans une forme inexacte
```

Non écrit — en attente de validation.
