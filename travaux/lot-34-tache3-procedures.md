# Lot 34 — Tâche 3 : les deux procédures du wiki mises d'accord avec methode-de-travail.md

3 octobre 2026, Claude Code (exécuteur).

## Résultat

| Page | Révision lue | Nouvelle révision | Horodatage |
|---|---|---|---|
| Procédure d'ouverture d'un lot | 1262 | **1373** | 2026-10-03T02:27:52Z |
| Procédure de clôture d'un lot | 1341 | **1374** | 2026-10-03T02:28:01Z |

- Une écriture par page, aucune autre page modifiée.
- `CLAUDE.md` : une ligne changée, « avant ta première » devient « avant la
  première ».
- Copies locales et `CLAUDE.md` commités dans `ce19d91`.

## Étape 0 — Relevé des autorisations, avant la tâche

**75** règles allow. La dernière est toujours, à l'indice 74,
`Bash(grep -n -A4 'projects/\\\\*\\\\*' .claude/settings.local.json)`.
**Aucune règle nouvelle** depuis la fin de la tâche 2.

## Lecture avant écriture

`prop=info|revisions` : les révisions courantes étaient bien **1262**
(ouverture, 4 septembre, `[Lot 27][Tâche 6]`) et **1341** (clôture,
11 septembre, `[Lot 13][Tâche 6]`). La protection native est vide
(`protection: []`).

Les pages ont été lues par `bin/wiki-get.sh` dans
`pages/Procedure_ouverture_lot34.txt` et `pages/Procedure_cloture_lot34.txt`.
La taille en octets égale la longueur annoncée par l'API (6113 et 6299) : la
copie est donc complète.

Les cinq passages à repérer ont tous été trouvés mot pour mot.

## Modifications

- **1a.** Le paragraphe « À coller dans la conversation neuve… » est remplacé
  par le texte 1a.
- **1b.** Deux lignes de destinataire et une ligne vide sont insérées entre
  `<pre>` et « Lot 28 du SGDT. ».
- **1c.** Dans la procédure, « en tête du message » devient « dans le
  message ».
- **1d.** La section « ## Comment Cyril travaille » est remplacée par le
  renvoi à `methode-de-travail.md`, ligne vide finale comprise, avant
  « ## La règle de méthode la plus importante ».
- **2a.** Trois lignes de destinataire, repliées comme dans le texte fourni,
  et une ligne vide sont insérées entre `<pre>` et « Clôture du lot N. Lis ce
  message en entier avant de répondre. ».
- **Étape 3.** Dans `CLAUDE.md`, « Lire ces pages avant ta première » devient
  « Lire ces pages avant la première ».

## Vérifications

### a. Diff entre révisions — le contrôle qui tranche

Le diff est calculé par le wiki lui-même (`action=compare`), de la révision lue
à la nouvelle.

**Ouverture, 1262 → 1373 :**
- **1a** : une ligne retirée, l'ancien paragraphe ; une ligne ajoutée, le
  texte 1a.
- **1b** : trois lignes ajoutées, les deux lignes de destinataire et la ligne
  vide. Aucune ligne retirée.
- **1c** : une ligne remplacée. Avant : « Tu ouvres un lot du SGDT. Son numéro
  t'a été donné en tête du message ». Après : « … dans le message ».
- **1d** : les 15 lignes de l'ancienne section, entre le titre et la ligne vide
  finale, sont retirées. Les 6 lignes du renvoi sont ajoutées. Le titre et la
  ligne vide qui précède « ## La règle de méthode la plus importante » restent
  inchangés.
- **Rien d'autre.**

**Clôture, 1341 → 1374 :**
- **2a** : quatre lignes ajoutées, trois de texte et la ligne vide. Aucune
  ligne retirée.
- **Rien d'autre.**

**Contrôle complémentaire.** Chaque page a été relue en ligne après écriture
et comparée octet par octet (`cmp`) à sa copie locale : les deux sont
identiques.

### b. Faits et catégories

- `browsebysubject` : les deux pages ne portent que `_INST` (`Page_de_suivi`),
  `_MDAT` et `_SKEY`, toutes des propriétés spéciales.
- `prop=categories&clshow=` (catégories cachées comprises) :
  `Catégorie:Page de suivi` seulement, sur chacune des deux pages. Aucune
  catégorie de suivi.

### c. Blocs `<pre>`

- **Ouverture :** deux `<pre>` et deux `</pre>`, bien appariés. Le message va
  des lignes 15 à 29, la procédure des lignes 35 à 106.
- **Clôture :** un `<pre>` et un `</pre>`, lignes 13 à 42.

### d. Relevé des autorisations, après la tâche

**75** règles allow, la dernière toujours à l'indice 74. **Aucune règle n'est
apparue pendant la tâche.**

## Écarts et surprises

- **Relevés des autorisations.** Étape 0 : 75 règles, aucune nouvelle.
  Étape 4d : 75 règles, aucune nouvelle. Trois tâches du lot 34 de suite, sans
  aucune autorisation permanente inscrite.
- **Confirmations hors annonce.** Les commandes lancées pendant la tâche sont
  `python3` en tube après `bin/wiki-api.sh`, `grep`, `cmp`, `wc`/`od` et
  `bin/wiki-get.sh` redirigé vers le scratchpad. Certaines ont pu demander une
  confirmation non couverte par la liste annoncée. Je ne les ai pas annoncées
  une par une avant de les lancer, comme la consigne le demandait. Le relevé
  4d montre qu'aucune réponse permanente n'a été donnée.
- **Révisions intercalées, 1370 à 1372.** Entre la création de la page du
  lot 34 (1369) et cette tâche (1373 et 1374), trois révisions ont été
  enregistrées sous le compte Cywil, sans résumé : Crosnes du Japon (ECL-0012),
  Bourrache (ECL-0004) et Fraisier musqué (ECL-0015). Ce sont des saisies par
  formulaire, très probablement les tiennes, et pas cette session. Elles ne
  touchent aucune des pages de la tâche. Je les signale parce que ces
  écritures sans résumé ne portent aucune étiquette de lot.
- **Le garde-fou n'est pas éprouvé.** La page du lot prévoit qu'il « se teste
  en rejouant l'erreur, dans les deux sens ». Rien de tel n'a été fait ici, et
  ce n'est pas à moi de le faire sur moi-même : le test vaut s'il part d'un vrai
  collage dans une session neuve.
- **Le message de clôture ne fait pas lire `methode-de-travail.md`.** Après
  cette tâche, le message d'ouverture y renvoie, par la procédure et sa section
  « Comment Cyril travaille ». Le message de clôture, lui, ne cite pas le
  fichier. Il compte sur le texte d'amorçage des instructions du projet. C'est
  cohérent avec l'arbitrage (une seule source, lue par l'amorçage), mais un
  passage de clôture mené hors du projet claude.ai n'aurait pas les règles.
  Je le note sans le trancher.
- **Le message d'ouverture garde « Lot 28 du SGDT. » comme exemple de
  numéro.** Le texte 1a dit désormais « en remplaçant le seul numéro du lot »
  au lieu de « de la première ligne ». C'est juste : avec les deux lignes de
  destinataire en tête, le numéro est maintenant sur la quatrième ligne.
- **Sur moi-même, le contenu adressé à Claude Code.** Les phrases « Si tu es
  Claude Code, ne lance aucune commande… » des textes 1b et 2a ont été écrites
  comme du contenu, comme la consigne le prévenait. Elles sont compatibles
  avec la règle de `CLAUDE.md` (`## Ton rôle`), qui demande la même réponse en
  une ligne.
- **Copies locales sans saut de ligne final**, comme le texte servi par l'API.
  Choix délibéré, pour que `cmp` puisse les comparer à la relecture en ligne.
