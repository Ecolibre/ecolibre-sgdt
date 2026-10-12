# Lot 12 — Clôture 1 sur 3 : les arbitrages rendus en cours de route reportés sur la page du lot

Date : 12 octobre 2026. Consigne de l'architecte, relayée par Cyril. Avant
toute écriture, Cyril l'a amendée sur trois points, en réponse à deux séries
de questions : voir « Avant d'écrire ». La consigne annonçait une seule page
modifiée. Il y en a deux : la seconde, `Attribut:Storage rank`, a été ajoutée
par Cyril.

## En bref

| Page | Révision avant | Taille avant | Révision après | Taille après | Résumé |
|---|---|---|---|---|---|
| Lot 12 — Contenants et étiquetage | 1503 | 9074 octets | 1542 | 12291 octets | `[Lot 12][Clôture] arbitrages rendus en cours de lot reportés, points ouverts remplacés, idées écartées ajoutées` |
| Attribut:Storage rank | 1525 | 1188 octets | 1543 | 1060 octets | `[Lot 12][Correctif] Planting_rank mesure une position en mètres, sans incréments de dix` |

Chaque page a été écrite en une seule édition, et les deux ont rendu
`Success`. La page du lot a été écrite à 16:01:22 UTC, la page de propriété à
16:01:44 UTC.

Les sept vérifications de la consigne sont conformes, la quatrième dans sa
forme amendée : seize puces, et non douze. La vérification ajoutée par Cyril
est conforme aussi : plus aucune occurrence de « incréments de dix » ni de
« increments of ten » sur le wiki. Sur la page de propriété : pas de
`_CHGPRO`, pas de verrou, et le type résolu reste `_num`.

## Étape 1 — État du dépôt et règles locales

`git status --short --branch` :

```
## main...origin/main
?? travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md
```

Le seul fichier non suivi est celui que la consigne dit de laisser de côté.

`.claude/settings.local.json`, relevé au début de la tâche : 59 octets, aucune
règle.

```
{
  "permissions": {
    "allow": [],
    "deny": []
  }
}
```

## Étape 2 — Lectures

- `CLAUDE.md` : 806 lignes ; il a été modifié pour la dernière fois par le
  commit `6651236` du 10 octobre 2026.
- `Lot 12 — Contenants et étiquetage` : révision 1503, du 11 octobre 2026 à
  10:55:51 UTC, résumé `[Lot 12][Tâche 2]`, 9074 octets, 83 lignes. Aucune
  écriture n'a eu lieu depuis : c'est la version sur laquelle la consigne a
  été écrite.
- `Procédure de clôture d'un lot` : 6519 octets. Son étape 3 prévoit la section
  « Ce qui est écarté, et pourquoi », avec raison et date. Le titre ajouté à
  l'étape 7 en reprend exactement le nom.

État de la page avant écriture, relevé pour les vérifications 6 et 7 :

- **Faits.** Les voici :
  - `Work_package_number` = 12 ;
  - `Work_package_status` = ouvert ;
  - `Work_package_opening_date` = 2026-10-11 ;
  - `Work_package_overlaps` = Lot 17 — Arbre fonctionnel ;
  - `Work_package_summary` inchangé ;
  - trois `_ASK`, `_INST` = Lot, `_MDAT` = 2026-10-11 10:55:51, `_SKEY`.
- **Liens.** Neuf, tous vers des pages existantes :
  - Lot 16, Lot 39, Lot 40, Lot 21, Lot 7 et Lot 17 ;
  - Gestion des lots ;
  - Limites connues du Système de Gestion de Données Techniques ;
  - Attribut:Work package status.
- **Catégorie.** Une seule : Lot.
- **Sections.** Sept : Objet, Ce qui est déjà tranché, Dépendances, Périmètre,
  Point de départ, Risques connus, Points ouverts.

## Avant d'écrire : mesures et amendements

### Les faits cités par les textes à insérer

J'ai vérifié en ligne, avant d'écrire, les affirmations des textes fournis
qui portent sur l'état du wiki. Toutes se sont vérifiées.

| Affirmation | Mesure | Résultat |
|---|---|---|
| « Les 34 valeurs simples » de Supplier | `action=ask` sur `Supplier::+` | 34 porteurs, 34 valeurs, 12 valeurs distinctes, aucune double |
| « Les douze pages de fournisseur sont des liens rouges » | `action=query&titles=` sur les 12 valeurs | 12 titres, 12 `missing` |
| « Non défini », « employée quatre fois » | même requête que la première ligne | 4 |
| « La date d'étiquette n'a jamais reçu de valeur » | `action=ask` sur `Label_date::+` | 0 résultat |
| Supplier, « un widget différent des cinq autres champs multivalués » | wikitexte de `Formulaire:Referenced item` | six champs `list` ; Supplier en `combobox` ; Corresponds_to_organic, Part_of, Materials_worked, Measured_quantities et Wanted_by en `tokens` |
| La non-agrégation, « règle publiée sur Catégorie:Lieu » | wikitexte de `Catégorie:Lieu` | section « Le rattachement ne remonte pas l'arbre » : « elle n'agrège pas ce que portent ses descendants » |
| La page de contrôle « cherche … au quatrième saut de contenance » | wikitexte de `Modèle:Containment audit` | ce modèle interroge `Contained_in.Contained_in.Contained_in.Contained_in::+` |
| « de trois chaînes à quatorze » | calcul | une relation sur trois niveaux donne 3 chaînes ; deux relations donnent 2 + 4 + 8 = 14 |

### Puce 3.5 : la phrase sur Planting_rank était fausse

La puce 3.5 de la consigne disait que `Planting_rank` « compte en mètres
depuis une origine et procède par incréments de dix pour insérer sans
renuméroter ». Je l'ai mesuré de nouveau aujourd'hui :

- les 22 valeurs en base sont des positions en mètres avec décimales : 0,8 ;
  9,7 ; 22,2 ; 26,8 ; 32,2 ; 37,1 ; 37,5 ; 41,4 ; 42,8 ; 43,2 ; 44,2 ; 45,9 ;
  46,6 ; 48,7 ; 49,6 ; 53,1 ; 54,3 ; 56,2 ; 58,3 ; 61 ; 68,2 ; 82. Aucun pas
  de dix ;
- `Attribut:Planting rank` dit : « en mètres depuis l'origine du lieu où il se
  trouve — décimales admises ».

C'était la question A de la tâche 6, restée sans réponse. J'ai posé la
question à Cyril avant d'écrire. Sa réponse : garder ma formulation, ne
remplacer que la relative, et laisser le reste de la puce mot pour mot. La
puce écrite dit donc : « Il est distinct de <code>Planting_rank</code>, qui
mesure une position en mètres depuis l'origine du lieu, décimales admises, et
ne se renumérote donc jamais. »

Cyril a ajouté deux demandes :

- corriger dans la même tâche la description française
  d'`Attribut:Storage rank`, qui portait la même erreur, avec le texte et le
  résumé qu'il a donnés ;
- ajouter à l'étape 8 une vérification : plus aucune occurrence de
  « incréments de dix » sur le wiki.

### Description anglaise de la même page

La description anglaise d'`Attribut:Storage rank` portait la même erreur :
« which counts in metres from an origin and uses increments of ten so that
items can be inserted without renumbering », puis « and increments of ten
would lie ». Une recherche plein texte sur tout le wiki ne trouvait
« increments of ten » que sur cette page, et « incréments de dix » que sur
elle et sur la page du lot. Comme la page de propriété devait être écrite en
une seule fois, j'ai posé la question avant d'écrire. Cyril a répondu de
corriger aussi l'anglais, dans la même écriture et sous le même résumé, avec
le texte qu'il a donné. Il a ajouté à l'étape 8 la vérification qu'aucune
occurrence de « increments of ten » ne subsiste.

### Vérification 4 : seize puces, pas douze

La vérification 4 attendait douze puces dans « Ce qui est déjà tranché ». La
section en comptait treize à la révision 1503, celle sur laquelle la consigne
a été écrite. Les six remplacements gardent ce nombre, et les trois ajouts le
portent à seize. J'ai posé la question avant d'écrire. Cyril a répondu de
garder seize puces et d'appliquer les étapes 3 et 4 telles qu'elles sont
écrites. Selon lui, le « douze » est une erreur de compte de l'architecte. La
vérification 4 attend donc seize puces.

## Étapes 3 à 7 — La page du lot

Les étapes 3 à 7 ont été appliquées sur une copie locale de la révision 1503,
chaque remplacement et chaque insertion séparément, chacun repéré par un texte
présent une seule fois. L'ensemble est ensuite parti en une seule édition.
Avant l'envoi, après `bin/wiki-login.sh`, la page ne portait aucune protection
native, et `intestactions=edit` sous l'utilisateur Cywil ne rendait aucune
erreur. Le diff a été relu avant l'envoi. Aucune ligne ne contient de `[[`
sans `]]` sur la même ligne. Trois liens sont ajoutés :
`[[:Modèle:Lieu par contenance|Modèle:Lieu par contenance]]`,
`[[Administration SGDT]]` et `[[:Catégorie:Lieu]]`. Les deux qui visent une
catégorie ou un modèle commencent par un deux-points : ce sont des liens, pas
des catégorisations. Après écriture, le wikitexte relu en ligne est identique
octet pour octet au fichier envoyé (`cmp`).

Diff intégral, de la révision 1503 à la révision 1542 :

```diff
18c18
< * '''Une pile posée au sol n'est pas un objet, c'est la disposition de plusieurs objets, et elle ne réalise aucune fonction.''' Un contenant est une étagère, un casier, un plateau à roulettes — de vrais objets, avec dimensions, fonction et fabricant éventuel. Le cas de la pile disparaît par là.
---
> * '''Une pile n'est pas un exemplaire, c'est un lieu.''' Elle n'instancie aucun modèle, n'a ni fabricant ni cotes, et un exemplaire physique doit pointer vers le référencé dont il est l'instance. Quand il faut la nommer, pour distinguer deux piles côte à côte, elle se crée comme lieu de type pile, enfant du lieu qui la porte. Même raison que pour une planche de culture. Un contenant, lui, est une étagère, un casier, un plateau à roulettes, de vrais objets avec dimensions, fonction et fabricant éventuel. Tranché le 11 octobre 2026.
21,22c21,22
< * '''Un item porte <code>Located_at</code> ou <code>Contained_in</code>, jamais les deux.''' Porter les deux dupliquerait le lieu, et un contenant mobile rendrait la copie fausse au premier déménagement — sans prévenir.
< * '''Le lieu se calcule par cascade bornée à quatre niveaux, pas par lignée matérialisée.''' Motif : Semantic Scribunto est absente, Lua ne peut pas interroger SMW, donc la cascade s'écrit en wikitexte et dix niveaux produiraient un modèle illisible. Et une valeur calculée à l'affichage ne peut pas se désynchroniser, contrairement à une lignée stockée. Le lot 11 a déjà payé le prix d'un patron trop subtil : <code>#show</code> vers <code>#set</code> rendait des faits faux en silence sur une propriété de type Page.
---
> * '''Un item porte <code>Located_at</code> ou <code>Contained_in</code>, jamais les deux.''' Porter les deux dupliquerait le lieu, et un contenant mobile rendrait la copie fausse au premier déménagement, sans prévenir. Quand un exemplaire porte un contenant, sa fiche calcule son lieu en remontant la contenance, par [[:Modèle:Lieu par contenance|Modèle:Lieu par contenance]].
> * '''Le lieu se calcule par cascade, pas par lignée matérialisée, et la contenance est bornée à trois contenants emboîtés.''' Motif de la cascade : Semantic Scribunto est absente, Lua ne peut pas interroger SMW, et une valeur calculée à l'affichage ne peut pas se désynchroniser, contrairement à une lignée stockée. Le lot 11 a déjà payé le prix d'un patron trop subtil. Motif de la borne à trois : la fiche de lieu retrouve un objet par une chaîne qui traverse les contenants puis atteint le lieu, soit quatre sauts, le maximum admis par cette installation. Un quatrième contenant en demanderait cinq.
24,25c24,25
< * '''Le dépassement se détecte par la présence, jamais par l'absence.''' Une négation du type propriété deux-points deux-points point d'exclamation plus se compile silencieusement en sa forme positive et ne rend jamais zéro. La page de contrôle cherchera donc ce qui existe au cinquième saut de contenance.
< * '''Le rang dans un contenant est une propriété distincte de <code>Planting_rank</code>.''' Celui-ci compte en mètres depuis une origine, subdivisible, par incréments de dix pour insérer sans renuméroter. Un rang de pile est l'inverse : glisser une caisse au milieu décale physiquement toutes celles du dessus. Entiers consécutifs, et surtout pas d'incréments de dix, qui mentiraient sur la réalité.
---
> * '''Le dépassement se détecte par la présence, jamais par l'absence.''' Une négation se compile silencieusement en sa forme positive et ne rend jamais zéro. La page de contrôle cherche donc ce qui existe au quatrième saut de contenance, et non au cinquième, qui serait refusé par la limite de profondeur. Elle vit sur [[Administration SGDT]].
> * '''Le rang s'appelle <code>Storage_rank</code> et se compte depuis la base d'une pile ou le fond d'une étagère, en entiers consécutifs à partir de 1.''' Il est distinct de <code>Planting_rank</code>, qui mesure une position en mètres depuis l'origine du lieu, décimales admises, et ne se renumérote donc jamais. Compter depuis la base fait qu'empiler par-dessus donne le rang suivant sans rien renuméroter ; seule l'insertion au milieu renumérote, et c'est le reflet fidèle du geste, puisqu'elle décale physiquement tout ce qui est au-dessus. Tranché le 11 octobre 2026.
28c28
< * '''L'étiquette d'un contenant dérive, et c'est assumé.''' Elle liste un contenu qui change ; le wiki porte la vérité, l'étiquette est une copie. SMW ne sait pas comparer deux dates portées par deux sujets différents, donc aucun mécanisme ne surveillera cette péremption. La page du contenant affichera son contenu réel à côté de la date d'étiquette, et l'œil tranchera.
---
> * '''L'étiquette ne porte que la référence de l'exemplaire, contenants compris, et ne périme jamais.''' Elle ne liste pas le contenu d'une caisse : le lien entre un objet et son contenant vit dans le wiki, pas sur le carton. Une seule propriété de date d'étiquette suffit donc pour tous les exemplaires, et il n'y a aucune péremption à surveiller. Tranché le 12 octobre 2026.
29a30,32
> * '''Au niveau de l'exemplaire, une seule relation d'emboîtement, <code>Contained_in</code>.''' Monté dans une machine ou rangé dans une caisse se constatent de la même façon, en ouvrant le couvercle. Garder deux relations distinctes à ce niveau ferait passer la fiche de lieu de trois chaînes à quatorze, et le plafond de trois contenants ne tiendrait pas. La composition reste au niveau référencé, dans la nomenclature du modèle, où elle ne bouge pas quand on déplace l'objet. Tranché le 11 octobre 2026.
> * '''Une fiche de lieu fait remonter les objets rangés dans ses contenants, mais pas ceux de ses lieux descendants.''' Elle liste les items qui lui sont directement rattachés, plus ceux rangés dans un contenant présent chez elle, sur trois niveaux. Un objet dans une caisse d'une pile d'une pièce apparaît donc sur la fiche de la pile, pas sur celle de la pièce. La non-agrégation des lieux descendants est la règle publiée sur [[:Catégorie:Lieu]], et ce lot ne l'a pas changée. Tranché le 11 octobre 2026.
> * '''L'état d'un exemplaire s'appelle <code>Service_status</code>, et non état de cycle de vie.''' Le terme de cycle de vie appartient au vocabulaire du PLM et désignera l'état de conception d'un modèle, au niveau référencé. Un état de conception décrit un modèle, un état de service décrit un objet unique : les deux ne se croiseront jamais sur la même page. Tranché le 12 octobre 2026.
35c38
< Le lot <code>Module:Base36</code> attend celui-ci : sa distinction entre référence retirée et référence jamais utilisée a besoin de l'état de cycle de vie et de la date d'étiquette définis ici.
---
> Le lot <code>Module:Base36</code> attend celui-ci : sa distinction entre référence retirée et référence jamais utilisée a besoin de l'état de service et de la date d'étiquette définis ici.
47c50
< * l'état de cycle de vie ;
---
> * l'état de service ;
77,80c80,90
< * Le nom de la propriété de rang, et sa description, qui devra renvoyer à <code>Planting_rank</code> pour qu'on ne les confonde pas.
< * Le vocabulaire des états de cycle de vie, et sa forme grammaticale — la même question que pour <code>Procurement_route</code>, où les participes passés l'ont emporté.
< * Si la date d'étiquette d'un contenant est la même propriété que celle d'un objet ordinaire, ou une seconde : un contenant porte une étiquette qui décrit autre chose que lui.
< * Sous quelle branche de l'arbre fonctionnel se range la fonction de rangement. Stocker l'eau non potable existe déjà, donc les fonctions de stockage ont une place ; laquelle exactement se lit sur l'arbre vivant.
---
> * Le découpage de plusieurs fournisseurs par la virgule n'a jamais été éprouvé sur une vraie valeur double. Les 34 valeurs simples sont intactes, ce qui prouve que le séparateur ne casse rien, pas qu'il coupe.
> * Le champ Supplier du formulaire référencé emploie un widget différent des cinq autres champs multivalués du même formulaire. Personne n'a pu vérifier qu'il permet de choisir un second fournisseur par autocomplétion, une vérification par formulaire n'étant jamais en lecture seule.
> * La liste des valeurs d'état est écrite à deux endroits, la page de la propriété et le formulaire physique, qui peuvent diverger.
> * La date d'étiquette n'a jamais reçu de valeur, donc son champ n'est pas éprouvé.
> * Les douze pages de fournisseur sont des liens rouges, dont "Non défini", valeur de remplissage employée quatre fois.
> 
> == Ce qui est écarté, et pourquoi ==
> 
> * '''Calculer le lieu objet par objet depuis la fiche de lieu''', par un modèle appelé pour chaque ligne du résultat. Écarté le 11 octobre 2026 : cela ferait évaluer quatre requêtes par exemplaire à chaque affichage d'une fiche de lieu, alors qu'un versement massif de contenu est annoncé. C'est aussi l'astuce que les risques connus de ce lot demandent d'éviter, long et plat valant mieux qu'astucieux.
> * '''Nommer une pile par une chaîne de texte libre portée par chaque objet''', pour distinguer deux piles sans créer de page. Écarté le 11 octobre 2026 : cela fabrique une entité sans page, que rien ne contrôle ni ne liste, du même genre que les pages de fournisseur nues.
> * '''Détecter automatiquement une étiquette périmée.''' Écarté le 12 octobre 2026 : une étiquette ne porte que la référence de l'exemplaire, donc elle ne périme pas, et il n'y a rien à détecter.
```

## Correctif — Attribut:Storage rank

Les droits ont été vérifiés avant l'écriture, après `bin/wiki-login.sh` :
`intestactions=edit` sous l'utilisateur Cywil ne rendait aucune erreur, sans
aucune protection native. Seules les deux descriptions changent : `Has
type::Number` n'est pas touché, et le type ne change donc pas. Le wikitexte
relu en ligne après écriture est identique au fichier envoyé.

```diff
2,3c2,3
< [[Property_description_FR::Rang de l'exemplaire dans son contenant ou dans son lieu, compté en entiers consécutifs depuis la base d'une pile ou le fond d'une étagère. À ne pas confondre avec Planting_rank, qui compte en mètres depuis une origine et procède par incréments de dix pour insérer sans renuméroter. Ici c'est l'inverse, puisque insérer au milieu d'une pile décale physiquement tout ce qui est au-dessus. La renumérotation reflète alors ce qui se passe réellement, et les incréments de dix mentiraient.]]
< [[Property_description_EN::Rank of the specimen within its container or place, counted in consecutive integers from the bottom of a stack or the back of a shelf. Not to be confused with Planting_rank, which counts in metres from an origin and uses increments of ten so that items can be inserted without renumbering. Here the opposite holds, since inserting in the middle of a stack physically shifts everything above it. Renumbering then mirrors what actually happens, and increments of ten would lie.]]
---
> [[Property_description_FR::Rang de l'exemplaire dans son contenant ou dans son lieu, compté en entiers consécutifs depuis la base d'une pile ou le fond d'une étagère. À ne pas confondre avec Planting_rank, qui mesure une position en mètres depuis l'origine du lieu, décimales admises, et ne se renumérote jamais. Ici insérer au milieu d'une pile décale physiquement tout ce qui est au-dessus, et la renumérotation reflète donc ce qui se passe réellement.]]
> [[Property_description_EN::Rank of the specimen within its container or place, counted in consecutive integers from the bottom of a stack or the back of a shelf. Not to be confused with Planting_rank, which measures a position in metres from the origin of the place, decimals allowed, and is never renumbered. Here, inserting in the middle of a stack physically shifts everything above it, so renumbering mirrors what actually happens.]]
```

Cyril avait demandé de vérifier, après l'écriture, l'absence de `_CHGPRO`
et l'état du verrou :

| Heure (UTC) | Délai depuis l'écriture | `_CHGPRO` | `intestactions=edit` (Cywil) |
|---|---|---|---|
| ≈ 16:02 | moins d'une minute | absent | aucune erreur |
| 16:03:51 | 2 min 07 s | non relevé | aucune erreur |
| 16:05:39 | 3 min 55 s | absent | aucune erreur |
| 16:08:16 | 6 min 32 s | absent | aucune erreur |

Dès la première lecture, les faits portaient les deux nouvelles descriptions
en entier. `_TYPE` vaut `_num`, comme avant ; `Property_cardinality`,
`Property_domain` et `Property_range` sont inchangés, et `_MDAT` vaut
2026-10-12 16:01:44. Le type n'ayant pas changé, la propagation n'a laissé
aucune trace, et la page n'a pas été verrouillée.

La page ayant été réécrite, j'ai relu par prudence son type résolu à
l'exécution, par un `action=ask` sur `Storage_rank::+`, avec `Planting_rank`
pour témoin. Résultat : `Storage rank` → `_num`, témoin `Planting rank` →
`_num`. L'unique porteur, Caisse en carton — Atelier appartement (CWL-000C),
garde le rang 1. Après purge, la page de propriété se rend sans classe
d'erreur ni avertissement (`bin/wiki-warnings.sh` : « Aucun avertissement »).
Elle porte un seul lien, vers `Catégorie:Physical item`, qui existe et vient
de `Property_domain`, ligne non modifiée.

## Étape 8 — Vérifications

**File et purge.** Au premier appel, `bin/wiki-wait-jobs.sh` a répondu « FILE
FIGEE a 5 travaux » après cinq essais. J'ai fait une pause de cinq minutes en
arrière-plan, puis relancé le script, qui a répondu « essai 1 : jobs=0 » et
« FILE VIDE ». J'ai ensuite purgé les deux pages par `bin/wiki-purge.sh` :
toutes deux ont rendu `purged: true` et `linkupdate: true`. Toutes les
lectures qui suivent sont postérieures à cette purge.

**1) Rendu de la page du lot.** Conforme.
- **Sections.** Il y en a huit, dans cet ordre : Objet, Ce qui est déjà
  tranché, Dépendances, Périmètre, Point de départ, Risques connus, Points
  ouverts, Ce qui est écarté, et pourquoi.
- **Table des matières.** Elle est présente et liste les mêmes huit entrées,
  dans le même ordre. La nouvelle section y figure en dernier.
- **Place de la nouvelle section.** Les positions relevées dans le HTML rendu
  se suivent dans l'ordre attendu :
  - le titre « Points ouverts » (19869) ;
  - le titre « Ce qui est écarté, et pourquoi » (21422) ;
  - la dernière idée écartée (22792) ;
  - le filet `<hr` (22998) ;
  - « Voir aussi » (23008).
- **Les quatre sections touchées.** Toutes s'affichent :
  - « Ce qui est déjà tranché » : 16 éléments de liste ;
  - « Dépendances » : la phrase « a besoin de l'état de service et de la date
    d'étiquette définis ici » apparaît une fois ;
  - « Périmètre » : 12 éléments, dont le sixième est « l'état de service ; ».
    Le rendu met une espace insécable avant le point-virgule, d'où un premier
    décompte à zéro, corrigé en tolérant tout espace ;
  - « Points ouverts » : 5 éléments.

**2) « cycle de vie ».** Conforme. Deux occurrences dans le wikitexte, toutes
deux dans la puce « L'état d'un exemplaire s'appelle <code>Service_status</code>,
et non état de cycle de vie » : l'une dans son titre en gras, l'autre dans
« Le terme de cycle de vie appartient au vocabulaire du PLM ». Le texte rendu
en compte deux aussi.

**3) Formules disparues.** Conforme. « cinquième saut », « l'étiquette d'un
contenant dérive » et « Une pile posée au sol » : zéro occurrence, en ignorant
la casse, dans le wikitexte comme dans le rendu.

**4) Seize puces dans « Ce qui est déjà tranché ».** Conforme à la forme
amendée. Leurs premiers mots, dans l'ordre du rendu, avec * pour une puce
remplacée et + pour une puce ajoutée :

1. La frontière est mobilier contre immobilier.
2. \* Une pile n'est pas un exemplaire, c'est un lieu.
3. Un contenant a droit à la chaîne complète
4. Les contenants se regroupent par taille, pas par provenance.
5. \* Un item porte Located_at ou Contained_in, jamais les deux.
6. \* Le lieu se calcule par cascade, pas par lignée matérialisée
7. Le plafond ne limite pas la réalité
8. \* Le dépassement se détecte par la présence, jamais par l'absence.
9. \* Le rang s'appelle Storage_rank
10. Un objet qui n'existe plus garde sa page et sa référence.
11. Une référence n'est recyclable que si
12. \* L'étiquette ne porte que la référence de l'exemplaire
13. La règle de contenance se documente sur Catégorie:Physical item.
14. \+ Au niveau de l'exemplaire, une seule relation d'emboîtement
15. \+ Une fiche de lieu fait remonter les objets rangés dans ses contenants
16. \+ L'état d'un exemplaire s'appelle Service_status

Le wikitexte compte aussi 16 lignes en `* ` dans cette section.

**5) Points ouverts et idées écartées.** Conforme. 5 puces dans « Points
ouverts » et 3 dans « Ce qui est écarté, et pourquoi », au rendu comme dans le
wikitexte.

**6) Faits de la page.** Conforme. Ils sont identiques à ceux relevés avant
écriture, hormis la date de modification :
- `Work_package_number` = 12 ;
- `Work_package_status` = ouvert ;
- `Work_package_opening_date` = 2026-10-11 ;
- `Work_package_overlaps` et `Work_package_summary` sont inchangés ;
- les mêmes trois `_ASK`, aux mêmes empreintes ;
- `_INST` = Lot ;
- `_MDAT` passe de 2026-10-11 10:55:51 à 2026-10-12 16:01:22.

La page ne porte aucun `_ERRC`.

**7) Erreurs, avertissements, liens.** Conforme.
- **Classes d'erreur.** Le rendu n'en contient aucune. Les motifs cherchés
  étaient `error`, `warning`, `smw-highlighter`, `smwttinline` et
  `smw-callout`.
- **Avertissements.** `bin/wiki-warnings.sh` répond « Aucun avertissement »
  pour les deux pages.
- **Catégories.** Lot seulement : aucune catégorie de suivi n'est apparue.
- **Liens** (`prop=links`). Douze, tous vers des pages existantes : les neuf
  d'avant, plus les trois ajoutés, `Administration SGDT`,
  `Modèle:Lieu par contenance` et `Catégorie:Lieu`. Aucun lien ne vise une
  page inexistante, connue ou non.

**8) Vérification ajoutée par Cyril : « incréments de dix » et « increments of
ten ».** Conforme.
- **Wikitexte en ligne des deux pages.** Zéro occurrence de chaque formule.
- **Rendu de la page du lot.** Zéro.
- **Recherche plein texte sur tout le wiki** (`list=search`, tous espaces de
  noms) :
  - « "incréments de dix" » : 0 résultat ;
  - « "increments of ten" » : 0 ;
  - « incréments » seul : 0.

  Avant l'écriture, les mêmes requêtes trouvaient respectivement 2 pages
  (`Attribut:Storage rank` et la page du lot), 1 page
  (`Attribut:Storage rank`) et 2 pages. La mesure détectait donc bien la
  présence, et l'index a suivi les deux écritures.

## Étape 9 — Fin de tâche

`.claude/settings.local.json`, relevé à la fin de la tâche : 59 octets, aucune
règle, contenu identique à celui du début.

```
{
  "permissions": {
    "allow": [],
    "deny": []
  }
}
```

`git status --short --branch` avant le commit : `## main...origin/main`, plus
deux fichiers non suivis. Le premier est
`travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md`, qui
ne compte pas. Le second est ce rapport.

## Écarts et surprises

- **La consigne faisait écrire une phrase déjà mesurée fausse.** La puce 3.5
  attribuait à `Planting_rank` des « incréments de dix ». La tâche 6 l'avait
  mesuré faux et l'avait signalé en question A, laissée sans réponse. Corrigé
  avant écriture sur la réponse de Cyril : la puce de la page du lot, la
  description française d'`Attribut:Storage rank` et, sur une seconde
  réponse, sa description anglaise. **La question A de la tâche 6 est close
  par cette correction.**
- **La vérification 4 attendait douze puces.** Elle en trouve seize. La section
  en portait treize avant écriture. Cyril a confirmé une erreur de compte de
  l'architecte, et la vérification a été faite sur seize.
- **La consigne annonçait une seule page modifiée.** Deux l'ont été : la
  seconde, `Attribut:Storage rank`, sur l'amendement de Cyril.
- **Deux des quatre points ouverts de l'ouverture sont fermés par les faits,
  mais leur arbitrage n'est écrit nulle part sur la page.** La consigne les dit
  tous tranchés. Deux ont désormais leur arbitrage sur la page : le nom et la
  description du rang (puce 3.5), et la propriété unique de date d'étiquette
  (puce 3.6). Les deux autres n'en ont pas :
  - **Le vocabulaire des états et sa forme grammaticale.** Les six valeurs
    sont en place sur `Attribut:Service status` et dans la liste déroulante du
    formulaire physique : en service, en réserve, prêté, en panne, rebuté,
    perdu. La puce 4.3 ne consigne que le nom de la propriété. Le point
    d'ouverture renvoyait à `Procurement_route`, « où les participes passés
    l'ont emporté ». La liste retenue mêle trois participes (prêté, rebuté,
    perdu) et trois locutions (en service, en réserve, en panne), et aucune
    puce n'en donne le motif.
  - **La branche de la fonction de rangement.** `Ranger des objets` (002Z),
    créée à la tâche 3, porte `Part_of` = Stocker des ressources (mesuré
    aujourd'hui). Aucune puce ne le dit, ni pourquoi.

  Voir la question A.
- **« cédé » reste sans valeur, et la question a quitté la page.** C'est la
  question B de la tâche 6. La puce « Un objet qui n'existe plus garde sa page
  et sa référence », qui n'a pas été touchée, dit toujours « Détruit, perdu ou
  cédé, il change d'état ». `Service_status` n'a aucune valeur pour un objet
  donné ou vendu : ses six valeurs sont les mêmes sur la propriété et dans le
  formulaire. Les cinq nouveaux points ouverts ne mentionnent pas ce manque.
  Voir la question B.
- **« Risques connus » garde une prescription que `CLAUDE.md` a retirée.** La
  puce sur le verrou intermittent dit encore : « chaque page de propriété
  complète à sa première écriture, jamais en deux fois ». `CLAUDE.md` déclare
  fausses et retirées les rédactions qui prescrivaient d'écrire une page de
  propriété une seule fois dans sa forme définitive. Je n'y ai pas touché.
- **Des chiffres datés dans des puces laissées telles quelles.** Ils donnaient
  le motif au moment de la décision, et je ne les ai pas modifiés :
  - « 48 items physiques, 48 avec <code>Instance_of</code> » : on en mesure
    aujourd'hui 50 sur 50. L'invariant tient toujours ;
  - « 685 caractères » pour `Catégorie:Physical item`, avant que la tâche 5 y
    ajoute la règle de contenance ;
  - « 51 pages, dont 49 » au « Point de départ ».
- **Guillemets droits.** Le cinquième point ouvert porte « "Non défini" »
  entre guillemets droits, recopiés tels que la consigne les donnait. Aucun
  autre guillemet ne figure sur la page.
- **`bin/wiki-wait-jobs.sh` a de nouveau annoncé une file figée** : 5 travaux,
  puis une file vide au premier essai après cinq minutes. Cela confirme la
  leçon déjà écrite dans `CLAUDE.md`. Rien de nouveau.

## Questions

**A.** Deux des quatre points ouverts de l'ouverture sont fermés par les
faits, sans que leur arbitrage figure sur la page du lot :
- le vocabulaire des six états de service et sa forme grammaticale, qui mêle
  participes et locutions ;
- la branche de la fonction de rangement, `Ranger des objets` (002Z), placée
  sous Stocker des ressources.

La procédure de clôture veut chaque arbitrage dans « Ce qui est déjà
tranché », avec son motif. Faut-il ajouter ces deux puces dans une prochaine
étape de la clôture ? Suggestion : oui, avec le motif tiré de la conversation
du lot, que je n'ai pas. Le fait lui-même se recopie de l'état mesuré
ci-dessus.

**B.** `Service_status` n'a pas de valeur pour un objet donné ou vendu. La puce
« Un objet qui n'existe plus garde sa page et sa référence » dit pourtant
« Détruit, perdu ou cédé, il change d'état ». C'est la question B de la
tâche 6, jamais tranchée. Elle ne figure plus dans les points ouverts. Faut-il
ajouter « cédé » aux valeurs autorisées, ou inscrire la question comme sixième
point ouvert ? Suggestion : ajouter « cédé » en deux écritures, la page de
propriété puis la liste déroulante de `Formulaire:Physical item`. La valeur se
vérifierait ensuite par un rendu sans écriture, comme l'essai négatif de la
tâche 8 : aucun objet n'est cédé aujourd'hui, et `_PVAL` peut être en retard.
Si la décision est remise à plus tard, l'inscrire comme point ouvert, pour
qu'elle ne quitte pas la page à la clôture.
