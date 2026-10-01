# Lot 33 — Tâche 3 : clôture

## Contexte

Suite de `travaux/lot-33-tache1-pages-produites.md`. La procédure de
clôture avait déjà été appliquée au lot 33 dans la conversation qui l'a
mené ; cette tâche exécute les quatre consignes qui en découlaient : compléter
les points ouverts, supprimer la duplication des permaliens sur les pages de
lot clos, consigner le principe dans les *Limites connues*, puis clore le
lot 33 lui-même.

## Écart constaté sur la prémisse de l'étape 2

La consigne affirmait que la duplication des permaliens était « au moins »
sur les lots 13, 27 et 28. Avant toute écriture, une recherche large par
motif de titre (`==.*[Rr]apport.*==`) sur le wikitexte complet des 33 pages
de lot — pas une relecture de mémoire — a montré que seules **trois** pages
portent une section `== Rapports ==` : 12, 13, 27. Le lot 28 n'en a aucune —
dix permaliens en propriété, zéro en section, donc rien à y dupliquer. Le
lot 12 en porte une, mais ce n'est pas une duplication : son statut est
`cadré` (non clos), sa section ne contient que le texte d'attente « À
remplir à la clôture », sa propriété `Work_package_closure_report` est vide.
Section et propriété étaient déjà égales en nombre (0 = 0).

Point soumis à Cyril avant d'écrire : garder la suppression au seul
périmètre réel de duplication (13, 27) ou l'étendre au gabarit vide du
lot 12. Réponse : étendre — la section est retirée aussi sur le lot 12, par
cohérence avec le principe consigné en étape 3 (une page ne réécrit pas en
prose ce qu'un modèle affiche), indépendamment du fait qu'elle soit vide
aujourd'hui.

## Étape 1 — Points ouverts complétés

Les trois paragraphes demandés ajoutés à la suite du point ouvert existant
sur `Lot 33 — Ce qu'un lot produit` (revid 1360) : les sept pages non
rattachables, les quatre lots hors de portée de la méthode (1, 2, 5, 7), et
la note sur l'absence de production propre du lot 33.

## Étape 2 — Suppression de la duplication des permaliens

Trois pages écrites, chacune revérifiée par `bin/wiki-verify.sh` après
écriture (contenu identique au fichier envoyé) :

| Page | Section avant | Propriété avant | Section après | Revid |
|---|---|---|---|---|
| Lot 12 — Contenants et étiquetage | vide (gabarit) | 0 valeur | supprimée | 1361 |
| Lot 13 — Gestion des lots en classe sémantique | 10 permaliens | 10 valeurs | supprimée | 1362 |
| Lot 27 — Conduite du projet | 5 permaliens | 5 valeurs | supprimée | 1363 |

Avant chaque suppression, vérifié que la propriété portait déjà les mêmes
adresses que la section, en nombre et en valeur — c'était le cas partout,
aucun ajout préalable n'a été nécessaire.

## Étape 3 — Principe consigné

Entrée ajoutée en fin des *Limites connues du Système de Gestion de Données
Techniques* par `bin/wiki-append.sh` (revid 1364, 52 → 53 entrées) : une
donnée affichée par un modèle ne se recopie pas en prose sur la même page.
Pré-contrôle, post-contrôle wikitexte et post-contrôle de rendu du script
tous passés sans avertissement. `browsebysubject` sur la page après
écriture ne montre que `_INST`, `_MDAT`, `_SKEY` — aucune annotation
parasite.

## Étape 4 — Clôture du lot 33

`Lot 33 — Ce qu'un lot produit` (revid 1365) : `Work_package_status` passé
à `clos`, `Work_package_delivery_date` et `Work_package_closure_date` à
`2026-09-11`, `Work_package_closure_report` renseigné avec le permalien de
`travaux/lot-33-tache1-pages-produites.md` construit sur le SHA
`d4bd8ce153e174f22db80ac4a0dc20b4934db357` — SHA du dernier commit au moment
de l'écriture, déjà présent sur `origin/main`, URL vérifiée par `curl` en
amont (code 200). Aucune section `== Rapports ==` ajoutée, conformément à ce
que l'étape 2 retire ailleurs.

## Les cinq contrôles

**1. `browsebysubject` sur le lot 33.** État `clos`, trois dates
(`Work_package_opening_date` 2026-09-10, `Work_package_delivery_date` et
`Work_package_closure_date` 2026-09-11), un seul permalien dans
`Work_package_closure_report`, phrase d'objet en une seule valeur. Conforme.

**2. Division par deux des permaliens, propriété inchangée.** Mesuré avec un
script dédié (`count_perma.py`, compte les occurrences `https://….md` dans
le wikitexte, indépendamment de leur forme — propriété ou lien de section) :

| Page | Occurrences .md avant | Occurrences .md après | Section présente après |
|---|---|---|---|
| Lot 12 | 0 | 0 | non |
| Lot 13 | 20 | 10 | non |
| Lot 27 | 10 | 5 | non |

Lots 13 et 27 : division par deux exacte. Lot 12 : 0 des deux côtés, cohérent
avec l'absence de donnée à dupliquer. `Work_package_closure_report` relu par
`browsebysubject` après coup : 10 valeurs sur le lot 13, 5 sur le lot 27,
identiques en nombre et en valeur à ce qu'elles étaient avant la
suppression. Conforme.

**3. Rendu du lot 27.** `action=parse`, extraction des liens `.md` dans le
HTML produit : cinq permaliens, chacun une seule fois. Conforme.

**4. Compte de `Gestion des lots`.** Page purgée avant lecture. Rendu :
« Lots au total : 33 », « En cours : 1 » (lot 24 — Adminsys autonome),
« Abandonnés : 0 ». Le compte « Faits » agrège `livré` et `clos` (14) ; la
consigne demandait spécifiquement le nombre de lots `clos`, vérifié par une
requête `ask` séparée filtrée sur ce seul statut : 4 — les lots 13, 27, 28 et
33. Conforme.

**5. Catégories parasites.** `prop=categories` sur les cinq pages touchées
(lots 33, 12, 13, 27, et *Limites connues*) : chacune ne porte que sa
catégorie attendue (`Catégorie:Lot` pour les quatre pages de lot,
`Catégorie:Page de suivi` pour les *Limites connues*). Conforme.

## Écarts et surprises

- **La prémisse de l'étape 2 était fausse pour un tiers des pages citées.**
  Le lot 28 n'a jamais porté de section `== Rapports ==` — seule sa
  propriété existe. Une recherche par motif sur les 33 pages, faite avant
  d'écrire quoi que ce soit, l'a montré ; une exécution qui serait partie de
  la liste « 13, 27, 28 » sans vérifier aurait tenté une suppression sur une
  page qui n'avait rien à retirer.
- **Le lot 12 n'était pas dans la situation décrite par la consigne.**
  Statut `cadré`, pas clos ; section vide, pas de duplication réelle. Soumis
  à arbitrage avant d'écrire plutôt que tranché par défaut dans un sens ou
  l'autre — la consigne elle-même rappelait qu'une mesure doit mesurer ce
  qu'on croit.
- **Le total « Faits » de `Gestion des lots` (14) n'est pas le nombre de
  lots clos.** Il agrège `livré` et `clos`, comme documenté sur la page
  elle-même (« Un lot livré a vu son travail fait. Un lot clos a vu, en
  plus, sa relecture. »). Le contrôle 4 demandait spécifiquement le compte
  des clos ; lire « Faits » seul aurait rendu un faux résultat (14 au lieu
  de 4).
- Les trois comptes affichés dans le compte rendu terminal du dépôt
  (`pages/`) ne sont pas publiés ailleurs que dans ce rapport et le dépôt :
  conforme à la règle du projet, les fichiers destinés à être écrits sur le
  wiki vivent dans `pages/`, pas ailleurs.
