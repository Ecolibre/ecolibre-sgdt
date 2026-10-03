# Lot 34 — Tâche 2 : règles du lot dans methode-de-travail.md et CLAUDE.md

3 octobre 2026, Claude Code (exécuteur).

## Résultat

Les huit modifications sont écrites et commitées dans `7e6f062` :
`CLAUDE.md` +31 −2, `methode-de-travail.md` +48 −4.

- Aucune écriture sur le wiki.
- Aucun autre fichier modifié.
- `.claude/settings.local.json` est lu (étapes 0 et 3c), jamais modifié.

## Étape 0 — Relevé des autorisations, avant la tâche

`.claude/settings.local.json` porte **75** règles allow. La dernière est
`Bash(grep -n -A4 'projects/\\\\*\\\\*' .claude/settings.local.json)`, à
l'indice 74. **Aucune règle nouvelle** : la création de la page du lot 34
(tâche 1) n'en a inscrit aucune.

## Étapes 1 et 2 — Modifications

Les huit passages à repérer ont tous été trouvés mot pour mot.

| | Fichier | Endroit | Fait |
|---|---|---|---|
| 1a | methode-de-travail.md | après « Écrit au terme du lot 13… » | paragraphe ajouté (ligne 7) |
| 1b | methode-de-travail.md | `## Format des échanges` jusqu'à `## Les règles de vérification` exclu | section remplacée par le texte 1b, qui ajoute les sections `## Le destinataire de chaque texte` et `## Les demandes de confirmation` |
| 1c | methode-de-travail.md | début de `## Limites de l'outillage, mesurées` | paragraphe ajouté avant « L'architecte ne peut pas lire l'horodatage » |
| 1d | methode-de-travail.md | phrase `CLAUDE.md` de « Où vit quoi » | remplacée |
| 1e | methode-de-travail.md | paragraphe « Ce fichier porte le protocole… » | remplacé par deux paragraphes et le bloc d'amorçage entre `~~~` |
| 1f | methode-de-travail.md | après « Et l'instruction de n'afficher qu'une ligne… » | paragraphe ajouté |
| 2a | CLAUDE.md | entre le paragraphe « Wiki : … » et `## Pages de référence sur le wiki` | section `## Ton rôle` insérée, repliée à 78 colonnes |
| 2b | CLAUDE.md | `## Pages de référence sur le wiki` | « à l'ouverture d'un lot » remplacé par « avant ta première écriture dans un lot » ; le paragraphe a été replié de nouveau |

`methode-de-travail.md` n'est pas replié (une ligne par paragraphe) : les
textes y sont écrits tels quels, sans repli.

## Vérifications

### a. git diff — le contrôle qui tranche

`git diff -U0` produit dix blocs pour huit modifications :

- `CLAUDE.md`, bloc `-5,0 +6,26` : **2a**. Ajout pur de 26 lignes.
- `CLAUDE.md`, bloc `-8,2 +34,3` : **2b**. Les deux lignes d'origine sont
  remplacées par trois, à cause du repli. Seule l'expression demandée change.
- `methode-de-travail.md`, bloc `-6,0 +7,2` : **1a**. Ajout pur.
- `methode-de-travail.md`, bloc `-56,0 +59,2` : **1f**. Ajout pur.
- `methode-de-travail.md`, blocs `-59 +63,7`, `-61 +71,3` et `-68,0 +81,18` :
  **1b**. Git découpe le remplacement en trois blocs, parce que trois
  paragraphes de l'ancienne section se retrouvent à l'identique dans le
  texte 1b : « Une consigne à la fois… », « Une consigne corrigée… » et
  « Quand Cyril travaille sur téléphone… ». Ils n'apparaissent donc pas dans
  le diff. Les deux paragraphes réécrits forment les deux premiers blocs ;
  les deux nouvelles sections et les paragraphes ajoutés forment le
  troisième.
- `methode-de-travail.md`, bloc `-115 +145,3` : **1d**.
- `methode-de-travail.md`, bloc `-117 +149,7` : **1e**.
- `methode-de-travail.md`, bloc `-122,0 +161,2` : **1c**. Ajout pur.

**Rien d'autre.** Les 6 lignes supprimées se répartissent ainsi : 2 dans
`CLAUDE.md` (2b) et 4 dans `methode-de-travail.md` (deux pour 1b, une pour
1d, une pour 1e).

**Repli de 2a sans changement de mot**, vérifié par programme. La section
`## Ton rôle` a été extraite de `CLAUDE.md`, ses lignes jointes paragraphe
par paragraphe, puis comparée au texte 2a recopié tel quel dans le scratchpad
de la session : **identique**, 4 blocs (le titre et 3 paragraphes),
78 colonnes au plus.

### b. Titres et bloc d'amorçage

- `methode-de-travail.md` : 13 titres. Ce sont les 11 titres d'origine
  (le `#` du fichier compris) et les 2 nouveaux, `## Le destinataire de
  chaque texte` et `## Les demandes de confirmation`. Ils sont placés
  après `## Format des échanges`, comme le prévoit le texte 1b.
- `CLAUDE.md` : 11 titres `## `, contre 10 avant la tâche. Le seul ajout
  est `## Ton rôle`.
- Bloc d'amorçage : lignes 151 et 155 de `methode-de-travail.md`, deux
  lignes `~~~` exactement (2 occurrences dans le fichier), qui encadrent les
  trois lignes du texte.

### c. Relevé des autorisations, après la tâche

**75** règles allow, la dernière toujours à l'indice 74 :
`Bash(grep -n -A4 'projects/\\\\*\\\\*' .claude/settings.local.json)`.
**Aucune règle n'est apparue pendant la tâche.**

## Écarts et surprises

- **Relevés des autorisations.** Étape 0 : 75 règles, aucune nouvelle.
  Étape 3c : 75 règles, aucune nouvelle. Aucune autorisation permanente n'a
  donc été inscrite ni pendant la tâche 1 ni pendant celle-ci.
- **Une confirmation non annoncée était possible**, et je l'ai signalée en une
  ligne avant de lancer la commande. Elle concernait le `python3 -c` sur
  plusieurs lignes qui compare la section repliée au texte attendu. S'y
  ajoutent deux écritures dans le scratchpad de la session, hors dépôt : le
  texte attendu, `attendu_2a.txt`, et la commande de contrôle. Le relevé de
  l'étape 3c montre qu'aucune de ces confirmations n'a reçu de réponse
  permanente.
- **methode-de-travail.md annonce un état qui n'existe pas encore.** Le
  texte 1e affirme que « la procédure d'ouverture y renvoie au lieu de les
  recopier ». Sur le wiki, la section « Comment Cyril travaille » de
  `Procédure d'ouverture d'un lot` n'a pas encore été transformée en renvoi :
  ce lot le décide, mais aucune consigne ne l'a encore fait. De même, la
  section « Le destinataire de chaque texte » demande que tout texte à coller
  nomme son destinataire, ce que les messages d'ouverture et de clôture
  publiés sur le wiki ne font pas encore. Jusqu'à la tâche qui corrigera ces
  deux pages, le fichier décrit une cible et non l'état réel.
- **Le texte d'amorçage pointe vers `main` sur raw.githubusercontent.com.**
  Il ne fonctionne qu'après la poussée de cette tâche. Il suppose aussi que
  l'environnement de la conversation autorise ce domaine. Le texte 1c ne
  traite le 403 `host_not_allowed` que pour le wiki. C'est le point ouvert
  « texte d'amorçage à éprouver » de la page du lot.
- **2b : mélange de l'infinitif et du tutoiement.** La phrase devient « Lire
  ces pages avant ta première écriture dans un lot ». L'infinitif de consigne
  voisine avec le « ta » de la nouvelle section `## Ton rôle`. Je l'ai écrite
  mot pour mot, comme demandé. Une reformulation (« Lis ces pages avant ta
  première écriture… ») relèverait d'une autre consigne.
- **Largeur de CLAUDE.md.** J'ai replié 2a et 2b à 78 colonnes au plus, la
  largeur dominante du fichier. Le fichier comptait déjà 28 lignes de plus de
  78 colonnes, presque toutes des commandes ou des chemins qu'on ne peut pas
  replier. Les lignes ajoutées ne dépassent pas.
- **Un nom de procédure replié entre deux lignes.** Dans 2a, le repli place
  `` `Procédure de clôture d'un lot` `` en début de ligne, juste après un
  retour à la ligne. C'est du markdown, pas du wikitexte : le pli ne casse
  aucun lien. Mais si ce paragraphe est un jour recopié sur le wiki, il faudra
  le remettre sur une seule ligne, selon la leçon de `CLAUDE.md` sur les plis
  hérités d'un document.
