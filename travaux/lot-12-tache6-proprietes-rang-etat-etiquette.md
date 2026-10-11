# Lot 12 — tâche 6 : propriétés du rang, de l'état de service et de la date d'étiquette

Date : 11 octobre 2026.

Trois propriétés créées : `Attribut:Storage rank`, `Attribut:Service status`,
`Attribut:Label date`. Aucun modèle, aucun formulaire, aucune donnée touchés.
**Aucun gel de type** : les trois rendent leur type voulu, et peuvent être
câblées en tâche 7. Un écart de fond : la description de `Storage_rank` dit
de `Planting_rank` une chose que les données démentent (voir Écarts,
question A).

## État du dépôt et règles locales au départ

- `git status` : seul `travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md`
  non suivi, hors compte comme prévu.
- `.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Lectures

`CLAUDE.md` ; la page du lot 12 (rév. 1503) ; sur le wiki
`Attribut:Planting rank`, `Attribut:Specimen status`,
`Attribut:Procurement route`. Les contenus de la consigne suivent leur forme :
`Has type`, deux descriptions, cardinalité, domaine, portée, et pour un texte
à liste fermée les `Allows value`.

## Mesures de l'étape 3

Par des requêtes du cœur MediaWiki seulement. Aucune requête sémantique n'a
nommé les trois propriétés avant leur création.

| Mesure | Attendu | Mesuré |
|---|---|---|
| Pages de l'espace Attribut (102), `list=allpages` | 139 | 139, dont 139 hors redirections, aucune suite |
| `Attribut:Storage rank` | absente | absente |
| `Attribut:Service status` | absente | absente |
| `Attribut:Label date` | absente | absente |

Mesure complémentaire, faite avant écriture et expliquée dans Écarts : les
22 valeurs de `Planting_rank` en base.

## Pages écrites

Toutes en `--createonly`, une seule écriture chacune, contenu recopié tel
quel.

| Page | Résumé | Result | Révision | Heure (UTC) |
|---|---|---|---|---|
| Attribut:Storage rank | `[Lot 12][Tâche 6] rang d'un exemplaire dans son contenant ou son lieu` | Success, création | 1525 | 20:27:27 |
| Attribut:Service status | `[Lot 12][Tâche 6] état de service d'un exemplaire physique` | Success, création | 1526 | 20:27:31 |
| Attribut:Label date | `[Lot 12][Tâche 6] date d'étiquetage d'un exemplaire physique` | Success, création | 1527 | 20:27:35 |

Codes de sortie 0. Les trois créations se sont suivies à quatre secondes
d'intervalle.

## Attente de la propagation

Sondes employées : `bin/wiki-api.sh --facts` et `intestactions`, rien
d'autre.

| Relevé | Heure locale | `_CHGPRO` Storage rank | `_CHGPRO` Service status | `_CHGPRO` Label date | Verrou d'écriture |
|---|---|---|---|---|---|
| Cycle 0, juste après création | 22:27:42 | présent | présent | présent | les trois : `smw-change-propagation-protection` |
| Après le cycle 1 | 22:33:14 | **absent** | **absent** | **absent** | les trois : `smw-change-propagation-protection` |

Cycle 1 : `bin/wiki-wait-jobs.sh` a annoncé « FILE FIGEE a 10 travaux », puis
une pause de cinq minutes a eu lieu en arrière-plan. **Un cycle a suffi** :
`_CHGPRO` a disparu des trois en moins de six minutes.

Faits lus après le cycle 1 :

- `Storage rank` : `_TYPE` `…#_num`, `Property_cardinality` single,
  `Property_domain` `Physical_item#14##`, `Property_range` « entier
  consécutif, à partir de 1 », les deux descriptions, `_MDAT`, `_SKEY` ;
- `Service status` : `_TYPE` `…#_txt`, `_PVAL` avec les six valeurs (en
  service, en réserve, prêté, en panne, rebuté, perdu), même cardinalité et
  même domaine, `Property_range` « énumération fermée », les deux
  descriptions ;
- `Label date` : `_TYPE` `…#_dat`, même cardinalité et même domaine,
  `Property_range` « date de calendrier », les deux descriptions.

Le verrou d'écriture est toujours posé sur les trois à 22:33. Conformément à
`CLAUDE.md`, ce n'est ni un critère ni un obstacle au stockage, et il est
consigné ici. Il retarde en revanche toute correction des trois pages, ce qui
compte pour la question A.

## Contrôle des types résolus

Un seul `action=ask`, à 22:33:22 :
`[[Category:Physical item]]|?Storage_rank|?Service_status|?Label_date|?Located_at|?Planting_rank|limit=1`.
Aucune erreur.

| Entrée (`label`) | `typeid` lu | Attendu |
|---|---|---|
| (vide, colonne du sujet) | `_wpg` | `_wpg` |
| Storage rank | **`_num`** | `_num` |
| Service status | **`_txt`** | `_txt` |
| Label date | **`_dat`** | `_dat` |
| Located at (témoin) | `_wpg` | `_wpg` |
| Planting rank (témoin) | `_num` | `_num` |

Les deux témoins rendent leur type : la lecture est valide. Aucune des trois
propriétés neuves n'est gelée. Les trois peuvent être câblées.

## Règles locales à la fin

`.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Écarts et surprises

- **La description de `Storage_rank` décrit mal `Planting_rank`.** Elle dit
  que `Planting_rank` « compte en mètres depuis une origine et procède par
  incréments de dix pour insérer sans renuméroter ». J'ai mesuré l'inverse
  avant d'écrire.
  - Les 22 valeurs en base sont des positions mesurées en mètres, avec
    décimales : 0,8 ; 9,7 ; 22,2 ; 26,8 ; 32,2 ; 37,1 ; 37,5 ; 41,4 ; 42,8 ;
    43,2 ; 44,2 ; 45,9 ; 46,6 ; 48,7 ; 49,6 ; 53,1 ; 54,3 ; 56,2 ; 58,3 ; 61 ;
    68,2 ; 82. Aucun pas de dix.
  - `Attribut:Planting rank` dit « en mètres depuis l'origine du lieu […]
    décimales admises ».
  - `Modèle:Physical facet plant/doc` ne parle d'aucun incrément.

  Une position mesurée ne se renumérote jamais, puisque c'est une distance et
  non un ordre. Le contraste avec le rang de pile tient donc toujours, mais
  pas pour la raison écrite. Je n'ai rien écrit au-delà de la consigne : le
  texte est en place tel que donné, en français et en anglais. Les trois
  pages sont verrouillées, et la correction attendra le déverrouillage :
  quelques heures à quatre jours selon `CLAUDE.md`. Voir la question A.
  L'erreur vient de la page du lot, dont le point « Le rang dans un
  contenant… » dit déjà « par incréments de dix pour insérer sans
  renuméroter ».
- **La description de `Label_date` tranche une question que la page du lot
  présente autrement.** La page du lot, à « Ce qui est déjà tranché », dit
  que l'étiquette d'un contenant « liste un contenu qui change » et « dérive,
  et c'est assumé ». Elle laisse aussi ouverte la question d'une seconde
  propriété de date pour les contenants. La description écrite dit l'inverse
  sur le premier point : l'étiquette ne porte que la référence, contenants
  compris, et ne périme jamais. Elle règle le second : une seule propriété.
  La page du lot est donc à reprendre sur ces deux points, à la clôture ou
  avant. Je n'y ai pas touché.
- **Le vocabulaire de `Service_status` n'a pas de valeur pour « cédé ».** La
  page du lot énumère « Détruit, perdu ou cédé » comme fins de vie. La liste
  fermée porte `rebuté` et `perdu`, et `prêté` désigne une sortie
  temporaire. Un objet donné ou vendu n'a donc aucune valeur juste. Ajouter
  une valeur autorisée modifie la propriété et la reverrouille. Mieux vaut
  donc trancher avant le câblage de la tâche 7. Voir la question B.
- **`Catégorie:Lieu` dit encore « mètres entiers » pour `Planting_rank`**, à
  la section sur l'origine d'un lieu. La documentation de la facette dit que
  cette convention est tombée le 4 septembre 2026 au profit des décimales.
  Passage antérieur au lot, non touché.
- **Capture d'écran reçue avec la consigne** : un avis de Claude Code annonce
  que le mode Auto devient le mode d'autorisation par défaut. Le dépôt fixe
  `"defaultMode": "acceptEdits"` dans `.claude/settings.json`, ligne 4. Le
  changement de défaut du produit ne devrait donc pas s'appliquer à ce dépôt.
  Je ne peux pas l'observer : l'exécuteur ne voit pas les fenêtres de
  confirmation, ni le mode actif.
- Donnée pour le décompte des gels tenu dans `CLAUDE.md` : trois propriétés
  créées en rafale de quatre secondes, aucune gelée, `_CHGPRO` levé en moins
  de six minutes. `_PVAL` de `Service status` portait d'emblée ses six
  valeurs, sans le retard décrit dans `CLAUDE.md` pour `Specimen_status`.
- La file annoncée figée à 10 travaux n'a rien empêché : `_CHGPRO` avait
  disparu au relevé suivant.

## Questions

**A.** La description de `Storage_rank` attribue à `Planting_rank` des
« incréments de dix pour insérer sans renuméroter ». Les données et la
documentation de la facette montrent des positions mesurées en mètres, avec
décimales. Faut-il corriger les deux descriptions une fois la page
déverrouillée, et la page du lot avec elles ? Suggestion pour la phrase
française : « À ne pas confondre avec Planting_rank, qui mesure une position
en mètres depuis l'origine du lieu, décimales admises : une position mesurée
ne se renumérote jamais. Ici c'est l'inverse : le rang est un ordre, et
insérer au milieu d'une pile décale physiquement tout ce qui est au-dessus. La
renumérotation reflète alors ce qui se passe réellement. » La phrase anglaise
suivrait le même sens. Le verrou se vérifie par `intestactions` avant
d'écrire.

**B.** `Service_status` n'a pas de valeur pour un objet donné ou vendu, alors
que la page du lot cite « cédé » parmi les fins de vie. Faut-il ajouter
`cédé` aux valeurs autorisées avant le câblage de la tâche 7 ? Suggestion :
oui, en une écriture `[Lot 12][Tâche 7]` ou `[Correctif]` une fois la page
déverrouillée. La valeur se vérifie ensuite en réenregistrant un item réel
qui la porte, puisque `_PVAL` peut être en retard.
