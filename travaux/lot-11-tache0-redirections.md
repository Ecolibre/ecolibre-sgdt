# Lot 11 — tâche 0 : test des redirections

2026-08-20/21. Décide la forme des titres de lieux (décision 1.4) et vaut
pour toutes les propriétés SMW de type Page. Écritures strictement limitées
aux trois pages de test nommées ci-dessous, toutes sous
`Utilisateur:Cywil/Bac à sable/`. Aucune page de production touchée.
`createonly=1` sur chaque création.

Le renommage (étape 2) a été fait **à la main par Cyril**, hors outillage :
aucun `action=move` n'a été tenté, aucun curl POST d'écriture fabriqué,
`bin/wiki-api.sh` n'a pas été modifié — sa liste noire (qui bloque `move`
comme toute autre action d'écriture) reste telle quelle.

## Étape 0 — l'espace Utilisateur est-il sémantique ?

Créées :
- `Utilisateur:Cywil/Bac à sable/Lot11 lieu` — « Page de test lot 11 tache
  0, supprimable. »
- `Utilisateur:Cywil/Bac à sable/Lot11 item` — même ligne, plus
  `{{#set:Located_at=Utilisateur:Cywil/Bac à sable/Lot11 lieu}}`

`browsebysubject` sans filtre sur l'item (`ns=2`) :

```
Located_at -> ['Cywil/Bac_à_sable/Lot11_lieu#2##']
_MDAT -> ['1/2026/8/20/22/14/20/0']
_SKEY -> ['Cywil/Bac à sable/Lot11 item']
```

`Located_at` apparaît, avec le suffixe `#2##` (espace de noms 2 = User).
**L'espace Utilisateur est bien indexé par SMW sur ce wiki.** Le test a pu
continuer sans bascule vers l'espace principal.

## Étape 1 — référence

```
ask [[Located_at::Utilisateur:Cywil/Bac à sable/Lot11 lieu]]
```

→ 1 résultat, l'item retrouvé. `meta.hash = 5fde24aef28ec45a8e3c6fb0680dd5ac`,
`count = 1`. La requête de référence fonctionne : le test peut continuer.

## Encodage — vérification de méthode

**Cette version de l'API `action=ask` n'expose aucun champ `meta.query`**
dans sa réponse (confirmé à plusieurs reprises ci-dessous et déjà lors de
la passe de reconnaissance précédente) — seuls `hash`, `count`, `offset`,
`source`, `time` sont présents sous `meta`. Impossible donc de relire
littéralement la requête reçue par ce biais ; la vérification s'est faite
autrement : en comparant, à encodage strictement identique, une requête
dont le résultat réel est connu par un autre canal (`browsebysubject`,
requête en liste) contre sa variante à tester. C'est cette méthode qui a
permis de trancher le point ci-dessous — pas une relecture de `meta.query`,
qui n'existe pas ici.

**Sur le hash partagé : verdict.** La consigne pose que deux requêtes
différentes revenant avec le même `meta.hash` signalent un problème
d'encodage. Observé en pratique : `Q1` et `Q2` de l'étape 2 partagent
le même hash (`5fde24aef28ec45a8e3c6fb0680dd5ac`) — mais ce n'est **pas**
un problème d'encodage, c'est la conséquence attendue de la redirection
(les deux conditions se résolvent vers la même page cible, donc vers la
même requête canonique). Autre cas rencontré : `8abf92b9a496fa12811f646f040f3025`
revient sur *toutes* les requêtes à zéro résultat réel observées pendant ce
test et le précédent, quelles que soient la propriété et la valeur
demandées — ce hash est le signal canonique SMW d'un « résultat vide », pas
une preuve de mauvais encodage en soi. **Le bon test n'est jamais le hash
seul : c'est de confronter le résultat à une source indépendante
(`browsebysubject`, ou une requête en liste dont le compte réel est déjà
connu).**

**`format=count` — tranché, ce n'est pas un problème d'encodage.** Requête
utilisée deux fois, à l'octet près pour la partie condition, avec la même
chaîne encodée que la référence de l'étape 1 (donc encodage déjà prouvé
correct par l'étape 1 elle-même) :

- `[[Located_at::Utilisateur:Cywil/Bac à sable/Lot11 lieu]]` (sans format) →
  **1 résultat réel**, confirmé indépendamment par `browsebysubject` sur
  l'item à ce même instant.
- La **même** condition, octet pour octet, plus `|format=count` → `count: 0`,
  `results: []`, hash `8abf92b9a496fa12811f646f040f3025`.

Seule différence entre les deux appels : la présence de `|format=count`.
Aucune différence d'encodage n'explique un écart entre 1 et 0 sur une
condition identique et déjà validée. **`format=count` est cassé côté
`action=ask` sur cette installation (SMW 4.2.0 / SRF 4.2.1)** — pas un
artefact de la façon dont ce test encode ses requêtes. Contournement à
garder : compter la longueur de `results` sur une requête en liste, jamais
se fier à `format=count` via cette API.

## Étape 2 — avec redirection

Renommage fait à la main par Cyril : `Lot11 lieu` → `Lot11 lieu renomme`,
redirection laissée. Purge de l'item par `bin/wiki-purge.sh`, puis attente
de `jobs=0` (`siprop=statistics`) avant mesure — la file est passée de 5 à 0
en un peu moins d'une minute.

**Q1** — `ask [[Located_at::...Lot11 lieu renomme]]`
→ **1 résultat**, l'item retrouvé. `hash = 5fde24aef28ec45a8e3c6fb0680dd5ac`.

**Q2** — `ask [[Located_at::...Lot11 lieu]]` (ancien nom)
→ **1 résultat**, l'item retrouvé. **Même hash** `5fde24aef28ec45a8e3c6fb0680dd5ac`.

**Q3** — `browsebysubject` sur l'item, sans filtre :
```
Located_at -> ['Cywil/Bac_à_sable/Lot11_lieu_renomme#2##']
_MDAT -> ['1/2026/8/20/22/14/20/0']
_SKEY -> ['Cywil/Bac à sable/Lot11 item']
```
Le littéral stocké porte le **nouveau** nom (`..._renomme`), alors que le
wikitexte de la page item n'a jamais été modifié depuis sa création (il
contient toujours `Located_at=Utilisateur:Cywil/Bac à sable/Lot11 lieu`,
l'ancien nom) — c'est bien le passage par la redirection, au moment du
reparse déclenché par la purge, qui a réécrit l'annotation stockée.

## Étape 3 — sans redirection

Contenu de `Utilisateur:Cywil/Bac à sable/Lot11 lieu` remplacé (édition
normale, sans `--createonly`) par une ligne de texte sans `#REDIRECTION`.
Purge de l'item, attente de `jobs=0` — la file est restée bloquée à 4
pendant plus de deux minutes avant de retomber à 0 sans action
supplémentaire de ma part (aucun script `runJobs.php` lancé : hors
périmètre de cet outillage, coté serveur). Mesuré une seule fois, après
confirmation du retour à 0.

**Q1** — `ask [[Located_at::...Lot11 lieu renomme]]`
→ **0 résultat**. `results: []`, hash `8abf92b9a496fa12811f646f040f3025`.

**Q2** — `ask [[Located_at::...Lot11 lieu]]` (ancien nom)
→ **1 résultat**, l'item retrouvé. `hash = 5fde24aef28ec45a8e3c6fb0680dd5ac`
(même hash qu'à l'étape 2 — cohérent, c'est la même page qui est retrouvée).

**Q3** — `browsebysubject` sur l'item, sans filtre :
```
Located_at -> ['Cywil/Bac_à_sable/Lot11_lieu#2##']
_MDAT -> ['1/2026/8/20/22/14/20/0']
_SKEY -> ['Cywil/Bac à sable/Lot11 item']
```
Le littéral stocké est resté sur l'**ancien** nom (`Lot11_lieu`, sans
`_renomme`) — pas de réécriture cette fois, cohérent avec l'absence de
redirection à résoudre.

## Les six mesures, résumées

| | Q1 (nom renommé) | Q2 (ancien nom) | Q3 (littéral stocké) |
|---|---|---|---|
| Étape 2 — avec redirection | 1 résultat | 1 résultat | `..._renomme` |
| Étape 3 — sans redirection | 0 résultat | 1 résultat | `Lot11_lieu` (ancien) |

Aucune conclusion tirée au-delà de ce tableau, conformément à la consigne.

## Nettoyage

Aucun outil de suppression n'existe dans ce dépôt (`bin/wiki-api.sh`
blackliste `delete` comme toute action d'écriture ; aucun script dédié).
Blanchiment fait à la place, par `bin/wiki-put.sh` sans `--createonly`, sur
les trois pages. Un contenu strictement vide a été refusé par l'API
(`missingparam` — MediaWiki exige au moins `text` non absent, un fichier de
zéro octet ne passe pas le paramètre) ; un seul espace a été utilisé comme
contenu minimal.

Ce qui reste, sous ces titres exacts, chacune à un seul espace comme
contenu :
- `Utilisateur:Cywil/Bac à sable/Lot11 lieu` (pageid 419, revid 830)
- `Utilisateur:Cywil/Bac à sable/Lot11 lieu renomme` (pageid 417, revid 831)
- `Utilisateur:Cywil/Bac à sable/Lot11 item` (pageid 418, revid 832)

Trois pages, trois titres, aucune supprimée — seulement blanchies. À
supprimer pour de bon par Cyril si souhaité (droit `delete` hors de portée
de cet outillage).

**Aucune référence Base36 consommée.** Aucune des écritures de ce test n'a
transclu `Modèle:Physical item`, `Formulaire:Physical item`, ni invoqué
`{{#invoke:Base36|next|...}}` — les pages de test portent uniquement un
`#set` direct écrit à la main, jamais passées par le formulaire ni par le
compteur.
