# Lot 10 — Tâche 3 : rapport — cinq propriétés créées

**Exécuté le :** 19 août 2026, session Claude Code, compte `Cywil`.
**Cinq écritures wiki, toutes acceptées. Aucun refus.**

---

## 1. Amendement préalable de la proposition

`lot-10-tache3-proposition.md` amendé et commité avant toute écriture
(commit `6944688`, résumé `[Lot 10][Tâche 3] Proposition amendée —
Procurement_route est à créer`) : le §1 comptait à tort `Procurement_route`
parmi les propriétés déjà existantes. Vérifié faux sur le wiki vivant le
19 août (voir `rapport-2026-08-19.md` §2.1) et déjà consigné dans
`lot-9-tache0-rapport.md` §6 et `lot-9-amendement-1.md` — l'erreur venait
d'un résumé, pas des rapports du dépôt. Le lot crée donc cinq propriétés,
pas quatre ; `Procurement_route` ajoutée en tête du §3 amendé.

---

## 2. Écritures

Ordre respecté : `Procurement_route`, `Power_rating`, `Max_thickness`,
`Materials_worked`, `Measured_quantities`. Toutes en `--createonly`, `new:
true` sur les cinq — aucune page préexistante écrasée. Aucun `Allows value`
sur aucune. Plafond de 85 caractères contrôlé programmatiquement avant
écriture sur les cinq valeurs de `Property_range` (1 à 24 caractères, voir
§3 de la proposition amendée) : aucune ne l'approche.

| # | Page | pageid | newrevid | Résumé |
|---|---|---|---|---|
| 1 | `Attribut:Procurement_route` | 407 | **802** | `[Lot 10][Tâche 3] Procurement_route` |
| 2 | `Attribut:Power_rating` | 408 | **803** | `[Lot 10][Tâche 3] Power_rating` |
| 3 | `Attribut:Max_thickness` | 409 | **804** | `[Lot 10][Tâche 3] Max_thickness` |
| 4 | `Attribut:Materials_worked` | 410 | **805** | `[Lot 10][Tâche 3] Materials_worked` |
| 5 | `Attribut:Measured_quantities` | 411 | **806** | `[Lot 10][Tâche 3] Measured_quantities` |

**Aucun refus.** Le verrou intermittent noté dans `lot-10-cadrage.md` ne
s'est pas manifesté.

---

## 3. Vérification du stockage — étape 3

### 3.1 Un premier passage a montré un état transitoire, pas un échec

Immédiatement après les cinq écritures, `browsebysubject` sur chacune des
cinq pages ne retournait **pas** les propriétés attendues (`Property_range`,
`Has type`, etc.) comme faits directement listés : seules `_SKEY` et une clé
`_CHGPRO` apparaissaient, cette dernière portant en JSON sérialisé les
valeurs correctement écrites. C'est le magasin de la **file de propagation
des changements** de SMW (la même mécanique que le verrou
`smw-change-propagation-protection` déjà rencontré le 16 août), pas le
magasin interrogeable — exactement le défaut qui a laissé cinq portées du
lot 9 écrites mais non stockées, que l'étape 3 demandait explicitement de
guetter.

`action=query&meta=siteinfo&siprop=statistics` montrait **16 jobs en
attente** à ce moment. Plutôt que de conclure prématurément, nouvelle
lecture après quelques appels API (le déclenchement probabiliste de
`$wgJobRunRate` sur les requêtes suivantes a vidé la file : `jobs: 0`),
purge des cinq pages, puis nouveau `browsebysubject` : cette fois les cinq
propriétés apparaissent bien comme faits directs. **Aucune écriture
supplémentaire n'a été nécessaire** — la propagation s'est terminée
d'elle-même, sans intervention côté bot.

### 3.2 Faits SMW relevés (état final, propagé)

| Propriété | `_TYPE` (Has type) | `Property_cardinality` | `Property_domain` | `Property_range` | `_ERR*` |
|---|---|---|---|---|---|
| `Procurement_route` | Text (`_txt`) | single | `Referenced_item` | `valeurs laissées émerger` | aucune |
| `Power_rating` | Number (`_num`) | single | `Referenced_item` | `W` | aucune |
| `Max_thickness` | Number (`_num`) | single | `Referenced_item` | `mm` | aucune |
| `Materials_worked` | Page (`_wpg`) | multiple | `Referenced_item` | `valeurs laissées émerger` | aucune |
| `Measured_quantities` | Text (`_txt`) | multiple | `Referenced_item` | `valeurs laissées émerger` | aucune |

Les cinq `Property_description_FR`/`Property_description_EN` sont également
présentes et conformes au contenu écrit (non reproduites ici, voir §3 de la
proposition amendée pour le texte exact). **Aucune clé `_ERR*` sur aucune des
cinq pages**, dans l'état transitoire comme dans l'état final.

---

## 4. Étape 4 — garde-fou 6 non levé pour le modèle et le formulaire

**Ni `Modèle:Referenced item` ni `Formulaire:Referenced item` n'ont été
touchés.** Conformément à la consigne, ces deux pages en service restent
hors périmètre de cette tâche : le câblage des cinq nouvelles propriétés
(déjà décrit en reconnaissance dans `rapport-2026-08-19.md` §2.3 pour les
quatre premières, à étendre à `Procurement_route`) est un diff à soumettre à
Cyril séparément, pas une décision de séance.

---

## 5. Ce qui a échoué

**Rien.** Cinq écritures, cinq succès, aucun refus, aucune clé `_ERR*`. Le
seul point notable est l'état transitoire du §3.1, qui n'est pas un échec :
une vérification faite trop tôt, corrigée par une seconde lecture après
propagation — précisément la vigilance que demandait l'étape 3.
