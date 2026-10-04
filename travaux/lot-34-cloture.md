# Lot 34 — Clôture : derniers ajouts aux fichiers de règles, page du lot, état clos

Session du 4 octobre 2026, exécuteur Claude Code. Consigne « Pour Claude Code. Lot 34, clôture ». Ce rapport couvre les étapes 0 à 7 ; l'étape 9 (état clos) vient après lui, puisqu'elle cite son permalien.

## Étape 0 — Relevé du fichier local (début)

`.claude/settings.local.json`, lu par `cat` puis par `python3` (et non par l'outil de lecture de fichier, conformément à la leçon ajoutée à l'étape 2) :

```
{
  "permissions": {
    "allow": [],
    "deny": []
  }
}
```

Aucune règle. Fichier daté du 3 octobre 2026, 13:51:43 +0200, inchangé depuis le correctif.

`git status` au départ : seuls les six fichiers non suivis connus de `travaux/` (`helianthi-insee.md`, `notes-fusion.md`, `rangs-correction.md`, `rangs-separateur.md`, `remise-a-niveau-6-septembre.md`, `wanted-by-etat.md`). Aucune autre modification. `main` à jour avec `origin/main` après `git fetch`.

## Étape 1 — methode-de-travail.md, cinq modifications

Les cinq passages à repérer ont été trouvés mot pour mot (`grep -F`) :

| Repère | Ligne avant écriture | Modification |
|---|---|---|
| 1a — « et l'étape d'état de la tâche suivante qui confirme. » | 119 | M1 ajouté après |
| 1b — « le dire à Cyril tout de suite. » | 161 | M2 (deux paragraphes) ajouté après |
| 1c — ligne `~~~` fermant le bloc d'amorçage | 155 | M3 ajouté après |
| 1d — « Une autorisation permanente seulement sur décision explicite, avec son motif dans la consigne. » | 93 | remplacée par M4a |
| 1e — « Le contrôle qui fait foi est la vérification après coup, que chaque consigne exige. » | 97 | remplacée par M4b |

Chaque repère était unique dans le fichier. M4b commençant par la phrase qu'il remplace, la modification 1e se lit dans le diff comme un ajout en fin de paragraphe.

## Étape 2 — CLAUDE.md, trois modifications

- 2a : C1 ajouté après le paragraphe « **Tes questions à Cyril** », en fin de section « ## Ton rôle ».
- 2b : C2 ajouté juste après la puce « - **Ne jamais proposer d'ajouter à `allow` … », sans ligne vide.
- 2c : les deux puces C3 ajoutées après la puce se terminant par « sur *Notes en attente de rangement*. », chacune précédée d'une ligne vide.

Lignes repliées à 78 colonnes au plus, deux espaces de retrait pour la suite d'une puce. Contrôle mot pour mot : un script recolle les lignes repliées et cherche chacun des quatre textes fournis (C1, C2, les deux puces de C3) dans le résultat — les quatre sont `OK`. Aucune ligne ajoutée ne dépasse 78 caractères.

## Étape 3 — Diff et commit

`git diff --stat` avant commit : `CLAUDE.md | 27 +++`, `methode-de-travail.md | 12 ++++++++--`, soit 37 insertions et 2 suppressions. Les deux suppressions sont les lignes 93 et 97 de methode-de-travail.md (1d, 1e), réécrites ; les autres modifications sont des ajouts purs. Le diff `-U0` de methode-de-travail.md montre exactement cinq blocs, celui de CLAUDE.md trois. Rien d'autre.

Commit `861bdd46c55f0641de0439c1b7d428cd7b2f99a0` — `[Lot 34][Clôture] methode-de-travail.md et CLAUDE.md — mémoires, fichier local vide, limites mesurées, deux leçons` :

```
 CLAUDE.md             | 27 +++++++++++++++++++++++++++
 methode-de-travail.md | 12 ++++++++++--
 2 files changed, 37 insertions(+), 2 deletions(-)
```

Deux suppressions attendues, deux constatées.

## Étape 4 — Page du lot

`Lot 34 — Consignes permanentes et aiguillage des messages` (pageid 561) : révision courante **1369** (création, 3 octobre 2026 01:45 UTC), `protection: []`. Condition remplie.

W1 écrit dans `pages/Lot_34_cloture.txt`, puis publié par `bin/wiki-put.sh` (après `bin/wiki-login.sh`) avec le résumé `[Lot 34][Clôture] Résultats des tests, arbitrages de clôture, idées écartées, inventaire des autorisations fait par correctif`. Résultat : `Success`, 1369 → **1418**, 2026-10-04 12:47:32 UTC.

Le wikitexte relu après écriture est identique au fichier local, au saut de ligne final près (MediaWiki le retire).

## Étape 5 — Vérifications

**a. Diff 1369 → 1418** (calculé par `diff` entre le wikitexte de la révision 1369, sauvegardé avant écriture, et le texte publié) — six endroits, exactement ceux annoncés :

1. « Ce qui est exclu », ligne 21 : la phrase sur l'inventaire « à part » remplacée par le renvoi au correctif (lien externe vers le commit 54a5841).
2. « Ce qui est déjà tranché », ligne 27 : ajout de « à cinq minutes près : GitHub sert le fichier avec ce délai de cache ».
3. Même section, ligne 39 : ajout de la précision du 3 octobre 2026 sur les autorisations.
4. Fin de la même section : trois arbitrages ajoutés (mémoires automatiques ; fichier local ; garde-fou éprouvé en rejouant l'erreur).
5. « Ce qui est écarté, et pourquoi » : cinq idées ajoutées.
6. « Points ouverts » : l'ancien texte (amorçage « reste à éprouver », relecture « après deux lots de plus ») remplacé par « Aucun à la clôture. » et les résultats.

Le comparateur de MediaWiki (`action=compare&fromrev=1369&torev=1418`) affiche quatre blocs au lieu de six : il regroupe les modifications proches (lignes 21 et 27, puis le dernier arbitrage et les idées écartées). Ce n'est pas une modification de plus ou de moins ; le `diff` ligne à ligne ci-dessus est celui qui tranche.

**b. browsebysubject** : `Work_package_number` 34, `Work_package_status` ouvert, `Work_package_opening_date` 2026-10-03, `Work_package_revises` Lot 27 — Conduite du projet, `Work_package_summary` inchangé, `_INST` Lot, trois `_ASK` (les mêmes identifiants de requête qu'avant), `_MDAT` passé à 2026-10-04 12:47:32, `_SKEY`. Aucune propriété nouvelle.

**c. prop=categories** : `Catégorie:Lot` seule. **prop=links** : deux liens, `Gestion des lots` (pageid 484) et `Lot 27 — Conduite du projet` (pageid 540), tous deux existants. Le lien vers le commit est externe et n'apparaît pas dans `prop=links`, comme attendu.

Aucune purge n'a été nécessaire à ce stade.

## Étape 6 — Mémoire automatique de l'exécuteur (lecture seule)

Dossier `~/.claude/projects/-home-spheres-ecolibre-sgdt/memory/`, rien modifié :

| Fichier | Date | Contenu en une ligne |
|---|---|---|
| `MEMORY.md` | 2026-07-28 | Index des six notes ci-dessous. |
| `lot1_actions_ab_done.md` | 2026-07-25 | État des lots 1 et 2 au 25 juillet 2026 (actions A, B, C, E faites ; D bloquée par le droit `editinterface`). |
| `lot5_actions_done.md` | 2026-07-28 | Lot 5 fait ; infobulles Page Forms par `{{#info:}}` ; lot 6 (Base36, `Item_ref`) différé jusqu'à confirmation de Cyril. |
| `referenced_item_miscategorization.md` | 2026-07-25 | Catégorisation parasite par `[[Category:X]]` sans deux-points, trois cas, corrigés le 25 juillet 2026. |
| `wiki_editinterface_blocker.md` | 2026-07-25 | Le compte bot ne peut pas écrire dans l'espace `MediaWiki:`, refus invisible à `prop=info`. |
| `wiki_namespaces.md` | 2026-07-25 | Espaces de noms : 106 = Formulaire, 108 = Concept. |
| `wiki_protection_state.md` | 2026-07-25 | Aucune protection native ; Lockdown installé et invisible à `prop=info`. |

**Aucune règle ne contredit CLAUDE.md ni methode-de-travail.md.** La mémoire n'a pas été écrite depuis le 28 juillet 2026 et ne porte aucune copie des règles de travail. Trois points sont périmés plutôt que contradictoires :

- `lot5_actions_done.md` dit que `wiki-get.sh` ne gère pas `browsebysubject` et qu'un `curl` anonyme direct a été employé, sur autorisation ponctuelle. Le fait est toujours vrai pour `wiki-get.sh`, mais l'outil prévu est aujourd'hui `bin/wiki-api.sh --facts`, et CLAUDE.md encadre les appels hors `bin/`. Une session qui prendrait cette note pour une méthode s'écarterait de CLAUDE.md.
- La même note tient le lot 6 pour « bloqué » en attendant une session de saisie. L'état actuel est celui de CLAUDE.md : corrections n° 1 et 3 ouvertes, à traiter dans un lot dédié.
- Les notes renvoient à `rapport-2026-07-25.md` et `rapport-2026-07-28.md` sans dossier ; ces fichiers vivent aujourd'hui dans `travaux/`, comme le veut CLAUDE.md.

## Étape 7 — Relevé du fichier local (fin des étapes 0 à 7)

Relu par `cat` et `python3` : `{'permissions': {'allow': [], 'deny': []}}`. Aucune règle. Date de modification inchangée (2026-10-03 13:51:43 +0200) : aucune confirmation de cette session n'y a rien inscrit.

## Écarts et surprises

- **Comparateur de MediaWiki, quatre blocs pour six endroits** : voir l'étape 5a. Sans conséquence, mais une vérification qui compterait les blocs de `action=compare` conclurait à tort à un écart.
- **Mémoire automatique périmée sans contradiction** (étape 6) : trois notes décrivent un outillage ou un état antérieur à fin juillet. Rien n'a été modifié, la consigne étant en lecture seule. **A.** Ces notes ne servent plus et l'une d'elles décrit une méthode (`curl` direct) que CLAUDE.md encadre désormais. Faut-il les supprimer ? Suggestion : les supprimer dans une consigne dédiée, puisque la nouvelle règle C1 donne de toute façon le dernier mot au fichier.
- **Fichier local relu par commande, pas par l'outil de lecture**, pour appliquer dès cette tâche la leçon ajoutée à l'étape 2c.
- Aucune autre surprise. Le texte collé commençait bien par « Pour Claude Code. » ; il a été exécuté comme consigne ordinaire.
