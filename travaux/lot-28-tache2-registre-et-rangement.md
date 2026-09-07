# Lot 28 — Tâche 2 : périmètre du registre des préfixes, et rangement des rapports

**Exécuté le :** 7 septembre 2026, session Claude Code, compte `Cywil`.
Une écriture wiki (`Registre des préfixes de site`), deux renommages de
rapports, un ajout à `methode-de-travail.md`, trois commits, un push.

## Révision du registre

Avant : `lastrevid: 838` (confirmé par `action=query&prop=info|revisions`
avant écriture — valeur exigée par la consigne, qui imposait l'arrêt sinon).
Après : `newrevid: 1304`.

## Les cinq vérifications

**1. Wikitexte relu et comparé.** `bin/wiki-get.sh` après écriture, comparé
par `diff` au fichier envoyé à `wiki-put.sh` : **aucun écart**, code de
sortie 0. Le texte fourni est stocké caractère pour caractère.

**2. Rendu du tableau — la vérification qui tranche.**
`action=parse&prop=text` : le rendu contient **un seul `<table>`**, portant
**5 `<tr>` au total : 1 ligne d'en-tête et 4 lignes de données**. Contenu
des quatre lignes lu dans le HTML :
```
['ADD', 'Atelier du Dôme', 'add.ecolibre.org', 'wiki.ecolibre.org']
['CWL', 'CWL Optéos', 'cwl.ecolibre.org', 'wiki.ecolibre.org']
['ECL', 'Ecolibre', 'wiki.ecolibre.org', 'wiki.ecolibre.org']
['LOC', 'réservé — lieux publics, non attribuable à un partenaire', 'wiki.ecolibre.org', 'wiki.ecolibre.org']
```
Le paragraphe ajouté est bien rendu (« Périmètre de ce registre » présent
dans le HTML) et bien **avant** le tableau : position 572 dans le HTML,
contre 1119 pour l'ouverture de `<table>`. La syntaxe du tableau n'a pas
été absorbée par l'insertion.

**3. Lien vers le lot 28.** Un seul lien vers la page trouvé dans le rendu :
```
<a href="/wiki/Lot_28_%E2%80%94_%C3%89change_de_donn%C3%A9es_avec_un_partenaire" title="Lot 28 — Échange de données avec un partenaire">
```
Pas de `class="new"` : le lien est bleu, la cible existe.

**4. Catégories.** `action=parse&prop=categories` : une seule,
`Documentation_SGDT`. Aucune catégorie de suivi ajoutée, aucune catégorie
de liens brisés.

**5. Dépôt.** `git log --oneline -3` :
```
f8c9e90 [Lot 28][Tâche 2] methode-de-travail.md — ce qui n'est pas poussé est invisible à l'architecte
4be0de0 [Lot 28][Tâche 2] travaux/ — rapports du lot 28 renommés et versionnés
456a1ec [Lot 28][Tâche 1] Rapport — ouverture du lot 28
```
Deux commits neufs au-dessus de celui de la tâche 1. `git status --short`
après coup : neuf lignes `??`, aucune ligne `M`/`A`/`D`/`R` résiduelle.

## Les deux renommages

**`travaux/lot-28-tache1-ouverture.md` → `travaux/lot-28-creation-page.md`**,
par `mv` (le fichier n'était pas suivi). Puis note de renommage insérée
au-dessus de sa première ligne, suivie d'une ligne vide.

**`travaux/lot-28-tache1-ouverture-corrections.md` →
`travaux/lot-28-tache1-ouverture.md`**, par `git mv` (fichier suivi). Git a
enregistré l'opération comme un renommage à **100 % de similarité**
(`rename travaux/{lot-28-tache1-ouverture-corrections.md => lot-28-tache1-ouverture.md} (100%)`),
donc sans aucune altération du contenu.

**Corps du rapport du 4 septembre : inchangé.** Contrôle par le compte de
lignes et les bornes du fichier : 65 lignes après opération, soit les
58 lignes du corps d'origine plus les 7 lignes de la note (6 lignes de
citation + 1 ligne vide) — cohérent avec les 65 insertions comptées par git
pour ce fichier nouvellement versionné. La ligne 8 est bien le titre
d'origine (« # Lot 28 — Ouverture : ce qu'on attend d'un partenaire ») et la
dernière ligne est bien la fin d'origine (« d'attendre la prochaine
régénération naturelle du cache. »).

## Inventaire des fichiers non suivis de `travaux/`

Relevé à l'étape 1, avant toute opération : **dix** fichiers non suivis.
Après cette tâche il en reste **neuf**, le dixième
(`lot-28-tache1-ouverture.md`, du 4 septembre) ayant été renommé en
`lot-28-creation-page.md` puis versionné par le commit 1. Les neuf
ci-dessous n'ont été ni commités, ni déplacés, ni modifiés — seulement lus.

| Chemin | Taille | Dernière modification | Première ligne non vide |
|---|---|---|---|
| `travaux/lot-27-tache2-protocole.md` | 9127 o | 2026-09-03 23:54 | # Lot 27 — Tâche 2 : le protocole de travail |
| `travaux/lot-27-tache4-procedure-ouverture.md` | 5527 o | 2026-09-04 12:18 | # Lot 27 — Tâche 4 : la procédure d'ouverture d'un lot |
| `travaux/lot-27-tache6-durcissement-ouverture.md` | 3836 o | 2026-09-04 18:52 | # Lot 27 — Tâche 6 : durcir la procédure d'ouverture après son premier essai |
| `travaux/rangs-separateur.md` | 4570 o | 2026-09-07 01:26 | # Rangs de plantation en erreur — 4-6 septembre 2026 |
| `travaux/rangs-correction.md` | 5864 o | 2026-09-07 02:08 | # Correction des rangs de plantation — 6 septembre 2026 |
| `travaux/helianthi-insee.md` | 2784 o | 2026-09-07 02:09 | # Helianthi et Attribut:INSEE code — 7 septembre 2026 |
| `travaux/wanted-by-etat.md` | 5350 o | 2026-09-07 02:16 | # Wanted_by — relevé avant décision, 7 septembre 2026 |
| `travaux/notes-fusion.md` | 3759 o | 2026-09-07 12:25 | # Fusion des notes PAIR / concept de projet / Wanted_by — 7 septembre 2026 |
| `travaux/remise-a-niveau-6-septembre.md` | 27146 o | 2026-09-07 12:25 | # Remise à niveau — 9 jours d'absence (29 août → 7 septembre 2026) |

Trois d'entre eux (`lot-27-tache2`, `lot-27-tache4`, `lot-27-tache6`) sont
antérieurs à cette conversation et relèvent du lot 27. Les six autres sont
les rapports des tâches menées dans cette conversation les 6 et 7 septembre,
tous restés hors de git faute de consigne de commit.

**`methode-de-travail.md` a été modifié depuis la conversation du lot 28**
(commit `f8c9e90`, ajout d'un paragraphe en fin de section « Limites de
l'outillage, mesurées »), alors que ce fichier est le livrable du lot 27 :
la conversation qui mène le lot 27 doit le savoir maintenant plutôt que de
le découvrir à sa clôture.

## Écarts et surprises

**Le contexte dit « hier » là où la mesure dit « aujourd'hui ».** La
consigne présente le rapport de l'ouverture comme « écrit hier », et
l'étape 6 annonce un commit de la tâche 1 « commité hier mais n'ayant pas
quitté la machine ». La mesure contredit ce point : `git log` date le commit
`456a1ec` du **lundi 7 septembre 2026 à 12:38:30 +0200**, soit le jour même,
environ sept heures avant cette tâche — et non la veille. Le fait qui porte
la consigne reste vrai (ce commit n'avait pas été poussé), seule sa datation
est fausse. Conformément à la règle, je le signale sans l'ajuster : aucun
des textes fournis ne contenait le mot « hier », la note insérée dans
`lot-28-creation-page.md` dit bien « le 7 septembre », et rien n'a donc été
écrit de faux sur le wiki ni dans le dépôt.

**Nuance sur la vérification 5 telle qu'elle est formulée.** La consigne
attend « la liste des non-suivis inchangée [...] à l'exception des deux
fichiers renommés ». En réalité un seul des deux renommages touche cette
liste : `lot-28-tache1-ouverture.md` en sort (renommé puis versionné), tandis
que `lot-28-tache1-ouverture-corrections.md` était déjà suivi et n'y figurait
pas. La liste passe donc de dix à neuf entrées, pas de dix à huit.

Rien d'autre. Les autres affirmations du contexte se sont vérifiées à la
lecture : le registre était bien à la révision 838, il portait bien les deux
phrases citées sur l'unicité des codes et l'enregistrement préalable, et
`lot-28-tache1-ouverture.md` était bien le rapport du 4 septembre documentant
la création de la page alors que le lot était encore à l'état « identifié ».
