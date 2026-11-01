# CLAUDE.md : le hash cité dans un rapport vient de git show

Exécuté le 1er novembre 2026, dans une session Claude Code cloud, sur `main`.

## État de départ

`git fetch origin` puis `git status --porcelain` : sortie vide. `HEAD` et
`origin/main` sur `edc1172`, la copie n'était pas en retard.
`.claude/settings.local.json` : absent, au début comme à la fin.

## Écriture

Dans la section « Garde-fous d'exécution (dépôt git) », le point « Ne pas
conclure sur un aperçu — vérifier après coup par un compte » reçoit, après
« Les joindre au rapport, sans qu'il soit besoin de les demander. », une
ligne vide puis ce paragraphe, indenté de deux espaces :

```
  **Le hash qu'un rapport cite est celui que `git show --stat` a imprimé**,
  jamais un hash écrit de mémoire ou reconstitué. Le 1er novembre 2026, un
  rapport a cité `75f0e0e` pour un commit qui s'appelait `d646566` : le hash
  avait été écrit avant d'être lu. Un identifiant inventé est la pire espèce
  d'erreur dans un rapport, parce qu'il a l'air vérifiable et ne l'est pas.
```

## Vérifications

1. **Celle qui tranche passe.**
   - « a imprimé » : 1 occurrence dans `CLAUDE.md` ;
   - le point suivant commence toujours par « - **Un `curl` d'écriture hors
     des scripts `bin/` requiert l'accord explicite » ;
   - titres `## ` : 11 avant, 11 après.
2. `git show --stat` du commit, sortie telle qu'imprimée :

```
commit 5ee94b528d734317cb49ffcee7ced7bce37a3a63
Author: Claude <noreply@anthropic.com>
Date:   Sun Nov 1 21:55:08 2026 +0000

    CLAUDE.md : le hash cité dans un rapport vient de git show, pas de mémoire

    Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
    Claude-Session: https://claude.ai/code/session_01J5EQjnbjEQYMVBFeFsKsPP

 CLAUDE.md | 6 ++++++
 1 file changed, 6 insertions(+)
```

Six insertions, aucune suppression : la ligne vide et les cinq lignes du
paragraphe. C'est le compte attendu.

## Commits

| Commit | Objet |
|---|---|
| `5ee94b5` | CLAUDE.md : le hash cité dans un rapport vient de git show, pas de mémoire |
| *(ce rapport)* | Rapport ; son hash n'est pas cité ici, il n'existe pas encore au moment où ce texte est écrit |

## Écarts et surprises

- Le paragraphe est séparé de la phrase qui le précède par une ligne vide,
  comme les sous-paragraphes voisins de la section, par exemple « Fin de
  tâche : l'ascendance décide, pas la branche ». La consigne ne le
  précisait pas.
- Ce rapport ne peut pas citer son propre hash, puisque le commit qui le
  porte n'existe pas encore au moment où il est écrit. Le hash est donné
  dans le terminal, après la poussée, tel que l'imprime `git show --stat`.
- Aucune question n'a été posée par le canal direct pendant l'exécution.
