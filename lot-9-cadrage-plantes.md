# Lot 9 — cadrage : exemplaires plantés du jardin-forêt

**Rédigé le 13 août 2026.** À exécuter par Claude Code depuis `~/ecolibre-sgdt`.
Prérequis de lecture : `CLAUDE.md`, `lot-8-cadrage-facettes.md` (décisions 1.4
et §6 en particulier), `upload-2026-08-12.md`, la page *Récapitulatif technique
du Système de Gestion de Données Techniques*, la page *Limites connues du
Système de Gestion de Données Techniques*, la page *Registre des facettes*.

Format des résumés d'édition : `[Lot 9][Tâche N]`. Toute écriture ne relevant
pas d'une tâche de ce lot porte `[Correctif]`, jamais un numéro de lot.

**Échéance réelle :** réunion avec Mathieu Foudral, concepteur du design du
jardin-forêt, la semaine du 17 août 2026. Le livrable qui compte est une page
unique récapitulant l'avancement de cinq plants. Tout le reste est
infrastructure au service de cette page.

---

## 0. Objet

Le lot 8 a livré le mécanisme de facettes et la facette végétale **au niveau
organique** — l'espèce. Il excluait explicitement « la saisie des plantes, la
facette végétale au niveau physique ». Le lot 9 remplit cette case et s'en sert.

**Ce que le lot livre :**

- le bloc `(Facette végétal × item physique)` : modèle d'affichage, bloc de
  formulaire, propriétés ;
- une seconde banque de références Base 36, propre aux items physiques,
  préfixée `ECL` à l'affichage ;
- trois items de lieu, cinq espèces, cinq items référencés, cinq plants ;
- l'annotation des photos déjà téléversées, en deux temps ;
- une page récapitulative unique, destinée à la réunion.

**Ce que le lot ne livre pas :** les planches de culture, les récoltes,
l'entité réception, la filiation pied mère → bouture, les 37 propriétés
végétales de l'espèce (seul `Taxon_name` est renseigné), la modification de
`Module:Base36`.

**Conséquence voulue :** en ne renseignant pas les fiches d'espèce, le lot ne
touche pas à la question de compatibilité CC BY-SA des sources botaniques,
inscrite comme question ouverte du lot 9 sur la Feuille de route. Elle reste
ouverte et hors périmètre.

---

## 1. Décisions d'architecture

Arrêtées les 12 et 13 août avec Cyril. À ne pas rouvrir à l'exécution.

**1.1 — La date de plantation est portée par l'exemplaire.** Motif donné par
Cyril : sur une même planche, deux plantes associées peuvent être mises en
terre à deux dates différentes. La planche ne peut donc pas porter la date.
Ceci confirme le §6 du cadrage du lot 8 et **ferme** la question inscrite comme
ouverte sur la Feuille de route (voir tâche 10).

**1.2 — Répartition sur les trois niveaux.**

| Niveau | Porte |
|---|---|
| Organique | ce qui est commun à tous les plants de cette plante |
| Référencé | la provenance, associée à une année — à minima la génétique |
| Physique | tout ce qui est propre à ce plant-là |

**1.3 — Le référencé dit « ce type, de cette source, cette année-là ».** Il ne
dit ni combien tu en as reçu, ni quel jour. Cette phrase doit figurer dans la
page de registre `Facette végétal` : sans elle, le référencé et l'entité
réception du lot 7 fusionneront en six mois. Le même type de plante repris à la
même pépinière une autre année est un **autre** item référencé.

**1.4 — Un lieu est un item physique, pas une propriété.** Trois items :
Le Buisson de Cerzat, Jardin de Chilhac, Terrasse de Chilhac. Chaque plant est
`Part_of` son lieu. Le jour où les planches existeront, elles s'insèreront
entre le lieu et le plant sans toucher au modèle du plant — ce qu'une propriété
texte n'aurait pas permis.

**1.5 — L'ordre le long de la butte est une propriété du plant**,
`Planting_rank`, numérotée **de dix en dix**. Une plante intercalée ne force
pas à renuméroter les suivantes. Vide pour les plants de Chilhac.

**1.6 — Les attributs d'une photo sont portés par la page `Fichier:`, pas par
le plant.** Avec plusieurs photos par plant, un `Image_date` unique sur le
plant ne saurait pas dire quelle date va avec quelle photo. Le lien va de la
photo vers le plant ; la fiche du plant affiche sa photo la plus récente par
requête.

**1.7 — Deux banques de références Base 36 distinctes.** Les items physiques
ne rejoignent pas la séquence commune aux items fonctionnels, organiques et
référencés : ils ont la leur. Ceci **ferme la correction en attente n° 2** de
`CLAUDE.md`.

- La valeur stockée est **non préfixée** (`0001`), dans une propriété
  **distincte** de `Item_ref` : `Inventory_number`.
- Le préfixe `ECL` est un **affichage**, produit par le modèle à partir d'une
  constante de site. `ECL-0001` apparaît partout à l'écran, jamais en base.
- Motif : `Module:Base36` utilise `clean:match("[%w]+")`, qui s'arrête au
  tiret ; une valeur préfixée serait silencieusement mal lue. C'est la
  correction en attente n° 3, non corrigée, et le lot ne marche pas dessus.
- Motif second : `Item_ref` et `Inventory_number` étant deux propriétés,
  un `0001` physique et un `0001` fonctionnel ne se confondent pas.
- `ECL` désigne le **wiki producteur**, conformément au registre des préfixes
  de site, pas une classe d'items. Un partenaire qui duplique le dispositif
  change une constante, pas N pages.

**1.8 — `Specimen_status` décrit un franchissement, pas une saison.** La
dormance est écartée : tout caduc est en dormance en janvier, la valeur
deviendrait fausse par le seul écoulement du calendrier. Une propriété qui
change avec le calendrier seul ne se stocke pas. Cinq valeurs, minuscules :

`en place` · `repris` · `souffrant` · `mort` · `remplacé`

`en place` = planté, reprise non encore confirmée. `repris` = a passé sa
première saison. Une observation datée de dormance relève de la même famille
que les récoltes et la réception : lot 7.

**1.9 — Toute requête portant sur une facette porte un filtre de classe.** Le
modèle physique émet le même `Item_facet::Facette végétal` et la même catégorie
que le modèle organique — c'est la même facette. Ce sont donc les catégories de
classe (`Physical item`, `Organic item`) qui séparent les deux populations dans
les requêtes. Sans ce filtre, une fiche d'espèce et un plant remontent
ensemble. Même famille que la correction en attente n° 4.

**1.10 — Mathieu Foudral n'est pas cité sur la page.** Choix délibéré de Cyril :
lui montrer la page d'abord, lui proposer d'y figurer ensuite. À consigner comme
décision, pour que la question revienne après la réunion et pas dans deux ans.

---

## 2. Conventions

Reprises du lot 8, sans exception :

| Objet | Convention | Exemple |
|---|---|---|
| Modèle d'affichage | anglais, `<Classe> facet <facette>` | `Modèle:Physical facet plant` |
| Bloc de formulaire | sous-page du formulaire | `Formulaire:<nom réel>/bloc facette végétal` |
| Propriété | anglais, underscore | `Planting_date` |
| Paramètre de modèle | porte le nom de la propriété qu'il alimente | |

**Pas de nouvelle page de registre.** `Facette végétal` existe ; c'est la même
facette, on lui ajoute son second bloc. Créer `Facette végétal physique`
serait une erreur.

**Valeurs d'énumération en minuscules.** Leçon `Forest_garden_layer` : une
majuscule initiale dans la donnée produit un avertissement SMW de valeur non
autorisée.

**Nommage des fichiers média** : `ECL-<lieu>-<plante>-<AAAA-MM-JJ>_<nn>.jpg`,
tel qu'appliqué aux 73 photos et désormais consigné dans `CLAUDE.md`. Le tiret
sépare les champs, l'underscore appartient au contenu d'un champ. **Tout
découpage programmatique se fait sur le tiret, jamais sur l'underscore.**

---

## 3. État attendu du wiki

Établi d'après le dépôt et la conversation, **non vérifié**. Toute divergence
arrête le lot et fait l'objet d'un signalement, jamais d'un contournement.

- Trois items physiques préexistants, dont les références relèvent de la
  séquence commune. Leur sort est une question de la tâche 0.
- `Item_facet` déclarée avec un domaine couvrant les trois classes organique,
  référencée et physique (lot 8, tâche 1), mais mise en œuvre sur le seul
  formulaire organique.
- Le mécanisme de facette fonctionne sur le formulaire organique, **validé
  empiriquement par Cyril le 11 août** — et non par la documentation Page
  Forms, qui ne décrit pas ce montage (rapport de tâche 0 du lot 8, point 2a).
- 73 pages `Fichier:` existent, sans aucune annotation sémantique.
- `Modèle:Physical item` conserve l'ancienne convention de nommage des
  paramètres, contrairement aux modèles organique et référencé.
- `Procurement_route` : le dépôt indique le lot 7 non exécuté ; une note
  d'architecture indique la propriété créée. Contradiction à lever en tâche 0.
- `$smwgEnabledQueryDependencyLinksStore` est actif ; la file de travaux ne se
  vide pas par le trafic de lecture, mais un mécanisme régulier côté serveur la
  purge.

---

## 4. Tâches

### Tâche 0 — Reconnaissance. Aucune écriture.

Rien n'est écrit tant que le rapport de cette tâche n'est pas validé par Cyril.
Livrable : un fichier **et** l'affichage intégral dans la réponse, Cyril lisant
depuis un téléphone.

1. **Nom réel du formulaire des items physiques.** Par
   `list=allpages` sur l'espace Formulaire. Ne pas le déduire du nom du modèle :
   le lot 8 prévoyait `Formulaire:Item organique`, la page réelle est
   `Formulaire:Organic item`.
2. **`Modèle:Physical item` et le formulaire correspondant**, lus en entier :
   convention de nommage des paramètres, propriété qui porte la référence,
   propriété qui relie un item physique au niveau supérieur, et si ce lien est
   **obligatoire** vers un item référencé.
3. **Les trois items physiques existants**, un par un : quelle référence, dans
   quelle propriété, sous quelle forme. C'est ce qui décide si la nouvelle
   banque les concerne ou si elle démarre à côté.
4. **`Module:Base36`** : comment le compteur courant est interrogé, sur quelle
   propriété, et ce qu'il faudrait changer pour qu'il serve une seconde banque.
   Lecture seule — le lot ne modifie pas le module.
5. **Le mécanisme de facette réellement en place** : lire
   `Formulaire:Organic item`, son bloc `bloc facette végétal` et
   `Modèle:Organic facet plant`, et relever **exactement** le montage qui
   évite l'appel de modèle vide (marqueur sur le `<div>`, `show on select`,
   échappement HTML des accolades dans la sous-page transcluse). Il sera copié
   à l'identique, pas réinventé.
6. **`Procurement_route`** : existe-t-elle ? Avec quel domaine et quelles
   valeurs ?
7. **Type `Date`** : une propriété de ce wiki utilise-t-elle déjà
   `Has type::Date` ? Si oui, quelle formule pour son `Property_range` ? Sinon,
   proposer et faire valider avant d'écrire.
8. **Inventaire des plantes photographiées** : extraire des 73 noms de fichiers
   la liste des valeurs distinctes du champ `<plante>` et du champ `<lieu>`,
   avec le nombre de photos et la plage de dates pour chacune. **Découper sur
   le tiret.** C'est dans cette liste que Cyril choisira les cinq plants.
9. `prop=info&inprop=protection` sur toute page à modifier, et rappel que
   Lockdown peut restreindre sans apparaître ici.

**Conditions d'arrêt.** Le lot s'arrête et l'arbitrage est rouvert si : le lien
vers un item référencé est obligatoire et incompatible avec le périmètre ; le
montage du point 5 n'est pas reconstituable par lecture ; les trois items
physiques existants portent des références qui rendent la seconde banque
ambiguë.

### Tâche 1 — Les huit propriétés

Chacune avec ses cinq annotations d'usage : `Property_description_FR`,
`Property_description_EN`, `Property_domain`, `Property_range`,
`Property_cardinality`. Rappel : ces trois dernières sont des conventions du
projet, non lues par SMW.

| Propriété | Type | Porteur | Cardinalité |
|---|---|---|---|
| `Planting_date` | Date | item physique | single |
| `Planting_rank` | Number | item physique | single |
| `Specimen_status` | Text, énumération fermée | item physique | single |
| `Inventory_number` | Text | item physique | single |
| `Sourcing_year` | Number | item référencé | single |
| `Depicts_specimen` | Page | page `Fichier:` | multiple |
| `Image_date` | Date | page `Fichier:` | single |
| `Image_location` | Page | page `Fichier:` | single |

`Specimen_status` reçoit ses cinq `Allows value` en minuscules et
`Property_range::énumération fermée`, formule retenue au lot 8.

Les propriétés numériques suivent la convention `Max_head` : type `Number`
plus `Property_range` textuelle, jamais `Quantity`.

**Point de convention nouveau, à faire valider :** les trois dernières
propriétés ont pour domaine l'espace de noms `Fichier`, pas une catégorie.
Proposer une formule pour `Property_domain` et la faire valider avant d'écrire
les trois pages — c'est le premier cas du genre sur ce wiki.

**Ordre :** écrire les propriétés avant tout modèle qui les annote. Vérifier
chacune par `browsebysubject` **sans filtre d'abord** — les propriétés
spéciales de SMW apparaissent sous leur nom interne (`_PVAL`, `_TYPE`), et
filtrer sur le nom d'affichage produit un faux négatif.

### Tâche 2 — `Modèle:Physical facet plant`

Sous-tableau titré « Facette végétale — exemplaire », sous le tableau du modèle
de classe. Émet `[[Item_facet::Facette végétal]]` et la catégorie de facette.

**Contrainte de rédaction, déjà payée deux fois au lot 8 :** une table en
syntaxe wiki ne peut pas figurer dans l'argument d'un `{{#if:}}` — ses `|` sont
pris pour des séparateurs d'arguments et corrompent tout le bloc. Sortir le
tableau du `#if`, y laisser le `#set` et la catégorisation.

Affiche la référence sous la forme `ECL-{{{Inventory_number}}}`, le préfixe
venant d'une constante de site définie une fois, pas répétée dans le modèle.

Affiche la photo la plus récente du plant par requête interne :
`#ask` sur `Depicts_specimen::{{PAGENAME}}`, tri décroissant sur `Image_date`,
`limit=1`.

### Tâche 3 — `Modèle:Specimen photo`

Modèle d'annotation des pages `Fichier:`. Trois paramètres nommés d'après leurs
propriétés, un `#set`, un tableau d'affichage court, une catégorie de
maintenance pour les fichiers annotés.

### Tâche 4 — Bloc de formulaire et champ de sélection

Sous-page `Formulaire:<nom réel>/bloc facette végétal`, copiant **à
l'identique** le montage relevé en tâche 0 point 5, y compris l'échappement
HTML des accolades (`{` → `&#123;`, `|` → `&#124;`, `}` → `&#125;`) exigé par
la double passe de parsing.

Dans le formulaire des items physiques, ajouter le champ `Item_facet` en
`checkboxes` avec `values from category=Facette`, `show on select` vers le
bloc, et la ligne de transclusion.

**Piège du lot 8 :** `Item_facet` doit être un vrai champ du modèle de classe,
enregistré sur la page. Sinon, à la réédition, les cases reviennent décochées,
les blocs restent masqués alors que les appels de modèle sont toujours là, et
la sauvegarde efface silencieusement des données.

### Tâche 5 — Vérifications fonctionnelles

Sur `Utilisateur:Cywil/Bac à sable`, jamais sur un item réel. Chaque point est
constaté, pas supposé. **C'est le test du lot 8 rejoué sur une autre définition
de formulaire** : le montage n'étant pas documenté, il n'est pas acquis.

1. Créer un item physique, cocher la facette, remplir, sauver → les
   annotations sont présentes dans `Spécial:Parcourir`.
2. **Rouvrir la page avec le formulaire** → la case est cochée, le bloc
   visible, les champs remplis. *C'est le point qui échoue en pratique. S'il
   échoue : signaler et s'arrêter, ne pas contourner.*
3. Décocher, sauver → l'appel de modèle et les annotations ont disparu.
4. Ne rien cocher → aucun appel de modèle vide, aucun tableau fantôme.
5. Nettoyer la page bac à sable.

### Tâche 6 — Les trois items de lieu

Le Buisson de Cerzat, Jardin de Chilhac, Terrasse de Chilhac. Items physiques
sans facette. Ils inaugurent la banque `Inventory_number`.

**Un item à la fois, contrôle de la référence entre chaque.** La détection de
doublons du module d'audit n'existe toujours pas (correction en attente n° 1),
et ce lot est le plus gros volume de créations jamais passé sur ce dispositif.
Jamais d'écriture en rafale.

### Tâche 7 — Cinq espèces, cinq référencés, cinq plants

Les cinq plantes sont choisies par Cyril dans l'inventaire de la tâche 0
point 8. Pour chacune :

- **item organique** — `Taxon_name` seul, plus `Item_facet::Facette végétal`.
  Ne rien renseigner d'autre : les 37 propriétés restent vides, volontairement.
- **item référencé** — provenance et `Sourcing_year`. Si `Procurement_route`
  existe, la renseigner ; sinon ne pas la créer dans ce lot.
- **item physique** — `Part_of` son lieu, `Planting_date`, `Planting_rank`
  (dix en dix, vide à Chilhac), `Specimen_status`, `Item_facet`,
  `Inventory_number`.

Même règle qu'en tâche 6 : un à la fois, contrôle entre chaque. Quinze items.

### Tâche 8 — Annotation des photos des cinq plants

Par script, en s'appuyant sur le découpage des noms de fichiers. Pour chaque
photo dont le champ `<plante>` correspond à l'un des cinq plants :
`Depicts_specimen`, `Image_date` et `Image_location`.

**Les 68 autres photos ne sont pas annotées dans cette tâche** : leur plant
n'existe pas encore comme item, et `Depicts_specimen` n'aurait pas de cible.
Rien n'est perdu — le nom de fichier porte l'information. Reprise en tâche 11.

### Tâche 9 — La page récapitulative

Page unique, titre à valider par Cyril. Une requête `#ask` sur
`Category:Physical item` filtrée sur `Item_facet::Facette végétal`, en
`format=template`, une ligne par plant : photo la plus récente, nom, espèce,
lieu, date de plantation, rang, statut. Tri sur le lieu puis le rang.

**Une phrase en tête, non décorative :** la page couvre cinq exemplaires saisis
en premier, pas l'ensemble du jardin. Sans elle, « cinq » se lit comme « cinq
de faits ».

**Après écriture :** purger par `bin/wiki-purge.sh`, puis vérifier le rendu réel
par `action=parse&prop=text`. Cinq lignes doivent apparaître, chacune avec sa
photo. Une requête qui rend zéro ligne après purge est un défaut à signaler,
pas à contourner par un tableau écrit à la main.

### Tâche 10 — Documentation

- **Feuille de route** : l'entrée « Lot 9 (plantes) » inscrit comme ouverte la
  question « qui porte la date de plantation, la planche ou l'exemplaire
  planté ». Elle était déjà tranchée par le §6 du cadrage du lot 8, et l'est de
  nouveau par la décision 1.1 ci-dessus. **Fermer l'entrée en consignant la
  décision et son motif** — les cultures associées — et non la supprimer.
- **Récapitulatif technique** : la facette au niveau physique, les deux banques
  de références, la règle 1.9 du filtre de classe, la convention de nommage des
  fichiers média.
- **Limites connues** : `Template:Item numbering audit` interroge `Item_ref::+`
  et ne voit donc pas la banque physique, qui vit dans `Inventory_number` —
  aucune donnée n'est corrompue, l'audit est simplement aveugle à cette
  seconde banque. Et : le préfixe `ECL` est un affichage, jamais une valeur
  stockée, tant que `Module:Base36` s'arrête au tiret.
- **`Facette végétal`** : ajouter le bloc physique, les classes concernées, la
  phrase de la décision 1.3, et la distinction entre `Propagation_method` — qui
  dit comment l'espèce se multiplie — et la provenance du référencé, qui dit
  comment cet exemplaire-là a été obtenu.
- **`CLAUDE.md`** : retirer la correction en attente n° 2, fermée par la
  décision 1.7.

### Tâche 11 — Après la réunion

Hors chemin critique. Annotation des 68 photos restantes, à mesure que les
plants correspondants sont créés. Le vocabulaire fin de vigueur, s'il en sort
un, se pose alors sur `Specimen_status`.

---

## 5. À trancher par Cyril

1. **Les cinq plantes**, dans l'inventaire de la tâche 0 point 8.
2. **La banque physique.** Deux voies : allouer les huit références à la main
   dans ce lot, en consignant la dernière valeur attribuée sur la page de
   registre ; ou modifier `Module:Base36` pour qu'il serve deux banques.
   **Recommandation : à la main.** Huit valeurs écrites une fois, contre une
   modification de module sous contrainte de réunion, sur un module dont la
   détection de doublons n'existe pas. La modification devient un lot à elle
   seule, avec la correction n° 1 et la correction n° 3.
3. **Le titre de la page récapitulative.**
4. **La formule de `Property_domain`** pour les trois propriétés de page
   `Fichier:` — premier cas du genre.
5. **`default=` d'un `#ask` en `format=gallery` ne s'affiche pas.** Constaté
   sur `Test 260915a` : cellule « Photos de cette plantation » vide au lieu
   du texte par défaut prévu quand la requête ne remonte aucune photo.
   Comportement à vérifier (bug SRF, syntaxe du paramètre, ou incompatibilité
   spécifique à `format=gallery`) avant de s'appuyer dessus pour l'état vide.
   À reprendre après la tâche 8.

---

## 6. Renvois

Le lot laisse intacts, et les rend plus visibles :

- **L'entité réception** (lot 7). Le référencé porte maintenant une provenance
  et une année ; la quantité reçue à une date reste sans expression.
- **Les planches de culture.** L'item de lieu leur ouvre la place : elles
  s'inséreront entre le lieu et le plant.
- **Les récoltes**, et l'observation datée en général — dont la dormance
  écartée en 1.8.
- **`Module:Base36`** : détection de doublons absente, et arrêt au tiret. Deux
  corrections en attente qu'un lot dédié devrait traiter ensemble.
- **La filiation pied mère → bouture**, le jour où des boutures seront prises.
