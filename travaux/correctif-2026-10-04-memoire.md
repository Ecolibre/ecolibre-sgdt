# Correctif du 4 octobre 2026 — mémoire automatique vidée

Hors lot. Consigne : vider la mémoire automatique de Claude Code pour ce
dépôt, et inscrire dans `CLAUDE.md` qu'elle reste vide. Aucune écriture sur
le wiki.

## Étape 0 — Relevé du fichier local (début)

`.claude/settings.local.json` ne porte aucune règle :

```
{
  "permissions": {
    "allow": [],
    "deny": []
  }
}
```

## Étape 1 — Contenu du dossier de mémoire

`~/.claude/projects/-home-spheres-ecolibre-sgdt/memory/` contenait
exactement les sept fichiers relevés à la clôture du lot 34, et rien d'autre
(`ls -la`) :

| Fichier | Taille | Date |
|---|---|---|
| `MEMORY.md` | 863 | 28 juillet |
| `lot1_actions_ab_done.md` | 2641 | 25 juillet |
| `lot5_actions_done.md` | 3011 | 28 juillet |
| `referenced_item_miscategorization.md` | 2717 | 25 juillet |
| `wiki_editinterface_blocker.md` | 1660 | 25 juillet |
| `wiki_namespaces.md` | 747 | 25 juillet |
| `wiki_protection_state.md` | 1369 | 25 juillet |

## Étape 2 — Suppression

Les sept fichiers ont été supprimés par un `rm` les nommant un à un (aucun
joker). Contrôle : `ls -A` du dossier compte 0 entrée. Le dossier lui-même
est conservé, vide. Ces fichiers étant hors du dépôt, la suppression n'est
pas réversible par git.

## Étape 3 — `CLAUDE.md`

Texte T1 ajouté à la fin du paragraphe « **Ce fichier l'emporte sur ta
mémoire automatique.** », replié à la largeur du fichier, sans changer un
mot. `git diff --word-diff` ne montrait que l'ajout de T1.

Commit `dc6886c` — `[Correctif] CLAUDE.md — mémoire automatique vide` :

```
 CLAUDE.md | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
```

La suppression comptée est la dernière ligne de l'ancien paragraphe, réécrite
pour accueillir le début de T1 ; son texte d'origine est intact.

## Étape 4 — Relevé du fichier local (fin)

`.claude/settings.local.json` ne porte toujours aucune règle (contenu
identique à l'étape 0).

## Écarts et surprises

- **L'index de mémoire était chargé au début de cette session.** Le contexte
  de démarrage contenait encore `MEMORY.md` (les six pointeurs de juillet).
  Il n'a été suivi en rien ; il ne le sera plus aux sessions suivantes,
  le fichier n'existant plus.
- **La fonction de mémoire automatique reste active dans l'outil.** Les
  instructions système de Claude Code invitent toujours à y écrire. La
  règle ajoutée à `CLAUDE.md` l'emporte et je ne l'alimenterai pas, mais
  rien de technique n'empêche une session future d'y écrire.

  **A.** Contexte : la mémoire est vide par décision, mais l'outil peut la
  remplir à nouveau. Question : faut-il chercher à désactiver la mémoire
  automatique par réglage, plutôt que par la seule règle de `CLAUDE.md` ?
  Suggestion : oui, dans un prochain correctif — vérifier d'abord dans la
  documentation de Claude Code le nom exact du réglage (je ne l'affirme pas
  de mémoire), puis le placer dans `.claude/settings.json`, documenté dans
  `installation-nouveau-poste.md`. En attendant, le contrôle utile est un
  `ls -A` du dossier en fin de tâche, comme pour le fichier local.
- Six fichiers non suivis préexistaient dans `travaux/`
  (`helianthi-insee.md`, `notes-fusion.md`, `rangs-correction.md`,
  `rangs-separateur.md`, `remise-a-niveau-6-septembre.md`,
  `wanted-by-etat.md`). Hors du périmètre de cette consigne : ni lus, ni
  commités.
