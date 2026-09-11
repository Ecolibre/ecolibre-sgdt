# Lot 33 — Tâche 1 : ce qu'un lot produit

## Ce qui a été écrit

1. `Lot 33 — Ce qu'un lot produit` (`--createonly`, pageid 559, revid 1344).
2. `Attribut:Work package produces` (`--createonly`, pageid 560, revid 1345),
   texte fourni collé sans modification.
3. `Modèle:Lot` : propriété ajoutée au bloc de stockage (après
   `Work_package_revises` et son séparateur, avec son propre `+sep=,`) et
   bloc « Pages produites » ajouté au tableau, après « Rapports » et avant
   « Relations sortantes ». Rien d'autre touché (`diff` avant/après, un seul
   bloc ajouté à chaque endroit).
4. `Formulaire:Lot` : champ ajouté après celui des rapports. Rien d'autre
   touché.
5. Remplissage rétroactif de `Work_package_produces` sur dix lots (3, 4, 6,
   8, 9, 10, 11, 13, 27, 28) — détail ci-dessous. Chaque écriture vérifiée
   par `bin/wiki-verify.sh` immédiatement après (dix « IDENTIQUE », aucun
   écart).

Résumés : `[Lot 33][Tâche 1] …` sur chaque écriture.

## Méthode de mesure

`list=recentchanges`, `rctype=new`, espaces 0/10/14/106/828, `rcdir=newer`,
paginé jusqu'à épuisement (une seule page de 500 a suffi, 226 créations).
Fenêtre observée : du 26 juillet 2026 11h20 au 11 septembre 2026 19h36 — plus
courte que l'historique réel du wiki (23 mars 2026), comme déjà noté sur la
page du lot 13.

Croisement avec l'étiquette `[Lot N]` en tête de résumé (206 des 226
créations en portent une ; 20 n'en portent aucune, voir plus bas).

Recherche complémentaire des refontes (pages existantes réécrites en
profondeur, pas créées) : deuxième passage sur `list=recentchanges` sans
filtre `rctype`, mêmes espaces, 657 révisions au total, résumés filtrés sur
`/efond|fusion/i`. Un seul cas retenu : `Gestion des lots`, révision 1232,
« [Lot 13][Tâche 4] Refonte de l'index en requêtes — remplacement du contenu
tenu à la main ».

## Critère appliqué, et choix faits sur les cas ambigus

Le critère de la consigne (page de structure ou de référence, ni donnée en
série, ni page de lot, ni propriété) laisse plusieurs zones grises. Choix
retenus, chacun discutable :

- **Les pages de lieu sont traitées comme des données, pas des pages de
  référence.** `Catégorie:Lieu` et `Modèle:Lieu` sont des pages de structure
  (incluses) ; les lieux eux-mêmes (Le Buisson de Cerzat, Cerzat, Chilhac,
  Terrain de Cyril, Zone basse, etc. — 12 pages au total sur les lots 9 et
  11) sont des instances de cette classe, au même titre qu'un exemplaire
  physique, et ont été exclues. Idem pour les pages d'organisation (CWL,
  Ecolibre) : exclues.
- **Les pages de registre de facette sont traitées comme des pages de
  référence, pas des données en série.** `Facette végétal` et
  `Facette raccord` (lot 8) ne sont que deux, définissent un vocabulaire, et
  restent du contenu réel (vérifié — aucune n'est une redirection) :
  incluses.
- **Une page devenue une redirection n'est plus une page durable.** `Feuille
  de route du Système de Gestion de Données Techniques` (créée par le lot 8)
  est aujourd'hui une redirection de 33 octets vers `Gestion des lots`
  (vérifié par `prop=info`) : exclue de la liste du lot 8.
- **Une refonte s'ajoute à la création, elle ne la remplace pas.**
  `Gestion des lots` figure à la fois dans la liste du lot 10 (créateur,
  revid 1123) et dans celle du lot 13 (refondeur, revid 1232).
- **Les pages courtes « Lot — Titre » (sans numéro) sont des pages de lot.**
  Huit créées par le lot 10 (« Lot — Navigation », etc., forme courte
  préparatoire au lot 12) : exclues au même titre que les pages de lot
  numérotées.

## Liste reconstituée, lot par lot

- **Lot 3** (2) : Catégorie:Referenced item, Catégorie:Physical item.
- **Lot 4** (2) : Modèle:Préfixe site, Registre des préfixes de site.
- **Lot 6** (1) : Limites connues du Système de Gestion de Données
  Techniques.
- **Lot 8** (10) : Catégorie:Facette, Modèle:Facet, Facette végétal, Facette
  raccord, Registre des facettes, Modèle:Organic facet fitting, Modèle:
  Organic facet plant, Formulaire:Organic item/bloc facette raccord,
  Formulaire:Organic item/bloc facette végétal, Ajouter une facette.
- **Lot 9** (6) : Modèle:Physical facet plant, Modèle:Specimen photo,
  Formulaire:Physical item/bloc facette végétal, Catégorie:Lieu, Modèle:
  Lieu, Avancement du jardin-forêt.
- **Lot 10** (5) : Module:Nombre, Modèle:Procédés et outils/ligne, Procédés
  et outils, Guide de saisie, Gestion des lots (création).
- **Lot 11** (2) : Erreurs de traitement SMW, Catégorie:Lieu sans nom
  d'usage.
- **Lot 12** : liste vide — n'a produit que sa propre page de lot, exclue
  par construction. Un fait, pas un manque.
- **Lot 13** (6) : Catégorie:Lot, Modèle:Lot, Formulaire:Lot, Catégorie:Page
  de suivi, Procédure de clôture d'un lot, Gestion des lots (refonte).
- **Lot 27** (2) : Procédure d'ouverture d'un lot, Comment ce wiki est tenu.
- **Lot 28** (1) : Transmettre vos outils et vos machines.
- **Lot 33** : liste vide pour l'instant. Sa propre page est exclue ; la
  propriété qu'il vient de créer est exclue par la règle « les propriétés
  n'y entrent pas » ; les modifications de `Modèle:Lot` et `Formulaire:Lot`
  sont des ajouts de champ, pas une création ni une refonte de ces pages.

## Ce qui n'a pas pu être mesuré — dit plutôt qu'inventé

**Lots 1, 2, 5, 7 : entièrement hors de portée.** Aucune entrée étiquetée
pour ces quatre lots dans toute la fenêtre observée (26 juillet – 11
septembre). Soit leur exécution est antérieure au 26 juillet, soit ils n'ont
rien produit de durable, soit leurs écritures n'étaient pas étiquetées — les
trois hypothèses sont indiscernables par cette méthode. `Work_package_produces`
n'a pas été touché sur ces quatre pages : une liste vide écrite par moi
affirmerait « mesuré : rien », alors que la vérité est « non mesurable ».

**Sept pages de structure ou de référence, réelles, sans étiquette de lot
retrouvable :** `Modèle:Préfixe lieu`, `Formulaire:Lieu`,
`Catégorie:Organisation`, `Modèle:Organisation`, `Ecolibre`, `Modèle:
Physical facet plant/doc`, et surtout `Notes en attente de rangement` — une
des pages de référence nommées par `CLAUDE.md` lui-même. Toutes sont créées
sous un résumé `[Amendement]` sans numéro, ou sans aucune étiquette du tout.
Datées du 20 au 25 août 2026 et du 1er septembre 2026, donc à l'intérieur de
la fenêtre observée : ce n'est pas un problème de fenêtre, c'est une absence
réelle d'étiquette. Aucune de ces sept pages n'a été rattachée à un lot par
supposition.

## Vérifications (étape 6)

1. **`browsebysubject` sur trois lots au moins, dont le 27** : lot 27 rend 2
   valeurs distinctes, lot 13 en rend 6, lot 8 en rend 10 — jamais une seule
   chaîne concaténée. Conforme.
2. **Phrase d'objet toujours en une seule valeur** sur les lots multivalués
   vérifiés (13, 8, 9) : `Work_package_summary` reste une chaîne unique dans
   les trois cas. Le séparateur ajouté n'a pas débordé. Conforme.
3. **`action=parse` sur le lot 27** : la ligne « Pages produites » rend deux
   liens internes résolus (`Procédure d'ouverture d'un lot`,
   `Comment ce wiki est tenu`), pas trois — voir plus bas. La ligne
   « Rapports » rend toujours les cinq permaliens externes corrects,
   inchangés. Conforme au contenu réel, pas à l'attente du contexte de la
   consigne.
4. **`Catégorie:Lot` compte 33 membres.** L'index, purgé puis relu, rend
   `Lots au total : 33`, `En cours : 2` (lots 24 et 33). Conforme.
5. **Annotations parasites** : voir la découverte ci-dessous — il n'y en a
   aucune côté faits SMW (`browsebysubject` sur huit des dix lots touchés ne
   montre que les propriétés `Work_package_*` attendues plus `_INST`,
   `_ASK`, `_MDAT`, `_SKEY`), mais il y en a côté **catégories MediaWiki**.

## Écarts et surprises

**Découverte principale, à traiter avant toute nouvelle écriture sur
`Work_package_produces` : le rendu du modèle catégorise silencieusement le
lot lui-même quand une page produite est une catégorie.** La ligne ajoutée
à l'étape 3, texte fourni et collé tel quel, est
`{{#arraymap:{{{Work_package_produces}}}|,|@@@@|[[@@@@]]|, }}`. Quand une
valeur de la liste commence par `Catégorie:` (cas réel et attendu : lister
une catégorie produite est le cœur de la fonctionnalité), `[[@@@@]]` se
développe en `[[Catégorie:X]]` — un vrai lien de catégorisation, pas un lien
vers la page. La page du **lot qui produit** la catégorie devient alors elle-
même membre de cette catégorie. Vérifié par `prop=categories`, pas déduit :

| Lot | Catégories parasites gagnées |
|---|---|
| 3 | Catégorie:Physical item, Catégorie:Referenced item |
| 8 | Catégorie:Facette |
| 9 | Catégorie:Lieu |
| 11 | Catégorie:Lieu sans nom d'usage |
| 13 | Catégorie:Page de suivi |

Confirmé réel et non un résidu de cache : `Lot 13` réapparaît dans
`list=categorymembers` de `Catégorie:Page de suivi` après purge avec
`forcelinkupdate`. Les lots sans catégorie dans leur liste (4, 6, 10, 27, 28)
n'ont rien gagné de parasite — vérifié aussi, pour confirmer que le
mécanisme est bien celui-là et rien d'autre. Je n'ai pas corrigé le modèle :
l'étape 3 disait explicitement de ne toucher à rien d'autre, et une
correction non demandée sur un modèle en service excède ce que cette
consigne validait. Le correctif technique le plus probable est un lien à
deux-points (`[[:@@@@|@@@@]]` au lieu de `[[@@@@]]`), qui affiche un lien
normal vers une catégorie sans catégoriser la page qui le porte — à valider
avant application.

**L'exemple donné dans le contexte de la consigne ne résiste pas à la
mesure.** Il affirmait que le lot 27 « a produit trois pages dont les deux
procédures ». Mesuré : le lot 27 a produit deux pages (`Procédure
d'ouverture d'un lot` et `Comment ce wiki est tenu`), pas trois. La
**Procédure de clôture d'un lot** a été créée par le **lot 13**, tâche 5b,
le 2 septembre 2026 à 16h34 — près d'un jour avant même l'ouverture du lot
27 (2 septembre, 20h42). La liste du lot 13 porte donc cette page, pas celle
du lot 27. Je n'ai pas suivi l'exemple donné : la consigne elle-même dit que
la mesure fait foi en cas de désaccord.

Rien d'autre à signaler : aucune permission refusée, aucun verrou de
propagation rencontré sur les dix écritures de pages de lot ni sur la page
de propriété, aucune session expirée, aucun signe d'instabilité du wiki
malgré la migration de serveur annoncée en règle impérative. La file de
travaux affichait 21 travaux figés au moment des vérifications finales ;
conformément à la règle ajoutée le 10 septembre 2026, ce compteur n'a pas
été pris pour un diagnostic de panne, et les faits ont été vérifiés
directement par `browsebysubject` plutôt que par attente.

# Tâche 2 : corriger la catégorisation parasite

## État avant (étape 1)

Relevé par `prop=categories` avant toute écriture :

| Page | Catégories portées |
|---|---|
| Lot 3 | Catégorie:Lot, Catégorie:Physical item, Catégorie:Referenced item |
| Lot 8 | Catégorie:Facette, Catégorie:Lot |
| Lot 9 | Catégorie:Lieu, Catégorie:Lot |
| Lot 11 | Catégorie:Lieu sans nom d'usage, Catégorie:Lot |
| Lot 13 | Catégorie:Lot, Catégorie:Page de suivi |
| Lot 27 | Catégorie:Lot (témoin, non affecté) |

## Ce qui a été écrit

1. `Modèle:Lot` : relu, confirmé dans l'état laissé par la tâche 1. Seule la
   ligne « Sur le wiki » du bloc « Pages produites » modifiée —
   `[[@@@@]]` → `[[:@@@@]]`. `diff` avant/après : une seule ligne touchée,
   le bloc de stockage et ses cinq séparateurs intacts. Vérifié identique
   par `bin/wiki-verify.sh` après écriture (revid 1346 → 1358).
2. Purge avec `forcelinkupdate` des pages des lots 3, 8, 9, 11, 13
   (`bin/wiki-purge.sh`, les cinq en un seul appel, `linkupdate: true` sur
   chacune).
3. `Limites connues du Système de Gestion de Données Techniques` : entrée
   ajoutée par `bin/wiki-append.sh`, texte fourni collé tel quel. Le script
   a confirmé 51 entrées avant, 52 après, l'ajout en dernière position.
   `prop=categories` et `browsebysubject` relevés après coup (voir
   vérifications) : les occurrences non protégées de `[[@@@@]]` et
   `[[:@@@@]]` dans des balises `<code>`, malgré le risque documenté par
   ailleurs sur cette page (leçon des backticks/`<code>` qui ne protègent
   rien), n'ont produit ni lien réel ni catégorie de suivi parasite —
   `@@@@` n'est simplement pas un titre de page qui déclenche un
   comportement particulier sur ce wiki. Vérifié, pas supposé.

Résumés : `[Lot 33][Tâche 2] …` sur les deux écritures.

## État après (étapes 3-4)

| Page | Catégories après purge |
|---|---|
| Lot 3 | Catégorie:Lot (seule) |
| Lot 8 | Catégorie:Lot (seule) |
| Lot 9 | Catégorie:Lot (seule) |
| Lot 11 | Catégorie:Lot (seule) |
| Lot 13 | Catégorie:Lot (seule) |

Aucune catégorie parasite subsistante sur les cinq pages : rien à rapporter
comme cas résistant à la purge.

Membres relevés par `list=categorymembers` sur les six catégories touchées,
après correction :

| Catégorie | Membres | Page de lot restante ? |
|---|---|---|
| Physical item | 47 | non |
| Referenced item | 39 | non |
| Facette | 3 | non |
| Lieu | 13 | non |
| Lieu sans nom d'usage | 0 | non |
| Page de suivi | **6** | non |

`Catégorie:Page de suivi` compte exactement six membres (Gestion des lots,
Limites connues, Notes en attente de rangement, Procédure d'ouverture d'un
lot, Procédure de clôture d'un lot, Récapitulatif technique) — conforme à
l'attente de la consigne. `Catégorie:Lot` compte 33 membres — conforme,
inchangé par cette tâche.

## Vérifications (étape 5)

`action=parse` sur le lot 13 : les six pages produites s'affichent en liens
résolus vers leurs cibles réelles (`/wiki/Catégorie:Lot`,
`/wiki/Modèle:Lot`, etc.), chacune avec son nom complet y compris le
préfixe `Catégorie:` dans le texte affiché — comportement attendu du
deux-points, pas un défaut. `action=parse` sur le lot 27 : les deux pages
produites toujours résolues ; la ligne « Rapports » de l'infobox et la
section « Rapports » de la page rendent ensemble dix liens externes,
correspondant aux cinq permaliens comptés deux fois (une fois par
mécanisme d'affichage) — inchangé par cette tâche, vérifié pour mémoire.

## Étape 7 — liste du lot 27

Déjà correcte avant toute intervention, confirmé par la tâche 1 et
reconfirmé ici par `action=parse` : la page du lot 13 porte `Procédure de
clôture d'un lot` dans ses pages produites, celle du lot 27 ne la porte
pas. Rien touché.

## Écarts et surprises (tâche 2)

Aucun écart entre l'attendu de la consigne et la mesure sur cette tâche :
les six comptes de catégories, le compte de `Catégorie:Page de suivi` (6)
et celui de `Catégorie:Lot` (33) correspondent tous exactement à ce que la
consigne annonçait — la première fois de la session où un chiffre annoncé
à l'avance résiste intégralement à la remesure.

Un `<()`  de substitution de processus a été utilisé une fois par erreur
pendant la vérification du diff avant écriture du modèle (contournement
immédiat par deux fichiers temporaires et deux `diff` successifs, comme le
prescrit `CLAUDE.md`) — sans conséquence, la commande n'a pas déclenché de
confirmation, mais à ne pas reproduire.

Rien d'autre à signaler : aucune permission refusée, aucun verrou de
propagation, aucune session expirée.
