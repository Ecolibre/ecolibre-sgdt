# [Amendement] Propriété d'appartenance `Owned_by` — proposition

**Date : 25 août 2026. Lecture et proposition seulement, aucune écriture.**

`Modèle:Physical item` et `Formulaire:Physical item` sont **en production** :
les 44 exemplaires passent par eux. Les deux diffs des §4 et §5 sont à valider
par Cyril avant toute écriture (garde-fou 6).

Acquis, non rediscuté : `Owned_by` porte sur **Physical item**, type **Page**,
cardinalité **single**, portée documentée **« un acteur »** et non « une
organisation ».

---

## 1. Inventaire — le remplissage ne peut pas être uniforme

**44 items physiques.** Répartition de `Inventory_site` :

| `Inventory_site` | Items |
|---|---|
| **ECL** | **43** |
| **CWL** | **1** |

Le seul non-ECL est **`Batterie de récupération trotinette 1`** (`CWL-0007`) :

```
Inventory_ref  -> ['CWL-0007']
Inventory_site -> ['CWL']
Instance_of    -> ['Batterie_défaillante_récupérée#0##']
```

**La réponse à la question posée est donc : tri, pas uniforme.** 43 + 1, et
le 1 n'est pas un cas de bord théorique — il est déjà là, publié depuis le
26 juillet 2026.

**Un piège de mesure, à consigner.** Le premier comptage a rendu *44 items
sans `Inventory_site`*, chiffre absurde qui aurait fait conclure à une
banque vide. La cause : dans le JSON d'`action=ask`, la clé de `printouts`
est le **label** (`"Inventory site"`, avec une espace), pas la clé interne
(`Inventory_site`). Un filtre sur le mauvais nom rend un faux « absente »
silencieux — exactement le même piège que celui déjà consigné dans
`CLAUDE.md` pour `_PVAL` sur les pages `Attribut:`. Recoupé par
`browsebysubject` sur un item, qui rendait bien `Inventory_site -> ['ECL']`.
**Deux canaux, sinon rien.**

### Répartition `Located_at`, qui confirme la décision de porter sur l'item

| `Located_at` | Items |
|---|---|
| Butte de la tranchée | **29** |
| Jardin de Chilhac | 6 |
| Terrasse de Chilhac | 5 |
| *(aucun)* | 3 |
| Atelier appartement | 1 |

La chaîne de lieux au-dessus des 29, lue en ligne :

```
Butte de la tranchée → Zone basse → Terrain de Cyril au Buisson de Cerzat
                     → Le Buisson de Cerzat → Cerzat
```

Le terrain est bien **deux crans au-dessus** de la butte. Une jointure
`Located_at.Owned_by` ne trouverait rien pour ces 29 exemplaires : SMW ne
remonte pas `Located_in` de proche en proche. C'est la démonstration
chiffrée de pourquoi la propriété va sur l'item.

Trois items n'ont **aucun** `Located_at` (`Batterie de récupération
trotinette 1`, `Bidon 220L Bleu 1`, `Bidon 220L Bleu 2`) — donc trois
exemplaires qu'une approche par le lieu n'aurait de toute façon jamais
atteints, quelle que soit la transitivité.

---

## 2. Lecture des deux pages en production

### `Modèle:Physical item` (revid 544, 45 lignes)

`Located_at` y est câblé en **deux endroits, une ligne chacun** :

```
|Located_at={{{Located_at|}}}                              ← dans le #set
| {{#if:{{{Located_at|}}}|[[{{{Located_at|}}}]]}}          ← ligne de valeur
```

Trois choses à en retenir pour `Owned_by` :

1. **Le nom du paramètre est celui de la propriété** (`Located_at`), sans
   traduction — contrairement aux quatre plus anciens (`site_code` →
   `Inventory_site`, `model_link` → `Instance_of`, `physical_parent` →
   `Part_of`, `sn` → `Serial_number`). C'est la convention récente ;
   `Owned_by` la suit.
2. **Le lien est posé par le modèle, pas par la valeur.** La page stocke
   `Located_at=Butte de la tranchée` en texte nu et c'est
   `[[{{{Located_at|}}}]]` qui en fait un lien. `Owned_by` fait pareil.
3. **Les deux lignes relationnelles partagent un fond distinct**
   (`#e8f0ff`) : « Installé dans (Parent physique) » et « Se trouve à
   (Lieu) ». Les rangs à fond gris (`#f2f2f2`) sont l'identité et les
   attributs propres. `Owned_by` est une troisième relation vers une autre
   page : sa place est dans le bloc bleu.

**Transclusions** : 47 au total — 44 items, `Modèle:Physical item/doc`, le
modèle lui-même, et **`Récapitulatif technique du SGDT`**, qui n'instancie
pas le modèle mais en publie le **code source** via
`{{#invoke:Source|get|Template:Physical item}}`. Conséquence à connaître :
la ligne ajoutée sera **publiée automatiquement** dans la documentation
technique, sans édition supplémentaire. C'est un effet voulu, pas un
risque — mais il faut que la ligne soit présentable.

### `Formulaire:Physical item` (revid 545, 32 lignes)

Le champ `Located_at` :

```
! Se trouve à : {{#info: « Se trouve à » (Located_at) pointe vers un lieu — la machine sur son site ; différent d'« Installé dans » (physical_parent), qui pointe vers un autre item physique — une pompe dans une machine.}}
| {{{field|Located_at|input type=combobox|values from category=Lieu}}}
```

- `input type=combobox` + `values from category=…` : c'est exactement le
  patron que `Owned_by` doit reprendre, avec `Organisation` en catégorie.
- **Le formulaire porte déjà une infobulle de désambiguïsation** entre les
  deux relations. C'est un choix éditorial assumé du lot précédent, et il
  commande le placement du nouveau champ (§5).
- **Le seul champ à valeur par défaut est `site_code`** :
  `default={{Préfixe site}}`. `Modèle:Préfixe site` vaut
  `<includeonly>ECL</includeonly>` et sa documentation dit précisément
  qu'il « ne détermine pas le site d'un exemplaire déjà enregistré » — un
  défaut de création, rien d'autre. C'est l'esprit à reprendre.

**Protection** : `protection: []` sur les deux pages. Rappel du garde-fou 5 —
c'est nécessaire et insuffisant : ni Lockdown ni un verrou SMW n'apparaît
là. Un refus reste possible et serait un résultat normal.

---

## 3. `Attribut:Owned by` — proposé

Nom vérifié **libre** en ligne (`missing`), et absent des 104 pages de
l'espace `Attribut:`.

```
[[Has type::Page]]
[[Property_description_FR::Acteur à qui appartient cet exemplaire. Distincte d'Inventory_site, qui dit quel site l'a inventorié et non à qui il appartient. Un exemplaire peut changer de lieu sans changer de propriétaire.]]
[[Property_description_EN::Actor owning this specimen. Distinct from Inventory_site, which states which site inventoried it, not who owns it. A specimen can change location without changing owner.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::acteur (organisation ou personne)]]
```

Les trois exigences de description sont couvertes, dans l'ordre demandé :
l'acteur propriétaire ; la distinction d'avec `Inventory_site` ; le
changement de lieu sans changement de propriétaire.

**`Property_range` compté par script**, contre le plafond de 85 caractères
du type `Keyword` (`Attribut:Property range` est bien typée `Keyword`,
vérifié) :

```
Plafond Keyword : 85 caracteres

RETENU    33 car  OK       acteur (organisation ou personne)
variante  36 car  OK       un acteur (organisation ou personne)

Temoins deja stockes sur le wiki :
    4 car  Located_at       lieu
   40 car  Located_in       lieu (relation réflexive, parent unique)
   28 car  Location_site    code de site à trois lettres
```

**Pourquoi `acteur (…)` sans l'article** : c'est la forme de
`Located_in`, « lieu (relation réflexive, parent unique) » — nom nu suivi
d'une précision entre parenthèses. La portée reste bien « un acteur » au
sens décidé : elle ne nomme **pas** `Category:Organisation`, et une classe
`Personne` s'ajoutera sans que cette ligne bouge. La variante avec article
est là si Cyril préfère la formulation littérale ; les deux passent
largement.

---

## 4. Diff proposé — `Modèle:Physical item`

Calculé contre le wikitexte relu en ligne à l'instant (revid 544). **Quatre
lignes ajoutées, zéro supprimée** — l'écart de fin de fichier ci-dessous
est l'absence de retour à la ligne final, que MediaWiki retire de toute
façon au stockage.

```diff
@@ -10,6 +10,7 @@
  |Instance_of={{{model_link|}}}
  |Part_of={{{physical_parent|}}}
  |Located_at={{{Located_at|}}}
+|Owned_by={{{Owned_by|}}}
  |Serial_number={{{sn|}}}
  }}

@@ -32,6 +33,9 @@
  ! style="background:#e8f0ff" | Se trouve à (Lieu)
  | {{#if:{{{Located_at|}}}|[[{{{Located_at|}}}]]}}
  |-
+! style="background:#e8f0ff" | Appartient à (Propriétaire)
+| {{#if:{{{Owned_by|}}}|[[{{{Owned_by|}}}]]}}
+|-
  ! style="background:#f2f2f2" | Éléments contenus (Enfants)
```

**Une ligne dans le `#set`, une ligne de tableau à l'affichage.** La ligne
de tableau fait trois lignes de wikitexte — l'en-tête, la valeur, et le
`|-` séparateur — c'est le coût incompressible d'un rang dans une table
MediaWiki, pas un élargissement du périmètre.

**Placements et motifs :**

- `#set` : juste après `Located_at`, avant `Serial_number`. Les deux
  relations vers une page voisinent.
- Affichage : dans le bloc bleu `#e8f0ff`, juste après « Se trouve à
  (Lieu) ». Trois relations, trois cibles, lues d'affilée : *installé
  dans* → un item, *se trouve à* → un lieu, *appartient à* → un acteur.
- Le lien `[[{{{Owned_by|}}}]]` tient **sur une seule ligne** — leçon
  `CLAUDE.md` : un retour à la ligne dans `[[ ]]` casse le lien
  silencieusement et le sort de `pagelinks`.
- Rien d'autre n'est touché : ni le `#ask` des enfants, ni la catégorie de
  pied, ni les rangs existants.

---

## 5. Diff proposé — `Formulaire:Physical item`

Calculé contre le wikitexte relu en ligne (revid 545). **Trois lignes
ajoutées, zéro supprimée.**

```diff
@@ -22,6 +22,9 @@
  |-
  ! Se trouve à : {{#info: « Se trouve à » (Located_at) pointe vers un lieu — la machine sur son site ; différent d'« Installé dans » (physical_parent), qui pointe vers un autre item physique — une pompe dans une machine.}}
  | {{{field|Located_at|input type=combobox|values from category=Lieu}}}
+|-
+! Appartient à : {{#info: Acteur à qui appartient l'exemplaire. Différent du code de site, qui dit quel site l'a inventorié, et du lieu, qui dit seulement où il se trouve : un exemplaire change de lieu sans changer de propriétaire.}}
+| {{{field|Owned_by|input type=combobox|values from category=Organisation|default=Ecolibre}}}
  |}
  {{{end template}}}
```

### Où le placer, et pourquoi

**En dernier champ du bloc principal, juste après « Se trouve à ».** Trois
raisons, la première étant décisive :

1. **La chaîne de désambiguïsation existe déjà à cet endroit.** Le
   formulaire explique en infobulle pourquoi « Se trouve à » n'est pas
   « Installé dans ». Le troisième terme du malentendu est précisément
   l'appartenance : *un plant sur la butte de Cyril appartient-il à la
   butte ?* Poser le champ ailleurs, c'est laisser la question sans
   réponse à l'endroit où elle se pose.
2. **Le formulaire épouse alors l'ordre du modèle** (§4) : mêmes trois
   relations, même suite, à l'écran de saisie comme à l'affichage.
3. **Le bloc d'identité du haut reste intact.** `site_code` et
   `ref_number` forment une paire auto-calculée — le second dépend du
   premier par le `#ask` Base36. Rien à insérer entre les deux.

**Alternative écartée :** placer `Owned_by` juste après « Code de site »,
pour rapprocher les deux champs à valeur par défaut. Rapprocher ces deux-là
est justement ce qu'il ne faut pas faire : `Inventory_site` dit *qui a
inventorié*, `Owned_by` dit *à qui ça appartient*, et la page de propriété
(§3) existe pour les séparer. Les voisiner sur le formulaire inviterait à
les recopier l'un sur l'autre.

### Sur le défaut : `default=Ecolibre` en clair, pas un modèle

L'esprit de `{{Préfixe site}}` est repris — une constante de wiki, réglée
une fois, servant de défaut à la création et ne déterminant rien pour un
exemplaire déjà enregistré. La **forme**, en revanche, n'a pas lieu d'être
reprise : `{{Préfixe site}}` est un modèle parce que `ECL` y sert **deux
fois** (le défaut du champ, et le `#ask` qui calcule le numéro suivant).
`Ecolibre` ne sert qu'une fois. Le dépôt a déjà la règle inverse —
*« répéter deux fois la même construction est le signe qu'il faut en faire
un script »* — donc un seul usage ne justifie pas encore l'indirection.

Le jour où une seconde construction a besoin de l'organisation par défaut,
`Modèle:Organisation par défaut` se crée à ce moment-là, sur le patron
exact de `Modèle:Préfixe site`, et le formulaire change d'un mot.

### Un point à connaître avant de câbler la combobox

`Catégorie:Organisation` **ne contient qu'une page** : `Ecolibre`. La
combobox n'offrira donc qu'une valeur — suffisant pour les 43 items ECL,
**insuffisant pour le CWL-0007** : `CWL Optéos` n'a pas de page
d'organisation sur ce wiki. Voir §6.

---

## 6. Remplissage des 44 items existants — méthode, sans l'exécuter

### La question préalable à trancher, avant la première écriture

Les 43 items ECL sont ceux qu'**Ecolibre a inventoriés**. Rien dans le wiki
ne dit qu'Ecolibre les **possède** — et c'est exactement la distinction que
la page de propriété du §3 s'emploie à poser. Le doute est concret : 29 de
ces exemplaires poussent sur `Terrain de Cyril au Buisson de Cerzat`, un
lieu nommé d'après une personne, et la classe `Personne` n'existe pas
encore.

Deux réponses possibles, l'une et l'autre légitimes :

- **« Ecolibre pour les 43 »** — le remplissage est immédiat, et une
  correction ultérieure reste possible item par item.
- **« Ecolibre pour une partie, Cyril pour les plantations »** — alors
  `Owned_by` reste vide sur les plantations jusqu'à ce que
  `Catégorie:Personne` et la page `Cyril` existent. Écrire `Ecolibre`
  maintenant pour le corriger ensuite reviendrait à poser 29 faits faux,
  puis à les reprendre.

**Une réponse en un mot de Cyril suffit.** Je ne la devine pas : le
vocabulaire « acteur » a précisément été retenu pour que cette distinction
reste ouverte, et trancher à sa place ici la refermerait en silence.

### Ordre des opérations

L'ordre n'est pas indifférent — leçon `CLAUDE.md`, *« modèle avant
formulaire »* : ouvrir la saisie avant que le modèle sache stocker ouvre une
fenêtre où des valeurs saisies sont perdues sans erreur.

| # | Écritures | Quoi | Pourquoi à ce rang |
|---|---|---|---|
| 1 | **1** | `Attribut:Owned by` (§3) | Le type et le domaine doivent exister avant le premier fait. Sinon SMW retombe sur le type Page par défaut, sans domaine ni description. |
| 2 | **1** | `Modèle:Physical item` (§4) | Tant que le `#set` n'a pas la ligne, tout `\|Owned_by=` posé sur une page est **inerte** — la valeur est dans le wikitexte, absente du magasin. |
| 3 | **43** | Remplissage des items ECL | Après le 2, donc chaque écriture produit un fait immédiatement. |
| 4 | **0 ou 1** | `CWL-0007` | Voir ci-dessous. |
| 5 | **1** | `Formulaire:Physical item` (§5) | En dernier : la saisie ne s'ouvre que sur un modèle qui sait stocker et un stock déjà cohérent. |

**Total : 46 écritures** si Cyril répond « Ecolibre pour les 43 » et laisse
le CWL de côté ; **47** s'il faut aussi créer `CWL Optéos`, qui devient
alors une écriture supplémentaire au rang 0 (une page `Organisation`, sur
le patron d'`Ecolibre`), le CWL-0007 passant à 1 écriture au rang 4.

**Le cas CWL-0007, à trancher aussi.** `Inventory_site=CWL` dit que
l'exemplaire a été inventorié par CWL Optéos. Trois issues : créer
`CWL Optéos` en `Catégorie:Organisation` et l'y rattacher ; laisser
`Owned_by` vide sur cet item, ce qui est un état lisible et honnête ; ou le
rattacher à Ecolibre si l'objet a effectivement changé de mains. **Ne pas
recopier `CWL` mécaniquement depuis `Inventory_site`** — ce serait
exactement le raccourci que la description de la propriété interdit.

### Comment les 43 écritures se font

**Édition directe du wikitexte, jamais par le formulaire.** Leçon
`CLAUDE.md` : *« une vérification par formulaire n'est jamais en lecture
seule »* — rouvrir 43 items dans Page Forms, c'est 43 occasions de
ré-enregistrer des valeurs pré-remplies et de déclencher des effets de bord
sur les blocs de facette.

Une ligne `|Owned_by=Ecolibre` insérée par `bin/wiki-put.sh`, une page à la
fois, un résumé par page — garde-fou 2, « une modification = une édition =
un résumé explicite ».

**Le point d'insertion a été vérifié sur les 44 pages :**

```
items examines          : 44
sans ligne |model_link= : 0 []
sans ligne |Located_at= : 3 ['Batterie de récupération trotinette 1',
                             'Bidon 220L Bleu 1', 'Bidon 220L Bleu 2']
portant deja Owned_by   : 0 []
a plus d'un bloc {{Physical... : 40
```

Donc : **ancrer sur `|model_link=`**, présente sur les 44 — c'est le seul
paramètre obligatoire du formulaire, et le seul universellement présent.
`|Located_at=` manque sur trois pages et ne peut pas servir d'ancre.
Ancrer sur « la dernière ligne avant `}}` » serait pire encore : 40 pages
sur 44 portent un **second** bloc `{{Physical facet plant`, donc plusieurs
`}}`.

Aucune des 44 ne porte déjà `Owned_by` : pas de collision, pas d'écrasement
d'une valeur existante.

### Contrôles après remplissage

Dans cet ordre, et **après vidage de la file de travaux** (`jobs = 0` par
`meta=siteinfo&siprop=statistics`) — sans quoi les pages fraîchement
écrites rendent une clé `_CHGPRO` au lieu de leurs faits, et une relecture
trop tôt fait croire à un échec de stockage :

1. **Le compte.** `[[Category:Physical item]] [[Owned_by::+]]` en
   `format=count` doit rendre **43** (ou 44). Comparé à 44, le total de la
   classe : l'écart doit être exactement le nombre d'items volontairement
   laissés vides, et pas un de plus. C'est le contrôle qui attrape une
   écriture inerte.
2. **Le magasin, pas le wikitexte.** `browsebysubject` sur trois items
   pris dans des situations différentes — une plantation de la butte, la
   machine à souder, un bidon sans `Located_at` — et vérifier
   `Owned_by -> ['Ecolibre#0##']`, forme sérialisée d'une propriété de
   type Page. Une valeur rendue sans `#0##` signalerait un type mal pris.
3. **Erreurs de traitement SMW.** `[[_ERRC::+]]` doit rester à **1**
   (`Attribut:INSEE code`, préexistante, mesurée ce jour). Toute page qui
   s'y ajoute est une annotation rejetée en silence.
4. **Les liens retour.** `list=backlinks` sur `Ecolibre` doit remonter les
   43 items. C'est le contrôle spécifique à `[[ ]]` : un lien cassé par un
   retour à la ligne s'écrit sans erreur d'API mais n'entre jamais dans
   `pagelinks`.
5. **Le rendu d'une page**, une seule : le rang « Appartient à
   (Propriétaire) » doit afficher un lien bleu vers `Ecolibre`, pas un
   lien rouge ni une accolade nue.
6. **Le formulaire, une fois seulement**, sur `Utilisateur:Cywil/Bac à
   sable` ou un item neuf — jamais sur un des 44. Vérifier que la combobox
   propose `Ecolibre` et que le défaut se pose à la création.

### Ce qui reste hors de ce remplissage

`Avancement du jardin-forêt` interroge aujourd'hui `Located_at` sur trois
lieux nommés en dur. Le basculer sur `Owned_by` — l'objet même du besoin de
départ — est une **édition distincte**, à proposer une fois les 43 faits en
place et vérifiés. Rien ne sert de réécrire la requête avant que la donnée
qu'elle interrogerait existe.
