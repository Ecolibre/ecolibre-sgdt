# Ecolibre — SGDT wiki sémantique

Wiki : https://wiki.ecolibre.org — MediaWiki + Semantic MediaWiki, Page Forms,
Scribunto/Lua, Semantic Result Formats.

## Outils disponibles
- `bin/wiki-login.sh` — ouvrir la session (à faire une fois par session de travail)
- `bin/wiki-get.sh "Page"` — lire le wikitexte d'une page (lecture seule, GET
  uniquement, hôte en dur ; réutilise la session de `wiki-login.sh` sans jamais
  manipuler d'identifiant)
- `bin/wiki-put.sh "Page" fichier.txt "résumé" [--createonly]` — écrire une page ;
  `--createonly` fait échouer l'appel si la page existe déjà (`articleexists`) au
  lieu de l'écraser — à utiliser pour toute création
- `bin/wiki-api.sh "chaîne de paramètres"` — exécuter n'importe quel appel de
  lecture de l'API MediaWiki en GET (`browsebysubject`, `siteinfo`, `allpages`,
  `backlinks`, `expandtemplates`, `intestactions`…) ; lecture seule stricte,
  refuse les actions d'écriture connues du cœur MediaWiki et des extensions
  locales (`pfautoedit`, `sfautoedit`, `smwtask`), et tout paramètre `action=`
  dupliqué. `--facts "subject=...&ns=..."` : raccourci pour
  `action=browsebysubject`, affiche une ligne `propriété -> [valeurs]` par
  fait au lieu du JSON brut. `action=purge` exige une requête POST : hors du
  périmètre GET de ce script, voir `bin/wiki-purge.sh`.
- `bin/wiki-purge.sh "Titre 1|Titre 2"` — purger une ou plusieurs pages
  (POST + jeton CSRF, `forcelinkupdate=1` systématique). Aucun autre
  paramètre, aucune autre action que purge.
- `bin/wiki-upload.sh fichier.jpg` — téléverser un fichier local sous son nom
  de base (aucun renommage par le script) ; jamais `ignorewarnings`, jamais
  `bot=1` : un nom déjà pris fait échouer l'appel (`result` différent de
  `Success`) au lieu d'écraser, équivalent de `--createonly` côté
  `wiki-put.sh`.

**Forme d'appel canonique** : toujours invoquer ces scripts en relatif à la racine
du dépôt, sous la forme `bin/wiki-get.sh ...` / `bin/wiki-put.sh ...` — jamais
`./wiki-get.sh` ni de chemin absolu. Les règles de permission dans
`.claude/settings.json` matchent sur ce préfixe exact ; un autre chemin passerait
à côté des règles `allow` et redemanderait confirmation à chaque appel.

**`.env` et `.cookies.txt` ne vivent pas dans ce dépôt** : cherchés d'abord
dans `$SGDT_PRIVE` (défaut `../ecolibre-sgdt-prive/`, voisin du dépôt), puis
dans le dépôt lui-même par compatibilité. `wiki-get.sh`/`wiki-api.sh`
dégradent en lecture anonyme si introuvables ; `wiki-login.sh`/`wiki-put.sh`/
`wiki-purge.sh` échouent avec un message donnant les deux chemins cherchés.

Les copies locales de pages vont dans `pages/`.

## Garde-fous d'exécution (toute édition sur le wiki)
1. **Lire avant d'écrire.** Toujours récupérer le wikitexte courant
   (`wiki-get.sh` / `action=parse&prop=wikitext`), calculer le diff, le proposer,
   puis écrire. Jamais d'écriture à l'aveugle.
2. **Une modification = une édition = un résumé explicite.** Format réellement
   utilisé depuis le lot 6 : `[Lot X][Tâche N] <action>` — et non
   `[Lot X] <point> — <action>` comme l'écrivait cette règle jusqu'au lot 8.
   Rend le travail annulable page par page. Une écriture qui ne relève pas
   d'un lot en cours porte `[Correctif] <action>`, jamais un numéro de lot :
   ne jamais réserver un numéro de lot pour une correction ponctuelle.
3. **`createonly=1`** sur toute création de page. Si la page existe déjà, l'appel
   doit échouer et remonter, jamais écraser.
4. **Aucune nouvelle référence Base36 ne doit être créée hors ligne** : le compteur
   est en production, toute création locale risque une collision.
5. **Pages protégées.** Vérifier `prop=info&inprop=protection` avant d'écrire, et
   remonter si le niveau dépasse les droits du compte bot. L'extension **Lockdown**
   est installée sur ce wiki : une restriction par namespace peut s'appliquer sans
   apparaître dans `prop=info|protection`. Si une écriture échoue de façon
   inattendue, suspecter Lockdown avant un bug de script.
6. **Périmètre.** Ne modifier les modèles/formulaires d'items (Functional, Organic,
   Referenced, Physical) que dans le cadre d'une action explicitement validée par
   Cyril. Le reste est reconnaissance en lecture seule, ou rédaction à soumettre
   avant publication.

## Règles impératives (modèle de données)
- **Aucune virgule dans les noms de tableaux kanban ni de pages** : la virgule est
  le délimiteur multi-valeurs partout dans le modèle.
- **Convention de nommage des fichiers média** (appliquée aux 73 photos du
  lot 9) : `ECL-<lieu>-<plante>-<AAAA-MM-JJ>_<nn>.jpg` — tiret entre les
  4 champs principaux (ECL, lieu, plante, date+numéro), underscore à
  l'intérieur d'un champ multi-mots (`Buisson_Cerzat`, `Ail_elephant`) et
  entre la date et le numéro (`2026-08-07_01`). Jamais d'espace, jamais
  d'accent. Le tiret est le séparateur de champs, l'underscore appartient au
  contenu d'un champ : un découpage se fait sur le tiret, jamais sur
  l'underscore. Deux fichiers du lot ont dû être renommés après refus
  badfilename de MediaWiki (espace parasite) — vérifier les noms avant de
  téléverser, pas après.
- Page bac à sable pour les essais : `Utilisateur:Cywil/Bac à sable`.

## Corrections en attente sur les modèles
1. Module d'audit Base36 : ajouter la détection de doublons (en plus des trous).
2. Décider si les objets physiques rejoignent la séquence Base36 auto-incrémentée.

## Leçons de méthode (wiki et outillage)

- **Un retour à la ligne à l'intérieur de `[[ ]]` casse silencieusement un
  lien MediaWiki.** Aucune erreur d'API à l'écriture, mais le lien est absent
  de `pagelinks` et donc de `list=backlinks`. Toujours écrire un lien sur une
  seule ligne, et contrôler par `list=backlinks` après toute édition qui en
  ajoute un. Ne jamais replier une balise `[[ ]]` pour respecter une largeur
  de ligne, même quand le titre est long.

- **`+sep=` est par propriété et sa position compte.** Dans un `#set`,
  `|+sep=` s'applique à la propriété qui le précède immédiatement, pas au
  bloc entier. Le déplacer casse le découpage de la propriété concernée.

- **SMW ne rogne pas les espaces des valeurs intermédiaires.** Avec
  `|+sep=,`, `A, B, C` produit `A`, ` B`, ` C`. Une propriété de type Page
  absorbe l'espace par normalisation du titre ; une propriété de type Texte
  le conserve et met en défaut ses valeurs autorisées.

- **Le widget `tokens` de Page Forms insère un espace après le délimiteur.**
  Malgré `delimiter=,`, il écrit `A, B`. À normaliser côté modèle
  (`#arraymap`), pas à espérer côté formulaire.

- **Modèle avant formulaire.** Poser un `+sep=` ou un `#arraymap` sur un
  modèle recevant une valeur unique est inerte. L'ordre inverse ouvre une
  fenêtre où des valeurs multiples peuvent être enregistrées dans un modèle
  incapable de les stocker.

- **Une vérification par formulaire n'est jamais en lecture seule.** Rouvrir
  un item pour inspecter ses champs, c'est risquer de l'enregistrer modifié
  (pré-remplissage, ré-enregistrement de valeurs déjà saisies).

- **Avant un renommage de paramètre, `embeddedin` et la recherche plein texte
  ne suffisent jamais seuls — il faut les deux, puis une lecture
  individuelle.** L'index de recherche plein texte indexe le contenu
  **rendu**, pas le wikitexte brut : un nom de paramètre de template
  disparaît du texte rendu, seule sa valeur y survit. `embeddedin` trouve les
  usages réels (transclusions) mais pas les pages qui *parlent* de l'ancien
  nom sans transclure le modèle. Aucune des deux méthodes ne suffit seule.

- **La session expire entre lecture et écriture.** Une session qui commence
  par une phase de lecture verra sa première écriture échouer sur un cookie
  périmé. Relancer `bin/wiki-login.sh` avant d'écrire.

- **Comment vérifier un fait SMW réellement stocké.** `bin/wiki-get.sh` ne
  gère pas `action=browsebysubject`, et la lecture du wikitexte ne montre pas
  ce qui est stocké :
  ```
  curl -s "https://wiki.ecolibre.org/api.php?action=browsebysubject&subject=NOM_DE_PAGE&format=json&formatversion=2" \
    | jq '.query.data[] | select(.property=="NOM_PROPRIETE")'
  ```
  Un seul `dataitem` contenant le séparateur = découpage non appliqué.
  Propriété absente = le `#set` ne reçoit pas le paramètre. **L'affichage ne
  prouve rien** : `#arraymap` rogne les espaces, `#set` non — deux liens
  corrects peuvent masquer une donnée fausse.

  **Piège spécifique aux pages `Attribut:`/`Property:`** : les propriétés
  spéciales de SMW (`Allows value`, `Has type`…) s'affichent dans
  `browsebysubject` sous leur nom interne (`_PVAL`, `_TYPE`…), pas sous leur
  nom d'affichage. Filtrer sur le nom d'affichage donne un faux « absente ».
  Toujours faire un premier passage sans filtre pour voir les clés réelles.

- **`bin/wiki-api.sh` ne réencode pas la chaîne de paramètres.** Un espace
  non encodé dans un titre fait échouer `curl` en silence (code de sortie 3,
  aucun message API). Toujours passer les titres contenant un espace en
  `%20` dans la chaîne d'appel — contrairement à `wiki-get.sh`/`wiki-put.sh`,
  qui encodent eux-mêmes via `--data-urlencode`.

- **Lire l'état du wiki avant de raisonner, pas seulement avant d'écrire.**
  Une copie locale est une photo, pas un état — des modifications hors
  session sont possibles à tout moment (Cyril via le formulaire, un autre
  outil). Un diagnostic bâti sur une copie locale peut être faux avant même
  d'aboutir à une proposition d'écriture.

- **Une convention rédigée de mémoire ne fait pas foi.** La convention de
  nommage des 73 fichiers du lot 9 a été dictée dans une forme inexacte
  (tout en underscore) et corrigée en lisant les noms réellement en place.
  Vaut pour les fichiers comme pour le wiki : lire l'état réel avant
  d'écrire une règle qui le décrit.

## Ne jamais faire
- Ne pas toucher au `composer.json` de MediaWiki (utiliser `composer.local.json`).
- Ne pas commiter `.env` ni `.cookies.txt`.
- ne jamais passer bot=1 sur une écriture
