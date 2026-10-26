# swowl : contrôle structurel des expressions anonymes

Date : 26 octobre 2026.
Machine : poste Ubuntu de Cyril, Framework 16 (Ubuntu 26.10, Python 3.14.8).
swowl : 1.2.4, commit `cbcf8a8`, celui installé le même jour (voir `swowl-installation-ubuntu-1-2-4.md`). Le serveur était allumé et répondait HTTP 200 : rien n'a été redémarré ni rechargé.
Script : `ontologie/swowl-controle-structure.py`, écrit à l'identique de la consigne. `ontologie/swowl-controle-perte.py` n'a pas été modifié.

## Résultat

**Tous les nombres attendus sont retrouvés, sans aucun écart.** Q2U n'a aucune expression absente de l'export. OSE en a cinq, qui sont exactement les cinq unions orphelines de Protégé que swowl annonce ignorer à l'import. Aucun ajout nulle part.

## Ce que ce contrôle vérifie et que l'autre ne vérifie pas

`swowl-controle-perte.py` écarte tout triplet qui contient un nœud anonyme. Il ne contrôle donc que 446 triplets sur 598 pour Q2U et 684 sur 1470 pour OSE. Les restrictions, les unions et les autres expressions anonymes n'y sont gardées que par leur nombre, dans `swowl-compte.py`. Un identifiant remplacé à l'intérieur d'une restriction n'y changerait rien.

`swowl-controle-structure.py` rend chaque expression anonyme sous forme de signature textuelle : propriété, contraintes, classes et valeurs, avec les expressions imbriquées développées. Il range chaque signature avec son contexte immédiat :
- la classe qui la porte et le lien (`subClassOf`, `equivalentClass`, `disjointWith`) ;
- la propriété dont elle est le domaine ou la portée ;
- ou le fait qu'elle est orpheline.

Il compare ensuite la source et l'export, signature par signature, dans les deux sens. Il signale donc aussi bien une expression absente qu'une expression ajoutée, et un identifiant remplacé apparaît comme une absence suivie d'un ajout.

La comparaison par isomorphisme de graphes (`rdflib.compare`) a été essayée et écartée : elle rend 288 fausses différences sur OSE, parce que sa canonicalisation identifie un nœud anonyme par toute la structure dont il dépend.

## Sortie complète

```
--- Q2U
  restrictions portées     source   29  export   29  absents   0  ajoutés   0
  domaines                 source    4  export    4  absents   0  ajoutés   0
  portées                  source    0  export    0  absents   0  ajoutés   0
  expressions orphelines   source    0  export    0  absents   0  ajoutés   0
  total d'expressions absentes de l'export : 0
--- OSE
  restrictions portées     source  164  export  164  absents   0  ajoutés   0
  domaines                 source   12  export   12  absents   0  ajoutés   0
  portées                  source    0  export    0  absents   0  ajoutés   0
  expressions orphelines   source    5  export    0  absents   5  ajoutés   0
     ABSENT x3 : (FunctionalItem ou OrganicItem)
     ABSENT x2 : (MiniMaxiBeSpecification ou TargetTolerenceBeSpecification)
  total d'expressions absentes de l'export : 5
```

## Comparaison avec les valeurs attendues

| | attendu | obtenu |
|---|---|---|
| Q2U, restrictions portées | 29 / 29 | 29 / 29 |
| Q2U, domaines | 4 / 4 | 4 / 4 |
| Q2U, portées | 0 | 0 |
| Q2U, orphelines | 0 | 0 |
| Q2U, absents / ajoutés | 0 / 0 | 0 / 0 |
| OSE, restrictions portées | 164 / 164 | 164 / 164 |
| OSE, domaines | 12 / 12 | 12 / 12 |
| OSE, portées | 0 | 0 |
| OSE, orphelines | 5 / 0 | 5 / 0 |
| OSE, orphelines absentes | 3 × (FunctionalItem ou OrganicItem), 2 × (MiniMaxiBeSpecification ou TargetTolerenceBeSpecification) | identique |
| OSE, ajouts | 0 | 0 |
| Total d'expressions absentes | Q2U 0, OSE 5 | Q2U 0, OSE 5 |

## Vérification complémentaire : la couverture du contrôle

Le contrôle n'examine les expressions anonymes qu'à partir de cinq liens (`subClassOf`, `equivalentClass`, `disjointWith`, `domain`, `range`) ou quand elles sont orphelines. Une expression rattachée par un autre prédicat, par exemple `rdf:type` sur un individu ou `propertyChainAxiom`, ne serait pas comparée. J'ai mesuré, dans les deux sources, les prédicats qui relient un sujet nommé à un nœud anonyme :

- Q2U : `subClassOf` 29, `domain` 4 ;
- OSE : `subClassOf` 164, `domain` 12.

Aucun autre prédicat n'apparaît. Sur nos deux ontologies, le contrôle couvre donc toutes les expressions anonymes. Si l'ontologie évolue, cette mesure est à refaire.

## Écarts

Aucun.
