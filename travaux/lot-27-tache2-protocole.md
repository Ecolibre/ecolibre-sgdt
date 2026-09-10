# Lot 27 — Tâche 2 : le protocole de travail

**Exécuté le :** 2 septembre 2026 (22h50-23h00 UTC environ), session Claude
Code, compte `Cywil`. Aucune écriture wiki dans cette tâche — uniquement le
dépôt.

Avant de commencer : un changement non commité subsistait dans
`travaux/lot-13-tache5b-cloture.md` (section « Tâche 5e », ajoutée en fin de
tâche précédente, jamais poussée). Commité et poussé séparément
(`2232545`) pour repartir d'un état propre — sans quoi le contrôle 1 de
cette tâche (« deux fichiers touchés, rien d'autre ») aurait été faux dès
le départ.

---

## Étape 1 — `methode-de-travail.md`

`ls methode-de-travail.md` avant écriture : absent. Créé à la racine du
dépôt, contenu conforme mot pour mot à la consigne.

## Étape 2 — Renvoi depuis `CLAUDE.md`

Ligne ajoutée à la fin de la section « Pages de référence sur le wiki »
(créée au lot 13), après les six existantes, texte conforme mot pour mot.

## Les trois contrôles

**1. `git status` — deux fichiers touchés.**
```
 M CLAUDE.md
?? methode-de-travail.md
```
Rien d'autre, conforme.

**2. `git diff` sur `CLAUDE.md`.** `git diff --stat` : `1 file changed, 2
insertions(+)`. Les deux lignes sont la phrase de renvoi et la ligne vide
qui la sépare de `## Outils disponibles` — la même construction que pour
chacune des six entrées déjà en place, qui sont elles-mêmes séparées par
un simple retour à la ligne de liste, sans ligne vide entre elles ; seule
la nouvelle phrase, hors liste à puces, en réclame une pour ne pas se
souder au titre suivant. Une phrase de contenu ajoutée, pas deux.

**3. Encodage.** Lu en UTF-8 sans erreur, longueur 5305 caractères, zéro
caractère de remplacement (`�`). Décompte des caractères français :
`«`/`»` cinq fois chacun, `é` 106 fois, `è` 13 fois, `ê` 4 fois, `—` une
fois (dans le titre) — tous à leur place attendue, vérifié par `grep`
plutôt qu'à l'œil.

## Commit

`079ce9a738b8294c4f760ede9de85fc751016ddb`, résumé `[Lot 27][Tâche 2]
methode-de-travail.md — le protocole entre les intervenants`, 2 fichiers,
93 insertions. Poussé sur `origin/main`.

---

## Écarts et surprises

C'est la question qui compte dans ce rapport : est-ce que le protocole tel
qu'écrit correspond à ce que j'ai vécu côté exécution. Quatre points, du
plus sûr au plus incertain.

**1. « Le texte est fourni, sinon il sera inventé » ne décrit pas tout à
fait la pratique réelle.** Plusieurs consignes de ce lot m'ont explicitement
laissé formuler le texte moi-même, sans le fournir mot pour mot :
l'ajustement des quatre liens vers la feuille de route à la tâche 4
(« en ajustant le texte de la phrase pour qu'elle reste juste », sans
dire laquelle), le choix des dix libellés de la section « Rapports » du
lot 13 à la tâche 5b, et l'étendue exacte de la correction minimale sur
`demandes-adminsys.md` au lot 27 tâche 1 (« corrige la seule phrase
fausse » sans citer laquelle mot pour mot). Dans les trois cas, ça a
fonctionné, mais parce que j'ai signalé mon choix dans le rapport plutôt
que de le faire passer pour une consigne suivie à la lettre. La règle
telle qu'écrite laisse penser que ce cas n'arrive pas ; il arrive, et
plutôt souvent. Elle gagnerait à distinguer explicitement le texte fourni
verbatim (la majorité des cas) du texte délégué avec un critère
d'acceptation (« reste juste », « la seule phrase fausse ») — ce second
mode a sa place, mais ce n'en est pas un qu'il n'y aurait pas.

**2. Un quatrième canal existe, non décrit par le cycle en sept étapes :
Cyril peut interpeller l'exécuteur directement, en cours d'exécution, hors
consigne écrite.** À la tâche 4, un message est arrivé pendant l'écriture
de l'étape 6 (« Arrête-toi avant de transformer la Feuille de route en
redirection », trois questions directes), traité et répondu avant de
reprendre sur « Continue l'étape 7 ». Le cycle décrit une boucle
architecte → Cyril → exécuteur → rapport → Cyril → architecte ; il ne
prévoit pas cette entrée directe de Cyril dans l'étape 5, sans passer par
l'architecte. Ça a bien fonctionné — l'échange a tenu en trois réponses
vérifiées puis la tâche a repris — mais ce n'est écrit nulle part comme un
mode légitime, alors que c'en est un, au moins pour une vérification
ponctuelle qui ne mérite pas un aller-retour complet par l'architecte.

**3. « Le contexte, en trois lignes » est plus court que ce que j'ai
réellement reçu.** Plusieurs consignes portaient un contexte d'un
paragraphe entier, parfois deux, surtout quand il fallait expliquer
pourquoi une correction était nécessaire (par exemple l'ouverture du
lot 27, dont le contexte retraçait trois écrits faux et leur origine).
Sans conséquence pratique — un contexte plus long n'a jamais nui — mais le
chiffre « trois lignes » ne correspond pas à l'usage observé de ce côté-ci.

**4. Le compte « deux affirmations fausses » rattrapées par l'étape 7 sur
le lot 13 ne recoupe pas clairement ce que j'ai vu passer, et je ne sais
pas s'il vise le même épisode que moi.** Si la référence est la
« Rectification du 29 août 2026 » que j'ai déplacée de l'ancien index vers
`Lot 10` à la tâche 4 (deux descriptions de lot corrigées, plus une
troisième sur `CLAUDE.md`), cet épisode précède l'ouverture du lot 13 : il
documente une relecture faite avant que ce lot ne commence, pas pendant.
Si la référence vise autre chose survenu pendant le lot 13 lui-même, je ne
l'identifie pas avec certitude à un seul « deux » — j'ai reçu des consignes
correctives à au moins trois reprises distinctes pendant ce lot (tâche 5c,
sur l'entrée 47 des *Limites connues* ; lot 27 tâche 1, sur trois pages à
la fois — l'entrée 47 une seconde fois, le point ouvert du lot 24,
`demandes-adminsys.md`), en plus de deux écarts que j'ai moi-même relevés
sans consigne corrective en retour (la couverture partielle des
correctifs `Module:Base36` à la tâche 4, le compte de lots « en cours » à
la tâche 1 du lot 27). Le nombre exact dépend de ce qu'on compte comme une
unité — une consigne corrective, ou une affirmation corrigée à l'intérieur
d'une même consigne — et je n'ai pas la moitié qui permettrait de trancher
lequel de ces épisodes le texte du protocole a en tête. Signalé comme
incertitude, pas comme erreur : c'est un cas où je ne peux qu'exposer ce
que je vois, sans pouvoir dire si ça contredit la phrase ou si ça la
confirme sous un autre angle.

**Rien d'autre ne m'a paru faux.** Le reste du texte — qui fait quoi, le
cycle, le format des points numérotés tel que je le reçois, les règles de
vérification, la place de chaque document — correspond à ce que j'ai vécu,
pour la part que je peux voir depuis mon seul siège.

---

## Tâche 3 : correction du protocole

**Exécuté le :** 3 septembre 2026, session Claude Code, compte `Cywil`.
Aucune écriture wiki — uniquement le dépôt.

Avant d'écrire : relu `methode-de-travail.md`, confirmé identique à l'état
laissé par la tâche 2 (contenu comparé point par point au texte reproduit
dans le rapport ci-dessus). Répertoire propre hormis ce rapport lui-même,
non suivi.

Fichier remplacé en entier par le texte fourni dans la consigne, qui
traite les quatre écarts relevés en tâche 2 : le texte délégué est
maintenant décrit comme second mode légitime à côté du texte fourni (avec
son obligation de tracer le choix dans le rapport) ; le canal direct
devient une section à part entière, avec sa contrainte de trace et le cas
vécu de la tâche 4 du lot 13 ; « le contexte, en trois lignes » disparaît,
remplacé par une description sans chiffre arbitraire ; le compte « deux
affirmations fausses » de l'ancienne étape 7 est remplacé par une section
« Ce qui rattrape les erreurs », qui ne recense plus un nombre mais un
principe — trois regards indépendants, aucun ne s'appuyant sur le compte
rendu d'un autre.

**Les trois contrôles.**

**1. `git diff` — un seul fichier.** `git status --short` avant commit :
` M methode-de-travail.md` et le présent rapport en `??`, rien d'autre.
`CLAUDE.md` non touché, confirmé absent du `git status`.

**2. Encodage.** Lu en UTF-8, 7688 caractères, zéro caractère de
remplacement (`�`) détecté par comptage Python.

**3. Ordre des sections**, vérifié par `grep -n "^##"` : qui fait quoi, le
cycle, le canal direct, ce qu'une consigne doit contenir, format des
échanges, les règles de vérification, ce qui rattrape les erreurs,
cadrages pas instructions, où vit quoi, limites de l'outillage — conforme
à l'ordre demandé.

**Commit** `1ad053a`, résumé `[Lot 27][Tâche 3] methode-de-travail.md —
corrections d'après le retour de l'exécution`, 1 fichier, 37 insertions,
17 suppressions. Poussé sur `origin/main`.

### Écarts et surprises

Aucun. La consigne fournissait le texte intégral mot pour mot ; aucune
formulation n'a été déléguée. Les trois vérifications demandées ont
chacune tranché sans ambiguïté.
