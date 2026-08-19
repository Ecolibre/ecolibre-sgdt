# Lot 9 — Tâche 7 : rapport de génération

102 pages créées en une seule session, dans l'ordre imposé (30 organiques,
32 référencés, 40 plantations), source unique `lot-9-tache7-manifeste.md`,
aucune valeur recalculée depuis le TSV. `createonly` sur les 102, sans
exception — toutes ont réussi (`result: Success`), aucune collision.

Ordre d'écriture des plantations : id 1→20, puis **22 avant 21** et **32
avant 31** (les deux filiations du manifeste), puis 23→30, 33→40 — pour
qu'une plantation ne soit jamais créée avant celle que son `Propagated_from`
désigne. `id 1` (mère de 39 et 40) est de toute façon la toute première.

Item_description de `ECL-0042` : le texte donné par Cyril (« Trois caïeux
conservés dans une conserve en verre, dans le dôme, en attente de mise en
terre à l'automne 2026. »), pas le texte-espace réservé du manifeste.

## Vérification 1 — browsebysubject, 100 % des pages

Les 102 titres, un `browsebysubject` chacun, propriété par propriété contre
le manifeste. Pièges de sérialisation à ne pas confondre avec de vrais
écarts (leçon de méthode déjà connue, revérifiée ici sur les types
concernés) :
- propriétés de type Page (`Instance_of`, `Located_at`,
  `Corresponds_to_organic`, `Propagated_from`, `Supplier`, `Item_facet`) :
  stockées avec underscore et suffixe `#0##` — comparées par titre normalisé,
  pas par égalité de chaîne brute.
- `Planting_date` (type SMW Date) : sérialisé `1/AAAA/M/J` (composants
  numériques non préfixés de zéro) — comparé composant par composant, pas
  par égalité de chaîne avec l'ISO du manifeste.

**101/102 conformes exactement.** Un écart réel :

**`Ail éléphant — Le Buisson de Cerzat (ECL-0042)` : `Specimen_status`
absent du magasin SMW**, alors que `en réserve` est bien dans le wikitexte
écrit (vérifié par relecture directe de la page). Cause trouvée via
`_ERRC`/`_ERRT` sur le sujet : `smw-constraint-error-allows-value-list` —
`Attribut:Specimen status` n'autorise que `en place, repris, souffrant,
mort, remplacé` (relu en ligne, cinq valeurs, pas six). `en réserve` en est
absent, donc **rejeté silencieusement au stockage**, pas seulement mal
affiché. `Item_facet`, `Propagated_from` et `Planted_count` du même `#set`
sont bien stockés : le rejet ne porte que sur la propriété fautive, pas sur
tout le bloc (nuance par rapport à ce qu'anticipait `lot-9-tache0-rapport.md`
— « ni facette, ni catégorie, ni ligne de récapitulatif » — le `#if` qui
déclenche le `#set` s'évalue sur le paramètre de template brut, pas sur le
résultat de la contrainte SMW).

**Déjà documenté, pas nouveau : « restent dues, non appliquées : correction
sur `Attribut:Specimen_status` (ajout de `en réserve`) » dans
`lot-9-tache0-rapport.md`, et un verrou de propagation SMW empêchant
actuellement toute modification des pages `Attribut:` créées ce jour-là.**
Je n'ai pas touché à `Attribut:Specimen status` : modification de modèle
hors périmètre de cette tâche, et probablement bloquée par ce même verrou.
**Signalé, non corrigé — à traiter par Cyril.**

Le wikitexte de la page est correct et n'a besoin d'aucune correction :
une fois `Attribut:Specimen status` mis à jour et le verrou levé, la
propriété se stockera au prochain enregistrement (réédition ou purge selon
ce que permet le verrou), sans retoucher la page.

## Vérification 2 — doublons Inventory_number

`Category:Physical item` filtré `Inventory_site::ECL` : **42 valeurs, 42
distinctes**, `0001` à `0042` sans trou ni doublon (0001/0002 préexistants,
0003–0042 créés aujourd'hui).

## Vérification 3 — intégrité référentielle

Couverte par la vérification 1 (comparaison par titre normalisé) pour les
40 `Located_at`, 40 `Instance_of`, 32 `Corresponds_to_organic`, 4
`Propagated_from` : tous résolus vers la bonne page, aucun lien erroné.

## Vérification 4 — comptage par catégorie

| Catégorie | Total wiki | Préexistant | Nouveau (session) | Attendu |
|---|---|---|---|---|
| Organic item | 33 | 3 (`Bidon 220L`, `Cuve de récupération d'eau`, `Transfert d'eau par vases communicants`) | 30 | 30 |
| Referenced item | 34 | 2 (`Batterie défaillante récupérée`, `Bidon 220L bleu plastique Borde`) | 32 | 32 |
| Physical item | 43 | 3 (`Batterie de récupération trotinette 1`, `Bidon 220L Bleu 1`, `Bidon 220L Bleu 2`) | 40 | 40 |

Exact sur les trois, par différence titre à titre avec le manifeste (pas
seulement par arithmétique) — aucune page en trop, aucune manquante.

## Écart à traiter

Un seul, déjà signalé ci-dessus : `Specimen_status=en réserve` non stocké
sur `ECL-0042`, faute de `en réserve` dans `Allows value` de
`Attribut:Specimen status` — correction connue depuis la tâche 0,
toujours due, potentiellement bloquée par un verrou de propagation SMW côté
serveur.
