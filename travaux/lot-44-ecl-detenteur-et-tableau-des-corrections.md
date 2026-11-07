# Lot 44 — `ECL` désigne le détenteur, et deux lignes du tableau des corrections de `CLAUDE.md`

Exécuté le 7 novembre 2026, vers 18 h 05 UTC, dans une session Claude Code
cloud, sur la branche `claude/nifty-einstein-i9t8kk`. Deux écritures : une sur
le wiki, une dans le dépôt, toutes deux réussies du premier coup, sans arrêt
ni question. Les trois vérifications passent ; celle qui tranche, la
première, rend 0, 1 et 18.

## Étape 0 — état du dépôt

`git fetch origin`, puis `git status --porcelain` : sortie vide, aucun arrêt.
`HEAD` et `origin/main` au même commit, `bc71a3a` : rien à mettre à jour.
`.claude/settings.local.json` : absent, au début comme à la fin de la tâche,
donc aucune règle.

Session wiki : elle avait expiré. Une première lecture de la protection du
Récapitulatif avec `intestactions` est revenue telle qu'un visiteur anonyme
la voit, avec deux motifs de refus, `permissiondenied` et `confirmemail`, et
l'avertissement de `bin/wiki-api.sh` : « session expirée ». Après
`bin/wiki-login.sh`, qui rend `Success Cywil`, la même lecture rend
`protection: []` et aucun motif de refus.

## Lectures et mesures préalables

- Récapitulatif lu par `bin/wiki-get.sh` (`action=parse&prop=wikitext`) :
  identique à la révision 1740, telle qu'envoyée lors de la tâche
  précédente. La chaîne à remplacer y figure une fois, ligne 180, en tête de
  la troisième puce, sur une seule ligne ; « désigne l'organisation qui
  détient », 0 fois. Rendu de la révision 1740 : 18 blocs `<pre>`.
- `CLAUDE.md` : les deux chaînes à remplacer y figurent une fois chacune,
  ligne 337 pour la n° 2 et ligne 338 pour la n° 3 ; « lot 9, 13/08/2026 »
  ne figure nulle part ailleurs dans le fichier. Aucun autre fichier `.md`
  du dépôt, hors de `travaux/`, ne porte « est un affichage, jamais une
  valeur stockée » ni « wiki producteur ».
- Comptes de départ, par `action=ask` avec `limit=500`, sans suite pour
  aucun : `[[Has type::+]]` 161, `[[Item_ref::+]]` 118,
  `[[Inventory_number::+]]` 50, dont 6 avec `[[Inventory_site::CWL]]`.

## Écritures

| N° | Cible | Révision ou commit | Heure (UTC) | Résumé ou message | Outil |
|---|---|---|---|---|---|
| 1 | Récapitulatif technique du Système de Gestion de Données Techniques | 1740 → 1743 | 18:04:36 | `[Lot 44][Correctif] ECL désigne le détenteur, non le wiki producteur` | `bin/wiki-put.sh` |
| 2 | `CLAUDE.md` | commit `0bb8a49` | 18:05:13 | le message de la consigne | outil d'édition de fichier, puis `git commit` |

- **Écriture 1** : substitution exacte de la chaîne fournie, lue dans un
  fichier où elle avait été recopiée telle quelle ; la nouvelle chaîne,
  recopiée de même. Une seule ligne change, la 180 ; la puce reste sur une
  seule ligne, et le reste de la puce comme de la page est inchangé.
  `result: Success`, puis `bin/wiki-verify.sh` : `IDENTIQUE`.
- **Écriture 2** : deux substitutions exactes. Contrôle avant le commit : le
  fichier est égal à sa version de `HEAD`, à laquelle on applique les deux
  remplacements et rien d'autre. `git show --stat 0bb8a49` : `CLAUDE.md`,
  2 insertions, 2 suppressions. Le message est celui de la consigne, mot
  pour mot, suivi des deux lignes d'attribution.

## Les deux diffs

### Écriture 1

Diff sans lignes de contexte (`diff -U0`) : les lignes voisines sont les
autres puces, longues et inchangées.

```diff
--- recap-1740.txt
+++ recap-1743.txt
@@ -180 +180 @@
-* '''<code>ECL</code> désigne le wiki producteur''', pas une classe d'items. Un partenaire qui duplique le dispositif change une constante, pas N pages. Les codes sont enregistrés dans le [[Registre des préfixes de site]]. Premier cas réel : <code>CWL</code> (CWL Optéos), quatre exemplaires <code>CWL-0008</code> à <code>CWL-000B</code> inventoriés au lot 10 ; la banque inventaire est désormais à deux détenteurs en service.
+* '''<code>ECL</code> désigne l'organisation qui détient l'exemplaire''', non le wiki qui héberge la page, et pas davantage une classe d'items. Un partenaire qui duplique le dispositif change une constante, pas N pages. Les codes sont enregistrés dans le [[Registre des préfixes de site]]. Premier cas réel : <code>CWL</code> (CWL Optéos), quatre exemplaires <code>CWL-0008</code> à <code>CWL-000B</code> inventoriés au lot 10 ; la banque inventaire est désormais à deux détenteurs en service.
```

### Écriture 2

```diff
diff --git a/CLAUDE.md b/CLAUDE.md
index 7cc15f9..c6f1a6e 100644
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -334,8 +334,8 @@ numéro suivant.
 | N° | Objet | État |
 |---|---|---|
 | 1 | **Module d'audit Base36 : détection des doublons** (en plus des trous). | **ouverte** |
-| 2 | Les objets physiques rejoignent-ils la séquence Base36 auto-incrémentée ? | **fermée** — lot 9, 13/08/2026 : non, deux banques distinctes (`Item_ref` pour les trois classes de conception, `Inventory_number` pour les physiques). |
-| 3 | **`Module:Base36` s'arrête au tiret** (`clean:match("[%w]+")`) : une référence préfixée serait silencieusement mal lue. C'est pourquoi `ECL` est un affichage, jamais une valeur stockée. | **ouverte** |
+| 2 | Les objets physiques rejoignent-ils la séquence Base36 auto-incrémentée ? | **fermée** — lot 4, 26/07/2026 : non, deux banques distinctes (`Item_ref` pour les trois classes de conception, `Inventory_number` pour les physiques). |
+| 3 | **`Module:Base36` s'arrête au tiret** (`clean:match("[%w]+")`) : une référence préfixée serait silencieusement mal lue. C'est pourquoi la valeur de numérotation, `Inventory_number`, ne porte jamais de préfixe : c'est la seule de la banque d'inventaire que le module reçoit. Le code de site vit dans `Inventory_site` et la référence composée, préfixée, est bien stockée dans `Inventory_ref`. | **ouverte** |
 | 4 | `+sep=,` sur `Part_of` de `Modèle:Referenced item`. | **fermée** — était déjà en place avant le lot 9, constaté en tâche 7bis (fait vérifié en ligne, pas supposé). |
 | 5 | Filtre de catégorie manquant sur les requêtes `Part_of` des modèles d'item. | **fermée** — 15/08/2026, en deux éditions `[Correctif]` : `Modèle:Physical item` (« Éléments contenus », revid 544) et `Modèle:Referenced item` (« Composants enfants / BOM », revid 549). |
 
```

## Vérifications

1. **Qui tranche : le Récapitulatif**, relu par `action=parse` après
   l'écriture, sauts de ligne lus comme des espaces : « désigne le wiki
   producteur » **0** fois, « désigne l'organisation qui détient » **1**
   fois, et le texte fourni entier une fois. Rendu de la révision 1743 :
   **18** blocs `<pre>`, les 18 appels `#tag:pre` ; aucun ne suit une liste,
   et aucune puce de la page n'est suivie d'une ligne indentée. Les cinq
   puces des banques forment toujours une seule liste de cinq éléments, la
   troisième commençant au rendu par « ECL désigne l'organisation qui
   détient l'exemplaire, non le wiki qui héberge la page, et pas davantage
   une classe d'items. »
2. **`CLAUDE.md`**, dans sa version commitée (`git show HEAD:CLAUDE.md`) :
   « est un affichage, jamais une valeur stockée » **0** fois,
   « lot 9, 13/08/2026 » **0** fois.
3. **Comptes**, par `action=ask` avec `limit=500`, sans suite pour aucun :
   `[[Has type::+]]` **161**, `[[Item_ref::+]]` **118**,
   `[[Inventory_number::+]]` **50**, dont **6** avec
   `[[Inventory_site::CWL]]`. Inchangés.

Contrôles complémentaires, non demandés :

- Annotations (`smwbrowse`) : le Récapitulatif ne porte que `_ASK`, `_INST`
  (`SGDT`, `Page de suivi`), `_MDAT`, égal à l'heure de la révision 1743, et
  `_SKEY`. Aucun `_ERRC`.
- Catégories : `Catégorie:Page de suivi` et `Catégorie:SGDT`, aucune
  catégorie de suivi. Liens : 207 cibles, dont les deux inexistantes déjà
  relevées, `Attribut:Has type` et `Attribut:Imported from`.
- Recherche plein texte sur le wiki : « wiki producteur » et « producteur »
  ne rendent aucune page. L'index est à jour : deux requêtes témoins,
  « duplique dispositif » et « détient l'exemplaire », retrouvent le
  Récapitulatif, la seconde dans son texte écrit par cette tâche. La
  recherche ne porte que sur l'espace principal, celui qu'interroge l'API
  par défaut.

## Écarts et surprises

- **Le message de commit fourni porte une coquille, appliquée telle
  quelle** : « corrigées sur le wiki les 7 novembre 2026 », où l'on attend
  « le 7 novembre 2026 ». Elle est dans le commit `0bb8a49`, et ne peut plus
  en sortir : corriger un message déjà commité demanderait de réécrire
  l'historique, ce qui est exclu.
- **La ligne n° 2 date désormais la décision, et non plus l'inscription de
  la question dans ce tableau.** Le tableau numéroté lui-même date du lot 9,
  selon le paragraphe qui le précède : « Jusqu'au lot 9, deux entrées
  vivaient ici pendant qu'une numérotation informelle à cinq circulait dans
  les rapports du lot ». Le jour où la question n° 2 a été écrite dans
  `CLAUDE.md` n'a pas été mesuré : le clone est superficiel, et aucune
  conclusion n'a été tirée de `git log`.
- **La ligne n° 3 écrit toujours `clean:match("[%w]+")`**, alors que
  `p.findGaps` emploie `clean_ref:match("[%w]+")` : l'imprécision corrigée
  dans l'entrée 76 des Limites connues lors de la clôture du lot 4. La
  consigne interdisait d'y toucher.
- **La puce corrigée parle toujours de « quatre exemplaires `CWL-0008` à
  `CWL-000B` inventoriés au lot 10 »**, ce qui est exact pour le lot 10.
  Six exemplaires sont en `CWL` aujourd'hui, de `CWL-0008` à `CWL-000D`,
  mesuré le 7 novembre 2026 : un lecteur pressé peut prendre le chiffre du
  lot 10 pour le compte actuel.
