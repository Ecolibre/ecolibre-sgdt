# Lot 11 — tâche 0 : reconnaissance

2026-08-21. Volet reconnaissance uniquement — aucune écriture, aucune
création, aucun renommage, aucune purge n'a été effectué pendant cette
passe. Le test des redirections annoncé en préambule n'est pas traité ici.

## 1. Extensions installées — Semantic Scribunto ?

`action=query&meta=siteinfo&siprop=extensions` confirme la présence de
**Scribunto** (type `parserhook`, aucun numéro de version renseigné par
`siteinfo` — pas de clé `version` sur cette entrée, contrairement à d'autres
extensions comme Page Forms `5.8.1` ou Semantic MediaWiki `4.2.0`).

**`Semantic Scribunto` — l'extension qui expose l'API `mw.smw` côté Lua —
n'est PAS installée.** Elle n'apparaît nulle part dans la liste complète des
extensions (skins compris). Seules les extensions `semantic` présentes sont
`SemanticMediaWiki` (4.2.0) et `SemanticResultFormats` (4.2.1).

Conséquence pour `Location_lineage` : un module Lua ne pourra pas lire
directement le store sémantique via `mw.smw.getQueryResult` ou équivalent.
Il faudrait, comme le fait déjà `Module:Base36`, recevoir la donnée déjà
extraite en `frame.args` depuis un `#ask`/`#set` en wikitexte autour du
module — le calcul ne peut pas interroger SMW depuis l'intérieur du Lua
lui-même.

## 2. File de travaux

`action=query&meta=siteinfo&siprop=statistics` → `"jobs": 0`.

File vide. Rien qui puisse fausser un test de redirections pour cette
raison.

(Statistiques complètes au passage : 410 pages, 145 articles, 828 éditions,
79 images, 2 comptes, 1 actif, 2 admins.)

## 3. Verrou SMW sur Attribut:Specimen status — sans écrire

```
action=query&prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full&titles=Attribut:Specimen%20status
```

Résultat brut :

```json
{
  "pageid": 270,
  "ns": 102,
  "title": "Attribut:Specimen status",
  "lastrevid": 781,
  "length": 564,
  "protection": [],
  "restrictiontypes": ["edit", "move"],
  "actions": { "edit": [] }
}
```

`protection` vide et `actions.edit` vide (aucun message bloquant remonté par
`intestactions`). **Rappel du garde-fou n° 5 du CLAUDE.md : ce résultat ne
prédit pas qu'une écriture passerait.** Ni `prop=info`, ni `intestactions`,
ne voient les verrous Lockdown par espace de noms ni
`smw-change-propagation-protection` — les deux cas déjà rencontrés le
16 août 2026 sur des pages `Attribut:` étaient tout aussi silencieux à ce
même test. Aucune tentative d'écriture, même à blanc, n'a été faite ici.

## 4. Écart 26/29 — items physiques à Le Buisson de Cerzat

Requête SMW via `action=ask` (le format `count` s'est révélé cassé côté API
sur ce wiki — voir encart plus bas ; comptage fait en dénombrant les
résultats d'une requête en liste) :

```
[[Category:Physical item]][[Located_at::Le Buisson de Cerzat]]
 |?Inventory_number
 |limit=200
```

→ **29 résultats**, `ECL-0003` à `ECL-0042` (numérotation non contiguë,
puisque d'autres items du même intervalle sont rattachés à Jardin de
Chilhac ou Terrasse de Chilhac).

Comparaison avec `plants-2026-08.tsv` : le fichier comporte 43 lignes,
dont une ligne de commentaire (`#...`), une ligne d'en-tête, et une ligne
« Poireau perpétuel » à `id` vide — ignorée par la propre règle du fichier
(« Une ligne sans id est ignorée »). En filtrant `lieu = Buisson_Cerzat` sur
les lignes restantes : **29 lignes**, exactement.

**Le décompte multi-ensemble par espèce coïncide terme à terme** entre les
29 pages SMW et les 29 lignes TSV : Ail éléphant ×3, Miscanthus ×2, Poireau
perpétuel ×2, et 22 autres espèces à un seul exemplaire chacune — même
répartition des deux côtés. **Aucun écart constaté à l'instant présent :
29 = 29.** L'écart 26/29 mentionné en consigne ne s'observe pas dans l'état
actuel du wiki ; il provient soit d'une vérification antérieure (avant
correction ou avant propagation SMW), soit d'une méthode différente. À noter
pour la suite : la colonne `id` du TSV est un identifiant de génération
propre au fichier, **pas** le `Inventory_number` réel (banque Base36 en
production, indépendante) — le rapprochement ci-dessus a donc été fait par
nom d'espèce + comptage, pas par égalité d'identifiant.

**Encart — `format=count` cassé via `action=ask` sur cette installation.**
Plusieurs requêtes de comptage, y compris des variantes triviales comme
`[[Specimen_status::+]]|format=count`, renvoient toutes exactement le même
`meta.hash` (`8abf92b9a496fa12811f646f040f3025`) et `"count": 0` — y compris
pour des conditions dont la version en `format` liste (sans `count`) renvoie
des résultats non vides. Le format `count` semble ignoré ou mal enregistré
côté API `action=ask` sur cette version (SMW 4.2.0 / SRF 4.2.1). Contourner
en listant les résultats et en comptant côté client, pas en `format=count`.
À consigner comme limite d'outillage, pas comme un bug de données.

## 5. Anomalie ECL-0042 — État vide / bloc Chiffres à 39/40

`browsebysubject` **sans filtre** sur
`Ail éléphant — Le Buisson de Cerzat (ECL-0042)` :

```
Instance_of -> ['Ail_éléphant_Armand_2026#0##']
Inventory_number -> ['0042']
Inventory_ref -> ['ECL-0042']
Inventory_site -> ['ECL']
Item_description -> ["Trois caïeux conservés dans une conserve en verre, dans le dôme, en attente de mise en terre à l'automne 2026."]
Item_facet -> ['Facette_végétal#0##']
Located_at -> ['Le_Buisson_de_Cerzat#0##']
Planted_count -> ['3']
Propagated_from -> ['Ail_éléphant_—_Le_Buisson_de_Cerzat_(ECL-0003)#0##']
Specimen_status -> ['en réserve']
_INST -> ['Physical_item#14##', 'Item_à_facette_végétal#14##']
_MDAT -> ['1/2026/8/15/21/45/59/0']
_SKEY -> ['Ail éléphant — Le Buisson de Cerzat (ECL-0042)']
```

Trois hypothèses posées en consigne, vérifiées une à une :

1. **Valeur bien stockée → CONFIRMÉ.** `Specimen_status -> ['en réserve']`,
   sans ambiguïté, sans clé `_PVAL`/`_CHGPRO` en attente.

2. **Page Lieu restée sur un parse antérieur → NI CONFIRMÉ NI INFIRMÉ,
   limite de méthode à signaler.** Un `action=parse&page=Le Buisson de
   Cerzat&prop=text` fait à l'instant montre bien `en réserve` dans la
   colonne État pour ECL-0042 dans le HTML retourné. Mais **`action=parse`
   recalcule à la volée et ne lit pas le ParserCache** que sert une
   consultation normale de la page dans un navigateur — donc ce test ne
   peut pas confirmer ni infirmer ce que Cyril a réellement vu affiché.
   Les données sous-jacentes sont correctes ; si l'affichage vu était vide,
   la cause la plus probable reste un ParserCache non invalidé depuis la
   dernière modification de ECL-0042 — hypothèse cohérente avec les faits
   mais non vérifiable sans purge, hors périmètre de cette tâche.

3. **Ligne de compteur « en réserve » absente du bloc Chiffres → CONFIRMÉ,
   directement dans le wikitexte.** Le bloc *Chiffres* de « Avancement du
   jardin-forêt » énumère cinq états seulement : *En place*, *Repris*,
   *Souffrant*, *Mort*, *Remplacé* — puis un *Total des plantations* séparé,
   qui ne filtre sur aucun état. Requêtes de vérification sur les 3 lieux
   couverts par la page :
   - `[[Category:Physical item]][[Located_at::<3 lieux>]]` → **40** résultats
     (= le total affiché).
   - même requête + `[[Specimen_status::en réserve]]` → **1** résultat, ECL-0042
     précisément.

   40 items, 1 seul en réserve, 5 lignes de compteur qui ne couvrent pas cet
   état → leur somme plafonne mécaniquement à 39 quel que soit l'état des
   39 autres. **Ce n'est pas une anomalie de données ni un problème de
   cache : c'est un état manquant dans l'énumération du bloc Chiffres.**
   Rien n'a été corrigé, conformément à la consigne.

## 6. Wikitexte : Modèle:Lieu, Catégorie:Lieu, Module:Base36, Formulaire:Physical item

### Modèle:Lieu

```wikitext
<noinclude>
{{Documentation}}
</noinclude>
<includeonly>
{{#set:
|Place_name={{{Place_name|}}}
|Postal_address={{{Postal_address|}}}
|Latitude={{{Latitude|}}}
|Longitude={{{Longitude|}}}
|Located_in={{{Located_in|}}}
}}

{| class="wikitable" style="width:100%"
|+ Lieu
! colspan="2" style="background:#dfe8d8; text-align:left;" | Identification
|-
! style="background:#f2f2f2; width:30%;" | Nom d'usage
| {{#if:{{{Place_name|}}}|{{{Place_name}}}|{{PAGENAME}}}}
|-
! style="background:#f2f2f2; width:30%;" | Adresse postale
| {{#if:{{{Postal_address|}}}|{{{Postal_address}}}|''non renseignée''}}
|-
! colspan="2" style="background:#dfe8d8; text-align:left;" | Coordonnées
|-
! style="background:#f2f2f2; width:30%;" | Latitude
| {{#if:{{{Latitude|}}}|{{{Latitude}}}|''non renseignée''}}
|-
! style="background:#f2f2f2; width:30%;" | Longitude
| {{#if:{{{Longitude|}}}|{{{Longitude}}}|''non renseignée''}}
|-
! colspan="2" style="background:#dfe8d8; text-align:left;" | Filiation
|-
! style="background:#f2f2f2; width:30%;" | Lieu parent
| {{#if:{{{Located_in|}}}|[[{{{Located_in}}}]]|''—''}}
|-
! colspan="2" style="background:#dfe8d8; text-align:left;" | Items physiques à ce lieu
|-
! style="background:#f2f2f2; width:30%;" | Présents ici
|
'''{{#ask: [[Category:Physical item]] [[Located_at::{{FULLPAGENAME}}]] |format=count}}''' item(s) physique(s) rattaché(s) à ce lieu.

{{#ask: [[Category:Physical item]] [[Located_at::{{FULLPAGENAME}}]]
 |?Planting_rank = Rang
 |?Planting_date = Planté le
 |?Specimen_status = État
 |format=table
 |sort=
 |order=asc
 |limit=200
 |default=''Aucun item physique rattaché à ce lieu.''
 |class=wikitable sortable
}}
|}

[[Category:Lieu]]
</includeonly>
```

Remarque au passage : ce modèle utilise lui-même `format=count` en tête de
tableau (« X item(s) physique(s) rattaché(s) ») — si le bug §4 touche aussi
le rendu en wikitexte (pas seulement l'API), ce chiffre serait à vérifier ;
rien n'indique pour l'instant que le bug dépasse le chemin API `action=ask`,
mais ça n'a pas été testé séparément ici.

`Located_in` (lieu parent) n'a **aucun** mécanisme de propagation ou de
lignage visible dans ce modèle — juste un lien simple vers la page parente,
sans calcul de chaîne.

### Catégorie:Lieu

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

== Position dans le modèle ==

Hors chaîne. Ne descend d'aucune des quatre classes de conception et n'en a
aucune comme parente ; seul [[Attribut:Located at|Located_at]] relie un item
physique à un lieu.

== Champs ==

`Place_name` ne recopie pas le titre de la page : elle sert uniquement aux
lieux dont le nom d'usage diffère du titre (abréviation, nom local, alias).
Laissée vide, la page affiche le titre par défaut — inutile de la dupliquer
quand les deux coïncident.

[[Catégorie:SGDT]]
```

### Module:Base36

```lua
local p = {}

function p.next(frame)
    -- Récupère l'entrée (SMW)
    local raw_input = frame.args[1] or frame:getParent().args[1] or ""

    -- NETTOYAGE CHIRURGICAL :
    -- 1. On enlève les "strip markers" (codes internes de MediaWiki)
    local clean = mw.text.unstrip(raw_input)
    -- 2. On enlève les balises HTML (ex: <span>...</span>)
    clean = clean:gsub("<[^>]+>", "")
    -- 3. On enlève tout ce qui n'est pas un chiffre ou une lettre
    clean = clean:match("[%w]+") or ""
    -- 4. On met en majuscules et on enlève les espaces
    clean = mw.text.trim(clean):upper()

    -- Si après nettoyage c'est vide, on commence à 0001
    if clean == "" then return "0001" end

    -- Conversion Base 36 -> Décimal
    local dec = tonumber(clean, 36)

    -- DEBUG : Si la conversion échoue encore, on affiche ce que Lua a "vu"
    if not dec then return "ERR_LUA_VOIT:" .. clean end

    -- Incrémentation
    dec = dec + 1

    -- Re-conversion en Base 36
    local chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    local base36 = ''
    local temp = dec
    while temp > 0 do
        local mod = temp % 36
        base36 = string.sub(chars, mod + 1, mod + 1) .. base36
        temp = math.floor(temp / 36)
    end

    -- Formatage sur 4 caractères
    while string.len(base36) < 4 do
        base36 = '0' .. base36
    end

    return base36
end

-- Détecteur de trous (Gaps) dans la numérotation
function p.findGaps(frame)
    local raw_input = frame.args[1] or frame:getParent().args[1] or ""
    if raw_input == "" then return "Aucune donnée trouvée." end

    local existing_refs = {}
    local max_dec = 0

    -- 1. On lit toutes les références séparées par des virgules
    for ref in string.gmatch(raw_input, "([^,]+)") do
        local clean_ref = mw.text.unstrip(ref)
        clean_ref = clean_ref:gsub("<[^>]+>", "")
        clean_ref = mw.text.trim(clean_ref):upper()
        clean_ref = clean_ref:match("[%w]+")

        if clean_ref and clean_ref ~= "" then
            local dec = tonumber(clean_ref, 36)
            if dec then
                -- On stocke la référence trouvée
                existing_refs[dec] = true
                -- On met à jour le plafond si nécessaire
                if dec > max_dec then max_dec = dec end
            end
        end
    end

    if max_dec == 0 then return "Aucune référence valide analysée." end

    local missing = {}
    local chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'

    -- 2. On compte de 1 jusqu'au plafond et on note les absents
    for i = 1, max_dec do
        if not existing_refs[i] then
            local base36 = ''
            local temp = i
            while temp > 0 do
                local mod = temp % 36
                base36 = string.sub(chars, mod + 1, mod + 1) .. base36
                temp = math.floor(temp / 36)
            end
            while string.len(base36) < 4 do base36 = '0' .. base36 end
            table.insert(missing, base36)
        end
    end

    -- 3. Affichage du résultat
    if #missing == 0 then
        return "Aucun trou détecté dans la séquence (jusqu'à " .. string.format("%04s", max_dec) .. ")."
    else
        return table.concat(missing, ", ")
    end
end

return p
```

Rappel objet n° 3 de la liste des corrections (CLAUDE.md) : `clean:match("[%w]+")`
s'arrête au premier bloc alphanumérique et ne gère aucun préfixe — cohérent
avec ce qui est lu ici.

### Formulaire:Physical item — forme exacte du calcul de référence

```wikitext
! Numéro d'inventaire : {{#info: Calculé automatiquement pour un exemplaire de ce site. Pour publier l'exemplaire d'un partenaire, recopier son numéro d'origine plutôt que de laisser le calcul.}}
| {{{field|ref_number|mandatory|default={{#invoke:Base36|next|{{#ask: [[Category:Physical item]] [[Inventory_site::{{Préfixe site}}]] [[Inventory_number::+]] |?Inventory_number= |sort=Inventory_number |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }}|placeholder=0001}}}
```

Chaîne complète : un `#ask` va chercher le plus grand `Inventory_number`
existant pour le site courant (`Inventory_site::{{Préfixe site}}`), trié
`desc`, limité à 1 ; le résultat brut (ou `0000` par défaut si aucun) est
passé à `{{#invoke:Base36|next|...}}` qui l'incrémente d'une unité en base
36. Le formulaire entier est ci-dessus dans le bloc « Numéro d'inventaire »,
extrait du wikitexte complet lu.

## 7. Où vit Board_lineage ?

**Nulle part sur ce wiki, à ce jour.** Vérifié directement, pas seulement
par recherche plein texte (voir mise en garde méthode plus bas) :

- **Espace `Attribut:`** (namespace 102) : 95 propriétés listées
  intégralement — aucune ne s'appelle `Board lineage` ni rien d'approchant
  (`lineage`, `board`, `kanban`, `tableau` absents des titres).
- **Espace `Template:`** (`Modèle:`, namespace 10) : 23 pages listées
  intégralement — aucun modèle de tableau/kanban, aucun `Board`.
- **Espace `Module:`** (namespace 828) : seulement 4 pages —
  `Base36`, `Nombre`, `Source`, `Source/doc`. Aucun module de lignage de
  tableau.

Une recherche plein texte sur « lineage » (`list=search`, `srnamespace=*`)
renvoie 0 résultat, mais **cette méthode seule n'aurait pas suffi à
conclure** : par défaut, la recherche MediaWiki (pas de CirrusSearch installé
ici, seul le moteur SQL de base) n'indexe en général que l'espace principal,
pas `Template:`/`Module:` — c'est l'énumération directe ci-dessus qui fait
foi, pas ce zéro de recherche.

**En trois lignes, comme demandé — mais la réponse est qu'il n'y a rien à
résumer :** `Board_lineage` n'existe ni comme propriété stockée, ni comme
logique de modèle, ni comme module Lua sur ce wiki actuellement. Aucun
recalcul après déplacement de tableau n'existe donc non plus, puisqu'il n'y
a pas de lignage à recalculer. Si la tâche 0 présuppose son existence, la
consigne suivante du lot 11 devra soit pointer vers un autre nom exact, soit
traiter ce point comme une création, pas une lecture.
