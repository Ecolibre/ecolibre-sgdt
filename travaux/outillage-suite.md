# Outillage — suite : doc, contrôle du lot 9, `--facts` sur data vide

Trois choses courtes. La seconde passe (défaut 1 `appendtext`, défaut 7
helper CSRF) reste à faire.

---

## 1. `CLAUDE.md` — les trois diffs, écrits et commités

Commit `e2658c9` — `[Correctif] CLAUDE.md — outillage : purge sans
jeton, et la garantie --createonly datée`. `git show --stat` : 1
fichier, +12 −5. Poussé (`0913ef8..5db9c62`, avec le commit du point 3).

- **Description `wiki-purge.sh`** : « POST + jeton CSRF » → « POST …
  mais pas de jeton CSRF ».
- **Description `wiki-put.sh --createonly`** : la garantie est
  reformulée avec « code de sortie non nul », et suivie d'une
  parenthèse datée : *« Le code de sortie n'était pas vérifié avant le
  28 août 2026 : l'API refusait bien l'écriture, mais le script sortait
  0. Corrigé, commit `0913ef8`. »*
- **Garde-fou d'exécution n° 3** : « doit échouer et remonter (code de
  sortie non nul) », plus la même mention datée — un script
  d'orchestration qui testait `$?` ne voyait pas le refus avant cette
  date.

La mention datée est délibérée : une garantie qui n'existait pas est
signalée comme telle, avec la date et le commit, pas corrigée en
silence.

---

## 2. Contrôle du lot 9 — 73 photos, filet absent à l'époque

L'orchestration des 73 téléversements testait le code de sortie de
`wiki-put.sh`, qui sortait 0 même sur refus de l'API. Contrôle que rien
n'a été perdu.

### Comptes attendus (rapports du lot 9)

`lot-9-tache11-rapport.md` et `lot-9-cloture.md` : **73 fichiers
`ECL-*`**, **65 photos de plantation** (`Depicts_specimen` +
`Catégorie:Photo de plantation`), **8 hors plantation** sans
`Depicts_specimen`, `Image_location` **à jour sur les 73**.

### Comptes observés sur le wiki (28 août 2026)

| Contrôle | Requête | Attendu | Observé |
|---|---|---|---|
| Pages `Fichier:` préfixe `ECL-` | `list=allimages&aiprefix=ECL` | 73 | **73** |
| idem, autre canal | `list=allpages&apnamespace=6&apprefix=ECL` | 73 | **73** |
| Portent `Depicts_specimen` | `[[Depicts_specimen::+]]` en liste | 65 | **65** (tous ns 6) |
| Membres `Catégorie:Photo de plantation` | `list=categorymembers` | 65 | **65** |
| Portent `Image_location` | `[[Image_location::+]]` en liste | 73 | **73** (tous ns 6) |

### Recoupements ensemblistes

- `Depicts_specimen` (65) **⊆** `Image_location` (73) — vérifié, pas
  supposé : les 65 pages à `Depicts_specimen` sont toutes dans les 73 à
  `Image_location`.
- `Image_location` **sans** `Depicts_specimen` = **8**, exactement les
  photos hors plantation :
  - `ECL-Buisson Cerzat-Couleuvre verte et jaune-2026-08-05` ×5 (un
    serpent, faune)
  - `ECL-Buisson Cerzat-Gainage cable-2026-08-07 01`
  - `ECL-Buisson Cerzat-Raboutage cable gaine-2026-08-05` ×2
  Concorde avec la décision de la tâche 8 (8 photos hors plantation,
  sans `Depicts_specimen`).
- `Depicts_specimen` **sans** `Image_location` = **0**.

### Verdict

**Les comptes collent, exactement, sur tous les canaux. Rien n'a été
perdu.** Les 73 photos sont en ligne, les 73 portent `Image_location`,
les 65 photos de plantation portent `Depicts_specimen`, et les deux
fichiers qui avaient dû être re-téléversés à la main après
`duplicate-archive` (Hysope `ECL-0022`, Oignon rocambole `ECL-0029`)
sont présents et annotés. **Rien à corriger. Refermé.**

Le filet manquant n'a rien coûté sur ce lot — mais c'est un constat
après coup, pas une garantie qu'il avait été respecté.

### Note de méthode

`[[Image_location::+]][[Depicts_specimen::!+]]` a rendu `count: 65` —
ni 0 (négation qui rend zéro), ni 73 (négation ignorée) : un troisième
comportement encore. **La négation SMW reste à proscrire** (entrée
n° 23 de *Limites connues*). Le chiffre qui fait foi ici est la
différence ensembliste calculée sur les deux listes complètes (8,
sous-ensemble confirmé), pas une requête à `!+`.

---

## 3. `wiki-api.sh --facts` sur `data` vide — corrigé, appliqué, testé

### Le défaut

`--facts` est le mode le plus utilisé pour vérifier une écriture SMW.
`browsebysubject` sur un sujet inexistant mais bien encodé rend
`query.data: []`. L'ancienne garde ne testait que `data is None`
(clé absente) ; sur la **liste vide**, la boucle ne tournait pas, rien
ne s'affichait, **code de sortie 0**. Même silence que le défaut 2, sur
le mode de vérification d'écriture.

### Le diff (appliqué — commit `5db9c62`)

```diff
-data = d.get("query", {}).get("data")
-if data is None:
-    sys.exit("ERREUR: pas de champ query.data dans la réponse (sujet inexistant, ou réponse inattendue)")
+q = d.get("query", {})
+data = q.get("data")
+if not data:
+    subj = q.get("subject", "?")
+    sys.exit("ERREUR: le sujet « " + subj + " » ne porte aucun fait SMW "
+             "(query.data vide ou absent). Causes possibles : sujet inexistant, "
+             "nom mal orthographié, espace non sémantique, ou écriture pas "
+             "encore propagée. À distinguer de « aucun fait à afficher ».")
```

`if not data` attrape la liste vide **et** l'absence de clé. Le message
nomme le sujet (repris de `query.subject`) et liste les quatre causes,
dont l'espace non sémantique (piège de l'entrée n° 30 de *Limites
connues*) et la propagation en retard (entrée sur la file `_CHGPRO`).

Piège rencontré en écrivant le correctif : le bloc python est passé en
`python3 -c '…'` entre apostrophes bash. `ce n'est pas` a coupé la
chaîne — bash a signalé « EOF prématurée ». Le reste du fichier évite
déjà toute apostrophe dans ces blocs (`l API`, `inconnue`). Reformulé
sans apostrophe ; les accents, eux, passent.

### Tests de déclenchement — codes observés

| Cas | Résultat |
|---|---|
| `--facts "subject=Page_Inexistante_ZZZ_999&ns=0"` | `ERREUR: le sujet « Page_Inexistante_ZZZ_999#0## » ne porte aucun fait SMW …` — **exit 1** |
| `--facts "subject=Lieu&ns=10"` (Modèle:Lieu, espace non sémantique) | même `ERREUR`, **exit 1** |
| `--facts "subject=Catégorie:Lieu&ns=14"` (a des faits) | `_MDAT`, `_SKEY`, `_SUBC` — **exit 0** |
| `--facts` sur item `ECL-0010` | 10 faits affichés — **exit 0** |

`bash -n bin/wiki-api.sh` : syntaxe OK.

---

## État git

```
5db9c62  [Correctif] wiki-api.sh --facts — un sujet sans aucun fait le dit
e2658c9  [Correctif] CLAUDE.md — outillage : purge sans jeton, garantie --createonly datée
0913ef8  [Correctif] Outillage bin/ — les garde-fous d'écriture remontent par le code de sortie
```

Tout poussé sur `origin/main`. `demandes-adminsys.md` (modif
préexistante, pas de cette session) et les fichiers `travaux/` ne sont
dans aucun commit.

---

## Reste pour la seconde passe

- **Défaut 1** — réorganiser *Limites connues* (liste en fin de page) +
  `bin/wiki-append.sh` (`appendtext`, contrôle de résultat, vérification
  après écriture).
- **Défaut 7** — `bin/_wiki-csrf.sh`, helper de jeton partagé.
