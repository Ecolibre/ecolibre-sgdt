# Lot 28 — Tâche 4 : rendre la page publique atteignable, lever une contradiction

## Révisions et tailles

| Page | Avant | Après |
|---|---|---|
| Système de Gestion de Données Techniques orienté matériel libre | revid 1244, 5229 octets | revid 1307, 5421 octets |
| Lot 28 — Échange de données avec un partenaire | revid 1306, 8359 octets | revid 1308, 8683 octets |

Les révisions et tailles constatées en étape 1/2/3 correspondaient exactement
à celles annoncées dans la consigne. Chaque ancre de remplacement n'apparaissait
qu'une seule fois dans son fichier avant écriture.

## Diff intégral — page d'entrée du SGDT

```diff
8a9
> Voir aussi [[Transmettre vos outils et vos machines]] pour ce qu'une structure partenaire nous transmet afin que ses outils et ses machines soient rattachés aux fiches de modèle de ce wiki.
```

Une seule ligne ajoutée, immédiatement après l'ancre, aucune autre différence.

## Diff intégral — page du lot

```diff
14a15,16
> '''Livrable :''' [[Transmettre vos outils et vos machines]], créée le 7 septembre 2026.
> 
39c41
< '''Structurer les exigences en données dès la première version.''' Écarté le 3 septembre 2026. Il n'existe aucun partenaire : modéliser sans une seule instance à confronter revient à calibrer sur un échantillon vide, ce que le lot 23 a déjà écarté pour un échantillon de huit. L'identifiant stable de chaque exigence suffit à garder la porte ouverte.
---
> '''Structurer les exigences en données dès la première version.''' Écarté le 3 septembre 2026. Il n'existe aucun partenaire : modéliser sans une seule instance à confronter revient à calibrer sur un échantillon vide, ce que le lot 23 a déjà écarté pour un échantillon de huit. L'identifiant stable de chaque exigence suffit à garder la porte ouverte. L'écartement tient toujours ; son argument d'appui, en revanche, est tombé le 7 septembre 2026 — les points de la page ne sont plus des exigences, et leurs numéros ne servent plus qu'à désigner un point dans une conversation.
```

Une ligne vide et une ligne ajoutées (le livrable), plus une ligne modifiée
(l'incise datée). Aucune autre différence.

## Résultat des six vérifications

1. **Diffs intégraux** : ci-dessus. Conformes à l'attendu, rien d'autre n'a
   bougé sur les deux pages.
2. **Tailles après écriture** (`prop=revisions&rvprop=size`) : 5421 octets
   pour la page d'entrée du SGDT (revid 1307), 8683 octets pour la page du
   lot (revid 1308). Conforme.
3. **Liens entrants de « Transmettre vos outils et vos machines »**
   (`list=backlinks`) : exactement deux — « Système de Gestion de Données
   Techniques orienté matériel libre » (pageid 15) et « Lot 28 — Échange de
   données avec un partenaire » (pageid 541). Conforme.
4. **Faits stockés de la page du lot** (`browsebysubject`) : les cinq
   paramètres du modèle sont intacts (`Work_package_number` = 28,
   `Work_package_opening_date`, `Work_package_status` = « ouvert »,
   `Work_package_summary`, `Work_package_overlaps` à trois valeurs :
   Lot 21, Lot 25, Lot 27). Conforme.
5. **Rendu de la page d'entrée du SGDT** (`action=parse&prop=text`) : les
   quatre formulaires rendent chacun un `<form name="createbox">` distinct
   avec son bouton propre — « Créer l'item fonctionnel », « Créer l'item
   organique », « Créer l'item référencé », « Créer l'item physique ».
   Conforme.
6. **Faits `_ERRC` sur le wiki** (`action=ask&query=[[_ERRC::+]]`) : zéro
   résultat. Conforme.

## Écarts et surprises

Aucun. Toutes les affirmations du contexte (révisions, tailles avant et
après, unicité des ancres, comptes des vérifications) se sont vérifiées à
la mesure, sans exception.
