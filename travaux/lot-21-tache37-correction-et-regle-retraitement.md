# Lot 21, tâche 37 — une correction de phrase et une règle de vérification

Date : 15 octobre 2026 (horloge UTC du conteneur, 19:15 à 19:22). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

| Document | Avant | Après | Résumé ou commit |
|---|---|---|---|
| Page `Dimension longueur` (pageid 706) | révision 1646, 1 546 octets | révision 1647, 1 548 octets (2026-10-15T19:16:42Z) | `[Lot 21][Tâche 37] Correction : le bloc est à la fin de cette section, et non juste sous ce paragraphe` |
| Fichier `CLAUDE.md` | — | + 9 lignes, 0 suppression | commité avec ce rapport |

Aucune autre page du wiki, aucun autre fichier du dépôt.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas.

**Vérification préalable des deux chaînes, avant toute écriture.** La consigne demande de s'arrêter « sans rien écrire » si l'une des deux chaînes manque. Les deux ont donc été comptées avant la première écriture :
- dans la copie de `Dimension longueur`, `une ligne par unité, juste sous ce paragraphe.` : **1 occurrence**, en ligne 10 ;
- dans `CLAUDE.md`, le titre `## Leçons de méthode (wiki et outillage)`, la ligne vide et la première ligne de la puce sur `[[ ]]` : **1 occurrence**, à partir de la ligne 340.

**Étape 3 — correction de `Dimension longueur`.**
- Copie lue dans le scratchpad, hors du dépôt : révision 1646, 1 546 octets, 22 sauts de ligne, `protection: []`. Elle est identique octet pour octet à la version publiée par la tâche 36.
- Remplacement fait par `sed`, chaîne littérale et point échappé. Copie prévue : 1 548 octets (+ 2 octets, soit « à la fin de cette section. », 27 octets, à la place de « juste sous ce paragraphe. », 25 octets), 22 sauts de ligne. La nouvelle phrase y figure une fois.
- Révision revérifiée juste avant l'écriture (19:16:37 UTC) : toujours 1646. `bin/wiki-login.sh` : `Success Cywil`.
- Écriture sans `--createonly` : révision **1647**.
- Source publiée relue : 1 548 octets, **identique octet pour octet à la copie prévue** (`cmp`).
- Faits de la page après écriture : `Main_unit`, les deux `Preferred_label`, `_INST` vers `Dimension`, le nouveau `_MDAT`. Pas de `_ERRC`.

Diff entre la copie d'origine (révision 1646) et la version publiée (révision 1647), tel quel, **un seul endroit** :

```
10c10
< Ce bloc est transclus par chaque propriété de grandeur de cette dimension, qui reçoit ainsi la liste complète des unités admises sans la recopier. Il est écrit à la main, une ligne par unité, juste sous ce paragraphe. Il n'apparaît pas à l'affichage : des balises l'empêchent de s'exécuter sur cette page, où Semantic MediaWiki refuse les déclarations d'unités et les compterait comme des erreurs. Pour le lire, ouvrir cette page en modification.
---
> Ce bloc est transclus par chaque propriété de grandeur de cette dimension, qui reçoit ainsi la liste complète des unités admises sans la recopier. Il est écrit à la main, une ligne par unité, à la fin de cette section. Il n'apparaît pas à l'affichage : des balises l'empêchent de s'exécuter sur cette page, où Semantic MediaWiki refuse les déclarations d'unités et les compterait comme des erreurs. Pour le lire, ouvrir cette page en modification.
```

**Étape 4 — règle ajoutée dans `CLAUDE.md`.** Remplacement fait par une ligne de Python, qui n'écrivait que si la chaîne était trouvée exactement une fois (« occurrences : 1 », « ecrit »). `git diff --numstat` : `9	0	CLAUDE.md`. Relecture : la section « Leçons de méthode (wiki et outillage) » commence par la nouvelle puce (ligne 342), suivie de la puce sur `[[ ]]` (ligne 351), puis de la suivante, sur `+sep=` (ligne 368), comme avant. Rien d'autre n'a bougé.

`git diff` de `CLAUDE.md`, tel quel :

```
diff --git a/CLAUDE.md b/CLAUDE.md
index b928b8b..a037f00 100644
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -339,6 +339,15 @@ sur la banque physique est notée ici. À traiter avec le lot de numérotation.
 
 ## Leçons de méthode (wiki et outillage)
 
+- **Après la modification d'une page transclue, les pages qui la transcluent
+  montrent l'état d'avant pendant plusieurs minutes.** Ne rien conclure de
+  leurs faits tant que leur `touched`, lu par `action=query&prop=info`, n'a
+  pas dépassé l'heure de la modification : le retraitement est différé, et
+  rien ne distingue des faits périmés de faits à jour. Mesuré le 15 octobre
+  2026 sur une propriété transcluant un bloc de déclaration d'unités, dont
+  les faits n'ont changé qu'au bout de 4 min 29 s. Le critère est le
+  `touched`, pas la durée : une seule mesure ne fait pas une loi.
+
 - **Un retour à la ligne à l'intérieur de `[[ ]]` casse silencieusement un
   lien MediaWiki.** Aucune erreur d'API à l'écriture, mais le lien est absent
   de `pagelinks` et donc de `list=backlinks`. Toujours écrire un lien sur une
```

**Étape 5 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Questions posées hors consigne

Aucune question reçue hors consigne. Les réponses aux points A et B de la tâche 36 figurent en tête de cette consigne et ont été appliquées. Une question nouvelle à Cyril, point A ci-dessous.

**A.** Contexte : la puce ajoutée dans `CLAUDE.md` dit « Mesuré le 15 octobre 2026 sur une propriété transcluant un bloc de déclaration d'unités, dont les faits n'ont changé qu'au bout de 4 min 29 s ». Ce n'est pas ce que j'ai mesuré à la tâche 36. Les faits de `Attribut:Test lot21e longueur` n'ont **jamais** changé : identiques avant la modification du bloc, à 17:28:07 et à 17:32:44. Ce qui n'a bougé qu'au bout de 4 min 29 s, c'est son `touched`, passé de 15:30:04 à 17:30:03 pour une modification faite à 17:25:34. De même, « montrent l'état d'avant » n'a pas pu s'observer comme une différence : l'état d'avant et l'état d'après étaient identiques. Le fonctionnement de MediaWiki fait que ce sont bien les faits d'avant tant que la page n'est pas retraitée, mais c'est une déduction. La règle elle-même, juger sur le `touched` et non sur une durée, n'est pas en cause. La consigne imposait le texte, et je l'ai écrit tel quel. Question : faut-il corriger la description de la mesure ? Suggestion : oui, dans une tâche ultérieure, en remplaçant « dont les faits n'ont changé qu'au bout de 4 min 29 s » par « dont le `touched` n'a dépassé l'heure de la modification qu'au bout de 4 min 29 s ; ses faits, identiques avant et après, ne pouvaient pas le montrer ». Les lignes seraient à replier avec leur indentation de deux espaces, et le texte exact fourni par toi.

## Écarts et surprises

1. **Description de la mesure inexacte dans la règle ajoutée** ; voir A. C'est le troisième texte de consigne du lot écrit tel quel puis signalé, après « Onze pages » (tâche 33) et « juste sous ce paragraphe » (tâche 36).
2. **Vérification des deux chaînes avant la première écriture**, et non chacune juste avant la sienne. Sinon, un échec sur `CLAUDE.md` aurait laissé la page du wiki déjà modifiée, contre le « sans rien écrire » de la consigne.
3. **Outils.** `sed` pour la phrase du wiki : un seul remplacement littéral sur une ligne. Deux lignes de Python pour `CLAUDE.md`, l'une qui compte sans écrire, l'autre qui n'écrit qu'à une occurrence exacte : la chaîne s'étend sur trois lignes et le remplacement sur douze. Fichiers temporaires dans le scratchpad.
4. **Rapport assemblé par substitution** : les deux diffs ont été insérés depuis leurs fichiers par remplacement de repères, pour être cités octet pour octet.
5. `origin/main` n'avait pas bougé depuis la tâche 36 (`d52d1c5`) : aucune avance rapide nécessaire avant le commit.
