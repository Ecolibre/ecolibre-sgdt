# Installer swowl et y charger l'ontologie

Procédure pour installer swowl sur un poste neuf et y charger les deux
ontologies de ce dossier. Le relevé de référence est celui du 26 octobre
2026 : swowl 1.2.4, commit `cbcf8a8` du 26 octobre 2026, sur le poste Ubuntu
de Cyril, sous Ubuntu 26.10 et Python 3.14.8. Ce jour-là, la procédure a été
refaite entièrement sur une machine neuve, et elle a fonctionné : le seul
paquet manquant était `python3-venv`. Le compte rendu de cette installation
est dans `travaux/swowl-installation-ubuntu-1-2-4.md`, celui du contrôle
structurel dans `travaux/swowl-controle-structure.md`. La première
installation, celle du 21 octobre 2026 sous WSL2 avec swowl 1.1.0, est
racontée dans `travaux/swowl-installation.md`.

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

Le 26 octobre 2026, sur la machine neuve, git et curl étaient déjà présents ;
seul `python3-venv` manquait.

Le jeu de versions de secours de ce dossier vaut pour Python 3.14
(section 9). Afficher la version du `python3` du système :

```
python3 --version
```

Le relevé du 26 octobre 2026 affichait `Python 3.14.8`.

### Récupérer swowl

swowl se clone dans `~/swowl`, en dehors du dépôt `ecolibre-sgdt` :

```
git clone https://github.com/MyShivaRepo/swowl.git ~/swowl
```

Les nombres de référence ont été relevés sur swowl 1.2.4, commit `cbcf8a8`
du 26 octobre 2026. On ne se place pas sur ce commit, un clone ordinaire
suffit, mais si les résultats de la section 7 ne se retrouvent plus, c'est
le premier endroit où regarder. La version installée se lit dans
`~/swowl/backend/version.py`.

### Créer l'environnement Python et installer les dépendances

On installe par le fichier de swowl lui-même :

```
python3 -m venv ~/swowl/.venv
~/swowl/.venv/bin/pip install --upgrade pip
~/swowl/.venv/bin/pip install -r ~/swowl/backend/requirements.txt
```

Ce fichier passe sur Python 3.14 depuis swowl 1.1.2 : ses versions épinglées
de 2024 ne s'installaient pas au-delà de Python 3.12, et son auteur l'a
corrigé.

`ontologie/swowl-requirements.txt` n'est plus le moyen normal d'installer :
c'est le jeu de secours, éprouvé. On s'en sert si l'installation du jour
échoue, ou si le comportement de swowl diverge de ce que décrit la
section 7. La raison : les dépendances de swowl sont déclarées en bornes
larges, et une version future de l'une d'elles pourrait de nouveau casser
swowl, comme FastAPI 0.155.0 l'a fait le 20 octobre 2026. Dans ce cas :

```
~/swowl/.venv/bin/pip install -r ~/ecolibre-sgdt/ontologie/swowl-requirements.txt
```

### Contrôler avant de démarrer

Charger le module de swowl, sans lancer le serveur :

```
(cd ~/swowl/backend && ~/swowl/.venv/bin/python -c "import main; print('module charge')")
```

La commande doit afficher `module charge`. Si elle s'arrête au contraire sur
une erreur, la cause se lit dans son message ; repasser alors par le jeu de
secours ci-dessus. Pour mémoire, l'erreur qui avait fait échouer la première
installation du 21 octobre 2026 venait d'une version de FastAPI trop
récente pour swowl d'alors :

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

La version servie se lit par l'API :

```
curl -sS http://127.0.0.1:8000/api/version
```

Le 26 octobre 2026, elle rendait `{"version":"1.2.4"}`.

Vérifier que swowl n'écoute que sur `127.0.0.1` :

```
ss -ltn
```

La liste doit montrer `127.0.0.1:8000`, et aucune autre adresse sur le
port 8000.

Ouvrir ensuite dans le navigateur de la machine : <http://127.0.0.1:8000/>

L'accès depuis le navigateur a été vérifié directement sur Ubuntu le
26 octobre 2026, sans la couche WSL. Pour qui passe par WSL : l'accès depuis
un navigateur Windows vers un serveur lancé dans WSL a été vérifié le
21 octobre 2026 avec un serveur de test sur le port 8000, et il fonctionne.

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
| Jeu de versions de secours | `ontologie/swowl-requirements.txt`, dans ce dépôt |

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

### Charger

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
et `imports`, par exemple `'classes': 18`. Longueurs relevées pour
swowl 1.2.4 :

| | classes | object_properties | datatype_properties | individuals | imports | avertissements |
|---|---|---|---|---|---|---|
| Q2U_Ontology | 18 | 12 | 4 | 91 | 0 | aucun |
| OSE_BusinessOntology | 76 | 138 | 10 | 5 | 1 | 1 |

L'unique import d'OSE est `http://virtual-assembly.org/QualityQuantityUnit`.
L'avertissement d'OSE annonce cinq expressions de classe anonymes orphelines
ignorées ; texte exact : « 5 expression(s) de classe anonyme(s)
orpheline(s) (aucun axiome) ignorée(s) — sans effet sémantique. » La
section 8 explique cet avertissement et les 76 classes.

### Réexporter et compter

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

Le script affiche un bloc par fichier, dans le même ordre. Nombres relevés
le 26 octobre 2026 pour swowl 1.2.4, identiques sur deux machines, sous
Python 3.14.8 et sous Python 3.14.4 :

| | triplets | classes nommées | propriétés objet | propriétés données | restrictions | individus |
|---|---|---|---|---|---|---|
| Q2U source | 598 | 18 | 12 | 4 | 29 | 91 |
| Q2U réexport | 598 | 18 | 12 | 4 | 29 | 91 |
| OSE source | 1470 | 75 | 138 | 10 | 164 | 5 |
| OSE réexport | 1441 | 76 | 138 | 10 | 164 | 5 |

Compter enfin les identifiants mal formés dans le réexport d'OSE :

```
grep -c 'OpenSourceEcology#q2u:' /tmp/out_ose.owl
```

Attendu : `0`.

### Les deux contrôles de non-perte

**Le résultat qui compte n'est aucun des nombres ci-dessus, mais que les
deux contrôles qui suivent ne signalent rien.** Les nombres aident à
repérer d'où vient un écart ; ils ne prouvent pas l'absence de perte. Les
deux contrôles se complètent : chacun regarde ce que l'autre ne regarde
pas.

**Premier contrôle, les triplets : `ontologie/swowl-controle-perte.py`.**
Il vérifie que chaque triplet de la source se retrouve dans l'export, un
littéral typé `xsd:string` y valant un littéral simple. Il ignore par
construction tout triplet contenant un nœud anonyme : il contrôle
446 triplets sur 598 pour Q2U, et 684 sur 1470 pour OSE. Les restrictions,
les unions et les autres expressions anonymes lui échappent donc, et il ne
signale pas un triplet ajouté par l'export. On lui passe les quatre
fichiers dans l'ordre source puis export pour chaque ontologie :

```
~/swowl/.venv/bin/python ~/ecolibre-sgdt/ontologie/swowl-controle-perte.py \
  ~/ecolibre-sgdt/ontologie/Q2U_Ontology/Q2U_Ontology.owl /tmp/out_q2u.owl \
  ~/ecolibre-sgdt/ontologie/OSE_BusinessOntology/OSE_BusinessOntology.owl /tmp/out_ose.owl
```

Attendu : `ABSENTS DE L'EXPORT : 0` dans les deux blocs.

**Second contrôle, les expressions anonymes :
`ontologie/swowl-controle-structure.py`.** Il compare ce que le premier
écarte. Chaque expression anonyme y est rendue par sa signature
structurelle (propriété, contraintes, classes et valeurs, expressions
imbriquées développées) et rangée avec son contexte immédiat : la classe
qui la porte par `subClassOf`, `equivalentClass` ou `disjointWith`, la
propriété dont elle est le domaine ou la portée, ou le fait qu'elle est
orpheline. La source et l'export sont comparés dans les deux sens : une
expression absente comme une expression ajoutée est signalée, et un
identifiant remplacé à l'intérieur d'une restriction apparaît comme une
absence suivie d'un ajout. On lui passe des triplets source, export, nom :

```
~/swowl/.venv/bin/python ~/ecolibre-sgdt/ontologie/swowl-controle-structure.py \
  ~/ecolibre-sgdt/ontologie/Q2U_Ontology/Q2U_Ontology.owl /tmp/out_q2u.owl Q2U \
  ~/ecolibre-sgdt/ontologie/OSE_BusinessOntology/OSE_BusinessOntology.owl /tmp/out_ose.owl OSE
```

Attendu :

- pour Q2U, zéro absent et zéro ajouté sur toutes les lignes ;
- pour OSE, zéro partout, sauf cinq expressions orphelines absentes,
  nommées ainsi :

```
     ABSENT x3 : (FunctionalItem ou OrganicItem)
     ABSENT x2 : (MiniMaxiBeSpecification ou TargetTolerenceBeSpecification)
```

Ces cinq-là sont les unions orphelines que swowl annonce ignorer à l'import
(section 8) ; elles ne sont pas une perte.

> **Portée du second contrôle.** Il n'examine une expression anonyme que si
> elle est rattachée par `subClassOf`, `equivalentClass`, `disjointWith`,
> `domain` ou `range`, ou si elle est orpheline. Une expression rattachée
> par un autre prédicat, par exemple `rdf:type` sur un individu ou
> `propertyChainAxiom`, ne serait pas comparée. Sur nos deux ontologies, un
> comptage fait le 26 octobre 2026 montre que seuls `subClassOf` et
> `domain` relient un sujet nommé à un nœud anonyme : 29 et 4 dans Q2U,
> 164 et 12 dans OSE. La couverture est donc complète aujourd'hui. **Ce
> comptage est à refaire si l'ontologie change.**

**Pourquoi pas une comparaison par isomorphisme de graphes.** Elle a été
essayée le 26 octobre 2026, avec `rdflib.compare`, et écartée : elle rend
288 fausses différences sur OSE et 24 sur Q2U alors qu'il n'y a aucune
perte, parce que sa canonicalisation identifie un nœud anonyme par la
structure entière dont il dépend. Elle a produit une fausse alerte sur les
cardinalités, qui a demandé une vérification pour rien.

> **Avertissement.** Ces contrôles ne valent que pour un chargement suivi
> d'un réexport sans aucune modification. Dès qu'une ontologie est modifiée
> dans swowl, les nombres changent légitimement et les contrôles signalent
> des différences voulues, sans pouvoir les distinguer d'une perte. Un
> contrôle adapté à ce cas reste à concevoir. En attendant, rien ne revient
> de swowl vers `ontologie/`.

## 8. Ce qui reste observable sur un aller-retour

Sur swowl 1.2.4, un chargement suivi d'un réexport laisse trois différences
visibles. **Aucune n'est une perte.**

- **Les cinq expressions d'union orphelines laissées par Protégé dans OSE
  sont ignorées**, rattachées à rien et donc sans effet sémantique. L'import
  l'annonce explicitement par son avertissement (section 7). Ce sont les
  cinq absences du second contrôle.
- **Une déclaration de classe est ajoutée** pour la classe importée sur
  laquelle OSE pose un axiome, `q2u:Quantity`. D'où 76 classes au lieu de 75
  dans OSE.
- **Les libellés typés `xsd:string` ressortent en littéraux simples.** En
  RDF 1.1, c'est la même chose : ce n'est pas une différence sémantique.

Pour l'histoire : quatre pertes avaient été mesurées sur la version de
swowl du 21 octobre 2026. Elles ont été signalées à son auteur, qui les a
corrigées entre le 22 et le 26 octobre 2026. Le détail de ce qu'elles
étaient est dans `travaux/swowl-installation.md`.

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

2. Installer par le fichier de swowl lui-même, comme en section 4 :

   ```
   ~/swowl/.venv/bin/pip install -r ~/swowl/backend/requirements.txt
   ```

3. Vérifier le chargement du module depuis `backend`, par la commande de la
   section 4, qui doit afficher `module charge` :

   ```
   (cd ~/swowl/backend && ~/swowl/.venv/bin/python -c "import main; print('module charge')")
   ```

4. Si le module ne se charge pas, lire dans le message d'erreur le nom du
   paquet en cause, et descendre ce paquet de version en version, en
   refaisant chaque fois la vérification de l'étape 3, jusqu'à ce que le
   module se charge. Le point de repère connu est
   `ontologie/swowl-requirements.txt` : il porte un jeu complet qui a
   fonctionné, et la version qu'il donne pour le paquet en cause est une
   cible raisonnable. Par exemple, pour un paquet nommé `paquet` épinglé
   en `1.2.3` dans ce fichier :

   ```
   ~/swowl/.venv/bin/pip install paquet==1.2.3
   ```

   Ce qui peut arriver est illustré par l'épisode FastAPI 0.155.0 du
   20 octobre 2026, raconté dans `travaux/swowl-installation.md` : c'est de
   l'histoire, pas une consigne.

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

État au 26 octobre 2026.

Les cinq défauts de swowl relevés le 21 octobre 2026 et listés ici
jusqu'alors ont tous été corrigés par son auteur.

**Premier point, le contrôle de non-perte après modification.** Les
contrôles de la section 7 ne valent que pour un chargement suivi d'un
réexport sans modification. Un contrôle capable de distinguer, dans un
fichier modifié, les changements voulus d'une perte reste à concevoir.
Tant qu'il n'existe pas, rien ne revient de swowl vers `ontologie/`.

**Deuxième point, la couverture du contrôle structurel.** Elle est complète
sur les deux ontologies d'aujourd'hui (section 7, portée du second
contrôle). Elle est à revérifier, par le même comptage des prédicats qui
relient un sujet nommé à un nœud anonyme, si l'ontologie change.
