# Lot 4 — Numérotation des items physiques

**Pour :** session Claude Code, dépôt `~/ecolibre-sgdt`
**Cible :** `https://wiki.ecolibre.org` — MediaWiki 1.39.11, SMW 4.2.0
**Suite de :** lots 1 à 3 et mise à jour consolidée du Récapitulatif (rév. 279)
**Établi le :** 26 juillet 2026 — **révision 2**, remplace la version précédente

> **Ce qui change en révision 2 :** le code de site n'est plus déduit du wiki
> qui héberge la page. Un exemplaire peut être publié sur un wiki qui n'est pas
> celui qui le détient, donc le code voyage avec lui. Le préfixe du wiki devient
> une simple valeur par défaut à la création. Le code d'Ecolibre est `ECL`.

---

## 0. Ce qui change de nature avec ce lot

Les trois lots précédents n'ont touché que des attributs, des catégories et de
la documentation : tout était additif et se révertait par l'historique.

**Ce lot modifie un modèle, un formulaire et probablement du Lua.** Il change le
comportement du système, pas seulement ce qu'il décrit.

| Phase | Nature | Autorisation |
|---|---|---|
| 1 | écritures additives, aucun comportement modifié | validée |
| 2 | reconnaissance, aucune écriture | validée |
| 3 | modèle, formulaire, module | **arrêt — validation de Cyril requise** |

---

## 1. Le problème que ce lot résout

Aujourd'hui les items physiques partagent `Item_ref` avec les trois autres
classes et n'en sont exclus que par un filtre de catégorie dans le `#ask` de
numérotation. Leur référence est saisie à la main.

**La volumétrie.** Un exemplaire physique se compte par dizaines là où une
fonction se compte par unités. Partager une séquence de quatre caractères
revient à l'épuiser pour de l'inventaire au détriment du savoir de conception.

**L'autonomie des partenaires.** Chaque partenaire doit pouvoir numéroter son
inventaire sans demander à quiconque si une référence est libre.

**Et la circulation entre wikis.** Un exemplaire détenu par un partenaire peut
être publié sur le wiki principal. Sa référence doit rester la sienne : un
bidon de l'Atelier du Dôme reste `ADD-0007` où qu'il soit affiché. C'est la
contrainte structurante de ce lot, et elle a une conséquence directe — **le code
de site est une donnée de l'item, jamais une propriété du wiki qui l'héberge.**

Le préfixe du wiki n'est donc qu'une valeur par défaut au moment de la
création. Il ne détermine rien après coup.

**Format retenu :** `ECL-0001` — trois lettres de site, un tiret, quatre
caractères Base 36.

### Une source de vérité, pas deux

`Inventory_ref` et `Inventory_site` portent tous deux le code de site. Pour
qu'ils ne puissent pas diverger, **c'est le modèle qui compose `Inventory_ref`**
à partir du code et du numéro. Le formulaire ne saisit jamais la référence
complète.

Une remarque sur la confidentialité, pour éviter un malentendu : le modèle ne
porte aucun indicateur public/privé. Sur MediaWiki, la visibilité est une
propriété du wiki, pas de la page — publier un exemplaire signifie faire
exister sa page sur un autre wiki. C'est précisément pourquoi la référence doit
survivre au déplacement.

---

## 2. Phase 1 — Écritures additives

### 2.1 Action J — La phrase manquante au Récapitulatif

Dans la section « Lire le tableau des propriétés », ajouter à la fin :

```wikitext
Onze lignes ont ces trois colonnes vides : les propriétés de description, les
propriétés importées et les propriétés de schéma elles-mêmes ne décrivent pas
le modèle métier. La case vide est une information, pas un oubli.
```

Résumé : `[Lot 4] Action J — explication des colonnes de schéma vides`

### 2.2 Action K — `Attribut:Inventory ref`

```wikitext
[[Has type::Keyword]]
[[Property_description_FR::Référence d'inventaire d'un exemplaire physique. Composée par le modèle à partir du code du site détenteur et d'un identifiant Base 36 de 4 caractères. Elle reste attachée à l'exemplaire même s'il est publié sur un autre wiki.]]
[[Property_description_EN::Inventory reference of a physical specimen. Composed by the template from the holding site code and a 4-character Base 36 identifier. It stays with the specimen even when published on another wiki.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::code de site, tiret, identifiant Base 36]]
```

`createonly=1`. Résumé : `[Lot 4] Action K — propriété Inventory_ref`

### 2.3 Action L — `Attribut:Inventory site`

Le nom retenu est `Inventory_site` et non `Site` : `Site` sera nécessaire plus
tard pour désigner l'emplacement d'un exemplaire sur un terrain, ce qui n'a
rien à voir avec l'organisation qui le détient.

```wikitext
[[Has type::Keyword]]
[[Property_description_FR::Code à trois lettres de l'organisation qui détient l'exemplaire. Source de vérité du préfixe de la référence d'inventaire, et non déduit du wiki qui héberge la page.]]
[[Property_description_EN::Three-letter code of the organisation holding the specimen. Source of truth for the inventory reference prefix, not derived from the wiki hosting the page.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::code de site à trois lettres]]
```

`createonly=1`. Résumé : `[Lot 4] Action L — propriété Inventory_site`

### 2.4 Action M — `Modèle:Préfixe site`

Contenu du wiki courant, et rien d'autre — il sera concaténé, donc pas de saut
de ligne parasite.

```wikitext
<includeonly>ECL</includeonly><noinclude>
Code à trois lettres de l'organisation qui exploite ce wiki. Il sert de
'''valeur par défaut''' au champ de site à la création d'un item physique.

Il ne détermine pas le site d'un exemplaire déjà enregistré : un exemplaire
détenu par un partenaire et publié ici conserve le code de son détenteur. Le
code de site est une donnée de l'item, pas du wiki.

Se règle une fois à l'installation et ne change plus.

Les codes sont enregistrés dans [[Registre des préfixes de site]].
</noinclude>
```

`createonly=1`. Résumé : `[Lot 4] Action M — préfixe de site par défaut du wiki`

### 2.5 Action N — `Registre des préfixes de site`

```wikitext
Chaque organisation de la fédération dispose d'un code à trois lettres qui
préfixe les références d'inventaire de ses items physiques. Ce code permet à
chacune de numéroter son inventaire sans coordination avec les autres.

Comme un exemplaire peut être publié sur un wiki qui n'est pas celui de son
détenteur, ces codes doivent être uniques sur l'ensemble de la fédération. Une
organisation enregistre son code ici '''avant''' de l'utiliser, et un code
attribué ne se réutilise jamais, même après la fermeture d'un wiki.

{| class="wikitable"
! Code !! Organisation !! Wiki
|-
| ECL || Ecolibre || wiki.ecolibre.org
|}
```

`createonly=1`. Résumé : `[Lot 4] Action N — registre des préfixes de site`

---

## 3. Phase 2 — Reconnaissance, aucune écriture

Trois pages à lire et à rapporter intégralement.

### 3.1 `Module:Base36`

Pièce centrale, dont l'interface est inconnue. Rapporter :

- les fonctions exportées et leurs paramètres
- comment la propriété interrogée et les catégories sont déterminées : en dur
  dans le code, ou passées en argument
- comment la conversion Base 36 est faite, et **si elle suppose des majuscules**
  (recherche dans une chaîne d'alphabet, ou `tonumber(s, 36)`)
- comment les trous de séquence sont détectés

### 3.2 `Modèle:Physical item`

Le `#set` complet et la partie affichage.

### 3.3 `Formulaire:Physical item`

La définition complète du champ de référence : type, valeur par défaut,
`placeholder`, info-bulle.

### 3.4 Livrable de la phase 2

Une proposition écrite, pas une écriture. Elle doit répondre à trois questions :

1. `Module:Base36` peut-il produire la séquence d'inventaire en recevant des
   paramètres, ou faut-il un module frère ? **Dans le doute, module frère.**
   Modifier un module qui numérote vingt-et-une pages existantes n'est pas du
   même ordre que d'en écrire un nouveau.
2. Comment la séquence est-elle filtrée par code de site ? Le numéro suivant
   doit se calculer sur `[[Category:Physical item]] [[Inventory_site::<code>]]`
   et non sur l'ensemble des items physiques du wiki — sinon un wiki hébergeant
   des exemplaires de plusieurs détenteurs produirait des numéros faux.
3. Le diff exact envisagé pour le modèle et pour le formulaire.

**Puis arrêt.**

---

## 4. Phase 3 — Après validation seulement

- `Formulaire:Physical item` — un champ de code de site, pré-rempli par
  `{{Préfixe site}}` et modifiable ; un champ de numéro, pré-rempli par la
  séquence du code choisi. La référence complète n'est jamais saisie.
- `Modèle:Physical item` — poser `Inventory_site`, composer `Inventory_ref` à
  partir du code et du numéro, cesser d'écrire `Item_ref`
- `Attribut:Item ref` — retirer `Category:Physical item` de son domaine, qui
  redevient les trois classes de conception
- le module ou le module frère

### Le test d'acceptation

Aucun item physique n'existe : le test est de créer le premier, et tu en as de
vrais sur ton terrain.

1. Un bidon créé par le formulaire reçoit `ECL-0001` sans rien saisir dans le
   champ de référence, porte `Inventory_site` valant `ECL`, apparaît dans
   `Catégorie:Physical item`.
2. Un second reçoit `ECL-0002`.
3. **Le test qui valide la révision 2 :** un troisième, créé en remplaçant le
   code par `ADD`, reçoit `ADD-0001` et non `ADD-0003`. Les séquences sont bien
   indépendantes par détenteur.

Le troisième peut être supprimé ensuite, ou conservé comme exemple.

---

## 5. Ce qui n'est pas dans ce lot

**Le durcissement de `Module:Base36`** — normalisation de la casse, détection
des doublons — et **la bascule de `Item_ref` en `Keyword`**. Les deux touchent
la numérotation existante et ses vingt-et-une valeurs, et ont besoin du miroir
local qui n'est pas en service. C'est le lot 5, et l'ordre y est contraint : le
durcissement précède la bascule de type.

**Le mécanisme de publication d'un exemplaire d'un wiki vers un autre** — copie
manuelle, export/import, ou transclusion inter-wikis. Ce lot garantit que la
référence survit au déplacement ; il ne dit pas comment le déplacement se fait.
Question ouverte, à traiter avec l'ouverture des wikis partenaires.

**L'import kanban**, suspendu à la demande de Cyril.

**Les deux réglages serveur**, en attente du retour de l'adminsys.

---

## 6. Ne pas faire

- Ne pas modifier `Module:Base36` en phase 2 : la phase 2 ne comporte aucune
  écriture.
- Ne pas créer d'item physique de test avant la phase 3.
- Ne pas déduire `Inventory_site` de `{{Préfixe site}}` dans le modèle. Le
  modèle lit ce que le formulaire lui passe. C'est le formulaire, et lui seul,
  qui utilise le préfixe comme valeur par défaut.
- Ne pas toucher aux modèles et formulaires des trois autres classes.
- Ne pas changer le type de `Item_ref` : c'est le lot 5.
