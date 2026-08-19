# Lot 10 — Tâche 2 : création du référentiel des procédés

**Exécuté le :** 17 août 2026, session Claude Code, compte `Cywil`.
**Sept écritures wiki, toutes acceptées.** Aucun refus : le verrou intermittent
du §6 du cadrage ne s'est pas manifesté.

---

## 1. Écritures

| # | Page | Résumé | pageid | revid |
|---|---|---|---|---|
| 1 | `Attribut:Practice_domain` | `[Lot 10][Tâche 2] Practice domain` | 400 | **785** |
| 2 | `Assembler` | `[Lot 10][Tâche 2] Assembler — procédé racine (groupe DIN 8580 Fügen)` | 401 | **786** |
| 3 | `Braser tendre` | `[Lot 10][Tâche 2] Braser tendre — procédé, enfant d'Assembler` | 402 | **787** |
| 4 | `Souder par points` | `[Lot 10][Tâche 2] Souder par points — procédé, enfant d'Assembler` | 403 | **788** |
| 5 | `Mesurer une grandeur électrique` | `[Lot 10][Tâche 2] Mesurer une grandeur électrique — procédé racine` | 404 | **789** |
| 6 | `Maintenir en position` | `[Lot 10][Tâche 2] Maintenir en position — procédé racine` | 405 | **790** |
| 7 | `Souder à l'étain` (redirection) | `[Lot 10][Tâche 2] Redirection Souder à l'étain vers Braser tendre` | 406 | **791** |

Les six premières en `--createonly`, `new: true` sur toutes — aucune page
préexistante écrasée. Commit du fichier de tâche 1 : `5f01f5e`.

### 1.1 `Attribut:Practice_domain` — créée complète en une écriture

Contrôle des 85 caractères appliqué par principe avant d'écrire, comme
demandé : `valeurs laissées émerger` = **24 caractères**, très en deçà de la
limite découverte en tâche 0. Aucun `Allows value` : vocabulaire ouvert,
conforme à l'arbitrage 2.4.

### 1.2 Référence `Item_ref` — obtenue du module en production, une par une

Jamais calculée hors ligne. Avant chaque création, appel réel du module sur le
maximum lu en direct :

```
{{#invoke:Base36|next|{{#ask: [[Item_ref::+]] |?Item_ref= |mainlabel=- |format=list |sort=Item_ref |order=desc |limit=1 |link=none }} }}
```

évalué par `action=parse` (lecture seule, aucune page enregistrée) :

| Procédé | Référence rendue par le module |
|---|---|
| `Assembler` | **002H** |
| `Braser tendre` | **002I** |
| `Souder par points` | **002J** |
| `Mesurer une grandeur électrique` | **002K** |
| `Maintenir en position` | **002L** |

Séquence continue depuis `002G`, dernier attribué relevé en tâche 0. À noter :
le module **n'a pas sauté le `I`** — `002I` est bien attribué, cohérent avec la
vérification faite au lot 9 (« `I` et `O` ne sont pas sautés »).

### 1.3 Structure retenue, et un écart qu'il a fallu trancher

Structure reprise d'un item fonctionnel existant (`Irriguer`, `Assurer les
besoins vitaux`) : appel de `{{Functional item}}` avec `Item_ref`, `Part_of`,
`Item_description`.

**Mais `Modèle:Functional item` ne lit que ces trois paramètres.** Sa
définition (lue avant d'écrire) ne comporte que
`{{#set:|Item_ref=…|Item_description=…|Part_of=…|+sep=,}}` : il **n'accepte ni
`Practice_domain` ni `External_classification`**. Les passer en paramètre du
modèle aurait été **inerte** — le cas exact de la leçon « Modèle avant
formulaire » de `CLAUDE.md`, et l'étape 6 aurait constaté des propriétés
absentes.

Deux voies possibles : modifier le modèle, ou annoter la page directement.
**J'ai retenu l'annotation directe**, pour trois raisons : le modèle est
transclus, donc sa modification relève du garde-fou 6 et n'était pas validée
pour cette tâche ; le §3 du fichier de tâche 1 avait déjà retenu le même
principe pour `[[Catégorie:Procédé]]`, posée à la main « sans toucher au modèle
en service » ; et l'annotation stocke réellement, ce que la vérification de
l'étape 6 confirme.

**Wikitexte de la première page (`Assembler`), tel que produit :**

```
{{Functional item
|Item_ref=002H
|Item_description=Groupe de la DIN 8580 réellement touché par l'échantillon du lot 10 ; deux enfants distincts le justifient comme parent, il ne serait pas créé pour un seul.
}}

[[Catégorie:Procédé]]
```

Et la forme complète, sur `Braser tendre` :

```
{{Functional item
|Item_ref=002I
|Part_of=Assembler
|Item_description=L'apport fond, le métal de base non — c'est ce qui le sépare du soudage. Nommé au niveau où existe un référent externe stable.
}}

Domaines de pratique : [[Practice_domain::électronique]], [[Practice_domain::plomberie]]

Alignement externe : [[External_classification::https://en.wikipedia.org/wiki/Soldering]]

[[Catégorie:Procédé]]
```

`Item_description` porte **la ligne de motif** exigée par le §3 du cadrage
(« chaque nœud créé porte en une ligne le motif qui l'a fait naître ») et
reprise en critère de clôture. `Item_description` est de type `Text`, donc
non concernée par le plafond de 85 caractères.

### 1.4 Les trois écarts demandés — appliqués

- `Souder par points` : **carrosserie et tôlerie retirées**, `Practice_domain`
  = électronique, énergie. Le fichier de tâche 1 en proposait trois autres.
- **Listes laissées incomplètes**, aucun domaine ajouté de ma propre
  initiative.
- Identifiants Wikidata **relevés sans rien changer aux valeurs** (§3).

---

## 2. Vérification du stockage — étape 6

Les cinq pages purgées (`purged: true`, `linkupdate: true`), puis
`browsebysubject` page par page. **Le wikitexte n'a servi à rien ici : seuls
les faits comptent.**

| Page | `Item_ref` | `Part_of` | `Practice_domain` | `External_classification` | `_ERR*` |
|---|---|---|---|---|---|
| `Assembler` | 002H | — | — | — | aucune |
| `Braser tendre` | 002I | Assembler | électronique, plomberie | `…/wiki/Soldering` | aucune |
| `Souder par points` | 002J | Assembler | électronique, énergie | `…/wiki/Spot_welding` | aucune |
| `Mesurer une grandeur électrique` | 002K | — | électronique, électricité, énergie | — | aucune |
| `Maintenir en position` | 002L | — | — | — | aucune |

**Tout est conforme à l'attendu, et aucune clé `_ERR*` n'est présente.** Les
cinq pages portent `_INST = Functional item, Procédé`, donc la catégorie est
bien enregistrée côté SMW et pas seulement affichée.

`Practice_domain` étant multivaluée, les valeurs sont stockées comme
annotations distinctes (`[[Practice_domain::a]], [[Practice_domain::b]]`) —
2, 2 et 3 valeurs séparées, jamais une chaîne unique à découper.

**Un faux écart, dû à mon propre outil de contrôle.** Le premier passage a
signalé `External_classification` de `Souder par points` comme divergent :
`Spot welding` au lieu de `Spot_welding`. C'était **ma fonction de
normalisation** qui remplaçait les underscores par des espaces — traitement
légitime pour un titre de page, destructeur pour une URL. Relecture de la
valeur brute : `https://en.wikipedia.org/wiki/Spot_welding`, strictement
conforme. **Rien à corriger sur le wiki** ; c'est le comparateur qui mentait,
pas la donnée.

### 2.1 La redirection

`action=query&redirects=1` sur `Souder à l'étain` résout bien vers
`Braser tendre`. La redirection est donc active, pas seulement écrite.

### 2.2 `[[Catégorie:Procédé]]` rend **cinq** pages, pas quatre

Vérifié deux fois, par `list=categorymembers` et par `action=ask`
(`meta.count: 5`) : `Assembler`, `Braser tendre`, `Maintenir en position`,
`Mesurer une grandeur électrique`, `Souder par points`.

**C'est un écart d'énoncé, pas un défaut d'exécution**, et je ne l'ai pas
« corrigé » de moi-même. L'instruction dit à la fois « créer les **quatre**
items fonctionnels » puis en liste **cinq**, demande explicitement
`Catégorie:Procédé` **sur `Assembler`**, parle ensuite de « chacune des **cinq**
pages créées », puis attend « **quatre** pages » dans la catégorie.

La lecture qui réconcilie tout : le fichier de tâche 1 compte « **quatre
procédés** » pour cinq outils, parce qu'`Assembler` n'est pas un procédé
réalisé par un outil — c'est un **groupe de la DIN 8580**, un parent de
classement. Les quatre procédés réalisés sont `Braser tendre`,
`Souder par points`, `Mesurer une grandeur électrique` et
`Maintenir en position`.

**À trancher :** `Assembler` doit-il porter `[[Catégorie:Procédé]]` ? Si la
catégorie doit marquer « nœud du référentiel des procédés », elle est juste sur
les cinq. Si elle doit marquer « procédé réalisable par un outil », il faut la
retirer d'`Assembler` — une écriture d'une ligne. J'ai suivi l'instruction
explicite par item, qui la demandait ; la retirer était l'autre choix
défendable, mais il aurait contredit une consigne écrite.

---

## 3. Identifiants Wikidata (étape 5) — relevé, aucune écriture

### 3.1 Les quatre concepts

| Nœud | Élément | Libellé EN / FR | Sitelinks |
|---|---|---|---|
| `Assembler` | **Q1480529** | *joining* / **assemblage (norme DIN)** | dewiki `Fügen (Fertigungstechnik)` ; **pas d'enwiki ni de frwiki** |
| `Braser tendre` | **Q67131697** | *soldering* / **brasage tendre** | **aucun** |
| `Souder par points` | **Q2327972** | *spot welding* / **soudage par point** | enwiki `Spot welding`, frwiki `Soudage par point` |
| `Mesurer une grandeur électrique` | **Q3859407** | *electrical measurement* / — | enwiki `Electrical measurements` |
| `Maintenir en position` | **Q2306980** | *Clamping technology* / — (de : *Spanntechnik*) | dewiki `Spanntechnik` |

**Q1480529 est une trouvaille utile** : sa description est littéralement
« groupe de procédé d'assemblage définie par la norme allemande DIN 8580 ».
C'est exactement le motif écrit dans `Item_description` d'`Assembler`, et
l'alignement le plus juste possible pour ce nœud — il n'a pas d'article
Wikipédia en anglais ni en français, donc **seul Wikidata peut le porter**.

### 3.2 Le point ouvert du §4 est tranché : oui, ces éléments existent

La question était : existe-t-il un élément Wikidata décrivant le **procédé** et
non l'outil ?

- **`Mesurer une grandeur électrique` → Q3859407**, « methods, devices and
  calculations used to measure electrical quantities ». **Oui**, c'est bien le
  procédé — avec une réserve honnête : la définition englobe aussi les
  dispositifs (*devices*), elle n'est donc pas purement procédurale. Elle reste
  incomparablement plus juste que `Multimeter`, qui est l'outil.
- **`Maintenir en position` → Q2306980**, « the fixing of a workpiece or a tool
  for machining the workpiece ». **Oui**, c'est l'acte, pas le dispositif — les
  dispositifs sont des éléments distincts (`Q2306919` étau de fraisage, etc.).
  Le concept est porté par l'allemand (*Spanntechnik*), sans étiquette
  française.

**Conséquence pour le §4 du fichier de tâche 1 :** la limite constatée était
bien celle de **Wikipédia**, pas de Wikidata. Wikipédia n'a d'article que pour
l'outil ; Wikidata a l'élément du procédé dans les deux cas. La portée de
`External_classification` — « URL Wikipédia ou Wikidata » — avait donc raison
de prévoir les deux, et ces deux nœuds devront s'aligner sur Wikidata.

### 3.3 Un décalage à signaler sur `Braser tendre`

L'alignement écrit est `https://en.wikipedia.org/wiki/Soldering`, conformément
à la consigne. Or cet article correspond à **Q211387**, dont le libellé anglais
est *soldering or brazing* et le libellé français **« brasage »** — le concept
**générique**, celui qui couvre brasage tendre *et* fort.

Le concept exact du nœud est **Q67131697**, libellé français **« brasage
tendre »**, littéralement le nom retenu — mais il **n'a aucun article
Wikipédia**, dans aucune langue.

Autrement dit : le §2 du fichier de tâche 1 avait raison de dire que l'anglais
sépare là où le français regroupe, mais l'ancrage retenu est **un cran plus
large que le nœud**. Rien n'est faux ; c'est une imprécision d'un niveau. La
corriger demanderait de pointer Q67131697 plutôt que l'article Wikipédia.
**Non fait — la consigne fixait la valeur, et l'étape 5 dit explicitement de ne
rien changer.**

---

## 4. Ce qui a échoué

**Rien.** Sept écritures, sept succès, aucun refus, aucune clé d'erreur SMW,
aucune valeur rejetée au stockage.

Les deux difficultés rencontrées ont été résolues avant écriture ou sans
conséquence : le modèle qui n'accepte pas les deux propriétés (§1.3, contourné
par annotation directe) et le faux écart de mon comparateur (§2, aucun effet
sur la donnée).

---

## 5. Ce qui reste ouvert

1. **`Assembler` et `[[Catégorie:Procédé]]`** (§2.2) — cinq pages ou quatre,
   à trancher. Une écriture d'une ligne dans un sens comme dans l'autre.
2. **Aligner les deux nœuds sans Wikipédia sur Wikidata** : `Q3859407` pour la
   mesure électrique, `Q2306980` pour le maintien en position. Les valeurs sont
   relevées et vérifiées, il ne reste qu'à décider de la forme de l'URL
   (`https://www.wikidata.org/wiki/Q…`) et à écrire.
3. **Éventuellement affiner `Braser tendre`** vers Q67131697 (§3.3).
4. **`Practice_domain` reste à compléter par Cyril** — les listes sont
   volontairement partielles. En l'état, le vocabulaire compte quatre valeurs :
   `électronique`, `plomberie`, `électricité`, `énergie`. Le critère de clôture
   du cadrage — « au moins une valeur hors électronique » — est **déjà
   satisfait** par `plomberie`, `électricité` et `énergie`.
5. **`Maintenir en position` n'a aucun `Practice_domain`**, conformément au §3
   du fichier de tâche 1 : c'est le nœud qui met en défaut le marqueur par
   présence de domaine, et c'est pourquoi la catégorie a été retenue comme
   marqueur.

Les outils ne sont rattachés à aucun procédé : c'est la tâche 4, et aucun
`Realizes_function` n'a été écrit.

---

## 6. Solde de la tâche 2 — 19 août 2026

Deux arbitrages reçus de Cyril, tranchant les points laissés ouverts en §5 :

- **Arbitrage 1** — `[[Catégorie:Procédé]]` reste sur `Assembler`. Les cinq
  pages sont justes : la catégorie marque l'appartenance au référentiel, pas
  la réalisabilité par un outil. Rien à défaire.
- **Arbitrage 2** — garde-fou 6 explicitement levé sur `Modèle:Functional
  item`, pour cette modification et elle seule.

### 6.1 Étape 1 — modification de `Modèle:Functional item`

Trois paramètres optionnels ajoutés : `Practice_domain` (multivaluée),
`External_classification` (simple), `Procédé` (déclenche
`[[Catégorie:Procédé]]` quand il vaut `oui`).

**Wikitexte avant** (revid 318, en place depuis le 9 août) :

```
<noinclude>
{{Documentation}}
</noinclude>
<includeonly>
{{#set:
|Item_ref={{{Item_ref|}}}
|Item_description={{{Item_description|}}}
|Part_of={{{Part_of|}}}
|+sep=,
}}

{| class="wikitable" style="width:100%"
! style="background:#f2f2f2; width:30%;" | Référence (Base 36)
| '''{{{Item_ref|}}}'''
|-
! style="background:#f2f2f2" | Description de la fonction
| {{{Item_description|}}}
|-
! style="background:#f2f2f2" | Fonctions parentes
| {{#arraymap:{{{Part_of|}}}|,|@@@|[[@@@]]|,&#32;}}
|-
! style="background:#f2f2f2" | Sous-fonctions (Enfants)
| 
{{#ask: [[Part_of::{{FULLPAGENAME}}]]
 |?Item_ref = Réf.
 |format=table
 |default=''Aucune sous-fonction déclarée.''
 |class=wikitable sortable
}}
|-
! style="background: #e8f0ff" | Solutions organiques (Comment)
| {{#ask: [[Realizes_function::{{FULLPAGENAME}}]]
| ?Item_ref=Réf.
| ?Item_description=Description
| format=table
| default=''Aucune solution organique n'est encore référencée pour cette fonction.''
| class=wikitable sortable
}}
|}

[[Category:Functional item]]
</includeonly>
```

**Wikitexte après** (revid **800**, état final) :

```
<noinclude>
{{Documentation}}
</noinclude>
<includeonly>
{{#set:
|Item_ref={{{Item_ref|}}}
|Item_description={{{Item_description|}}}
|Part_of={{{Part_of|}}}
|+sep=,
|External_classification={{{External_classification|}}}
}}{{#if:{{{Practice_domain|}}}|{{#arraymap:{{{Practice_domain}}}|,|@@@|{{#set:Practice_domain=@@@}}|}}}}{{#ifeq:{{{Procédé|}}}|oui|[[Catégorie:Procédé]]}}

{| class="wikitable" style="width:100%"
! style="background:#f2f2f2; width:30%;" | Référence (Base 36)
| '''{{{Item_ref|}}}'''
|-
! style="background:#f2f2f2" | Description de la fonction
| {{{Item_description|}}}
|-
! style="background:#f2f2f2" | Fonctions parentes
| {{#arraymap:{{{Part_of|}}}|,|@@@|[[@@@]]|,&#32;}}
|-
! style="background:#f2f2f2" | Sous-fonctions (Enfants)
| 
{{#ask: [[Part_of::{{FULLPAGENAME}}]]
 |?Item_ref = Réf.
 |format=table
 |default=''Aucune sous-fonction déclarée.''
 |class=wikitable sortable
}}
|-
! style="background: #e8f0ff" | Solutions organiques (Comment)
| {{#ask: [[Realizes_function::{{FULLPAGENAME}}]]
| ?Item_ref=Réf.
| ?Item_description=Description
| format=table
| default=''Aucune solution organique n'est encore référencée pour cette fonction.''
| class=wikitable sortable
}}
|}

[[Category:Functional item]]
</includeonly>
```

**Pourquoi `Practice_domain` ne passe pas simplement par `+sep=,` sur le
`#set` existant.** `Attribut:Practice_domain` est de type **Texte**
(`_txt`), pas Page. La leçon de méthode de `CLAUDE.md` s'applique
directement : « SMW ne rogne pas les espaces des valeurs intermédiaires » —
une propriété Texte conserve l'espace après une virgule, contrairement à une
propriété Page qui l'absorbe par normalisation de titre. Un simple
`|Practice_domain={{{Practice_domain|}}}|+sep=,` aurait donc stocké `"
plomberie"` avec un espace de tête, silencieusement. J'ai vérifié cette
hypothèse avant d'écrire, par `action=expandtemplates` en lecture seule sur
un `#arraymap` isolé : le résultat confirme que `#arraymap` **rogne bien**
chaque élément découpé, contrairement à `+sep=,` seul. D'où le choix
d'`#arraymap` appelant un `{{#set:Practice_domain=@@@}}` par valeur — chaque
valeur devient sa propre annotation, correctement rognée, sans passer par
`+sep=,`.

**Pourquoi `{{#set:Practice_domain=@@@}}` plutôt que
`[[Practice_domain::@@@]]` dans la formule de l'`#arraymap`.** La seconde
forme est une annotation inline : elle stocke, mais elle **s'affiche** aussi
comme texte visible sur la page. Le `#set` ne rend jamais rien à l'écran — la
consigne « ne touche à rien d'autre » interdisait d'ajouter du texte visible
en dehors du tableau existant.

**Un aller-retour sur la mise en page.** Le premier jet plaçait `#if` et
`#ifeq` chacun sur sa propre ligne, sous le `#set`. Purge et relecture du
rendu de `Irriguer` (`action=parse&prop=text`) après cette première version
(revid 792) montraient **trois** paragraphes vides (`<p><br /></p>`) au lieu
d'un — chaque ligne source qui s'évalue à vide en ajoute un. Correctif
immédiat (revid 798) : les trois appels regroupés sur une seule ligne, contre
laquelle plus aucune ligne vide propre ne s'ajoute. **Vérification de la
ligne de référence, pas seulement de la correction :** un rétablissement
transitoire de la version d'origine (revid 318 → écriture revid 799, mesure,
puis restauration revid 800) a montré que la page `Irriguer` produisait déjà
**deux** paragraphes vides avant toute modification — c'est un artefact
préexistant de l'adjacence `</noinclude><includeonly>`, sans rapport avec
cette tâche. Le rendu final (revid 800) produit exactement **deux**
paragraphes vides sur `Irriguer`, identique au relevé fait sur revid 318 :
aucune régression visuelle, la correction ramène au même compte que
l'original, pas en dessous.

Revids de `Modèle:Functional item` dans l'ordre : **792** (ajout initial) →
**798** (correctif de mise en page) → **799** (mesure transitoire, contenu
revid 318) → **800** (état final, identique à 798).

### 6.2 Étape 2 — non-régression, avant de toucher aux procédés

`Irriguer` purgée et relue avant toute écriture sur les cinq pages de
procédé :

```
Item_ref -> ['0008']
Part_of -> ['Cultiver_de_la_nourriture#0##']
_INST -> ['Functional_item#14##']
```

Ni `Practice_domain`, ni `External_classification`, ni `Procédé#14##` dans
`_INST` : la branche de service n'est pas affectée. Reconfirmé une seconde
fois après la restauration finale du modèle (§6.1) — résultat identique.

### 6.3 Étape 3 — réécriture des cinq pages de procédé

Toutes les annotations manuelles et la ligne `[[Catégorie:Procédé]]`
retirées ; `Item_ref`, `Part_of`, `Item_description` inchangés ; les valeurs
passent en paramètres du modèle.

| Page | pageid | oldrevid | newrevid | Résumé |
|---|---|---|---|---|
| `Assembler` | 401 | 786 | **793** | Assembler — bascule vers le modèle (Procédé, External_classification) |
| `Braser tendre` | 402 | 787 | **794** | Braser tendre — bascule vers le modèle (Procédé, Practice_domain, alignement affiné sur Q67131697) |
| `Souder par points` | 403 | 788 | **795** | Souder par points — bascule vers le modèle |
| `Mesurer une grandeur électrique` | 404 | 789 | **796** | Mesurer une grandeur électrique — bascule vers le modèle |
| `Maintenir en position` | 405 | 790 | **797** | Maintenir en position — bascule vers le modèle |

**`Braser tendre` change de valeur d'alignement**, conformément à la
consigne : `https://www.wikidata.org/wiki/Q67131697` (« brasage tendre »)
remplace `https://en.wikipedia.org/wiki/Soldering`, qui pointait le concept
générique Q211387 (« brasage », couvrant tendre et fort). Motif consigné :
on ancre au niveau le plus précis, parce que la généralisation se dérive par
sous-classe de, et que la spécialisation ne se récupère pas d'une URL trop
large. Un export OKW réclamant une URL Wikipédia se retrouve en remontant
vers Q211387.

Wikitexte final, exemple sur `Braser tendre` :

```
{{Functional item
|Item_ref=002I
|Part_of=Assembler
|Item_description=L'apport fond, le métal de base non — c'est ce qui le sépare du soudage. Nommé au niveau où existe un référent externe stable.
|Procédé=oui
|Practice_domain=électronique, plomberie
|External_classification=https://www.wikidata.org/wiki/Q67131697
}}
```

### 6.4 Étape 4 — vérification du stockage, cinq pages purgées

| Page | `External_classification` | `Practice_domain` | `_INST` | `_ERR*` |
|---|---|---|---|---|
| `Assembler` | Q1480529 | — | `Functional_item`, `Procédé` | aucune |
| `Braser tendre` | Q67131697 | électronique, plomberie | `Functional_item`, `Procédé` | aucune |
| `Souder par points` | Q2327972 | électronique, énergie | `Functional_item`, `Procédé` | aucune |
| `Mesurer une grandeur électrique` | Q3859407 | électronique, électricité, énergie | `Functional_item`, `Procédé` | aucune |
| `Maintenir en position` | Q2306980 | — | `Functional_item`, `Procédé` | aucune |

`Practice_domain` est bien stockée en valeurs distinctes (`['électronique',
'plomberie']`, etc.), aucun préfixe d'espace — confirme que le passage par
`#arraymap` a fait le travail que `+sep=,` seul n'aurait pas fait sur une
propriété Texte. `_INST` porte `Procédé#14##` sur les cinq pages : la
catégorie est désormais posée par le modèle, plus par une ligne manuelle, et
elle reste stockée côté SMW (pas seulement affichée).

`[[Catégorie:Procédé]]` rend toujours **cinq** pages après la bascule
(`list=categorymembers`) : `Assembler`, `Braser tendre`,
`Maintenir en position`, `Mesurer une grandeur électrique`,
`Souder par points`. Conforme à l'arbitrage 1.

### 6.5 Étape 5 — deux amendements au fichier de tâche 1

**Amendement au §3.** Le §3 du fichier de tâche 1 proposait la catégorie
manuelle comme correctif au marqueur de branche du §2.2 du cadrage (présence
de `Practice_domain`), au motif que `Maintenir en position` la mettait en
défaut. Arbitrage 1 confirme et précise : **la catégorie marque
l'appartenance au référentiel des procédés, pas la réalisabilité par un
outil.** `Assembler` la porte légitimement alors qu'aucun outil ne le
réalise directement — motif, feuille ou groupement n'est pas un état stable
dans le temps : un nœud groupement d'aujourd'hui peut devenir un nœud
partagé par un outil demain (l'inverse du raisonnement qui a produit
`Assembler` lui-même, cf. tâche 1 §1). La catégorie ne doit donc pas
distinguer ces deux rôles, elle marque seulement l'appartenance à l'arbre.

**Amendement au §2.** Le §2 du fichier de tâche 1 justifiait le nom
`Braser tendre` par un découpage de Wikipédia (« l'anglais sépare là où le
français regroupe », `Soldering` vs `Brazing`). Le relevé Wikidata de la
tâche 2 (§3.3) a montré que cet argument était approximatif : l'article
anglais `Soldering` est rattaché à **Q211387**, le concept générique
couvrant brasage tendre *et* fort — Wikidata ne sépare donc pas non plus au
niveau de l'article. **Ce qui justifie réellement le nœud `Braser tendre`,
c'est l'existence de `Q67131697`** comme élément Wikidata distinct et
précisément nommé, indépendamment de la couverture Wikipédia. L'alignement
externe de la page a été corrigé en conséquence à l'étape 3 (§6.3) : il
pointe désormais Q67131697, pas l'article Wikipédia générique.

### 6.6 Ce qui a échoué

**Rien côté données.** Six écritures fonctionnelles (un modèle, cinq pages),
toutes acceptées, aucune clé `_ERR*`. Une septième et une huitième écriture
sur le modèle ont servi à mesurer puis restaurer un état de référence — pas
un échec, une vérification transitoire consignée en §6.1.

**Une hypothèse initiale erronée**, corrigée avant d'en tirer une fausse
conclusion : le premier relevé du rendu de `Irriguer` sous le modèle
non corrigé (trois paragraphes vides) a été comparé à tort à une
reconstruction manuelle du modèle d'origine (qui n'en donnait qu'un) au lieu
du modèle d'origine réellement transclus. La mesure directe sur `Irriguer`
avec le contenu exact de la revid 318 a corrigé le chiffre de référence à
deux, révélant que la comparaison initiale sous-comptait le rendu réel — pas
que le correctif était superflu : sans lui, la page serait passée de deux à
trois paragraphes vides, une régression visuelle réelle bien que mineure.
