# Section *Recherché*, entrée de documentation, ménage des pages d'essai

**Date : 25 août 2026. Proposition seulement — aucune écriture sur
*Avancement du jardin-forêt* ni sur *Limites connues*.**

---

## 1. Diff proposé — `Avancement du jardin-forêt`

Calculé contre le wikitexte **relu en ligne** (revid 983, 56 lignes).
**50 lignes ajoutées, 0 supprimée** — la seule ligne que `diff` marque en
retrait est l'ancienne dernière ligne, dont le contenu est identique : elle
gagne seulement le retour à la ligne final que MediaWiki retire de toute
façon au stockage.

### 1.a La section, entre `== Plantations ==` et `== Photos ==`

```diff
@@ -18,6 +18,54 @@
  |default=''Aucune plantation enregistrée.''
  }}

+== Recherché ==
+
+<!-- Un souhait porte sur l'espèce, pas sur un exemplaire : une plante
+     recherchée n'a ni plant, ni lieu, ni état. Ces deux tables ne partagent
+     donc rien avec la table des plantations, et leurs comptes restent
+     séparés du total.
+
+     La colonne « Exemplaires déjà présents » montre ce qui existe au lieu de
+     masquer le souhait : un souhait sur une espèce déjà présente reste
+     affiché, parce que vouloir un deuxième pied est légitime. Aucune
+     extinction automatique — SMW n'exprime pas la négation, et une exclusion
+     ferait disparaître ce cas-là sans aucun signal.
+
+     Cette colonne rend une LISTE, jamais un nombre. Le modificateur #count
+     sur une chaîne de propriétés est accepté sans erreur et n'a aucun effet :
+     mesuré le 25 août 2026, il rend la même liste sous le libellé demandé.
+     Voir Limites connues du SGDT. -->
+
+=== Espèces recherchées ===
+
+{{#ask: [[Category:Organic item]] [[Wanted_by::Ecolibre]] [[Category:Item à facette végétal]]
+|?Taxon_name = Nom scientifique
+|?-Corresponds_to_organic.-Instance_of = Exemplaires déjà présents
+|?Item_ref = Réf.
+|format=table
+|sort=Item_ref
+|order=asc
+|class=wikitable sortable
+|default=''Aucune espèce recherchée pour le moment.''
+}}
+
+=== Provenances recherchées ===
+
+<!-- Le référencé ne porte pas la facette végétale : il n'existe pas de
+     Referenced facet plant. Le filtre végétal passe donc par l'organique
+     correspondant, au moyen d'une sous-requête. -->
+
+{{#ask: [[Category:Referenced item]] [[Wanted_by::Ecolibre]] [[Corresponds_to_organic::<q>[[Category:Item à facette végétal]]</q>]]
+|?Corresponds_to_organic = Espèce
+|?Supplier = Fournisseur
+|?Sourcing_year = Année
+|format=table
+|sort=Item_ref
+|order=asc
+|class=wikitable sortable
+|default=''Aucune provenance précise recherchée.''
+}}
+
  == Photos ==
```

### 1.b La ligne dans *Chiffres*

```diff
@@ -54,4 +102,6 @@
  Total des plantations : {{#ask: … |format=count}}

  Espèces distinctes (organiques rejointes via Instance_of → Corresponds_to_organic) : {{#ask: … |format=count}}
+
+Espèces recherchées — un souhait n'est pas une plantation, ce compte n'entre pas dans le total ci-dessus : {{#ask: [[Category:Organic item]] [[Wanted_by::Ecolibre]] [[Category:Item à facette végétal]] |format=count}}
```

**Placée en dernier, après « Espèces distinctes », et non après le total.**
Deux raisons : les deux lignes d'espèces forment la paire naturelle — ce que
j'ai / ce que je cherche — et surtout, coller « Espèces recherchées » sous
« Total des plantations » inviterait exactement à l'addition qu'il ne faut
pas faire. Le libellé le dit en toutes lettres plutôt que de compter sur la
mise en page.

### 1.c Les trois requêtes, soumises au wiki avant d'être proposées

```
OK   table Espèces recherchées       0 résultat(s)
     colonnes : Nom scientifique, Exemplaires déjà présents, Réf.
OK   table Provenances recherchées   0 résultat(s)
     colonnes : Espèce, Fournisseur, Année
OK   compte Espèces recherchées      0 résultat(s)
```

**Zéro résultat est le bon résultat** : aucun souhait n'est encore saisi —
`Wanted_by` a été créée aujourd'hui et 0 page la porte. Ce qui est vérifié
ici, c'est que les trois requêtes sont **acceptées** et que les colonnes
demandées sont bien constituées, y compris la chaîne inverse à deux crans.

Ce que rend réellement cette chaîne a été mesuré hier sur les 34 organiques,
sans le filtre `Wanted_by` : 32 lignes non vides, 2 vides, jusqu'à
3 exemplaires dans une même cellule, et un recoupement sans écart contre une
requête directe. La colonne fonctionne ; elle est vide aujourd'hui parce que
la table l'est.

**`#count` n'est pas utilisé**, conformément à la consigne — l'essai du bac
à sable a montré qu'il est accepté sans effet et rend la liste.

---

## 2. Entrée proposée pour *Limites connues du SGDT*

La page numérote ses entrées par `#` dans une liste unique
(`== Limites, dettes et faits à retenir ==`). L'entrée ci-dessous
**s'ajoute en fin de liste**, après l'actuelle dernière (celle sur
`format=count` via `action=ask`), et en devient la 29ᵉ.

Texte proposé, conforme à celui dicté, mis à la forme de la page —
`<code><nowiki>…</nowiki></code>` sur les fragments de syntaxe, comme
l'exige le patron maison :

```
# '''Le modificateur <code>#count</code> sur une chaîne de propriétés en impression est accepté sans erreur et n'a aucun effet :''' la colonne rend la liste des valeurs, sous le libellé demandé. Mesuré le 25 août 2026 sur <code><nowiki>?-Corresponds_to_organic.-Instance_of#count</nowiki></code>, par comparaison cellule par cellule avec la même chaîne sans le modificateur : colonnes identiques. Ni refus, ni message. Pour un nombre, il faut une requête séparée.
```

**Deux remarques avant d'écrire.**

**a) Le `<nowiki>` n'est pas optionnel ici.** La chaîne contient des `::`
et des tirets d'inverse ; écrite nue ou entre backticks, elle risque d'être
interprétée. `CLAUDE.md` en fait une règle après deux incidents dans la
session du 21 août, et *Limites connues* est précisément la page qui a déjà
porté trois annotations parasites. Le contrôle qui va avec :
`browsebysubject` sur la page après écriture, pour vérifier qu'elle ne porte
que `_MDAT`, `_SKEY` et ses `_ASK`.

**b) Cette entrée voisine bien avec l'entrée 38** (SMW n'exprime ni la
négation ni l'absence) et l'entrée 43 (`format=count` via `action=ask` rend
`0`). Les trois décrivent la même famille de défaut : **une requête qui
échoue sans le dire**. Si Cyril veut un jour regrouper *Limites connues* par
thème, ces trois-là forment un bloc — mais la page est aujourd'hui une liste
chronologique, et je ne propose pas de la réordonner : les numéros servent de
renvois, comme la table des corrections de `CLAUDE.md`.

---

## 3. Les pages d'essai — inventaire complet et à jour

Relevé sur le wiki vivant, tous espaces de noms, avec pour chacune sa date de
création, ses faits SMW et ses liens entrants. **Trois groupes, à traiter
différemment.**

### Groupe A — à supprimer : 10 pages du lot 11

| Page | Créée | Faits SMW | État |
|---|---|---|---|
| `Utilisateur:Cywil/Bac à sable/Lot11 item` | 20/08 | aucun | **vide (0 octet)** |
| `Utilisateur:Cywil/Bac à sable/Lot11 lieu` | 20/08 | aucun | **vide (0 octet)** |
| `Utilisateur:Cywil/Bac à sable/Lot11 lieu renomme` | 20/08 | aucun | **vide (0 octet)** |
| `Utilisateur:Cywil/Bac à sable/Test lot11 sujet 1` | 21/08 | `Test_lot11_keyword`, `Test_lot11_texte` | 124 o |
| `Utilisateur:Cywil/Bac à sable/Test lot11 sujet 2` | 21/08 | `Test_lot11_keyword`, `Test_lot11_texte` | 124 o |
| `Utilisateur:Cywil/Bac à sable/Casc A` | 24/08 | aucun | 124 o |
| `Utilisateur:Cywil/Bac à sable/Casc B` | 24/08 | aucun | |
| `Utilisateur:Cywil/Bac à sable/Casc C` | 24/08 | aucun | |
| `Utilisateur:Cywil/Bac à sable/Casc R1` | 24/08 | aucun | |
| `Utilisateur:Cywil/Bac à sable/Casc R2` | 24/08 | aucun | |

Plus les **deux propriétés d'essai** :

| Page | Créée | Remarque |
|---|---|---|
| `Attribut:Test lot11 keyword` | 21/08 | **liée depuis `Récapitulatif technique`** |
| `Attribut:Test lot11 texte` | 21/08 | **liée depuis `Récapitulatif technique`** |

**Ordre de suppression, et il compte :** les deux pages `Test lot11 sujet`
**avant** les deux `Attribut:Test lot11 …`. Elles portent les annotations de
ces propriétés ; supprimer les propriétés d'abord laisserait deux sujets
annotés par des propriétés inexistantes.

**Ce que la suppression des deux `Attribut:` change ailleurs, et c'est une
bonne nouvelle :** `Récapitulatif technique du SGDT` liste les propriétés par
`{{#ask: [[Has type::+]] …}}` — une requête, pas une liste écrite à la main.
Les deux lignes d'essai disparaîtront **d'elles-mêmes** de ce tableau, sans
édition. Les « liens entrants » relevés viennent de cette requête, pas d'un
lien rédigé : rien ne cassera.

**Les trois pages `Lot11 …` sont déjà vides** — vidées lors du test de
redirection du 20-21 août (entrée 41 de *Limites connues*). Ce ne sont donc
plus des redirections : la mise en garde de cette entrée — une redirection
supprimée repointe silencieusement les annotations qui la traversaient — **ne
s'applique plus**, la redirection ayant déjà été retirée à l'époque. Aucune
page n'annote plus vers elles (`backlinks` vide sur les trois).

### Groupe B — les quatre essais du jour, sur `Utilisateur:Cywil/Bac à sable`

**Ce que je propose : les retirer, et rendre la page à son état d'accueil.**

La page portait une seule ligne (« Page bac à sable — sert aux tests du
lot 9… ») avant que j'y écrive les essais A, B, C et D de la chaîne inverse.
Elle est désignée par `CLAUDE.md` comme **la** page d'essai du projet : elle
ne doit pas être supprimée, seulement remise à blanc.

**Mais pas tout de suite.** Ces quatre essais sont la preuve du §2 — c'est la
comparaison A/B qui établit que `#count` est sans effet. Tant que l'entrée de
*Limites connues* n'est pas écrite, la preuve n'existe que là. **À nettoyer
après**, pas avant. Je ne le fais pas de moi-même : c'est une écriture, et
elle attend le feu vert comme le reste.

### Groupe C — à NE PAS supprimer, malgré leur nom

| Page | Pourquoi la garder |
|---|---|
| `Utilisateur:Cywil/Bac à sable` | **La** page d'essai du projet, nommée dans `CLAUDE.md`. À vider, jamais à supprimer. |
| `Bac à sable facettes` | **Outil documenté** : `Ajouter une facette` prescrit en toutes lettres « Vérification avant mise en service : utiliser [[Bac à sable facettes]] ». La supprimer casserait une procédure écrite. |

### Hors périmètre du lot 11, à trancher séparément

| Page | Créée | Origine |
|---|---|---|
| `Test mermaid` | **02/04/2026** | Antérieure de quatre mois au lot 11 |
| `Utilisateur:Cywil/Test multivalué` | 27/07/2026 | Lot 5 |

Je les signale parce qu'elles sortent dans le même filet, mais **elles ne
sont pas à moi** : elles ne viennent d'aucune session du lot 11. À supprimer
ou à garder selon ce que Cyril en sait.

### Récapitulatif

- **12 pages à supprimer** au titre du lot 11 (10 sous-pages + 2 propriétés),
  dans l'ordre indiqué ;
- **1 page à vider** (`Utilisateur:Cywil/Bac à sable`), après l'écriture du §2 ;
- **2 pages à conserver** malgré leur nom ;
- **2 pages hors périmètre**, à l'appréciation de Cyril.

La suppression relève de Cyril : `wiki-put.sh` n'efface pas, et aucun script
de `bin/` ne porte l'action `delete` — délibérément.

---

## Ce que j'attends pour continuer

1. Validation du diff du §1 → j'écris la section et je vérifie (rendu des
   deux tables vides, chiffres inchangés à 40/40/30, `_ERRC` toujours à 1,
   aucune annotation parasite).
2. Validation du texte du §2 → j'écris l'entrée dans *Limites connues* et je
   contrôle `browsebysubject` sur la page.
3. Un mot sur le §3 : je vide le bac à sable après le §2, et Cyril supprime
   les 12 pages quand il veut.
