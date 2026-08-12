# Lot 4 — Phase 3

**Pour :** session Claude Code, dépôt `~/ecolibre-sgdt`
**Suite de :** lot 4 rév. 2, phases 1 et 2 (révisions 280 à 284)
**Établi le :** 26 juillet 2026

---

## 0. Ce que la phase 2 a changé à la conception

`Module:Base36` extrait sa valeur par `clean:match("[%w]+")`, qui s'arrête au
premier caractère non alphanumérique. `ECL-0001` y devient `ECL` — et `ECL` est
un nombre Base 36 syntaxiquement valide, donc `tonumber` réussit et renvoie un
résultat faux sans déclencher la moindre erreur.

**Le module ne doit donc jamais voir de référence préfixée.**

La phase 2 proposait d'isoler le numéro avec `{{#sub:}}`. Deux raisons de ne pas
retenir cette voie :

1. Les fonctions de chaîne de ParserFunctions (`#sub`, `#len`, `#pos`,
   `#replace`, `#explode`) sont **désactivées par défaut** et dépendent d'un
   réglage serveur — que personne ne peut modifier avant le retour de
   l'adminsys.
2. Même disponibles, elles feraient dépendre la numérotation d'un découpage de
   chaîne à position fixe. C'est le genre de dépendance qui casse le jour où un
   code de site fait deux ou quatre lettres.

**La solution retenue supprime le problème au lieu de le contourner : le numéro
est stocké séparément.** Le modèle compose la référence lisible à partir du code
et du numéro ; les requêtes de numérotation portent sur le numéro seul, qui
n'a jamais de préfixe à retirer.

Trois propriétés, une seule vérité par fait :

| Propriété | Contenu | Rôle |
|---|---|---|
| `Inventory_site` | `ECL` | qui détient l'exemplaire |
| `Inventory_number` | `0001` | rang dans la séquence de ce détenteur |
| `Inventory_ref` | `ECL-0001` | référence lisible, composée par le modèle |

`Module:Base36` reste **inchangé**. Aucune écriture Lua dans ce lot.

### Le point ouvert de la phase 2 se dissout

La phase 2 signalait que Page Forms ne recalcule pas un `default=` quand un
autre champ change en direct, et laissait la question ouverte.

Elle ne se pose pas. On ne **génère** un numéro que pour un exemplaire détenu
par l'organisation de ce wiki. Publier l'exemplaire d'un partenaire consiste à
recopier une référence qui existe déjà — le numéro est saisi, pas calculé.

Le filtre de la séquence porte donc sur `{{Préfixe site}}`, le code du wiki, et
non sur la valeur du champ. Il est statique et calculable au rendu.

---

## 1. Vérifications préalables

Deux lectures avant toute écriture.

**1.1 — `{{Préfixe site}}` rend exactement `ECL`.** C'est la seule chose de la
phase 1 qui puisse corrompre chaque référence en silence. Transclure le modèle
sur une page de test ou via `action=parse&text={{Préfixe site}}` et vérifier
qu'il ne sort ni espace, ni saut de ligne, ni balise résiduelle.

**1.2 — La partie affichage de `Modèle:Physical item`.** Le §2.7 du rapport de
phase 2 ne rapporte que le `#set`. Le tableau d'affichage utilise très
probablement `{{{Item_ref}}}` et devra suivre. Le lire avant de rédiger le diff.

---

## 2. Action O — `Attribut:Inventory number`

```wikitext
[[Has type::Keyword]]
[[Property_description_FR::Rang d'un exemplaire physique dans la séquence de numérotation de son détenteur. Identifiant Base 36 de 4 caractères, sans préfixe.]]
[[Property_description_EN::Rank of a physical specimen in its holder's numbering sequence. Four-character Base 36 identifier, without prefix.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::identifiant Base 36, 4 caractères]]
```

`createonly=1`. Résumé : `[Lot 4] Action O — propriété Inventory_number`

---

## 3. Action P — `Formulaire:Physical item`

Remplacer le champ unique `Item_ref` par deux champs. Le reste du formulaire ne
bouge pas.

```wikitext
{{{field|site_code|mandatory|default={{Préfixe site}}|size=5}}}
{{{field|ref_number|mandatory|default={{#invoke:Base36|next|{{#ask: [[Category:Physical item]] [[Inventory_site::{{Préfixe site}}]] [[Inventory_number::+]] |?Inventory_number= |sort=Inventory_number |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }}|placeholder=0001}}}
```

La structure du `#ask` reprend celle déjà en place dans les trois formulaires de
conception — même `sort`, même `order`, même `default=0000`. Seuls la catégorie
et la propriété changent.

**Point à vérifier au rendu :** que `{{Préfixe site}}` s'expanse bien à
l'intérieur du `#ask` imbriqué dans le `default=`. Si ce n'est pas le cas,
remonter plutôt que d'écrire le code en dur.

Prévoir aussi les info-bulles, dans l'esprit des formulaires existants : le code
de site n'est à modifier que pour publier l'exemplaire d'un partenaire, auquel
cas le numéro doit être recopié depuis la source et non laissé au calcul.

Résumé : `[Lot 4] Action P — champs code de site et numéro d'inventaire`

---

## 4. Action Q — `Modèle:Physical item`

Dans le `#set`, remplacer la ligne `Item_ref` par trois lignes :

```wikitext
|Inventory_site={{{site_code|}}}
|Inventory_number={{{ref_number|}}}
|Inventory_ref={{{site_code|}}}-{{{ref_number|}}}
```

Les quatre autres lignes du `#set` — `Item_description`, `Instance_of`,
`Part_of`, `Serial_number` — ne changent pas.

Mettre à jour la partie affichage en conséquence, en montrant `Inventory_ref`
là où figurait `Item_ref`.

Résumé : `[Lot 4] Action Q — Modèle:Physical item passe à la numérotation d'inventaire`

---

## 5. Action R — `Attribut:Item ref`

Retirer la ligne `[[Property_domain::Category:Physical item]]`. Le domaine
redevient les trois classes de conception.

C'est la seule suppression de ligne de tout le lot. Vérifier que le diff ne
retire que celle-là.

Résumé : `[Lot 4] Action R — Item_ref ne s'applique plus aux items physiques`

---

## 6. Contrôles

1. Le tableau des propriétés du Récapitulatif affiche vingt-deux lignes. Onze
   restent vides en colonnes de schéma — les quatre de description, les quatre
   importées et les trois de schéma. La phrase de l'action J reste donc exacte.
2. `Attribut:Item ref` ne liste plus que trois classes en domaine.
3. `list=categorymembers` sur les quatre classes : toujours 19, 2, 0, 0 avant le
   test d'acceptation.
4. Les trois formulaires de conception sont inchangés : leur `#ask` de
   numérotation doit être identique au wikitexte relevé au §2.5 du rapport de
   phase 2.

---

## 7. Test d'acceptation

Aucun item physique n'existe. Le test consiste à créer les premiers, et Cyril en
a de vrais sur son terrain.

1. Créer un bidon par le formulaire sans toucher aux deux champs pré-remplis.
   Attendu : `Inventory_site` = `ECL`, `Inventory_number` = `0001`,
   `Inventory_ref` = `ECL-0001`, appartenance à `Catégorie:Physical item`,
   aucune valeur d'`Item_ref`.
2. En créer un second sans rien toucher. Attendu : `0002`.
3. En créer un troisième en remplaçant le code par `ADD` et le numéro par
   `0007`. Attendu : `ADD-0007`, et le quatrième exemplaire créé normalement
   doit recevoir `0003` — pas `0008`. C'est ce point qui prouve que la séquence
   locale ignore les exemplaires d'un autre détenteur.

Le troisième peut être conservé comme exemple ou supprimé par Cyril, qui a les
droits nécessaires.

---

## 8. Dette relevée en phase 2, hors périmètre

À consigner, pas à corriger dans ce lot.

**Le filtre de catégorie de la séquence de conception est recopié à l'identique
dans les trois formulaires.** Trois copies d'une même règle : si l'une est
modifiée sans les autres, les séquences divergent silencieusement.

**`Template:Item numbering audit` interroge `[[Item_ref::+]]` sans aucun filtre
de catégorie.** La détection des trous porte sur tout le wiki. C'est sans
conséquence aujourd'hui, et ce lot améliore même la situation puisque les items
physiques cesseront de porter `Item_ref` — mais la règle n'est écrite nulle
part.

**La section « Règles implicites » du Récapitulatif fond ces deux mécanismes en
un seul.** Elle affirme que la séquence partagée tient au `#ask` de
numérotation, alors qu'il existe deux requêtes distinctes aux filtres
différents. À reformuler avec le lot 5.

---

## 9. Ne pas faire

- Ne pas modifier `Module:Base36`. Ce lot ne contient aucune écriture Lua.
- Ne pas utiliser `{{#sub:}}` ni aucune fonction de chaîne de ParserFunctions.
- Ne pas toucher aux trois formulaires de conception ni à leurs modèles.
- Ne pas corriger la dette du §8.
- Ne pas créer d'items de test en dehors du §7, et les créer par le formulaire
  et non par écriture directe : c'est le formulaire qu'on teste.
