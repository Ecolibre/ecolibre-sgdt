# Lot 21, tâche 12 — Deux mesures courtes : rapport

Horodatages en UTC, le 6 octobre 2026.

**En bref.** Mesure A : chez Temperature, c'est la dernière unité déclarée dans Display units qui s'affiche par défaut. Déclarée `K, °C`, la propriété neuve affiche `-15 °C`. Mesure B : le passage de Temperature à Quantity est accepté sur une propriété qui porte une valeur. La valeur stockée passe de `275.15` à `2` sans réécriture de la page porteuse, et la page de propriété se verrouille ensuite.

## Étape 0 — État du dépôt

- `git status --short` : sortie vide, aucune ligne M, A, D, R ni ??.
- `travaux/lot-21-tache12-deux-mesures.md` : absent (`No such file or directory`).
- `.claude/settings.local.json` au début de la tâche : `"allow": []`, `"deny": []`, aucune règle.

## Étape 1 — Mesure A, la propriété neuve

- `bin/wiki-login.sh` : `Success Cywil`.
- Fichier `pages/Lot21c_essai_13_temp_ordre.txt` écrit tel que donné par la consigne.
- `Attribut:Test lot21c temp ordre` : `"missing": true` avant création.
- Création avec `--createonly` : `Success`, **pageid 601, révision 1454, 2026-10-06T11:34:50Z**.

### Journal d'attente

| Tour | Lecture | `_CHGPRO` | `_TYPE` | Verrou |
|---|---|---|---|---|
| 1 | 11:36:36 (+106 s) | absent | direct `_tem` ; `_UNIT` = `K, °C` | présent, `smw-change-propagation-protection` |

L'attente s'est terminée au tour 1 : `_TYPE` direct et `_CHGPRO` absent. Les faits lus étaient `Property_description_FR`, `_MDAT`, `_SKEY`, `_TYPE` et `_UNIT`. Écart de déroulement : la lecture du tour 1 est partie avant que la notification de fin du sleep de 60 s soit arrivée (voir « Écarts et surprises »). Elle a eu lieu 106 s après la création, donc après plus de 60 s.

### Volet 1

Lecture à 11:36:51 de `action=ask&query=[[Test lot21c temp ordre::+]]|?Test lot21c temp ordre|?Max thickness|limit=1&format=json`, `query.printrequests` :

```
{"label":"","typeid":"_wpg",...}
{"label":"Test lot21c temp ordre","typeid":"_tem",...}
{"label":"Max thickness","typeid":"_num",...}
```

**`_tem`**, avec le témoin `_num` dans la même lecture. La propriété est retenue sous son nom, sans reprise. Aucune écriture de contrôle n'a été émise sur elle.

## Mesure A — La page qui l'affiche

- Fichier `pages/Lot21c_essai_14_ordre.txt` écrit tel que donné par la consigne. Le nom n'a pas été suffixé, donc rien n'a été remplacé.
- `Utilisateur:Cywil/Bac à sable/Lot21c ordre` : `"missing": true`, puis création avec `--createonly` : `Success`, **pageid 602, révision 1455, 2026-10-06T11:37:00Z**.
- `bin/wiki-wait-jobs.sh` : « FILE FIGEE a 3 travaux », sortie 2. J'ai poursuivi comme le prévoit la consigne.

### Rendu de A1 (`action=parse&prop=text`, 11:37:24)

| Sujet | Test lot21c temp ordre | Test lot21c temp ordre (#K) | Test lot21c temp ordre (#°C) |
|---|---|---|---|
| Cywil/Bac à sable/Lot21c ordre | **-15 °C** (infobulle : 258,15 K / 5 °F / 464,67 °R) | 258,15 K (infobulle : -15 °C / 5 °F / 464,67 °R) | -15 °C (infobulle : 258,15 K / 5 °F / 464,67 °R) |

Les trois en-têtes de colonne sont rendus avec le même libellé, « Test lot21c temp ordre ».

### Ce qui est stocké (`browsebysubject`)

- `Test_lot21c_temp_ordre` → `258.15`, type 1 (nombre).
- Autres faits : `_ASK`, `_MDAT`, `_SKEY`. Aucune annotation parasite.

### Conclusion de la mesure A

**La colonne sans modificateur affiche des °C : chez Temperature, c'est la dernière unité déclarée dans Display units qui s'affiche par défaut.**

Une autre explication était possible : l'unité de saisie. Ici, la saisie était en °C. La tâche 11 l'écarte déjà : une saisie à `-15 °C` sur `température 3` (`°C, K, °F`) s'y affichait `5 °F`. Une seule hypothèse rend compte des trois cas, celle de la dernière unité.

## Mesure B — Le changement de type

### Point 1 — Verrou avant changement

11:42:16 : `Attribut:Test lot21c tolérance temp 2`, révision 1445, `edit: []`, **libre**.

### Point 2 — Relevé de départ

`--facts` sur la page de propriété : `_TYPE` = `_tem`, `_UNIT` = `°C, K`, `Property_description_FR`, `_MDAT` (2026/10/5 17:20:09), `_SKEY`. Aucun `_CHGPRO`.

`browsebysubject` sur la page pompe, faits Test lot21c :

| Propriété | Valeur brute | Type |
|---|---|---|
| Test_lot21c_débit | 0.00022222222222222 | 1 |
| Test_lot21c_puissance | 96 | 1 |
| Test_lot21c_température_2 | 258.15 | 1 |
| Test_lot21c_température_3 | 258.15 | 1 |
| Test_lot21c_tolérance_temp | 275.15 | 1 |
| **Test_lot21c_tolérance_temp_2** | **275.15** | **1** |
| Test_lot21c_écart_température | 2 | 1 |
| Test_lot21c_écart_température_2 | 2 | 1 |

Conforme à l'attendu : 275.15, type 1.

### Points 3 et 4 — Fichier et diff

`pages/Lot21c_essai_15_tolerance_temp_2_quantity.txt` est écrit tel que donné. Diff entre la page en ligne (`bin/wiki-get.sh`) et ce fichier :

```
1c1,3
< [[Has type::Temperature]]
---
> [[Has type::Quantity]]
> [[Corresponds to::1 °C, degré Celsius]]
> [[Corresponds to::1 K, kelvin]]
3c5
< [[Property_description_FR::Propriété d'essai du lot 21 : un écart de température porté par le type Temperature, pour mesurer si le décalage d'origine lui est appliqué à tort. Ne pas supprimer sans consigne.]]
\ No newline at end of file
---
> [[Property_description_FR::Propriété d'essai du lot 21 : passée du type Temperature au type Quantity alors qu'elle portait déjà une valeur, pour mesurer ce que devient cette valeur et si la page de propriété se verrouille ensuite. Ne pas supprimer sans consigne.]]
```

La ligne `[[Display units::°C, K]]` est inchangée.

### Point 5 — Réponse de l'API

```
"result": "Success", "pageid": 592, "oldrevid": 1445, "newrevid": 1456, "newtimestamp": "2026-10-06T11:42:26Z"
```

Nouvelle révision **1456**, sans refus.

### Point 6 — Attente

`bin/wiki-wait-jobs.sh` : « FILE FIGEE a 5 travaux », sortie 2, puis un sleep de 120 s en arrière-plan, attendu jusqu'à sa notification de fin.

### Point 7 — Relevé après changement (11:45:15)

- `--facts` : `_TYPE` = **`_qty`** ; `_CONV` = `['1 °C, degré Celsius', '1 K, kelvin']` ; `_UNIT` = `°C, K` ; `_MDAT` 2026/10/6 11:42:26 ; **`_CHGPRO` absent**.
- Verrou : **présent**, `smw-change-propagation-protection`, sur la révision 1456.
- Type résolu (`action=ask`, même chaîne qu'à l'étape 1) : `Test lot21c tolérance temp 2` → **`_qty`**, témoin `Max thickness` → `_num`.
- `browsebysubject` sur la page pompe : **`Test_lot21c_tolérance_temp_2` → `2`, type 1**. Les sept autres faits Test lot21c sont inchangés. Le `_MDAT` de la page pompe reste `2026/10/5 20:06:32` : la page n'a pas été réenregistrée. **Aucun `_ERRC`** n'est apparu sur la page pompe.

### Point 8 — Réécriture conditionnelle

**Pas faite.** La valeur relevée au point 7 valait déjà 2. Je n'ai pas créé `pages/Lot21c_essai_16_pompe_v2.txt` et je n'ai pas écrit la page pompe.

### Point 9 — Compilation en direct

`{{#ask: [[Test lot21c tolérance temp 2::2 °C]] |format=debug}}`, rendue avec `title=Accueil` :

- ASK Query, telle que SMW la réécrit : `[[Test lot21c tolérance temp 2::2 K]]`
- `FROM smw_object_ids AS t0`
- `INNER JOIN smw_di_number AS t1 ON t0.smw_id=t1.s_id`
- `WHERE ((t1.o_sortkey='2') AND t1.p_id=1895)`
- Errors and Warnings : None

**La valeur cherchée est `2`.** Avant le changement, cette même recherche cherchait `275.15` (tâche 11). Le `p_id` 1895 est celui qu'avait cette propriété à la tâche 11 : son identifiant interne n'a pas changé.

## Étape 4 — Relevé des verrous (11:45:34 à 11:45:38)

| Titre | Dernière révision | Verrou | Heure |
|---|---|---|---|
| Attribut:Test lot21b débit | 1429 | présent | 11:45:34 |
| Attribut:Test lot21b libellé | 1434 | présent | 11:45:35 |
| Attribut:Test lot21b puissance | 1430 | présent | 11:45:35 |
| Attribut:Test lot21b température | 1431 | présent | 11:45:35 |
| Attribut:Test lot21b tolérance temp | 1432 | présent | 11:45:35 |
| Attribut:Test lot21b écart température | 1433 | présent | 11:45:36 |
| Attribut:Test lot21c débit | 1440 | **absent** | 11:45:36 |
| Attribut:Test lot21c libellé | 1448 | présent | 11:45:36 |
| Attribut:Test lot21c puissance | 1449 | présent | 11:45:36 |
| Attribut:Test lot21c temp ordre *(créée aujourd'hui)* | 1454 | présent | 11:45:37 |
| Attribut:Test lot21c température | 1441 | présent | 11:45:37 |
| Attribut:Test lot21c température 2 | 1442 | présent | 11:45:37 |
| Attribut:Test lot21c température 3 | 1443 | **absent** | 11:45:37 |
| Attribut:Test lot21c tolérance temp | 1444 | présent | 11:45:38 |
| Attribut:Test lot21c tolérance temp 2 | 1456 | **présent (nouveau)** | 11:45:38 |
| Attribut:Test lot21c écart température | 1446 | présent | 11:45:38 |
| Attribut:Test lot21c écart température 2 | 1447 | présent | 11:45:38 |

La liste vient de `list=allpages`, espace 102, préfixe `Test lot21` : 17 pages, dont 16 existaient avant la tâche.

**Aucun verrou ne s'est levé** depuis le relevé de la tâche 11 (20:08:39 le 5 octobre). Les six `lot21b` sont verrouillées depuis environ 37 h 20. **Un verrou nouveau** est apparu sur `tolérance temp 2`, après le changement de type. Elle était libre à 11:42:16 et verrouillée à 11:45:15. La propriété neuve `temp ordre` est verrouillée depuis sa première lecture. Il reste deux pages libres : `lot21c débit` et `lot21c température 3`.

## Vérifications

**a. Celle qui tranche.**
- Mesure A : le rendu de A1. La colonne sans modificateur affiche `-15 °C`.
- Mesure B : le dernier `browsebysubject` sur la page pompe (11:45:15). `Test_lot21c_tolérance_temp_2` → `2`, type 1. Comme la page pompe n'a pas été réécrite, c'est aussi le dernier relevé de cette page.

**b. Contenu** (`bin/wiki-verify.sh`) :
- `Attribut:Test lot21c temp ordre` ↔ `pages/Lot21c_essai_13_temp_ordre.txt` : IDENTIQUE, sortie 0.
- `Utilisateur:Cywil/Bac à sable/Lot21c ordre` ↔ `pages/Lot21c_essai_14_ordre.txt` : IDENTIQUE, sortie 0.
- `Attribut:Test lot21c tolérance temp 2` ↔ `pages/Lot21c_essai_15_tolerance_temp_2_quantity.txt` : IDENTIQUE, sortie 0.

**c. Erreurs** `[[_ERRC::+]]` :
- par `action=ask` : 1 sujet, `Utilisateur:Cywil/Bac à sable/Lot21c pompe#saisie-douteux` ;
- par rendu en ligne `format=count` : `1`.

Aucun sujet nouveau, et aucun sujet de production.

**d. Liens de la page pompe.** Sans objet : la page pompe n'a pas été réécrite.

## Réponses

**Mesure A.** Chez Temperature, c'est la **dernière** unité de Display units qui s'affiche par défaut. On en a maintenant trois cas : `°C, K, °F` affiche des °F, `°C, K` des K, et `K, °C` des °C. Chez Quantity, on a mesuré un seul cas d'affichage, à la tâche 11 : `écart température`, déclarée `°C, K`, affiche des °C, donc la première unité. Cette tâche apporte un indice de plus, sans le trancher. Dans la compilation debug de la propriété passée en Quantity (`°C, K`, les deux unités au facteur 1), SMW réécrit la condition `2 °C` en `2 K`, c'est-à-dire dans la dernière unité. Je ne sais pas si la réécriture d'une condition dans le debug suit la même règle que l'affichage d'une colonne. L'affichage de cette propriété en Quantity n'a pas été mesuré.

**Mesure B.**
- **Accepté ?** Oui : révision 1456, `Success`. La propriété était libre au moment de l'écriture.
- **Que devient la valeur ?** Elle passe de `275.15` à `2`, type 1, et une recherche sur `2 °C` cherche maintenant `2`. SMW a recalculé la valeur depuis la saisie `2 °C` de la page porteuse. Le `p_id` est conservé (1895).
- **Une réécriture de la page porteuse est-elle nécessaire ?** Non, dans ce cas. La valeur était déjà juste à 11:45:15, moins de trois minutes après le changement, et le `_MDAT` de la page pompe n'a pas bougé. La propagation de SMW a fait le travail.
- **La page de propriété se verrouille-t-elle ensuite ?** Oui : `smw-change-propagation-protection` est présent à 11:45:15 et encore à 11:45:38. Aucun des verrous observés depuis la tâche 10 ne s'est levé. On ne peut donc pas compter sur un nouveau changement de cette page avant une intervention côté serveur. Le type résolu, lui, est juste (`_qty`).

## Écarts et surprises

1. **Lecture du tour 1 partie avant la notification de fin du sleep.** J'ai lancé le sleep de 60 s en arrière-plan, puis la lecture du tour 1 sans attendre sa notification. La lecture a eu lieu 106 s après la création, donc au-delà d'une minute, et elle ne nommait la propriété que par `--facts` et `intestactions`, les deux lectures autorisées. Le résultat n'est pas faussé, mais le protocole n'a pas été suivi à la lettre. La pause de 120 s de l'étape 3 a été attendue correctement.
2. **Le nombre de pages annoncé par la consigne est faux.** La consigne parle des « douze pages Attribut:Test lot21b et Attribut:Test lot21c existantes ». Il y en avait **seize** avant cette tâche (six `lot21b`, dix `lot21c`), comme au relevé de la tâche 11, et dix-sept après. La consigne annonçait aussi, côté `lot21c`, trois pages libres et « les huit autres » verrouillées. Il y en avait sept verrouillées, pour dix `lot21c` au total.
3. **Le changement de type pose un verrou.** C'est cohérent avec ce qu'on sait des créations, mais la consigne ne l'annonçait pas. C'est désormais un fait mesuré : modifier le type d'une propriété libre la verrouille aussitôt.
4. **Réécriture de la condition dans le debug :** `2 °C` devient `2 K` dans la ligne ASK Query. Voir la réponse à la mesure A.
5. `bin/wiki-wait-jobs.sh` a annoncé « FILE FIGEE » deux fois, à 3 puis à 5 travaux. C'était attendu d'après la consigne et CLAUDE.md.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

**A.** Contexte : chez Temperature, l'unité affichée par défaut est la dernière de Display units. Pour une température de production qui doit s'afficher en °C, il faudrait donc déclarer `K, °C` (ou `K, °F, °C`), au rebours de l'intuition. Question : faut-il consigner cette règle dans *Limites connues du SGDT* et dans le *Récapitulatif technique* ? Suggestion : oui, en une entrée, avec les trois cas mesurés, en précisant qu'elle n'est établie que pour Temperature.

**B.** Contexte : chez Quantity, un seul cas d'affichage est mesuré (`°C, K` affiche des °C), et le debug de cette tâche réécrit `2 °C` en `2 K`. Question : faut-il une mesure courte de plus, avant de fixer l'ordre des Display units des écarts et tolérances en production ? Elle consisterait à afficher `tolérance temp 2`, désormais Quantity `°C, K`, dans une colonne sans modificateur. Suggestion : oui. Elle se ferait sans écriture, par un rendu en ligne `action=parse` d'une requête sur cette propriété.

**C.** Contexte : un changement de type verrouille la page de propriété, et aucun verrou ne s'est levé en 37 h. Question : en production, faut-il considérer que le type et les Display units d'une propriété sont figés dès la première écriture qui les modifie ? Suggestion : oui, tant que la migration Scaleway n'a pas permis d'examiner le verrou côté serveur. Chaque page de propriété devrait donc être définitive dès sa première version, unités comprises.
