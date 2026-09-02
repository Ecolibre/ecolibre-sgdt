# Lot 13 — Tâche 1 : la catégorie et les neuf propriétés

**Exécuté le :** 1ᵉʳ septembre 2026 (23h28-23h29 UTC), session Claude Code,
compte `Cywil`. Session ouverte par `bin/wiki-login.sh` avant toute écriture.
Suite de `travaux/lot-13-tache0-recon.md`.

---

## 1. Étape 1 — vérification préalable

`action=query&prop=info` sur les dix titres cibles, avant toute écriture :
les dix retournent `"missing": true`. Aucun ne préexistait — écriture
autorisée à se poursuivre.

## 2. Ce qui a été créé

Dix pages, chacune en une seule écriture `wiki-put.sh --createonly`
(`result: Success` dans les dix cas) :

| Page | pageid | revid | résumé |
|---|---|---|---|
| `Catégorie:Lot` | 497 | 1159 | `[Lot 13][Tâche 1] Création Catégorie:Lot` |
| `Attribut:Work package number` | 498 | 1160 | `[Lot 13][Tâche 1] Création Attribut:Work package number` |
| `Attribut:Work package status` | 499 | 1161 | `[Lot 13][Tâche 1] Création Attribut:Work package status` |
| `Attribut:Work package summary` | 500 | 1162 | `[Lot 13][Tâche 1] Création Attribut:Work package summary` |
| `Attribut:Work package opening date` | 501 | 1163 | `[Lot 13][Tâche 1] Création Attribut:Work package opening date` |
| `Attribut:Work package closure date` | 502 | 1164 | `[Lot 13][Tâche 1] Création Attribut:Work package closure date` |
| `Attribut:Work package closure report` | 503 | 1165 | `[Lot 13][Tâche 1] Création Attribut:Work package closure report` |
| `Attribut:Work package depends on` | 504 | 1166 | `[Lot 13][Tâche 1] Création Attribut:Work package depends on` |
| `Attribut:Work package overlaps` | 505 | 1167 | `[Lot 13][Tâche 1] Création Attribut:Work package overlaps` |
| `Attribut:Work package revises` | 506 | 1168 | `[Lot 13][Tâche 1] Création Attribut:Work package revises` |

Contenu écrit non enveloppé, une annotation par ligne physique, sans aucun
commentaire ni exemple ajouté — conforme à la consigne.

## 3. Signal de file avant vérification — écarté à bon droit

`action=query&meta=siteinfo&siprop=statistics` juste après les dix écritures :
`jobs: 32`. `bin/wiki-wait-jobs.sh` a été lancé par prudence et a répondu
« FILE FIGEE a 32 travaux » après cinq essais identiques (code de sortie 2).

**Ce signal n'a pas été retenu comme un blocage**, conformément à la leçon de
méthode de `CLAUDE.md` : le compteur `jobs` est une estimation plafonnée, pas
un décompte, et une file « figée » sur ce relevé n'est pas un diagnostic de
panne. Le contrôle qui tranche est la lecture directe des faits, faite tout
de suite après (§4) : les neuf propriétés portaient déjà leurs faits complets,
sans aucune trace de `_CHGPRO` — la file affichée ne bloquait donc rien de ce
qui a été vérifié ici.

## 4. Relevé de vérification page par page

`action=browsebysubject` avec `ns=102`, sur les neuf propriétés, immédiatement
après les écritures.

| Propriété | `_TYPE` (URI SMW) | FR | EN | Cardinalité | Domaine | `Property_range` écrit / lu |
|---|---|---|---|---|---|---|
| Work package number | `…#_num` (Number) | ✅ | ✅ | single | `Lot#14##` | « entier positif, jamais réattribué » / identique |
| Work package status | `…#_txt` (Text) | ✅ | ✅ | single | `Lot#14##` | « énumération fermée » / identique |
| Work package summary | `…#_txt` (Text) | ✅ | ✅ | single | `Lot#14##` | « une phrase, virgules autorisées » / identique |
| Work package opening date | `…#_dat` (Date) | ✅ | ✅ | single | `Lot#14##` | « date de calendrier » / identique |
| Work package closure date | `…#_dat` (Date) | ✅ | ✅ | single | `Lot#14##` | « date de calendrier » / identique |
| Work package closure report | `…#_uri` (URL) | ✅ | ✅ | multiple | `Lot#14##` | « permalien de dépôt sur SHA de commit » / identique |
| Work package depends on | `…#_wpg` (Page) | ✅ | ✅ | multiple | `Lot#14##` | « Lot » / identique |
| Work package overlaps | `…#_wpg` (Page) | ✅ | ✅ | multiple | `Lot#14##` | « Lot » / identique |
| Work package revises | `…#_wpg` (Page) | ✅ | ✅ | multiple | `Lot#14##` | « Lot » / identique |

Pour `Work package status`, les `Allows value` retenues (`_PVAL`), dans
l'ordre rendu par `browsebysubject` :

```
_PVAL -> ['identifié', 'cadré', 'ouvert', 'livré', 'clos', 'abandonné']
```

Six valeurs, accents compris, identiques à celles écrites — aucune perte,
aucune troncature, aucun ajout.

## 5. Les deux points de contrôle demandés

### `Has type::URL` sur `Work package closure report`

**Enregistré correctement comme type URL, pas comme texte.** Le fait
`_TYPE` retourné est `http://semantic-mediawiki.org/swivt/1.0#_uri` — `_uri`
est l'identifiant interne SMW du type URL (à distinguer de `_txt` pour Text,
vu sur `Work package status` et `Work package summary` ci-dessus, et de
`_wpg` pour Page, vu sur les trois propriétés relationnelles). L'alias
`URL` de `Has type` a donc été reconnu par cette installation ; aucune
autre propriété de ce type n'existant encore sur le wiki, c'est la première
fois que ce mapping est vérifié ici. Rien à rapporter comme anomalie.

### Plafond de 85 caractères sur `Property_range`

Chaque valeur écrite mesurée avant comparaison à ce que `browsebysubject` a
retourné :

| Propriété | Longueur | Sous le plafond ? | Valeur lue = valeur écrite ? |
|---|---|---|---|
| Work package number | 33 | oui | oui |
| Work package status | 18 | oui | oui |
| Work package summary | 31 | oui | oui |
| Work package opening date | 18 | oui | oui |
| Work package closure date | 18 | oui | oui |
| Work package closure report | 36 | oui | oui |
| Work package depends on | 3 | oui | oui |
| Work package overlaps | 3 | oui | oui |
| Work package revises | 3 | oui | oui |

La plus longue valeur (36 caractères, « permalien de dépôt sur SHA de
commit ») reste à moins de la moitié du plafond. Aucun risque de rejet
silencieux sur cette tâche ; aucune correction nécessaire.

## 6. Contrôle de non-pollution sur `Catégorie:Lot`

`action=browsebysubject&subject=Lot&ns=14`, relevé brut :

```
_MDAT -> ['1/2026/9/1/23/28/8/0']
_SKEY -> ['Lot']
```

Seules les deux clés préfixées d'un souligné, comme attendu. Aucune
annotation sémantique parasite : le texte de la page (trois paragraphes de
prose, un lien vers `[[Gestion des lots]]`) n'a rien émis d'exécutable.

## Écarts et surprises

Aucun écart entre le contenu demandé et le contenu écrit — les dix pages
sont conformes mot pour mot à la consigne, vérifié à la fois par la relecture
implicite du `result: Success` et, plus solidement, par la correspondance
exacte entre les valeurs écrites et les faits SMW relevés en §4-5.

La seule chose à noter, plutôt une confirmation qu'une surprise : le signal
de file (§3) s'est comporté exactement comme documenté dans `CLAUDE.md` —
un « FILE FIGEE » affiché alors que les faits étaient déjà tous propagés au
moment de la vérification. Rien n'a donc été réécrit ni retardé sur la
foi de ce signal.

Aucune page de propriété n'a nécessité de seconde écriture : le verrou de
propagation intermittent, redouté par la consigne, ne s'est pas manifesté
sur ces dix créations.
