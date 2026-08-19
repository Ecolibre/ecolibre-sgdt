# Lot 9 — Tâche 11 : rapport

**État final : terminée.** Les deux photos sont en ligne sous leur nom
conforme, annotées et vérifiées ; `Category:Photo de plantation` compte
**65 membres**, le chiffre attendu. Les 73 fichiers `ECL-*` du wiki
respectent désormais tous la convention de nommage, sans exception.

La tâche s'est faite **en deux temps, séparés par deux blocages successifs**
et par une suppression manuelle de Cyril. Le récit ci-dessous garde les deux
blocages : le second a produit une exception à un garde-fou de `CLAUDE.md`,
qui doit rester traçable.

---

# Première passe — bloquée au téléversement

**État à ce moment : les points 1 et 2 faits, les points 3 et 4 impossibles.**
Les deux fichiers corrigés n'étaient **pas** sur le wiki :
`list=allimages&aiprefix=ECL` en comptait toujours **73**, et les deux pages
`Fichier:` visées ressortaient `missing: true`. Rien n'avait été annoté,
supprimé ni renommé.

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

---

# Seconde passe — après suppression des originaux par Cyril

## Second blocage : `duplicate` devient `duplicate-archive`

Suppressions confirmées avant toute reprise : `allimages&aiprefix=ECL` à
**71** fichiers, les deux noms défectueux absents. Les deux téléversements
relancés par `bin/wiki-upload.sh` ont pourtant été refusés une seconde fois,
sur un avertissement **différent** :

```
ECL-Buisson_Cerzat-Hysope-2026-08-08_01.jpg
  → warnings.duplicate-archive = "ECL-Buisson_CerzatHysope-2026-08-08_01.jpg"
ECL-Jardin_Cyril_Chilhac-Oignon_rocambole-2026-08-09_01.jpg
  → warnings.duplicate-archive = "ECL-Jardin_Cyril_Chilhac-Oignon_rocambole_2026-08-09_01.jpg"
```

Une suppression MediaWiki retire la page et la version courante, mais laisse
le fichier dans l'**archive**. Un contenu identique y étant toujours,
l'avertissement `duplicate-archive` se déclenche — et bloque tout autant que
`duplicate` en l'absence d'`ignorewarnings`. Vérifié, là encore, que rien
n'était publié : 71 fichiers, les deux cibles `missing: true`.

**Nuance qui a motivé l'arbitrage plutôt que l'arrêt :** `duplicate-archive`
n'est pas un risque d'écrasement. Le nom cible était libre. Or le garde-fou de
`CLAUDE.md` protège explicitement contre l'écrasement d'un nom déjà pris —
un cas que cet avertissement ne recouvre pas. La règle étant néanmoins écrite
sans exception, la décision a été posée à Cyril, non tranchée seul.

## Exception autorisée, et sa forme

Cyril a autorisé `ignorewarnings` pour ces deux appels. Forme retenue, pour
que l'exception reste une exception :

- **`bin/wiki-upload.sh` n'a pas été modifié.** Il reste sans
  `ignorewarnings`, et c'est lui qui vaut pour tout téléversement futur.
- Un **script jetable de session** a porté l'appel, avec son propre
  garde-fou : il interroge le nom cible en ligne et **refuse de partir si la
  page existe** (`ARRET: … existe déjà en ligne — pas d'écrasement`). Les deux
  appels ont affiché « nom cible libre » avant de téléverser.
- `comment` et `text` strictement identiques à ceux des 71 autres photos —
  vérifié en relisant une page annotée en tâche 8 avant d'écrire.

Les deux appels rendent `"result": "Success"`, avec l'avertissement
`duplicate-archive` conservé dans la réponse (signalé, pas masqué).
`allimages&aiprefix=ECL` : **73 fichiers**, dont les deux noms corrigés.

L'exception est consignée dans `CLAUDE.md`, sous l'entrée `wiki-upload.sh`,
avec les trois conditions à réunir (nom cible vérifié `missing` juste avant,
autorisation explicite au cas par cas, script jetable jamais fusionné dans
`bin/`). Tout autre avertissement — `exists`, `duplicate`, `badfilename` —
reste bloquant.

## 3. Annotation — faite

Wikitexte des deux pages relu avant écriture : identique au texte-type des 71
(« Photo prise par Cyril Libert. Licence CC BY-SA 4.0… »), aucune variante.
`{{Specimen photo}}` ajouté à la suite, même forme qu'en tâche 8.

| Page | `Depicts_specimen` | `Image_date` | `Image_location` | revid |
|---|---|---|---|---|
| `ECL-Buisson_Cerzat-Hysope-2026-08-08_01.jpg` | Hysope — Le Buisson de Cerzat (ECL-0022) | 2026-08-08 | Le Buisson de Cerzat | 731 |
| `ECL-Jardin_Cyril_Chilhac-Oignon_rocambole-2026-08-09_01.jpg` | Oignon rocambole — Jardin de Chilhac (ECL-0029) | 2026-08-09 | Jardin de Chilhac | 732 |

Résumé sur les deux : `[Lot 9][Tâche 11] Annotation Specimen photo
(Image_date/Image_location/Depicts_specimen)`.

## 4. Vérification — conforme

`browsebysubject` sur les deux pages, lues individuellement :

- **Hysope** : `Depicts_specimen` → `Hysope_—_Le_Buisson_de_Cerzat_(ECL-0022)`,
  `Image_date` → `1/2026/8/8`, `Image_location` → `Le_Buisson_de_Cerzat`,
  `_INST` → `Photo_de_plantation`.
- **Oignon rocambole (Jardin)** : `Depicts_specimen` →
  `Oignon_rocambole_—_Jardin_de_Chilhac_(ECL-0029)`, `Image_date` →
  `1/2026/8/9`, `Image_location` → `Jardin_de_Chilhac`, `_INST` →
  `Photo_de_plantation`.

Les trois propriétés sont stockées sur les deux pages, chacune avec une seule
valeur, pointant vers des plantations existantes. Sérialisation conforme aux
pièges déjà connus (`1/AAAA/M/J` non préfixé de zéro, propriétés de type Page
en underscore avec suffixe `#0##`).

**`Category:Photo de plantation` : 65 membres** (`list=categorymembers`),
exactement le chiffre attendu — 63 après la tâche 8, plus ces deux-ci, tous
deux présents nommément dans la liste.

## État final du nommage

Les **73** fichiers `ECL-*` du wiki respectent maintenant la convention
`ECL-<lieu>-<plante>-<AAAA-MM-JJ>_<nn>.jpg` sans exception. Les 8 photos hors
sujet végétal restent volontairement hors de `Category:Photo de plantation`
(sans `Depicts_specimen`), conformément à la décision de la tâche 8 : 73
fichiers, 65 photos de plantation.
