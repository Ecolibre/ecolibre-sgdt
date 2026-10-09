# Lot 22 — Tâche 11 — Page « Miroir local du wiki »

Exécuteur : Claude Code, 9 octobre 2026. Une seule écriture sur le wiki : la
création de « Miroir local du wiki », par `bin/wiki-put.sh --createonly`.
Trois écritures dans le dépôt. Le lot reste « ouvert ».

**Résultat : la page est créée, révision 1484, rangée dans la seule
`Catégorie:Page de suivi`, sans annotation parasite. Les sept contrôles
passent.**

## Étape 1 — État du dépôt

`git status --porcelain` : vide. `.claude/settings.local.json` : `allow` et
`deny` vides. Dernier commit, poussé : `586de847f15d4d677da7fad6ecc826ec2e0fc431`
(`main...origin/main`, sans écart).

## Étape 2 — Le permalien du README

https://github.com/Ecolibre/ecolibre-sgdt/blob/586de847f15d4d677da7fad6ecc826ec2e0fc431/miroir/README.md

Construit sur `586de84`, le commit de la tâche 10, dernier poussé au début de
cette tâche. **200** avant l'écriture, et 200 après.

## Étape 3 — La page

**Préalables :**

- `prop=info` sur « Miroir local du wiki » : `missing`. La page n'existait
  pas.
- Titre de la page du lot, lu dans `Catégorie:Lot` : « Lot 22 — Miroir
  local ».
- Forme relevée sur *Récapitulatif technique du Système de Gestion de
  Données Techniques*, lu par `curl` avec `action=parse&prop=wikitext` :
  - un chapeau bilingue : un paragraphe `'''Version française :''' …`, puis
    un paragraphe en italique `''English version: …''` ;
  - une ligne « Voir aussi … » vers les pages liées ;
  - les sections ;
  - la catégorie en dernière ligne, `[[Catégorie:Page de suivi]]`. Le
    *Récapitulatif* porte aussi `[[Catégorie : SGDT]]` sur l'avant-dernière
    ligne ; je ne l'ai pas reprise, la consigne ne rangeant la page que dans
    `Catégorie:Page de suivi`.

**Contrôle du texte avant envoi :**

- aucune occurrence de `::`, `{{`, `}}`, `/home`, `docker compose` ni
  `maintenance/` ;
- trois liens internes, chacun sur une seule ligne :
  `[[Lot 22 — Miroir local]]`,
  `[[Limites connues du Système de Gestion de Données Techniques]]` et
  `[[Catégorie:Page de suivi]]`.

**Création :** `bin/wiki-put.sh "Miroir local du wiki" … --createonly`, avec
le résumé « [Lot 22][Tâche 11] Création de Miroir local du wiki : pourquoi,
ce qu'il reproduit, ses écarts, les deux routes écartées ». Réponse :
`"new": true`, `oldrevid` 0, **`newrevid` 1484**.

### Texte intégral de la page créée

```
'''Version française :''' Cette page explique le miroir local du wiki : pourquoi il existe, ce qu'il reproduit de la production, ce qu'il ne reproduit pas, et les deux routes écartées pour le construire. Les commandes pour le monter vivent dans le dépôt du projet.

''English version: This page explains the local mirror of the wiki: why it exists, what it reproduces from production, what it does not, and the two routes ruled out when building it. The commands to set it up live in the project repository.''

Voir aussi la page du [[Lot 22 — Miroir local]] et les [[Limites connues du Système de Gestion de Données Techniques]].

== Pourquoi un miroir ==

Le 18 août 2026, un changement de configuration fait directement sur la production a rendu le wiki inaccessible à tous, pour la consultation des pages comme pour l'API. Il manquait une étape préalable, que personne n'avait repérée. Le miroir est cette étape : un banc d'essai où un réglage s'éprouve d'abord, avant d'être demandé en production. Il tourne sur le poste de Cyril. Il prend ses données à la production et n'y écrit jamais rien.

== Ce qu'il reproduit fidèlement ==

Le code de MediaWiki n'est pas réinstallé : il est copié depuis le serveur de production, extensions comprises, chacune à sa version exacte. Le miroir tourne donc sur la même version de MediaWiki, la même version de PHP et le même moteur de base de données que la production, avec la même configuration, à quelques écarts près décrits plus bas. Son contenu provient d'une copie de la base de production prise le jour où il a été monté.

== Ce qu'il ne reproduit pas ==

Certaines différences sont voulues. Les connaître évite de mal lire le résultat d'un essai.

* '''L'adresse du site et les clés de l'installation.''' Le miroir répond à une adresse locale, sur le poste qui l'héberge, et possède ses propres clés et mots de passe : rien de ce qui est propre à l'installation de production n'y est recopié.
* '''Les fichiers téléversés.''' Ils ne sont pas copiés. Les pages de fichier existent, mais sans leur fichier, et les liens d'image sont cassés.
* '''Une partie des modules PHP.''' Certains modules chargés en production manquent au miroir, parce qu'aucun réglage d'Ecolibre ne les atteint. Un essai qui en ferait intervenir un demande de l'ajouter d'abord.
* '''Les travaux de la file pendant une requête web.''' En production, une simple consultation peut exécuter un travail en attente et modifier la base. Sur le miroir, cette exécution est coupée, pour qu'une mesure répétée donne le même résultat ; les travaux s'y lancent délibérément.

'''Avant de conclure qu'un essai a échoué, relire la liste des écarts''', tenue à jour dans le dépôt : la cause d'un résultat surprenant peut se trouver dans un écart du miroir, et non dans le réglage éprouvé.

== Deux routes écartées ==

'''Reconstruire le miroir depuis l'image officielle de MediaWiki''', au lieu de copier le code de la production. Écartée le 9 octobre 2026 : sur les 40 extensions présentes sur le disque de production, 18 ne déclarent aucune version. Une reconstruction afficherait les mêmes numéros sans faire tourner le même logiciel, alors que le miroir sert justement à attraper l'effet de bord qu'on n'attendait pas.

'''Mettre le compte qui pilote Docker dans le groupe docker.''' Écartée le 9 octobre 2026 : appartenir à ce groupe revient à détenir la racine de la machine. Docker tourne donc en mode sans privilèges.

== Où sont les commandes ==

La marche à suivre complète pour monter le miroir, ses commandes exactes et son dépannage se trouvent dans le dépôt du projet : [https://github.com/Ecolibre/ecolibre-sgdt/blob/586de847f15d4d677da7fad6ecc826ec2e0fc431/miroir/README.md le README du miroir]. Pour tout ce qui est commande ou chiffre, c'est le dépôt qui fait autorité ; cette page porte le pourquoi.

[[Catégorie:Page de suivi]]
```

## Étape 4 — Trois écritures dans le dépôt

### a) `CLAUDE.md` — deux règles, points 8 et 9

Ajoutées à la suite du point 7 (la règle d'annonce de la tâche 6), dans
« Garde-fous d'exécution (toute édition sur le wiki) », sous la forme des
points existants : numéro, intitulé en gras, date et motif.

Avant, fin de la section :

> 7. **Un fichier déposé dans un arbre servi par un serveur web s'annonce au
> préalable**, […] Ajoutée le 09/10/2026 : la sonde `limites_tache6.php` de
> la tâche 6 du lot 22, déposée à la racine du MediaWiki du miroir, n'avait
> été décrite qu'après coup.

Après, ajouté à la suite :

> 8. **Un filtre se vérifie sur ce qu'il produit, jamais sur son
> intention.** Une commande censée masquer un secret s'essaie sur un cas où
> le secret est présent ; un motif d'exclusion se contrôle en listant ce que
> l'archive contient. Ajoutée le 09/10/2026 : deux fois dans le lot 22, un
> filtre écrit par l'architecte n'a pas fait ce qu'il annonçait, une fois en
> affichant le mot de passe de la base, une fois en laissant un fichier de
> configuration entrer dans une archive.
>
> 9. **Pas de script du scratchpad tant que le travail tient en quelques
> lignes dans la commande.** La fenêtre de confirmation ne montre qu'un
> chemin de fichier : un script nommé rend opaque ce qui serait lisible
> écrit dans la commande elle-même. Ajoutée le 09/10/2026, après deux refus
> dans le lot 22 (`verif1.py` et `verif3.py` en tâche 6, `permaliens.sh` en
> tâche 9).

### b) `demandes-adminsys.md` — rotation du mot de passe

Section 2.4 « Gouvernance ». Aucun mot de passe écrit, aucun message
rédigé pour l'adminsys.

Avant :

> **Rotation du mot de passe de `mediawiki_ecolibre_prod`**, exposé en
> juillet 2026.

Après :

> **Rotation du mot de passe de `mediawiki_ecolibre_prod`**, exposé en
> juillet 2026. Exposé une seconde fois le 9 octobre 2026, dans le terminal
> de Cyril et dans une conversation claude.ai, par une commande écrite par
> l'architecte dont le masquage était défectueux. Le compte n'est joignable
> que depuis le serveur (`$wgDBserver` vaut `localhost`). C'est un second
> motif à cette demande déjà ouverte, pas une demande nouvelle.

### c) `miroir/README.md` — renvoi vers la page du wiki

Placé en tête, juste après le renvoi vers `ecarts-avec-la-production.md`.
L'URL https://wiki.ecolibre.org/wiki/Miroir_local_du_wiki rend 200.

Avant :

> Avant d'interpréter un résultat surprenant, relire
> [`ecarts-avec-la-production.md`](ecarts-avec-la-production.md).

Après, ajouté à la suite :

> Le pourquoi du miroir — ce qu'il reproduit, ce qu'il ne reproduit pas, les
> routes écartées — est sur le wiki, page
> [Miroir local du wiki](https://wiki.ecolibre.org/wiki/Miroir_local_du_wiki).
> Ce README porte les commandes, les chemins et le dépannage.

Bilan du dépôt, par `git diff --stat` : `CLAUDE.md` +13,
`demandes-adminsys.md` +5 −1, `miroir/README.md` +5.

## Étape 5 — Vérifications

1. **QUI TRANCHE — passe.** Faits de la nouvelle page par
   `bin/wiki-api.sh --facts` :

   ```
   _INST -> ['Page_de_suivi#14##']
   _MDAT -> ['1/2026/10/9/23/12/12/0']
   _SKEY -> ['Miroir local du wiki']
   ```

   On y trouve seulement `_MDAT`, `_SKEY` et `_INST`, et `_INST` ne vaut que
   `Catégorie:Page de suivi`. Aucune autre annotation.
2. **Wikitexte relu — passe.** Relu par `bin/wiki-get.sh` et comparé par
   `diff` au fichier envoyé : identique, au saut de ligne final près.
3. **`prop=categories`** : `Catégorie:Page de suivi` seulement.
4. **`prop=links`** : deux liens, tous deux vers des pages existantes, aucun
   `missing` :
   - « Lot 22 — Miroir local » (`pageid` 533) : c'est la page du lot écrite
     aux tâches 9 et 10, au titre exact lu dans `Catégorie:Lot` ;
   - « Limites connues du Système de Gestion de Données Techniques »
     (`pageid` 144).
5. **Permalien du README** : 200 avant et après l'écriture.
6. **Aucune autre page modifiée.** `list=recentchanges` depuis 22 h 12 UTC,
   une heure avant la création, rend trois changements, tous de Cywil :
   - révision 1484, « Miroir local du wiki », tâche 11 ;
   - révision 1483, « Lot 22 — Miroir local », tâche 10 ;
   - révision 1482, « Lot 22 — Miroir local », tâche 9.

   Une seule écriture porte le résumé de la tâche 11 : la création.
7. **`.claude/settings.local.json`** : vide au début et à la fin.

## Questions posées ou réponses rendues hors consigne

Aucune.

## Écarts et surprises

- **Le permalien de la page pointe sur un README antérieur à son propre
  renvoi vers le wiki.** Il est construit sur `586de84`, comme demandé, alors
  que le renvoi c) arrive dans le commit de cette tâche. Le README lu par ce
  permalien ne mentionne donc pas encore la page du wiki. Cela n'a aucune
  conséquence sur les commandes, qui n'ont pas changé. Un permalien construit
  sur le commit de cette tâche ne pouvait pas être vérifié avant l'écriture,
  puisque ce commit n'existait pas encore.
- **Une ligne de catégorie du *Récapitulatif* n'a pas été reprise.** La forme
  relevée finit par deux lignes de catégorie, `[[Catégorie : SGDT]]` puis
  `[[Catégorie:Page de suivi]]`. La page créée ne porte que la seconde,
  conformément à la consigne et à la vérification 3. Si Cyril veut aussi la
  ranger dans `Catégorie:SGDT`, ce sera une écriture à part.
