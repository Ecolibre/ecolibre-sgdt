# Lot 12 — tâche 8 : essai des propriétés neuves sur deux valeurs réelles

Date : 12 octobre 2026.

Deux pages modifiées : le rang de la caisse et l'état de service du fer à
souder. Aucune création, aucun modèle ni formulaire touchés. Les huit
vérifications sont conformes. L'essai négatif montre qu'une valeur hors
énumération est signalée par un avertissement, mais que la fiche
d'exemplaire l'affiche quand même comme une valeur normale (voir Écarts).

## État du dépôt et règles locales au départ

- `git status` : seul `travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md`
  non suivi, hors compte comme prévu.
- `.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Mesures avant

Par `action=ask` en liste (longueur de `results`, aucune suite de pagination).

| Mesure | Attendu | Mesuré |
|---|---|---|
| Porteurs de `Storage_rank` | 0 | 0 |
| Porteurs de `Service_status` | 0 | 0 |
| Porteurs de `Label_date` | 0 | 0 |
| Physical item | 50 | 50 |
| Porteurs de `Contained_in` | 2 | 2 |
| Porteurs de `Located_at` (ajouté, pour comparer) | — | 45 |

Les deux pages, relues avant écriture, étaient inchangées depuis la
tâche 3 : caisse rév. 1512, fer rév. 1514. Aucune protection native.
`intestactions` : libres, une fois la session rouverte (voir Écarts).

## Pages écrites

| Page | Résumé | Result | Révision |
|---|---|---|---|
| Caisse en carton — Atelier appartement (CWL-000C) | `[Lot 12][Tâche 8] rang de la caisse dans sa pile` | Success | 1536 (précédente 1512) |
| Fer à souder — Atelier appartement (CWL-0009) | `[Lot 12][Tâche 8] le fer à souder est en service` | Success | 1537 (précédente 1514) |

Codes de sortie 0. Diffs : une ligne ajoutée sur chaque page,
`|Storage_rank=1` avant `|Located_at=Pile 1`, et `|Service_status=en service`
après `|Owned_by=CWL`. Les deux pages ont été prévisualisées avant écriture,
sans erreur. La date d'étiquette est restée vide partout. L'état de service
de la sacoche et de la caisse aussi.

## Vérifications

File : `bin/wiki-wait-jobs.sh` a annoncé « FILE FIGEE a 5 travaux » ; après la
pause de cinq minutes en arrière-plan, « FILE VIDE ». Purge de la caisse, du
fer et de Pile 1 avant relecture, tous `purged` et `linkupdate`.

1. **Faits de la caisse** : `Storage_rank -> ['1']`. Dans le JSON brut de
   `smwbrowse`, l'élément stocké est `{'type': 1, 'item': '1'}` : le type 1
   est un nombre, pas un texte. Les autres faits sont inchangés : `Located_at`
   Pile 1, `Inventory_ref` CWL-000C, `Instance_of`, `Owned_by` CWL. **Aucun
   `_ERRC`.** Conforme.
2. **Faits du fer à souder** : `Service_status -> ['en service']`, à côté de
   `Contained_in` vers la sacoche et des autres faits, inchangés. **Aucun
   `_ERRC`** : la valeur est acceptée par l'énumération fermée. Conforme.
3. **Type à l'exécution.** Requête
   `[[Storage_rank::+]]|?Storage_rank|?Service_status|?Planting_rank|sort=Storage_rank` :
   `Storage rank` → **`_num`**, `Service status` → `_txt`, témoin
   `Planting rank` → `_num`. Aucune erreur, et le tri sur `Storage_rank` est
   accepté. La valeur revient comme le nombre JSON `1`, et non comme la
   chaîne `"1"`. Avec un seul porteur, un ordre de tri ne peut pas encore se
   montrer ; le type numérique résolu et la valeur stockée en nombre sont ce
   qui garantit un tri numérique. Conforme.
4. **Essai négatif**, en lecture seule. Le texte suivant a été rendu par
   `action=parse` en POST, sans sauvegarde, dans le contexte de
   `Utilisateur:Cywil/Bac à sable`, et écrit sur aucune page : un témoin
   valide, puis « en rade » sous trois formes.
   - Témoin `[[Service_status::en service]]` : rend « en service », sans
     avertissement.
   - A, annotation `[[Service_status::en rade]]` : rend « en rade » suivi
     d'une icône d'avertissement (`smw-highlighter`, `smwtticon warning`).
     Message : « « en rade » n'est pas dans la liste (en service, en réserve,
     prêté, en panne, rebuté, perdu) des valeurs autorisées pour la propriété
     « Service status ». »
   - B, `{{#set:Service_status=en rade}}` : aucune valeur affichée, la même
     icône et le même message.
   - C, le modèle d'exemplaire appelé avec `Service_status=en rade` : la même
     icône et le même message **en tête, au-dessus de la table**, là où se
     trouve le `#set`. Dans la table, la ligne « État de service » affiche
     « en rade » **sans aucun signe**, comme une valeur valide.

   Ce que le wiki en fait, donc : la valeur est rejetée par la propriété et
   signalée par un avertissement discret, mais la fiche affiche quand même
   la valeur fautive dans sa ligne. Une valeur rejetée sur une page
   enregistrée irait aussi dans les erreurs de traitement (`_ERRC`). Je le
   tiens de `CLAUDE.md`, je ne l'ai pas mesuré, puisque rien n'a été
   enregistré. Preuve que l'essai n'a rien stocké : les faits du bac à sable
   sont identiques avant et après (`_MDAT` et `_SKEY` seulement, rév. 1273
   inchangée). Le seul porteur de `Service_status` reste le fer, avec « en
   service ». Le message de l'avertissement porte un lien vers
   `Attribut:Allows value`, page inexistante.
5. **Fiche de la caisse** : « Rang » → « 1 » ; « Se trouve à (Lieu) » →
   « Pile 1 » ; « État de service » → vide ; « Étiqueté le » → vide ;
   « Contient » → « Sacoche à outils — Atelier appartement (CWL-000D) |
   CWL-000D ». Conforme.
6. **Fiche du fer à souder** : « État de service » → « en service » ;
   « Rang » → vide ; « Se trouve à (Lieu) » → « Pile 1 », lien
   `<a href="/wiki/Pile_1" title="Pile 1">Pile 1</a>`, calculé par la
   contenance ; « Rangé dans (Contenant) » → « Sacoche à outils — Atelier
   appartement (CWL-000D) » ; « Étiqueté le » → vide. Conforme.
7. **Comptes** : `Storage_rank` 1, `Service_status` 1, `Label_date` 0 ;
   inchangés : Physical item 50, `Contained_in` 2, `Located_at` 45.
   Conforme.
8. **Erreurs et avertissements** sur les deux rendus : aucune classe `error`,
   `warning`, `smw-highlighter`, `smwttinline` ni `smw-callout`. Le même
   filtre a détecté l'avertissement de l'essai négatif : il pouvait le voir.
   Recoupé par `bin/wiki-warnings.sh` : « Aucun avertissement. » pour les
   deux pages. Conforme.

## Règles locales à la fin

`.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Écarts et surprises

- **La colonne « Rang » de la fiche de lieu ne montre pas le rang de
  rangement.** Sur Pile 1, la table « Présents ici » a pour colonnes Rang,
  Planté le, État. Cette colonne Rang lit `Planting_rank` (`Modèle:Lieu`,
  ligne 76, `|?Planting_rank = Rang`). La ligne de la caisse y est donc
  vide, alors que la caisse porte maintenant `Storage_rank` 1 : lignes
  extraites du rendu,
  `['', 'Rang', 'Planté le', 'État']` puis
  `['Caisse en carton — Atelier appartement (CWL-000C)', '', '', '']`.
  La fiche d'une pile ne peut donc pas montrer l'ordre d'empilement, et le
  mot « Rang » désigne désormais deux propriétés différentes selon la fiche.
  Rien n'a été touché. Voir la question A.
- **Une valeur hors énumération s'affiche comme valide dans la ligne de la
  fiche.** La propriété la rejette et le `#set` affiche un avertissement en
  tête de la table. Mais la ligne « État de service » recopie le paramètre
  brut, comme les autres lignes du modèle. Le formulaire limite le risque,
  puisque sa liste déroulante n'offre que les six valeurs. Il reste entier
  pour une édition directe du wikitexte. L'avertissement, placé loin de la
  ligne, est facile à manquer.
- **Session expirée au premier `intestactions`.** Le script l'a signalé
  (« session expirée — le résultat d'intestactions sera celui d'un visiteur
  anonyme ») et rendait `edit: False` pour les deux pages. Refait après
  `bin/wiki-login.sh` : libres. Aucune écriture n'a été tentée avec la
  session expirée.
- Le tri numérique de `Storage_rank` est garanti par le type, mais il n'a pas
  encore été montré, faute d'un second porteur.
- La file annoncée figée à 5 travaux était vide après la pause.

## Questions

**A.** Sur la fiche d'un lieu, la colonne « Rang » de « Présents ici » lit
`Planting_rank`, si bien que la pile ne montre pas le rang de sa caisse.
Faut-il que la fiche de lieu affiche aussi `Storage_rank` ? Suggestion, dans
une tâche ultérieure : ajouter à la table de `Modèle:Lieu` une colonne
`|?Storage_rank = Rang de rangement`, et renommer la colonne actuelle
« Position (m) », pour lever l'ambiguïté. Il faudrait aussi décider du tri
par défaut d'une pile.
