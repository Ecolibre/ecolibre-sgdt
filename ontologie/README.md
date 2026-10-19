# Ontologie du SGDT

Ce dossier porte l'ontologie du SGDT, dessinée à partir de 2017 par Cyril
Libert et Bernard Chabot. Les fichiers viennent de Bernard Chabot et sont
tenus ici comme la copie de référence de l'ontologie.

Référence de l'ontologie ne veut pas dire autorité sur le wiki. Le modèle en
service sur wiki.ecolibre.org reste seul à faire foi pour ce que le wiki
porte ; ce dossier dit ce que l'ontologie, elle, énonce.

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

Ce qui n'est pas corrigé, et le motif : les noms portent des fautes
constantes, classes `Dimentional` et `Dimentionless`, propriété `haseBase`,
individu `MultipliedAndDivisedUnit_2` au milieu de
`MultipliedAndDividedUnit_1, 13, 41, 42, 43`. Les renommer changerait des
identifiants publics de l'espace de noms `virtual-assembly.org`, pour un gain
d'orthographe. Corriger une valeur fausse laisse les identifiants intacts ;
renommer, non.

## Statut

- L'explication publique du modèle est le fil ouvert le 5 décembre 2022 sur
  le forum de l'Assemblée Virtuelle, sujet 745 :
  https://forums.assemblee-virtuelle.org/t/systeme-de-gestion-de-donnees-techniques-oriente-open-source-hardware-et-ingenierie-cooperative/745
- Le wiki et ces fichiers divergent sur un point relevé à ce jour : le
  troisième niveau s'appelle ici `IndustrialItem`, et le wiki porte la
  catégorie `Referenced item`.
- Le facteur de conversion, lui, ne diverge plus. À la tâche 48 du lot 21,
  le 19 octobre 2026, le wiki s'est aligné sur le sens courant, celui de ce
  fichier et de QUDT : une page d'unité porte 0,001 pour le millimètre,
  comme l'unité `centimetre` porte ici un `coefficient` de 0.01.
  L'inversion ne subsiste qu'à l'intérieur de Semantic MediaWiki, dont le
  bloc de déclaration des unités d'une dimension attend 1000 pour le
  millimètre. C'est une contrainte de l'outil, pas un écart de modèle.
- Ces fichiers servent de point de départ à une reprise de l'ontologie dans
  swowl (github.com/MyShivaRepo/swowl), éditeur OWL écrit par Bernard Chabot.
  swowl y tient le rôle d'outil d'édition et de visualisation : il ne devient
  pas la source du modèle.

Déposé le 17 octobre 2026. Contenu relevé les 17 et 18 octobre 2026.
Dernière correction le 20 octobre 2026.
