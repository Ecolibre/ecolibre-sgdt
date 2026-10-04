# Lot 21, tâche 4 — trois corrections

Exécuté le 4 octobre 2026 (heure de Paris) par Claude Code, sur consigne
« Pour Claude Code. ».

## Résultat

Trois pages du wiki ont été réécrites, chacune une fois :

| Page | Pageid | Révision lue | Nouvelle révision | Horodatage (UTC) | Résumé |
|---|---|---|---|---|---|
| Lot 21 — Grandeurs et unités | 532 | 1414 | **1415** | 2026-10-04T00:06:22Z | `[Lot 21][Tâche 4] Phrase corrigée — unité affichée par défaut` |
| Limites connues du Système de Gestion de Données Techniques | 144 | 1413 | **1416** | 2026-10-04T00:06:23Z | `[Lot 21][Correctif] Limites connues — exemples protégés par nowiki, entrée 42 complétée` |
| Récapitulatif technique du Système de Gestion de Données Techniques | 27 | 1388 | **1417** | 2026-10-04T00:06:24Z | `[Lot 21][Correctif] Récapitulatif — exemple de lien protégé par nowiki` |

Dans le dépôt, `CLAUDE.md` a aussi été modifié : la leçon « Les backticks
ne protègent rien en wikitexte » reçoit le texte F. Les douze pages
d'essai restent en place.

## Départ

- `git status` : aucune ligne modifiée, ajoutée, supprimée ou renommée.
  Six fichiers non suivis dans `travaux/`, qui ne comptent pas.
- Les quatre fichiers nommés n'existaient pas.
- Révisions courantes : 1414 pour le lot 21, 1413 pour les Limites
  connues et 1388 pour le Récapitulatif, conformes à l'attendu.

**Unicité des chaînes à remplacer.** Chacune apparaissait exactement une
fois dans son fichier :
- A1 dans `pages/Lot_21_correction_affichage.txt` ;
- B1, C1 et D1 dans `pages/Limites_connues_correction_lot21.txt` ;
- E1 dans `pages/Recapitulatif_correction_lot21.txt`.

Il n'existait aucune autre occurrence de `@@@@` dans les Limites connues
(ligne 77 seulement), ni de `[[...` dans le Récapitulatif (ligne 350
seulement). La numérotation a été contrôlée avant toute écriture : la
première entrée est à la ligne 26, donc la ligne 67 est l'entrée 42 et la
ligne 77 l'entrée 52.

## Diffs avant envoi

**Page du lot** (`diff pages/Lot_21_mesure.txt pages/Lot_21_correction_affichage.txt`) : une seule ligne changée.
```
29c29
< '''Le mode scalaire est porté par le type Quantity, et les températures par le type Temperature.''' Mesuré en bac à sable le 4 octobre 2026 (rapport lié en tête de page). En locale française, la virgule décimale est acceptée, dans les valeurs comme dans les facteurs de conversion. La valeur est stockée dans l'unité principale et se relit exactement dans l'unité de saisie : 800 L/h, stocké en mètres cubes par seconde, se relit 800 L/h. Les requêtes comparent d'une unité à l'autre. Cet arbitrage révise la convention du [[Lot 8 — Facettes de type d'item|lot 8]] — type Number, unité écrite dans la portée de la propriété — ([https://github.com/Ecolibre/ecolibre-sgdt/blob/c73d88a5931d1ceec88964029c97f6774f21ce6b/travaux/lot-8-amendement-1.md amendement 1 du lot 8], section 6).
---
> '''Le mode scalaire est porté par le type Quantity, et les températures par le type Temperature.''' Mesuré en bac à sable le 4 octobre 2026 (rapport lié en tête de page). En locale française, la virgule décimale est acceptée, dans les valeurs comme dans les facteurs de conversion. La valeur est stockée dans l'unité principale ; elle s'affiche par défaut dans la première unité d'affichage déclarée, et sur demande dans toute autre unité déclarée : saisies en litres par heure, en mètres cubes par seconde et en mégalitres par jour, les trois valeurs d'essai se sont relues exactes en litres par heure. Les requêtes comparent d'une unité à l'autre. Cet arbitrage révise la convention du [[Lot 8 — Facettes de type d'item|lot 8]] — type Number, unité écrite dans la portée de la propriété — ([https://github.com/Ecolibre/ecolibre-sgdt/blob/c73d88a5931d1ceec88964029c97f6774f21ce6b/travaux/lot-8-amendement-1.md amendement 1 du lot 8], section 6).
```

**Limites connues** (`bin/wiki-get.sh … | diff - pages/Limites_connues_correction_lot21.txt`) :
deux lignes changées, les entrées 42 et 52.
```
67c67
< # '''Une balise <code>code</code> (entre chevrons) n'échappe rien.''' […inchangé…] (<code>prop=categories</code>) : une catégorie de suivi — liens brisés, liens de fichiers brisés — apparue sans qu'on l'ait posée signale une syntaxe non échappée.
---
> # '''Une balise <code>code</code> (entre chevrons) n'échappe rien.''' […inchangé…] (<code>prop=categories</code>) : une catégorie de suivi apparue sans qu'on l'ait posée, comme celle des liens de fichiers brisés, signale une syntaxe non échappée. '''Ce contrôle ne suffit pas : il faut examiner aussi les liens de la page''' (<code>prop=links</code>), et n'en trouver aucun vers une page inexistante. Un lien vers une page ordinaire inexistante ne pose aucune catégorie de suivi : seuls les liens de fichiers brisés en posent une. Constaté le 4 octobre 2026 : deux exemples entourés d'une balise <code>code</code> sans balise <code>nowiki</code>, l'un dans l'entrée 52 de cette page, l'autre dans le Récapitulatif technique, créaient des liens vers des pages inexistantes, « @@@@ » et « ... », sans qu'aucune catégorie le signale ; la liste des pages demandées du wiki les a révélés.
77c77
< # '''Un lien construit par <code>#arraymap</code> catégorise la page au lieu de la lier, dès qu'une valeur est un nom de catégorie.''' Le motif <code>[[@@@@]]</code>, sûr tant que […inchangé…]. Le correctif est le deux-points initial, <code>[[:@@@@]]</code>, qui lie sans catégoriser. […inchangé…]
---
> # '''Un lien construit par <code>#arraymap</code> catégorise la page au lieu de la lier, dès qu'une valeur est un nom de catégorie.''' Le motif <code><nowiki>[[@@@@]]</nowiki></code>, sûr tant que […inchangé…]. Le correctif est le deux-points initial, <code><nowiki>[[:@@@@]]</nowiki></code>, qui lie sans catégoriser. […inchangé…]
```
Les parties marquées « […inchangé…] » sont identiques des deux côtés du
diff réel. Elles ne sont abrégées que dans ce rapport : la sortie
complète a été lue avant l'envoi.

**Récapitulatif technique** (`bin/wiki-get.sh … | diff - pages/Recapitulatif_correction_lot21.txt`) : une seule ligne changée.
```
350c350
< Un lien interne <code>[[...]]</code> ne peut pas être coupé par un retour à
---
> Un lien interne <code><nowiki>[[...]]</nowiki></code> ne peut pas être coupé par un retour à
```

## CLAUDE.md

Le paragraphe « **Le contrôle qui attrape ce piège… les liens parasites. »
(lignes 439 à 445) a été remplacé par le texte F, indentation de deux
espaces comprise.
- Le premier paragraphe est reformulé : « comme celle des liens de
  fichiers brisés » au lieu de « — liens brisés, liens de fichiers
  brisés — ».
- Un second paragraphe est ajouté : « **Ce contrôle ne suffit pas :
  examiner aussi les _liens_ de la page** … ».

## Vérifications

**a. Celle qui tranche : liens entrants des deux pages inexistantes.**
- `list=backlinks&bltitle=@@@@` : `"backlinks": []`.
- `list=backlinks&bltitle=...` : `"backlinks": []`.

Aucun lien entrant ne subsiste. Aucune relance n'a été nécessaire.

**b. Celle qui tranche : contenu.** `bin/wiki-verify.sh` rend `IDENTIQUE`,
sortie 0, sur les trois pages :
- Lot 21, avec `pages/Lot_21_correction_affichage.txt` ;
- Limites connues, avec `pages/Limites_connues_correction_lot21.txt` ;
- Récapitulatif, avec `pages/Recapitulatif_correction_lot21.txt`.

**c. Liens et catégories** (`action=parse&prop=links|categories`).

| Page | Liens | Vers une page inexistante | Catégories |
|---|---|---|---|
| Lot 21 | 12 | aucun | `Lot` |
| Limites connues | 4 | aucun | `Page_de_suivi` |
| Récapitulatif technique | 169 | `Attribut:Has type`, `Attribut:Imported from` | `SGDT`, `Page_de_suivi` |

Les trois résultats sont conformes à l'attendu.

**d. Faits.**
- Limites connues : `_INST` (Page_de_suivi), `_MDAT` (2026/10/4 0:06:23)
  et `_SKEY`, rien d'autre. Conforme.
- Récapitulatif : 17 `_ASK`, les mêmes identifiants de requête qu'au
  relevé du correctif du 3 octobre ; `_INST` (SGDT, Page_de_suivi) ;
  `_MDAT` ; `_SKEY` ; rien d'autre. Conforme.

## Écarts et surprises

1. **Des commandes en lecture ont été enchaînées hors des formes
   annoncées.** La consigne n'annonçait que les deux diffs enchaînés
   par `|`. Pour lire les vérifications sans recopier des sorties de
   plusieurs centaines de lignes, j'ai enchaîné :
   - `bin/wiki-api.sh … | jq -c …`, trois fois, en vérification c ;
   - `bin/wiki-api.sh --facts … | grep …`, deux fois, en vérification d.

   La recherche d'autres occurrences de `@@@@` et de `[[...` s'est faite
   par `grep` simple, sans enchaînement. Toutes ces commandes sont en
   lecture seule. Je ne sais pas si elles ont déclenché une fenêtre de
   confirmation.
2. **La vérification a n'a pas été faite avant la correction.** Je n'ai
   pas relevé les liens entrants de « @@@@ » et de « ... » avant
   d'écrire. Je ne peux donc pas montrer, par cette mesure même, qu'elle
   les aurait vus. Deux éléments le rendent probable sans le prouver :
   - la liste des pages demandées, citée par la consigne, les avait
     signalés ;
   - `list=backlinks` répond sans erreur sur les deux titres, ce qui
     montre que « ... » est un titre valide.
3. Aucun autre écart. Les trois diffs étaient exactement ceux annoncés,
   et les trois écritures sont passées du premier coup.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

Aucune.
