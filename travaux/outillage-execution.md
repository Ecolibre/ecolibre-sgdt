# Outillage `bin/` — première passe de correction

Suite de `outillage-proposition.md`. Défauts **4, 2, 5, 3, 6** traités.
Défauts **1** (réécriture totale / `appendtext`) et **7** (helper CSRF)
reportés à une seconde passe.

Commit : `0913ef8` — `[Correctif] Outillage bin/ — les garde-fous
d'écriture remontent enfin par le code de sortie`. Poussé sur
`origin/main` (`59771f0..0913ef8`).
`git show --stat` : 4 fichiers, +63 −13, **uniquement `bin/`** —
`demandes-adminsys.md` (modif préexistante, pas de moi) et `travaux/`
non touchés.

---

## Ce qui a été appliqué

### Défaut 4 — `wiki-put.sh` ne vérifiait pas le résultat de l'édition

Le plus grave. La réponse de `action=edit` partait dans
`python3 -m json.tool`, qui affiche et **sort 0** quelle que soit la
réponse — `articleexists`, page protégée, `badtoken`, `result:
Failure`. La garantie de `CLAUDE.md` (« `--createonly` fait échouer
l'appel », « l'appel doit échouer et remonter, jamais écraser ») était
fausse au sens du code de sortie : rien n'était écrasé (l'API refusait),
mais un appelant qui teste `$?` ne voyait rien.

- `curl -s` → `curl -sS` (curl écrit sa propre erreur de transport sur
  stderr).
- `json.tool` → python qui : signale une réponse non-JSON (stderr,
  exit 1) ; teste `error` (stderr `ERREUR API: <code> — <info>`,
  exit 1) ; teste `edit.result == "Success"` (stderr, exit 1).
- `set -e` + `pipefail` (déjà en tête du script) propagent le code non
  nul.

### Défauts 2 + 5 — `wiki-api.sh` : sortie vide / code 0, erreurs API ignorées en mode brut

- `mktemp` + `trap … EXIT` en tête, pour recevoir le corps de réponse
  séparément du code HTTP.
- `CURL_OPTS=(-s -G)` → `(-sS -G)`.
- La ligne `RESPONSE=$(curl …)` devient : `curl -w '%{http_code}' -o
  "$BODY_TMP"`, avec
  - `|| { … exit 1; }` sur l'échec de transport (message qui rappelle
    aussi le piège de la chaîne non encodée) ;
  - refus explicite de `RESPONSE` vide — message « ce n'est PAS "aucun
    résultat", rien n'est sorti de la machine » ;
  - refus de tout code HTTP non-2xx.
- Le `elif PRETTY=$(… | python3 -m json.tool 2>/dev/null)` — qui
  **désactivait `set -e`** (condition de `elif`) et avalait les erreurs
  — est remplacé par un `else` avec un python qui pretty-print puis
  teste `error` (stderr, exit 1).
- Le chemin `--facts` (déjà correct : il teste `error` et
  `query.data`) est **inchangé**.

### Défaut 3 — `wiki-purge.sh` : « Unrecognized parameter: token »

`action=purge` **n'a pas** de paramètre `token` — confirmé en ligne :
`action=paraminfo&modules=purge` → `needstoken: None`, `token` absent de
la liste des paramètres. La ligne `--data-urlencode "token=$CSRF"` est
retirée. Le bloc de récupération du jeton CSRF est **conservé** : il ne
signe plus rien, sa seule fonction est de détecter une session expirée
(`CSRF == '+\'`) avant de tenter la purge — un commentaire le dit.
En-tête du script corrigé (« POST avec jeton CSRF » → « POST … mais PAS
de jeton CSRF »).

### Défaut 6 — `wiki-get.sh --category` mourait sur une catégorie vide

`echo "$OUT" | grep -v '^___CMCONTINUE___'` : `grep -v` sort **1**
quand il ne sélectionne aucune ligne — cas d'une catégorie vide
(`$OUT` = la seule ligne sentinelle). Sous `set -e`, le script mourait
là, sans message. `|| true` ajouté.

---

## Tests de déclenchement — codes de sortie **observés**

Consigne : un garde-fou qu'on n'a pas vu se déclencher n'est pas un
garde-fou. Codes réels, pas attendus.

### a) `wiki-put.sh --createonly` sur une page qui existe

Cible : `Catégorie:Lieu` (revid 1082 avant le test).

```
ERREUR API: articleexists — The article you tried to create has been created already.
{ "error": { "code": "articleexists", … } }
exit=1
```

**revid après le test : 1082 — inchangé.** L'API a refusé, le script
sort maintenant **1**. Garde-fou vu se déclencher.

### b) `wiki-api.sh` avec une entrée invalide

- `action=cepasunevraieaction` →
  `ERREUR API: badvalue — Unrecognized value for parameter "action"…`
  sur stderr, **exit=1**.
- `--facts "subject=Page Inexistante ZZZ 999&ns=0"` (espace non
  encodé, le piège de `CLAUDE.md`) →
  `curl: (3) URL rejected: Malformed input to a URL function` (message
  propre de curl grâce à `-S`), puis
  `ERREUR: curl a échoué (code 3) — transport …, ou URL mal formée.
  Rappel : … espace => %20`, **exit=1**.
  Avant cette passe : *code de sortie 3, aucun message* (consigné dans
  `CLAUDE.md`). Désormais signalé.

Nuance observée, **non corrigée** (hors périmètre des 5 défauts) : une
*valeur* invalide pour un sous-paramètre (`blnamespace=zzz`) est un
**warning** MediaWiki, pas une `error` — HTTP 200, `query` présent,
`exit=0`. C'est le comportement correct : la requête a tourné. Seules
les vraies `error` de l'API font sortir non nul.

Autre nuance, **non corrigée** : `--facts` sur un sujet inexistant mais
*bien encodé* rend `data: []` → le script n'affiche rien et sort 0. Le
test `data is None` (ligne 150) n'attrape que l'absence totale de la
clé, pas la liste vide. Pré-existant, pas dans les 5 défauts.

### c) `wiki-purge.sh` sur une page quelconque

Cible : `Utilisateur:Cywil/Bac à sable`.

```
{ "batchcomplete": true, "purge": [ { …, "purged": true, "linkupdate": true } ] }
exit=0
```

**Plus aucun bloc `warnings`.** Le « Unrecognized parameter: token » a
disparu.

### d) `wiki-get.sh --category` sur une catégorie vide

`bin/wiki-get.sh --category "Catégorie:…inexistante…"` →
**sortie vide, exit=0.** Pas de mort silencieuse sous `set -e`.
(Testé avec une catégorie inexistante, qui renvoie zéro membre comme
une catégorie vide.)

### Non-régression

`wiki-api.sh "action=query&meta=siteinfo&siprop=statistics"` → `jobs=0`,
exit 0. (Au passage : la file, figée à 5 lors de la session de mesure du
renommage, est retombée à 0 seule — cohérent avec l'entrée de
`CLAUDE.md` sur ce compteur.)

Chemin *succès* de `wiki-put.sh` : non rejoué en conditions réelles pour
ne pas créer de révision inutile. Le nouveau python reprend la même
forme que `wiki-upload.sh` (qui vérifie `result` depuis le lot 9) sur la
même structure de réponse JSON ; la seule branche non exercée à
l'exécution est le `!= "Success"` négatif.

---

## Point 6 — diff proposé pour `CLAUDE.md` (NON appliqué)

### Description de `wiki-purge.sh` (lignes 23-25)

```diff
-- `bin/wiki-purge.sh "Titre 1|Titre 2"` — purger une ou plusieurs pages
-  (POST + jeton CSRF, `forcelinkupdate=1` systématique). Aucun autre
-  paramètre, aucune autre action que purge.
+- `bin/wiki-purge.sh "Titre 1|Titre 2"` — purger une ou plusieurs pages
+  (POST, `forcelinkupdate=1` systématique ; `action=purge` exige POST
+  mais pas de jeton CSRF). Aucun autre paramètre, aucune autre action
+  que purge.
```

### Description de `wiki-put.sh` (lignes 11-13)

```diff
 - `bin/wiki-put.sh "Page" fichier.txt "résumé" [--createonly]` — écrire une page ;
-  `--createonly` fait échouer l'appel si la page existe déjà (`articleexists`) au
-  lieu de l'écraser — à utiliser pour toute création
+  `--createonly` fait échouer l'appel — code de sortie non nul, `articleexists`
+  sur stderr — si la page existe déjà, au lieu de l'écraser ; à utiliser pour
+  toute création. (Le code de sortie n'était pas vérifié avant le 28 août 2026 :
+  l'API refusait bien l'écriture, mais le script sortait 0. Corrigé, commit
+  `0913ef8`.)
```

### Garde-fou d'exécution n° 3 (lignes 136-137)

```diff
 3. **`createonly=1`** sur toute création de page. Si la page existe déjà, l'appel
-   doit échouer et remonter, jamais écraser.
+   doit échouer et remonter (code de sortie non nul), jamais écraser. Effectif
+   par le code de sortie depuis le 28 août 2026 seulement — avant, `wiki-put.sh`
+   affichait l'erreur `articleexists` mais sortait 0 ; un script d'orchestration
+   qui testait `$?` ne voyait pas le refus.
```

---

## Point 7 — noté, pas traité

**Le script d'orchestration des 45 photos (lot 9) s'arrêtait « au
premier échec » en testant le code de sortie de `wiki-put.sh`.** Ce
garde-fou n'existait pas : `wiki-put.sh` sortait 0 même quand l'API
refusait. Une photo dont l'écriture de page échouait (nom déjà pris,
filtre anti-abus, session tombée en cours de lot) était comptée comme
posée, et l'orchestration continuait.

**Il existe à partir de maintenant** (commit `0913ef8`). Tout script qui
enchaîne des `wiki-put.sh` et teste `$?` — ou tourne sous `set -e` —
s'arrête désormais réellement au premier refus.

À rejouer mentalement sur le lot 9 si un doute subsiste sur une photo :
un `result` non-`Success` a pu passer inaperçu à l'époque.

---

## Reste pour la seconde passe

- **Défaut 1** : réorganiser *Limites connues* pour que la liste soit
  en fin de page, puis `bin/wiki-append.sh` (`appendtext`, contrôle de
  résultat, vérification après écriture). Repli `wiki-put.sh --section`
  pour les listes en milieu de page.
- **Défaut 7** : `bin/_wiki-csrf.sh`, helper de jeton CSRF partagé par
  `wiki-put.sh` / `wiki-purge.sh` / `wiki-upload.sh`, avec messages
  clairs sur les trois cas (réseau KO / session expirée / OK).
- **`CLAUDE.md`** : appliquer les trois diffs ci-dessus.
