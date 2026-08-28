# Outillage `bin/` — trois défauts, lecture et proposition

**Aucun script modifié.** Ce document lit les sept scripts de `bin/`,
qualifie les trois défauts signalés par Cyril, en trouve quatre autres
du même genre, et propose les diffs. Rien n'est appliqué.

Environnement vérifié : `curl 8.5.0` (donc `--fail-with-body` et
`-w '%{http_code}'` disponibles), `bash 5.2.21`.

---

## Résumé

| # | Script | Défaut | Gravité | Verdict |
|---|---|---|---|---|
| 1 | `wiki-put.sh` | réécrit toute la page pour ajouter une ligne | haute | `appendtext` **pas utilisable tel quel** sur *Limites connues* — voir conditions |
| 2 | `wiki-api.sh` | sortie vide + code 0 quand la requête n'aboutit pas | haute | corrigeable, diff fourni |
| 3 | `wiki-purge.sh` | `token` passé à une action qui n'en veut pas | basse | une ligne à retirer, cause confirmée |

Défauts supplémentaires trouvés (§5) :

| # | Script | Défaut |
|---|---|---|
| 4 | `wiki-put.sh` | **ne vérifie jamais le résultat de l'édition** — sort 0 même sur `articleexists`, page protégée, `badtoken`. Casse en silence la garantie `--createonly` annoncée dans `CLAUDE.md`. |
| 5 | `wiki-api.sh` | mode brut (hors `--facts`) n'attrape pas `{"error":…}` — sort 0 en affichant l'erreur |
| 6 | `wiki-get.sh --category` | meurt sans message sur une catégorie **vide** (`grep -v` + `set -e`) |
| 7 | tous les scripts d'écriture | le one-liner de récupération du jeton CSRF est dupliqué 3× et sans garde-fou réseau |

---

## Défaut 1 — `wiki-put.sh` réécrit toute la page

### Ce qui ne va pas

Pour ajouter une entrée à *Limites connues du Système de Gestion de
Données Techniques* (34 entrées, ~24 ko, une entrée de plus par lot),
le seul chemin outillé est :

1. `wiki-get.sh` → fichier local ;
2. édition locale du fichier ;
3. `wiki-put.sh fichier` → `action=edit&text@fichier`, qui **remplace
   l'intégralité** de la page (ligne 60 : `--data-urlencode
   "text@$FILE"`).

Les 24 ko repassent par un fichier retouché à la main. N'importe quel
caractère peut y être corrompu — l'apostrophe perdue dans l'entrée
n° 26 le 27 août était dans une entrée que personne ne touchait ce
jour-là. C'est un défaut de méthode : la primitive « remplacer toute la
page » est la mauvaise primitive pour « ajouter une ligne ».

### `appendtext` est-il applicable ?

L'API expose `action=edit&appendtext=…`, qui ajoute à la fin sans lire
ni renvoyer le reste de la page. La surface de corruption disparaît :
on n'envoie jamais les octets existants.

**Mais pas utilisable tel quel sur *Limites connues*, pour deux
raisons :**

1. **`appendtext` écrit en fin de *page*, pas en fin de *liste*.** La
   page se termine par :

   ```
   # … entrée n° 34 …

   ----
   Page créée le 10 août 2026, à partir de l'audit consolidé dans le cadrage du lot 6.
   ```

   Un `# nouvelle entrée` ajouté à la fin atterrit **après** le filet
   `----` et la ligne de provenance — hors de la liste, non numéroté,
   mise en page cassée.

2. **Une ligne vide entre deux `#` casse la liste numérotée** en deux
   listes qui repartent de 1. Le texte ajouté doit commencer par
   **exactement un** `\n` suivi de `# `, et la dernière ligne de
   contenu de la page doit être un `#` de la liste.

### Ce qu'il faut

**a. Réorganiser *Limites connues* une fois** pour qu'elle se termine
par la liste :

- supprimer le `----` et la ligne « Page créée le 10 août 2026… ». La
  date de création est dans l'historique git, et le chapô dit déjà
  « chaque entrée est datée » ;
- ou, si on tient à garder la provenance à l'écran, la remonter juste
  sous le chapô sous forme de commentaire HTML
  `<!-- Page créée le 10 août 2026… -->` ou de ligne en italique.

Une seule écriture `wiki-put.sh`, à faire dans un lot où on relit la
page de toute façon.

**b. Ajouter `bin/wiki-append.sh "Page" fichier.txt "résumé"`** :

- `action=edit` avec `appendtext@fichier`, `nocreate=1`, `assert=user`,
  `format=json`, `token=<CSRF>` ;
- **jamais** `bot=1`, **jamais** `createonly` (c'est un ajout, pas une
  création) ;
- le fichier d'entrée commence par `\n# ` ;
- vérifie le résultat comme `wiki-upload.sh` : code de sortie non nul si
  `result != "Success"` ou si `{"error":…}` ;
- **vérification après écriture** : re-GET du wikitexte, et contrôle que
  (i) le bloc ajouté est bien présent et est la dernière ligne non
  vide, (ii) le nombre de lignes commençant par `# ` a augmenté
  d'exactement 1. Sinon, avertissement bruyant — l'ajout est annulable
  par l'historique.

  Compter les `# ` *avant* l'ajout est une lecture, mais on ne renvoie
  jamais ce qu'on a lu : la surface de corruption reste nulle.

**c. Portée du script** : réservé aux pages **qui se terminent par la
cible d'ajout** — liste ouverte, journal. À documenter en tête, comme
les autres scripts documentent leur périmètre.

### Repli si on ne veut pas réorganiser

`bin/wiki-put.sh --section N` : GET
`action=parse&prop=wikitext&section=1`, ajout local, PUT
`action=edit&section=1&text=…`. Ne fait repasser que la section 1 (sans
le chapô), pas toute la page. Réduit la surface sans l'annuler — c'est
toujours un lire-modifier-réécrire. Utile comme outil générique « ajouter
à une liste qui n'est pas en fin de page » ; moins propre que `appendtext`
pour *Limites connues*.

**Recommandation : a + b + c.** Le repli `--section` peut venir plus
tard s'il apparaît un cas de liste en milieu de page.

---

## Défaut 2 — `wiki-api.sh` : sortie vide, code 0

### Ce qui ne va pas

Ligne 123 :

```bash
RESPONSE=$(curl "${CURL_OPTS[@]}" "$WIKI_API" --data "${PARAMS}${EXTRA}")
```

`curl` est en `-s` seul (ligne 106 : `CURL_OPTS=(-s -G)`). Aucun
contrôle du code de sortie de `curl`, aucun contrôle du code HTTP,
aucun traitement de la réponse vide. Trois trous :

1. **Transport en échec** (proxy sortant refusant l'hôte le 24 août,
   DNS, coupure) : `curl -s` n'écrit rien sur stderr, `RESPONSE` est
   vide.
2. **Réponse vide traitée comme "aucun résultat".** Le chemin `--facts`
   (lignes 129-133) teste `if "error" in d` et `query.data` — donc il
   remonte une erreur. Mais le **chemin brut** (lignes 138-142) ne teste
   rien : `elif PRETTY=$(… | python3 -m json.tool 2>/dev/null)`. Comme
   c'est la condition d'un `elif`, **`set -e` est désactivé** pour cette
   commande ; `json.tool` échoue en silence (`2>/dev/null`), `PRETTY`
   reste vide, on tombe dans le `else` ligne 141 qui fait
   `printf '%s\n' "$RESPONSE"` → **une ligne vide, code 0**.
3. Même quand `curl` renvoie non-zéro dans `RESPONSE=$(…)`, le
   comportement dépend de subtilités de `set -e` en substitution de
   commande — trop fragile pour qu'on s'y fie.

### Correction proposée

Ajouter en tête (après la ligne 39) un fichier temporaire nettoyé à la
sortie :

```bash
BODY_TMP="$(mktemp)"
trap 'rm -f "$BODY_TMP"' EXIT
```

Ligne 106 — faire écrire `curl` sur stderr en cas d'échec transport :

```diff
-CURL_OPTS=(-s -G)
+CURL_OPTS=(-sS -G)
```

Ligne 123 — capturer le code HTTP, refuser le vide et le non-2xx :

```diff
-RESPONSE=$(curl "${CURL_OPTS[@]}" "$WIKI_API" --data "${PARAMS}${EXTRA}")
+HTTP_CODE=$(curl "${CURL_OPTS[@]}" -w '%{http_code}' -o "$BODY_TMP" \
+  "$WIKI_API" --data "${PARAMS}${EXTRA}") || {
+  echo "ERREUR: requête curl échouée (transport) — hôte injoignable, proxy sortant, ou DNS." >&2
+  exit 1
+}
+RESPONSE=$(cat "$BODY_TMP")
+if [ -z "$RESPONSE" ]; then
+  echo "ERREUR: réponse vide (HTTP ${HTTP_CODE:-?}). Ce n'est PAS « aucun résultat » —" >&2
+  echo "       rien n'est sorti de la machine (proxy, réseau, hôte down)." >&2
+  exit 1
+fi
+if [ "${HTTP_CODE:0:1}" != "2" ]; then
+  echo "ERREUR: HTTP $HTTP_CODE de l'API." >&2
+  printf '%s\n' "$RESPONSE" >&2
+  exit 1
+fi
```

Lignes 138-142 — remplacer le `elif PRETTY=$(…)` (qui masque `set -e`)
par un python qui pense à tester `error` (voir défaut 5) :

```diff
-elif PRETTY=$(printf '%s' "$RESPONSE" | python3 -m json.tool 2>/dev/null); then
-  echo "$PRETTY"
-else
-  printf '%s\n' "$RESPONSE"
-fi
+else
+  printf '%s' "$RESPONSE" | python3 -c '
+import sys, json
+raw = sys.stdin.read()
+try:
+    d = json.loads(raw)
+except json.JSONDecodeError:
+    sys.stderr.write("ERREUR: réponse non-JSON de l API\n")
+    sys.stdout.write(raw + "\n")
+    sys.exit(1)
+print(json.dumps(d, indent=4, ensure_ascii=False))
+if isinstance(d, dict) and "error" in d:
+    e = d["error"]
+    sys.stderr.write("ERREUR API: " + e.get("code","?") + " — " + e.get("info","") + "\n")
+    sys.exit(1)
+'
+fi
```

(Le premier `if` du bloc, `[ "$FACTS_MODE" = 1 ]`, reste inchangé.)

### Compatibilité

Seul appelant interne : `wiki-wait-jobs.sh` ligne 21, qui fait déjà
`2>/dev/null` et teste `[ -z "$jobs" ]` (ligne 30). Après correction,
`wiki-api.sh` sort en erreur sur réponse vide → `jobs` vide → message
« lecture impossible » ligne 31. Comportement conservé, rien à changer
côté `wiki-wait-jobs.sh`.

---

## Défaut 3 — `wiki-purge.sh` : « Unrecognized parameter: token »

### Cause confirmée

`action=purge` **n'a pas de paramètre `token`**. Vérifié en ligne :

```
bin/wiki-api.sh "action=paraminfo&modules=purge"
  → needstoken: None
  → params: forcelinkupdate, forcerecursivelinkupdate, continue,
            titles, pageids, revids, generator, redirects, converttitles
```

`purge` exige POST mais **pas** de jeton CSRF (`needstoken: None`). La
ligne 53 de `wiki-purge.sh` passe quand même `token=$CSRF` → l'API
l'ignore et émet l'avertissement à chaque appel. `CLAUDE.md` et l'en-tête
du script disent « POST + jeton CSRF » : la moitié « jeton » est fausse.

### Correction proposée

```diff
 curl -s -b "$C" -c "$C" "$WIKI_API" \
   --data-urlencode "action=purge" \
   --data-urlencode "titles=$TITLES" \
   --data-urlencode "forcelinkupdate=1" \
-  --data-urlencode "token=$CSRF" \
   -d format=json -d formatversion=2 \
   | python3 -m json.tool
```

En-tête ligne 3-4 :

```diff
-#   Purge une ou plusieurs pages (titres séparés par |), en POST avec jeton
-#   CSRF (action=purge exige POST sur ce wiki, voir CLAUDE.md/leçons de
-#   méthode). forcelinkupdate=1 est toujours ajouté. Aucun autre paramètre
+#   Purge une ou plusieurs pages (titres séparés par |), en POST (action=purge
+#   exige POST sur ce wiki, mais PAS de jeton CSRF — needstoken: None).
+#   forcelinkupdate=1 est toujours ajouté. Aucun autre paramètre
```

**Garder le bloc CSRF (lignes 41-47).** Il ne sert plus à signer la
purge, mais la récupération de `meta=tokens` reste un test de session
utile : le `if [ "$CSRF" = '+\' ]` détecte une session expirée et
renvoie « relance wiki-login.sh » avant de tenter la purge. Ajouter un
commentaire pour dire que c'est désormais sa seule fonction.

Concerne aussi `CLAUDE.md` (section « Outils disponibles », description
de `wiki-purge.sh` : « POST + jeton CSRF ») — à reprendre en même temps,
hors de ce document.

Comme `wiki-put.sh` sera de toute façon réécrite en toute page pour ça,
signalé ici mais à traiter comme une retouche `[Correctif]` de doc, pas
un lot.

---

## §5 — Autres défauts du même genre

### 4. `wiki-put.sh` ne vérifie jamais le résultat de l'édition — GRAVE

Lignes 57-64 : la réponse de `action=edit` part dans
`python3 -m json.tool`, qui **pretty-print et sort 0** quelle que soit
la réponse. Or une édition peut échouer par API :

- `articleexists` quand `--createonly` et que la page existe →
  **`CLAUDE.md` garantit « l'appel doit échouer et remonter, jamais
  écraser »** ; le script sort 0 en affichant l'erreur. La garantie est
  fausse.
- `protectedpage`, `cascadeprotected`, `abusefilter-disallowed`,
  `badtoken`, `readonly`, `spamblacklist` : toutes donnent
  `{"error":…}`, code 0.
- `{"edit":{"result":"Failure"}}` (captcha, conflit) : code 0.

C'est exactement le même trou que le défaut 2, sur le script le plus
sensible. `wiki-upload.sh` (lignes 63-73) fait déjà le bon contrôle —
il suffit de le copier.

**Correction proposée** — lignes 57-64 :

```diff
-curl -s -b "$C" -c "$C" "$WIKI_API" \
+curl -sS -b "$C" -c "$C" "$WIKI_API" \
   --data-urlencode "action=edit" \
   --data-urlencode "title=$PAGE" \
   --data-urlencode "text@$FILE" \
   --data-urlencode "summary=$SUMMARY" \
   --data-urlencode "token=$CSRF" \
   "${EDIT_OPTS[@]}" \
-  | python3 -m json.tool
+  | python3 -c '
+import sys, json
+raw = sys.stdin.read()
+try:
+    d = json.loads(raw)
+except json.JSONDecodeError:
+    sys.stderr.write("ERREUR: réponse non-JSON de l API (transport ?)\n")
+    sys.stdout.write(raw + "\n")
+    sys.exit(1)
+print(json.dumps(d, indent=4, ensure_ascii=False))
+if "error" in d:
+    e = d["error"]
+    sys.stderr.write("ERREUR API: " + e.get("code","?") + " — " + e.get("info","") + "\n")
+    sys.exit(1)
+if d.get("edit", {}).get("result") != "Success":
+    sys.stderr.write("ERREUR: édition non confirmée (result != Success)\n")
+    sys.exit(1)
+'
```

`set -e` + `pipefail` (ligne 9) propagent alors le code non nul :
`wiki-put.sh` sort enfin non-zéro sur échec.

### 5. `wiki-api.sh` mode brut ignore `{"error":…}`

Traité dans le diff du défaut 2 (le python de remplacement teste
`error`). Sans lui : `wiki-api.sh "action=query&list=backlinks&
bltitle=…&blnamespace=zzz"` affiche l'erreur de l'API et **sort 0**.
Le mode `--facts` est déjà correct, le mode brut non.

### 6. `wiki-get.sh --category` meurt sur une catégorie vide

Ligne 70 :

```bash
echo "$OUT" | grep -v '^___CMCONTINUE___'
```

`grep -v` renvoie **1** quand il ne sélectionne aucune ligne — c'est le
cas d'une catégorie vide (`$OUT` ne contient que la ligne sentinelle).
Avec `set -e` (ligne 29), le script meurt là, sans message, sans lister
« 0 membre ». Une catégorie vide est un résultat légitime, pas une
erreur.

**Correction proposée** :

```diff
-    echo "$OUT" | grep -v '^___CMCONTINUE___'
+    echo "$OUT" | grep -v '^___CMCONTINUE___' || true
```

### 7. Le one-liner CSRF, dupliqué 3× et sans garde-fou

`wiki-put.sh` 46-48, `wiki-purge.sh` 41-43, `wiki-upload.sh` 46-48 :
identiques, à `-c "$C"` près.

```bash
CSRF=$(curl -s -b "$C" -c "$C" -G "$WIKI_API" \
  -d action=query -d meta=tokens -d format=json -d formatversion=2 \
  | python3 -c 'import sys,json;print(json.load(sys.stdin)["query"]["tokens"]["csrftoken"])')
```

Si `curl` échoue (réseau), `json.load` lève une exception → **traceback
Python brut** sur stderr, puis `set -e` + `pipefail` coupent. Pas de
« relance wiki-login.sh », juste une pile d'appels. Le
`if [ "$CSRF" = '+\' ]` qui suit ne couvre que le cas « session anonyme »,
pas « API injoignable ».

**Proposition** : un helper `bin/_wiki-csrf.sh` (préfixe `_` = interne,
non appelé directement) qui récupère le jeton, distingue les trois cas
(réseau KO / session expirée / OK) et renvoie un message clair + un code
de sortie. Les trois scripts d'écriture l'appellent :

```bash
CSRF=$("$DIR/bin/_wiki-csrf.sh" "$C") || exit 1
```

Moins prioritaire que 1-4, mais supprime une triplication et un mode
d'échec illisible.

---

## Récapitulatif — rien n'est appliqué

| Fichier | Changement | Défauts couverts |
|---|---|---|
| `bin/wiki-api.sh` | `-sS`, capture HTTP code, refus du vide/non-2xx, python de sortie testant `error` | 2, 5 |
| `bin/wiki-put.sh` | `-sS`, python de sortie testant `error` et `result==Success` | 4 |
| `bin/wiki-purge.sh` | retrait de `token=$CSRF`, en-tête corrigé | 3 |
| `bin/wiki-get.sh` | `|| true` sur `grep -v` ligne 70 | 6 |
| *Limites connues* (page wiki) | supprimer `----` + ligne de provenance pour que la liste soit en fin de page | 1 (préalable) |
| `bin/wiki-append.sh` | **nouveau** — `appendtext`, contrôle de résultat, vérification après écriture | 1 |
| `bin/_wiki-csrf.sh` | **nouveau** — helper jeton CSRF avec messages clairs | 7 |
| `CLAUDE.md` | description `wiki-purge.sh` : retirer « + jeton CSRF » | 3 |

Ordre suggéré : 3 (trivial) → 2 + 4 + 5 (même patron de contrôle, un
passage) → 6 (une ligne) → 1 (réorg page + nouveau script, le plus de
travail) → 7 (confort).
