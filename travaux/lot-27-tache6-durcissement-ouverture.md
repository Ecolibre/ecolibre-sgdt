# Lot 27 — Tâche 6 : durcir la procédure d'ouverture après son premier essai

**Exécuté le :** 4 septembre 2026, session Claude Code, compte `Cywil`.
Une écriture wiki (`Procédure d'ouverture d'un lot`) et un commit dans le
dépôt (`methode-de-travail.md`).

Avant d'écrire sur le wiki : page relue, contenu comparé mot pour mot à
celui laissé par la tâche 5 — identique. `git status --short` avant
l'écriture dans le dépôt : trois rapports non suivis, aucun fichier
tracké modifié — état propre pour la modification de
`methode-de-travail.md`.

## Étape 1 — Le message d'ouverture

Ligne « Récupère la procédure d'ouverture et applique-la intégralement : »
remplacée par « Récupère la procédure d'ouverture et suis-la : ». Ligne
finale ajoutée après l'avertissement 403 : « Si cette commande échoue pour
une autre raison, arrête-toi et dis-le. Tu n'as pas le protocole : ne le
devine pas, ne commence rien. »

## Étape 2 — Le début de la procédure

Premier paragraphe du second bloc remplacé par les deux paragraphes
fournis : le rappel que la procédure s'adresse à l'assistant lui-même
(pas un texte à recopier), et l'instruction de trouver la page du lot par
`Catégorie:Lot` plutôt que par le numéro seul.

## Étape 3 — Le contrôle préalable

Paragraphe ajouté en fin de la section « Ce qu'il faut lire avant de
répondre » : distinction entre objet/exclusion de périmètre et idée
écartée, avec l'instruction de signaler l'un des deux manquants avant de
commencer.

Écriture faite en un seul remplacement intégral de la page (`--createonly`
non applicable, page existante). `diff` entre la version lue avant
écriture et le fichier écrit : quatre zones changées, exactement les trois
étapes du wiki plus la perte de fin de ligne finale du fichier source (non
significative). `result: Success`, `newrevid: 1262`.

## Étape 4 — `methode-de-travail.md`

Paragraphe ajouté après celui qui décrit `Ce fichier`, dans la section
« Où vit quoi », texte conforme mot pour mot à la consigne. `git diff
--stat` : `1 file changed, 2 insertions(+)` — le paragraphe et la ligne
vide qui le sépare de la section suivante. Commit `4701d4d`, résumé
`[Lot 27][Tâche 6] methode-de-travail.md — les deux pages de protocole sur
le wiki`, poussé sur `origin/main`.

## Les cinq contrôles

**1. Les deux blocs `<pre>` restent étanches.**
`action=parse&prop=links|templates` : un seul lien
(`Procédure de clôture d'un lot`, hors des blocs, `exists: true`), zéro
transclusion — identique à l'état avant cette tâche, donc aucune des trois
modifications n'a créé de lien ni de modèle.

**2. L'expression « la page « Lot N » » a disparu, l'instruction de
catégorie est présente.** Recherche littérale dans le wikitexte complet :
absente. Recherche de `Catégorie:Lot` : présente, dans la phrase « Liste
les membres de Catégorie:Lot par l'API et retiens celui dont le titre
commence par le bon numéro. »

**3. Le premier bloc porte la ligne d'arrêt.** Recherche littérale de
« Tu n'as pas le protocole : ne le devine pas, ne commence rien. » dans le
wikitexte : présente, dernière ligne du bloc « Message d'ouverture ».

**4. `git diff` sur `methode-de-travail.md` — un seul paragraphe
ajouté.** `git diff --stat` : `1 file changed, 2 insertions(+)`. Le `git
diff` complet ne montre que le nouveau paragraphe et la ligne vide qui le
sépare de la section suivante.

**5. `browsebysubject` — aucune annotation.** Trois clés seulement :
`_INST` (catégorie), `_MDAT` (date), `_SKEY` (clé de tri).

## Écarts et surprises

Aucun. Les trois modifications de la page wiki et l'ajout dans le dépôt
se sont faits du premier coup, conformes mot pour mot à la consigne, et
les cinq contrôles ont chacun tranché sans ambiguïté.
