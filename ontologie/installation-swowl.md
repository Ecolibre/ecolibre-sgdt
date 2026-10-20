# Installer swowl et y charger l'ontologie

Procédure pour installer swowl sur un poste neuf et y charger les deux
ontologies de ce dossier. Elle reprend l'installation du 21 octobre 2026,
faite sur le poste Windows de Cyril, sous Ubuntu dans WSL2, avec
Python 3.14.4 et swowl au commit `8a1cb11` du 1er septembre 2026. Le compte
rendu de cette installation est dans `travaux/swowl-installation.md`.

Le dépôt `ecolibre-sgdt` est supposé cloné dans `~/ecolibre-sgdt`, comme sur
le poste du relevé, où il était dans le dossier personnel de l'utilisateur
Linux. Dans les commandes, `~` désigne ce dossier personnel.

État de cette note : deux manques, signalés là où ils se trouvent, l'un en
section 4 (les paquets à installer), l'autre en section 7 (le contenu des
fichiers de chargement et de comptage). Tant qu'ils ne sont pas comblés, la
note ne suffit pas seule.

## 1. Ce qu'est swowl, et ce qu'il n'est pas

swowl est un éditeur et visualiseur d'ontologies OWL écrit par Bernard
Chabot. Son dépôt : <https://github.com/MyShivaRepo/swowl>. Il tourne en
local, dans le navigateur de la machine.

swowl n'est pas la source : la source reste le fichier OWL du dossier
`ontologie/`. Il n'est ni un lieu de publication, ni un outil
multi-utilisateur. Rien de ce qu'il produit ne fait autorité tant que ce
n'est pas revenu dans `ontologie/`, et aucun retour ne s'y fait sans le
contrôle de non-perte de la section 7.

## 2. Sécurité, à lire avant tout

swowl n'a aucune authentification. Son API permet de parcourir et de lire
tout le système de fichiers de la machine qui l'héberge, et son partage de
ressources entre origines (CORS) est ouvert à tous les sites. Donc :

- toujours le démarrer sur `127.0.0.1`, jamais sur `0.0.0.0` ;
- ne jamais l'exposer au réseau local, ni l'héberger sur un serveur ;
- l'arrêter quand on ne s'en sert plus (section 5).

## 3. Préalable, sur une machine Windows seulement

Sur une machine Ubuntu, ce chapitre ne s'applique pas : passer à la
section 4, la suite est identique.

Sous Windows, swowl tourne dans Ubuntu, installé dans WSL2. Dans un terminal
Windows ouvert en administrateur :

```
wsl --install
```

Redémarrer Windows. Au premier lancement d'Ubuntu, créer l'utilisateur Linux
demandé. Toutes les commandes des sections suivantes se tapent ensuite dans
le terminal d'Ubuntu.

Deux pièges, constatés le 21 octobre 2026 :

- Sur un Windows 11 où WSL n'est pas installé, `wsl --list --verbose` ne
  rend pas d'erreur : il propose d'installer WSL, et attend une touche
  pendant soixante secondes.
- Juste après le redémarrage, la résolution de noms peut être indisponible
  quelques instants dans WSL, pendant que Windows finit de monter son
  réseau. Attendre, puis refaire la commande. Ne pas toucher à
  `/etc/resolv.conf`.

## 4. Installation

### Python et paquets

Le jeu de versions de ce dossier vaut pour Python 3.14 (section 9).
Afficher la version du `python3` du système :

```
python3 --version
```

Le relevé du 21 octobre 2026 affichait `Python 3.14.4`.

> **Manque à cette note : les paquets à installer.** Les commandes qui
> suivent appellent `git`, `python3` avec son module `venv`, et `curl`. Sur
> le poste du relevé, ils étaient présents ; le compte rendu ne dit pas s'il
> a fallu les installer, ni par quels paquets. Cette note ne donne donc
> aucune commande `apt`.

### Récupérer swowl

swowl se clone dans `~/swowl`, en dehors du dépôt `ecolibre-sgdt` :

```
git clone https://github.com/MyShivaRepo/swowl.git ~/swowl
```

### Créer l'environnement Python et installer les versions éprouvées

```
python3 -m venv ~/swowl/.venv
~/swowl/.venv/bin/pip install --upgrade pip
~/swowl/.venv/bin/pip install -r ~/ecolibre-sgdt/ontologie/swowl-requirements.txt
```

Ne pas utiliser `backend/requirements.txt` du dépôt swowl, et ne pas
installer les versions du jour : les versions de 2024 de ce fichier ne
s'installent pas sur Python 3.14, et FastAPI 0.155.0 et au-delà retirent
l'option `enum=` dont `main.py` dépend. On ne modifie pas swowl : on épingle
les versions, dans `ontologie/swowl-requirements.txt`.

### Contrôler avant de démarrer

Charger le module de swowl, sans lancer le serveur :

```
(cd ~/swowl/backend && ~/swowl/.venv/bin/python -c "import main; print('module charge')")
```

La commande doit afficher `module charge`. Si elle s'arrête au contraire sur
l'erreur qui a fait échouer la première installation du 21 octobre 2026,
la version de FastAPI est trop récente :

```
TypeError: Query() got an unexpected keyword argument 'enum'
```

## 5. Démarrer et arrêter

Créer le dossier où swowl dépose ses fichiers :

```
mkdir -p ~/swowl-data
```

Démarrer swowl en arrière-plan, sur `127.0.0.1` et le port 8000. Son
journal va dans `~/swowl/swowl.log` :

```
setsid nohup ~/swowl/.venv/bin/uvicorn main:app --app-dir ~/swowl/backend --host 127.0.0.1 --port 8000 > ~/swowl/swowl.log 2>&1 < /dev/null &
```

Vérifier que la page d'accueil répond. La commande réessaie tant que le port
n'est pas encore ouvert :

```
curl -sS --retry 15 --retry-delay 2 --retry-connrefused --max-time 40 -o /dev/null -w "page d'accueil : HTTP %{http_code}\n" http://127.0.0.1:8000/
```

Attendu : `page d'accueil : HTTP 200`. Le 21 octobre 2026, quand le serveur
avait planté au démarrage, cette commande rendait `HTTP 000`, et la cause se
lisait à la fin de `~/swowl/swowl.log`.

Vérifier que swowl n'écoute que sur `127.0.0.1` :

```
ss -ltn
```

La liste doit montrer `127.0.0.1:8000`, et aucune autre adresse sur le
port 8000.

Ouvrir ensuite dans le navigateur de la machine : <http://127.0.0.1:8000/>

Arrêter swowl :

```
pkill -f "[u]vicorn main:app"
```

Écrit sans les crochets, le motif se trouve lui-même et la commande se tue
avant d'agir.

Après l'arrêt, `ss -ltn` ne doit plus montrer le port 8000.

## 6. Emplacements et portabilité

| Quoi | Où |
|---|---|
| Code de swowl et environnement Python | `~/swowl`, `~/swowl/.venv` |
| Journal du serveur | `~/swowl/swowl.log` |
| Fichiers produits par swowl | `~/swowl-data` (`Q2U_Ontology.json`, `OSE_BusinessOntology.json`) |
| Registre de swowl | `~/.swowl` (`registry.json`, dossiers `analysis` et `ontologies`) |
| Jeu de versions | `ontologie/swowl-requirements.txt`, dans ce dépôt |

Rien de ce qui est sous `~/swowl`, `~/swowl-data` ou `~/.swowl` ne va dans
le dépôt, et rien n'a besoin d'être synchronisé entre machines : sur un
poste neuf, on réinstalle et on recharge depuis les fichiers OWL du dépôt.
Le registre contient des chemins absolus : il ne se transporte pas d'une
machine à l'autre.

## 7. Charger les deux ontologies et contrôler la non-perte

swowl doit être démarré (section 5). Q2U se charge en premier, puisque OSE
l'importe.

> **Manque à cette note : le contenu de trois fichiers, et une commande.**
> Les commandes ci-dessous lisent `/tmp/imp-q2u.json` et `/tmp/imp-ose.json`,
> les corps des deux requêtes d'import, et `/tmp/compte.py`, le script de
> comptage. Le compte rendu du 21 octobre 2026 ne reproduit pas leur
> contenu : il dit seulement qu'il est identique à celui de la consigne qu'il
> exécutait, et cette consigne n'est pas dans le dépôt. Il ne donne pas non
> plus la commande qui a mesuré les nombres rendus à l'import. Tant que ces
> éléments ne sont pas inscrits ici, cette section ne peut pas être suivie
> telle quelle.

Charger Q2U, puis OSE :

```
curl -sS -X POST http://127.0.0.1:8000/api/ontologies/import-from-path -H "Content-Type: application/json" -d @/tmp/imp-q2u.json
curl -sS -X POST http://127.0.0.1:8000/api/ontologies/import-from-path -H "Content-Type: application/json" -d @/tmp/imp-ose.json
```

Chaque réponse est l'ontologie complète en JSON, environ 125 Ko pour les
deux, et non un compteur. Les nombres à retrouver sont les longueurs de ses
listes `classes`, `object_properties`, `datatype_properties`, `individuals`
et `imports` :

| | classes | object_properties | datatype_properties | individuals | imports |
|---|---|---|---|---|---|
| Q2U_Ontology | 18 | 12 | 4 | 91 | 0 |
| OSE_BusinessOntology | 75 | 138 | 10 | 5 | 1 |

L'unique import d'OSE est `http://virtual-assembly.org/QualityQuantityUnit`.

Réexporter les deux ontologies en OWL :

```
curl -sS "http://127.0.0.1:8000/api/ontologies/Q2U_Ontology/export?fmt=owl" -o /tmp/out_q2u.owl
curl -sS "http://127.0.0.1:8000/api/ontologies/OSE_BusinessOntology/export?fmt=owl" -o /tmp/out_ose.owl
```

Compter les deux fichiers sources du dépôt et les deux réexports. Le compte
rendu écrit la commande ainsi, sans nommer les quatre fichiers ni donner
leur ordre :

```
~/swowl/.venv/bin/python /tmp/compte.py <les quatre fichiers>
```

Nombres à retrouver, relevés le 21 octobre 2026 et confirmés sur deux
machines :

| | triplets | classes nommées | propriétés objet | propriétés données | restrictions | individus |
|---|---|---|---|---|---|---|
| Q2U source | 598 | 18 | 12 | 4 | 29 | 91 |
| Q2U réexport | 557 | 18 | 12 | 4 | 29 | 91 |
| OSE source | 1470 | 75 | 138 | 10 | 164 | 5 |
| OSE réexport | 1335 | 75 | 138 | 10 | 163 | 5 |

Compter enfin les identifiants mal formés dans le réexport d'OSE :

```
grep -c 'OpenSourceEcology#q2u:' /tmp/out_ose.owl
```

Attendu : `12`.

Le chargement puis le réexport perdent donc 41 triplets sur Q2U et 135 sur
OSE, dont une restriction. Ces nombres sont la référence du contrôle de
non-perte : aucun retour dans `ontologie/` ne se fait sans ce contrôle.

## 8. Ce qui ne survit pas au chargement

En résumé :

- les domaines exprimés par une union disparaissent entièrement :
  12 propriétés dans OSE, 4 dans Q2U ;
- les références d'OSE vers Q2U ressortent sous un identifiant faux :
  12 occurrences, celles que compte le `grep` de la section 7 ;
- l'unique axiome qu'OSE pose sur une classe de Q2U est perdu ;
- une restriction de Q2U perd son contenu.

Ces pertes sont silencieuses, et c'est la raison d'être du contrôle de la
section 7. Le relevé du 21 octobre 2026, avec les comptes avant et après
chargement, est dans `travaux/swowl-installation.md`.

## 9. Si un jour la version de Python change

`ontologie/swowl-requirements.txt` vaut pour Python 3.14, parce que les
paquets qu'il épingle comprennent du code compilé. Sur une autre version de
Python, il faut refaire le relevé et réécrire ce fichier.
