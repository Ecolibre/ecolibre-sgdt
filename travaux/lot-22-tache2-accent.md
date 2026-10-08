````markdown
# Lot 22 — Tâche 2 : accent sur « À mesurer »

Date : 8 octobre 2026. Exécuteur : Claude Code, poste spheres.

Page écrite : `Lot 22 — Miroir local` (pageid 533), révision 1469 → **1470**, 2026-10-08T21:15:09Z.
Résumé de modification : `[Lot 22][Tâche 2] Accent sur la capitale de « À mesurer » dans Points ouverts`.
Aucune autre page écrite.

## Étapes

1. **État du dépôt** : `git status --porcelain` ne renvoie aucune ligne. Rien n'arrête la tâche.
   `.claude/settings.local.json` contient `"allow": []` et `"deny": []`, sans aucune règle, au début comme à la fin de la tâche.
2. **Titre de la page** : relevé par `list=categorymembers` sur `Catégorie:Lot`. Le seul titre qui commence par « Lot 22 » est `Lot 22 — Miroir local`.
3. **Lecture** : la dernière révision était la 1469, celle de la tâche 1. La page n'a pas été modifiée entre les deux tâches.
   La chaîne `A mesurer à l'ouverture du lot.` apparaît exactement une fois. La chaîne `A mesurer` apparaît elle aussi une seule fois.
4. **Écriture** : le remplacement a été fait sur le texte lu, à une seule occurrence, puis le diff a été contrôlé avant l'envoi.

## Diff appliqué

```
31c31
< La route de récupération du dump n'est pas arrêtée : mysqldump depuis le compte de Cyril, ou script de maintenance MediaWiki. A mesurer à l'ouverture du lot.
---
> La route de récupération du dump n'est pas arrêtée : mysqldump depuis le compte de Cyril, ou script de maintenance MediaWiki. À mesurer à l'ouverture du lot.
```

## Vérifications

Après l'écriture, la page a été relue par `bin/wiki-get.sh`.

| Contrôle | Mesure | Résultat |
|---|---|---|
| Le wikitexte relu contient « À mesurer à l'ouverture du lot. » | `grep -c` : 1 | **Passe** |
| Le wikitexte relu ne contient plus « A mesurer » | `grep -c` : 0 | **Passe** |
| Le statut est toujours « identifié » | Faits stockés relus par `bin/wiki-api.sh --facts` : `Work_package_status -> ['identifié']` | **Passe** |
| Le reste du texte est identique, caractère pour caractère | `diff` entre le texte d'avant (révision 1469) et le texte relu (révision 1470) : seule la ligne 31 diffère, par ce remplacement. `diff` entre le fichier envoyé et le texte relu : aucune différence, code 0 | **Passe** |

## Questions posées ou réponses rendues hors de cette consigne

Aucune.

## Écarts et surprises

Aucun.
````
