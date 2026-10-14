# Lot 43 — création de la page de cadrage, 14 octobre 2026

Création de la page du lot 43 avant son ouverture. Le lot n'est pas ouvert :
son ouverture relève d'une autre conversation, selon la procédure
d'ouverture d'un lot. Session Claude Code hébergée (cloud), branche locale
`claude/clever-clarke-o1jkjc`, au même commit que `origin/main` (`7643f0a`)
au départ.

## Titre cible

**« Lot 43 — Modes opératoires »**, avec le tiret **U+2014** (EM DASH, tiret
cadratin).

Mesure : le lot 42 a été lu par
`[[Category:Lot]][[Work_package_number::42]]` (`action=ask`). Son titre est
« Lot 42 — État de conception des modèles », et son huitième caractère,
décodé par `ord()`, vaut U+2014. J'ai contrôlé la chaîne tapée pour le titre
cible de la même façon avant tout envoi : huitième caractère U+2014, aucun
tiret simple.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` : sortie vide, aucun arrêt.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.

## 2. Session

`bin/wiki-login.sh` : `Success Cywil`.

## 4. Contrôles avant écriture

| Contrôle | Mesure | Résultat |
|---|---|---|
| Catégorie:Lot : 42 membres | `categorymembers` : 42 ; `categoryinfo` : 42 ; `action=ask` sur `[[Category:Lot]]` : 42 pages | conforme |
| Numérotés de 1 à 42 sans trou, aucun 43 | numéros tirés des titres : de 1 à 42, aucun trou, aucun doublon, aucun titre hors du motif « Lot N … ». Valeurs de `Work_package_number` : de 1 à 42 également | conforme |
| Titre cible libre | `missing` ; `list=allpages` avec le préfixe « Lot 43 » : aucune page, donc pas non plus de variante à tiret simple | conforme |
| « Remplacer un rayon sur une roue à moyeu moteur » existe | oui, `lastrevid` 1603 | conforme |
| « Norme de dimensionnement des rayons de vélo » existe | oui, `lastrevid` 1597 | conforme |
| « Gestion des lots » existe | oui, `lastrevid` 1240 | conforme |
| « Limites connues du Système de Gestion de Données Techniques » existe | oui, `lastrevid` 1546 | conforme |

Contrôles en plus, avant d'écrire :
- `Modèle:Lot` porte bien les trois paramètres employés
  (`Work_package_number`, `Work_package_status`, `Work_package_summary`) ;
- `Attribut:Work_package_status` est une énumération fermée. Ses valeurs
  admises (`_PVAL`) sont identifié, cadré, ouvert, livré, clos et abandonné :
  « identifié » en fait partie, et vingt-trois lots l'employaient déjà avant
  la création (mesuré après coup par `action=ask` sur
  `[[Work_package_status::identifié]]` : 24 pages, dont le lot 43) ;
- dans la copie locale : cinq liens vers quatre pages distinctes, aucun
  replié sur deux lignes, aucune syntaxe `::` ni fonction d'analyseur.

## 5. Copie locale

`pages/Lot_43.txt`, écrit avec l'outil d'écriture de fichier, texte recopié
mot pour mot. Comme `pages/Lot_21.txt`, il n'a pas de saut de ligne final.

## 6. Création

`bin/wiki-put.sh "Lot 43 — Modes opératoires" pages/Lot_43.txt "[Lot 43][Cadrage] Création de la page du lot" --createonly`
: `Success`, `"new": true`, pageid 672, **révision 1604**.

## 7. Vérifications

### Vérification décisive

`bin/wiki-api.sh --facts "subject=Lot 43 — Modes opératoires&ns=0"` :

```
Work_package_number -> ['43']
Work_package_status -> ['identifié']
Work_package_summary -> ['Donner une classe aux pages qui décrivent comment faire, et la rattacher au niveau référencé.']
_INST -> ['Lot#14##']
```

Les faits restants sont `_ASK` (les trois requêtes du modèle), `_MDAT` et
`_SKEY`. Aucun `_ERRC`. **Réussie.**

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| Catégorie:Lot | **43** membres (`categorymembers` et `categoryinfo`), un de plus qu'à l'étape 4. `action=ask` trié sur `Work_package_number` rend 43 en tête |
| Tiret du titre créé | le titre relu dans `categorymembers` porte U+2014 en huitième position, **identique** au tiret du lot 42, relu dans la même réponse |
| Classe `error` dans le rendu | 0 |
| Liens rouges | aucun |
| Liens internes | **4**, tous existants : « Gestion des lots », « Limites connues du Système de Gestion de Données Techniques », « Norme de dimensionnement des rayons de vélo », « Remplacer un rayon sur une roue à moyeu moteur » |
| « Gestion des lots » | `lastrevid` **1240, inchangé** |

Contrôles en plus :
- le texte stocké, relu par `bin/wiki-get.sh` et comparé par `cmp` à
  `pages/Lot_43.txt`, est identique octet pour octet ;
- une seule catégorie, `Catégorie:Lot`, posée par le modèle, cachées
  comprises : aucune catégorie de suivi ;
- quatre sections : « Objet », « Ce qui est déjà tranché », « Périmètre »,
  « Points ouverts » ;
- le rendu de « Gestion des lots », produit à 16 h 53 min 55 s UTC,
  33 secondes après la création (16 h 53 min 22 s), affiche déjà le lot 43 sans que la page ait
  reçu la moindre écriture ni purge.

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- **« La classe Personne, lot 29 » n'est écrit nulle part sur le wiki.** La
  page « Lot 29 — Alignement sur l'ontologie PAIR », lue en entier
  (1 388 octets), porte sur l'alignement du vocabulaire avec l'ontologie
  PAIR. Elle ne mentionne aucune classe Personne, ni les mots « Person »,
  « agent », « acteur » ou « contributeur ». Une recherche plein texte de
  l'expression exacte « classe Personne » (`list=search`, espaces principal,
  Utilisateur, Projet, Modèle et Catégorie) ne trouve que deux pages, qui en
  parlent comme d'une classe éventuelle à venir, sans numéro de lot :
  `Catégorie:Organisation` et le *Récapitulatif technique du Système de
  Gestion de Données Techniques*. Le rattachement au lot 29 est peut-être
  juste dans l'intention, puisque PAIR décrit aussi des personnes, mais
  aucune page ne le dit. Le texte a été recopié tel quel, comme l'exige la
  règle 2.
- **Faits du texte vérifiés et confirmés**, en lecture seule :
  - `Catégorie:Item à facette végétal` compte bien 72 membres ;
  - les six propriétés citées existent : `Propagated_from`,
    `Propagation_method`, `Planting_date`, `Service_status`, `Design_source`
    et `Procurement_route` ;
  - TemplateStyles ne figure pas parmi les 26 extensions déclarées par
    `siteinfo` ;
  - aucune page ne s'intitule « Déformer ». Cette mesure ne porte que sur ce
    titre exact, et non sur toute la liste des procédés.
- `Catégorie:Item à facette végétal` a 72 membres, mais sa page de
  description n'existe pas (`missing`). C'est hors du périmètre de cette
  tâche ; je le signale seulement.
- `origin/main` n'avait pas bougé depuis la tâche précédente : aucune mise à
  niveau n'a été nécessaire.
