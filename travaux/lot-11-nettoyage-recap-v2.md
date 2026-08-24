# Lot 11 — nettoyage de Récapitulatif technique : diff corrigé

2026-08-21. Suite de `travaux/lot-11-nettoyage-recap.md`. Le diff du
point 1 de ce rapport était mal formé — repris ici en remplacement
correct. Points 2 et 4 de la consigne reportés au tour suivant, une fois
ce diff-ci validé (voir note en fin de fichier).

## 1. Diff corrigé — remplacement, pas ajout

Le diff précédent ajoutait la ligne corrigée sous la fautive au lieu de
la remplacer : appliqué tel quel, la page aurait porté les deux lignes
en double, `Item_ref::+` toujours actif. Corrigé ici en remplacement
strict, une ligne `-` pour une ligne `+`, pour chacun des deux fragments.

```diff
-* <code>Template:Item numbering audit</code> interroge <code>[[Item_ref::+]]</code> '''sans aucun filtre de catégorie''' : la détection des trous porte sur tout le wiki, pas sur une classe.
+* <code>Template:Item numbering audit</code> interroge <code><nowiki>[[Item_ref::+]]</nowiki></code> '''sans aucun filtre de catégorie''' : la détection des trous porte sur tout le wiki, pas sur une classe.
```

```diff
-| Cette page || 1 || tableau des propriétés (<code>[[Has type::+]]</code>)
+| Cette page || 1 || tableau des propriétés (<code><nowiki>[[Has type::+]]</nowiki></code>)
```

Rien d'autre modifié : une ligne remplace l'autre à chaque fois, le reste
de la page intact.

**Non écrit — comme demandé, en attente de validation avant l'étape 2.**

## 2. Écriture de la page — reportée

Consigne explicite : n'écrire qu'après validation du diff ci-dessus.
Aucune validation reçue dans ce même tour — rien écrit sur
`Récapitulatif technique` ici. À faire au tour suivant, avec le contrôle
`browsebysubject` demandé au point 4 juste après.

## 3. CLAUDE.md — diff du point 4, écrit et relu

Déjà validé tel quel dans le tour précédent, sans dépendance au point 1.
Page relue avant écriture (fichier local, inchangé depuis la dernière
lecture).

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

Appliqué. Relu après écriture (fichier local) : l'entrée est en place,
identique au diff.

## 4. Vérification post-écriture — reportée

Dépend de l'écriture du point 2, elle-même reportée. À faire au tour
suivant, immédiatement après l'écriture de `Récapitulatif technique` :
`browsebysubject` sans filtre sur la page, contrôle que `Item_ref` et
`_ERRC` ont disparu tous les deux. Si l'un persiste, le rapporter sans
retenter — `wiki-purge.sh` en recours, pas une nouvelle écriture.
