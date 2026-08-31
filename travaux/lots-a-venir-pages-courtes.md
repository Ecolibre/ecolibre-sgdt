# Lots à venir — création des huit pages courtes

Session du 31 août 2026. Huit lots étaient identifiés dans « Gestion des
lots », section « Lots à venir », sans page à eux. On leur a créé une page
courte — pas un cadrage complet — sur le modèle de forme long qu'est
« Lot 12 — Contenants et étiquetage ».

## Principe retenu

Un arbitrage vieillit lentement, une mesure vieillit vite. Ces pages ne
portent que ce qui vieillit lentement : l'objet, les décisions déjà prises
avec leur motif, ce qui a été écarté et pourquoi, les dépendances
structurelles. Elles ne portent ni périmètre détaillé, ni point de départ,
ni risques connus, ni numéro de ligne, ni valeur courante — ces sections
s'écriront à l'ouverture du lot, contre l'état du wiki de ce jour-là.

## Titres et numérotation

Sans numéro : « Lot — Navigation », « Lot — Images », etc. Le numéro est
attribué à l'ouverture, comme pour le lot 12. Chaque page le dit en tête.

## Structure commune aux huit pages

Une phrase-chapeau en gras, une ligne rappelant que le numéro sera attribué
à l'ouverture, puis cinq sections de niveau 2 :

1. État — texte identique sur les huit : « À cadrer. Éléments réunis le
   31 août 2026 au fil du lot 10. Le cadrage complet — périmètre, point de
   départ, risques — s'écrit à l'ouverture du lot, contre l'état du wiki de
   ce jour-là. »
2. Objet
3. Ce qui est déjà tranché — chaque entrée dit la décision **et** son motif.
4. Ce qui est écarté, et pourquoi — « Aucun écart consigné à ce jour. » sur
   les six pages où le matériau d'entrée n'apportait rien à écarter
   (Navigation et Images sont les deux exceptions).
5. Dépendances

Pied de page : renvoi vers « Gestion des lots ».

## Règle d'écriture SMW

Aucune syntaxe SMW exécutable dans le corps : noms de propriétés, de
catégories, de modèles et de modules en `<code>` sans les deux-points
doubles, jamais de crochets doubles ni d'accolades doubles dans la prose.
Les seuls `[[ ]]` sont le lien de pied de page vers « Gestion des lots » et,
sur « Gestion des lots », les liens des huit entrées. Contrôle après coup :
`browsebysubject` sur chaque page ne rend que `_MDAT` et `_SKEY`.

## Pages créées

| Titre | pageid | revid |
|---|---|---|
| Lot — Navigation | 486 | 1141 |
| Lot — Images | 487 | 1142 |
| Lot — Corrections du module de références | 488 | 1143 |
| Lot — Arbre fonctionnel | 489 | 1144 |
| Lot — Arborescence des domaines de pratique | 490 | 1145 |
| Lot — Vocabulaire et multilingue | 491 | 1146 |
| Lot — External Data | 492 | 1147 |
| Lot — Gestion des lots en classe sémantique | 493 | 1148 |

Toutes créées avec `--createonly` ; les huit titres avaient été vérifiés
`missing` juste avant, sans protection native.

## Contenu posé — les huit pages

### Lot — Navigation

**Objet.** Rendre le voisinage d'un item accessible sans changer de page.
Une page s'ouvre courte, et le voisinage se déplie au clic.

**Déjà tranché.**
- Repli par `mw-collapsible`, standard de MediaWiki, et non `CategoryTree` :
  `CategoryTree` ne parcourt que l'appartenance aux catégories, or les
  catégories du SGDT valent classe et non navigation (écrit sur
  `Catégorie:Functional item`). L'y faire entrer obligerait à tenir deux
  vérités.
- Voisins immédiats ouverts à l'arrivée, dans les deux sens ; frères
  toujours repliés — ils peuvent être nombreux et n'aident pas à la première
  lecture.
- Depuis un exemplaire physique, remontée jusqu'à la fonction : la chaîne de
  propriétés inverses le permet en une requête, vérifié au lot 10 ; aucune
  propriété matérialisée n'est nécessaire.
- Compte affiché dans les en-têtes repliés — sinon on ne sait pas si ça vaut
  le clic.
- Tout vit dans les quatre modèles d'item : réduire plus tard coûte une
  édition par classe et se propage à toutes les pages qui les appellent.
- Retrait du bloc Mermaid hiérarchique de `Catégorie:Functional item`
  plutôt que réparation : il ne rend que son titre, et `format=tree` rend
  déjà le même arbre, mieux. Le réparer donnerait un doublon.
- Un graphe Mermaid transversal, centré sur la page courante, est à tenter.
  Non essentiel.

**Écarté.** Le chargement au clic (calcul de la seule branche ouverte) :
`mw-collapsible` cache du contenu déjà calculé ; ne calculer qu'au clic
demanderait du JavaScript dans l'espace `MediaWiki`, hors dépôt git, sans
versionnement ni revue. À reprendre si le repli seul ne suffit pas.

**Dépendances.** Aucune.

### Lot — Images

**Objet.** Choisir l'image principale d'un item parmi plusieurs, à tous les
niveaux de la chaîne, et savoir quelles images existent pour un item.

**Déjà tranché.**
- Une seule propriété, `Main image` élargie aux quatre niveaux, et non une
  seconde propriété distincte pour les types : `Main image` dit laquelle
  parmi plusieurs sert de vignette, question identique aux quatre niveaux.
  Décision de Cyril contre la proposition inverse.
- Un même fichier peut illustrer plusieurs sujets, sans conflit.
- Il manque la relation qui va du fichier vers ce qu'il représente :
  `Main image` va de l'item vers le fichier ; sans l'inverse, c'est un choix
  sans catalogue où choisir.
- Un fichier doit pouvoir exister sans item ; un item, sans image locale.

**Écarté.** Wikibase Client, pour récupérer l'image depuis Wikidata : lit la
base du dépôt et non son API, ne peut pas lire wikidata.org depuis un wiki
tiers (réponse WMDE), et la version réseau est ouverte depuis des années
sans être livrée.

**Dépendances.** InstantCommons rendrait le lot plus utile sans le
conditionner. Aucune demande déposée à ce jour.

### Lot — Corrections du module de références

**Objet.** Rendre l'audit des références Base 36 fiable : détecter les
doublons, distinguer une référence retirée d'une jamais utilisée.

**Déjà tranché.**
- Le module détecte les trous, pas les doublons : il ne compare que la suite
  attendue à la suite trouvée ; deux pages portant la même référence lui
  sont invisibles.
- L'audit lit en base 36 : sur la banque ECL il signalera une centaine de
  rangs jamais attribués (ceux contenant une lettre), qui ne sont pas des
  anomalies mais des rangs libres.
- Distinction retiré / jamais utilisé : appuyée sur l'état de cycle de vie
  et la date d'étiquette — une référence retirée a une page qui porte des
  faits, une jamais utilisée n'a rien.

**Écarté.** Rien à ce stade.

**Dépendances.** Attend le lot 12 (état de cycle de vie, date d'étiquette).

### Lot — Arbre fonctionnel

**Objet.** Rattacher les items fonctionnels jusqu'à une racine, en
autorisant plusieurs troncs.

**Déjà tranché.**
- Ce lot révise un arbitrage du lot 10 (plusieurs racines sœurs sans
  chapeau, au motif qu'aucun mot ne couvre à la fois braser et mesurer) :
  le lot devra dire ce qui a changé. Un arbitrage pris pour cinq outils
  n'engage pas un référentiel qui grandit.
- L'arbre peut grandir vers le haut sans polluer les vues d'outillage : la
  catégorie des procédés marque les fonctions qui sont des gestes, et les
  vues interrogent cette catégorie. Une finalité n'aura jamais d'outil, et
  c'est normal.
- Les items fonctionnels sont parentés par la propriété de composition, la
  même qui porte la nomenclature des référencés ; après le lot 12 elle aura
  deux sens, tous deux méréologiques.

**Écarté.** Rien à ce stade.

**Dépendances.** Aucune en amont. Le lot 12 a besoin d'y loger une fonction
de rangement.

### Lot — Arborescence des domaines de pratique

**Objet.** Hiérarchiser les domaines de pratique, aujourd'hui une liste
plate, en autorisant plusieurs troncs.

**Déjà tranché.**
- La propriété se porte sur le procédé, jamais sur l'outil — arbitrage du
  lot 10, à ne pas rejouer.
- Les procédés les plus généraux n'en portent aucun : motif probable, non
  encore écrit comme règle. Le lot doit trancher si c'est une règle ou une
  dette.
- Conséquence connue : SMW exclut des filtres les pages dépourvues de la
  propriété ; les procédés sans domaine sont invisibles dans toute vue
  filtrée par domaine.

**Écarté.** Rien à ce stade.

**Dépendances.** Recoupe le lot Vocabulaire (même question de type).

### Lot — Vocabulaire et multilingue

**Objet.** Décider si les vocabulaires ouverts restent des chaînes
françaises ou deviennent des pages porteuses de libellés.

**Déjà tranché.**
- La vraie question est le type, pas la langue : une valeur de type Page
  porte un libellé par langue et se joint sur l'identité de la page ; une
  chaîne ne se joint que sur elle-même.
- Le patron existe déjà : la propriété des matériaux travaillés est de type
  Page.
- L'état actuel est une pratique non décidée : noms de propriétés en
  anglais, valeurs en français, descriptions bilingues.
- Coût de migration presque nul aujourd'hui, croissant à chaque saisie :
  décider mal maintenant coûte plus que décider tard.
- Changer le type d'une propriété qui porte des données déclenche la
  propagation de changement de SMW — mécanisme derrière le verrou observé
  plusieurs fois.

**Écarté.** Rien à ce stade.

**Dépendances.** Le chantier des grandeurs et unités conçoit le même motif ;
ne pas résoudre deux fois le même problème différemment.

### Lot — External Data

**Objet.** Lire des sources externes, dont Wikidata, depuis le wiki.

**Attention de conception** (portée sur la page, en section Objet) : une
valeur tirée en direct de Wikidata n'est pas une donnée du SGDT ; elle
change sans que personne ici l'ait décidé. Acceptable pour une illustration,
à peser pour le reste.

**Déjà tranché.**
- Le bac à sable de Lua ne s'ouvre pas : frontière de sécurité, pas un
  oubli. Donner le réseau aux modules laisserait tout contributeur faire
  émettre des requêtes par le serveur.
- Semantic Scribunto est absente : Lua ne peut pas non plus interroger SMW.
- External Data récupère JSON, CSV et autres formats depuis une URL et les
  expose au wikitexte comme à Lua : c'est une extension PHP qui apporte les
  données, pas Lua qui va les chercher.
- Le cache est obligatoire : sans lui chaque rendu interroge la source.
- Les sources autorisées se déclarent dans la configuration du site.

**Écarté.** Rien à ce stade.

**Dépendances.** Après le miroir local (installe une extension, modifie la
configuration du site).

### Lot — Gestion des lots en classe sémantique

**Objet.** Transformer les pages de lot, aujourd'hui statiques, en une
classe interrogeable, et fusionner la feuille de route dans la page d'index.

**Déjà tranché.**
- Une page par lot, plus une page d'index : un index tenu à la main se
  périme (la liste des corrections a déjà été en retard sur le wiki).
- Quatre attributs suffisent : numéro, état, objet bref, lot dont il dépend.
  Le dernier fait de la dépendance une relation, donc l'index se construit
  seul.
- La motivation est la délégation : documenter et séparer les lots permet de
  répartir le travail.
- La fusion de la feuille de route conserve la redirection depuis l'ancien
  titre — sur ce wiki les redirections portent des données.
- Les rapports d'exécution restent dans `travaux/`, liés en permaliens sur
  un commit : ils citent de la syntaxe SMW que le wiki lirait comme de
  vraies annotations, et un lien de branche pointera un jour vers un fichier
  modifié sans que personne le sache.

**Écarté.** Rien à ce stade.

**Dépendances.** Aucune, mais le lot gagne à attendre que deux ou trois lots
aient vécu dans la forme courte, pour savoir quels attributs servent
vraiment.

## Renvois croisés (étape 3)

Sur « Gestion des lots », section « Lots à venir » : chacune des huit
entrées a vu son intitulé en gras transformé en lien vers sa page, la phrase
de description conservée mot pour mot, `'''Dépend de rien.'''` et les autres
mentions inchangées. L'entrée du lot 12, déjà liée, n'a pas été touchée.
Une seule édition (revid 1149).

Cas particulier : l'entrée « Corrections `Module:Base36` » garde son
intitulé exact — le `<code>` est passé à l'intérieur du libellé du lien
(`[[Lot — Corrections du module de références|Corrections <code>…</code>]]`),
rendu vérifié correct.

Chaque nouvelle page porte en pied `Voir aussi la [[Gestion des lots]].`

## Vérifications (étape 4)

- **`browsebysubject` sur les huit pages** : `['_MDAT', '_SKEY']` pour
  chacune. Aucune annotation SMW parasite — la règle d'échappement a tenu.
- **Catégories** : aucune sur les huit pages (`prop=categories` vide). En
  particulier aucune catégorie de suivi de liens cassés.
- **Redlinks** : aucun, sur les huit pages comme sur « Gestion des lots »
  après édition (`redlink=1` introuvable dans le rendu).
- **Liens croisés, 16 au total** :
  - `list=backlinks` sur « Gestion des lots » retourne les huit nouvelles
    pages (plus la Feuille de route et le lot 12, préexistants).
  - `prop=links` sur « Gestion des lots » retourne les huit nouvelles pages
    (plus le lot 12).
  - Résolution dans les deux sens confirmée.
- **Crochets / accolades littéraux au rendu** : aucun `[[`, `]]`, `{{`,
  `}}` dans le texte rendu des huit pages.
- **File de travaux SMW** : bloquée à 13 jobs (`wiki-wait-jobs.sh` sort en
  échec « FILE FIGEE »). Situation préexistante, sans effet sur les
  contrôles ci-dessus qui portent sur le rendu et `browsebysubject`, déjà
  concluants.

## Écarts

Aucun. Les huit pages sont conformes au contenu fourni, mis en forme sans
enrichissement ni résumé. Sur les six lots dont le matériau d'entrée
n'apportait rien à écarter, la section 4 porte « Aucun écart consigné à ce
jour. » — choix de formulation pour garder les cinq sections identiques sur
les huit pages.
