# Vérification de la protection de branche GitHub sur main — 20 août 2026

**Exécuté le :** 20 août 2026, session Claude Code, suite au remplacement de
la règle `deny Bash(git push --force:*)` par la protection GitHub côté
serveur (voir `rapport-2026-08-20.md`).

---

## 1. Ce que GitHub a enregistré (`GET /rules/branches/main`)

```json
[
  {
    "type": "deletion",
    "ruleset_source_type": "Repository",
    "ruleset_source": "Ecolibre/ecolibre-sgdt",
    "ruleset_id": 21086289
  },
  {
    "type": "non_fast_forward",
    "ruleset_source_type": "Repository",
    "ruleset_source": "Ecolibre/ecolibre-sgdt",
    "ruleset_id": 21086289
  }
]
```

**Les deux règles attendues sont présentes** : `non_fast_forward` (blocage
des poussées forcées) et `deletion` (blocage des suppressions de branche).

**Aucune autre règle**, en particulier **pas de `pull_request`** — un push
direct sur `main` reste possible, la chaîne de travail actuelle (édition
locale → commit → `git push`) n'est pas cassée.

**Une seule source** : les deux entrées portent le même `ruleset_id`
(`21086289`) et le même `ruleset_source` (`Repository
Ecolibre/ecolibre-sgdt`). Pas de doublon entre une règle de branche classique
et le ruleset — une seule source de vérité.

Détail du ruleset lui-même (`GET /rulesets/21086289`) :

- **Nom exact** : `Protection de main`
- `enforcement`: `active`
- `target`: `branch`, `conditions.ref_name.include`: `~DEFAULT_BRANCH`
- Créé et mis à jour le 2026-08-20T10:42:19Z (création et dernière
  modification à la même seconde — pas de retouche depuis la création)

---

## 2. Test réel : tentative de réécriture d'historique sur `main`

État avant le test : copie locale propre, `main` exactement à jour avec
`origin/main`, SHA `ded6184f53a27a3a7dff2815f3851c62edce629c` (noté avant
toute tentative).

Commande tentée :

```
git push --force origin HEAD~1:main
```

**Résultat : refus explicite.**

```
remote: error: GH013: Repository rule violations found for refs/heads/main.
remote: - Cannot force-push to this branch
 ! [remote rejected] HEAD~1 -> main (push declined due to repository rule violations)
```

Vérification après coup (`git fetch origin`) : `origin/main` toujours à
`ded6184f53a27a3a7dff2815f3851c62edce629c`, copie locale toujours propre et
à jour. Rien n'a bougé, ni en local ni à distance — aucune réparation à
faire.

---

## Conclusion

Le ruleset **« Protection de main »** est actif et effectif : les deux
règles annoncées par Cyril (`non_fast_forward`, `deletion`) sont en place,
proviennent d'une seule source, n'incluent aucune contrainte `pull_request`
qui bloquerait le push direct, et le blocage a été vérifié en conditions
réelles — pas seulement lu dans la configuration.
