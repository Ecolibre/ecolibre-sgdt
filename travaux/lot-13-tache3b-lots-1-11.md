# Lot 13 — Tâche 3b : les pages des lots 1 à 11

**Exécuté le :** 2 septembre 2026 (00h35-00h45 UTC environ), session Claude
Code, compte `Cywil`. Session ouverte par `bin/wiki-login.sh` avant toute
écriture. Suite de `travaux/lot-13-tache3abis-date-livraison.md`.

---

## 1. Étape 1 — les permaliens

Relu `Gestion des lots` à neuf avant d'employer quoi que ce soit (pas de
copie ancienne). SHA commun aux onze : `3a0e7af4e6b4d2e0ade4e1d645d568311e04afad`.

**Vérification de résolution :** plutôt qu'un aller-retour réseau vers
GitHub (source d'erreurs transitoires déjà documentée), chaque cible a été
vérifiée par `git cat-file -e <SHA>:travaux/<fichier>` sur le dépôt local,
après confirmation que ce SHA est bien sur `origin/main`
(`git branch -r --contains` → `origin/main`, `git log --oneline -1` →
correspond au commit de clôture du lot 10). Les treize fichiers (onze
permaliens simples + les deux permaliens supplémentaires pour les lots 4 et
6) existent tous à ce commit :

| Lot | Fichier(s) | Résolu |
|---|---|---|
| 1 | `ecolibre-sgdt-lot1.md` | ✅ |
| 2 | `ecolibre-sgdt-lot2.md` | ✅ |
| 3 | `ecolibre-sgdt-lot3.md` | ✅ |
| 4 | `ecolibre-sgdt-lot4-phase3.md` **+** `ecolibre-sgdt-lot4-rev2.md` (seul le second était déjà cité sur l'index ; le premier construit sur le même SHA) | ✅ + ✅ |
| 5 | `ecolibre-sgdt-lot5.md` | ✅ |
| 6 | `lot-6-consolide.md` **+** `lot-6-suite.md` (seul le premier était déjà cité ; le second construit sur le même SHA) | ✅ + ✅ |
| 7 | `sgdt-passation-2026-08-10.md` | ✅ |
| 8 | `lot-8-cadrage-facettes.md` | ✅ |
| 9 | `lot-9-cloture.md` | ✅ |
| 10 | `lot-10-tache7-cloture.md` | ✅ |
| 11 | `lot-11-cloture.md` | ✅ |

**Écart avec la consigne : le lot 8 figure bel et bien dans l'index.** La
consigne affirmait « le lot 8 n'apparaît pas dans mon relevé de l'index :
retrouve son permalien sur la page ». Relu directement sur `Gestion des
lots` (2 septembre 2026) : la ligne « Lot 8 — facettes de type d'item »
porte un lien `[cadrage]` vers `lot-8-cadrage-facettes.md`, sur le même
SHA que les dix autres. Employé tel quel — rien à « retrouver », il était
déjà là.

## 2. Étape 2 — les onze créations

`action=query&prop=info` avant chaque écriture : les onze titres
`"missing": true`. Onze écritures `wiki-put.sh --createonly`, toutes
`result: Success` :

| Lot | pageid | revid | Résumé |
|---|---|---|---|
| 1 | 514 | 1184 | `[Lot 13][Tâche 3b] Création Lot 1 — Corrections de schéma` |
| 2 | 515 | 1185 | `[Lot 13][Tâche 3b] Création Lot 2 — Vocabulaires et intégrité des classes` |
| 3 | 516 | 1186 | `[Lot 13][Tâche 3b] Création Lot 3 — Classes et schéma des propriétés` |
| 4 | 517 | 1187 | `[Lot 13][Tâche 3b] Création Lot 4 — Numérotation des items physiques` |
| 5 | 518 | 1188 | `[Lot 13][Tâche 3b] Création Lot 5 — Registre et fonctions multiples` |
| 6 | 519 | 1189 | `[Lot 13][Tâche 3b] Création Lot 6 — Durcissement du module de références` |
| 7 | 520 | 1190 | `[Lot 13][Tâche 3b] Création Lot 7 — Nomenclature quantifiée et entité réception` |
| 8 | 521 | 1191 | `[Lot 13][Tâche 3b] Création Lot 8 — Facettes de type d'item` |
| 9 | 522 | 1192 | `[Lot 13][Tâche 3b] Création Lot 9 — Exemplaires plantés du jardin-forêt` |
| 10 | 523 | 1193 | `[Lot 13][Tâche 3b] Création Lot 10 — Procédés et outils` |
| 11 | 524 | 1194 | `[Lot 13][Tâche 3b] Création Lot 11 — Subdivision des lieux` |

Contenu écrit conforme mot pour mot à la consigne dans les onze cas,
sections supplémentaires (`Objet`, `Ce qui est déjà tranché`, `Points
ouverts`) incluses là où la consigne les prévoyait (lots 5, 6, 7, 9, 10).

## 3. Étape 3 — les cinq contrôles

File de travaux au moment du contrôle : `jobs: 23`
(`action=query&meta=siteinfo&siprop=statistics`) — non retenu comme un
obstacle a priori ; les faits ont été lus directement.

**1. Phrase d'objet en une seule valeur, et les deux permaliens doubles en
deux valeurs.** `browsebysubject`, `ns=0`, sur les onze pages. Les onze
`Work_package_summary` portent **exactly un seul `dataitem`** chacun
(longueurs 79 à 152 caractères selon le lot). `Work_package_closure_report`
porte **deux valeurs distinctes** sur le lot 4
(`ecolibre-sgdt-lot4-phase3.md`, `ecolibre-sgdt-lot4-rev2.md`) et sur le
lot 6 (`lot-6-consolide.md`, `lot-6-suite.md`) — le séparateur multivalué
s'applique bien, sur les neuf autres lots une seule valeur est présente.

**2. Les relations du lot 7.** `Work_package_depends_on` porte
`Lot 21 — Grandeurs et unités` ; `Work_package_overlaps` porte
`Lot 12 — Contenants et étiquetage`. Les deux relations sont bien stockées.
**Écart avec la consigne, mesuré :** la consigne annonçait que « les deux
cibles n'existent pas encore, les liens seront rouges ». `action=query&
prop=info` sur les deux titres montre que **seul `Lot 21 — Grandeurs et
unités` est un lien rouge** (`"missing": true` — cohérent avec la tâche 0,
qui avait déjà identifié ce chantier comme sans page). `Lot 12 —
Contenants et étiquetage` **existe déjà** (`pageid 485`, créée le 30 août
2026, cadrage du lot 12) : ce n'est pas un lien rouge. Rien n'a été créé
pour ce point — l'instruction « ne crée pas les pages » était sans objet
pour cette cible, déjà en place avant cette tâche.

**3. Membres de `Catégorie:Lot`.** `action=query&list=categorymembers` →
**exactement douze membres** : les onze lots 1-11 plus le lot 13 (créé en
tâche 3a). Conforme.

**4. Annotations parasites.** Sur les onze pages, les seules clés
retournées par `browsebysubject` en dehors des dix propriétés attendues
sont `_INST` (`Lot#14##`) et les clés `_MDAT`/`_SKEY`/`_ASK` habituelles —
**aucune clé sans souligné en dehors des propriétés du modèle, sur aucune
des onze pages.**

**5. Rendu sans fuite de syntaxe.** `action=parse` sur `Lot 7` (8247
caractères rendus) et `Lot 9` (6275 caractères rendus), les deux pages les
plus longues (prose la plus riche). Aucun `[[`, `]]`, `{{`, `}}` littéral
dans le texte rendu des deux. `categories` ne porte que `Lot` dans les deux
cas — aucune catégorie de suivi de lien cassé. Le rendu de `Lot 7` confirme
au passage le point 2 : `links` liste `Lot 12 — Contenants et étiquetage`
avec `exists: true` et `Lot 21 — Grandeurs et unités` avec `exists: false`.

## Écarts et surprises

**1. Le lot 8 était bien dans l'index**, contrairement à ce que la consigne
affirmait — rien à retrouver, le permalien était déjà cité au bon endroit.

**2. Un seul des deux liens du lot 7 est rouge, pas les deux.**
`Lot 12 — Contenants et étiquetage` existe (cadrage du 30 août 2026, avant
même le début du lot 13) ; seul `Lot 21 — Grandeurs et unités` est
effectivement absent. La consigne présentait les deux comme également
absentes — mesuré, ce n'est vrai que pour l'une des deux. Sans conséquence :
aucune page n'a été créée pour combler ce lien, conformément à la règle
« ne crée pas les pages », qui n'avait de toute façon rien à faire ici pour
`Lot 12`.

**3. Aucune autre surprise.** Les onze créations ont toutes réussi du
premier coup, aucun verrou de propagation ne s'est manifesté sur ces onze
pages de l'espace principal (à la différence de `Catégorie:Lot` en tâche
3a bis, dont le blocage reste ouvert), et les cinq contrôles sont tous
positifs sans exception.
