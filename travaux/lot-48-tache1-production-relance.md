# Lot 48 — tâche 1, relance : espaces de formation en production

Session locale sur le Framework, 19 novembre 2026, branche `main`, après le
commit `87a8fc6`. Le premier passage (`travaux/lot-48-tache1-production.md`)
n'est pas modifié.

**Résultat : configuration appliquée en production, étape 6 réussie du premier
coup, aucun retour en arrière.** Ni `setupStore.php` ni `update.php` n'ont été
lancés ni réclamés.

## Étape 1 — État du dépôt et des accès

- `git fetch origin` : `main` alignée sur `origin/main`, 0 commit de retard,
  aucune fusion nécessaire.
- `git status --porcelain` : sortie vide, aucune modification, aucun fichier
  non suivi.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.env` présent dans le dossier privé voisin.
- `bin/wiki-login.sh` : `Success Cywil`.
- `ssh -o BatchMode=yes … echo ok` : `ok`.

## Étape 2 — Relevé avant changement, sans connexion

- `siteinfo` (namespaces, usergroups) : 32 espaces, de -2 à 829, dont 500 et
  501 (CWL) ; aucun espace entre 502 et 515. Groupes : `*`, `user`,
  `autoconfirmed`, `bot`, `sysop`, `interface-admin`, `bureaucrat`,
  `suppress`, `emailconfirmed`, `smwadministrator`, `smwcurator`,
  `smweditor` ; pas de groupe `formation`.
- `https://wiki.ecolibre.org/wiki/Accueil?cachebust=1` : **200**, 21 414 octets,
  titre « Ecolibre ».

## Étape 3 — Lecture et contrôles sur le serveur

| Contrôle | Résultat |
|---|---|
| Fichier modifiable par le compte (`test -w`) | oui |
| `NS_CAO` | 0 occurrence |
| `'formation'` (littéral entre apostrophes) | 0 occurrence ; mot entier (`grep -w`) : 0 |
| `formation` en sous-chaîne | 1 occurrence, ligne 26 : le mot « information » d'un commentaire standard de MediaWiki (voir Écarts) |
| `wgNonincludableNamespaces` | 0 |
| `wgUseAutomaticEditSummaries` | 0 |
| `define` portant un nombre de 502 à 515 | 0 |
| Balise `?>` en fin de fichier | absente (ni sur la dernière ligne, ni dans les 200 derniers octets) |
| Ligne de `$wgVisualEditorAvailableNamespaces = [` | 214, sur 391 lignes : elle précède bien la fin du fichier |
| Taille, droits, propriétaire | 11 614 octets, 664, compte du wiki et groupe de la ferme |
| sha256 | `75abc020f0e2113c614f63796a6e1ffe0ca582b0c0d65bbaa9fd579e9bc6b331` |
| Fin de fichier | saut de ligne final présent |

Version de PHP en ligne de commande sur le serveur : 7.4.33.

## Étape 4 — Copie de sauvegarde

- Dossier de sauvegarde créé dans le dossier personnel du compte, droits 700.
- Copie `LocalSettings_ecolibre.php.avant-lot48-20261119` par `cp -p`, puis
  `chmod 600` : droits relevés 600.
- sha256 de la copie : `75abc020f0e2113c614f63796a6e1ffe0ca582b0c0d65bbaa9fd579e9bc6b331`,
  identique à l'original.

## Étape 5 — Nouveau fichier, préparé à part

- Le bloc a été écrit mot pour mot dans un fichier local, envoyé par `scp`
  dans le dossier de sauvegarde (`bloc-lot48.php`, droits 600) ; sha256
  identique des deux côtés :
  `3db446c06c9514e8939853ed3664da7ec4aee9425890bffbb6aebe8bcef0080b`
  (46 lignes, 2 162 octets).
- `LocalSettings_ecolibre.php.nouveau-lot48` : copie de l'original
  (droits 600), plus une ligne vide, plus le bloc. Pas de `?>` dans
  l'original, donc ajout en fin de fichier.
- `php -l` : `No syntax errors detected in LocalSettings_ecolibre.php.nouveau-lot48`.
- `diff` avec l'original : en-tête unique `391a392,438`, 0 ligne retirée,
  47 lignes ajoutées (la ligne vide et les 46 du bloc).
- Contrôles de contenu : les 391 premières lignes ont la somme de l'original
  (`75abc020…`), la ligne 392 est vide (1 octet), les 46 dernières ont la
  somme du bloc (`3db446c0…`).
- Nouveau fichier : 13 777 octets, sha256
  `3f1c3ff0ae6468f861d16c099915ef435dfae9b7e82e877a206ff7aa45c3cbe0`.

## Étape 6 — Mise en place et contrôle immédiat

- `cp` sans `-p` du nouveau fichier sur l'original à 19 h 53 min 20 s, heure
  du serveur.
- Aussitôt après : sha256
  `3f1c3ff0ae6468f861d16c099915ef435dfae9b7e82e877a206ff7aa45c3cbe0`,
  13 777 octets, droits 664, propriétaire et groupe inchangés.
- `Accueil?cachebust=2` : **200**, 21 414 octets, titre « Ecolibre », contenu
  de la page présent (`mw-parser-output`), aucune mention de `setupStore`,
  `update.php` ni `ERROR_SCHEMA_INVALID_KEY`.
- `siteinfo` : **200**, réponse complète.
- `action=ask`, `[[Catégorie:Lot]]|limit=1` : un résultat (« Lot 1 —
  Corrections de schéma »), aucune clé `error`.

Les trois vérifications ont réussi au premier essai ; ni attente, ni second
essai, ni retour en arrière.

## Étape 7 — Mesures après changement

Sans connexion :

- `siteinfo`, espaces nouveaux : 502 `CAO`, 503 `Discussion CAO`,
  504 `SolidWorks`, 505 `Discussion SolidWorks`, 506 `FreeCAD`,
  507 `Discussion FreeCAD`, 508 `Onshape`, 509 `Discussion Onshape`,
  510 `Fusion`, 511 `Discussion Fusion` ; `subpages` vrai pour les dix.
  Les tirets bas du bloc sont affichés en espaces, comme toujours dans les noms
  d'espace. 512 à 515 absents, comme prévu.
- Les 32 espaces d'avant sont tous identiques, à l'octet près de leur
  description JSON.
- Groupes : un seul nouveau, `formation`, avec le droit `read` ; les autres
  identiques.
- Accueil : les seules différences entre les relevés avant et après sont
  `wgRequestId`, `wgBackendResponseTime` et la valeur du paramètre
  `cachebust` dans le lien de connexion. Taille identique (21 414 octets).

Connecté par `bin/wiki-login.sh` (`Success Cywil`), compte membre de
`bureaucrat`, `interface-admin`, `smwadministrator`, `sysop`, `user`,
`autoconfirmed`, pas de `formation` :
`prop=info&intestactions=read|edit|create&intestactionsdetail=full` sur
`CAO:Essai lot 48` (ns 502, `missing`) :

| Action | Code | Texte |
|---|---|---|
| read | `permissiondenied` | The action you have requested is limited to users in the group: formation. |
| edit | `permissiondenied` | The action you have requested is limited to users in the group: formation. |
| create | `permissiondenied` | The action you have requested is limited to users in the group: formation. |

Les trois actions sont refusées malgré les droits d'administrateur. Aucune page
créée.

## Étape 8 — Dépôt

Bloc ajouté mot pour mot à la fin de `miroir/LocalSettings_miroir.php`, après
le bloc CWL, précédé d'une ligne vide (ligne 253) ; aucune balise `?>` dans ce
fichier. Les 46 dernières lignes ont la somme du bloc (`3db446c0…`). `git diff
--stat` : 47 insertions, 0 suppression. `php -l` n'a pas pu être lancé en local
(PHP absent du Framework) ; le texte est celui contrôlé à l'étape 5. Le
conteneur du miroir n'a pas été recréé.

## Relevé de `.claude/settings.local.json`

- Début de tâche : fichier absent.
- Fin de tâche : fichier absent.

## Questions posées et réponses rendues hors consigne

Aucune.

## Écarts et surprises

1. **Le contrôle « ni 'formation' » a trouvé une occurrence**, qui est la
   sous-chaîne de « information » dans le commentaire standard de MediaWiki
   ligne 26. J'ai lu la consigne comme visant le littéral PHP `'formation'`,
   écrit entre apostrophes comme dans `$wgGroupPermissions['formation']` :
   0 occurrence, et 0 aussi pour le mot entier. Je n'ai donc pas arrêté. Un
   `grep` sur la sous-chaîne seule donnera toujours ce faux positif.
2. **Une commande de contrôle de l'étape 5 a échoué** : un `$p` dans une
   commande `ssh` entre guillemets doubles a été développé par le shell local,
   et `sed` a rendu une erreur. Le contrôle a été refait par sommes sha256
   (premières lignes, ligne vide, dernières lignes), sans rien écrire.
3. Le fichier de production contient déjà sept occurrences de `Lockdown` :
   l'extension est chargée, ce que confirment les refus de l'étape 7.
4. **Deux fichiers de travail restent sur le serveur**, dans le dossier de
   sauvegarde (droits 700) : `bloc-lot48.php` et
   `LocalSettings_ecolibre.php.nouveau-lot48`, tous deux en 600, hors du cœur
   et de tout dossier servi. Le second contient la configuration complète,
   mots de passe compris, comme la sauvegarde. Voir la question A.
5. `$wgUseAutomaticEditSummaries = false` vaut pour tout le wiki : aucune
   mesure de son effet dans cette tâche, faute d'écriture.
6. PHP n'est pas installé sur le Framework : le `php -l` du fichier du miroir
   n'a pas été fait localement.
