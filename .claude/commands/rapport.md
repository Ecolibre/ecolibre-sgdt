---
description: Écrit un rapport de session (écritures wiki, reconnaissance, échecs) dans travaux/rapport-AAAA-MM-JJ.md
---

Rédige un rapport de la session en cours dans `travaux/rapport-AAAA-MM-JJ.md`
(`~/ecolibre-sgdt/travaux/`), où `AAAA-MM-JJ` est la date du jour (voir
`currentDate` dans le contexte). Si le fichier existe déjà pour aujourd'hui,
lis-le d'abord et complète-le plutôt que de l'écraser.

Ne documente que ce qui a réellement été fait dans cette session — pas de
reconstitution ni d'anticipation. Si une section n'a rien à rapporter, dis-le
explicitement plutôt que de l'omettre.

Structure attendue (voir `travaux/rapport-reconnaissance.md` du 2026-07-25
comme gabarit de style) :

## 1. Écritures sur le wiki
Pour chaque édition réellement effectuée (`wiki-put.sh` ou appel curl direct) :
- page cible, méthode utilisée (script ou curl direct, et pourquoi)
- résultat API exact (`result`, `pageid`, `oldrevid`/`newrevid`)
- résumé d'édition exact utilisé
- contenu exact écrit, ou diff exact si édition d'une page existante
- contrôles post-écriture exécutés et leur résultat

## 2. Résultats de reconnaissance
Toute lecture seule qui a produit un résultat exploitable : appels API
(`siteinfo`, `categorymembers`, `embeddedin`, `ask`, dump de pages, etc.), avec
les données obtenues, pas seulement la mention que l'appel a été fait.

## 3. Ce qui a échoué ou n'a pas pu être obtenu
Toute action tentée sans succès, tout point resté hors de portée (ex. réglages
`$smwg*`, configuration serveur), et toute hypothèse du document de cadrage qui
s'est révélée fausse à l'usage. Inclure la raison de l'échec, pas seulement le
constat.

Résumé d'édition / message final court une fois le rapport écrit : nom du
fichier et nombre de lignes ajoutées.
