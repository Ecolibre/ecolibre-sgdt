# Ontologie du SGDT

Ce dossier porte l'ontologie du SGDT, dessinée à partir de 2017 par Cyril
Libert et Bernard Chabot. Les fichiers viennent de Bernard Chabot et sont
tenus ici comme la copie de référence de l'ontologie. Elle précède le wiki de
plusieurs années : le wiki a été construit en prenant cette ontologie pour
modèle.

Deux autorités, qu'il ne faut pas confondre. Sur ce que le modèle devrait
dire, c'est l'ontologie qui fait référence : le wiki en est l'implémentation,
et il ne s'en écarte que là où Semantic MediaWiki l'impose, auquel cas l'écart
se consigne. Sur ce que le wiki porte réellement, c'est le wiki qui fait foi,
toujours, et jamais un rapport ni ce dossier : un fichier peut être périmé,
l'état du wiki ne l'est jamais.

Se conformer à l'ontologie porte sur la structure et le sens, pas sur
l'orthographe des identifiants. Les deux mondes nomment différemment par
nature : l'ontologie porte des identifiants OWL en un seul mot,
`DimensionalUnit` ou `hasBase`, le wiki porte des noms d'attributs lisibles,
`Unit dimension` ou `Quantity type`. Aucun nom n'est repris de l'un à l'autre.

## Ce que contient le dossier

Deux ontologies OWL qui n'en font qu'une : la seconde est importée par la
première.

- `OSE_BusinessOntology/` - l'ontologie du SGDT. Espace de noms
  `http://virtual-assembly.org/OpenSourceEcology`. 75 classes, 138 propriétés
  objet, 10 propriétés de données, 5 individus, 164 restrictions,
  1 470 triplets, soit 228 entités nommées. Elle porte les quatre niveaux
  décrits dans le fil de 2022 : `FunctionalItem`, `OrganicItem`,
  `IndustrialItem`, `PhysicalItem`, ainsi que `Machine`, `MachineModel`,
  `MachineInstance`, `MachineType`, `IndustrialTransformation`,
  `PhysicalTransformation`, `TransformationSolution`, `Skill` et `Location`.
  Elle porte en outre une couche d'exigences et de spécifications que le wiki
  n'a pas. Les cinq individus sont `QualitativeBeSpecification_2`,
  `QualitativeBeSpecification_4`, `QualitativeDoRequirement_2`,
  `QualitativeDoSpecification_8` et `TargetToleranceBeSpecification_6` : tout
  contrôle de non-perte doit les compter.
  Fichiers datés du 11 mai 2018.

- `Q2U_Ontology/` - l'ontologie des qualités, quantités et unités, importée
  par la précédente. Espace de noms
  `http://virtual-assembly.org/QualityQuantityUnit`. 18 classes,
  12 propriétés objet, 4 propriétés de données, 29 restrictions,
  598 triplets, 91 individus. Elle porte les grandeurs et les unités du
  Système international, les facteurs de conversion par `coefficient` et
  `multipleOf`, et la décomposition dimensionnelle par
  `QuantityExponentiation`, `hasBase` et `exponent`. L'instanciation est
  partielle : six facteurs de conversion seulement, quatre décompositions
  dimensionnelles pour vingt-trois grandeurs dérivées, et les classes
  `BaseUnit` et `ReferenceUnit` sans aucun individu.
  Fichiers datés du 14 octobre 2024.

Les fichiers `.pprj` et `.repository` ne sont pas de l'OWL : ce sont les
fichiers de projet de Protégé 3.x, l'éditeur avec lequel ces ontologies ont
été écrites. Ils ne portent aucun modèle. Le `.repository` ne fait que
déclarer où trouver l'ontologie importée.

## Corrections apportées

Les fichiers ont été déposés le 17 octobre 2026 dans leur état d'origine, et
cet état reste consultable dans l'historique du dépôt, au commit `b90ab66`.
Toute correction faite depuis figure ici.

- 20 octobre 2026, `Q2U_Ontology.owl` : le coefficient de
  `MultipliedAndDividedUnit_1`, étiqueté "pouce", passe de `0.0245` à
  `0.0254`. Un pouce vaut 0,0254 mètre, exactement, depuis 1959. Deux
  chiffres inversés dans la source. Le `.pprj` ne portait pas cette valeur
  et n'a pas été touché.

- 20 octobre 2026, trois fautes d'orthographe corrigées dans des noms
  d'entités de Q2U : `Dimention` devient `Dimension`, ce qui couvre
  `DimensionalQuantity`, `DimensionalUnit`, `DimensionlessQuantity` et
  `DimensionlessUnit` ; `haseBase` devient `hasBase` ; l'individu
  `MultipliedAndDivisedUnit_2` devient `MultipliedAndDividedUnit_2`. Rien
  n'en dépendait : `OSE_BusinessOntology.owl` n'en référence aucun, et le
  wiki n'emploie aucun de ces noms. Les deux fichiers de projet Protégé ont
  été corrigés en même temps.

- 21 octobre 2026, deux fautes d'orthographe corrigées dans des noms
  d'entités d'OSE, 39 entités sur 228 : `Tolerence` devient `Tolerance`,
  `fullfiled` devient `fulfilled` et `fullfils` devient `fulfils`. La
  substitution est faite en deux temps et jamais sur `fullfil` seul, qui
  donnerait `fulfiledBy`, encore fautif. Rien n'en dépendait : ces chaînes
  ne figurent nulle part ailleurs dans le dépôt ni sur le wiki, qui écrit
  déjà `Tolerance` correctement dans `Attribut:Wind tolerance` et
  `Attribut:Tolerance as written`. Le fichier de projet Protégé d'OSE a été
  corrigé en même temps.

## Défauts connus, non corrigés

- `OSE_BusinessOntology.owl` ne porte aucun `rdfs:label` ni `rdfs:comment` :
  ses 228 entités nommées ne sont lisibles que par leur identifiant.
  `Q2U_Ontology.owl` en porte 87 et 1. Les écrire serait un travail de
  rédaction, pas une correction.

- Cinq noeuds `owl:unionOf` ne sont rattachés à rien dans
  `OSE_BusinessOntology.owl` : deux unions de `MiniMaxiBeSpecification` et
  `TargetToleranceBeSpecification`, trois de `OrganicItem` et
  `FunctionalItem`. Ce sont des doublons laissés par Protégé, sans effet sur
  le modèle. Les retirer demanderait de toucher à la structure XML et non à
  une chaîne de caractères, pour un gain nul.

## Statut

- L'explication publique du modèle est le fil ouvert le 5 décembre 2022 sur
  le forum de l'Assemblée Virtuelle, sujet 745 :
  https://forums.assemblee-virtuelle.org/t/systeme-de-gestion-de-donnees-techniques-oriente-open-source-hardware-et-ingenierie-cooperative/745
- Un écart reste ouvert entre le wiki et ces fichiers : le troisième niveau
  s'appelle ici `IndustrialItem`, et le wiki porte la catégorie
  `Referenced item`. Le motif du renommage est connu. Lors d'un premier essai
  avec des producteurs bio et locaux recrutés pour lister leurs produits, le
  mot "industriel" s'est révélé trop connoté pour être expliqué, et les
  titres de pages portaient alors le niveau d'item, ce qui donnait des
  intitulés intenables. Les titres ne le portent plus. Cyril pose donc une
  condition pour qu'un retour à "industriel" redevienne envisageable : que le
  mot n'apparaisse nulle part sur la page finale, catégories comprises. Cet
  écart se traite dans le lot 44, "Choix imposés par l'outil", pas dans ce
  dossier.
- Le facteur de conversion, lui, ne diverge plus. À la tâche 48 du lot 21,
  le 19 octobre 2026, le wiki s'est aligné sur le sens courant, celui de ce
  fichier et de QUDT : une page d'unité porte 0,001 pour le millimètre,
  comme l'unité `centimetre` porte ici un `coefficient` de 0.01.
  L'inversion ne subsiste qu'à l'intérieur de Semantic MediaWiki, dont le
  bloc de déclaration des unités d'une dimension attend 1000 pour le
  millimètre. C'est une contrainte de l'outil, pas un écart de modèle.

Déposé le 17 octobre 2026. Contenu relevé les 17 et 18 octobre 2026.
Dernière correction le 21 octobre 2026.
