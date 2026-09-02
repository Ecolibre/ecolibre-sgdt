# Lot 13 — Tâche 2 : modèle, formulaire, définition de la catégorie

**Exécuté le :** 1ᵉʳ septembre 2026 (23h43-23h45 UTC), session Claude Code,
compte `Cywil`. Session ouverte par `bin/wiki-login.sh` avant toute écriture.
Suite de `travaux/lot-13-tache1-proprietes.md`. Aucune page de test créée ;
tous les essais de rendu sont passés par `action=parse&text=` avec
`title=Bac à sable`, sans écriture.

---

## 1. Étape 1 — disponibilité de `#arraymap`

Test par `action=parse` avec `title=Bac à sable` et le texte fourni :

```
{{#arraymap:Lot 12 — Contenants et étiquetage,Gestion des lots|,|@@@@|[[@@@@]]|, }}
```

**Rendu obtenu :** deux liens internes distincts, séparés par une virgule —
`[[Lot 12 — Contenants et étiquetage]]` puis `,` puis `[[Gestion des lots]]`,
tous deux résolus (`exists: true` dans `links`). `#arraymap` est donc
**disponible** sur cette installation.

**Variante retenue : A.** Le modèle est écrit avec les trois appels
`{{#arraymap:...}}` tels que fournis dans la consigne, sans repli sur les
paramètres nus.

## 2. Ce qui a été écrit

| Page | pageid | revid | Méthode | Résumé |
|---|---|---|---|---|
| `Modèle:Lot` | 507 | 1169 | `wiki-put.sh --createonly` | `[Lot 13][Tâche 2] Création Modèle:Lot (variante A, #arraymap disponible)` |
| `Formulaire:Lot` | 508 | 1170 | `wiki-put.sh --createonly` | `[Lot 13][Tâche 2] Création Formulaire:Lot` |
| `Catégorie:Lot` | 497 | 1159 → 1171 | `wiki-put.sh` (édition, page existante) | `[Lot 13][Tâche 2] Catégorie:Lot — définition, structure de page, distinction des trois états` |

`action=query&prop=info` sur `Modèle:Lot` et `Formulaire:Lot` avant écriture :
les deux `"missing": true`. `Catégorie:Lot` relue (`wiki-get.sh`) avant
réécriture : contenu strictement identique aux trois paragraphes posés en
tâche 1, aucune dérive depuis.

Contenus écrits conformes mot pour mot à la consigne (variante A pour le
modèle) — non enveloppés, aucune ligne pliée à l'intérieur d'une annotation
ou d'un lien.

## 3. Étape 5 — vérifications

### 3.1 Rendu du modèle avec valeurs fictives

Deux appels `action=parse&text=` sur `title=Bac à sable`, rien stocké.

**Appel rempli** (`Work_package_number=99`, `status=ouvert`, `summary`,
`opening_date=2026-09-01`, `closure_date` vide, `closure_report` en URL,
`depends_on` sur deux cibles, `overlaps` sur une cible, `revises` vide) :

- Tableau rendu complet, dix lignes, sections « Identification »,
  « Calendrier », « Relations sortantes », « Relations entrantes ».
- `Dépend de` : deux liens internes (`Lot 12 — Contenants et étiquetage`,
  `Gestion des lots`), séparés par une virgule — `#arraymap` fonctionne dans
  le modèle réel, pas seulement dans le test isolé de l'étape 1.
- `Recoupe` : un lien interne (`Lot 12 — Contenants et étiquetage`).
- `Révise` (vide) : tiret cadratin en italique, comme prévu par le repli.
- `Rapports` : l'URL de test rendue en lien externe.
- Les trois requêtes inverses (`Lots qui dépendent…`, `…recoupent`,
  `…révisent`) rendent chacune son message `default=`, faute de vraie page
  de lot portant ces propriétés sur le wiki à ce jour — comportement attendu,
  puisque aucune page de lot n'existe encore.
- `categories`: `[{"category": "Lot"}]` — confirme que `[[Category:Lot]]`
  s'émettrait à l'enregistrement réel ; rien n'est stocké ici, c'est un
  aperçu.

**Appel vide** (`{{Lot}}`) : `''Objet non renseigné.''` en tête,
`'''Numéro non attribué'''`, `''non renseigné''` pour l'état, tirets
cadratins pour les dates — les replis `{{#if:}}` fonctionnent dans les deux
sens (rempli / vide).

### 3.2 `browsebysubject` sur `Modèle:Lot` et `Formulaire:Lot`

```
subject=Lot&ns=10  → ERREUR: aucun fait SMW (sujet inexistant, mal orthographié, espace non sémantique, ou non propagé)
subject=Lot&ns=106 → même erreur
```

**Aucun fait dans les deux cas**, conforme à l'attendu (espaces `Modèle` et
`Formulaire` non sémantiques sur ce wiki, mesuré le 25 août 2026). Rien à
signaler.

### 3.3 `browsebysubject` sur `Catégorie:Lot`, `ns=14`

Relevé brut après la réécriture de l'étape 4 :

```
_MDAT -> 1/2026/9/1/23/45/1/0
_SKEY -> Lot
_SUBC -> SGDT#14##
```

Trois clés, toutes préfixées d'un souligné. `_SUBC` (« Subcategory of »)
est apparue depuis la tâche 1 : conséquence attendue de l'ajout de
`[[Catégorie:SGDT]]` en fin de page à l'étape 4, qui fait de `Lot` une
sous-catégorie de `SGDT` — vérifié que `Catégorie:SGDT` existe bien
(`pageid 26`), donc pas un lien rouge. **Aucune annotation sans
souligné : pas de pollution.**

### 3.4 Membres de `Catégorie:Lot`

`action=query&list=categorymembers&cmtitle=Catégorie:Lot` → `[]`. Zéro
membre, comme attendu : `Modèle:Lot` n'est transclus par aucune page de lot
à ce jour.

## Écarts et surprises

Aucun écart avec la consigne : la variante A a pu être employée telle que
fournie, sans repli sur la variante B. Le modèle rend correctement dans les
deux cas testés (rempli et vide), les trois requêtes inverses fonctionnent
avec leur message d'absence, et aucun des deux contrôles de non-pollution
(`Modèle`/`Formulaire` d'un côté, `Catégorie:Lot` de l'autre) n'a rien
trouvé d'anormal.

Seule chose méritant d'être notée pour la suite, pas une anomalie : la
tâche 3 (pages de lot elles-mêmes) sera la première à faire apparaître un
membre réel dans `Catégorie:Lot` et un résultat non vide dans les trois
requêtes inverses du modèle — rien de tout cela n'a pu être vérifié en
conditions réelles ici, seulement en aperçu.

## 4. Correction du formulaire

**Exécutée le 1ᵉʳ septembre 2026 (23h51 UTC),** suite à deux défauts
constatés après la tâche 2 : le menu déroulant de l'état restait vide (Page
Forms ne lit pas les `Allows value` depuis la propriété sur cette
installation — les valeurs doivent être écrites en dur, comme le fait
`Maturity_level` dans `Formulaire:Referenced item`), et les trois champs de
relation (`Work_package_depends_on`, `Work_package_overlaps`,
`Work_package_revises`) n'avaient pas `list`, contrairement à tous les
champs multivalués existants du wiki.

**Lecture avant écriture :** `wiki-get.sh` sur `Formulaire:Lot`, `diff`
contre le fichier posé à la tâche 2 (`formulaire-lot.txt` du scratchpad de
cette session) — **identique, aucune dérive depuis la tâche 2.** Écriture
autorisée à se poursuivre.

**Écriture :** `wiki-put.sh`, édition standard (page existante) —
`pageid 508`, `oldrevid 1170` → **`newrevid 1172`**, résumé
`[Lot 13][Correctif] Formulaire:Lot — valeurs dropdown en dur, list sur les
champs multivalués`. Résumé sous l'étiquette `[Correctif]` et non `[Lot 13]`
seul, conformément à la règle de `CLAUDE.md` : cette écriture corrige un
défaut, elle ne relève d'aucune tâche numérotée du lot en cours.

**Diff réel :** le champ `Work_package_status` passe de
`input type=dropdown|mandatory` à
`input type=dropdown|values=identifié,cadré,ouvert,livré,clos,abandonné|mandatory` ;
les trois champs `Work_package_closure_report`, `Work_package_depends_on`,
`Work_package_overlaps`, `Work_package_revises` gagnent chacun `|list` avant
leur `|delimiter=,` existant. Le reste du formulaire est inchangé caractère
pour caractère.

**Vérification post-écriture :** `wiki-get.sh` sur `Formulaire:Lot` relue,
comparée par `diff` au texte source de cette correction —
**`diff` ne retourne aucune différence : le contenu enregistré est
identique, caractère pour caractère, à celui demandé.**

`browsebysubject` avec `ns=106` sur `Formulaire:Lot` :

```
ERREUR: le sujet « Lot#106## » ne porte aucun fait SMW (sujet inexistant,
mal orthographié, espace non sémantique, ou écriture pas encore propagée)
```

Aucun fait, comme attendu — l'espace `Formulaire` reste non sémantique sur
ce wiki. Rien à signaler.
