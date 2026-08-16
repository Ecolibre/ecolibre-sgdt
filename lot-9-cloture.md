# Lot 9 — Clôture : compilation

Sept points, tous exécutés. Deux écritures wiki, quatre fichiers locaux
(trois modifiés, un créé). Plus la relecture de `CLAUDE.md` demandée.

## 1. `CLAUDE.md` — section « Serveur » créée

Absente, donc créée entre les copies locales et les garde-fous d'exécution :
accès SSH `clibert@serveur3.initiative.place`, cœur partagé
`/home/fuzzy/mediawiki/mediawiki-1.39/`, configuration
`LocalSettings_ecolibre.php`, base `mediawiki_ecolibre_prod`.

La règle du `SERVER_NAME` y est posée en règle impérative, avec son motif —
l'aiguilleur teste `$_SERVER['SERVER_NAME']`, absent en CLI — un exemple de
commande complète, et le rappel que le cœur est partagé par toute la ferme.
Renvoi vers `demandes-adminsys.md` pour le partage des rôles.

## 2. `lot-9-tache0-rapport.md` §10 — diagnostic serveur consigné

Ajouté avant la liste des corrections dues : les trois résultats négatifs du
16 août 2026, et la conclusion qui en découle.

1. `showJobs.php --group` rend une file **vide** — il n'y a aucun
   `ChangePropagationDispatchJob` à exécuter. C'est ce résultat qui **invalide
   l'hypothèse** écrite au même endroit lors de la tâche 0 (« le verrou tient
   tant que le job n'a pas tourné ») : le verrou survit à l'absence de job.
2. La purge ne reprogramme aucun job.
3. `rebuildData.php --page` traite la page sans relâcher le verrou.

**Conclusion : verrou orphelin**, seul levier
`$smwgChangePropagationProtection`, côté fuzzy. La mention **« à ne pas
refaire »** est écrite explicitement, avec le détail des trois commandes, pour
qu'un futur passage ne réinvestisse pas la même impasse.

L'hypothèse initiale n'a pas été effacée : elle reste lisible, suivie du
diagnostic qui la contredit. Un raisonnement faux qu'on supprime se
reconstruit ; celui qu'on laisse avec sa réfutation ne revient pas.

## 3. `demandes-adminsys.md` — créé

La distinction demandée est posée en tête, avec son motif : Cyril a
techniquement le droit d'écrire dans `LocalSettings_ecolibre.php` (accès
`clibert`, groupe `fuzzy`), et ne l'exerce pas. **Question de gouvernance, pas
de permission** — « un droit d'écriture n'est pas un mandat ».

- **Sans rien demander** : `runJobs.php` à la main (préfixe obligatoire), tout
  diagnostic en lecture, `rebuildData.php --page` sur une page ciblée.
- **Décision de fuzzy**, par ordre d'urgence : *bloquant*
  (`$smwgChangePropagationProtection` pour le verrou orphelin ; cron sur
  `runJobs.php` pour la cause racine, que Cyril peut proposer de prendre en
  charge) ; *configuration* (SVG avec sa réserve de sécurité — un SVG peut
  porter du script —, Page Exchange, répertoire de déploiement du vocabulaire,
  script de création de wiki) ; *infrastructure* (Scaleway, Atelier du Dôme,
  dump SQL et archive images) ; *gouvernance* (financement, sauvegarde,
  rotation du mot de passe exposé en juillet).

Le point bloquant porte ses conséquences concrètes, pas seulement son intitulé :
deux corrections de données restent impossibles, dont celle qui laisse
`ECL-0042` sans statut stocké.

## 4. `lot-9-amendement-1.md` 1.13 — quatrième occurrence

L'assertion sourcée rejoint la réception, la récolte et la présence. Le point
central est écrit comme un piège à éviter : une propriété qui reçoit deux
valeurs contradictoires selon la source **n'est pas un champ multivalué** —
les valeurs ne s'additionnent pas, elles s'opposent, et rien ne dirait
laquelle croire. Ce qu'il faut stocker est un quadruplet : valeur, source,
date, confiance.

Piste `#subobject` consignée, avec l'argument qu'elle n'est pas à inventer —
le motif est déjà employé sur ce wiki (`Board_lineage` / `Module:Board`).
« Trois besoins » devient **« quatre besoins, une seule construction »**, et la
règle d'ensemble suit : le jour où l'un des quatre sera traité, il devra
l'être pour les quatre.

## 5 et 6. Feuille de route — deux ajouts (revids 777 puis 778)

**Règle des sources botaniques**, sous la question ouverte qu'elle ne ferme
pas : un fait n'est pas protégé par le droit d'auteur, une formulation l'est.
Extraire des valeurs, jamais des phrases. Et, si du texte est un jour repris,
attribution **visible sur la page** — avec le motif : un résumé de
modification n'est pas lu par le lecteur et disparaît de la vue dès l'édition
suivante.

**Entrée « Suites du lot 9 »**, cinq sous-points : les 23 dates à retrouver
(avec le rappel que l'absence signifie « non retrouvée »), les 9 taxons à
chercher dans les catalogues fournisseurs, les rangs de la butte, le choix des
photos principales, et la garde de `Modèle:Organic facet fitting`.

### Une vérification qui a changé l'entrée

Le modèle visé n'existe pas sous le nom annoncé : le titre réel est
**`Modèle:Organic facet fitting`** (anglais), la valeur de facette étant
`Facette raccord`. Vérifié aussi, plutôt que supposé :

- il porte **bien** le même défaut — `{{#if:{{{Nominal_diameter|}}}|` garde le
  `#set` **et** la catégorie ;
- mais il a **0 transclusion**, et `Catégorie:Item à facette raccord` **0
  membre**.

Le défaut est donc **latent, pas actif** : aucun item n'est aujourd'hui mal
classé. L'entrée le dit, et en tire l'argument utile — c'est ce qui rend la
correction facile, et il faut la faire **avant la création du premier item à
facette raccord**, tant qu'aucun effectif n'est en jeu. La première rédaction,
qui parlait d'un contrôle d'effectif avant/après, aurait fait perdre du temps
sur un effectif nul.

Une seconde édition (`[Correctif]`, revid 778) a aussi retiré un lien rouge :
`Catégorie:Item à facette raccord` n'a pas de page de description. À noter au
passage, sans conséquence — `Catégorie:Item à facette végétal` non plus, alors
qu'elle compte 70 membres. C'est le fonctionnement normal de MediaWiki, pas un
défaut.

## 7. Leçon des annotations parasites — écrite, mais pas telle que dictée

**La consigne disait « envelopper dans `<nowiki>` ou `<code>` ». C'est faux
pour `<code>`, et c'est précisément l'erreur commise hier.** Les trois
annotations parasites de *Limites connues* étaient **déjà dans des balises
`<code>`** : elles ont été stockées quand même. `<code>` met en forme, il
n'échappe rien ; seul `<nowiki>` échappe.

La leçon écrite dans `CLAUDE.md` dit donc :
`<code><nowiki>[[X::Y]]</nowiki></code>` pour avoir la mise en forme **et**
l'échappement, l'extension aux fonctions d'analyseur (`{{#ifexpr: … > 0}}`
cité en exemple s'évalue et rend une erreur), et le contrôle à faire —
`browsebysubject` **sur la page de documentation elle-même**, qui ne doit
porter que `_MDAT` et `_SKEY`.

Ce contrôle a été appliqué aux deux pages écrites aujourd'hui : la Feuille de
route ne porte que `_MDAT` et `_SKEY`, et son rendu est à 0 erreur, 0 lien
rouge.

---

## Relecture de `CLAUDE.md` — quatre points à trancher

Trois contradictions réelles et une imprécision. Aucune n'est corrigée
d'office : elles touchent des règles, pas des faits.

### a. La méthode de lecture des faits SMW est périmée

La leçon « Comment vérifier un fait SMW réellement stocké » donne une commande
`curl` brute et affirme que *« `bin/wiki-get.sh` ne gère pas
`action=browsebysubject` »*. C'est exact, mais **`bin/wiki-api.sh` le gère**,
et la section *Outils* documente même un raccourci dédié,
`--facts "subject=...&ns=..."`. La leçon envoie donc vers `curl` alors que
l'outil du dépôt fait mieux. **Proposition : remplacer la commande `curl` par
`bin/wiki-api.sh --facts`**, en gardant tout le reste du paragraphe, qui vaut
toujours.

### b. Le format de résumé documenté ne couvre pas ce qui est réellement écrit

Le garde-fou n° 2 n'admet que deux formes : `[Lot X][Tâche N]` et
`[Correctif]`. Or ce lot a écrit, sur ta consigne, des résumés
`[Lot 9][Complément]` puis `[Lot 9][Clôture]` — un travail qui relève bien du
lot mais d'aucune tâche numérotée. **Proposition : ajouter que le second
crochet peut porter un libellé (`[Complément]`, `[Clôture]`) plutôt qu'un
numéro de tâche.** La règle de fond — un résumé, une édition, annulable page
par page — n'est pas en cause.

### c. Le garde-fou n° 5 dit d'inspecter les protections ; le wiki dit que ça ne sert à rien

Le n° 5 impose `prop=info&inprop=protection` avant d'écrire. Le *Récapitulatif
technique*, section « Droits », dit de son côté : *« Une interrogation des
protections ne permet donc **pas** de prévoir si une écriture sera acceptée :
un refus doit être traité comme un résultat normal. »* Les deux ne se
contredisent pas frontalement — le n° 5 mentionne Lockdown — mais un lecteur
pressé retiendra du n° 5 que la vérification est probante. Elle ne l'est pas ;
elle est nécessaire et insuffisante. **Proposition : le dire en une clause.**

### d. Le n° 6 vaut aussi pour les modèles de facette

Le garde-fou n° 6 énumère les modèles d'items « Functional, Organic,
Referenced, Physical ». Les modèles de **facette** (`Organic facet plant`,
`Physical facet plant`, `Organic facet fitting`) n'y figurent pas, alors que
`Modèle:Organic facet plant` a été modifié aujourd'hui — à juste titre, après
validation explicite, donc dans l'esprit de la règle mais hors de sa lettre.
**Proposition : les ajouter à l'énumération.**

### Ce qui ne se contredit pas

L'exception `ignorewarnings` (`duplicate-archive`) est cohérente avec le
« ne jamais faire » : le garde-fou général y est rappelé, l'exception bornée
par trois conditions et explicitement tenue hors de `bin/wiki-upload.sh`. La
liste numérotée des corrections sur les modèles est cohérente avec les
rapports du lot. La convention de nommage des médias décrit l'état réel des
73 fichiers, désormais tous conformes.
