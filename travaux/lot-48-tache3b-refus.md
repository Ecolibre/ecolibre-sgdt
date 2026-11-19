# Lot 48 — suite de la tâche 3 : refus étendu aux numéros et au JSON

Session locale sur le Framework, 19 novembre 2026, branche `main`, après le
commit `60b3176`. Aucune écriture sur le wiki. Cette suite répond à la
question A de la tâche 3 : les trois cas sont fermés selon les suggestions,
et les listes qui couvrent tous les espaces restent permises.

**Résultat : les six nouveaux essais sont refusés. La relance des seize refus
et des trois témoins de la tâche 3 rend des résultats identiques. Les témoins
réels en lecture réussissent.**

## Étape 1 — État du dépôt

- `git fetch origin` : `main` alignée sur `origin/main`, 0 commit de retard.
- `git status --porcelain` : sortie vide.
- `.claude/settings.local.json` au début : fichier absent, donc aucune règle.

## Étape 2 — Détecteur, diff

`git diff --numstat` : `bin/_refus-formation.py` +14 −1,
`bin/wiki-api.sh` +3 −1 (commentaire seul).

```diff
--- a/bin/_refus-formation.py
+++ b/bin/_refus-formation.py
@@ -7,6 +7,9 @@
 # appellent ce détecteur avant tout appel réseau et s'arrêtent s'il refuse.
 # Aucune exception, aucune variable pour lever le refus : le travail sur ces
 # espaces se fait dans le dépôt privé formation-cao.
+# Depuis la suite de la tâche 3, le mode paramètres refuse aussi le JSON de
+# smwbrowse qui vise ces espaces, et toute page visée par son numéro
+# (pageids, revids, oldid…), que le contrôle par nom ne peut pas voir.
 #
 # Usage (helper interne, lancé par python3 -I) :
 #   _refus-formation.py --titre "T1" ["T2|T3" ...]
@@ -20,8 +23,11 @@ from urllib.parse import unquote_plus
 
 NOMS = r"(?:cao|solidworks|freecad|onshape|fusion|inventor|catia)"
 TITRE_RE = re.compile(r"^(?:discussion +)?" + NOMS + r" *:", re.IGNORECASE)
-DANS_VALEUR_RE = re.compile(r"(?:^|[\[|:= ])" + NOMS + r" *:", re.IGNORECASE)
+DANS_VALEUR_RE = re.compile(r"(?:^|[\[|:= \"{,])" + NOMS + r" *:", re.IGNORECASE)
+NS_JSON_RE = re.compile(r"\bns\"? *: *\"?(?:50[2-9]|51[0-5])(?!\d)")
 NUMEROS = {str(n) for n in range(502, 516)}
+PAR_NUMERO = {"pageids", "pageid", "revids", "oldid", "fromid", "toid",
+              "fromrev", "torev"}
 
 
 def normaliser(titre, decoder=True):
@@ -52,6 +58,13 @@ def mode_params(chaine):
         nom, _, valeur = paire.partition("=")
         nom = unquote_plus(nom)
         valeur = unquote_plus(valeur)
+        if nom in PAR_NUMERO:
+            sys.stderr.write("ERREUR: refus - '" + nom + "' vise une page par "
+                             "son numéro, ce qui échappe au contrôle des "
+                             "espaces de formation.\n")
+            sys.exit(1)
+        if NS_JSON_RE.search(valeur):
+            refuser(valeur)
         for morceau in valeur.split("|"):
             if titre_refuse(morceau, decoder=False):
                 refuser(morceau)
--- a/bin/wiki-api.sh
+++ b/bin/wiki-api.sh
@@ -94,7 +94,9 @@ PARAMS="$1"
 # Lot 48 : refus des espaces de formation, sur la chaîne telle que reçue,
 # avant la transformation de --facts et tout appel réseau. En --facts, la
 # valeur de subject passe par la règle des titres et ns=502 à 515 est
-# refusé par la règle des paramètres ns.
+# refusé par la règle des paramètres ns. Sont aussi refusés le JSON de
+# smwbrowse qui vise ces espaces et toute page visée par son numéro
+# (pageids, revids, oldid, fromrev…).
 python3 -I "$(dirname "${BASH_SOURCE[0]}")/_refus-formation.py" --params "$PARAMS" || exit 1
```

## Étape 3 — Essais

Ils ont été lancés par un script de session affiché avec son lancement, avec
`https_proxy`, `HTTPS_PROXY` et `http_proxy` sur `http://127.0.0.1:9`. Le
témoin du proxy a fonctionné : la lecture autorisée `wiki-get.sh "Accueil"`
échoue faute de réponse (code 1, `JSONDecodeError`). Le réseau était donc
coupé, et les lignes ERREUR ci-dessous viennent du détecteur.

### Nouveaux essais (attendus : refus)

| Commande `bin/wiki-api.sh …` | Code | Message |
|---|---|---|
| `"action=smwbrowse&browse=subject&params=%7B%22subject%22%3A%22CAO%3Ax%22%2C%22ns%22%3A502%7D"` | 1 | ERREUR: refus - '{"subject":"CAO:x","ns":502}' vise un espace de formation, réservé au dépôt formation-cao. |
| `"action=smwbrowse&browse=subject&params=%7B%22subject%22%3A%22x%22%2C%22ns%22%3A510%7D"` | 1 | ERREUR: refus - '{"subject":"x","ns":510}' vise un espace de formation, réservé au dépôt formation-cao. |
| `"action=query&prop=revisions&pageids=725"` | 1 | ERREUR: refus - 'pageids' vise une page par son numéro, ce qui échappe au contrôle des espaces de formation. |
| `"action=query&prop=revisions&revids=1809"` | 1 | ERREUR: refus - 'revids' vise une page par son numéro, … |
| `"action=parse&oldid=1809"` | 1 | ERREUR: refus - 'oldid' vise une page par son numéro, … |
| `"action=compare&fromrev=1&torev=1809"` | 1 | ERREUR: refus - 'fromrev' vise une page par son numéro, … |

### Relance des essais de la tâche 3 (attendus : inchangés)

| Commande | Code | Message |
|---|---|---|
| `wiki-get.sh "CAO:Titre factice"` | 1 | ERREUR: refus - 'CAO:Titre factice' vise un espace de formation, réservé au dépôt formation-cao. |
| `wiki-get.sh "Discussion_CAO:Titre factice"` | 1 | ERREUR: refus - 'Discussion_CAO:Titre factice' … |
| `wiki-get.sh "solidworks:x"` | 1 | ERREUR: refus - 'solidworks:x' … |
| `wiki-get.sh ":Fusion:x"` | 1 | ERREUR: refus - ':Fusion:x' … |
| `wiki-get.sh --category "Catia:x"` | 1 | ERREUR: refus - 'Catia:x' … |
| `wiki-put.sh "FreeCAD:x" /dev/null "essai"` | 1 | ERREUR: refus - 'FreeCAD:x' … |
| `wiki-append.sh "Onshape : x" /dev/null "essai"` | 1 | ERREUR: refus - 'Onshape : x' … |
| `wiki-move.sh "Accueil" "Inventor:x"` | 1 | ERREUR: refus - 'Inventor:x' … |
| `wiki-purge.sh "Accueil\|CAO:x"` | 1 | ERREUR: refus - 'CAO:x' … |
| `wiki-verify.sh "Discussion Fusion:x" /dev/null` | 1 | ERREUR: refus - 'Discussion Fusion:x' … |
| `wiki-api.sh "action=query&titles=Accueil\|FreeCAD:x"` | 1 | ERREUR: refus - 'FreeCAD:x' … |
| `wiki-api.sh "action=query&list=allpages&apnamespace=504"` | 1 | ERREUR: refus - 'apnamespace=504' … |
| `wiki-api.sh "action=query&list=search&srsearch=x&srnamespace=*"` | 1 | ERREUR: refus - 'srnamespace=*' … |
| `wiki-api.sh "action=ask&query=%5B%5BOnshape%3A%2B%5D%5D"` | 1 | ERREUR: refus - '[[Onshape:+]]' … |
| `wiki-api.sh --facts "subject=Essai lot 48&ns=502"` | 1 | ERREUR: refus - 'ns=502' … |
| `wiki-api.sh --facts "subject=CAO:Essai lot 48"` | 1 | ERREUR: refus - 'CAO:Essai lot 48' … |
| détecteur `--titre "Accueil" "Catégorie:Lot" "Fusion de deux pages" "CAOutchouc" "Lot 48 essai"` | 0 | (rien) |
| détecteur `--params "action=query&list=allpages&apnamespace=0"` | 0 | (rien) |
| détecteur `--params "action=query&list=recentchanges&rcnamespace=0\|102"` | 0 | (rien) |

(« … » : la fin de ligne, identique dans chaque famille de messages.) Les
messages sont identiques, caractère pour caractère, à ceux de la tâche 3.

### Témoins négatifs réels, en lecture, sans proxy

Seuls les codes et des comptes ont été affichés : la réponse de
`recentchanges` peut contenir des titres de formation.

| Commande | Code | Résultat |
|---|---|---|
| `wiki-api.sh --facts "subject=Accueil&ns=0"` | 0 | 3 lignes de faits |
| `wiki-api.sh "action=query&list=recentchanges&rclimit=1&format=json"` | 0 | bloc `recentchanges` présent |
| `wiki-api.sh "action=query&meta=siteinfo&format=json"` | 0 | `sitename` présent |
| `wiki-get.sh "Accueil"` (témoin de la tâche 3) | 0 | 1 642 octets |

## Relevé de `.claude/settings.local.json`

- Début de tâche : fichier absent.
- Fin de tâche : fichier absent.

## Questions posées et réponses rendues hors consigne

Aucune.

## Écarts et surprises

1. **La consigne parle de « 19 essais refusés » de la tâche 3. Il y en avait
   seize**, plus trois témoins négatifs sur le détecteur seul : 19 lignes en
   tout. J'ai relancé les dix-neuf, et les deux témoins réels de la tâche 3.
2. `bin/wiki-api.sh` n'a reçu qu'un complément de commentaire. Tout le refus
   vit dans le détecteur, qui est déjà appelé sur la chaîne entière.
3. Le refus par numéro ne vaut qu'en mode paramètres, donc dans `wiki-api.sh` ;
   les autres scripts ne prennent que des titres.
4. **`revid` n'est pas dans la liste** et reste permis (mesuré : code 0 sur
   `action=expandtemplates&text=x&revid=1809`). Dans `expandtemplates` et
   `parse`, ce paramètre ne fixe que le contexte de rendu (`{{REVISIONID}}`) :
   le contenu vient de `text=`. Je n'ai pas élargi la liste fixée par la
   consigne.
5. La règle `"ns": 502…515` s'applique à toute valeur, pas seulement au
   JSON : une recherche plein texte de `ns:510` est refusée (mesuré, code 1).
   C'est un refus par excès, sans conséquence pratique connue.
6. Le premier essai `smwbrowse` remplit deux conditions de refus :
   `"CAO:` après un guillemet, et `"ns":502`. Le message cite la valeur
   entière, parce que la règle des numéros est contrôlée la première. Le
   second essai n'est refusé que par la règle des numéros, ce qui la prouve
   seule.
