# Lot 13 — Tâche 5a : consigner ce que le lot a découvert

**Exécuté le :** 2 septembre 2026 (16h26-16h29 UTC pour le wiki, 18h29 heure
locale pour le commit), session Claude Code, compte `Cywil`. Session ouverte
par `bin/wiki-login.sh` avant toute écriture. Chaque page a été relue par
`wiki-get.sh` immédiatement avant écriture ; les comparaisons avant/après
portent sur ces lectures, jamais sur une retranscription — leçon tirée de
la tâche 4, où une retranscription manuelle avait introduit un faux écart.

---

## Étape 1 — Quatre entrées aux *Limites connues*

Ajoutées à la suite de la n° 43, dans l'ordre donné, résumé
`[Lot 13][Tâche 5a] Entrées 44 à 47 — quatre faits découverts pendant le
lot`, `oldrevid` 1230 → `newrevid` 1238.

## Étape 2 — `Catégorie:Page de suivi`

`action=query&prop=info` avant écriture : `missing: true`. Créée par
`wiki-put.sh --createonly`, contenu conforme mot pour mot à la consigne,
`pageid` 538, `newrevid` 1239.

## Étape 3 — Catégorisation des quatre pages de suivi

`prop=categories` avant écriture sur les quatre : `Gestion des lots` → `[]`,
`Limites connues...` → `[]`, `Notes en attente de rangement` → `[]`,
`Récapitulatif technique...` → `['Catégorie:SGDT']` (préexistante, intacte).
`[[Catégorie:Page de suivi]]` ajoutée en fin de chacune, rien d'autre
touché :

| Page | pageid | oldrevid → newrevid |
|---|---|---|
| Gestion des lots | 484 | 1232 → 1240 |
| Limites connues du Système de Gestion de Données Techniques | 144 | 1238 → 1241 |
| Notes en attente de rangement | 496 | 1158 → 1242 |
| Récapitulatif technique du Système de Gestion de Données Techniques | 27 | 1140 → 1243 |

`Procédure de clôture d'un lot` non créée, conformément à la consigne — son
lien dans `Catégorie:Page de suivi` reste rouge jusqu'à la tâche 5b.

## Étape 4 — Page d'accueil

Ligne ajoutée à la suite du renvoi vers `Gestion des lots` (posé à la
tâche 4) : « Voir aussi la [[:Catégorie:Page de suivi]] pour les pages qui
rendent compte de ce qui est fait, découvert ou mis en attente. » Deux-points
initiaux posés pour éviter l'auto-catégorisation. `pageid` 15, `oldrevid`
1233 → `newrevid` 1244.

## Étape 5 — `CLAUDE.md`

Deux ajouts faits par édition ciblée (jamais de réécriture du fichier
entier) : la section « Pages de référence sur le wiki » avant « Outils
disponibles », et la leçon sur le repli de ligne à la suite des leçons de
méthode existantes. Commit `e4ca9ea`, résumé
`[Lot 13][Tâche 5a] CLAUDE.md — pages de référence sur le wiki, leçon sur le
repli de ligne`, poussé sur `origin/main`.

---

## Les quatre contrôles

**1. Quarante-sept entrées, les quarante-trois premières inchangées.**
`grep -c "^# "` sur la page relue après écriture : `47`. Comparaison ligne
par ligne contre le texte de la révision 1230 — la révision précédant
directement cette écriture, récupérée via
`action=query&revids=1230&prop=revisions&rvprop=content`, donc contre
l'état réel du wiki et non contre une copie retapée à la main : **zéro
différence sur les quarante-trois premières entrées.** La seule différence
relevée par le `diff` tenait à l'endroit où j'avais coupé mon extrait de
comparaison (avant le pied de page plutôt qu'après), pas à un changement de
contenu — vérifié en relisant la sortie du `diff` ligne par ligne avant de
conclure.

**2. `Catégorie:Page de suivi` — quatre membres, aucune annotation
sémantique.** `list=categorymembers` : exactement les quatre pages
attendues, aucune de plus. `browsebysubject` sur les quatre : seules les
clés internes `_ASK` (sur les deux pages portant un `#ask`),
`_INST`, `_MDAT`, `_SKEY` — aucune propriété visible en dehors de ces clés
soulignées, donc aucune annotation sémantique gagnée par cet ajout de
catégorie.

**3. Lien vers la catégorie sur la page d'accueil.** `action=parse` :
rendu confirmé comme lien HTML normal
(`<a href="/wiki/Cat%C3%A9gorie:Page_de_suivi">`), pas une catégorisation.
`parse.categories` sur la page ne retourne que `SGDT`, sa catégorie
préexistante — la page ne s'est pas catégorisée elle-même dans
`Page de suivi`.

**4. `CLAUDE.md` — les deux ajouts, rien d'autre.** `git diff CLAUDE.md`
avant le commit : deux blocs ajoutés (`+`), aucune ligne supprimée ni
modifiée. `git show --stat` sur le commit : `1 file changed, 24
insertions(+)` — aucune suppression, conforme à des ajouts purs.

---

## Écarts et surprises

**1. Aucun écart avec la consigne.** Les quatre entrées, la nouvelle page de
catégorie, les quatre catégorisations, le renvoi de la page d'accueil et les
deux ajouts à `CLAUDE.md` sont tous conformes mot pour mot, et les quatre
contrôles sont positifs sans réserve.

**2. La leçon de la tâche 4 a directement changé la méthode de cette
tâche.** Plutôt que de retaper le contenu d'origine des *Limites connues*
pour la comparaison de contrôle — ce qui avait produit un faux écart la
fois précédente — j'ai récupéré la révision précédente directement par
l'API (`action=query&revids=...&prop=revisions`). Aucune erreur de
transcription possible par construction : le texte de comparaison vient du
wiki, pas de la mémoire.

**3. `Récapitulatif technique` porte sa catégorie `SGDT` sous la forme
`[[Catégorie : SGDT]]`, avec des espaces autour du deux-points — à la
différence de toutes les autres pages du wiki, qui écrivent
`[[Catégorie:X]]` sans espace.** Sans conséquence : `prop=categories` la
retourne normalement (`Catégorie:SGDT`), MediaWiki normalise l'espace à la
résolution du lien. Relevé ici parce que c'est une incohérence de forme
préexistante, pas introduite par cette tâche, qui pourrait surprendre une
relecture future du wikitexte.
