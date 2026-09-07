> **Renommé le 7 septembre 2026.** Ce fichier s'appelait
> `lot-28-tache1-ouverture.md` et n'était pas versionné. Le nom prêtait à
> confusion : il documente la création de la page du lot, le 4 septembre, alors
> que le lot était encore à l'état « identifié ». L'ouverture proprement dite a
> eu lieu le 7 septembre et fait l'objet de `lot-28-tache1-ouverture.md`, qui
> porte désormais ce nom. Le corps ci-dessous n'a pas été modifié.

# Lot 28 — Ouverture : ce qu'on attend d'un partenaire

**Exécuté le :** 4 septembre 2026, session Claude Code, compte `Cywil`.
Une écriture wiki : création de la page du lot.

## Étape 1 — Création de la page

`action=query&titles=` sur `Lot 28 — Échange de données avec un partenaire`
avant écriture : `missing: true`, confirmé. Page créée avec `--createonly`,
contenu conforme mot pour mot à la consigne. `result: Success`, `new: true`,
`pageid: 541`, `newrevid: 1257`.

Résumé de modification : `[Lot 28][Ouverture] création de la page du lot`.

## Les cinq contrôles

**1. `browsebysubject` — phrase unique et deux valeurs distinctes.**
```
Work_package_number -> ['28']
Work_package_overlaps -> ['Lot_21_—_Grandeurs_et_unités#0##', 'Lot_25_—_Axe_taxonomique#0##']
Work_package_status -> ['identifié']
Work_package_summary -> ["Écrire ce qu'un partenaire doit publier pour que l'échange de données fonctionne, et ce qu'Ecolibre publie en retour."]
```
`Work_package_summary` est bien une valeur unique. `Work_package_overlaps`
est bien découpé en deux valeurs distinctes (Lot 21, Lot 25) : le
séparateur multivalué s'applique.

**2. `Catégorie:Lot` — vingt-huit membres, index conforme.**
`list=categorymembers` sur `Catégorie:Lot` : 28 membres. Page `Gestion des
lots` purgée puis relue rendue (`action=parse&prop=text`) : section
« Compte » affiche `Lots au total : 28`, avec le détail `En cours : 1`,
`Faits : 11`, `À venir : 16`, `Abandonnés : 0` — la somme (1+11+16+0) fait
28, aucun lot manquant à une section. Le nouveau lot, statut « identifié »,
est compté dans « À venir ».

**3. `action=parse` — les trois liens résolus.** Recherche des ancres
`Lot 21`, `Lot 25`, `Limites connues du Système de Gestion de Données
Techniques` et `Gestion des lots` dans le HTML rendu de la page du lot :
les quatre apparaissent sans `class="new"` (pas de lien rouge).

**4. Aucune annotation parasite.** `browsebysubject` sans filtre sur la
page ne rend que les quatre propriétés attendues plus `_ASK`, `_INST`,
`_MDAT`, `_SKEY` — les clés internes normales d'une page de catégorie
`Lot` portant trois requêtes intégrées. Rien d'inattendu.

**5. Aucune structure partenaire nommée.** `grep` sur le fichier source
avant écriture : les seules occurrences des mots « structure » et
« partenaire » désignent la structure partenaire générique du lot lui-même
(« une structure qui n'est pas forcément technique », « le partenaire
garde son outil »), jamais un nom propre.

## Écarts et surprises

Aucun. La page s'est créée du premier coup, les trois liens étaient déjà
des cibles existantes (aucun lien rouge à corriger), et le compte de la
page `Gestion des lots` était juste sans purge préalable nécessaire côté
contenu — la purge a seulement permis de lire un rendu à jour plutôt que
d'attendre la prochaine régénération naturelle du cache.
