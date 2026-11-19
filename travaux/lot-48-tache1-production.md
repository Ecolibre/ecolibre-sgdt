# Lot 48 — Tâche 1 : espaces de formation en production

Session locale sur le Framework, 19 novembre 2026.

**Résultat : tâche arrêtée à l'étape 1.** Le contrôle SSH a été refusé par une
interdiction de `.claude/settings.json`. Conformément à la consigne, aucune
étape suivante n'a été lancée : rien n'a été lu ni modifié sur le serveur,
aucun relevé de l'API n'a été fait, `miroir/LocalSettings_miroir.php` n'a pas
été modifié. La production est intacte, aucun retour en arrière n'a été
nécessaire.

## Étape 1 — État du dépôt et des accès

| Contrôle | Résultat |
|---|---|
| `git fetch origin` | `main` en retard de 4 commits sur `origin/main` (`adf0e01..dfb3290`) |
| Fusion | avance rapide sur `dfb3290`, sans conflit |
| `git status --porcelain` | vide avant et après la fusion : aucune modification, aucun fichier non suivi |
| `.claude/settings.local.json` (début) | fichier absent, donc aucune règle |
| `.env` | non lu directement : `ls` sur le fichier est refusé par l'interdiction `Read(//**/ecolibre-sgdt-prive/.env)`, ce qui est attendu. Sa présence est établie indirectement par la réussite de `bin/wiki-login.sh`, qui échoue sans lui. |
| `bin/wiki-login.sh` | `Success Cywil` |
| `ssh -o BatchMode=yes` vers le serveur | **refusé, deux fois** : « Permission to use Bash with command ssh … has been denied ». Cause : la règle `"Bash(ssh:*)"` figure dans la liste `deny` de `.claude/settings.json`. Une interdiction ne passe par aucune fenêtre de confirmation : Cyril ne pouvait pas répondre « 1. Yes ». |

Arrêt ici, conformément à l'étape 1.

## Étapes 2 à 8

Non exécutées.

- Aucun relevé `siteinfo` ni code HTTP de l'Accueil (étape 2) : sans changement à
  suivre, ils n'auraient servi à rien.
- Aucune commande sur le serveur : pas de sauvegarde, pas de nouveau fichier, pas
  de mise en place. Aucune somme sha256 relevée.
- Aucune mesure `intestactions`.
- `miroir/LocalSettings_miroir.php` laissé tel quel : l'étape 8 aligne le miroir
  sur la production, et la production n'a pas changé.

## Relevé de `.claude/settings.local.json`

- Début de tâche : fichier absent.
- Fin de tâche : fichier absent.

## Questions posées et réponses rendues hors consigne

Aucune.

## Écarts et surprises

1. **La consigne supposait l'accès SSH ouvert ; une interdiction du dépôt le
   ferme.** `Bash(ssh:*)` est dans `deny`, au même rang que `sudo`, `mysql` et
   `mysqldump`. La clé SSH du Framework peut fonctionner (« ok » obtenu par
   Cyril) sans que l'exécuteur puisse s'en servir. Lever cette interdiction est
   une modification de `.claude/settings.json`, donc une décision à prendre et à
   documenter, pas un contournement à faire en cours de tâche : je n'y ai pas
   touché.
2. **Message de commit adapté.** La consigne prescrivait « Lot 48 : espaces de
   formation appliqués en production, et rapport ». Ce message aurait été faux :
   rien n'a été appliqué. Le commit porte un message qui dit l'arrêt.
3. **Le dépôt avait avancé de 4 commits depuis le début de la journée**, dont
   l'ouverture du lot 48 (`travaux/lot-48-ouverture.md`). Fusion en avance
   rapide, sans conflit.
