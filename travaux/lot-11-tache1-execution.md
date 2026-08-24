# Lot 11 — tâche 1 : exécution (création des cinq propriétés)

2026-08-21. Suite de `travaux/lot-11-tache1-proposition-v2.md`, validée
avec deux corrections. Écritures effectuées, détaillées ci-dessous.

## Corrections appliquées avant écriture

1. **`Attribut:Location site`** — troisième phrase coupée des deux
   descriptions (règle sur les wikis partenaires, renvoyée à la
   documentation, tâche 7). Les deux premières phrases seules ont été
   écrites.
2. **Backticks retirés autour de `LOC`** dans les descriptions et dans le
   texte ajouté au Registre — ce n'est pas du wikitexte. **`<em>` remplacé
   par `''…''`** dans la ligne du tableau du Registre.

## Correction sur le périmètre de la leçon (passage 1 de la tâche 1)

Confirmé : ce n'est pas le *changement* de type qui piège, c'est l'écart
entre création de la propriété et propagation — des propriétés **neuves**
sont concernées, comme le montre le passage 1 de la section 1 de la v2 (une
propriété fraîchement créée, jamais utilisée avant, voyait déjà ses faits
posés avant propagation atterrir sous le type par défaut). Appliqué dans
cette exécution : vérification `_TYPE` par fait direct sur les cinq pages
avant toute autre étape (étape 4 ci-dessous), pas seulement en cas de
changement de type sur une propriété existante.

## Étape 1 — lecture avant écriture

Les cinq pages `Attribut:` vérifiées absentes avant toute écriture :
`Attribut:Location number`, `Attribut:Location site`,
`Attribut:Location type`, `Attribut:INSEE code`,
`Attribut:Location lineage` — toutes en erreur « la page n'existe pas ».
Aucune n'existait : pas d'arrêt nécessaire à cette étape.

## Étape 2 — réservation de LOC

`Registre des préfixes de site` relu avant écriture (`prop=info` :
`protection: []`, pas de protection native). Diff appliqué :

```diff
 | ECL || Ecolibre || wiki.ecolibre.org || wiki.ecolibre.org
+|-
+| LOC || ''réservé — lieux publics, non attribuable à un partenaire'' || wiki.ecolibre.org || wiki.ecolibre.org
 |}

+LOC n'est pas le code d'une organisation : il identifie les lieux publiés
+sur wiki.ecolibre.org, sur le même principe de réservation que les codes
+ci-dessus (jamais réattribué, même après fermeture d'un wiki). Un site
+partenaire créant des lieux privés utilise son propre code d'organisation,
+pas LOC.
+
 [[Category:Documentation SGDT]]
```

Écrit — résumé `[Lot 11][Tâche 1] Réservation du code LOC — lieux publics,
non attribuable à un partenaire` (revid 838). **Relu après écriture** : le
contenu retourné par `wiki-get.sh` correspond exactement au fichier
envoyé, ligne pour ligne.

## Étape 3 — création des cinq propriétés

Une par une, dans l'ordre demandé, `createonly=1`, résumé
`[Lot 11][Tâche 1]` :

| Propriété | Résultat | pageid | revid |
|---|---|---|---|
| Location number | Success | 425 | 839 |
| Location site | Success | 426 | 840 |
| Location type | Success | 427 | 841 |
| INSEE code | Success | 428 | 842 |
| Location lineage | Success | 429 | 843 |

Les cinq créations ont réussi — aucun arrêt nécessaire à cette étape.

**Défaut découvert après coup, hors périmètre de l'étape 3 mais à
signaler ici** : `Attribut:INSEE code` porte un fait `_ERRC` et son
`Property_range` est **absent** de `browsebysubject` alors qu'il a bien
été envoyé dans le wikitexte. Rendu HTML de la page :
« *Le mot-clé dépasse la valeur maximale de 85 caractères.* » — la valeur
envoyée (« code INSEE commune, 5 caractères — chiffres, zéro initial
possible, ou 2A/2B pour la Corse », ~90 caractères) dépasse la limite du
type `Keyword` dont `Property_range` est lui-même typé sur ce wiki.
**Échec silencieux à l'écriture** : `wiki-put.sh` a renvoyé `Success`
(la page s'enregistre, le wikitexte est bien celui envoyé), seul le
traitement SMW de l'annotation a échoué, sans remonter d'erreur à
l'appelant. Value raccourcie proposée : « code INSEE commune, 5
caractères — 0 initial possible, 2A/2B Corse » (66 caractères). **Trois
tentatives d'écriture de la correction, trois refus identiques** :
`smw-change-propagation-protection` — la page est verrouillée pendant que
sa propre propagation de changement (le `Has type::Keyword` posé à la
création) se termine. Constaté y compris à `jobs=0` au moment de la
tentative : ce verrou par page n'est pas synchronisé avec le compteur
global de la file. **Correction non appliquée, à refaire** : le
wikitexte corrigé est prêt (`Property_range` raccourci ci-dessus,
même reste du contenu inchangé), il suffira de relancer le même
`wiki-put.sh` (pas de `--createonly`, la page existe) une fois le
verrou levé.

## Étape 4 — vérification (la partie qui compte)

`bin/wiki-wait-jobs.sh` : file bloquée à 18 travaux sur trois
invocations consécutives (« FILE FIGÉE »), y compris après des lectures
supplémentaires des cinq pages. Puis, sans action de ma part entre-temps,
la file est passée à 0 (constatée juste avant la première tentative de
correction ci-dessus) — pas de mécanisme identifié de mon côté pour la
faire drainer à la demande ; `jobs=0` confirmé une seconde fois en fin de
session.

`browsebysubject` **sans filtre** sur chacune des cinq pages, relevé une
dernière fois à `jobs=0` :

| Propriété | `_TYPE` | Fait direct ou `_CHGPRO` seul |
|---|---|---|
| Location number | `…swivt/1.0#_keyw` | **fait direct** |
| Location site | `…swivt/1.0#_keyw` | **fait direct** |
| Location type | `…swivt/1.0#_keyw` | **fait direct** |
| INSEE code | `…swivt/1.0#_keyw` | **fait direct** |
| Location lineage | `…swivt/1.0#_wpg` | **fait direct** |

**Aucune des cinq ne reste en `_CHGPRO` seul.** Contrairement à l'issue
observée en section 1 de la v2 (propriétés de test, propagation
incomplète au premier passage), les cinq `_TYPE` de cette tâche sont
apparus en fait direct dès la première lecture après création — y compris
pendant que le compteur global de jobs affichait encore 18 (« figé »).
Le compteur global de jobs et la propagation `_TYPE` d'une propriété
individuelle ne sont donc pas le même signal : le second peut être acquis
avant que le premier tombe à zéro.

**Conclusion explicite demandée** : la condition d'arrêt de Cyril
(« tant qu'une seule reste en `_CHGPRO`, aucun lieu ne doit être créé »)
**n'est pas déclenchée** — les cinq propriétés sont typées et prêtes côté
`_TYPE`. Cela ne lève pas pour autant le blocage séparé sur
`Attribut:INSEE code` (`Property_range` manquant, correction en attente
du déverrouillage de la page, ci-dessus) : cette propriété fonctionne pour
le typage et le stockage de valeurs, mais sa documentation `Property_range`
reste à corriger avant que la tâche 1 soit complètement close.

**Aucun lieu créé.** `Module:Base36`, `Formulaire:Physical item` et
`Modèle:Lieu` non touchés, conformément à la consigne.
