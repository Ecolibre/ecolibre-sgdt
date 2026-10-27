# swowl : section 9 de la note d'installation mise à jour

27 octobre 2026, session locale sur le poste Ubuntu de Cyril.

## Fusion préalable

La branche `claude/sharp-maxwell-fq55p7` (commit `81df3d4`) a été fusionnée
dans `main` en avance rapide, sans conflit. La branche de session n'a pas été
supprimée.

## Ce qui a changé dans `ontologie/installation-swowl.md`, section 9 seulement

- **Étape 2** : l'installation à la main des sept paquets sans épinglage est
  remplacée par `pip install -r ~/swowl/backend/requirements.txt`, comme en
  section 4.
- **Étape 4** : la consigne de réinstaller `fastapi==0.154.0` si l'erreur
  porte sur `enum=` est retirée. À la place : lire le nom du paquet dans le
  message d'erreur, le descendre de version jusqu'à ce que le module se
  charge, en prenant `ontologie/swowl-requirements.txt` comme point de repère
  connu (jeu complet qui a fonctionné, FastAPI 0.162.0). Une phrase renvoie à
  `travaux/swowl-installation.md` pour l'épisode FastAPI 0.155.0 du
  20 octobre 2026, présenté comme histoire et non comme consigne.

Aucune autre section n'a été touchée.

## Recherche des mentions périmées

Recherche par `grep` de `0.154`, `enum=`, `1335`, `557` et `requirements.txt`
dans toute la note : aucune occurrence de `0.154`, `enum=`, `1335` ni `557`.
Les mentions de `requirements.txt` restantes sont toutes cohérentes (section 4,
tableau de la section 6, section 9) ; aucune n'interdit
`backend/requirements.txt`.

## Point signalé, non modifié

La section 4 cite encore, « pour mémoire », le message
`TypeError: Query() got an unexpected keyword argument 'enum'` de la première
installation du 21 octobre 2026. `grep "enum="` ne l'attrape pas (la chaîne
est `'enum'`). Il est présenté comme histoire et ne contredit pas la nouvelle
section 9 ; la consigne interdisant de toucher aux autres sections, il reste
en place.
