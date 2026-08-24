# Lot 11 — nettoyage de Récapitulatif technique : écrit et vérifié

2026-08-21. Suite de `travaux/lot-11-nettoyage-recap-v2.md`.

## 1. Récapitulatif technique — écrit, relu

Page relue avant écriture (identique à la copie déjà en main — aucun
changement hors session). Diff validé appliqué sans modification, un
remplacement exact pour chacun des deux fragments (`Item_ref::+` et
`Has type::+`, tous deux échappés en `<code><nowiki>…</nowiki></code>`).
Résumé : `[Correctif] Échapper deux exemples de syntaxe SMW exécutés par
erreur — annotation Item_ref parasite et Has type hors page de
propriété` (pageid 27, revid 850).

**Relu après écriture** : `diff` entre le fichier envoyé et la page
récupérée — aucune différence, contenu identique.

## 2. `Item_ref` et `_ERRC` — disparus dès la première lecture, pas de purge nécessaire

`browsebysubject` sans filtre, immédiatement après l'écriture :

```
_ASK -> [14 requêtes, inchangées]
_INST -> ['SGDT#14##', 'Pages_avec_des_liens_de_fichiers_brisés#14##']
_MDAT -> ['1/2026/8/21/11/8/51/0']
_SKEY -> ['Récapitulatif technique du Système de Gestion de Données Techniques']
```

Ni `Item_ref`, ni `_ERRC`. Les deux ont disparu sans purge — à la
différence du compteur de la page d'audit (point 3), le fait stocké sur
*cette* page a été retiré dès l'écriture, pas seulement à un reparse
différé. Les 14 `_ASK` et les deux `_INST` restent identiques à avant
correction : rien d'autre n'a bougé sur la page.

## 3. Page d'audit — comptage retombé à 8 après une purge

Premier contrôle, sans purge : compteur toujours à **9**,
`Récapitulatif technique` toujours listée — cache non invalidé, exactement
le mécanisme déjà rencontré et désormais documenté sur cette même page
(l'invalidation passe par la file de travaux et peut tarder).

`bin/wiki-purge.sh` sur `Erreurs de traitement SMW`, une fois. Nouveau
contrôle : compteur à **8**, `Récapitulatif technique` absente de la
table. Les huit pages restantes (cinq propriétés du lot 7, `INSEE_code`,
les deux plantations `ECL-0023`/`ECL-0026`) inchangées.
