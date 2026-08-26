# Lot 11, tâche 7 — exécution : encart d'état, et proposition pour `Catégorie:Lieu`

**26 août 2026.** Une écriture dans le dépôt (l'encart d'état sur le cadrage,
commitée), une proposition de wikitexte à valider. **Aucune écriture sur le
wiki.**

---

## 1. Vérification en lecture seule, avant tout le reste

Faite en premier, sur l'état réel du wiki de ce jour — pas sur les rapports.
Requêtes `action=ask` sur `[[Category:Lieu]]` et `[[Category:Physical item]]`,
comptage côté client (`format=count` rend toujours 0 sur cette installation).

### 1.1 — Combien chaque lieu porte d'items physiques aujourd'hui

**44 items physiques au total. 41 portent un `Located_at`, 3 n'en portent
aucun.**

| Lieu | Réf. | Parent | Items portés |
|---|---|---|---|
| Butte de la tranchée | LOC-0007 | Zone basse | **26** |
| Jardin de Chilhac | LOC-0011 | Appartement de Chilhac | 6 |
| Terrasse de Chilhac | LOC-0012 | Appartement de Chilhac | 5 |
| **Extrémité de tranchée** | LOC-0008 | Zone basse | **2** |
| **Au pied du pylône électrique** | LOC-0009 | Zone haute | **1** |
| Atelier appartement | LOC-0013 | Appartement de Chilhac | 1 |
| Appartement de Chilhac | LOC-0004 | Chilhac | 0 |
| Cerzat | LOC-0002 | — | 0 |
| Chilhac | LOC-0003 | — | 0 |
| Le Buisson de Cerzat | LOC-0010 | Cerzat | 0 |
| Terrain de Cyril au Buisson de Cerzat | LOC-0001 | Le Buisson de Cerzat | 0 |
| Zone basse | LOC-0005 | Terrain de Cyril | 0 |
| Zone haute | LOC-0006 | Terrain de Cyril | 0 |

**Les trois déplacements sont bien enregistrés, et rien n'a été perdu :**
26 + 2 + 1 = **29**, le compte d'origine du Buisson. Aucun item ne pointe vers
un lieu hors `Catégorie:Lieu`.

**Trois items physiques ne portent aucun lieu** — `Batterie de récupération
trotinette 1`, `Bidon 220L Bleu 1`, `Bidon 220L Bleu 2`. Ce n'est pas une
conséquence des déplacements de ce jour ; c'est un état antérieur, signalé
pour mémoire, aucune action proposée.

Les sept lieux à 0 ne sont pas vides au sens du terrain : ils portent des
enfants, pas des items. Un lieu parent n'agrège pas ce que portent ses
descendants — c'est la conséquence directe de l'absence de lignage, et c'est
documenté comme telle dans la proposition du §4.

### 1.2 — Les trois plantations déplacées portent-elles un rang ?

**Non. Aucune des trois ne porte de `Planting_rank` ni de
`Planting_rank_end`. Il n'y a donc aucune valeur devenue fausse.**

| Plantation | Lieu aujourd'hui | Rang | Fin |
|---|---|---|---|
| Consoude B14 — Le Buisson de Cerzat (ECL-0010) | Extrémité de tranchée | *(vide)* | *(vide)* |
| Consoude naine — Le Buisson de Cerzat (ECL-0011) | Extrémité de tranchée | *(vide)* | *(vide)* |
| Chayote — Le Buisson de Cerzat (ECL-0007) | Au pied du pylône électrique | *(vide)* | *(vide)* |

**Les deux seuls rangs du wiki sont ailleurs, et ils sont justes :**

| Plantation | Lieu | Rang |
|---|---|---|
| Menthe X — Le Buisson de Cerzat (ECL-0023) | Butte de la tranchée | 15 |
| Menthe bergamote — Le Buisson de Cerzat (ECL-0026) | Butte de la tranchée | 2 |

Toutes deux sont sur `Butte de la tranchée`, qui est le lieu que désignait
déjà le « A » de `A-1.5`. Origine inchangée, rangs valides — voir §2.

**Ce que ça ne dit pas.** L'absence de rang sur les trois déplacées est une
chance de calendrier, pas une protection : si l'une d'elles en avait porté un,
il serait aujourd'hui faux **sans qu'aucune erreur n'apparaisse**. SMW ne voit
qu'un nombre valide. Le prochain déplacement d'une plantation qui porte déjà
un rang produira exactement ce silence. C'est pourquoi le point est écrit dans
la proposition du §4, comme un contrôle humain à faire au moment du
déplacement.

**Rapporté, non corrigé**, conformément à la consigne.

---

## 2. Les deux corrections à mon rapport, prises en compte

**§3.4 — l'alerte sur les rangs 15 et 2 est retirée.** J'écrivais qu'ils se
réfèrent à l'origine d'un lieu quitté. C'est faux : le « A » de `A-1.5`
désignait déjà la butte de la tranchée, et `ECL-0023` comme `ECL-0026` s'y
trouvent toujours (vérifié en ligne, §1.2). L'origine n'a pas changé, les deux
rangs sont justes, il n'y a rien à faire vérifier par Cyril sur ce point.

Ce qui reste vrai de ce paragraphe, et qui vient de se produire trois fois :
**une plantation qui change de lieu change d'origine, donc son rang doit être
ressaisi.** C'est cette formulation-là — et elle seule — qui passe dans
`Catégorie:Lieu`.

**§5 — la tâche 6 reste ouverte, et ce n'est pas une dette technique.** Ma
question (« faut-il la rouvrir ou la déclarer close ? ») n'avait pas lieu
d'être : les positions restent à relever sur le terrain, c'est un travail de
Cyril, pas un arriéré d'outillage. L'encart d'état écrit au §3 le dit ainsi,
sans euphémisme, et la question disparaît.

---

## 3. A — L'encart d'état sur le cadrage : **fait**

`travaux/lot-11-cadrage-lieux.md` s'ouvre désormais sur un encart daté du
26 août. Il dit : document d'origine du 17 août, non réécrit et qui ne le sera
pas ; six décisions changées, listées une par une avec ce qui a été fait à la
place ; la liste des passages périmés ; ce qui reste ouvert. Renvoi à
`lot-11-tache7-cadrage.md` §1 pour les écarts et §2 pour l'état des tâches.

Les six décisions nommées : **1.4** (le titre), **1.5** (motif et préfixe),
**1.9** (le rang et le verrou supposé), **1.10** (le lignage), **§2** (le
hameau exclu, puis créé), **§3/§0** (le verrou généralisé à tort).

Passages périmés listés : §0 livraisons, §0 exclusions, décision 1.3 (son
motif seul — la décision tient), 1.4 en entier, 1.5 motif et préfixe, 1.9
verrou, 1.10, §2 l'arbre dessiné, §3 état attendu (verrou + écart 26/29
inexistant), §5 arbitrages 1 et 2, §6 renvois au verrou.

Et, en clair : **la tâche 6 reste ouverte — travail de terrain de Cyril, les
positions restant à relever sur place** ; l'arbitrage 2 (voie de calcul du
lignage) n'a jamais été tranché.

**Commit `d25dbe6`**, un seul fichier :

```
travaux/lot-11-cadrage-lieux.md | 55 +++++++++++++++++++++++++++++++++++++++++
1 file changed, 55 insertions(+)
```

**55 insertions, 0 suppression** — le contrôle demandé par `CLAUDE.md` après
tout commit. Aucune ligne existante du cadrage n'a été touchée, seul l'ajout
en tête.

*Note :* `travaux/lot-11-tache7-cadrage.md` reste non suivi par git, la
consigne étant de ne commiter que ce seul fichier. Il est présent sur le
disque et synchronisé par Syncthing ; à commiter à l'occasion.

---

## 4. B — Proposition : `Catégorie:Lieu` enrichie

**Rien n'est écrit sur le wiki. Ceci est un texte à valider.**

### 4.1 — Ce qui change, et pourquoi ainsi

La page fait aujourd'hui trois sections — *Définition*, *Position dans le
modèle*, *Champs* — et ne dit rien de ce qu'il faut savoir **avant** de créer
un lieu. Sept sujets manquent : le critère item/lieu, la profondeur, le
redécoupage, le nommage, le renommage, `Location_type`, l'origine du rang.

**J'ai écrit pour quelqu'un qui n'a suivi aucune de ces conversations** :
aucun renvoi à un lot, à un rapport ou à une date de décision ; les seules
dates citées sont celles de mesures (le coût d'une purge), parce qu'elles
disent quand le chiffre a été relevé. Chaque règle est suivie de la raison
qui la rend nécessaire — une règle sans raison ne survit pas à la première
personne pressée.

**Trois choses volontairement absentes**, et il faut le dire :

- **Le lignage.** La page ne mentionne nulle part que la fermeture transitive
  n'existe pas : une page de classe décrit ce qui est, pas ce qui manque. Mais
  la **conséquence** pratique y est, en formulation positive — un lieu porte
  ce qui lui est rattaché directement, le rattachement ne remonte pas l'arbre.
  C'est ce qu'un lecteur doit savoir pour saisir au bon niveau.
- **Les valeurs de `Location_type`.** Aucune liste, pas même à titre
  d'exemple : les citer figerait cinq valeurs tirées de cinq cas, ce que le
  modèle s'interdit explicitement. J'utilise l'exemple d'origine — une planche
  préparée n'est pas un pied de pylône — plutôt que les valeurs en place.
- **Le tableau des références `LOC-0001` à `LOC-0013`.** Il est dans le wiki,
  interrogeable, et il bougera au prochain lieu créé. Une table recopiée dans
  une page de documentation serait fausse aussitôt.

**Sur la forme.** Tout fragment de syntaxe est en
`<code><nowiki>…</nowiki></code>` : les backticks ne protègent rien en
wikitexte, et un exemple d'annotation non échappé s'exécuterait — la page de
classe se mettrait à porter les faits qu'elle décrit. *À signaler sans le
corriger ici :* le texte déjà en place utilise des backticks, qui s'affichent
littéralement sur le wiki. C'est une scorie cosmétique, pas une annotation
fantôme ; à reprendre un jour, pas dans cette écriture.

**Un lien wiki ne doit jamais être replié sur deux lignes** — il disparaîtrait
silencieusement de `pagelinks`. Aucun `[[ ]]` du bloc ci-dessous n'est plié,
même quand le titre est long : à recopier tel quel, sans reformater.

### 4.2 — Le wikitexte proposé, en entier

Les sections *Définition*, *Position dans le modèle* et le paragraphe
`Place_name` de *Champs* sont **repris sans modification**. Tout le reste est
nouveau.

```wikitext
== Définition ==

Une entité physique stable — terrain, bâtiment, pièce — qui héberge zéro, un
ou plusieurs items physiques. Un lieu n'a ni fonction à remplir, ni solution
qui la remplit, ni route d'approvisionnement, ni niveau de maturité : ce n'est
pas une cinquième classe de la chaîne fonctionnel → organique → référencé →
physique, c'est une entité de localisation, à part.

Un lieu peut avoir un lieu parent unique (`Located_in`), à la différence de
`Part_of` qui est multivaluée sur les classes de conception. Un item physique
s'y rattache par `Located_at`, jamais par `Part_of` : un plant n'est pas un
composant de son terrain, il s'y trouve.

'''`Located_at` et `physical_parent` ne se confondent pas''', alors que la
classe physique porte les deux : `physical_parent` (champ du formulaire
physique, alimente `Part_of`) dit « installé dans » et pointe vers un autre
item physique — une pompe dans une machine. `Located_at` dit « se trouve à »
et pointe vers un lieu — la machine sur son site. Un item physique peut
renseigner l'un, l'autre, les deux, ou aucun ; jamais l'un à la place de
l'autre.

Cette catégorie est posée automatiquement par [[:Modèle:Lieu|Modèle:Lieu]].
Elle ne doit jamais être ajoutée à la main : elle vaut appartenance à la
classe, pas navigation.

=== Lieu, ou item physique ? ===

La question se pose vraiment : une planche de culture, un coin d'atelier, un
pied de pylône — lieu ou objet ?

'''Le critère : un item physique est quelque part, un lieu est un quelque
part.''' Si la question « où est-ce ? » a pour réponse la chose elle-même,
c'est un lieu.

Une planche de culture ne se trouve pas « sur » autre chose que le terrain qui
la contient : elle '''est''' l'endroit. C'est un lieu. Une caisse posée sur
cette planche, en revanche, se trouve à un endroit, et pourrait se trouver
ailleurs demain : c'est un item physique, même si elle contient d'autres
choses. '''Le cas mobile-et-contenant — une conserve, une caisse, un camion —
reste un item physique''' : il pointe vers un lieu par
<code><nowiki>Located_at</nowiki></code>, et vers ce qu'il contient par
<code><nowiki>Part_of</nowiki></code>.

'''La règle « ce qui a une adresse postale est un lieu » ne fonctionne
pas''', et il vaut mieux savoir pourquoi que la redécouvrir : elle ne
discrimine rien (deux lieux distincts partagent souvent une adresse), la
plupart des lieux n'en ont pas, et surtout un item physique doit pointer vers
un item référencé dont il est l'exemplaire — or une planche de culture n'est
l'instance d'aucun modèle d'origine. La faire entrer par la classe physique
est un cul-de-sac, pas seulement une inélégance.

== Position dans le modèle ==

Hors chaîne. Ne descend d'aucune des quatre classes de conception et n'en a
aucune comme parente ; seul [[Attribut:Located at|Located_at]] relie un item
physique à un lieu.

== L'arbre des lieux ==

=== La profondeur n'est pas bornée, et les niveaux n'ont pas de nom ===

Un lieu a au plus un parent, par <code><nowiki>Located_in</nowiki></code>. La
propriété est réflexive — un lieu pointe vers un lieu — et cela suffit à toute
profondeur : '''rien dans le modèle ne dit combien de niveaux il y a, ni
comment ils s'appellent.'''

« Zone », « planche », « parcelle », « secteur » sont des mots d'usage. Ce ne
sont ni des classes, ni des propriétés, ni des valeurs imposées : rien
n'enregistre qu'une zone serait au-dessus d'une planche. '''Deux branches
n'ont pas à avoir la même profondeur''' — une commune peut porter directement
un jardin, comme elle peut porter un hameau qui porte un terrain qui porte une
zone qui porte une butte.

Conséquence pratique : ne pas chercher « le bon niveau » dans une nomenclature
qui n'existe pas. Créer le lieu dont on a besoin, et le rattacher à celui qui
le contient.

=== Un redécoupage au même niveau est un renommage, pas un enfantement ===

Quand un lieu se subdivise dans les faits, la tentation est d'en faire des
enfants. C'est souvent faux.

Exemple. Un terrain est partagé en une zone basse et une zone haute. Le jour
où une seconde tranchée apparaît au milieu, il en faut trois : basse,
intermédiaire, haute — '''les trois au même niveau''', les trois enfants du
terrain. Ce n'est pas une subdivision de la zone haute : c'est un redécoupage.
L'opération est donc un '''renommage''' de ce qui existe, plus une création —
et le renommage a une procédure, voir plus bas.

Le test, quand le doute se présente : le lieu existant '''contient'''-il le
nouveau, ou lui '''cède'''-il du terrain ? Contenir donne un enfant. Céder
donne un redécoupage.

=== Le rattachement ne remonte pas l'arbre ===

Un item physique est rattaché à '''un seul lieu''' : celui qui le porte
directement. Une fiche de lieu affiche ses enfants directs, et les items
directement rattachés à lui — '''elle n'agrège pas ce que portent ses
descendants.'''

Un plant rattaché au terrain n'apparaîtra donc pas dans la fiche de la butte,
et un plant rattaché à la butte n'apparaîtra pas dans celle du terrain.
'''Choisir le niveau de finesse est une décision de saisie''', pas un détail
de forme : c'est ce niveau-là, et lui seul, qui répondra plus tard à la
question « qu'y a-t-il ici ? ».

== Nommer un lieu ==

'''Le titre de la page est le nom du lieu''', et c'est par lui qu'on le
désigne partout ailleurs. Il mérite donc d'être choisi une fois pour toutes,
avant la création.

'''Un titre est global au wiki entier, jamais relatif à son parent.'''
MediaWiki n'a pas d'espace de noms par branche : « Zone basse » n'est pas
« la zone basse de ce terrain-ci », c'est un titre unique pour tout le wiki.
Le lieu parent ne fait pas partie du titre et ne désambiguïse rien.

'''D'où la règle : qualifier dès qu'un nom est positionnel ou générique.'''
Un nom positionnel — zone basse, zone haute, coin nord, allée du fond —
convient à tous les sites du monde, donc entrera en collision au deuxième
site documenté. « Zone basse du Buisson » n'a pas ce défaut. Un nom déjà
qualifié géographiquement n'a rien à corriger.

'''Et la collision ne se présentera pas comme une collision.''' La création
échouera sur un
<code><nowiki>articleexists</nowiki></code> — « cette page existe déjà » —
ce qui ressemble à une bonne nouvelle. La tentation sera de réutiliser la
page trouvée, qui décrit un tout autre endroit, et d'y raccrocher des items
qui ne s'y trouvent pas. '''Devant un <code><nowiki>articleexists</nowiki></code>
sur un nom de lieu, la première chose à faire est de regarder où se trouve le
lieu déjà enregistré''' — pas de réutiliser sa page.

'''Aucune virgule dans un titre de lieu.''' La virgule est le délimiteur
multi-valeurs partout dans le modèle : un titre qui en contient casse le
découpage partout où il est cité.

== Champs ==

`Place_name` ne recopie pas le titre de la page : elle sert uniquement aux
lieux dont le nom d'usage diffère du titre (abréviation, nom local, alias).
Laissée vide, la page affiche le titre par défaut — inutile de la dupliquer
quand les deux coïncident.

{| class="wikitable"
! Champ !! Ce qu'il porte
|-
| <code><nowiki>Located_in</nowiki></code> || Le lieu parent, '''unique''' et facultatif : une commune n'en a pas. Ne jamais y mettre autre chose qu'un lieu.
|-
| <code><nowiki>Location_number</nowiki></code> || La référence du lieu, valeur '''non préfixée''' sur quatre caractères. Attribuée par [[Formulaire:Lieu|le formulaire]], jamais saisie à la main : le compteur est en production et une valeur inventée risque un doublon silencieux.
|-
| <code><nowiki>Location_site</nowiki></code> || Le préfixe d'affichage, <code><nowiki>LOC</nowiki></code>. La fiche compose les deux et affiche <code><nowiki>LOC-0007</nowiki></code>. Voir plus bas.
|-
| <code><nowiki>Location_type</nowiki></code> || La nature du lieu, en texte libre. Facultatif. Voir plus bas.
|-
| <code><nowiki>INSEE_code</nowiki></code> || Les communes seulement. Voir plus bas.
|-
| <code><nowiki>Postal_address</nowiki></code>, <code><nowiki>Latitude</nowiki></code>, <code><nowiki>Longitude</nowiki></code> || Facultatifs, et sans effet sur l'arbre : ce sont des descriptions, pas des rattachements.
|}

=== Le préfixe `LOC` ===

'''<code><nowiki>LOC</nowiki></code> n'est pas le code d'une
organisation.''' Les items physiques portent un préfixe qui dit à qui ils
appartiennent ; les lieux, non — une commune, un hameau, un terrain public ne
sont les biens de personne. <code><nowiki>LOC</nowiki></code> identifie les
lieux publiés sur ce wiki, et rien d'autre. Les préfixes en usage sont tenus
dans [[Registre des préfixes de site]].

Les lieux ont leur '''propre banque''' de références, distincte de celles des
items : <code><nowiki>LOC-0001</nowiki></code> et une référence d'item portant
le même numéro ne se contredisent pas, elles ne comptent pas la même chose.

=== `Location_type` : à valeurs libres, et à laisser ouvert ===

<code><nowiki>Location_type</nowiki></code> est '''descriptive''' : elle dit
la nature d'un lieu là où le modèle ne distingue rien — une planche préparée
et un pied de pylône ne sont pas la même chose, alors que l'arbre les traite
pareil.

'''Elle n'encode pas le niveau dans l'arbre.''' C'est
<code><nowiki>Located_in</nowiki></code> qui porte la hiérarchie, et deux
lieux de même type peuvent se trouver à des profondeurs différentes.

'''Aucune liste de valeurs n'est fermée, et il ne faut pas en fermer une
maintenant.''' Le vocabulaire est laissé à émerger sur plusieurs dizaines de
lieux avant d'être consolidé : figer quelques valeurs tirées de quelques cas
reproduirait en petit la nomenclature rigide que ce système évite. Le champ
peut donc rester vide — « non renseigné » est une réponse valide, pas un
oubli.

=== `INSEE_code` : un identifiant recopié, pas une assertion ===

Réservé aux communes. '''C'est un littéral de jointure''' — un identifiant
externe recopié pour permettre un rapprochement — et '''non''' une
affirmation que cette page serait la commune. La page est le lieu tel qu'on le
documente ici ; elle ne prétend rien sur l'entité administrative.

De type Texte et non Nombre : un code INSEE peut commencer par un zéro et
contenir une lettre (Corse, <code><nowiki>2A</nowiki></code> /
<code><nowiki>2B</nowiki></code>).

'''Le code postal n'identifie pas une commune''' — deux communes voisines en
partagent couramment un. Il reste un élément d'adresse, dans
<code><nowiki>Postal_address</nowiki></code>.

== L'origine d'un lieu, et la position des plantations ==

'''Un lieu a une origine : le point d'où l'on compte.''' Un bout de butte, un
coin de planche, l'entrée d'une allée.

'''Cette origine n'est enregistrée nulle part.''' Elle relève de la
convention locale, tenue par qui connaît le terrain. Le wiki ne la connaît
pas et ne peut donc rien vérifier à son sujet.

La position d'une plantation, <code><nowiki>Planting_rank</nowiki></code>, se
compte en '''mètres entiers depuis l'origine du lieu qui la porte'''. C'est un
début de segment ; <code><nowiki>Planting_rank_end</nowiki></code> en donne la
fin, facultative. La convention complète est décrite dans [[:Modèle:Physical facet plant/doc|la documentation de la facette végétale]].

Deux conséquences, et la seconde est un piège :

'''1. Les positions ne sont pas comparables d'un lieu à l'autre.''' « 3 » sur
une butte et « 3 » sur une autre ne désignent rien de commun. Trier ou
comparer des positions à travers plusieurs lieux n'a pas de sens.

'''2. Déplacer une plantation d'un lieu à un autre change son origine, donc
invalide sa position.''' Le rang doit être ressaisi — ou vidé — dans la même
édition que le changement de <code><nowiki>Located_at</nowiki></code>.

'''Rien ne signalera l'oubli.''' Un rang devenu faux reste un nombre
parfaitement valide : aucune erreur n'apparaît, aucune requête ne le détecte,
la fiche l'affiche comme si de rien n'était. C'est un contrôle humain, à faire
au moment du déplacement et pas après.

== Renommer un lieu ==

'''Le titre d'un lieu est recopié dans les données.''' Chaque item physique
qui pointe vers ce lieu stocke le titre comme valeur : renommer la page ne
suffit pas à mettre les données à jour. Une redirection est ici '''porteuse de
données''', pas seulement un confort de navigation.

Quatre étapes, dans cet ordre :

# '''Renommer la page en laissant la redirection.''' C'est le comportement par défaut de MediaWiki : ne pas décocher la case.
# '''Purger toutes les pages qui pointent vers ce lieu''' par <code><nowiki>Located_at</nowiki></code>. C'est le reparse de ces pages qui fait basculer la valeur stockée vers le nouveau titre. Ordre de grandeur mesuré le 24 août 2026 sur un lieu portant l'essentiel des plantations : '''29 pages'''.
# '''Ne pas supprimer la redirection avant la fin de la purge.''' La retirer trop tôt fait retomber la valeur stockée sur l'ancien titre, alors même qu'aucune page annotante n'a été modifiée.
# '''Contrôler sur deux ou trois pages annotantes''' en lisant les faits réellement stockés, pas en regardant la fiche. L'affichage suit la redirection et paraîtra correct dans tous les cas — il ne prouve rien.

Le comportement de fond, qui vaut pour toutes les propriétés pointant vers une
page et pas seulement pour les lieux, est consigné dans [[Limites connues du Système de Gestion de Données Techniques|Limites connues du SGDT]].

[[Catégorie:SGDT]]
```

### 4.3 — Contrôles à faire au moment de l'écriture

Trois, et aucun n'est facultatif :

1. **`browsebysubject` sur `Catégorie:Lieu` après l'écriture.** La page ne
   doit porter que `_MDAT` et `_SKEY`. Une page de classe qui se met à porter
   les faits qu'elle décrit pollue le modèle de données — c'est déjà arrivé
   sur *Limites connues*.
2. **`list=backlinks` sur les quatre pages liées** — `Modèle:Lieu`,
   `Formulaire:Lieu`, `Registre des préfixes de site`,
   `Limites connues du Système de Gestion de Données Techniques`,
   `Modèle:Physical facet plant/doc` — pour vérifier qu'aucun lien n'a été
   perdu par un repli de ligne à la copie.
3. **Relire l'aperçu, mais ne rien conclure d'un aperçu tronqué** : le compte
   qui fait foi est celui des liens et des faits, pas le rendu.

---

## 5. Arrêt ici

Conformément à la consigne, je m'arrête après B. Ne sont **pas** faits, et
attendent :

- l'écriture de `Catégorie:Lieu` sur le wiki, après validation du texte ci-dessus ;
- *Limites connues* — le défaut `#show` → `#set` sur propriété de type Page,
  et son faux positif ;
- *Récapitulatif technique* — la troisième banque de références ;
- le cadrage — la dette de lignage et ce qui reste à décider.

**Et pas davantage :** le renommage d'`Extrémité de tranchée` en « Butte de
l'extrémité amont de la tranchée principale » n'est pas anticipé. Il viendra
après le rattachement des photos, pour que le test porte sur un état complet.
