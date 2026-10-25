# Lot 44 — complément de la procédure de clôture d'un lot, 25 octobre 2026

Ajout, à l'étape 3 de la *Procédure de clôture d'un lot*, du versement des
choix imposés par l'outil et du test qui les sépare des limites connues.
Deuxième travail du lot 44, après la page « Choix imposés par l'outil ».
Session Claude Code hébergée (cloud), branche de travail
`ccr-4b59dccc-xydpag`.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` au départ : sortie vide, aucun arrêt.
- `git fetch origin` : `origin/main` sur `b54a085`, comme la branche de
  travail ; `Already up to date`.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.

## 2. Contrôles avant écriture

| Contrôle | Mesure | Résultat |
|---|---|---|
| `lastrevid` de « Procédure de clôture d'un lot » | **1479** (6 519 octets), une seule catégorie, `Page de suivi` | relevé |
| « Choix imposés par l'outil » existe, six entrées numérotées | oui (`lastrevid` 1687) ; rendu : une seule `<ol>`, six entrées de premier niveau | conforme |
| Liens entrants de « Choix imposés par l'outil » | **3** : lot 44, *Récapitulatif technique*, *Limites connues* | conforme |
| Chaîne d'ancrage | ligne 61 du wikitexte, une seule occurrence comme ligne entière (`grep -c -x -F` : 1) | conforme |

## 3. Préparation et diff

La page a été relue entière par `bin/wiki-get.sh` dans le scratchpad, puis
copiée. Le bloc a été inséré dans la copie avec l'outil de modification de
fichier, ancré sur la ligne exacte de la consigne.

`diff` avant envoi : **un seul bloc `62a63,68`, six lignes ajoutées**, les
trois paragraphes chacun suivi d'une ligne vide. **Zéro ligne retirée**
(`grep -c '^<'` : 0), zéro ligne modifiée. Disposition obtenue : ligne 61
l'ancrage, 62 la ligne vide existante, 63, 65 et 67 les trois paragraphes,
64, 66 et 68 leurs lignes vides, 69 le paragraphe « Un travail à faire »,
inchangé. Aucun lien replié sur deux lignes. La seule forme
`[[Catégorie:…]]` de la page reste la ligne de rangement finale, déjà
présente.

## 4. Écriture

`bin/wiki-login.sh` : `Success Cywil`. `lastrevid` relu juste avant
l'envoi : 1479, inchangé.

`bin/wiki-put.sh "Procédure de clôture d'un lot" <scratchpad>/pcl-nouveau.txt "[Lot 44] Étape 3 : les choix imposés par l'outil, et le test qui les sépare des limites connues"`
: `Success`, 1479 → **révision 1695**, 18:28:19 UTC.

Une seule écriture sur le wiki.

## 5. Vérifications

### Vérification décisive

| Contrôle | Résultat |
|---|---|
| Le diff ne montre que des lignes ajoutées | six ajoutées, zéro retirée, zéro modifiée (section 3) |
| `bin/wiki-verify.sh` | `IDENTIQUE` |
| Liens entrants de « Choix imposés par l'outil » | **4** : les trois d'avant, plus « Procédure de clôture d'un lot » |

**Réussie.**

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| Classe `error` | 0 |
| Liens rouges | aucun (`class="new"` : 0, aucun lien vers une page absente) |
| Titres de section | « Où lancer cette procédure », puis « 1. Relire les échanges du lot », « 2. Cribler les rapports du lot », « 3. Ranger chaque trouvaille », « 4. Vérifier les points ouverts déclarés », « 5. Clore » : inchangés |
| Bloc `pre` | 1 balise `pre` avant (rendu de la révision 1479) et 1 après (révision 1695) ; contenu rendu identique octet pour octet (`cmp`) |
| Catégorie | `Catégorie:Page de suivi`, seule |
| Emplacement | dans le rendu, entre le titre de la section 3 et celui de la section 4, dans cet ordre : le paragraphe sur les faits mesurés, les trois paragraphes ajoutés, le paragraphe sur le travail à faire |

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- **Le comptage des `pre` « avant » a été fait après coup.** Je ne l'ai pas
  relevé avant l'écriture, contrairement à ce que demandait la consigne. Je
  l'ai rattrapé en analysant l'ancienne révision (`action=parse&oldid=1479`),
  qui rend le même résultat qu'un comptage préalable : le rendu d'une
  révision passée ne dépend pas de l'écriture suivante. Une seule balise
  `pre`, avant comme après, et le même contenu.
- **La section « Où lancer cette procédure » porte encore l'ancien motif.**
  Elle dit qu'ailleurs que dans la conversation du lot « on ne dispose que
  d'extraits et de résumés générés ». La page du lot 44 a tranché le
  19 octobre 2026 que la clôture reste dans cette conversation « mais pour un
  autre motif » : le texte intégral n'est pas inaccessible du dehors, il est
  impraticable à relire en entier. La procédure n'a pas été reprise sur ce
  point. C'est hors de cette consigne, qui n'autorisait qu'un ajout à
  l'étape 3 : je le signale seulement.
- **Trois rubriques ou quatre.** Le texte ajouté dit qu'une entrée des Choix
  imposés « porte quatre rubriques », ce qui correspond à la page publiée
  (le choix, ce qui l'impose, sans cette contrainte, cout d'une reprise). La
  page du lot 44 écrit encore « Chaque entrée porte trois choses », en ne
  comptant pas le choix lui-même. Les deux ne se contredisent pas sur le
  fond, mais l'une compte trois là où l'autre compte quatre.
- « Dispersé sur cinq pages » (le sens du facteur de conversion, du 18 au
  20 octobre 2026) n'a pas été recompté. La date du 18 octobre concorde avec
  l'entrée 1 de « Choix imposés par l'outil ».
- `pages/Procedure_cloture_lot34.txt` est une ancienne copie locale de la
  procédure, datant du lot 34. Je ne l'ai pas mise à jour, la consigne ne le
  demandant pas ; elle ne reflète ni la révision 1479 ni la 1695. Le fichier
  envoyé est resté dans le scratchpad de la session.

## Poussée

Commit poussé sur `main`, et sur la branche désignée `ccr-4b59dccc-xydpag`.
