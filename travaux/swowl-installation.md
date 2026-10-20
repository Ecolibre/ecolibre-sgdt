# Installation de swowl et chargement de l'ontologie

## Date et machine

- 21 octobre 2026. Première tentative vers 00 h 08, reprise réussie entre 00 h 20 et 00 h 25 (heure de Paris).
- Poste Windows de Cyril, Ubuntu sous WSL2, machine `DESKTOP-QRL9M6M`, noyau `6.18.54.1-microsoft-standard-WSL2`, x86_64.
- Dépôt `ecolibre-sgdt` au commit `30288b3`, à jour avec `origin/main` aux deux tentatives.

## Version de Python

Python 3.14.4 (`python3` du système).

## Commit de swowl

`8a1cb11 2026-09-01 16:32:45 +0200 docs(skill/ontologue): SWRL — never skip rules, var↔var thresholds, reification`, cloné depuis https://github.com/MyShivaRepo/swowl.git dans `~/swowl`.

Aucun fichier suivi de swowl n'a été modifié : `git -C ~/swowl status -s` ne montre que deux fichiers non suivis, `swowl.log` et `versions-installees.txt`, produits par les consignes.

## Première tentative et son échec

L'installation prenait les versions du jour, sans `backend/requirements.txt` :

```
python3 -m venv /home/cyril/swowl/.venv
/home/cyril/swowl/.venv/bin/pip install --upgrade pip
/home/cyril/swowl/.venv/bin/pip install fastapi "uvicorn[standard]" rdflib pydantic python-multipart pypdf python-docx
/home/cyril/swowl/.venv/bin/pip freeze > /home/cyril/swowl/versions-installees.txt
```

Versions obtenues : FastAPI 0.156.3, toutes les autres identiques au jeu retenu plus bas. `opentelemetry-api` 1.45.1 a été installé sans avoir été demandé, comme dépendance.

Démarrage :

```
setsid nohup /home/cyril/swowl/.venv/bin/uvicorn main:app --app-dir /home/cyril/swowl/backend --host 127.0.0.1 --port 8000 > /home/cyril/swowl/swowl.log 2>&1 < /dev/null &
```

Le serveur a planté pendant l'import du module, avant d'ouvrir son port. La page d'accueil rendait `HTTP 000` (`curl: (7) Failed to connect`). Fin du journal :

```
  File "/home/cyril/swowl/backend/main.py", line 1589, in <module>
    def export_ontology_by_name(name: str, fmt: str = Query("owl", enum=["owl", "ttl", "jsonld", "swrl", "sword"])):
                                                      ~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
TypeError: Query() got an unexpected keyword argument 'enum'
```

La consigne demandait de s'arrêter sur un code autre que 200 : rien n'a été chargé, exporté ni poussé.

## Correction retenue et son motif

FastAPI retire l'option `enum=` de `Query()` à partir de la version 0.155.0, d'après la mesure faite par l'architecte. `main.py` l'utilise ligne 1589. On ne modifie pas swowl : l'erreur sera signalée à son auteur. On épingle donc un jeu de versions complet avec `fastapi==0.154.0`, éprouvé le 21 octobre 2026 sous Python 3.14.4 sur une autre machine. Ce jeu est versionné dans `ontologie/swowl-requirements.txt`.

Les versions installées après la reprise (`pip freeze`) sont exactement celles du fichier. `diff` ne montre qu'une différence d'ordre de tri sur `PyYAML`.

## Emplacements

| Quoi | Où |
|---|---|
| Code de swowl et environnement Python | `~/swowl`, `~/swowl/.venv` |
| Fichiers produits par swowl | `~/swowl-data` (`Q2U_Ontology.json`, `OSE_BusinessOntology.json`) |
| Registre de swowl | `~/.swowl` (`registry.json`, dossiers `analysis` et `ontologies`) |
| Jeu de versions | `ontologie/swowl-requirements.txt` dans ce dépôt |
| Journal du serveur | `~/swowl/swowl.log` |

## Commandes réellement passées à la reprise

```
git fetch origin
git status -sb                      # main...origin/main, aucun retard
rm /home/cyril/ecolibre-sgdt/mkdir  # fichier vide, non suivi
pkill -f "uvicorn main:app"         # voir Incidents
rm -rf /home/cyril/swowl/.venv
python3 -m venv /home/cyril/swowl/.venv
/home/cyril/swowl/.venv/bin/pip install --upgrade pip      # pip 26.2.2
# ontologie/swowl-requirements.txt écrit avec l'outil d'écriture de fichier, contenu de la consigne
/home/cyril/swowl/.venv/bin/pip install -r /home/cyril/ecolibre-sgdt/ontologie/swowl-requirements.txt
(cd /home/cyril/swowl/backend && /home/cyril/swowl/.venv/bin/python -c "import main; print('module charge')")
# -> module charge
mkdir -p /home/cyril/swowl-data
setsid nohup /home/cyril/swowl/.venv/bin/uvicorn main:app --app-dir /home/cyril/swowl/backend --host 127.0.0.1 --port 8000 > /home/cyril/swowl/swowl.log 2>&1 < /dev/null &
curl -sS --retry 15 --retry-delay 2 --retry-connrefused --max-time 40 -o /dev/null -w "page d'accueil : HTTP %{http_code}\n" http://127.0.0.1:8000/
# -> page d'accueil : HTTP 200 ; ss -ltn : LISTEN sur 127.0.0.1:8000 seulement
curl -sS -X POST http://127.0.0.1:8000/api/ontologies/import-from-path -H "Content-Type: application/json" -d @/tmp/imp-q2u.json
curl -sS -X POST http://127.0.0.1:8000/api/ontologies/import-from-path -H "Content-Type: application/json" -d @/tmp/imp-ose.json
curl -sS "http://127.0.0.1:8000/api/ontologies/Q2U_Ontology/export?fmt=owl" -o /tmp/out_q2u.owl          # HTTP 200
curl -sS "http://127.0.0.1:8000/api/ontologies/OSE_BusinessOntology/export?fmt=owl" -o /tmp/out_ose.owl  # HTTP 200
/home/cyril/swowl/.venv/bin/python /tmp/compte.py <les quatre fichiers>
grep -c 'OpenSourceEcology#q2u:' /tmp/out_ose.owl
```

Adaptations par rapport à la lettre de la consigne :

- `/tmp/imp-q2u.json`, `/tmp/imp-ose.json` et `/tmp/compte.py` ont été écrits avec l'outil d'écriture de fichier, et non par heredoc (règle de `CLAUDE.md`). `$HOME` y est remplacé par `/home/cyril` en toutes lettres. Le contenu est par ailleurs identique à celui de la consigne.
- Le contrôle de chargement du module a tourné dans un sous-shell `( cd … && … )`, pour que le répertoire courant de la session reste la racine du dépôt.
- L'attente du port est faite par les tentatives de `curl` (`--retry-connrefused`, au plus 15 essais espacés de 2 s, plafond de 40 s), et non par un `sleep`. La première tentative a été refusée, la suivante a rendu 200.
- L'API d'import ne rend pas de compteurs : elle rend l'ontologie complète en JSON (environ 125 Ko pour les deux). Les nombres ci-dessous sont les longueurs des listes `classes`, `object_properties`, `datatype_properties`, `individuals` et `imports` de chaque réponse.

## Nombres relevés

### Réponse de l'API à l'import

| | classes | object_properties | datatype_properties | individuals | imports |
|---|---|---|---|---|---|
| Q2U_Ontology | 18 | 12 | 4 | 91 | 0 |
| OSE_BusinessOntology | 75 | 138 | 10 | 5 | 1 (`http://virtual-assembly.org/QualityQuantityUnit`) |

### Comptes `compte.py`

| | triplets | classes nommées | propriétés objet | propriétés données | restrictions | individus |
|---|---|---|---|---|---|---|
| Q2U source | 598 | 18 | 12 | 4 | 29 | 91 |
| Q2U réexport | 557 | 18 | 12 | 4 | 29 | 91 |
| OSE source | 1470 | 75 | 138 | 10 | 164 | 5 |
| OSE réexport | 1335 | 75 | 138 | 10 | 163 | 5 |

Identifiants mal formés (`OpenSourceEcology#q2u:`) dans l'export d'OSE : 12.

Le chargement puis le réexport perd donc 41 triplets sur Q2U et 135 triplets sur OSE, dont une restriction. Ces pertes sont mesurées et n'ont pas été corrigées, comme le demandait la consigne.

## Comparaison avec les mesures de référence

**Aucun écart.** Les 35 nombres attendus se retrouvent tous à l'identique : 12 pour les fichiers sources, 10 pour la réponse de l'API, 12 après réexport (triplets, restrictions et le « reste inchangé » des deux exports) et le compte des identifiants mal formés.

## Incidents

1. **Première tentative : échec au démarrage** sous FastAPI 0.156.3, décrit plus haut. Résolu par le jeu de versions épinglé.
2. **`pkill -f "uvicorn main:app"` a tué sa propre commande.** Lancé dans une même ligne avec `rm` et la recréation du venv, le motif figurait dans la ligne de commande du shell lui-même, et `pkill -f` l'a terminé (code de sortie 144). Constaté ensuite : `mkdir` était bien supprimé, aucun serveur n'écoutait sur le port 8000, et l'ancien `.venv` était encore en place. La suite (suppression et recréation du venv) a été relancée dans une commande séparée. Aucun dégât. À retenir pour une prochaine consigne : `pkill -f` doit être seul dans sa commande, ou employer un motif qui ne se trouve pas lui-même, comme `pkill -f "[u]vicorn main:app"`.
3. **Fichier `mkdir` vide** à la racine du dépôt, non suivi, créé le 21 octobre à 00 h 01 : signalé à la première tentative et supprimé à la reprise, sur consigne.
4. **`~/swowl/versions-installees.txt` est périmé.** Il date de la première tentative et porte encore `fastapi==0.156.3`. Je ne l'ai pas réécrit, car aucune consigne ne le demandait. La référence est désormais `ontologie/swowl-requirements.txt`.
5. **Origine de `~/.swowl` non établie.** Le dossier n'existait pas au relevé de 00 h 08. Ses sous-dossiers datent de 00 h 12 et `registry.json` de 00 h 24, au moment des imports. On ne sait pas lequel des lancements a créé les sous-dossiers.
6. `.claude/settings.local.json` n'existe pas, au début comme à la fin des deux tentatives.

## État en fin de tâche

swowl reste allumé, à l'écoute sur `http://127.0.0.1:8000/` seulement, avec les deux ontologies chargées : Q2U, puis OSE, qui l'importe.
