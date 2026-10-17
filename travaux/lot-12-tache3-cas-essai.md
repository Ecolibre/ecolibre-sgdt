# Lot 12 — tâche 3 sur 4 : cas d'essai réel (fer à souder, sacoche, caisse, pile)

Date : 11 octobre 2026. Deuxième envoi ; ce rapport remplace le rapport d'arrêt
du premier envoi (commit `079bf2f`), qui s'était arrêté à l'étape 4 sans rien
écrire : l'expression du formulaire visait la banque ECL.

Cas de Cyril : le fer à souder est dans une sacoche souple, la sacoche dans une
caisse en carton de 39 x 30 x 20 cm, la caisse dans une pile posée dans une
zone de l'atelier.

## État du dépôt et règles locales au départ

- `git status` : seul `travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md`
  non suivi, hors compte comme prévu.
- `.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Lectures

`CLAUDE.md` ; sur le wiki : `Lot 12 — Contenants et étiquetage` (rev. 1503),
`Stocker des ressources` (231), `Bidon 220L` (359),
`Bidon 220L bleu plastique Borde` (351), `Atelier appartement` (898),
`Fer à souder — Atelier appartement (CWL-0009)` (1105). Les sept titres à
créer étaient absents (`missing`) avant écriture.

`Limites connues du Système de Gestion de Données Techniques` : **68 entrées**
avant ajout (rev. 1504).

## Mesures avant

Par `action=ask` en liste (longueur de `results`, aucune suite de pagination).

| Mesure | Attendu | Mesuré |
|---|---|---|
| Functional item | 26 | 26 |
| Organic item | 40 | 40 |
| Referenced item | 39 | 39 |
| Physical item | 48 | 48 |
| Lieu | 13 | 13 |
| Porteurs de `Located_at` | 45 | 45 |
| Porteurs de `Contained_in` | 0 | 0 |

Toutes conformes.

Contrôle en lecture seule des chiffres de l'entrée à ajouter aux Limites
connues, avant de l'écrire : `[[Category:Physical item]][[Inventory_site::ECL]]`
rend 44 items, numéros `0001` à `0045` sans `0043`, aucun ne contenant de
lettre ; `{{#invoke:Base36|next|0009}}` rend `000A`. Les affirmations de
l'entrée sont donc mesurées, pas seulement recopiées.

## Références évaluées

Par `action=expandtemplates`, `title=Utilisateur:Cywil/Bac à sable`, une
évaluation avant chaque création.

- E1, `Formulaire:Functional item`, champ `Item_ref`, inchangée :
  `{{#invoke:Base36|next|{{#ask: [[Category:Functional item||Organic item||Referenced item]] [[Item_ref::+]] |?Item_ref= |sort=Item_ref |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }}`
- E2, `Formulaire:Lieu`, champ `Location_number`, inchangée (`{{Préfixe lieu}}` rend `LOC`) :
  `{{#invoke:Base36|next|{{#ask: [[Category:Lieu]] [[Location_site::{{Préfixe lieu}}]] [[Location_number::+]] |?Location_number= |sort=Location_number |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }}`
- E3, variante CWL fixée par la consigne :
  `{{#invoke:Base36|next|{{#ask: [[Category:Physical item]] [[Inventory_site::CWL]] [[Inventory_number::+]] |?Inventory_number= |sort=Inventory_number |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }}`

| Page | Expression | Attendu | Rendu |
|---|---|---|---|
| 5.1 Ranger des objets | E1 | 002Z | 002Z |
| 5.2 Sacoche à outils | E1 | 0030 | 0030 |
| 5.3 Caisse en carton | E1 | 0031 | 0031 |
| 5.4 Sacoche à outils souple | E1 | 0032 | 0032 |
| 5.5 Caisse en carton 39 x 30 x 20 cm | E1 | 0033 | 0033 |
| 5.6 Entrée à droite | E2 | 0014 | 0014 |
| 5.7 Pile 1 | E2 | 0015 | **0014 au premier essai, puis 0015** (voir Écarts) |
| 5.8 Caisse en carton — … (CWL-000C) | E3 | 000C | 000C |
| 5.9 Sacoche à outils — … (CWL-000D) | E3 | 000D | 000D |

Les titres de 5.8 et 5.9 sont donc ceux de la consigne, sans correction.

## Pages écrites

| Page | Résumé | Result | Révision |
|---|---|---|---|
| Ranger des objets | `[Lot 12][Tâche 3] fonction de rangement, sous Stocker des ressources` | Success, création | 1505 |
| Sacoche à outils | `[Lot 12][Tâche 3] item organique sacoche à outils` | Success, création | 1506 |
| Caisse en carton | `[Lot 12][Tâche 3] item organique caisse en carton` | Success, création | 1507 |
| Sacoche à outils souple | `[Lot 12][Tâche 3] référencé sacoche souple` | Success, création | 1508 |
| Caisse en carton 39 x 30 x 20 cm | `[Lot 12][Tâche 3] référencé caisse en carton, format 39 x 30 x 20` | Success, création | 1509 |
| Entrée à droite | `[Lot 12][Tâche 3] zone de l'atelier` | Success, création | 1510 |
| Pile 1 | `[Lot 12][Tâche 3] pile de caisses, zone Entrée à droite` | Success, création | 1511 |
| Caisse en carton — Atelier appartement (CWL-000C) | `[Lot 12][Tâche 3] exemplaire de caisse, dans Pile 1` | Success, création | 1512 |
| Sacoche à outils — Atelier appartement (CWL-000D) | `[Lot 12][Tâche 3] exemplaire de sacoche, rangé dans la caisse` | Success, création | 1513 |
| Fer à souder — Atelier appartement (CWL-0009) | `[Lot 12][Tâche 3] le fer à souder passe du lieu à son contenant` | Success | 1514 (précédente 1105) |
| Limites connues du Système de Gestion de Données Techniques | `[Lot 12][Tâche 3] le numéro d'inventaire proposé par le formulaire ne vaut que pour le site ECL` | Success, par `bin/wiki-append.sh` | 1515 (précédente 1504) |

Créations toutes en `--createonly`, code de sortie 0. Fer à souder : relu
juste avant l'écriture (rév. 1105 inchangée), une seule ligne remplacée,
`|Located_at=Atelier appartement` par
`|physical_parent=Sacoche à outils — Atelier appartement (CWL-000D)`.

## Mesures après

File : `bin/wiki-wait-jobs.sh` a d'abord annoncé « FILE FIGEE a 24 travaux » ;
après une pause de cinq minutes en arrière-plan, « FILE VIDE ».

| Mesure | Attendu | Mesuré |
|---|---|---|
| Functional item | 27 | 27 |
| Organic item | 42 | 42 |
| Referenced item | 41 | 41 |
| Physical item | 50 | 50 |
| Lieu | 15 | 15 |
| Porteurs de `Located_at` | 45 | 45 (le fer en sort, la caisse y entre) |
| Porteurs de `Contained_in` | 2 | 2 : le fer vers la sacoche, la sacoche vers la caisse |

## Vérifications

1. **Mesures après** : conformes, tableau ci-dessus.
2. **Faits des neuf pages** (`bin/wiki-api.sh --facts`), aucun `_ERRC` :
   - Ranger des objets : `Item_ref` 002Z, `Part_of` Stocker des ressources, catégorie Functional item.
   - Sacoche à outils : 0030, `Realizes_function` Ranger des objets.
   - Caisse en carton : 0031, `Realizes_function` Ranger des objets.
   - Sacoche à outils souple : 0032, `Corresponds_to_organic` Sacoche à outils.
   - Caisse en carton 39 x 30 x 20 cm : 0033, `Corresponds_to_organic` Caisse en carton.
   - Entrée à droite : `Location_number` 0014, `Located_in` Atelier appartement, type zone.
   - Pile 1 : 0015, `Located_in` Entrée à droite, type pile.
   - Caisse (CWL-000C) : `Inventory_ref` CWL-000C, `Instance_of` le référencé, `Located_at` Pile 1, pas de `Contained_in`.
   - Sacoche (CWL-000D) : `Inventory_ref` CWL-000D, `Instance_of` le référencé, `Contained_in` la caisse, pas de `Located_at`, `Item_description` portée.
3. **Fer à souder** : `Contained_in` → Sacoche à outils — Atelier appartement (CWL-000D) ; plus aucun `Located_at`. `Instance_of`, `Inventory_ref` CWL-0009 et `Owned_by` inchangés.
4. **Chaîne à trois sauts** : `[[Fer à souder — Atelier appartement (CWL-0009)]]|?Contained_in.Contained_in.Located_at` rend **Pile 1**.
5. **Rendus des contenants** : après purge, la section Contient de la sacoche
   liste le fer à souder (CWL-0009), celle de la caisse liste la sacoche
   (CWL-000D). Avant purge, la sacoche affichait « Cet item ne contient aucun
   sous-élément physique » : rendu mis en cache à sa création, avant le
   rattachement du fer.
6. **Pile 1** : « 1 item(s) physique(s) rattaché(s) à ce lieu », la caisse
   seule. Ni le fer ni la sacoche, comme attendu avant la tâche 4.
7. **Fer à souder** : « Rangé dans » pointe vers la sacoche, « Se trouve à »
   est vide, comme attendu avant la tâche 4.
8. **Limites connues** : 69 entrées (68 + 1), l'ajout est la dernière
   (contrôle du script) ; un seul bloc `<ol>` au rendu ; faits `_INST`
   (Page de suivi), `_MDAT`, `_SKEY` seulement ; catégories : Page de suivi
   seule ; liens : 4, aucun vers une page inexistante.
9. **Purge** : `bin/wiki-purge.sh` sur la sacoche, la caisse, Pile 1 et le
   fer, tous `purged` et `linkupdate`. Les relectures 5 à 7 ci-dessus sont
   celles d'après purge.

## Règles locales à la fin

`.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Écarts et surprises

- **Le compteur des lieux a rendu une valeur périmée quelques secondes après
  une création.** Juste après la création d'`Entrée à droite` (0014), E2 a
  rendu encore 0014 au lieu de 0015. Rien n'a été écrit avec cette valeur.
  Les faits d'`Entrée à droite` portaient déjà `Location_number` 0014, et une
  requête directe la listait en tête ; la réévaluation suivante, quelques
  secondes plus tard, a rendu 0015, et c'est elle qui a servi. Les cinq
  évaluations de E1 et les deux de E3 ont suivi sans retard. Conséquence pour
  la saisie par formulaire : deux lieux créés à quelques secondes
  d'intervalle peuvent recevoir le même numéro par défaut. Je n'ai pas
  vérifié si ce retard est déjà consigné dans les Limites connues.
- **La fiche de lieu affiche pour une caisse des colonnes de plantation.** La
  table « Présents ici » de Pile 1 porte les colonnes Rang, Planté le, État,
  pensées pour des plantes. Elles sont vides pour la caisse. À voir avec la
  tâche 4, qui reprend cette fiche, ou avec la propriété de rang du lot.
- `bin/wiki-wait-jobs.sh` a annoncé une file figée à 24 travaux, vide cinq
  minutes plus tard : même comportement que celui déjà décrit dans
  `CLAUDE.md`.
