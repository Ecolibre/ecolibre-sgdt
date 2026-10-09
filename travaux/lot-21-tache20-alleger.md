# Lot 21, tâche 20 — Alléger la preuve de la règle de réécriture

Rapport de l'exécuteur, 9 octobre 2026. Aucune écriture sur le wiki. Seul fichier modifié : `methode-de-travail.md`.

## Étape 0 — État du dépôt

- `git status --short` : vide, aucun fichier suivi modifié.
- `travaux/lot-21-tache20-alleger.md` : absent avant la tâche.
- Dernier commit : `784fcc7 [Protocole] Plafond d'enjeu fort : par réponse, et rétrogradation limitée aux points ouverts` (Cyril, 9 octobre 2026, 14 h 05).
- `methode-de-travail.md` **a été touché depuis la tâche 19** (`e67758b`, 13 h 27), par ce commit `784fcc7`. Il modifie une seule ligne, le paragraphe sur les deux points d'enjeu fort par réponse. Il ne touche ni le paragraphe de la règle de réécriture ni l'ancre.
- Ancre : trouvée une fois et une seule, ligne 183.
- `.claude/settings.local.json` : `allow` et `deny` vides, au début comme à la fin de la tâche.

## Vérification a — Les trois mesures, avant écriture

Commande (titre encodé, `bin/wiki-api.sh` ne réencode pas ; le script ajoute `formatversion=2`) :

```
bin/wiki-api.sh "action=parse&page=Limites%20connues%20du%20Syst%C3%A8me%20de%20Gestion%20de%20Donn%C3%A9es%20Techniques&prop=wikitext|revid&format=json"
```

Puis lecture du wikitexte et sélection des lignes commençant par `# `. La 59e est l'entrée 59.

Résultat sur la révision **1480** :

| Mesure | Annoncé | Mesuré |
|---|---|---|
| Nombre d'entrées | — | 65 |
| Médiane des longueurs | 718 | 718 |
| Longueur de l'entrée 59 | 1 896 | 1 896 |
| Jours distincts cités dans l'entrée 59 | 1 | 1 (le 9) |
| Passages en gras dans l'entrée 59 | — | 4 |

Les trois chiffres sont confirmés, et l'écriture de l'étape 1 a eu lieu ensuite.

Réserve sur la mesure des jours : l'expression employée, `(\d+)(?:er)? octobre 2026`, exigeait l'année. Sur la révision 1480, elle donne le bon résultat, car les deux mentions du 9 octobre portent l'année. Sur la révision 1477, elle aurait sous-compté en silence (voir « Écarts et surprises »).

Mesures de la révision **1477** (avant la réécriture), prises par Cyril en lecture anonyme, `formatversion=2`, avec la même définition d'entrée : 65 entrées, médiane 718, entrée 59 à 2 567 caractères, 4 passages en gras. L'entrée cite sept dates, dont deux sans l'année, pour **cinq jours distincts** : les 4, 5, 6, 8 et 9 octobre. Je n'ai pas refait cette mesure : Cyril a demandé de ne rien relancer.

## Étape 1 — Diff de `methode-de-travail.md`

```
@@ -180,7 +180,7 @@
-[…] l'entrée 59 avait atteint 2 567 caractères contre 718 pour l'entrée médiane, citait quatre dates et portait quatre passages en gras : elle racontait l'historique de ses rédactions au lieu d'énoncer ce qui est su, et chaque couche contredisait un peu la précédente. Sa troisième correction, […]
+[…] l'entrée 59 avait atteint 2 567 caractères contre 718 pour l'entrée médiane, et citait cinq jours distincts : elle racontait l'historique de ses rédactions au lieu d'énoncer ce qui est su, et chaque couche contredisait un peu la précédente. Réécrite, elle est tombée à 1 896 caractères et ne cite plus qu'une date. Sa troisième correction, […]
```

En mots, d'après `git diff --word-diff` :

- `[-citait quatre dates-]` et `[-portait quatre passages en gras-]` ont été remplacés par `{+citait cinq jours distincts+}` ;
- la phrase `{+Réécrite, elle est tombée à 1 896 caractères et ne cite plus qu'une date.+}` a été ajoutée.

`git diff --stat` : 1 fichier, 1 insertion, 1 suppression. Rien d'autre ne change.

## Vérification b — Cohérence du paragraphe

J'ai relu le paragraphe entier (ligne 183) après modification.

- **Aucun chiffre restant ne manque à distinguer les deux états.** La longueur passe de 2 567 à 1 896 caractères, les jours cités de 5 à 1. La médiane de 718 n'est pas un symptôme : c'est la référence, et elle vaut 718 aux deux révisions (mesure de Cyril sur 1477, la mienne sur 1480). « Contre 718 pour l'entrée médiane » est donc exact, quelle que soit la révision lue.
- **Toutes les affirmations sont vérifiables.** Les chiffres d'avant se vérifient sur la révision 1477, ceux d'après sur la 1480. Les dates des retouches se vérifient dans l'historique de la page : création le 6 octobre, corrections du 8 octobre (révision 1471, tâche 15) et du 9 octobre (révision 1477, tâche 18), réécriture d'un bloc le 9 octobre (révision 1480, tâche 19).
- **Ordre du récit.** La phrase ajoutée, « Réécrite, elle est tombée à 1 896 caractères… », annonce le résultat de la réécriture. La phrase suivante, « Sa troisième correction, le 9 octobre, l'a réécrite d'un bloc », vient ensuite seulement. Ce n'est pas faux, mais la seconde reprend en partie la première. Je n'ai rien changé : la consigne fixait le texte. Voir la question B.

## Vérification c — Les anciens chiffres ailleurs

Recherche de « quatre passages en gras », « quatre dates » et « 2 567 » dans `methode-de-travail.md`, `CLAUDE.md`, `pages/Limites_connues.txt` et `pages/Lot_21.txt` (les quatre fichiers existent) :

- « 2 567 » : `methode-de-travail.md`, ligne 183 uniquement, dans la phrase réécrite, où il reste voulu (c'est l'état d'avant).
- « quatre passages en gras » : n'apparaît nulle part.
- « quatre dates » : n'apparaît nulle part.

Je n'ai rien corrigé hors de l'étape 1.

## Écarts et surprises

1. **Mon expression régulière des jours sous-comptait en silence.** `(\d+)(?:er)? octobre 2026` exige l'année. Sur la révision 1477, elle aurait rendu 4 jours, alors que l'entrée en cite 5, dont le 5 octobre sans l'année. Ce chiffre plausible et faux m'aurait fait corriger une phrase juste. Cyril l'a relevé avant tout usage sur la 1477. L'expression du script de mesure du scratchpad est maintenant `(\d+)(?:er)? octobre(?: 2026)?`. Sur la 1480, la mesure qui a servi à la vérification a reste juste, puisque les deux mentions y portent l'année.
2. **Le compte de la consigne de contexte dépendait lui aussi de l'expression.** La consigne demandait les jours « correspondant à l'expression "<nombre> octobre 2026" », donc année comprise. Prise à la lettre, elle donne 4 jours sur la 1477, et non 5. Le chiffre de 5 inscrit dans la règle compte les jours cités, avec ou sans l'année. C'est celui-là qui est juste. L'écart 3 de la tâche 19 le disait déjà : ce chiffre dépend de la façon de compter.
3. **Commande refusée par Cyril.** J'ai voulu mesurer la révision 1477 en une seule commande composite. Elle lançait le script du scratchpad sans en montrer le contenu dans le même message, contrairement à la règle de `CLAUDE.md`. Elle contenait un `grep` sur `/dev/null`, sans objet, qui a déclenché la demande de confirmation. Elle contenait aussi un python en ligne qui accédait à `['parse']['wikitext']['*']`, la forme de `formatversion=1`, alors que `bin/wiki-api.sh` impose `formatversion=2` par défaut : il aurait levé `TypeError`. Le script de mesure acceptait les deux formes, ce qui m'a caché le défaut du python en ligne. Le script lit désormais `parse.wikitext` comme une chaîne, en `formatversion=2`.
4. `methode-de-travail.md` a été modifié par le commit `784fcc7` entre la tâche 19 et celle-ci, sans toucher au paragraphe concerné.

## Échanges avec Cyril hors consigne

- Refus de la commande composite décrite à l'écart 3, avec demande de montrer le contenu du script et une commande corrigée sans la lancer. J'ai fait les deux.
- Cyril a fourni les mesures de la révision 1477 (ci-dessus) et demandé de ne rien relancer. Il a demandé de corriger l'expression régulière avant tout autre usage, ce qui est fait, puis de reprendre la vérification b avec ces chiffres.
- Cyril a proposé, à titre facultatif, d'écrire « contre 718 pour l'entrée médiane à la même révision ». Je ne l'ai pas fait : la médiane est la même aux deux révisions, la phrase est donc exacte telle quelle, et la consigne demandait que rien d'autre ne change. Voir la question A.

## Questions

**A.** Cyril a proposé d'écrire « contre 718 pour l'entrée médiane à la même révision ». La phrase est exacte sans cet ajout, puisque la médiane vaut 718 aux révisions 1477 et 1480. Faut-il l'ajouter quand même ? Ma suggestion : non. La règle s'est annoncée à sa dernière retouche, et un ajout qui ne corrige rien en ouvrirait une troisième.

**B.** La phrase ajoutée, « Réécrite, elle est tombée à 1 896 caractères… », précède « Sa troisième correction, le 9 octobre, l'a réécrite d'un bloc », qui la reprend en partie. Faut-il réordonner ? Ma suggestion : laisser en l'état pour la même raison, et ne fusionner les deux phrases qu'à l'occasion d'une reprise de fond du paragraphe, s'il y en a une un jour.
