# Lot 21, tâche 7 — Reprise du second bac à sable

Session du 5 octobre 2026, heure locale. Les horodatages du wiki sont en UTC
et tombent le 4 octobre 2026, entre 23 h 34 et 23 h 37.

**Constat : la reprise a échoué, et la tâche s'est arrêtée à la fin de
l'étape 3.** Les deux réécritures de la page d'item ont été acceptées
(révisions 1438 et 1439), et la file de travaux était à 0. Pourtant, les
cinq propriétés Test lot21b portées par la page pompe restent en type 9.
Les six réécritures de pages de propriété du temps 2 ont toutes été
**refusées par `smw-change-propagation-protection`**. Le temps 2 n'a donc
eu lieu qu'à moitié. Conformément à la consigne, aucune autre réparation
n'a été tentée, et l'étape 4 (relevé final, purge, compilation en direct)
n'a pas été faite.

Aucun sujet de production dans `[[_ERRC::+]]` : le compte est de 0.

## Étape 0 — État du dépôt

- `git status --porcelain` : sortie vide.
- `travaux/lot-21-tache7-reprise.md` : « No such file or directory ».
- `.claude/settings.local.json`, au début comme à la fin :
  `{"permissions": {"allow": [], "deny": []}}`. Aucune règle.

## Étape 1 — Relevé de départ

`bin/wiki-login.sh` : `Success Cywil`.

### `browsebysubject`

**`Cywil/Bac_à_sable/Lot21b_pompe#2##`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_débit | 9 | `800_L/h#0##` |
| Test_lot21b_puissance | 9 | `96#0##` |
| Test_lot21b_température | 9 | `-15_°C#0##` |
| Test_lot21b_tolérance_temp | 9 | `2_°C#0##` |
| Test_lot21b_écart_température | 9 | `2_°C#0##` |
| _ASK | 9 | 9 requêtes |
| _INST | 9 | `Test_lot21b_classe#14##` |
| _MDAT | 6 | `1/2026/10/4/22/24/10/0` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe` |
| _SOBJ | 9 | `Cywil/Bac_à_sable/Lot21b_pompe#2##spec` |
| _SOBJ | 9 | `Cywil/Bac_à_sable/Lot21b_pompe#2##fahrenheit` |
| _SOBJ | 9 | `Cywil/Bac_à_sable/Lot21b_pompe#2##saisie-point` |
| _SOBJ | 9 | `Cywil/Bac_à_sable/Lot21b_pompe#2##saisie-virgule` |
| _SOBJ | 9 | `Cywil/Bac_à_sable/Lot21b_pompe#2##saisie-douteux` |

**`…#2##spec`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_débit | 9 | `750_L/h#0##` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe#spec` |

**`…#2##fahrenheit`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_température | 9 | `50_°F#0##` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe#fahrenheit` |

**`…#2##saisie-point`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_débit | 9 | `0,9_m³/h#0##` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe#saisie-point` |

**`…#2##saisie-virgule`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_débit | 9 | `0,9_m³/h#0##` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe#saisie-virgule` |

**`…#2##saisie-douteux`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_débit | 9 | `1.2.3_m³/h#0##` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b pompe#saisie-douteux` |

**`Cywil/Bac_à_sable/Lot21b_grandeur_débit#2##`**

| Propriété | Type | Valeur |
|---|---|---|
| Test_lot21b_libellé | 9 | `Débit_volumique@fr#0##` |
| Test_lot21b_libellé | 9 | `Volumetric_flow_rate@en#0##` |
| _MDAT | 6 | `1/2026/10/4/22/24/9/0` |
| _SKEY | 2 | `Cywil/Bac à sable/Lot21b grandeur débit` |

Page pompe : `_MDAT` = `1/2026/10/4/22/24/10/0`. Il n'y a aucun `_ERRC`.

### Faits des six propriétés (`--facts`)

| Propriété | _TYPE | _CHGPRO | _MDAT |
|---|---|---|---|
| Test lot21b débit | `http://semantic-mediawiki.org/swivt/1.0#_qty` | absent | `1/2026/10/4/22/24/1/0` |
| Test lot21b puissance | `http://semantic-mediawiki.org/swivt/1.0#_num` | absent | `1/2026/10/4/22/24/2/0` |
| Test lot21b température | `http://semantic-mediawiki.org/swivt/1.0#_tem` | absent | `1/2026/10/4/22/24/3/0` |
| Test lot21b tolérance temp | `http://semantic-mediawiki.org/swivt/1.0#_tem` | absent | `1/2026/10/4/22/24/4/0` |
| Test lot21b écart température | `http://semantic-mediawiki.org/swivt/1.0#_qty` | absent | `1/2026/10/4/22/24/5/0` |
| Test lot21b libellé | `http://semantic-mediawiki.org/swivt/1.0#_mlt_rec` | absent | `1/2026/10/4/22/24/7/0` |

Les autres faits sont inchangés depuis la tâche 6 : `Property_description_FR`
partout ; `_CONV` et `_UNIT` sur débit et écart température ; `_UNIT` sur
les deux températures.

## Étape 2 — Temps 1 : réécriture de la page d'item

- J'ai fait la copie `pages/Lot21b_essai_13_pompe_v2.txt`, puis le
  remplacement demandé. `diff` avec le fichier 11 : seule la ligne 1
  change, et elle reçoit « Réécrite à la tâche 7 pour forcer une analyse
  neuve. » avant « Ne pas supprimer sans consigne. »
- Écriture : `"result": "Success"`, `oldrevid` 1437, **`newrevid` 1438**,
  `newtimestamp` `2026-10-04T23:34:52Z`. Il n'y a pas de `nochange`.
- `bin/wiki-wait-jobs.sh` : cinq fois `jobs=3`, puis `FILE FIGEE a 3
  travaux — inutile d'attendre davantage`, sortie 2.
- `browsebysubject` : `_MDAT` = `1/2026/10/4/23/34/52/0`, donc la page a
  bien été réanalysée. Les valeurs sont **identiques au relevé de départ,
  toutes de type 9** : `800_L/h`, `96`, `-15_°C`, `2_°C`, `2_°C` sur la
  page ; `750_L/h` sur spec ; `50_°F` sur fahrenheit ; `0,9_m³/h` sur
  saisie-point et saisie-virgule ; `1.2.3_m³/h` sur saisie-douteux. Il n'y
  a aucun `_ERRC`.

**Test de bascule : non.** Branche prise : **étape 3**. Le relevé qui la
fonde est le `browsebysubject` qui suit la réécriture 1438 : les cinq
propriétés y rendent le type 9.

## Étape 3 — Temps 2

### 3.1 — Copies

J'ai fait les six copies `_v2.txt`. `diff` avec chaque original : une seule
ligne ajoutée à la fin, `<!-- Réécrite à la tâche 7 pour forcer une
analyse neuve. -->`, et rien d'autre. `[[Has type::Number]]` est inchangé
dans `Lot21b_essai_04_puissance_v2.txt`.

### 3.2 — Écritures : six refus

Les six pages ont toutes reçu la même réponse, avec la sortie 1 :

```
ERREUR API: smw-change-propagation-protection — This page is locked to prevent accidental data modification while a [https://www.semantic-mediawiki.org/wiki/Change_propagation change propagation] update is run. The process may take a moment before the page is unlocked as it depends on the size and frequency of the [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Job_queue job queue] scheduler.
```

Code d'erreur : `smw-change-propagation-protection`.

| Page | Réponse |
|---|---|
| Attribut:Test lot21b débit | refus `smw-change-propagation-protection` |
| Attribut:Test lot21b puissance | refus `smw-change-propagation-protection` |
| Attribut:Test lot21b température | refus `smw-change-propagation-protection` |
| Attribut:Test lot21b tolérance temp | refus `smw-change-propagation-protection` |
| Attribut:Test lot21b écart température | refus `smw-change-propagation-protection` |
| Attribut:Test lot21b libellé | refus `smw-change-propagation-protection` |

Aucune nouvelle tentative. Les dernières révisions restent celles de la
tâche 6 : `prop=info` donne 1429 pour débit et 1434 pour libellé ; les
quatre autres n'ont pas été relevées par `prop=info`, mais leur `_MDAT` est
inchangé.

### 3.3 — Attente et faits

**Un seul tour.**
- `bin/wiki-wait-jobs.sh` : `jobs=3`, puis `jobs=0`, `FILE VIDE`, sortie 0.
- `--facts` : les six portent leur `_TYPE` direct, identique au relevé de
  départ (`_qty`, `_num`, `_tem`, `_tem`, `_qty`, `_mlt_rec`), sans
  `_CHGPRO`, et avec les mêmes `_MDAT` qu'au départ.

Le critère de l'étape 3.3 était donc rempli dès le premier tour. Mais il
l'était déjà avant le temps 2, puisque aucune des six pages n'a été
réécrite.

### 3.4 et 3.5 — Seconde réécriture de la page d'item

- J'ai fait la copie `pages/Lot21b_essai_14_pompe_v3.txt`, puis le
  remplacement demandé. `diff` avec la v2 : seule la ligne 1 change, avec
  « Réécrite une seconde fois à la tâche 7. »
- Écriture : `"result": "Success"`, `oldrevid` 1438, **`newrevid` 1439**,
  `newtimestamp` `2026-10-04T23:35:57Z`.

### 3.6 — Attente et relevé

- `bin/wiki-wait-jobs.sh` : `jobs=0`, `FILE VIDE`, sortie 0.
- `browsebysubject` : `_MDAT` = `1/2026/10/4/23/35/57/0`. Les valeurs sont
  **toujours toutes en type 9**, et identiques au relevé de départ, ligne
  pour ligne, sur la page et ses cinq sous-objets. Il n'y a aucun `_ERRC`.

**Arrêt.** Le rapport est écrit sur ce constat. L'étape 4 n'a pas été
faite : pas de relevé final séparé, pas de purge, pas de rendu, pas de
compilation `format=debug`.

## Vérifications

**a. Celle qui tranche.** Le relevé de l'étape 4.1 n'existe pas. Le dernier
`browsebysubject` est celui de l'étape 3.6 : type 9 partout.

**b. Contenu.**
- Révision 1439 : `bin/wiki-verify.sh "Utilisateur:Cywil/Bac à sable/Lot21b
  pompe" pages/Lot21b_essai_14_pompe_v3.txt` rend `IDENTIQUE`, sortie 0.
- Révision 1438, déjà remplacée au moment de la vérification : j'ai relu
  son contenu par `prop=revisions&revids=1438`, puis comparé ce contenu à
  `pages/Lot21b_essai_13_pompe_v2.txt` avec `diff`. Il n'y a aucune
  différence, sortie 0.
- Les six pages de propriété sont sans objet, puisqu'aucune écriture n'a
  été acceptée.

**c. Erreurs.**
- `action=ask` sur `[[_ERRC::+]]`, `limit=500` : `[]`.
- Rendu en ligne (`action=parse&text=`, `#ask` en `format=list` et
  `format=count`) : `AUCUN RESULTAT 0`.

Le compte est donc de **0**, pour les deux mesures.

**d. Liens et catégories de la page d'item.**
- Catégorie : `Test_lot21b_classe`, et elle seule.
- Liens vers des pages inexistantes : les **dix mêmes** qu'à la tâche 6,
  `800 L/h`, `1.2.3 m³/h`, `0,9 m³/h`, `750 L/h`, `-15 °C`, `50 °F`,
  `2 °C`, `Débit volumique@fr`, `Volumetric flow rate@en`, `96`. Ils n'ont
  pas disparu, ce qui concorde avec un stockage resté en Page.

## Les questions restantes

| N° | Question | Réponse | Relevé qui la fonde |
|---|---|---|---|
| 3a | Le couple nombre normalisé + unité donne-t-il une annotation valide dans le type déclaré ? | **Non tranchée par cette mesure.** | Valeurs en type 9 (étape 3.6). |
| 4 | Monolingual text : stockage, requête, affichage par langue ? | **Non tranchée par cette mesure.** | `Lot21b grandeur débit` en type 9 (étape 1). La page n'a pas été réécrite dans cette tâche. |
| 5 | Un écart porté par Temperature subit-il le décalage d'origine ? | **Non tranchée par cette mesure.** | `tolérance temp` et `écart température` valent tous deux `2_°C#0##` en type 9 (étape 3.6) : aucune conversion n'a eu lieu, ni dans un sens ni dans l'autre. |
| 6 | Le °F est-il reconnu nativement par Temperature ? | **Non tranchée par cette mesure.** | `50_°F#0##` en type 9 sur le sous-objet fahrenheit (étape 3.6). |
| 1 | Le filtre de classe écarte-t-il toujours les sous-objets une fois les valeurs dans leur type ? | **Non tranchée par cette mesure** : les valeurs ne sont pas dans leur type. | Seul constat possible : `_INST` reste porté par la page seule, absent des cinq sous-objets (étapes 1 et 3.6), comme à la tâche 6. |

## Écarts et surprises

1. **Les six pages de propriété sont verrouillées par
   `smw-change-propagation-protection`.** La consigne présentait ce refus
   comme possible, mais je ne m'attendais pas à le voir sur les six à la
   fois, avec :
   - aucun `_CHGPRO` sur aucune d'elles, d'après le relevé de départ fait
     quelques minutes avant ;
   - une file de travaux annoncée à 3 juste avant, puis à 0 juste après.

   L'entrée 39 des *Limites connues* dit que la cause du déclenchement de
   ce verrou n'est pas établie. Ce cas en est un nouvel exemple. Aucune de
   ces pages n'a été blanchie, contrairement aux cas de l'entrée 58. Je ne
   sais pas si le verrou est durable, ni s'il est apparu à la tâche 6 :
   aucune écriture n'avait été tentée sur ces pages depuis leur création.

2. **La file était réellement à 0** pendant l'étape 3.6 (`FILE VIDE`), et
   la page d'item a été réanalysée deux fois (`_MDAT` 23:34:52 puis
   23:35:57). Pourtant, ses valeurs restent en type 9. Ce relevé confirme
   ce qu'annonçait la consigne : la file n'est pas la cause, et une simple
   réanalyse de la page d'item ne suffit pas. **Ce constat contredit
   l'hypothèse de la consigne, selon laquelle le temps 1 pouvait
   suffire.**

3. **Le verrou et le blocage en type par défaut pourraient avoir la même
   origine.** C'est une conjecture, non vérifiée. Six propriétés à la fois
   verrouillées en propagation et vues en type par défaut par l'analyseur
   suggèrent un état de propagation inachevé, qui ne se voit plus dans
   `browsebysubject` (pas de `_CHGPRO`). Je ne sais pas le confirmer avec
   les outils en lecture dont je dispose.

4. **Le premier `bin/wiki-wait-jobs.sh`** a annoncé `FILE FIGEE a 3
   travaux` ; l'appel suivant a trouvé 0. Ce comportement est conforme à ce
   qu'annonçait la consigne.

5. **Les fichiers `_v2` des six propriétés n'ont été envoyés nulle part**,
   puisque les écritures ont été refusées. Je les commite quand même avec
   les autres fichiers de `pages/`, comme la consigne le demande.

6. **Demandes de confirmation hors de la liste annoncée.** Il y en a eu
   probablement pour :
   - un `tail -c … | od -c`, pour vérifier le saut de ligne final des
     copies avant l'ajout ;
   - un `ls` et un `cat` de `.claude/settings.local.json`.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

**A.** *Contexte* : les six pages `Attribut:Test lot21b …` refusent toute
écriture (`smw-change-propagation-protection`), alors que `browsebysubject`
ne leur montre aucun `_CHGPRO` et que la file est à 0. Tant que ce verrou
tient, le temps 2 ne peut pas avoir lieu, et l'étape 8 de la tâche 6
(changement de type de la puissance) non plus. *Question* : faut-il
traiter ce verrou comme les quinze verrous orphelins du 16 août 2026, par
une demande à fuzzy (voir `demandes-adminsys.md`) ? Ou faut-il d'abord
attendre et retenter une seule écriture plus tard, pour savoir s'il se lève
seul ? *Suggestion* : une seule tentative d'écriture sur une des six, dans
quelques heures. Si le refus persiste, une demande à fuzzy pour lister les
tâches de propagation en attente sur ces six propriétés.

**B.** *Contexte* : le bac à sable Lot21b est désormais doublement bloqué,
par des valeurs en type 9 et par des propriétés verrouillées. Les quatre
questions 3a, 4, 5 et 6 restent ouvertes. *Question* : vaut-il mieux
abandonner ce bac à sable et en créer un troisième, en deux temps séparés
par un contrôle ? Le premier temps créerait les propriétés ; un `_TYPE`
direct sans `_CHGPRO` et une écriture d'essai acceptée sur chacune
seraient vérifiés ; le second temps créerait ensuite seulement la page
d'item. *Suggestion* : oui. Le lot 21b reste en place et non blanchi, comme
le demande la consigne, pour servir de témoin du verrou.
