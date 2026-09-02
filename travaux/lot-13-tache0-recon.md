# Lot 13 — Tâche 0 : reconnaissance (aucune écriture)

**Exécuté le :** 1ᵉʳ septembre 2026, session Claude Code, compte `Cywil`.
Lecture seule stricte : aucune écriture sur le wiki, aucune écriture dans le
dépôt en dehors de ce fichier. Chaque affirmation ci-dessous porte la mesure
qui l'établit.

---

## A — Recensement complet des lots

### Sources balayées

- wiki, `action=query&list=allpages&apprefix=Lot&apnamespace=0&apfilterredir=all` → 9 pages exactement : `Lot 12 — Contenants et étiquetage` et huit pages `Lot — …` sans numéro.
- wiki, `Gestion des lots` (dernière révision lue ce jour).
- wiki, `Feuille de route du Système de Gestion de Données Techniques`.
- wiki, section « Dépendances » des huit pages `Lot — …` (récupérées individuellement par `wiki-get.sh`) et de `Lot 12`.
- wiki, `Lot 12 — Contenants et étiquetage`, section « Ce qui reste à trancher ».
- dépôt, `ls travaux/` (134 fichiers) + `head -1` de chacun (titres de niveau 1).
- dépôt, `demandes-adminsys.md` §2.1 à 2.4.
- dépôt, `travaux/lot-10-tache7-cloture.md` §4.
- dépôt, `travaux/lots-a-venir-pages-courtes.md`.

### Liste unique

**Famille 1 — lots déjà exécutés (10)**

| Lot | Objet bref | État | Source |
|---|---|---|---|
| 1 | Corrections de schéma : `Serial_number`, `+sep=,` sur `Part_of`. | livré, 25/07/2026 | `Gestion des lots` #1 ; `ecolibre-sgdt-lot1.md` |
| 2 | Vocabulaires et intégrité des classes. | livré, 25/07/2026 | `Gestion des lots` #2 ; `ecolibre-sgdt-lot2.md` |
| 3 | Classes + schéma des propriétés. | livré, 26/07/2026 | `Gestion des lots` #3 ; `ecolibre-sgdt-lot3.md` |
| 4 | Numérotation d'inventaire des items physiques. | livré, 26/07/2026 | `Gestion des lots` #4 ; `ecolibre-sgdt-lot4-rev2.md` |
| 5 | Registre, fonctions multiples, corrections. | livré, 28/07/2026 | `Gestion des lots` #5 ; `ecolibre-sgdt-lot5.md` |
| 6 | Durcissement `Module:Base36`, bascule `Item_ref`, refonte des modèles. | livré (exécuté 9-10/08/2026 mesuré — voir §B, écart avec le « 9-12 août » affiché) | `Gestion des lots` #6 ; `lot-6-consolide.md`, `lot-6-suite.md` |
| 7 | Nomenclature quantifiée et entité réception. | **cadré, jamais exécuté** — sans document de cadrage propre ; fragment repris (`Procurement_route`) au lot 10 | `Gestion des lots` #7 ; `sgdt-passation-2026-08-10.md` §4 |
| 8 | Facettes de type d'item. | livré, 11-12/08/2026 | `Gestion des lots` #8 ; `lot-8-cadrage-facettes.md` |
| 9 | Exemplaires plantés du jardin-forêt. | livré, clos 16/08/2026 | `Gestion des lots` #9 ; `lot-9-cloture.md` |
| 10 | Référentiel des procédés, cinq outils. | clos 29/08/2026 (rectification le jour même) | `Gestion des lots` #10 ; `lot-10-tache7-cloture.md` |
| 11 | Subdivision des lieux. | livré, clos 27/08/2026 | `Gestion des lots` #11 ; `lot-11-cloture.md` |

**Famille 2 — lots ayant une page mais non exécutés (9)**

| Lot | Objet bref | État (tel qu'affiché sur la page) | Dépend de |
|---|---|---|---|
| Lot 12 — Contenants et étiquetage | Séparer contenir/composer, inventorier les contenants, dater l'étiquetage. | cadré — « À créer », cadrage rédigé 30/08/2026 | Rien en amont ; `Module:Base36` (correctifs) et arbre fonctionnel en aval |
| Lot — Navigation | Voisinage d'un item accessible sans changer de page. | identifié — « À cadrer » | Aucune |
| Lot — Images | Choisir l'image principale à tous les niveaux. | identifié — « À cadrer » | InstantCommons (utile, non requis) |
| Lot — Corrections du module de références | Doublons Base36, retiré/jamais utilisé. | identifié — « À cadrer » | Lot 12 (état de cycle de vie, date d'étiquette) |
| Lot — Arbre fonctionnel | Rattacher les fonctions à une racine, plusieurs troncs. | identifié — « À cadrer » | Aucune en amont ; le lot 12 en a besoin |
| Lot — Arborescence des domaines de pratique | Hiérarchiser `Practice_domain`. | identifié — « À cadrer » | Recoupe le lot Vocabulaire |
| Lot — Vocabulaire et multilingue | Type Page vs Text pour les vocabulaires ouverts. | identifié — « À cadrer » | **Chantier « grandeurs et unités »** (aucune page — voir ci-dessous) |
| Lot — External Data | Lire des sources externes (Wikidata). | identifié — « À cadrer » | **« Miroir local »** (aucune page — voir ci-dessous) |
| Lot — Gestion des lots en classe sémantique | Transformer les pages de lot en classe interrogeable — **c'est le présent lot 13** | identifié — « À cadrer » | Gagne à attendre 2-3 lots vécus en forme courte |

Cohérence numérique : 12 lots numérotés (1 à 12, dont le 7 sans page et le 12
avec page) + 8 pages `Lot — …` sans numéro = le numéro 13 est bien le premier
libre. Le lot ouvert par cette tâche 0 (« Gestion des lots en classe
sémantique ») correspond exactement à la 9ᵉ ligne du tableau ci-dessus.

**Famille 3 — chantiers identifiés sans aucune page**

| Chantier | Cité dans | Mesure d'absence |
|---|---|---|
| Lot 7 (nomenclature quantifiée) | `Gestion des lots` #7, `sgdt-passation-2026-08-10.md` §4 | Aucune page `Lot 7` : absente de `list=allpages&apprefix=Lot` ; aucun fichier `travaux/` ne matche `lot-?7[^0-9]` (`grep` → exit 1, aucune correspondance, cf. §F.2) |
| Chantier « grandeurs et unités » | Dépendances de `Lot — Vocabulaire et multilingue` et périmètre « Dehors » de `Lot 12` | `action=query&list=allpages&apnamespace=0&apfrom=Grandeurs` : premier résultat retourné est « Groseillier », aucune page commençant par « Grandeurs » |
| « Miroir local » | Dépendances de `Lot — External Data` | `action=query&list=allpages&apnamespace=0&apfrom=Miroir` : premier résultat retourné est « Miscanthus », aucune page commençant par « Miroir » (le terme désigne un environnement de test, mentionné aussi dans `ecolibre-sgdt-lot1.md` et `ecolibre-sgdt-lot2.md`, jamais comme page wiki) |

`demandes-adminsys.md` §2.1-2.4 ne cite aucun chantier supplémentaire de ce
type : ses entrées (SVG, Page Exchange, migration Scaleway, wiki de l'Atelier
du Dôme, financement, sauvegarde, rotation de mot de passe) sont des demandes
d'infrastructure à fuzzy, catégoriellement distinctes des lots du modèle de
données — aucune n'est citée en dépendance d'un lot recensé ci-dessus.

Le balayage des 134 fichiers de `travaux/` (titres de niveau 1, `head -1`)
ne fait apparaître aucun numéro de lot au-delà de 1-12 : confirmation
indépendante qu'aucun lot n'est resté hors du tableau ci-dessus.

---

## B — Dates d'ouverture et de clôture

**Mesure :** script Python paginant `action=query&list=recentchanges` par
tranches de 500 (`rcdir=newer`, `rccontinue`), jusqu'à épuisement complet —
voir `/tmp/.../scratchpad/recentchanges.py`. Total : **887 entrées**
(new: 287, edit: 495, log: 105), de `2026-07-25T18:18:57Z` (la plus
ancienne atteinte) à `2026-09-01T21:20:57Z` (la plus récente, une édition du
jour non liée à cette session).

**Date la plus ancienne atteinte par l'API : `2026-07-25T18:18:57Z`.** Elle
borne la rétention de `list=recentchanges`. La page `Accueil` (pageid 1) a
pourtant été créée le `2026-03-23` (`prop=revisions&rvdir=newer` sur
pageid=1) : le wiki existe depuis bien avant cette borne. La fenêtre de
`recentchanges` est donc plus courte que l'historique réel du wiki — à ne
jamais confondre les deux quand on cherche « la première fois que X a été
fait ».

Sur les 887 entrées, 622 portent un résumé contenant `[Lot N]`. Par lot,
première et dernière date, nombre d'éditions taguées :

| Lot | n | Première | Dernière |
|---|---|---|---|
| 1 | 2 | 2026-07-25T18:50:20Z | 2026-07-25T18:52:09Z |
| 2 | 3 | 2026-07-25T20:08:45Z | 2026-07-25T20:08:46Z |
| 3 | 15 | 2026-07-26T11:20:35Z | 2026-07-26T11:24:18Z |
| 4 | 9 | 2026-07-26T16:25:09Z | 2026-07-26T18:29:05Z |
| 5 | 12 | 2026-07-27T22:39:42Z | 2026-07-27T23:45:16Z |
| 6 | 38 | 2026-08-09T21:15:29Z | 2026-08-10T15:27:55Z |
| 8 | 64 | 2026-08-11T13:25:33Z | 2026-08-12T10:01:26Z |
| 9 | 331 | 2026-08-12T16:30:18Z | 2026-08-16T21:38:12Z |
| 10 | 80 | 2026-08-12T12:34:05Z | 2026-08-31T20:59:15Z |
| 11 | 66 | 2026-08-21T10:18:33Z | 2026-08-26T22:20:07Z |
| 12 | 2 | 2026-08-30T20:07:01Z | 2026-08-30T20:07:17Z |

**Lot 7 : absent, comme attendu.** Zéro entrée `[Lot 7]` dans les 622 —
cohérent avec « cadré, jamais exécuté » (famille 3 ci-dessus). Aucune autre
conclusion tirée de cette absence.

### Anomalie signalée dans la consigne — lot 10, trois éditions du 12 août

**Vérifiée et expliquée, à la source.** Les trois éditions en question
(`Feuille de route`, `Registre des facettes`, `Récapitulatif technique`,
12/08/2026 12:34-12:35, résumés `[Lot 10][Tâche 1]`, `[Lot 10][Tâche 2]`,
`[Lot 10][Tâche 3]`) ne sont **pas** du lot 10. `travaux/rapport-2026-08-12.md`,
section « Session — correctif liens `[[ ]]` coupés par un retour à la
ligne », l'indique explicitement dans un encart :

> **Étiquetage erroné à noter :** les trois résumés d'édition ci-dessous
> portent `[Lot 10]`. Ce n'était pas un lot : c'est un correctif hors lot,
> et le lot 9 (plantes) n'avait pas encore commencé au moment de
> l'écriture. Cyril a demandé de laisser ces résumés déjà écrits tels
> quels (non rattrapables) et a fait ajouter à `CLAUDE.md` la convention
> `[Correctif]` pour toute écriture future ne relevant pas d'un lot en
> cours.

C'est l'origine directe de la règle `CLAUDE.md` : « Une écriture qui ne
relève d'aucun lot en cours porte `[Correctif] <action>`, jamais un numéro
de lot. » Le vrai début d'exécution du lot 10 (cadrage + tâche 0) est le
**17 août 2026** (`lot-10-cadrage.md` : « Date de rédaction : 17 août
2026 » ; `lot-10-tache0-rapport.md` : « Exécuté le : 17 août 2026 ») ; les
premières éditions *réellement* liées au lot (`[Lot 10][Tâche 2]` sur
`Attribut:Practice domain` et les cinq procédés) datent du **17 août 2026
21h09-21h21**, visibles dans le tableau ci-dessus mêlées aux trois
éditions mal étiquetées du 12 août.

### Deuxième écart daté, non demandé par la consigne mais trouvé en vérifiant B

Le lot 6 est décrit comme « livré, exécuté du 9 au 12 août 2026 » à deux
endroits (`Gestion des lots` #6 et `lot-10-tache7-cloture.md` §Étape 1).
**Mesuré :** les 38 éditions `[Lot 6]` s'étendent du **9 août 21:15:29** au
**10 août 15:27:55** seulement — aucune le 11 ou le 12 août. Le rapport du
11 août (`rapport-2026-08-11.md`) est déjà titré « Lot 8 » dans son
en-tête. La borne « jusqu'au 12 août » de la description du lot 6 semble
donc en avance de deux jours sur ce que les résumés d'édition montrent.

---

## C — Points ouverts du lot 10 (section 4 de `lot-10-tache7-cloture.md`)

Huit points extraits, chacun revérifié aujourd'hui.

**1. Deux outils incomplets faute d'étiquettes (gros fer à souder,
boîtier de cycles charge/décharge).** — **Le texte du point est en partie
faux, mesuré aujourd'hui.** `list=allpages&apprefix=Fer à souder` retourne
trois pages : `Fer à souder` (organique, 002O), `Fer à souder Quicko
T12-942` (référencé, 002S), `Fer à souder — Atelier appartement
(CWL-0009)` (physique). La chaîne du fer à souder est **complète**, pas
incomplète : aucune deuxième page « fer à souder » distincte n'existe
(« gros » vs « petit ») pour justifier un second outil manquant. De même,
`browsebysubject` sur `Mini banc de mesure Ecolibre` montre
`Corresponds_to_organic -> Support de maintien de cellule` et `_INST ->
Referenced_item`, avec un exemplaire physique `CWL-000B` déjà connu du
rapport de tâche 5c : cette chaîne aussi est complète. **Seul `Boîtier de
cycles charge/décharge` (002Q) reste sans référencé ni physique**
(`list=allpages&apprefix=Boîtier de cycles` → une seule page). Le point
ouvert réel n'est donc **pas deux outils mais un seul** — voir
« Contradictions et surprises ».

**2. `Design_source` vide sur `Mini banc de mesure Ecolibre`.** — **OUVERT,
confirmé.** `browsebysubject` sur cette page (relevé complet, sans filtre)
ne retourne aucune clé `Design_source` parmi ses faits.

**3. Description de l'organisation `CWL` vide.** — **FERMÉ, contrairement
à l'attente de la consigne.** `browsebysubject` sur `CWL` (ns 0) :
`Organisation_description -> ['Activité pro Cyril']`, `_MDAT ->
1/2026/8/29/18/59/7/0`. Le champ a été rempli le 29 août 2026, la même
journée que la clôture du lot — après elle, ou dans une session
distincte non documentée dans `lot-10-tache7-cloture.md`.

**4. `Assembler` et `Maintenir en position` sans `Practice_domain`.** —
**OUVERT, confirmé.** `browsebysubject` sur les deux pages : aucune clé
`Practice_domain` dans les faits retournés, pour l'une comme pour l'autre.

**5. `Manufacturer`/`Materials_worked` accumulent des liens rouges
(SUNKKO, Quicko, GVDA, Acier nickelé).** — **OUVERT, confirmé.**
`action=query&titles=SUNKKO|Quicko|GVDA|Acier nickelé` : les quatre
retournent `"missing": true`.

**6. Deux pages de test à supprimer (`Modèle:Test lot10 ligne`,
`Utilisateur:Cywil/Bac à sable/Lot10 vue`).** — **FERMÉ, confirmé comme
attendu.** `action=query&titles=...` sur les deux titres : `"missing":
true` dans les deux cas. Supprimées (le compte bot ne pouvant pas
supprimer lui-même, la suppression a été faite par un compte sysop entre
la clôture et aujourd'hui).

**7. `Braser tendre` — faux négatif du modèle assumé, dit résolu par le
bloc 4.** — **Toujours résolu, revérifié.** Requête
`[[Realizes_function::Braser tendre]]|?-Corresponds_to_organic.-Instance_of` :
retourne bien les deux exemplaires physiques attendus, `Fer à souder —
Atelier appartement (CWL-0009)` et `Machine à souder par point — Atelier
appartement (CWL-0008)`.

**8. `Power_rating` non renseigné sur la SUNKKO.** — **FERMÉ, confirmé
comme attendu.** `browsebysubject` sur `Machine à souder par points SUNKKO
709AD` : `Power_rating -> ['3200']` (soit 3,2 kW, la valeur relevée sur
l'étiquette selon le rapport de tâche 4).

**Points réellement ouverts aujourd'hui : 2, 4, 5, et une version corrigée
du 1 (un seul outil incomplet — le boîtier de cycles — pas deux).** Les
points 3, 6, 7, 8 sont fermés.

---

## D — Criblage d'essai des formules à récupérer

Recherche des marqueurs sur `travaux/lot-10-*.md` uniquement (`grep -in`
pour chaque marqueur). Cinq marqueurs sans aucune occurrence : « à ne pas
oublier », « porte à ne pas fermer », « sans être un préalable », « à
revoir », « on verra ». Occurrences des sept autres, à arbitrer par Cyril :

| Marqueur | Fichier:ligne | Extrait |
|---|---|---|
| le jour où | `lot-10-tache3-proposition.md:153` | « Page sans qu'aucune page de fournisseur n'existe. Le jour où les matériaux… » |
| le jour où | `lot-10-tache3-proposition.md:179` | « …écriture le jour où une valeur manque. » |
| le jour où | `lot-10-tache1-proposition.md:33` | « …vide. Il s'insérera le jour où « Mesurer une longueur » ou « Contrôler une… » |
| plus tard | `lot-10-cadrage.md:207` | « énumération fermée — une valeur ajoutée plus tard exigerait une seconde… » |
| plus tard | `lot-10-tache4-rapport.md:35` | « titre à renommer plus tard (consigne explicite de la tâche). Cyril a… » |
| à trancher | `lot-10-tache1-proposition.md:59` | « Point à trancher — le nom. J'avais dit « Braser » tout court, au motif… » |
| à trancher | `lot-10-cadrage.md:111` | titre de section « 4. Ce qui reste ouvert, à trancher sur pièces » |
| à trancher | `lot-10-synthese-documentation.md:442` | « immédiatement après 3a. À trancher par Cyril — recommandation… » |
| à trancher | `lot-10-synthese-documentation.md:610` | « …pages ==`). À trancher. » |
| à trancher | `lot-10-synthese-documentation.md:891` | « renvoi ne vaut pleinement que pour le SVG. À trancher : renvoi général,… » |
| à trancher | `lot-10-tache2-rapport.md:173` | « À trancher : Assembler doit-il porter [[Catégorie:Procédé]] ? Si la… » |
| à trancher | `lot-10-tache2-rapport.md:257` | « …à trancher. Une écriture d'une ligne dans un sens comme dans l'autre. » |
| à trancher | `lot-10-tache5c-outils.md:22` | « Point à trancher en clôture de lot : la page fonction « Maintenir en… » |
| à trancher | `lot-10-tache5c-outils.md:314` | « …même file vidée. Limite du modèle à trancher hors de ce bloc. » |
| à trancher | `lot-10-tache7-cloture.md:292` | « …propre (`lot-10-tache5c`, « Point à trancher en clôture de lot »). » |
| non tranché | `lot-10-synthese-documentation.md:683` | « Question non tranchée : un fabricant est-il un nœud du système… » |
| non tranché | `lot-10-tache7-cloture.md:299` | « Question non tranchée : un fabricant est-il un… » |
| reste ouvert | `lot-10-tache0-rapport.md:246` | titre « 4. Ce qui reste ouvert pour la suite du lot » |
| reste ouvert | `lot-10-tache4-rapport.md:200` | « …zéro pour ce niveau ; reste ouverte la question d'une vue agrégée… » |
| reste ouvert | `lot-10-cadrage.md:111` | (même ligne que « à trancher » ci-dessus) |
| reste ouvert | `lot-10-cadrage.md:197` | « Rapport : ce qui a été fait, ce qui a échoué, ce qui reste ouvert… » |
| reste ouvert | `lot-10-tache2-rapport.md:254` | titre « 5. Ce qui reste ouvert » |
| reste ouvert | `lot-10-tache7-cloture.md:275` | titre « 4. Ce qui reste ouvert dans le périmètre du lot » |
| reste ouvert | `lot-10-tache7-cloture.md:466` | « …fait »), ni au §4 (« ce qui reste ouvert »). » |
| pour l'instant | `lot-10-tache1-proposition.md:93` | « Observation, sans conséquence pour l'instant. Le boîtier est le seul outil… » |
| pour l'instant | `lot-10-synthese-documentation.md:274` | « …pour l'instant ». Materials_worked : type _wpg (Page), multiple… » |

Deux occurrences méritent l'attention de Cyril en priorité, parce
qu'elles anticipent explicitement une décision non prise : le nom
« Braser » (tache1-proposition:59) et le statut de `Assembler` comme
porteur ou non de `[[Catégorie:Procédé]]` (tache2-rapport:173) — cette
dernière question recoupe directement le point C.4 ci-dessus
(`Practice_domain` manquant sur `Assembler`).

---

## E — Divergences d'objet bref

Comparaison hero (phrase-chapeau en gras) / section « Objet » / entrée
`Gestion des lots`, longueur en caractères, pour les 9 pages `Lot*` de
l'espace principal (les 8 sans numéro + Lot 12) :

| Page | hero (car.) | Objet (car.) | Gestion des lots (car.) | Divergence |
|---|---|---|---|---|
| Lot — Navigation | 119 | 122 | 889 | **hero ≠ Objet** (formulation différente, pas seulement la longueur) |
| Lot — Images | 134 | 134 | 546 | identiques |
| Lot — Corrections du module de références | 138 | 138 | 166 | identiques |
| Lot — Arbre fonctionnel | 84 | 84 | 200 | identiques |
| Lot — Arborescence des domaines de pratique | 99 | 99 | 80 | identiques |
| Lot — Vocabulaire et multilingue | 113 | 113 | 314 | identiques |
| Lot — External Data | 57 | 276 | 125 | Objet contient un paragraphe « Attention de conception » en plus du hero |
| Lot — Gestion des lots en classe sémantique | 136 | 136 | 157 | identiques |
| Lot 12 — Contenants et étiquetage | 150 | 480 | 322 | **hero ≠ Objet** (le hero résume, l'Objet développe en trois phrases) |

Sur les huit pages courtes, six ont un hero strictement identique à leur
section Objet (conforme à la structure décrite dans
`lots-a-venir-pages-courtes.md` : « une phrase-chapeau en gras… » puis
« Objet »). Deux exceptions : Navigation (texte reformulé, pas recopié) et
External Data (l'Objet ajoute un paragraphe que le hero omet). Lot 12,
rédigé selon un patron différent (forme longue), diverge par construction.
Dans tous les cas, la colonne `Gestion des lots` est une troisième
formulation, plus longue et orientée vers l'état d'avancement plutôt que
vers l'objet — attendu, puisque cette page décrit « ce qui est déjà
tranché » plutôt que l'objet du lot.

---

## F — Contre-vérification du cadrage

| # | Affirmation | Verdict | Mesure |
|---|---|---|---|
| 1 | Huit pages `Lot — ` + une page `Lot 12 — ` | **CONFIRMÉE** | `list=allpages&apprefix=Lot&apnamespace=0` → exactement 9 résultats : 8 sans numéro + `Lot 12 — Contenants et étiquetage` |
| 2 | Lots 1-5 ont chacun ≥1 rapport nommé par leur numéro ; lot 7 aucun | **CONFIRMÉE** | `ls travaux/` filtré par `lot-?N[^0-9]` : lot1→`ecolibre-sgdt-lot1.md`, lot2→`…lot2.md`, lot3→`…lot3.md`, lot4→`…lot4-phase3.md`/`…lot4-rev2.md`, lot5→`…lot5.md` ; motif `lot-?7[^0-9]` → 0 résultat (grep exit 1) |
| 3 | `Edible parts`/`Plant habit`/`Root system` créées le 11/08/2026, résumé « Lot 8 » et non « Lot 7 » | **CONFIRMÉE** | `prop=revisions&rvdir=newer&rvlimit=1` sur chacune : les trois timestamps sont `2026-08-11T14:4x`, résumés `[Lot 8][Tâche 4][Bloc …] Création propriété …` |
| 4 | 7/9 objets brefs > 85 caractères, 8/9 avec virgule | **CONFIRMÉE, exactement** | Sur les 9 hero de la section E : longueurs {119,134,138,84,99,113,57,136,150} → 7 dépassent 85 (tout sauf Arbre fonctionnel 84 et External Data 57) ; virgule présente dans 8/9 (absente seulement du hero de Vocabulaire et multilingue) |
| 5 | `Procurement_route` : seulement « acheté »/« autoproduit » | **CONFIRMÉE** | `action=ask&query=[[Procurement_route::+]]|?Procurement_route|limit=500` → 4 pages, valeurs distinctes `{acheté, autoproduit}` |
| 6 | `Specimen_status` : seulement « en place »/« repris »/« en réserve »/« mort » | **CONFIRMÉE** | même méthode, 40 pages, valeurs distinctes `{en place, repris, en réserve, mort}` |
| 7 | `Limites connues du SGDT` : 42 entrées, section unique ; entrée 26 = redirections porteuses de données, entrée 11 = trou 000J | **CONFIRMÉE, exactement** | `grep -c "^# "` → 42 ; une seule ligne `==` dans la page ; entrées numérotées dans l'ordre du wikitexte : 11ᵉ = « `000J` est un trou définitif… », 26ᵉ = « Une redirection est porteuse de données SMW… » |
| 8 | `Attribut:Object description` n'existe pas, propriété portée par aucune page | **CONFIRMÉE** | `action=query&titles=Attribut:Object description` → `missing: true` ; `action=ask&query=[[Object_description::+]]` → `count: 0` |
| 9 | Espace `Ecolibre` (ns 4) ne contient aucune page | **CONFIRMÉE** | `action=query&list=allpages&apnamespace=4` → `allpages: []` |

**Les neuf affirmations du cadrage sont confirmées, sans exception.**

---

## Contradictions et surprises

1. **Le point 1 de la section 4 de `lot-10-tache7-cloture.md` est faux sur
   un de ses deux items.** Il annonce deux outils incomplets (gros fer à
   souder + boîtier de cycles) ; la mesure d'aujourd'hui n'en trouve
   qu'un seul (`Boîtier de cycles charge/décharge`) — le fer à souder a
   sa chaîne complète (organique → référencé → physique), et le document
   lui-même l'appelle ailleurs (§7, tableau des critères) « petit fer »
   parmi les « 4 chaînes » complètes, en contradiction interne avec son
   propre §4. Voir section C, point 1.

2. **Le point 3 de la même section (description de `CWL` vide) est
   fermé aujourd'hui, sans qu'aucun rapport ne le documente.** Le champ
   porte « Activité pro Cyril » depuis le 29 août 2026 — soit le jour
   même de la clôture, soit une correction non rapportée depuis. Voir
   section C, point 3.

3. **Le lot 6 est daté « exécuté du 9 au 12 août 2026 » à deux endroits
   (`Gestion des lots`, `lot-10-tache7-cloture.md`), mais les 38
   éditions taguées `[Lot 6]` s'arrêtent le 10 août à 15h27** — deux
   jours avant la borne affichée. Le rapport du 11 août porte déjà
   l'en-tête « Lot 8 ». Écart non expliqué par les documents lus, à
   signaler sans trancher la cause.

4. **L'anomalie du lot 10 du 12 août, présentée dans la consigne de cette
   tâche comme « à vérifier et expliquer », est en réalité déjà
   documentée dans le dépôt lui-même** (`rapport-2026-08-12.md`,
   encart « Étiquetage erroné à noter ») et a directement produit la
   règle `[Correctif]` de `CLAUDE.md`. Ce n'est pas une découverte de
   cette reconnaissance, mais une confirmation d'un fait déjà consigné.

5. **Deux « chantiers » sont cités deux fois chacun en dépendance de lots
   distincts sans jamais avoir leur propre page** : « grandeurs et
   unités » (cité par `Lot — Vocabulaire et multilingue` et par le
   périmètre « Dehors » de `Lot 12`) et « miroir local » (cité par
   `Lot — External Data`, et présent par ailleurs comme environnement de
   test dans deux rapports du lot 1/2, jamais comme page wiki). Aucun des
   deux n'apparaît dans le recensement de `Gestion des lots` : ce sont
   des dépendances externes au système de lots actuel, pas des lots
   eux-mêmes — à garder en tête si le lot 13 matérialise les dépendances
   en propriété, pour ne pas créer un lien vers une page qui n'existera
   jamais sous ce nom.

6. **Aucune des neuf affirmations du cadrage (section F) n'a été
   démentie.** Sur un lot de cette taille, c'est en soi digne d'être
   noté : le cadrage s'appuyait déjà sur des mesures fraîches, pas sur
   des souvenirs de rapports anciens.

7. **Le numéro 13 est cohérent avant même d'être attribué.** Douze
   numéros sont déjà pris (1 à 12, le 7 sans page) et les huit pages
   restantes sont sans numéro par construction (`lots-a-venir-pages-courtes.md` :
   « le numéro est attribué à l'ouverture »). Le lot ouvert par cette
   tâche — « Gestion des lots en classe sémantique » — est donc
   légitimement le treizième, et cette reconnaissance est bien sa
   tâche 0.
