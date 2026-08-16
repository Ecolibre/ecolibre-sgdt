# Lot 9 — Tâche 7bis : rapport

Trois écritures faites, dans cet ordre, chacune relue avant la suivante.
Wikitexte des deux pages relevé avant chaque écriture, protection vérifiée
(`protection: []` sur les deux, comme pour les autres modèles/formulaires de
ce lot).

## Écritures faites

1. **`Modèle:Referenced item`**, revid 548 (depuis 352) — `[Lot 9][Tâche
   7bis] Ajout du paramètre Sourcing_year (#set + affichage)`. Ajout de
   `|Sourcing_year={{{Sourcing_year|}}}` au `#set` (groupe fournisseur,
   entre `Supplier_reference` et `Manufacturer`), et d'une ligne d'affichage
   « Année d'obtention » juste après « Réf. fournisseur ».
2. **`Modèle:Referenced item`**, revid 549 (depuis 548) — `[Correctif]
   Filtre Category:Referenced item sur la requête Composants enfants
   (BOM)`. La requête passe de `{{#ask: [[Part_of::{{FULLPAGENAME}}]] ...}}`
   à `{{#ask: [[Category:Referenced item]] [[Part_of::{{FULLPAGENAME}}]]
   ...}}` — l'autre moitié de la « correction n° 5 » (décompte informel du
   lot), fermée côté physique en tâche 6bis, fermée ici côté référencé.
3. **`Formulaire:Referenced item`**, revid 550 (depuis 350) — `[Lot 9]
   [Tâche 7bis] Ajout du champ Sourcing_year (non obligatoire)`. Champ
   ajouté après « Réf. fournisseur », `input type=text` (même choix que
   `Max_head`, seul autre champ numérique du formulaire), sans flag
   `mandatory`, avec un `#info` reprenant la description de la propriété.

Wikitexte relu après chacune des trois écritures pour confirmer le contenu
effectivement stocké (`result: Success` ne suffit pas). `action=parse` sur
les deux pages en fin de séquence : aucune occurrence de marqueur d'erreur
(`error`, `Erreur`, `Lua error`, `Script error`, `strip marker`, `Cite
error`) dans le HTML produit — les deux rendent sans erreur.

## Correction de numérotation — pas de "correction n° 3" fermée

Demandé : noter que `+sep=,` déjà présent sur `Part_of` de
`Modèle:Referenced item` fermerait la « correction en attente n° 3 » de
`CLAUDE.md`, à retirer en tâche 10.

Vérifié avant d'écrire cette note : **le fait est exact** (`+sep=,` est bien
là, juste après `Part_of`, fait lors d'un lot antérieur à ce travail —
confirmé par une lecture de l'état actuel, pas supposé). **Le rattachement à
la « correction n° 3 » ne l'est pas.** Dans les rapports du lot 9
(`lot-9-cadrage-plantes.md` lignes 96-98, `lot-9-tache0-rapport.md` ligne
155), ce numéro désigne systématiquement la troncature au tiret de
`Module:Base36` (`clean:match("[%w]+")`), un défaut distinct, sans lien avec
`+sep=,`, et confirmé **toujours ouvert** dans ces mêmes rapports — le noter
comme fermé aurait contredit un constat du lot toujours valide.

Par ailleurs, `CLAUDE.md` lui-même (section « Corrections en attente sur les
modèles ») n'a jamais compté que deux points depuis sa création — vérifié
sur son historique git (`git log --follow -p`, première apparition au
commit 7701949) — jamais de n° 3 dans ce fichier précisément. Le n° 3 est une
numérotation informelle propre aux rapports du lot 9, pas une numérotation
de `CLAUDE.md`.

**Rien n'a donc été noté comme fermé.** Le fait (`+sep=,` déjà en place) est
consigné dans `lot-9-tache7bis-proposition.md`, sans le rattacher à un
numéro de correction erroné. Si un numéro différent était voulu pour ce
fait précis, à préciser.

## Suite

`Sourcing_year` est désormais écrivable sur `Referenced item`, modèle et
formulaire ensemble — la tâche 7 (génération) peut s'appuyer dessus sans
craindre l'effacement silencieux du lot 8.
