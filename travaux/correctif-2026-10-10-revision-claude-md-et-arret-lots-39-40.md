# Correctif du 10 octobre 2026 — révision de CLAUDE.md en attente, consigne des lots 39 et 40 arrêtée à l'étape 1

Rapport de l'exécuteur, pour la conversation de l'architecte. Rien n'est commité dans ce rapport ni dans `CLAUDE.md` : le diff ci-dessous attend l'accord de Cyril.

## 1. Où en est la journée

Trois tâches hors lot se sont suivies le 10 octobre 2026.

| Tâche | État | Commit |
|---|---|---|
| Permissions du miroir, premier passage : 3 interdictions, 6 autorisations, documentation dans `installation-nouveau-poste.md` | poussée | `13caf1403fd39cc07161260b2a5156cb77bab35a` |
| Permissions du miroir, second passage : autorisation restreinte au cœur extrait (`coeur/**`), 5 interdictions en seconde barrière, mesures constatées par Cyril, deux règles nouvelles dans `CLAUDE.md` | poussée | `89bb2d67825c460dcf44d65bb2ce83dcbb547f10` |
| Révision de la section « Garde-fous d'exécution (dépôt git) » de `CLAUDE.md`, sur le relevé des 48 confirmations | **écrite, non commitée** : 49 insertions, 12 suppressions, attend l'accord de Cyril | — |

Comptes de `.claude/settings.json` à cette heure : 25 deny, 4 ask, 49 allow. `.claude/settings.local.json` ne porte aucune règle :

```
{
  "permissions": {
    "allow": [],
    "deny": []
  }
}
```

## 2. Consigne des lots 39 et 40 : arrêtée à l'étape 1

La consigne « Pour Claude Code. » de création des pages des lots 39 (Format matériel des étiquettes) et 40 (Wiki privé CWL) demande, à l'étape 1, de s'arrêter si `git status --porcelain` montre un fichier suivi et modifié. Sortie obtenue :

```
 M CLAUDE.md
```

Arrêt appliqué. Aucune session ouverte, rien écrit sur le wiki, aucun fichier écrit dans `/tmp`. Les deux pages n'existent pas encore, ou du moins rien n'a été vérifié à leur sujet : l'étape 2 n'a pas été lancée.

La modification qui bloque est la révision de `CLAUDE.md` de la section 3. Les deux tâches se sont croisées : la consigne des lots 39 et 40 supposait un dépôt propre, alors que le diff de `CLAUDE.md` attendait encore l'accord de Cyril.

## 3. Révision de CLAUDE.md : ce qui a été écrit

Consigne de révision, sept points ; placement de chacun :

1. Titre « Pas de variable, de quelque nature que ce soit ». Le constat historique du 11 septembre au 3 octobre est gardé, suivi du résultat du 10 octobre : aucune confirmation causée par une variable de chemin sur 48, et six contrôles de forme sur treize venant d'une variable d'un autre type. La consigne d'écrire les chemins en toutes lettres est conservée.
2. Les trois types de variables (boucle, `${PIPESTATUS[0]}`, variable d'environnement objet de la commande), en liste dans le même paragraphe. La phrase « La consigne précédente… erreur d'arbitrage » et la suite sont inchangées, juste après la liste.
3. Critère des boucles remplacé dans le paragraphe « Le critère » : nombre d'itérations et nature de la liste. L'ancien exemple (trois appels à dérouler, huit à garder) est supprimé, le nouveau critère le couvre.
4. Boucle à liste calculée : un court paragraphe juste après le critère, sans règle nouvelle.
5. Classement des 48 confirmations : dernière entrée des leçons de méthode. Total contrôlé : 13 + 13 + 21 + 1 = 48.
6. Règle d'affichage d'un script du scratchpad : texte inchangé, relevé daté ajouté dessous.
7. Aucune règle nouvelle écrite.

Diff complet :

```diff
diff --git a/CLAUDE.md b/CLAUDE.md
index 811d50c..a05bb80 100644
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -615,6 +615,7 @@ sur la banque physique est notée ici. À traiter avec le lot de numérotation.
 - `sleep` au premier plan est bloqué par l'environnement Claude Code, avec le message « Blocked: sleep 60 followed by… ». Pour une pause fixe, lancer `sleep` en arrière-plan et attendre sa notification de fin. Pour attendre la file de travaux, `bin/wiki-wait-jobs.sh`. Mesuré le 4 octobre 2026, lot 21 tâche 8.
 - Un fichier d'ajout ne contient qu'une seule entrée, et `bin/wiki-append.sh` ne s'appelle qu'une fois par entrée. Cinq entrées ajoutées ensemble coûtent une seule révision mais se défont ensemble ; cinq appels coûtent cinq révisions et chacune s'annule seule. La règle existait déjà et une consigne du 6 octobre 2026 l'a contredite : c'est la consigne qui était en tort.
 - **Une interdiction `Read()` sur un fichier l'emporte sur une autorisation portant sur son dossier parent, et elle s'applique aux commandes shell, pas seulement à l'outil de lecture de fichier.** Mesuré le 10 octobre 2026 par deux refus : `cat /home/spheres/miroir-wiki/coeur/mediawiki-1.39/LocalSettings.php | wc -c`, alors que tout `miroir-wiki/**` était autorisé, refusé avec « denied » ; puis `cat /home/spheres/miroir-wiki/miroir.env | wc -c`, refusé de même, sans qu'aucun octet ne s'affiche. Le premier refus établit la préséance sur l'autorisation du dossier parent, les deux établissent l'application aux commandes shell. Vaut pour tout couple autorisation plus interdiction : l'autorisation de dossier ne lève pas l'interdiction de fichier. L'inverse ne tient pas : une interdiction ne ferme que ce qu'elle nomme, et une autorisation de dossier ouvre tout le reste. D'où la préférence pour une autorisation restreinte au sous-dossier sans secret plutôt qu'une liste d'interdictions toujours en retard sur le contenu du dossier.
+- **Où porter l'effort contre les fenêtres de confirmation.** Classement des 48 confirmations relevées le 10 octobre 2026 : 13 contrôles de forme, 13 défauts de permission, 21 barrières de périmètre, une non classée. Les barrières de périmètre, famille la plus nombreuse, ne relèvent ni des règles de conduite ni des permissions de commande, mais d'une autorisation de chemin ; celles du chantier miroir ont été traitées le même jour, voir le tableau des permissions de `installation-nouveau-poste.md`.
 
 ## Garde-fous d'exécution (dépôt git)
 
@@ -636,18 +637,45 @@ sur la banque physique est notée ici. À traiter avec le lot de numérotation.
   façon d'écrire.
 
   **Le critère : simplifier tant que la commande reste lisible et que la
-  simplification supprime effectivement la confirmation.** Une boucle sur
-  trois appels identiques sans traitement est à dérouler ; une boucle sur
-  huit appels avec traitement en sortie est à garder — la dérouler donnerait
-  vingt-quatre lignes pour éviter une fenêtre, ce qui est plus lourd que le
-  mal.
-
-  **Pas de variable de chemin.** Écrire le chemin du scratchpad en toutes
-  lettres dans chaque commande, jamais par une variable abrégée du type
-  `S=/tmp/…`. Une variable dans une redirection ou un argument déclenche un
-  contrôle de forme à elle seule : sur les confirmations relevées entre le
-  11 septembre et le 3 octobre 2026, c'est devenu la première cause, devant
-  toutes les autres réunies. La consigne précédente, qui recommandait de
+  simplification supprime effectivement la confirmation.** Pour une boucle,
+  ce qui décide est le nombre d'itérations et la nature de la liste, pas la
+  présence d'un traitement en sortie. Liste écrite en clair et six
+  itérations ou moins : dérouler, même avec traitement. Au-delà, ou liste
+  calculée : garder la boucle. Le critère précédent, qui gardait toute
+  boucle avec traitement en sortie, ne décidait plus rien : mesuré le
+  10 octobre 2026, la plupart des boucles écrites ont un traitement en
+  sortie, et l'exception couvrait presque tous les cas.
+
+  Une boucle dont la liste est calculée, du type
+  `for u in $(grep -o ...)`, ne peut pas être déroulée. La confirmation est
+  inévitable : l'accepter, ou en faire un script de `bin/` si le besoin
+  revient.
+
+  **Pas de variable, de quelque nature que ce soit.** Écrire le chemin du
+  scratchpad en toutes lettres dans chaque commande, jamais par une
+  variable abrégée du type `S=/tmp/…`. Une variable dans une redirection ou
+  un argument déclenche un contrôle de forme à elle seule : sur les
+  confirmations relevées entre le 11 septembre et le 3 octobre 2026, la
+  variable de chemin était devenue la première cause, devant toutes les
+  autres réunies. La consigne du 3 octobre a produit son effet : sur
+  48 confirmations relevées le 10 octobre 2026, aucune n'a été causée par
+  une variable de chemin. Le contrôle porte cependant sur toute variable,
+  pas sur les seules variables de chemin : six des treize contrôles de
+  forme du 10 octobre viennent d'une variable d'un autre type. Trois types
+  constatés ce jour-là, et la conduite pour chacun :
+  - **variable de boucle** : voir le critère des boucles ci-dessus ;
+  - **`${PIPESTATUS[0]}`**, pour récupérer le code de sortie du premier
+    maillon d'un tuyau : aucun contournement propre, il faudrait supprimer
+    le tuyau, donc ajouter une écriture. Trois occurrences le 10 octobre.
+    Par la règle sur les constructions refusées deux fois, c'est un
+    candidat à un script de `bin/` ;
+  - **variable d'environnement qui est l'objet même de la commande**, du
+    type `SGDT_PRIVE=... commande` : la variable ne peut pas disparaître.
+    L'affectation préfixée pousse en outre le nom du script en deuxième
+    position et lui fait perdre sa règle `allow`, ce qui ajoute une
+    seconde cause à la même fenêtre.
+
+  La consigne précédente, qui recommandait de
   garder la variable pour la lisibilité, était une erreur d'arbitrage :
   elle échangeait quelques lignes de lecture contre une fenêtre par commande.
   Quand le chemin complet rend la commande illisible, écrire un script dans
@@ -691,6 +719,15 @@ sur la banque physique est notée ici. À traiter avec le lot de numérotation.
   ligne a pour effet de sortir leur contenu du champ de vision de Cyril :
   ce complément le remet. Le contenu va dans le même message que le
   lancement, pas dans un tour séparé.
+
+  Relevé du 10 octobre 2026 : c'est la seule règle de cette section qui ait
+  protégé quelque chose ce jour-là, et la seule réellement enfreinte,
+  quatre fois, dans quatre sessions distinctes : `historique19.sh`,
+  `mesure.py`, `verif1.py` avec `verif3.py`, et `permaliens.sh`. Dans les
+  quatre cas, la règle a fini par être respectée après refus. Dans le
+  dernier, l'exécuteur a écrit les cinq lignes directement dans la commande
+  plutôt que dans un script, ce qui est la forme de conformité la plus
+  simple.
 - **Ne pas conclure sur un aperçu — vérifier après coup par un compte.**
   L'affichage tronque : le 21 août 2026, un aperçu d'écriture de
   `.claude/settings.json` a montré à trois reprises un bloc `allow` amputé
```

## 4. Questions

**A.** La consigne des lots 39 et 40 exige un dépôt propre à l'étape 1 ; `CLAUDE.md` porte la révision ci-dessus, non commitée, en attente d'accord. Le diff est-il validé ? Suggestion : si oui, le commiter et le pousser seul, dans une commande séparée, puis reprendre la consigne des lots 39 et 40 à l'étape 1, sans la modifier. Sinon, dire ce qu'il faut y changer ; aucune mise de côté par `git stash` sans accord.

**B.** Point 7 de la consigne de révision : aucune règle ajoutée. Une manque peut-être. `${PIPESTATUS[0]}` a déjà trois occurrences, au-delà du seuil des constructions refusées deux fois. Le texte le dit « candidat à un script de `bin/` », sans dire qui en décide ni quand. Suggestion : que l'architecte tranche, en créant le script ou en consignant pourquoi il ne le crée pas.

## 5. Écarts et surprises

- **Deux tâches croisées.** La consigne des lots 39 et 40 est arrivée alors que la révision de `CLAUDE.md` attendait l'accord sur son diff. Son étape 1 a joué son rôle et l'a arrêtée. Une consigne qui demande un dépôt propre gagnerait à rappeler ce qui est en attente au moment où elle est écrite.
- **Ce rapport lui-même est non suivi** dans `travaux/` tant qu'il n'est pas commité. Il apparaîtra en `??` à l'étape 1 de la consigne des lots 39 et 40, ce qui, selon ses propres termes, ne justifie aucun arrêt.
- **Deux écarts de formulation dans le commit `89bb2d6`**, déjà signalés à Cyril et poussés sans son accord explicite sur eux. Dans la leçon sur la préséance des interdictions, la mesure citée a été corrigée : le refus sur `miroir.env` a eu lieu alors que son dossier parent n'était plus autorisé, et c'est le refus sur `LocalSettings.php` qui établit la préséance. Dans le tableau de `installation-nouveau-poste.md`, « `miroir.env`, lisible sans fenêtre », qui était une déduction, est devenu « qu'aucune interdiction ne couvrait alors ».
- **Correction d'un compte rendu antérieur** : le premier passage sur les permissions affirmait qu'un `ls -la` passait « sans fenêtre ». C'était une déduction. Les deux mesures ont été refaites, une par une, et constatées par Cyril : aucune fenêtre sur `ls` du cœur extrait, une fenêtre sur `ls -la` de la racine du miroir.
