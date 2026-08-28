# Triage des photos — rattachement Image_location aux lieux

Contexte : 53 des 73 pages `Fichier:` portant `Image_location` pointent
encore vers *Le Buisson de Cerzat*, qui ne porte plus aucun item physique
depuis la migration du 25 août 2026 (les items ont rejoint des lieux
enfants : Butte de la tranchée, Extrémité de tranchée, etc.). **Lecture et
proposition seulement — aucune écriture effectuée.**

Deux lectures ont échoué en cours de session sur des pages
`Utilisateur:Cywil/Bac à sable/*` (suppression en parallèle par Cyril,
comme annoncé) — ignorées, sans effet sur ce qui suit, qui ne porte que
sur l'espace `Fichier:`.

## 1–2. Relevé et répartition par groupe

Méthode : `action=ask` sur `[[Image_location::+]]|?Image_location|?Depicts_specimen`
pour les 73 photos, `action=ask` sur `[[Located_at::+]]|?Located_at` pour
tous les items physiques (état du jour, 27 août 2026), jointure locale.
Recoupé par `browsebysubject` sur trois échantillons (section 4).

**Total : 73 photos, 65 en groupe A, 8 en groupe B, 0 en groupe C.**

### Groupe A — lieu unique déductible (65 photos)

Toutes les valeurs de `Depicts_specimen` d'une même photo pointent vers
des items situés au même lieu ; `Image_location` doit prendre ce lieu.

Répartition des cibles :

| Lieu cible | Photos |
|---|---|
| Butte de la tranchée | 42 |
| Jardin de Chilhac | 15 |
| Terrasse de Chilhac | 5 |
| Extrémité de tranchée | 2 |
| Au pied du pylône électrique | 1 |
| **Total** | **65** |

**20 photos sur les 65 portent déjà la bonne valeur** — 15 à Jardin de
Chilhac, 5 à Terrasse de Chilhac : toutes les photos prises à Chilhac
avaient été annotées directement avec le bon lieu enfant, jamais avec
« Le Buisson de Cerzat ». **45 photos sont à corriger**, toutes actuellement
sur `Image_location=Le Buisson de Cerzat`, à redistribuer vers Butte de la
tranchée (42), Extrémité de tranchée (2) et Au pied du pylône électrique
(1).

Aucune photo ne cible *Atelier appartement*, bien que ce lieu porte 1 item
physique (l'item n'a apparemment pas encore été photographié).

**20 des 73 photos portent un `Depicts_specimen` multivalué** (2 ou 3
items) — même proportion que le lot 9. Dans tous les cas mesurés
aujourd'hui, les items multiples d'une même photo se trouvent au même
lieu ; c'est ce qui maintient le groupe C à zéro (voir plus bas), pas une
absence de cas multivalués.

Liste complète des 45 à corriger (`Image_location` actuel → cible) :

| Photo | Cible |
|---|---|
| ECL-Buisson Cerzat-Ail elephant-2026-08-07_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Ail elephant-2026-08-07_02.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Ail elephant-2026-08-07_03.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Ail elephant-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Bourrache-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Brocoli vivace-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Capucine tubereuse-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Chayote-2026-08-08_01.jpg | **Au pied du pylône électrique** |
| ECL-Buisson Cerzat-Chou Daubenton-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Consoude B14-2026-08-08_01.jpg | **Extrémité de tranchée** |
| ECL-Buisson Cerzat-Consoude naine-2026-08-08_01.jpg | **Extrémité de tranchée** |
| ECL-Buisson Cerzat-Crosne du Japon-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Egopode-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Fraisier X-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Fraisier X2-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Helianthi-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Hemerocalle-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Hemerocalle-2026-08-08_02.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Hemerocalle-2026-08-08_03.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Hemerocalle-2026-08-08_04.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Hysope-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Menthe X-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Menthe bergamote-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Miscanthus-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Miscanthus-2026-08-08_02.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Miscanthus-2026-08-08_03.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Miscanthus-2026-08-08_04.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Oignon rocambole-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Paulownia-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Paulownia-2026-08-08_02.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-07_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-07_02.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-07_03.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-07_04.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_02.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_03.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_04.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_05.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_06.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_07.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Roquette sauvage-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Sarrasin vivace-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Tomates-2026-08-08_01.jpg | Butte de la tranchée |
| ECL-Buisson Cerzat-Yacon-2026-08-08_01.jpg | Butte de la tranchée |

Les 20 déjà correctes (aucune écriture requise) : les 5 photos
« Chou Daubenton » (Jardin de Chilhac, 01–05), 2 « Framboisier classique »,
3 « Framboisier jaune », 2 « Groseiller à maquereau », 1 « Oignon
rocambole », 2 « Poireau perpetuel » (Jardin de Chilhac, 05 et 09-01),
1 « Groseiller » (Terrasse), 1 « Menthe X & Chayote » (Terrasse), 2
« Persil japonais » (Terrasse), 1 « Roquette sauvage » (Terrasse) —
liste exacte dans le fichier de travail, disponible sur demande.

### Groupe B — `Depicts_specimen` absent (8 photos)

Vues d'ensemble présumées, toutes actuellement sur
`Image_location=Le Buisson de Cerzat` — **à faire trancher par Cyril**,
pas de proposition automatique :

- ECL-Buisson Cerzat-Couleuvre verte et jaune-2026-08-05_01.jpg
- ECL-Buisson Cerzat-Couleuvre verte et jaune-2026-08-05_02.jpg
- ECL-Buisson Cerzat-Couleuvre verte et jaune-2026-08-05_03.jpg
- ECL-Buisson Cerzat-Couleuvre verte et jaune-2026-08-05_04.jpg
- ECL-Buisson Cerzat-Couleuvre verte et jaune-2026-08-05_05.jpg
- ECL-Buisson Cerzat-Gainage cable-2026-08-07_01.jpg
- ECL-Buisson Cerzat-Raboutage cable gaine-2026-08-05_01.jpg
- ECL-Buisson Cerzat-Raboutage cable gaine-2026-08-05_02.jpg

Deux sujets distincts s'y mélangent : cinq photos d'une couleuvre (faune,
pas une plantation ni un ouvrage) et trois photos de travaux de câblage
(gainage/raboutage — installation, pas une plantation). Le modèle
`Specimen photo` ne les catégorise pas dans *Photo de plantation*
(la catégorie n'est posée que `{{#if:{{{Depicts_specimen|}}}}}`), donc
elles n'apparaissent déjà dans aucune galerie de plantation — seul
`Image_location` reste à trancher. *Le Buisson de Cerzat* reste un lieu
valide (il n'a pas été supprimé, seulement vidé de ses items directs) :
le laisser en l'état n'est pas une erreur en soi, seulement une question
de précision à arbitrer.

### Groupe C — lieux différents (0 photo)

Vide sur les 73 photos actuelles. Les 20 photos à `Depicts_specimen`
multivalué ont toutes leurs items au même lieu (vérifié un par un via la
jointure `Located_at`, section 4 pour le recoupement). Ce n'est pas une
garantie structurelle : si un futur redécoupage éclate un groupe d'items
aujourd'hui co-localisés (ex. les trois pieds d'Ail éléphant ECL-0003/
0041/0042, tous à Butte de la tranchée), une photo qui les regroupe
retombera en groupe C sans qu'aucun mécanisme actuel ne le signale.

## 3. Les six fichiers sans `Image_location`

79 images sur le wiki, 73 annotées, **6 sans** :

- Fichier:Embout tuyau ø15 attache rapide percé ø9.jpg
- Fichier:Embout tuyau ø15 attache rapide sur la longueur.jpg
- Fichier:Logo Ecolibre 135x135.png
- Fichier:Logo Ecolibre V1 carré.png
- Fichier:Logo Ecolibre V1 rectangle.png
- Fichier:Raccord droit pour arrosage GEOLIA Geo9007-2 Weldom.jpg

Trois logos de marque et trois photos de pièces de raccordement
(illustrations de fiches `Referenced item`, pas de plantations). Vérifié
par `browsebysubject` sur la dernière (section 4) : aucun fait
`Depicts_specimen` ni `Image_location`, seulement `_MDAT`/`_SKEY` — ces
pages n'utilisent pas `{{Specimen photo}}`. **Elles ne relèvent pas du
même traitement** : rien à leur faire ici, la question ne se pose que
pour des photos de plantation.

## 4. Recoupement par un second canal

`action=ask` seul n'est pas retenu comme preuve — le hash de requête
partagé constaté hier (test du double renommage) retire toute garantie
qu'un appel `ask` ait été recalculé plutôt que servi depuis un cache.
Trois échantillons relus par `browsebysubject`, un par groupe (groupe C
vide : remplacé par un échantillon des « six sans Image_location ») :

**Groupe A** — `Fichier:ECL-Buisson Cerzat-Ail elephant-2026-08-07 01.jpg` :
```
Depicts_specimen -> [Ail_éléphant…(ECL-0003), …(ECL-0041), …(ECL-0042)]
Image_location -> ['Le_Buisson_de_Cerzat#0##']
```
Concorde avec l'`ask` : 3 items multivalués, tous relocalisés à Butte de
la tranchée.

**Groupe B** — `Fichier:ECL-Buisson Cerzat-Couleuvre verte et jaune-2026-08-05 01.jpg` :
```
Image_location -> ['Le_Buisson_de_Cerzat#0##']
```
Pas de fait `Depicts_specimen` du tout — concorde.

**Six sans Image_location** — `Fichier:Raccord droit pour arrosage GEOLIA Geo9007-2 Weldom.jpg` :
```
_MDAT -> [...]
_SKEY -> ['Raccord droit pour arrosage GEOLIA Geo9007-2 Weldom.jpg']
```
Ni `Image_location` ni `Depicts_specimen` — concorde, confirme le
paramètre absent plutôt qu'une valeur vide non affichée par `ask`.

Les trois recoupements confirment les données mesurées par `ask` :
aucun écart trouvé.

## 5. Où vit `Image_location` dans le wikitexte

**Saisie à la main, sur chaque page**, en paramètre de l'appel
`{{Specimen photo|...}}` — pas dérivée automatiquement de
`Depicts_specimen`. Lu directement sur trois pages :

```
{{Specimen photo|Depicts_specimen=Ail éléphant — Le Buisson de Cerzat (ECL-0003);Ail éléphant — Le Buisson de Cerzat (ECL-0041);Ail éléphant — Le Buisson de Cerzat (ECL-0042)|Image_date=2026-08-07|Image_location=Le Buisson de Cerzat}}
```

`Modèle:Specimen photo` confirme : `#set:Image_location={{{Image_location|}}}`
— simple passe-plat, aucune logique de calcul. Le modèle **pose** le fait
SMW à partir du paramètre, mais ne le déduit de rien : chaque page porte
sa propre valeur, indépendamment des autres.

**Conséquence sur la méthode** : pas de correction centralisée possible
via le modèle — **45 écritures indépendantes**, une par page du groupe A
à corriger, chacune modifiant uniquement la valeur du paramètre
`Image_location=` dans l'appel `{{Specimen photo|...}}` de sa propre
page.

**Ancre d'écriture proposée** : remplacement de chaîne exacte, par page,
de `Image_location=Le Buisson de Cerzat}}` vers
`Image_location=<lieu cible>}}` — ancrée sur la fin de l'appel de modèle
(`}}`) pour éviter tout accroc avec un `Depicts_specimen` qui contiendrait
lui-même la sous-chaîne « Le Buisson de Cerzat » dans un nom de page (cas
réel ici : tous les noms de plantations du groupe A portent
« — Le Buisson de Cerzat » dans leur propre titre). Lire chaque page
avant d'écrire, vérifier que la chaîne n'apparaît qu'une fois dans le
texte complet, puis remplacer.

**Nombre d'écritures** : 45 (groupe A à corriger). 0 pour le groupe B
tant que Cyril n'a pas tranché. 0 pour le groupe C (vide).

**Contrôle après chaque écriture** : relire le wikitexte de la page
(`Image_location=` porte la nouvelle valeur), puis `browsebysubject`
pour confirmer le fait stocké — le motif du lot 9 (`"result":"Success"`
ne prouve pas le stockage SMW) s'applique ici comme ailleurs. Contrôle
global après les 45 : reprendre l'`ask` `[[Image_location::Le Buisson de
Cerzat]]|format=count` en le recoupant par une requête en liste (le
défaut `format=count` documenté hier), pour vérifier qu'il ne reste que
les 8 photos du groupe B (si non tranché) pointant encore vers *Le
Buisson de Cerzat*.

## 6. Signalé avant écriture

- **45 résumés d'édition distincts à rédiger**, un par page, au format
  `[Correctif] Image_location — <plantation> vers <lieu>` ou équivalent.
  Se prépare mieux en liste cochée qu'en écriture au fil de l'eau : la
  table de la section 2 peut servir de liste de contrôle page par page.
- **Le groupe B mélange deux sujets sans rapport** (faune et travaux de
  câblage) sous une même absence de `Depicts_specimen`. Les traiter comme
  un seul lot pourrait masquer que la bonne réponse n'est pas forcément
  la même pour les deux (une photo de couleuvre documente un lieu
  d'observation ; une photo de gainage de câble documente un ouvrage —
  le lieu pertinent peut différer entre les deux sous-groupes même si
  les deux restent actuellement sur *Le Buisson de Cerzat*).
- **Les titres des pages d'items gardent le nom de l'ancien lieu.** Les
  45 items du groupe A portent tous « — Le Buisson de Cerzat » dans leur
  propre titre de page (ex. `Ail éléphant — Le Buisson de Cerzat
  (ECL-0003)`) alors que leur `Located_at` pointe déjà vers Butte de la
  tranchée ou un autre lieu enfant depuis la migration du 25 août. Cette
  tâche ne les renomme pas — hors périmètre — mais la divergence entre
  titre et `Located_at` est déjà là et peut dérouter une lecture
  ultérieure qui ferait confiance au titre plutôt qu'au fait stocké.
- **Groupe C à zéro n'est pas une preuve d'absence structurelle**, voir
  section 2 : un futur redécoupage peut le peupler sans préavis.
- **`Le Buisson de Cerzat` reste un lieu valide**, non supprimé, non
  renommé — seulement vidé de ses items directs. Écrire dessus (pour le
  groupe B, si Cyril tranche de l'y laisser) resterait donc légitime, pas
  une erreur par construction.
- Rien trouvé de plus inquiétant : les 73 valeurs `Image_location`
  actuelles sont toutes des noms de lieux existants (aucun lien rouge
  détecté dans l'échantillon relu), et les trois recoupements
  `browsebysubject` concordent intégralement avec `ask`.

Aucune écriture faite. Prêt pour validation de Cyril sur le groupe A (les
45), puis décision sur le groupe B.
