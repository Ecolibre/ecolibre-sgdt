# Lot 13 — Tâche 3c : le lot 12 et les sept pages courtes

**Exécuté le :** 2 septembre 2026 (11h11-11h19 UTC environ), session Claude
Code, compte `Cywil`. Session ouverte par `bin/wiki-login.sh` avant toute
écriture. Chaque page a été relue par `wiki-get.sh` immédiatement avant
transformation, et comparée par `diff` à la copie faite en tout début de
tâche : les huit `diff` sont sortis vides, aucune dérive entre la lecture et
l'écriture.

---

## Étape 1 — Les sept renommages

Sept appels `bin/wiki-move.sh`, redirection conservée par défaut (le script
ne pose jamais `--noredirect`), tous `redirectcreated: true` :

| Ancien titre | Nouveau titre | Résultat |
|---|---|---|
| Lot — Navigation | Lot 14 — Navigation | `redirectcreated: true` |
| Lot — Images | Lot 15 — Images | `redirectcreated: true` |
| Lot — Corrections du module de références | Lot 16 — Corrections du module de références | `redirectcreated: true` |
| Lot — Arbre fonctionnel | Lot 17 — Arbre fonctionnel | `redirectcreated: true` |
| Lot — Arborescence des domaines de pratique | Lot 18 — Arborescence des domaines de pratique | `redirectcreated: true` |
| Lot — Vocabulaire et multilingue | Lot 19 — Vocabulaire et multilingue | `redirectcreated: true` |
| Lot — External Data | Lot 20 — External Data | `redirectcreated: true` |

**Vérification des quatorze titres** (`action=query&prop=info`, en deux
appels groupés) : les sept nouveaux titres existent avec un contenu
(`length` > 0, pas de clé `redirect`), les sept anciens existent comme
redirections (`redirect: true`, `length` de 34 à 65 caractères). Aucune
redirection supprimée.

## Contenu d'origine des huit pages, avant transformation

### Lot 12 — Contenants et étiquetage

```
'''Cadrage du lot 12. Séparer contenir de composer, inventorier les contenants, et rendre décidable par la base ce qui repose aujourd'hui sur la mémoire.'''

== État ==

'''À créer.''' Cadrage rédigé le 30 août 2026, arbitrages issus de la conversation de clôture du lot 10.

== Objet ==

Séparer contenir de composer, deux relations que <code>Part_of</code> porte aujourd'hui indistinctement. [...]

== Dépendances ==
[...]

== Ce qui est tranché ==
[...treize puces...]

== Ce qui reste à trancher ==
[...quatre puces...]

== Périmètre ==
[...]

== Point de départ ==
[...]

== Risques connus ==
[...]

== Rapports ==

À remplir à la clôture. [...]

----

Voir aussi la [[Gestion des lots]], la [[Feuille de route du Système de Gestion de Données Techniques]] et les [[Limites connues du Système de Gestion de Données Techniques]].
```

*(Contenu intégral joint tel que lu — non tronqué dans l'écriture réelle du
fichier ; les `[...]` ci-dessus servent uniquement à alléger ce rapport, la
transformation elle-même a porté sur le texte complet.)* Sections avant
transformation, dans l'ordre : État, Objet, Dépendances, Ce qui est tranché,
Ce qui reste à trancher, Périmètre, Point de départ, Risques connus,
Rapports.

### Lot 14 — Navigation (alors « Lot — Navigation »)

```
'''Rendre le voisinage d'un item accessible sans changer de page : la page s'ouvre courte, le voisinage se déplie au clic.'''

''Ce lot n'a pas encore de numéro : il lui sera attribué à son ouverture.''

== État ==

À cadrer. Éléments réunis le 31 août 2026 au fil du lot 10. Le cadrage complet — périmètre, point de départ, risques — s'écrit à l'ouverture du lot, contre l'état du wiki de ce jour-là.

== Objet ==

Rendre le voisinage d'un item accessible sans changer de page. Une page s'ouvre courte, et le voisinage se déplie au clic.

== Ce qui est déjà tranché ==
[...sept puces...]

== Ce qui est écarté, et pourquoi ==
[...une puce...]

== Dépendances ==

Aucune.

----

Voir aussi la [[Gestion des lots]].
```

Sections avant : État, Objet, Ce qui est déjà tranché, Ce qui est écarté et
pourquoi, Dépendances.

### Lot 15 — Images (alors « Lot — Images »)

```
'''Choisir l'image principale d'un item parmi plusieurs, à tous les niveaux de la chaîne, et savoir quelles images existent pour un item.'''

''Ce lot n'a pas encore de numéro : il lui sera attribué à son ouverture.''

== État ==

À cadrer. [même texte type que Navigation]

== Objet ==

Choisir l'image principale d'un item parmi plusieurs, à tous les niveaux de la chaîne, et savoir quelles images existent pour un item.

== Ce qui est déjà tranché ==
[...quatre puces...]

== Ce qui est écarté, et pourquoi ==
[...une puce...]

== Dépendances ==

InstantCommons rendrait le lot plus utile sans le conditionner. Aucune demande n'est déposée à ce jour.

----

Voir aussi la [[Gestion des lots]].
```

Sections avant : État, Objet, Ce qui est déjà tranché, Ce qui est écarté et
pourquoi, Dépendances.

### Lot 16 — Corrections du module de références (alors « Lot — Corrections du module de références »)

```
'''Rendre l'audit des références Base 36 fiable — détecter les doublons, et distinguer une référence retirée d'une référence jamais utilisée.'''

''Ce lot n'a pas encore de numéro : il lui sera attribué à son ouverture.''

== État ==

À cadrer. [même texte type]

== Objet ==

Rendre l'audit des références Base 36 fiable — détecter les doublons, et distinguer une référence retirée d'une référence jamais utilisée.

== Ce qui est déjà tranché ==
[...trois puces...]

== Ce qui est écarté, et pourquoi ==

Aucun écart consigné à ce jour.

== Dépendances ==

Attend le lot 12, qui définit l'état de cycle de vie et la date d'étiquette.

----

Voir aussi la [[Gestion des lots]].
```

Sections avant : État, Objet, Ce qui est déjà tranché, Ce qui est écarté et
pourquoi, Dépendances.

### Lot 17 — Arbre fonctionnel (alors « Lot — Arbre fonctionnel »)

```
'''Rattacher les items fonctionnels jusqu'à une racine, en autorisant plusieurs troncs.'''

''Ce lot n'a pas encore de numéro : il lui sera attribué à son ouverture.''

== État ==

À cadrer. [même texte type]

== Objet ==

Rattacher les items fonctionnels jusqu'à une racine, en autorisant plusieurs troncs.

== Ce qui est déjà tranché ==
[...trois puces...]

== Ce qui est écarté, et pourquoi ==

Aucun écart consigné à ce jour.

== Dépendances ==

Aucune en amont. Le lot 12 a besoin d'y loger une fonction de rangement.

----

Voir aussi la [[Gestion des lots]].
```

Sections avant : État, Objet, Ce qui est déjà tranché, Ce qui est écarté et
pourquoi, Dépendances.

### Lot 18 — Arborescence des domaines de pratique (alors « Lot — Arborescence des domaines de pratique »)

```
'''Hiérarchiser les domaines de pratique, aujourd'hui une liste plate, en autorisant plusieurs troncs.'''

''Ce lot n'a pas encore de numéro : il lui sera attribué à son ouverture.''

== État ==

À cadrer. [même texte type]

== Objet ==

Hiérarchiser les domaines de pratique, aujourd'hui une liste plate, en autorisant plusieurs troncs.

== Ce qui est déjà tranché ==
[...trois puces...]

== Ce qui est écarté, et pourquoi ==

Aucun écart consigné à ce jour.

== Dépendances ==

Recoupe le lot Vocabulaire, qui pose la même question de type.

----

Voir aussi la [[Gestion des lots]].
```

Sections avant : État, Objet, Ce qui est déjà tranché, Ce qui est écarté et
pourquoi, Dépendances.

### Lot 19 — Vocabulaire et multilingue (alors « Lot — Vocabulaire et multilingue »)

```
'''Décider si les vocabulaires ouverts restent des chaînes françaises ou deviennent des pages porteuses de libellés.'''

''Ce lot n'a pas encore de numéro : il lui sera attribué à son ouverture.''

== État ==

À cadrer. [même texte type]

== Objet ==

Décider si les vocabulaires ouverts restent des chaînes françaises ou deviennent des pages porteuses de libellés.

== Ce qui est déjà tranché ==
[...cinq puces...]

== Ce qui est écarté, et pourquoi ==

Aucun écart consigné à ce jour.

== Dépendances ==

Le chantier des grandeurs et unités conçoit le même motif — grandeurs et unités en pages porteuses d'attributs. Ne pas résoudre deux fois le même problème, différemment.

----

Voir aussi la [[Gestion des lots]].
```

Sections avant : État, Objet, Ce qui est déjà tranché, Ce qui est écarté et
pourquoi, Dépendances.

### Lot 20 — External Data (alors « Lot — External Data »)

```
'''Lire des sources externes, dont Wikidata, depuis le wiki.'''

''Ce lot n'a pas encore de numéro : il lui sera attribué à son ouverture.''

== État ==

À cadrer. [même texte type]

== Objet ==

Lire des sources externes, dont Wikidata, depuis le wiki.

'''Attention de conception.''' Une image ou une valeur tirée en direct de Wikidata n'est pas une donnée du SGDT. Elle change sans que personne ici l'ait décidé. Acceptable pour une illustration, à peser pour le reste.

== Ce qui est déjà tranché ==
[...cinq puces...]

== Ce qui est écarté, et pourquoi ==

Aucun écart consigné à ce jour.

== Dépendances ==

Après le miroir local, parce que le lot installe une extension et modifie la configuration du site.

----

Voir aussi la [[Gestion des lots]].
```

Sections avant : État, Objet, Ce qui est déjà tranché, Ce qui est écarté et
pourquoi, Dépendances.

## Étape 2 — La transformation

Pour les huit pages, appel du modèle inséré en tête, hero en gras supprimé,
`== État ==` supprimée. Pour les sept pages courtes, son texte a été déplacé
verbatim dans une nouvelle section `== Point de départ ==` ; pour le lot 12,
qui possédait déjà cette section, le texte d'`== État ==` a été écarté sans
être déplacé (conformément à la consigne), et sa `== Point de départ ==`
d'origine reste intacte.

`== Objet ==` supprimée sur les six pages où son texte ne fait que reprendre
le hero (14, 15, 16, 17, 18, 19 — y compris Navigation, dont la reformulation
ne change rien au sens). Conservée sur le lot 12 (l'Objet développe trois
paragraphes, sans rapport de simple reprise). Sur le lot 20, la phrase de
reprise a été supprimée et le paragraphe « Attention de conception » déplacé
sous une nouvelle section `== Risques connus ==`, comme prescrit par
l'exception du lot 20.

`Ce qui est tranché` → `Ce qui est déjà tranché` et `Ce qui reste à
trancher` → `Points ouverts` sur le lot 12 uniquement, texte inchangé.
Toutes les autres sections (`Ce qui est écarté, et pourquoi`, `Dépendances`,
`Périmètre`, `Risques connus`, `Rapports`, pied de page) conservées à
l'identique, contenu et texte, avec réordonnancement selon la consigne :
Objet, Ce qui est déjà tranché, Ce qui est écarté, Dépendances, Périmètre,
Point de départ, Risques connus, Points ouverts, Rapports (chaque page ne
porte que le sous-ensemble de ces sections qu'elle avait déjà, plus « Point
de départ » et, pour le lot 20, « Risques connus »).

## Étape 3 — Les huit écritures

| Page | pageid | oldrevid → newrevid | Résumé |
|---|---|---|---|
| Lot 12 — Contenants et étiquetage | 485 | 1127 → 1209 | `[Lot 13][Tâche 3c] Transformation en classe Lot — insertion du modèle, État déplacé/supprimé, sections renommées et réordonnées` |
| Lot 14 — Navigation | 486 | 1195 → 1210 | `[Lot 13][Tâche 3c] Transformation en classe Lot — insertion du modèle, État déplacé en Point de départ, Objet supprimé (redondant avec le modèle)` |
| Lot 15 — Images | 487 | 1197 → 1211 | idem |
| Lot 16 — Corrections du module de références | 488 | 1199 → 1212 | idem |
| Lot 17 — Arbre fonctionnel | 489 | 1201 → 1213 | idem |
| Lot 18 — Arborescence des domaines de pratique | 490 | 1203 → 1214 | idem |
| Lot 19 — Vocabulaire et multilingue | 491 | 1205 → 1215 | idem |
| Lot 20 — External Data | 492 | 1207 → 1216 | `[Lot 13][Tâche 3c] Transformation en classe Lot — insertion du modèle, État déplacé en Point de départ, paragraphe Attention de conception déplacé en Risques connus` |

Les huit appels ont rendu `result: Success`. Conformément à la consigne du
lot (« `result: Success` ne prouve rien »), ce résultat n'a pas été retenu
comme preuve : les six contrôles ci-dessous portent sur l'état réellement
lu après écriture.

## Étape 4 — Les six contrôles

**1. `browsebysubject`, `ns=0`, sur les huit pages — une seule valeur par
phrase d'objet.** Chacune des huit porte exactement un `Work_package_summary`,
correspondant mot pour mot à la phrase donnée en consigne. Aucune valeur
dédoublée, aucun fragment de code wikitexte échappé dans la valeur.

**2. Les six relations.** Toutes lues dans les mêmes relevés `browsebysubject` :

* `Lot 16` → `Work_package_depends_on -> Lot_12_—_Contenants_et_étiquetage#0##`
* `Lot 20` → `Work_package_depends_on -> Lot_22_—_Miroir_local#0##`
* `Lot 17` → `Work_package_revises -> Lot_10_—_Procédés_et_outils#0##`
* `Lot 12` → `Work_package_overlaps -> Lot_17_—_Arbre_fonctionnel#0##`
* `Lot 18` → `Work_package_overlaps -> Lot_19_—_Vocabulaire_et_multilingue#0##`
* `Lot 19` → `Work_package_overlaps -> Lot_21_—_Grandeurs_et_unités#0##`

Les six relations sont stockées comme attendu. `Lot 21` et `Lot 22`
n'existent pas (`action=query&prop=info` non relancé spécifiquement ici,
mais aucune page de ces titres n'a été créée par cette tâche — conforme à
la consigne « ne crée pas les pages »).

**3. `action=parse` sur le lot 12 et sur le lot 10 — requêtes inverses.**

Lot 12, table « Lots qui dépendent de celui-ci » : une ligne,
`Lot 16 — Corrections du module de références`, état `identifié`.

Lot 10, table « Lots qui le révisent » : une ligne,
`Lot 17 — Arbre fonctionnel`, état `identifié`.

Les deux tables rendent un vrai résultat, pas le message `default=`
d'absence vu en tâche 2 sur les données fictives — premier essai réussi des
requêtes inverses du modèle avec de vraies pages de lot.

**4. `Catégorie:Lot` — vingt membres.**
`action=query&list=categorymembers&cmtitle=Catégorie:Lot&cmlimit=500` :
exactement vingt titres, les onze lots 1-11 (tâche 3b) plus le lot 13
(tâche 3a) plus le lot 12 et les sept lots 14-20 (cette tâche). Compte
conforme.

**5. Aucune section perdue.** Comparaison des titres de section avant/après
pour les huit pages :

* Lot 12 : disparition d'`État` (attendue, texte écarté) ; `Ce qui est
  tranché` et `Ce qui reste à trancher` ne disparaissent pas, elles sont
  renommées (`Ce qui est déjà tranché`, `Points ouverts`) — texte identique
  sous nouveau titre, pas une perte. `Objet`, `Dépendances`, `Périmètre`,
  `Point de départ`, `Risques connus`, `Rapports` : toutes présentes après
  transformation.
* Les six pages 14-19 : disparition d'`État` (attendue, déplacée en `Point
  de départ`) et d'`Objet` (attendue, redondante avec le hero et donc avec
  le modèle). `Ce qui est déjà tranché`, `Ce qui est écarté, et pourquoi`,
  `Dépendances` : toutes présentes.
* Lot 20 : mêmes disparitions attendues qu'au-dessus, plus la disparition du
  texte de reprise à l'intérieur d'`Objet` — le paragraphe « Attention de
  conception » n'a pas disparu, il vit désormais sous une nouvelle section
  `Risques connus`.

Aucune disparition en dehors des cas `État`/`Objet` prévus par la consigne.

**6. Aucune annotation parasite.** `browsebysubject` sans filtre sur les
huit pages (relevé au point 1 et 2 ci-dessus) ne retourne, en dehors des
propriétés `Work_package_*` attendues, que `_ASK`, `_INST`, `_MDAT`, `_SKEY`
— les quatre clés internes SMW habituelles, toutes soulignées. Contrôle
complété par `prop=categories` sur les huit pages : chacune ne porte que
`Catégorie:Lot`, aucune catégorie de suivi de lien cassé ou de fichier
manquant — les blocs `<code>...</code>` conservés tels quels dans les
sections reprises (`Part_of`, `Located_at`, etc.) ne contiennent aucun
`[[ ]]` ni fonction d'analyseur, donc rien à échapper ; le risque documenté
dans `CLAUDE.md` (`<code>` n'échappe rien) ne s'est pas matérialisé ici
parce qu'aucun de ces blocs ne portait de syntaxe active, contrairement aux
cas cités en leçon.

---

## Écarts et surprises

**1. La phrase italique « Ce lot n'a pas encore de numéro » n'est mentionnée
nulle part dans la consigne, et a donc été laissée telle quelle sur les sept
pages courtes — alors qu'elle est désormais fausse.** Les sept pages
portent maintenant un numéro, à la fois dans le titre et dans
`Work_package_number` du modèle. La consigne énumère précisément sept
opérations de transformation (insertion du modèle, suppression du hero,
sort d'`État`, sort d'`Objet`, deux renommages de section propres au lot 12,
conservation du reste, réordonnancement) et ne cite jamais cette phrase.
Par prudence — « une transformation, pas une réécriture », « ne reformule
rien » — elle n'a pas été retirée sans instruction explicite. Le résultat
est que les sept pages affichent maintenant, l'une sous l'autre, un tableau
qui donne un numéro et une phrase qui dit qu'il n'y en a pas encore. À
trancher par Cyril : soit une correction `[Correctif]` en sept écritures
si la phrase doit disparaître, soit elle reste et son texte se lit comme
un vestige volontaire du gabarit d'origine.

**2. Le lot 12 n'a pas de section « Ce qui est écarté, et pourquoi ».** La
consigne cite cette section dans la liste des choses à conserver et dans
l'ordre final, mais ne l'exigeait pas sur toutes les pages : elle a été
purement absente du texte d'origine du lot 12, donc absente aussi du texte
transformé. Rien à signaler au-delà de cette absence déjà présente avant la
tâche.

**3. Aucune des relations vers les lots 21 et 22 n'a créé de lien rouge
supplémentaire imprévu.** Les liens `Lot 21 — Grandeurs et unités` et
`Lot 22 — Miroir local` sont rouges comme annoncé par la consigne ; aucune
page n'a été créée pour eux, conformément à l'instruction.

**4. Aucun écart avec `result: Success`.** Les huit écritures ont réussi et
les six contrôles, menés indépendamment du code de retour de l'API,
confirment chacun l'état attendu — aucune divergence entre ce que l'API a
annoncé et ce que la lecture après coup a montré.
