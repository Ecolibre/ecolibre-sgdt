# Correctif du 19 novembre 2026 — ssh passe de l'interdiction à la confirmation

Réponse à la question A du rapport `travaux/lot-48-tache1-production.md` :
Cyril choisit que Claude Code se connecte lui-même au serveur. `Bash(ssh:*)`
quitte `deny` pour `ask`, durablement. Aucune commande ssh n'a été lancée dans
cette tâche.

## Étape 1 — État du dépôt

| Contrôle | Résultat |
|---|---|
| `git fetch origin` | rien de nouveau ; `main` aligné sur `origin/main` (0 commit de retard) |
| `git status --porcelain` | vide |
| `.claude/settings.local.json` (début) | fichier absent, aucune règle |

## Étape 2 — `.claude/settings.json`

- `"Bash(ssh:*)"` retiré de `permissions.deny`, ajouté en fin de `permissions.ask`.
- `python3 -m json.tool` : JSON valide.
- `jq` : `.permissions.deny | index("Bash(ssh:*)")` rend `null` (absent) ;
  `.permissions.ask | index("Bash(ssh:*)")` rend `4` (dernière position, présent).
- `"Read(~/.ssh/**)"` toujours dans `deny` (index 15).
- Comptes : `deny 24 ask 5 allow 49`, soit un de moins dans `deny` et un de plus
  dans `ask`.
- `git diff` : une ligne retirée dans `deny`, une ligne ajoutée dans `ask`, et
  la ligne `"Bash(git restore:*)"` qui gagne une virgule (voir « Écarts »).

## Étape 3 — `installation-nouveau-poste.md`

`git diff` montre exactement les trois changements demandés :

1. `deny Bash(sudo/ssh/mysql/mysqldump:*)` devient
   `deny Bash(sudo/mysql/mysqldump:*)`, reste de la ligne inchangé.
2. Ligne `ask Bash(ssh:*)` insérée juste après, mot pour mot, datée du
   19/11/2026.
3. Ligne `deny Read(~/.ssh/**)` : « complète `deny Bash(ssh:*)` » devient
   « complète `ask Bash(ssh:*)` : Claude Code peut se connecter au serveur,
   jamais lire les clés du poste ».

## Relevé de `.claude/settings.local.json`

- Début : absent.
- Fin : absent.

## Écarts et surprises

1. **Le diff de `settings.json` touche trois lignes, pas deux.** Ajouter un
   élément en fin de liste JSON oblige à mettre une virgule après l'élément
   précédent, `"Bash(git restore:*)"`. Rien d'autre n'a changé dans le fichier.
2. **Prise d'effet.** Claude Code lit `settings.json` au lancement et le
   surveille en cours de session, mais je n'ai pas vérifié que la nouvelle règle
   est déjà active dans cette session : la consigne interdit toute commande ssh
   ici. Le premier `ssh` de la tâche du lot 48 le dira. S'il est encore refusé
   (« denied »), il faudra relancer la session. S'il ouvre une fenêtre de
   confirmation, la règle est en place.
3. Les dates de la ligne `deny Bash(sudo/mysql/mysqldump:*)` (12/08/2026) n'ont
   pas changé : c'est la date de la règle d'origine. Le retrait de ssh est daté
   par la ligne nouvelle.
