# SGDT — outillage et suivi du wiki sémantique Ecolibre

Ce dépôt accompagne le wiki https://wiki.ecolibre.org, qui héberge le
Système de Gestion de Données Techniques (SGDT) d'Ecolibre — un système de
gestion de données techniques (PLM/PDM) orienté matériel libre (Open Source
Hardware) et ingénierie coopérative, construit sur MediaWiki, Semantic
MediaWiki, Page Forms et Scribunto.

Il ne remplace pas le wiki : il conserve la méthode, l'outillage et la
trace des sessions de travail qui le font évoluer — l'essentiel de ce qui
serait autrement perdu à la fermeture d'une conversation.

## Contenu

- **`bin/`** — scripts de lecture et d'écriture de l'API MediaWiki
  (`wiki-login.sh`, `wiki-get.sh`, `wiki-put.sh`, `wiki-api.sh`,
  `wiki-purge.sh`), en lecture seule stricte sauf `wiki-put.sh` (écriture
  de page) et `wiki-purge.sh` (invalidation de cache), tous deux
  explicitement dédiés à leur seule action. Voir « Configuration requise »
  ci-dessous pour l'emplacement attendu des identifiants.
- **`CLAUDE.md`** — méthode de travail, garde-fous d'exécution et leçons
  apprises sur l'outillage et sur MediaWiki/Semantic MediaWiki/Page Forms.
- **`controle-de-fin-de-session.md`** — procédure de répartition de
  l'information entre le wiki et ce dépôt en fin de session.
- **`rapport-*.md`**, **`rapport-reconnaissance.md`** — comptes rendus de
  session : écritures effectuées, résultats de reconnaissance, échecs et
  hypothèses infirmées.
- **`lot-*.md`**, **`ecolibre-sgdt-lot*.md`**, **`recap-maj-consolidee.md`**,
  **`sgdt-etat-des-lieux*.md`**, **`sgdt-passation-2026-08-10.md`** —
  documents de cadrage et de passation des différents lots de travail.
- **`diffs/`** — diffs de modifications proposées ou appliquées au fil des
  sessions.
- **`dump/`**, **`pages/`** — copies locales de pages du wiki (miroir de
  travail et brouillons), utilisées pour comparer l'état attendu à l'état
  réel avant et après écriture.

## Configuration requise

Les scripts de `bin/` qui ont besoin d'un identifiant ou d'une session
(`wiki-login.sh`, `wiki-put.sh`, `wiki-purge.sh`) attendent un fichier
`.env` définissant `WIKI_API`, `WIKI_USER` et `WIKI_PASS` ; `wiki-login.sh`
y écrit ensuite `.cookies.txt`. Aucun des deux ne vit dans ce dépôt.

Ils sont cherchés dans un **répertoire privé voisin du dépôt**, hors
publication : `../ecolibre-sgdt-prive/` par défaut, à côté du dossier
cloné. Ce chemin est surchargeable par la variable d'environnement
`SGDT_PRIVE` (utile si l'arborescence de votre clone diffère). Si absent
des deux emplacements, chaque script échoue avec un message explicite
indiquant où il a cherché — jamais d'échec silencieux ni de repli sur des
identifiants par défaut.

Les scripts de lecture seule (`wiki-get.sh`, `wiki-api.sh`) suivent la même
recherche pour `.cookies.txt`, mais s'en passent sans erreur s'il est
introuvable : ils lisent alors en session anonyme.

## Licence

Le contenu de ce dépôt est publié sous licence **CC BY-SA 4.0**
(Creative Commons Attribution — Partage dans les mêmes conditions 4.0
International), cohérente avec la licence du wiki qu'il documente.

## Avertissement — configuration serveur volontairement absente

Ce dépôt ne contient **aucune copie de configuration serveur**, ni
identifiant, ni secret. En particulier, sont **délibérément exclus** :

- toute copie locale de `LocalSettings.php` (répertoire `Serveur3/` dans
  les versions de travail de ce dépôt) — contient les identifiants de
  base de données et les clés secrètes de l'installation ;
- `.env` et `.cookies.txt` — identifiants et session active des scripts
  `bin/`.

Ces fichiers existent dans l'environnement de travail à partir duquel ce
dépôt est publié, mais en dehors de lui. Leur absence ici est
intentionnelle et permanente, pas un oubli à signaler.
