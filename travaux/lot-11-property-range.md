# Lot 11 — Property_range : la dette du lot 7 soldée à 5/6

2026-08-25. Test de l'hypothèse : les cinq propriétés du lot 7 étaient-elles
réellement sous `smw-change-propagation-protection`, ou est-ce une
déduction jamais vérifiée depuis le cas `INSEE_code` ? **Réponse : la
déduction était fausse pour les cinq, vraie pour `INSEE_code` seul.**
Toutes les écritures de cette session sous `[Amendement]`, session ouverte
par `bin/wiki-login.sh` (`Success Cywil`), chaque page relue avant et
après son écriture.

## 1. Test — `Attribut:Seed treatment`, puis les quatre autres

### Attribut:Seed treatment — passe, sans verrou

`Property_range` actuel relevé à **90 caractères** :
```
traitement de graine — valeurs laissées émerger (stratification, scarification, trempage…)
```
Raccourci à **67 caractères** (compté par script avant l'appel, pas à
l'œil), sens conservé — le préfixe « traitement de graine — » est
redondant avec le nom de la propriété, retiré :
```
valeurs laissées émerger : stratification, scarification, trempage…
```
`wiki-put.sh`, résumé `[Amendement] Property_range raccourci sous le
plafond de 85 caractères — annotation rejetée depuis la création`.
**`result: Success` du premier coup**, `oldrevid` 397 → `newrevid` 870.
Relu après écriture : identique au fichier envoyé.

**L'hypothèse se confirme : pas de verrou.** Enchaîné sur les quatre
autres, même méthode (lecture, raccourci en gardant le sens, comptage par
script, une écriture) :

| Propriété | Avant (caractères) | Après (caractères) | Nouveau texte | Revid |
|---|---|---|---|---|
| `Edible parts` | 99 | 79 | `valeurs laissées émerger : fruit, feuille, fleur, racine, graine, jeune pousse…` | 399 → 871 |
| `Plant habit` | 91 | 71 | `valeurs laissées émerger : arbre, arbuste, liane, herbacée, couvre-sol…` | 380 → 872 |
| `Propagation method` | 95 | 70 | `valeurs laissées émerger : semis, bouture, marcotte, division, greffe…` | 396 → 873 |
| `Root system` | 97 | 69 | `valeurs laissées émerger : pivotant, traçant, drageonnant, fasciculé…` | 381 → 874 |

Les quatre : `result: Success` du premier coup, aucun verrou rencontré.
Les cinq pages relues après écriture : contenu identique aux fichiers
envoyés. Seule la ligne `Property_range` a changé sur chacune —
`Property_description_FR/EN`, `Property_cardinality`, `Property_domain`,
`Has type` intacts, vérifié par diff complet, pas seulement supposé.

## 2. `Attribut:INSEE code` — retenté, refusé

`Property_range` actuel relevé à **90 caractères** :
```
code INSEE commune, 5 caractères — chiffres, zéro initial possible, ou 2A/2B pour la Corse
```
Raccourci prêt à **69 caractères**, sens conservé :
```
5 caractères, chiffres (zéro initial possible) ou 2A/2B pour la Corse
```
**Une tentative, refusée** — message exact retourné par l'API :
```json
{
  "error": {
    "code": "smw-change-propagation-protection",
    "info": "This page is locked to prevent accidental data modification while a change propagation update is run. The process may take a moment before the page is unlocked as it depends on the size and frequency of the job queue scheduler.",
    "docref": "See https://wiki.ecolibre.org/api.php for API usage. ..."
  }
}
```
**Pas de nouvelle tentative**, comme demandé. La page n'a pas été
modifiée — `browsebysubject` la montre inchangée, `_MDAT` toujours au 21
août 2026, `_ERRC` toujours présent. `INSEE_code` reste donc la seule des
six pages du lot 7/tâche 1 réellement sous verrou — **l'hypothèse de
départ était fausse pour cinq pages sur six**, vraie pour celle sur
laquelle elle avait été construite.

## 3. Cosmétique — `Attribut:Planting rank`

Le point 1 étant passé, retouche faite dans la même passe. `Property_range`
relu avant écriture :
```diff
-[[Property_range::Mètres entiers depuis l'origine du lieu, non comparable d'un lieu à l'autre.]]
+[[Property_range::mètres entiers depuis l'origine du lieu, non comparable d'un lieu à l'autre]]
```
Majuscule initiale et point final retirés, alignés sur le reste du wiki
(« rang ordinal, multiples de dix », « code de site à trois lettres »).
Rien d'autre changé sur la page — vérifié par diff complet. Résumé :
`[Amendement] Property_range aligné sur la casse et la ponctuation du
reste du wiki (minuscule, sans point final)`. `oldrevid` 869 →
`newrevid` 875. Relu après écriture : identique au fichier envoyé.

## Vérifications

**`browsebysubject` sur les six pages touchées ou retentées** :

| Page | `Property_range` en fait direct | `_ERRC` |
|---|---|---|
| `Seed treatment` | oui, texte raccourci | absent |
| `Edible parts` | oui, texte raccourci | absent |
| `Plant habit` | oui, texte raccourci | absent |
| `Propagation method` | oui, texte raccourci | absent |
| `Root system` | oui, texte raccourci | absent |
| `Planting rank` | oui, texte recasé | absent (déjà réglé au lot précédent) |
| `INSEE code` | **absent** — propriété toujours non stockée | **présent**, inchangé |

**Compteur `Erreurs de traitement SMW`** : `action=ask` sur `[[_ERRC::+]]`
(liste, pas `format=count` — chemin API cassé documenté dans `Limites
connues du SGDT`) → `count: 1`, seule page restante `Attribut:INSEE code`.
Le rendu de la page elle-même affichait encore `6` (cache non invalidé,
comme son propre texte le prévient) ; purgée
(`bin/wiki-purge.sh "Erreurs de traitement SMW"`), rendu revérifié après :
`Nombre de pages en erreur : 1`.

## Ce que ça change pour la suite

La dette de six pages ouverte depuis le 21 août 2026 est soldée à cinq
sur six dans cette session. Il ne reste qu'`Attribut:INSEE code`, dont le
`Property_range` raccourci est déjà prêt et vérifié (69 caractères) —
il suffira de retenter l'écriture une fois le verrou levé (attente
naturelle de la file de travaux, ou intervention de fuzzy si le verrou
est orphelin comme celui déjà documenté dans `demandes-adminsys.md` pour
un autre cas). Rien d'autre à faire ici en attendant.

## Résumé des écritures

| Cible | Action | Résultat | Revid |
|---|---|---|---|
| `Attribut:Seed treatment` | édition | Success | 397 → 870 |
| `Attribut:Edible parts` | édition | Success | 399 → 871 |
| `Attribut:Plant habit` | édition | Success | 380 → 872 |
| `Attribut:Propagation method` | édition | Success | 396 → 873 |
| `Attribut:Root system` | édition | Success | 381 → 874 |
| `Attribut:INSEE code` | tentative d'édition | **Refusée** (`smw-change-propagation-protection`) | inchangé |
| `Attribut:Planting rank` | édition (cosmétique) | Success | 869 → 875 |
| `Erreurs de traitement SMW` | purge | — | — |

Rien commité ni poussé dans cette session.
