# Diff — Tâche 5 : neuf règles ajoutées à `CLAUDE.md`

**Statut :** proposé, pas encore appliqué à `CLAUDE.md`.

**Fichier local uniquement — pas une page wiki**, donc pas de garde-fous
d'écriture wiki (protection, `createonly`, résumé d'édition) applicables ici.

**Emplacement :** section existante `## Leçons de méthode`, renommée
`## Leçons de méthode (SMW / Page Forms)` pour refléter son contenu élargi —
elle contenait déjà une leçon du même type (retour à la ligne dans `[[ ]]`),
donc pas de nouvelle section à créer.

**Taille :** 63 → 115 lignes. Sous le seuil de 200 lignes fixé par le
cadrage — pas de découpage en fichier séparé proposé.

**Source :** les neuf règles de `travaux/lot-6-suite.md` (Tâche 5), reprises et
condensées — la numérotation et les dates de constat (« le 9 août », « le 10
août ») propres au journal de session ont été retirées, `CLAUDE.md` étant une
référence durable et non un journal.

---

```diff
-## Leçons de méthode
+## Leçons de méthode (SMW / Page Forms)
 
 - **Un retour à la ligne à l'intérieur de `[[ ]]` casse silencieusement un
   lien MediaWiki.** Aucune erreur d'API à l'écriture, mais le lien est absent
@@ -57,6 +57,58 @@
   seule ligne, et contrôler par `list=backlinks` après toute édition qui en
   ajoute un.
 
+- **`+sep=` est par propriété et sa position compte.** Dans un `#set`,
+  `|+sep=` s'applique à la propriété qui le précède immédiatement, pas au
+  bloc entier. Le déplacer casse le découpage de la propriété concernée.
+
+- **SMW ne rogne pas les espaces des valeurs intermédiaires.** Avec
+  `|+sep=,`, `A, B, C` produit `A`, ` B`, ` C`. Une propriété de type Page
+  absorbe l'espace par normalisation du titre ; une propriété de type Texte
+  le conserve et met en défaut ses valeurs autorisées.
+
+- **Le widget `tokens` de Page Forms insère un espace après le délimiteur.**
+  Malgré `delimiter=,`, il écrit `A, B`. À normaliser côté modèle
+  (`#arraymap`), pas à espérer côté formulaire.
+
+- **Modèle avant formulaire.** Poser un `+sep=` ou un `#arraymap` sur un
+  modèle recevant une valeur unique est inerte. L'ordre inverse ouvre une
+  fenêtre où des valeurs multiples peuvent être enregistrées dans un modèle
+  incapable de les stocker.
+
+- **Une vérification par formulaire n'est jamais en lecture seule.** Rouvrir
+  un item pour inspecter ses champs, c'est risquer de l'enregistrer modifié
+  (pré-remplissage, ré-enregistrement de valeurs déjà saisies).
+
+- **Avant un renommage de paramètre, `embeddedin` et la recherche plein texte
+  ne suffisent jamais seuls — il faut les deux, puis une lecture
+  individuelle.** L'index de recherche plein texte indexe le contenu
+  **rendu**, pas le wikitexte brut : un nom de paramètre de template
+  disparaît du texte rendu, seule sa valeur y survit. `embeddedin` trouve les
+  usages réels (transclusions) mais pas les pages qui *parlent* de l'ancien
+  nom sans transclure le modèle. Aucune des deux méthodes ne suffit seule.
+
+- **La session expire entre lecture et écriture.** Une session qui commence
+  par une phase de lecture verra sa première écriture échouer sur un cookie
+  périmé. Relancer `bin/wiki-login.sh` avant d'écrire.
+
+- **Comment vérifier un fait SMW réellement stocké.** `bin/wiki-get.sh` ne
+  gère pas `action=browsebysubject`, et la lecture du wikitexte ne montre pas
+  ce qui est stocké :
+  ```
+  curl -s "https://wiki.ecolibre.org/api.php?action=browsebysubject&subject=NOM_DE_PAGE&format=json&formatversion=2" \
+    | jq '.query.data[] | select(.property=="NOM_PROPRIETE")'
+  ```
+  Un seul `dataitem` contenant le séparateur = découpage non appliqué.
+  Propriété absente = le `#set` ne reçoit pas le paramètre. **L'affichage ne
+  prouve rien** : `#arraymap` rogne les espaces, `#set` non — deux liens
+  corrects peuvent masquer une donnée fausse.
+
+- **Lire l'état du wiki avant de raisonner, pas seulement avant d'écrire.**
+  Une copie locale est une photo, pas un état — des modifications hors
+  session sont possibles à tout moment (Cyril via le formulaire, un autre
+  outil). Un diagnostic bâti sur une copie locale peut être faux avant même
+  d'aboutir à une proposition d'écriture.
+
 ## Ne jamais faire
 - Ne pas toucher au `composer.json` de MediaWiki (utiliser `composer.local.json`).
 - Ne pas commiter `.env` ni `.cookies.txt`.
```
