# Correctif du 4 octobre 2026 — rapports des 6 et 7 septembre versionnés

Hors lot : écritures étiquetées `[Correctif]`. Aucune écriture sur le wiki.

Un relevé en lecture seule a précédé ce correctif ; il est repris ci-dessous
tel quel. Décisions de la consigne : versionner les six fichiers tels quels,
sans les renommer ni les modifier. Aucune règle nouvelle n'est ajoutée, la
cause étant déjà couverte par `CLAUDE.md`.

## Relevé rendu (repris tel quel)

```
Relevé en lecture seule — les six fichiers non suivis de travaux/, 4 octobre 2026

Contrôle des autorisations locales (.claude/settings.local.json)
   Début et fin de tâche : aucune règle ("allow": [], "deny": []).
   git status en fin de tâche : les six mêmes fichiers non suivis, rien d'autre.

Origine commune, mesurée et non supposée
   travaux/lot-28-tache2-registre-et-rangement.md (suivi) les inventorie
   déjà le 7 septembre 2026 : « les rapports des tâches menées dans cette
   conversation les 6 et 7 septembre, tous restés hors de git faute de
   consigne de commit ». Les trois fichiers lot-27-* du même inventaire ont
   été versionnés depuis. Ces six-là n'ont jamais été commités : les
   recherches git grep et git log ne trouvent que des renvois à leurs noms
   (lot-28-tache2, lot-28-tache3, lot-34-cloture,
   correctif-formulaires-par-defaut, correctif-2026-10-04-memoire), jamais
   leur contenu.
   Les écritures sur le wiki qu'ils décrivent sont toutes présentes dans
   l'historique du wiki (list=recentchanges du 5 au 7 septembre, compte
   Cywil). Le wiki ne garde pourtant que les résumés de modification : la
   cause, les mesures et les décisions ne vivent que dans ces fichiers.
   Les six forment une chaîne :
   - rangs-separateur est suivi par rangs-correction, puis par
     helianthi-insee ;
   - wanted-by-etat est suivi par notes-fusion ;
   - notes-fusion et helianthi-insee corrigent chacun un autre fichier de
     la série (remise-a-niveau-6-septembre et rangs-correction).

Secrets (au sens de CLAUDE.md)
   Recherche de password, passwd, mot de passe, token, jeton, cookie,
   secret, .env, lgpassword et bearer sur les six fichiers. Deux faux
   positifs seulement :
   - « input type=tokens », un widget de Page Forms (wanted-by-etat,
     lignes 70, 76 et 79) ;
   - « rotation du mot de passe de mediawiki_ecolibre_prod »
     (remise-a-niveau, ligne 458) : c'est l'intitulé d'une demande à
     fuzzy, sans valeur.
   Les seuls noms d'hôte ou de base cités sont déjà publics dans
   CLAUDE.md. Aucun secret.

────────────────────────────────────────────────────────────────────
1. travaux/rangs-separateur.md
   7 septembre 2026, 01:26 — 4 570 octets, 78 lignes
   Titre : « # Rangs de plantation en erreur — 4-6 septembre 2026 »
   Dix premières lignes : le titre, puis « ## 1. Ce qui est établi (avant
     toute correction) », puis les trois pages en erreur SMW depuis le
     4 septembre et la valeur tapée dans Planting_rank, en tableau :
     Capucine tubéreuse (ECL-0006), Fraisier X (ECL-0014), Helianthi
     (ECL-0020), avec le message _ERRT.
   Sujet : diagnostic, hors lot. La cause n'est pas le séparateur décimal
     pressenti : ce sont deux nombres saisis dans un même champ. Le fichier
     découvre aussi Égopode (ECL-0013), qui stockait silencieusement 49,651
     au lieu de deux valeurs. Il s'arrête sans corriger et pose les
     questions à trancher.
   Déjà ailleurs : non. Le diagnostic et la découverte d'Égopode n'existent
     qu'ici. Le wiki ne porte que les corrections faites ensuite.
   Suggestion : versionner (voir A).

2. travaux/rangs-correction.md
   7 septembre 2026, 02:08 — 5 864 octets, 107 lignes
   Titre : « # Correction des rangs de plantation — 6 septembre 2026 »
   Dix premières lignes : « Suite de travaux/rangs-separateur.md : la
     cause n'était pas le séparateur décimal mais des plages saisies dans
     un champ unique. » Suivent les décisions de Cyril (la convention
     « mètres entiers » du lot 11 tombe, les décimales sont admises avec la
     virgule, le début est le plus petit nombre et la fin le plus grand),
     puis « ## 1. Correction des trois pages ».
   Sujet : correctif, hors lot. Trois pages corrigées, la convention
     reprise sur quatre pages (Attribut:Planting rank, Attribut:Planting
     rank end, Modèle:Physical facet plant/doc, Récapitulatif technique),
     les infobulles du formulaire ajoutées. Le fichier analyse aussi ce que
     coûterait une seconde plantation Helianthi, analyse non exécutée.
   Déjà ailleurs : les écritures oui, sur le wiki. Ce sont neuf éditions
     [Correctif] du 6 septembre entre 23:46 et 23:51Z, toutes retrouvées.
     L'abandon de la convention « mètres entiers » est écrit sur le wiki.
     Les décisions de Cyril qui la motivent et le contrôle par
     browsebysubject n'existent qu'ici.
   Suggestion : versionner (voir A).

3. travaux/helianthi-insee.md
   7 septembre 2026, 02:09 — 2 784 octets, 56 lignes
   Titre : « # Helianthi et Attribut:INSEE code — 7 septembre 2026 »
   Dix premières lignes : « Suite de travaux/rangs-correction.md, où
     Helianthi et Attribut:INSEE code avaient été laissés de côté. » Suit
     « ## 1. Helianthi — plage, pas deux plantations », avec la décision de
     Cyril : le Helianthi est traçant, une plage décrit mieux l'occupation
     qu'une seconde page.
   Sujet : correctif, hors lot. Helianthi passe en plage. Le Property_range
     d'Attribut:INSEE code (90 caractères, au-delà du plafond de 85 du type
     Keyword) est raccourci à 66 caractères. Le compteur _ERRC retombe à 0,
     pour la première fois dans la série. Le fichier corrige aussi une date
     dans rangs-correction.md.
   Déjà ailleurs : les deux écritures oui, sur le wiki (7 septembre,
     00:08:18Z et 00:08:19Z). Le choix de la plage plutôt que d'une seconde
     plantation, et le passage de _ERRC à 0, ne sont qu'ici.
   Suggestion : versionner (voir A).

4. travaux/wanted-by-etat.md
   7 septembre 2026, 02:16 — 5 350 octets, 108 lignes
   Titre : « # Wanted_by — relevé avant décision, 7 septembre 2026 »
   Dix premières lignes : mesure demandée avant toute proposition. Cyril
     veut retourner la relation Wanted_by (item vers acteur). Une
     affirmation précédente disait la propriété vide, ce qui est faux.
     Suit « ## Wanted_by — porte des valeurs ».
   Sujet : relevé, hors lot, préparatoire au lot PAIR.
     - Wanted_by : une seule valeur sur tout le wiki (Mèche de tarière pour
       perceuse -> Ecolibre).
     - Owned_by : 47 pages, 43 pour Ecolibre et 4 pour CWL.
     - Câblage complet de Wanted_by dans deux modèles et deux formulaires.
     - Ajout d'une note dans Notes en attente de rangement.
   Déjà ailleurs : en partie. La note du wiki a depuis été fusionnée
     (fichier 5). Le relevé chiffré et le câblage ne sont qu'ici. Ils
     resserviront le jour où le lot PAIR traitera le retournement.
   Suggestion : versionner (voir A).

5. travaux/notes-fusion.md
   7 septembre 2026, 12:25 — 3 759 octets, 72 lignes
   Titre : « # Fusion des notes PAIR / concept de projet / Wanted_by —
     7 septembre 2026 »
   Dix premières lignes : décision de Cyril, le retournement de Wanted_by
     est suspendu au lot PAIR, parce qu'un souhait se rattache à un projet
     et non à un organisme. Suit « ## Fusion sur Notes en attente de
     rangement » : deux notes qui se recouvraient sont fusionnées en une.
   Sujet : correctif, hors lot. Fusion de deux notes sur le wiki. Le
     fichier corrige aussi remise-a-niveau-6-septembre.md : la Mèche de
     tarière est un item organique et non référencé, d'où 41 organiques et
     38 référencés.
   Déjà ailleurs : le résultat oui, sur le wiki (édition du 7 septembre,
     10:24Z), et la décision est reprise dans la note fusionnée. La trace
     de la correction des comptes ne vit qu'ici.
   Suggestion : versionner (voir A).

6. travaux/remise-a-niveau-6-septembre.md
   7 septembre 2026, 12:25 — 27 146 octets, 462 lignes
   Titre : « # Remise à niveau — 9 jours d'absence (29 août → 7 septembre
     2026) »
   Dix premières lignes : « Rédigé en session de lecture seule stricte :
     aucune écriture wiki n'a été faite pendant cette reconnaissance… »
     Puis la relance de wiki-login, la dernière image connue de Cyril
     (28 août 2026) et les dates d'exécution des requêtes (6 et
     7 septembre).
   Sujet : synthèse de reprise après une absence, hors lot. Le fichier
     comporte cinq parties :
     1. un résumé de chaque rapport de travaux/ du 29 août au 6 septembre ;
     2. les lots ouverts, fermés et abandonnés dans la période ;
     3. l'état mesuré du wiki le 7 septembre (comptes par classe) ;
     4. les entrées 35 à 47 des Limites connues, et ce qui a changé dans le
        modèle depuis le 29 août ;
     5. les chantiers ouverts, les notes en attente et les demandes à
        fuzzy.
   Déjà ailleurs : ses sources oui. Ce sont les rapports suivis qu'il
     résume, et des pages du wiki. La photographie d'état datée du
     7 septembre (comptes par classe, statuts de lots, liste des demandes
     à fuzzy à cette date) n'existe nulle part ailleurs. Elle est
     aujourd'hui périmée pour décrire le présent, mais c'est un point de
     repère historique. notes-fusion.md (fichier 5) la cite et la corrige.
   Suggestion : versionner (voir B).
────────────────────────────────────────────────────────────────────

Suggestions

A. Contexte : rangs-separateur, rangs-correction, helianthi-insee,
   wanted-by-etat et notes-fusion sont les rapports de treize écritures
   [Correctif] et [Complément] faites sur le wiki les 6 et 7 septembre. Le
   wiki n'en garde que les résumés. La cause (deux valeurs dans un champ,
   non le séparateur), la découverte silencieuse d'Égopode, les décisions
   de Cyril (convention décimale, plage pour Helianthi, Wanted_by suspendu
   au lot PAIR) et les mesures ne vivent que dans ces fichiers. Ils se
   citent aussi l'un l'autre en chaîne.
   Question : faut-il versionner ces cinq fichiers ?
   Suggestion : oui, tels quels, sans les renommer. Ils font partie du
   récit, que CLAUDE.md demande de garder (« pas une zone tampon »). Les
   renommer casserait les renvois croisés et les renvois depuis
   lot-28-tache2 et lot-28-tache3. Je propose un seul commit
   « [Correctif] travaux/ — rapports des 6 et 7 septembre versionnés »,
   suivi de git show --stat (6 fichiers, 0 suppression attendue) et d'une
   poussée.

B. Contexte : remise-a-niveau-6-septembre.md est une synthèse dont les
   sources sont presque toutes versionnées. Son état daté du 7 septembre
   est périmé pour le présent, mais il est unique comme photographie. Il
   est aussi cité et corrigé par notes-fusion.md : le supprimer laisserait
   un renvoi vers un fichier absent.
   Question : faut-il le versionner ou le supprimer ?
   Suggestion : le versionner, dans le même commit que A. C'est la seule
   option qui garde intacte la chaîne de correction notes-fusion vers
   remise-a-niveau. Aucun des six fichiers ne me paraît être une copie ou
   un brouillon périmé au sens de la consigne.

C. Contexte : une fois les six fichiers versionnés, git status est propre.
   Les rapports cessent de les signaler et les consignes de les excepter.
   Question : faut-il ensuite ajouter une règle contre la récidive ?
   Suggestion : non, pas de règle nouvelle. La cause, « faute de consigne
   de commit », est déjà couverte par « Pousser en fin de session,
   systématiquement » dans CLAUDE.md et par f8c9e90 (« ce qui n'est pas
   poussé est invisible à l'architecte »), tous deux postérieurs à ces
   fichiers.

Écarts et surprises
- Ma première commande portait un « cd /home/spheres/ecolibre-sgdt; » en
  tête de commande composée, contrairement à la règle de CLAUDE.md. Il est
  resté sans effet, le répertoire courant étant déjà la racine du dépôt.
  Je le signale quand même.
- remise-a-niveau-6-septembre.md, section 5, attribue encore les trois
  erreurs de rang au « séparateur décimal virgule/point ». rangs-separateur
  a infirmé cette hypothèse la même nuit, mais le fichier n'a pas été
  corrigé sur ce point, alors que notes-fusion l'a corrigé sur un autre.
  Il ne faut pas réécrire un rapport historique ; c'est seulement à savoir
  si on le relit.
- Le wiki a été lu (recentchanges du 5 au 7 septembre) pour répondre au
  point 4. Cette lecture n'était pas annoncée dans les confirmations, mais
  elle passe par bin/wiki-api.sh, en lecture seule.
```

## Commit

- Étape 0 : `.claude/settings.local.json` ne porte aucune règle
  (`"allow": []`, `"deny": []`).
- Étape 1 : les six fichiers sont toujours non suivis et inchangés depuis
  le relevé, avec les mêmes tailles et les mêmes dates de modification
  (helianthi-insee 2 784 o, 02:09:00 ; notes-fusion 3 759 o, 12:25:37 ;
  rangs-correction 5 864 o, 02:08:44 ; rangs-separateur 4 570 o, 01:26:28 ;
  remise-a-niveau-6-septembre 27 146 o, 12:25:17 ; wanted-by-etat 5 350 o,
  02:16:37, tous le 7 septembre 2026).
- Étape 2 : commit `0191a81` — `[Correctif] travaux/ — rapports des 6 et
  7 septembre versionnés`. Seuls ces six fichiers ont été ajoutés, sans
  aucune modification ni aucun renommage. `git show --stat` :

  ```
   travaux/helianthi-insee.md             |  56 ++++
   travaux/notes-fusion.md                |  72 +++++
   travaux/rangs-correction.md            | 107 ++++++++
   travaux/rangs-separateur.md            |  78 ++++++
   travaux/remise-a-niveau-6-septembre.md | 462 +++++++++++++++++++++++++++++++++
   travaux/wanted-by-etat.md              | 108 ++++++++
   6 files changed, 883 insertions(+)
  ```

  Le résultat est celui attendu : six fichiers, 883 insertions (le total
  des `wc -l` du relevé) et aucune suppression.
- Avant l'écriture de ce rapport, `.claude/settings.local.json` ne portait
  toujours aucune règle.

## Écarts et surprises

- **La section 5 de `remise-a-niveau-6-septembre.md` est infirmée, et ne
  se réécrit pas.** Elle attribue encore les trois erreurs de rang de
  plantation (Capucine tubéreuse, Fraisier X, Helianthi) au « séparateur
  décimal virgule/point ». `rangs-separateur.md` a infirmé cette hypothèse
  la même nuit : la cause était deux nombres saisis dans un même champ.
  `notes-fusion.md` a corrigé `remise-a-niveau` sur un autre point (la
  classe de la Mèche de tarière), mais pas sur celui-là. Conformément à la
  décision de versionner tels quels, le fichier n'est pas réécrit. C'est à
  savoir si on le relit : la cause établie est dans `rangs-separateur.md`.
- Aucun autre écart. Ce correctif n'a fait aucune lecture ni écriture sur
  le wiki.
