# Saisie du 14 octobre 2026 — rayon G12 L74 et page de norme des jauges

Suite de la saisie rapportée dans `travaux/saisie-2026-10-13-items-roue-velo.md`.
Hors lot, étiquette de résumé `[Saisie]`. Le nom du fichier reprend celui que
fixait la consigne (13 octobre). Les écritures sur le wiki datent, elles, du
14 octobre 2026 à 10 h 46 UTC.

Session Claude Code hébergée (cloud), branche locale
`claude/clever-clarke-o1jkjc`.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` : sortie vide, aucun arrêt.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.
- `origin/main` avait avancé depuis la tâche précédente, de `95e6eb6` à
  `5dee059` (« [Lot 21][Tâche 21] Rapport : trois mesures faites… », qui ne
  touche que `travaux/lot-21-tache21-trois-mesures.md`). Ce commit ne modifie
  pas `CLAUDE.md`. La branche locale a été mise à niveau par
  `git merge --ff-only origin/main` avant tout travail.

## 1 bis. Ménage des branches distantes — aucune branche supprimée

État initial (`git ls-remote --heads origin`) : `ccr-ad6f0bcb-wsc18c` et
`main` à `5dee059`, `claude/clever-clarke-o1jkjc` à `95e6eb6`,
`claude/great-fermi-orlfk0` à `a4c7b63`, `claude/magical-mayer-lm5dk7` à
`859901f`. Les trois branches visées ont été rapatriées par
`git fetch origin` en les nommant.

| Branche | `git merge-base --is-ancestor origin/<branche> origin/main` | Suppression |
|---|---|---|
| `claude/clever-clarke-o1jkjc` | contenue dans main | **non tentée** : c'est la branche de cette session, voir ci-dessous |
| `claude/great-fermi-orlfk0` | contenue dans main | **refusée** : `error: RPC failed; HTTP 403 curl 22 The requested URL returned error: 403` |
| `claude/magical-mayer-lm5dk7` | contenue dans main | **refusée** : même erreur HTTP 403 |

**`claude/clever-clarke-o1jkjc`.** La consigne la désigne comme branche
morte, mais elle interdit aussi de toucher à la branche de ma propre session.
Or `git branch --show-current` rend `claude/clever-clarke-o1jkjc` : c'est la
branche que l'environnement hébergé assigne à cette session. Devant cette
contradiction, je n'ai pas tenté de suppression. Le 13 octobre, le contrôle de
fin de session de l'environnement a exigé que cette branche soit poussée à
distance. Une suppression aurait donc vraisemblablement été suivie de la même
exigence : c'est une déduction, je ne l'ai pas mesurée.

**Le refus 403.** Le statut du proxy de la session
(`/__agentproxy/status`) ne relève aucune défaillance de relais
(`recentRelayFailures` vide). Le refus vient donc de la politique d'accès git
de la session hébergée, pas d'une panne. Cette politique a accepté
`git push origin HEAD:main` le 13 octobre, mais refuse la suppression d'une
autre branche. La documentation du proxy demande de ne pas réessayer un refus
de politique et de ne pas le contourner. Le refus est constaté sur deux
branches distinctes, une tentative chacune, sans nouvel essai. Aucun autre
moyen n'a été tenté : le connecteur GitHub disponible dans cette session ne
propose d'ailleurs aucune suppression de branche.

`ccr-ad6f0bcb-wsc18c` n'a pas été touchée.

## 2. Session

`bin/wiki-login.sh` : `Success Cywil`.

## 3. Mesure du maximum Base 36

Commande, identique à celle de la tâche précédente :

```
bin/wiki-api.sh "action=ask&query=%5B%5BCategory:Functional%20item%7C%7COrganic%20item%7C%7CReferenced%20item%5D%5D%5B%5BItem_ref::%2B%5D%5D%7C%3FItem_ref%7Csort=Item_ref%7Corder=desc%7Climit=5&format=json&formatversion=2"
```

Résultat : **003A**, porté par « Outil de serrage d'écrou de rayon de vélo ».
Le repère est confirmé. La même requête sans filtre de catégorie rend le même
maximum. `Item_ref` est résolu en `_cod`. Avant écriture,
`[[Item_ref::003B||003b]]` ne rendait aucune page.

**Référence attribuée : 003B.**

## 4. Comptes avant écriture

Catégorie:Referenced item : **41** (`categoryinfo`, recoupé par
`categorymembers`), conforme au repère.

## 5–6. Écritures

Contrôles faits avant d'écrire :
- les deux pages étaient `missing`, sans protection native ;
- `Modèle:Referenced item` porte bien les quatre paramètres employés
  (`Corresponds_to_organic`, `Procurement_route`, `Supplier`, `Sourcing_year`) ;
- `Attribut:Procurement_route` n'a pas de liste de valeurs admises
  (`Property_range` : « valeurs laissées émerger »), et `acheté` y était déjà
  employé par trois pages ;
- types résolus : `Procurement_route` en `_txt`, `Supplier` et
  `Corresponds_to_organic` en `_wpg`, `Sourcing_year` en `_num`.

| Page | Résumé | Révision |
|---|---|---|
| Rayon de vélo G12 L74 | [Saisie] Création de l'item référencé | 1596 |
| Norme de dimensionnement des rayons de vélo | [Saisie] Création de la page de référence sur les jauges de rayon | 1597 |

Les deux pages ont été créées avec `--createonly`, à partir de textes
recopiés mot pour mot. Les champs `Manufacturer`, `Manufacturer_reference` et
`Supplier_reference` sont absents du wikitexte.

## 7. Vérifications

### Vérification décisive

`bin/wiki-api.sh --facts "subject=Rayon de vélo G12 L74&ns=0"` :

```
Corresponds_to_organic -> ['Rayon_de_vélo#0##']
Item_description -> ["Rayon à tête coudée, de jauge G12 et de longueur 74 mm, …"]
Item_ref -> ['003B']
Procurement_route -> ['acheté']
Sourcing_year -> ['2026']
Supplier -> ['Amazon#0##']
_INST -> ['Referenced_item#14##']
```

Les cinq faits attendus sont présents. Aucun fait `Manufacturer`,
`Manufacturer_reference` ni `Supplier_reference` n'est stocké. **Réussie.**

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| Catégorie:Referenced item | 41 avant, **42** après (`categoryinfo` et `categorymembers`), le nouveau membre étant « Rayon de vélo G12 L74 » — réussie |
| Unicité de 003B | `[[Item_ref::003B]]` ne rend qu'une page, « Rayon de vélo G12 L74 » — réussie |
| Bloc « Implémenté par » de « Rayon de vélo » | le rendu (`action=parse&page=`) affiche « Implémenté par (Solution technique) : Rayon de vélo G12 L74 (Réf. SMW : 003B) » — réussie |
| Rendu de la page de norme | un tableau `wikitable` de cinq lignes (en-tête et quatre jauges) ; une seule liste numérotée de trois éléments ; cinq sections ; quatre liens externes ; aucun lien rouge ; **aucune classe `error`** — réussie |
| Faits de la page de norme | `_MDAT` et `_SKEY` seulement, aucune annotation parasite |
| Catégories et liens | page de norme : aucune catégorie, liens vers « Rayon de vélo » et « Rayon de vélo G12 L74 » seulement, tous deux existants. Item : catégorie Referenced item, liens vers « Amazon » et « Rayon de vélo », existants |
| `lastrevid` des trois pages du contexte | inchangés : « Remplacement de rayons de la roue motorisée d'Anton » 1576, « Roue motorisée d'Anton » 1573, « Jante 20" moteur Anton » 1574 — réussie |
| `git ls-remote --heads origin` | `main` et `ccr-ad6f0bcb-wsc18c` toujours présents, mais **les trois branches visées le sont aussi** — **échec**, voir étape 1 bis |

Le rendu de la page de norme compte six titres `h2` et trois listes à puces,
alors qu'elle a cinq sections et deux listes à puces. Le titre et la liste en
plus appartiennent au sommaire automatique (`mw-toc-heading` présent).

Conformément à la consigne, l'échec du ménage de branches est consigné ici et
rien n'a été réparé.

## Questions de Cyril en cours de route

Aucune pendant la tâche. La question A de la fin de la tâche précédente
(garder ou supprimer `claude/clever-clarke-o1jkjc`) a reçu sa réponse dans
cette consigne, qui inscrit la branche dans le ménage. Cette réponse se heurte
à la contradiction décrite à l'étape 1 bis.

## Écarts et surprises

- **Ménage de branches non fait** : refus HTTP 403 de la politique git de la
  session sur deux branches, et contradiction de consigne sur la troisième.
  Détail à l'étape 1 bis.
- Le `touched` de « Remplacement de rayons de la roue motorisée d'Anton » est
  passé à 2026-10-14T10:46:33Z, sans nouvelle révision : la création des
  pages vers lesquelles elle pointe a invalidé son cache de rendu. Ce n'est
  pas une écriture.
- Liens de cette page encore rouges après la tâche : « Clé allen », rouge
  volontairement selon la consigne précédente ; « Démonter un pneu de vélo » ;
  et « Vers page item réf correspondant », qui ressemble à un emplacement
  réservé à remplacer par un lien vers « Rayon de vélo G12 L74 ». La page ne
  pointe pas directement vers « Rayon de vélo G12 L74 ». Le lien vers
  « Norme de dimensionnement des rayons de vélo » est désormais bleu. Rien
  n'a été touché sur cette page.
- Les révisions 1588 à 1595 ont eu lieu entre la tâche précédente (1587) et
  celle-ci (1596). Elles ne sont pas de cette session et ne portent pas sur
  les trois pages du contexte, dont le `lastrevid` est inchangé.
- Autocorrection sur la tâche précédente : les neuf fichiers de contenu du
  13 octobre avaient été écrits par `cat > fichier << EOF`, contrairement à la
  règle de `CLAUDE.md` qui impose l'outil d'écriture de fichier. Le contenu
  n'en a pas souffert : la vérification par `--facts` l'avait confirmé. Cette
  fois, les deux fichiers ont été écrits par l'outil d'écriture de fichier.
