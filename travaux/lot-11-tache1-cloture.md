# Lot 11 — tâche 1 : clôture

2026-08-21. Suite de `travaux/lot-11-tache1-execution.md`. Deux défauts
ouverts à cette entrée, traités dans l'ordre demandé.

## 1. Audit des erreurs SMW — pas seulement les nôtres

Pas de page spéciale « ProcessingErrorList » atteignable en lecture par
les scripts existants (`wiki-get.sh` ne gère que le wikitexte d'une page
de contenu). Liste complète obtenue autrement, en lisant directement la
propriété spéciale qui porte les erreurs de traitement :
`action=ask&query=[[_ERRC::+]]|limit=500`.

**9 pages en erreur, toutes wiki confondu, pas seulement les cinq de
cette tâche.**

### 6 pages — même cause : `Property_range` (`Keyword`, plafond 85
caractères) dépassé

| Page | Longueur envoyée | Dépassement |
|---|---|---|
| Attribut:Edible parts | 99 | +14 |
| Attribut:INSEE code | 90 | +5 |
| Attribut:Plant habit | 91 | +6 |
| Attribut:Propagation method | 95 | +10 |
| Attribut:Root system | 97 | +12 |
| Attribut:Seed treatment | 90 | +5 |

Même message rendu sur les six : « Le mot-clé dépasse la valeur maximale
de 85 caractères. » Cinq sont **antérieures à ce lot** — `Edible parts`,
`Plant habit`, `Propagation method`, `Root system`, `Seed treatment`
(lot 7, propriétés végétales) — cassées en silence depuis leur création
respective, jamais un échec remonté à l'écriture. `INSEE code` est la
sixième, introduite par cette tâche (section 3 de
`lot-11-tache1-execution.md`).

Sur les six, les quatre autres annotations (`Property_description_FR/EN`,
`Property_cardinality`, `Property_domain`) sont présentes en fait direct
à chaque fois — seul `Property_range` manque, remplacé par `_ERRC`. Même
signature que sur `INSEE code`.

**Aucune correction faite ici**, conformément à la consigne — audit
seulement.

### 3 pages — erreurs distinctes, sans rapport avec `Property_range`

| Page | Message rendu |
|---|---|
| Menthe bergamote — Le Buisson de Cerzat (ECL-0026) | « A » ne peut pas être affecté à un type de nombre déclaré avec la valeur -0. |
| Menthe X — Le Buisson de Cerzat (ECL-0023) | « A » ne peut pas être affecté à un type de nombre déclaré avec la valeur -1. |
| Récapitulatif technique du Système de Gestion de Données Techniques | La propriété « A le type » est une propriété déclarative et peut être utilisée seulement sur une page de propriété ou de catégorie. |

Ces trois-là ne relèvent pas du plafond `Keyword`/85 caractères — nature
différente (annotation `A` sur une valeur numérique négative pour les deux
premières ; usage de `Has type` hors d'une page de propriété ou de
catégorie pour la troisième). Mentionnées pour que le compte de 9 soit
complet et non laissé à deviner, non creusées davantage : hors périmètre
de cette tâche.

## 2. Les cinq propriétés du lot — vérification complète, pas seulement `_TYPE`

`browsebysubject` sans filtre, relevé fait par fait :

| Propriété | `_TYPE` | `Property_description_FR` | `Property_description_EN` | `Property_cardinality` | `Property_domain` | `Property_range` |
|---|---|---|---|---|---|---|
| Location number | direct | direct | direct | direct | direct | direct |
| Location site | direct | **direct** | **direct** | direct | direct | direct |
| Location type | direct | direct | direct | direct | direct | direct |
| INSEE code | direct | direct | direct | direct | direct | **absent (`_ERRC`)** |
| Location lineage | direct | direct | direct | direct | direct | direct |

**`Location_site` confirmée intégralement en fait direct**, descriptions
longues comprises (FR ~200 caractères, EN ~195) — aucune troncature,
aucune trace d'un plafond appliqué à `Property_description_FR/EN` :
seul `Property_range`, typé `Keyword`, porte le plafond de 85 caractères
repéré en section 1. Les quatre autres propriétés du lot sont
intégralement conformes, `Property_range` compris (toutes largement sous
85 caractères : de 14 à 55 caractères selon la page).

Seule `INSEE code` manque une annotation : `Property_range`, cause déjà
identifiée en section 1 et reprise en section 3.

## 3. Reprise de la correction — `Attribut:INSEE code`

Wikitexte prêt depuis l'exécution précédente, `Property_range` raccourci
à « code INSEE commune, 5 caractères — 0 initial possible, 2A/2B Corse »
(66 caractères, sous le plafond).

**Une tentative, comme demandé** :
```
bin/wiki-put.sh "Attribut:INSEE code" ... (pas de --createonly, la page existe)
```
Résultat : refusé, même code qu'en exécution précédente —
`smw-change-propagation-protection`, page verrouillée pendant sa propre
propagation de changement.

**Correction non appliquée.** Pas de nouvelle tentative dans cette
entrée, conformément à la consigne. Wikitexte de remplacement toujours
prêt et inchangé, à réessayer plus tard avec le même appel.

## 4. Sur le signal de propagation — correction de méthode

Aucune conclusion tirée ici de `siteinfo`/`jobs` : la tâche précédente l'a
utilisé pour dater la propagation, alors que son propre relevé le
contredit (file figée à 18, puis retombée à 0 sans action identifiée
entre les deux, `_TYPE` déjà promu en fait direct pendant que le compteur
affichait encore 18). C'est une estimation globale, pas un état par page.

**Le signal qui fait foi pour une page `Attribut:`, retenu à partir de
cette clôture** : le refus ou l'acceptation de l'écriture elle-même.
`smw-change-propagation-protection` en est la preuve directe côté verrou
(section 3 ci-dessus) ; `_ERRC` présent ou absent en est la preuve directe
côté traitement de l'annotation (section 1 et 2). Aucun des deux ne
dépend du compteur `jobs`.
