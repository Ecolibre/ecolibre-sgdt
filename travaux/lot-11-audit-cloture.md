# Lot 11 — audit : clôture de la page « Erreurs de traitement SMW »

2026-08-21. Suite de `travaux/lot-11-audit-v3.md`.

## 1. Dernière phrase du paragraphe printouts — remplacée

Appliquée telle que fournie, reste du wikitexte inchangé.

## 2. Page d'audit — écrite, relue

Wikitexte envoyé (résumé `[Lot 11][Tâche 1] Horodatage corrigé,
paragraphe printouts précisé (_ERRC vs _ERRT, canaux testés)`, pageid
430, revid 847). Relu après écriture par `diff` entre le fichier envoyé
et la page récupérée : aucune différence de contenu (seul écart, l'absence
de retour à la ligne final sur la copie récupérée — artefact de lecture).

## 3. Compteur après écriture — 10, puis 9 : pas ce que la consigne anticipait

Rendu (`action=parse`) juste après l'écriture de la page d'audit :
**10**, pas 9. Mais la page en trop n'était **pas** la page d'audit
elle-même — elle ne figure à aucun moment dans sa propre liste, question
posée par la consigne mais qui ne s'est pas posée. La dixième page était
`Limites connues du Système de Gestion de Données Techniques`.

**Cause : une erreur que j'ai moi-même introduite dans le tour
précédent**, pas un défaut de la page d'audit. L'entrée `format=count`
écrite dans `Limites connues` (revid 846) citait des exemples de syntaxe
SMW entre simples guillemets inverses (`` ` ``) — backticks, qui ne
protègent rien en wikitexte, déjà établi dans cette session pour `LOC`.
Deux fragments non échappés s'y sont donc exécutés pour de vrai :

- `` `{{#ask: [[_ERRC::+]] |format=count |limit=500}}` `` — un `#ask`
  réel, à condition non vide celui-là, mais dont le `[[_ERRC::+]]`
  interne servait aussi de repère.
- `` `query=[[_ERRC::+]]|format=count|limit=500` `` — un `[[_ERRC::+]]`
  **nu**, hors de tout `{{#ask:}}`, interprété comme une tentative
  d'annotation de la page courante avec la propriété spéciale `_ERRC`
  (libellé « Has processing error ») — propriété à zone d'application
  restreinte, refusée.
- `` `{{#ask:}}` `` en fin d'entrée — un `#ask` réellement vide.

Rendu de la page avant correction, deux avertissements SMW :
```
La propriété « Has processing error » a une zone d'application restreinte
et ne peut pas être utilisée comme propriété d'annotation par un
utilisateur.
La description de la requête contient une condition vide.
```
Le premier vient du `[[_ERRC::+]]` nu, le second du `{{#ask:}}` vide —
tous deux dans la même entrée, tous deux de mon fait. Ironie notée : les
quatre entrées voisines, plus anciennes, du même style d'exemple
(`Item_ref::+`, `X::!+`, `!X::+`, `Main_image::!+`) sont **déjà**
correctement protégées par `<code><nowiki>…</nowiki></code>` — le patron
correct était sous les yeux dans le même document, pas suivi dans ma
propre entrée.

**Corrigé** : les trois fragments réécrits en
`<code><nowiki>…</nowiki></code>`, même patron que le reste de la page.
Résumé `[Correctif] Entrée format=count — échapper en <nowiki> les
exemples de syntaxe SMW, backticks non protecteurs (annotation _ERRC
restreinte exécutée par erreur)` (revid 848). Vérifié après coup :
- rendu de la page : plus aucun avertissement SMW ;
- `browsebysubject` sans filtre sur la page : seuls `_MDAT`/`_SKEY`,
  aucun `_ERRC` ni `_ASK` résiduel.

**Compteur toujours à 10 après la correction — cache, pas donnée.** Le
`#ask` de la page d'audit n'avait pas encore été invalidé : exactement le
mécanisme que la phrase d'horodatage décrit (« SMW l'invalide quand une
des pages listées change »), mais l'invalidation n'est pas instantanée —
elle dépend elle aussi de la file de travaux. `bin/wiki-purge.sh` sur
`Erreurs de traitement SMW` a forcé le reparse : **compteur retombé à
9**, `Limites connues du Système de Gestion de Données Techniques`
disparue de la table, les neuf pages d'origine inchangées.

**Réponse à la question posée** : le compteur affiche **9**. La page
d'audit ne se compte jamais elle-même — mais elle a compté, un instant,
une autre page de documentation que je venais moi-même de casser par le
même piège (backticks non protecteurs) déjà identifié dans cette session
sur `LOC`. Défaut corrigé à la source, pas contourné.
