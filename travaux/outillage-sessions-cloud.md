# Outillage de `bin/` en session cloud — rapport du 13 octobre 2026

Exécuteur : session Claude Code hébergée (cloud), branche `claude/great-fermi-orlfk0`.

## Ce qui a été fait

### Tâche 1 — branche ramenée

`git fetch origin claude/magical-mayer-lm5dk7` puis `git merge --ff-only FETCH_HEAD` :
avance rapide `1592203..859901f`, sans conflit. Neuf fichiers ajoutés, aucun
modifié : `travaux/lot-21-tache21-trois-mesures.md` et les huit
`pages/Lot21d_essai_0*.txt` (144 insertions).

### Tâches 2 et 3 — chargement du `.env`

Les cinq lignes indiquées figuraient bien à l'identique dans les six scripts
(contrôlé par `grep -B1 -A3` avant modification). Remplacées par le bloc de la
consigne dans `wiki-put.sh`, `wiki-append.sh`, `wiki-move.sh`, `wiki-purge.sh`,
`wiki-upload.sh`, et par la variante à trois variables dans `wiki-login.sh`.
Rien d'autre n'a changé : `git diff --stat` donne 8 lignes modifiées par
fichier, 6 fichiers, 36 insertions, 12 suppressions (2 lignes retirées par
fichier : l'`echo` d'erreur et le `exit 1` ont été déplacés, le `source` a été
ré-indenté dans le `if`).

Avec un `.env` présent, le chemin suivi est le même qu'avant : `ENV_FILE` est
défini, le `source` est exécuté, la branche `elif` n'est jamais évaluée.

## Vérifications

### 1. `grep -c "ni .env (cherché"`

```
bin/wiki-put.sh:1
bin/wiki-append.sh:1
bin/wiki-move.sh:1
bin/wiki-purge.sh:1
bin/wiki-upload.sh:1
bin/wiki-login.sh:1
```

### 2. Les quatre scripts sans argument

Premier passage, avant toute connexion :

```
bin/wiki-put.sh    → Pas de session (cherché .cookies.txt dans /home/user/ecolibre-sgdt/../ecolibre-sgdt-prive puis /home/user/ecolibre-sgdt) : lance d'abord bin/wiki-login.sh   code=1
bin/wiki-append.sh → même message   code=1
bin/wiki-move.sh   → même message   code=1
bin/wiki-purge.sh  → même message   code=1
```

Aucun message sur le `.env` : le chargement a passé. Mais aucun mode d'emploi
non plus, parce que ces scripts contrôlent la présence de `.cookies.txt`
**avant** de lire leurs arguments. Le résultat annoncé par la consigne n'était
donc pas atteignable avant `wiki-login.sh`. Second passage, après la
vérification 3 :

```
bin/wiki-put.sh    → bin/wiki-put.sh: line 36: $1: unbound variable           code=1
bin/wiki-append.sh → bin/wiki-append.sh: line 70: 1: Usage: bin/wiki-append.sh "Page" fichier.txt "résumé"   code=1
bin/wiki-move.sh   → Usage: bin/wiki-move.sh "Titre source" "Titre cible" ["résumé"]   code=1
bin/wiki-purge.sh  → Usage: bin/wiki-purge.sh "Titre 1|Titre 2"   code=1
```

Toujours aucun message sur le `.env`. `wiki-put.sh` n'a pas de mode d'emploi :
il tombe sur `set -u` à la lecture de `$1`. Comportement antérieur à cette
modification (la ligne 36 n'a pas été touchée), non corrigé : voir question A.

### 3. `bin/wiki-login.sh`

```
Success Cywil
code=0
```

Sans `$SGDT_PRIVE` existant, le script écrit les cookies dans
`/home/user/ecolibre-sgdt/.cookies.txt`. Contrôlé avant la connexion :
`git check-ignore -v .cookies.txt` → `.gitignore:4:.cookies.txt`, le fichier
n'est pas versionnable par erreur.

### 4. Droits de la session

`bin/wiki-api.sh "action=query&meta=userinfo&uiprop=rights&format=json&formatversion=2"` :
compte `Cywil`, id 4, 25 droits :

```
deletedhistory, deletedtext, move, move-subpages, move-rootuserpages,
move-categorypages, autopatrol, upload, unwatchedpages, autoconfirmed,
editsemiprotected, ipblock-exempt, browsearchive, suppressredirect,
skipcaptcha, read, createpage, createtalk, writeapi, edit, minoredit, purge,
applychangetags, changetags, editcontentmodel
```

- Attendus présents : `edit`, `createpage`, `move`, `upload`, `browsearchive`,
  `deletedtext`, `deletedhistory` — **tous présents**.
- Attendus absents : `delete`, `patrol`, `rollback`, `upload_by_url` —
  **tous absents**.

Aucun écart avec la liste de la consigne. Droits présents que la consigne ne
mentionne pas, relevés sans rien corriger : `suppressredirect`,
`editcontentmodel`, `ipblock-exempt`, `autopatrol` (distinct de `patrol`). Voir
question B.

### 5. Écriture qui tranche

Fichier temporaire hors du dépôt, dans le scratchpad de la session
(`…/scratchpad/essai-cloud.txt`), une ligne :

```
Essai d'écriture depuis une session cloud de Claude Code, le 13 octobre 2026, sans fichier .env.
```

Création :

```
bin/wiki-put.sh "Utilisateur:Cywil/Bac à sable/Essai session cloud" …/essai-cloud.txt "[Correctif] Essai d'écriture depuis une session cloud, outillage bin/ sans .env" --createonly
→ "new": true, "result": "Success", "pageid": 652, "newrevid": 1578,
  "newtimestamp": "2026-10-13T20:48:23Z"   code=0
```

Relecture par `bin/wiki-get.sh` :

```
Essai d'écriture depuis une session cloud de Claude Code, le 13 octobre 2026, sans fichier .env.
```

Contenu identique à celui écrit (le saut de ligne final est retiré par
MediaWiki à l'enregistrement, comme toujours). Page laissée en place.

## Écarts et surprises

- **Vérification 2** : le mode d'emploi ne pouvait pas s'afficher avant la
  connexion, le contrôle des cookies passant avant celui des arguments. Second
  passage fait après la connexion ; résultat consigné ci-dessus.
- **`wiki-put.sh` n'a pas de mode d'emploi** : sans argument il échoue sur
  `$1: unbound variable`. **`wiki-append.sh`** affiche son mode d'emploi
  préfixé de `line 70: 1:` : c'est la forme d'un `${1:?…}`, le message est
  donc bien un mode d'emploi, mais d'aspect brut.
- **Résumé de modification** : la consigne n'en fixait pas. Aucun lot en cours
  ne couvrait cette écriture ; par la règle 2 des garde-fous, j'ai employé
  `[Correctif]`, faute de libellé mieux adapté.
- **Une commande refusée par interdiction** (« denied ») : en tête des
  vérifications, j'avais joint au `grep -c` un `git diff --stat`, un `ls` sur
  `../ecolibre-sgdt-prive`, `.env` et `.cookies.txt`, et un `grep` dans
  `.gitignore`. Le `ls .env` tombe vraisemblablement sous l'interdiction
  `Read(./.env)`. Commande non contournée ; refaite sous sa forme demandée,
  le `grep -c` seul, puis `git diff --stat` à part. C'était un ajout de ma
  part hors consigne.
- `.claude/settings.local.json` : absent en début comme en fin de tâche.
  Aucune règle.

## Questions

**A.** `bin/wiki-put.sh` lancé sans argument échoue sur `$1: unbound variable`
au lieu d'afficher un mode d'emploi, et `wiki-append.sh` affiche le sien sous
une forme brute (`line 70: 1: Usage: …`). De plus, dans les quatre scripts, le
contrôle de session précède celui des arguments. Faut-il harmoniser ? Ma
suggestion : un lot d'outillage court, qui ajoute à `wiki-put.sh` un contrôle
`[ $# -ge 3 ] || { echo "Usage: …" >&2; exit 1; }` placé avant le chargement
du `.env`, et fait de même dans les autres scripts, pour qu'un appel mal formé
soit signalé comme tel avant toute question de session.

**B.** Le compte porte `suppressredirect` (renommer sans laisser de
redirection), `editcontentmodel` (changer le modèle de contenu d'une page) et
`ipblock-exempt`, que la liste de la consigne ne mentionne ni parmi les
attendus ni parmi les exclus. `wiki-move.sh` n'emploie jamais `noredirect`,
mais un `curl` direct le pourrait. Ces droits sont-ils voulus ? Ma
suggestion : les consigner dans la liste des droits attendus s'ils le sont,
sinon demander à fuzzy de retirer au moins `suppressredirect` et
`editcontentmodel` du groupe du compte, via `demandes-adminsys.md`.

**C.** En session cloud, `$SGDT_PRIVE` n'existe pas, et `wiki-login.sh` écrit
donc les cookies dans le dépôt (`.cookies.txt`, ignoré par git). Le dépôt
étant cloné à neuf à chaque session et le conteneur détruit ensuite, le
risque est faible. Faut-il néanmoins rediriger les cookies hors du dépôt en
session cloud ? Ma suggestion : non pour l'instant ; le `.gitignore` suffit,
et `travaux/` (seul dossier synchronisé par Syncthing) n'est pas concerné.
