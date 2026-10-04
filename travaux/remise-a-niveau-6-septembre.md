# Remise à niveau — 9 jours d'absence (29 août → 7 septembre 2026)

Rédigé en session de lecture seule stricte : aucune écriture wiki n'a été
faite pendant cette reconnaissance, y compris pour corriger les anomalies
relevées ci-dessous. `bin/wiki-login.sh` a été relancé deux fois (début de
session, puis après expiration constatée sur un contrôle `intestactions`).
Dernière image connue de Cyril : 28 août 2026. Les requêtes SMW/API citées
ci-dessous ont été exécutées le 6 et le 7 septembre 2026 (le changement de
date a eu lieu en cours de session) — précisé section par section.

---

## 1. Rapports de `travaux/` du 29 août au 6 septembre 2026, par ordre chronologique

Sources : les fichiers listés ci-dessous, plus `git log --since=2026-08-29`
pour les résumés `[Lot N]` qui donnent les dates de dépôt sûres.

### `lot-10-tache5a-preliminaires.md` (29 août, 16h41)
**Fait :** réordonnancement de la banque d'inventaire CWL — création de
l'organisation partenaire `CWL`, retrait de `default=Ecolibre` sur le champ
`Owned_by` du formulaire des items physiques (il fabriquait un fait
d'appartenance non choisi sur 44 items/44), renommage `ECL-0043 → CWL-0008`
(machine à souder) avec redirection conservée, `CWL-0007 → ECL-0044`
(batterie, sans renommage de titre).
**Décidé :** une référence d'inventaire libérée n'est jamais réattribuée ;
`Inventory_site` (qui inventorie) et `Owned_by` (qui possède) sont deux
faits distincts.

### `lot-10-tache5b-design-source.md` (29 août, 17h32)
**Fait :** création de la propriété `Design_source` (URL, monovaluée,
domaine `Referenced item`), câblée dans le modèle et le formulaire —
vide sur tous les items.
**Décidé :** le wiki héberge les rendus PNG/PDF ; les sources STEP/STL/
natives vivront dans un dépôt git, référencées en permalien de commit,
jamais sur une branche.

### `lot-10-tache5c-outils.md` (29 août, 17h53)
**Fait :** dix pages créées en série (4 organiques, 3 référencés,
3 physiques) pour compléter la chaîne de quatre des cinq outils du lot 10.
Une erreur de consigne (poser `Practice_domain` sur les organiques)
interceptée avant écriture.
**Décidé :** `Practice_domain` reste réservé au procédé (item fonctionnel),
jamais à l'outil.

### `lot-10-tache5d-corresponds-multivalue.md` (29 août, 18h05)
**Fait :** `Corresponds_to_organic` passe de cardinalité unique à multiple
(propriété, modèle, formulaire) ; la machine à souder SUNKKO rattachée à
deux organiques (« Machine à souder par point », « Fer à souder »).
**Décidé :** un modèle du commerce peut implémenter plusieurs solutions
techniques à la fois.

### `lot-10-tache6-vue.md` (29 août, 22h54)
**Fait :** création des pages « Procédés et outils » et « Guide de
saisie », d'un modèle de sous-requête, mise à jour de la Feuille de route.
**Décidé :** forme retenue = `#ask` imbriqué appelé en `format=template`
(motif technique réutilisable) ; le tri alphabétique, proscrit aux lots 9
et 10, est désormais permis (collation `uca-fr` déjà en place côté serveur).

### `lot-10-tache7-cloture.md` (29 août, 23h35)
**Fait :** clôture du lot 10 ; page « Gestion des lots » créée (texte
statique à l'époque) ; inventaire des onze lots livrés ; trois affirmations
fausses de la consigne de clôture interceptées et corrigées le jour même
(`format=tree`/`outline` fonctionnent, `Main_image` est câblée dans la
facette végétale).
**Décidé :** lot 10 clos le 29 août ; le lot 7 reste l'unique trou de
numérotation, jamais exécuté.

### `lot-12-cadrage-contenants.md` (30 août, 22h08)
**Fait :** première page de lot en forme longue publiée, « Lot 12 —
Contenants et étiquetage » ; renvoi croisé posé sur « Gestion des lots ».
**Décidé :** séparer « contenir » de « composer » — cadrage seulement, lot
non exécuté.

### `lot-10-synthese-documentation.md` (30-31 août — plan puis exécution en section 9, 17h56)
**Fait :** plan d'insertion des apports du lot 10 dans les pages de
référence, huit points soumis à Cyril puis tranchés, exécuté le 31 août :
Récapitulatif technique +6551 octets (procédés, `Design_source`,
`Corresponds_to_organic` multivaluée, numérotation à trois compteurs
séparés mais tous en Base 36, `Location_lineage` recadrée par le lot 12,
types de fichiers, deux motifs techniques réutilisables), Limites connues
+5161 octets (entrées 35 à 41), `demandes-adminsys.md` §2.2 (collation
marquée FAIT).
**Décidé :** un correctif immédiat (rév. 1140) sur deux exemples de
syntaxe non échappés (catégorie de suivi de liens de fichiers brisés,
préexistante depuis la rév. 1088, pas induite par cette session).

### `lots-a-venir-pages-courtes.md` (31 août, 22h24)
**Fait :** création de huit pages courtes de lot sans numéro (Navigation,
Images, Corrections du module de références, Arbre fonctionnel,
Arborescence des domaines de pratique, Vocabulaire et multilingue,
External Data, Gestion des lots en classe sémantique).
**Décidé :** une page courte ne porte que ce qui vieillit lentement
(objet, décisions déjà prises, écarts, dépendances) — le cadrage complet
s'écrit à l'ouverture, le numéro à la création de la page.

### `lecons-session-2026-08-31.md` (31 août, 23h01)
**Fait :** trois leçons ajoutées à `CLAUDE.md` (`<code>` n'échappe rien —
passé à trois occurrences connues ; `wiki-wait-jobs.sh` annonce une panne
fictive ; « une mesure ne vaut que si elle mesure ce qu'on croit ») et
entrée 42 posée sur les Limites connues.
**Décidé :** le contrôle par `prop=categories` après écriture complète
(sans le remplacer) le contrôle `browsebysubject` déjà en usage.

### `lot-13-tache0-recon.md` (1er septembre, 23h48)
**Fait :** reconnaissance d'ouverture du lot 13. Recensement des vingt
lots existants (onze exécutés, neuf identifiés dont le lot 7 sans page) ;
dates réelles reconstruites depuis les résumés `[Lot N]` de
`recentchanges` ; deux erreurs historiques corrigées (trois éditions du
12 août mal étiquetées `[Lot 10]`, dates du lot 6 en avance de deux jours
sur les résumés réels) ; audit des huit points ouverts du lot 10 (quatre
encore ouverts, deux fermés, un compte corrigé — un seul outil incomplet,
pas deux).
**Décidé :** le numéro 13 est légitimement le prochain disponible ; le lot
ouvert est « Gestion des lots en classe sémantique ».

### `lot-13-tache1-proprietes.md` (2 septembre, 01h31)
**Fait :** création de `Catégorie:Lot` et de neuf propriétés
`Work_package_*` (numéro, état à six valeurs autorisées, résumé, date
d'ouverture, date de clôture, permalien de clôture, dépend de, recoupe,
révise).
**Décidé :** quatre attributs suffisent (numéro, état, objet, dépendance) —
le reste sert la traçabilité.

### `lot-13-tache2-modele-formulaire.md` (2 septembre, 01h52)
**Fait :** création de `Modèle:Lot` et `Formulaire:Lot`, définition de
`Catégorie:Lot` ; correctif immédiat (valeurs du menu déroulant écrites en
dur, `list` ajouté sur les champs multivalués).
**Décidé :** Page Forms ne lit pas les `Allows value` d'une propriété — le
vocabulaire se répète en dur dans le formulaire, comme pour
`Maturity_level`.

### `lot-13-tache3a-page-lot13.md` (2 septembre, 02h09)
**Fait :** le lot en cours (encore « Lot — Gestion des lots en classe
sémantique ») renommé « Lot 13 — … » et transformé en première page réelle
de la classe `Lot`, redirection conservée ; test préalable de
`bin/wiki-move.sh` sur quatre cas (tous conformes, y compris les refus
attendus).
**Décidé :** le numéro s'attribue à l'ouverture, jamais avant.

### `lot-13-tache3abis-date-livraison.md` (2 septembre, 02h32)
**Fait :** création de `Work_package_delivery_date`, modèle et formulaire
mis à jour ; tentative de compléter `Catégorie:Lot` (distinction
livré/clos) refusée par `smw-change-propagation-protection`.
**Décidé :** report de l'écriture bloquée, aucune insistance.

### `lot-13-tache3b-lots-1-11.md` (2 septembre, 02h43)
**Fait :** création des onze pages Lot 1 à Lot 11 dans la classe
sémantique, permaliens de clôture vérifiés sur le SHA de commit du lot 10
par lecture directe du dépôt (`git cat-file -e`).
**Décidé :** rien de nouveau, application du format déjà arrêté.

### `lot-13-tache3c-lot12-et-pages-courtes.md` (2 septembre, 13h22)
**Fait :** attribution des numéros 14 à 20 aux sept pages courtes
(renommage avec redirection), transformation des huit pages (lot 12
compris) au format de la classe `Lot`.
**Décidé :** rien de nouveau.

### `lot-13-tache3d-lots-neufs.md` (2 septembre, 13h37)
**Fait :** création des lots 21 à 26 (Grandeurs et unités, Miroir local,
Priorisation, Adminsys autonome, Axe taxonomique, Renommage des
propriétés par domaine) ; correctif de la phrase « pas encore de numéro »
devenue fausse sur les sept pages 14-20.
**Décidé :** découverte d'un piège de cache de rendu (page figée jusqu'à
purge), distinct du verrou de propagation SMW.

### `lot-13-tache4-index.md` (2 septembre, 17h07)
**Fait :** refonte de « Gestion des lots » en page construite par requêtes
`#ask` (auparavant tenue à la main) ; fusion de la « Feuille de route du
SGDT », devenue redirection ; entrée 43 des Limites connues ajoutée
(licence botanique CC BY-SA).
**Décidé :** l'index se construit désormais seul, plus de liste à
entretenir manuellement.

### `lot-13-tache5a-consignation.md` (2 septembre, 18h31)
**Fait :** entrées 44 à 47 des Limites connues ajoutées ; création de
`Catégorie:Page de suivi`, posée sur les quatre pages de référence + renvoi
depuis la page d'accueil ; deux ajouts à `CLAUDE.md`.
**Décidé :** rien de nouveau.

### `lot-27-tache1-ouverture.md` (2 septembre, 22h44)
**Fait :** ouverture du lot 27 « Conduite du projet » ; corrections sur
trois pages (entrée 14 des Limites connues complétée, renvoi de l'entrée
47 corrigé, point ouvert du lot 24 corrigé) + correction resserrée sur
`demandes-adminsys.md`.
**Décidé :** un seul lot est réellement « en cours » (le 13 est déjà
livré) — la consigne en supposait deux à tort.

### `lot-13-tache5b-cloture.md` (2 septembre, 23h39 — inclut les tâches 5c/5d/5e ajoutées le même jour)
**Fait :** création de « Procédure de clôture d'un lot » ; épreuve de la
procédure sur le lot 10 (criblage de formules, vérification des quatre
points ouverts — tous encore ouverts) ; troisième page trouvée sous
verrou de propagation (`Work_package_closure_report`) ; livraison du
lot 13 (statut livré, 2 septembre, pas clos) ; corrections successives
(entrée 47 fausse dans sa généralité, précision de l'étiquette
`[Lot N][Correctif]`, section « Où lancer cette procédure » ajoutée).
**Décidé :** le lot 13 est livré, non clos ; sa propre procédure de
clôture ne s'est pas encore appliquée à lui-même.

### `lot-27-tache2-protocole.md` (2-3 septembre — inclut la tâche 3, dépôt uniquement)
**Fait :** création de `methode-de-travail.md` (protocole entre les
intervenants) ; retour d'expérience sur son exécution (quatre écarts
relevés) ; fichier corrigé en conséquence le 3 septembre (texte délégué
reconnu comme second mode légitime, canal direct décrit, chiffre « trois
lignes » retiré, section « ce qui rattrape les erreurs »).
**Décidé :** `methode-de-travail.md` fait désormais référence pour le
protocole à trois (architecte / Cyril / exécuteur).

### `lot-28-tache1-ouverture.md` (4 septembre, 01h34)
**Fait :** création de « Lot 28 — Échange de données avec un partenaire »
(statut `identifié`, chevauche les lots 21 et 25).
**Décidé :** cadrage de principe seulement, aucune structure partenaire
nommée.

### `lot-27-tache4-procedure-ouverture.md` (4 septembre, 12h18 — inclut la tâche 5)
**Fait :** création de « Procédure d'ouverture d'un lot », renvois croisés
posés (clôture ↔ ouverture, `Catégorie:Page de suivi`) ; puis réduction à
un message d'ouverture court (3 lignes) et une procédure longue détachée.
**Décidé :** rien de nouveau.

### `lot-27-tache6-durcissement-ouverture.md` (4 septembre, 18h52)
**Fait :** durcissement de la procédure d'ouverture après son premier
essai (formulation moins impérative, retrouver la page de lot par
`Catégorie:Lot` plutôt que par le seul numéro, ligne d'arrêt en cas
d'échec réseau) ; ajout dans `methode-de-travail.md`.
**Décidé :** rien de nouveau.

### `outillage-passe2.md` (6 septembre, 02h20)
**Fait :** helper CSRF partagé (`bin/_wiki-csrf.sh`) créé et déployé dans
`wiki-put.sh`/`wiki-purge.sh`/`wiki-upload.sh` (commit `d3edbf2`) ; diff de
réorganisation des Limites connues **proposé mais pas encore écrit** à ce
stade (en attente de validation de Cyril).
**Décidé :** un futur `wiki-append.sh` ne portera jamais `bot=1` ni
`createonly`.

### `wiki-append.md` (6 septembre, 13h29)
**Fait :** réorganisation des Limites connues (provenance en tête, liste
en fin de page, deux éditions rév. 1279 et 1290) ; écriture et test de
`bin/wiki-append.sh` (garde-fous avant/après écriture, testé en bac à
sable) ; `CLAUDE.md` et `.claude/settings.json` mis à jour.
**Décidé :** `wiki-append.sh` est réservé aux pages qui se terminent par
la liste-cible ; il n'aide en rien à corriger une entrée existante.

### Lots ouverts / fermés / abandonnés dans la période

- **Fermé (clos) :** Lot 10, 29 août (avec rectification le jour même).
- **Livré (non clos) :** Lot 13, 2 septembre.
- **Ouvert (en cours) :** Lot 27, depuis le 2 septembre — c'est le seul
  lot au statut « ouvert » aujourd'hui (vérifié par requête, section 2).
- **Créés mais seulement cadrés/identifiés, non ouverts :** Lot 12
  (30 août), Lots 14 à 26 (2 septembre, dont sept renumérotés depuis des
  pages sans numéro créées le 31 août), Lot 28 (4 septembre, statut
  `identifié` malgré le nom de fichier « ouverture »).
- **Abandonné :** aucun (confirmé par requête sur le wiki, section 2).
- **Lot 7 :** toujours l'unique trou de numérotation — jamais exécuté,
  toujours `identifié`.

---

## 2. État du wiki aujourd'hui (mesuré le 7 septembre 2026)

Méthode de comptage : `action=query&list=categorymembers` sur chaque
catégorie de classe — c'est la méthode déjà validée dans les rapports
(`categorymembers` sur `Catégorie:Lot`, `Catégorie:Physical item`, etc.),
préférée à `action=ask&format=count`, dont l'entrée 47 des Limites connues
documente qu'il rend toujours `count: 0` sur ce wiki (bug propre à ce
chemin d'API, confirmé encore aujourd'hui par un test direct pendant cette
session : `count: 0`, même hash `8abf92b9…` que celui déjà catalogué).

| Classe | Effectif |
|---|---|
| Functional item | 26 |
| Organic item | 41 |
| Referenced item | 38 |
| Physical item | 47 |
| Lieu | 13 |
| Organisation | 2 (Ecolibre, CWL) |
| Lot | 28 |

**Correctif du 7 septembre 2026 :** cette section datait à tort « Mèche de
tarière pour perceuse » comme item **référencé**. Mesure directe de sa page
(`{{Organic item| ... }}`) le 7 septembre : c'est un item **organique**. Les
deux comptes ci-dessus étaient donc faux d'une unité chacun, dans le sens
opposé (Organic 40→41, Referenced 39→38) ; ils sont corrigés dans le
tableau. Le Referenced item reste ainsi à 38, sa valeur de la mesure du
29-31 août (`lot-10-tache5d`/`lot-10-synthese-documentation`) — aucun écart
à expliquer de ce côté. C'est l'Organic item qui porte le +1 : la note
« Sens de la relation souhaité par… » de *Notes en attente de rangement*
(datée 01/09/26, complétée le 07/09/26) mentionne que Cyril a créé
lui-même **« Mèche de tarière pour perceuse »** (et son item fonctionnel)
hors session outillée — c'est ce 41ᵉ item organique.

**Propriétés déclarées** (`action=query&list=allpages&apnamespace=102` —
espace `Attribut`, confirmé ns 102 via `siteinfo`, pas 108) : **120**
pages au total. Dix créées depuis le 29 août : `Design_source` (29 août,
lot 10) et les neuf `Work_package_*` plus `Work_package_delivery_date`
(1ᵉʳ-2 septembre, lot 13). Aucune autre propriété créée dans la fenêtre.
Confirmé indépendamment par `list=recentchanges` sur les espaces `Modèle`
(10) et `Formulaire` (106) depuis le 29 août : seules apparaissent les
éditions déjà documentées du lot 10 (29 août) et du lot 13
(`Modèle:Lot`/`Formulaire:Lot`, 1ᵉʳ-2 septembre) — aucun modèle ou
formulaire d'item touché en dehors de ces deux épisodes déjà connus.

**Erreurs de traitement SMW** (`[[_ERRC::+]]` en liste, pas en `count` —
même piège que ci-dessus) : **4 pages**, pas 9 comme relevé le 21 août.

- `Attribut:INSEE code` — anomalie connue (`Property_range` rejeté à la
  création, 21 août, cf. Limites connues n° 32 et 44).
- **Trois items physiques plantés, jamais signalés dans aucun rapport :**
  `Capucine tubéreuse — Le Buisson de Cerzat (ECL-0006)`,
  `Fraisier X — Le Buisson de Cerzat (ECL-0014)`,
  `Helianthi — Le Buisson de Cerzat (ECL-0020)`. Les trois modifiés le
  **4 septembre 2026 entre 19h10 et 19h24** (`_MDAT`), même hash d'erreur
  (`89c61893e3a400b96dc77b0f0dff84fc`). Le rendu (`action=parse`) montre le
  message exact sur la page de Capucine tubéreuse : *« « ,3 » ne peut pas
  être affecté à un type de nombre déclaré avec la valeur 53.154. »*, sur
  la ligne « Position depuis l'origine du lieu (m) » (`53,1 54,3` affiché)
  — c'est le défaut déjà connu et documenté (entrée 39 des Limites
  connues) : SMW en locale FR rejette le point décimal sur un champ
  Number ; il semble ici y avoir eu deux valeurs saisies côte à côte avec
  virgule décimale. **Anomalie non corrigée** (hors mandat de cette
  session, lecture seule) — à signaler à Cyril : ces trois pages
  ressemblent à une tentative directe (hors session outillée) de
  renseigner un rang de plantation le 4 septembre, tombée sur le même
  piège que celui déjà consigné pour `Latitude`/`Longitude` en août.

**Les trois pages historiquement verrouillées** (`Attribut:INSEE code`,
`Attribut:Casc parent`, `Attribut:Casc lineage`) — vérifiées par
`action=query&prop=info&intestactions=edit&intestactionsdetail=full` :
**les trois sont maintenant éditables** (`actions.edit: []`). Le verrou
s'est levé de lui-même, conformément à l'entrée 14 des Limites connues
(« il se lève en un temps qui se compte en jours »). **Deux autres pages**
trouvées bloquées le 2 septembre (`lot-13-tache5b`/`lot-27-tache1`) —
`Catégorie:Lot` et `Attribut:Work package closure report` — sont **elles
aussi débloquées aujourd'hui**, même mécanisme, nouvelle confirmation
empirique de la règle.

**Plantations et rang** (`[[Category:Physical item]][[Item_facet::Facette
végétal]]` en liste) : **40 plantations**, chiffre stable depuis le lot 9.
Sur ces 40 : **3 seulement portent `Planting_rank`** (Égopode, Menthe
bergamote, Menthe X — Le Buisson de Cerzat), **0 portent
`Planting_rank_end`**. Ces champs, posés au lot 11 (25 août), restent
quasi inutilisés — et ce sont précisément ces trois plantations (via
Capucine, Fraisier X, Helianthi — pages voisines dans la série de rangs)
qui portent l'erreur SMW relevée ci-dessus, ce qui suggère une saisie de
rang récente et infructueuse.

---

## 3. Les treize entrées n° 35 à 47 de *Limites connues du SGDT*

Lues directement (`bin/wiki-get.sh`) — la page compte exactement 47
entrées aujourd'hui, donc les treize demandées existent toutes.

| N° | Ce qu'elle établit | Date |
|---|---|---|
| 35 | L'index de recherche plein-texte est partiel (`organique`, `outil`, `soudure`, `procédé` → 0 résultat). | 30 août |
| 36 | Le bloc Mermaid de `Catégorie:Functional item` est mort (graphe cassé) ; `format=tree`/`outline` de la même page, eux, rendent l'arbre complet. | 30 août |
| 37 | `Main_image` est câblée dans la seule facette végétale et portée par aucune page. | 30 août (revérifié 31) |
| 38 | `Manufacturer`/`Materials_worked` (type Page) accumulent des liens rouges (SUNKKO, Quicko, GVDA, acier nickelé). | lot 10 |
| 39 | `Assembler` et `Maintenir en position` ne portent aucun `Practice_domain` — invisibles aux tris et aux filtres. | 30 août |
| 40 | Le modèle ne distingue pas une référence retirée d'une référence jamais utilisée (`ECL-0043`, `CWL-0007`). | lot 10 |
| 41 | La contrainte de collation binaire est levée : tri linguistique `uca-fr` en place depuis les 18-19 août. | mesuré 29, revérifié 31 août |
| 42 | Une balise `<code>` n'échappe rien — seul `<nowiki>` protège ; troisième occurrence du piège, sur le Récapitulatif technique. | 31 août |
| 43 | La compatibilité des sources botaniques externes avec la licence CC BY-SA du wiki n'est pas tranchée. | règle du 16 août, entrée posée le 2 septembre |
| 44 | Un nom de propriété libéré par un renommage n'est réutilisable qu'une fois trois conditions réunies (pages réécrites, redirection supprimée, file vidée) — la formule « jamais réutilisable » était trop forte. | 2 septembre |
| 45 | La fenêtre de `list=recentchanges` (25 juillet) est plus courte que l'historique réel du wiki (page d'accueil créée le 23 mars). | 1ᵉʳ septembre |
| 46 | Page Forms ne lit pas les `Allows value` d'une propriété — un `dropdown` sans `values=` en dur reste vide. | 1ᵉʳ septembre |
| 47 | Le rendu d'une page dépendant d'une donnée portée ailleurs se rafraîchit avec retard, pas jamais — ne jamais conclure au figement sans avoir attendu puis relu. | 2 septembre (remplace une première version trop générale) |

---

## 4. Ce qui a changé dans le modèle depuis le 29 août

- **Nouvelle classe sémantique `Lot`** (catégorie, modèle, formulaire,
  neuf propriétés `Work_package_*`) — lot 13, 1ᵉʳ-2 septembre. « Gestion
  des lots » est passée d'une page statique tenue à la main à une page
  construite par requêtes `#ask` ; la « Feuille de route du SGDT » a été
  fusionnée dedans (redirection conservée).
- **`Design_source`** (URL, lot 10, 29 août) — toujours vide sur tous les
  items, aucun changement depuis.
- **`Corresponds_to_organic`** passée multivaluée (lot 10, 29 août) —
  confirmé stable, aucune régression, non révisée depuis.
- **Récapitulatif technique et Limites connues** mis à jour en profondeur
  le 31 août (voir section 1) pour intégrer les apports du lot 10.
- **Aucun autre modèle ou formulaire d'item** (Functional/Organic/
  Referenced/Physical, ou leurs facettes) touché depuis le 29 août —
  confirmé par `list=recentchanges` sur les espaces `Modèle` et
  `Formulaire`.

**Sur le lot 11 (subdivision des lieux) : aucune décision défaite ni
amendée depuis le 29 août.** Le lot reste `livré, clos` (27 août), et rien
dans les rapports du 29 août au 6 septembre ne le mentionne comme remis en
cause. Un seul point mérite d'être connu, mais il est **antérieur** à la
fenêtre demandée : l'entrée n° 2 des Limites connues (corrigée le
27 août, donc avant le 29) a établi que la décision 1.10 du cadrage du
lot 11 — qui invoquait `Board_lineage`/`Board_parent`/`Module:Board` comme
précédent éprouvé pour matérialiser une fermeture transitive — reposait
sur trois pages qui n'ont **jamais existé** sur ce wiki. Rien depuis le
29 août n'est revenu sur ce point ni n'a modifié une décision propre du
lot 11 ; ce fait continue seulement d'être cité comme mise en garde
méthodologique (Limites connues n° 2, 50).

---

## 5. Chantiers ouverts aujourd'hui

Sources : « Gestion des lots » (page construite par requêtes, lue telle
quelle), « Notes en attente de rangement », `demandes-adminsys.md`.

**Un seul lot au statut « ouvert » :** Lot 27 — Conduite du projet, depuis
le 2 septembre (confirmé par requête `[[Work_package_status::ouvert]]`).
Les tâches 1 à 6 de ce lot sont déjà exécutées d'après les rapports
(protocole `methode-de-travail.md`, procédures d'ouverture et de clôture
posées sur le wiki) ; aucune date de clôture n'est encore fixée.

**Seize lots en attente** (`identifié`/`cadré`) : le lot 7 (nomenclature
quantifiée — le trou historique, jamais exécuté), le lot 12 (contenants et
étiquetage, cadré le 30 août), les lots 14 à 26 (créés le 2 septembre,
aucun encore ouvert) et le lot 28 (échange de données avec un partenaire,
créé le 4 septembre, statut `identifié` malgré son nom de fichier
d'« ouverture »).

**Cinq notes de Cyril en attente de rangement**, toutes datées du
1ᵉʳ septembre 2026, aucune encore traitée :
1. Revoir le principe de nommage des photos importées — norme actuelle
   jugée trop fastidieuse à imposer.
2. Fusion des items physiques de plantes — cas concret de l'ail éléphant
   (plusieurs items physiques à fusionner en un, sans perdre l'historique).
3. Tri automatique des images non utilisées (non rattachées à une page
   d'item).
4. Taille des images téléversées — faut-il des vignettes + archive hors
   ligne pour les originaux ?
5. Sens de la relation « souhaité par » (`Wanted_by`) — devrait aller de
   l'organisme vers l'item, pas l'inverse ; et absence d'un concept de
   « projet » sur le wiki. Cette note documente aussi la création directe
   par Cyril de « Mèche de tarière pour perceuse », hors session outillée
   (voir section 2 et son correctif du 7 septembre : 41ᵉ item **organique**,
   pas référencé). Note complétée le 07/09/26 (fusion avec la note sur
   l'alignement PAIR) : Cyril a tranché le sens de la question, sans
   trancher le lot — le retournement de `Wanted_by` est suspendu au lot
   PAIR, un souhait se rattachant à un projet, pas directement à un
   organisme. La note reste donc en attente de rangement, pas encore
   sortie vers un lot.

**Anomalie à signaler, non corrigée (hors mandat) :** trois items plantés
(Capucine tubéreuse, Fraisier X, Helianthi — Le Buisson de Cerzat) portent
une erreur de traitement SMW depuis le 4 septembre, probablement une
saisie de rang de plantation buttée sur le séparateur décimal virgule/point
(voir section 2).

**Côté fuzzy** (`demandes-adminsys.md` §2) — toujours en attente :
vérifier `$smwgChangePropagationProtection` dans `LocalSettings_ecolibre.php`
(jamais lu directement) ; activer ou non `$smwgNamespacesWithSemanticLinks`
pour `Modèle`/`Formulaire`/`Module` (question ouverte, pas une évidence) ;
autoriser le SVG dans `$wgFileExtensions` ; extension Page Exchange ;
répertoire de déploiement du vocabulaire ; script de création de wiki ;
migration Scaleway ; wiki de l'Atelier du Dôme ; financement de
l'hébergement ; politique de sauvegarde ; rotation du mot de passe de
`mediawiki_ecolibre_prod`. Le verrou de propagation lui-même n'est plus
un blocage pratique aujourd'hui (les cinq pages connues se sont toutes
débloquées seules), mais la cause racine côté configuration reste non
élucidée.
