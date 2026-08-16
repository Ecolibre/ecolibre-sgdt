# Lot 9 — Tâche 11 : rapport — bloquée au téléversement

**État : les points 1 et 2 sont faits, les points 3 et 4 n'ont pas pu être
exécutés.** Les deux fichiers corrigés **ne sont pas sur le wiki** :
`list=allimages&aiprefix=ECL` en compte toujours **73**, et les deux pages
`Fichier:` visées ressortent `missing: true`. Rien n'a été annoté, rien n'a
été supprimé, rien n'a été renommé.

## 1. Renommage des copies locales — fait

Sources trouvées dans le répertoire de téléversement du lot
(`/home/spheres/Téléchargements/Terrain Buisson mi août 2026-1-001/Terrain
Buisson mi août 2026`), copiées sous le nom corrigé dans le répertoire de
travail de session — les originaux locaux ne sont pas touchés.

| ancien | nouveau |
|---|---|
| `ECL-Buisson_CerzatHysope-2026-08-08_01.jpg` | `ECL-Buisson_Cerzat-Hysope-2026-08-08_01.jpg` |
| `ECL-Jardin_Cyril_Chilhac-Oignon_rocambole_2026-08-09_01.jpg` | `ECL-Jardin_Cyril_Chilhac-Oignon_rocambole-2026-08-09_01.jpg` |

Un seul caractère change dans chaque nom (tiret inséré après le slug de lieu ;
underscore remplacé par un tiret avant la date). Les quatre champs sont sinon
inchangés. `_01` vérifié correct : aucune autre photo d'Hysope, ni d'Oignon
rocambole au Jardin, n'existe dans le lot des 73.

Copies confirmées bit à bit identiques aux originaux (`md5sum` :
`d403e26b…` et `f416565d…`, identiques de part et d'autre). Absence de
collision vérifiée en ligne **avant** de copier : ni l'un ni l'autre des deux
noms cibles n'existait dans `allimages`. Validation obtenue de Cyril sur ce
tableau avant tout appel d'écriture.

## 2. Téléversement — refusé sur les deux fichiers

`bin/wiki-upload.sh`, un appel par fichier, sans `ignorewarnings`. Les deux
appels rendent **`"result": "Warning"`**, jamais `Success` :

```
ECL-Buisson_Cerzat-Hysope-2026-08-08_01.jpg
  → warnings.duplicate = ["ECL-Buisson_CerzatHysope-2026-08-08_01.jpg"]
     filekey 1cvgmidi2op8.kjc7j0.4.jpg

ECL-Jardin_Cyril_Chilhac-Oignon_rocambole-2026-08-09_01.jpg
  → warnings.duplicate = ["ECL-Jardin_Cyril_Chilhac-Oignon_rocambole_2026-08-09_01.jpg"]
     filekey 1cvgmjgf3lsg.xa584l.4.jpg
```

**Cause : l'avertissement `duplicate` est déclenché par les originaux
eux-mêmes.** MediaWiki détecte qu'un fichier au contenu strictement identique
(même empreinte) est déjà publié — sous le nom défectueux. Le refus n'est donc
pas un défaut du fichier corrigé ni de l'outil : c'est le résultat attendu de
la combinaison « le mal nommé reste en place » + « pas d'`ignorewarnings` ».

Les deux fichiers sont montés jusqu'à la réserve temporaire du serveur (d'où
les `filekey`), mais **aucune page `Fichier:` n'a été créée et aucune version
n'a été publiée** — vérifié après coup, pas déduit du code de retour :
`allimages` toujours à 73 entrées, les deux titres cibles `missing: true`.

## 3 et 4 — non exécutés

L'annotation `{{Specimen photo}}` (`ECL-0022` pour l'Hysope du Buisson,
`ECL-0029` pour l'Oignon rocambole du Jardin), le contrôle `browsebysubject`
et le recomptage de `Category:Photo de plantation` **n'ont pas eu lieu** :
ils portent sur des pages qui n'existent pas. La catégorie compte donc
toujours **63 membres**, pas 65.

## Ce que je n'ai pas fait, et pourquoi

- **`ignorewarnings`** lèverait l'avertissement et publierait les deux
  fichiers. Interdit deux fois : par `CLAUDE.md` (« jamais `ignorewarnings` »,
  garde-fou du script) et par la consigne de cette tâche. Non employé.
- **`action=move` sur l'espace `Fichier:`** renommerait les originaux au lieu
  de re-téléverser. Écarté aussi : la méthode demandée est le
  ré-téléversement, et un renommage ferait disparaître les originaux que Cyril
  veut supprimer lui-même.
- **Suppression des originaux par mes soins** : hors consigne, et de toute
  façon impossible — le compte `Cywil` n'a pas le droit `delete` dans ses
  droits effectifs (déjà constaté en tâche 5, `meta=userinfo&uiprop=rights`).

## Ce qu'il faut pour débloquer

**L'ordre des deux opérations doit être inversé par rapport au plan de la
tâche.** Tant qu'un fichier identique est publié sous le nom défectueux,
aucun téléversement du même contenu sous un autre nom ne peut aboutir sans
`ignorewarnings`.

1. Cyril supprime à la main les deux fichiers mal nommés :
   `Fichier:ECL-Buisson_CerzatHysope-2026-08-08_01.jpg` et
   `Fichier:ECL-Jardin_Cyril_Chilhac-Oignon_rocambole_2026-08-09_01.jpg`.
2. Le téléversement des deux noms corrigés passe alors sans avertissement, et
   les points 3 et 4 s'enchaînent sans autre changement — les copies locales
   corrigées sont prêtes, et l'affectation `Depicts_specimen` est déjà
   arrêtée (`ECL-0022`, `ECL-0029`).

Les `filekey` ci-dessus ne servent à rien pour ce chemin : les reprendre pour
finaliser l'envoi exigerait précisément l'`ignorewarnings` proscrit, et ces
réserves temporaires expirent d'elles-mêmes.

## Leçon à consigner

Le garde-fou « jamais `ignorewarnings` » a une conséquence peu intuitive :
**il rend impossible tout re-téléversement d'un contenu déjà présent sous un
autre nom.** `wiki-upload.sh` est conçu pour que le refus soit visible plutôt
que contourné — il l'a été. La correction d'un nom de fichier par
ré-téléversement suppose donc que l'ancien soit supprimé **d'abord**, pas
après. À retenir pour toute future correction de nommage.
