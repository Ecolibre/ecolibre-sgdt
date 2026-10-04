# Wanted_by — relevé avant décision, 7 septembre 2026

Mesure demandée avant toute proposition : Cyril veut retourner la relation
`Wanted_by` (aujourd'hui portée par l'item, vers l'acteur qui le veut) pour
qu'elle soit portée par l'acteur. Une affirmation précédente disait la
propriété vide ; ce n'est pas le cas. Ce document s'arrête au relevé, sans
proposer de retournement.

## Wanted_by — porte des valeurs

**Une seule page** porte `Wanted_by` sur l'ensemble du wiki :

| Page | Classe | Valeur de Wanted_by |
|---|---|---|
| `Mèche de tarière pour perceuse` (Item_ref `002W`) | Organic item | `Ecolibre` |

Requête : `[[Wanted_by::+]]|?Wanted_by` — un seul résultat, comptage
exhaustif (pas de troncature de limite, la réponse ne portait qu'une
entrée). Cette page a été créée par Cyril hors session, entre le 28 août et
le 6 septembre (déjà signalée dans `travaux/remise-a-niveau-6-septembre.md`
comme le +1 constaté sur les items référencés — en réalité un item
**organique**, pas référencé : à corriger dans ce rapport-là si besoin).

**Conséquence directe pour la décision à venir : retourner `Wanted_by`
n'est pas une opération sur une déclaration vide.** Elle porte une valeur
réelle, `Mèche de tarière pour perceuse -> Ecolibre`, qui devra être migrée
ou réinterprétée selon la forme choisie pour la relation inversée.

## Owned_by — pour comparaison

**47 pages** portent `Owned_by`, toutes des items physiques (`Category:
Physical item`). Comptage exhaustif : requête à 47 résultats puis relance à
`offset=47`, 0 résultat supplémentaire.

- 43 pages → `Ecolibre` (l'ensemble des plantations du Buisson de Cerzat,
  du Jardin de Chilhac et de la Terrasse de Chilhac, plus les objets
  Ecolibre hors plantation — bidons, batterie).
- 4 pages → `CWL`, toutes situées à `Atelier appartement` : `Fer à souder
  (CWL-0009)`, `Machine à souder par point (CWL-0008)`, `Mini banc de
  mesure (CWL-000B)`, `Multimètre (CWL-000A)`.

Aucune autre valeur observée. `Owned_by` est donc bien renseignée sur toute
la population physique, avec deux propriétaires distincts déjà en usage
réel (`Ecolibre`, `CWL`) — pertinent si le même schéma de retournement
devait s'appliquer un jour à `Owned_by` par cohérence.

## Câblage actuel de Wanted_by

**Modèle:Organic item** — dans le bloc `{{#set:}}` :
```
|Wanted_by={{{Wanted_by|}}}
|+sep=,
```
et affiché en tableau, ligne « Souhaité par » :
```
{{#arraymap:{{{Wanted_by|}}}|,|@@@|[[@@@]]|,&#32;}}
```

**Modèle:Referenced item** — même patron, `#set` avec `+sep=,` puis même
ligne « Souhaité par » en `#arraymap` dans le tableau de rendu.

Dans les deux modèles, la propriété est donc bien préparée pour porter
**plusieurs** valeurs (`+sep=,` sur le `#set`, `#arraymap` sur l'affichage) —
ce n'est pas un champ single même si la seule instance réelle n'en porte
qu'une.

**Formulaire:Organic item**, ligne 20 :
```
! Souhaité par : {{#info: Acteur qui cherche à obtenir cette espèce. N'implique aucun exemplaire physique : le souhait porte sur ce qui n'est pas encore là. Ici il vise l'espèce en général ; sur un item référencé, il viserait une provenance précise.}}
| {{{field|Wanted_by|input type=tokens|values from category=Organisation|list|delimiter=,}}}
```

**Formulaire:Referenced item**, ligne 56, même patron :
```
! Souhaité par : {{#info: Acteur qui cherche à obtenir cette provenance précise. N'implique aucun exemplaire physique. Sur un item organique, le souhait viserait l'espèce en général.}}
| {{{field|Wanted_by|input type=tokens|values from category=Organisation|list|delimiter=,}}}
```

Dans les deux formulaires, le champ est un widget `tokens` limité aux pages
de `Category:Organisation`, multi-valeurs, délimiteur virgule — donc déjà
au format entrée-vers-plusieurs-acteurs côté saisie, quel que soit le sens
de stockage retenu.

## Ce qui n'a pas été fait sur Wanted_by

Rien d'autre sur ce point : pas de proposition de retournement, pas de
modification de modèle ou de formulaire. Décision à prendre par Cyril à
partir de ces faits.

## Note ajoutée — Alignement PAIR et concept de projet

Ajoutée en tête de `Notes en attente de rangement` (convention de la page :
les plus récentes en haut), pas en fin de page — cette page n'a pas la
forme d'une liste numérotée ouverte et ne relève donc pas de
`wiki-append.sh`, mais de sections `==`, réécrite en entier via
`wiki-put.sh`. Résumé `[Complément] Notes en attente de rangement —
alignement PAIR et concept de projet`. Vérifié après écriture : la note
est bien la plus récente, la catégorie de la page (`Page de suivi`) est
inchangée.

À signaler pour la relecture de cette page (règle 2 : rien n'y reste) : une
note très proche y figure déjà, datée du 01/09/26, « Sens de la relation
« souhaité par », et concept de projet » — écrite par Cyril au moment même
de la création de `Mèche de tarière pour perceuse`, et qui pose déjà le
constat retrouvé par la mesure de ce document (Wanted_by porte une valeur
réelle) ainsi que l'idée d'un concept de projet via PAIR. Les deux notes ne
sont pas fusionnées ici, à la demande explicite de ne faire qu'ajouter une
ligne ; leur proximité est cependant à voir au moment du rangement.
