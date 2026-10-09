# Protocole — Forme d'un point : étiquettes, niveaux d'enjeu, décision par défaut

Session de l'exécuteur du 9 octobre 2026. Une consigne en trois messages : la consigne initiale (tâches 0, 1, 2), puis deux réponses de l'architecte aux points A et B posés en cours de route.

## Tâche 0 : état du dépôt

**Premier passage : arrêt.** `git status --porcelain` rendait quatre fichiers modifiés et non commités :

```
 M CLAUDE.md
 M methode-de-travail.md
 M pages/Limites_connues.txt
 M pages/Lot_21.txt
```

C'était le travail de la tâche 18 du lot 21 (7 lignes ajoutées, 5 retirées). Je me suis arrêté et j'ai posé deux questions : A, faut-il le commiter à part, et sous quel numéro de tâche ; B, faut-il plutôt l'écarter, ce que je déconseillais.

**Réponse de l'architecte :** commit séparé, sous le numéro de tâche 18. Avant ce commit, deux préalables : chercher un rapport de la tâche 18 parmi les fichiers non suivis, et comparer les deux miroirs de `pages/` avec le wiki.

**Second passage :** `git status --porcelain --untracked-files=all` ne rendait plus rien. Le commit avait été fait entre-temps (voir « Écarts et surprises »). Le dépôt était propre, et `main` à jour avec `origin/main` après `git fetch`. La tâche 0 était donc remplie.

Comparaison des miroirs avec le wiki, par `bin/wiki-get.sh` puis `diff` :

- `pages/Limites_connues.txt` contre « Limites connues du Système de Gestion de Données Techniques » : **identique**, diff vide.
- `pages/Lot_21.txt` contre « Lot 21 — Grandeurs et unités » : **identique**, diff vide.

## Tâche 1 : methode-de-travail.md

Les trois modifications sont faites, sur ces trois passages et sur aucun autre :

- 1a : la phrase « Chaque point suit cet ordre : … » est remplacée par le renvoi à la section « La forme d'un point ».
- 1b : la phrase « Une simple étape reste un point court : … » est remplacée par la nouvelle formulation.
- 1c : la section « ## La forme d'un point » est insérée avant « ## Le destinataire de chaque texte », avec une ligne vide avant et après.

Les trois textes sont repris mot pour mot de la consigne.

### Vérification qui tranche : relecture depuis le disque

Programme `verif1.py`, écrit dans le scratchpad : il compte les occurrences dans le fichier relu et repère les lignes de titre. Sortie :

```
1a ancienne: 0  nouvelle: 1
1b ancienne: 0  nouvelle: 1
ligne '## La forme d'un point': [81]  ligne '## Le destinataire de chaque texte': [141]
avant: True
```

## Tâche 2 : page « Procédure de clôture d'un lot »

**Premier passage : arrêt.** La phrase demandée était absente sous la forme exacte (`grep -c` rendait 0). Elle existait, mais repliée sur trois lignes dans le bloc `<pre>` à coller (lignes 39 à 41, révision 1374). J'ai proposé un remplacement qui garde le repli (point A). J'ai aussi demandé s'il fallait commiter la tâche 1 seule tout de suite (point B).

**Réponse de l'architecte :** A, oui, avec mes quatre lignes ; B, un seul commit et un seul rapport, après la tâche 2.

**Écriture :**

- La page n'était pas protégée (`protection: []`), et sa dernière révision était toujours la 1374 juste avant l'écriture.
- Le diff ne portait que sur les lignes 39 à 41 :
  ```
  40,41c40,42
  < d'abord une liste : chaque trouvaille en un point numéroté, avec son
  < contexte, ta question et ta suggestion. Je réponds point par point.
  ---
  > d'abord une liste : chaque trouvaille en un point numéroté, à la forme
  > décrite par methode-de-travail.md, section "La forme d'un point". Je
  > réponds point par point.
  ```
- `bin/wiki-put.sh` a rendu `result: Success`, révision 1374 → 1479, `2026-10-09T11:15:22Z`.

### Vérification qui tranche : relecture par l'API

Page relue par `bin/wiki-get.sh` après écriture :

```
grep -c "ta question et ta suggestion."  → 0
39:Ne rédige aucune consigne d'écriture avant que j'aie arbitré. Rends-moi
40:d'abord une liste : chaque trouvaille en un point numéroté, à la forme
41:décrite par methode-de-travail.md, section "La forme d'un point". Je
42:réponds point par point.
diff fichier envoyé / page relue → IDENTIQUE
```

Contrôles demandés par `CLAUDE.md` pour une page de documentation :

- Catégories : seulement `Catégorie:Page de suivi`.
- Liens : quatre pages, toutes existantes (Gestion des lots, Limites connues…, Notes en attente de rangement, Procédure d'ouverture d'un lot).
- Faits : `_INST`, `_MDAT`, `_SKEY` seulement. Aucune annotation parasite.

## `.claude/settings.local.json`

Au début et à la fin de la session, le contenu est identique et ne porte aucune règle :

```
{
  "permissions": {
    "allow": [],
    "deny": []
  }
}
```

## Questions de Cyril hors consigne

Aucune. Les seules questions posées sont les miennes : les points A et B de la tâche 0, puis les points A et B de la tâche 2. L'architecte y a répondu par les deux messages qui ont suivi.

## Écarts et surprises

- **Le commit de la tâche 18 existait déjà quand l'architecte a demandé de le faire.** C'est `55c5a60`, fait le 9 octobre 2026 à 13:01:57 (+0200) sous l'identité Cyril Ecolibre, et déjà présent sur `origin/main`. Il a été fait entre le premier `git status` de cette session, qui montrait les quatre fichiers modifiés, et le second, qui était propre. Il porte son propre message : « [Lot 21][Tâche 18] Six gels sur sept : entrées 59 et 65, page du lot, règle Barrière, règle de rédaction des Limites connues ». Il contient les quatre fichiers et le rapport `travaux/lot-21-tache18-six-sur-sept.md`. Le rapport de la tâche 18 existe donc, et il est commité. **Je n'y ai pas touché** : je n'ai fait ni nouveau commit, ni amendement, ni réécriture de l'historique poussé. Le message dicté par l'architecte (« … règle du dégel corrigée, miroir et protocole alignés ») n'a donc pas été employé.
- **La tâche 18 ajoute ce paragraphe à `methode-de-travail.md`**, juste avant « ## Ce qui rattrape les erreurs ». Texte exact :

  > **Une entrée des *Limites connues* énonce ce qui a été observé, avec son compte et sa date, et ne généralise pas au-delà.** Du 6 au 9 octobre 2026, quatre tâches consécutives du lot 21 n'ont fait que réparer des entrées écrites les jours précédents : chaque fois, une poignée d'observations avait été inscrite au présent intemporel, et un cas de plus la démentait. « Six gels sur sept levés en deux à quatre jours, le septième non levé après cinq » se corrige en changeant un chiffre ; « le gel se résorbe en deux à quatre jours » se corrige en réécrivant l'entrée, et se propage d'ici là dans tous les textes qui la citent. Une règle de conduite tirée d'un petit nombre de cas se marque comme telle : repère, pas mesure.

- **Résultat de la comparaison des miroirs** : les deux fichiers de `pages/` sont identiques au wikitexte en ligne (détail en tâche 0).
- **La phrase de la tâche 2 était repliée sur trois lignes dans un `<pre>`, alors que la consigne la donnait à plat.** Le remplacement exact a échoué, et la règle « pas d'équivalent approchant » a provoqué l'arrêt. Le repli des quatre nouvelles lignes a été validé par l'architecte.
- **Le titre réel de la page du lot 21 porte un tiret cadratin : « Lot 21 — Grandeurs et unités ».** Avec un tiret simple (« Lot 21 - Grandeurs et unités »), `bin/wiki-get.sh` rend « The page you specified doesn't exist ». Le titre exact a été retrouvé par `list=allpages&apprefix=Lot 21`.
- **J'ai suivi `CLAUDE.md` plutôt que la consigne pour le résumé de modification sur le wiki.** La consigne dictait « Forme d'un point : renvoi à methode-de-travail.md », sans crochet. Le garde-fou 2 de `CLAUDE.md` veut qu'une écriture qui ne relève d'aucun lot en cours porte `[Correctif] <action>`. Le résumé employé est donc « [Correctif] Forme d'un point : renvoi à methode-de-travail.md ». Si l'architecte préférait un libellé `[Protocole]`, la règle l'admet aussi (« un libellé nouveau est légitime dès lors qu'il dit à quel titre on écrit »), mais j'ai pris celui que la règle nomme explicitement pour ce cas.
- **Message de commit :** `CLAUDE.md` n'impose aucune forme pour les messages de commit. Le message de la consigne est employé tel quel.
