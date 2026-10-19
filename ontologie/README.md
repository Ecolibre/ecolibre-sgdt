# Ontologie du SGDT - fichiers d'origine

Ce dossier porte les fichiers d'ontologie détenus par Cyril Libert sur son
poste, déposés tels quels, sans retouche. Ontologie dessinée à partir de 2017
par Cyril Libert et Bernard Chabot. Ces fichiers ne décrivent pas le modèle en
service sur wiki.ecolibre.org : le wiki fait autorité, pas ce dossier.

## Ce que contient le dossier

Deux ontologies OWL qui n'en font qu'une : la seconde est importée par la
première.

- `OSE_BusinessOntology/` - l'ontologie du SGDT. Espace de noms
  `http://virtual-assembly.org/OpenSourceEcology`. 75 classes, 138 propriétés
  objet, 10 propriétés de données, 164 restrictions, 1 470 triplets. Elle
  porte les quatre niveaux décrits dans le fil de 2022 : `FunctionalItem`,
  `OrganicItem`, `IndustrialItem`, `PhysicalItem`, ainsi que `Machine`,
  `MachineModel`, `MachineInstance`, `MachineType`,
  `IndustrialTransformation`, `PhysicalTransformation`,
  `TransformationSolution`, `Skill` et `Location`. Elle porte en outre une
  couche d'exigences et de spécifications que le wiki n'a pas.
  Fichiers datés du 11 mai 2018.

- `Q2U_Ontology/` - l'ontologie des qualités, quantités et unités, importée
  par la précédente. Espace de noms
  `http://virtual-assembly.org/QualityQuantityUnit`. 18 classes,
  12 propriétés objet, 4 propriétés de données, 29 restrictions,
  598 triplets, 91 individus. Elle porte les grandeurs et les unités du
  Système international, les facteurs de conversion par `coefficient` et
  `multipleOf`, et la décomposition dimensionnelle par
  `QuantityExponentiation`, `haseBase` et `exponent`. L'instanciation est
  partielle : six facteurs de conversion seulement, quatre décompositions
  dimensionnelles pour vingt-trois grandeurs dérivées, et les classes
  `BaseUnit` et `ReferenceUnit` sans aucun individu.
  Fichiers datés du 14 octobre 2024.

Deux défauts relevés dans `Q2U_Ontology.owl` le 18 octobre 2026, laissés tels
quels puisque les fichiers ne sont pas retouchés : le coefficient du pouce
vaut `0.0245`, alors que le pouce vaut 0,0254 mètre par définition depuis
1959 ; et les noms portent des fautes constantes, classes `Dimentional` et
`Dimentionless`, propriété `haseBase`, individu `MultipliedAndDivisedUnit_2`
au milieu de `MultipliedAndDividedUnit_1, 13, 41, 42, 43`.

Les fichiers `.pprj` et `.repository` ne sont pas de l'OWL : ce sont les
fichiers de projet de Protégé 3.x, l'éditeur avec lequel ces ontologies ont
été écrites. Ils ne portent aucun modèle. Le `.repository` ne fait que
déclarer où trouver l'ontologie importée.

## Statut

- L'explication publique du modèle est le fil ouvert le 5 décembre 2022 sur
  le forum de l'Assemblée Virtuelle, sujet 745 :
  https://forums.assemblee-virtuelle.org/t/systeme-de-gestion-de-donnees-techniques-oriente-open-source-hardware-et-ingenierie-cooperative/745
- Le wiki et ces fichiers divergent sur un point relevé à ce jour : le
  troisième niveau s'appelle ici `IndustrialItem`, et le wiki porte la
  catégorie `Referenced item`.
- Le facteur de conversion, lui, ne diverge plus. A la tâche 48 du lot 21,
  le 19 octobre 2026, le wiki s'est aligné sur le sens courant, celui de ce
  fichier et de QUDT : une page d'unité porte 0,001 pour le millimètre,
  comme `centimetre` porte ici `coefficient 0.01`. L'inversion ne subsiste
  qu'à l'intérieur de Semantic MediaWiki, dont le bloc de déclaration des
  unités d'une dimension attend 1000 pour le millimètre. C'est une
  contrainte de l'outil, pas un écart de modèle.
- Ces fichiers servent de point de départ à une reprise de l'ontologie dans
  swowl (github.com/MyShivaRepo/swowl), éditeur OWL écrit par Bernard Chabot.
  swowl y tient le rôle d'outil d'édition et de visualisation : il ne devient
  pas la source du modèle.

Déposé le 17 octobre 2026. Contenu relevé les 17 et 18 octobre 2026.
