# Lot 44 — création de « Choix imposés par l'outil », 20 octobre 2026

Premier livrable du lot 44 : création de la page « Choix imposés par
l'outil », puis remplacement de la ligne « Voir aussi » du pied de page de
« Gestion des lots ». Le commit `19a709e` (copies locales et rapport de
création des lots 44 et 45) est ramené sur `main` avec ce travail. Session
Claude Code hébergée (cloud), branche de travail `ccr-4b59dccc-xydpag`.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` au départ : sortie vide, aucun arrêt.
- `git fetch origin` : `origin/main` toujours sur `65d0efd`. La branche de
  travail était déjà `65d0efd` plus `19a709e`, identique à
  `origin/ccr-4b59dccc-xydpag`. Les deux fusions demandées
  (`origin/main`, puis `origin/ccr-4b59dccc-xydpag`) ont répondu
  `Already up to date` : aucun conflit.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.
- Ni `pages/Choix_imposes_par_l_outil.txt` ni
  `travaux/lot-44-choix-imposes.md` n'existaient avant la tâche.

## 2. Contrôles avant écriture

| Contrôle | Mesure | Résultat |
|---|---|---|
| « Choix imposés par l'outil » n'existe pas | `prop=info` : `missing` | conforme |
| Aucune variante proche | `list=allpages`, préfixe « Choix » : aucune page | conforme |
| « Récapitulatif technique du Système de Gestion de Données Techniques » existe | oui, `lastrevid` 1463 | conforme |
| « Limites connues du Système de Gestion de Données Techniques » existe | oui, `lastrevid` 1546 | conforme |
| « Gestion des lots » existe | oui, `lastrevid` 1240, aucune protection native | conforme |
| La ligne à remplacer figure mot pour mot dans « Gestion des lots » | comparaison de chaîne exacte en Python : ligne 41 sur 43, une seule occurrence | conforme |

Contrôles en plus :
- `Catégorie:Page de suivi` existe (`lastrevid` 1260), de même que les deux
  autres pages liées par le pied de page de « Gestion des lots » :
  « Registre des facettes » (431) et « Notes en attente de rangement »
  (1547) ;
- règle 5, dans la copie locale : huit fragments entre `<code>`
  (`Corresponds to`, `Property_cardinality`, `Property_domain`,
  `Property_range`, `Part_of` deux fois, `MediaWiki:`, `editinterface`).
  Hors de ces balises : zéro `::`, zéro `{{`, zéro `}}`, zéro `{|`. Aucun
  fragment cité ne contient lui-même de `::` ni d'accolades ;
- liens de la copie locale : cinq, dont la catégorie, aucun replié sur deux
  lignes.

## 3. Copie locale

`pages/Choix_imposes_par_l_outil.txt`, écrit avec l'outil d'écriture de
fichier, texte recopié mot pour mot, sans saut de ligne final.

## 4. Écritures

1. `bin/wiki-login.sh` : `Success Cywil`.
2. `bin/wiki-put.sh "Choix imposés par l'outil" pages/Choix_imposes_par_l_outil.txt "[Lot 44] Création : les six choix que l'outil impose au modèle" --createonly`
   : `Success`, `"new": true`, pageid 718, **révision 1685**, 12:50:06 UTC.
3. « Gestion des lots » : relue juste avant l'écriture (`lastrevid` encore
   1240), la ligne 41 remplacée par la nouvelle, et rien d'autre. Diff
   contrôlé avant envoi : une seule ligne différente sur 43, 36 octets de
   plus, soit exactement « les [[Choix imposés par l'outil]], ». Le script de
   remplacement, montré avant son lancement, refusait d'écrire si la ligne
   était absente ou présente plusieurs fois. Envoi :
   `bin/wiki-put.sh "Gestion des lots" <scratchpad>/gdl-nouveau.txt "[Lot 44] Pied de page : renvoi vers les Choix imposés par l'outil"`
   : `Success`, **révision 1686** (ancienne 1240), 12:50:26 UTC.

Deux écritures sur le wiki, pas une de plus.

## 5. Vérifications

### Vérification décisive

- `bin/wiki-verify.sh "Choix imposés par l'outil" pages/Choix_imposes_par_l_outil.txt`
  : `IDENTIQUE`, code de sortie 0.
- Rendu (`action=parse&prop=text`) : zéro classe `error`, aucun marqueur
  d'avertissement de Semantic MediaWiki (`smw-highlighter`,
  `smwttinline`, `smw-warning`).
- `bin/wiki-api.sh --facts` :

  ```
  _INST -> ['Page_de_suivi#14##']
  _MDAT -> ['1/2026/10/20/12/50/6/0']
  _SKEY -> ["Choix imposés par l'outil"]
  ```

  Aucun fait métier : aucun des huit fragments de `<code>` n'a été lu comme
  une annotation. Le fait `_INST` en plus de `_MDAT` et `_SKEY` est
  l'appartenance à `Catégorie:Page de suivi`, posée par le texte lui-même ;
  voir « Écarts et surprises ».

**Réussie sur le critère d'échec de la consigne** : aucun fait métier.

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| Six entrées numérotées de 1 à 6 | **non conforme**. Le rendu porte **six listes numérotées distinctes** (six `<ol>`, chacun sans attribut `start`) : chaque entrée s'affiche « 1. ». Voir « Écarts et surprises » |
| Liens rouges | aucun (`class="new"` : 0) |
| Liens internes | **trois**, tous existants : « Gestion des lots », « Limites connues du Système de Gestion de Données Techniques », « Récapitulatif technique du Système de Gestion de Données Techniques » |
| Catégories | une seule, `Catégorie:Page de suivi` |
| « Gestion des lots », renvoi | le rendu de la révision 1686 (cache produit à 12:50:50 UTC) lie « Choix imposés par l'outil », lien existant |
| « Gestion des lots », compteurs | inchangés : total 45, En cours 3, Faits 17, À venir 25, Abandonnés 0 |
| « Gestion des lots », tableaux | trois tableaux rendus avec 3, 17 et 25 lignes de données ; la section « Abandonnés » rend son texte par défaut « Aucun lot abandonné. », comme avant. Zéro classe `error`, aucun lien rouge. Aucune requête cassée |

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- **La numérotation de 1 à 6 n'est pas obtenue, et c'est le texte fourni qui
  en est la cause.** Les six entrées sont séparées par une ligne vide
  (lignes 12, 18, 24, 30 et 36 de la copie locale). En wikitexte, une ligne
  vide ferme une liste : chaque entrée ouvre donc sa propre liste et
  s'affiche « 1. ». Je l'ai vu avant l'envoi et j'ai écrit le texte tel quel,
  comme l'exige la règle 1 ; le rendu l'a confirmé. C'est le piège déjà
  décrit par `bin/wiki-append.sh` dans `CLAUDE.md` (une ligne vide coupe la
  liste au rendu). Une correction possible, à valider : supprimer les cinq
  lignes vides entre les entrées, ce qui ne change aucun mot. Elle ferait une
  troisième écriture, hors de cette consigne : je ne l'ai pas faite. Le
  renvoi « Les entrées se citent par leur numéro » ne tient pas tant que les
  numéros affichés sont tous 1.
- **La consigne disait que `--facts` ne devait rendre que `_MDAT` et
  `_SKEY` ; il rend aussi `_INST`.** Ce fait est la catégorie
  `Catégorie:Page de suivi`, que le texte pose volontairement en dernière
  ligne. `CLAUDE.md` le prévoit (« plus `_INST` quand elle est volontairement
  rangée dans une catégorie : `_INST` porte alors cette catégorie et rien
  d'autre »). Ce n'est pas un fait métier, et le critère d'échec n'est pas
  atteint ; mais la lettre de l'étape 8 ne l'avait pas prévu.
- Le texte écrit « couterait », « cout » et « chaine » sans accent
  circonflexe, en orthographe rectifiée de 1990, comme « aout » dans les
  pages des lots 44 et 45. Écrit tel quel.
- Affirmations du texte non recomptées : les « quatre règles métier » de
  l'entrée 2, le constat du 4 octobre 2026 en bac à sable, la date du
  18 octobre 2026 de l'entrée 1, et l'absence du droit `editinterface` pour
  le compte robot. Rien de ce que j'ai lu pendant la tâche ne les contredit.
- « Gestion des lots » n'a pas de copie locale dans `pages/`. Le fichier
  envoyé est resté dans le scratchpad de la session, comme la page n'en avait
  pas avant ; je n'en ai pas créé, la consigne n'en demandant pas.

## Poussée

Commit poussé sur `main`, qui porte désormais aussi `19a709e`, et sur la
branche désignée `ccr-4b59dccc-xydpag`. Si la ligne qui suit dans
l'historique git dit autre chose, c'est elle qui fait foi.
