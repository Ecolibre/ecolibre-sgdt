# Lot 21, tâche 38 — correction de la règle ajoutée à la tâche 37

Date : 15 octobre 2026 (horloge UTC du conteneur, 19:22 à 19:27). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

Une seule écriture, sur `CLAUDE.md` : la puce « Après la modification d'une page transclue… », en tête de la section « Leçons de méthode (wiki et outillage) », remplacée en entier par le texte de la consigne. Aucune page du wiki, aucun autre fichier du dépôt que `CLAUDE.md` et ce rapport.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas.

**Étape 3 — le remplacement.** Le texte cherché et le texte de remplacement ont été écrits dans deux fichiers du scratchpad, à l'identique de la consigne, indentation de deux espaces comprise. Une première ligne de Python a compté sans écrire : **1 occurrence**, à partir de la ligne 342, 8 lignes cherchées pour 9 de remplacement. Une seconde n'a écrit que sur cette occurrence unique (« occurrences : 1 », « ecrit »).

**Étape 4 — vérification.** `git diff --numstat` : `8	7	CLAUDE.md`. Ce sont les 8 lignes ajoutées et les 7 retirées de la puce : sa troisième ligne, identique dans les deux versions, reste en contexte. Le titre de la section et la puce suivante, sur `[[ ]]`, sont inchangés. `git diff` de `CLAUDE.md`, tel quel :

```
diff --git a/CLAUDE.md b/CLAUDE.md
index a037f00..f010ec4 100644
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -339,14 +339,15 @@ sur la banque physique est notée ici. À traiter avec le lot de numérotation.
 
 ## Leçons de méthode (wiki et outillage)
 
-- **Après la modification d'une page transclue, les pages qui la transcluent
-  montrent l'état d'avant pendant plusieurs minutes.** Ne rien conclure de
+- **Après la modification d'une page transclue, le retraitement des pages qui
+  la transcluent est différé de plusieurs minutes.** Ne rien conclure de
   leurs faits tant que leur `touched`, lu par `action=query&prop=info`, n'a
-  pas dépassé l'heure de la modification : le retraitement est différé, et
-  rien ne distingue des faits périmés de faits à jour. Mesuré le 15 octobre
-  2026 sur une propriété transcluant un bloc de déclaration d'unités, dont
-  les faits n'ont changé qu'au bout de 4 min 29 s. Le critère est le
-  `touched`, pas la durée : une seule mesure ne fait pas une loi.
+  pas dépassé l'heure de la modification : rien ne distingue des faits
+  périmés de faits à jour. Mesuré le 15 octobre 2026 sur une propriété
+  transcluant un bloc de déclaration d'unités, dont le `touched` n'a dépassé
+  l'heure de la modification qu'au bout de 4 min 29 s ; ses faits, identiques
+  avant et après, ne pouvaient pas le montrer. Le critère est le `touched`,
+  pas la durée : une seule mesure ne fait pas une loi.
 
 - **Un retour à la ligne à l'intérieur de `[[ ]]` casse silencieusement un
   lien MediaWiki.** Aucune erreur d'API à l'écriture, mais le lien est absent
```

Il ne montre que cette puce modifiée, et rien d'autre.

**Étape 5 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Questions posées hors consigne

Aucune question reçue hors consigne. La réponse au point A de la tâche 37 figure en tête de cette consigne et a été appliquée. Une question nouvelle à Cyril, point A ci-dessous.

**A.** Contexte : la règle corrigée décrit maintenant exactement la mesure. Une nuance reste, que j'avais notée en réserve à la tâche 36 : le `touched` date l'**invalidation** de la page dépendante, non la **mise à jour de ses données SMW**. Dans MediaWiki, après la modification d'une page transclue, ce sont deux travaux distincts de la file : `htmlCacheUpdate` met à jour le `touched` des pages qui la transcluent, `refreshLinks` les retraite. C'est une connaissance du logiciel, non vérifiée sur cette installation. Leur ordre d'exécution n'y est pas mesuré. « Ne rien conclure tant que le `touched` n'a pas dépassé l'heure de la modification » est donc une condition **nécessaire**, dont rien ne prouve qu'elle soit suffisante. À la tâche 36, la conclusion tenait parce qu'un aperçu frais du rendu (`action=parse` avec `title=` et `text=`, sans sauvegarde) montrait des déclarations identiques, et que la file était estimée vide. Question : faut-il le dire dans la règle ? Suggestion : ajouter, dans une tâche ultérieure, une phrase du type « Condition nécessaire, pas suffisante : le `touched` date l'invalidation, pas la mise à jour des données ; en cas de doute, comparer les faits à un aperçu frais du rendu de la page. »

## Écarts et surprises

1. **Nuance sur la portée du `touched`**, signalée en A ; le texte de la consigne a été écrit tel quel.
2. **Outils** : deux lignes de Python, l'une qui compte sans écrire, l'autre qui n'écrit qu'à une occurrence exacte ; fichiers de chaînes dans le scratchpad. Le rapport a été assemblé par substitution d'un repère, pour citer le `git diff` octet pour octet.
3. `origin/main` n'avait pas bougé depuis la tâche 37 (`ee35501`) : aucune avance rapide nécessaire avant le commit.
