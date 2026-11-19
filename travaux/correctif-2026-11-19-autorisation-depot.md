# Correctif du 19 novembre 2026 — autorisation de lecture du dépôt dans le message d'ouverture

Exécuteur : Claude Code, session cloud, branche `ccr-8d5eed87-mi49fj`.
Écriture hors du périmètre du lot 48 : résumé `[Correctif]` seul, comme le demandait la consigne.

## Écriture sur le wiki

| | |
|---|---|
| Page | `Procédure d'ouverture d'un lot` |
| Révision avant | 1373 (lastrevid par `prop=info`, conforme au relevé de l'architecte) |
| Révision après | 1807 (`newrevid` rendu par l'API, horodatage 2026-11-19T14:32:28Z) |
| Taille | 5991 → 6520 octets |
| Résumé employé | `[Correctif] Ligne d'autorisation de lecture du dépôt ajoutée au message d'ouverture, avec son motif` |
| Protection | `protection: []` avant écriture (contrôle nécessaire, non suffisant) |

## Contrôles avant écriture

- Révision courante : 1373. Conforme.
- Passage A1 : 1 occurrence. Passage B1 : 1 occurrence (compte fait par le script de remplacement, qui n'écrivait qu'à cette condition).
- Relevé `prop=links` : un seul lien, `Procédure de clôture d'un lot`.
- Relevé `prop=categories` : `Catégorie:Page de suivi` seule.

## Contrôles du fichier préparé

- `diff` avant/après : la ligne 13 (phrase B) modifiée, et deux lignes ajoutées après la ligne 19 (la ligne vide et la ligne d'autorisation). Rien d'autre.
- Sauts de ligne : 107 avant, 109 après, soit exactement deux de plus.
- Textes A2 et B2 écrits mot pour mot, chacun sur une ligne physique, sans guillemets français ni tiret long ajoutés.

## Vérifications après écriture

- `bin/wiki-verify.sh` : `IDENTIQUE : Procédure d'ouverture d'un lot`, code de sortie 0.
- Page relue : la ligne d'autorisation figure 1 fois ; la phrase ajoutée en B2 figure 1 fois.
- `prop=links` : `Procédure de clôture d'un lot` seul. Identique au relevé d'avant.
- `prop=categories` : `Catégorie:Page de suivi` seule. Identique au relevé d'avant.
- `bin/wiki-api.sh --facts` : `_INST -> ['Page_de_suivi#14##']`, `_MDAT`, `_SKEY`, et rien d'autre.

## methode-de-travail.md

Paragraphe C inséré dans la section « Limites de l'outillage, mesurées », juste après celui qui commence par « GitHub sert l'adresse brute de ce fichier », séparé par une ligne vide.

- `grep -c "Unauthorized Access"` : 1.
- `git diff --stat` : `methode-de-travail.md | 2 ++`, 1 fichier, 2 insertions, aucune suppression.

## Relevé de `.claude/settings.local.json`

- Au début : fichier absent (`No such file or directory`). Aucune règle.
- À la fin : fichier absent. Aucune règle.

## État du dépôt au début

`git fetch origin` : la branche de session était déjà sur `a193b8b`, comme `origin/main` ; aucune fusion nécessaire. `git status --porcelain` vide.

## Questions posées et réponses rendues hors consigne

Aucune.

## Écarts et surprises

- Le premier paragraphe de la page dit encore que « le message d'ouverture tient en trois lignes ». C'était déjà inexact avant ce correctif (le bloc compte deux lignes de destinataire, le numéro du lot, la commande et trois avertissements) ; la ligne d'autorisation l'éloigne encore. Non modifié : hors consigne.
- Le dernier commit de `origin/main` au début de la tâche s'intitule « Lot 49 : rapport du correctif sur la règle d'écriture des pages de propriété », alors que la consigne situe au même jour l'ouverture du lot 48. Simple constat, sans conséquence ici.
- Le clone de la session est superficiel (`git rev-parse --is-shallow-repository` : `true`). Aucune conclusion n'a été tirée d'un `git log` dans cette tâche.
- La révision est passée de 1373 à 1807 : l'écart reflète les écritures faites ailleurs sur le wiki depuis le 3 octobre, pas une anomalie de cette page, dont le `touched` était resté au 3 octobre 2026.
