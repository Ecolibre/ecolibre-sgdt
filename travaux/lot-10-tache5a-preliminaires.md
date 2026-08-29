# Lot 10 — tâche 5, bloc 1 : préalables d'inventaire

Date : 2026-08-29. Aucun nouvel item créé. Deux corrections, une création,
un renommage, en préparation de l'inventaire de quatre outils sous le site CWL.

Règle appliquée : une référence d'inventaire libérée n'est jamais réattribuée.
**ECL-0043 et CWL-0007 deviennent définitivement vacants.**

---

## Étape 1 — lectures préalables (aucune écriture)

### a) Formulaire:Physical item (revid lu : 938)

Champ concerné, avant :

```
| {{{field|Owned_by|input type=combobox|values from category=Organisation|default=Ecolibre}}}
```

Le reste du formulaire : bloc `for template|Physical item`, champs `site_code`
(défaut `{{Préfixe site}}`), `ref_number` (défaut calculé par
`#invoke:Base36|next` sur un `#ask` filtré `Inventory_site::{{Préfixe site}}`),
`model_link`, `description`, `sn`, `physical_parent`, `Located_at`, puis
`Owned_by`. Bloc « Facettes » + `standard input free text` / `save`.

### b) Machine à souder par point — Atelier appartement (ECL-0043)

```
{{Physical item
|site_code=ECL
|ref_number=0043
|model_link=Machine à souder par points SUNKKO 709AD
|Owned_by=Ecolibre
|Located_at=Atelier appartement
|description=Rangée dans une caisse, dans l'appartement.
}}
```

Faits SMW correspondants (avant) : `Inventory_site=ECL`,
`Inventory_number=0043`, `Inventory_ref=ECL-0043`, `Owned_by=Ecolibre#0##`,
`Located_at=Atelier_appartement#0##`,
`Instance_of=Machine_à_souder_par_points_SUNKKO_709AD`. Aucune clé `_ERR`.

### c) Batterie de récupération trotinette 1

```
{{Physical item
|site_code=CWL
|ref_number=0007
|model_link=Batterie défaillante récupérée
|Owned_by=Ecolibre
}}
```

Faits SMW (avant) : `Inventory_site=CWL`, `Inventory_number=0007`,
`Inventory_ref=CWL-0007`, `Owned_by=Ecolibre#0##`,
`Instance_of=Batterie_défaillante_récupérée`. Aucune clé `_ERR`.
Le titre ne contient aucune référence → pas de renommage prévu.

### d) Ecolibre — gabarit du modèle Organisation

```
{{Organisation
|Organisation_name=
|Organisation_description=Organisation porteuse de wiki.ecolibre.org, wiki faisant autorité pour le Registre des préfixes de site.
|Organisation_site_code=ECL
|Organisation_website=
}}
```

Gabarit retenu pour CWL : mêmes quatre paramètres, dans le même ordre,
`Organisation_site_code=CWL`, tout le reste vide.

### e) Registre des préfixes de site

La page existe. **CWL y figure déjà** : ligne
`CWL | CWL Optéos | cwl.ecolibre.org | wiki.ecolibre.org`. Le code est donc
enregistré au registre fédéral avant usage, comme l'exige la page. Rien à
modifier dans le registre. (La page manquante visée par le garde-fou d'arrêt
est la page **Organisation** `CWL`, pas cette ligne de registre.)

### f) Plus grand Inventory_number par site (action=ask)

- **ECL** : `0043` (Machine à souder … ECL-0043), puis `0042`, `0041`
  (Ail éléphant — Le Buisson de Cerzat). → max ECL = **0043**.
- **CWL** : `0007` (Batterie de récupération trotinette 1), seul résultat.
  → max CWL = **0007**.

### Page Organisation CWL

`action=query&prop=info&titles=CWL` → `"missing": true`. **Page absente.**

---

## Garde-fou d'arrêt — vérifié, franchi

| Condition | Attendu | Constaté | OK |
|---|---|---|---|
| max Inventory_number ECL | 0043 | 0043 | ✅ |
| max Inventory_number CWL | 0007 | 0007 | ✅ |
| Page Organisation `CWL` | absente | `missing: true` | ✅ |

Les trois conditions concordent. Écritures autorisées.

---

## Étape 2 — écritures

`bin/wiki-login.sh` relancé juste avant (`Success Cywil`).

### 2a — Création de la page CWL (revid 1089, pageid 466)

Résumé : `[Lot 10][Tâche 5] création de l'organisation partenaire CWL (code
de site CWL) — description laissée vide`

```
{{Organisation
|Organisation_name=
|Organisation_description=
|Organisation_site_code=CWL
|Organisation_website=
}}
```

Créée avec `--createonly` (page neuve, `"new": true`). Description laissée
vide — à compléter par Cyril.

### 2b — Formulaire:Physical item (revid 938 → 1090)

Résumé : `[Lot 10][Tâche 5] retrait du défaut default=Ecolibre sur le champ
Owned_by (accord Cyril, garde-fou 6)`

Diff (seule ligne touchée, ligne 27) :

```
- | {{{field|Owned_by|input type=combobox|values from category=Organisation|default=Ecolibre}}}
+ | {{{field|Owned_by|input type=combobox|values from category=Organisation}}}
```

Rien d'autre modifié. Garde-fou 6 (modèle/formulaire en service) : accord
explicite de Cyril donné en conversation pour cette tâche.

### 2c — Renommage du SUNKKO

`action=move` (curl direct hors scripts `bin/` — aucun script de renommage
n'existe ; accord explicite de Cyril dans la consigne de tâche ; opération
ponctuelle, non reconduite). Jeton CSRF obtenu en lecture par
`meta=tokens&type=csrf`.

- de : `Machine à souder par point — Atelier appartement (ECL-0043)`
- à  : `Machine à souder par point — Atelier appartement (CWL-0008)`
- `redirectcreated: true`, `moveoverredirect: false`
- Résumé : `[Lot 10][Tâche 5] ECL-0043 retiré (jamais utilisé), réinventorié
  CWL-0008 — redirection conservée comme trace`

**Redirection conservée** (revid 1092, `redirect: true`). Elle sert de trace
que ECL-0043 a été retiré et jamais réutilisé.

Puis édition du contenu de la page renommée (revid 1091 → 1093).
Résumé : `[Lot 10][Tâche 5] site_code ECL→CWL, ref_number 0043→0008, Owned_by
Ecolibre→CWL ; model_link, Located_at, description inchangés`

Diff :

```
  {{Physical item
- |site_code=ECL
- |ref_number=0043
+ |site_code=CWL
+ |ref_number=0008
  |model_link=Machine à souder par points SUNKKO 709AD
- |Owned_by=Ecolibre
+ |Owned_by=CWL
  |Located_at=Atelier appartement
  |description=Rangée dans une caisse, dans l'appartement.
  }}
```

CWL-0008 et non CWL-0007 : la référence libérée par la batterie n'est pas
réattribuée.

### 2d — Batterie de récupération trotinette 1 (revid 942 → 1094)

**Pas de renommage** : le titre ne contient pas de référence.
Résumé : `[Lot 10][Tâche 5] site_code CWL→ECL, ref_number 0007→0044 ; pas de
renommage (titre sans référence), Owned_by reste Ecolibre`

Diff :

```
  {{Physical item
- |site_code=CWL
- |ref_number=0007
+ |site_code=ECL
+ |ref_number=0044
  |model_link=Batterie défaillante récupérée
  |Owned_by=Ecolibre
  }}
```

ECL-0044 et non ECL-0043 : la référence libérée par le SUNKKO n'est pas
réattribuée. `Owned_by` reste `Ecolibre` — la batterie appartient bien à
Ecolibre ; seul le site qui l'inventorie change.

---

## Étape 3 — vérification après écriture

### Faits SMW (browsebysubject)

**Machine à souder par point — Atelier appartement (CWL-0008)** :

```
Inventory_number -> ['0008']
Inventory_ref    -> ['CWL-0008']
Inventory_site   -> ['CWL']
Owned_by         -> ['CWL#0##']
Located_at       -> ['Atelier_appartement#0##']   (inchangé)
Item_description -> ["Rangée dans une caisse, dans l'appartement."]  (inchangé)
Instance_of      -> ['Machine_à_souder_par_points_SUNKKO_709AD#0##'] (inchangé)
```

**Batterie de récupération trotinette 1** :

```
Inventory_number -> ['0044']
Inventory_ref    -> ['ECL-0044']
Inventory_site   -> ['ECL']
Owned_by         -> ['Ecolibre#0##']   (inchangé)
Instance_of      -> ['Batterie_défaillante_récupérée#0##']  (inchangé)
```

Les quatre propriétés visées (Inventory_site, Inventory_number, Inventory_ref,
Owned_by) portent les valeurs voulues sur les deux items. **Aucune clé `_ERR`
/ `_ERRC` sur ni l'un ni l'autre.**

### Résolution des redirections par SMW — test fait pour la première fois ici

File de travaux figée à 4 jobs (`bin/wiki-wait-jobs.sh` : « FILE FIGEE à
4 travaux »). Rappel de méthode : une file qui ne descend pas n'est pas une
preuve d'échec d'écriture. Les deux pages ci-dessous ont été purgées
(`bin/wiki-purge.sh`, `linkupdate: true`) puis rendues.

- **Machine à souder par points SUNKKO 709AD** (page du modèle Referenced
  item) — bloc « Exemplaires physiques » :
  → affiche **`Machine à souder par point — Atelier appartement (CWL-0008)` /
  `CWL-0008` / `CWL`**. Le NOUVEAU titre.

- **Atelier appartement** (page du lieu) — bloc « Items physiques à ce lieu » :
  → « 1 item(s) physique(s) rattaché(s) », ligne
  **`Machine à souder par point — Atelier appartement (CWL-0008)`**. Le
  NOUVEAU titre.

**Conclusion du test** : les deux blocs `#ask` affichent le nouveau titre
CWL-0008, immédiatement après purge, sans attendre le vidage de la file.
Nuance à garder en tête : ces `#ask` interrogent le modèle
(`Instance_of::SUNKKO 709AD`) et le lieu (`Located_at::Atelier appartement`),
valeurs portées par le sujet lui-même — qui a été renommé puis ré-enregistré,
donc son sujet SMW est déjà le nouveau titre. Le vrai enjeu « redirection »
concernerait une page tierce pointant encore sur `…(ECL-0043)` :
`list=backlinks` sur l'ancien titre, hors redirections, renvoie `[]` — aucune
page ne référence l'ancien titre.

### État final vérifié

| Élément | Vérifié |
|---|---|
| Page `CWL` | créée, revid 1089, gabarit Organisation, description vide |
| `Formulaire:Physical item` ligne 27 | `…values from category=Organisation}}}` sans `default=Ecolibre` |
| Ancien titre ECL-0043 | redirection, revid 1092, `redirect: true` |
| Nouveau titre CWL-0008 | contenu à jour, faits SMW corrects |
| Batterie | ECL-0044, faits SMW corrects, `Owned_by=Ecolibre` |
| Backlinks vers `…(ECL-0043)` (hors redirect) | `[]` |

---

## Écarts constatés

Aucun. Les trois conditions du garde-fou d'arrêt concordaient ; les cinq
écritures (création + 2 éditions de contenu + renommage + édition du
formulaire) ont réussi du premier coup ; les vérifications SMW confirment
toutes les valeurs cibles ; aucune erreur SMW.

Point ouvert non bloquant : file de travaux SMW figée à 4 jobs. L'affichage
étant déjà correct après purge, sans conséquence sur ce bloc. Un
`runJobs.php` (côté Cyril / fuzzy, cf. `demandes-adminsys.md`) viderait la
file.
