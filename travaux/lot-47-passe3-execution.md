# Lot 47, passe 3 : exécution du versement des procédures allégées, et clôture du lot

## Résultat

CONFORME : six pages écrites et identiques à leurs fichiers, lot 47 clos le 22 novembre 2026, quatre fichiers du dépôt identiques aux fichiers livrés.

## Étapes faites

1. Dépôt : `git fetch origin`, branche `main` déjà alignée sur `origin/main`, aucune avance rapide nécessaire. `git status --porcelain` vide. `.claude/settings.local.json` absent : aucune règle.
2. Connexion : `bin/wiki-login.sh` a rendu `Success Cywil`.
3. Archive : une seule, `~/Téléchargements/lot-47-passe3.tar.gz` (rien dans `~/Downloads`). SHA-256 `bcdd5907d48273a735221231c9b29c7d062137cf2dd39def529db89c71e03863`, conforme. Seize entrées, toutes sous `lot-47-passe3/`. Extraite dans `pages/`.
4. `controle.py avant` : CONFORME. J'ai lu le script avant de le lancer : lectures anonymes de l'API uniquement, et le mode `preparer` ne modifie que `lot-47.txt`.
5. Lecture des différences de `CLAUDE.md` et `installation-nouveau-poste.md` (voir plus bas).
6. Rapport de fin copié dans `travaux/` et commité seul : `da791c4c48a7f963ab0568f92fb7aff565302f95`. 1 fichier, 184 insertions. Ascendance vérifiée, poussé (`dc9ef70..da791c4  HEAD -> main`).
7. `controle.py preparer da791c4c48a7f963ab0568f92fb7aff565302f95` : PREPARE, date de clôture 2026-11-22. J'ai vérifié que le quatrième permalien des rapports porte bien ce hash.
8. Douze lignes de `commandes.txt` exécutées dans l'ordre, une à la fois : six écritures `Success`, six `wiki-verify.sh` IDENTIQUE.
9. Les trois fichiers de `depot/` copiés à la racine.
10. `controle.py apres` : CONFORME du premier coup. La ligne sur l'affichage de Gestion des lots était déjà CONFORME, donc pas de purge.
11. Relevé final : `.claude/settings.local.json` absent, aucune règle.
12. Le présent rapport.
13. Commit et poussée : voir la ligne du terminal. Ensuite, suppression de `pages/lot-47-passe3/`.

## Écarts et surprises

Aucun écart dans les vérifications. Ce que j'ai relevé en lisant les deux fichiers porteurs d'affirmations, sans rien corriger :

- **`CLAUDE.md`, « Déroulé de toute tâche », étape 2.** La phrase « une ligne commençant par `??` signale un fichier non suivi, qu'aucun `git add` nommant des chemins explicites ne peut atteindre » est fausse au pied de la lettre : un `git add` qui nomme ce chemin l'ajoute. Le sens voulu se lit sans peine, « qu'un `git add` nommant d'autres chemins n'atteint pas », mais la formule dit autre chose. Toujours à l'étape 2 : la liste `M`, `A`, `D`, `R` ne couvre ni `U` (conflit de fusion non résolu), ni `T` (changement de type), ni `C` (copie). Un conflit `UU` après une fusion ratée ne justifierait donc pas d'arrêt d'après la lettre de la règle. Le cas est rare, puisque la règle n'autorise plus que l'avance rapide.
- **`CLAUDE.md`, « Rapatrier en début de tâche ».** Après un refus de poussée, le nouveau texte demande un `git fetch origin`, puis un arrêt si `origin/main` n'est plus l'ancêtre de `HEAD`. Or un refus de poussée pour cause de non-avance rapide veut justement dire qu'`origin/main` a avancé hors de `HEAD`. Dans ce cas, qui est le cas ordinaire, la règle revient donc à s'arrêter à chaque fois. Ce n'est pas faux, c'est cohérent avec « ne jamais fusionner de soi-même », mais la tournure laisse croire qu'il existe une issue sans arrêt. Ce n'est vrai que pour un refus d'une autre nature (réseau, droits).
- **`installation-nouveau-poste.md`, format du `.env`.** J'ai vérifié les trois noms de variables contre `bin/wiki-login.sh` (`source` puis `WIKI_API`, `WIKI_USER`, `WIKI_PASS`) : ils sont conformes. Je n'ai pas lu le `.env`.
- **Contrôle non prévu, non fait.** Je n'ai pas fait de `smwbrowse`, `prop=categories` ni `prop=links` sur les trois pages de procédure ni sur Gestion des lots. `CLAUDE.md` le demande pourtant après toute écriture sur une page de documentation. `controle.py` ne regarde que les faits du lot 47 et la classe `error` au rendu.

## Questions posées et réponses rendues hors de cette consigne

Aucune.

## Révisions écrites

| Page | Ancienne | Nouvelle |
|---|---|---|
| Procédure d'ouverture d'un lot | 1820 | 1821 |
| Procédure de clôture d'un lot | 1748 | 1822 |
| Procédure de clôture d'une conversation | 1749 | 1823 |
| Lot 45 — Clôture des lots 9 à 11 | 1705 | 1824 |
| Gestion des lots | 1803 | 1825 |
| Lot 47 — Relecture de la conception au regard de la cible | 1802 | 1826 |

## Preuves

### `controle.py avant`

```
== Fichiers livrés : empreintes ==
CONFORME  commandes.txt
CONFORME  depot/CLAUDE.md
CONFORME  depot/installation-nouveau-poste.md
CONFORME  depot/methode-de-travail.md
CONFORME  pages/gestion-des-lots.txt
CONFORME  pages/lot-45.txt
CONFORME  pages/lot-47.txt
CONFORME  pages/procedure-cloture-conversation.txt
CONFORME  pages/procedure-cloture-lot.txt
CONFORME  pages/procedure-ouverture.txt
CONFORME  travaux/lot-47-relecture-passe3-rapport.md
== Pages du wiki : révision de départ, protection, catégories ==
CONFORME  révision lue 1820, attendue 1820 | protection aucune | catégories ['Catégorie:Page de suivi'] | Procédure d'ouverture d'un lot
CONFORME  révision lue 1748, attendue 1748 | protection aucune | catégories ['Catégorie:Page de suivi'] | Procédure de clôture d'un lot
CONFORME  révision lue 1749, attendue 1749 | protection aucune | catégories ['Catégorie:Page de suivi'] | Procédure de clôture d'une conversation
CONFORME  révision lue 1705, attendue 1705 | protection aucune | catégories ['Catégorie:Lot'] | Lot 45 — Clôture des lots 9 à 11
CONFORME  révision lue 1803, attendue 1803 | protection aucune | catégories ['Catégorie:Page de suivi'] | Gestion des lots
CONFORME  révision lue 1802, attendue 1802 | protection aucune | catégories ['Catégorie:Lot'] | Lot 47 — Relecture de la conception au regard de la cible
== Fichiers du dépôt : état de départ ==
CONFORME  methode-de-travail.md
CONFORME  CLAUDE.md
CONFORME  installation-nouveau-poste.md
CONFORME  travaux/lot-47-relecture-passe3-rapport.md absent, comme attendu
CONFORME  travaux/lot-47-passe3-execution.md absent, comme attendu
== Bilan ==
CONFORME
```

### `controle.py apres`

```
== Pages du wiki : texte en ligne comparé au fichier livré ==
IDENTIQUE  révision 1821, départ 1820 | Procédure d'ouverture d'un lot
IDENTIQUE  révision 1822, départ 1748 | Procédure de clôture d'un lot
IDENTIQUE  révision 1823, départ 1749 | Procédure de clôture d'une conversation
IDENTIQUE  révision 1824, départ 1705 | Lot 45 — Clôture des lots 9 à 11
IDENTIQUE  révision 1825, départ 1803 | Gestion des lots
IDENTIQUE  révision 1826, départ 1802 | Lot 47 — Relecture de la conception au regard de la cible
== Lot 47 : faits sémantiques, vérification qui tranche ==
CONFORME  état clos : ['clos']
CONFORME  date de clôture du jour : ['1/2026/11/22']
CONFORME  date de livraison du jour : ['1/2026/11/22']
CONFORME  quatre rapports liés : 4
CONFORME  permalien du rapport de la passe 3 : ['https://github.com/Ecolibre/ecolibre-sgdt/blob/da791c4c48a7f963ab0568f92fb7aff565302f95/travaux/lot-47-relecture-passe3-rapport.md']
CONFORME  aucune erreur sémantique (_ERRC) : aucune
== Index ==
CONFORME  le lot 47 n'est plus parmi les lots ouverts : ['Lot 21 — Grandeurs et unités', 'Lot 24 — Adminsys autonome', 'Lot 44 — Mémoire des choix contraints et clôture des travaux']
CONFORME  Gestion des lots affiche l'ordre des prochains travaux (ne tranche pas ; purger si besoin)
== Erreurs au rendu ==
CONFORME  0 classe error | Procédure d'ouverture d'un lot
CONFORME  0 classe error | Procédure de clôture d'un lot
CONFORME  0 classe error | Procédure de clôture d'une conversation
CONFORME  0 classe error | Lot 45 — Clôture des lots 9 à 11
CONFORME  0 classe error | Gestion des lots
CONFORME  0 classe error | Lot 47 — Relecture de la conception au regard de la cible
== Fichiers du dépôt : copie comparée au fichier livré ==
IDENTIQUE  methode-de-travail.md
IDENTIQUE  CLAUDE.md
IDENTIQUE  installation-nouveau-poste.md
IDENTIQUE  travaux/lot-47-relecture-passe3-rapport.md
== Bilan ==
CONFORME
```

### Relevé de l'étape 5

`diff CLAUDE.md pages/lot-47-passe3/depot/CLAUDE.md` :

- lignes 17-19 : la `Procédure de clôture d'une conversation` est ajoutée aux textes que l'exécuteur ne doit pas appliquer lui-même ;
- après la ligne 39 : nouvelle section « Déroulé de toute tâche » (dix étapes, avec leur motif) et sa sous-section « Les fichiers fournis » ;
- lignes 48-49 : `Gestion des lots`, avec désormais l'exception de la section « Ordre des prochains travaux », écrite à la main ;
- après la ligne 56 : `Procédure de clôture d'une conversation` ajoutée aux pages de référence ;
- après la ligne 166 : nouveau paragraphe « Forme du rapport » ;
- lignes 715-731 : « Rapatrier en début de tâche » passe de « fusionner » à `git merge --ff-only origin/main`. Après un refus de poussée : arrêt si `origin/main` n'est plus l'ancêtre de `HEAD`, avec le motif de l'accord avec la règle de fin de tâche.

`diff installation-nouveau-poste.md pages/lot-47-passe3/depot/installation-nouveau-poste.md` :

- lignes 274-286 : le format du `.env` est écrit (`WIKI_API`, `WIKI_USER`, `WIKI_PASS`, avec des valeurs muettes), avec le motif du 16 novembre 2026. Aucun secret dans le texte livré.
