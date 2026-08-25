# [Amendement] Documentation du modèle de facette végétale

**Date : 25 août 2026. Une écriture, réussie.**

`Modèle:Physical facet plant/doc` créée (`--createonly`, pageid 460,
revid **997**). Résumé : `[Amendement] Documentation du modèle de facette
végétale — le segment de position`.

---

## 1. La vérification préalable — et sa réponse : **non**

> *Récapitulatif technique liste-t-il les pages `/doc` par requête ?*

**Non. Aucune ligne n'apparaîtra, parce que rien n'y est engendré par
requête.** Toutes les sections de modèle sont **écrites à la main**, une par
une :

```
=== [[Template:Physical item]] ===
'''Description (FR) :''' {{#show: Template:Physical item/doc |?Object_description_FR |default=Non documenté}}
''Description (EN):'' {{#show: Template:Physical item/doc |?Object_description_EN |default=No description}}
{{#tag:pre|{{#invoke:Source|get|Template:Physical item}}}}
```

Le nom de la page `/doc` est **écrit en dur** dans chaque `#show`. La page ne
porte que six `#ask`, et aucun n'énumère de modèles : un sur
`[[Has type::+]]` (qui liste les **propriétés** — c'est par là que les deux
propriétés d'essai du lot 11 y étaient apparues), et quatre `format=count`,
un par classe d'items.

**Conséquence : créer la page `/doc` ne pouvait rien produire de mal formé ni
de mal placé — elle ne produit rien du tout.** Aucune condition d'arrêt.
Vérifié après coup : le wikitexte de *Récapitulatif technique* est
**identique** avant et après, et la page rend toujours (24 sections,
5 tableaux, aucun marqueur d'erreur).

*(La page mentionne bien « Modèle:Physical facet plant » dans son rendu, mais
c'est une phrase de prose écrite depuis le lot 9 — « La facette végétale est
portée à deux niveaux… par `Modèle:Organic facet plant` sur l'espèce, et par
`Modèle:Physical facet plant` sur l'exemplaire planté » — présente une seule
fois dans le wikitexte source, sans rapport avec cette écriture.)*

### Ce que la vérification a découvert au passage, et qui compte davantage

**Le mécanisme `Object_description` est inerte sur tout le wiki.** Ce n'est
pas propre à la page créée aujourd'hui :

```
[[Object_description_FR::+]]              -> 0 page
browsebysubject Modèle:Physical item/doc  -> _SKEY seul, rien d'autre
browsebysubject Modèle:Physical item      -> vide
browsebysubject Modèle:Lieu               -> vide
browsebysubject Formulaire:Physical item/doc -> vide
```

**Aucune page des espaces `Modèle` (10) et `Formulaire` (106) ne porte le
moindre fait SMW.** Ces espaces ne sont pas sémantiques sur cette
installation — vraisemblablement absents de
`$smwgNamespacesWithSemanticLinks`, ce qui relève de la configuration et donc
de `demandes-adminsys.md`, pas d'une édition de page.

Le résultat visible, aujourd'hui, sur *Récapitulatif technique* :

> **Template:Physical item** — *Description (FR) :* **Non documenté** ·
> *Description (EN):* **No description**

Les quatre pages `/doc` existantes portent pourtant bien leurs deux
annotations en wikitexte. Elles ne sont simplement jamais stockées, et les
huit `#show` de la page retombent tous sur leur `default=`. **Le défaut est
antérieur à ce lot et n'a rien à voir avec lui** — mais il explique par
avance ce que le contrôle du §3 allait trouver.

*(Correction d'une affirmation de mon rapport précédent : j'y écrivais que
« seules quatre pages `/doc` existent sur le wiki ». Quatre en espace
`Modèle` ; il y en a quatre autres en espace `Formulaire`. J'avais énuméré un
seul espace de noms.)*

---

## 2. L'écriture

Le texte du §4 du rapport précédent, **sans modification de fond**, avec un
seul écart de mise en forme que je signale plutôt que de le taire :

> **Le lien vers la catégorie a été écrit sur une seule ligne.** Dans le
> rapport, `[[:Catégorie:Item à facette végétal|Item à facette végétal]]`
> était replié sur deux lignes par la largeur du document. Le recopier tel
> quel aurait cassé le lien **en silence** : un retour à la ligne à
> l'intérieur de `[[ ]]` ne produit aucune erreur d'API mais sort le lien de
> `pagelinks`. C'est la première leçon de méthode de `CLAUDE.md`. Le pli
> venait de la mise en page du rapport, pas du texte.

Contrôles passés sur le fichier **avant** l'envoi :

```
aucun lien [[ ]] coupé par un retour à la ligne : True
fragments <code> tous protégés par <nowiki>    : 8 sur 8
annotations réelles voulues                    : Object_description_FR, Object_description_EN
accolades équilibrées                          : True
```

Relecture après écriture : **écart nul** avec le fichier source, au seul
retour à la ligne final que MediaWiki retire.

---

## 3. Les vérifications

### La page rend, et le `{{Documentation}}` ne pointe plus dans le vide

**Avant**, `Modèle:Physical facet plant` rendait trois liens rouges, dont
celui-ci :

```
lien rouge -> Modèle:Physical facet plant/doc
```

**Après** :

```
liens rouges : ['Fichier:Template-info.svg', 'Item à facette végétal']
lien rouge vers /doc : False
```

Et le corps de la documentation s'affiche désormais sur la page du modèle :

> Documentation du modèle [voir] [modifier] [historique] · **Présentation
> (Overview)** · Facette végétale d'un item physique : ce qui n'a de sens que
> pour une plantation — date, position, statut, filiation, photos…

Les deux liens rouges restants sont **antérieurs et légitimes** :
`Fichier:Template-info.svg` est l'icône jamais téléversée du modèle
`Documentation` (elle manque sur les quatre autres pages de modèle) ;
`Item à facette végétal` est la catégorie que je cite — **elle compte
70 membres mais sa page de description n'a jamais été créée**. Un lien rouge
vers une catégorie peuplée est normal dans MediaWiki, et c'est le même état
qu'avant cette écriture.

Rendu de la page `/doc` elle-même : aucun marqueur d'erreur ; **zéro accolade
nue avant la section « Code Source »**, et 34 à l'intérieur — c'est le code
du modèle que `{{#invoke:Source|get|…}}` y imprime, contenu voulu de cette
section, pas un défaut de rendu. La `div` de code source est bien remplie.

### `browsebysubject` sur la page `/doc` : **vide**

```
(aucune ligne)
```

**Zéro annotation — pas même les deux `Object_description` attendues.**

Le contrôle demandé supposait que toute propriété autre que les deux
`Object_description` trahirait un `<nowiki>` oublié. Le résultat est en deçà :
**il n'y a rien du tout**, et ce n'est pas un `<nowiki>` de trop — c'est le
défaut d'espace de noms établi au §1, avant l'écriture. La page se comporte
exactement comme les quatre `/doc` qui l'ont précédée.

**Ce que le contrôle établit quand même, et qui était son objet :** aucune des
huit mentions de propriété du texte (`Planting_rank`, `Planting_rank_end`,
`Specimen_status`, `Planted_count`, `#ask`) n'a produit d'annotation
parasite. Elles étaient toutes en `<code><nowiki>…</nowiki></code>`, vérifié
avant envoi — et si l'espace `Modèle` devient sémantique un jour, elles ne
polluera pas rétroactivement.

### *Récapitulatif technique* : inchangé et intact

```
wikitexte avant / après : IDENTIQUE
marqueur d'erreur       : False
sections rendues        : 24
tableaux rendus         : 5
```

Ce que j'avais annoncé au §1 s'est produit : **aucune ligne n'est apparue**,
parce que la page n'énumère rien par requête. Il n'y a rien à corriger — et
rien non plus à célébrer : la nouvelle documentation **n'est visible que
depuis la page du modèle**, pas depuis le récapitulatif.

### Erreurs de traitement SMW : toujours 1

```
COUNT 1
 - Attribut:INSEE code
```

Même page, préexistante.

---

## 4. Ce qui reste ouvert

**Deux choses relevées par cette tâche, ni l'une ni l'autre dans son
périmètre :**

1. **Les espaces `Modèle` et `Formulaire` ne sont pas sémantiques**, ce qui
   rend inertes les huit `Object_description` des pages `/doc` et fait
   afficher « Non documenté » partout sur *Récapitulatif technique*. C'est une
   ligne de configuration (`$smwgNamespacesWithSemanticLinks`), donc une
   demande adminsys — pas une édition de page. À verser à
   `demandes-adminsys.md` et, si Cyril le souhaite, à *Limites connues*.
2. **Pour que la nouvelle documentation apparaisse dans *Récapitulatif
   technique***, il faudrait y ajouter une section à la main, sur le patron
   des quatre autres. Trois lignes, une écriture séparée — et qui n'a
   d'intérêt que si le point 1 est réglé, sans quoi elle afficherait
   « Non documenté » comme ses voisines.

Aucune des deux n'a été faite.
