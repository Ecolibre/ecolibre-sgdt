# Lot 11, tâche 7 — `Catégorie:Lieu` écrite, avec les trois corrections

**26 août 2026.** Deux écritures sur le wiki, aucune sur le modèle de données.
Page en révision **1003**.

---

## 1. Les trois corrections, avant d'écrire

### 1.1 — La procédure de renommage : elle gravait l'erreur de la tâche 5

**La correction était juste, et le défaut plus large que je ne le voyais.** Ma
procédure ne parlait que de `Located_at`. Écrite ainsi sur une page de
référence, elle aurait fait refaire l'erreur à chaque renommage, avec
l'autorité d'une consigne.

**Vérifié en ligne avant de réécrire**, en énumérant les 111 pages `Attribut:`
du wiki et en retenant celles de **type Page** — les seules qui peuvent
désigner un lieu — puis en cherchant, pour chacune, si l'une de ses valeurs
est un lieu. **Trois propriétés visent des lieux aujourd'hui, et trois
seulement :**

| Propriété | Portée par | Pages porteuses | Lieux visés |
|---|---|---|---|
| `Located_at` | items physiques | 41 | 6 |
| `Image_location` | pages `Fichier:` | 73 | 3 |
| `Located_in` | lieux enfants | 11 | 7 |

Douze autres propriétés de type Page sont en usage (`Instance_of`, `Part_of`,
`Depicts_specimen`, `Supplier`…) : aucune ne pointe vers un lieu.

**Le cas du Buisson, chiffré.** `Le Buisson de Cerzat` porte aujourd'hui
**0 item physique** — la migration les a tous déplacés — et pourtant **54
pages pointent encore vers lui** :

| Propriété | Pages pointant vers `Le Buisson de Cerzat` |
|---|---|
| `Located_at` | **0** |
| `Image_location` | **53** — toutes dans l'espace `Fichier:` |
| `Located_in` | **1** — `Terrain de Cyril au Buisson de Cerzat` |

**Un écart à signaler, sans trancher :** tu parles de 45 photos, j'en mesure
**53** ce jour, toutes en `Fichier:`. Je ne sais pas d'où vient la différence —
photos ajoutées depuis, ou comptage partiel d'un côté ou de l'autre. **Je n'ai
mis aucun de ces deux nombres sur le wiki** : la page dit « plusieurs dizaines
de pages de fichier », ce qui est vrai dans les deux cas et ne vieillira pas.

**Ce que j'ai écrit à la place de l'étape 2.** Elle est devenue deux étapes —
recenser, puis purger — et la procédure en compte donc quatre sections
distinctes. Le recensement donne **une méthode, pas une liste** :

1. Ouvrir `Spécial:Types/Page` pour obtenir les propriétés de type Page.
2. Pour chacune, poser une requête inverse `[[Propriété::Nom du lieu]]`. Une
   propriété qui ne rend rien ne concerne pas ce lieu.
3. Réunir toutes les pages trouvées : c'est la liste à purger.

Avec la consigne de **refaire ce recensement à chaque renommage** — « une
propriété nouvelle peut avoir été créée depuis la dernière fois, et elle
n'aura prévenu personne ». Les trois propriétés d'aujourd'hui sont citées, mais
explicitement comme **exemple** : « cette énumération est un exemple, pas la
liste de référence : c'est la requête qui fait foi ».

Et l'ordre de grandeur remplace les « 29 pages » : *pour un lieu chargé, cela
se compte en dizaines de pages, toutes propriétés confondues*, suivi du récit
du piège — le comptage n'avait porté que sur `Located_at`, les pages de
fichier et le lieu enfant sont restés en arrière sans aucun signal. La phrase
qui doit rester en tête du lecteur : **« Le nombre d'items physiques n'est
jamais le nombre de pages à purger. »**

### 1.2 — `Part_of` : erreur de fait, corrigée

J'écrivais qu'une caisse « pointe vers ce qu'elle contient par `Part_of` ».
**C'est l'inverse.** Vérifié dans `Modèle:Physical item` : la fiche retrouve
son contenu par une requête inverse, `{{#ask: [[Part_of::{{FULLPAGENAME}}]]}}`
— donc ce sont bien les objets contenus qui portent la propriété.

Texte publié :

> Le cas mobile-et-contenant — une conserve, une caisse, un camion — reste un
> item physique. Il se rattache à un lieu par `Located_at`, et ce qu'il
> contient se rattache à lui par `Part_of`. Attention au sens : **`Part_of` va
> de la partie vers le tout** — ce sont les objets contenus qui portent la
> propriété et désignent le contenant, jamais le contenant qui énumère son
> contenu. Une caisse ne déclare pas ce qu'elle contient ; chaque objet
> déclare la caisse. La fiche de la caisse retrouve ensuite son contenu par
> une requête inverse.

Sur une page de définition, l'erreur aurait été recopiée longtemps.

### 1.3 — `physical_parent` « alimente `Part_of` » : exact, vérifié

Relu dans `Modèle:Physical item`, ligne du `#set` :

```
|Part_of={{{physical_parent|}}}
```

Le paramètre de formulaire `physical_parent` alimente bien la propriété
`Part_of`. **La phrase existante est juste et reste inchangée.** Elle est de
plus cohérente avec la correction 1.2 : elle disait déjà que `physical_parent`
« pointe vers un autre item physique — une pompe dans une machine », soit la
partie désignant le tout.

---

## 2. Ce qui a été écrit

**`Catégorie:Lieu`**, deux éditions :

| Rév. | Résumé | Objet |
|---|---|---|
| 1002 | `[Lot 11][Tâche 7] Documentation — nommage, arbre, renommage, origine du rang` | le texte, en entier |
| 1003 | `[Lot 11][Tâche 7] Titres de section — retrait des backticks, qui s'affichaient littéralement` | correctif de rendu, voir §3.3 |

La page passe de 3 sections à 7 : *Définition* (avec un nouveau **Lieu, ou
item physique ?**), *Position dans le modèle*, **L'arbre des lieux**,
**Nommer un lieu**, *Champs* (enrichie), **L'origine d'un lieu, et la position
des plantations**, **Renommer un lieu**.

Sur le rang, la phrase publiée est celle du §3.4 de mon rapport, **corrigée du
point 1 de la session précédente** : aucune alerte sur les rangs 15 et 2, qui
sont justes. Ne reste que ce qui est vrai et vient de se produire trois fois —
*déplacer une plantation change son origine, donc invalide sa position ; le
rang doit être ressaisi dans la même édition que le changement de
`Located_at`* — assortie du fait qui rend la règle nécessaire : **rien ne
signalera l'oubli**, un rang devenu faux reste un nombre parfaitement valide.

**Non écrit, volontairement :** que le lignage n'existe pas (une page de
classe décrit ce qui est ; seule la conséquence pratique y est, en formulation
positive) ; les valeurs de `Location_type` (les citer figerait un vocabulaire
qu'on veut laisser émerger) ; le tableau `LOC-0001` à `LOC-0013` (il vieillira
au prochain lieu créé).

---

## 3. Les contrôles

### 3.1 — `browsebysubject` : la page ne porte aucune annotation

```
_MDAT  -> ['1/2026/8/26/21/56/59/0']
_SKEY  -> ['Lieu']
_SUBC  -> ['SGDT#14##']
```

**Trois clés, aucune annotation de données.** `_SUBC` n'était pas dans la
liste que j'annonçais (`_MDAT` et `_SKEY`) : c'est l'appartenance de la
catégorie à `Catégorie:SGDT`, un fait structurel présent avant cette écriture
et posé par le `[[Catégorie:SGDT]]` d'origine. Rien de nouveau, rien à
corriger.

Aucun des fragments cités — `Located_at`, `Part_of`, `Planting_rank`,
`articleexists`, ni le `{{#ask:}}` de la méthode de recensement — ne s'est
exécuté. Le patron `<code><nowiki>…</nowiki></code>` a tenu partout.

### 3.2 — `list=backlinks` : aucun lien perdu

Huit liens sortants, pas cinq — les trois liens vers les pages `Attribut:` se
sont ajoutés en réécrivant la procédure de renommage. Les huit sont contrôlés
**dans les deux sens** : présents dans les liens sortants de `Catégorie:Lieu`,
et `Catégorie:Lieu` présente dans les backlinks de chaque cible.

| Cible | Backlink |
|---|---|
| `Modèle:Lieu` | OK |
| `Formulaire:Lieu` | OK |
| `Registre des préfixes de site` | OK |
| `Modèle:Physical facet plant/doc` | OK |
| `Limites connues du Système de Gestion de Données Techniques` | OK |
| `Attribut:Located at` | OK |
| `Attribut:Image location` | OK |
| `Attribut:Located in` | OK |

Aucun `[[ ]]` n'a été replié à la copie — c'était le risque, les deux titres
longs étant précisément ceux qui tiennent mal sur une ligne.

`Spécial:Types/Page` **n'apparaît pas** dans les liens sortants : MediaWiki
n'enregistre jamais les pages spéciales dans `pagelinks`. Ce n'est pas un lien
perdu — vérifié dans le rendu, où il est bien un lien cliquable.

### 3.3 — Le rendu : un défaut trouvé, et corrigé

Contrôlé sur le HTML produit, pas sur un aperçu : **aucun lien rouge, aucune
erreur d'analyseur, aucune expression évaluée**, tableau des champs bien
formé, sommaire à sept sections cohérent.

**Un défaut, de mon fait.** Trois titres de section que j'avais écrits avec
des backticks — `` `LOC` ``, `` `Location_type` ``, `` `INSEE_code` `` — les
affichaient **littéralement**, dans le titre et dans le sommaire. J'avais
signalé les backticks du texte existant comme une scorie cosmétique héritée,
et j'en avais introduit trois de plus, à l'endroit le plus visible de la page.
Corrigé en révision 1003, sur les trois titres seulement.

**Les backticks du corps de texte hérité restent en place** — ils s'affichent
littéralement eux aussi. Ce n'est pas une annotation fantôme, seulement de la
mise en forme : à reprendre un jour, en connaissance de cause, pas au détour
de cette écriture.

### 3.4 — Quatrième contrôle : le lecteur qui n'a suivi aucune conversation

Relecture de la page rendue, sans rien supposer de connu.

**Nommer une nouvelle planche : oui.** La section *Nommer un lieu* suffit
seule. Le lecteur apprend que le titre est global au wiki, qu'un nom
positionnel entrera en collision au deuxième site, qu'il faut qualifier
(`Zone basse du Buisson`), qu'aucune virgule n'est admise, et que la collision
se présentera sous le masque rassurant d'un `articleexists`. Il saura nommer.

**Rattacher un plant : à moitié seulement.** Il saura *choisir* le lieu — le
critère item/lieu est explicite, et *Le rattachement ne remonte pas l'arbre*
lui dit que le niveau qu'il choisit est le seul qui répondra plus tard. Il ne
saura pas *faire*. **Trois manques, par ordre d'importance :**

1. **La page ne dit nulle part comment on crée un lieu.** `Formulaire:Lieu`
   n'est cité qu'au détour d'une cellule de tableau, à propos de
   `Location_number`. Un lecteur qui vient de choisir un nom de planche n'a
   aucun point d'entrée vers l'acte de création. **C'est le manque le plus
   gênant** : la page est celle qu'on lit *avant* de créer un lieu, et elle
   s'arrête au bord.

2. **Aucune règle pour choisir le niveau de rattachement.** La page dit que
   le choix est une décision de saisie et en donne la conséquence, mais ne
   donne pas de défaut. Un lecteur peut donc raisonnablement rattacher un
   plant au terrain. La règle manquante tiendrait en une phrase : *rattacher
   au lieu le plus fin qui existe, et créer le lieu plus fin plutôt que
   rattacher au parent « en attendant ».*

3. **L'acte de rattachement vit du côté de l'item, et n'est jamais nommé.**
   `Located_at` est décrite comme une relation, jamais comme un champ à
   remplir sur la fiche de l'item physique. Et rien ne dit qu'à la **première**
   saisie, la position se renseigne dans la même passe — la page ne parle du
   rang que pour dire ce qu'un **déplacement** lui fait.

Ces trois points sont **rapportés, non écrits** : ils dépassent les quatre
sujets de la consigne et ajoutent une règle de saisie que je n'ai pas mandat
de trancher seul. Le premier me paraît mériter une écriture courte à la
prochaine occasion.

---

## 4. État du dépôt

Trois fichiers de `travaux/` commités et poussés en fin de session
(`lot-11-tache7-cadrage.md` et `lot-11-tache7-execution.md` étaient restés non
suivis, la consigne précédente ne demandant qu'un fichier au commit).

## 5. Ce qui reste ouvert

- *Limites connues* — le défaut `#show` → `#set` sur propriété de type Page,
  et son faux positif.
- *Récapitulatif technique* — la troisième banque de références.
- Le cadrage — la dette de lignage et ce qui reste à décider.
- Les trois manques du §3.4, si tu veux les combler.
- **Tâche 6** — travail de terrain, les positions restant à relever sur place.

Le renommage d'`Extrémité de tranchée` n'est pas anticipé : il vient après le
rattachement des photos. La procédure publiée aujourd'hui le servira — et
c'est justement sur ce lieu-là que le recensement propriété par propriété
comptera, les photos du Buisson étant encore à rattacher.
