# Lot 11 — clôture de la tâche 7

**27 août 2026.** Quatre écritures demandées, **quatre écritures réussies** :
trois sur le wiki, une dans le dépôt. Aucune n'a échoué, aucun arrêt.

| # | Cible | Révision | Résumé d'édition |
|---|---|---|---|
| 1 | `Catégorie:Lieu` | **1004** | `[Lot 11][Tâche 7] Où créer un lieu, à quel niveau rattacher un item, et où se saisit Located_at` |
| 2 | `Limites connues du SGDT` | **1005** | `[Lot 11][Tâche 7] Entrée 31 — #show vers #set sur propriété Page, et son faux positif` |
| 3 | `Récapitulatif technique du SGDT` | **1006** | `[Lot 11][Tâche 7] Trois banques de références, pas deux — Location_number et le préfixe LOC` |
| 4 | `travaux/lot-11-cadrage-lieux.md` | commit | `[Lot 11][Tâche 7] Cadrage — ce qui reste à décider sur le lignage` |

---

## 1. `Catégorie:Lieu` — les trois manques comblés

**a) Le point d'entrée vers la création.** Deux lignes à la fin de *Nommer un
lieu*, là où le lecteur vient de choisir son nom :

> Une fois le nom choisi, le lieu se crée par [[Formulaire:Lieu]], qui
> attribue sa référence et demande son lieu parent.

**b) Le niveau de rattachement**, à la fin de *Le rattachement ne remonte pas
l'arbre*, **dans ta formulation, mot pour mot** :

> **La règle : rattacher un item au lieu le plus fin qui existe déjà et qui a
> un sens.** Si ce lieu manque et qu'on en aura besoin, le créer maintenant
> plutôt que rattacher au parent en attendant : un rattachement trop haut ne
> se corrige ensuite que page par page.

Ta reformulation est meilleure que la mienne et pour une raison précise :
« le lieu le plus fin **qui existe déjà et qui a un sens** » ne pousse
personne à fabriquer des lieux pour la forme, là où mon « rattacher au lieu le
plus fin » invitait à en créer un à chaque saisie. La création reste
conditionnée à un besoin réel (« et qu'on en aura besoin »).

**c) Où se fait le rattachement** — nouvelle sous-section 3.4, parce que la
question mérite son titre dans le sommaire :

> **`Located_at` se renseigne sur la fiche de l'item, pas sur celle du lieu.**
> Une page de lieu ne liste pas ce qu'elle porte : elle l'affiche par une
> requête, et ce sont les items qui la désignent. Rien ne se saisit ici pour
> rattacher quoi que ce soit.
>
> Pour une plantation, **la position se saisit dans la même passe que le
> premier rattachement** — lieu et position ensemble, pas en deux temps.

La page compte désormais 7 sections et 8 sous-sections. Un lecteur qui n'a
suivi aucune conversation sait maintenant **où créer**, **où rattacher**,
**à quel niveau**, et **sur quelle fiche** — les trois manques du §3.4 du
rapport précédent sont fermés.

## 2. `Limites connues` — entrée 31

Rédigée depuis le §3.3 du rapport de cadrage, avec l'incohérence en tête
plutôt que l'échec. Le passage central, tel que publié :

> **Le point qui compte n'est pas l'échec, c'est l'incohérence :** selon que
> la page source porte ou ne porte pas de valeur, **la même construction**
> produit tantôt cette erreur franche, tantôt **un fait faux sans le moindre
> avertissement**. […] Une cascade partiellement cassée peut donc se présenter
> comme fonctionnelle — l'affichage ne distingue pas les deux cas, et
> *Erreurs de traitement SMW* ne voit que le premier.

Avec la portée explicite — **toute matérialisation d'une fermeture
transitive**, pas seulement les lieux — et le cas mesuré : `Casc B` a stocké
un `Casc_lineage` contenant une chaîne entière prise pour un seul titre, sans
`_ERRC`, sans message.

**30 entrées → 31**, vérifié au rendu (31 éléments de liste), +1972
caractères, une seule ligne ajoutée au diff.

## 3. `Récapitulatif technique` — trois banques

Le titre de section passe de « Numérotation **des items physiques** : **deux**
banques de références » à « Numérotation : **trois** banques de références » —
les lieux ne sont pas des items physiques, l'ancien titre ne pouvait pas les
accueillir. Vérifié avant de le changer qu'aucune autre page ne cite cette
chaîne : elle n'apparaît que sur la page elle-même, aucun ancrage cassé.

Le tableau gagne sa troisième ligne :

| Banque | Sujets | Propriété | Valeur stockée | Affichage |
|---|---|---|---|---|
| conception | items fonctionnels, organiques, référencés | `Item_ref` | `000R` | `000R` |
| inventaire | items physiques | `Inventory_number` | `0003` | `ECL-0003` |
| **lieux** | **lieux** | **`Location_number`** | **`0007`** | **`LOC-0007`** |

Et un quatrième point à la liste (« trois points » → « quatre points ») :

> **`LOC` n'est pas le code d'une organisation**, à la différence d'`ECL` — et
> c'est le motif même de la troisième banque. Un lieu public, une commune, un
> hameau, un terrain, **n'appartient à personne** : lui faire porter le
> préfixe d'un propriétaire serait faux. `LOC` identifie les lieux publiés sur
> ce wiki, et rien d'autre. Il est produit par `Modèle:Préfixe lieu` et porté
> par la propriété `Location_site`, distincte de `Inventory_site`.

Le point « les deux banques sont deux propriétés différentes » devient « les
trois banques sont trois propriétés différentes ».

## 4. Le cadrage — « Ce qui reste à décider »

Section ajoutée à l'encart d'état, quatre points, aucun général :

1. **La voie de calcul n'a jamais été arbitrée** — Lua à l'enregistrement ou
   script rejoué. C'est l'arbitrage 2 du §5, intact.
2. **Le patron `#show` → `#set` est cassé pour une propriété de type Page** et
   doit être corrigé avant tout nouvel essai. *Reprendre le test sans corriger
   le patron ne mesurerait rien.*
3. **Le recalcul après déplacement d'un lieu n'a jamais été abordé** — le
   « piège à ne pas manquer » de la tâche 4, jamais même posé en exécution. Il
   conditionne le choix du point 1 : un script rejoué le traite trivialement,
   un calcul à l'enregistrement doit propager.
4. **`Board_lineage` n'existe pas sur ce wiki.**

Le point 4 était retiré de l'arbitrage 2 dans la ligne « ce qui reste
ouvert », qui ne garde plus que la tâche 6 — le lignage a désormais sa section.

---

## 5. Les contrôles

### 5.1 — `browsebysubject` : aucune annotation parasite, sur les trois pages

| Page | Faits stockés |
|---|---|
| `Catégorie:Lieu` | `_MDAT`, `_SKEY`, `_SUBC` |
| `Limites connues du SGDT` | `_MDAT`, `_SKEY` |
| `Récapitulatif technique du SGDT` | `_ASK` (14 requêtes), `_INST`, `_MDAT`, `_SKEY` |

**Aucune annotation de données sur aucune des trois.** `_SUBC` est
l'appartenance de la catégorie à `Catégorie:SGDT` ; `_ASK` et `_INST` sont les
faits structurels d'une page qui porte des `#ask` et des catégories. Rien de
nouveau, rien d'introduit.

Le résultat qui compte est celui de *Limites connues* : **une page de
31 entrées bourrée de syntaxe SMW citée ne porte que `_MDAT` et `_SKEY`**. Le
patron `<code><nowiki>…</nowiki></code>` a tenu sur l'entrée 31 comme sur les
30 précédentes.

### 5.2 — `list=backlinks` : aucun lien perdu

Treize couples source → cible contrôlés **dans les deux sens** (lien sortant
présent, et source présente dans les backlinks de la cible) : **13 OK, 0
absent**.

Liens sortants après écriture : `Catégorie:Lieu` **8**, *Limites connues*
**3**, *Récapitulatif technique* **150**. **Aucun lien nouveau n'a en fait été
créé** — les trois cibles ajoutées au texte (`Formulaire:Lieu`, *Erreurs de
traitement SMW*, *Registre des préfixes de site*) étaient déjà liées depuis
ailleurs sur leur page. Le contrôle valait donc surtout comme vérification
qu'aucun lien **existant** n'avait été perdu au passage : aucun ne l'a été.

Aucun `[[ ]]` n'a été replié à la copie.

### 5.3 — `Erreurs de traitement SMW` : toujours à 1

```
Erreurs de traitement SMW : 1
    Attribut:INSEE code
```

**Inchangé.** La seule page en `_ERRC` du wiki reste `Attribut:INSEE code`
(`Property_range` au-delà des 85 caractères du type `Keyword`). Les trois
écritures n'en ont ajouté aucune.

### 5.4 — Rendu des trois pages

Contrôlé sur le HTML produit, pas sur un aperçu. **Aucun lien rouge, aucune
erreur d'analyseur, aucune expression évaluée** sur les trois. Sommaire de
`Catégorie:Lieu` cohérent, entrée 31 numérotée 31, tableau des banques à
trois lignes et liste à quatre points.

Un faux positif de mon propre contrôle, pour mémoire : ma recherche d'erreurs
d'analyseur a signalé une occurrence sur *Limites connues*. C'est la chaîne
`smw-constraint-error-allows-value-list`, **citée comme texte** dans l'entrée
n° 22 depuis le lot 9. Pas une erreur.

---

## 6. Trois constats en marge, à ne pas perdre

**1. *Limites connues* n° 2 affirme un précédent qui n'existe pas.** Elle
écrit : « Le patron de résolution existe déjà côté physique : `Board_lineage`
matérialise la fermeture réflexo-transitive de `Board_parent` ; `Module:Board`
porte la détection de cycle. » Vérifié le 27 août 2026 : **les trois pages
sont absentes du wiki**, et aucune page ne porte ces propriétés. L'entrée 31
le signale désormais en toutes lettres et renvoie à n° 2, mais **n° 2
elle-même reste à corriger** — je ne l'ai pas touchée, c'était une cinquième
écriture. C'est une phrase qui a coûté cher : le cadrage du lot 11 s'appuyait
sur elle pour dire que le patron était éprouvé.

**2. *Récapitulatif technique* est dans `Pages avec des liens de fichiers
brisés`.** Cause : un exemple `[[File:x|150px]]` écrit **sans `<nowiki>`**
dans la section *Contraintes de rédaction des modèles* — un lien de fichier
cité en exemple est un vrai lien de fichier. Antérieur à cette session,
strictement le même piège que « les backticks ne protègent rien », appliqué
aux fichiers. Sans conséquence sur les données ; une ligne à corriger un jour.

**3. `Attribut:Casc lineage` et `Attribut:Casc parent` figurent toujours dans
l'inventaire des propriétés du *Récapitulatif technique*.** Ce sont les
propriétés d'échafaudage du test de cascade, qui doivent partir avec les cinq
pages `Casc *`. Elles sont sur la liste à supprimer ; la page les référence
encore.

*Et un détail d'exploitation :* la file de travaux est **figée à 3** depuis
les purges de cette session. Sans effet constaté — les trois pages rendent
correctement et leurs faits sont à jour.

---

## 7. État du dépôt

```
travaux/lot-11-cadrage-lieux.md | 42 ++++++++++++++++++++++++++++++++++++--
1 file changed, 40 insertions(+), 2 deletions(-)
```

Les **2 suppressions** sont attendues et vérifiées ligne à ligne : les deux
lignes de « ce qui reste ouvert » qui portaient l'arbitrage 2, dont le contenu
est passé dans la nouvelle section, la phrase étant réécrite pour ne garder
que la tâche 6. Rien d'autre n'a été retiré du cadrage.

---

## 8. Où en est le lot 11

**La tâche 7 est faite.** Les quatre livrables du cadrage sont écrits, et
au-delà : *Catégorie:Lieu* (nommage, arbre, redécoupage, `Location_type`,
critère item/lieu, origine du rang, renommage, création, niveau de
rattachement), *Limites connues* (test des redirections en n° 41, `#show` →
`#set` en n° 31), *Récapitulatif technique* (troisième banque), et le cadrage
annoté plutôt que réécrit.

**Reste ouvert, et ce n'est pas de la dette technique :**

- **La tâche 6** — quelle plantation à quel lieu, à quelle position. **Travail
  de terrain**, les positions restant à relever sur place.
- **Le lignage**, dans ses quatre points du §4 ci-dessus. `Location_lineage`
  existe et attend ; rien ne la porte, et c'est un état assumé, pas un oubli.
- **Trois corrections mineures**, celles du §6.

Le renommage d'`Extrémité de tranchée` n'a pas été anticipé. Il vient après le
rattachement des photos — et c'est sur lui que la procédure publiée
aujourd'hui se mesurera : `Le Buisson de Cerzat` porte **0 item physique** et
**54 pages pointent encore vers lui**, dont 53 pages de fichier. C'est
exactement le cas que l'étape 2 de la procédure existe pour attraper.
