# Installer swowl et y charger l'ontologie

Procédure pour installer swowl sur un poste neuf et y charger les deux
ontologies de ce dossier. Elle reprend l'installation du 21 octobre 2026,
faite sur le poste Windows de Cyril, sous Ubuntu dans WSL2, avec
Python 3.14.4 et swowl au commit `8a1cb11` du 1er septembre 2026. Le compte
rendu de cette installation est dans `travaux/swowl-installation.md`.

Le dépôt `ecolibre-sgdt` est supposé cloné dans `~/ecolibre-sgdt`, comme sur
le poste du relevé, où il était dans le dossier personnel de l'utilisateur
Linux. Dans les commandes, `~` désigne ce dossier personnel.

## 1. Ce qu'est swowl, et ce qu'il n'est pas

swowl est un éditeur et visualiseur d'ontologies OWL écrit par Bernard
Chabot. Son dépôt : <https://github.com/MyShivaRepo/swowl>. Il tourne en
local, dans le navigateur de la machine.

swowl n'est pas la source : la source reste le fichier OWL du dossier
`ontologie/`. Il n'est ni un lieu de publication, ni un outil
multi-utilisateur. Rien de ce qu'il produit ne fait autorité tant que ce
n'est pas revenu dans `ontologie/`, et aujourd'hui, rien n'y revient : le
contrôle de non-perte ne vaut que pour un chargement suivi d'un réexport
sans modification, et aucun contrôle adapté à un fichier modifié n'existe
encore. Le détail est en section 7.

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

### Paquets et version de Python

Installer les paquets nécessaires, avant de créer l'environnement Python :

```
sudo apt update
sudo apt install -y git curl python3-venv
```

Le 21 octobre 2026, `python3-venv` a été installé avant la création de
l'environnement. On n'a pas éprouvé si son absence empêche cette création :
on l'installe par sécurité.

Le jeu de versions de ce dossier vaut pour Python 3.14 (section 9).
Afficher la version du `python3` du système :

```
python3 --version
```

Le relevé du 21 octobre 2026 affichait `Python 3.14.4`.

### Récupérer swowl

swowl se clone dans `~/swowl`, en dehors du dépôt `ecolibre-sgdt` :

```
git clone https://github.com/MyShivaRepo/swowl.git ~/swowl
```

Les nombres de référence ont été relevés sur le commit `8a1cb11` du
1er septembre 2026. On ne se place pas sur ce commit, un clone ordinaire
suffit, mais si les nombres de la section 7 ne se retrouvent plus, c'est le
premier endroit où regarder.

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

L'accès depuis un navigateur Windows vers un serveur lancé dans WSL a été
vérifié le 21 octobre 2026 avec un serveur de test sur le port 8000, et il
fonctionne. Le même accès avec swowl lui-même n'a pas encore été confirmé.

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

swowl doit être démarré (section 5).

Créer d'abord le dossier des fichiers produits par swowl :

```
mkdir -p ~/swowl-data
```

Charger Q2U, qui vient en premier parce qu'OSE l'importe. Les trois
premières lignes du bloc écrivent le corps de la requête dans
`/tmp/imp-q2u.json`, le shell y remplaçant `$HOME` par le chemin du dossier
personnel ; la quatrième l'envoie à swowl :

```
cat > /tmp/imp-q2u.json <<EOF
{"name":"Q2U_Ontology","owl_path":"$HOME/ecolibre-sgdt/ontologie/Q2U_Ontology/Q2U_Ontology.owl","save_path":"$HOME/swowl-data/Q2U_Ontology.json","uri":"http://virtual-assembly.org/QualityQuantityUnit","prefix":"q2u"}
EOF
curl -sS -X POST http://127.0.0.1:8000/api/ontologies/import-from-path -H "Content-Type: application/json" -d @/tmp/imp-q2u.json | python3 -c "import sys,json; d=json.load(sys.stdin); print({k: (len(v) if isinstance(v,list) else v) for k,v in d.items() if k in ('classes','object_properties','datatype_properties','individuals','imports')})"
```

Puis OSE :

```
cat > /tmp/imp-ose.json <<EOF
{"name":"OSE_BusinessOntology","owl_path":"$HOME/ecolibre-sgdt/ontologie/OSE_BusinessOntology/OSE_BusinessOntology.owl","save_path":"$HOME/swowl-data/OSE_BusinessOntology.json","uri":"http://virtual-assembly.org/OpenSourceEcology","prefix":"ose","ns_prefixes":[{"prefix":"q2u","namespace":"http://virtual-assembly.org/QualityQuantityUnit"}]}
EOF
curl -sS -X POST http://127.0.0.1:8000/api/ontologies/import-from-path -H "Content-Type: application/json" -d @/tmp/imp-ose.json | python3 -c "import sys,json; d=json.load(sys.stdin); print({k: (len(v) if isinstance(v,list) else v) for k,v in d.items() if k in ('classes','object_properties','datatype_properties','individuals','imports')})"
```

L'API ne rend pas des compteurs, mais l'ontologie entière, en JSON :
environ 125 Ko pour les deux. Le petit programme Python placé à la fin de
chaque commande `curl` lit cette réponse et n'affiche que la longueur de ses
listes `classes`, `object_properties`, `datatype_properties`, `individuals`
et `imports`, par exemple `'classes': 18`. Longueurs à retrouver :

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

Compter avec le script `ontologie/swowl-compte.py` du dépôt, en lui passant
les quatre fichiers dans cet ordre exact, source puis réexport pour chaque
ontologie :

```
~/swowl/.venv/bin/python ~/ecolibre-sgdt/ontologie/swowl-compte.py \
  ~/ecolibre-sgdt/ontologie/Q2U_Ontology/Q2U_Ontology.owl /tmp/out_q2u.owl \
  ~/ecolibre-sgdt/ontologie/OSE_BusinessOntology/OSE_BusinessOntology.owl /tmp/out_ose.owl
```

Le script affiche un bloc par fichier, dans le même ordre. Pour la source de
Q2U, le bloc attendu est celui-ci, la première ligne portant le chemin
complet du fichier :

```
--- /home/<utilisateur>/ecolibre-sgdt/ontologie/Q2U_Ontology/Q2U_Ontology.owl
  triplets           : 598
  classes nommees    : 18
  proprietes objet   : 12
  proprietes donnees : 4
  restrictions       : 29
  individus          : 91
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
OSE, dont une restriction. La section 8 dit ce qui est perdu.

> **Avertissement.** Ces nombres ne valent que pour un chargement suivi d'un
> réexport sans aucune modification. Dès qu'une ontologie est modifiée dans
> swowl, ils changent légitimement et ne prouvent plus rien, alors que les
> pertes de la section 8 continueraient, elles, de se produire en silence.
> Un contrôle adapté à ce cas reste à concevoir. En attendant, rien ne
> revient de swowl vers `ontologie/`.

## 8. Ce qui ne survit pas au chargement

Quatre pertes, toutes silencieuses, aucune signalée par swowl. Elles
viennent des mesures du 21 octobre 2026.

**Première perte, les domaines exprimés par une union.** La propriété
subsiste mais perd son domaine entièrement, sans qu'aucun membre de l'union
soit conservé. Dans OSE, 12 propriétés sont touchées : `characterizedBy`,
`executedBy`, `executes`, `hasPart`, `hasWhole`, `measuredIn`, `partOf`,
`specifiedBy`, `specifies`, `target`, `value`, `wholeOf`. Dans Q2U, 4 le
sont : `baseOf`, `hasBase`, `hasUnit`, `symbol`. Pour donner la mesure du
dommage, `characterizedBy` avait pour domaine l'union de six classes, et
n'en a plus aucun.

**Deuxième perte, les références d'OSE vers Q2U.**
`http://virtual-assembly.org/QualityQuantityUnit#Unit` ressort en
`http://virtual-assembly.org/OpenSourceEcology#q2u:Unit`, c'est-à-dire dans
le mauvais espace de noms et avec le préfixe collé dans le nom local.
12 occurrences, portant sur `Unit`, `Quantity` et `BaseQuality`. Le lien
entre les deux ontologies ne survit donc pas.

**Troisième perte, l'unique axiome qu'OSE pose sur une classe de Q2U :**
`Quantity subClassOf (quantityOf allValuesFrom QuantitativeCharacteristic)`.
swowl tient les entités importées en lecture seule et le perd. C'est la
restriction qui manque au compte, 164 devenant 163.

**Quatrième perte, une restriction de Q2U vidée de son contenu :** porteur
`BaseQuality`, propriété `quantifiedBy`, contenu
`union(BaseQuantity ou DerivedQuantity)`.

Sans conséquence, pour complétude : 5 unions d'OSE également perdues sont
des doublons orphelins laissés par Protégé, rattachés à rien.

**Cause, lue dans le code de swowl et non déduite.** Dans
`backend/triple_store.py`, l'import ne retient un domaine que s'il est un
identifiant, et ignore sans avertissement un domaine porté par un nœud
anonyme. Dans `backend/owl_model.py`, le domaine d'une propriété est déclaré
comme une liste d'identifiants et non comme une expression de classe : une
union n'y est pas représentable. Conséquence importante à signaler :
ressaisir les membres à la main dans l'interface n'est pas un contournement,
c'en est l'inverse, car swowl écrit alors un triplet `rdfs:domain` par
entrée, ce qui se lit en OWL comme une intersection, soit A ET B, là où
l'ontologie dit A OU B.

## 9. Si un jour la version de Python change

`ontologie/swowl-requirements.txt` vaut pour Python 3.14, parce que les
paquets qu'il épingle comprennent du code compilé. Sur une autre version de
Python, il faut refaire le relevé et réécrire ce fichier.

Méthode, en six étapes :

1. Créer un environnement neuf. Ces commandes suppriment l'environnement en
   place et le recréent :

   ```
   rm -rf ~/swowl/.venv
   python3 -m venv ~/swowl/.venv
   ~/swowl/.venv/bin/pip install --upgrade pip
   ```

2. Installer sans épingler :

   ```
   ~/swowl/.venv/bin/pip install fastapi "uvicorn[standard]" rdflib pydantic python-multipart pypdf python-docx
   ```

3. Vérifier le chargement du module depuis `backend`, par la commande de la
   section 4, qui doit afficher `module charge` :

   ```
   (cd ~/swowl/backend && ~/swowl/.venv/bin/python -c "import main; print('module charge')")
   ```

4. Si l'erreur porte sur l'option `enum=` de `Query()`, réinstaller
   FastAPI 0.154.0, puis refaire la vérification de l'étape 3 :

   ```
   ~/swowl/.venv/bin/pip install fastapi==0.154.0
   ```

   Si elle porte sur autre chose, descendre le paquet en cause de version en
   version, en refaisant chaque fois la vérification de l'étape 3, jusqu'à ce
   que le module se charge.

5. Refaire ensuite le contrôle de non-perte complet de la section 7, swowl
   démarré comme en section 5, et vérifier que tous les nombres se
   retrouvent.

6. Alors seulement, produire le nouveau fichier par `pip freeze`, y remettre
   les lignes de commentaire d'en-tête, et le commiter. `pip freeze`
   remplace tout le contenu du fichier : recopier d'abord ses lignes de
   commentaire, celles qui commencent par `#`. Puis :

   ```
   ~/swowl/.venv/bin/pip freeze > ~/ecolibre-sgdt/ontologie/swowl-requirements.txt
   ```

   Remettre ensuite ces lignes en tête du fichier, en y mettant à jour la
   date du relevé et la version de Python, et commiter le fichier.

## 10. Ce qui reste ouvert

État au 21 octobre 2026.

**Premier point, le contrôle de non-perte après modification.** Les nombres
de la section 7 ne valent que pour un chargement suivi d'un réexport sans
modification. Un contrôle capable de distinguer, dans un fichier modifié,
les changements voulus des pertes silencieuses de la section 8 reste à
concevoir. Tant qu'il n'existe pas, rien ne revient de swowl vers
`ontologie/`.

**Deuxième point, l'accès depuis le navigateur.** Vérifié le 21 octobre 2026
avec un serveur de test lancé dans WSL sur le port 8000, et il fonctionne.
Le même accès avec swowl lui-même n'a pas encore été confirmé.

**Troisième point, cinq défauts de swowl relevés le 21 octobre 2026, à
signaler à son auteur.**

1. Les domaines exprimés par une union sont perdus entièrement à l'import,
   sans aucun avertissement.
2. Les références vers une ontologie importée ressortent sous un identifiant
   faux, le préfixe se retrouvant collé dans le nom local et l'identifiant
   dans le mauvais espace de noms.
3. Les axiomes qu'une ontologie pose sur une classe importée sont perdus,
   les entités importées étant tenues en lecture seule.
4. Une restriction dont le contenu est une union est conservée mais vidée de
   ce contenu.
5. `backend/requirements.txt` ne s'installe plus sur une Ubuntu LTS à jour,
   et `main.py` utilise l'option `enum=` de `Query()` que FastAPI a retirée
   en 0.155.0, ce qui empêche le serveur de démarrer avec une installation
   faite aux versions du jour.
