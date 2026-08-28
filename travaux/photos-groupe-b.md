# Groupe B tranché, demande adminsys mise à jour, entrée proposée

## 1. Les 8 photos du groupe B — écrites, une par une

Décision de Cyril : `Le Buisson de Cerzat` → `Terrain de Cyril au
Buisson de Cerzat`. Motif : ces photos documentent des éléments situés
sur le terrain, alors que *Le Buisson de Cerzat* est devenu le hameau —
une unité bien plus large depuis la migration du 25 août.

Même méthode que les 45 précédentes : ancre `|Image_location=Le Buisson
de Cerzat` (barre comprise), lecture avant, écriture, relecture après,
une page à la fois, script d'orchestration réutilisé à l'identique (seuls
la liste d'entrée et le fichier de sortie changent).

**8/8 écritures réussies, 8/8 relectures conformes** :

| Photo | oldrevid → newrevid |
|---|---|
| ECL-Buisson Cerzat-Couleuvre verte et jaune-2026-08-05_01.jpg | 664 → 1069 |
| ECL-Buisson Cerzat-Couleuvre verte et jaune-2026-08-05_02.jpg | 665 → 1070 |
| ECL-Buisson Cerzat-Couleuvre verte et jaune-2026-08-05_03.jpg | 666 → 1071 |
| ECL-Buisson Cerzat-Couleuvre verte et jaune-2026-08-05_04.jpg | 667 → 1072 |
| ECL-Buisson Cerzat-Couleuvre verte et jaune-2026-08-05_05.jpg | 668 → 1073 |
| ECL-Buisson Cerzat-Gainage cable-2026-08-07_01.jpg | 673 → 1074 |
| ECL-Buisson Cerzat-Raboutage cable gaine-2026-08-05_01.jpg | 699 → 1075 |
| ECL-Buisson Cerzat-Raboutage cable gaine-2026-08-05_02.jpg | 700 → 1076 |

Résumé utilisé sur les huit : `[Correctif] Image_location vers Terrain
de Cyril au Buisson de Cerzat`.

**Contrôle après** (file de travaux vidée : figée à 17 sur trois lectures
rapprochées, vidée à la quatrième, une minute plus tard) :

- `action=ask` en liste sur `[[Image_location::Le Buisson de Cerzat]]` :
  **0 résultat**. Le hash de requête renvoyé (`8abf92b9a49…`) est celui,
  déjà repéré, d'un résultat vide générique côté `action=ask` — un zéro
  qui repose sur ce hash n'a pas valeur de preuve à lui seul (voir
  `travaux/double-renommage-cloture.md`, point 2). **Recoupé par deux
  canaux indépendants** : `browsebysubject` sur l'une des huit confirme
  `Image_location -> Terrain_de_Cyril_au_Buisson_de_Cerzat`, et une
  requête positive `[[Image_location::Terrain de Cyril au Buisson de
  Cerzat]]` retrouve exactement les huit noms attendus, aucun autre. Le
  zéro est donc confirmé, pas seulement affiché.

Groupe A (45, tâche précédente) intact, non retouché ici.

## 2. `demandes-adminsys.md` — la demande passe à trois pages

Fichier modifié : `demandes-adminsys.md`, section
`$smwgChangePropagationProtection`.

Ajouté :
- `Attribut:Casc parent` et `Attribut:Casc lineage` rejoignent
  `Attribut:INSEE code` dans la liste des pages bloquées — code
  `smw-change-propagation-protection` vérifié le 27 août par
  `action=query&prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full`
  sur les deux, identique à celui d'`INSEE code`.
- Fait mesuré : `protection: []` reste vide sur les trois pages, tout du
  long — ce verrou n'est visible que par `intestactions`, jamais par le
  champ `protection` seul, quel que soit le nombre de pages concernées.
- Les deux pages Casc sont signalées **à supprimer, pas à corriger** :
  le déblocage demandé à fuzzy sert uniquement à permettre leur
  suppression, différent de la demande sur `INSEE code` (corriger
  `Property_range`, garder la page).
- Un troisième déclencheur possible ajouté à la liste des pistes non
  tranchées : un blanchiment retirant `Has type` avant suppression,
  distinct d'une création de propriété (le seul cas déjà documenté).

Titre de l'entrée mis à jour (« une seule page » → « trois pages ») pour
rester cohérent avec le corps du texte.

Aucune écriture sur le wiki pour ce point — modification du seul fichier
local `demandes-adminsys.md`.

## 3. Proposition d'entrée — *Limites connues du SGDT*

**Non écrite — proposition seulement**, comme demandé. Numérotation
actuelle : 32 entrées (après l'ajout du double renommage la veille) ;
celle-ci prendrait le n° 33.

Texte proposé, syntaxe SMW en `<code><nowiki>…</nowiki></code>` :

<code><nowiki>
# '''Blanchir une page de propriété avant de la supprimer la verrouille.''' Vider le wikitexte retire <code>Has type</code>, ce qui déclenche une propagation de changement ; si celle-ci se coince, la page devient inéditable et insupprimable. Mesuré le 27 août 2026 : <code>Attribut:Casc parent</code> et <code>Attribut:Casc lineage</code>, blanchies la veille, refusent toute modification avec <code>smw-change-propagation-protection</code>, tandis que <code>Attribut:Test lot11 keyword</code> et <code>Attribut:Test lot11 texte</code>, jamais blanchies, se sont supprimées sans difficulté. '''Pour supprimer une page de propriété, la supprimer directement''' — le blanchiment ne la retire pas du modèle de données et ajoute un verrou. Constat du même jour, à distinguer de ce qui précède : [[Erreurs de traitement SMW]] est resté à 1 alors que ces deux propriétés venaient d'être verrouillées — '''verrou de propagation et erreur de traitement sont deux mécanismes distincts, et l'audit <code>_ERRC</code> ne voit pas les pages bloquées.'''
</nowiki></code>

Point laissé ouvert par cette proposition, à ne pas lui faire porter
comme s'il était mesuré : la cause exacte qui fait qu'une propagation
« se coince » plutôt que se résoudre d'elle-même reste inconnue — la
demande à fuzzy (section 2 ci-dessus) porte là-dessus, pas cette entrée.

Je m'arrête là, comme demandé.
