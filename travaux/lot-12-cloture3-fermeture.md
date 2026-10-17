# Lot 12 — Clôture 3 sur 3 : fermeture du lot

Date : 12 octobre 2026. Consigne de l'architecte, relayée par Cyril. Les huit
lignes du périmètre sont couvertes, et le lot est clos. Une seule page a été
modifiée : `Lot 12 — Contenants et étiquetage`, de la révision 1542 à la 1549.
Avant l'écriture, Cyril a amendé l'étape 5 sur un point : la consigne ne
nommait qu'une date, alors que le modèle Lot en porte deux et que les lots
déjà clos renseignent les deux.

## 1. Départ : dépôt, règles locales et lectures

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

Lectures :
- **`CLAUDE.md`** : dernier commit `6651236` du 10 octobre 2026, inchangé.
- **`Procédure de clôture d'un lot`** : révision 1479, identique octet pour
  octet à la copie lue à la clôture 1. Son étape 4 demande de vérifier les
  points sur le wiki, pas dans les rapports. Son étape 5 dit de renseigner la
  date de clôture, de passer l'état à clos, et de vérifier que
  `Gestion des lots` a suivi, en la purgeant sinon.
- **`Lot 12 — Contenants et étiquetage`** : révision 1542, celle écrite à la
  clôture 1, identique au fichier envoyé alors.
- **`Modèle:Lot`**, lu pour l'étape 5. Son `#set` porte deux dates
  distinctes :
  - `Work_package_delivery_date`, affichée « Livré le » ;
  - `Work_package_closure_date`, affichée « Clos le ».

## 2. Les huit lignes du périmètre, vérifiées sur le wiki

Pour les types, une requête `action=ask` sur les exemplaires qui portent
`Contained_in` rend les types résolus à l'exécution, dans
`query.printrequests[].typeid` :
- `Contained in` → `_wpg` ;
- `Storage rank` → `_num` ;
- `Label date` → `_dat` ;
- `Service status` → `_txt` ;
- `Located at` → `_wpg` et `Instance of` → `_wpg`, qui servent de témoins.

Chaque type résolu est conforme au `_TYPE` de la page de propriété.

Les fiches relues ont été purgées avant lecture : le fer à souder,
`Administration SGDT` et Pile 1.

**a) La relation de contenance : couverte.**
- **`Attribut:Contained in`** (révision 1499). Faits : `_TYPE` = `_wpg`,
  `Property_cardinality` = single, `Property_domain` = Physical item,
  `Property_range` = « item physique ». Type résolu : `_wpg`.
- **`Modèle:Physical item`** (révision 1530), ligne 11 du `#set` :
  `|Contained_in={{{physical_parent|}}}`.
- **Stockage réel.** `action=ask` sur `Contained_in::+` rend deux
  exemplaires :
  - Fer à souder — Atelier appartement (CWL-0009) → Sacoche à outils —
    Atelier appartement (CWL-000D) ;
  - la sacoche → Caisse en carton — Atelier appartement (CWL-000C).

**b) Les contenants comme items physiques : couverte.** La chaîne de la
caisse, lue fait par fait :
- **Caisse en carton — Atelier appartement (CWL-000C)** : `_INST` = Physical
  item, `Instance_of` = Caisse en carton 39 x 30 x 20 cm, `Located_at` = Pile 1,
  `Storage_rank` = 1 ;
- **Caisse en carton 39 x 30 x 20 cm** : `_INST` = Referenced item,
  `Item_ref` = 0033, `Corresponds_to_organic` = Caisse en carton ;
- **Caisse en carton** : `_INST` = Organic item, `Item_ref` = 0031,
  `Realizes_function` = Ranger des objets ;
- **Ranger des objets** : `_INST` = Functional item, `Item_ref` = 002Z,
  `Part_of` = Stocker des ressources.

Recoupé par une requête qui traverse la chaîne :
`[[Category:Physical item]][[Instance_of.Corresponds_to_organic.Realizes_function::Ranger des objets]]`
rend deux exemplaires :
- la caisse, par Caisse en carton 39 x 30 x 20 cm ;
- la sacoche CWL-000D, par Sacoche à outils souple.

**c) La cascade de lieu et sa page de contrôle : couverte.**
- **`Modèle:Lieu par contenance`** (révision 1516) existe. Sa partie
  `includeonly` enchaîne trois `#show` : le lieu du contenant, celui du
  contenant du contenant, puis celui du troisième.
- **`Modèle:Physical item`**, ligne 40 : la cellule « Se trouve à » appelle
  `{{Lieu par contenance|{{{physical_parent|}}}}}` quand `Located_at` est vide.
- **Fiche du fer à souder** (révision 1537, purgée). La cellule « Se trouve à
  (Lieu) » rend `<a href="/wiki/Pile_1" title="Pile 1">Pile 1</a>`. Les faits
  de la fiche portent `Contained_in` = la sacoche et aucun `Located_at` : la
  fiche affiche donc Pile 1 sans porter de lieu.
- **`Administration SGDT`** (révision 1520). Le wikitexte porte la section
  « == Audit de la contenance == » et `{{Containment audit}}`. Le rendu purgé
  de cette section donne : « 50 exemplaires physiques, dont 45 portent un lieu
  et 2 un contenant. Il en reste 3 sans rattachement, dont le lieu n'est donc
  pas calculable. Exemplaires dépassant la profondeur admise, c'est-à-dire
  portant au moins quatre contenants emboîtés au-dessus d'eux : Aucun
  exemplaire ne dépasse trois contenants emboîtés. » Le rendu ne contient
  aucune classe d'erreur.

**d) Le rang : couverte.**
- **`Attribut:Storage rank`** (révision 1543) : `_TYPE` = `_num`, type résolu
  `_num`.
- **`Modèle:Physical item`** : stockage en ligne 12
  (`|Storage_rank={{{Storage_rank|}}}`), affichage en ligne 37.
- **Fiche de lieu.** `Modèle:Lieu` (révision 1539) porte
  `|?Storage_rank = Rang` à la ligne 76, dans « Présents ici », et à la
  ligne 94, dans « Rangés ici ». Rendu purgé de Pile 1 :
  - « Présents ici » a pour en-têtes Rang, Position (m), Planté le et État ;
    sa seule ligne est la caisse, avec le rang 1 ;
  - « Rangés ici » a pour en-têtes Dans et Rang. Ses deux lignes, le fer et
    la sacoche, ont la colonne Rang vide.
- **Porteurs.** `action=ask` sur `Storage_rank::+` rend une page : la caisse,
  avec la valeur 1.

**e) La date d'étiquette : couverte, au sens de la consigne.**
- **`Attribut:Label date`** (révision 1527) : `_TYPE` = `_dat`, type résolu
  `_dat`.
- **`Modèle:Physical item`**, ligne 17 : `|Label_date={{{Label_date|}}}`.
- **Porteurs.** `action=ask` sur `Label_date::+` rend 0 page. C'est déclaré
  comme point ouvert sur la page du lot, quatrième puce de « Points
  ouverts » : « La date d'étiquette n'a jamais reçu de valeur, donc son champ
  n'est pas éprouvé. »

**f) L'état de service : couverte.**
- **`Attribut:Service status`** (révision 1544) : `_TYPE` = `_txt`, type
  résolu `_txt`. `_PVAL` porte sept valeurs : en service, en réserve, prêté,
  en panne, rebuté, perdu, cédé.
- **`Modèle:Physical item`**, ligne 16 :
  `|Service_status={{{Service_status|}}}`.
- **Porteurs.** `action=ask` sur `Service_status::+` rend une page : le fer à
  souder, « en service ».

**g) Supplier multivalué : couverte.**
- **`Modèle:Referenced item`** (révision 1533). La ligne 14 porte
  `|Supplier={{{Supplier|}}}`, et la ligne 15, juste après, `|+sep=,`.
  L'affichage, ligne 66, passe par
  `{{#arraymap:{{{Supplier|}}}|,|@@@|[[@@@]]|,&#32;}}`.
- **`Attribut:Supplier`** (révision 1535) : `Property_cardinality` = multiple,
  `_TYPE` = `_wpg`.
- **Valeurs.** `action=ask` sur `Supplier::+` rend 34 porteurs, 34 valeurs et
  12 valeurs distinctes. Aucune valeur ne contient de virgule, et aucune n'a
  d'espace en tête ou en fin.

**h) La correction des deux pages de définition : couverte.**
- **`Catégorie:Physical item`** (révision 1521). La ligne 14 porte
  « == Lieu et contenance == », suivie de la règle :
  - `Located_at` ou `Contained_in`, jamais les deux ;
  - le lieu calculé par `Modèle:Lieu par contenance` ;
  - au plus trois contenants emboîtés ;
  - le contenant a droit à la chaîne complète ;
  - la pile est un lieu.
- **`Catégorie:Lieu`** (révision 1524). « physical_parent », en ignorant la
  casse, apparaît 0 fois dans le wikitexte et 0 fois dans le rendu.

**Bilan : les huit lignes sont couvertes. La clôture pouvait avoir lieu.**

## 3. Ce que le lot a écrit

**La fenêtre suffit.** La plus ancienne entrée de `list=recentchanges` date
du 25 juillet 2026 à 18:18:57 UTC. Elle couvre donc le cadrage du lot, le
30 août, et son ouverture, le 11 octobre. Le relevé a été fait par
`list=recentchanges` avec `rcprop=timestamp|comment|title|ids|user|loginfo`,
`rctype=edit|new|log` et `rclimit=max`. Il a été lu avant l'écriture de
fermeture : 1270 entrées, du 25 juillet 2026 à 2026-10-12 16:23:23 UTC. La
réponse ne portait aucun `continue` : la fenêtre entière tenait en une page,
et il n'y avait rien à suivre par `rccontinue`. J'ai filtré les résumés
contenant « [Lot 12] » hors ligne, sur le fichier enregistré.

**52 écritures portent l'étiquette du lot 12, sur 30 pages distinctes.**
- Deux viennent du cadrage du 30 août 2026 : la révision 1127, création de
  la page du lot, et la 1128, `Gestion des lots`.
- Les cinquante autres vont de l'ouverture, révision 1498 du 11 octobre à
  10:37:08, jusqu'à la révision 1547 du 12 octobre à 16:23:17. Les révisions
  1498 à 1547 du wiki sont toutes étiquetées « [Lot 12] », sans trou.
- Seize de ces écritures sont des créations de page.

Répartition par second crochet :

| Libellé | Écritures |
|---|---|
| Cadrage | 1 |
| Renvoi croisé | 1 |
| Ouverture | 1 |
| Tâche 1 | 1 |
| Tâche 2 | 5 |
| Tâche 3 | 11 |
| Tâche 4 | 3 |
| Tâche 5 | 4 |
| Correctif | 3 |
| Tâche 6 | 3 |
| Tâche 7 | 8 |
| Tâche 8 | 2 |
| Tâche 9 | 4 |
| Clôture | 5 |
| **Total** | **52** |

Pages touchées, avec le nombre d'écritures et une étoile pour une page créée
par le lot :

| Page | Écritures |
|---|---|
| Limites connues du Système de Gestion de Données Techniques | 5 |
| Modèle:Physical item | 5 |
| Lot 12 — Contenants et étiquetage * | 4 |
| Formulaire:Physical item | 3 |
| Modèle:Lieu | 3 |
| Attribut:Service status * | 2 |
| Attribut:Storage rank * | 2 |
| Caisse en carton — Atelier appartement (CWL-000C) * | 2 |
| Catégorie:Lieu | 2 |
| Fer à souder — Atelier appartement (CWL-0009) | 2 |
| Modèle:Containment audit * | 2 |
| Modèle:Referenced item | 2 |
| Administration SGDT | 1 |
| Attribut:Contained in * | 1 |
| Attribut:Label date * | 1 |
| Attribut:Part of | 1 |
| Attribut:Supplier | 1 |
| Caisse en carton * | 1 |
| Caisse en carton 39 x 30 x 20 cm * | 1 |
| Catégorie:Physical item | 1 |
| Entrée à droite * | 1 |
| Formulaire:Referenced item | 1 |
| Gestion des lots | 1 |
| Modèle:Lieu par contenance * | 1 |
| Notes en attente de rangement | 1 |
| Pile 1 * | 1 |
| Ranger des objets * | 1 |
| Sacoche à outils * | 1 |
| Sacoche à outils souple * | 1 |
| Sacoche à outils — Atelier appartement (CWL-000D) * | 1 |

**L'écriture de fermeture s'y ajoute.** Elle est postérieure au relevé : la
révision 1549, sur la page du lot, porte le total à 53 écritures, toujours
sur 30 pages.

**Pages écrites sans étiquette de lot.** Aucune depuis l'ouverture : toutes
les entrées postérieures au 11 octobre 2026 à 10:37:08 portent une étiquette
« [Lot ». Une seule porte celle d'un autre lot : la révision 1548, création
de `Lot 42 — État de conception des modèles`, écrite pendant la clôture 2 sous
`[Lot 42][Création]`, comme le voulait la consigne. Elle relève du travail
de clôture du lot 12, mais n'entre pas dans son décompte.

**Avant l'ouverture**, la page du lot avait reçu trois écritures sous
d'autres étiquettes, d'après son historique relu à la clôture 1. Ce ne sont
pas des écritures du lot 12 :
- 1209 : `[Lot 13][Tâche 3c]` ;
- 1236 : `[Correctif]`, sans numéro de lot, ce qui est la forme prévue hors
  de tout lot en cours ;
- 1361 : `[Lot 33][Tâche 3]`.

## 4. La page écrite

**Les dates, tranchées par Cyril avant l'écriture.** La consigne demandait
d'ajouter `Work_package_delivery_date=2026-10-12`, ou le nom de la date de
clôture s'il différait. Or `Modèle:Lot` porte deux dates :
- `Work_package_delivery_date`, « Livré le », reprise dans la colonne
  « Livré le » du tableau « Faits » de `Gestion des lots` ;
- `Work_package_closure_date`, « Clos le ».

Les six lots déjà clos portent les deux : 13, 22, 27, 28, 33 et 34, relevés
par `action=ask`. Pour les lots 27 et 33, elles tombent le même jour. Question
posée avant d'écrire. Réponse de Cyril : les deux dates, au 12 octobre 2026,
dans la même édition et dans cet ordre après la date d'ouverture, « comme pour
les lots 27 et 33 ». Il a aussi étendu deux vérifications :
- la vérification 1 contrôle les deux dates ;
- la vérification 2 contrôle aussi que le lot 12 apparaît avec sa date de
  livraison dans le tableau des lots faits.

**Écriture.** Session ouverte par `bin/wiki-login.sh` (« Success Cywil »).
Avant l'écriture, la page ne portait aucune protection native, et
`intestactions=edit` sous Cywil ne rendait aucune erreur. Les deux ancres
étaient présentes une fois chacune. Diff, de la révision 1542 à la 1549 :

```diff
3c3
< |Work_package_status=ouvert
---
> |Work_package_status=clos
5a6,7
> |Work_package_delivery_date=2026-10-12
> |Work_package_closure_date=2026-10-12
```

- **Résumé** : `[Lot 12][Clôture] lot clos, contenance, rang, état de service et date d'étiquette livrés`
- **Result** : `Success`, `oldrevid` 1542, `newrevid` 1549, `newtimestamp`
  2026-10-12T16:41:05Z.
- **Taille** : de 12291 à 12366 octets.
- **Relecture** : le wikitexte relu en ligne est identique octet pour octet
  au fichier envoyé (`cmp`).

## 5. Vérifications finales

**File et purge.** Au premier appel, `bin/wiki-wait-jobs.sh` a répondu
« FILE FIGEE a 3 travaux » après cinq essais. J'ai fait une pause de cinq
minutes en arrière-plan, puis le script relancé a répondu « essai 1 :
jobs=0 » et « FILE VIDE ». J'ai ensuite purgé la page du lot par
`bin/wiki-purge.sh` (`purged` et `linkupdate` à `True`). `Gestion des lots` a
d'abord été lue sans purge, voir la vérification 2.

**1) Faits de la page du lot.** Conforme, dans sa forme amendée.
- **Faits.** Après purge :
  - `Work_package_status` = clos ;
  - `Work_package_delivery_date` = 2026-10-12 ;
  - `Work_package_closure_date` = 2026-10-12 ;
  - `Work_package_opening_date` = 2026-10-11, inchangée ;
  - `Work_package_number` = 12.

  `Work_package_summary` et `Work_package_overlaps` sont inchangés, `_INST`
  vaut Lot et `_MDAT` 2026-10-12 16:41:05. Il n'y a pas de `_ERRC`.
- **Encadré.** Il affiche : « Numéro 12, État clos, Calendrier, Ouvert le
  2026-10-11, Livré le 2026-10-12, Clos le 2026-10-12 ».

**2) Gestion des lots.** Conforme après purge, dans sa forme amendée.
- **Lue sans purge**, la page n'avait pas suivi. Elle montrait 42 lots au
  total, 3 en cours, 16 faits, 23 à venir et 0 abandonné, avec le lot 12
  encore dans « En cours » et absent de « Faits ».
- **Après purge par `bin/wiki-purge.sh`** :
  - 42 au total, 2 en cours, 17 faits, 23 à venir, 0 abandonné. La somme des
    quatre états vaut 42, comme le total ;
  - le tableau « En cours » n'a plus que 2 lignes, sans le lot 12 ;
  - le tableau « Faits » a 17 lignes. Celle du lot 12 porte : « Lot 12 —
    Contenants et étiquetage | 12 | clos | Séparer contenir de composer, … |
    11 octobre 2026 | 12 octobre 2026 | (vide) ». Le lot y figure donc avec
    sa date de livraison, sous « Livré le » ;
  - aucune classe d'erreur.
- **La page n'a pas été modifiée** : elle est toujours à la révision 1240.

**3) Les points ouverts.** Conforme : la section « Points ouverts » compte
toujours 5 puces, dans le wikitexte en ligne comme dans le rendu purgé. Ce
sont, dans l'ordre :
1. Le découpage de plusieurs fournisseurs par la virgule… ;
2. Le champ Supplier du formulaire référencé… ;
3. La liste des valeurs d'état est écrite à deux endroits… ;
4. La date d'étiquette n'a jamais reçu de valeur… ;
5. Les douze pages de fournisseur sont des liens rouges….

Les autres sections ont aussi gardé leurs nombres de puces : 16, 12, 5, 5
et 3.

**4) Erreurs et avertissements.** Conforme.
- **Classes d'erreur.** Aucune, ni dans le rendu purgé de la page du lot ni
  dans celui de `Gestion des lots`.
- **Avertissements.** `bin/wiki-warnings.sh` répond « Aucun avertissement »
  pour les deux pages.
- **Page du lot.** 12 liens, tous existants ; catégorie Lot ; huit sections,
  inchangées.

## 6. Règles locales à la fin

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

## 7. Écarts et surprises

- **La consigne ne nommait qu'une date de fermeture, et c'est moi qui ai
  relevé la seconde.** Elle disait d'ajouter `Work_package_delivery_date`, ou
  le nom de la date de clôture s'il différait. Le modèle Lot porte les deux
  dates, livraison et clôture, et les six lots déjà clos portent les deux. Une
  application littérale aurait laissé l'une ou l'autre vide. J'ai posé la
  question avant d'écrire, et les deux dates ont été écrites sur la réponse de
  Cyril.
- **L'écriture de fermeture n'est pas dans le relevé de l'étape 4.** Le relevé
  a été lu avant elle, comme le veut l'ordre des étapes. Elle porte le total à
  53 écritures, sur 30 pages.
- **La question A de la clôture 1 n'a pas été traitée avant la fermeture.**
  Elle porte sur deux arbitrages non écrits : le vocabulaire des états de
  service et sa forme grammaticale, et la branche de la fonction de
  rangement. Ces deux arbitrages ne figurent toujours pas dans « Ce qui est
  déjà tranché ». La procédure de clôture veut chaque arbitrage sur la page du
  lot, avec son motif. Le lot est clos sans eux. Je n'y ai pas touché. Voir la
  question A.
- **La question A de la clôture 2 n'a pas été traitée non plus.** Elle porte
  sur la mesure du verrou levé en moins de deux minutes, qui n'est pas portée
  aux Limites connues. Cette mesure complète l'entrée 65, et nuance les délais
  que les entrées 14, 62 et 65 annoncent. Elle ne bloque pas la clôture, mais
  reste en suspens. Voir la question B.
- **`Gestion des lots` n'a suivi qu'après une purge**, comme à la clôture 2.
  C'est le comportement prévu par l'étape 5 de la procédure de clôture et
  décrit par l'entrée 47 des Limites.
- **`bin/wiki-wait-jobs.sh` a de nouveau annoncé une file figée**, à
  3 travaux, puis l'a trouvée vide au premier essai après la pause. Rien de
  nouveau par rapport à la leçon de `CLAUDE.md`.
- **Deux faux départs dans mes propres scripts de lecture, sans effet sur le
  wiki.** Je les ai corrigés et relancés.
  - Le premier découpage des points ouverts cherchait l'ancre
    « Ce_qui_est_ », qui tombe d'abord sur « déjà tranché ». Il comptait 0 ;
    borné au titre suivant, il compte 5.
  - Le premier relevé de `Gestion des lots` cherchait le titre du lot 12 dans
    toute la ligne. Il prenait pour des lignes du lot 12 celles des lots 16,
    39 et 40, dont la colonne « Dépend de » le cite. Le relevé teste
    désormais la première cellule seule.
- **Trois lots attendaient le lot 12.** Le tableau « À venir » montre que les
  lots 16, 39 et 40 dépendent de lui (« Dépend de » : Lot 12). Ils dépendent
  donc désormais d'un lot clos. Je n'ai rien écrit à ce sujet.

## Questions

**A.** Reprise de la question A de la clôture 1. Deux arbitrages du lot sont
appliqués sur le wiki sans figurer dans « Ce qui est déjà tranché » :
- le vocabulaire des sept états de service et sa forme grammaticale ;
- le rangement de `Ranger des objets` (002Z) sous Stocker des ressources.

Le lot est désormais clos sans eux, alors qu'un lot clos est censé avoir tout
consigné. Faut-il les ajouter à la page du lot malgré la clôture ?
Suggestion : oui, deux puces avec leur motif, tiré de la conversation du lot,
en une écriture `[Lot 12][Complément]`. L'étiquette du lot garde ainsi
l'écriture dans son décompte.

**B.** Reprise de la question A de la clôture 2. L'ajout de « cédé » a
verrouillé `Attribut:Service status` pendant moins de deux minutes, alors que
les entrées 14, 62 et 65 des Limites annoncent une levée en jours. Faut-il
consigner cette mesure ? Suggestion : oui, en une entrée nouvelle à la suite,
par `bin/wiki-append.sh`, qui renvoie à ces trois entrées.
