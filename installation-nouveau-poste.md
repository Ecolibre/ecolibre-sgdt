# Installation sur un nouveau poste

Procédure pour reprendre le travail sur le wiki SGDT depuis une machine
Ubuntu qui n'a jamais servi à ce projet.

Trois choses ne circulent pas par git et doivent être refaites à chaque
fois : les secrets (`.env`, `.cookies.txt`), l'authentification Claude
Code, et l'accès à GitHub.

---

## 1. Outils de base

```
sudo apt update
sudo apt install -y git curl jq
```

## 2. Claude Code

L'installateur natif est la méthode recommandée : binaire autonome, sans
dépendance à Node.js, mise à jour automatique.

```
curl -fsSL https://claude.ai/install.sh | bash
```

Vérifier, puis se connecter :

```
claude --version
claude
```

Au premier lancement, un navigateur s'ouvre pour la connexion au compte
Claude. Un abonnement Pro, Max, Team ou Enterprise est nécessaire.

Documentation officielle, si la commande ci-dessus a changé :
<https://docs.claude.com/en/docs/claude-code/overview>

### Permissions

`.claude/settings.json` est **versionné** : un `git clone` du dépôt suffit à
récupérer les permissions à jour sur un nouveau poste, rien à reconfigurer à
la main. Seul `.claude/settings.local.json` (propre à une machine, non
versionné, voir `.gitignore`) échappe à ça.

| Règle | Motif | Depuis |
|---|---|---|
| `deny Read/Edit(./.env, ./.env.*, ./.cookies.txt)` et leurs équivalents dans le dépôt privé | Secrets de session wiki, jamais lus ni modifiés par l'outillage Claude Code | 12/08/2026 |
| `deny Read/Edit(./Serveur3/**)` | Le dossier porte le mot de passe de la base, la clé secrète et la clé de version du wiki | 20/08/2026 |
| `deny Bash(sudo/ssh/mysql/mysqldump:*)` | Actions système ou base de données hors périmètre de l'outillage wiki | 12/08/2026 |
| `ask Bash(git reset --hard/git clean:*)` | Opérations qui écrasent ou suppriment du travail non commité — confirmation à chaque fois | 20/08/2026 |
| `allow` sur les scripts `bin/wiki-*.sh`, les commandes de lecture usuelles (`grep`, `ls`, `cat`, `find`, `diff`, `jq`…) et `git status/diff/log/add/commit/push` | Usage quotidien sans confirmation répétée | 12/08/2026, complété le 20/08/2026 (`curl`, `python3`, `git push` déplacés d'`ask` vers `allow`) |

Pas de règle `deny` sur un push forcé : `Bash(git push --force:*)` ne couvre
que la forme où `--force` suit immédiatement `push` et rate
`git push origin main --force` — une règle qui protège à moitié fait croire
qu'elle protège. La protection réelle est posée côté GitHub, par une règle
de branche sur `main`.

**Ce que git n'archive pas**, et qui doit être reconstitué à chaque nouveau
poste (voir aussi le paragraphe d'introduction et la section 4) :
- `.env` et `.cookies.txt` (secrets de session) ;
- `Serveur3/` (accès et clés du serveur mutualisé) ;
- les fichiers non-markdown de `travaux/` (le dossier n'y versionne que le
  `.md` — un fichier déposé depuis le téléphone dans un autre format reste
  invisible à git).

## 3. Dépôt

```
cd ~
git clone https://github.com/Ecolibre/ecolibre-sgdt.git
cd ecolibre-sgdt
```

Identité des commits et enregistrement du jeton :

```
git config --global user.name "Cyril Ecolibre"
git config --global user.email "contact+cyril@ecolibre.org"
git config --global credential.helper store
```

Au premier `git push`, GitHub demande un nom d'utilisateur et un mot de
passe. Le mot de passe attendu est un **jeton d'accès personnel**, pas le
mot de passe du compte — à créer sur
<https://github.com/settings/tokens>, onglet *Tokens (classic)*, avec la
case **repo** cochée. Le jeton n'est affiché qu'une fois : le conserver.
Une fois saisi, il est enregistré dans `~/.git-credentials` et n'est plus
redemandé.

## 4. Répertoire privé

Les scripts `bin/` cherchent `.env` et `.cookies.txt` dans
`$SGDT_PRIVE`, dont la valeur par défaut est `../ecolibre-sgdt-prive/` —
c'est-à-dire un répertoire **voisin** du dépôt, jamais dedans.

```
mkdir -p ~/ecolibre-sgdt-prive
nano ~/ecolibre-sgdt-prive/.env
```

Y placer les identifiants du compte wiki, au même format que sur le poste
d'origine. Puis :

```
chmod 600 ~/ecolibre-sgdt-prive/.env
cd ~/ecolibre-sgdt
bin/wiki-login.sh
```

Si `wiki-login.sh` réussit, `.cookies.txt` est créé automatiquement : il
n'y a jamais à le recopier d'une machine à l'autre.

Pour une arborescence différente, exporter le chemin :

```
export SGDT_PRIVE=/chemin/vers/le/repertoire-prive
```

## 5. Vérification

```
cd ~/ecolibre-sgdt
bin/wiki-api.sh --facts "subject=Item ref&ns=102"
git status
```

La première commande doit afficher des faits SMW ; la seconde, un dépôt
propre.

---

## Machine qui ne t'appartient pas

Sur un poste partagé ou prêté, ne jamais créer le répertoire privé : sans
`.env`, les scripts de lecture continuent de fonctionner en anonyme et
l'écriture est simplement impossible. C'est le mode par défaut, et le bon
mode pour une machine dont tu ne contrôles pas les autres utilisateurs.

Ne pas y enregistrer non plus le jeton GitHub (`credential.helper store`
écrit en clair). Préférer la saisie à chaque envoi, et révoquer le jeton
en partant.

À la fin d'une session sur une telle machine :

```
claude logout
rm -f ~/.git-credentials
```

---

## Travailler à deux ou plus

Git ne gère pas les conflits tout seul. Avant de commencer une session :

```
cd ~/ecolibre-sgdt
git pull
```

Et à la fin :

```
git add -A && git commit -m "Session du <date>" && git push
```

Si `git push` est refusé, c'est que quelqu'un a poussé entre-temps :
`git pull --rebase` puis repousser.

Le wiki, lui, n'a pas ce filet : deux personnes qui éditent la même page
en même temps produisent un conflit d'édition côté MediaWiki. Se répartir
les pages plutôt que de compter sur la fusion.

---

## Depuis un téléphone Android

Claude Code ne s'installe pas sur Android. Trois usages possibles, du
plus simple au plus autonome.

**Lire et préparer.** L'application Claude suffit : le dépôt étant public
sur GitHub, tout son contenu — rapports, cadrages, outillage — est
consultable et peut servir de base à une conversation d'architecture.
Aucune machine allumée n'est nécessaire. En revanche rien ne peut être
écrit, ni sur le wiki ni sur le dépôt.

**Écrire sur le wiki.** Le wiki s'édite très bien depuis un navigateur
mobile, formulaires compris. C'est la voie normale pour saisir du contenu
en déplacement, et elle ne demande aucun outillage.

**Piloter la machine à distance.** Depuis l'application Claude, une tâche
peut être confiée à Claude Code tournant sur un ordinateur resté allumé.
C'est le seul moyen de faire exécuter des écritures scriptées ou des
commandes serveur depuis un téléphone.

Pour un terminal autonome sur le téléphone — git, ssh, curl — il existe
Termux (<https://termux.dev>), qui installe un vrai environnement Linux.
Utilisable, mais la frappe de commandes longues sur un clavier tactile
rend l'exercice pénible : à réserver au dépannage.

**Accès SSH au serveur.** Depuis la mise en place du cron sur
`runJobs.php`, la raison principale de s'y connecter a disparu. Pour les
cas restants, Termux fournit `ssh` après `pkg install openssh`.
