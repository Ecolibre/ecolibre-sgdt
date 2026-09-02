# Lot 13 — Tâche 3a bis : ajout de la date de livraison

**Exécuté le :** 2 septembre 2026 (00h20-00h30 UTC environ), session Claude
Code, compte `Cywil`. Session ouverte par `bin/wiki-login.sh` avant toute
écriture. Suite de `travaux/lot-13-tache3a-page-lot13.md`.

---

## 1. Étape 1 — `Attribut:Work package delivery date`

`action=query&prop=info` avant écriture : `"missing": true`. Créée par
`wiki-put.sh --createonly` — `pageid 513`, `newrevid 1181`, résumé
`[Lot 13][Tâche 3a bis] Création Attribut:Work package delivery date`.

**Propagation non immédiate, résolue sans réécriture.** Les deux premières
lectures par `browsebysubject` (immédiatement après l'écriture, puis après
25 secondes) ne montraient que `_CHGPRO` (la charge en attente, au format
JSON) et `_SKEY` — aucun fait direct. Conformément à la leçon de méthode de
`CLAUDE.md` (« ce n'est pas un échec de stockage »), la page n'a **pas** été
réécrite. Une relecture plus tardive (après les étapes 2 à 4 ci-dessous)
montre tous les faits attendus :

```
_TYPE -> _dat (Date)
Property_description_FR -> présente
Property_description_EN -> présente
Property_cardinality -> single
Property_domain -> Lot#14##
Property_range -> date de calendrier
```

Conforme à la consigne, sur les six points demandés.

## 2. Étape 2 — `Modèle:Lot`

Relu avant écriture (`wiki-get.sh` + `diff` contre le fichier de la tâche 2) :
**identique, aucune dérive.** Remplacé en entier par `wiki-put.sh` —
`pageid 507`, `oldrevid 1169` → `newrevid 1182`, résumé `[Lot 13][Tâche 3a
bis] Modèle:Lot — ajoute la ligne « Livré le » (Work_package_delivery_date)`.

## 3. Étape 3 — `Formulaire:Lot`

Relu avant écriture, comparé au fichier posé lors du correctif précédent :
**identique.** Remplacé en entier — `pageid 508`, `oldrevid 1172` →
`newrevid 1183`, résumé `[Lot 13][Tâche 3a bis] Formulaire:Lot — ajoute le
champ Livré le (Work_package_delivery_date)`.

## 4. Étape 4 — `Catégorie:Lot` : BLOQUÉE, non appliquée

Relue avant écriture : identique à l'état laissé par la tâche 2 (aucune
dérive). La modification demandée (phrase « livré » / « clos » distinguant
les deux dates) a été **refusée par l'API** :

```
ERREUR API: smw-change-propagation-protection — cette page est verrouillée
pendant qu'une mise à jour de propagation de changement s'exécute.
```

Confirmé par `prop=info&intestactions=edit` : `protection: []` (invisible
au contrôle natif), refus sous `actions.edit[0].code =
smw-change-propagation-protection` — même mécanisme, même code, que celui
documenté dans `demandes-adminsys.md` §2.2 sur `Attribut:INSEE code` et les
deux pages `Casc`.

**Point signalé par Cyril avant toute attente :** sur les 15 pages
`Attribut:` touchées par l'incident du 15/16 août 2026, 12 se sont
débloquées d'elles-mêmes, mais 3 (`INSEE code`, `Casc parent`, `Casc
lineage`) sont restées verrouillées durablement, sans qu'aucune attente ne
les débloque — jamais résolu à la date du dernier relevé (27 août). Rien ne
permettait de savoir, avant d'essayer, si le verrou sur `Catégorie:Lot`
(une première occurrence sur une page de catégorie, pas un cas déjà ancien)
appartenait à la première famille ou à la seconde.

**Attente plafonnée, décidée par Cyril :** script `wait_unlock.sh` montré
intégralement avant lancement (lecture seule, `intestactions=edit`, 12
essais, 10 secondes d'écart, ~2 minutes, s'arrête de lui-même). Résultat :
**verrou toujours actif après les 12 essais.** Un second contrôle isolé,
fait après que `Work package delivery date` s'est confirmée totalement
propagée (§1), montre que **les deux signaux ne sont pas liés** : la
propriété a fini de se propager, le verrou sur `Catégorie:Lot` persiste
malgré cela.

**Décision : ne pas forcer, ne pas réessayer davantage sans nouvelle
consigne.** L'écriture de l'étape 4 est reportée. Le contenu de
`Catégorie:Lot` reste donc celui de la tâche 3a (rév. 1171) — sans la
phrase distinguant les deux dates par leur propriété respective.

## 5. Étape 5 — vérifications

**1. `browsebysubject` sur `Attribut:Work package delivery date`.** Voir §1 :
conforme sur les six points, une fois la propagation terminée.

**2. Rendu de `Lot 13 — Gestion des lots en classe sémantique`.**
`action=parse` sur la page réelle. Le tableau contient bien une ligne
« Livré le » entre « Ouvert le » et « Clos le », affichant un tiret cadratin
(`—`), puisque ce lot n'est pas livré. **Écart avec la consigne, mesuré
précisément :** la consigne annonce que le tableau doit désormais montrer
« onze lignes ». Le compte réel, ligne par ligne (`<tr>` du tableau) :

```
4 lignes d'en-tête de section (Identification / Calendrier /
  Relations sortantes / Relations entrantes)
+ 12 lignes de donnée : Numéro, État, Ouvert le, Livré le, Clos le,
  Rapports, Dépend de, Recoupe, Révise, Lots qui dépendent de celui-ci,
  Lots qui le recoupent, Lots qui le révisent
= 16 <tr> au total, 12 lignes de donnée.
```

Douze lignes de donnée, pas onze. **Corrigendum sur mon propre rapport de
tâche 3a** (`lot-13-tache3a-page-lot13.md`, §4, rendu) : j'y avais compté
« dix lignes » pour le tableau *avant* l'ajout de « Livré le » — c'était
déjà faux à ce moment-là, le tableau en portait onze (les mêmes moins
« Livré le »). L'ajout d'une ligne porte donc le compte de onze à douze,
pas de dix à onze comme la consigne le laissait attendre. Aucune
conséquence fonctionnelle : la ligne demandée est bien présente, au bon
endroit, avec le bon repli.

**3. `browsebysubject` sur la page, `ns=0` — la phrase d'objet.** Confirmé :
`Work_package_summary` porte **un seul `dataitem`**, de longueur **136
caractères exactement**, texte identique à celui posé en tâche 3a. La
modification du bloc de stockage (ajout de
`Work_package_delivery_date` avant `Work_package_closure_date`, en dehors
du groupe multivalué) n'a pas fait déborder le séparateur sur la phrase
d'objet — elle reste hors de portée du premier `|+sep=,` du bloc, comme
prévu.

**4. `browsebysubject` sur `Catégorie:Lot`, `ns=14`.** Lecture (non
affectée par le verrou d'écriture) :

```
_MDAT -> 1/2026/9/1/23/45/1/0
_SKEY -> Lot
_SUBC -> SGDT#14##
```

Trois clés, toutes préfixées d'un souligné. **Aucune annotation parasite**
— état inchangé depuis la tâche 2, cohérent avec le fait que l'écriture de
l'étape 4 n'a pas abouti.

## Écarts et surprises

**1. L'étape 4 n'a pas pu être appliquée.** `Catégorie:Lot` reste verrouillée
en écriture par `smw-change-propagation-protection`, persistant au-delà
d'une attente plafonnée de deux minutes et indépendant de la propagation
complète de la propriété qui semble l'avoir déclenché. Point ouvert, à
reprendre : soit après une attente plus longue (sans garantie, voir le
précédent `INSEE code`), soit en vérifiant `$smwgChangePropagationProtection`
côté serveur (demande déjà déposée pour d'autres pages dans
`demandes-adminsys.md` §2.2), soit par une correction manuelle de Cyril.

**2. Deux comptages de lignes de tableau se sont révélés faux, dans deux
rapports différents.** La consigne de cette tâche annonçait « onze lignes »
après l'ajout ; le compte réel est douze. Mon propre rapport de la tâche
3a annonçait « dix lignes » avant l'ajout ; le compte réel était onze. Les
deux écarts pointent dans le même sens (un décalage d'une unité), sans que
cela affecte la donnée réelle — seulement le récit qui la décrit.

**3. Confirmation que deux signaux de propagation SMW sont indépendants.**
La propriété nouvellement créée a fini par propager tous ses faits
directs ; le verrou d'édition sur sa page de domaine (`Catégorie:Lot`)
n'en a pas profité. Les deux ne se lèvent pas ensemble — utile à savoir
pour la suite du lot, où d'autres propriétés seront rattachées à des
catégories déjà peuplées.

**4. Modèle et formulaire mis à jour avec succès, malgré le blocage sur la
catégorie.** Le blocage ne porte que sur la page de catégorie elle-même ;
il n'a empêché ni la création de la propriété, ni les deux remplacements
de modèle et de formulaire, ni le rendu correct de la page de lot 13 avec
sa nouvelle ligne « Livré le ».
