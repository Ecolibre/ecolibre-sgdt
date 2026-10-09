# Lot 22 — Tâche 7 — Vérification finale sur l'état livré

Exécuteur : Claude Code, 9 octobre 2026. Aucune écriture sur le wiki de
production. Une seule lecture : le wikitexte de *Limites connues du Système
de Gestion de Données Techniques*. Aucun fichier déposé dans un arbre servi.
`miroir/LocalSettings_miroir.php`, `miroir/Dockerfile` et `miroir/compose.yml`
n'ont pas été touchés.

**Résultat : sur l'état livré — `$wgJobRunRate` à 0, conteneur recréé —, la
vérification qui tranche passe avec 0 échec. La réserve du rapport de la
tâche 6 est levée par la mesure.**

## Étape 1 — État du dépôt

`git status --porcelain` : vide. `.claude/settings.local.json` : `allow` et
`deny` vides.

## Étape 2 — Vérification sur l'état livré

Ordre suivi : table `job`, puis `verif1.py`, puis `verif3.py`, puis à nouveau
table `job`. Chaque commande a été lancée une seule fois. Les deux scripts
sont ceux de la tâche 6, inchangés. Leur contenu complet a été montré à Cyril
dans la réponse au refus de la tâche 6.

### Table `job`, avant

Lue par le client `mariadb` du conteneur `db` :
`SELECT COUNT(*) FROM job` → **0**.

### `verif1.py` — sortie complète

```
generator: MediaWiki 1.39.11 | phpversion: 7.4.33 | wikiid: mediawiki_ecolibre_prod | server: http://localhost:8080
| MinervaNeue | — | — | ok |
| MonoBook | — | — | ok |
| Timeless | 0.9.1 | 0.9.1 | ok |
| Vector | 1.0.0 | 1.0.0 | ok |
| CategoryTree | — | — | ok |
| Cite | — | — | ok |
| MyVariables | 4.5 | 4.5 | ok |
| ParserFunctions | 1.6.1 | 1.6.1 | ok |
| TemplateData | 0.1.2 | 0.1.2 | ok |
| Scribunto | — | — | ok |
| Mermaid | 6.0.2 | 6.0.2 | ok |
| Clean Changes | 2022-07-28 | 2022-07-28 | ok |
| VEForAll | 0.5.2 | 0.5.2 | ok |
| Lockdown | — | — | ok |
| CodeEditor | — | — | ok |
| VisualEditor | 0.1.2 | 0.1.2 | ok |
| WikiEditor | 0.5.3 | 0.5.3 | ok |
| Nuke | — | — | ok |
| PageForms | 5.8.1 | 5.8.1 | ok |
| Renameuser | — | — | ok |
| Replace Text | 1.7 | 1.7 | ok |
| UserMerge | 1.10.1 | 1.10.1 | ok |
| SemanticMediaWiki | 4.2.0 | 4.2.0 | ok |
| SemanticResultFormats | 4.2.1 | 4.2.1 | ok |
| ConfirmEdit | 1.6.0 | 1.6.0 | ok |
| QuestyCaptcha | — | — | ok |
miroir: 26 attendu: 26 échecs: 0
```

### `verif3.py` — sortie complète

```
Item_ref -> ['000P']
Part_of -> ["S'hydrater#0##", 'Irriguer#0##']
_ASK -> ["Acheminer_l'eau_au_point_d'usage#0##_QUERY016a8554cf4f56e9d1f3e24be62556f6", "Acheminer_l'eau_au_point_d'usage#0##_QUERYc99c22e093de19f10fed70df48ea6bc7"]
_INST -> ['Functional_item#14##']
_MDAT -> ['1/2026/8/9/21/28/6/0']
_SKEY -> ["Acheminer l'eau au point d'usage"]
HTTP 200 http://localhost:8080/wiki/Acheminer_l%27eau_au_point_d%27usage
```

### Table `job`, après

`SELECT COUNT(*) FROM job` → **0**.

Entre les deux relevés, trois requêtes web ont été faites au miroir : une à
`api.php` pour `siteinfo` (`verif1.py`), puis une à `smwbrowse` et un
affichage de page en URL courte (`verif3.py`). La file n'a pas bougé.

## Étape 3 — Le README

Nouvelle section « Changer la configuration du miroir » dans
`miroir/README.md`, placée entre « Lancer un script de maintenance » et
« Arrêter, redémarrer, détruire ». Elle dit deux choses :

- modifier `miroir/LocalSettings_miroir.php` ne suffit pas : le fichier est
  monté seul, et le conteneur doit être recréé par
  `up -d --force-recreate --wait wiki`, après **tout** changement de
  configuration ;
- un réglage se vérifie par sa valeur effective, lue dans le conteneur par
  `maintenance/getConfiguration.php` (exemple sur `wgJobRunRate`, qui doit
  rendre `{"wgJobRunRate":0}`), et non par le contenu du fichier côté hôte.

Un troisième paragraphe, sur le comptage de la file par la table `job`, a
été écrit puis retiré avant le commit : la consigne demandait deux ajouts, et
cette leçon relève de l'étape 4.

## Étape 4 — Lecture de la page

Wikitexte lu par
`curl -G https://wiki.ecolibre.org/api.php` avec `action=parse`,
`page=Limites connues du Système de Gestion de Données Techniques`,
`prop=wikitext|revid`. Révision **1480**, 55 685 caractères.

- **Forme :** une liste numérotée implicite, sans numéro écrit. Chaque entrée
  tient sur une seule ligne commençant par `# `. Elle s'ouvre sur une
  affirmation en gras (`'''…'''`), suivie de la mesure datée, et se ferme le
  plus souvent sur une règle ou une conséquence en gras. Les entrées récentes
  balisent le code par `<code>`, et par `<code><nowiki>` quand la syntaxe
  s'exécuterait. Les renvois prennent la forme « (entrée N) ».
- **Numéro :** 65 lignes commençant par `# `. La nouvelle entrée sera donc la
  **66**.
- **Entrée du piège côté client :** la 27 (« Le compteur `jobs` de
  `action=query&meta=siteinfo` est une estimation globale… »). L'entrée 15
  dit que la file de production est purgée par un mécanisme côté serveur.

## Texte proposé pour les limites connues

Entrée 66, à ajouter en fin de liste, telle quelle, sur une seule ligne :

```
# '''Le compte de <code>showJobs.php</code> est une taille de file gardée en cache, pas un décompte : la mesure qui tranche est la table <code>job</code>.''' C'est le pendant, côté serveur, du compteur <code>jobs</code> de <code>action=query&meta=siteinfo</code> côté client (entrée 27). Mesuré le 9 octobre 2026 sur le miroir local du lot 22, qui reproduit MediaWiki 1.39.11 avec la file de travaux en base comme en production : juste après un <code>runJobs.php</code> qui avait exécuté l'unique travail en attente, <code>showJobs.php</code> rendait encore <code>1</code> et <code>showJobs.php --group</code> annonçait « htmlCacheUpdate: 1 queued », alors que <code>showJobs.php --list</code> n'en listait aucun et que la table <code>job</code>, lue en base, comptait zéro ligne ; un relevé ultérieur, sans aucune action sur la file entre-temps, rendait <code>0</code>. '''Règle : pour savoir si la file est vide, compter les lignes de la table <code>job</code> ; un compte non nul de <code>showJobs.php</code> ou de <code>siteinfo</code> n'est pas un diagnostic.''' Mesuré sur le miroir et non sur la production, dont la file est purgée côté serveur (entrée 15) ; le code de MediaWiki en jeu est le même des deux côtés.
```

Points à relire par Cyril :

- **Durée de vie du cache non mesurée.** Le délai entre le relevé à `1` et le
  relevé à `0` n'a pas été chronométré : l'entrée dit « un relevé
  ultérieur » et ne donne pas de durée.
- **Mécanisme non lu dans le code.** La mise en cache de la taille de file
  est déduite de l'observation. Ce qui est mesuré : `showJobs.php` à 1 quand
  la table est à 0, puis à 0. L'entrée dit « gardée en cache », comme la
  consigne. Si Cyril veut ne garder que le mesuré, « en retard sur la table »
  serait plus sûr.
- **Contrôles à faire après une éventuelle écriture :**
  - `smwbrowse` sur la page, pour vérifier qu'elle ne porte que `_MDAT` et
    `_SKEY` ;
  - `prop=categories` et `prop=links`.

  Le texte ne contient ni `[[`, ni `{{` : rien ne devrait s'y exécuter.
- **Outil d'écriture.** La page se prête à `bin/wiki-append.sh` : sa
  dernière ligne de contenu est une entrée `# `, et aucun commentaire HTML
  ne suit la liste.

## Étape 5 — Vérifications

1. **QUI TRANCHE — passe.** `verif1.py` sur l'état livré : MediaWiki
   1.39.11, PHP 7.4.33, 26 extensions et habillages sur 26, **0 échec**.
2. **`verif3.py` — passe.** `Item_ref` 000P, `Part_of` à deux valeurs
   (S'hydrater, Irriguer), `_INST` Functional_item, `_MDAT` au
   1/2026/8/9/21/28/6/0, HTTP 200.
3. **Table `job` :** 0 avant, 0 après.
4. **Mode sans privilèges intact :**
   - `docker info` : `[name=seccomp,profile=builtin name=rootless name=cgroupns]` ;
   - `id -nG` : `spheres adm cdrom sudo dip plugdev kvm lpadmin lxd sambashare`,
     sans `docker` ;
   - `systemctl is-active docker.service` : `inactive`.
5. **`.claude/settings.local.json` :** vide (`allow: []`, `deny: []`), au
   début et à la fin.
6. **`git diff --stat -- miroir/` :** `miroir/README.md | 22 +++` seul,
   1 fichier, 22 insertions, aucune suppression.

## Questions posées ou réponses rendues hors consigne

Aucune.

## Écarts et surprises

- **Le commentaire garde-fou n'est plus en fin de liste.** `CLAUDE.md` décrit
  *Limites connues* comme portant un commentaire garde-fou « collé à la
  dernière entrée ». Dans la révision 1480, le seul commentaire HTML de la
  page (« Cette liste doit rester la dernière chose de la page. ») ne vient
  pas après la dernière entrée : la page se termine sur l'entrée 65.
  L'emplacement exact de ce commentaire n'a pas été relevé. Ce n'est pas un
  obstacle à `bin/wiki-append.sh`, mais `CLAUDE.md` ou la page ne décrit plus
  l'autre.
- **L'entrée 27 emploie des accents graves** (`` `jobs` ``) là où les
  entrées récentes emploient `<code>`. Les accents graves ne mettent rien en
  forme en wikitexte. L'entrée proposée suit la forme récente, en `<code>`.
- **Le compte des requêtes entre les deux relevés de la table `job` est
  déduit du code des scripts**, pas du journal d'Apache, qui n'a pas été lu.
