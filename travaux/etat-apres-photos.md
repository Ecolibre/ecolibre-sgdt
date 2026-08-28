# État global après la série « photos » — 27-28 août 2026

## 1. Entrée n° 33 — écrite, telle que proposée

Page : *Limites connues du Système de Gestion de Données Techniques*.
Résumé : `[Correctif] Limites connues — blanchir une page de propriété
avant de la supprimer la verrouille`. `oldrevid` 1023 → `newrevid` 1077,
`result: Success`. Diff local avant écriture : une seule ligne ajoutée,
texte identique à la proposition de `travaux/photos-groupe-b.md`, aucun
autre changement.

Vérifications :

- **`browsebysubject` sur la page** :
  ```
  _MDAT -> ['1/2026/8/27/22/18/36/0']
  _SKEY -> ['Limites connues du Système de Gestion de Données Techniques']
  ```
  Rien d'autre — pas de pollution.
- **33 entrées rendues** (`grep -c '^# '` sur le wikitexte relu après
  écriture, identique au fichier envoyé).
- **Aucun lien rouge** (`class="new"` : 0 occurrence dans le rendu HTML).
- **Aucune accolade nue hors des `<nowiki>` déjà présents** : l'entrée
  n° 33 n'utilise que `<code>…</code>` sans double-accolade — rien à
  vérifier de neuf sur ce point, et le lien `[[Erreurs de traitement
  SMW]]` qu'elle pose se résout correctement (bleu, pas rouge).

Les trois contrôles passent.

## 2. État global — lecture seule, rien corrigé

### Répartition complète d'`Image_location` (73 photos)

```
42 Butte de la tranchée
15 Jardin de Chilhac
 8 Terrain de Cyril au Buisson de Cerzat
 5 Terrasse de Chilhac
 2 Extrémité de tranchée
 1 Au pied du pylône électrique
```

Plus aucune photo sur *Le Buisson de Cerzat* : les 45 + 8 écritures des
deux tâches précédentes tiennent, `Terrain de Cyril au Buisson de
Cerzat` a bien pris les 8 du groupe B.

### Items physiques par lieu (`Located_at`)

```
41 items au total
26 Butte de la tranchée
 6 Jardin de Chilhac
 5 Terrasse de Chilhac
 2 Extrémité de tranchée
 1 Au pied du pylône électrique
 1 Atelier appartement
```

Inchangé depuis l'état du 27 août (`travaux/etat-27-aout.md`) — cette
série n'a touché qu'`Image_location`, jamais `Located_at`.

### Les treize lieux et leur `Located_in`

| Lieu | N° | Located_in |
|---|---|---|
| Terrain de Cyril au Buisson de Cerzat | 0001 | Le Buisson de Cerzat |
| Cerzat | 0002 | *(aucun — commune)* |
| Chilhac | 0003 | *(aucun — commune)* |
| Appartement de Chilhac | 0004 | Chilhac |
| Zone basse | 0005 | Terrain de Cyril au Buisson de Cerzat |
| Zone haute | 0006 | Terrain de Cyril au Buisson de Cerzat |
| Butte de la tranchée | 0007 | Zone basse |
| Extrémité de tranchée | 0008 | Zone basse |
| Au pied du pylône électrique | 0009 | Zone haute |
| Le Buisson de Cerzat | 0010 | Cerzat |
| Jardin de Chilhac | 0011 | Appartement de Chilhac |
| Terrasse de Chilhac | 0012 | Appartement de Chilhac |
| Atelier appartement | 0013 | Appartement de Chilhac |

13 confirmés par requête fraîche sur `Category:Lieu`, identique à l'état
du 27 août.

### Propriétés déclarées

`action=smwinfo` aujourd'hui :

```
propcount        4210
usedpropcount      64
declaredpropcount 107
```

**Le compte colle exactement.** 109 avant les suppressions de Cyril,
moins les deux propriétés supprimées (`Attribut:Test lot11 keyword` et
`Attribut:Test lot11 texte`, retirées sans difficulté) = 107. Les deux
pages encore bloquées (`Attribut:Casc parent`, `Attribut:Casc lineage`)
continuent de compter dans `declaredpropcount` : elles existent toujours
— blanchies, verrouillées, mais pas supprimées — ce que confirme
l'arithmétique plutôt qu'une simple coïncidence.

### Erreurs de traitement SMW

**1**, `Attribut:INSEE code` — lu sur le rendu de la page
(compteur affiché « 1 », table à une seule ligne). Inchangé par
l'ensemble de la série (45 + 8 photos, entrée n° 33) : aucune nouvelle
erreur introduite, et les deux verrous Casc n'y apparaissent pas —
cohérent avec ce que dit l'entrée n° 33 elle-même (verrou de propagation
et erreur de traitement sont deux mécanismes distincts).

### `Special:DoubleRedirects`

**Vide.** La chaîne du test « Dbl » (`Dbl cible` → `Dbl cible b` → `Dbl
cible c`, plus `Dbl item`) n'y figure plus. Confirmé directement :
`action=query&titles=Dbl cible|Dbl cible b|Dbl cible c|Dbl item` renvoie
`missing: true` sur les quatre — Cyril les a supprimées, comme annoncé en
tête de la tâche précédente (suppression en parallèle des pages du bac à
sable).

### *Avancement du jardin-forêt*

**Oui aux deux questions.**

- **40 lignes** : le tableau « Plantations » rend 41 `<tr>` (1 en-tête +
  40 lignes de données), et la ligne « Total des plantations » en bas de
  page affiche `40`. Concorde avec le compte d'items physiques
  ci-dessus (41 avec `Located_at`, moins l'item d'Atelier appartement
  qui n'a pas la facette végétale et n'entre donc pas dans ce compte-là
  — non vérifié en détail, cohérence plausible plutôt que prouvée).
- **La galerie affiche bien les photos** — mais pas *grâce* au
  changement de lieu : elle ne s'appuie pas du tout sur `Image_location`.
  Le wikitexte de la section « Photos » interroge uniquement
  `[[Category:Photo de plantation]]`, triée par `Image_date`, limitée à
  24 — c'est un contournement documenté sur la page elle-même (commentaire
  wikitexte) pour ne jamais dépendre du lieu, précisément à cause de la
  divergence qui vient d'être corrigée. La correction des 53 photos ne
  change donc rien à ce que cette galerie affiche, et n'avait pas besoin
  de le faire.

  **Point mort à signaler, non corrigé ici (lecture seule)** : le
  commentaire wikitexte au-dessus de cette galerie est daté et
  maintenant faux — il dit encore « au 25 août 2026, 45 photos portent
  Image_location=Le Buisson de Cerzat […] aucune ne porte Butte de la
  tranchée », alors que ce n'est plus le cas depuis les deux séries
  d'écritures précédentes. Le commentaire documente un état dépassé ;
  la mécanique qu'il justifie (galerie non filtrée par lieu) reste
  valable, mais son texte mériterait une mise à jour lors d'un prochain
  passage sur cette page.

Rien corrigé dans cette section — lecture seule comme demandé.
