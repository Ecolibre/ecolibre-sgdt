# Lot 10 — Tâche 4 : rapport — l'outil pilote, de bout en bout

**Exécuté le :** 20 août 2026, session Claude Code, compte `Cywil`.
**Six écritures wiki, toutes acceptées. Aucun refus, aucune clé `_ERR*`.**

---

## 1. Reconnaissance (étape 1)

Avant toute écriture, obtenu du module en production, sur l'état réel du
wiki :

| Référence | Valeur | Requête |
|---|---|---|
| Prochain `Item_ref` (banque conception) | **002M** | `{{#invoke:Base36\|next\|...}}` sur `[[Category:Functional item‖Organic item‖Referenced item]] [[Item_ref::+]]`, trié desc, en `action=parse` (lecture seule) |
| Prochain `Inventory_number` (site ECL) | **0043** | même mécanisme, sur `[[Category:Physical item]] [[Inventory_site::ECL]] [[Inventory_number::+]]` |

Aucune des deux valeurs n'a été calculée hors ligne : chacune relue une
seconde fois, à froid, juste avant l'écriture qui la consomme (voir §2 et
§3), conformément au garde-fou 4 de `CLAUDE.md`.

**Aucun item d'outil préexistant.** Recherche plein texte `outil` (0
résultat), `machine` (0 résultat), `souder` (2 résultats : les pages de
procédé `Souder par points` et la redirection `Souder à l'étain`, aucun
item). `list=embeddedin` sur `Modèle:Organic item` ne recense que des
plantes. La chaîne créée ici est bien la première du genre.

---

## 2. Deux points bloquants, tranchés par Cyril avant écriture

### 2.1 Titre de l'item référencé

Aucune marque connue au départ : proposé d'attendre plutôt que de forger un
titre à renommer plus tard (consigne explicite de la tâche). Cyril a
transmis une photo d'étiquette produit, puis le nom exact et l'URL du
fabricant : **SUNKKO 709AD**, machine de soudage par points à transformateur
d'inversion, pour batteries —
`https://sunkko.net/fr/products/products-sunkko-709ad-battery-spot-welder-transformer-inversion-pulse-welding-machine-1-html`.
Titre retenu : **« Machine à souder par points SUNKKO 709AD »**, sur le
modèle « objet + source » déjà en usage (`Bidon 220L bleu plastique Borde`).

### 2.2 `Located_at`

Cyril a répondu « Atelier appartement », absent des trois lieux existants
(`Jardin de Chilhac`, `Le Buisson de Cerzat`, `Terrasse de Chilhac`) et
introuvable par recherche plein texte sous un autre nom. Cyril a validé la
création de cette page `Lieu`, minimale — aucune coordonnée fournie, aucune
devinée (voir §6).

---

## 3. L'item organique — étape 2

**Item_ref = 002M.** Structure reprise de `Modèle:Organic item` (`Item_ref`,
`Item_description`, `Realizes_function`). `Item_description` décrit le type
d'outil, sans marque ni modèle, conformément à la consigne.

Wikitexte produit :

```
{{Organic item
|Item_ref=002M
|Item_description=Outil qui assemble deux pièces métalliques par fusion locale du métal de base, sous l'effet Joule, entre deux électrodes, sans apport de matière.
|Realizes_function=Souder par points
}}
```

Écriture : `pageid` 414, `newrevid` **820**, résumé
`[Lot 10][Tâche 4] Machine à souder par point — item organique, pilote de chaîne`.

Le procédé n'est porté qu'ici — arbitrage 2.3 du cadrage — pas sur le
référencé ni le physique (confirmé en §5).

---

## 4. L'item référencé — étape 3

**Item_ref = 002N**, relu à froid après l'écriture de l'organique (la
séquence a bien avancé de 002M à 002N sans qu'aucun calcul hors ligne
n'intervienne).

**Contrôle préalable du séparateur décimal**, avant toute écriture : saisi
`0.2` (point) dans une prévisualisation (`{{#invoke:Nombre|virgule|0.2}}`,
`action=parse`, aucune page enregistrée) → rendu **`0,2`**. Le module
convertit bien à l'affichage. Écriture faite ensuite avec la virgule, comme
demandé.

`Manufacturer`/`Manufacturer_reference` renseignés (SUNKKO / 709AD, fournis
par Cyril en cours de séance — la consigne initiale de les laisser vides ne
tenait plus une fois l'information disponible). `Supplier`,
`Supplier_reference` et `Sourcing_year` restent vides : non fournis.

Wikitexte produit :

```
{{Referenced item
|Item_ref=002N
|Item_description=Machine de soudage par points à transformateur d'inversion, pour batteries.
|Corresponds_to_organic=Machine à souder par point
|Max_thickness=0,2
|Materials_worked=acier nickelé
|Procurement_route=acheté
|Manufacturer=SUNKKO
|Manufacturer_reference=709AD
}}
```

Écriture : `pageid` 415, `newrevid` **821**, résumé
`[Lot 10][Tâche 4] Machine à souder par points SUNKKO 709AD — item référencé, pilote de chaîne`.

---

## 5. L'item physique — étape 4

**Inventory_number = 0043** (site ECL), relu à froid juste avant l'écriture.
Titre suivant la convention observée sur les items physiques existants —
qui reprend le nom de l'**organique**, pas du référencé (ex. : physique
« Bourrache — Le Buisson de Cerzat (ECL-0004) » pour l'organique
« Bourrache ») : **« Machine à souder par point — Atelier appartement
(ECL-0043) »**.

Wikitexte produit :

```
{{Physical item
|site_code=ECL
|ref_number=0043
|model_link=Machine à souder par points SUNKKO 709AD
|Located_at=Atelier appartement
}}
```

Écriture : `pageid` 416, `newrevid` **822**.

---

## 6. La page `Lieu` créée en amont

```
{{Lieu
|Place_name=
|Postal_address=
|Latitude=
|Longitude=
|Located_in=
}}
```

`pageid` 413, `newrevid` **819**. Volontairement minimale : ni adresse ni
coordonnées, contrairement aux trois lieux existants qui en portent toutes.
Rien deviné — à compléter par Cyril si utile.

---

## 7. Vérification du stockage — étape 5

Cinq pages purgées (`Atelier appartement`, `Machine à souder par point`,
`Machine à souder par points SUNKKO 709AD`,
`Machine à souder par point — Atelier appartement (ECL-0043)`,
`Souder par points`) — toutes `purged: true`, `linkupdate: true`.
`browsebysubject` relu ensuite sur chacune.

| Page | Faits pertinents | `_ERR*` |
|---|---|---|
| `Machine à souder par point` | `Item_ref` = 002M ; `Realizes_function` → `Souder_par_points` | aucune |
| `Machine à souder par points SUNKKO 709AD` | `Corresponds_to_organic` → `Machine_à_souder_par_point` ; `Item_ref` = 002N ; `Manufacturer` → `SUNKKO` ; `Manufacturer_reference` = 709AD ; `Materials_worked` → `Acier_nickelé` ; `Max_thickness` = **0.2** (type nombre) ; `Procurement_route` = acheté | aucune |
| `Machine à souder par point — Atelier appartement (ECL-0043)` | `Instance_of` → `Machine_à_souder_par_points_SUNKKO_709AD` ; `Inventory_number` = 0043 ; `Inventory_ref` = ECL-0043 ; `Inventory_site` = ECL ; `Located_at` → `Atelier_appartement` | aucune |

**Les cinq points de contrôle demandés :**

1. **`Realizes_function` pointe vers `Souder par points`, et depuis
   l'organique seulement.** Confirmé : présent sur l'organique, absent des
   faits du référencé et du physique.
2. **`Max_thickness` stockée comme nombre, bonne valeur, sans `_ERR*`.**
   Confirmé : `['0.2']`, type numérique (stockage canonique en point, comme
   attendu de SMW — la virgule est un affichage de `Module:Nombre`, pas la
   forme de stockage). Aucune clé d'erreur.
3. **`Materials_worked` stockée en valeur de page.** Confirmé :
   `['Acier_nickelé#0##']`, donc un lien de type Page — normalisé avec
   underscore, la page cible elle-même n'existe pas encore (lien rouge à
   l'affichage), ce qui est normal pour une propriété de type Page dont la
   cible n'a pas été créée.
4. **La chaîne se remonte.** Vérifié par le rendu réel des quatre pages
   (`action=parse`, pas seulement les faits) :
   - `Machine à souder par points SUNKKO 709AD` liste l'exemplaire physique
     dans « Exemplaires physiques ».
   - `Machine à souder par point` liste le référencé dans « Implémenté par
     (Solution technique) ».
   - `Souder par points` liste l'organique dans « Solutions organiques
     (Comment) » (voir point 5).
5. **`Souder par points` remonte l'outil par la requête inverse de
   `Realizes_function`.** Confirmé — et **la vue existe déjà**, elle n'est
   pas à créer en tâche 6 : `Modèle:Functional item` porte depuis avant ce
   lot un bloc `{{#ask: [[Realizes_function::{{FULLPAGENAME}}]] ...}}`
   affiché sous « Solutions organiques (Comment) ». Après purge, la page
   rendue de `Souder par points` affiche bien
   « Machine à souder par point — 002M — [la description] » dans ce
   tableau. La tâche 6 n'a donc pas de vue procédé→outil à construire de
   zéro pour ce niveau ; reste ouverte la question d'une vue agrégée
   procédé→outils sur plusieurs procédés (hors périmètre du pilote, un seul
   procédé ici).

---

## 8. Ce qui a marché

Tout, du premier coup : six écritures, six succès, aucune clé `_ERR*`,
aucun refus, aucun verrou rencontré. Le module `Nombre` s'est comporté comme
attendu à la fois en prévisualisation (test `0.2` → `0,2`, jamais écrit) et
en stockage réel (valeur déjà écrite en virgule, conservée et affichée
correctement). La chaîne organique → référencé → physique → procédé se
remonte dans les deux sens sans exception, et la séparation posée par
l'arbitrage 2.3 (le procédé ne vit que sur l'organique) tient à l'examen des
faits, pas seulement de l'intention de modélisation.

## 9. Ce qui a résisté

Rien côté wiki. Les deux points qui ont retardé l'écriture (titre du
référencé, `Located_at`) n'étaient pas des résistances techniques mais des
arrêts volontaires sur des données manquantes — exactement ce que demandait
la consigne « ne devine pas ». Une fois les réponses de Cyril obtenues
(photo d'étiquette, puis nom exact et URL fabricant pour le titre ; validation
de la création du lieu), l'écriture s'est déroulée sans détour.

## 10. Ce que la chaîne ne permet pas encore de dire

- **Aucune traçabilité d'acquisition.** `Supplier`, `Supplier_reference` et
  `Sourcing_year` restent vides : la chaîne ne sait pas dire *chez qui* ni
  *quand* cet exemplaire a été obtenu, seulement *comment* (`Procurement_route
  = acheté`).
- **Aucun numéro de série.** Le champ `sn` du modèle physique n'a pas été
  renseigné (non fourni) — deux exemplaires SUNKKO 709AD futurs seraient
  indiscernables au-delà du numéro d'inventaire.
- **`Atelier appartement` n'est pas géolocalisé.** Ni adresse postale ni
  coordonnées : toute requête qui croiserait lieu et position (comme celles
  déjà en place sur les trois lieux existants) ne trouvera rien pour ce site.
- **`Power_rating` n'est pas renseigné**, alors que la donnée est visible sur
  l'étiquette transmise par Cyril (3,2 kW) : hors périmètre explicite de
  l'étape 3, qui ne demandait que `Max_thickness`, `Materials_worked` et
  `Procurement_route`. Une requête future du type « quels outils dépassent
  X W » ne verra pas cette machine tant que le champ n'est pas complété — à
  signaler pour la tâche 5 ou en complément séparé.
- **Un seul procédé, jamais deux.** Le pilote n'éprouve pas le cas d'un
  organique réalisant plusieurs procédés à la fois (`Realizes_function`
  multivaluée) : cette machine n'en réalise qu'un. La tâche 5 (multimètre,
  notamment) sera la première à exercer réellement la multivaluation côté
  outil.
- **Aucune vue agrégée procédé → plusieurs outils.** La requête inverse
  fonctionne outil par outil (confirmé en §7 point 5), mais rien ne teste
  encore l'affichage quand plusieurs organiques réalisent le même procédé
  (le cas des deux fers à souder de la tâche 5, tous deux sur
  `Braser tendre`).

---

## 11. Pages créées — récapitulatif

| Page | Rôle | `pageid` | `newrevid` |
|---|---|---|---|
| `Atelier appartement` | Lieu | 413 | 819 |
| `Machine à souder par point` | Item organique | 414 | 820 |
| `Machine à souder par points SUNKKO 709AD` | Item référencé | 415 | 821 |
| `Machine à souder par point — Atelier appartement (ECL-0043)` | Item physique | 416 | 822 |

`Item_ref` consommés : 002M (organique), 002N (référencé).
`Inventory_number` consommé : 0043 (site ECL).
