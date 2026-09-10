# Lot 27 — Tâche 4 : la procédure d'ouverture d'un lot

**Exécuté le :** 4 septembre 2026, session Claude Code, compte `Cywil`.
Trois écritures wiki.

## Étape 1 — Création de `Procédure d'ouverture d'un lot`

`action=query&titles=` avant écriture : `missing: true`, confirmé. Page
créée avec `--createonly`, contenu conforme mot pour mot à la consigne,
bloc `<pre>` inclus tel quel. `result: Success`, `new: true`,
`pageid: 542`, `newrevid: 1258`.

## Étape 2 — Renvoi depuis la clôture

`Procédure de clôture d'un lot` relue deux fois avant écriture (deux
appels `wiki-get.sh` séparés par la création de l'étape 1, comparés par
`diff` : identiques — pas de modification entre-temps). Une seule phrase
ajoutée en fin du premier paragraphe : « Le pendant de cette page est la
[[Procédure d'ouverture d'un lot]], qui se lance à l'ouverture du lot. »
`diff` avant/après confirme qu'aucune autre ligne n'a bougé. `result:
Success`, `newrevid: 1259`.

## Étape 3 — Renvoi depuis la catégorie

`Catégorie:Page de suivi` relue avant écriture. Ligne « Comment un lot se
clôt » remplacée par « Comment un lot s'ouvre et se clôt » avec les deux
liens, conforme mot pour mot à la consigne. `diff` avant/après confirme
qu'une seule ligne a changé. `result: Success`, `newrevid: 1260`.

## Les quatre contrôles

**1. Le bloc `<pre>` n'a rien produit à l'intérieur.**
`action=parse&prop=links|templates` sur la page neuve : un seul lien
(`Procédure de clôture d'un lot`, hors du bloc, `exists: true`), zéro
transclusion. Relecture du HTML rendu : le bloc apparaît en texte
préformaté intégral, `##` de titres markdown, la commande `curl`, l'URL
`https://wiki.ecolibre.org/...` et les deux occurrences de `[[` du texte
à coller (absentes ici — le texte collé ne contient pas de `[[`) rendues
telles quelles, sans devenir lien, modèle ou titre de section wiki.

**2. `browsebysubject` — aucune annotation sémantique.** Trois clés
seulement : `_INST` (appartenance à la catégorie), `_MDAT` (date de
modification), `_SKEY` (clé de tri). Aucune propriété métier, aucune
trace du contenu du bloc collé.

**3. `Catégorie:Page de suivi` compte six membres.**
`Gestion des lots`, `Limites connues…`, `Notes en attente de rangement`,
`Procédure d'ouverture d'un lot`, `Procédure de clôture d'un lot`,
`Récapitulatif technique…` — six, conforme.

**4. Les deux renvois sont des liens résolus.** `action=parse&prop=links`
sur `Procédure de clôture d'un lot` : `Procédure d'ouverture d'un lot`
avec `exists: true`. Sur `Catégorie:Page de suivi` : les deux procédures
apparaissent, toutes deux `exists: true`. Aucun lien rouge.

## Écarts et surprises

Aucun. Les trois écritures se sont faites du premier coup, les diffs
avant/après ne montrent que la ligne ou la phrase attendue, et le bloc
`<pre>` a protégé l'intégralité de son contenu — y compris le `##` en
tête de section et l'URL avec paramètres — sans qu'aucune purge ni
contrôle supplémentaire n'ait été nécessaire.

---

## Tâche 5 : réduire le message d'ouverture à trois lignes

**Exécuté le :** 4 septembre 2026, session Claude Code, compte `Cywil`.
Une écriture wiki : remplacement intégral de `Procédure d'ouverture d'un
lot`.

Avant d'écrire : page relue, contenu comparé mot pour mot à celui laissé
par la tâche 4 — identique. Répertoire du dépôt propre au moment de
l'écriture wiki (aucune vérification git n'était requise par cette tâche,
qui ne touche pas le dépôt).

Contenu remplacé en entier par le texte fourni : un message d'ouverture
court à coller (bloc `<pre>` de trois lignes utiles, avec les deux
avertissements réseau), et une procédure longue récupérable séparément
(second bloc `<pre>`), qui ne porte plus le numéro du lot qu'à titre de
placeholder générique (« Lot N »). `result: Success`, `newrevid: 1261`.

## Les cinq contrôles

**1. Les deux blocs `<pre>` sont étanches.** `action=parse&prop=links|
templates` : un seul lien (`Procédure de clôture d'un lot`, hors des
blocs, `exists: true`), zéro transclusion. Relecture du HTML rendu :
les deux blocs apparaissent intégralement en texte préformaté — `##`,
`curl -s -G`, les guillemets et l'URL de l'API rendus tels quels, sans
devenir lien, modèle ou titre.

**2. Le texte long ne contient plus le numéro du lot.** Recherche de
l'expression littérale « lot N » / « Lot N » (le placeholder, pas un
numéro réel) dans le wikitexte complet de la page : une seule occurrence,
dans la phrase « il désigne une page du wiki intitulée « Lot N — … » » de
la section Procédure — exactement la mention qui explique où trouver le
numéro réel, conforme à l'attendu.

**3. Le message d'ouverture porte « Lot 28 » une seule fois.** Recherche
de l'expression exacte « Lot 28 » dans le wikitexte : une occurrence,
en première ligne du bloc « Message d'ouverture ».

**4. `browsebysubject` — aucune annotation sémantique.** Trois clés
seulement : `_INST` (catégorie), `_MDAT` (date), `_SKEY` (clé de tri).

**5. `Catégorie:Page de suivi` compte toujours six membres.** Inchangé
depuis la tâche 4 : cette tâche ne crée ni ne supprime de page.

## Écarts et surprises

Aucun. Le remplacement s'est fait du premier coup, les deux blocs
préformatés ont protégé leur contenu intégralement, et le seul reliquat
du numéro de lot dans le texte long est le placeholder générique attendu
par la consigne, pas un numéro réel.
