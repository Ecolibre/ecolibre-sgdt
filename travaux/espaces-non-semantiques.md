# Espaces non sémantiques — consigné, non réparé

**Date : 25 août 2026.** Une écriture (`demandes-adminsys.md`), deux
propositions non écrites.

---

## 1. `demandes-adminsys.md` — entrée ajoutée

Ajoutée en **section 2.2 Configuration**, à la suite de l'entrée sur
`$smwgChangePropagationProtection` et **distincte d'elle** : les deux
n'ont ni la même cause, ni le même remède, ni le même degré de certitude.

Contrôle après écriture, comme l'exige le garde-fou du dépôt :

```
lignes total                    : 216
sections ## / ###               : 3 / 4
entrée ajoutée                  : True
réserve NS_TEMPLATE présente    : True
2.3 Infrastructure toujours là  : True
2.4 Gouvernance toujours là     : True
```

`git diff --stat` passe de **40 insertions / 19 suppressions** (l'état
non commité au début de la session, antérieur à mon intervention) à
**83 insertions / 19 suppressions**. Mon écriture a donc ajouté
**43 lignes et n'en a supprimé aucune** — le compte de suppressions est
inchangé.

### Ce que l'entrée dit, et où elle corrige les chiffres dictés

Le fond est celui demandé. **Trois chiffres diffèrent de ceux de la
consigne, parce que je les ai comptés :**

| Dicté | Mesuré | Détail |
|---|---|---|
| deux espaces (10, 106) | **trois** | `Module` (828) est logé à la même enseigne — `Module:Source/doc` ne porte rien non plus |
| « huit `Object_description` » | **cinq** pages `/doc` existantes portent l'annotation | sur 10 pages `/doc` au total, tous espaces confondus |
| « huit `#show` » | **18 appels**, visant **9 pages** | deux appels par page, FR et EN |

Et surtout, une distinction que le comptage a fait apparaître et qui
change la portée de la demande :

**« Non documenté » a deux causes, pas une.** Sur les 9 pages `/doc`
visées par les `#show` du *Récapitulatif technique* :

| Cause | Pages | Remède |
|---|---|---|
| Espace non sémantique | **5** | la demande à fuzzy |
| **Page inexistante** | **4** | créer les pages, sans rien demander |

Les quatre absentes sont `Template:Documentation/doc`,
`Template:MermaidLine/doc`, `Template:Organic item/doc` et
`Module:Base36/doc`. **Activer les espaces ne réglerait que cinq cas sur
neuf.** L'entrée le dit en tableau, pour que personne ne mobilise
l'adminsys en croyant tout régler.

### La réserve, écrite comme demandé

Elle est dans l'entrée, en bloc citation, et l'entrée s'ouvre en
renvoyant à elle — « à discuter avec fuzzy, **pas à poser comme une
évidence** : voir la réserve ci-dessous, qui peut très bien conclure au
statu quo ».

Son contenu : SMW désactive `NS_TEMPLATE` **à dessein**, parce qu'une
page de modèle deviendrait sujet de ses propres annotations — tout
`#set` écrit dans un modèle annoterait la page du modèle en plus des
pages qui le transcluent. Les sous-pages `/doc` partagent cet espace :
on ne peut pas l'activer pour elles seules. Le gain, cinq descriptions
affichées sur une page de documentation, est à mettre en balance avec
un risque qui porte sur **les quatre modèles d'items en service**.

J'y ai ajouté une piste alternative, parce qu'une demande qui n'offre
qu'une option se discute mal : sortir les descriptions de l'espace
`Modèle`, ou remplacer les `#show` par du texte écrit à la main —
**aucune des deux ne demande quoi que ce soit à l'adminsys**.

L'entrée se clôt sur « Rien n'a été modifié ni demandé à ce jour :
entrée de constat, ouverte. »

---

## 2. *Limites connues du SGDT* — entrée proposée, non écrite

Elle prendrait le **numéro 30**, à la suite de la 29 écrite plus tôt
aujourd'hui. Mise à la forme de la page, avec les fragments de syntaxe
en `<code><nowiki>…</nowiki></code>` — patron maison obligatoire sur
cette page, qui a déjà porté trois annotations parasites :

```
# '''<code><nowiki>#show</nowiki></code> sur une page d'un espace non sémantique rend son <code>default=</code> sans aucun signal.''' Le [[Récapitulatif technique du Système de Gestion de Données Techniques]] affiche « Non documenté » depuis sa création pour cette raison, alors que les pages <code>/doc</code> concernées portent bien leurs annotations en wikitexte : les espaces <code>Modèle</code> (10), <code>Formulaire</code> (106) et <code>Module</code> (828) ne sont pas dans <code><nowiki>$smwgNamespacesWithSemanticLinks</nowiki></code>, et rien n'y est stocké. Mesuré le 25 août 2026 : <code><nowiki>[[Object_description_FR::+]]</nowiki></code> rend 0 page ; <code>browsebysubject</code> rend vide sur toute page de ces trois espaces. '''Une valeur par défaut affichée ne prouve pas que la propriété est vide : elle peut signifier que le sujet n'est pas stockable.''' Corollaire de diagnostic : avant de conclure qu'une annotation manque, vérifier que son espace de noms est sémantique — un <code>default=</code> ne distingue pas « propriété absente », « page absente » et « espace non sémantique ». Voir <code>demandes-adminsys.md</code> §2.2 pour la réserve qui empêche d'activer ces espaces à la légère.
```

**Deux ajouts au texte dicté**, que je signale plutôt que de les glisser
sans le dire :

1. **La liste des trois espaces et le nom du réglage** — sans eux,
   l'entrée décrit un symptôme sans donner de quoi le reconnaître
   ailleurs.
2. **Le corollaire de diagnostic** — un `default=` ne distingue pas
   trois situations : propriété vide, page inexistante, espace non
   sémantique. C'est ce que le comptage du §1 a établi, et c'est la
   partie réutilisable de la leçon.

Le lien vers le récapitulatif est écrit **sur une seule ligne**, pour la
raison qui fait l'objet du §3.

---

## 3. `CLAUDE.md` — amendement proposé, non écrit

**La règle existe déjà**, en tête des *Leçons de méthode* (lignes
217-222) :

> **Un retour à la ligne à l'intérieur de `[[ ]]` casse silencieusement un
> lien MediaWiki.** Aucune erreur d'API à l'écriture, mais le lien est
> absent de `pagelinks` et donc de `list=backlinks`. Toujours écrire un
> lien sur une seule ligne, et contrôler par `list=backlinks` après toute
> édition qui en ajoute un. Ne jamais replier une balise `[[ ]]` pour
> respecter une largeur de ligne, même quand le titre est long.

Ce qui est neuf n'est pas la règle, c'est **d'où vient le pli**. Je
propose donc **d'allonger la puce existante de deux phrases**, plutôt que
d'en créer une seconde qui ferait doublon :

```
- **Un retour à la ligne à l'intérieur de `[[ ]]` casse silencieusement un
  lien MediaWiki.** Aucune erreur d'API à l'écriture, mais le lien est absent
  de `pagelinks` et donc de `list=backlinks`. Toujours écrire un lien sur une
  seule ligne, et contrôler par `list=backlinks` après toute édition qui en
  ajoute un. Ne jamais replier une balise `[[ ]]` pour respecter une largeur
  de ligne, même quand le titre est long.

  **Le pli peut venir de la mise en page d'un rapport, pas du texte.** Un lien
  recopié depuis un document de `travaux/` — proposition, cadrage, note de
  passation — arrive souvent replié par la largeur du document, et le pli
  n'appartient alors pas au contenu : il appartient à l'affichage. Le remettre
  sur une seule ligne au moment de la copie n'est pas une modification du
  texte, c'est ce qui le préserve. Évité de justesse le 25 août 2026 sur
  `Modèle:Physical facet plant/doc`, dont la consigne demandait de recopier un
  texte « sans modification » : le lien vers `Catégorie:Item à facette
  végétal` y était replié sur deux lignes.
```

**Motif du choix.** Une seconde puce répétant « ne pas replier un `[[ ]]` »
diluerait la première ; le cas du 25 août n'est pas une règle nouvelle mais
la **source de faute** que la règle existante ne nommait pas. Le dépôt a
déjà connu l'inverse — deux numérotations concurrentes pour les corrections
de modèles, jusqu'à ce que `CLAUDE.md` impose une liste unique.

**Point de vigilance sur cette écriture, quand elle se fera :** `CLAUDE.md`
porte des modifications non commitées depuis le début de la session
(`git status` : `M CLAUDE.md`). Le garde-fou du dépôt demande un état propre
avant toute réécriture d'un fichier existant — donc **commiter d'abord**,
puis amender.

---

## 4. Ce qui n'a pas été fait, à dessein

- **Rien n'a été réparé.** Ni la configuration, ni les quatre pages `/doc`
  manquantes, ni les `#show` du récapitulatif.
- **Aucune écriture sur le wiki.** Les deux propositions des §2 et §3
  portent sur `Limites connues` (wiki) et `CLAUDE.md` (dépôt), et attendent
  toutes deux le feu vert.
- **La seule écriture de cette tâche est `demandes-adminsys.md`**, dans le
  dépôt, non commitée — comme les 22 autres fichiers de `travaux/` produits
  aujourd'hui.
