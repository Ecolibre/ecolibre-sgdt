# Correctif du 4 octobre 2026 — numérotation : Tanaisie Armand 2026, lot 16, audit des banques d'inventaire

Consigne hors lot : toutes les écritures portent `[Correctif]`. Écritures faites le 4 octobre 2026 entre 22:04 et 22:05 (UTC), session ouverte le 5 octobre heure locale.

## Étape 0 — état du dépôt

`git status` : propre, aucune ligne. `.claude/settings.local.json` au début et à la fin : `allow` et `deny` vides, aucune règle.

## Étape 1 — Tanaisie Armand 2026

- Texte de départ conforme : `Item_ref` et `Corresponds_to_organic` vides, `Supplier=Armand`, `Sourcing_year=2026` (revid 1270).
- Mesure du maximum : `action=ask` sur `[[Category:Functional item||Organic item||Referenced item]] [[Item_ref::+]]`, tri `Item_ref` descendant, limite 1 → **002X**, porté par la page `Tanaisie`.
- Contrôle complémentaire : `[[Item_ref::002Y]]` → aucun résultat, la valeur était libre.
- **Valeur retenue : 002Y**, successeur Base 36 de 002X, maximum inchangé depuis la mesure du 4 octobre.
- Écriture : revid 1270 → **1421**, résumé `[Correctif] Referenced item sans référence : attribuer Item_ref et Corresponds_to_organic`.
- Vérification 1 (`browsebysubject`) : `Item_ref -> ['002Y']`, `Corresponds_to_organic -> ['Tanaisie']`, `Supplier -> ['Armand']`, `Sourcing_year -> ['2026']`, `_INST -> Referenced_item`. Stockés.

## Étape 2 — Lot 16 — Corrections du module de références

- Texte de départ conforme : trois puces dans « Ce qui est déjà tranché », phrase « Aucun écart consigné à ce jour. » (revid 1219).
- Écriture : revid 1219 → **1422**, résumé `[Correctif] lot 16 : corriger l'origine des rangs sautés et consigner l'arbitrage du 4 octobre 2026`.
- Vérification 2 : le wikitexte relu est identique octet pour octet au fichier envoyé (`diff` sans sortie). Tirets cadratins présents sur trois lignes : `Work_package_summary`, `Work_package_depends_on`, paragraphe « Point de départ » (deux tirets sur cette ligne, comme dans la page d'origine). Fait stocké : `Work_package_depends_on -> Lot_12_—_Contenants_et_étiquetage`, et la page `Lot 12 — Contenants et étiquetage` existe (pageid 485) : la dépendance pointe toujours sur le bon titre.

## Étape 3 — Modèle:Inventory numbering audit

- Page absente avant l'appel (`wiki-get.sh` : « The page you specified doesn't exist. »).
- Création avec `--createonly` : pageid 575, revid **1423**, résumé `[Correctif] créer l'audit des rangs libres des banques d'inventaire`.
- `browsebysubject` sur le modèle : aucun fait SMW, donc aucune annotation parasite.

## Étape 4 — Administration SGDT

- Texte de départ conforme : une section « Audit de la numérotation des Items » et la catégorie (revid 240).
- Écriture : revid 240 → **1424**, résumé `[Correctif] afficher l'audit des banques d'inventaire`.

## Vérification 3 — rendu d'Administration SGDT

Rendu lu par `action=parse`, sans purge nécessaire.

| Liste | Compte | Bornes |
|---|---|---|
| Audit Item_ref (existant) | 1 | 000J |
| Rangs libres ECL | **105** | 000A … 0043 (000A–000Z, 001A–001Z, 002A–002Z, 003A–003Z : 4 × 26 = 104, plus 0043) |
| Rangs libres CWL | **7** | 0001 … 0007 |

Catégories de la page : `SGDT` seule, aucune catégorie de suivi. Liens : un seul, vers *Limites connues du Système de Gestion de Données Techniques*, page existante.

## Écarts et surprises

- Aucune page ne différait du texte de départ indiqué ; aucune demande de confirmation hors cadre ; aucune question posée.
- Le rendu de l'audit Item_ref, après l'attribution de 002Y, montre toujours 000J seul : 002Y n'a créé ni trou ni doublon visible de l'audit (qui, rappel, ne détecte pas les doublons ; le contrôle `[[Item_ref::002Y]]` avant écriture en tenait lieu).
- `Item_ref` est de type `_cod` (code) : le tri descendant de la mesure est lexical. Il donne le bon maximum tant que toutes les valeurs ont quatre caractères en majuscules, ce qui est le cas ; à garder en tête si une valeur de longueur différente apparaissait un jour.
- La liste ECL affiche 000J parmi les rangs libres : c'est un trou de la banque d'inventaire ECL, sans rapport avec le 000J brûlé de la banque Item_ref. Le même code dans deux banques peut prêter à confusion à la lecture de la page d'administration, où les deux listes se suivent.
