# Lot 21, tâche 23 — Fusion, puis reprise de sept phrases

Session du 14 octobre 2026. Environnement Claude Code hébergé (cloud), branche `ccr-ad6f0bcb-wsc18c`, session wiki ouverte par `bin/wiki-login.sh` sous le compte `Cywil` (id 4). Une seule écriture sur le wiki, sur `Lot 21 — Grandeurs et unités` : révision 1598 → 1602, le 14 octobre 2026 à 11:05:18 UTC.

## Étape 0 — Fusion et poussée

**1.** `git status` au début :

```
On branch ccr-ad6f0bcb-wsc18c
Your branch is up to date with 'origin/ccr-ad6f0bcb-wsc18c'.

nothing to commit, working tree clean
```

Branche courante : `ccr-ad6f0bcb-wsc18c`. Aucune ligne M, A, D ou R.

**2.** `git fetch origin` :

```
From https://github.com/Ecolibre/ecolibre-sgdt
 * [new branch]      claude/clever-clarke-o1jkjc -> origin/claude/clever-clarke-o1jkjc
 * [new branch]      claude/great-fermi-orlfk0 -> origin/claude/great-fermi-orlfk0
 * [new branch]      claude/magical-mayer-lm5dk7 -> origin/claude/magical-mayer-lm5dk7
```

`origin/main` était toujours en `470d20e`, comme la veille. La branche avait en propre `b23c8a3`, le commit de la tâche 22 ; `main` avait en propre `470d20e`. Leur ancêtre commun est `5dee059`.

**3.** Fusion :

```
git merge --no-edit -m "[Lot 21][Tâche 23] Fusion de origin/main (470d20e, rapport de saisie) avant poussée" -m "Co-Authored-By: … Claude-Session: …" origin/main
Merge made by the 'ort' strategy.
 travaux/saisie-2026-10-13-rayons-et-norme.md | 173 +++++++++++++++++++++++++++
 1 file changed, 173 insertions(+)
 create mode 100644 travaux/saisie-2026-10-13-rayons-et-norme.md
```

La fusion s'est faite sans conflit et n'apporte que le rapport de saisie. **Commit de fusion : `b4d753d`** (`b4d753dce3ba4a98c9b6d91c436ed0962f9cd7b1`).

```
*   b4d753d [Lot 21][Tâche 23] Fusion de origin/main (470d20e, rapport de saisie) avant poussée
|\
| * 470d20e [Saisie] Rapport : rayon G12 L74, page de norme des jauges, ménage de branches refusé
* | b23c8a3 [Lot 21][Tâche 22] Page du lot : arbitrages rendus, syntaxe de requête mesurée, l'unité appartient à une dimension
|/
* 5dee059 [Lot 21][Tâche 21] Rapport : trois mesures faites, remontée par Has subobject sans signe moins, comparateur non strict
```

**4.** `git push origin HEAD:main`, sans forcer :

```
To https://github.com/Ecolibre/ecolibre-sgdt
   470d20e..b4d753d  HEAD -> main
```

**5.** La poussée a réussi au premier essai, sans reprise. Le travail de la tâche 22 (`b23c8a3`) est désormais sur `main`, par le commit de fusion `b4d753d`. La branche de session a ensuite été poussée aussi (`b23c8a3..b4d753d`).

`travaux/lot-21-tache23-reprise.md` n'existait pas (`ls` : « No such file or directory »).

`.claude/settings.local.json` était absent au début et l'est encore à la fin (`ls -la .claude/` ne montre que `commands/` et `settings.json`). Il ne porte donc aucune règle.

## Révision de départ de la page

Lecture `prop=info|revisions`, à 11:03:33 UTC :

```
"pageid": 532, "title": "Lot 21 — Grandeurs et unités", "lastrevid": 1598, "length": 35477,
"touched": "2026-10-14T10:50:18Z", "protection": [], "actions": {"edit": []}
"revid": 1598, "parentid": 1478, "user": "Cywil", "timestamp": "2026-10-14T10:50:18Z",
"comment": "[Lot 21][Tâche 22] Arbitrages rendus, syntaxe de requête mesurée, l'unité appartient à une dimension"
```

La révision de départ est **1598**, comme l'annonce la consigne. La page n'a aucune protection native, et `intestactions` ne signale aucun empêchement d'écriture. Le wikitexte récupéré dans `pages/Lot_21.txt` fait 35 477 octets. `git status` n'a ensuite signalé aucune modification : la copie du dépôt était déjà la révision 1598.

Ancres, comptées avant toute modification par un script de lecture (`ancres23.py`, contenu affiché dans le terminal avant son lancement) :

```
1.1 lignes commençant par l'ancre : [61] | occurrences : 1 | section : ['La conception arrêtée']
1.2 lignes commençant par l'ancre : [67] | occurrences : 1 | section : ['La conception arrêtée']
1.3 lignes commençant par l'ancre : [69] | occurrences : 1 | section : ['La conception arrêtée']
1.4 lignes commençant par l'ancre : [71] | occurrences : 1 | section : ['La conception arrêtée']
1.5 lignes commençant par l'ancre : [45] | occurrences : 1 | section : ['Ce qui est déjà tranché']
1.6 lignes commençant par l'ancre : [81] | occurrences : 1 | section : ['La conception arrêtée']
1.7 lignes égales à l'ancre : [145] | occurrences : 1 | section : ['Point de départ']
lignes : 164 | U+00A0 : 0 | U+202F : 0
```

Chaque ancre est présente une fois et une seule, et 1.7 est bien dans « Point de départ ». Les sept remplacements ont été appliqués à `pages/Lot_21.txt` par l'outil d'édition de fichier, qui refuse un texte d'origine absent ou multiple. La révision a été relue à 11:05:12 UTC, juste avant l'écriture : toujours 1598. Écriture :

```
bin/wiki-put.sh "Lot 21 — Grandeurs et unités" pages/Lot_21.txt "[Lot 21][Tâche 23] Sept phrases alignées sur la dimension et sur les rôles arrêtés"
→ "result": "Success", "pageid": 532, "oldrevid": 1598, "newrevid": 1602, "newtimestamp": "2026-10-14T11:05:18Z"
```

## Diff complet

Le diff ci-dessous est la sortie de `diff -u` entre la copie de la révision 1598 et `pages/Lot_21.txt` tel qu'il a été écrit. Seules les deux lignes d'en-tête de fichier sont retirées. La page passe de 35 477 à 36 266 octets.

```diff
@@ -42,7 +42,7 @@
 
 '''Une tolérance de température n'emploie pas le type Temperature.''' Mesuré le 5 octobre 2026 : ce type applique le décalage d'origine à un écart comme à une valeur absolue, et une tolérance de 2 °C y est stockée 275,15 sans la moindre erreur (entrée 60 des Limites connues). Une température absolue emploie Temperature, qui gère aussi le degré Fahrenheit nativement ; un écart, une tolérance ou une plage emploie Quantity avec le degré Celsius et le kelvin au facteur 1. La mesure reste exacte, sa conclusion est dépassée depuis le 8 octobre 2026 : une tolérance se stockant en deux bornes absolues, il n'existe plus d'écart à porter, et une borne est une température ordinaire, de type Temperature. Voir « La conception arrêtée ».
 
-'''L'ordre des unités d'affichage s'écrit à l'envers selon le type.''' Chez Quantity, la première unité déclarée s'affiche ; chez Temperature, la dernière (entrée 61 des Limites connues). Une température absolue qui doit s'afficher en degrés Celsius se déclare donc <code>Display units::K, °C</code>. Les deux règles étant inverses, la page de grandeur devra porter les déclarations toutes faites, à recopier : personne ne retiendra une règle inversée.
+'''L'ordre des unités d'affichage s'écrit à l'envers selon le type.''' Chez Quantity, la première unité déclarée s'affiche ; chez Temperature, la dernière (entrée 61 des Limites connues). Une température absolue qui doit s'afficher en degrés Celsius se déclare donc <code>Display units::K, °C</code>. Les deux règles étant inverses, la page de dimension devra porter les déclarations toutes faites, à recopier : personne ne retiendra une règle inversée.
 
 == La conception arrêtée ==
 
@@ -58,17 +58,17 @@
 
 '''Le mode est porté par une propriété, <code>Characteristic mode</code>, en énumération fermée à deux valeurs : spécification et mesure.''' Une catégorie ne conviendrait pas, un sous-objet n'en portant pas (mesuré le 5 octobre 2026). Deux valeurs seulement : la provenance d'une mesure, son incertitude et la façon dont elle a été obtenue relèvent du [[Lot 31 — Qualification des données et confiance entre pairs|lot 31]], et une énumération fermée est ce qu'il y a de plus coûteux à enrichir une fois le verrou posé (entrée 65).
 
-'''Un rôle distingue deux valeurs de la même grandeur sur le même item.''' Nominal, extérieur, intérieur, maximal admissible. Porté par le sous-objet. Son vocabulaire et sa forme restent à arrêter.
+'''Un rôle distingue deux valeurs de la même grandeur sur le même item.''' Nominal, extérieur, intérieur, hors tout, utile, maximal admissible, minimal admissible. Porté par le sous-objet, et par une page de vocabulaire, non par une énumération fermée. Arrêté le 13 octobre 2026 : voir « Le vocabulaire des rôles est porté par des pages ».
 
 '''Un rattachement distingue ce qui caractérise une partie de l'item.''' Le diamètre de l'orifice d'aspiration est le diamètre d'un orifice, pas de la pompe. Un sous-objet peut porter un rattachement ; la définition de ces entités relève du [[Lot 12 — Contenants et étiquetage|lot 12]], et le lot 21 se borne à ménager la place.
 
 '''Une tolérance se stocke en deux bornes absolues, jamais en écart.''' Un mécanicien écrit « 20 ±0,1 », « 20 -0,1/+0,2 » ou « H7 » : trois écritures de la même chose. Le formulaire les accepte toutes et fait la soustraction ; le sous-objet porte la valeur et les deux bornes calculées. Une requête devient alors directe, et la question du décalage d'origine des températures s'évanouit, une borne absolue étant une température absolue. La forme d'origine est conservée telle quelle dans un champ de texte à côté, parce qu'un dessin se relit et qu'un « H7 » ne se reconstitue pas depuis deux nombres.
 
-'''Ce que porte une page de grandeur.''' Les libellés par langue en Monolingual text ; le symbole usuel ; une définition en une phrase ; l'unité principale, en lien vers une page d'unité ; les unités admises, en liens, multivalué ; le type à employer, Quantity ou Temperature ; le bloc de déclaration tout fait, à transclure, l'ordre des unités d'affichage déjà écrit dans le bon sens ; le nom de la propriété correspondante ; une équivalence vers un identifiant externe. La dimension physique et la grandeur de base dont elle dérive n'y figurent pas : aucun mécanisme ne s'en servirait, et une page de grandeur s'enrichit plus tard sans risque, étant une page ordinaire.
+'''Ce que porte une page de grandeur.''' Les libellés par langue en Monolingual text ; le symbole usuel ; une définition en une phrase ; '''la dimension physique''', en lien, qui porte le bloc de déclaration et les unités ; l'unité principale, en lien vers une page d'unité ; le type à employer, Quantity ou Temperature ; le nom de la propriété correspondante ; la forme à employer dans une requête de seuil ; une équivalence vers un identifiant externe. Corrigé le 13 octobre 2026 : la version du 8 octobre écartait la dimension comme inutile, faute d'un mécanisme qui s'en serve, et plaçait sur la grandeur les unités admises et le bloc de déclaration. L'épreuve de l'exemple a montré l'inverse, et la dimension est devenue la charnière du modèle. Une page de grandeur reste une page ordinaire, qui s'enrichit plus tard sans risque.
 
-'''Ce que porte une page d'unité.''' Les libellés par langue ; le symbole, c'est-à-dire la chaîne exacte qu'un contributeur tape ; les alias acceptés à la saisie, pour qui n'a pas les caractères sous la main ; la grandeur dont elle est une unité ; le facteur de conversion vers l'unité principale ; le code UCUM ; une équivalence vers un identifiant externe ; son appartenance au SI et à quel titre. Le trio symbole, alias, facteur est exactement ce qu'attend une ligne de déclaration : une page d'unité porte donc déjà tout ce qu'il faut pour l'écrire.
+'''Ce que porte une page d'unité.''' Les libellés par langue ; le symbole, c'est-à-dire la chaîne exacte qu'un contributeur tape ; les alias acceptés à la saisie, pour qui n'a pas les caractères sous la main ; '''la dimension dont elle est une unité''', et non une grandeur, corrigé le 13 octobre 2026 ; le facteur de conversion vers l'unité principale de cette dimension ; le code UCUM ; une équivalence vers un identifiant externe ; son appartenance au SI et à quel titre. Le trio symbole, alias, facteur est exactement ce qu'attend une ligne de déclaration : une page d'unité porte donc déjà tout ce qu'il faut pour l'écrire.
 
-'''Le bloc de déclaration est écrit à la main sur la page de grandeur, et transclus par les propriétés.''' Écrit à la main, une ligne par unité, recopiée du symbole et du facteur portés par les pages d'unité : un lecteur voit exactement ce qui sera déclaré. Transclus plutôt que recopié dans chaque propriété, parce que la liste des unités admises appartient à la grandeur et non à chacune de ses propriétés, ce qui est tout l'objet du lot. L'effet d'une modification du bloc sur les propriétés qui le transcluent n'est pas mesuré : voir les risques connus.
+'''Le bloc de déclaration est écrit à la main sur la page de dimension, et transclus par les propriétés.''' Écrit à la main, une ligne par unité, recopiée du symbole et du facteur portés par les pages d'unité : un lecteur voit exactement ce qui sera déclaré. Porté par la dimension et non par la grandeur, corrigé le 13 octobre 2026 : le millimètre sert l'épaisseur, le diamètre, la longueur et la largeur, et le bloc s'écrit donc une fois pour toutes les grandeurs de dimension longueur. Transclus plutôt que recopié dans chaque propriété, parce que la liste des unités admises appartient à la dimension et non à chacune de ses propriétés, ce qui est tout l'objet du lot. L'effet d'une modification du bloc sur les propriétés qui le transcluent n'est pas mesuré : voir les risques connus.
 
 '''Les titres sont français, les noms de propriétés anglais.''' Une page de grandeur ou d'unité porte un titre français, et une unité porte son nom développé, « Millimètre » et non « mm » : un titre se lit, un symbole se tape. Un nom de propriété est un identifiant technique, écrit une fois et jamais traduit, et l'anglais le rapproche des équivalences externes. Le pont se fait sur la page de grandeur, qui porte le nom de sa propriété comme elle porte son code UCUM.
 
@@ -78,7 +78,7 @@
 
 '''<code>Measured quantities</code> devient caduque.''' Dire qu'un appareil mesure un débit, c'est désormais porter un sous-objet de débit en mode mesure. Son sort, suppression ou renommage, appartient au [[Lot 10 — Procédés et outils|lot 10]] ; elle est signalée ici pour qu'on cesse de la remplir.
 
-'''La reprise des propriétés existantes ne migre rien : elle réécrit les pages porteuses.''' <code>Max thickness</code> à 0,2 devient un sous-objet portant une épaisseur de 0,2 mm, en mode spécification, avec le rôle maximal. Trois valeurs sur deux pages. Les anciennes propriétés restent en place et se vident, et leur sort appartient au [[Lot 26 — Renommage des propriétés par domaine|lot 26]]. '''Aucune écriture n'a donc lieu sur les quatre pages de propriété existantes''', ce qui écarte tout risque de verrou sur elles. La règle d'ordre inscrite aux risques connus le 6 octobre 2026, écrire l'unité puis changer le type, devient sans objet.
+'''La reprise des propriétés existantes ne migre rien : elle réécrit les pages porteuses.''' <code>Max thickness</code> à 0,2 devient un sous-objet portant une épaisseur de 0,2 mm, en mode spécification, avec le rôle maximal. Trois valeurs sur deux pages. Les anciennes propriétés restent en place et se vident, et leur sort appartient au [[Lot 26 — Renommage des propriétés par domaine|lot 26]]. '''Aucune écriture n'a donc lieu sur les quatre pages de propriété existantes''', ce qui écarte tout risque de verrou sur elles. La règle d'ordre inscrite aux risques connus le 6 octobre 2026, écrire l'unité puis changer le type, devient sans objet. Précisé le 13 octobre 2026 : le rôle est « maximal admissible », et non « maximal », qui prêterait à confusion avec la borne haute d'une tolérance.
 
 '''L'unité appartient à une dimension, non à une grandeur.''' Arrêté le 13 octobre 2026, sur l'épreuve de l'exemple. L'épaisseur, le diamètre, la longueur et la largeur sont des grandeurs de dimension longueur, et le millimètre les sert toutes. Le bloc de déclaration d'unités est donc porté par la dimension, écrit une fois, et toutes les grandeurs de cette dimension le transcluent. Conséquence : la ligne « dimension » d'une page de grandeur, écartée le 6 octobre 2026 comme inutile faute de mécanisme qui s'en serve, devient la charnière du modèle.
 
@@ -142,7 +142,7 @@
 Les trois hypothèses du travail préparatoire d'août 2026 ont toutes été tranchées entre le 6 et le 8 octobre 2026, et leur résolution figure ci-dessus.
 
 * La forme d'une caractéristique est désormais unique : un sous-objet, toujours, le scalaire ayant disparu.
-* L'unité est sortie de la portée des propriétés, remplacée par un bloc de déclaration transclus depuis la page de grandeur.
+* L'unité est sortie de la portée des propriétés, remplacée par un bloc de déclaration transclus depuis la page de dimension.
 * La page d'unité porte un code UCUM et une équivalence externe, sans rien importer, et aucun des deux n'est obligatoire.
 
 L'existant à reprendre est minime : trois valeurs sur deux pages, relevé du 4 octobre 2026. Une quarantaine de grandeurs sont visées à terme.
```

## Vérifications

### a. Celle qui tranche — contenu écrit

```
bin/wiki-verify.sh "Lot 21 — Grandeurs et unités" pages/Lot_21.txt
IDENTIQUE : Lot 21 — Grandeurs et unités
```

Sortie 0.

### b. Contradictions restantes

J'ai relu la révision 1602 en entier, telle qu'elle a été relue depuis le wiki (`lot21_t23_apres.txt`, 36 266 octets), ligne par ligne. J'ai ensuite recoupé cette lecture par un relevé de mots-clés : « bloc de déclaration », « unités admises », « admitted units », « appartient », « inutile », « à arrêter », « leurs unités », « code UCUM ». Le relevé n'a fait apparaître aucune ligne que la lecture n'avait pas déjà retenue.

**Le résultat contredit l'attendu « aucune » : une phrase dit encore que les unités appartiennent à une grandeur.**

- **Ligne 89**, « Les noms des pages de grandeur et d'unité » : la liste des propriétés d'une page de grandeur comprend toujours `<code>Quantity admitted units</code>`. Or la ligne 67, réécrite par cette tâche, place sur la dimension « le bloc de déclaration et les unités », et précise que la version du 8 octobre « plaçait sur la grandeur les unités admises et le bloc de déclaration », ce que « l'épreuve de l'exemple » a infirmé. La ligne 89 fait donc encore porter les unités admises par la grandeur. Elle n'a pas été corrigée, la consigne demandant seulement de la nommer.

Pour les deux autres catégories, aucune phrase ne dit encore, comme état en vigueur, que la dimension est inutile ou que le vocabulaire des rôles reste à arrêter. Les seules mentions de la dimension « inutile » sont des rappels historiques à l'intérieur d'une correction : ligne 67, « la version du 8 octobre écartait la dimension comme inutile », et ligne 83, « écartée le 6 octobre 2026 comme inutile ».

**Cas limites, que je nomme sans trancher.** Je ne sais pas s'ils relèvent de la vérification.

- **Ligne 33** : « Précisé le 8 octobre 2026 : ce modèle transclus est le bloc de déclaration porté par la page de grandeur. » La phrase est corrigée dans la même ligne : « Corrigé le 13 octobre 2026 : ce bloc est porté par la dimension, non par la grandeur. » C'est la forme datée qu'emploie la page pour garder l'historique.
- **Ligne 156**, risques connus : « Ajouter une unité à une grandeur modifie une déclaration partagée par toutes ses propriétés ». La même ligne corrige ensuite : « Depuis le 13 octobre 2026, cette déclaration est partagée par toutes les grandeurs d'une même dimension ». Le début de la phrase ajoute toujours l'unité « à une grandeur ».
- **Ligne 35** : « une requête les traverse jusqu'à trois sauts, de l'item jusqu'à la page de grandeur en passant par le sous-objet et l'unité ». C'est une mesure datée du 4 octobre 2026, dont la chaîne passait de l'unité à la page de grandeur. Le modèle arrêté fait désormais pointer l'unité vers une dimension.
- **Ligne 93** : « la forme à employer doit figurer sur la page de grandeur, à côté du bloc de déclaration ». La phrase suppose le bloc présent sur la page de grandeur. Cela s'accorde avec la ligne 83 (« toutes les grandeurs de cette dimension le transcluent »), mais pas avec les lignes 67 et 71 telles que réécrites : la page de grandeur y porte un lien vers la dimension, et le bloc y est « transclus par les propriétés ». Voir l'écart 2.
- **Ligne 4**, résumé du lot, dans le modèle `{{Lot}}` : « Faire des grandeurs physiques et de leurs unités des pages porteuses d'attributs ». Le possessif « leurs unités » rattache les unités aux grandeurs. Ce texte est aussi stocké comme valeur de `Work_package_summary`.

### c. Lignes

La page compte **164 lignes avant et 164 après**. Mesure : le nombre de segments obtenus en coupant le wikitexte sur le saut de ligne, sur la copie de la révision 1598 puis sur `pages/Lot_21.txt` modifié. La révision relue depuis le wiki compte aussi 164 lignes. Les sept remplacements portent chacun sur une ligne entière, et aucun n'a introduit de saut de ligne. Le diff le confirme : quatre blocs, chacun de même longueur avant et après (`-42,7 +42,7`, `-58,17 +58,17`, `-78,7 +78,7`, `-142,7 +142,7`).

### d. Annotations

`bin/wiki-api.sh --facts` (`smwbrowse`) sur la page, après écriture :

```
Work_package_closure_report -> ['https://github.com/Ecolibre/ecolibre-sgdt/blob/90b0a66d221e2a791ab1194136048f786983c630/travaux/lot-21-tache2-mesure.md']
Work_package_number -> ['21']
Work_package_opening_date -> ['1/2026/10/2']
Work_package_overlaps -> ['Lot_12_—_Contenants_et_étiquetage#0##', 'Lot_19_—_Vocabulaire_et_multilingue#0##', 'Lot_26_—_Renommage_des_propriétés_par_domaine#0##', 'Lot_31_—_Qualification_des_données_et_confiance_entre_pairs#0##']
Work_package_revises -> ["Lot_8_—_Facettes_de_type_d'item#0##", 'Lot_9_—_Exemplaires_plantés_du_jardin-forêt#0##', 'Lot_10_—_Procédés_et_outils#0##']
Work_package_status -> ['ouvert']
Work_package_summary -> ["Faire des grandeurs physiques et de leurs unités des pages porteuses d'attributs, décider comment une valeur mesurée s'attache à un item, et poser le socle qui en découle : une propriété par grandeur, pour tout le modèle."]
_ASK -> ['Lot_21_—_Grandeurs_et_unités#0##_QUERYcb327e0f5d5aa96f5638940fce05d9c7', 'Lot_21_—_Grandeurs_et_unités#0##_QUERYfea6911d0a7dfc99393ac8ecec86f57e', 'Lot_21_—_Grandeurs_et_unités#0##_QUERY709834b3af3b8b2bb360a601b3bdaa67']
_INST -> ['Lot#14##']
_MDAT -> ['1/2026/10/14/11/5/18/0']
_SKEY -> ['Lot 21 — Grandeurs et unités']
```

La page ne porte que ses sept propriétés `Work_package_*`, ses trois `_ASK`, `_INST`, `_MDAT` et `_SKEY`. Aucune annotation ne vient d'un exemple de syntaxe. Le `diff` avec le relevé fait avant l'écriture ne montre qu'une différence, `_MDAT` (`1/2026/10/14/10/50/18/0` → `1/2026/10/14/11/5/18/0`). Les trois `_ASK` gardent les mêmes identifiants.

Les deux `<nowiki>` de la révision 1598 sont intacts. `grep -c -F` compte 1 occurrence de `<code><nowiki>[[Has subobject.Diameter::...]]</nowiki></code>` et 1 de `<code><nowiki>{{#ask: [[Has subobject.Thickness::>>0,3 mm]] }}</nowiki></code>`, et le mot `nowiki` apparaît 4 fois (deux ouvertures, deux fermetures). Le rendu les montre en texte littéral (vérification e).

### e. Rendu

`action=parse&prop=text` sur la page écrite : 50 074 octets de HTML, contre 49 265 avant l'écriture.

- **Avertissements de Semantic MediaWiki : aucun.** Le HTML ne contient aucune occurrence de `data-type="4"`, `data-type="5"`, `smw-warning`, `smwtticon` ni `class="error`. Il n'y en avait aucune avant.
- **Liens vers une page inexistante : aucun.** Aucun lien `class="new"` n'apparaît. `action=parse&prop=links` rend 12 liens, aucun avec `exists: false`, et la liste est identique avant et après, titre par titre.
- **Catégories** : `Lot` seulement, avant comme après.
- Les deux exemples protégés s'affichent en texte littéral : `<code>[[Has subobject.Diameter::...]]</code>` et `<code>{{#ask: [[Has subobject.Thickness::&gt;&gt;0,3 mm]] }}</code>`.

### f. Propriétés de production intactes

Lecture connectée, avec `meta=userinfo` dans la même requête : `"id": 4`, `"name": "Cywil"`. Aucun avertissement de session expirée sur stderr ; la chaîne contient `intestactions`, ce qui déclenche le contrôle de session de `bin/wiki-api.sh`.

| Propriété | Révision | `intestactions` (`edit`) |
|---|---|---|
| Attribut:Nominal diameter | 342 | `[]`, aucun verrou |
| Attribut:Secondary diameter | 343 | `[]`, aucun verrou |
| Attribut:Power rating | 803 | `[]`, aucun verrou |
| Attribut:Max thickness | 804 | `[]`, aucun verrou |

## Écarts et surprises

1. **La vérification b ne rend pas « aucune ».** La ligne 89 range toujours `Quantity admitted units` parmi les propriétés de la page de grandeur, alors que la ligne 67 réécrite place les unités sur la dimension. Cette ligne vient de la tâche 22, et la consigne de la tâche 23 ne la visait pas. Je ne l'ai pas corrigée. La même liste ne donne d'ailleurs aucun nom aux propriétés de la page de dimension, qui porte désormais le bloc et les unités. Voir la question A.

2. **Qui transclut le bloc de déclaration ? La page se partage entre deux versions.** La ligne 83, inscrite par la tâche 22, dit : « toutes les grandeurs de cette dimension le transcluent ». La ligne 71, réécrite par cette tâche, dit : « écrit à la main sur la page de dimension, et transclus par les propriétés ». La ligne 67 fait seulement porter par la page de grandeur un lien vers la dimension. Les deux montages peuvent coexister, la grandeur et la propriété transcluant toutes deux le bloc, mais aucune phrase ne le dit. La ligne 93 (« à côté du bloc de déclaration », sur la page de grandeur) ne tient que dans la lecture de la ligne 83. Voir la question B.

3. **Deux dates différentes pour l'écart de la dimension.** La ligne 67 réécrite dit « la version du 8 octobre écartait la dimension comme inutile » ; la ligne 83 dit « écartée le 6 octobre 2026 comme inutile ». Les deux peuvent être vraies, l'écart datant du 6 et la version du 8 le portant encore. Je ne sais pas laquelle des deux dates le texte veut donner.

4. **Ligne 73, hors des trois catégories de la vérification b** : « Le pont se fait sur la page de grandeur, qui porte le nom de sa propriété comme elle porte son code UCUM ». Un code UCUM est un code d'unité : la ligne 75 dit « QUDT pour les grandeurs, UCUM et QUDT pour les unités », et seule la page d'unité porte un code UCUM, lignes 69 et 146. La ligne 67 ne prévoit pas de code UCUM sur la page de grandeur. L'incohérence est antérieure aux tâches 22 et 23.

5. **Forme de la commande de fusion.** La consigne écrit `git merge origin/main`. J'ai lancé `git merge --no-edit -m "…" -m "…" origin/main`. `--no-edit` évite l'ouverture d'un éditeur pour le message de fusion. Les deux `-m` donnent au commit de fusion un message au format du dépôt, `[Lot 21][Tâche 23] …`, et les deux lignes d'attribution qui terminent les commits de cette session. Le contenu fusionné est le même.

6. **Poussée de la branche de session**, hors consigne : `git push -u origin ccr-ad6f0bcb-wsc18c` (`b23c8a3..b4d753d`), juste après la poussée vers `main`. Elle ne concerne pas `main`.

7. **`git fetch origin` a fait apparaître trois branches distantes** d'autres sessions : `claude/clever-clarke-o1jkjc`, `claude/great-fermi-orlfk0` et `claude/magical-mayer-lm5dk7`. Je n'y ai pas touché.

8. **Commandes employées que la liste de la consigne ne nomme pas** : `tee`, `wc`, `cp`, `cut`, `sort`, `ls` et `date`, qui figurent dans la liste d'autorisations, et **`uniq`**, qui n'y figure pas. Je l'ai employé une fois, dans le relevé des faits pris avant l'écriture (`… | cut -d' ' -f1 | sort | uniq -c`). Je ne vois pas les fenêtres de confirmation : je ne sais pas lesquelles en ont ouvert une.

9. **Script du scratchpad** : `ancres23.py`, en lecture seule, dont le contenu a été affiché dans le terminal avant son lancement.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

**A.** Contexte : la ligne 89 range toujours `Quantity admitted units` parmi les propriétés de la page de grandeur, alors que la ligne 67 place désormais les unités sur la dimension. La même liste ne nomme aucune propriété de la page de dimension. Question : faut-il retirer `Quantity admitted units` et nommer les propriétés de la page de dimension ? Suggestion : oui, mais par un arbitrage de noms dans la conversation, puisqu'un nom de propriété engage la fédération. Ensuite, une consigne qui remplace la ligne 89 en entier.

**B.** Contexte : la ligne 83 fait transclure le bloc de déclaration par les grandeurs, la ligne 71 par les propriétés, et la ligne 93 suppose le bloc visible sur la page de grandeur. Question : qui transclut le bloc, les grandeurs, les propriétés, ou les deux ? Suggestion : trancher, puis aligner en une seule consigne les lignes 67, 71, 83 et 93. Profiter de la même consigne pour la ligne 73 (le code UCUM placé sur la page de grandeur) et pour les deux dates de l'écart de la dimension (6 ou 8 octobre).
