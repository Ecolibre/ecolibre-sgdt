# CLAUDE.md : la poussée sur main se décide par l'ascendance directe

Exécuté le 1er novembre 2026, dans une session Claude Code cloud, sur `main`.

## État de départ

`git fetch origin` puis `git status --porcelain` : sortie vide. `HEAD` et
`origin/main` sur `bfb8757`, donc la copie n'était pas en retard.
`.claude/settings.local.json` : absent, au début comme à la fin.

## Motif

La règle écrite le 31 octobre (commit `4df857a`) ne prévoyait la poussée que
si `HEAD` était sur une branche de session. Elle ne couvrait pas la session
qui venait de s'en servir, que sa consigne avait placée sur `main`. Le
critère devient l'ascendance directe, qui est ce qui rend la poussée sûre.

## Ancien texte

```
  **Fin de tâche : la branche de session.** Une session Claude Code cloud
  travaille sur une branche `claude/...`, là où une session locale pousse
  sur `main`. En fin de tâche, après avoir commité :

  - si `HEAD` est sur une branche de session et que `origin/main` en est
    l'ancêtre direct, pousser par `git push origin HEAD:main` ;
  - sinon, s'arrêter et le dire. Ne jamais fusionner ni rebaser de soi-même.

  Sans cela le travail reste invisible pour l'architecte, qui ne voit que
  `main`. Un rapport commité sur une branche de session et jamais poussé a
  déjà laissé huit jours une correction d'ontologie hors de `main`, trouvée
  par hasard le 29 octobre 2026.
```

## Nouveau texte

```
  **Fin de tâche : l'ascendance décide, pas la branche.** Après avoir
  commité, vérifier si `origin/main` est l'ancêtre direct de `HEAD`, par
  `git merge-base --is-ancestor origin/main HEAD` :

  - si oui, pousser par `git push origin HEAD:main`, que `HEAD` soit sur
    `main` ou sur une branche de session ;
  - sinon, s'arrêter et le dire. Ne jamais fusionner ni rebaser de soi-même.

  Une session cloud démarre sur une branche `claude/...`, une session locale
  sur `main` : les deux cas sont couverts par la même condition. C'est
  l'ascendance directe qui rend la poussée sûre, pas l'endroit où se trouve
  `HEAD` - une règle qui dépend de l'endroit se trompe dès qu'on se trouve
  ailleurs. Le 1er novembre 2026, la règle précédente ne couvrait pas la
  session qui venait de s'en servir, parce que sa consigne l'avait placée
  sur `main` et non sur une branche.

  Sans cela le travail reste invisible pour l'architecte, qui ne voit que
  `main`. Un rapport commité sur une branche de session et jamais poussé a
  déjà laissé huit jours une correction d'ontologie hors de `main`, trouvée
  par hasard le 29 octobre 2026.
```

Le paragraphe final, « Sans cela le travail… », est inchangé : il est
identique dans les deux versions.

## Commits

| Commit | Objet | `git show --stat` |
|---|---|---|
| `75f0e0e` | CLAUDE.md : la poussée sur main se décide par l'ascendance directe, pas par la branche | 1 fichier, 13 +, 5 − |
| *(ce rapport)* | Rapport | 1 fichier |

Les 5 suppressions sont les cinq lignes de l'ancien texte qui changent : le
titre en gras et les deux lignes qui le suivent, puis les deux lignes de la
première puce. La puce « sinon » et le paragraphe final sont restés en place.

## Vérifications

1. **Celle qui tranche passe.**
   - « si `HEAD` est sur une branche de session et que » : 0 occurrence ;
   - « l'ascendance décide, pas la branche » : 1 occurrence ;
   - titres `## ` : 11 avant, 11 après, aucun titre créé.
2. La section « Garde-fous d'exécution (dépôt git) » compte toujours 13
   points, dans le même ordre, de « Avant de conclure quoi que ce soit d'un
   `git log` » à « L'exécuteur ne voit pas les fenêtres de confirmation ».
   « Rapatrier en début de tâche, systématiquement » suit immédiatement le
   paragraphe final de la règle. `git diff -U0` ne montre que trois blocs,
   tous entre les lignes 684 et 692 : rien d'autre n'a bougé dans le fichier.
   Le décompte de toutes les lignes `- **` du fichier est de 46 avant comme
   après.

## Écarts et surprises

- **La date du nouveau texte.** Il situe au 1er novembre 2026 le cas où la
  règle précédente n'a pas couvert la session. C'est bien la date de la
  consigne B à E. Mais la poussée en question, celle des cinq premiers
  commits, avait eu lieu le 31 octobre, sur rappel du stop-hook. Les deux
  lectures se défendent ; le texte a été recopié mot pour mot.
- Le texte fourni écrit « - » (trait d'union entouré d'espaces) là où le
  reste de `CLAUDE.md` emploie le tiret long « — ». Recopié tel quel.
- Aucune question n'a été posée par le canal direct pendant l'exécution.
