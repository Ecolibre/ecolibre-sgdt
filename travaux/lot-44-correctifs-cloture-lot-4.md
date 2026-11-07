# Lot 44 — correctifs après la clôture du lot 4 : banque d'inventaire datée du lot 4, valeur de numérotation, puces des banques sur une ligne, durcissement du lot 6, entrée 76

Exécuté le 7 novembre 2026, vers 16 h 30 UTC, dans une session Claude Code
cloud, sur la branche `claude/nifty-einstein-i9t8kk`. Quatre écritures sur le
wiki, sur trois pages, toutes réussies du premier coup, après un arrêt avant
écriture et quatre réponses de Cyril, qui ont ajouté une quatrième écriture
aux trois de la consigne. Les trois vérifications passent ; celle qui
tranche, la deuxième, compte 23 blocs `<pre>` au rendu du Récapitulatif
avant les écritures, et 18 après.

## Étape 0 — état du dépôt

`git fetch origin`, puis `git status --porcelain` : sortie vide, aucun arrêt,
aux deux passages, au début puis à la reprise après l'échange. `HEAD` et
`origin/main` au même commit, `ce7617d`, les deux fois : rien à mettre à
jour. `.claude/settings.local.json` : absent au début, à la reprise et à la
fin de la tâche, donc aucune règle.

Session wiki : `bin/wiki-login.sh` rend `Success Cywil` à la reprise, avant
la première écriture. Les lectures d'avant l'échange ont réutilisé la session
ouverte pour la clôture du lot 4.

## Arrêt avant écriture, et échanges par le canal direct

Quatre points ont été soumis à Cyril avant toute écriture :

- **A** : la chaîne de l'étape 1 n'était pas telle quelle sur la page.
  « items physiques : décision du lot 9, 13 août 2026 » est repliée sur les
  lignes 163 et 164, coupée par un retour à la ligne après « lot 9, ». La
  mention des planches de culture, ligne 72, tient sur une ligne.
- **B** : replier la nouvelle puce « vers 78 caractères », comme le demandait
  l'étape 2, l'aurait cassée au rendu. La page replie ses puces par des
  lignes de continuation indentées de deux espaces ; au rendu, seule la
  première ligne de chaque puce reste dans la liste, la suite tombe dans un
  bloc `<pre>`. Mesuré sur la révision 1733 : les cinq « points qui en
  découlent » étaient les cinq seules puces repliées de la page, et les cinq
  blocs `<pre>` en trop au rendu (23, dont 18 viennent des `#tag:pre` qui
  affichent du code).
- **C** : le texte de l'étape 3 disait « n'a que trois révisions, la
  dernière du 7 avril 2026 », puis « y datent toutes deux de cette révision
  d'avril ». Deux des trois révisions sont du 7 avril : la 235 introduit
  l'extraction et la normalisation dans `p.next`, la 237, la dernière, ajoute
  `p.findGaps` avec les siennes. L'entrée 76 des Limites connues, proposée
  par moi lors de la clôture du lot 4, portait la même simplification :
  « de sa révision du 7 avril 2026 ».
- **D** : « c'est la seule valeur que `Module:Base36` reçoit » est vrai pour
  la banque d'inventaire, pas pour le module, qui reçoit aussi `Item_ref` et
  `Location_number`. La formule venait de mon rapport de clôture du lot 4, où
  elle ne visait que la banque d'inventaire.

Réponse de Cyril, recopiée telle quelle :

```text
A. Oui, remplace en gardant le repli. Le rendu sera identique.

B. Une seule ligne, et rejoins les quatre autres dans la même écriture.

Écris la nouvelle puce sur une ligne unique, sans aucun repli. Puis, dans la
même écriture, rejoins les quatre autres puces des "Cinq points qui en
découlent" : dans chacune, remplace le saut de ligne et les deux espaces
d'indentation qui le suivent par une espace unique. Ne change aucun autre
caractère : ni un mot, ni une balise, ni une ponctuation.

Résumé : [Lot 44][Correctif] les cinq puces des banques de références sur une ligne chacune

CONTRÔLE QUI TRANCHE, en remplacement du contrôle 2 : le rendu du
Récapitulatif passe de 23 blocs <pre> à 18. Donner les deux chiffres. S'il
en reste plus de 18, une puce est encore coupée : le dire sans corriger.

C. Précisé, aux deux endroits.

Dans l'étape 3, remplace :

n'a que trois révisions, la dernière du 7 avril 2026

par :

n'a que trois révisions, les deux dernières du 7 avril 2026

et remplace :

y datent toutes deux de cette révision d'avril

par :

y datent toutes deux de ce 7 avril

Et ajoute une quatrième écriture, sur l'entrée 76 des Limites connues :
remplace "de sa révision du 7 avril 2026" par "de ses révisions du 7 avril
2026".

Résumé : [Lot 44][Correctif] l'entrée 76 parle de deux révisions, non d'une

D. Restreint. Dans la puce de l'étape 2, remplace :

c'est la seule valeur que <code>Module:Base36</code> reçoit

par :

c'est la seule valeur de la banque d'inventaire que <code>Module:Base36</code> reçoit

Le reste des quatre étapes, les autres vérifications et le rapport sont
inchangés. Exécute.
```

Les remplacements C et D ont été appliqués par substitution exacte des
chaînes données, sur les textes de la consigne recopiés d'abord tels quels.
Les textes écrits sont ceux de la consigne, modifiés par ces réponses et par
elles seules.

## Lectures et mesures préalables

- Les trois pages ont été lues par `bin/wiki-get.sh`
  (`action=parse&prop=wikitext`) avant l'échange, puis de nouveau juste avant
  chaque écriture : identiques. Révisions de départ : Récapitulatif 1733,
  lot 6 1714, Limites connues 1737. Protections, par
  `prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full` :
  `protection: []` et aucun motif de refus, sur les trois.
- Ancrages sur le Récapitulatif : la chaîne de l'étape 1, une fois, repliée
  sur les lignes 163 et 164 ; la mention des planches, « décision du lot 9,
  13 août 2026 », une fois, ligne 72. La liste des « Cinq points qui en
  découlent » occupe les lignes 178 à 206 : cinq puces de 6, 4, 6, 5 et
  8 lignes, une seule commençant par « '''La valeur stockée est non
  préfixée.''' », et toutes leurs lignes de continuation commencent par
  exactement deux espaces, sans espace en fin de ligne ni tabulation.
  « jamais en base » : une fois, ligne 180.
- Ancrages sur le lot 6 : « Points ouverts » est la seule section, et le
  paragraphe sur `Item_ref` en est la dernière ligne, ligne 17. Sur les
  Limites connues : « de sa révision du 7 avril 2026 », une fois, dans
  l'entrée 76, dernière des 76.
- Rendu du Récapitulatif, révision 1733 : 23 blocs `<pre>`, 18 appels
  `#tag:pre` dans le wikitexte, et 5 blocs `<pre>` qui suivent directement
  une liste à puces, un par puce repliée.
- Faits des textes, vérifiés avant d'écrire : `Module:Base36` a toujours pour
  dernière révision la 237, du 2026-04-07T16:15:52Z ; les 50 membres de
  `Catégorie:Physical item` portent tous un `Inventory_ref` égal à
  `Inventory_site`, un tiret, `Inventory_number` ; le lot 6 est ouvert le
  9 août et livré le 10 août 2026.
- Comptes de départ, par `action=ask` avec `limit=500`, sans suite pour
  aucun : `[[Has type::+]]` 161, `[[Item_ref::+]]` 118,
  `[[Inventory_number::+]]` 50.

## Écritures

| N° | Page | Révision | Heure (UTC) | Résumé | Outil |
|---|---|---|---|---|---|
| 1 | Récapitulatif technique du Système de Gestion de Données Techniques | 1733 → 1739 | 16:32:06 | `[Lot 44][Correctif] la banque d'inventaire date du lot 4, non du lot 9` | `bin/wiki-put.sh` |
| 2 | Récapitulatif technique du Système de Gestion de Données Techniques | 1739 → 1740 | 16:32:48 | `[Lot 44][Correctif] les cinq puces des banques de références sur une ligne chacune` | `bin/wiki-put.sh` |
| 3 | Lot 6 — Durcissement du module de références | 1714 → 1741 | 16:33:11 | `[Lot 44][Complément] le durcissement annoncé par le lot 6 n'a pas eu lieu non plus` | `bin/wiki-put.sh` |
| 4 | Limites connues du Système de Gestion de Données Techniques | 1737 → 1742 | 16:34:22 | `[Lot 44][Correctif] l'entrée 76 parle de deux révisions, non d'une` | `bin/wiki-put.sh` |

Les quatre ont rendu `result: Success`, et `bin/wiki-verify.sh` a rendu
`IDENTIQUE` après chacune. Les résumés sont ceux de la consigne et des
réponses de Cyril, mot pour mot.

- **Écriture 1** : substitution de « décision du lot 9,⏎13 août 2026 » par
  « décision du lot 4,⏎26 juillet 2026 », le retour à la ligne gardé à sa
  place, comme l'a décidé la réponse A.
- **Écriture 2** : construite par un programme dont les contrôles ont tous
  passé : une seule puce de départ, précédée de « Cinq points qui en
  découlent, à ne pas défaire : » et d'une ligne vide ; la liste finit à la
  première ligne vide ; cinq puces ; chaque ligne de continuation commence
  par exactement deux espaces. Pour les quatre puces jointes, la nouvelle
  ligne est l'ancien texte où chaque saut de ligne suivi de deux espaces
  devient une espace, ses caractères hors blancs sont identiques à ceux
  d'avant, et sa longueur a diminué de deux caractères par jonction. La page
  passe de 655 à 631 lignes.
- **Écriture 4** : réécriture complète par `bin/wiki-put.sh`, puisque
  `bin/wiki-append.sh` ne corrige pas une entrée. Comparée au caractère près
  avec la révision 1737, la page ne diffère qu'en deux points : « sa »
  devenu « ses », et un « s » ajouté à « révision ».

## Les quatre diffs

### Écriture 1

```diff
--- recap-1733.txt
+++ recap-1739.txt
@@ -160,8 +160,8 @@
 ont la leur ; les lieux ont la leur. '''Trois compteurs séparés''', donc, et
 non un seul — mais tous en Base 36 sur quatre caractères : ce qui diffère
 d'une banque à l'autre, c'est la séquence, pas l'encodage. Il y a ainsi
-'''trois banques de références''' (items physiques : décision du lot 9,
-13 août 2026 ; lieux : lot 11, 24 août 2026) :
+'''trois banques de références''' (items physiques : décision du lot 4,
+26 juillet 2026 ; lieux : lot 11, 24 août 2026) :
 
 {| class="wikitable"
 ! Banque !! Sujets !! Propriété !! Valeur stockée !! Affichage
```

### Écriture 2

```diff
--- recap-1739.txt
+++ recap-1740.txt
@@ -175,35 +175,11 @@
 
 Cinq points qui en découlent, à ne pas défaire :
 
-* '''La valeur stockée est non préfixée.''' <code>ECL</code> est produit à
-  l'affichage par le modèle, à partir d'une constante de site ;
-  <code>ECL-0003</code> apparaît partout à l'écran, jamais en base. Motif :
-  <code>Module:Base36</code> utilise <code>clean:match("[%w]+")</code>, qui
-  s'arrête au tiret — une valeur préfixée en base serait silencieusement mal
-  lue.
-* '''Les trois banques sont trois propriétés différentes''', donc un
-  <code>0003</code> physique, un <code>0003</code> fonctionnel et un
-  <code>0003</code> de lieu ne se confondent pas, malgré des valeurs
-  identiques.
-* '''<code>ECL</code> désigne le wiki producteur''', pas une classe d'items.
-  Un partenaire qui duplique le dispositif change une constante, pas N pages.
-  Les codes sont enregistrés dans le [[Registre des préfixes de site]].
-  Premier cas réel : <code>CWL</code> (CWL Optéos), quatre exemplaires
-  <code>CWL-0008</code> à <code>CWL-000B</code> inventoriés au lot 10 ; la
-  banque inventaire est désormais à deux détenteurs en service.
-* '''Les trois banques suivent le même encodage Base 36''' (<code>Module:Base36</code>),
-  quatre caractères : <code>000A</code> suit <code>0009</code>, <code>0010</code>
-  suit <code>000Z</code>. Conforme à <code>Attribut:Inventory_number</code>
-  (« Identifiant Base 36 de 4 caractères ») et à <code>Attribut:Location_number</code>.
-  Seule la séquence est propre à chaque banque.
-* '''<code>LOC</code> n'est pas le code d'une organisation''', à la différence
-  d'<code>ECL</code> — et c'est le motif même de la troisième banque. Un lieu
-  public, une commune, un hameau, un terrain, '''n'appartient à personne''' :
-  lui faire porter le préfixe d'un propriétaire serait faux.
-  <code>LOC</code> identifie les lieux publiés sur ce wiki, et rien d'autre.
-  Il est produit par <code>Modèle:Préfixe lieu</code> et porté par la
-  propriété <code>Location_site</code>, distincte de
-  <code>Inventory_site</code>.
+* '''La valeur de numérotation est non préfixée.''' <code>Inventory_number</code> vaut <code>0003</code> et ne porte jamais de préfixe : c'est la seule valeur de la banque d'inventaire que <code>Module:Base36</code> reçoit. Le code de site vit à part, dans <code>Inventory_site</code>, et le modèle compose <code>Inventory_ref</code> à partir des deux. Cette référence composée, elle, est bien stockée : mesuré le 7 novembre 2026, les 50 items physiques portent un <code>Inventory_ref</code> qui vaut exactement <code>Inventory_site</code>, un tiret, <code>Inventory_number</code>. Motif de la séparation : <code>Module:Base36</code> s'arrête au premier caractère non alphanumérique, de sorte qu'une valeur préfixée lui serait silencieusement mal lue, comme le détaillent les [[Limites connues du Système de Gestion de Données Techniques|limites connues]].
+* '''Les trois banques sont trois propriétés différentes''', donc un <code>0003</code> physique, un <code>0003</code> fonctionnel et un <code>0003</code> de lieu ne se confondent pas, malgré des valeurs identiques.
+* '''<code>ECL</code> désigne le wiki producteur''', pas une classe d'items. Un partenaire qui duplique le dispositif change une constante, pas N pages. Les codes sont enregistrés dans le [[Registre des préfixes de site]]. Premier cas réel : <code>CWL</code> (CWL Optéos), quatre exemplaires <code>CWL-0008</code> à <code>CWL-000B</code> inventoriés au lot 10 ; la banque inventaire est désormais à deux détenteurs en service.
+* '''Les trois banques suivent le même encodage Base 36''' (<code>Module:Base36</code>), quatre caractères : <code>000A</code> suit <code>0009</code>, <code>0010</code> suit <code>000Z</code>. Conforme à <code>Attribut:Inventory_number</code> (« Identifiant Base 36 de 4 caractères ») et à <code>Attribut:Location_number</code>. Seule la séquence est propre à chaque banque.
+* '''<code>LOC</code> n'est pas le code d'une organisation''', à la différence d'<code>ECL</code> — et c'est le motif même de la troisième banque. Un lieu public, une commune, un hameau, un terrain, '''n'appartient à personne''' : lui faire porter le préfixe d'un propriétaire serait faux. <code>LOC</code> identifie les lieux publiés sur ce wiki, et rien d'autre. Il est produit par <code>Modèle:Préfixe lieu</code> et porté par la propriété <code>Location_site</code>, distincte de <code>Inventory_site</code>.
 
 === Les procédés : un sous-ensemble marqué des items fonctionnels ===
 
```

### Écriture 3

```diff
--- lot6-1714.txt
+++ lot6-1741.txt
@@ -14,4 +14,6 @@
 
 Le fichier `lot-6-consolide.md` est déclaré mort le 10 août 2026 dans le document de passation, alors qu'il existe toujours et qu'il est le rapport cité pour ce lot. L'un des deux est faux : soit le fichier n'aurait pas dû survivre, soit la déclaration de mort était erronée.
 
-L'objet de ce lot annonce "basculer Item_ref". Ses deux rapports portent la consigne inverse, "ne pas toucher à <code>Module:Base36</code> ni à <code>Item_ref</code> ; la numérotation reste gelée", et le tableau de renommage de <code>lot-6-consolide.md</code> inscrit <code>Item_ref</code> comme inchangé. Mesuré le 29 octobre 2026 : <code>Attribut:Item ref</code> porte toujours <code><nowiki>[[Has type::Code]]</nowiki></code>. Le mot "basculer" peut désigner un autre travail que le changement de type, ou être une erreur de rédaction ; rien ne permet de départager. Relevé lors de la clôture du lot 1.
\ No newline at end of file
+L'objet de ce lot annonce "basculer Item_ref". Ses deux rapports portent la consigne inverse, "ne pas toucher à <code>Module:Base36</code> ni à <code>Item_ref</code> ; la numérotation reste gelée", et le tableau de renommage de <code>lot-6-consolide.md</code> inscrit <code>Item_ref</code> comme inchangé. Mesuré le 29 octobre 2026 : <code>Attribut:Item ref</code> porte toujours <code><nowiki>[[Has type::Code]]</nowiki></code>. Le mot "basculer" peut désigner un autre travail que le changement de type, ou être une erreur de rédaction ; rien ne permet de départager. Relevé lors de la clôture du lot 1.
+
+L'objet de ce lot annonce aussi « durcir le module Base36 ». Mesuré le 7 novembre 2026 : <code>Module:Base36</code> n'a que trois révisions, les deux dernières du 7 avril 2026, soit quatre mois avant que ce lot ne coure, du 9 au 10 août 2026. L'extraction alphanumérique et la normalisation de la casse y datent toutes deux de ce 7 avril. Ce second travail n'a donc pas eu lieu non plus. L'objet affiché a déjà induit en erreur : il a fait écrire, lors de la clôture du lot 4, que le module avait été durci par ce lot. Relevé lors de la clôture du lot 4.
```

La ligne retirée puis rajoutée est un effet du saut de ligne final absent de
la révision 1714 : elle est inchangée.

### Écriture 4

Diff sans lignes de contexte (`diff -U0`), calculé sur les deux états de la
page complétés chacun d'un saut de ligne final : les entrées voisines sont
longues, et aucune n'a changé.

```diff
--- limites-1737.txt
+++ limites-1742.txt
@@ -103 +103 @@
-# '''Le module de numérotation Base 36 extrait sa valeur par une correspondance alphanumérique, qui s'arrête au premier caractère non alphanumérique.''' Mesuré le 7 novembre 2026 sur <code>Module:Base36</code>, qui emploie <code><nowiki>:match("[%w]+")</nowiki></code> à deux endroits, dans <code><nowiki>p.next</nowiki></code> et dans <code><nowiki>p.findGaps</nowiki></code>. Une référence préfixée comme <code><nowiki>ECL-0001</nowiki></code> y devient donc <code><nowiki>ECL</nowiki></code>, et <code><nowiki>tonumber("ECL", 36)</nowiki></code> réussit, ces trois lettres formant un nombre Base 36 valide : le module rend un résultat faux sans déclencher la moindre erreur. Rien ne lui passe de référence préfixée aujourd'hui, le lot 4 ayant stocké le numéro d'inventaire à part pour cette raison même. Le module normalise aussi la casse, par <code><nowiki>mw.text.trim(clean):upper()</nowiki></code> ; extraction et normalisation datent toutes deux de sa révision du 7 avril 2026, et il n'a pas été modifié depuis.
+# '''Le module de numérotation Base 36 extrait sa valeur par une correspondance alphanumérique, qui s'arrête au premier caractère non alphanumérique.''' Mesuré le 7 novembre 2026 sur <code>Module:Base36</code>, qui emploie <code><nowiki>:match("[%w]+")</nowiki></code> à deux endroits, dans <code><nowiki>p.next</nowiki></code> et dans <code><nowiki>p.findGaps</nowiki></code>. Une référence préfixée comme <code><nowiki>ECL-0001</nowiki></code> y devient donc <code><nowiki>ECL</nowiki></code>, et <code><nowiki>tonumber("ECL", 36)</nowiki></code> réussit, ces trois lettres formant un nombre Base 36 valide : le module rend un résultat faux sans déclencher la moindre erreur. Rien ne lui passe de référence préfixée aujourd'hui, le lot 4 ayant stocké le numéro d'inventaire à part pour cette raison même. Le module normalise aussi la casse, par <code><nowiki>mw.text.trim(clean):upper()</nowiki></code> ; extraction et normalisation datent toutes deux de ses révisions du 7 avril 2026, et il n'a pas été modifié depuis.
```

## Vérifications

1. **Textes mot pour mot.** Les trois pages relues par `action=parse` après
   la dernière écriture :
   - Récapitulatif, étape 1 : « items physiques : décision du lot 4,
     26 juillet 2026 » y figure une fois, repliée comme l'était l'ancienne
     chaîne ; « décision du lot 9, 13 août 2026 » n'y figure plus qu'une
     fois, sauts de ligne lus comme des espaces, sur la ligne des planches de
     culture : « n'aurait pas permis (décision du lot 9, 13 août 2026). » ;
   - Récapitulatif, étape 2 : la nouvelle puce y figure une fois, première
     de la liste ; la liste compte cinq lignes, toutes des puces ; les quatre
     autres sont égales à leur ancien texte, sauts de ligne et indentations
     remplacés par une espace ; hors de cette liste et de l'étape 1, la page
     est inchangée ;
   - lot 6 : le paragraphe y figure une fois, dernière ligne de la page, et
     la page de départ est intacte devant lui ;
   - Limites connues, quatrième écriture : « de ses révisions du 7 avril
     2026 » une fois, dans l'entrée 76 ; « de sa révision » 0 fois ;
     76 entrées.
2. **Qui tranche : les blocs `<pre>` du Récapitulatif.** **23** au rendu de
   la révision 1733, **18** au rendu de la révision 1740 : il n'en reste pas
   plus de 18, et aucune puce n'est coupée. Les 18 restants correspondent
   aux 18 appels `#tag:pre` ; plus aucun bloc `<pre>` ne suit une liste, et
   aucune puce de la page n'est suivie d'une ligne indentée. Les cinq puces
   forment au rendu une seule liste de cinq éléments, chacun entier jusqu'à
   sa dernière phrase.
3. **Comptes**, par `action=ask` avec `limit=500`, sans suite pour aucun :
   `[[Has type::+]]` **161**, `[[Item_ref::+]]` **118**,
   `[[Inventory_number::+]]` **50**. Inchangés.

Contrôles complémentaires, non demandés :

- L'ancien contrôle 2, gardé : « jamais en base » ne figure plus sur le
  Récapitulatif, et les 50 membres de `Catégorie:Physical item` portent
  toujours un `Inventory_ref` égal à `Inventory_site`, un tiret,
  `Inventory_number`, **50 sur 50**.
- Annotations (`smwbrowse`) : le Récapitulatif ne porte que `_ASK`, `_INST`
  (`SGDT`, `Page de suivi`), `_MDAT` et `_SKEY` ; le lot 6, les faits de son
  appel de modèle, plus `_ASK`, `_INST` (`Lot`), `_MDAT` et `_SKEY` ; les
  Limites connues, `_INST` (`Page de suivi`), `_MDAT` et `_SKEY`. Chaque
  `_MDAT` est égal à l'heure de la dernière révision écrite. Aucun `_ERRC`.
- Catégories : `Catégorie:Page de suivi` et `Catégorie:SGDT` pour le
  Récapitulatif, `Catégorie:Lot` pour le lot 6, `Catégorie:Page de suivi`
  pour les Limites connues ; aucune catégorie de suivi. Liens externes :
  0 sur les Limites connues.
- Liens (`generator=links`) : 210 cibles sur les trois pages, dont deux
  inexistantes, `Attribut:Has type` et `Attribut:Imported from`, liées depuis
  le Récapitulatif par les en-têtes de la requête de son tableau et déjà
  relevées lors de la clôture du lot 3. Le lien ajouté vers les Limites
  connues est enregistré : `list=backlinks` les fait lier par le
  Récapitulatif, qui portait déjà trois liens vers elles et en porte quatre.
- Rendus : sur le lot 6, le nouveau paragraphe est le dernier de la page, et
  `Module:Base36` y est affiché en code ; sur les Limites connues, une seule
  liste numérotée, de 76 éléments, la dernière entrée se terminant par
  « de ses révisions du 7 avril 2026, et il n'a pas été modifié depuis. ».

## Écarts et surprises

### Questions

Lettres E et F, à la suite des quatre points du canal direct.

**E.** La troisième puce des « Cinq points qui en découlent » contredit le
deuxième arbitrage du lot 4. Elle dit : « `ECL` désigne le wiki
producteur, pas une classe d'items ». La page du lot 4 porte depuis le
7 novembre 2026 : « Le code de site est une donnée de l'item, jamais une
propriété du wiki qui l'héberge », et `Attribut:Inventory site` le décrit
comme « Code à trois lettres de l'organisation qui détient l'exemplaire.
Source de vérité du préfixe de la référence d'inventaire, et non déduit du
wiki qui héberge la page. » La puce donne elle-même le contre-exemple :
des exemplaires `CWL` inventoriés sur ce wiki, dont le préfixe est `ECL`.
Elle a été jointe sur une ligne par l'écriture 2, sans qu'un caractère en
change. Faut-il la reformuler ? Suggestion : « `ECL` désigne l'organisation
qui détient l'exemplaire, pas une classe d'items », par une écriture de
résumé `[Lot 44][Correctif] <action>`.

**F.** `CLAUDE.md` porte la même erreur que la puce corrigée par
l'écriture 2. Sa correction n° 3, ligne 338, finit par : « C'est pourquoi
`ECL` est un affichage, jamais une valeur stockée. » Mesuré : les 50 items
physiques stockent un `Inventory_ref` préfixé, et `Inventory_site` stocke le
code, `ECL` sur 44 d'entre eux selon la mesure faite lors de la clôture du
lot 4. Faut-il corriger le fichier ? Suggestion : remplacer cette phrase par
« C'est pourquoi la valeur de numérotation n'est jamais préfixée : le code
de site vit dans `Inventory_site`, et `Inventory_ref`, qui porte le préfixe,
n'est jamais passée au module. », par un commit sur consigne.

### Constats

- **L'écriture 2 porte le résumé donné à la réponse B, et non celui de la
  consigne.** La réponse B demandait de faire « dans la même écriture » la
  nouvelle puce et la jonction des quatre autres, et donnait pour elle le
  résumé `[Lot 44][Correctif] les cinq puces des banques de références sur
  une ligne chacune`. Celui de la consigne, `[Lot 44][Correctif] la valeur
  non préfixée est celle de numérotation, pas celle stockée`, n'a donc pas
  été employé. Conséquence, qu'aucune écriture ne peut réparer puisqu'un
  résumé ne se corrige pas : l'historique du Récapitulatif nomme la mise sur
  une ligne, pas le changement de sens de la première puce.
- **La chaîne de l'étape 1 reste repliée.** Une recherche de « items
  physiques : décision du lot 4, 26 juillet 2026 » sur le wikitexte brut ne
  la trouve pas, comme elle ne trouvait pas l'ancienne : un saut de ligne
  sépare « lot 4, » de « 26 juillet 2026 ». Une consigne qui cherche une
  chaîne sur cette page doit lire les sauts de ligne comme des espaces.
- **Les cinq puces cassées étaient les seules de la page**, mesuré sur le
  seul Récapitulatif. Les autres pages du wiki n'ont pas été examinées : le
  même repli peut y casser des listes sans que rien ne le signale, sinon un
  compte de blocs `<pre>` au rendu.
- **La correction n° 2 du tableau de `CLAUDE.md`** date du lot 9, le
  13 août 2026, la fermeture de la question « Les objets physiques
  rejoignent-ils la séquence Base36 auto-incrémentée ? ». C'est une date de
  fermeture, juste en tant que telle ; elle peut être lue comme la date de
  la décision, que l'écriture 1 vient de rendre au lot 4. Rien n'a été
  modifié.
