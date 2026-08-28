# Consignation du lot 11 — vérification de complétude

**28 août 2026.** Lecture et inventaire seulement, aucune écriture. Méthode
imposée : reconstituer d'abord ce qui a été fait à partir des ~65 rapports
`travaux/` du lot 11 (20 au 28 août 2026), puis vérifier sur le wiki où
chaque décision est consignée — jamais l'inverse.

Environ 55 fichiers `travaux/` ont été lus intégralement pour ce rapport
(tous les `lot-11-*.md`, plus les rapports connexes de la même période :
organisation, owned-by, wanted-by, photos, renommage, négation, outillage,
avancement, cadrage-lieux). Le wiki a été relu en direct pour trois pages
pivots (*Récapitulatif technique*, *Limites connues du SGDT*,
*Catégorie:Lieu*) et pour la liste vivante des propriétés déclarées.

---

## 1. Chronologie des décisions et découvertes

### Lieux — modèle, propriétés, arbre

| Date | Décision / découverte | Source |
|---|---|---|
| 20-21/08 | Titre de lieu = titre global au wiki, jamais qualifié par le parent ; à qualifier dès qu'il est positionnel ou générique | `lot-11-tache0-redirections.md` |
| 20-21/08 | Une redirection est porteuse de données SMW (test dédié, origine de l'entrée n° 26) | `lot-11-tache0-redirections.md` |
| 20-21/08 | `format=count` cassé côté `action=ask` sur cette installation (confirmé, pas un défaut d'encodage) | `lot-11-tache0-redirections.md`, `lot-11-tache0-recon.md` |
| 20-21/08 | `Board_lineage`/`Board_parent`/`Module:Board` n'existent pas — cru à tort comme précédent éprouvé | `lot-11-tache0-recon.md` |
| 21/08 | Cinq propriétés de lieu créées : `Location_number`, `Location_site`, `Location_type`, `INSEE_code`, `Location_lineage` | `lot-11-tache1-execution.md`, `lot-11-tache1-cloture.md` |
| 21/08 | `Attribut:INSEE code` — `Property_range` dépasse 85 caractères (type `Keyword`), `_ERRC` posé, page verrouillée en écriture | `lot-11-tache1-execution.md`, `lot-11-tache1-cloture.md` |
| 21/08 | Pollution `Item_ref -> +` sur *Récapitulatif technique* (second exemplaire du piège backticks, distinct de l'incident du 16/08 sur *Limites connues*) — mesurée puis corrigée le jour même (revid 850) | `lot-11-dette-audit.md`, `lot-11-itemref-pollution.md`, `lot-11-nettoyage-recap-v3.md` |
| 23/08 | `Modèle:Lieu` : ligne Référence, enfants directs ; `Catégorie:Lieu sans nom d'usage` créée | `lot-11-tache2-execution.md` |
| 24-25/08 | Retour au repli `{{PAGENAME}}` sur Nom d'usage ; `Modèle:Préfixe lieu` créé (code `LOC`) ; `Formulaire:Lieu` créé ; infobulle décimale corrigée par test (point rejeté, pas silencieusement mal lu) | `lot-11-titres-execution.md` |
| 24-25/08 | Test `Location_lineage` (pages `Casc *`) : le patron `#show`→`#set` casse pour une propriété de type Page, de deux façons différentes selon la donnée (erreur franche ou fait faux silencieux) | `lot-11-tache4-cascade.md` |
| 25/08 | Arbre des 13 lieux créé ; 29 plantations basculées de *Le Buisson de Cerzat* vers *Butte de la tranchée* | `lot-11-tache5-execution.md` |
| 25/08 | Dette `Property_range` du lot 7 soldée à 5/6 (`Seed_treatment`, `Edible_parts`, `Plant_habit`, `Propagation_method`, `Root_system` corrigées ; `INSEE_code` seule reste verrouillée) — l'hypothèse « verrou général » était fausse pour 5 pages sur 6 | `lot-11-property-range.md`, `lot-11-verrou-mesure-v2.md` |
| 25/08 | `Planting_rank` converti en mètres entiers depuis l'origine du lieu (`ECL-0023`→15, `ECL-0026`→2) ; description de `Attribut:Planting rank` corrigée | `lot-11-planting-rank.md` |
| 25/08 | `Planting_rank_end` créé (segment début/fin) ; `Modèle:Physical facet plant` et son bloc de formulaire modifiés | `rang-segment-execution.md` |
| 25/08 | `Modèle:Physical facet plant/doc` créé — découverte au passage : les espaces `Modèle`/`Formulaire`/`Module` ne sont pas sémantiques sur ce wiki | `facette-doc-execution.md`, `espaces-non-semantiques.md` |
| 26/08 | Encart d'état ajouté à `lot-11-cadrage-lieux.md` (dépôt, commit `d25dbe6`) ; proposition de `Catégorie:Lieu` enrichie | `lot-11-tache7-execution.md` |
| 26-27/08 | Clôture tâche 7 : `Catégorie:Lieu` réécrite (point d'entrée création, niveau de rattachement, où se fait `Located_at`) ; *Limites connues* entrée 31 (`#show`→`#set` cassé) ; *Récapitulatif technique* troisième banque de références | `lot-11-cloture.md` |
| 27/08 | Entrée n° 2 de *Limites connues* corrigée : `Board_lineage` n'existe pas, la décision 1.10 du cadrage s'appuyait sur une affirmation jamais vérifiée | `correctif-limites-2.md` |
| 27/08 | Test double renommage en chaîne (A→B→C, bac à sable) : le littéral suit le nom final tant que les deux redirections restent en place | `double-renommage.md`, `double-renommage-cloture.md`, `double-renommage-entree.md` |
| 27/08 | Blanchir une page de propriété avant suppression la verrouille (`Casc parent`/`Casc lineage`, mesuré contre `Test lot11 keyword`/`Test lot11 texte`, jamais blanchies, supprimées sans difficulté) | `photos-groupe-b.md` |
| 27/08 | 9 pages d'essai du lot 11 blanchies (pas supprimées — le compte bot n'a pas le droit `delete`, réservé au groupe local `Administrateurs`) | `nettoyage-pages-essai.md` |
| 27/08 | Extrémité de tranchée renommée en production, à la main par Cyril, en *Butte de l'extrémité amont de la tranchée principale* | `renommage-preparation.md`, `renommage-mesure.md` |
| 27/08 | Mesure : la convergence du littéral SMW se fait **sans purge**, par la seule propagation de changement déclenchée par le renommage — corrige les entrées n° 26 et n° 32, qui tenaient la purge pour nécessaire | `renommage-mesure.md`, `renommage-consignation.md` |
| 27/08 | 45 photos (groupe A) rattachées de *Le Buisson de Cerzat* vers *Butte de la tranchée* / *Extrémité de tranchée* / *Au pied du pylône électrique* | `photos-execution.md` |
| 27/08 | 8 photos (groupe B — serpent, câbles) rattachées vers *Terrain de Cyril au Buisson de Cerzat* | `photos-groupe-b.md` |
| 28/08 | `Catégorie:Lieu` corrigée : la purge ne fait pas converger le stockage, l'ancien nom reste interrogeable, la redirection est une donnée (5 étapes au lieu de 4) | `categorie-lieu-renommage.md` |
| 28/08 | Vérification d'état après la série photos : 73 photos réparties sur 6 lieux, aucune trace résiduelle de *Le Buisson de Cerzat* | `etat-apres-photos.md` |
| 28/08 | Entrée n° 23 de *Limites connues* corrigée : `[[X::!+]]` rend le complément de la condition, pas zéro — l'ancienne affirmation était un artefact d'un test sur une propriété vide (16/08) | `negation-smw.md`, `negation-correction.md` |
| 27-28/08 | Outillage `bin/` : garde-fous d'écriture remontant enfin par le code de sortie (`wiki-put.sh`, `wiki-api.sh`, `wiki-purge.sh`, `wiki-get.sh --category`) — commits `0913ef8`, `e2658c9`, `5db9c62`, `7bc3006` | `outillage-proposition.md`, `outillage-execution.md`, `outillage-suite.md` |
| 28/08 | Contrôle du lot 9 sous le nouveau filet : les 73 photos et leurs annotations sont intactes, rien n'a été perdu par l'absence antérieure de vérification du code de sortie | `outillage-suite.md` |

### Organisation, Owned_by, Wanted_by, Avancement (25 août — amendement hors numérotation de tâche)

| Date | Décision / découverte | Source |
|---|---|---|
| 25/08 | Classe `Organisation` créée : 4 propriétés, `Catégorie:Organisation`, `Modèle:Organisation`, page `Ecolibre` — appartenance décidée sur `Physical item`, pas sur `Lieu` ; `Organisation_site_code` = mention documentaire, pas clé de jointure ; aucune IRI PAIR déclarée | `organisation-proposition.md`, `organisation-execution.md` |
| 25/08 | `Owned_by` créée, rétro-remplie à `Ecolibre` sur les 44 items physiques (dont `CWL-0007`) | `owned-by-proposition.md`, `owned-by-execution.md` |
| 25/08 | `Wanted_by` créée sur `Organic item` et `Referenced item`, sans auto-extinction (un souhait reste affiché même si l'espèce est déjà présente) | `wanted-by-proposition.md`, `wanted-by-execution.md` |
| 25/08 | `Avancement du jardin-forêt` réécrite en variante B : plus aucun lieu nommé en dur, galerie photo sans condition de lieu (contournement documenté), critère `Owned_by::Ecolibre` + facette végétale | `avancement-execution.md` |
| 25/08 | Section *Recherché* ajoutée à `Avancement du jardin-forêt` (espèces/provenances recherchées) ; entrée n° 29 (`#count` sans effet sur une colonne d'impression) | `recherche-proposition.md`, `recherche-execution.md` |
| 25/08 | Découverte : espaces `Modèle`/`Formulaire`/`Module` non sémantiques — `demandes-adminsys.md` §2.2 complété, entrée n° 30 écrite | `espaces-non-semantiques.md` |
| 25/08 | Dépôt commité et poussé (3 commits, 25 fichiers), `CLAUDE.md` amendé (règle sur le pli d'un lien replié depuis un rapport) | `cloture-25-aout.md` |

---

## 2. Où c'est consigné, et si c'est le bon endroit

**Lieux — le modèle de données.** `Catégorie:Lieu` porte aujourd'hui, vérifié
en direct : le critère lieu/item physique, la profondeur non bornée,
redécoupage vs enfantement, le rattachement qui ne remonte pas l'arbre, la
règle de nommage global+qualification, les cinq champs (`Location_number`,
`Location_site`, `Location_type`, `INSEE_code`, `Postal_address`/
`Latitude`/`Longitude`), le préfixe `LOC`, l'origine d'un lieu et la
position en segment, et la procédure de renommage en 5 étapes corrigée le
28 août. **C'est le bon endroit**, et c'est à jour — y compris la dernière
correction (purge ≠ convergence).

**Location_lineage.** N'apparaît nulle part en prose sur `Catégorie:Lieu`
ni sur *Récapitulatif technique* — choix délibéré et documenté comme tel
dans `lot-11-tache7-execution.md` §4.1 (« une page de classe décrit ce qui
est, pas ce qui manque »). La conséquence pratique (le rattachement ne
remonte pas l'arbre) est bien écrite. **Bon endroit pour ce qui est écrit ;
l'échec du patron `#show`→`#set` lui-même est dans *Limites connues* n° 31,
qui est le bon endroit pour un défaut d'outillage.**

**`INSEE_code` verrouillé, dette `Property_range`.** L'état détaillé
(5 pages sur 6 corrigées le 25/08, seule `INSEE_code` reste verrouillée
depuis le 21/08) vit dans les rapports `travaux/` et dans
`demandes-adminsys.md`. **L'entrée n° 25 de *Limites connues*, elle,
affirme encore que « les six pages restent sous
`smw-change-propagation-protection` »** — c'est désormais faux pour cinq
d'entre elles. Voir §4, c'est une des entrées à corriger.

**Organisation, Owned_by, Wanted_by.** Consignés en détail dans les quatre
pages qu'ils créent (`Catégorie:Organisation`, `Attribut:Owned by`,
`Attribut:Wanted by`) — chacune porte sa propre justification (appartenance
sur `Physical item`, pas de clé de jointure, pas d'auto-extinction). **Bon
endroit pour la définition.** Mais **rien sur *Récapitulatif technique* ne
documente en prose l'existence de ces trois éléments** — voir §3, c'est
la lacune principale de ce rapport.

**Planting_rank_end.** Documenté en détail dans
`Modèle:Physical facet plant/doc` (segment, fin sans début, indépendance de
`Planted_count`) et repris dans `Catégorie:Lieu` (« L'origine d'un lieu, et
la position des plantations »). **Bon endroit, cohérent sur les deux
pages.** Absent de *Récapitulatif technique* en prose (présent seulement
via le tableau vivant des propriétés, voir §3).

**Banque de références LOC.** Consignée à trois endroits cohérents :
*Récapitulatif technique* (section « Numérotation : trois banques de
références », avec tableau), `Catégorie:Lieu` (section « Le préfixe LOC »),
et *Registre des préfixes de site* (ligne `LOC` réservée, vérifiée en
direct). **Le bon endroit, aux trois bons endroits, et à jour.**

**Les 13 lieux.** Aucune page ne les énumère nommément — c'est voulu et dit
explicitement dans `lot-11-tache7-execution.md` §4.1 (« une table recopiée
dans une page de documentation serait fausse aussitôt ») : l'énumération se
fait par requête (`Catégorie:Lieu`), pas par une liste figée. **Cohérent
avec la pratique du reste du wiki.** Mais *Récapitulatif technique* ne
porte **aucun compte vivant** pour `Category:Lieu`, alors qu'il en tient un
pour chacune des quatre classes de conception — c'est l'absence la plus
concrète relevée en §3.

**Double renommage, renommage en production, blanchiment verrouille.**
Les trois sont dans *Limites connues* (n° 32, n° 34, n° 33 respectivement),
**le bon endroit** — ce sont des faits sur le comportement du wiki, pas des
procédures. La procédure qui en découle (5 étapes) est dans `Catégorie:Lieu`,
qui y renvoie explicitement. Bonne séparation entre le fait et la marche à
suivre.

**Négation SMW, `Board_lineage`.** Les deux corrections (n° 23, n° 2) sont
sur *Limites connues*, **le bon endroit**, avec la date de mesure et la
raison de l'erreur précédente — exactement la matière que cette page est
faite pour porter.

**Outillage `bin/` (garde-fous, code de sortie).** Consigné dans
`CLAUDE.md` — description des trois scripts mise à jour, garde-fou
d'exécution n° 3 daté. **C'est le bon endroit : c'est une garantie
opérationnelle pour les sessions futures, pas un fait sur le modèle de
données.** Correctement signalé « hors wiki » dans les rapports eux-mêmes.

**`action=purge` et le jeton CSRF.** La correction outillage
(`action=purge` n'a pas de paramètre `token`) est bien dans `CLAUDE.md`.
**Mais l'entrée n° 16 de *Limites connues*, sur le wiki, affirme le
contraire** (« exige une requête POST avec jeton CSRF ») — jamais recoupée
avec la découverte de l'outillage. Voir §4.

**Item_ref pollution sur *Récapitulatif technique* (21/08).** La mesure et
la correction sont dans `lot-11-dette-audit.md` et
`lot-11-nettoyage-recap-v3.md`. `CLAUDE.md` porte déjà une leçon générale
sur ce piège (« un exemple de syntaxe SMW crée une vraie annotation »,
« les backticks ne protègent rien »), mais **cette leçon, réécrite le
21 août, cite deux occurrences du jour (`LOC` dans `Attribut:Location
site`, trois fragments dans *Limites connues*) et ne cite pas la
troisième** — les deux fragments non échappés sur *Récapitulatif
technique* (`Item_ref::+` et `Has type::+`), corrigés le même jour. Absence
mineure : la leçon générale couvre le mécanisme, seul l'inventaire des cas
du jour est incomplet.

**Verrou `smw-change-propagation-protection` — la mesure raffinée du
25/08.** L'entrée n° 14 de *Limites connues* (11-12 août) reste à son
niveau d'origine : cause non établie, hypothèse de corrélation avec
`Property_cardinality::multiple` écartée. Le lot 11 a mesuré une image
beaucoup plus précise (`lot-11-verrou-mesure-v2.md` : éditer une page
**existante** ne rencontre jamais le verrou — six cas, zéro refus ; seule
une page bloquée **depuis sa création** reste verrouillée), mais cette
précision vit uniquement dans `demandes-adminsys.md` et `CLAUDE.md`
(« un blocage déduit n'est pas un blocage constaté »). **C'est defendable
de la garder hors wiki** — c'est une leçon de méthode pour qui écrit sur ce
wiki, pas un fait sur le modèle de données — mais l'entrée n° 14, elle, ne
renvoie nulle part vers cette mesure plus récente et reste avec sa
formulation d'il y a deux semaines, moins précise que ce qu'on sait
aujourd'hui.

---

## 3. Ce que *Récapitulatif technique* ignore

Lu intégralement en direct (446 lignes). Le tableau §1 (`{{#ask:
[[Has type::+]] ...}}`) est une requête vivante : il inclut automatiquement
toute propriété qui porte `Has type`, donc **les cinq propriétés de lieu,
les quatre propriétés `Organisation`, `Owned_by`, `Wanted_by` et
`Planting_rank_end` y apparaissent tous**, sans action requise — vérifié en
direct via `action=ask&query=[[Has type::+]]`, les 107 propriétés
attendues sont là (dont `Attribut:Casc parent`/`Attribut:Casc lineage`,
signalées comme scories dans `lot-11-cloture.md`, ont bien disparu de cette
liste — Cyril les a supprimées entre le 27 et le 28 août).

Ce qui manque, c'est la **prose** — les sections narratives, symétriques à
celle qui existe pour les lieux (« Les lieux sont hors de la chaîne ») ou
pour les banques de références :

| Élément | Dans le tableau vivant §1 | Dans la prose |
|---|---|---|
| Les cinq propriétés de lieu | **oui**, automatique | `Location_number`/`Location_site` nommées (section banques) ; `Location_type`, `INSEE_code`, `Location_lineage` **absentes** de toute prose |
| Classe `Organisation` | oui (ses 4 propriétés) | **absente** — aucune mention, aucune sous-section, contrairement à « Les lieux sont hors de la chaîne » |
| `Owned_by` | oui | **absente** |
| `Wanted_by` | oui | **absente** |
| `Planting_rank_end` | oui | **absente** — la section « La maille d'une plantation » ne cite que `Planted_count`, `Propagated_from`, `Planting_date`, `Specimen_status`, `Planting_rank` |
| Banque de références LOC | oui | **présente**, section dédiée avec tableau à trois lignes |
| Les 13 lieux | s. o. (pas une propriété) | **absents** — aucun compte vivant pour `Category:Lieu`, alors que les quatre classes de conception en ont chacune un (tableau « Les quatre classes », colonne Effectif) |

**Deux points supplémentaires, tous deux hors du périmètre de la liste
demandée mais découverts en lisant la page en entier :**

1. La section « Lieux sont hors de la chaîne » cite trois lieux à titre
   d'exemple : *Le Buisson de Cerzat, Jardin de Chilhac, Terrasse de
   Chilhac*. Depuis la migration du 25 août (tâche 5) et le rattachement
   des photos (27 août), **Le Buisson de Cerzat porte 0 item physique** —
   c'est *Butte de la tranchée* qui en porte 26. L'exemple cite
   précisément le lieu qui a été vidé, sans avoir été retouché depuis.
2. `Modèle:Physical facet plant/doc`, créée le 25 août, n'apparaît nulle
   part dans la section « 2. Modèles de Structure » — les quatre modèles
   d'items y figurent, pas les modèles de facette. `facette-doc-execution.md`
   §4 l'avait anticipé : « ajoutera une ligne au tableau … si celui-ci liste
   les modèles de facette » — vérifié : il ne le fait pas pour aucune
   facette, la lacune n'est donc pas propre à celle du lot 11.

---

## 4. Entrées de *Limites connues* dont la formulation dépasse la mesure

Les 34 entrées relues une à une (texte complet en annexe implicite : lu en
direct le 28 août 2026). La grande majorité sont des mesures datées,
correctement bornées à ce qui a été observé. Trois entrées, toutes causées
par le lot 11 lui-même sans y avoir été recoupées, affirment aujourd'hui
quelque chose de mesurablement faux ou dépassé :

### Entrée n° 16 — fausse depuis la découverte outillage du 27/08

> « `action=purge` exige une requête POST avec jeton CSRF sur ce wiki ; un
> appel en GET échoue avec `mustbeposted`. »

**Mesuré faux par le lot 11 lui-même** : `outillage-execution.md`
(défaut 3) établit, par `action=paraminfo&modules=purge`, que
`action=purge` **n'a pas** de paramètre `token` (`needstoken: None`). La
correction a été appliquée à `CLAUDE.md` (description de
`bin/wiki-purge.sh`) mais **jamais recoupée avec cette entrée n° 16**, qui
continue d'affirmer le contraire sur le wiki. Ce n'est pas une
généralisation abusive comme les cas n° 2/n° 23 — c'est une affirmation
tenue pour vraie depuis le 11-12 août et directement contredite par une
mesure plus récente, sans que le rapprochement ait été fait.

### Entrée n° 24 — décrit un mécanisme qui n'existe plus depuis le 25/08

> « Conséquence acceptée sur [[Avancement du jardin-forêt]] : faute de
> négation, le bloc replié « Autres photos » de chaque lieu contient aussi
> la photo principale du lieu. »

**La page qu'elle décrit a été entièrement réécrite le 25 août 2026**
(`avancement-execution.md`, variante B) : le regroupement par lieu (le
bloc `|group=` qui produisait un « Autres photos » replié par lieu) a été
**retiré explicitement** — « Le bloc « Plantations par lieu » est retiré »,
vérifié `'group=' present : False`. La page porte désormais une galerie
unique, sans condition de lieu. L'entrée n° 24 décrit donc un défaut sur
une structure qui n'existe plus : elle documentait un fait vrai le 16 août,
resté sur le wiki sans mise à jour après que le lot 11 a changé la page à
laquelle elle renvoie explicitement par lien.

### Entrée n° 25 — vraie pour 1 page sur 6, pas 6 sur 6

> « Non corrigé à cette date : les six pages restent sous
> `smw-change-propagation-protection` (voir `demandes-adminsys.md`). »

**Mesuré faux pour cinq des six par le lot 11 lui-même**,
le 25 août (`lot-11-property-range.md`) : `Seed_treatment`, `Edible_parts`,
`Plant_habit`, `Propagation_method`, `Root_system` ont toutes été corrigées
ce jour-là, du premier coup, sans aucun verrou rencontré. Seule
`Attribut:INSEE code` reste verrouillée. La correction figure dans
`demandes-adminsys.md` (mis à jour) mais l'entrée n° 25 elle-même,
sur le wiki, n'a pas été retouchée depuis le 21 août.

### Deux entrées à surveiller, sans y voir un défaut de méthode lot 11

- **Entrée n° 9** (échelle de maturité) contient une généralisation non
  datée et non mesurée : « cas pourtant majoritaire parmi les items
  référencés à venir » — une prédiction sur la composition future du
  catalogue, pas un compte. Antérieure au lot 11 (probablement lot 7),
  signalée pour mémoire, pas un produit de ce lot.
- **Entrée n° 14** (verrou de propagation, 11-12 août) reste à son niveau
  de précision d'origine alors que le lot 11 a mesuré une image nettement
  plus fine du même mécanisme (voir §2). Ce n'est pas une affirmation
  fausse — l'entrée est prudemment formulée (« cause exacte … non
  établie ») — mais elle ne renvoie pas vers la mesure plus récente et
  laisse un lecteur sur une compréhension datée du verrou.

**Aucune correction n'a été appliquée dans le cadre de ce rapport**,
conformément à la consigne de lecture seule.
