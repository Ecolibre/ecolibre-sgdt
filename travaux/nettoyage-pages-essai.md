# Nettoyage des pages d'essai du lot 11 — blanchiment

**27 août 2026.** Neuf écritures, toutes abouties, dans l'ordre imposé.
Résumé d'édition unique : `[Nettoyage] Page d'essai du lot 11`.

**Aucune suppression** : le compte n'en a pas le droit. Blanchiment, comme
prévu.

---

## 1. Le droit `delete` : constaté, pas supposé

Vérifié par **deux méthodes indépendantes**, parce que l'appartenance aux
groupes laissait attendre le contraire.

**`meta=userinfo&uiprop=rights` :** le compte `Cywil` est dans
`bureaucrat, interface-admin, smwadministrator, sysop, user, autoconfirmed`.
Et pourtant :

| Droit | État |
|---|---|
| `edit` | **OUI** |
| `move` | OUI |
| `delete` | **non** |
| `undelete` | non |
| `bigdelete` | non |

**`intestactions=delete&intestactionsdetail=full`**, sur une page de sujet et
sur une page de propriété, donne la raison exacte :

```
delete -> permissiondenied
"The action you have requested is limited to users in the group:
 [[Ecolibre:Administrateurs|Administrateurs]]."
```

Le droit de suppression est réservé à un groupe **local**, `Administrateurs`,
auquel le compte n'appartient pas — être `sysop` ne suffit pas sur ce wiki.
C'est la même famille de surprise que `editinterface` : un droit dont
l'appartenance à un groupe standard ne dit rien.

**Donc blanchiment.** Et le blanchiment n'est pas une suppression, ce qui a
une conséquence mesurée au §4.3.

---

## 2. L'inventaire relevé, et ce qu'il vaut

Repris de `recherche-proposition.md` §3, **et vérifié page par page sur le
wiki**. Les 10 pages du groupe A existent toutes ; aucune page annoncée n'est
absente.

Mais **l'inventaire du §3 n'est pas complet**, et il faut le dire :

- **Il ne mentionne pas `Attribut:Casc parent` ni `Attribut:Casc lineage`.**
  Il liste les cinq pages `Casc *` mais oublie les deux propriétés qu'elles
  ont servi à tester. Ces deux-là ne viennent donc pas du §3 : elles viennent
  de la consigne de Cyril.
- **Inversement, il liste `Attribut:Test lot11 keyword` et
  `Attribut:Test lot11 texte`**, que la consigne exclut explicitement de cette
  passe (« puis **seulement** `Attribut:Casc parent` et
  `Attribut:Casc lineage` »). Elles n'ont pas été touchées. Voir §5.

### État réel avant écriture

| Page | Taille | Faits SMW |
|---|---|---|
| `…/Casc R1`, `R2`, `A`, `B`, `C` | 124 o chacune | `_MDAT`, `_SKEY` — **aucune annotation `Casc_*`** |
| `…/Test lot11 sujet 1` et `2` | 124 o chacune | `Test_lot11_keyword`, `Test_lot11_texte` |
| `…/Lot11 item`, `Lot11 lieu`, `Lot11 lieu renomme` | **0 o** | `_MDAT`, `_SKEY` |
| `Attribut:Casc parent`, `Attribut:Casc lineage` | 18 o chacune | `_TYPE` |

**Deux constats en passant :**

**Les cinq pages `Casc *` ne portaient déjà plus rien.** Le fait
`Casc_lineage` faux stocké par `Casc B` — le faux positif documenté dans
*Limites connues* n° 31 — **n'est plus là**. Et `Casc_parent` comme
`Casc_lineage` avaient **zéro page porteuse** avant même cette session.
L'ordre imposé était donc, en fait, sans enjeu ce jour-là. Il a été suivi
quand même : il ne coûte rien, il est juste par principe, et la prochaine fois
l'enjeu pourrait exister.

**Les trois pages `Lot11 …` étaient déjà vides** (vidées lors du test de
redirection des 20-21 août). **Elles n'ont pas été réécrites** — une écriture
sans changement n'aurait fait qu'ajouter une révision inutile à l'historique.

---

## 3. Les neuf écritures, dans l'ordre

### a) Les cinq pages `Casc`

| Page | Révision |
|---|---|
| `Utilisateur:Cywil/Bac à sable/Casc R1` | 881 → **1008** |
| `Utilisateur:Cywil/Bac à sable/Casc R2` | 882 → **1009** |
| `Utilisateur:Cywil/Bac à sable/Casc A` | 883 → **1010** |
| `Utilisateur:Cywil/Bac à sable/Casc B` | 884 → **1011** |
| `Utilisateur:Cywil/Bac à sable/Casc C` | 885 → **1012** |

### b) Les autres sujets de bac à sable

| Page | Révision |
|---|---|
| `Utilisateur:Cywil/Bac à sable/Test lot11 sujet 1` | 836 → **1013** |
| `Utilisateur:Cywil/Bac à sable/Test lot11 sujet 2` | 837 → **1014** |

### c) Puis seulement les deux propriétés `Casc`

| Page | Révision |
|---|---|
| `Attribut:Casc parent` | 851 → **1015** |
| `Attribut:Casc lineage` | 852 → **1016** |

Les douze pages visées font désormais **0 octet**.

### Un piège d'outillage, à retenir

**Un fichier réellement vide fait échouer `bin/wiki-put.sh`** :

```
missingparam : At least one of the parameters "text", "appendtext",
"prependtext" and "undo" is required.
```

`curl --data-urlencode "text@fichier"` sur un fichier de zéro octet n'envoie
aucune valeur, et l'API refuse. **La parade est un fichier contenant un seul
retour à la ligne** : il passe, et MediaWiki rogne les blancs de fin à
l'enregistrement — la page fait bien 0 octet. La première tentative a échoué
sur ce point, **avant toute écriture** : aucun état partiel n'a été laissé
derrière.

---

## 4. Les trois vérifications

### 4.1 — `browsebysubject` : les sujets sont propres, les propriétés pas encore

**Les sept pages de sujet blanchies ne portent plus que `_MDAT` et `_SKEY`.**
`Test lot11 sujet 1` et `2` ont bien perdu leurs annotations
`Test_lot11_keyword` et `Test_lot11_texte`.

**Les deux pages de propriété, elles, ne sont pas encore nettes côté SMW** —
et c'est un résultat, pas un échec :

```
Attribut:Casc parent
  _CHGPRO -> [{"subject":"Casc_parent#102##","data":[{"property":"_MDAT",…}]}]
  _MDAT   -> 1/2026/8/21/11/12/45/0     ← la date du 21 août, pas celle d'aujourd'hui
  _SKEY   -> Casc parent
  _TYPE   -> …swivt/1.0#_wpg
```

Le wikitexte est bien vide (0 octet, révision 1015), mais **le magasin SMW
porte encore l'ancien état** : `_TYPE` subsiste, et `_MDAT` affiche toujours le
21 août. La nouvelle donnée est en attente dans `_CHGPRO`, la **file de
travaux étant figée à 21**. C'est exactement la leçon du 19 août :
`_CHGPRO` portant la charge en JSON pendant que les anciens faits tiennent
n'est pas un défaut de stockage — il faut que la file se vide.

**À relire après vidage de la file, sans rien réécrire.**

### 4.2 — `Erreurs de traitement SMW` : toujours 1

```
Erreurs de traitement SMW : 1
    Attribut:INSEE code
```

**Inchangé.** Les neuf blanchiments n'en ont créé aucune, et n'en ont résolu
aucune.

### 4.3 — `Récapitulatif technique` : oui, les quatre y figurent encore

**Réponse à la question posée : oui.** Constaté à deux niveaux.

Sur la requête qui alimente l'inventaire — `Has type::+` rend **111
propriétés**, dont :

```
Attribut:Casc lineage
Attribut:Casc parent
Attribut:Test lot11 keyword
Attribut:Test lot11 texte
```

Et dans le rendu de la page : **2 occurrences de chacune des quatre**.

**Non corrigé, conformément à la consigne.**

**Mais la prédiction du §3 de `recherche-proposition.md` ne tient pas, et il
vaut mieux le savoir :** elle annonçait que « les deux lignes d'essai
disparaîtront **d'elles-mêmes** de ce tableau, sans édition ». C'était vrai
**pour une suppression**, pas pour un blanchiment. Une propriété blanchie
conserve son `_TYPE` dans le magasin, donc reste dans une requête
`Has type::+`. **Vider une page de propriété ne la retire pas du modèle de
données ; seule la suppression le fait.** Que la file de travaux, une fois
vidée, retire ou non le `_TYPE`, reste à observer — mais l'entité propriété
existe tant que la page existe.

---

## 5. Ce qui reste, et que seul Cyril peut faire

À faire **d'un coup**, quand tu passeras avec un compte du groupe
`Administrateurs`.

### À supprimer — 12 pages, déjà blanchies, à 0 octet

```
Utilisateur:Cywil/Bac à sable/Casc R1
Utilisateur:Cywil/Bac à sable/Casc R2
Utilisateur:Cywil/Bac à sable/Casc A
Utilisateur:Cywil/Bac à sable/Casc B
Utilisateur:Cywil/Bac à sable/Casc C
Utilisateur:Cywil/Bac à sable/Lot11 item
Utilisateur:Cywil/Bac à sable/Lot11 lieu
Utilisateur:Cywil/Bac à sable/Lot11 lieu renomme
Utilisateur:Cywil/Bac à sable/Test lot11 sujet 1
Utilisateur:Cywil/Bac à sable/Test lot11 sujet 2
Attribut:Casc parent
Attribut:Casc lineage
```

**Ordre à tenir là aussi :** les dix sujets avant les deux propriétés.

### À trancher — 2 propriétés d'essai, volontairement laissées intactes

| Page | Taille | Pourquoi elle est encore là |
|---|---|---|
| `Attribut:Test lot11 keyword` | 213 o | Exclue par le « **seulement** » de la consigne |
| `Attribut:Test lot11 texte` | 207 o | Idem |

Elles sont dans l'inventaire du §3 comme pages à supprimer, et leurs deux
sujets (`Test lot11 sujet 1` et `2`) viennent d'être blanchis : **elles n'ont
plus aucun porteur**. Si tu les supprimes, l'ordre est déjà respecté — les
sujets sont passés avant. Je ne les ai pas touchées parce que la consigne les
excluait, pas parce qu'il y aurait un obstacle.

### À trancher — 2 pages hors périmètre du lot 11

| Page | Taille | Contenu |
|---|---|---|
| `Test mermaid` | 31 o | `{{#mermaid:graph TD; A --> B;}}` — créée le 02/04/2026, quatre mois avant le lot 11 |
| `Utilisateur:Cywil/Test multivalué` | **0 o** | déjà vide, lot 5 |

Elles ne viennent d'aucune session du lot 11.

### À garder — 2 pages, malgré leur nom

| Page | Taille | Pourquoi |
|---|---|---|
| `Utilisateur:Cywil/Bac à sable` | 89 o | **La** page d'essai du projet, nommée dans `CLAUDE.md`. À vider, jamais à supprimer. |
| `Bac à sable facettes` | **0 o** | Outil prescrit en toutes lettres par *Ajouter une facette*. |

**Deux remarques sur ces deux-là.**

`Utilisateur:Cywil/Bac à sable` **est déjà revenue à sa ligne d'accueil** :
« Page bac à sable — sert aux tests du lot 9 (voir CLAUDE.md,
lot-9-cadrage-plantes.md). » Les quatre essais A/B/C/D du groupe B n'y sont
plus. **Rien à y faire** — et c'est aussi pourquoi je ne l'ai pas blanchie :
la blanchir aurait effacé cette ligne d'accueil, ce que le groupe C interdit.

`Bac à sable facettes` **fait 0 octet**. La procédure *Ajouter une facette*
renvoie donc vers une page vide. Ce n'est pas cassé — une page d'essai vide
est une page d'essai prête — mais un lecteur qui suit la consigne y trouvera
une page blanche sans explication. Signalé, non corrigé.
