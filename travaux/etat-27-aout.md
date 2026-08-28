# État du SGDT — vérification du 27 août 2026

Contexte : vérification d'état demandée par Cyril, aucune écriture effectuée.
Session ouverte avec `bin/wiki-login.sh` (Cywil), toutes les lectures via
`bin/wiki-get.sh` / `bin/wiki-api.sh`.

## 1. Le lieu « Extrémité de tranchée »

**Il n'a pas été renommé.** La page existe toujours sous ce titre exact.

- `bin/wiki-get.sh "Extrémité de tranchée"` renvoie un wikitexte `{{Lieu}}`
  complet (Location_number, Located_in, etc.), pas une redirection.
- `action=query&list=logevents&letype=move&letitle=Extrémité de tranchée`
  renvoie une liste vide : aucun renommage n'est journalisé pour ce titre.
- La page apparaît normalement dans `list=embeddedin` sur `Modèle:Lieu` et
  dans `list=categorymembers` sur `Catégorie:Lieu`, aux côtés des douze
  autres lieux.

Faits stockés (`browsebysubject`), qui confirment la cohérence :

```
Located_in -> ['Zone_basse#0##']
Location_number -> ['0008']
Location_site -> ['LOC']
_INST -> ['Lieu#14##']
_SKEY -> ['Extrémité de tranchée']
```

## 2. Mesure de l'effet d'un renommage

**Sans objet — aucun renommage n'a eu lieu**, donc pas d'ancien nom à
comparer à un nouveau. Les mesures qui suivent (issues des requêtes prévues
pour ce point, appliquées au seul nom existant) sont reprises telles quelles
dans la section 3 :

- items physiques avec `Located_at` vers « Extrémité de tranchée » : **2**
- pages `Fichier:` avec `Image_location` vers « Extrémité de tranchée » : **0**
- lieux enfants avec `Located_in` vers « Extrémité de tranchée » : **0**
- `Special:DoubleRedirects` (`list=querypage&qppage=DoubleRedirects`) :
  **aucun résultat**, sur l'ensemble du wiki (pas seulement ce lieu).

Aucune redirection n'existe donc à contrôler, et aucun fait stocké
n'appelle de comparaison ancien/nouveau nom.

## 3. État général

### Les treize lieux

| Lieu | Location_number | Located_in |
|---|---|---|
| Terrain de Cyril au Buisson de Cerzat | 0001 | Le Buisson de Cerzat |
| Cerzat | 0002 | *(commune, aucun Located_in — INSEE 43044)* |
| Chilhac | 0003 | *(commune, aucun Located_in — INSEE 43070)* |
| Appartement de Chilhac | 0004 | Chilhac |
| Zone basse | 0005 | Terrain de Cyril au Buisson de Cerzat |
| Zone haute | 0006 | Terrain de Cyril au Buisson de Cerzat |
| Butte de la tranchée | 0007 | Zone basse |
| Extrémité de tranchée | 0008 | Zone basse |
| Au pied du pylône électrique | 0009 | Zone haute |
| Le Buisson de Cerzat | 0010 | Cerzat |
| Jardin de Chilhac | 0011 | Appartement de Chilhac |
| Terrasse de Chilhac | 0012 | Appartement de Chilhac |
| Atelier appartement | 0013 | Appartement de Chilhac |

13 lieux confirmés par deux voies indépendantes (`embeddedin` sur
`Modèle:Lieu` et `categorymembers` sur `Catégorie:Lieu`), résultats
identiques aux 13 titres près.

### Items physiques par lieu (`Located_at`)

Requête `[[Located_at::+]]|?Located_at|limit=500` : **41 items physiques**
portent un `Located_at`, répartis sur 6 des 13 lieux — les 7 autres lieux
(dont les deux communes, les deux zones, et les trois lieux du terrain de
Cerzat autres que la Butte et l'Extrémité) n'ont aucun item directement
rattaché :

| Lieu | Items physiques (Located_at) |
|---|---|
| Butte de la tranchée | 26 |
| Jardin de Chilhac | 6 |
| Terrasse de Chilhac | 5 |
| Extrémité de tranchée | 2 |
| Au pied du pylône électrique | 1 |
| Atelier appartement | 1 |
| *(sept autres lieux)* | 0 |

### Pages `Fichier:` avec `Image_location`

Requête `[[Image_location::+]]|?Image_location|limit=500` : **73 pages
`Fichier:`** portent la propriété (tous sujets vérifiés en namespace 6),
réparties sur 3 lieux seulement :

| Lieu | Fichiers (Image_location) |
|---|---|
| Le Buisson de Cerzat | 53 |
| Jardin de Chilhac | 15 |
| Terrasse de Chilhac | 5 |

Cohérent avec `siprop=statistics` : 79 images au total sur le wiki, dont
73 annotées `Image_location` (6 sans, non creusé — hors périmètre de cette
vérification).

### Récapitulatif technique (`action=smwinfo`)

```
propcount        4229
usedpropcount      64
declaredpropcount 109
```

### Erreurs de traitement SMW (`_ERRC`)

Résultat **incohérent entre les deux formes de la même requête**, mesuré à
l'identique deux fois de suite :

- `[[_ERRC::+]]|format=count` → **0**
- `[[_ERRC::+]]` (liste) → **1** page : `Attribut:INSEE code`
- `[[_ERRC::+]]|?_ERRC` → même page, `_ERRC` vide en printout (piège déjà
  connu, documenté sur la page elle-même : `?_ERRC` revient toujours vide
  via l'API)

Le hash de requête renvoyé par le format `count` (`8abf92b9a49...`) reste
identique aux deux appels : plausible reliquat de cache de requête SMW non
invalidé, dans la même veine que les décalages `_CHGPRO`/`_PVAL` déjà
consignés dans `CLAUDE.md`. **Ce n'est pas tranché ici** — aucune écriture
n'a été faite pour le vérifier plus loin (purge, réécriture). À traiter
comme un doute ouvert, pas comme un fait établi : le nombre qui fait foi,
d'après la liste réelle, est **1** (`Attribut:INSEE code`), pas 0.

### `Special:DoubleRedirects`

Aucun résultat, sur l'ensemble du wiki.

## Non fait

Aucune écriture, aucun renommage, aucune correction — conformément à la
consigne. Le message d'erreur lisible sur `Attribut:INSEE code` n'a pas été
ouvert pour lecture (la page elle-même documente que `?_ERRT` n'est pas
exposé et qu'il faut ouvrir la page en question pour le voir en tête de
rendu) : hors périmètre de cette vérification d'état.
