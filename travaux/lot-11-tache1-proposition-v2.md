# Lot 11 — tâche 1 : les cinq propriétés (proposition v2)

2026-08-21. Ce rapport **remplace** `travaux/lot-11-tache1-proposition.md`,
produit sur des décisions périmées (`ECL-NNNN`, compteur partagé, premier
lieu en `0043`). Les décisions ci-dessous font foi.

**Écriture wiki dans cette passe, à titre d'exception documentée** : la
consigne pose « AUCUNE écriture wiki » comme cadre général de la tâche —
respecté pour les cinq pages `Attribut:`, `Location_site`, et la ligne du
Registre des préfixes : rédigées ou proposées ci-dessous, rien n'est écrit
tant que Cyril n'a pas validé. La section 1 fait exception : elle demande
explicitement un test empirique sur `Utilisateur:Cywil/Bac à sable`, page
que `CLAUDE.md` désigne pour les essais — impossible à honorer sans écrire.
Confirmé par Cyril avant exécution. Le détail des écritures faites figure
en fin de section 1.

Décisions actées, rappelées ici pour mémoire :
- titre d'un lieu = sa référence seule, `LOC-NNNN` ; libellé dans
  `Place_name` ;
- séquence **propre** aux lieux publics, repart à `0001` — aucun compteur
  partagé, `Module:Base36` et `Formulaire:Physical item` non touchés par ce
  lot ;
- `LOC` écrit en dur, jamais via `{{Préfixe site}}` ;
- `Location_site` créée dans ce lot, valeur `LOC` — champ ajouté maintenant
  pour éviter une reprise de tous les lieux existants plus tard.

## 1. Motif du type Keyword — vérifié, pas supposé

### Protocole

Sur `Utilisateur:Cywil/Bac à sable`, création de :
- `Attribut:Test lot11 texte` — `Has type::Text`
- `Attribut:Test lot11 keyword` — `Has type::Keyword`
- `Utilisateur:Cywil/Bac à sable/Test lot11 sujet 1` —
  `Test lot11 texte=0002`, `Test lot11 keyword=0002`
- `Utilisateur:Cywil/Bac à sable/Test lot11 sujet 2` —
  `Test lot11 texte=0010`, `Test lot11 keyword=0010`

Puis, pour chaque propriété : `action=ask` avec
`sort=<propriété>|order=desc|limit=2`, en API (lecture, pas de page de
requête créée sur le wiki).

### Résultats bruts — trois passages, pas un seul

**Passage 1 — immédiatement après création des sujets**, file de travaux
encore à 7 puis 11 jobs (non vidée, cf. `bin/wiki-wait-jobs.sh`, deux
appels, « FILE FIGÉE »). `browsebysubject` sur les deux pages `Attribut:`
ne montrait `Has type` qu'à l'intérieur de `_CHGPRO`, pas en fait direct.
`action=ask` avec `limit=1` :
- Texte : 1 résultat, `Test lot11 sujet 2` (`0010`).
- Keyword : 1 résultat, `Test lot11 sujet 2` (`0010`).

Correct dans les deux cas — mais **résultat non probant** : le type
déclaré n'était pas encore appliqué (`_TYPE` en attente de propagation),
donc rien ne distinguait encore Texte de Keyword à ce stade.

**Passage 2 — file de travaux vidée** (`jobs=0` constaté ensuite),
`_TYPE` promu en fait direct sur les deux pages `Attribut:`
(`.../swivt/1.0#_txt` et `.../swivt/1.0#_keyw`, confirmé). Même requête,
`limit=2` :
- Texte : **0 résultat** (`count: 0`).
- Keyword : **0 résultat** (`count: 0`).

Les deux requêtes reviennent vides. Les faits posés sur les pages sujets
avaient été stockés au moment où le type de la propriété résolvait encore
par défaut (Page) — SMW range les valeurs par type de donnée dans des
tables distinctes ; une fois le type recalculé en `_txt`/`_keyw`, les
anciennes valeurs ne sont plus vues sous ce type tant que les pages sujets
elles-mêmes n'ont pas été retraitées.

**Passage 3 — après `bin/wiki-purge.sh` des deux pages sujets**
(`forcelinkupdate=1`, comme le fait le script), file de travaux revidée.
Même requête, `limit=2` :
- Texte : **2 résultats, ordre `0010` puis `0002`.**
- Keyword : **2 résultats, ordre `0010` puis `0002`.**

Ordre descendant correct, identique pour les deux types.

### Verdict

**Text trie correctement.** Sur ce test, `sort=<propriété>|order=desc`
renvoie le même ordre pour `Text` et `Keyword` une fois la propagation
réellement terminée (type promu **et** pages sujets retraitées). Je me
serai trompé sur la prémisse — dit comme demandé.

Ceci ne tranche pas seul en faveur de `Text` pour autant : `Keyword` reste
défendable pour d'autres raisons (égalité stricte plutôt que recherche
plein texte, cohérent avec `Inventory_number`/`Inventory_ref`/
`Inventory_site` qui sont tous trois `Keyword` dans le modèle existant, cf.
v1 §1). Mais l'argument spécifique « Text ne trie pas » ne tient pas dans
ce test — la décision de cette tâche (Keyword pour les cinq propriétés)
reste donc justifiée par cohérence avec l'existant, pas par une nécessité
de tri.

**Leçon de méthode, nouvelle** — à reporter dans `CLAUDE.md` si Cyril en
convient : après un changement de type sur une propriété **déjà en usage**,
vider la file de travaux ne suffit pas à rendre les faits existants
requêtables sous le nouveau type. Il faut aussi retraiter les pages qui
portent les faits eux-mêmes (`bin/wiki-purge.sh` avec `forcelinkupdate=1`
a suffi ici) — sans quoi une requête `#ask` sur cette propriété revient
silencieusement **vide**, pas juste dans le mauvais ordre. Ne s'applique
pas aux cinq propriétés de cette tâche : elles sont **nouvelles**, aucun
lieu n'existe encore pour en porter des faits sous un ancien type.

**Écritures faites dans cette section** (à nettoyer par Cyril — le compte
bot n'a pas de droit de suppression) :
- `Attribut:Test lot11 texte` (créée)
- `Attribut:Test lot11 keyword` (créée)
- `Utilisateur:Cywil/Bac à sable/Test lot11 sujet 1` (créée)
- `Utilisateur:Cywil/Bac à sable/Test lot11 sujet 2` (créée)

Toutes hors des espaces de noms `Attribut:`/pages en service pour ce lot —
aucun modèle, formulaire ni catégorie visée par la règle de périmètre de
`CLAUDE.md` n'est concerné.

## 2. Registre des préfixes de site — LOC est libre

Contenu actuel (lu, trois lignes) : `ADD` (Atelier du Dôme), `CWL` (CWL
Optéos), `ECL` (Ecolibre) — tous trois codes de trois lettres pour des
**organisations**, préfixant leurs items physiques. `LOC` n'y figure pas :
libre.

`LOC` diffère des trois lignes existantes : ce n'est pas le code d'une
organisation partenaire, mais un code réservé à une **classe de lieux** du
wiki qui l'attribue. La ligne proposée doit le dire, plutôt que de forcer
`LOC` dans la colonne « Organisation » comme s'il s'agissait d'un
partenaire :

```
|-
| LOC || <em>réservé — lieux publics, non attribuable à un partenaire</em> || wiki.ecolibre.org || wiki.ecolibre.org
```

Et une phrase à ajouter après le tableau, pour que la réservation soit
lisible sans deviner :

> `LOC` n'est pas le code d'une organisation : il identifie les lieux
> publiés sur `wiki.ecolibre.org`, sur le même principe de réservation que
> les codes ci-dessus (jamais réattribué, même après fermeture d'un wiki).
> Un site partenaire créant des lieux privés utilise son propre code
> d'organisation, pas `LOC`.

Non écrit — à valider avant toute édition de cette page.

## 3. Wikitexte des cinq pages `Attribut:` (rédigé, non écrit)

Forme reprise de v1 §1 : `Has type` en premier, puis les cinq annotations
dans l'ordre (`Property_description_FR`, `Property_description_EN`,
`Property_cardinality`, `Property_domain`, `Property_range`),
`Property_domain` répété par catégorie plutôt que séparé par virgule —
une seule catégorie ici (`Category:Lieu`) pour les cinq, donc pas de
répétition à faire.

### Attribut:Location number
```
[[Has type::Keyword]]
[[Property_description_FR::Rang d'un lieu dans la séquence de numérotation propre aux lieux publics de ce wiki, indépendante de celle des items physiques. Identifiant Base 36 de 4 caractères, sans préfixe.]]
[[Property_description_EN::Rank of a location in the numbering sequence specific to this wiki's public locations, independent of the physical item sequence. Four-character Base 36 identifier, without prefix.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Lieu]]
[[Property_range::identifiant Base 36, 4 caractères]]
```

### Attribut:Location site
```
[[Has type::Keyword]]
[[Property_description_FR::Code à trois lettres du site auquel appartient le lieu. `LOC` est réservé aux lieux publiés sur ce wiki public et n'est pas attribuable à un site partenaire (voir Registre des préfixes de site). Sur un wiki partenaire, les subdivisions privées porteront le code de ce partenaire et partageront la séquence de numérotation de ses items physiques — règle actée ici, non mise en œuvre dans ce lot.]]
[[Property_description_EN::Three-letter code of the site the location belongs to. `LOC` is reserved for locations published on this public wiki and cannot be assigned to a partner site (see Site prefix registry). On a partner wiki, private subdivisions will carry that partner's code and share its physical item numbering sequence — rule decided here, not implemented in this lot.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Lieu]]
[[Property_range::code de site à trois lettres]]
```

### Attribut:Location type
```
[[Has type::Keyword]]
[[Property_description_FR::Nature du lieu (terrain, bâtiment, pièce…). Aucune liste fermée : la diversité réelle des lieux ne s'y prête pas encore.]]
[[Property_description_EN::Nature of the location (plot, building, room…). No closed list: the real diversity of locations does not fit one yet.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Lieu]]
[[Property_range::texte libre]]
```
Aucun `Allows value`, conforme à la consigne. Description reprise de v1
telle quelle, seul `Has type` change (`Text` → `Keyword`).

### Attribut:INSEE code
```
[[Has type::Keyword]]
[[Property_description_FR::Code INSEE de la commune du lieu. Littéral de jointure avec des données externes (IGN, INSEE, etc.), pas une assertion d'identité géographique : stocké tel quel, jamais recalculé ni validé par ce wiki.]]
[[Property_description_EN::INSEE code of the location's municipality. A join literal against external data (IGN, INSEE, etc.), not a geographic identity assertion: stored as-is, never recomputed or validated by this wiki.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Lieu]]
[[Property_range::code INSEE commune, 5 caractères — chiffres, zéro initial possible, ou 2A/2B pour la Corse]]
```
Description reprise de v1 telle quelle. Rationale mise à jour pour le
nouveau type : `Keyword` plutôt que `Number`, comme en v1 (zéro initial
perdu par un type numérique, lettres `2A`/`2B` en Corse) ; `Keyword`
plutôt que `Text`, cohérent avec un littéral de jointure comparé à
l'identique, pas cherché en plein texte.

### Attribut:Location lineage
```
[[Has type::Page]]
[[Property_description_FR::Ensemble des lieux ancêtres d'un lieu, lui-même inclus (propriété réflexive). N'affirme aucun ordre : SMW ne garantit pas l'ordre d'une propriété multivaluée.]]
[[Property_description_EN::Set of a location's ancestor locations, including the location itself (reflexive property). Asserts no ordering: SMW does not guarantee the order of a multi-valued property.]]
[[Property_cardinality::multiple]]
[[Property_domain::Category:Lieu]]
[[Property_range::lieu, y compris le lieu lui-même — ensemble non ordonné]]
```
Muet, comme en v1, sur le mode de calcul (depuis `Located_in`, à la main,
ou autrement) : non décidé, tâche 4.

## 4. Pour les tâches suivantes — noté, rien construit

- **L'arbre du cadrage §2 est amendé.** Les hameaux deviennent des
  subdivisions des communes. Quatre niveaux au Buisson : Cerzat (commune)
  → Le Buisson de Cerzat (hameau) → Terrain de Cyril au Buisson de Cerzat
  → zone basse → planches. **Douze lieux à créer**, pas dix.
- **La page « Le Buisson de Cerzat » change de sens.** Elle était le
  terrain, elle devient le hameau. Les 29 plantations qui y sont accrochées
  devront descendre vers les planches (tâche 6). Entre-temps le hameau les
  porte : faux, visible, réparable — rien à toucher dans cette tâche.
- **`LOC-0001` doit revenir à « Terrain de Cyril au Buisson de Cerzat »**,
  ce qui impose l'ordre de création : le terrain d'abord (`Located_in`
  vide), puis Cerzat, puis le hameau, puis retour sur le terrain pour
  renseigner `Located_in`. La tâche 5 devra se terminer par un contrôle que
  **tout lieu sauf les communes** porte un `Located_in`.

## 5. Pour la documentation (tâche 7) — listé, rien rédigé

- `LOC-NNNN` est unique **dans un wiki**, pas dans la fédération.
- La référence identifie **la fiche**, pas le lieu : détenteur, créateur de
  la fiche et wiki hôte sont trois faits distincts qui coïncident
  aujourd'hui.
- Une page qui bascule du public au privé **change de wiki** : on reforge
  une référence sous le préfixe du partenaire et on supprime la page
  publique. On ne déplace pas une référence d'un wiki à l'autre.
- Une subdivision privée aura le plus souvent un parent **public** : la
  frontière de visibilité passe au milieu de l'arbre, pas entre deux
  arbres. Conséquence pour `Location_lineage`, à traiter en tâche 4.
