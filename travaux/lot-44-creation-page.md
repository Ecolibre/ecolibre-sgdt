# Lots 44 et 45 — création des pages, 20 octobre 2026

Création de la page du lot 44, ouvert, puis de celle du lot 45, identifié et
non ouvert. Session Claude Code hébergée (cloud), branche locale
`ccr-4b59dccc-xydpag`, au même commit que `origin/main` (`65d0efd`) au
départ.

## Titres cibles

- **« Lot 44 — Mémoire des choix contraints et clôture des travaux »**
- **« Lot 45 — Clôture des lots 9 à 11 »**

Tous deux avec le tiret **U+2014** (EM DASH, tiret cadratin).

Mesure : le lot 43 a été relu en ligne dans `list=categorymembers` de
`Catégorie:Lot`. Son titre est « Lot 43 — Modes opératoires », et son
huitième caractère, décodé par `ord()`, vaut U+2014. Les deux chaînes tapées
pour les titres cibles ont été décodées de la même façon avant tout envoi :
huitième caractère U+2014 dans les deux, aucune virgule.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` au départ : sortie vide, aucun arrêt.
- `git fetch origin` : `origin/main` sur `65d0efd`, comme la branche locale ;
  aucune fusion nécessaire.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.
- Aucun des trois fichiers `pages/Lot_44.txt`, `pages/Lot_45.txt`,
  `travaux/lot-44-creation-page.md` n'existait avant la tâche.

## 2. Session

`bin/wiki-login.sh` : `Success Cywil`. Identifiants pris dans les variables
d'environnement de la session (`WIKI_API`, `WIKI_USER`, `WIKI_PASS`), le
répertoire `../ecolibre-sgdt-prive/` n'existant pas sur cette machine.

## 3. Contrôles avant écriture

| Contrôle | Mesure | Résultat |
|---|---|---|
| Catégorie:Lot : 43 membres | `categorymembers` : 43 | conforme |
| Numérotés de 1 à 43 sans trou ni doublon, ni 44 ni 45 | numéros tirés des titres, triés : exactement 1 à 43 | conforme |
| Titres cibles libres | `prop=info` : `missing` pour les deux | conforme |
| Aucune variante à tiret simple | `list=allpages`, préfixes « Lot 44 » et « Lot 45 » : aucune page | conforme |
| `Attribut:Work_package_status` admet « ouvert » et « identifié » | `_PVAL` : identifié, cadré, ouvert, livré, clos, abandonné | conforme |
| « Gestion des lots » existe | oui, `lastrevid` 1240 | conforme |
| « Procédure de clôture d'un lot » existe | oui, `lastrevid` 1479 | conforme |
| « Procédure d'ouverture d'un lot » existe | oui, `lastrevid` 1373 | conforme |
| « Récapitulatif technique du Système de Gestion de Données Techniques » existe | oui, `lastrevid` 1463 | conforme |
| « Lot 21 — Grandeurs et unités » existe | oui, `lastrevid` 1681 | conforme |

Contrôles en plus, avant d'écrire :
- « Lot 27 — Conduite du projet », nommé dans `Work_package_overlaps` du
  lot 44 sans être lié dans le corps, existe (`lastrevid` 1363) ;
- `Modèle:Lot` porte les paramètres employés : `Work_package_number`,
  `Work_package_status`, `Work_package_summary`,
  `Work_package_opening_date`, `Work_package_overlaps`,
  `Work_package_depends_on` ;
- dans les deux copies locales : 13 liens vers 6 pages distinctes
  (lot 44) et 6 liens vers 3 pages distinctes (lot 45), aucun replié sur
  deux lignes, aucune syntaxe `::`, aucune fonction d'analyseur, aucune
  virgule dans un titre lié.

## 4. Copies locales

`pages/Lot_44.txt` (7 537 octets) et `pages/Lot_45.txt` (2 646 octets),
écrits avec l'outil d'écriture de fichier, textes recopiés mot pour mot.
Comme `pages/Lot_43.txt`, ils n'ont pas de saut de ligne final.

## 5. Création

1. `bin/wiki-put.sh "Lot 44 — Mémoire des choix contraints et clôture des travaux" pages/Lot_44.txt "[Lot 44][Ouverture] Création de la page du lot" --createonly`
   : `Success`, `"new": true`, pageid 716, **révision 1683**, 12:35:43 UTC.
2. `bin/wiki-put.sh "Lot 45 — Clôture des lots 9 à 11" pages/Lot_45.txt "[Lot 44][Ouverture] Création de la page du lot 45, détaché du lot 44" --createonly`
   : `Success`, `"new": true`, pageid 717, **révision 1684**, 12:35:57 UTC.

## 6. Vérifications

### Vérification décisive

`bin/wiki-api.sh --facts` sur « Lot 44 — Mémoire des choix contraints et
clôture des travaux » :

```
Work_package_number -> ['44']
Work_package_opening_date -> ['1/2026/10/19']
Work_package_overlaps -> ['Lot_21_—_Grandeurs_et_unités#0##', 'Lot_27_—_Conduite_du_projet#0##']
Work_package_status -> ['ouvert']
Work_package_summary -> ["Rassembler les choix que l'outil impose au modèle, compléter la clôture d'un lot pour qu'elle les y verse, écrire la clôture d'une conversation de travail, et clore sept des dix lots livrés sans l'avoir jamais été."]
_INST -> ['Lot#14##']
```

`bin/wiki-api.sh --facts` sur « Lot 45 — Clôture des lots 9 à 11 » :

```
Work_package_depends_on -> ['Lot_44_—_Mémoire_des_choix_contraints_et_clôture_des_travaux#0##']
Work_package_number -> ['45']
Work_package_status -> ['identifié']
Work_package_summary -> ['Clore les lots 9, 10 et 11, livrés en aout 2026 et jamais clos, dont la relecture demande quatre passages dans quatre conversations.']
_INST -> ['Lot#14##']
```

Les faits restants sont `_ASK`, `_MDAT` et `_SKEY`. Aucun `_ERRC` sur l'une
ni sur l'autre. Les deux valeurs de `Work_package_overlaps` sont bien
découpées en deux pages. **Réussie sur les deux pages.**

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| `bin/wiki-verify.sh` | `IDENTIQUE` pour les deux pages, code de sortie 0 |
| Catégorie:Lot | **45** membres (`categorymembers`), numéros de 1 à 45 sans trou ni doublon |
| Tiret des titres créés | relus dans `categorymembers`, les titres des lots 44 et 45 portent U+2014 en huitième position, comme le lot 43 relu dans la même réponse |
| Classe `error` dans les rendus | 0 sur chacune |
| Liens rouges | aucun sur chacune (`class="new"` et `redlink=1` : 0) |
| Liens internes du lot 44 | **7**, tous existants : « Gestion des lots », « Lot 21 — Grandeurs et unités », « Lot 27 — Conduite du projet » (posé par le modèle), « Lot 45 — Clôture des lots 9 à 11 », « Procédure d'ouverture d'un lot », « Procédure de clôture d'un lot », « Récapitulatif technique du Système de Gestion de Données Techniques » |
| Liens internes du lot 45 | **3**, tous existants : « Gestion des lots », « Lot 44 — Mémoire des choix contraints et clôture des travaux », « Procédure de clôture d'un lot » |
| Catégories | une seule sur chacune, `Catégorie:Lot` |
| « Gestion des lots » | rendu produit à 12:36:48 UTC, environ une minute après les créations, sans écriture ni purge : lot 44 dans « En cours », lot 45 dans « À venir », « Lots au total : 45 » (En cours 3, Faits 17, À venir 25, Abandonnés 0). `lastrevid` **1240, inchangé**. Aucune purge n'a été nécessaire |

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- **Faits du texte vérifiés et confirmés**, en lecture seule, par
  `action=ask` sur `Catégorie:Lot` :
  - les lots clos sont exactement 12, 13, 22, 27, 28, 33 et 34, tous livrés
    le 2 septembre 2026 ou après (le 13 le 2 septembre) ;
  - les lots livrés et non clos sont exactement 1 à 6, 8, 9, 10 et 11,
    livrés entre le 25 juillet (lots 1 et 2) et le 31 aout 2026 (lot 10) ;
    le lot 9 est livré le 16 aout, ce qui confirme la borne du lot 45 ;
  - le lot 21 est bien à l'état ouvert.
  Le reste du texte (comptes de fichiers, conversations, mesures sur 550
  pages) n'a pas été recompté.
- **Trois lots sont ouverts, pas deux** : 21, 24 et 44. Le texte ne dit rien
  du lot 24, et n'avait pas à le faire ; je le note parce que la section
  « En cours » de *Gestion des lots* en compte trois.
- Le lot 44 porte sur sa page une décision datée du 20 octobre 2026
  (restriction à sept lots), postérieure à sa date d'ouverture du
  19 octobre. Ce n'est pas une contradiction ; je le signale seulement.
- Le répertoire privé `../ecolibre-sgdt-prive/` n'existe pas dans cet
  environnement cloud : la session s'est ouverte sur les variables
  d'environnement, chemin prévu par `bin/wiki-login.sh`.
- Une de mes requêtes de contrôle (liens et catégories) a d'abord échoué
  par un paramètre `generator=` vide que j'avais laissé par erreur ; reprise
  sans lui, en lecture seule, sans effet sur le wiki.
- Poussée : la session est tenue de pousser sur sa branche désignée,
  `ccr-4b59dccc-xydpag`, et non sur `main`.
