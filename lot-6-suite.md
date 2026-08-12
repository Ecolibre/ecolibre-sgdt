# Lot 6 — suite : Tâches 3 à 6

**Ce fichier remplace `lot-6-consolide.md`**, dont les Tâches 1 et 2 sont
closes. Supprimer le précédent.

La numérotation des tâches est conservée pour rester cohérente avec
l'historique du wiki, qui porte déjà `[Lot 6][Tâche 1]` et `[Lot 6][Tâche 2]`.
En revanche **l'ordre d'exécution change** : la Tâche 4 passe en premier, parce
qu'elle seule peut échouer sur une contrainte serveur et dépendre d'un tiers.

---

## État au 10 août

Sept écritures effectuées les 9 et 10 août, toutes vérifiées.

- `Modèle:Functional item` — `+sep=,`, affichage `#arraymap`, libellé au pluriel
- `Formulaire:Functional item` — champ `Part_of` en `list|tokens`
- `Acheminer l'eau au point d'usage` — deux parents, vérifiés par `browsebysubject`
- `Modèle:Referenced item` — affichage `#arraymap`, ligne « Exemplaires physiques », paramètres renommés
- `Formulaire:Referenced item` — champs alignés sur les noms de propriétés
- `Bidon 220L bleu plastique Borde` — paramètres renommés
- `Modèle:Referenced item/doc` — noms de paramètres à jour

Effectifs à cette date : 20 fonctionnels, 2 organiques, 2 référencés, 3
physiques. Séquence Base 36 contiguë de 0001 à 000P.

**Correction (2026-08-10, en reconnaissance de la Tâche 4e) :** ce compte est
resté stable au moment où il a été écrit mais est aujourd'hui dépassé — un
troisième item organique, `Transfert d'eau par vases communicants`
(`Item_ref=000Q`), a été créé par Cyril via le formulaire le 2026-08-09 à
17h45, entre les écritures ci-dessus et la rédaction de ce fichier. Non
détecté avant la reconnaissance de la Tâche 4e (`list=categorymembers` sur
`Category:Organic item` recompté à cette occasion). Effectifs réels
actuels : **20 fonctionnels, 3 organiques, 2 référencés, 3 physiques**.

**Deuxième correction, même occasion :** la séquence Base 36 n'est pas
contiguë et ne l'était déjà pas au moment où « État au 10 août » a été
rédigé — `000J` est absent (`action=ask` sur `[[Item_ref::+]]` : 25
références de `0001` à `000Q`, un trou entre `000I` et `000K`). Confirmé par
`Template:Item numbering audit`, qui le détecte correctement (« Références
orphelines / manquantes : 000J ») — l'outil fonctionne comme prévu, le trou
n'est pas nouveau et n'a pas été causé par les écritures de ce lot. La
mention « séquence contiguë » plus haut et dans les critères de vérification
de la Tâche 4 était donc déjà inexacte ; à lire désormais comme « aucun
nouveau trou introduit », pas comme « aucun trou ».

**Rappel des règles de `CLAUDE.md` :** lire avant de proposer ; proposer un diff
et attendre validation avant tout `wiki-put.sh` ; aucune référence Base 36 créée
hors production ; ne pas toucher à `Module:Base36` ni à `Item_ref` ; un refus
d'écriture est un résultat à rapporter, jamais un obstacle à contourner ; ne
rien inventer quand le cadrage dit « à vérifier ».

**Conventions de session :** écrire chaque diff dans `diffs/AAAA-MM-JJ-tacheN.md`
avant de l'afficher ; résumés d'édition au format `[Lot 6][Tâche N] <page> —
<ce qui change>` ; **relancer `bin/wiki-login.sh` avant la première écriture**,
la session expire entre une phase de lecture et une phase d'écriture.

**Qui fait quoi.** Tout est exécutable par Claude Code, y compris récupérer une
page rendue pour en contrôler l'affichage. Deux cas seulement exigent Cyril dans
un navigateur : tester un formulaire (`wiki-put.sh` court-circuite Page Forms),
et trancher un go/no-go. Si une consigne semble demander autre chose de manuel,
c'est une erreur de rédaction : le signaler.

---

# Tâche 4 — Propriétés de raccords

À faire en premier. Elle débloque la saisie de la facture Weldom, et sa première
étape peut buter sur une contrainte serveur.

## 4a — Enquête préalable : normaliser l'espace du widget

**Ne créer aucune propriété avant d'avoir rapporté le résultat de cette
enquête.**

Constat établi le 9 août : le widget `tokens` de Page Forms insère un espace
après le délimiteur malgré `delimiter=,`. Le formulaire produit
`Irriguer, S'hydrater`, pas `Irriguer,S'hydrater`.

Sans conséquence sur `Part_of`, propriété de type Page : MediaWiki normalise le
titre et absorbe l'espace. Mais les propriétés du tableau 4c sont de type Texte
et portent des valeurs autorisées ; l'espace y survit et met la contrainte en
défaut. `Thread_designation` sera multivaluée — un mamelon réducteur porte deux
filetages.

Trois pistes à tester **dans `Utilisateur:Cywil/Bac à sable`**, dans cet ordre.
Aucune ne crée de page d'item ni ne consomme de référence Base 36.

**Piste 1 — `#arraymap` comme normaliseur.** Privilégiée : aucun changement de
configuration serveur, et l'outil est déjà en production sur deux modèles.
Hypothèse : `#arraymap` rogne chaque valeur et les recolle avec le séparateur de
sortie demandé.

```
{{#arraymap:26x34, 20x27|,|@@@|@@@|,}}
```

Attendu si l'hypothèse tient : `26x34,20x27` sans espace. Le contrôle se fait
sur la page rendue, pas sur le wikitexte.

Si ça marche, la forme à retenir dans le modèle est :
```
{{#set:Thread_designation={{#arraymap:{{{Thread_designation|}}}|,|@@@|@@@|,}}|+sep=,}}
```

**Piste 2 — fonctions de chaîne de ParserFunctions.** À tester seulement si la
piste 1 échoue.

```
{{#replace:26x34, 20x27|, |,}}
```

Si la page rend littéralement `{{#replace:...}}` au lieu du résultat, les
fonctions de chaîne sont désactivées (`$wgPFEnableStringFunctions`, désactivé
par défaut). **C'est un point d'arrêt** : il faut alors une demande à
l'adminsys. Le rapporter immédiatement plutôt que de chercher un contournement.

**Piste 3 — changer de widget.** Tester si un champ `checkboxes` avec `list`
émet le même espace. Nécessite une vérification humaine dans le navigateur,
donc à réserver au cas où les deux premières pistes échouent.

**À écarter explicitement :** déclarer les valeurs autorisées en double, avec et
sans espace. Ça masque le problème au lieu de le corriger.

### Livrable de 4a

Un rapport court : quelle piste fonctionne, avec la sortie exacte observée.
Puis attendre validation avant 4b.

## 4b — Audit des propriétés manquantes

Deux manques suspectés, à vérifier et rapporter avant toute création.

**1. Fournisseur et référence fournisseur.** Le rendu de `Bidon 220L bleu
plastique Borde` ne montre aucune ligne fournisseur, et les champs vides y sont
pourtant affichés. Si ces propriétés n'existent pas, la source d'un item
référencé n'est portée que par le titre de sa page — ni requêtable, ni
exportable, et inutilisable pour l'automatisation depuis facture.

Distinguer deux propriétés : la référence **enseigne** (`0005604982` chez
Weldom) et la référence **fabricant**, souvent absente. Un code Weldom n'a
aucune valeur hors de France.

**2. Classification des familles.** `Part_of` est une relation de composition.
Rien ne permet de demander « tous les mamelons ». Une propriété plutôt qu'une
arborescence de catégories.

## 4c — Propriétés à créer

Lire d'abord `Attribut:Item_ref` et `Attribut:Property_cardinality` et
**reproduire exactement leur syntaxe**, y compris la forme localisée des
propriétés spéciales SMW (`A pour type`, `Peut avoir la valeur` en interface
française). Ne pas supposer la forme anglaise.

Renseigner chaque propriété créée avec les trois propriétés de schéma du lot 3 :
`Property_cardinality`, `Property_domain`, `Property_range`.

| Propriété | Type | Domaine | Valeurs / unité |
|---|---|---|---|
| `Connection_gender` | Texte | Organic item | M, F, MM, FF, MF |
| `Thread_designation` | Texte | Organic item | 12x17, 15x21, 20x27, 26x34, 33x42, 40x49, 50x60 |
| `Nominal_diameter` | Nombre | Organic item | mm (tubes PE : D20, D25, D32) |
| `Connection_standard` | Texte | Organic item | filetage gaz, compression PE, raccord rapide, à butée |
| `Fitting_family` | Texte | Organic item | mamelon, manchon, coude, té, nez de robinet, vanne, adaptateur |
| `Material` | Texte | Organic item | laiton, PE, PVC, inox |
| `Max_head` | Nombre | **Referenced item** | cm — hauteur de refoulement |
| `External_classification` | URL | Organic item | URL Wikipédia ou Wikidata du type d'objet |

**Pourquoi `Max_head` porte sur le référencé et non l'organique :** l'organique
est « pompe submersible », sans marque. C'est le produit précis qui refoule à
100 cm ou à 500 cm — la distinction entre les deux pompes du système de puits.
Une caractéristique qui distingue deux produits du même type appartient au
niveau référencé.

**Correspondance des filetages français** — diamètre intérieur × extérieur du
tube, pas une conversion de pouces :

| Désignation | Équivalent |
|---|---|
| 12x17 | 3/8″ |
| 15x21 | 1/2″ |
| 20x27 | 3/4″ |
| 26x34 | 1″ |
| 33x42 | 1″1/4 |

**Sur `External_classification` :** ne pas utiliser la propriété SMW
`Equivalent URI`, qui s'exporte comme une assertion d'identité. Un article
Wikipédia dénote un document, pas l'objet décrit. Une propriété dédiée de type
URL est le bon niveau d'engagement ; un `skos:closeMatch` viendra à l'export si
besoin. C'est la convention recommandée par le standard Open Know-Where pour
classer équipements, procédés et matériaux.

**Nommage :** tous les noms sont en anglais, comme le reste du schéma
(`Item_ref`, `Part_of`, `Maturity_level`). Ne pas introduire de nom français.

## 4d — Défaut de formulaire

`Bidon 220L bleu plastique Borde` porte « État de maturité : Certifié (OSHW) ».
C'est faux : c'est un bidon acheté chez un fournisseur. Vérifier si c'est la
valeur par défaut du formulaire. Si oui, proposer une valeur vide ou neutre, et
rapporter combien d'items existants portent cette valeur à tort.

## Vérification de la Tâche 4

1. Chaque propriété créée apparaît dans `Spécial:Propriétés` avec son type.
2. Test de la contrainte sur une valeur multiple avec espace, dans le bac à
   sable : la normalisation retenue en 4a doit produire deux valeurs propres.
3. **Aucun item de raccord n'est créé par cette tâche.** Si un item apparaît
   dans `Catégorie:Organic item` ou `Catégorie:Referenced item`, c'est une
   erreur à signaler.
4. Séquence Base 36 inchangée : toujours contiguë de 0001 à 000P.

## 4e — Renommage Organic item + câblage des propriétés dans les modèles et formulaires

Ajoutée le 2026-08-10, après création des propriétés (4c) et correction de
`Bidon 220L bleu plastique Borde` (4d). Sans ce câblage, aucune des
propriétés n'est consommée par un `#set` : la saisie Weldom reste impossible.
Élargie le même jour, avant écriture, sur deux points :

1. **Renommage des trois paramètres de `Modèle:Organic item` et
   `Formulaire:Organic item`** (`description→Item_description`,
   `function→Realizes_function`, `parent→Part_of`), même raisonnement que la
   2C — regroupé dans la même édition que le câblage plutôt qu'en édition
   séparée, le modèle étant déjà ouvert. Recherche plein texte toutes
   namespaces faite avant (voir `diffs/2026-08-10-tache4e.md` pour le détail
   et sa limite méthodologique constatée). Les trois items organiques réels
   (voir correction du recensement ci-dessus) sont réécrits dans la foulée.
2. **`Nominal_diameter` repassée en `single`** (c'était toujours le plus
   grand diamètre du produit, pas une vraie liste) et nouvelle propriété
   `Secondary_diameter` (`Number`, `multiple`, domaine `Organic item`) créée
   pour les autres diamètres d'un produit qui en porte plusieurs (manchon
   réduit, té). Les deux propriétés portent désormais une note sur le
   séparateur décimal (point, jamais virgule).

Quatre pages, modèle avant formulaire sur chaque paire, comme d'habitude :
1. `Modèle:Organic item` — renommage + huit propriétés de domaine `Organic
   item` (`Connection_gender`, `Thread_designation`, `Nominal_diameter`,
   `Secondary_diameter`, `Connection_standard`, `Fitting_family`, `Material`,
   `External_classification`). Normaliseur `#arraymap` + `+sep=,` sur les
   quatre multivaluées (`Thread_designation`, `Secondary_diameter`,
   `Connection_standard`, `Material`) — pas sur `Nominal_diameter`, single
   depuis l'élargissement.
2. `Formulaire:Organic item` — renommage + champs correspondants.
   `Nominal_diameter` en champ texte simple (single), `Secondary_diameter`
   en liste (`list|delimiter=,`).
3. `Modèle:Referenced item` — cinq propriétés de domaine `Referenced item`
   (`Max_head`, `Supplier`, `Supplier_reference`, `Manufacturer`,
   `Manufacturer_reference`). Aucune multivaluée, pas de normaliseur requis.
4. `Formulaire:Referenced item` — champs correspondants. `Supplier` et
   `Manufacturer` en `combobox|values from property=...` (testé via
   `action=pfautocomplete`, mécanisme fonctionnel, préféré au texte libre
   par décision).

**`External_classification` câblée dans `Modèle:Organic item` seulement**,
confirmé — malgré son domaine élargi (4c, ajustement 2) à `Referenced item`
et `Functional item` : la propriété classe « le type d'objet », ce qui
correspond au niveau organique (générique), pas au produit précis
(référencé) ni à la fonction. Le domaine élargi réserve la possibilité pour
plus tard sans l'activer ici.

### Vérification prévue

1. Rendu HTML (`action=parse&prop=text`) des deux items référencés et des
   trois items organiques réels : aucune cellule ne doit produire d'erreur de
   parseur, les nouveaux champs vides s'affichent proprement.
2. Recensement des quatre catégories inchangé (20/3/2/3 — effectif organique
   corrigé, voir « État au 10 août »).
3. Test de widget en navigateur (Cyril) — seule vérification humaine du lot,
   comme pour les widgets `tokens` déjà posés en Tâche 1. Inclut le
   `combobox|values from property=` de `Supplier`/`Manufacturer`, dont seul
   le mécanisme d'autocomplétion a pu être testé par API, pas le rendu réel
   du widget.

---

# Tâche 3 — Audit des directions inverses

Le modèle a quatre liens, donc quatre réciproques possibles. Auditer et
rapporter lesquelles sont réellement rendues. **Ne corriger que celles qui
manquent, après validation.**

| Direction | Où elle devrait apparaître | État connu |
|---|---|---|
| fonction → organiques qui la réalisent | page fonctionnelle | présent |
| organique → référencés qui le fournissent | page organique | présent |
| référencé → exemplaires physiques | page référencée | fait le 9 août (2B) |
| item → composants (BOM) | les trois niveaux | présent |

Reprendre la forme du `#ask` posé en 2B pour toute réciproque manquante, y
compris le `default=` en italique, par cohérence avec le reste des modèles.

**Audit exécuté le 2026-08-10 :** les quatre directions sont présentes dans
le wikitexte des modèles, aucune correction nécessaire.
- Fonction → organiques : `Modèle:Functional item`, section « Solutions
  organiques (Comment) », `#ask: [[Realizes_function::{{FULLPAGENAME}}]]`.
- Organique → référencés : `Modèle:Organic item`, section « Implémenté par
  (Solution technique) », `#ask: [[Corresponds_to_organic::{{FULLPAGENAME}}]]`
  — **la ligne « à vérifier » ci-dessus était obsolète**, ce réciproque
  existait déjà avant cette session (auteur et date non déterminés faute
  d'historique consulté) ; corrigé en « présent ».
- Référencé → exemplaires physiques : confirmé, cf. 2B (2026-08-09).
- BOM aux trois niveaux : `Part_of`/enfants présent sur `Functional item`
  (« Sous-fonctions »), `Organic item` (« Sous-systèmes ») et
  `Referenced item` (« Composants enfants (BOM) »).

**Limite de la méthode :** vérification au niveau du wikitexte source
uniquement (`bin/wiki-get.sh` ne renvoie pas de HTML rendu, cf. dette 8) —
confirme que chaque `#ask` est bien posé avec la bonne direction de
propriété, pas que des données réelles remontent dans le tableau produit.
Aucune donnée de production n'a été altérée pour ce contrôle, conformément à
la leçon 5 (« une vérification par formulaire n'est jamais en lecture
seule ») — seule la lecture de wikitexte de modèle a été utilisée.

---

# Tâche 5 — Ajouts à `CLAUDE.md`

Huit règles apprises pendant le lot 6. Lire `CLAUDE.md` d'abord et les insérer
dans la section traitant des pièges SMW ; si elle n'existe pas, en proposer une.

**Si `CLAUDE.md` dépasse 200 lignes après ajout, proposer un découpage** en
fichier séparé importé par `@chemin`, plutôt que de laisser grossir.

**1. `+sep=` est par propriété et sa position compte.**
> Dans un `#set`, `|+sep=` s'applique à la propriété qui le précède
> immédiatement, pas au bloc entier. Le déplacer casse le découpage de la
> propriété concernée.

**2. SMW ne rogne pas les espaces des valeurs intermédiaires.**
> Avec `|+sep=,`, `A, B, C` produit `A`, ` B`, ` C`. Une propriété de type Page
> absorbe l'espace par normalisation du titre ; une propriété de type Texte le
> conserve et met en défaut ses valeurs autorisées.

**3. Le widget `tokens` insère un espace après le délimiteur.**
> Constaté le 9 août : malgré `delimiter=,`, Page Forms écrit `A, B`. À
> normaliser côté modèle, pas à espérer côté formulaire.

**4. Modèle avant formulaire.**
> Poser un `+sep=` ou un `#arraymap` sur un modèle recevant une valeur unique
> est inerte. L'ordre inverse ouvre une fenêtre où des valeurs multiples
> peuvent être enregistrées dans un modèle incapable de les stocker.

**5. Une vérification par formulaire n'est jamais en lecture seule.**
> Rouvrir un item pour inspecter ses champs, c'est risquer de l'enregistrer
> modifié. Constaté le 10 août : un `Item_description` est apparu pendant une
> vérification. Sans conséquence ici, mais un item déjà renseigné pourrait voir
> ses valeurs réécrites.

**6. Ni `embeddedin` ni la recherche plein texte ne suffisent seuls avant un
renommage — il faut les deux, puis une lecture individuelle.**
> Constaté le 10 août, en deux temps. D'abord (2C) : `Modèle:Referenced
> item/doc` documentait des paramètres en prose sans transclure le modèle —
> ni `categorymembers` ni `embeddedin` ne l'auraient trouvée, seule la
> recherche plein texte (`srnamespace=*`) l'a fait. Ensuite (4e, renommage
> `Organic item`) : l'inverse — la recherche plein texte sur `description`,
> `function`, `parent` n'a trouvé **aucun** des trois items réels utilisant
> ces paramètres, alors qu'`embeddedin` les a tous trouvés instantanément.
> Cause : cet index de recherche indexe le contenu **rendu** des pages, pas
> leur wikitexte brut — un nom de paramètre de template (`function=...`)
> disparaît du texte rendu, seule sa valeur y survit. La méthode fiable
> combine donc les deux : `embeddedin` pour les usages réels (transclusions),
> recherche plein texte pour les pages qui *parlent* de l'ancien nom sans
> transclure le modèle, puis lecture individuelle de chaque page trouvée par
> l'une ou l'autre — aucune des deux ne suffit seule.

**7. La session expire entre lecture et écriture.**
> Une session qui commence par une phase de lecture verra sa première écriture
> échouer sur un cookie périmé. Relancer `bin/wiki-login.sh` avant d'écrire.

**8. Comment vérifier un fait SMW réellement stocké.**
> `bin/wiki-get.sh` ne gère pas `action=browsebysubject`, et la lecture du
> wikitexte ne montre pas ce qui est stocké.
> ```
> curl -s "https://wiki.ecolibre.org/api.php?action=browsebysubject&subject=NOM_DE_PAGE&format=json&formatversion=2" \
>   | jq '.query.data[] | select(.property=="NOM_PROPRIETE")'
> ```
> Un seul `dataitem` contenant le séparateur = découpage non appliqué. Propriété
> absente = le `#set` ne reçoit pas le paramètre. Équivalent humain :
> `Spécial:Parcourir`. **L'affichage ne prouve rien** : `#arraymap` rogne les
> espaces, `#set` non — deux liens corrects peuvent masquer une donnée fausse.

**9. Lire l'état du wiki avant de raisonner, pas seulement avant d'écrire.**
> Une copie locale est une photo, pas un état — des modifications hors session
> sont possibles à tout moment (Cyril via le formulaire, un autre outil). Un
> constat ou un diagnostic bâti sur une copie locale peut être faux avant même
> d'aboutir à une proposition d'écriture. Constaté le 2026-08-10 : les copies
> locales de `Formulaire:Organic item` et `Formulaire:Referenced item`
> dataient du 28 juillet, avant les renommages de paramètres et les ajouts de
> champs de la Tâche 4 — un diagnostic construit dessus aurait porté sur des
> noms de champs qui n'existent plus sur le wiki.

---

# Tâche 6 — Consigner les dettes techniques

Localiser d'abord où vivent les dettes connues sur le wiki. **Si aucune page ne
les recense**, ne pas s'arrêter : proposer une page dédiée avec son contenu
prêt, et attendre validation avant de la créer.

Treize entrées à consigner (dettes, limites de modèle assumées, faits à
retenir — cf. retour de Cyril sur le titre de la page cible, ci-dessous),
aucune à corriger.

**1. Racine de l'arbre fonctionnel codée en dur.**
> `Catégorie:Functional item` interroge l'arbre avec `root=Assurer les besoins
> vitaux`. L'ouverture d'une seconde branche racine ferait disparaître ses items
> de l'affichage sans erreur.

**2. L'arbre fonctionnel est devenu un graphe orienté acyclique.**
> Depuis le 9 août, un item fonctionnel peut avoir plusieurs parents.
> `format=tree` avec `parent=Part_of` suppose un parent unique, et aucune
> détection de cycle n'existe côté fonctionnel. Le patron de résolution existe
> déjà : `Board_lineage` matérialise la fermeture réflexo-transitive de
> `Board_parent` ; `Module:Board` porte la détection de cycle.

**3. Une cellule « Fonctions parentes » vide est ambiguë.**
> Rien ne distingue à l'écran l'item racine, légitimement sans parent, d'un item
> dont le parent aurait été perdu. Un `default=` explicite lèverait l'ambiguïté.

**4. `Organic item` et `Physical item` gardent des noms de paramètres divergents.**
> Trois conventions cohabitent sur les quatre modèles. Seul `Referenced item` a
> été aligné le 10 août. `Physical item` est le plus délicat : `Inventory_ref` y
> est composé à partir de `site_code` et `ref_number`, donc ce n'est pas un
> simple renommage. À traiter dans un lot dédié, hors phase de saisie.
> Technique à retenir pour ce lot : faire accepter temporairement les deux noms
> au modèle (`{{{nouveau|{{{ancien|}}}}}}`), réécrire les pages, puis retirer
> l'ancien. Inutile pour une page, indispensable pour vingt.

**5. `Modèle:Referenced item/doc` est incomplète.**
> Elle ne documente ni `Item_description` ni `Corresponds_to_organic`, et écrit
> `item_ref` en minuscule. Trou antérieur au lot 6.

**6. `Formulaire:Referenced item` n'a pas de `delimiter=,` explicite** sur son
> champ `Part_of`, contrairement à son équivalent fonctionnel. Sans conséquence
> — la virgule est le séparateur par défaut de Page Forms — mais l'asymétrie
> entre deux formulaires jumeaux est une source de confusion.

**7. `$wgFileExtensions` n'autorise pas le SVG.**
> Interdit le téléversement de dessins vectoriels sur un système de données
> techniques. Demande à l'adminsys, avec les trois extraits de
> `LocalSettings.php` déjà attendus.

**8. `bin/wiki-get.sh` ne gère ni `list=allpages` ni `action=browsebysubject`.**
> Ce dernier est le seul moyen de lire les faits SMW réellement stockés, et doit
> être appelé en curl direct à chaque vérification.

**9. `Template:Item numbering audit` interroge `[[Item_ref::+]]` sans filtre de
> catégorie.** La détection des trous porte sur tout le wiki. À traiter avec le
> lot de numérotation, hors phase de saisie.

**10. L'échelle de maturité ne prévoit aucune valeur pour un produit du
commerce.**
> `Maturity_level` (`Idea`/`Study`/`Prototype`/`Certified`/`Obsolete`) est une
> échelle de maturité de conception (OSHW), sans valeur adaptée à un produit
> acheté tel quel chez un fournisseur — cas qui sera pourtant majoritaire
> parmi les items référencés à venir (facture Weldom, Tâche 4). Constaté le
> 2026-08-10 sur `Bidon 220L bleu plastique Borde`, dont le `Certified` erroné
> est corrigé séparément (Tâche 4d) ; le problème de fond — l'absence de
> valeur adaptée dans l'échelle elle-même — reste entier.

**11. `Thread_designation` et `Secondary_diameter` ne disent pas quel
filetage va avec quel diamètre sur un raccord à plusieurs orifices.**
> Un mamelon réducteur ou un té asymétrique porte plusieurs filetages et
> plusieurs diamètres, mais les deux listes sont stockées indépendamment
> l'une de l'autre (deux propriétés multivaluées séparées, sans lien entre
> position N de l'une et position N de l'autre). Suffisant pour rechercher
> (« tous les items en 26x34 ») mais insuffisant pour reconstruire la
> géométrie exacte d'un raccord (quel orifice porte quel filetage à quel
> diamètre). Corriger demanderait un sous-objet par orifice (`Has subobject`
> SMW ou motif équivalent), hors périmètre de la Tâche 4. Constaté le
> 2026-08-10 en préparant le câblage de 4e.

**12. `000J` est un trou définitif dans la séquence Base 36.**
> Référence attribuée puis rendue orpheline (page créée, ensuite renommée ou
> supprimée) — le trou décrit dans « État au 10 août » (25 références de
> `0001` à `000Q`, absence entre `000I` et `000K`) n'est pas une lacune de
> comptage mais une conséquence du principe de non-réemploi des identifiants :
> `000J` ne doit **jamais** être réattribué à un nouvel item, même si la
> séquence reste trouée. Constaté et qualifié le 2026-08-10, à la demande
> explicite de Cyril. À traiter avec le lot de numérotation (cf. dette 9),
> hors phase de saisie.

**13. Les pages de fournisseur créées par `Supplier` sont des pages nues.**
> `Supplier` (sur `Referenced item`) pointe vers des pages comme celles de
> Borde ou Weldom, créées dans l'espace principal sans modèle, sans
> formulaire et sans catégorie — à côté du modèle de données des items sans
> en faire partie. Une adresse ou un lien Odoo sur ces pages demandera de
> trancher : cinquième classe, ou décision explicite de ne rien en faire.
> Constaté et qualifié le 2026-08-10, à la demande explicite de Cyril.

**Retour de Cyril sur la Tâche 6 (2026-08-10) :** page cible renommée
« Limites connues du Système de Gestion de Données Techniques » (pas
« Dettes techniques » — les entrées ne sont pas toutes des dettes), page à
part entière (pas une sous-page du Récapitulatif — pendant symétrique, pas un
détail), lien croisé dans les deux sens avec le Récapitulatif. Brouillon dans
`pages/Limites_connues_SGDT.draft.txt`, à valider avant création
(`--createonly`).

---

## Ordre d'exécution

| # | Tâche | Pourquoi ici |
|---|---|---|
| 1 | **4a** — enquête sur l'espace | Seul point pouvant dépendre de l'adminsys. À lever tôt. |
| 2 | **4b, 4c, 4d** | Débloquent la saisie Weldom. Conditionnés par 4a. |
| 3 | **3** — directions inverses | Lecture seule pour l'essentiel. |
| 4 | **5** — `CLAUDE.md` | Indépendante, sans risque. |
| 5 | **6** — dettes | Indépendante, sans risque. |

Si 4a bute sur une contrainte serveur, basculer sur 3, 5 et 6 pendant que la
demande à l'adminsys chemine. Aucune saisie d'item ne commence avant la fin de
la Tâche 4.

## Contrôle final

1. **Liens entrants** sur chaque page modifiée — un retour à la ligne dans
   `[[ ]]` casse un lien sans erreur d'API.
2. **Recensement des quatre catégories** comparé à l'état initial : 20
   fonctionnels, 3 organiques, 2 référencés, 3 physiques. Un compteur de
   catégorie n'est pas un recensement : des pages de documentation peuvent s'y
   glisser.
3. **Séquence Base 36** — de 0001 à 000Q, avec le trou connu en `000J`
   (dette 12, non réattribuable) ; aucune autre référence consommée.
4. **Statut des fichiers de `diffs/`** mis à jour après chaque écriture
   confirmée sur le wiki.
