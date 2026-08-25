# Clôture du 25 août 2026 — dépôt poussé, deux entrées écrites

**Trois commits, deux écritures sur le wiki, dépôt à jour.**

---

## 1. Le dépôt — inventaire avant commit, puis deux commits et un push

### Ce qui allait être commité

**25 fichiers** : 23 rapports de `travaux/` (non suivis), plus `CLAUDE.md` et
`demandes-adminsys.md` (modifiés).

### Ce qui ne devait jamais être poussé — et ne l'a pas été

Balayage sur les 25 fichiers avant de stager, sur les motifs habituels
(`password`, `secret`, `token`, `api_key`, chaînes de 32+ caractères) :
**aucun secret**. Les seules correspondances sont des hachages de requêtes
SMW (`8abf92b9a496fa12811f646f040f3025`), des types d'entrée Page Forms
(`input type=tokens`), l'alphabet Base36 de `Module:Base36`, et une
**mention** de la rotation de mot de passe à faire — jamais une valeur.

Le `.gitignore` couvre par ailleurs, et j'ai vérifié qu'il tient :

| Écarté | Motif |
|---|---|
| `.env`, `.env.*`, `.cookies.txt` | secrets et session |
| `Serveur3/` | copies de configuration serveur — mot de passe DB, clé secrète, clé de mise à jour |
| `.claude/settings.local.json` | chemins et comptes système locaux |
| `travaux/*` sauf `*.md` | tout ce que Syncthing dépose depuis le téléphone |
| `.stfolder/`, `.stversions/` | artefacts Syncthing |

Deux dossiers Syncthing (`travaux/.stfolder/`,
`travaux/.stfolder.removed-20260819-170509/`) sont bien restés ignorés.

**Rien à signaler : aucun fichier n'a dû être écarté à la main.**

### Les deux commits

**`3aba12d` — `[Lot 11] Rapports — classe Organisation, Owned_by, Wanted_by,
rang en segment`**

```
23 files changed, 5686 insertions(+)
```

Zéro suppression, cohérent avec 23 créations de fichiers.

**`5e9ee2d` — `[Lot 11] CLAUDE.md et demandes-adminsys — leçons et espaces non
sémantiques`**

```
CLAUDE.md            |  15 ++++++++
demandes-adminsys.md | 102 ++++++++++++++++++++++++++++-----------
2 files changed, 98 insertions(+), 19 deletions(-)
```

**Les 19 suppressions ont été lues avant de commiter**, comme l'exige le
garde-fou : ce sont celles de Cyril, qui avait requalifié l'entrée
`$smwgChangePropagationProtection` — l'ancienne version généralisait « le
verrou se redéclenche à chaque création de propriété » depuis un cas unique.
**Aucune ne vient de mon écriture** : mon ajout à `demandes-adminsys.md`
comptait 43 lignes et n'en supprimait aucune (40 insertions avant, 83 après,
19 suppressions inchangées).

### Le push

```
1501710..5e9ee2d  main -> main
```

**Le dépôt public ne s'arrêtait plus au 21 août.** Tout ce qui s'est décidé
depuis y figure.

---

## 2. *Limites connues du SGDT* — entrée 30

Écrite telle que rédigée, avec les deux ajouts validés (revid 991 → **998**).
Résumé : `[Amendement] Entrée — #show sur un espace non sémantique rend son
default sans signal`.

```
entrées avant ajout : 29
lignes ajoutées     : 1
lignes supprimées   : 0
entrées après ajout : 30
```

Relecture après écriture : **écart nul** avec le fichier proposé.

Les deux ajouts, l'un et l'autre dans la version écrite : la liste des trois
espaces avec le nom du réglage (`Modèle` 10, `Formulaire` 106, `Module` 828,
absents de `$smwgNamespacesWithSemanticLinks`), et le corollaire de
diagnostic —

> avant de conclure qu'une annotation manque, vérifier que son espace de noms
> est sémantique — un `default=` ne distingue pas « propriété absente »,
> « page absente » et « espace non sémantique ».

C'est bien la partie réutilisable : elle transforme un constat ponctuel en
réflexe de diagnostic.

---

## 3. `CLAUDE.md` — la puce allongée, pas dédoublée

```
CLAUDE.md | 10 ++++++++++
1 file changed, 10 insertions(+)
```

**Dix lignes ajoutées, aucune supprimée.** La règle existante sur le retour à
la ligne dans `[[ ]]` reste intacte ; le paragraphe nouveau s'y attache et
nomme ce qu'elle ne disait pas — **d'où vient le pli** :

> Le pli peut venir de la mise en page d'un rapport, pas du texte. […] Le
> remettre sur une seule ligne au moment de la copie n'est pas une
> modification du texte, c'est ce qui le préserve.

Contrôle : `grep` rend **1 seule** occurrence de « retour à la ligne à
l'intérieur » — pas de doublon créé. 26 puces de premier niveau dans la
section, une de plus qu'avant n'aurait rien apporté qu'une dilution.

---

## 4. Les vérifications

### `browsebysubject` sur *Limites connues* : aucune annotation parasite

```
_MDAT -> ['1/2026/8/25/21/21/56/0']
_SKEY -> ['Limites connues du Système de Gestion de Données Techniques']

clés : ['_MDAT', '_SKEY']
ANNOTATIONS PARASITES : AUCUNE
```

Le `<nowiki>` a tenu sur les trois fragments dangereux de l'entrée 30 —
`#show`, `$smwgNamespacesWithSemanticLinks`, et surtout
`[[Object_description_FR::+]]`, qui sans protection aurait annoté la page.
Le seul `[[ ]]` réel de l'entrée est le lien de navigation vers
*Récapitulatif technique*, écrit sur une seule ligne.

**Pas de `_ASK` non plus** — la page décrit des requêtes, elle n'en exécute
aucune. Absence attendue, et signe de plus que rien ne s'y est exécuté par
accident.

### La page rend

```
entrées numérotées rendues : 30
marqueur d'erreur          : False
entrée 30 présente         : True
lien vers Récapitulatif    : True
```

*(Le contrôle « accolade nue » ressort à `True`, et c'est normal : cinq
`{{#if:}}`, `{{#ifexpr:}}` et `{{#ask:}}` apparaissent en clair dans le rendu
— ce sont les exemples échappés des entrées 37 et 43, préexistantes. Aucun ne
vient de l'entrée 30. Vérifié un par un.)*

### Erreurs de traitement SMW : toujours 1

```
COUNT 1
 - Attribut:INSEE code
```

Même page, préexistante, seule en erreur depuis le 21 août.

### Dépôt propre et poussé

Un **troisième commit** a été nécessaire : l'amendement de `CLAUDE.md` (§3)
et ce rapport ont été écrits *après* les deux premiers, comme le voulait
l'ordre des tâches.

```
940de79  [Lot 11] CLAUDE.md — d'où vient le pli d'un lien, et clôture du 25 août
5e9ee2d  [Lot 11] CLAUDE.md et demandes-adminsys — leçons et espaces non sémantiques
3aba12d  [Lot 11] Rapports — classe Organisation, Owned_by, Wanted_by, rang en segment
```

```
git status --short  -> (vide)
## main...origin/main   (aucun écart)
origin/main -> 940de79
HEAD        -> 940de79
```

**Dépôt propre, local et distant au même point.**

---

## 5. Ce que cette clôture laisse en état

**Sur le wiki**, tout ce qui a été écrit aujourd'hui est vérifié : classe
Organisation et ses quatre propriétés, `Owned_by` sur 44 items, `Wanted_by`
sur les deux classes de conception, *Avancement du jardin-forêt*
restructurée et sa section *Recherché*, `Planting_rank_end`, la
documentation de la facette végétale, deux entrées de *Limites connues*.
Erreurs de traitement SMW : **1**, la même qu'au matin.

**Dans le dépôt**, 25 fichiers commités en deux temps et poussés, plus ce
rapport et l'amendement de `CLAUDE.md`.

**Restent ouverts, et personne ne les a oubliés :**

- les **12 pages d'essai du lot 11** attendent leur suppression par Cyril,
  inventoriées dans `recherche-proposition.md` §3, avec l'ordre à tenir ;
- les **espaces de noms non sémantiques** — entrée de constat dans
  `demandes-adminsys.md` §2.2, à discuter avec fuzzy, avec la réserve qui
  peut conclure au statu quo ;
- **`Attribut:INSEE code`**, seule page encore sous
  `smw-change-propagation-protection` depuis le 21 août ;
- la **colonne `Planting_rank_end`** de la page d'avancement, qui attend
  qu'une plantation porte réellement une fin ;
- la **divergence `Image_location` / `Located_at`** — 45 photos portent
  encore un nom de lieu que plus aucune plantation n'utilise.
