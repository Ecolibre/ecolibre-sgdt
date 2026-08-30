# Lot 12 — création de la page de cadrage « Contenants et étiquetage »

*Session du 30 août 2026.*

/ Première page de lot du wiki. Elle inaugure la forme des neuf lots identifiés
dans « Lots à venir » de [Gestion des lots]. Contenu arrêté en conversation
avec Cyril, repris tel quel, mis en forme wiki — ni réécrit, ni enrichi, ni
résumé.

## Ce qui a été posé sur le wiki

### Page créée — `Lot 12 — Contenants et étiquetage`

- URL : https://wiki.ecolibre.org/wiki/Lot_12_%E2%80%94_Contenants_et_%C3%A9tiquetage
- pageid 485, revid 1127, création `--createonly` (Success, `new: true`).
- Résumé d'édition : `[Lot 12][Cadrage] Création de la page de cadrage du lot 12 — contenants et étiquetage`
- Page statique, sans propriété ni catégorie de classe ni `#ask`, comme
  *Gestion des lots*, en attendant le lot qui transformera ces pages en classe
  sémantique.

Structure : phrase-chapeau en gras, puis les neuf sections de niveau 2 dans
l'ordre fixé — État, Objet, Dépendances, Ce qui est tranché, Ce qui reste à
trancher, Périmètre, Point de départ, Risques connus, Rapports —, puis un pied
de page `----` et une ligne « Voir aussi » vers *Gestion des lots*, la *Feuille
de route* et les *Limites connues*, sur le modèle de *Guide de saisie* et
*Procédés et outils*.

Mise en forme appliquée :

- **Section 1 (État)** : « À créer » et la date du cadrage (30 août 2026) en
  tête de section, avant tout le reste.
- **Section 4 (Ce qui est tranché)** : treize arbitrages en liste à puces, gras
  sur la décision, motif hors gras. Aucun motif tronqué — c'est lui qui dira
  plus tard quand la décision cesse d'être valable.
- **Section 9 (Rapports)** : phrase indiquant que les rapports d'exécution
  restent dans `travaux/` et sont liés en permaliens sur un SHA de commit,
  jamais sur un nom de branche.
- Listes partout où le texte énumère (sections 4, 5, 6, 7, 8).

Traitement de la syntaxe SMW : **aucun `<nowiki>` nécessaire**. Le texte fourni
par Cyril écrit déjà toute la syntaxe SMW en toutes lettres (« une négation du
type propriété deux-points deux-points point d'exclamation plus ») et les noms
de propriétés sans les `::`. Ces noms (`Part_of`, `Instance_of`, `Located_at`,
`Contained_in`, `Planting_rank`, `Supplier`, `Corresponds_to_organic`,
`Procurement_route`, `Property_range`), ainsi que les noms de pages
(`Module:Base36`, `Modèle:Physical item`, `Catégorie:Lieu`,
`Catégorie:Physical item`, `Attribut:`) et de fonctions d'analyseur (`#show`,
`#set`), sont en `<code>` sans crochets ni accolades — donc inertes. Les seuls
`[[ ]]` de la page sont les trois liens du pied de page.

Détail de reprise : la phrase « À afficher avant tout le reste. » qui termine
le texte de la section 1 a été traitée comme consigne de mise en forme (doublon
de la précision de mise en forme n° 1), pas comme contenu de la section.

### Page modifiée — `Gestion des lots`

- pageid 484, revid 1128 (depuis 1126… en fait 1126 → 1128, une écriture
  intermédiaire 1127 étant la création de la page Lot 12).
- Résumé d'édition : `[Lot 12][Renvoi croisé] « Lots à venir » : l'entrée contenants pointe vers la page de cadrage`
- Une seule ligne changée, la 3ᵉ entrée de « Lots à venir » :

  ```
  - # '''Contenants et étiquetage.''' Séparer « contenir » de « composer » …
  + # '''[[Lot 12 — Contenants et étiquetage|Contenants et étiquetage]].''' Séparer « contenir » de « composer » …
  ```

  Phrase de description conservée à l'identique. Aucune autre entrée touchée,
  aucun autre passage de la page touché. Longueur : 10501 → 10542 octets,
  soit +41 octets, ce qui correspond exactement au préfixe
  `[[Lot 12 — Contenants et étiquetage|` (39 octets, tiret cadratin = 3) et au
  suffixe `]]` (2 octets).

## Vérifications (étape 4)

| Contrôle | Résultat |
|---|---|
| `browsebysubject` sur `Lot 12 — Contenants et étiquetage` | `_MDAT` et `_SKEY` seuls. Aucune propriété du modèle de données. ✅ |
| Rendu de la page, recherche de `[[ ]]` / `{{ }}` littéraux hors exemples | 0 occurrence de `[[`, `]]`, `{{`, `}}` dans le texte rendu. ✅ |
| Lien `Gestion des lots` → `Lot 12` résout | `list=backlinks` sur Lot 12 : `Gestion des lots` présent. ✅ |
| Lien `Lot 12` → `Gestion des lots` résout | `prop=links` sur Lot 12 : `Gestion des lots`, `Feuille de route…`, `Limites connues…` — les trois cibles existent (`prop=info`). ✅ |
| `list=backlinks` sur `Lot 12 — Contenants et étiquetage` | une entrée : `Gestion des lots`. ✅ |

File des travaux SMW : figée à 5 jobs pendant l'attente (`wiki-wait-jobs.sh`),
sans incidence — la vérification `browsebysubject` a été faite après et rend
l'état attendu.

## Écarts

Aucun. Le contenu des neuf sections n'était pas dans le premier message ; il a
été demandé et fourni dans un second message avant toute écriture. Reprise à
l'étape 2 comme demandé.

## Suivi

- Le lot 12 est **cadré, non exécuté**. Il rejoint « Lots à venir ».
- Point d'attention pour l'exécution, déjà noté dans la page : vérifier sur le
  wiki vivant que **rien ne porte encore `Part_of`** (condition de la fenêtre à
  coût nul) et qu'une **chaîne de propriétés à cinq sauts** fonctionne sur
  cette installation (trois sauts prouvés, cinq non).
- Les huit autres lignes de « Lots à venir » restent en texte simple : elles
  deviendront des liens quand leurs pages de cadrage seront rédigées, sur la
  forme inaugurée ici.

[Gestion des lots]: https://wiki.ecolibre.org/wiki/Gestion_des_lots
