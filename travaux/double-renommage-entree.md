# Écriture de l'entrée — double renommage sur Limites connues du SGDT

Suite à `travaux/double-renommage-cloture.md`, entrée validée par Cyril
avec deux corrections, puis écrite sur le wiki.

## Corrections appliquées avant écriture

1. **Prédiction retirée.** La phrase « retirer la redirection A→B ou la
   redirection B→C produit vraisemblablement deux résultats différents »
   a été remplacée par le constat sec : « L'effet du retrait d'un seul
   maillon dans une chaîne à deux n'a pas été mesuré. Ne pas le
   supposer. »
2. **Fait remonté en tête.** L'entrée s'ouvre désormais sur ce qu'un
   lecteur doit retenir — le littéral stocké porte le nom final, à
   condition que les deux redirections subsistent — puis vient le
   protocole de mesure, puis le renvoi à l'entrée n° 26, puis
   `Special:DoubleRedirects`, puis la réserve de non-mesure. Gras allégé
   à la phrase d'ouverture (fait + condition) uniquement.

## Écriture

- Page : *Limites connues du Système de Gestion de Données Techniques*
- Résumé : `[Correctif] Limites connues — double renommage, le littéral
  suit la chaîne tant que les deux redirections subsistent`
- `oldrevid` 1007 → `newrevid` 1023, `result: Success`
- Entrée ajoutée en position n° 32, seule ligne touchée (diff local
  avant/après vérifié avant écriture : une addition, rien d'autre —
  hormis une coquille corrigée en amont, voir ci-dessous).

**Incident en préparant le fichier, sans lien avec la demande** : en
recopiant intégralement la page pour y ajouter l'entrée, l'entrée n° 26
existante a été mal recopiée une première fois (`l''ancien'''` au lieu
de `l'''ancien'''` — une apostrophe perdue dans le marquage gras).
Repéré par diff avant d'écrire, corrigé dans le fichier local avant
l'appel `wiki-put.sh`. La version publiée est donc identique à l'ancienne
sur ce point ; rien n'a été modifié dans le texte des 31 entrées
existantes.

## Vérifications demandées

- **`browsebysubject` sur la page** :
  ```
  _MDAT -> ['1/2026/8/27/21/33/17/0']
  _SKEY -> ['Limites connues du Système de Gestion de Données Techniques']
  ```
  Rien d'autre — pas de fait parasite du type `Located_at` ou `Item_ref`.

- **Nombre d'entrées rendues** : 32 (`grep -c '^# '` sur le wikitexte
  relu après écriture, et vérifié par diff contre le fichier envoyé —
  identique à une fin de ligne près).

- **Accolades nues et liens rouges** : rendu HTML récupéré via
  `action=parse&prop=text`. Zéro élément `class="new"` (aucun lien
  rouge). Douze occurrences de `{{`/`}}` trouvées dans le corps rendu,
  toutes à l'intérieur de balises `<code>` d'entrées **antérieures**
  (n° 22, 28, 30 — exemples de syntaxe `{{#if:}}`, `{{#ask:}}`,
  `{{#show:}}` déjà protégés par `<nowiki>` avant cette session).
  **Aucune dans l'entrée n° 32** : elle n'utilise que
  `<code>Located_at</code>`, `<code>#set</code>`,
  `<code>action=browsebysubject</code>`, `<code>Special:DoubleRedirects</code>`
  — pas de syntaxe `[[ ]]` ou `{{ }}` à protéger.

Les trois contrôles passent.
