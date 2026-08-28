# Négation SMW — correction écrite

Suite de `negation-smw.md`. Entrée n° 23 de *Limites connues* réécrite,
deux retouches faites.

---

## 1. Entrée n° 23 — ÉCRITE

`Limites connues du Système de Gestion de Données Techniques`
(pageid 144). `oldrevid` 1081 → `newrevid` 1083.
Résumé : `[Correctif] Limites connues n° 23 — [[X::!+]] rend le
complément, pas zéro`.

`wiki-put.sh` a rendu `result: "Success"`, **exit 0** — le nouveau
contrôle de résultat (commit `0913ef8`) confirme, il ne se contente
plus d'afficher.

### Ce qui change dans l'entrée

- **Fait principal réécrit** : `[[X::!+]]` n'est pas « une requête qui
  rend zéro », c'est `[[X::+]]` — le `!` est jeté à la compilation,
  même `meta.hash`. La requête rend les pages qui **portent** `X`, le
  complément exact de l'intention.
- **Preuve datée** : 28 août 2026, `[[Depicts_specimen::!+]]` et
  `[[Depicts_specimen::+]]` → 65 résultats chacune,
  `meta.hash` `371ee7fbe61129413273d02460f9b756` identique.
- **L'ancienne affirmation expliquée** : le « rend zéro » venait du test
  du 16 août sur `Main_image`, que rien ne portait —
  `[[Main_image::+]]` valait 0, donc `[[Main_image::!+]]` aussi.
- **Le risque nommé** : un zéro se remarque, un compte plausible du
  mauvais ensemble se croit.
- La variante `[[!X::+]]` (bang sur le nom de propriété → erreur
  explicite, condition ignorée, ensemble non filtré) est **conservée**.
- La parade (matérialiser le complément par une propriété positive) est
  **conservée**, inchangée.

## 2. Phrase de leçon — AJOUTÉE, juste avant la parade

Texte inséré tel que demandé :

> C'est la deuxième entrée de cette page corrigée en trois jours après
> la n° 2 sur `Board_lineage`. Même mécanisme : une observation juste,
> généralisée trop vite, et rien pour la démentir. Un test dont le
> résultat attendu et le résultat faux coïncident ne prouve rien.

C'est la leçon transférable : les deux corrections (n° 2 le 27 août,
n° 23 le 28) portent le même défaut de méthode, pas le même sujet
technique.

## 3. `travaux/outillage-suite.md` — renvois corrigés, COMMITÉ

- ligne 87 : `n° 38` → `n° 23`
- ligne 122 : `n° 45` → `n° 30`

Commit `7bc3006` — `[Correctif] travaux/outillage-suite.md — renvois
Limites connues : n° 38 → 23, n° 45 → 30`. Poussé
(`5db9c62..7bc3006`). Le fichier n'était pas encore versionné : il entre
dans l'historique avec les bons numéros.

---

## 4. Vérifications après écriture

| Contrôle | Attendu | Observé |
|---|---|---|
| `browsebysubject` sur la page | `_MDAT`, `_SKEY` (+ `_ASK` si applicable) | **`_MDAT`, `_SKEY` seuls** — pas de `_ASK` (aucun `#ask` vivant sur la page), aucune annotation parasite |
| Entrées rendues | 34 (remplacement, pas ajout) | **34** `<li>` dans la `<ol>`, 34 au total — pas 35 |
| Liens rouges | aucun | **aucun** |
| Liens internes | tous bleus | 3, tous `exists: true` : *Avancement du jardin-forêt*, *Erreurs de traitement SMW*, *Récapitulatif technique du SGDT* |
| Exemples SMW exécutés ? | non | 20 `[[` littéraux dans le HTML rendu (dont 7 nouveaux de la n° 23), tous en texte — confirmé par `browsebysubject` propre |
| Contenu neuf présent | oui | hash `371ee7fb…`, `Board_lineage`, « compilé en », « ne prouve rien » — tous dans le rendu |

`nowiki` 8/8, `code` 18/18, `[[`/`]]` 8/8, `'''` en nombre pair (18) —
équilibrés dans la ligne écrite.

### Note sur `_ASK`

La consigne attendait `_MDAT`, `_SKEY`, `_ASK`. Seuls les deux premiers
sont là : `_ASK` n'apparaît que si la page porte un `#ask` réellement
exécuté. Ici tous les exemples de requête sont en
`<code><nowiki>…</nowiki></code>`, donc inertes — la page ne track
aucune requête. C'est le résultat le plus propre possible.

---

## État git

```
7bc3006  [Correctif] travaux/outillage-suite.md — renvois Limites connues : n° 38 → 23, n° 45 → 30
5db9c62  [Correctif] wiki-api.sh --facts — un sujet sans aucun fait le dit
e2658c9  [Correctif] CLAUDE.md — outillage : purge sans jeton, garantie --createonly datée
0913ef8  [Correctif] Outillage bin/ — les garde-fous d'écriture remontent par le code de sortie
```

Tout poussé. `demandes-adminsys.md` (modif préexistante) et les autres
fichiers `travaux/` de la session restent hors commit.

Écriture wiki : `Limites connues` revid 1083 (entrée n° 23).
Reste de la seconde passe outillage (défauts 1 et 7) : toujours à faire.
