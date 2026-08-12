# Lot 8 — cadrage : facettes de type d'item

**Rédigé le 11 août 2026.** À exécuter par Claude Code depuis `~/ecolibre-sgdt`.
Prérequis de lecture : `CLAUDE.md`, `sgdt-passation-2026-08-10.md`, la page
*Récapitulatif de l'architecture technique*, la page *Limites connues du Système
de Gestion de Données Techniques*.

Format des résumés d'édition : `[Lot 8][Tâche N]`.

**Numérotation.** Ce lot est indépendant du lot 7 (nomenclature quantifiée,
entité réception, `Procurement_route`, `Max_flow`), qui reste cadré et non
exécuté. Les deux ne se touchent qu'en un point : tous deux modifient
`Modèle:Organic item` ou `Modèle:Referenced item`. Ne pas les mener en
parallèle. Si Cyril exécute le lot 8 avant le lot 7, la numérotation ne change
pas.

---

## 0. Objet

Aujourd'hui, un formulaire de saisie propose les mêmes champs à un mamelon
20×27 et à un argousier. Les sept propriétés de raccords créées au lot 6
polluent la saisie de tout item qui n'est pas un raccord, et le problème
s'aggrave à chaque domaine ajouté.

**Ce que le lot livre :** un mécanisme de facettes — des blocs de propriétés
optionnels, cumulables, révélés dans le formulaire selon ce que l'on déclare —
et ses deux premières facettes.

**Ce que le lot ne livre pas :** la saisie des plantes, la facette végétale au
niveau physique, l'axe de classification fine du §2.5 de la passation, le guide
de saisie.

---

## 1. Décisions d'architecture

Arrêtées le 11 août, à ne pas rouvrir à l'exécution.

**1.1 — Deux axes orthogonaux.** L'axe *niveau de conception* (fonctionnel,
organique, référencé, physique) est inchangé. L'axe *facette* lui est
perpendiculaire et décrit la nature de l'objet.

**1.2 — Liste plate, pas d'arbre.** Les facettes ne forment pas une partition et
ne se décomposent pas. Un item en porte zéro, une ou plusieurs. C'est la même
réponse que `Practice_domain` pour les procédés (§2.3 de la passation) et elle
vient du même constat : « souder » appartient à trois métiers, un bidon fileté
est à la fois un contenant et un raccord. Si la liste dépasse quinze entrées,
on la groupe **à l'affichage** du menu déroulant ; jamais dans les données.

**1.3 — Le questionnaire est une interface, pas une structure.** La cascade de
questions imaginée par Cyril (« vivant ou mécanique ? puis quel domaine ? »)
reste comme aide à la saisie, mais elle coche des facettes ; elle ne classe pas.
Une facette se corrige en un clic, un rattachement d'arbre se propage.

**1.4 — Une facette est portée par un couple (facette, classe).** Les propriétés
végétales de niveau organique (rusticité, période de semis) et de niveau
physique (date de plantation, état du pied) sont deux blocs distincts. Ils
partagent le nom de facette et rien d'autre. Ce lot ne crée que les blocs de
niveau organique.

**1.5 — Un modèle par bloc, appelé en plus du modèle de classe.** Une page
d'item organique portera `{{Organic item|…}}` puis, le cas échéant,
`{{Organic facet plant|…}}`. Le modèle de classe reste petit ; ajouter une
facette ne le modifie pas.

**1.6 — Un bloc de formulaire par facette, dans sa propre page, transclus dans
le formulaire.** À plus de dix facettes, une définition de formulaire monolithique
devient illisible et lente à parser. La définition de formulaire ne contient
qu'une ligne de transclusion par facette.

**1.7 — Les fonctions ne sont pas des propriétés de facette.** « Fixe l'azote »,
« coupe le vent », « produit un fruit » restent des liens `Realizes_function`
vers l'arbre fonctionnel. C'est ce qui fait qu'un brise-vent végétal et un
brise-vent en claustra remontent sous la même fonction. Aucune propriété de la
facette végétale ne doit décrire un service rendu.

**1.8 — Rapport avec l'axe de classification manquant (§2.5 de la passation).**
La facette en donne la maille grossière (« c'est un raccord »), pas la maille
fine (« c'est un mamelon »). `Fitting_family` et `External_classification`
conservent donc leur rôle et ne sont pas supprimées. Le besoin d'un axe de
classification reste ouvert ; il est seulement partiellement couvert.

---

## 2. Conventions de nommage

Le lot en fixe une, appliquée sans exception, parce qu'elle sera répétée
quinze fois.

| Objet | Convention | Exemple |
|---|---|---|
| Page de registre de la facette | français, nom commun singulier | `Facette végétal` |
| Modèle d'affichage | anglais, `<Classe> facet <facette>` | `Modèle:Organic facet plant` |
| Bloc de formulaire | sous-page du formulaire | `Formulaire:Item organique/bloc facette végétal` |
| Propriété | anglais, underscore, comme l'existant | `Sowing_period` |
| Catégorie de registre | français | `Catégorie:Facette` |

Rappel du lot 6 : les paramètres d'un modèle portent le nom de la propriété
qu'ils alimentent. À appliquer aux modèles de facette dès leur création.

**Nom de la première facette : `Facette végétal`**, et non « Vivant ». Décision
du 11 août : on couvre un domaine à la fois, comme la plomberie ne couvre pas
tout le champ technique. Les animaux viendront, avec leur propre facette et
leurs propres propriétés — un poulailler et un pommier n'ont pas trois
propriétés en commun.

« Végétal » est ici un **nom** en apposition, comme « raccord » dans
`Facette raccord` : *un* végétal, *un* raccord. Ne pas « corriger » en
« Facette végétale » à la relecture.

---

## 3. État attendu du wiki

Établi d'après la passation du 10 août, **non vérifié**. Toute divergence arrête
le lot et fait l'objet d'un signalement, jamais d'un contournement.

- 28 items : 20 fonctionnels, 3 organiques, 2 référencés, 3 physiques.
- Séquence Base 36 de `0001` à `000Q`, trou définitif en `000J`.
- Sept propriétés de raccords existantes : `Connection_gender`,
  `Thread_designation`, `Nominal_diameter`, `Secondary_diameter`,
  `Connection_standard`, `Fitting_family`, `Material`.
- `Modèle:Organic item` et `Modèle:Referenced item` ont des paramètres nommés
  d'après leurs propriétés ; `Modèle:Physical item` garde l'ancienne convention.
- Les liens vides n'affichent plus `[[]]` sur les quatre modèles.
- `Property_cardinality`, `Property_domain`, `Property_range` sont renseignées
  sur les huit propriétés du modèle de base (lots 1 à 3).

---

## 4. Tâches

### Tâche 0 — Vérifications préalables. Aucune écriture.

Rien n'est écrit tant que le rapport de cette tâche n'est pas validé par Cyril.

1. `Spécial:Version` : versions de MediaWiki, Semantic MediaWiki, Page Forms.
2. Dans la documentation de la version installée de Page Forms, établir :
   - la syntaxe exacte permettant à `show on select` de masquer une section
     `for template` **entière** ; en particulier le marqueur à poser sur la
     balise `<div>` pour que Page Forms n'écrive pas un appel de modèle vide
     quand le bloc est masqué (de mémoire `holds template`, **à confirmer, ne
     pas supposer**) ;
   - si une définition de formulaire peut transclure une sous-page contenant des
     balises `{{{for template}}}` / `{{{field}}}`, et à quelles conditions
     (la définition est parsée deux fois ; vérifier aussi l'effet de
     `$wgPageFormsFormCacheType`) ;
   - si `values from category` est utilisable sur un champ `checkboxes`.
3. Constater comment `Max_head` a été déclarée (type Nombre ou Quantité, gestion
   de l'unité) : les propriétés numériques de ce lot s'aligneront dessus plutôt
   que d'inventer une seconde convention.
4. Lister les trois items organiques et, pour chacun, les propriétés de raccords
   effectivement renseignées. C'est la liste de migration de la tâche 5.
5. Vérifier que le téléversement d'images JPEG est autorisé (la limite connue
   sur `$wgFileExtensions` porte sur SVG ; à ne pas confondre).

**Livrable :** rapport écrit dans un fichier **et affiché intégralement dans la
réponse**, Cyril lisant depuis un téléphone.

Si le point 2 se conclut par « impossible » ou « non documenté », le lot
s'arrête là et on rouvre l'arbitrage : la solution de repli est un formulaire
par facette, avec `#default_form` émis par le modèle de facette pour lever
l'ambiguïté à la réédition.

### Tâche 1 — Propriété `Item_facet`

Type Page, multivaluée. Renseigner `Property_cardinality`, `Property_domain`,
`Property_range` selon la convention des lots 1 à 3.

Domaine : items organiques, référencés et physiques. **Pas les fonctionnels** —
une fonction n'a pas de nature d'objet, `Practice_domain` couvre déjà son besoin
de classement transversal.

Ce lot ne met en œuvre le champ que sur le formulaire organique. La propriété
est néanmoins déclarée pour les trois classes dès maintenant, pour ne pas
rouvrir sa fiche à chaque extension.

### Tâche 2 — Registre des facettes

Sur le modèle du registre des préfixes de site, qui a bien fonctionné.

- `Catégorie:Facette`.
- `Modèle:Facet` : affiche nom, ce que la facette recouvre, ce qu'elle exclut,
  classes concernées, modèles d'affichage associés, propriétés apportées.
- Deux pages : `Facette végétal`, `Facette raccord`.
- Une page d'index listant les facettes par `#ask`, reliée depuis le portail et
  depuis le Récapitulatif technique.

Le champ « ce qu'elle exclut » n'est pas décoratif : c'est lui qui empêchera,
dans six mois, la création d'une facette qui recouvre à moitié une existante.

### Tâche 3 — `Modèle:Organic facet fitting`

Reprend les sept propriétés de raccords. Affichage en sous-tableau titré, sous
le tableau du modèle de classe — pas d'insertion de lignes dans le tableau du
modèle de classe. Émet `[[Item_facet::Facette raccord]]` et
`[[Catégorie:Item à facette raccord]]`.

### Tâche 4 — `Modèle:Organic facet plant`

**Volume.** Trente-six propriétés à créer, chacune avec ses trois propriétés de
schéma : de l'ordre de cent quarante pages. Cette tâche pèse à elle seule plus
que tout le reste du lot. La créer par blocs thématiques, un rapport de
vérification par bloc, et ne pas enchaîner sur la tâche 5 avant que les sept
blocs soient constatés.

Décision du 11 août : on met tout maintenant, quitte à retirer après la réunion
sur le design du jardin-forêt. Quinze plantes à reprendre à la main est un coût
accepté ; découvrir en réunion qu'une donnée n'a pas où aller ne l'est pas.

**Identité**

| Propriété | Type | Note |
|---|---|---|
| `Taxon_name` | Texte | nom scientifique — **seul champ obligatoire** |
| `Taxref_id` | Texte | CD_NOM, identifiant TAXREF du SINP |
| `Cultivar` | Texte | |
| `Vernacular_name` | Texte, multivalué | synonymes locaux, pour la recherche |
| `Plant_family` | Texte | famille botanique — sert aux rotations et aux associations |

`External_classification` existe déjà (convention OKW, URL Wikipédia) : la
réutiliser, ne pas créer de propriété d'identité externe supplémentaire.

**Structure et cycle**

| Propriété | Type | Note |
|---|---|---|
| `Plant_habit` | Texte | port : arbre, arbuste, liane, herbacée, couvre-sol |
| `Forest_garden_layer` | Texte, multivalué | strate — la propriété structurante du jardin-forêt |
| `Life_cycle` | Texte | annuelle, bisannuelle, vivace |
| `Foliage_persistence` | Texte | caduc, semi-persistant, persistant |
| `Adult_height` | Nombre (m) | aligner sur la convention de `Max_head` |
| `Adult_width` | Nombre (m) | |
| `Growth_rate` | Texte | |
| `Root_system` | Texte | pivotant, traçant, drageonnant, fasciculé |

`Root_system` n'est pas une curiosité botanique : « drageonnant » est un
avertissement de conduite. L'argousier en est l'exemple, et c'est la première
plante de la liste.

**Exigences**

| Propriété | Type | Note |
|---|---|---|
| `Sun_exposure` | Texte | |
| `Water_need` | Texte | |
| `Soil_type` | Texte, multivalué | sableux, limoneux, argileux, drainé, humide |
| `Soil_ph` | Texte | acide, neutre, calcaire, indifférent |
| `Hardiness_min_temp` | Nombre (°C) | pas de zone USDA |
| `Wind_tolerance` | Texte | |

**Calendrier**

| Propriété | Type | Note |
|---|---|---|
| `Sowing_period` | Texte, multivalué | mois |
| `Planting_period` | Texte, multivalué | mois |
| `Flowering_period` | Texte, multivalué | mois |
| `Harvest_period` | Texte, multivalué | mois |
| `Pruning_period` | Texte, multivalué | mois |
| `Time_to_production` | Nombre (années) | délai avant première récolte |

**Multiplication**

| Propriété | Type | Note |
|---|---|---|
| `Propagation_method` | Texte, multivalué | semis, bouture, marcotte, division, greffe |
| `Pollination_type` | Texte | autofertile, auto-stérile, dioïque |
| `Seed_treatment` | Texte | stratification, scarification, trempage |

`Propagation_method` recoupe `Procurement_route` du lot 7 : une bouture prélevée
sur place est le cas « plan à fabriquer soi-même » appliqué au vivant. Les deux
propriétés cohabitent sans se contredire — l'une dit comment l'espèce se
multiplie, l'autre comment cet exemplaire-là a été obtenu — mais la page de
registre doit le dire, sinon la question reviendra.

**Récolte et innocuité**

| Propriété | Type | Note |
|---|---|---|
| `Edible_parts` | Texte, multivalué | fruit, feuille, fleur, racine, graine, jeune pousse |
| `Storage_method` | Texte, multivalué | frais, séché, congelé, transformé |
| `Toxicity_note` | Texte | |
| `Documentation_source` | Texte, multivalué | d'où vient la fiche |

`Toxicity_note` n'est pas un doublon de `Edible_parts` : le sureau noir a un
fruit comestible **cuit** et émétique cru. Sur un terrain que d'autres
traversent, cette nuance a une valeur qui n'est pas documentaire.

`Documentation_source` est un candidat sérieux à la promotion vers le modèle de
classe — un raccord aussi a une fiche technique d'origine. Créée dans la facette
pour ne pas élargir le lot ; à réexaminer au lot suivant.

**Associations**

| Propriété | Type | Note |
|---|---|---|
| `Companion_species` | Page, multivalué | vers un autre item organique végétal |
| `Antagonist_species` | Page, multivalué | idem |

Deux réserves à consigner dans la page de registre. D'abord, la réciprocité
n'est pas automatique : SMW sait interroger l'inverse (`-Companion_species`),
donc ne saisir la relation **que dans un sens** et laisser la requête faire le
reste — sinon les deux fiches divergeront. Ensuite, la littérature sur les
associations de plantes est inégalement étayée ; `Documentation_source` devrait
être renseignée sur toute fiche qui en porte.

**Images**

| Propriété | Type | Note |
|---|---|---|
| `Seedling_image` | Page (fichier) | photo de la plantule |
| `Mature_image` | Page (fichier) | |

`Seedling_image` est la propriété qui a motivé tout le chantier : reconnaître ce
qui lève. Elle mérite une requête dédiée — une galerie des plantules, page
unique, consultable au potager depuis un téléphone. À prévoir en tâche 9.

**Les usages ne deviennent pas une propriété.** C'est le seul point où ce
cadrage s'écarte de la consigne du 11 août, et il faut le dire franchement :
mellifère, fixateur d'azote, brise-vent, fourrager sont des **fonctions**, et
elles ont déjà un arbre. Créer `Potential_use` en parallèle, ce serait le
classement par métiers du §2.3 reproduit en plus petit — deux vocabulaires pour
la même chose, et des requêtes qui ne trouvent que la moitié des réponses.

Ce qui ne rentre pas dans l'arbre fonctionnel — un usage médicinal traditionnel,
une anecdote de conduite — va en **texte libre sous un intitulé stable**,
« Usages documentés », selon le précédent déjà retenu pour le décalage des
bidons. Si Cyril veut malgré tout la propriété, c'est une ligne à ajouter ; la
décision lui revient, pas au cadrage.

**Valeurs prédéfinies : règle affinée.** Le §2.3 de la passation dit de laisser
les valeurs émerger. Ça vaut pour les propriétés de jugement — exposition,
besoin en eau, vitesse de croissance. Ça ne vaut pas pour les vocabulaires
botaniquement clos et universels : `Life_cycle` et `Foliage_persistence` ont
trois valeurs chacune, connues d'avance, et les laisser libres ne produira que
des variantes d'orthographe. Les figer dès la création.

**Si la réunion demande d'élaguer**, retirer dans cet ordre : `Growth_rate`,
`Wind_tolerance`, `Storage_method`, `Antagonist_species`. Ce sont les quatre qui
apportent le moins par rapport à leur coût de saisie.

**Ergonomie du formulaire.** Trente-six champs dans un bloc, c'est un mur. Les
regrouper par les sept sous-titres ci-dessus dans le bloc de formulaire, et
poser une info-bulle `{{#info: …}}` sur toute propriété dont le libellé ne suffit
pas — `Forest_garden_layer`, `Root_system`, `Pollination_type`, `Seed_treatment`
au minimum. C'est précisément parce que ce bloc est gros qu'il a sa propre page :
la décision 1.6 se rentabilise ici.

`Pollination_type` mérite un mot dans la page de registre : elle **signale** le
besoin d'un pied mâle sans l'exprimer. La relation « nécessite un compagnon »
n'existe pas dans le modèle et n'est pas traitée ici — `Companion_species` dit
« pousse bien avec », pas « ne fructifie pas sans ».

### Tâche 5 — Migrer les items organiques concernés

Pour chaque item de la liste établie en tâche 0 : ajouter `Item_facet` et
l'appel `{{Organic facet fitting|…}}` en recopiant les valeurs existantes.

**Ordre impératif :** migrer avant de toucher `Modèle:Organic item`. Pendant la
transition, la propriété est annotée deux fois avec la même valeur — SMW
enregistre un ensemble, c'est sans effet. Vérifier chaque item par
`Spécial:Parcourir` avant de passer à la tâche 6.

### Tâche 6 — Retirer les sept paramètres de raccord de `Modèle:Organic item`

Diff proposé et affiché avant écriture. Vérification après : les annotations
doivent être inchangées sur les items migrés.

### Tâche 7 — Blocs de formulaire et champ de sélection

Deux sous-pages : `Formulaire:Item organique/bloc facette végétal` et
`.../bloc facette raccord`, chacune contenant une section `for template`
complète entourée du `<div>` porteur du marqueur retenu en tâche 0.

Dans `Formulaire:Item organique`, en tête de formulaire :

```
{{{field|Item_facet|input type=checkboxes
 |values from category=Facette
 |show on select=Facette végétal=>blocPlant;Facette raccord=>blocFitting}}}
```

puis une ligne de transclusion par bloc.

**Piège à ne pas manquer :** `Item_facet` doit être un vrai champ du modèle de
classe, enregistré sur la page. Sinon, à la réédition, les cases reviennent
décochées, les blocs restent masqués alors que les appels de modèle sont
toujours là, et la sauvegarde efface silencieusement des données. La tâche 8
teste précisément ça.

Ajouter une info-bulle sur le champ par `{{#info: …}}` dans la cellule du
libellé — ni `info=` ni `description=` ne fonctionnent sur la balise `field`.

### Tâche 8 — Vérifications fonctionnelles

Sur une page bac à sable, jamais sur un item réel. Chaque point est constaté,
pas supposé.

1. Créer un item, cocher `Facette végétal`, remplir, sauver → les annotations
   végétales sont présentes dans `Spécial:Parcourir`.
2. **Rouvrir la page avec le formulaire** → la case est cochée et le bloc est
   visible, champs remplis.
3. Décocher la facette, sauver → l'appel de modèle a disparu du wikitexte et
   les annotations avec.
4. Cocher les deux facettes → les deux blocs coexistent, les deux sous-tableaux
   s'affichent.
5. Ne cocher aucune facette → la page ne contient aucun appel de modèle vide et
   n'affiche pas de tableau fantôme.
6. Un item migré en tâche 5 s'ouvre correctement dans le formulaire.

Le point 2 est celui qui échoue en pratique. S'il échoue, ne pas contourner :
signaler et s'arrêter.

### Tâche 9 — Documentation

- Section « Facettes » dans le Récapitulatif technique : les deux axes, la règle
  de la liste plate, le renvoi au registre.
- Page de procédure « ajouter une facette », en cinq étapes numérotées : créer la
  page de registre, créer le modèle d'affichage, créer le bloc de formulaire,
  ajouter la transclusion et la paire `show on select` dans le formulaire,
  déclarer les propriétés avec leurs trois propriétés de schéma. C'est ce qui
  rendra la quinzième facette aussi bon marché que la troisième.
- Mentionner dans `CLAUDE.md` que le format réel des résumés d'édition est
  `[Lot X][Tâche N]` (écart relevé au §6 de la passation).

---

## 5. À trancher par Cyril

Les deux arbitrages bloquants du cadrage initial sont levés : la liste des
propriétés végétales est complète et assumée large, la facette s'appelle
`Facette végétal`.

Reste ouvert, non bloquant :

1. La propriété `Potential_use`, écartée en tâche 4 au profit de l'arbre
   fonctionnel et d'un texte libre. Décision à confirmer ou à renverser — c'est
   une ligne dans un modèle.
2. Faut-il une facette `Contenant` dès ce lot, pour le cas bidon / cuve du §2.5 ?
   Recommandation : non. Deux facettes suffisent à valider le mécanisme, et
   celle-là demande de trancher d'abord la question de classification.
3. La tâche 4 fait basculer le lot d'une journée à deux ou trois. Si l'échéance
   de la réunion approche, une sortie existe : créer les trente-six propriétés
   et le modèle, et différer la migration des raccords (tâches 5 et 6) à un lot
   suivant. Le mécanisme est alors validé par une seule facette, ce qui est plus
   faible, mais la saisie des plantes n'attend pas.

## 6. Renvois

Ce lot laisse intacts, et les rend seulement plus visibles :

- **Le semis en lot.** Vingt carottes ne sont pas vingt items physiques. Même
  problème que « un seul panneau défectueux sur cinquante » : c'est l'entité
  réception du lot 7. À résoudre une fois pour les deux.
- **Les récoltes.** Un événement daté et répété n'a pas d'expression dans le
  modèle. Sous-objet ou cinquième classe, même famille que la réception.
- **La filiation pied mère → bouture.** Ni `Part_of` ni `Instance_of` ; une
  relation entre items physiques, à créer le jour où des boutures seront prises.
- **L'item par planche de culture** est un item **physique**, pas référencé : un
  emplacement, parent des plants qui s'y trouvent. La date de plantation est une
  propriété de l'exemplaire. Ce point conditionne la saisie des plantes et sera
  rappelé dans le cadrage du lot correspondant.
