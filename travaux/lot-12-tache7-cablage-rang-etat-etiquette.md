# Lot 12 — tâche 7 : câblage du rang, de l'état de service et de la date d'étiquette, Supplier multivalué

Date : 11 octobre 2026.

Cinq pages modifiées en neuf éditions, aucune donnée créée. Les huit
vérifications sont conformes. La non-régression a été mesurée au-delà de ce
que la consigne demandait : tous les faits stockés par les deux modèles, sur
les 50 exemplaires et les 41 référencés, sont identiques avant et après,
pages réanalysées par purge.

## État du dépôt et règles locales au départ

- `git status` : seul `travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md`
  non suivi, hors compte comme prévu.
- `.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Lectures

`CLAUDE.md` ; la page du lot 12 (rév. 1503) ; sur le wiki
`Modèle:Physical item` (1517), `Formulaire:Physical item` (1502),
`Modèle:Referenced item` (1109), `Formulaire:Referenced item` (1110),
`Attribut:Supplier` (337), `Formulaire:Physical item/bloc facette végétal`
(1298). Aucune protection native. `intestactions` avant écriture : les cinq
pages sont libres.

`Attribut:Supplier` est de type Page : l'espace qui suit une virgule sera
absorbé par la normalisation du titre.

**Limites connues, sur le séparateur multivalué.** Deux entrées en traitent :
- la 31 : `Formulaire:Referenced item` n'a pas de `delimiter=,` explicite sur
  `Part_of`, sans conséquence puisque la virgule est le séparateur par défaut ;
- la 82 : la virgule décimale entre en conflit avec le séparateur sur une
  propriété **numérique** multivaluée.

La règle « le séparateur se rattache à la propriété qui le précède
immédiatement » ne figure pas dans les Limites connues. Elle vit dans
`CLAUDE.md`, dans les leçons sur `+sep=`, et dans les risques de la page du
lot.

## Mesures avant

Par `action=ask` en liste (longueur de `results`, aucune suite de pagination).

| Mesure | Attendu | Mesuré |
|---|---|---|
| Referenced item | 41 | 41 |
| Porteurs de `Supplier` | 34 | 34 |
| Porteurs de `Storage_rank` | 0 | 0 |
| Porteurs de `Service_status` | 0 | 0 |
| Porteurs de `Label_date` | 0 | 0 |

**Les 34 valeurs de `Supplier`**, une par page, aucune ne contenant de
virgule. Le séparateur ne pouvait donc rien couper.

| Page | Supplier |
|---|---|
| Ail éléphant Armand 2026 | Armand |
| Bidon 220L bleu plastique Borde | Borde |
| Bourrache La Closerie D'Olt 2026 | La Closerie D'Olt |
| Brocoli vivace La Closerie D'Olt 2026 | La Closerie D'Olt |
| Capucine tubéreuse Bene Bonno 2026 | Bene Bonno |
| Chayote La Closerie D'Olt 2026 | La Closerie D'Olt |
| Chayote origine inconnue | Non défini |
| Chou Daubenton Saint-André-de-Valborgne 2023 | Saint-André-de-Valborgne |
| Consoude B14 Escuroux 2025 | Escuroux |
| Consoude naine Escuroux 2025 | Escuroux |
| Crosnes du Japon Armand 2026 | Armand |
| Fraisier X origine inconnue | Non défini |
| Fraisier musqué origine inconnue | Non défini |
| Framboisier classique Haute-Loire 2020 | Haute-Loire |
| Framboisier jaune Pas-de-Calais 2024 | Pas-de-Calais |
| Groseillier Armand 2026 | Armand |
| Groseillier à maquereau Dunkerque 2024 | Dunkerque |
| Helianthi Le Jardin d'Emerveille 2025 | Le Jardin d'Emerveille |
| Hysope La Closerie D'Olt 2026 | La Closerie D'Olt |
| Hémérocalle Armand 2026 | Armand |
| Menthe X origine inconnue | Non défini |
| Menthe bergamote Escuroux 2025 | Escuroux |
| Miscanthus La Closerie D'Olt 2025 | La Closerie D'Olt |
| Miscanthus La Closerie D'Olt 2026 | La Closerie D'Olt |
| Oignon rocambole Escuroux 2025 | Escuroux |
| Paulownia Escuroux 2025 | Escuroux |
| Persil japonais La Closerie D'Olt 2025 | La Closerie D'Olt |
| Poireau perpétuel Escuroux 2025 | Escuroux |
| Roquette sauvage La Closerie D'Olt 2026 | La Closerie D'Olt |
| Sarrasin vivace Escuroux 2025 | Escuroux |
| Tanaisie Armand 2026 | Armand |
| Tomates Camille Buisson 2026 | Camille Buisson |
| Yacon La Closerie D'Olt 2025 | La Closerie D'Olt |
| Égopode Escuroux 2025 | Escuroux |

**Instantanés de non-régression**, pris avant écriture par un `action=ask`
mis en forme par un script du scratchpad (`instantane.py`, affiché avant
exécution). Une ligne par page et par propriété non vide :
- les 50 exemplaires, sur quinze propriétés : les neuf du bloc de stockage,
  les trois neuves, et `Specimen_status`, `Planting_date`, `Planting_rank`
  de la facette végétale. 381 lignes ;
- les 41 référencés, sur les dix-huit propriétés de leur modèle. 168 lignes.

## Prévisualisations

Par `action=parse` en POST, sans sauvegarde.

- `Modèle:Physical item` final, sur le fer et sur l'ail : les trois lignes
  nouvelles apparaissent vides, à leur place, sans erreur.
- Bulles `#info` du formulaire physique, rendues isolément : texte complet.
  La seule classe relevée est `smw-highlighter`, celle de la bulle
  d'information elle-même, et non un avertissement.
- `Modèle:Referenced item` final : avec `Supplier=Borde`, la ligne Fournisseur
  rend « Borde » ; sans fournisseur (fer Quicko), elle rend vide ; avec la
  valeur fictive `Borde, Armand`, rendu seulement, elle rend « Borde,
  Armand ».

## Pages écrites

| Page | Étape | Résumé | Result | Révision |
|---|---|---|---|---|
| Modèle:Physical item | 4 | `[Lot 12][Tâche 7] stocker le rang, l'état de service et la date d'étiquette` | Success | 1528 (précédente 1517) |
| Modèle:Physical item | 5 | `[Lot 12][Tâche 7] afficher le rang sur la fiche d'exemplaire` | Success | 1529 |
| Modèle:Physical item | 6 | `[Lot 12][Tâche 7] afficher l'état de service et la date d'étiquette` | Success | 1530 |
| Formulaire:Physical item | 7.1 et 7.2 | `[Lot 12][Tâche 7] champs de rang, d'état de service et de date d'étiquette` | Success | 1531 (précédente 1502) |
| Modèle:Referenced item | 8.1 | `[Lot 12][Tâche 7] Supplier accepte plusieurs fournisseurs` | Success | 1532 (précédente 1109) |
| Modèle:Referenced item | 8.2 | `[Lot 12][Tâche 7] Supplier accepte plusieurs fournisseurs` | Success | 1533 |
| Formulaire:Referenced item | 8.3 | `[Lot 12][Tâche 7] Supplier accepte plusieurs fournisseurs` | Success | 1534 (précédente 1110) |
| Attribut:Supplier | 9 | `[Lot 12][Tâche 7] déclarer Supplier multivalué` | Success | 1535 (précédente 337) |

Codes de sortie 0. Chaque diff local a été affiché avant écriture et ne
contenait que le remplacement prévu. Ordre « modèle avant formulaire »
respecté pour les deux classes. Les révisions de départ ont été relues
inchangées juste avant la première écriture sur chaque page. Après
écriture, le wikitexte en ligne des deux modèles et des deux formulaires est
identique, octet pour octet, aux fichiers envoyés.

## Vérifications

File : `bin/wiki-wait-jobs.sh` a annoncé « FILE FIGEE a 15 travaux », puis,
après la pause de cinq minutes en arrière-plan, « FILE FIGEE a 19 travaux » :
la file grossissait en traitant les quelque 90 pages qui transcluent les deux
modèles. Pour ne pas dépendre d'elle, j'ai purgé avec mise à jour des liens
les 34 référencés porteurs de Supplier, puis les 50 exemplaires : 34 et 50
`purged` et `linkupdate`, aucun avertissement de limitation. Toutes les
lectures qui suivent portent sur des pages réanalysées avec les nouveaux
modèles. Estimation de la file à 0 en fin de tâche.

1. **Non-régression de Supplier.** Après purge : 34 porteurs, et
   l'instantané des 41 référencés est **identique** à celui d'avant (`diff`
   vide). Les 34 valeurs sont exactement celles du tableau ci-dessus, une par
   page. Aucune ligne ne porte deux valeurs (0 ligne contenant « ; », séparateur
   de valeurs de l'instantané). Les dix-sept autres propriétés des référencés
   sont inchangées, `Part_of` et `Corresponds_to_organic` comprises : ce sont
   les voisines des séparateurs existants. Conforme.
2. **Fiche référencée portant un fournisseur.** Le fer Quicko n'en porte pas
   (voir Écarts) : j'ai pris `Bidon 220L bleu plastique Borde`. Ligne
   rendue : « Fournisseur » / « Borde », un lien unique :
   `<a href="/index.php?title=Borde&action=edit&redlink=1" class="new" title="Borde (page inexistante)">Borde</a>`.
   Ce n'est ni une liste vide ni une syntaxe cassée. Le lien est rouge parce
   que la page `Borde` n'existe pas ; c'était déjà le cas avec l'ancien
   modèle, qui écrivait le même `[[Borde]]` (voir Écarts). Conforme.
3. **Fiche du fer à souder.** Intitulés de la table, dans l'ordre :
   « Référence d'inventaire », « Modèle (Réf. technique) », « Description
   individuelle », « Numéro de série (Constructeur) », « Rangé dans
   (Contenant) », « Rang », « Se trouve à (Lieu) », « Appartient à
   (Propriétaire) », « État de service », « Étiqueté le », « Contient ». Les
   trois nouvelles lignes sont vides. Les huit anciennes sont toutes là, avec
   leurs valeurs : CWL-0009, Fer à souder Quicko T12-942, Non spécifié, la
   sacoche, Pile 1, CWL, « Cet item ne contient aucun sous-élément
   physique. » Conforme.
4. **Fiche de l'ail (ECL-0003).** « Rang », « État de service » et « Étiqueté
   le » sont vides. « Se trouve à (Lieu) » rend « Butte de la tranchée ». Le
   bloc « Facette végétale — exemplaire » est intact : « Date de plantation »
   2025-11-17, « Position depuis l'origine du lieu (m) » —, « Nombre
   d'individus » non compté, **« Statut » repris**, « Issu de » —, « Photo
   principale » non choisie, et quatre photos. C'est identique au rendu de la
   tâche 4. Conforme.
5. **Wikitexte des formulaires.** `Formulaire:Physical item` : `Storage_rank`
   ligne 24, `Service_status` ligne 33 (liste déroulante, six valeurs),
   `Label_date` ligne 36. Les sept lignes `{{#info:` se ferment sur leur
   propre ligne : aucune n'est coupée. `Formulaire:Referenced item` :
   `{{{field|Supplier|input type=combobox|values from property=Supplier|list|delimiter=,}}}`
   ligne 23, suivi de `Supplier_reference` ligne 26. Contenu en ligne
   identique aux fichiers envoyés. Conforme.
6. **Comptes**, après purge des 50 exemplaires : 0 porteur de
   `Storage_rank`, 0 de `Service_status`, 0 de `Label_date`. L'instantané des
   50 exemplaires sur quinze propriétés est **identique** à celui d'avant.
   Conforme.
7. **Attribut:Supplier** : `Property_cardinality` → `multiple` ; `_TYPE`
   toujours `_wpg` ; pas de `_CHGPRO`. `intestactions` : libre à 22:44:59,
   juste après l'écriture, et à 22:53:02, huit minutes après. Aucun verrou,
   comme l'annonçait la consigne. Conforme.
8. **Erreurs et avertissements** sur les rendus des points 2, 3 et 4 : aucune
   classe `error`, `warning`, `smw-highlighter`, `smwttinline` ni
   `smw-callout`. Recoupé par `bin/wiki-warnings.sh` : « Aucun
   avertissement. » pour les trois. Conforme.

## Règles locales à la fin

`.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Écarts et surprises

- **L'exemple de la vérification 2 ne portait pas de fournisseur.**
  `Fer à souder Quicko T12-942` porte `Manufacturer=Quicko`, un fabricant,
  et aucun `Supplier`. J'ai pris `Bidon 220L bleu plastique Borde`, et le fer
  Quicko a servi de cas sans fournisseur en prévisualisation.
- **Tous les liens Fournisseur sont rouges, avant comme après.** Aucune des
  douze pages de fournisseur n'existe : Armand, Bene Bonno, Borde, Camille
  Buisson, Dunkerque, Escuroux, Haute-Loire, La Closerie D'Olt, Le Jardin
  d'Emerveille, Non défini, Pas-de-Calais, Saint-André-de-Valborgne.
  `Attribut:Supplier` le dit lui-même (« aucune catégorie Fournisseur dédiée
  pour l'instant »). Ce n'est pas une régression de cette tâche. « Non
  défini », employé quatre fois comme fournisseur, est une valeur de
  remplissage stockée comme une page.
- **`combobox` avec `list` pour Supplier, alors que les cinq autres champs
  multivalués du même formulaire emploient `tokens`.** Je l'ai écrit tel que
  donné. Je n'ai pas pu vérifier que ce widget permet de choisir un second
  fournisseur par autocomplétion, plutôt que de le taper à la main après une
  virgule : une vérification par formulaire n'est jamais en lecture seule.
  Voir la question A.
- **Le découpage par `+sep=,` n'est pas encore éprouvé sur une vraie valeur
  double.** Cette tâche prouve qu'il ne casse rien : 34 valeurs simples
  intactes, voisines comprises. Elle ne prouve pas qu'il coupe « A, B » en
  deux valeurs. La prévisualisation ne stocke rien. C'est à l'essai de
  saisie de le montrer, par `bin/wiki-api.sh --facts` sur la page saisie :
  deux valeurs `Supplier` distinctes.
- **Les étapes 8.1 et 8.2 portent sur la même page**, alors que la consigne
  annonçait « trois remplacements, un par page ». J'en ai fait deux éditions
  distinctes de `Modèle:Referenced item` sous le résumé commun (1532 et
  1533), pour qu'elles s'annulent séparément. Les deux remplacements de
  l'étape 7, couverts par un seul résumé, sont passés en une édition (1531).
- **La liste des six états est désormais écrite à deux endroits**, la page de
  la propriété et la liste déroulante du formulaire, comme l'annonçait la
  consigne. Si la question B de la tâche 6 (ajouter `cédé`) est retenue, la
  correction portera sur les deux.
- La bulle `#info` se rend avec la classe `smw-highlighter`. Un filtre qui ne
  chercherait que cette classe la prendrait pour un avertissement.
  `bin/wiki-warnings.sh`, qui filtre sur `data-title="Avertissement"`, ne se
  trompe pas.
- La file annoncée figée grossissait en réalité (15 puis 19 travaux) : elle
  réanalysait les pages qui transcluent les modèles. Elle était à 0 en fin de
  tâche.

## Questions

**A.** Le champ Fournisseur du formulaire référencé est passé en `combobox`
avec `list`, alors que tous les autres champs multivalués de ce formulaire
emploient `tokens`. Je ne sais pas si ce widget propose l'autocomplétion pour
un second fournisseur, ou s'il faudra le taper à la main après une virgule.
Faut-il le garder ? Suggestion : le juger à l'essai de saisie prévu. Si le
second fournisseur ne se choisit pas aussi simplement que le premier, passer
le champ en
`input type=tokens|values from property=Supplier|list|delimiter=,`, comme
`Wanted_by`.
