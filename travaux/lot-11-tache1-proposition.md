# Lot 11 — tâche 1 : les quatre propriétés (proposition)

2026-08-21. Aucune écriture wiki dans cette passe — reconnaissance et
rédaction seulement. Rien n'est créé tant que Cyril n'a pas validé.

Décisions actées, rappelées ici pour mémoire :
- titre des lieux = `ECL-NNNN` seul, libellé dans `Place_name` ;
- séquence de références **partagée** avec les items physiques : le
  premier lieu prend `0043`, à la suite des plantations existantes
  (dernier `Inventory_number` observé : `0042`, lot 11 tâche 0) ;
- `Location_number` est une propriété distincte, mais le compteur est
  commun.

## 1. Format maison — lu, pas supposé

### Attribut:Inventory number
```
[[Has type::Keyword]]
[[Property_description_FR::Rang d'un exemplaire physique dans la séquence de numérotation de son détenteur. Identifiant Base 36 de 4 caractères, sans préfixe.]]
[[Property_description_EN::Rank of a physical specimen in its holder's numbering sequence. Four-character Base 36 identifier, without prefix.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::identifiant Base 36, 4 caractères]]
```

### Attribut:Inventory ref
```
[[Has type::Keyword]]
[[Property_description_FR::Référence d'inventaire d'un exemplaire physique. Composée par le modèle à partir du code du site détenteur et d'un identifiant Base 36 de 4 caractères. Elle reste attachée à l'exemplaire même s'il est publié sur un autre wiki.]]
[[Property_description_EN::Inventory reference of a physical specimen. Composed by the template from the holding site code and a 4-character Base 36 identifier. It stays with the specimen even when published on another wiki.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::code de site, tiret, identifiant Base 36]]
```

### Attribut:Inventory site
```
[[Has type::Keyword]]
[[Property_description_FR::Code à trois lettres de l'organisation qui détient l'exemplaire. Source de vérité du préfixe de la référence d'inventaire, et non déduit du wiki qui héberge la page.]]
[[Property_description_EN::Three-letter code of the organisation holding the specimen. Source of truth for the inventory reference prefix, not derived from the wiki hosting the page.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Physical item]]
[[Property_range::code de site à trois lettres]]
```

### Attribut:Part of — exemple de propriété Page multivaluée
```
[[Has type::Page]]
[[Property_description_FR::Lien vers un assemblage parent.]]
[[Property_description_EN::Link to a parent assembly.]]
[[Property_cardinality::multiple]]
[[Property_domain::Category:Functional item]]
[[Property_domain::Category:Organic item]]
[[Property_domain::Category:Referenced item]]
[[Property_domain::Category:Physical item]]
[[Property_range::même classe que le sujet]]
```

**Forme exacte des cinq annotations** — dans cet ordre systématique,
jamais d'`Allows value` sauf énumération fermée (vu sur `Specimen_status`,
absent des quatre exemples ci-dessus) :
1. `Property_description_FR` — une phrase, parfois deux, jamais de liste.
2. `Property_description_EN` — traduction directe de la FR, même structure
   de phrase.
3. `Property_cardinality` — `single` ou `multiple`, jamais autre chose.
4. `Property_domain` — une ligne `[[Property_domain::Category:X]]` par
   catégorie ; répétée (pas de virgule) quand plusieurs classes partagent
   la propriété, comme sur `Part_of`.
5. `Property_range` — description humaine du format attendu, jamais un
   type SMW ni une regex.

`Has type` précède toujours ces cinq lignes, jamais après.

**Écart à signaler, pas à corriger seul** : `Inventory_number`,
`Inventory_ref` et `Inventory_site` sont tous trois `Keyword`, pas `Text`
— cohérent avec leur rôle d'identifiants à égalité exacte, interrogés en
conditions `#ask` plutôt qu'en recherche plein texte. La consigne de cette
tâche demande `Text` pour les quatre nouvelles propriétés. Pour
`Location_type` et `INSEE_code`, `Text` est défendable (pas de comparaison
de tri Base36 dessus). Pour **`Location_number`**, en revanche, la logique
est identique à `Inventory_number` — c'est le même genre de valeur, triée
en `order=desc` pour retrouver le maximum courant (voir section 5). Signalé
ici pour arbitrage ; le wikitexte de la section 3 applique `Text` tel que
demandé, sans trancher à sa place.

## 2. Le trio number / ref / site — comment il fonctionne, ce qu'il faut aux lieux

Lu dans `Modèle:Physical item` (`{{#set: |Inventory_site=... |Inventory_number=...
|Inventory_ref=...-...}}`) :

- **`Inventory_number`** est la valeur brute, calculée par
  `{{#invoke:Base36|next|...}}` à partir du plus grand `Inventory_number`
  existant pour le site courant. C'est la seule des trois qui sert de
  base de calcul — les deux autres en dérivent.
- **`Inventory_site`** est saisi (par défaut `{{Préfixe site}}`), jamais
  calculé : c'est la source de vérité du préfixe, indépendante du wiki
  qui héberge la page (le lit dans sa propre doc : « non déduit du wiki
  qui héberge la page »).
- **`Inventory_ref`** est la concaténation `site_code-ref_number` — une
  commodité de lecture et de portabilité (« reste attachée à l'exemplaire
  même s'il est publié sur un autre wiki »), pas une troisième source de
  vérité.

Le titre de page d'un item physique est un nom d'usage (« Ail éléphant —
Le Buisson de Cerzat (ECL-0042) ») : `Inventory_ref` existe *parce que* le
titre ne porte pas la référence, il faut donc la stocker à part pour
pouvoir l'afficher et la requêter.

**Pour les lieux, ce n'est plus vrai.** La décision actée fixe le titre de
page lui-même à `ECL-NNNN` — la référence complète *est* le titre. Deux
options, à trancher par Cyril, pas par cette proposition :

- **Option A — réutiliser `Inventory_ref` et `Inventory_site`, domaine
  élargi.** Ajouter `[[Property_domain::Category:Lieu]]` aux deux
  propriétés existantes plutôt que d'en créer des doublons. Cohérent avec
  le compteur déjà partagé, et évite deux propriétés qui ne feraient que
  répéter `{{FULLPAGENAME}}` et une constante (`ECL`). Inconvénient :
  `Inventory_*` porte "Inventory" dans son nom, un vocabulaire pensé pour
  les items physiques — un lieu n'est pas un exemplaire d'inventaire.
- **Option B — créer `Location_ref` et `Location_site` en parallèle.**
  Garde les domaines strictement séparés malgré le compteur commun.
  Duplique une composition triviale (`site-nombre`) et une constante déjà
  vraie pour 100 % des lieux actuels (`ECL`).

Penchant pour l'option A (le compteur est déjà partagé par décision ;
séparer le stockage alors que le calcul ne l'est pas crée une incohérence
qu'il faudra réexpliquer plus tard) — mais c'est une proposition, pas un
tranchage. `Location_number`, lui, n'a pas cette ambiguïté : la décision le
fixe déjà comme propriété distincte, et section 3 le rédige comme tel.

## 3. Wikitexte des quatre pages à créer (rédigé, non écrit)

### Attribut:Location number
```
[[Has type::Text]]
[[Property_description_FR::Rang d'un lieu dans la séquence de numérotation partagée avec les items physiques. Identifiant Base 36 de 4 caractères, sans préfixe.]]
[[Property_description_EN::Rank of a location in the numbering sequence shared with physical items. Four-character Base 36 identifier, without prefix.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Lieu]]
[[Property_range::identifiant Base 36, 4 caractères]]
```

### Attribut:Location type
```
[[Has type::Text]]
[[Property_description_FR::Nature du lieu (terrain, bâtiment, pièce…). Aucune liste fermée : la diversité réelle des lieux ne s'y prête pas encore.]]
[[Property_description_EN::Nature of the location (plot, building, room…). No closed list: the real diversity of locations does not fit one yet.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Lieu]]
[[Property_range::texte libre]]
```
Aucun `Allows value` — conforme à la consigne. Cohérent avec l'absence de
liste fermée assumée dans la description elle-même.

### Attribut:INSEE code
```
[[Has type::Text]]
[[Property_description_FR::Code INSEE de la commune du lieu. Littéral de jointure avec des données externes (IGN, INSEE, etc.), pas une assertion d'identité géographique : stocké tel quel, jamais recalculé ni validé par ce wiki.]]
[[Property_description_EN::INSEE code of the location's municipality. A join literal against external data (IGN, INSEE, etc.), not a geographic identity assertion: stored as-is, never recomputed or validated by this wiki.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Lieu]]
[[Property_range::code INSEE commune, 5 caractères — chiffres, zéro initial possible, ou 2A/2B pour la Corse]]
```
`Text` plutôt que `Number`, comme demandé : un code INSEE commence parfois
par un zéro (perdu par un type numérique) et la Corse utilise des lettres
(`2A`, `2B`).

### Attribut:Location lineage
```
[[Has type::Page]]
[[Property_description_FR::Chaîne ordonnée des lieux parents d'un lieu, du plus proche au plus englobant.]]
[[Property_description_EN::Ordered chain of a location's parent locations, from nearest to broadest.]]
[[Property_cardinality::multiple]]
[[Property_domain::Category:Lieu]]
[[Property_range::lieu, du plus proche au plus englobant]]
```
Description volontairement silencieuse sur *comment* la chaîne est
calculée (depuis `Located_in`, à la main, ou autrement) : ce mécanisme
n'est pas décidé par cette tâche — la reconnaissance du lot 11 tâche 0 a
constaté que rien de tel n'existe encore sur ce wiki (ni propriété, ni
modèle, ni module). Ne pas préjuger de son mode de calcul dans la
déclaration de la propriété elle-même.

## 4. Fonction Lua nouvelle — à côté de p.next, jamais à sa place

`p.next` n'est touché en rien : ni renommé, ni refactoré, ni partagé par
extraction d'une fonction commune. La nouvelle fonction duplique son
propre nettoyage plutôt que d'y toucher — la création de plantations ne
doit rien voir changer.

```lua
-- Prend deux valeurs Base36 (ex. le plus grand Inventory_number côté
-- items physiques, le plus grand Location_number côté lieux) et renvoie
-- la valeur suivante après la plus grande des deux. Sert au compteur
-- partagé entre lieux et items physiques (lot 11).
function p.nextAfterMax(frame)
    local function clean(raw)
        local c = mw.text.unstrip(raw or "")
        c = c:gsub("<[^>]+>", "")
        c = c:match("[%w]+")
        if not c then return "" end
        return mw.text.trim(c):upper()
    end

    local function toDec(raw, label)
        local c = clean(raw)
        if c == "" then return 0 end
        local d = tonumber(c, 36)
        if not d then
            return nil, "ERR_LUA_VOIT(" .. label .. "):" .. c
        end
        return d
    end

    local raw_a = frame.args[1] or frame:getParent().args[1] or ""
    local raw_b = frame.args[2] or frame:getParent().args[2] or ""

    local dec_a, err_a = toDec(raw_a, "1")
    if not dec_a then return err_a end
    local dec_b, err_b = toDec(raw_b, "2")
    if not dec_b then return err_b end

    local dec = math.max(dec_a, dec_b) + 1

    local chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    local base36 = ''
    local temp = dec
    while temp > 0 do
        local mod = temp % 36
        base36 = string.sub(chars, mod + 1, mod + 1) .. base36
        temp = math.floor(temp / 36)
    end
    while string.len(base36) < 4 do
        base36 = '0' .. base36
    end

    return base36
end
```

Mêmes conventions que `p.next` : nettoyage identique (`unstrip`, retrait
des balises, `[%w]+`, `trim`/`upper`), même alphabet, même remplissage sur
4 caractères, même geste de diagnostic en cas d'échec de conversion
(`ERR_LUA_VOIT`, retourné comme chaîne plutôt que levé en erreur Lua —
visible directement sur la page comme aujourd'hui avec `p.next`). Une
valeur vide (aucun lieu ou aucun item physique pour l'instant) compte pour
`0`, symétriquement aux deux arguments — pas de cas particulier premier
lieu / premier item.

## 5. Ce qu'il faudrait modifier dans Formulaire:Physical item (liste, pas d'édition)

Wikitexte actuel de la ligne concernée, tel que lu en tâche 0 :
```
{{{field|ref_number|mandatory|default={{#invoke:Base36|next|{{#ask: [[Category:Physical item]] [[Inventory_site::{{Préfixe site}}]] [[Inventory_number::+]] |?Inventory_number= |sort=Inventory_number |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }}|placeholder=0001}}}
```

Pour que le compteur devienne réellement partagé :

1. **Ajouter un second `#ask`**, symétrique au premier mais sur
   `Category:Lieu` / `Location_number` au lieu de `Category:Physical
   item` / `Inventory_number` — même forme (`sort=... |order=desc
   |limit=1 |format=list |link=none |headers=hide |default=0000`).
2. **Remplacer `{{#invoke:Base36|next|...}}` par
   `{{#invoke:Base36|nextAfterMax|...|...}}`**, passé les deux résultats
   de `#ask` (items physiques, puis lieux) en arguments 1 et 2.
3. **Filtre de site sur le second `#ask` : dépend de la section 2.** Le
   premier `#ask` filtre par `[[Inventory_site::{{Préfixe site}}]]`. Si
   l'option A est retenue (réutilisation d'`Inventory_site` pour les
   lieux), le second `#ask` peut porter le même filtre, par symétrie. Si
   les lieux n'ont pas d'équivalent de site, il portera sur l'ensemble de
   `Category:Lieu` sans filtre — vrai aujourd'hui (un seul site, `ECL`)
   mais à revoir si le wiki héberge un jour des lieux d'un autre site.
4. **`Modèle:Physical item` n'a besoin d'aucun changement.** Il stocke
   `Inventory_number`/`Inventory_ref`/`Inventory_site` à partir de la
   valeur déjà calculée par le formulaire — la modification est
   entièrement contenue dans le calcul de `ref_number`, pas dans ce que le
   modèle fait de cette valeur une fois reçue.
5. **Hors périmètre de cette liste, à garder en tête pour la suite** :
   `Formulaire:Lieu` n'existe pas encore. Quand il sera créé, son propre
   calcul de `Location_number` devra appeler `nextAfterMax` de façon
   symétrique (côté lieux d'abord, côté items physiques ensuite), sans
   quoi le compteur resterait partagé dans un seul sens.
