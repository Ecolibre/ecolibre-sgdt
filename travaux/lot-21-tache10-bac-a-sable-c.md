# Lot 21, tâche 10 — Troisième bac à sable, protocole durci : rapport

Session Claude Code du 5 octobre 2026, 16 h 40 à 17 h 50 UTC.

**Arrêt de toute la tâche à l'étape 3, sur P3.** `Attribut:Test lot21c écart température` puis sa reprise `Attribut:Test lot21c écart température 2` ont toutes deux échoué à la barrière. Comme le prévoit la consigne, deux échecs d'affilée sur une même propriété arrêtent tout. P4 et P5 n'ont pas été créées. Les étapes 4 à 7 n'ont pas été exécutées : pas de modèle, pas de catégorie, pas de page de grandeur, pas de page d'item, et aucun relevé de l'étape 7.

**Le fait principal contredit ce que la consigne annonce.** Sur les six tentatives, **le type résolu a toujours été le bon** (`_tem` ou `_qty`, témoin `Max thickness` à `_num` à chaque tour). Aucune n'est tombée en `_wpg`. Quatre tentatives sur six ont pourtant échoué, et toutes pour la même raison : le volet 2 est refusé par `smw-change-propagation-protection`, durablement, alors que le type est juste. L'hypothèse de la consigne portait sur un type figé. Le mode d'échec observé ici est un autre : un verrou sans type faux.

Aucun sujet de production ne figure parmi les `_ERRC` : le compte vaut 0.

## Étape 0 — État du dépôt

- `git status --short` : sortie vide. Aucune ligne M, A, D, R ni ??.
- `travaux/lot-21-tache10-bac-a-sable-c.md` : absent (`No such file or directory`).
- `.claude/settings.local.json`, au début de la tâche : `{"permissions": {"allow": [], "deny": []}}`. Aucune règle.

## Étape 1 — Diff de CLAUDE.md

```diff
@@ -279,7 +279,7 @@ Ce que Cyril peut lancer seul, et ce qui relève de fuzzy : voir
   1. le type résolu à l'exécution est le bon. Le lire dans `query.printrequests[].typeid` d'un `action=ask` portant sur cette propriété, pour l'entrée dont le label n'est pas vide ; l'entrée au label vide est la colonne du sujet et vaut toujours `_wpg` ;
   2. une écriture sur la page de propriété est acceptée, `nochange` compris.
 
-  Le fait `_TYPE` porté par la page de propriété ne vaut pas barrière. Mesuré le 4 octobre 2026, lots 21 tâches 6 à 8 : six propriétés portaient le bon `_TYPE` tout en étant résolues en `_wpg` et verrouillées par `smw-change-propagation-protection`, file de travaux à 0 et `_CHGPRO` absent. Les valeurs des pages qui les employaient sont tombées en type Page, et rien n'a pu les en sortir. Créer les propriétés une par une, jamais en rafale.
+  Le fait `_TYPE` porté par la page de propriété ne vaut pas barrière. Mesuré le 4 octobre 2026, lots 21 tâches 6 à 8 : six propriétés portaient le bon `_TYPE` tout en étant résolues en `_wpg` et verrouillées par `smw-change-propagation-protection`, file de travaux à 0 et `_CHGPRO` absent. Les valeurs des pages qui les employaient sont tombées en type Page, et rien n'a pu les en sortir. Après avoir créé une propriété, n'émettre aucune requête nommant cette propriété tant que `_CHGPRO` n'a pas disparu de ses faits ; la seule sonde autorisée pendant cette attente est la lecture des faits de la page, qui ne résout aucun type. Ce n'est pas la rafale qui décide : mesuré les 4 et 5 octobre 2026, une rafale de huit créations a réussi, une création isolée a échoué. Une propriété dont le type résolu est faux est perdue : ne pas chercher à la réparer, abandonner le nom et recréer sous un autre.
```

Rien d'autre n'a changé dans CLAUDE.md : `git diff --stat` compte 1 ligne ajoutée et 1 supprimée pour ce fichier.

## Étape 2 — Diff de demandes-adminsys.md

L'entrée de la tâche 9 est supprimée de la section 2.4 (27 lignes). L'entrée nouvelle est insérée dans la section 2.2, juste avant `$smwgNamespacesWithSemanticLinks` (48 lignes plus une ligne vide).

```diff
@@ -193,6 +193,55 @@ Par ordre d'urgence.
   Pour `Attribut:Casc parent` et `Attribut:Casc lineage`, le déblocage
   demandé n'a qu'un seul usage prévu : les supprimer aussitôt débloquées.
 
+- **Sept propriétés d'essai figées sur le type par défaut et verrouillées
+  en écriture - constat des 4 et 5 octobre 2026.** Les six pages
+  `Attribut:Test lot21b débit`, `puissance`, `température`, `tolérance
+  temp`, `écart température` et `libellé`, plus `Attribut:Test lot21c
+  température`, refusent toute écriture avec
+  `smw-change-propagation-protection` et sont résolues en `_wpg` à
+  l'exécution, alors que leur fait `_TYPE` porte le bon type.
+
+  **Le mesuré, les 4 et 5 octobre 2026.** File de travaux à 0 ; aucun
+  `_CHGPRO` ; `protection` vide, le verrou ne se lit que par
+  `intestactions` ; le type résolu, lu dans `query.printrequests[].typeid`
+  d'un `action=ask`, vaut `_wpg` sur les sept, contre `_num` sur le témoin
+  `Max thickness` et `_qty` sur `Attribut:Test lot21c débit`, saine. Les
+  pages qui employaient ces propriétés ont stocké toutes leurs valeurs en
+  type Page ; ni purge, ni réécriture, ni vidage de la file de travaux ne
+  les en a sorties.
+
+  **Ce que la circonstance ne dit pas.** Ce n'est pas la rafale de
+  créations : huit propriétés créées en rafale le 4 octobre vers 00 h 00
+  ont toutes fonctionné, et `Test lot21c température`, créée seule le
+  5 octobre à 12 h 03, est figée. La seule différence visible avec
+  `Test lot21c débit`, saine, est le moment de la première requête nommant
+  la propriété : environ 85 secondes après la création, `_CHGPRO` déjà
+  disparu, contre 32 secondes, `_CHGPRO` encore présent. Hypothèse non
+  établie : demander le type d'une propriété avant la fin de sa
+  propagation le fige sur la valeur par défaut.
+
+  **À rapprocher de l'entrée `$smwgChangePropagationProtection`
+  ci-dessus.** Les trois pages verrouillées d'août 2026 s'étaient
+  débloquées d'elles-mêmes au bout de plusieurs jours. Ici, aucun dégel
+  après quatorze heures sur les six premières. Le verrou d'écriture et le
+  type résolu faux sont deux symptômes distincts : rien ne dit que le
+  second se répare quand le premier tombe. À revérifier dans quelques
+  jours, par `intestactions` et par le `typeid`, sans rien écrire.
+
+  **Ce qu'on aimerait savoir.** Où le type résolu d'une propriété est-il
+  mis en cache, et comment le vide-t-on ? Comment lève-t-on ce verrou ?
+  L'enjeu dépasse ces pages d'essai : la production créera des dizaines de
+  propriétés, et un nom brûlé n'est pas acceptable pour une propriété
+  réelle du modèle.
+
+  **Contournement en attendant.** Une propriété figée est perdue : on
+  l'abandonne et on recrée sous un autre nom, en n'émettant aucune requête
+  la nommant tant que `_CHGPRO` n'a pas disparu. Règle inscrite dans
+  `CLAUDE.md`.
+
+  En attente de la migration Scaleway. À tenter d'abord par nous-mêmes
+  côté serveur. Rien n'a été demandé à fuzzy.
+
 - **`$smwgNamespacesWithSemanticLinks` — les espaces `Modèle` (10),
   `Formulaire` (106) et `Module` (828) n'y sont pas.** À discuter avec fuzzy,
   **pas à poser comme une évidence** : voir la réserve ci-dessous, qui peut
@@ -250,30 +299,3 @@ Par ordre d'urgence.
 - **Politique de sauvegarde.**
 - **Rotation du mot de passe de `mediawiki_ecolibre_prod`**, exposé en
   juillet 2026.
-- **Six propriétés d'essai verrouillées par
-  `smw-change-propagation-protection` après une création en rafale —
-  constat du 4 octobre 2026.** Les six pages `Attribut:Test lot21b débit`,
-  `Attribut:Test lot21b puissance`, `Attribut:Test lot21b température`,
-  `Attribut:Test lot21b tolérance temp`, `Attribut:Test lot21b écart
-  température` et `Attribut:Test lot21b libellé` refusent toute écriture
-  avec `smw-change-propagation-protection`.
-
-  **Le mesuré, le 4 octobre 2026.** File de travaux à 0 ; aucun `_CHGPRO`
-  sur aucune des six ; aucune protection MediaWiki, le champ `protection`
-  est vide comme sur une propriété saine ; le type résolu à l'exécution
-  vaut `_wpg` sur les six, alors que leur fait `_TYPE` porte `_qty`, `_tem`
-  ou `_mlt_rec` ; une propriété créée seule le même jour à 23:44 UTC
-  (`Attribut:Test lot21c débit`) fonctionne normalement.
-
-  **Circonstance.** Les six ont été créées le 4 octobre 2026 à 22:24 UTC,
-  dans une rafale de onze pages en treize secondes.
-
-  **Demande à fuzzy.** Dans quel état de propagation ces six propriétés
-  sont-elles, et comment lève-t-on ce verrou ? L'enjeu dépasse ces pages
-  d'essai : si une rafale de créations peut verrouiller durablement des
-  propriétés, cela guette la production.
-
-  **Urgence : aucune.** Rien ne dépend de ces six pages, qui restent en
-  place comme témoins. À envoyer groupée avec la prochaine demande.
-
-  Rien n'a été demandé à ce jour : entrée de constat, ouverte.
```

`git diff --stat` : 50 insertions et 28 suppressions sur les deux fichiers, soit 49 + 1 et 27 + 1, ce qui correspond.

L'entrée insérée a été recopiée telle quelle. Le relevé de l'étape 3 la rend déjà incomplète : voir « Écarts et surprises », point 1.

## Étape 3 — Journal complet

Lecture du volet 1 validée avant la première création, sur deux témoins : `Max thickness -> ['_num']` et `Test lot21c débit -> ['_qty']`.

Le volet 1 a été lu par `volet1.py`, réécrit dans le scratchpad parce que celui de la tâche 9 n'existait plus (encodage intégral par `urllib.parse.quote`). Le volet 2 a été fait par `barriere.sh` : `wiki-wait-jobs.sh`, puis `volet1.py` sur la propriété et sur `Max thickness`, puis `wiki-put.sh` sans `--createonly`.

Tous les horodatages sont en UTC le 5 octobre 2026. Les écarts sont comptés depuis l'horodatage de création. Lecture des colonnes : « _CHGPRO à chaque tour » donne l'heure de la sonde, puis P si `_CHGPRO` était présent ou A s'il était absent avec `_TYPE` direct. Pour chaque tour de barrière, la colonne donne le typeid lu et le résultat du volet 2. Le témoin `Max thickness` a rendu `_num` à tous les tours, sans exception.

| Tentative | pageid / rév. | Création | `_CHGPRO` à chaque tour d'attente | `_CHGPRO` disparu (tour) | 1re requête nommante (écart) | Barrière T1 | T2 | T3 | Issue |
|---|---|---|---|---|---|---|---|---|---|
| P1 `Test lot21c température 2` | 589 / 1442 | 16:44:22 | sonde hors tour 16:44:29 P (+7 s) ; 16:45:30 A | 16:45:30 (T1, +68 s) | 16:45:35 (+73 s) | `_tem`, refus | 16:47:24 `_tem`, refus | 16:49:54 `_tem`, refus | **abandonnée** |
| P1 bis `Test lot21c température 3` | 590 / 1443 | 16:50:08 | 16:51:15 P ; 16:52:24 P ; 16:53:33 A | 16:53:33 (T3, +205 s) | 16:53:48 (+220 s) | `_tem`, `nochange` | — | — | **franchie** |
| P2 `Test lot21c tolérance temp` | 591 / 1444 | 16:54:00 | 16:55:08 A | 16:55:08 (T1, +68 s) | 17:11:25 (+1045 s) | `_tem`, refus | 17:15:00 `_tem`, refus | 17:19:59 `_tem`, refus | **abandonnée** |
| P2 bis `Test lot21c tolérance temp 2` | 592 / 1445 | 17:20:09 | 17:21:17 P ; 17:22:25 P ; 17:23:33 A | 17:23:33 (T3, +204 s) | 17:30:43 (+634 s) | `_tem`, `nochange` | — | — | **franchie** |
| P3 `Test lot21c écart température` | 593 / 1446 | 17:30:54 | 17:32:01 P ; 17:33:09 P ; 17:34:17 P ; 17:35:25 A | 17:35:25 (T4, +271 s) | 17:37:07 (+373 s) | `_qty`, refus | 17:38:35 `_qty`, refus | 17:39:49 `_qty`, refus | **abandonnée** |
| P3 bis `Test lot21c écart température 2` | 594 / 1447 | 17:40:01 | 17:41:09 A | 17:41:09 (T1, +68 s) | 17:41:29 (+88 s) | `_qty`, refus | 17:42:45 `_qty`, refus | 17:44:31 `_qty`, refus | **abandonnée — arrêt de la tâche** |
| P4 `Test lot21c libellé` | — | non créée | | | | | | | arrêt |
| P5 `Test lot21c puissance` | — | non créée | | | | | | | arrêt |

Tous les refus du volet 2 portent le code `smw-change-propagation-protection`. Pendant toutes les barrières, `wiki-wait-jobs.sh` a rendu « essai 1 : jobs=0, FILE VIDE », sortie 0.

Quand `_CHGPRO` était présent, les faits ne montraient que `_CHGPRO` et `_SKEY`. Le seul cas différent est la sonde hors tour de P1, où ils montraient seulement `_CHGPRO`, puis `_SKEY`. Quand il était absent, ils montraient `Property_description_FR`, `_MDAT`, `_SKEY`, `_TYPE` et `_UNIT`, plus `_CONV` pour P3 et P3 bis. Le `_TYPE` stocké était toujours `_tem` pour P1 et P2, `_qty` pour P3.

Relevé final en lecture seule, après l'arrêt (`intestactions=edit`, `intestactionsdetail=full`) :

```
Attribut:Test lot21c débit | pageid 587 | revid 1440 2026-10-04T23:44:00Z | protection None | edit: autorisé
Attribut:Test lot21c température 2 | pageid 589 | revid 1442 2026-10-05T16:44:22Z | protection None | edit: ['smw-change-propagation-protection']
Attribut:Test lot21c température 3 | pageid 590 | revid 1443 2026-10-05T16:50:08Z | protection None | edit: autorisé
Attribut:Test lot21c tolérance temp | pageid 591 | revid 1444 2026-10-05T16:54:00Z | protection None | edit: ['smw-change-propagation-protection']
Attribut:Test lot21c tolérance temp 2 | pageid 592 | revid 1445 2026-10-05T17:20:09Z | protection None | edit: autorisé
Attribut:Test lot21c écart température | pageid 593 | revid 1446 2026-10-05T17:30:54Z | protection None | edit: ['smw-change-propagation-protection']
Attribut:Test lot21c écart température 2 | pageid 594 | revid 1447 2026-10-05T17:40:01Z | protection None | edit: ['smw-change-propagation-protection']
```

Les quatre propriétés abandonnées restent verrouillées entre 25 minutes et 1 heure après leur création. Celle de P1 l'était encore à 17 h 45, une heure après.

## Liste des titres sains

Sont sains les titres qui ont franchi les deux volets dans le même tour :

1. `Attribut:Test lot21c débit` (tâche 8, relue : `_qty`, écriture autorisée par `intestactions`)
2. `Attribut:Test lot21c température 3`
3. `Attribut:Test lot21c tolérance temp 2`

Il n'y a pas de titre sain pour l'écart, le libellé ni la puissance. La liste ne compte donc pas six titres, mais trois.

Abandonnés dans cette tâche, et laissés en place comme témoins : `Test lot21c température 2`, `Test lot21c tolérance temp`, `Test lot21c écart température`, `Test lot21c écart température 2`.

## Créations des étapes 4 et 6

Aucune. La tâche s'est arrêtée à l'étape 3. Le fichier `pages/Lot21c_essai_12_pompe.txt` n'a pas été écrit, puisque l'étape 6 n'a pas commencé. Aucune substitution de nom n'a été faite dans `pages/Lot21c_essai_09_grandeur_debit.txt`.

Seul fichier local créé : `pages/Lot21c_essai_11_temperature_2.txt`, conforme à la consigne. Il a servi à P1 et à P1 bis.

## Contrôle final de l'étape 5

Non exécuté, à cause de l'arrêt. Pour les trois titres sains et le témoin, le dernier volet 1 lu avant l'arrêt donne : débit `_qty` (avant la première création), température 3 `_tem` (16:53:48), tolérance temp 2 `_tem` (17:30:43), `Max thickness` `_num` (17:44:31).

## Relevés de l'étape 7

Non exécutés, à cause de l'arrêt.

## Vérifications

a. **Relevé 2 de l'étape 7** : sans objet, l'étape n'a pas été exécutée.

b. **Contenu** : `bin/wiki-verify.sh` a été lancé sur les six pages créées. Les six rendent `IDENTIQUE`, sortie 0 :
   - `Attribut:Test lot21c température 2` contre `pages/Lot21c_essai_11_temperature_2.txt`
   - `Attribut:Test lot21c température 3` contre `pages/Lot21c_essai_11_temperature_2.txt`
   - `Attribut:Test lot21c tolérance temp` contre `pages/Lot21c_essai_03_tolerance_temp.txt`
   - `Attribut:Test lot21c tolérance temp 2` contre `pages/Lot21c_essai_03_tolerance_temp.txt`
   - `Attribut:Test lot21c écart température` contre `pages/Lot21c_essai_04_ecart_temperature.txt`
   - `Attribut:Test lot21c écart température 2` contre `pages/Lot21c_essai_04_ecart_temperature.txt`

c. **Erreurs** : le compte de `[[_ERRC::+]]` est mesuré deux fois.
   - Par `action=ask` (`limit=500`) : 0 résultat.
   - Par un rendu en ligne `{{#ask: [[_ERRC::+]] |format=count}}` (`action=parse`, `title=Accueil`) : `0`.

   Les deux mesures concordent avec le compte d'avant la tâche, et aucun sujet de production n'y figure.

d. **Liens et catégories de la page d'item** : sans objet, la page `Lot21c pompe` n'a pas été créée.

## Les cinq questions

| Question | Réponse | Relevé |
|---|---|---|
| 1 — Le filtre de classe écarte-t-il les sous-objets ? | non tranchée par cette mesure | étapes 6-7 non exécutées |
| 3a — Le couple nombre normalisé plus unité donne-t-il une annotation valide ? | non tranchée par cette mesure | idem |
| 4 — Monolingual text : stockage, requête, affichage par langue ? | non tranchée par cette mesure | idem ; P4 non créée |
| 5 — Un écart porté par Temperature subit-il le décalage d'origine ? | non tranchée par cette mesure | idem ; P3 sans titre sain |
| 6 — Le °F est-il reconnu nativement par Temperature ? | non tranchée par cette mesure | idem. Seul fait établi : `Display units::°C, K, °F` est stocké tel quel en `_UNIT -> ['°C, K, °F']`, et la page de propriété est acceptée sans erreur. Ce relevé ne dit rien de la reconnaissance du °F à la saisie. |

## Ce que le journal dit de l'hypothèse

L'hypothèse de la consigne dit que demander le type d'une propriété avant la fin de sa propagation le fige sur la valeur par défaut.

**Sur le type, elle n'est pas tranchée par cette mesure.** Le protocole a été respecté pour les six tentatives : aucune requête nommant la propriété n'a été émise avant la disparition de `_CHGPRO`. Les six ont rendu le bon typeid à chaque tour. C'est compatible avec l'hypothèse, mais il manque un groupe témoin : aucune propriété n'a été interrogée tôt dans cette tâche. Ce relevé ne permet donc pas de dire que la précaution est ce qui a protégé le type.

**Sur le verrou, le journal la contredit.** Le verrou n'apparaît pas lié au délai de la première requête :
- P2 a été interrogée pour la première fois 1045 s après sa création, `_CHGPRO` disparu depuis 17 minutes, et elle est verrouillée.
- P1 bis a été interrogée à +220 s et elle est saine.
- P3 bis a été interrogée à +88 s et elle est verrouillée.

**La durée de `_CHGPRO` ne départage pas non plus.** Les deux tentatives saines ont gardé `_CHGPRO` entre 136 et 204 s. Trois des quatre tentatives verrouillées l'avaient perdu au premier tour, avant 68 s, mais P3 l'a gardé jusqu'au quatrième tour (271 s) et elle est verrouillée.

Je ne sais pas ce qui distingue les deux tentatives saines des quatre autres. La seule régularité visible est l'alternance stricte : échec, réussite, échec, réussite, échec, échec. Elle ne prouve rien sur six cas.

Conséquence pour la règle inscrite dans CLAUDE.md à l'étape 1 : elle couvre le type faux. Elle ne couvre pas le verrou avec un type juste, qui est le seul mode d'échec observé dans cette tâche.

## Écarts et surprises

1. **Un mode d'échec nouveau, non prévu par la consigne : un verrou durable avec un type juste.** Quatre propriétés neuves sont dans cet état. Il ne correspond ni à l'entrée insérée dans `demandes-adminsys.md` (« figées sur le type par défaut et verrouillées »), ni à la règle de CLAUDE.md (« dont le type résolu est faux »). L'entrée et la règle ont été écrites comme demandé, mais elles sont déjà incomplètes. Le décompte des propriétés verrouillées passe de sept à onze, dont quatre avec un type juste.

2. **Une sonde des faits est partie hors tour sur P1.** À 16:44:29, 7 s après la création, la lecture `--facts` a été lancée dans le même message que la pause en arrière-plan, sans attendre sa fin. C'est la sonde autorisée et elle ne nomme la propriété dans aucune requête de type, mais elle n'a pas été précédée de la pause de 60 s. Elle n'est pas comptée comme un tour. Les autres tentatives n'ont pas eu de sonde hors tour, et P3 bis est verrouillée elle aussi : cette sonde n'explique donc pas l'échec de P1 à elle seule.

3. **La pause entre deux tours de barrière n'était pas fixée par la consigne.** J'ai mis 60 s en arrière-plan, et 120 s entre les tours 2 et 3 de P1. Une partie des écarts entre les tours vient aussi du temps des confirmations : 16 minutes entre le relevé des faits de P2 et son premier tour de barrière, 7 minutes pour P2 bis.

4. **Le verrou ne se dissipe pas avec le temps à l'échelle de cette tâche.** Celui de P1 tenait encore une heure après sa création. Celui de P2 a tenu sur trois tours, de 17 à 26 minutes après sa création.

5. **`volet1.py` a été réécrit.** Celui de la tâche 9 n'était plus présent dans aucun scratchpad. L'encodage est intégral et la lecture a été validée par les deux témoins avant usage.

6. `.claude/settings.local.json`, en fin de tâche : `{"permissions": {"allow": [], "deny": []}}`. Aucune règle. Aucune confirmation hors de la liste annoncée n'a été provoquée. Les scripts du scratchpad (`volet1.py`, `info.py`, `barriere.sh`, `etat.py`) relèvent des enchaînements de lecture et des appels `bin/` prévus, et leur contenu a été affiché avant le lancement.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

**A.** Contexte : la barrière telle qu'elle est définie (les deux volets) élimine des propriétés dont le type est juste, uniquement parce que leur page reste verrouillée. Aucune mesure ne dit encore si ce verrou gêne l'usage d'une propriété dans une page : il gêne l'écriture sur la page de propriété, mais rien n'est connu de son effet sur le stockage des valeurs. Question : le volet 2 reste-t-il éliminatoire ? Suggestion : un essai dans le bac à sable, sur une page employant `Test lot21c tolérance temp` (verrouillée, `_tem`) et `Test lot21c tolérance temp 2` (saine, `_tem`), pour savoir si le verrou seul affecte le stockage. En parallèle, revérifier `intestactions` sur les quatre propriétés dans 24 h, sans rien écrire.

**B.** Contexte : la règle de CLAUDE.md et l'entrée de `demandes-adminsys.md` décrivent un type faux, alors que le seul échec observé ici est un verrou avec un type juste. Question : faut-il les reprendre dans la prochaine consigne ? Suggestion : oui, après la réponse à A. Je ne les ai pas modifiées au-delà du texte prescrit.

**C.** Contexte : P4 (`libellé`, `_mlt_rec`) et P5 (`puissance`, `_num`) n'ont pas été tentées. Question : les reprendre dans une prochaine tâche, avec ou sans le volet 2 ? Suggestion : les créer seules, avec la même attente sur `_CHGPRO`, et relever `intestactions` à intervalles fixes (1, 5, 15 et 60 minutes) pour mesurer la durée du verrou au lieu de seulement constater sa présence.
