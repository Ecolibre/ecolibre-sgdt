# Lot 27 — Tâche 7 : la page publique, et ouverture du lot 31

## Ce qui a été écrit

1. Création de `Lot 31 — Qualification des données et confiance entre pairs`
   (`--createonly`, pageid 556, revid 1325) — texte fourni, collé sans
   modification.
2. Création de `Comment ce wiki est tenu` (`--createonly`, pageid 557, revid
   1326) — texte fourni, collé sans modification.
3. `Transmettre vos outils et vos machines` (revid 1305 → 1327) : ajout d'une
   phrase de renvoi en fin de page, avant la catégorie.
4. `Système de Gestion de Données Techniques orienté matériel libre` (revid
   1307 → 1328) : ajout d'une ligne de renvoi dans le bloc « Voir aussi »,
   à la suite de celle pointant vers « Transmettre vos outils et vos
   machines ».

Résumés : `[Lot 27][Tâche 7] Création — …` pour les créations,
`[Lot 27][Tâche 7] Renvoi vers Comment ce wiki est tenu` pour les deux
modifications.

## Texte délégué — les deux phrases de renvoi (étape 3)

Aucune des deux n'était donnée mot pour mot ; formulées dans le ton de la
page qu'elles citent, sur le modèle des phrases déjà en place à ces deux
endroits.

Sur `Transmettre vos outils et vos machines`, en fin de page :
> Pour savoir qui écrit sur ce wiki et ce qui se passe quand une donnée est
> fausse, voir [[Comment ce wiki est tenu]].

Sur la page d'accueil, dans le bloc « Voir aussi », même forme que les
lignes existantes :
> Voir aussi [[Comment ce wiki est tenu]] pour qui écrit sur ce wiki, ce qui
> se passe quand une donnée est fausse, et où sont consignées les décisions.

## Vérifications (étape 4)

1. **`browsebysubject` sur `Comment ce wiki est tenu`** : seuls `_MDAT` et
   `_SKEY` sont posés. Aucune annotation, aucune catégorie (confirmé aussi
   par `prop=categories`, liste vide). Conforme.
2. **Lot 31** : `Work_package_summary` porte une seule valeur.
   `Catégorie:Lot` compte 31 membres (`list=categorymembers`). L'index
   `Gestion des lots`, purgé puis relu par `action=parse`, rend
   « Lots au total : 31 », et le détail (En cours 1 + Faits 12 + À venir 18
   + Abandonnés 0 = 31) s'additionne juste. Le lot 31 apparaît dans la
   section « À venir », en 18ᵉ ligne. Conforme.
3. **`action=parse` sur la page publique** : les quatre liens internes
   (`Lot 31 — …`, `Limites connues du SGDT`, `Gestion des lots`,
   `Transmettre vos outils et vos machines`) résolvent tous en lien bleu
   (aucune `class="new"` dans le rendu). Les deux adresses externes rendent
   des liens de classe `external` (`external text` pour le lien du forum,
   `external free` pour l'URL GitHub nue). Aucun `[[`, `]]`, `{{` ni `}}`
   littéral dans le HTML rendu. Conforme.
4. **Les deux renvois de l'étape 3** : confirmés par `list=backlinks` sur
   chacune des deux pages cibles (`Comment ce wiki est tenu` est désormais
   pointée par la page d'accueil et par `Transmettre vos outils et vos
   machines` ; `Lot 31` est pointée par `Gestion des lots` — via la
   requête — et par `Comment ce wiki est tenu`). Le wikitexte relu après
   écriture est identique, octet pour octet, à ce qui a été envoyé sur les
   deux pages modifiées (`diff` sur le contenu récupéré après coup contre le
   fichier posté) : rien d'autre n'a bougé sur ces pages.

## Affirmations de la page publique que je n'ai pas pu vérifier moi-même sur le wiki ou dans le dépôt

**La licence CC BY-SA du contenu du wiki.** La page affirme : « Le contenu
de ce wiki est sous licence Creative Commons Attribution - Partage dans les
mêmes conditions. » Je n'ai trouvé aucune trace de cette licence dans la
configuration du wiki accessible par l'API : `meta=siteinfo&siprop=rightsinfo`
rend `url` et `text` vides tous les deux, `MediaWiki:Copyright` et
`MediaWiki:Copyrightpage` sont absentes (donc non personnalisées), et aucune
clé de `siprop=general` ne porte de mention de droits ou de licence. Rien
dans ce que j'ai pu interroger ne confirme, ni ne contredit d'ailleurs,
l'affirmation — je n'ai simplement trouvé aucun endroit du wiki où elle est
vérifiable par un lecteur qui irait voir. Le texte étant fourni tel quel
dans la consigne, je l'ai collé sans le modifier, mais je le signale :
soit `$wgRightsText`/`$wgRightsUrl` doivent être posés côté serveur pour
que le pied de page du wiki porte réellement cette mention, soit la phrase
doit être corrigée si la licence n'est pas encore celle-là en pratique.

**« Construits ainsi depuis quelques mois » (développement assisté).**
Je n'ai pas pu fixer de date de début précise depuis le wiki ou le dépôt :
l'historique git local commence le 12 août 2026 par un « Import initial »
qui rapatrie un travail déjà en cours (le lot 6, antérieur, est cité comme
référence dans `Limites connues`). L'ordre de grandeur « quelques mois » est
plausible au vu du nombre de lots déjà menés, mais je ne l'ai pas mesuré
précisément et je ne peux pas garantir qu'un lecteur retrouverait cette
durée exacte par lui-même.

**Les trois faits historiques sur le forum Assemblée Virtuelle** (conception
en 2017 « à deux », discussion publique depuis 2022, troisième niveau
appelé « industriel »). Vérifiés, mais par récupération du contenu de la
page externe elle-même (`https://forums.assemblee-virtuelle.org/t/...-745`,
déjà citée sur la page d'accueil du wiki avant cette tâche, je n'ai rien
ajouté) : le premier message, daté du 5 décembre 2022, cite Cyril
« C'est pour répondre à toutes ces questions que l'on s'est penché sur le
sujet avec @iplumb3r en 2017 » et emploie bien « Au niveau industriel (le
plus important), on vient décrire comment on peut fabriquer une pièce ».
Les trois affirmations sont donc confirmées — mais par une source externe,
pas par le wiki ni par le dépôt, ce qui sort du périmètre que la consigne
demandait de vérifier. Je le signale par prudence plutôt que de le passer
sous silence.

## Ce qui a été vérifié et confirmé

- Le renvoi entre « accepté en apparence, non enregistré, à cause d'un
  séparateur décimal » correspond à une entrée réelle de `Limites connues du
  SGDT` (SMW rejette le point décimal en locale FR pour le type `Number` ;
  constaté le 15 août 2026 sur trois pages de lieu, `Latitude`/`Longitude`
  totalement absentes des faits stockés malgré `result: Success`).
- « Une quinzaine d'affirmations fausses, dont plusieurs venaient des
  assistants eux-mêmes » correspond au lot 13, décrit dans
  `methode-de-travail.md` (« Sur le lot 13, une quinzaine d'affirmations
  fausses ont été écrites (…) L'architecte a rattrapé ses propres consignes
  en remesurant »).
- La description du protocole à trois intervenants (« celui qui rédige une
  instruction, celui qui l'exécute et celui qui décide ne sont pas la même
  personne ») correspond au chapitre « Qui fait quoi » de
  `methode-de-travail.md`.
- L'URL GitHub citée (`https://github.com/Ecolibre/ecolibre-sgdt`)
  correspond à `git remote -v` du dépôt local.

## Écarts et surprises

En vérifiant le compte de `Catégorie:Lot` avant écriture, j'ai trouvé deux
pages numérotées 30 : `Lot 30 — Accès, prêt, compétences et stock` et
`Lot 30 — Ce qu'une structure met à disposition`. Ce n'est pas un doublon de
numérotation : `browsebysubject` sur le premier titre rend les faits du
second (même `_SKEY`), c'est donc une redirection laissée par un
renommage. Le compte était à 30 avant cette tâche, à 31 après — cohérent
avec un seul lot 30 réel. Je n'ai rien touché à ce sujet, hors périmètre de
la tâche ; je le signale au cas où la page de redirection mériterait un
nettoyage dans un lot ultérieur.

Rien d'autre à signaler : aucune permission refusée, aucune session
expirée, aucune confirmation shell rencontrée.
