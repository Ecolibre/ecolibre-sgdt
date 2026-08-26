# Lot 11, tâche 7 — écarts au cadrage, état réel, et ce qui doit survivre

**26 août 2026. Lecture et proposition seulement, aucune écriture.**

Sources : `lot-11-cadrage-lieux.md` (334 lignes, rédigé le 17 août) relu en
entier, les 33 rapports `travaux/lot-11-*` dans l'ordre chronologique, et
l'état réel du wiki relu ce jour — pas les rapports seuls.

**Le cadrage décrit aujourd'hui un projet qui n'a pas eu lieu.** Non par
dérive, mais parce que six décisions ont changé en cours de route et qu'une
tâche s'est révélée impossible. Ce document liste les écarts, donne l'état
réel de chaque tâche, et dit ce qui doit être documenté.

---

## 1. Les écarts, du plus structurant au plus mineur

### 1.1 — Le titre : deux revirements, pas un

**Prévu (décision 1.4).** Le titre porte la référence, sous l'une des deux
formes que la tâche 0 devait départager : `<Libellé> (ECL-NNNN)` si SMW suit
les redirections, `ECL-NNNN` seul sinon.

**Fait.** Le titre est **le nom du lieu**, nu. `Le Buisson de Cerzat`,
`Butte de la tranchée`. La référence vit dans `Location_number`, affichée par
le modèle, jamais dans le titre.

**Pourquoi.** Le test de la tâche 0 a répondu *oui et non* : avec redirection
en place, le littéral stocké bascule sur le **nouveau** nom au reparse ; la
redirection retirée, il retombe sur l'**ancien**. La décision 1.4 supposait
une réponse binaire ; elle n'en a pas eu. Cyril a alors tranché autrement, le
24 août (`lot-11-titres-revision.md`) : un titre lisible vaut mieux qu'un
titre stable, et le coût réel d'un renommage — **29 pages à purger**, pas 82
— est supportable.

**Ce que le cadrage garde de faux :** la décision 1.4 en entier, l'arbitrage
n° 1 du §5, et le motif de la décision 1.3 (« le modèle doit rendre le
renommage peu coûteux ») qui commandait 1.4.

### 1.2 — `Location_lineage` : la propriété existe, rien ne la porte

**Prévu (décision 1.10, tâche 4).** La fermeture réflexo-transitive de
`Located_in`, matérialisée, « qui rend l'arbre interrogeable ». Annoncée en
§0 comme une des cinq livraisons du lot.

**Fait.** `Attribut:Location lineage` existe, complète et correctement typée.
**Zéro page ne la porte** (vérifié ce jour). `Modèle:Lieu` porte un
commentaire d'emplacement réservé, jamais rempli.

**Pourquoi.** Le test de cascade de la tâche 4 s'est arrêté à son état de
référence, qui était faux. Le mécanisme est établi et il est de fond :
`{{#show:…}}` sur une propriété de type Page rend **un lien wiki**, pas une
valeur brute ; concaténé dans le `#set` d'une autre propriété Page, les `[[`
produits sont refusés comme caractères non valides et **tout le `#set`
échoue**, `_ERRC` posé. Le patron ne peut pas marcher tel quel pour une
propriété de type Page.

**Le plus grave n'est pas l'échec, c'est le faux positif au milieu :**
`Casc B` a stocké un fait `Casc_lineage` — une chaîne entière prise pour un
seul titre — **sans `_ERRC`, sans avertissement**. Une cascade partiellement
cassée peut donc se présenter comme fonctionnelle.

**Conséquence non écrite dans le cadrage :** sans lignage, un lieu ne peut pas
lister ce que contiennent ses descendants. C'est exactement ce qui a rendu
*Avancement du jardin-forêt* incapable de s'appuyer sur le lieu, et qui a
motivé de porter `Owned_by` sur l'item et non sur le lieu.

### 1.3 — Le préfixe : `ECL` prévu, `LOC` en place

**Prévu (décision 1.5).** « nouvelle propriété, nouvelle banque, **même
préfixe d'affichage `ECL`** », produit par `{{Préfixe site}}`.

**Fait.** Le préfixe des lieux est **`LOC`**, porté par une propriété
`Location_site` et un modèle `Modèle:Préfixe lieu` — **ni l'une ni l'autre
au cadrage**. Les 13 lieux portent `Location_site=LOC`.

**Pourquoi.** Un lieu public n'appartient pas à une organisation :
`Le Buisson de Cerzat` ou `Cerzat` ne sont pas des biens d'Ecolibre. Le
*Registre des préfixes de site* le dit maintenant en toutes lettres — « LOC
n'est pas le code d'une organisation : il identifie les lieux publiés sur
wiki.ecolibre.org ». La décision a été prise, défaite et refaite plusieurs
fois dans la même journée ; sa forme finale est celle-ci.

**Deux propriétés hors cadrage** en découlent : `Location_site` (5ᵉ propriété,
la tâche 1 n'en annonçait que 4) et `Modèle:Préfixe lieu`.

### 1.4 — Les hameaux, niveau intermédiaire explicitement exclu

**Prévu (§2).** « Le Buisson est un hameau de Cerzat ; **le hameau lui-même
n'est pas créé comme lieu intermédiaire dans ce lot** ». Renvoyé au §6.

**Fait.** `Le Buisson de Cerzat` **est** un lieu de `Location_type=hameau`,
entre `Cerzat` et `Terrain de Cyril au Buisson de Cerzat`. La chaîne réelle
compte cinq niveaux : `Butte de la tranchée → Zone basse → Terrain de Cyril
au Buisson de Cerzat → Le Buisson de Cerzat → Cerzat`.

**Pourquoi.** La page existait déjà, sous ce nom, portant les 29 plantations.
La rattacher directement à `Cerzat` aurait fait d'elle un doublon du terrain ;
lui donner son type réel coûtait une ligne. La profondeur n'étant pas bornée
(décision 1.2), rien ne s'y opposait — c'est le renvoi du §6 qui a été
consommé sans être signalé comme tel.

### 1.5 — Un quatrième lieu, et une branche entière absente du cadrage

**Prévu (§2).** L'arbre s'arrête à trois lieux existants — `Le Buisson`,
`Jardin de Chilhac`, `Terrasse de Chilhac` — et « aucune subdivision des
lieux de Chilhac » (§0).

**Fait.** **13 lieux**, dont deux jamais mentionnés : `Atelier appartement`
(`LOC-0013`) et son parent `Appartement de Chilhac` (`LOC-0004`), qui devient
le parent de `Jardin de Chilhac` et `Terrasse de Chilhac`.

**Pourquoi.** `Atelier appartement` portait déjà un item physique — la
machine à souder (`ECL-0043`), entrée au lot 10. Un lieu qui porte un item ne
peut pas rester hors de l'arbre. `Appartement de Chilhac` a suivi comme
parent nécessaire. **C'est bien une subdivision des lieux de Chilhac**, que
le §0 excluait.

### 1.6 — Le rang : par planche, puis en mètres, puis en segment

**Prévu (décision 1.9).** « `Planting_rank` devient relatif à la planche
portée par `Located_at` ». Et : « sa description ne peut pas être mise à jour
(verrou SMW) : la règle vit dans la page de registre en attendant ».

**Fait.** Le rang est en **mètres entiers depuis l'origine du lieu**, et
depuis le 25 août c'est un **début de segment**, `Planting_rank_end` en
donnant la fin facultative. La description **a été réécrite deux fois** sur la
page de propriété — le verrou n'a jamais mordu dessus.

**Pourquoi.** Trois raisons empilées. Le rang ordinal par multiples de dix
(`A-1.5`) était rejeté par SMW — point décimal sur une propriété `Number`, et
la valeur n'était pas stockée du tout. Cyril a converti en mètres. Puis un
pied de bourrache et une touffe de poireau ne s'écrivent pas pareil : d'où le
segment. Quant au verrou, il **n'existait pas sur cette page** : la décision
1.9 le supposait sans l'avoir testé.

### 1.7 — Le verrou SMW, supposé général, mesuré ponctuel

**Prévu (§3, décision 1.5, décision 1.9, §6).** Le verrou
`smw-change-propagation-protection` « bloque toute modification d'une page
`Attribut:` créée le 15 août ». Il commande la décision 1.5 (banque distincte,
« la seule voie ouverte ») et bloque deux corrections dues.

**Fait.** **Une seule page est verrouillée : `Attribut:INSEE code`**, depuis
sa création le 21 août. Les cinq propriétés du lot 7 et `Attribut:Planting
rank` se sont toutes écrites du premier coup, le 25 août — six cas, aucun
refus.

**Pourquoi l'erreur a tenu si longtemps.** Personne n'avait tenté. Le cadrage
a hérité d'un constat du 15 août et l'a généralisé. La leçon est désormais
dans `CLAUDE.md` : *un blocage déduit n'est pas un blocage constaté*.

**Ce que ça invalide dans le cadrage :** l'argument central de la décision
1.5 (« une propriété nouvelle est la seule voie ouverte »), la clause du §0
(« aucune modification de page `Attribut:` existante — le verrou SMW
l'interdit »), et les deux renvois du §6.

### 1.8 — `Modèle:Lieu` : au-delà de la tâche 2

**Prévu (tâche 2).** Quatre paramètres, la référence préfixée, les enfants
directs, les items par lignage.

**Fait.** Tout sauf la requête par lignage (§1.2), **plus** deux
modifications qui n'y étaient pas : une catégorisation conditionnelle
`Catégorie:Lieu sans nom d'usage` ajoutée le 23 août, puis **retirée** le 24
avec le revirement des titres — `Place_name` redevenant facultatif quand le
titre porte le nom. La page de catégorie, elle, **existe encore et compte
zéro membre**.

### 1.9 — `Modèle:Physical facet plant` : hors cadrage, en service

**Prévu.** Rien. Le cadrage ne nomme jamais ce modèle.

**Fait.** Modifié le 25 août — `Planting_rank_end` au `#set`, cellule
d'affichage refondue, en-tête « Rang le long de la butte » remplacé par
**« Position depuis l'origine du lieu (m) »**. 40 pages transcluent ce modèle.

**Pourquoi le changement d'en-tête compte.** « Butte » était devenu faux :
il y a deux buttes, un pied de pylône et une extrémité de tranchée. Le libellé
héritait d'une époque où le jardin était une seule butte.

### 1.10 — Trois classes et propriétés entièrement hors cadrage

**Prévu.** Rien de tout cela.

**Fait**, les 25 et 26 août, sous libellé `[Amendement]` :

| Objet | Ce que c'est |
|---|---|
| `Catégorie:Organisation` + `Modèle:Organisation` + 4 propriétés + page `Ecolibre` | une classe hors chaîne, sur le patron de Lieu |
| `Owned_by` | l'appartenance, sur **Physical item** — 44 items renseignés |
| `Wanted_by` | le souhait, sur Organic et Referenced item — 0 usage à ce jour |
| `Planting_rank_end` | la fin de segment |
| *Avancement du jardin-forêt* | restructurée en table unique + section *Recherché* |
| `Modèle:Physical facet plant/doc` | documentation créée |

**Pourquoi.** La page d'avancement listait ce qui se trouve à un endroit ;
elle devait lister ce qui appartient à quelqu'un, pour rester juste quand une
plante change de lieu. D'où un acteur, d'où `Owned_by`. **C'est une suite
logique du lot, mais ce n'est pas le lot.**

### 1.11 — La page d'avancement était cassée, et le lot en est la cause

**Prévu.** Rien : le cadrage ne mentionne pas *Avancement du jardin-forêt*.

**Fait.** La bascule des 29 plantations (tâche 5) a vidé
`Located_at::Le Buisson de Cerzat`, sur quoi la page était bâtie en dur. Elle
a affiché **11 plantations sur 40** — et les six comptes par état, le total et
le nombre d'espèces, tous faux — **sans qu'aucun signal ne le dise**, du
25 août jusqu'à sa réparation le même jour.

**C'est l'écart le plus instructif du lot** : une migration correcte, vérifiée
page par page, a cassé une page tierce que personne n'avait recensée comme
dépendante.

### 1.12 — Écarts mineurs, pour mémoire

- **L'écart 26/29** (§3 du cadrage, condition d'arrêt) : **n'existe pas**.
  29 = 29, vérifié terme à terme contre le TSV. Constat périmé.
- **`format=count` via `action=ask` rend toujours 0** sur cette installation
  — découvert en tâche 0, il a fallu compter les résultats côté client dans
  tout le lot.
- **13 lieux, pas 14 ; 9 créations, pas 10** — l'arbre de la consigne d'étape
  comptait un nœud de trop, signalé sans bloquer.
- **`Location_type` reste vide sur 8 lieux sur 13**, faute de valeur donnée.
- **`Place_name` vide sur les 13** — la propriété créée au lot 9 pour porter
  le libellé n'a jamais servi, le titre le portant désormais.
- **Aucune référence Base36 consommée par les tests**, contrairement à ce que
  la tâche 0 faisait craindre.

---

## 2. État réel de chaque tâche

| Tâche | État | Détail |
|---|---|---|
| **0 — Reconnaissance** | **Faite** | Les quatre points traités. Le test de redirection a donné une réponse **double**, pas binaire, ce qui a fait tomber la décision 1.4. L'écart 26/29 s'est révélé inexistant. Le verrou a été mal généralisé — corrigé depuis. |
| **1 — Les propriétés** | **Faite autrement** | **5 propriétés, pas 4** : `Location_site` s'est ajoutée avec le préfixe `LOC`. Les quatre prévues existent et sont complètes. `Location_lineage` existe **et ne sert à rien** (§1.2). `INSEE_code` porte un `Property_range` rejeté (>85 car.) — seule page encore en `_ERRC` du wiki. |
| **2 — `Modèle:Lieu`** | **Faite autrement** | Tout sauf la requête par lignage, remplacée par un commentaire d'emplacement réservé. Deux allers-retours sur `Place_name` (catégorisation conditionnelle posée puis retirée). Une catégorie orpheline en reste. |
| **3 — `Formulaire:Lieu`** | **Faite** | Existe. Reste **non éprouvé par une création réelle** : les 9 lieux ont été écrits en wikitexte, pas par le formulaire. |
| **4 — `Location_lineage`** | **Sans objet — mais pas pour la raison prévue** | Le cadrage l'annonçait comme « la difficulté du lot » et demandait d'arbitrer entre deux voies. Le test s'est arrêté avant l'arbitrage, sur un défaut de fond du patron `#show` → `#set`. **Ni Lua ni script n'a été départagé** : la question reste entière. |
| **5 — Les dix pages** | **Faite, élargie** | 9 créées + 4 complétées = 13. A **absorbé une partie de la tâche 6** : les 29 plantations ont été basculées ici même. |
| **6 — Migration des 29** | **Non faite** | Les 29 ont été déplacées **en bloc vers `Butte de la tranchée`**, un seul lieu. Le cadrage demandait **29 décisions de Cyril** — quelle plante sur quelle planche — et le rang saisi dans la même passe. Le tableau à compléter n'a jamais été produit. **2 plantations sur 40 portent un rang**, et `Extrémité de tranchée` comme `Au pied du pylône électrique` sont vides. |
| **7 — Documentation** | **Non faite** | Les quatre livrables restent à écrire (§3). Un seul point a été traité, et pas là où le cadrage le prévoyait : le résultat du test de redirection est dans *Limites connues* n° 41. |

**Sans complaisance :** sur huit tâches, **deux sont faites telles que
prévues** (0 et 3), trois faites autrement (1, 2, 5), une est sans objet (4),
**deux ne sont pas faites** (6 et 7). Et le lot a produit, hors cadrage, plus
de matière que les tâches 1 à 5 réunies.

---

## 3. Ce que la documentation de clôture doit contenir

Quatre morceaux à faire survivre, chacun avec son lieu de vie. **Le critère
que je propose : une règle vit là où on la cherchera au moment de s'en
servir**, pas là où elle a été découverte.

### 3.1 — La discipline de nommage des lieux → `Catégorie:Lieu`

**C'est le point le plus urgent, et il est déjà en défaut.** Maintenant que
le titre porte le nom, un nom positionnel collisionne au deuxième site. Les
noms en place le montrent déjà :

| Nom | Risque |
|---|---|
| `Zone basse`, `Zone haute` | **collision certaine** — tout terrain a une zone basse |
| `Butte de la tranchée`, `Extrémité de tranchée` | collision probable |
| `Au pied du pylône électrique` | collision possible |
| `Atelier appartement` | collision probable |
| `Le Buisson de Cerzat`, `Terrain de Cyril au Buisson de Cerzat` | sûrs — qualifiés géographiquement |

Ce que la règle doit dire : **un nom de lieu doit être unique sur le wiki
entier, pas seulement dans son parent** — MediaWiki n'a pas d'espace de noms
par branche, `Zone basse` est un titre global. Donc qualifier dès qu'un nom
est positionnel ou générique (`Zone basse du Buisson`), et ne jamais compter
sur le parent pour désambiguïser. Avec le corollaire : **la collision ne se
verra pas** — `--createonly` refusera la création avec `articleexists`, et
quelqu'un pourrait « corriger » en réutilisant la page d'un autre site.

**Où :** `Catégorie:Lieu`, section *Champs* ou une section *Nommage*. C'est
la page qu'on lit avant de créer un lieu.

### 3.2 — La procédure de renommage d'un lieu → `Catégorie:Lieu`, avec renvoi à *Limites connues*

Ce que le test de la tâche 0 a établi, et qui doit être opérationnel et non
narratif :

1. Renommer la page **en laissant la redirection** (comportement par défaut).
2. **Purger les pages qui portent `Located_at` vers ce lieu** — c'est le
   reparse qui fait converger le littéral stocké vers le nouveau nom. Coût
   mesuré pour `Le Buisson de Cerzat` : **29 pages**.
3. **Ne pas supprimer la redirection** avant que la purge soit faite : la
   retirer fait retomber le littéral sur l'ancien nom, alors même qu'aucune
   page annotante n'a été touchée.
4. Contrôler par `browsebysubject` sur deux ou trois pages annotantes, pas par
   l'affichage.

**Le fait de fond** — une redirection est porteuse de données SMW, un
renommage est une opération SMW et pas seulement éditoriale — est **déjà dans
*Limites connues* n° 41**. Ce qui manque est la **procédure**, et sa place est
sur `Catégorie:Lieu` : on ne consulte pas une page de limites pour renommer.

### 3.3 — Pourquoi il n'y a pas de lignage → deux endroits, deux contenus

Ce point doit se scinder, parce qu'il mêle un défaut d'outil et une dette de
modèle.

**Dans *Limites connues* — le défaut d'outil, réutilisable :**
`{{#show:}}` sur une propriété de type Page rend un **lien wiki**, pas la
valeur brute. Concaténé dans le `#set` d'une autre propriété Page, les `[[`
font échouer **tout le `#set`**, `_ERRC` posé. Et surtout le faux positif :
selon que la source a ou n'a pas de valeur, la même construction produit
tantôt une erreur franche, tantôt **un fait faux sans aucun avertissement**.
Cette entrée vaut pour toute matérialisation de fermeture transitive, pas
seulement pour les lieux.

**Dans le cadrage lui-même — la dette de modèle.** Ce qui reste à décider :
la voie de calcul (Lua à l'enregistrement, ou script rejoué) n'a **jamais été
arbitrée** ; le patron du `#set` doit être corrigé avant tout nouveau test ;
et le recalcul après déplacement d'un lieu dans l'arbre — le « piège à ne pas
manquer » de la tâche 4 — n'a même pas été abordé. **La question est intacte,
pas réglée.** `Board_lineage`, cité comme précédent, mérite d'être relu avant
de recommencer : il fonctionne, lui.

**Ne pas écrire dans `Catégorie:Lieu`** que le lignage n'existe pas — c'est
une absence, et une page de classe décrit ce qui est.

### 3.4 — La convention du rang → `Catégorie:Lieu` **et** `Modèle:Physical facet plant/doc`

Elle est déjà écrite, complète, dans **`Modèle:Physical facet plant/doc`**
(créée le 25 août) : mètres entiers depuis l'origine du lieu, début de
segment, fin facultative, indépendance d'avec `Planted_count`, et le cas de la
fin sans début.

Ce qui manque est **du côté du lieu** : `Catégorie:Lieu` ne dit nulle part
qu'un lieu a une **origine**, ni qu'elle est implicite. Une phrase suffirait —
*le rang d'une plantation se compte en mètres depuis l'origine du lieu qui la
porte ; cette origine n'est pas enregistrée, elle relève de la convention
locale, et les rangs ne sont donc pas comparables d'un lieu à l'autre.*

C'est aussi le seul endroit où signaler que **la migration des 29 a mis à
l'épreuve cette convention sans la respecter** : elles ont changé de lieu, donc
d'origine, et les deux rangs existants (`15` et `2`) ont été conservés tels
quels. **Ils se réfèrent à l'origine de l'ancien lieu.** À vérifier par Cyril.

### 3.5 — Les trois autres livrables de la tâche 7

| Livrable prévu | État | Ce qu'il faut y mettre |
|---|---|---|
| *Récapitulatif technique* : la 3ᵉ banque | **non fait** | La page dit encore « **deux** banques de références ». Il y en a trois : `Item_ref`, `Inventory_number`, `Location_number` — la troisième avec son préfixe propre `LOC` et son motif (un lieu public n'appartient à personne). |
| *Catégorie:Lieu* : profondeur, critère item/lieu, redécoupage, `Location_type` | **non fait** | Aucun des quatre sujets n'est sur la page aujourd'hui, vérifié ce jour. |
| `CLAUDE.md` : la correction due sur `Planting_rank` | **sans objet** | Elle a été faite. À remplacer par ce qui a vraiment été appris : le verrou n'était pas général — leçon **déjà écrite**. |

### 3.6 — Et le cadrage lui-même

**Je propose de ne pas le réécrire, mais de l'ouvrir par un encart d'état.**
Motif : c'est un document daté du 17 août, et le récit de la construction est
la valeur de `travaux/`. Le réécrire effacerait la trace des six décisions qui
ont changé — or c'est précisément ce qui s'apprend.

L'encart, en tête, dirait : ce document est le cadrage d'origine ; six
décisions ont changé en exécution ; voir `lot-11-tache7-cadrage.md` §1 pour la
liste, §2 pour l'état réel des tâches. Avec le renvoi précis des passages
périmés — décisions **1.4**, **1.5** (motif), **1.9** (verrou), **1.10**
(lignage), §**0**, §**2** (hameau), §**3** (verrou, écart 26/29), §**5**
(arbitrages 1 et 2).

**C'est le geste le plus important de cette tâche.** Sans lui, la première
personne qui ouvrira `lot-11-cadrage-lieux.md` croira que les lieux
s'appellent `ECL-NNNN` et que le lignage fonctionne.

---

## 4. Ce qui ne devrait PAS être documenté

**Le détail des revirements du préfixe.** `ECL`, puis autre chose, puis `LOC`
— trois décisions dans une journée. Seul l'état final et son motif méritent
une page ; le chemin appartient aux rapports de `travaux/`, qui sont là pour ça.

**Les valeurs de `Location_type`.** Huit lieux sur treize n'en ont pas, et la
décision 1.8 dit explicitement de laisser le vocabulaire émerger et de
consolider « après une vingtaine de lieux ». Documenter maintenant `commune,
hameau, jardin, terrasse, atelier` figerait cinq valeurs tirées de cinq cas.
**C'est exactement l'erreur que la décision 1.8 s'interdisait.**

**Le patron de test de cascade.** Les cinq pages `Casc *` et les deux
propriétés `Casc *` sont un échafaudage, et un échafaudage cassé. Ce qui
survit est la **leçon** (§3.3), pas la construction. Les sept pages sont dans
la liste à supprimer.

**`Wanted_by` et sa section *Recherché*.** La propriété existe, la page les
affiche, **zéro donnée ne les traverse**. Une convention d'usage rédigée avant
le premier souhait réel serait de l'anticipation, pas de la documentation.
Deux questions attendent d'ailleurs une vraie donnée : compte-t-on les pieds
d'une touffe, et faut-il éteindre un souhait obtenu. **Écrire maintenant, ce
serait trancher sans savoir.**

**La numérotation `LOC-0001` à `LOC-0013` comme table.** Elle est dans le
wiki, interrogeable, et elle bougera. Une table recopiée dans une page de
documentation serait fausse au prochain lieu créé — le défaut même qui a cassé
*Avancement du jardin-forêt*.

**Les incidents d'outillage de cette session.** Le proxy sortant refusé le
24 août, la file de travaux figée à 100, les faux négatifs de clé JSON
(`"Inventory site"` contre `Inventory_site`, la balise cachée de Page Forms).
Les deux premiers sont **déjà** dans `CLAUDE.md` ou *Limites connues*. Le
troisième mérite peut-être une ligne, mais **une seule, générique** — *le nom
d'affichage n'est pas la clé* — pas trois anecdotes.

---

## 5. Ce que je propose de faire, dans l'ordre

1. **L'encart d'état sur le cadrage** (§3.6) — le plus urgent, une seule
   écriture, et sans lui tout le reste peut être mal lu.
2. **`Catégorie:Lieu`** — nommage (§3.1), renommage (§3.2), origine du rang
   (§3.4), plus les quatre sujets de la tâche 7 encore absents (§3.5).
3. **`Limites connues`** — le défaut `#show` → `#set` sur propriété Page
   (§3.3), avec son faux positif.
4. **`Récapitulatif technique`** — la troisième banque (§3.5).
5. **Le cadrage** — la dette de lignage, ce qui reste à décider (§3.3).

**Et une question à Cyril avant tout cela**, parce qu'elle est de son ressort
seul et qu'elle traîne : la tâche 6 reste ouverte. Les 29 plantations sont
toutes sur `Butte de la tranchée`, deux lieux créés sont vides, et deux rangs
sur 40 pointent vers l'origine d'un lieu qu'elles ont quitté. **Faut-il la
rouvrir, ou la déclarer close en l'état ?** La documentation ne dira pas la
même chose selon la réponse.
