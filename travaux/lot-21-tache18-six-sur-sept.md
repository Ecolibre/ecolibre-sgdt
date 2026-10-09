# Lot 21, tâche 18 — Six sur sept

Session du 9 octobre 2026, exécutée par Claude Code. Exécutée le jour même de la consigne : la date « 9 octobre 2026 » des textes n'a pas eu à être changée.

## Étape 0 — État du dépôt

`git status --short` : aucune ligne. Dépôt propre.

`travaux/lot-21-tache18-six-sur-sept.md` : absent avant la tâche.

`.claude/settings.local.json`, au début comme à la fin de la tâche : `allow` et `deny` vides, aucune règle.

Ancres : chacune trouvée une fois et une seule (`grep -cF` = 1 pour les six). L'ancre de la page du lot a été comptée sur la copie fraîche.

## Étape 1 — Lecture de confirmation

La lecture a été faite le 9 octobre 2026 à 10 h 59 min 39 s UTC, connecté.

Pour garder une seule lecture, la consigne nommant le témoin « dans la même lecture », j'ai ajouté `|?Max thickness` à la chaîne prescrite.

```
action=ask&query=[[Test lot21b débit::+]]|?Test lot21b débit|?Max thickness|limit=1&format=json
```

`query.printrequests` :

```
[{"label":"","key":"","redi":"","typeid":"_wpg","mode":2,"format":false},
 {"label":"Test lot21b débit","key":"Test_lot21b_débit","redi":"","typeid":"_wpg","mode":1,"format":""},
 {"label":"Max thickness","key":"Max_thickness","redi":"","typeid":"_num","mode":1,"format":""}]
```

- **`Test lot21b débit` rend `_wpg`.** Sa page porte pourtant `_TYPE` = `_qty`, avec `_CONV` (trois conversions) et `_UNIT` (L/h, m³/h, m³/s), d'après la lecture de ses faits faite dans la même minute.
- **Le témoin `Max thickness` rend `_num`**, conforme à son `_TYPE` (`#_num`) : la lecture est valide.

La mesure de l'architecte tient, donc j'ai poursuivi.

## Diff des Limites connues

Révision 1475 → 1477. Les deux remplacements sont partis en une seule écriture, avec le résumé `[Lot 21][Tâche 18] Entrée 59 : six gels sur sept levés, le septième tient toujours`. Avant l'écriture, la page portait 65 entrées.

Diff mot à mot (`git diff --word-diff`) :

Entrée 59 :
```
[…] restait gelée après quatre {+jours, et le 9 octobre 2026 après cinq+} jours.
[-Le-]{+'''Six gels sur sept se sont donc levés en deux à quatre jours, le septième n'était pas levé après cinq.''' Un+} gel est [-donc-]{+le plus souvent+} un [-retard, pas-]{+retard et non+} une perte : ne pas abandonner un [-nom,-]{+nom à la première constatation,+} attendre et revérifier le type résolu avant de s'en servir.
{+Mais un gel qui dure ne s'attend pas indéfiniment : passé une semaine, recréer la propriété sous un autre nom, et consigner la date de l'abandon. Ce délai est un repère de conduite, pas une mesure : aucun gel n'a été observé au-delà de cinq jours, dans un sens comme dans l'autre.+}
```

Entrée 65 :
```
l'écriture passe si la page est libre, et la verrouille [-aussitôt-]{+très probablement, ce qui est mesuré pour un changement de type (entrée 62) mais pas pour un ajout de valeur autorisée+} ;
```

## Diff de la page du lot

Révision 1474 → 1478, résumé `[Lot 21][Tâche 18] Risques connus : six gels sur sept levés`. La copie fraîche était identique à la copie versionnée : personne n'avait écrit la page depuis la tâche 16.

```diff
-[…] Ni la rafale ni l'isolement ne prédisent le gel, et le gel se résorbe de lui-même en deux à quatre jours (entrée 59 des Limites connues). […]
+[…] Ni la rafale ni l'isolement ne prédisent le gel. Six de ces sept gels se sont levés d'eux-mêmes en deux à quatre jours ; le septième n'était pas levé le 9 octobre 2026, après cinq (entrée 59 des Limites connues). Un gel coûte donc le plus souvent une attente, et parfois un nom. […]
```

## Diff de CLAUDE.md

```diff
-  […] sans rien réparer et sans changer de nom. Le gel se résorbe de lui-même en deux à quatre jours (entrée 59 des Limites connues), mesuré du 4 au 8 octobre 2026.
+  […] sans rien réparer et sans changer de nom. Six gels sur sept se sont levés d'eux-mêmes en deux à quatre jours ; le septième n'était pas levé le 9 octobre 2026, après cinq (entrée 59 des Limites connues). Passé une semaine, recréer la propriété sous un autre nom.
 
-  […] Compte complet du 4 au 6 octobre 2026 : vingt-cinq propriétés créées, sept gelées, en deux épisodes seulement. Le gel est temporaire, voir ci-dessus.
+  […] Compte complet du 4 au 6 octobre 2026 : vingt-cinq propriétés créées, sept gelées, en deux épisodes seulement. Sur la durée d'un gel, voir ci-dessus.
```

Rien d'autre ne change dans CLAUDE.md.

## Diff de methode-de-travail.md

```diff
@@ -120,6 +120,8 @@
 **Un garde-fou s'éprouve en rejouant l'erreur d'origine**, […] a été signalé d'emblée.
 
+**Une entrée des *Limites connues* énonce ce qui a été observé, avec son compte et sa date, et ne généralise pas au-delà.** Du 6 au 9 octobre 2026, quatre tâches consécutives du lot 21 n'ont fait que réparer des entrées écrites les jours précédents : chaque fois, une poignée d'observations avait été inscrite au présent intemporel, et un cas de plus la démentait. « Six gels sur sept levés en deux à quatre jours, le septième non levé après cinq » se corrige en changeant un chiffre ; « le gel se résorbe en deux à quatre jours » se corrige en réécrivant l'entrée, et se propage d'ici là dans tous les textes qui la citent. Une règle de conduite tirée d'un petit nombre de cas se marque comme telle : repère, pas mesure.
+
 ## Ce qui rattrape les erreurs
```

## Les six vérifications

### a. Celle qui tranche

```
IDENTIQUE : Limites connues du Système de Gestion de Données Techniques
verify exit 0
IDENTIQUE : Lot 21 — Grandeurs et unités
verify exit 0
```

Faits SMW des Limites connues : `_INST`, `_MDAT`, `_SKEY` seuls, aucune annotation parasite.

### b. Entrées

J'ai relu la page après écriture : 65 lignes commencent par `# `.

Entrée 59, en entier :

> # '''Le type résolu d'une propriété peut rester le type par défaut alors que sa page porte le bon type.''' Semantic MediaWiki ne lit pas le type sur la page de propriété au moment de stocker une valeur ou de compiler une requête : il emploie un type résolu, qui peut diverger du fait <code>_TYPE</code>. Le 4 octobre 2026, six propriétés créées en treize secondes au milieu de onze pages portaient <code>_qty</code>, <code>_tem</code> ou <code>_mlt_rec</code> dans leur <code>_TYPE</code> et étaient pourtant résolues en <code>_wpg</code> ; toutes les valeurs des pages qui les employaient ont été stockées en type Page, sans la moindre erreur. Ni purge, ni réécriture de la page porteuse, ni vidage de la file de travaux n'y a rien changé, et rien n'avait bougé trente-sept heures plus tard. Le type résolu se lit sans rien écrire, dans <code>query.printrequests[].typeid</code> d'un <code>action=ask</code> portant sur la propriété, pour l'entrée dont le libellé n'est pas vide ; l'entrée au libellé vide est la colonne du sujet et vaut toujours <code>_wpg</code>. '''Règle : vérifier le type résolu avant de créer la moindre page employant une propriété neuve.''' '''Le gel n'est pas définitif, contrairement à ce que cette entrée affirmait jusqu'au 8 octobre 2026.''' Mesuré ce jour-là à 21 h 11 : cinq des six propriétés gelées le 4 octobre rendaient de nouveau leur type déclaré, ainsi que <code>Test lot21c température</code>, gelée isolément le 5 octobre à 12 h 03. Une seule, <code>Test lot21b débit</code>, restait gelée après quatre jours, et le 9 octobre 2026 après cinq jours. '''Six gels sur sept se sont donc levés en deux à quatre jours, le septième n'était pas levé après cinq.''' Un gel est le plus souvent un retard et non une perte : ne pas abandonner un nom à la première constatation, attendre et revérifier le type résolu avant de s'en servir. Mais un gel qui dure ne s'attend pas indéfiniment : passé une semaine, recréer la propriété sous un autre nom, et consigner la date de l'abandon. Ce délai est un repère de conduite, pas une mesure : aucun gel n'a été observé au-delà de cinq jours, dans un sens comme dans l'autre. Le gel reste rare et imprévisible : sur vingt-cinq propriétés créées du 4 au 6 octobre 2026, sept ont gelé, en deux épisodes seulement, une rafale de six et une création isolée ; ni la rafale ni l'isolement ne le prédisent. Cause non établie ; une propagation de changement qui n'aboutit que très lentement est l'hypothèse (<code>demandes-adminsys.md</code> §2.2). Mesuré du 4 au 8 octobre 2026 (lot 21, tâches 6 à 15).

Entrée 65, en entier :

> # '''Enrichir une énumération fermée verrouille la propriété, et diffère le changement suivant de quelques jours.''' Ajouter une valeur à la liste <code>_PVAL</code> d'une propriété revient à modifier sa déclaration : l'écriture passe si la page est libre, et la verrouille très probablement, ce qui est mesuré pour un changement de type (entrée 62) mais pas pour un ajout de valeur autorisée ; elle est refusée si la page est déjà verrouillée, et il faut alors attendre que le verrou se lève, ce qu'il fait seul en quelques jours (entrée 62). Un ajout est donc différé, jamais impossible. Constaté le 6 octobre 2026 sur <code>Work_package_status</code>, dont les six valeurs sont « identifié », « cadré », « ouvert », « livré », « clos » et « abandonné » : il n'en existe aucune pour un lot suspendu par une dépendance externe, et trente-quatre lots dépendent de cette propriété. Le cas se représentera pour toute énumération fermée du modèle. '''Conséquence : grouper les valeurs à ajouter en une seule écriture, puisque la suivante attendra, et n'employer la prose sur la page concernée que pendant ce délai.''' La rédaction du 6 octobre 2026, qui tenait l'ajout pour impossible et l'interdisait, reposait sur l'idée que le verrou ne se levait pas ; la tâche 15 du lot 21 a mesuré le contraire le 8 octobre 2026.

**Entrée 59 :** elle n'affirme plus qu'un gel se résorbe toujours. Deux restes vont pourtant dans ce sens :
- la phrase en gras « '''Le gel n'est pas définitif''' », au présent général, alors qu'un gel sur sept n'est pas levé ;
- la provenance finale, « Mesuré du 4 au 8 octobre 2026 (lot 21, tâches 6 à 15) », qui ne couvre plus la lecture du 9 octobre, citée deux phrases plus haut.

**Entrée 65 :** le corps ne dit plus qu'un ajout verrouille à coup sûr (« très probablement »). Mais le **titre en gras** l'affirme encore sans réserve : « Enrichir une énumération fermée verrouille la propriété ». La « Conséquence », « puisque la suivante attendra », suppose elle aussi le verrou certain. Le titre et le corps de l'entrée se contredisent donc. Par ailleurs, « Un ajout est donc différé, jamais impossible » généralise au-delà de l'observé : le verrou s'est levé dans 17 cas sur 17 (entrée 62), mais rien ne le garantit pour le suivant.

### c. Cohérence

J'ai relu la règle « Barrière » de CLAUDE.md en entier (lignes 281 à 289). **Deux contradictions** :

1. **Dans le deuxième paragraphe** : « attendre et revérifier, sans rien réparer et **sans changer de nom** », puis, trois lignes plus loin : « Passé une semaine, **recréer la propriété sous un autre nom** ». La consigne a ajouté la seconde phrase sans retoucher la première.
2. **Dans le quatrième paragraphe**, « Le gel du type résolu se résorbe de la même façon » reste au présent général, et rattache le gel au verrou, dont toutes les levées ont été observées. Cette phrase contredit le deuxième paragraphe (« le septième n'était pas levé… après cinq »). La suite, « Ce n'est ni une perte, ni une raison de changer de nom », vise la déclaration et le verrou ; placée après la phrase sur le gel, elle se lit aussi comme visant le gel, ce qui contredit encore la règle de la semaine.

Chiffres : aucun chiffre ne figure deux fois pour la même grandeur.
- « quatre jours » apparaît deux fois, pour deux délais distincts : la levée des gels (« deux à quatre jours ») et celle des verrous (« quelques heures à quatre jours »).
- Le nombre de gels apparaît deux fois, et concorde : « six gels sur sept » au deuxième paragraphe, « sept gelées » au dernier.

Entre la règle et la page du lot 21 : les deux disent la même chose sur la durée d'un gel, avec les mêmes mots (six sur sept en deux à quatre jours, le septième non levé le 9 octobre après cinq). La page du lot en tire « parfois un nom », sans délai ; la règle fixe le délai à une semaine, ce qui est compatible. La ligne 140 de la page du lot ne contient plus d'autre phrase sur la durée d'un gel.

### d. Renvois

Dans CLAUDE.md, une seule mention de la forme « entrée NN des Limites connues » : l'entrée 59, dont le titre est « Le type résolu d'une propriété peut rester le type par défaut… ». Le renvoi est juste.

Sur la page du lot, j'ai relevé toutes les mentions, y compris les formes abrégées. Elles pointent sur les entrées 2, 10, 33, 51, 57, 59, 60, 61, 62, 63 et 65. La page porte toujours 65 entrées, sans insertion, et les titres relus aujourd'hui sont ceux de la tâche 16 ; seul le titre de l'entrée 65 a changé, en tâche 17, sans changer de sujet. Chaque renvoi concorde avec le sujet cité. Aucun renvoi faux.

### e. Propriétés intactes

La lecture a été faite connecté, sans aucun avertissement de session expirée :

```
{"title":"Attribut:Nominal diameter","lastrevid":342,"edit":true}
{"title":"Attribut:Secondary diameter","lastrevid":343,"edit":true}
{"title":"Attribut:Power rating","lastrevid":803,"edit":true}
{"title":"Attribut:Max thickness","lastrevid":804,"edit":true}
{"title":"Attribut:Work package status","lastrevid":1161,"edit":true}
```

Les révisions attendues sont présentes, et aucune propriété n'est verrouillée.

### f. Erreurs

- `action=ask` sur `[[_ERRC::+]]`, `limit=500` : **1** résultat (`meta.count` = 1). Le sujet est `Utilisateur:Cywil/Bac à sable/Lot21c pompe#saisie-douteux`.
- Rendu en ligne, `action=parse` de `{{#ask:[[_ERRC::+]]|format=count}}` : **1**.

Les deux mesures concordent, et le compte est inchangé par rapport à l'avant-tâche.

## Écarts et surprises

1. **La règle « Barrière » de CLAUDE.md se contredit elle-même** (vérification c) : « sans changer de nom » et « passé une semaine, recréer sous un autre nom » se suivent dans le même paragraphe. De plus, la phrase « Le gel du type résolu se résorbe de la même façon », au quatrième paragraphe, est exactement le présent général que la nouvelle règle de `methode-de-travail.md` proscrit. La consigne ne visait pas ces deux phrases, et je ne les ai pas corrigées.
2. **Le titre en gras de l'entrée 65 affirme encore le verrouillage certain**, alors que le corps dit maintenant « très probablement » (vérification b).
3. **L'entrée 59 garde « '''Le gel n'est pas définitif''' » au présent général**, et sa provenance finale (« Mesuré du 4 au 8 octobre 2026 (lot 21, tâches 6 à 15) ») ne couvre plus la lecture du 9 octobre (vérification b).
4. **La règle nouvelle de `methode-de-travail.md` donne en exemple « le septième non levé après cinq »** : si le gel de `Test lot21b débit` se lève, l'exemple restera juste, puisqu'il est daté par le contexte, mais le chiffre « cinq » vieillira. Simple remarque.
5. **Une autre session écrit en parallèle sur le lot 22.** Révision 1476, à 10 h 58 UTC, deux minutes avant mes écritures : `[Lot 22][Tâche 4] Ouverture du lot : état ouvert…` sur *Lot 22 — Miroir local*. C'est pourquoi les Limites connues sont passées de 1475 à 1477. Aucune collision : ni mes deux pages ni mes fichiers n'ont été touchés.
6. **Lecture de confirmation :** j'ai ajouté `|?Max thickness` à la chaîne prescrite, qui n'appelait que la propriété gelée, pour que le témoin figure « dans la même lecture » comme demandé.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

**A.** La règle « Barrière » de CLAUDE.md dit « sans changer de nom », puis « passé une semaine, recréer sous un autre nom ». Elle dit aussi, au quatrième paragraphe, « le gel du type résolu se résorbe de la même façon ». Faut-il aligner ces deux phrases sur la règle de la semaine ? Suggestion :
- deuxième paragraphe : « …attendre et revérifier, sans rien réparer et sans changer de nom à la première constatation » ;
- quatrième paragraphe : supprimer « Le gel du type résolu se résorbe de la même façon. », la durée du gel étant déjà dite au deuxième.

**B.** Le titre de l'entrée 65 affirme le verrouillage certain, contre son corps. L'entrée 59 garde « Le gel n'est pas définitif » au présent général, et une provenance arrêtée au 8 octobre. Faut-il les reprendre dans la même tâche que A ? Suggestion, en une seule écriture des Limites connues :
- titre de l'entrée 65 : « Enrichir une énumération fermée verrouille très probablement la propriété, et diffère alors le changement suivant de quelques jours » ;
- entrée 59 : « Six gels sur sept n'ont pas été définitifs » à la place de « Le gel n'est pas définitif » ;
- provenance de l'entrée 59 : « Mesuré du 4 au 9 octobre 2026 (lot 21, tâches 6 à 18) ».
