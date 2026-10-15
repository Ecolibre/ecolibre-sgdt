# Lot 21, tâche 39 — dernière retouche de la règle de retraitement

Date : 15 octobre 2026 (horloge UTC du conteneur, 19:51 à 19:55). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

Une seule écriture, sur `CLAUDE.md` : la puce « Après la modification d'une page transclue… », en tête de la section « Leçons de méthode (wiki et outillage) », remplacée en entier par le texte de la consigne. Elle porte désormais la réserve sur la portée du `touched` et la conduite à tenir selon que la modification doit ou non changer un fait. Aucune page du wiki, aucun autre fichier du dépôt que `CLAUDE.md` et ce rapport.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas.

**Étape 3 — le remplacement.** Le texte cherché et le texte de remplacement ont été écrits dans deux fichiers du scratchpad, à l'identique de la consigne, indentation de deux espaces comprise. Une première ligne de Python a compté sans écrire : **1 occurrence**, à partir de la ligne 342, 9 lignes cherchées pour 15 de remplacement. Une seconde n'a écrit que sur cette occurrence unique (« occurrences : 1 », « ecrit »).

**Étape 4 — vérification.** `git diff --numstat` : `7	1	CLAUDE.md`. Les huit premières lignes de la puce sont inchangées. La neuvième s'allonge de la première phrase ajoutée, et six lignes la suivent. La puce suivante, sur `[[ ]]`, reste en contexte, intacte. `git diff` de `CLAUDE.md`, tel quel :

```
diff --git a/CLAUDE.md b/CLAUDE.md
index f010ec4..069beb1 100644
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -347,7 +347,13 @@ sur la banque physique est notée ici. À traiter avec le lot de numérotation.
   transcluant un bloc de déclaration d'unités, dont le `touched` n'a dépassé
   l'heure de la modification qu'au bout de 4 min 29 s ; ses faits, identiques
   avant et après, ne pouvaient pas le montrer. Le critère est le `touched`,
-  pas la durée : une seule mesure ne fait pas une loi.
+  pas la durée : une seule mesure ne fait pas une loi. Et c'est une condition
+  nécessaire, non suffisante : le `touched` date l'invalidation de la page,
+  la mise à jour du magasin SMW est un autre travail de la file, et leur
+  ordre n'est pas mesuré. Quand la modification doit changer un fait, c'est
+  l'apparition de ce changement qui fait foi, et non le `touched` ; quand
+  elle ne doit en changer aucun, aucune lecture ne prouve rien, et il faut
+  l'écrire au lieu de conclure.
 
 - **Un retour à la ligne à l'intérieur de `[[ ]]` casse silencieusement un
   lien MediaWiki.** Aucune erreur d'API à l'écriture, mais le lien est absent
```

Il ne montre que cette puce modifiée, et rien d'autre.

**Étape 5 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Questions posées hors consigne

Aucune question reçue hors consigne. La réponse au point A de la tâche 38 figure en tête de cette consigne et a été appliquée. Aucune question nouvelle : la puce est close.

## Écarts et surprises

1. **Précision pour le récit, sans rouvrir la règle.** La réponse au point A de la tâche 38 écarte l'aperçu frais au motif qu'il « dépend du cache de rendu ». L'aperçu fait à la tâche 36 était un `action=parse` avec `text=` (la source de la page) et `title=` : MediaWiki analyse alors le texte à neuf, sans passer par le cache de rendu, qui ne sert qu'aux analyses d'une page enregistrée. L'autre motif reste entier : un rendu montre ce qu'un retraitement produirait, pas ce que contient le magasin SMW. Rien n'est demandé, la puce restant close comme décidé.
2. **Outils** : deux lignes de Python, l'une qui compte sans écrire, l'autre qui n'écrit qu'à une occurrence exacte ; fichiers de chaînes dans le scratchpad. Le rapport a été assemblé par substitution d'un repère, pour citer le `git diff` octet pour octet.
3. `origin/main` n'avait pas bougé depuis la tâche 38 (`9d05a3d`) : aucune avance rapide nécessaire avant le commit.
