# Lot 48 — amendement du 22 novembre 2026 : quatre chemins de l'API fermés

Ce rapport rectifie `travaux/lot-48-cloture.md`, dont la liste des chemins
éprouvés sans connexion n'était pas complète : quatre chemins de l'API
rendaient le texte d'une page verrouillée par Lockdown.

Session locale sur le Framework, 22 novembre 2026, branche `main`, après le
commit `dc9ef70`.

**Résultat : configuration appliquée en production, vérification réussie au
premier essai, aucun retour en arrière.** Ni `setupStore.php` ni `update.php`
n'ont été lancés ni réclamés. Les trois pages du wiki sont écrites et
vérifiées.

## Étape 1 — État du dépôt et des accès

- `git fetch origin` : `main` alignée sur `origin/main` ; `origin/main` ancêtre
  de `HEAD` ; clone non superficiel ; `git status` propre.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `bin/wiki-login.sh` : `Success Cywil`.
- `ssh -o BatchMode=yes … echo ok` : `ok`.

## Étapes 2 et 5 — Mesures sans connexion, avant et après

`curl` direct, sans cookie, `format=json`. Seuls relevés : code HTTP, présence
du marqueur `MARQUEUR-LOT48`, code d'erreur de l'API. Aucun corps de réponse
n'a été conservé ni affiché.

| Chemin | Avant : HTTP | Avant : marqueur | Après : HTTP | Après : marqueur | Après : erreur rendue |
|---|---|---|---|---|---|
| `list=allrevisions` (ns 502, contenu) | 200 | **présent** | 200 | absent | aucune clé `error` ; avertissement `The "allrevisions" module has been disabled.` (voir Écarts, 1) |
| `action=compare` Accueil → CAO:Essai lot 48 | 200 | **présent** | 200 | absent | `moduledisabled` |
| `action=visualeditor&paction=parse` | 200 | **présent** | 200 | absent | `permissiondenied` |
| `action=visualeditoredit&paction=diff`, POST, jeton `+\` | 200 | **présent** | 200 | absent | `permissiondenied` |
| Témoin `visualeditor&paction=parse&page=Accueil` | 200 | absent | 200 | absent | aucune ; `result` = `success` avant et après |
| Témoin `list=recentchanges&rclimit=1` | 200 | absent | 200 | absent | aucune ; un résultat avant et après |

Page d'accueil après changement (`/wiki/Accueil?cachebust=20261122a`) : **200**,
21 301 octets, contenu présent (`mw-parser-output`), aucune mention de
`setupStore`, `update.php`, `Fatal error`, `Parse error` ni `Warning:` ; second
relevé (`cachebust=20261122b`) : titre « Ecolibre ».

## Étape 3 — Contrôles sur le serveur, sans modification

| Contrôle | Résultat |
|---|---|
| Fichier modifiable par le compte | oui |
| Bloc « Lot 48 - Espaces de formation verrouillés » | 1 occurrence |
| `wgAPIListModules` | 0 |
| `wgAPIModules` | 0 |
| `ApiCheckCanExecute` | 0 |
| Taille, droits | 13 777 octets, 664 |
| sha256 | `3f1c3ff0ae6468f861d16c099915ef435dfae9b7e82e877a206ff7aa45c3cbe0` (celui posé le 19 novembre 2026) |
| Balise `?>` dans les 200 derniers octets | absente |
| Lignes, fin de fichier | 438, saut de ligne final présent |

## Étape 4 — Sauvegarde et nouveau fichier

- Bloc écrit mot pour mot en local (24 lignes, 1 350 octets), envoyé par `scp`
  dans le dossier de sauvegarde (`bloc-amendement.php`, mis en 600) ; sha256
  identique des deux côtés :
  `ed630612a3d2337fdd00d8312ecfd61ebda738e87d17a6ce35f035337473c6d1`.
- Sauvegarde `LocalSettings_ecolibre.php.avant-amendement-20261122` par
  `cp -p`, puis `chmod 600` : droits 600, 13 777 octets, sha256
  `3f1c3ff0ae6468f861d16c099915ef435dfae9b7e82e877a206ff7aa45c3cbe0`, identique
  à l'original. Dossier de sauvegarde en 700.
- `LocalSettings_ecolibre.php.nouveau-amendement` : la sauvegarde, plus une
  ligne vide, plus le bloc ; pas de `?>` dans l'original, donc ajout en fin de
  fichier. Droits 600, 15 128 octets.
- `php -l` : `No syntax errors detected in LocalSettings_ecolibre.php.nouveau-amendement`.
- `diff` avec l'original : en-tête unique `438a439,463`, 0 ligne retirée,
  25 lignes ajoutées (la ligne vide et les 24 du bloc).
- Contrôles de contenu : les 438 premières lignes ont la somme de l'original,
  la ligne 439 est vide (1 octet), les 24 dernières ont la somme du bloc.
- sha256 du nouveau fichier :
  `931cbafae1524beabd1fb3c3e67b4f64711fc8508f6214750c3ab92b2f95b212`.

## Étape 5 — Mise en place

- `cp` sans `-p` du nouveau fichier sur l'original à 20 h 17 min 01 s, heure du
  serveur.
- Aussitôt après : sha256
  `931cbafae1524beabd1fb3c3e67b4f64711fc8508f6214750c3ab92b2f95b212`,
  15 128 octets, droits 664.
- Vérifications : voir le tableau plus haut. Toutes réussies au premier essai ;
  ni attente, ni second essai, **ni retour en arrière**.

Récapitulatif des sommes :

| Fichier | sha256 |
|---|---|
| Original avant | `3f1c3ff0ae6468f861d16c099915ef435dfae9b7e82e877a206ff7aa45c3cbe0` |
| Sauvegarde `avant-amendement-20261122` | `3f1c3ff0ae6468f861d16c099915ef435dfae9b7e82e877a206ff7aa45c3cbe0` |
| Original après | `931cbafae1524beabd1fb3c3e67b4f64711fc8508f6214750c3ab92b2f95b212` |

## Étape 6 — Dépôt

Bloc ajouté mot pour mot à la fin de `miroir/LocalSettings_miroir.php`, après
le bloc du lot 48, précédé d'une ligne vide ; aucune balise `?>` dans ce
fichier. Les 24 dernières lignes ont la somme du bloc (`ed630612…`). `git diff
--stat` : 25 insertions, 0 suppression. `php -l` non lancé en local (PHP absent
du Framework) ; le texte est celui contrôlé à l'étape 4. Le conteneur du miroir
n'a pas été recréé.

## Étape 7 — Wiki

Pour chaque page : lecture par `bin/wiki-get.sh`, révision attendue vérifiée,
script Python de session (`amender.py`, contenu affiché avec son lancement)
qui ne prépare le fichier que si la ligne visée compte une seule occurrence,
diff, `bin/wiki-put.sh`, `bin/wiki-verify.sh`. Aucune protection native
(`protection: []`) sur les trois pages.

| Page | Révision attendue = lue | Nouvelle révision | Diff | `wiki-verify.sh` | Liens avant → après | Catégories avant → après |
|---|---|---|---|---|---|---|
| Limites connues du Système de Gestion de Données Techniques | 1818 | 1827 | ligne 75 prolongée d'une espace et de A1 ; 107 lignes avant et après | IDENTIQUE | 11 → 11 | Page de suivi → Page de suivi |
| Lot 48 — Espaces de formation verrouillés (pageid 723) | 1816 | 1828 | ligne 58 prolongée d'une espace et de A2 ; 91 lignes avant et après | IDENTIQUE | 1 → 1 | Lot → Lot |
| Lot 24 — Adminsys autonome (pageid 535) | 1817 | 1829 | une ligne vide puis A3 insérées après la ligne 36 ; 46 → 48 lignes | IDENTIQUE | 4 → 4 | Lot → Lot |

Résumés employés, mot pour mot ceux de la consigne. `Work_package_status` du
lot 48 après écriture : `clos`.

## Relevé de `.claude/settings.local.json`

- Début de tâche : fichier absent.
- Fin de tâche : fichier absent.

## Questions posées et réponses rendues hors consigne

Aucune.

## Écarts et surprises

1. **`list=allrevisions` désactivé ne rend pas de code d'erreur.**
   `ApiQueryDisabled` répond par un avertissement (`warnings.allrevisions` :
   `The "allrevisions" module has been disabled.`), et `query` revient vide.
   Les paramètres `arv*` sont signalés comme non reconnus. Le marqueur est
   absent : la fermeture est effective, mais une vérification future qui
   chercherait une clé `error` sur ce chemin conclurait à tort qu'il est
   ouvert.
2. **Les titres des pages b et c ne sont pas « Lot 48 » et « Lot 24 ».** Ce
   sont « Lot 48 — Espaces de formation verrouillés » (pageid 723, conforme à
   la consigne) et « Lot 24 — Adminsys autonome » (pageid 535), trouvés par
   `list=allpages`. Une première requête de relevé a été refusée par
   `wiki-api.sh` à cause d'un paramètre `pageids` vide que j'avais laissé dans
   la chaîne : refus attendu du garde-fou, rien n'est parti.
3. **Les nouvelles révisions sont 1827 à 1829, pas 1819 à 1821** : huit
   révisions ont été faites ailleurs sur le wiki entre la rédaction de la
   consigne et mes écritures. Les révisions des trois pages visées étaient
   bien celles attendues.
4. **Deux fichiers de travail restent sur le serveur**, dans le dossier de
   sauvegarde (700) : `bloc-amendement.php` et
   `LocalSettings_ecolibre.php.nouveau-amendement`, tous deux en 600, hors du
   cœur et de tout dossier servi. Le second est la configuration complète,
   secrets compris. Le fichier de travail `nouveau-lot48` du 19 novembre n'y
   est plus. Voir la question A.
5. **A3 parle d'« une troisième copie du fichier de configuration ».** Le
   dossier de sauvegarde porte, après cette tâche, `avant-lot48-20261119`,
   `avant-amendement-20261122` et `nouveau-amendement` : trois copies de la
   configuration, dont une seule prise juste avant ces réglages. Le texte a
   été écrit mot pour mot ; sa formulation dépend de ce que deviendra le
   fichier `nouveau-amendement`.
6. La page d'accueil pèse 21 301 octets contre 21 414 le 19 novembre : pas
   comparé en détail, la page a pu être modifiée entre-temps ; contenu présent
   et aucune erreur.
7. PHP n'est pas installé sur le Framework : le `php -l` du fichier du miroir
   n'a pas été fait localement.

## Questions

**A.** Contexte : `bloc-amendement.php` et
`LocalSettings_ecolibre.php.nouveau-amendement` restent dans le dossier de
sauvegarde du serveur ; le second contient tous les secrets de la
configuration, en double de la sauvegarde. Question : faut-il les supprimer ?
Suggestion : supprimer les deux, ce qui laisse deux copies de la
configuration (`avant-lot48-20261119` et `avant-amendement-20261122`) ;
l'entrée A3 du lot 24 resterait juste pour la copie prise avant ces réglages.
