# Correctif du 4 octobre 2026 — mémoire automatique désactivée par réglage

Hors lot. Suite du correctif `travaux/correctif-2026-10-04-memoire.md` (point
A de ses « Écarts et surprises ») : la règle de `CLAUDE.md` est doublée d'un
réglage, que l'outil applique de lui-même. Aucune écriture sur le wiki.

## Étape 0 — Relevés (début)

`.claude/settings.local.json` ne porte aucune règle :

```
{
  "permissions": {
    "allow": [],
    "deny": []
  }
}
```

`~/.claude/projects/-home-spheres-ecolibre-sgdt/memory/` : vide (`ls -lA`
→ `total 0`).

## Étape 1 — `.claude/settings.json`

Clé `"autoMemoryEnabled": false` ajoutée au premier niveau de l'objet, avant
`permissions` (seule autre clé de premier niveau). Une ligne ajoutée, rien
d'autre changé.

- JSON valide : relu par `json.load`, `autoMemoryEnabled = False`.
- Comptes de permissions — avant : `deny 17 ask 4 allow 42` ; après :
  `deny 17 ask 4 allow 42`. Identiques.

## Étape 2 — `installation-nouveau-poste.md`

T1 ajouté, replié à la largeur du fichier, sans changer un mot. Placement :
voir « Écarts et surprises ».

## Étape 3 — `CLAUDE.md`

T2 ajouté à la fin du paragraphe « **Ce fichier l'emporte sur ta mémoire
automatique.** », sans changer un mot.

## Étape 4 — Diff et commit

`git diff --word-diff` ne montrait que les trois ajouts (la clé JSON, T1, T2).

Commit `50b902b` — `[Correctif] Mémoire automatique désactivée par réglage` :

```
 .claude/settings.json         | 1 +
 CLAUDE.md                     | 3 ++-
 installation-nouveau-poste.md | 8 ++++++++
 3 files changed, 11 insertions(+), 1 deletion(-)
```

La suppression comptée dans `CLAUDE.md` est la dernière ligne du paragraphe,
réécrite pour accueillir le début de T2 ; son texte d'origine est intact.

## Étape 5 — Relevés (fin)

`.claude/settings.local.json` : aucune règle (contenu identique à l'étape 0).
Dossier de mémoire : toujours vide.

## Écarts et surprises

- **Placement de T1.** Le passage qui commence par « **`.claude/settings.local.json`
  doit rester vide** » forme, en Markdown, un seul bloc avec la liste à puces
  qui le suit sans ligne vide, puis se conclut par un court paragraphe
  séparé (« Le fichier a été vidé le jour même… documentée dans ce
  tableau. »). Insérer T1 juste après la première phrase-paragraphe l'aurait
  séparé de sa liste et de sa conclusion. T1 a donc été placé après la
  conclusion, à la fin de l'ensemble consacré au fichier local, avant le
  paragraphe « Les confirmations que Claude Code affiche… ». À déplacer si
  l'intention était autre.
- **L'effet du réglage n'est pas vérifiable dans cette session.** Les
  réglages sont lus au lancement de Claude Code ; la session en cours a
  démarré avant la modification. La mesure qui tranchera : à la prochaine
  session, vérifier que le contexte de démarrage ne contient plus de bloc de
  mémoire automatique, et que le dossier de mémoire reste vide en fin de
  tâche.
- Les six fichiers non suivis préexistants de `travaux/`, déjà signalés au
  correctif précédent, sont toujours là ; ni lus, ni commités.
