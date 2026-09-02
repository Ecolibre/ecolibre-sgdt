# Lot 13 — Tâche 3d : les six lots neufs, et un correctif sur les sept pages courtes

**Exécuté le :** 2 septembre 2026 (11h29-11h32 UTC environ), session Claude
Code, compte `Cywil`. Session ouverte par `bin/wiki-login.sh` avant toute
écriture. Chaque page corrigée a été relue par `wiki-get.sh` immédiatement
avant écriture ; les six titres à créer ont été vérifiés absents
(`prop=info`, tous `missing: true`) avant toute écriture.

---

## Étape 1 — Correctif sur les sept pages courtes

Les sept pages `Lot 14` à `Lot 20` portaient encore, entre l'appel du modèle
et la première section, le bloc :

```
{{Lot
...
}}

''Ce lot n'a pas encore de numéro : il lui sera attribué à son ouverture.''

== ...
```

Ligne italique et la ligne vide surnuméraire supprimées par un remplacement
textuel exact (`\n\n''Ce lot n'a pas encore de numéro...''\n\n==` →
`\n\n==`), identique sur les sept, rien d'autre touché. Sept écritures,
toutes `result: Success`, résumé
`[Correctif] Suppression de la phrase « pas encore de numéro », devenue
fausse depuis la tâche 3c` :

| Page | pageid | oldrevid → newrevid |
|---|---|---|
| Lot 14 — Navigation | 486 | 1210 → 1217 |
| Lot 15 — Images | 487 | 1211 → 1218 |
| Lot 16 — Corrections du module de références | 488 | 1212 → 1219 |
| Lot 17 — Arbre fonctionnel | 489 | 1213 → 1220 |
| Lot 18 — Arborescence des domaines de pratique | 490 | 1214 → 1221 |
| Lot 19 — Vocabulaire et multilingue | 491 | 1215 → 1222 |
| Lot 20 — External Data | 492 | 1216 → 1223 |

## Étape 2 — Les six créations

`action=query&prop=info` sur les six titres avant écriture : les six
`missing: true`. Six écritures `wiki-put.sh --createonly`, toutes
`result: Success` :

| Lot | pageid | revid | Résumé |
|---|---|---|---|
| 21 — Grandeurs et unités | 532 | 1224 | `[Lot 13][Tâche 3d] Création Lot 21 — Grandeurs et unités` |
| 22 — Miroir local | 533 | 1225 | `[Lot 13][Tâche 3d] Création Lot 22 — Miroir local` |
| 23 — Priorisation | 534 | 1226 | `[Lot 13][Tâche 3d] Création Lot 23 — Priorisation` |
| 24 — Adminsys autonome | 535 | 1227 | `[Lot 13][Tâche 3d] Création Lot 24 — Adminsys autonome` |
| 25 — Axe taxonomique | 536 | 1228 | `[Lot 13][Tâche 3d] Création Lot 25 — Axe taxonomique` |
| 26 — Renommage des propriétés par domaine | 537 | 1229 | `[Lot 13][Tâche 3d] Création Lot 26 — Renommage des propriétés par domaine` |

Contenu écrit conforme mot pour mot à la consigne dans les six cas.
Conformément à la règle du lot, aucune des six ne porte de date d'ouverture
ni de permalien de clôture.

## Étape 3 — Les six contrôles

**1. `browsebysubject`, `ns=0`, sur les six pages — une seule valeur par
phrase d'objet.** Confirmé sur les six : un seul `Work_package_summary`
chacun, correspondant mot pour mot à la phrase donnée. Aucune annotation en
dehors des propriétés `Work_package_*` attendues et des quatre clés
internes SMW habituelles (`_ASK`, `_INST`, `_MDAT`, `_SKEY`).

**2. `Catégorie:Lot` — vingt-six membres.**
`action=query&list=categorymembers&cmtitle=Catégorie:Lot&cmlimit=500` :
exactement vingt-six titres — les vingt de la tâche 3c plus les six lots
21-26. Compte conforme.

**3. Plus aucun lien rouge de lot — lots 7, 19, 20 vers 21 et 22.**
Premier passage par `action=parse&prop=links` sur les trois pages :
**`Lot 21` et `Lot 22` rendus `exists: false`**, alors que les deux pages
existaient déjà (`prop=info` direct sur les deux : présentes, `pageid` 532
et 533, aucune trace de `missing`). Cache de rendu obsolète sur les trois
pages sources, jamais reparourrendues depuis la création des cibles.
`bin/wiki-purge.sh` sur les trois (`forcelinkupdate=1`), puis nouveau
`action=parse&prop=links` : les trois liens rendent `exists: true`. Voir
« Écarts et surprises » — c'est la vraie trouvaille de ce contrôle, pas un
oui/non plat.

**4. Requêtes inverses sur les lots 21, 22 et 17.**

* Lot 21, `action=parse` : « Lots qui dépendent de celui-ci » → Lot 7 ;
  « Lots qui le recoupent » → Lot 19. Les deux conformes du premier coup,
  sans purge nécessaire (page neuve, jamais rendue avant cette lecture).
* Lot 22, `action=parse` : « Lots qui dépendent de celui-ci » → Lot 20.
  Conforme du premier coup, même motif.
* Lot 17, `action=parse` : premier passage, « Lots qui le recoupent »
  n'affichait que `Lot 12` (fait de la tâche 3c), **`Lot 25` absent** bien
  que la propriété soit stockée (confirmée par `browsebysubject` sur
  `Lot 25` : `Work_package_overlaps -> Lot_17_—_Arbre_fonctionnel#0##`).
  Même cause qu'au contrôle 3 : le rendu de `Lot 17` était en cache depuis
  avant la création de `Lot 25`. `bin/wiki-purge.sh "Lot 17 — Arbre
  fonctionnel"`, puis nouveau `action=parse` : la table affiche alors
  `Lot 12` **et** `Lot 25`. Conforme après purge.

**5. Les sept correctifs — phrase supprimée, rien d'autre bougé.**
`bin/wiki-get.sh` sur les sept, `grep -c "pas encore de numéro"` → `0` sur
chacune. Titres de section (`grep "^=="`) identiques avant/après sur les
sept, dans le même ordre : `Ce qui est déjà tranché`, `Ce qui est écarté, et
pourquoi`, `Dépendances`, `Point de départ` (plus `Risques connus` pour le
lot 20 seul, déjà présent avant ce correctif). Rien d'autre n'a bougé.

**6. Aucune annotation parasite sur les treize pages touchées.**
`browsebysubject` sur les sept pages corrigées : uniquement les propriétés
`Work_package_*` attendues plus `_ASK`/`_INST`/`_MDAT`/`_SKEY` — identique
à l'état de la tâche 3c, la suppression d'une ligne hors modèle n'a rien
changé côté SMW. `browsebysubject` sur les six pages créées : même relevé
propre (point 1). `prop=categories` sur les treize : chacune ne porte que
`Catégorie:Lot`, aucune catégorie de suivi de lien cassé.

---

## Écarts et surprises

**1. Le vrai sujet de cette tâche est une classe de piège non documentée
avant aujourd'hui : le rendu d'une page contenant un `#ask` de requête
inverse, ou des liens vers une page tierce, reste figé dans le cache tant
que la page elle-même n'est ni éditée ni purgée — même quand la donnée qui
change vit sur une* autre* page.** Deux occurrences dans cette tâche :

* `Lot 7`, `Lot 19`, `Lot 20` continuaient de rendre leurs liens vers
  `Lot 21`/`Lot 22` comme rouges (`exists: false`) après la création de ces
  deux pages, jusqu'à purge.
* `Lot 17` ne montrait `Lot 25` dans « Lots qui le recoupent » qu'après
  purge, alors que le fait `Work_package_overlaps` était bien stocké côté
  `Lot 25` dès son écriture.

Les lots 21 et 22 eux-mêmes n'ont pas eu besoin de purge pour leurs propres
requêtes inverses (point 4) : ce sont des pages neuves, jamais rendues avant
la lecture de contrôle, donc sans cache à invalider. Le piège ne touche que
les pages *existantes dont le rendu a déjà été mis en cache avant qu'une
page tierce vienne changer ce qu'elles devraient afficher* — une variante
de la leçon déjà consignée dans `CLAUDE.md` sur la file de propagation SMW
après création de propriété, mais ici sur le cache de rendu MediaWiki, pas
sur le stockage SMW lui-même : le fait était bien là dès l'écriture
(confirmé par `browsebysubject`), seul l'affichage retardait. `result:
Success` sur l'écriture de `Lot 25` ne disait donc rien de ce que
montrerait `Lot 17` sans l'étape de purge — exactement le type d'écart que
la consigne du lot demande de ne pas prendre pour argent comptant.

**2. `bin/wiki-purge.sh` a réglé les deux cas du premier coup, sans
qu'aucune attente de file ne soit nécessaire.** Contrairement au verrou de
propagation SMW documenté ailleurs (qui ne se lève ni par purge ni par
reconstruction ciblée, cf. lot 24 point ouvert), ce piège de cache de rendu
est purement local à la page et se résout immédiatement.

**3. Aucun autre écart.** Les six créations ont toutes réussi au premier
essai, les sept correctifs sont propres et n'ont touché que la ligne visée,
et les six contrôles restants (sans purge nécessaire) sont positifs sans
réserve.
