# swowl 1.2.4 sur le poste Ubuntu — installation et contrôle de non-perte par triplets

Date : 26 octobre 2026.
Machine : poste de Cyril, Framework 16.
Système : Ubuntu 26.10 (noyau Linux 7.3.0-9-generic).
Python : 3.14.8.
swowl : 1.2.4 (`backend/version.py`), commit `cbcf8a8` du 2026-10-26 16:16:10 +0100, cloné dans `~/swowl`.

Ce poste disposait déjà de git, curl, jq, unzip et Claude Code ; seul `python3-venv` manquait.

## Résultat principal

**Zéro triplet absent de l'export, pour Q2U comme pour OSE.** Tous les nombres attendus sont retrouvés à l'identique ; aucun écart avec le relevé fait sur l'autre machine sous Python 3.14.4.

## Versions installées (étape 2)

Par `.venv/bin/pip install -r backend/requirements.txt`, sans erreur sous Python 3.14.8 (issue 16 confirmée corrigée). pip mis à jour en 26.2.2. `pip freeze` :

```
annotated-doc==0.0.5
annotated-types==0.8.0
anyio==4.15.1
click==8.5.0
fastapi==0.162.0
h11==0.16.0
httptools==0.9.0
idna==3.20
lxml==6.1.3
opentelemetry-api==1.45.1
pydantic==2.14.1
pydantic_core==2.50.1
pyparsing==3.3.3
pypdf==6.21.2
python-docx==1.2.0
python-dotenv==1.2.4
python-multipart==0.0.32
PyYAML==6.0.3
rdflib==7.6.0
starlette==1.10.0
typing-inspection==0.4.4
typing_extensions==4.16.0
uvicorn==0.54.0
uvloop==0.23.0
watchfiles==1.3.0
websockets==17.3
```

`ontologie/swowl-requirements.txt` n'a pas été utilisé.

## Commandes réellement passées

```
git fetch origin && git status -sb          # ## main...origin/main, aucune fusion nécessaire
git clone https://github.com/MyShivaRepo/swowl.git ~/swowl
git -C ~/swowl log -1 --format='%h %ad' --date=iso
grep VERSION ~/swowl/backend/version.py
python3 -m venv ~/swowl/.venv
~/swowl/.venv/bin/pip install -q --upgrade pip
~/swowl/.venv/bin/pip install -q -r ~/swowl/backend/requirements.txt
~/swowl/.venv/bin/pip freeze
~/swowl/.venv/bin/python -c "import sys; sys.path.insert(0, '/home/cyril/swowl/backend'); import main; print('module charge')"
mkdir -p ~/swowl-data && setsid nohup ~/swowl/.venv/bin/uvicorn main:app --app-dir ~/swowl/backend --host 127.0.0.1 --port 8000 > ~/swowl/swowl.log 2>&1 < /dev/null &
curl -sS --retry 15 --retry-delay 2 --retry-connrefused -o /dev/null -w "page d'accueil : HTTP %{http_code}\n" http://127.0.0.1:8000/
curl -sS http://127.0.0.1:8000/api/version
curl -sS -X POST http://127.0.0.1:8000/api/ontologies/import-from-path -H "Content-Type: application/json" -d @/tmp/imp-q2u.json | python3 -c "…"
curl -sS -X POST http://127.0.0.1:8000/api/ontologies/import-from-path -H "Content-Type: application/json" -d @/tmp/imp-ose.json | python3 -c "…"
curl -sS "http://127.0.0.1:8000/api/ontologies/Q2U_Ontology/export?fmt=owl" -o /tmp/out_q2u.owl
curl -sS "http://127.0.0.1:8000/api/ontologies/OSE_BusinessOntology/export?fmt=owl" -o /tmp/out_ose.owl
~/swowl/.venv/bin/python ~/ecolibre-sgdt/ontologie/swowl-controle-perte.py <Q2U source> /tmp/out_q2u.owl <OSE source> /tmp/out_ose.owl
~/swowl/.venv/bin/python ~/ecolibre-sgdt/ontologie/swowl-compte.py <mêmes arguments>
grep -c 'OpenSourceEcology#q2u:' /tmp/out_ose.owl
```

Le filtre `python3 -c "…"` des imports est celui de la consigne, inchangé.

## Démarrage (étape 3)

- Page d'accueil : **HTTP 200**.
- `/api/version` : `{"version":"1.2.4"}`.
- Écoute sur 127.0.0.1:8000 uniquement. swowl est laissé allumé.

## Import (étape 5)

| | classes | propriétés objet | propriétés de données | individus | imports | avertissements |
|---|---|---|---|---|---|---|
| Q2U | 18 | 12 | 4 | 91 | 0 | aucun |
| OSE | 76 | 138 | 10 | 5 | 1 | 1 |

Avertissement OSE, texte exact : « 5 expression(s) de classe anonyme(s) orpheline(s) (aucun axiome) ignorée(s) — sans effet sémantique. »

## Contrôle de non-perte par triplets (étape 6)

```
--- …/Q2U_Ontology/Q2U_Ontology.owl
  triplets source                : 598
  triplets export                : 598
  triplets concrets a retrouver  : 446
  ABSENTS DE L'EXPORT            : 0
--- …/OSE_BusinessOntology/OSE_BusinessOntology.owl
  triplets source                : 1470
  triplets export                : 1441
  triplets concrets a retrouver  : 684
  ABSENTS DE L'EXPORT            : 0
```

**Aucun triplet absent**, ni pour Q2U ni pour OSE.

## Comptes par prédicat (étape 6, `swowl-compte.py`)

| | triplets | classes nommées | propriétés objet | propriétés de données | restrictions | individus |
|---|---|---|---|---|---|---|
| Q2U source | 598 | 18 | 12 | 4 | 29 | 91 |
| Q2U export | 598 | 18 | 12 | 4 | 29 | 91 |
| OSE source | 1470 | 75 | 138 | 10 | 164 | 5 |
| OSE export | 1441 | 76 | 138 | 10 | 164 | 5 |

Identifiants mal formés (`OpenSourceEcology#q2u:` dans l'export OSE) : **0**.

Les deux écarts attendus sont retrouvés : 1441 triplets au lieu de 1470, et 76 classes au lieu de 75. Vérification complémentaire faite en ligne de commande : le seul triplet concret de l'export OSE absent de la source est `q2u:Quantity rdf:type owl:Class`, la déclaration de la classe importée. L'écart de classes vient donc bien de là.

## Incidents et adaptations

- **Vérification du chargement** : au lieu de `cd ~/swowl/backend && python -c "import main"`, le répertoire `backend` a été ajouté à `sys.path` dans la commande, pour ne pas déplacer le répertoire courant de la session (règle du `CLAUDE.md` sur `cd`). Effet identique : « module charge ».
- **Attente du port** : faite par `curl --retry 15 --retry-delay 2 --retry-connrefused` (plafond d'environ 30 s), sans boucle. Le premier essai a échoué en connexion refusée, le suivant a rendu 200.
- **Fichiers JSON d'import** : écrits dans `/tmp/imp-q2u.json` et `/tmp/imp-ose.json` avec l'outil d'écriture de fichier plutôt que par `cat > … <<EOF` (règle du `CLAUDE.md`), `$HOME` développé en `/home/cyril`. Contenu identique à la consigne.
- **swowl non modifié** : `git -C ~/swowl status --short` ne montre que `swowl.log`, non suivi (le `.venv` est ignoré par swowl).

## Limite de la méthode, à noter

Le contrôle par triplets ne compare que les triplets **sans nœud anonyme** : 446 sur 598 pour Q2U, 684 sur 1470 pour OSE. Les restrictions et autres expressions anonymes (les 164 restrictions d'OSE, par exemple) n'y sont vérifiées que par leur nombre, dans `swowl-compte.py`. Un défaut de remplacement d'identifiant à l'intérieur d'une restriction ne serait donc pas vu par ce contrôle. De plus, le contrôle va de la source vers l'export : un triplet ajouté par l'export n'est pas signalé (vérifié ici à la main pour OSE, voir plus haut). Une comparaison par isomorphisme de graphes (`rdflib.compare`) couvrirait les deux points.
