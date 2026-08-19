# Lot 9 — Tâche 6 — Rapport (classe Lieu)

**Exécuté le 15 août 2026.** Proposition dans `lot-9-tache6-proposition.md`,
trois corrections de Cyril intégrées avant écriture, cinq pages écrites en
`createonly`, une anomalie trouvée et corrigée en cours de vérification.

## Corrections intégrées avant écriture

1. **Rattachement `Catégorie:Lieu` → `Catégorie:SGDT`**, pas
   `Catégorie:Item SGDT` : validé par Cyril, motif conservé dans la page
   (Lieu hors chaîne à quatre niveaux, décision 1.4).
2. **Requête inverse : `format=ul`** au lieu de `format=list`, avec
   `sort=Planting_rank|order=asc`. Revérifié en direct par `action=parse`
   avant écriture (catégorie inexistante + `default=`) : le texte par défaut
   s'affiche identiquement en `ul` et en `list` — seul `format=gallery` a
   l'anomalie constatée en tâche 5.
3. **`Place_name` laissée vide sur les trois pages** : le nom d'usage égale
   le titre dans les trois cas, donc redondant. Le modèle retombe sur
   `{{PAGENAME}}` plutôt que sur `''non renseigné''` quand le paramètre est
   vide — exception délibérée à la convention « cellule vide explicite »,
   documentée dans `Catégorie:Lieu` §Champs.
4. **Phrase de distinction `Located_at` / `physical_parent`** ajoutée dans
   `Catégorie:Lieu` § Définition : `physical_parent` (→ `Part_of`) dit
   « installé dans » entre deux items physiques, `Located_at` dit « se
   trouve à » vers un lieu.

## Pages écrites (createonly, une par édition)

| Page | Résumé | Révision |
|---|---|---|
| `Catégorie:Lieu` | `[Lot 9][Tâche 6] Création de Catégorie:Lieu — définition de la classe` | 533 |
| `Modèle:Lieu` | `[Lot 9][Tâche 6] Création de Modèle:Lieu — …` | 534 |
| `Le Buisson de Cerzat` | `[Lot 9][Tâche 6] Création de la page de lieu Le Buisson de Cerzat` | 535 → corrigée 540 |
| `Jardin de Chilhac` | `[Lot 9][Tâche 6] Création de la page de lieu Jardin de Chilhac` | 536 → corrigée 541 |
| `Terrasse de Chilhac` | `[Lot 9][Tâche 6] Création de la page de lieu Terrasse de Chilhac` | 537 → corrigée 542 |

Ordre d'écriture : catégorie puis modèle avant les pages de lieu, pour que
les trois transcluent un modèle déjà en place plutôt qu'un lien rouge.

## Anomalie trouvée à la vérification, corrigée dans la foulée

**Le type `Number` de SMW sur ce wiki n'accepte pas le point comme séparateur
décimal — il faut la virgule.** Les trois pages de lieu écrites une première
fois avec les valeurs de la consigne telles quelles (`45.171420`, `3.488276`,
etc.) ont produit, à la vérification `action=parse&prop=text`, un
avertissement SMW en tête de page rendue (« *« .171420 » ne peut pas être
affecté à un type de nombre déclaré avec la valeur 45* ») : le `#set` avait
compris `45` et rejeté `.171420` comme texte parasite, **sans qu'aucune
erreur ne remonte à l'écriture elle-même** — `wiki-put.sh` avait rendu
`"result": "Success"` sur les trois pages. Confirmé par `browsebysubject` :
`Latitude`/`Longitude` totalement absentes des faits stockés, seules `_INST`,
`_MDAT`, `_SKEY` présentes.

**Diagnostic fait sur `Utilisateur:Cywil/Bac à sable`** (lu avant, restauré à
l'identique après, conformément à sa vocation de page de test) :
`{{#set:|Latitude=45,171420}}` stocke correctement `45.17142` en interne —
confirmant que la locale FR de ce wiki attend une virgule en saisie, la
donnée étant re-normalisée au point en interne (donc lisible normalement par
tout `#ask`/export).

**Correction appliquée** : les trois pages de lieu réécrites (édition, pas
recréation) avec virgule décimale — `45,171420` / `3,488276`,
`45,155040` / `3,437188`, `45,155265` / `3,437144`. Résumé identique sur les
trois : `[Lot 9][Tâche 6] Correction Latitude/Longitude — virgule décimale
requise par le type Number SMW en locale FR`.

**`lot-9-tache6-proposition.md` mis à jour a posteriori** pour refléter la
version réellement en place (virgule), plus un paragraphe expliquant
l'incident — le document de proposition ne doit pas laisser croire que la
version point a jamais été correcte.

**Candidat pour les leçons de méthode de `CLAUDE.md`**, non ajouté ici (hors
demande de cette tâche) : *une écriture SMW peut réussir côté API
(`"result": "Success"`) tout en échouant silencieusement à peupler une
propriété — seule la lecture après coup (`browsebysubject` ou rendu) le
révèle. Vaut spécifiquement pour `Number` : virgule décimale, pas point, sur
ce wiki.* À faire consigner par Cyril s'il le juge utile.

## Vérifications finales (après correction)

- **Rendu des trois pages** (`action=parse&prop=text`) : aucun avertissement
  SMW, table complète, `Nom d'usage` retombe correctement sur le titre de
  page (`{{PAGENAME}}`), `Latitude`/`Longitude` affichées avec virgule.
- **`browsebysubject` des trois pages** : `Latitude` et `Longitude`
  présentes et numériques (`45.17142`, `3.488276`, etc. — normalisées au
  point en stockage interne), plus `_INST=Lieu#14##`, aucune `_ERRC`.
- **Requête inverse (`format=ul`, filtre `[[Category:Physical item]]
  [[Located_at::…]]`)** : affiche « *Aucun item physique rattaché à ce
  lieu.* » sur les trois pages — cohérent, aucun item physique n'a encore de
  `Located_at` renseigné (tâche 7, pas encore exécutée).
- **`Catégorie:Lieu` — `list=categorymembers`** : les trois pages y figurent,
  aucune autre.

## Suite

Tâche 6 close. Rien ne bloque la tâche 7 (génération depuis
`plants-2026-08.tsv`) côté lieux : les trois pages existent, `Located_at`
peut désormais y pointer.
