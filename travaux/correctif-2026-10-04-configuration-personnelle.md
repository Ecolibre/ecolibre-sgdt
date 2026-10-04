# Correctif du 4 octobre 2026 — configuration personnelle de Claude Code

Hors lot : écritures étiquetées `[Correctif]`. Aucune écriture sur le wiki.

Deux consignes en lecture seule ont précédé ce correctif. La première a
établi que `~/.claude/CLAUDE.md` n'existe pas. La seconde a fait
l'inventaire repris ci-dessous tel quel. La consigne de correctif a ensuite
fait consigner la règle et le constat dans le dépôt.

## Inventaire rendu (repris tel quel)

```
Rapport — Inventaire de la configuration personnelle de Claude Code (lecture seule), 4 octobre 2026

Contrôle des autorisations locales (.claude/settings.local.json)
   Début et fin de tâche : aucune règle ("allow": [], "deny": []).

1. ~/.claude/settings.json (120 octets, modifié le 4 octobre 2026 à 19:57),
   contenu intégral. Aucune valeur secrète, rien à masquer.
   {
     "autoMemoryEnabled": false,
     "theme": "dark",
     "inputNeededNotifEnabled": true,
     "agentPushNotifEnabled": true
   }

2. ~/.claude/ : entrées de premier niveau
   .credentials.json          2026-10-04 14:45   (non ouvert, comme demandé)
   .last-cleanup              2026-10-04 14:56
   .last-update-result.json   2026-10-04 01:25
   backups/                   2026-10-04 19:58
   cache/                     2026-10-01 21:25
   downloads/                 2026-10-02 22:00
   file-history/              2026-10-04 19:36
   history.jsonl              2026-10-04 20:01
   paste-cache/               2026-10-04 20:01
   plugins/                   2026-10-04 20:00
   projects/                  2026-07-25 20:40
   session-env/               2026-10-04 19:58
   sessions/                  2026-10-04 19:56
   settings.json              2026-10-04 19:57
   shell-snapshots/           2026-10-04 19:58
   skills/                    2026-10-01 22:17

   Dossiers demandés :
   - rules/, agents/, commands/, output-styles/ : absents.
     Mesure : ls rend « No such file or directory » pour chacun.
   - skills/ : contient seulement skills/synced/<identifiant>/. Ce sont les
     skills synchronisées depuis le compte claude.ai, qui apparaissent dans
     la session sous le préfixe anthropic-skills:. Il y en a neuf, avec
     manifest.json (2026-10-04 19:56). Le nom suit, puis la description
     résumée. Le texte intégral de chaque description a été relevé, et
     toutes sont en anglais.
       docs             documents partageables (Claude Docs), choix par
                        défaut pour tout document
       docx             fichiers Word
       google-workspace création et modification de fichiers Google Drive,
                        Docs, Sheets et Slides
       import-memory    « Import a memory export from another AI assistant
                        into Claude's memory »
       morning          brief du matin, sur demande explicite seulement
       pdf              fichiers PDF
       pptx             fichiers PowerPoint
       skill-creator    créer, modifier et évaluer des skills
       xlsx             tableurs
   - plugins/ :
       known_marketplaces.json (2026-10-04 20:00) : une seule place de
         marché, claude-plugins-official (github
         anthropics/claude-plugins-official), mise à jour le 2026-10-04 à
         18:00Z.
       marketplaces/claude-plugins-official/ (2026-10-03) et
         marketplaces/claude-plugins-official.bak/ (2026-08-28) : copies
         du catalogue.
       plugin-directory-cache-v2.json (1,8 Mo) : cache du répertoire de
         plugins.
       store/cc-plugin-diff_builtin-…json : {"open": false}.
       synced/<identifiant>/.marketplaces.json : place de marché
         « Anthropic Directory » (source claudeai).
       Aucun fichier installed_plugins.json, et aucune clé enabledPlugins
       dans settings.json : aucun plugin n'apparaît installé ni activé.

3. ~/.claude.json (seules les clés demandées ont été lues)
   - Projet /home/spheres/ecolibre-sgdt : allowedTools = [] (vide).
   - Serveurs MCP : aucun au niveau global (mcpServers vide). Au niveau du
     projet, mcpServers, enabledMcpjsonServers et disabledMcpjsonServers
     sont tous vides.

4. Confrontation au dépôt
   - autoMemoryEnabled: false : RÉPÈTE .claude/settings.json (ligne 2) et
     CLAUDE.md (« désactivée par réglage depuis le 4 octobre 2026 »). Les
     deux niveaux concordent, sans contradiction. C'est le seul réglage de
     mémoire trouvé.
   - theme, inputNeededNotifEnabled, agentPushNotifEnabled : SANS RAPPORT
     (affichage et notifications).
   - Autorisations : aucune. allowedTools du projet est vide, settings.json
     personnel n'a pas de bloc permissions, settings.local.json est vide.
     C'est CONFORME à CLAUDE.md et à methode-de-travail.md (§ sur les
     confirmations).
   - Hooks : aucun. Aucune clé hooks dans settings.json, et aucune
     définition de hook dans les skills. La recherche de « hooks »,
     « allowed-tools » et « permissions » dans les skills ne donne que du
     texte de documentation ou de validation, pas de configuration active.
   - Serveurs MCP : aucun déclaré localement. SANS RAPPORT.
   - Skills docx, pdf, pptx, xlsx, google-workspace, morning,
     skill-creator : SANS RAPPORT avec ce dépôt.
   - Skill docs : SANS RAPPORT en principe, mais voir B.
   - Skill import-memory : SANS RAPPORT en l'état. Elle écrit dans la
     mémoire claude.ai par des outils memory_*, absents de cette session.
     Elle ne s'exécute que sur demande. Voir les Écarts.
   - Plugins et places de marché : SANS RAPPORT, aucun installé.

Écarts et surprises
- Les neuf skills de ~/.claude/skills/synced/ ne sont pas déposées à la
  main. Elles viennent du compte claude.ai et sont resynchronisées par
  Claude Code : le manifeste a été touché à 19:56 aujourd'hui. Les
  supprimer localement serait vraisemblablement sans effet durable. Leur
  liste se gère côté compte, pas dans ~/.claude/.
- Les connecteurs claude.ai sont actifs dans cette session (Claude Docs,
  Google Drive, Gmail), mais ne figurent dans aucun fichier local :
  ~/.claude.json ne déclare aucun serveur MCP. Eux aussi viennent du
  compte, pas de la machine. Ils agissent sur toutes les sessions, comme
  la configuration personnelle.
- La skill import-memory touche à la mémoire de claude.ai, que
  methode-de-travail.md (ligne 159) déclare n'être « pas un support des
  règles ». Ce n'est pas une contradiction : la skill reste inerte tant
  qu'on ne l'invoque pas. Je le signale seulement parce que la consigne
  demandait tout réglage de mémoire.
- ~/.claude/projects/ (2026-07-25) contient les transcriptions de
  session. CLAUDE.md les cite comme mesure qui tranche. Je n'en ai pas
  parcouru le contenu, parce que la consigne ne le demandait pas.
- Deux de mes sorties de liste, trop longues, ont été enregistrées
  automatiquement par l'outil dans
  ~/.claude/projects/-home-spheres-ecolibre-sgdt/<session>/tool-results/.
  Ce sont des listes de fichiers sans secret. Ce sont les seules
  écritures de la session, faites par l'outillage et non par moi.
- Rien d'autre hors du dépôt n'a été examiné, par exemple
  /etc/claude-code/ (réglages gérés) ou les variables d'environnement.

A. Contexte : la configuration personnelle est propre et concorde avec le
   dépôt. Les seuls éléments qui agissent sur toutes les sessions sans
   historique viennent du compte claude.ai (skills et connecteurs), pas
   de fichiers locaux.
   Question : faut-il consigner cet état de référence quelque part ?
   Suggestion : oui, en deux ou trois lignes dans CLAUDE.md, par une
   consigne ultérieure : pas de ~/.claude/CLAUDE.md, ~/.claude/settings.json
   limité à la mémoire désactivée plus l'affichage, skills et connecteurs
   venant du compte. Un prochain inventaire pourra s'y comparer.

B. Contexte : la skill docs et le connecteur Claude Docs ont pour règle de
   produire un document claude.ai dès qu'on demande un rapport ou un
   document. CLAUDE.md, lui, veut que tout rapport destiné à une
   conversation s'écrive dans travaux/.
   Question : faut-il écrire noir sur blanc que CLAUDE.md l'emporte sur
   cette skill ?
   Suggestion : oui, une ligne dans CLAUDE.md, section travaux/ : « Un
   rapport ou un document s'écrit dans travaux/, jamais par la skill docs
   ni par un connecteur de documents. » En pratique, CLAUDE.md l'emporte
   déjà, mais l'écrire évite qu'une consigne ambiguë bascule vers un
   document en ligne.
```

## Modifications

Commit `b2b7ba2` — `[Correctif] Configuration personnelle de Claude Code —
règle et constat du 4 octobre`.

- **Étape 1 — `CLAUDE.md`**, section « Garde-fous d'exécution (dépôt git) »,
  puce « Les permissions vont dans `.claude/settings.json`… » :
  - P1 : le titre en gras couvre désormais aussi la configuration
    personnelle (`~/.claude/settings.json`, `~/.claude.json`) ;
  - P2 : la phrase ajoutée en fin de puce porte le constat du 4 octobre
    (aucune autorisation, aucun hook, aucun serveur MCP).
- **Étape 2 — `CLAUDE.md`**, section « Dossier `travaux/` » : le paragraphe
  P3 (« Ni la skill docs ni un connecteur de documents ne remplacent
  `travaux/`. ») est ajouté après le paragraphe « Tout fichier destiné à
  être lu… ».
- **Étape 3 — `installation-nouveau-poste.md`** : le paragraphe P4 (« La
  configuration personnelle de Claude Code ne porte aucune autorisation. »)
  est ajouté après le paragraphe sur la mémoire automatique désactivée.

Vérifications :

- Le texte de chaque fichier, retours à la ligne retirés, contient P1, P2,
  P3 et P4 mot pour mot (script de vérification du scratchpad, lecture
  seule).
- `git diff --stat` avant le commit : `CLAUDE.md | 14 ++++++++++++--`,
  `installation-nouveau-poste.md | 9 +++++++++`, soit 21 insertions et
  2 suppressions. Les deux suppressions sont les deux lignes de la puce
  d'étape 1 dont le titre change ; rien d'autre n'est touché.
- Le nombre de lignes de plus de 80 caractères dans `CLAUDE.md` n'a pas
  changé : 17 avant, 17 après.
- `.claude/settings.local.json` : aucune règle, au début comme à la fin.

## Écarts et surprises

- **Une ligne fusionnée par le premier remplacement, corrigée avant le
  commit.** Le remplacement de l'étape 1 avait joint deux lignes de la puce
  en une ligne de 99 caractères. Le `git diff` l'a montré, et la ligne a été
  repliée avant le commit. Effet résiduel : la puce garde deux lignes plus
  courtes que la largeur habituelle (« Claude Code (…).** Le fichier » et
  « à la documentation dans »). Le rendu markdown n'est pas affecté. Je n'ai
  pas replié la puce entière, pour ne pas étendre le diff au-delà des
  modifications demandées.
- Les six fichiers non suivis de `travaux/` présents en début de session
  (`helianthi-insee.md`, `notes-fusion.md`, `rangs-correction.md`,
  `rangs-separateur.md`, `remise-a-niveau-6-septembre.md`,
  `wanted-by-etat.md`) sont laissés tels quels, hors commit : la consigne ne
  les visait pas.
- La suggestion A de l'inventaire est traitée par le paragraphe P4, et la
  suggestion B par le paragraphe P3, dans la section `travaux/` comme
  suggéré. Le constat daté va dans `installation-nouveau-poste.md` et non
  dans `CLAUDE.md`, ce qui diffère de la suggestion A : c'est la décision
  de la consigne.
