# Correctif — *Limites connues* n° 2 : un précédent qui n'existait pas

**27 août 2026.** Une écriture, hors lot. `Limites connues du Système de
Gestion de Données Techniques`, **révision 1007**, résumé :

```
[Correctif] Limites connues n° 2 — Board_lineage n'existe pas sur ce wiki, aucun patron de fermeture transitive
```

Hors lot, donc `[Correctif]` et non un numéro : une correction ponctuelle ne
réserve pas un numéro de lot.

**Ce document rattrape une trace manquante.** Le diff et le compte rendu
d'écriture avaient été rendus dans le terminal, sans fichier — seuls morceaux
du lot 11 à n'exister nulle part dans `travaux/`. Rien n'y est remesuré : le
contenu est celui des deux retours, recopié.

---

## 1. Le motif

L'entrée n° 2 affirmait :

> Le patron de résolution existe déjà côté physique : `Board_lineage`
> matérialise la fermeture réflexo-transitive de `Board_parent` ;
> `Module:Board` porte la détection de cycle.

**Aucune des trois pages n'existe.** Vérifié le 27 août 2026, avant de
rédiger :

| Page cherchée | État |
|---|---|
| `Attribut:Board lineage` | absente |
| `Attribut:Board parent` | absente |
| `Module:Board` | absente |
| `Modèle:Board` | absente |
| `Catégorie:Board` | absente |

`Board_lineage` et `Board_parent` ont **zéro page porteuse**, et la **seule**
page du wiki où le mot « Board » apparaisse est *Limites connues* elle-même.

**Le coût est vérifiable, et c'est ce qui rendait la correction nécessaire :**
cette phrase a servi de fondement à la **décision 1.10** du cadrage du lot 11
— « la fermeture transitive est matérialisée, pas calculée… même solution que
`Board_lineage` pour `Board_parent` ». Le cadrage s'appuyait sur un précédent
éprouvé qui n'a jamais existé ici.

---

## 2. Le diff appliqué

Une seule ligne touchée, la n° 17 du wikitexte — l'entrée n° 2. Une seule
phrase remplacée.

**Retiré :**

> Le patron de résolution existe déjà côté physique : \`Board_lineage\`
> matérialise la fermeture réflexo-transitive de \`Board_parent\` ;
> \`Module:Board\` porte la détection de cycle.

**Mis à la place :**

> **Et il n'existe aucun patron de résolution à recopier.** Cette entrée a
> longtemps affirmé le contraire — que `Board_lineage` matérialisait la
> fermeture réflexo-transitive de `Board_parent`, et que `Module:Board`
> portait la détection de cycle, côté physique. **Les trois pages sont
> absentes du wiki** : vérifié le 27 août 2026, aucune n'existe, aucune page
> ne porte ces propriétés, et la seule page du wiki où le mot « Board »
> apparaisse est celle-ci. L'affirmation avait pourtant servi de fondement à
> la décision 1.10 du cadrage du lot 11, qui supposait un précédent éprouvé.
> **Le seul essai réel de matérialisation d'une fermeture transitive sur ce
> wiki a échoué** — l'entrée n° 31 dit pourquoi, et surtout pourquoi cet échec
> peut passer pour un succès. Aucune de ces trois pages n'avait jamais été
> cherchée. L'affirmation s'est transmise d'un document à l'autre jusqu'à
> fonder une décision de cadrage — une affirmation non mesurée coûte d'autant
> plus cher qu'elle est utile.

**Inchangé :** le début de l'entrée n° 2 (le titre en gras, la date du 9 août
2026, `format=tree` avec `parent=Part_of`, l'absence de détection de cycle
côté fonctionnel) et les **trente autres entrées**.

### Deux choix, tranchés par Cyril

**1. Garder la trace de l'erreur plutôt que supprimer la phrase.** Motif de
Cyril, qui vaut mieux que le mien : *« une correction sèche laisse une place
vide, et une place vide se remplit à nouveau »*. Sur une page de limites,
« ceci a été cru, c'était faux, et voilà ce que ça a coûté » empêche la phrase
de revenir.

**2. La dernière phrase est de Cyril, reprise au mot près, sans gras
ajouté.** Elle nomme l'origine de l'erreur, que le reste de l'entrée ne disait
pas :

> Aucune de ces trois pages n'avait jamais été cherchée. L'affirmation s'est
> transmise d'un document à l'autre jusqu'à fonder une décision de cadrage —
> une affirmation non mesurée coûte d'autant plus cher qu'elle est utile.

**C'est le motif qui s'est répété cinq fois dans le lot 11** : le verrou SMW
cru général sans qu'on l'ait testé, le tri de `Modèle:Lieu`, les cinq
propriétés déclarées bloquées sans tentative, l'écart 26/29 expliqué par une
coïncidence de nombres. L'entrée se referme donc sur le motif plutôt que sur
le fait — le fait est réparable, le motif est ce qui se répète.

**3. Le mélange `<code>` et backticks dans la même entrée est assumé.** Le
texte remplacé était en backticks, qui s'affichent littéralement sur le wiki ;
le texte de remplacement est en `<code>`. Corriger l'entrée entière aurait
débordé du « ne touche à rien d'autre ». Les backticks hérités
(`format=tree`, `parent=Part_of`) subsistent donc en début d'entrée, et
nulle part ailleurs.

---

## 3. Les quatre contrôles

| Contrôle | Résultat |
|---|---|
| `browsebysubject` sur la page | `_MDAT`, `_SKEY` — **rien d'autre** |
| Entrées numérotées rendues | **31 avant, 31 après** |
| Ampleur du diff | **1 seule ligne modifiée**, +841 caractères |
| Liens rouges sur la page | **0** |

Le premier est celui qui compte : **trente et une entrées bourrées de syntaxe
SMW citée, et aucune annotation**. Le patron
`<code><nowiki>…</nowiki></code>` a tenu sur la n° 2 corrigée comme sur les
trente autres — une page qui décrit le modèle de données ne le pollue pas.

---

## 4. Relecture

L'entrée n° 2 se lit désormais d'un bloc, dans cet ordre : **ce qui est** (le
graphe orienté acyclique, l'absence de détection de cycle côté fonctionnel),
**ce qui a été cru** (le précédent `Board_*`), **la vérification** (les trois
pages absentes, datée), **ce que ça a coûté** (la décision 1.10), **où lire la
suite** (l'entrée n° 31), et **d'où ça venait** (la phrase de Cyril).

Le renvoi croisé est complet dans les deux sens : la n° 31, écrite la veille,
signalait déjà que le précédent de la n° 2 n'existait pas ; la n° 2 renvoie
maintenant à la n° 31 pour le détail de l'échec. La contradiction qui restait
entre les deux entrées est levée.

---

## 5. Ce qui reste ouvert

Rien sur cette entrée. Pour mémoire, les deux autres constats en marge relevés
à la clôture de la tâche 7 (voir `lot-11-cloture.md` §6) ne sont pas traités :

- *Récapitulatif technique* est dans `Pages avec des liens de fichiers brisés`
  à cause d'un exemple `[[File:x|150px]]` écrit sans `<nowiki>` ;
- `Attribut:Casc lineage` et `Attribut:Casc parent` figurent toujours dans
  l'inventaire des propriétés du *Récapitulatif technique*, alors qu'elles
  sont sur la liste à supprimer avec les cinq pages `Casc *`.
