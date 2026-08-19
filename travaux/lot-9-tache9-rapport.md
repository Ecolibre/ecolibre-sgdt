# Lot 9 — Tâche 9 : rapport de la page récapitulative

## Page créée

`Avancement du jardin-forêt`, créée `--createonly` (n'existait pas), revid 724,
résumé `[Lot 9][Tâche 9] Création page récapitulative Avancement du jardin-forêt
(par lieu + chiffres, tout par requête)`. Aucune donnée écrite en dur : les
trois tableaux, les trois galeries et la section Chiffres sont entièrement
portés par des `#ask`, comme demandé.

## Écart signalé, non corrigé : 29 plantations au Buisson de Cerzat, pas 28

La commande donnait `Le Buisson de Cerzat (28 plantations)`. La page en
affiche **29**, purge faite puis vérifiée par `action=parse&prop=text` (pas
seulement en aperçu). Cause vérifiée avant d'écrire quoi que ce soit :
`plants-2026-08.tsv`, déjà commité (`f99f78b`), compte lui-même **29** lignes
`lieu=Buisson_Cerzat` (`awk` sur les 40 lignes à `id` numérique) — 29 + 6 + 5
= 40, cohérent avec le total du lot. La page ne ment donc pas : elle reflète
un TSV déjà en place dont le compte par lieu ne correspond pas à ce que la
tâche annonçait (39 au lieu de 40 dans l'énoncé). Je n'ai pas cherché lequel
des 29 serait « en trop » ni retouché le TSV ni le wiki — pas dans le
périmètre de cette tâche, et risque de division par un item réel. Signalé ici
pour arbitrage, comme le veut la règle « une requête qui rend un résultat
inattendu est un défaut à signaler, pas à contourner ».

## Vérifications faites après écriture + purge

- 3 tableaux (`format=table`, `sort=Inventory_number`, jamais de tri sur
  `Planting_rank`/`Planting_date` — leçon tâche 6bis) : **29 / 6 / 5** lignes,
  comptés sur le HTML rendu, pas supposés.
- 3 galeries (`format=gallery`, `sort=Image_date`, `limit=12`, sans
  `default=` — inerte en `format=gallery`, leçon tâche 5) : 12 / 12 / 5
  vignettes (Buisson et Jardin plafonnés par `limit=12`, réellement 44 et 14
  photos disponibles ; Terrasse à 5, sous le plafond).
- Section Chiffres, entièrement par `#ask` :
  - Par état (`Specimen_status`, les 5 valeurs autorisées lues sur
    `Attribut:Specimen_status`, pas supposées) : en place 37, repris 1,
    souffrant 0, mort 1, remplacé 0 — total 39, plus 1 item sans état
    renseigné (`Ail éléphant — Le Buisson de Cerzat (ECL-0042)`, `en
    réserve` au TSV mais « en réserve » n'est pas une valeur autorisée de
    `Specimen_status` — vide sur le wiki, écart pré-existant, non traité
    ici) = 40.
  - Total des plantations sur les 3 lieux : 40, cohérent.
  - Espèces distinctes : **30**, cohérent avec les 30 items organiques du
    manifeste tâche 7.

## Point de méthode SMW à noter

`format=count` ne peut pas être testé fiablement via `action=ask` de l'API
(retourne systématiquement `count: 0`, y compris sur une requête dont le
résultat réel est non nul) — ce format ne se rend correctement que via le
parseur wikitexte. Testé en aveugle par `action=parse&text=...&title=...`
(sans écrire), qui restitue le rendu réel sans toucher au wiki : c'est ce
canal qui a servi à valider chaque `#ask` avant l'écriture de la page.

Le compte d'espèces distinctes n'a pas d'équivalent direct en SMW natif
(pas de `distinct=true` sur `format=count`, paramètre silencieusement
ignoré, vérifié). Contournement par une requête à partir de
`Category:Organic item`, remontant deux propriétés en sens inverse
(`-Corresponds_to_organic` puis `-Instance_of`, chacune avec une sous-requête
`<q>...</q>`) jusqu'au filtre `Located_at` sur les 3 lieux — fonctionne, mais
fragile : cassera silencieusement (résultat 0, pas d'erreur) si
`Corresponds_to_organic` ou `Instance_of` changent de nom ou de sens.

## Protection

`prop=info&inprop=protection` vérifié avant écriture sur le titre visé :
aucune entrée de protection. Écriture réussie du premier coup.
