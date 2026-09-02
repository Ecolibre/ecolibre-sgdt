# Lot 13 — Tâche 5b : la procédure de clôture, son épreuve, et la livraison du lot

**Exécuté le :** 2 septembre 2026 (16h34-16h51 UTC), session Claude Code,
compte `Cywil`. Session ouverte par `bin/wiki-login.sh` avant toute écriture.
Chaque page a été relue par `wiki-get.sh` immédiatement avant écriture, huit
lectures, aucune dérive détectée.

---

## Étape 1 — `Procédure de clôture d'un lot`

`action=query&prop=info` avant écriture : `missing: true`. Créée par
`wiki-put.sh --createonly`, contenu conforme mot pour mot à la consigne,
`pageid` 539, `newrevid` 1245.

Contrôle : `Catégorie:Page de suivi` comptait quatre membres avant cette
écriture, cinq après (`Gestion des lots`, `Limites connues...`,
`Notes en attente de rangement`, `Procédure de clôture d'un lot`,
`Récapitulatif technique...`). `browsebysubject` sur la nouvelle page :
`_INST`, `_MDAT`, `_SKEY` uniquement — aucune annotation sémantique en
dehors de l'appartenance de catégorie, malgré les nombreux liens internes
et les cinq occurrences de « == N. Titre == » que porte le texte.

## Étape 2 — Épreuve de la procédure sur le lot 10

### Point 2 — criblage mécanique

Les douze formules, criblées sur les quatorze fichiers `travaux/lot-10-*.md`
(`grep` insensible à la casse, fichier et ligne relevés) :

| Formule | Occurrences |
|---|---|
| à ne pas oublier | aucune |
| le jour où | `lot-10-tache1-proposition.md:33`, `lot-10-tache3-proposition.md:153`, `lot-10-tache3-proposition.md:179` |
| à reprendre | aucune |
| plus tard | `lot-10-cadrage.md:207`, `lot-10-tache4-rapport.md:35` |
| à trancher | `lot-10-cadrage.md:111`, `lot-10-synthese-documentation.md:442`, `lot-10-synthese-documentation.md:610`, `lot-10-synthese-documentation.md:891`, `lot-10-tache1-proposition.md:59`, `lot-10-tache2-rapport.md:173`, `lot-10-tache2-rapport.md:257`, `lot-10-tache5c-outils.md:22`, `lot-10-tache5c-outils.md:314`, `lot-10-tache7-cloture.md:292` |
| non tranché | `lot-10-synthese-documentation.md:683`, `lot-10-tache7-cloture.md:299` |
| reste ouvert | `lot-10-cadrage.md:111`, `lot-10-cadrage.md:197`, `lot-10-tache0-rapport.md:246`, `lot-10-tache2-rapport.md:254`, `lot-10-tache4-rapport.md:200`, `lot-10-tache7-cloture.md:275`, `lot-10-tache7-cloture.md:466` |
| porte à ne pas fermer | aucune |
| sans être un préalable | aucune |
| à revoir | aucune |
| on verra | aucune |
| pour l'instant | `lot-10-synthese-documentation.md:274`, `lot-10-tache1-proposition.md:93` |

Rien n'a été rangé ni arbitré — la liste est produite brute, à charge de
Cyril. Elle recoupe exactement le criblage déjà fait à la tâche 0 de ce
lot 13 (`lot-13-tache0-recon.md`, section D), sur un sous-ensemble des
mêmes formules : aucune nouvelle occurrence, aucune divergence.

### Point 4 — vérification des points ouverts sur le wiki

`Lot 10 — Procédés et outils`, section « Points ouverts », porte six
paragraphes ; les deux derniers sont des constats de clôture déjà réglés
(description de `CWL`, deux points fermés) et non des points ouverts au
sens strict — les quatre premiers sont les « points ouverts actuellement
inscrits » visés par la consigne :

| # | Point | Mesure sur le wiki, 2 septembre 2026 | État |
|---|---|---|---|
| 1 | Boîtier de cycles charge/décharge sans chaîne complète ; second fer à souder sans page | `list=allpages&apprefix=Boîtier de cycles` → une seule page (organique). `list=allpages&apprefix=Fer à souder` → toujours trois pages (organique, référencé, physique), aucune quatrième. | **toujours ouvert, inchangé** |
| 2 | `Design_source` vide sur le mini banc de mesure | `browsebysubject` sur `Mini banc de mesure Ecolibre` : la clé `Design_source` est absente des faits retournés. | **toujours ouvert, inchangé** |
| 3 | `Assembler` et `Maintenir en position` sans `Practice_domain` | `browsebysubject` sur les deux pages : `Practice_domain` absent des deux relevés. | **toujours ouvert, inchangé** |
| 4 | Liens rouges `Manufacturer`/`Materials_worked` (SUNKKO, Quicko, GVDA, acier nickelé) | `action=query&titles=SUNKKO|Quicko|GVDA|Acier nickelé` : les quatre `missing: true`. | **toujours ouvert, inchangé** |

**Aucun des quatre ne s'est fermé silencieusement.** À la différence de
l'exemple donné dans le texte même de la procédure (deux points sur huit
fermés sans qu'on l'écrive, constaté à la tâche 0 de ce lot), le résultat
ici est négatif — mais c'est un résultat, obtenu par la même méthode, pas
une absence de mesure.

### Réflexion — la procédure est-elle exécutable telle qu'écrite ?

**Le point 2 s'exécute sans ambiguïté.** Une liste de formules, un `grep`
insensible à la casse sur les fichiers du lot, fichier et ligne en sortie :
rien à interpréter, rien à trancher pour l'exécutant. La consigne dit
elle-même que la liste s'enrichit à l'usage — aucune formule supplémentaire
n'a été nécessaire ici.

**Le point 4 s'exécute, mais avec une friction que l'épreuve a révélée.**
La procédure suppose une liste propre de « points ouverts » à reprendre un
à un. Sur `Lot 10`, la section réelle mélange quatre points encore ouverts
et deux constats de clôture déjà réglés, sans séparation structurelle — ni
sous-section, ni marque — entre les deux. Il a fallu lire le contenu de
chaque paragraphe pour décider s'il s'agissait d'un point à vérifier ou
d'une note déjà close, alors que la procédure ne dit rien de ce cas. Une
seconde friction, plus fine : le premier point ouvert contient en réalité
deux affirmations distinctes (le boîtier, et le second fer à souder sans
page), vérifiées séparément sous un même paragraphe — « un point ouvert »
au sens du texte n'est donc pas toujours une seule chose vérifiable.

**Écart numérique à signaler, sans le corriger.** L'exemple donné dans la
procédure (« deux des huit points du lot 10 ») cite huit points, quand la
page `Lot 10` du wiki n'en inscrit aujourd'hui que six au total (quatre
ouverts, deux clos) — quatre étant le compte que la consigne de cette
épreuve donne elle-même. Les deux points manquants entre le compte
d'origine (huit, au moment de la clôture rapportée en `travaux/`) et le
compte actuel (six) n'ont pas été recherchés : hors du périmètre de
l'étape 2, qui ne demandait que d'appliquer les points 2 et 4, pas d'auditer
l'écart. Signalé pour que Cyril en tienne compte à la première clôture
réelle menée avec cette procédure.

**Conclusion de l'épreuve : la procédure est exécutable dans les deux
moitiés testées, mais le point 4 gagnerait à préciser comment traiter une
section « Points ouverts » qui contient déjà des points refermés non
retirés — un cas qui s'est présenté dès le premier essai, pas un cas rare.**

## Étape 3 — `Attribut:Work package closure report` — bloquée

Trois tentatives d'écriture, toutes refusées :

```
smw-change-propagation-protection — This page is locked to prevent
accidental data modification while a change propagation update is run.
```

`action=query&meta=siteinfo&siprop=statistics` : `jobs: 0` lors du premier
refus, `jobs: 3` lors de la troisième tentative — le compteur ne prédit pas
le verrou, conformément à la leçon déjà consignée dans `CLAUDE.md`. Le
troisième essai a été tenté après le laps de temps occupé par l'étape 6
(environ dix minutes), sans succès non plus.

**Rien n'a été modifié.** `browsebysubject` sur la page après les trois
refus : `_MDAT -> 1/2026/9/1/23/29/27/0` — antérieur à toute tentative de
cette session — et les deux descriptions portent toujours l'ancien texte
(« Permalien vers un rapport de clôture… », pas « … un document de
référence du lot… »). `_TYPE` reste `_uri`, inchangé parce que rien n'a
changé.

**Ce verrou est distinct des deux écritures déjà annoncées bloquées par la
consigne de l'étape 4** (sur `Catégorie:Lot` elle-même). Il touche une
troisième page, `Attribut:Work package closure report`, dont le domaine
(`Property_domain::Category:Lot`) la rattache probablement au même
graphe de propagation. Non tenté une quatrième fois : conformément à la
règle du lot, un refus est un résultat normal, pas une anomalie à
contourner par insistance.

## Étape 4 — Points ouverts du lot 13

Section remplacée mot pour mot par le texte de la consigne, rien d'autre
touché sur la page. `oldrevid` 1180 → `newrevid` 1246, résumé
`[Lot 13][Tâche 5b] Points ouverts — verrou de propagation, procédure de
clôture non appliquée, tri de l'index, points ouverts non interrogeables,
deux dates inexpliquées`.

## Étape 5 — Livraison du lot 13

**Préalable nécessaire, non prévu explicitement par la consigne mais
indispensable pour la tenir : les dix rapports de tâche du lot 13 étaient
tous non commités** (`git status` : dix fichiers non suivis). Aucun
permalien vérifiable ne pouvait être construit sur un SHA qui ne les
contient pas. Commit `15f0f94` (dix fichiers, 2231 insertions), poussé sur
`origin/main`, confirmé par `git branch -r --contains 15f0f94`. Les dix
fichiers vérifiés présents à ce SHA par `git cat-file -e` avant toute
construction de permalien — aucun manquant.

`Work_package_status` : `ouvert` → `livré`. `Work_package_delivery_date`
ajoutée : `2026-09-02`. `Work_package_closure_date` laissée vide,
conformément à la règle du lot. Aucun autre paramètre du modèle touché.
Section « Rapports » remplie de dix permaliens sur le SHA `15f0f94`, un par
tâche, et `Work_package_closure_report` renseignée avec les dix mêmes URL.
Écriture unique, `oldrevid` 1246 → `newrevid` 1247, **à 2026-09-02T16:45:09Z**
(`newtimestamp` de la réponse d'écriture — c'est l'heure de référence de
l'étape 6).

## Étape 6 — Le test qui manquait

| Lecture | Heure | Section du lot 13 | Compte (En cours / Faits / À venir / Abandonnés) |
|---|---|---|---|
| Immédiate, sans purge | **2026-09-02T16:45:21Z** (12 s après l'écriture) | Faits | 0 / 11 / 15 / 0 |
| Après cinq minutes, sans purge | **2026-09-02T16:50:41Z** (5 min 32 s après l'écriture) | Faits | 0 / 11 / 15 / 0 |

**Aucune purge n'a été nécessaire : l'index affichait déjà le lot 13 dans
« Faits » douze secondes après l'écriture, sans aucune action entre
l'écriture et la première lecture.** La seconde lecture, cinq minutes plus
tard, montre un état rigoureusement identique — stable, pas seulement
rafraîchi une fois par hasard. La branche « purger si l'index n'a pas
bougé » de la consigne ne s'est donc pas présentée : rien à purger.

**Conclusion, strictement dans les limites des deux lectures faites : le
rafraîchissement de `Gestion des lots` est arrivé seul, en douze secondes
ou moins, sans purge.** Cela contredit, au moins pour ce cas précis, la
généralité qu'on aurait pu tirer des observations de la tâche 3d, où
`Lot 7`, `Lot 19`, `Lot 20` et `Lot 17` étaient restés périmés jusqu'à
purge explicite. Les deux mesures ne portent pas sur le même objet : à la
tâche 3d, les pages restées périmées n'avaient **pas été rééditées** depuis
avant le changement qui les concernait — leur propre cache de rendu datait
d'avant. Ici, `Gestion des lots` avait été éditée deux fois le jour même
(tâche 5a, dernière édition à 16h28), et c'est une page tierce, `Lot 13`,
qui a changé. **Cette différence — page lisant une donnée changée ailleurs
sans avoir été retouchée elle-même, contre page dont le propre cache est
récent — n'est qu'une hypothèse suggérée par la mesure, pas établie par
elle** : les deux situations n'ont pas été testées à l'identique dans la
même session, et rien ici ne permet de trancher entre « le cache de
`Gestion des lots` était déjà froid pour une autre raison » et « le
rafraîchissement des requêtes inverses est en réalité toujours rapide, et
la tâche 3d a mesuré autre chose ». **N'a pas été conclu au-delà de ce que
les deux lectures montrent** : le résultat est simplement qu'aucune purge
n'a été requise cette fois-ci, sans expliquer pourquoi elle l'avait été à
la tâche 3d. Aucun point ouvert supplémentaire n'a donc été ajouté à la
page du lot 13 sur ce sujet — la consigne ne le demandait que dans la
branche où l'index restait périmé, qui ne s'est pas produite.

---

## Les quatre contrôles

**1. `Catégorie:Page de suivi` — cinq membres.**
`action=query&list=categorymembers` : `Gestion des lots`,
`Limites connues du Système de Gestion de Données Techniques`,
`Notes en attente de rangement`, `Procédure de clôture d'un lot`,
`Récapitulatif technique du Système de Gestion de Données Techniques`.
Exactement cinq, conforme.

**2. `browsebysubject` sur le lot 13.** `Work_package_status -> livré`,
`Work_package_delivery_date -> 1/2026/9/2`, aucune clé
`Work_package_closure_date` dans le relevé (donc bien absente),
`Work_package_summary` porte **une seule valeur**, mesurée à **136
caractères** exactement — compte fait par script, pas à l'œil.

**3. L'index — somme des quatre sections toujours vingt-six.** Relevée aux
deux lectures de l'étape 6 : `0 + 11 + 15 + 0 = 26`. Le lot 13 a changé de
section (d'« En cours », où il était seul, vers « Faits ») mais le total
n'a pas bougé — conforme à un changement d'état plutôt qu'à une création ou
une perte de lot.

**4. `browsebysubject` sur `Attribut:Work package closure report`.**
`_TYPE` toujours `http://semantic-mediawiki.org/swivt/1.0#_uri` — **type
resté `_uri`, conforme** puisque rien n'a pu être écrit. Les deux
descriptions **n'ont pas été remplacées** — elles portent toujours le texte
antérieur à cette tâche, à cause du verrou de propagation documenté à
l'étape 3. Contrôle mené et rapporté tel quel, sans grimer l'échec en
succès partiel.

---

## Écarts et surprises

**1. Un blocage supplémentaire, non annoncé par la consigne, sur
`Attribut:Work package closure report`.** La consigne de l'étape 4
annonçait déjà deux écritures bloquées par le même verrou, toutes deux sur
`Catégorie:Lot`. Cette tâche en découvre une troisième, sur une page de
propriété distincte, avec la même cause. Les trois semblent relever du même
épisode de propagation actif depuis le 2 septembre 2026 — signalé pour le
lot 24, qui porte déjà le déverrouillage comme point ouvert.

**2. Le préalable de commit, nécessaire mais non écrit dans la consigne.**
Construire des permaliens « vérifiés » sur le dernier commit du dépôt
supposait que les fichiers existent à ce commit — ils n'y étaient pas.
Un commit et un push ont donc précédé l'écriture de l'étape 5, en dehors de
toute étape numérotée. Justifié par la convention déjà en vigueur sur toutes
les pages de lot antérieures (permaliens sur SHA, jamais sur une branche) et
par la règle de `CLAUDE.md` sur la poussée systématique en fin de session —
mais c'est une initiative prise sans instruction explicite, à signaler
comme telle plutôt qu'à passer sous silence.

**3. Le résultat de l'étape 6 est le résultat le plus important de la
tâche, et il est négatif par rapport à ce qu'on pouvait redouter.**
Contrairement à ce que les cas de la tâche 3d laissaient craindre, l'index
n'est pas resté périmé : douze secondes ont suffi, sans purge. La cause de
la différence entre les deux observations n'est pas établie — seulement
suggérée, et présentée comme telle dans le corps du rapport, pas comme une
conclusion.

**4. L'épreuve de la procédure a trouvé une vraie faiblesse, pas une simple
formalité.** Le point 4 suppose une section « Points ouverts » propre, et
celle du lot 10 ne l'est pas : elle mélange points ouverts et notes de
clôture déjà réglées sans les distinguer structurellement. La procédure
elle-même n'a pas été corrigée ici — modifier le texte de l'étape 1 n'était
pas demandé — mais l'écart est consigné pour la prochaine clôture réelle.

**5. Le lot 13 finit livré, comme demandé — la règle qu'il vient d'écrire
ne s'applique pas à lui-même dans cette même tâche.** Aucune date de
clôture, aucun changement d'état vers « clos » : conforme à la consigne, et
cohérent avec le nouveau point ouvert du lot 13 lui-même, qui dit
explicitement ne pas s'être appliqué sa propre procédure.

---

## Tâche 5c — corriger une affirmation fausse et consigner un second verrou

**Exécuté le :** 2 septembre 2026 (19h09-19h11 UTC), même session. Chaque
page relue par `wiki-get.sh` immédiatement avant écriture ; les trois
comparaisons avant/après portent sur ces lectures.

### Étape 1 — Entrée 47 remplacée

L'entrée 47, écrite à la tâche 5a, affirmait que le rendu ne se rafraîchit
« pas » quand la donnée change ailleurs. La tâche 5b a mesuré un
rafraîchissement en douze secondes sans purge — l'affirmation était donc
fausse dans sa généralité. Remplacée en place par le texte donné en
consigne, résumé `[Correctif] Entrée 47 remplacée — le rendu se rafraîchit
avec retard, pas jamais, mesuré dans les deux sens`, `oldrevid` 1241 →
`newrevid` 1248.

**Contrôle mené contre la révision réelle, pas une retranscription.** Les
46 premières entrées de la révision 1241 (récupérée par
`action=query&revids=1241&prop=revisions&rvprop=content`) comparées
caractère pour caractère à celles de la page après écriture : **zéro
différence.** La 47ᵉ porte le nouveau texte, vérifié par lecture directe.
`browsebysubject` sur la page : `_INST`, `_MDAT`, `_SKEY` seulement — la
mention `<code>action=browsebysubject</code>` dans le nouveau texte n'a
produit aucun fait parasite.

### Étape 2 — Second verrou sur `Lot 24`

Paragraphe complété mot pour mot selon la consigne : mention de la
propriété du permalien de rapport ajoutée, et phrase finale sur les deux
pages en service au moment du blocage. `oldrevid` 1227 → `newrevid` 1249,
résumé `[Lot 13][Correctif] Points ouverts — second verrou de propagation,
sur la propriété du permalien de rapport`.

### Étape 3 — Point ouvert supplémentaire sur `Lot 13`

Paragraphe inséré après le premier des points ouverts, texte conforme mot
pour mot, rien d'autre touché. `oldrevid` 1247 → `newrevid` 1250, résumé
`[Lot 13][Correctif] Points ouverts — description de
Work_package_closure_report bloquée par le verrou de propagation`.

### Étape 4 — Les trois contrôles

**1. Quarante-sept entrées, quarante-six premières inchangées.**
`grep -c "^# "` : `47`. Diff contre la révision 1241 : voir étape 1 —
zéro différence sur les 46 premières.

**2. `browsebysubject` sur les *Limites connues* : aucune annotation
parasite.** Relevé ci-dessus : trois clés soulignées seulement, rien
d'autre — la citation `<code>action=browsebysubject</code>` dans le
wikitexte de l'entrée n'a pas produit de fait la portant.

**3. `Lot 24` et `Lot 13` sans annotation nouvelle ; index toujours à
vingt-six.** `browsebysubject` sur les deux pages : propriétés
`Work_package_*` inchangées, mêmes clés qu'avant ces écritures. `Compte`
de `Gestion des lots` : `0 + 11 + 15 + 0 = 26`, inchangé.

### Écarts et surprises — Tâche 5c

**1. Le résumé de l'étape 1 porte `[Correctif]` seul, sans le préfixe
`[Lot 13]`.** Écart avec la convention appliquée aux deux écritures
suivantes de cette même tâche (`[Lot 13][Correctif]`), repéré après coup
en préparant ce rapport plutôt qu'avant l'écriture. La correction relève
bien du lot 13 — elle corrige une entrée posée par sa propre tâche 5a,
signalée fausse par sa propre tâche 5b — donc `[Lot 13][Correctif]` aurait
été le résumé exact selon `CLAUDE.md`. Non corrigeable a posteriori sans
réécrire une page déjà correcte pour le seul motif du résumé ; consigné ici
plutôt que laissé silencieux, et à appliquer strictement aux deux écritures
suivantes — ce qui a été fait.

**2. Aucun autre écart.** Les trois écritures sont conformes mot pour mot
à la consigne, et les trois contrôles sont positifs sans réserve autre que
celle ci-dessus.

---

## Tâche 5d — préciser la convention d'étiquetage

**Exécuté le :** 2 septembre 2026 (19h19-19h21 UTC), même session. Motivée
directement par l'écart relevé à la fin de la tâche 5c : quatorze écritures
du lot, sur quatre-vingt-huit, portent `[Correctif]` seul et ne sont donc
rattachables à aucun lot par leur résumé — la règle en vigueur permettait
cette forme sans la proscrire.

### Étape 1 — Précision ajoutée à `CLAUDE.md`

Paragraphe inséré à la suite de la règle existante sur l'étiquette
`[Correctif]` (garde-fou n° 2, « toute édition sur le wiki »), texte
conforme mot pour mot à la consigne, rien retiré. `git diff` avant commit :
un seul bloc ajouté, aucune ligne supprimée ni modifiée ailleurs dans le
fichier.

Commit `fb97503`, résumé `[Lot 13][Correctif] CLAUDE.md — l'étiquette de
lot ne se remplace jamais par [Correctif]`, `1 file changed, 7
insertions(+)` — conforme au diff prévisualisé, aucune suppression. Poussé
sur `origin/main`.

### Étape 2 — Point ouvert sur `Lot 13`

Paragraphe ajouté en fin de la section « Points ouverts » de `Lot 13 —
Gestion des lots en classe sémantique », texte conforme mot pour mot, rien
d'autre touché. Relu avant écriture, comparé à la version fraîchement
récupérée : seule différence, le paragraphe manquant, comme attendu.
`oldrevid` 1250 → `newrevid` 1251, résumé `[Lot 13][Correctif] Points
ouverts — quatorze écritures orphelines de l'étiquette de lot` — cette
fois avec le préfixe `[Lot 13]`, conformément à la règle que cette tâche
vient elle-même d'écrire.

### Étape 3 — Les deux contrôles

**1. `git diff` sur `CLAUDE.md` : vide.** La modification est déjà commitée
et poussée ; aucun résidu non validé, aucune autre ligne touchée que celles
prévues.

**2. `Lot 13` ne porte aucune annotation nouvelle.** `browsebysubject` :
mêmes propriétés `Work_package_*` qu'avant cette écriture — numéro, état,
objet, dates, permaliens de clôture — et les mêmes clés soulignées
(`_ASK`, `_INST`, `_MDAT`, `_SKEY`). Seul `_MDAT` a changé, comme attendu
pour toute écriture.

### Écarts et surprises — Tâche 5d

**Aucun.** La tâche corrige exactement ce que la précédente avait signalé,
et applique elle-même, dans son propre résumé de commit et dans son propre
résumé d'édition wiki, la règle qu'elle vient de préciser — la première
occasion de la suivre était la sienne, et elle ne l'a pas manquée.

---

## Tâche 5e — rendre la procédure de clôture lançable

**Exécuté le :** 2 septembre 2026 (21h20-21h37 UTC), même session. Les deux
pages relues par `wiki-get.sh` immédiatement avant écriture ; la non-dérive
de `Procédure de clôture d'un lot` vérifiée en reconstruisant le texte
d'origine à partir du texte édité (retrait programmatique des deux blocs
insérés) et en le comparant à une relecture fraîche — zéro différence.

### Étape 1 — Section « Où lancer cette procédure »

Insérée entre le paragraphe d'introduction et `== 1. Relire les échanges du
lot ==`, texte conforme mot pour mot, bloc `<pre>` inclus. Rien d'autre
touché. Même édition que l'étape 2 (voir ci-dessous) : `oldrevid` 1245 →
`newrevid` 1255, résumé `[Lot 13][Tâche 5e] Section « Où lancer cette
procédure » ajoutée, et point sur les arbitrages restés dans le dépôt
complété en section 3`.

### Étape 2 — Complément à la section 3

Paragraphe sur les arbitrages « à ne pas rejouer » du lot 10 ajouté à la
fin de la section « 3. Ranger chaque trouvaille », après le paragraphe sur
les idées écartées. Même édition que l'étape 1, pour la raison déjà
appliquée à la tâche 5c : les deux corrections touchent la même page, dans
le même mouvement, sous un même résumé qui nomme les deux.

### Étape 3 — Point ouvert du lot 13 complété

Sur `Lot 13 — Gestion des lots en classe sémantique`, la phrase sur le
lancement de la procédure ajoutée à la fin du second paragraphe des
points ouverts, sans rien remplacer. `oldrevid` 1251 → `newrevid` 1256,
résumé `[Lot 13][Tâche 5e] Points ouverts — comment la procédure de
clôture se lancera`.

### Étape 4 — Les quatre contrôles

**1. Le bloc `<pre>` n'a produit ni lien, ni modèle, ni annotation.**
`action=parse&prop=text|links|templates|categories` sur la procédure :
`links` ne retourne que les trois liens déjà présents avant cette tâche
(`Gestion des lots`, `Limites connues...`, `Notes en attente de
rangement`) ; `templates` est vide ; `categories` ne porte que
`Page_de_suivi`, inchangée. Le HTML rendu montre le bloc `<pre>` reproduit
tel quel, la seule transformation étant celle que MediaWiki applique à
toute la page — l'espace insécable avant les deux-points français
(`&#160;`) — pas une interprétation de wikitexte.

**2. `browsebysubject` sur la procédure : aucune annotation.** `_INST`,
`_MDAT`, `_SKEY` seulement.

**3. Sections dans l'ordre attendu.** `grep "^=="` après écriture :
« Où lancer cette procédure », puis les cinq sections numérotées 1 à 5,
dans le même ordre qu'avant — une seule section ajoutée, à la bonne place,
aucune renommée ni déplacée.

**4. `Lot 13` sans annotation nouvelle.** `browsebysubject` : mêmes
propriétés `Work_package_*` et mêmes clés soulignées qu'avant cette
écriture, seul `_MDAT` a changé.

### Écarts et surprises — Tâche 5e

**Aucun.** Les trois écritures sont conformes mot pour mot à la consigne,
et les quatre contrôles sont positifs sans réserve. Seule chose à noter
pour la suite, pas un écart : cette tâche a doté la procédure du mécanisme
qui permettra, à la première clôture réelle, de vérifier si elle est
suivie telle qu'écrite — jusqu'ici, elle n'a été qu'éprouvée par extraits
(tâche 5b, étape 2), jamais lancée en entier depuis une conversation.
