# Lot 21, tâche 5 — purge du Récapitulatif technique

Exécuté le 4 octobre 2026 (heure de Paris) par Claude Code, sur consigne
« Pour Claude Code. ».

## Résultat

Une seule action sur le wiki : la purge, avec mise à jour des liens, de
« Récapitulatif technique du Système de Gestion de Données Techniques ».
Aucune écriture de contenu.

Les huit propriétés d'essai supprimées ont disparu de la liste des pages
demandées. Cette liste passe de 44 à 36 pages.

## Départ

- `git status` : aucune ligne modifiée, ajoutée, supprimée ou renommée.
  Six fichiers non suivis dans `travaux/`, qui ne comptent pas.
- `travaux/lot-21-tache5-purge.md` n'existait pas.

## Relevé de départ

Requête : `list=querypage&qppage=Wantedpages&qplimit=500`. La réponse ne
porte ni `cached` ni `cachedtimestamp` : la liste est calculée à la
demande.

**44 pages demandées au total, dont 8 titres « Attribut:Test lot21 »**,
chacun avec 1 lien entrant :
- Attribut:Test lot21 date
- Attribut:Test lot21 débit
- Attribut:Test lot21 débit max
- Attribut:Test lot21 débit min
- Attribut:Test lot21 grandeur
- Attribut:Test lot21 nombre
- Attribut:Test lot21 température
- Attribut:Test lot21 unité

Les 36 autres titres, avec leur nombre de liens entrants :
- La Closerie D'Olt (9) ;
- Escuroux (8) ;
- Armand (5) ;
- Non défini (4) ;
- Catégorie:Item à facette végétal (2) ;
- Catégorie:To be translated into English (2) ;
- un lien chacun : Acier nickelé, Anton, Bene Bonno, Borde, Camille
  Buisson, Dunkerque, Dôme, Fruit, GVDA, Haute-Loire, Le Jardin
  d'Emerveille, Pas-de-Calais, Quicko, SUNKKO, Saint-André-de-Valborgne,
  Modèle:Documentation/doc, Modèle:Facet/doc, Modèle:Lieu/doc,
  Modèle:Lot/doc, Modèle:Organic facet fitting/doc, Modèle:Organic facet
  plant/doc, Modèle:Organic item/doc, Modèle:Organisation/doc,
  Modèle:Specimen photo/doc, Catégorie:Acteur, Catégorie:Procédé,
  Attribut:Has type, Attribut:Imported from, Module:Base36/doc,
  Module:Nombre/doc.

## Purge

```
bin/wiki-purge.sh "Récapitulatif technique du Système de Gestion de Données Techniques"
```
```
{
    "batchcomplete": true,
    "purge": [
        {
            "ns": 0,
            "title": "Récapitulatif technique du Système de Gestion de Données Techniques",
            "purged": true,
            "linkupdate": true
        }
    ]
}
```

## Vérifications

**a. Celle qui tranche : liens entrants de « Attribut:Test lot21 débit ».**
La requête `list=backlinks` rend `"backlinks": []`. Conforme.

**b. Pages demandées.** La même requête qu'au départ rend **36** pages
au total, et **aucun** titre « Attribut:Test lot21 ». Conforme.

Les deux mesures étaient conformes dès la première lecture : aucune
relance de `bin/wiki-wait-jobs.sh` n'a été nécessaire.

## Écarts et surprises

1. **Liens entrants non relevés avant la purge.** La vérification a ne
   montre que l'état d'après. Je n'ai pas relevé les liens entrants de
   « Attribut:Test lot21 débit » avant de purger, parce que la consigne ne
   le demandait pas. C'est le relevé des pages demandées qui montre que le
   lien existait : 1 lien entrant avant, absent après.
2. **Formes de commande hors liste.** Les deux lectures de la liste des
   pages demandées ont été enchaînées vers `jq`, ce que la consigne
   prévoyait.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

Aucune.
