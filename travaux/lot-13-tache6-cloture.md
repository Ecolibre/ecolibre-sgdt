# Lot 13 — Tâche 6 : clôture

## Étape 1 — Test `#arraymap` sur un champ d'URL

`action=parse` avec `title=Bac à sable` et le texte de test, sans rien
écrire, rend :

```
<a class="external text" href="https://example.org/a.md">rapport</a>,<a class="external text" href="https://example.org/b.md">rapport</a>
```

**Deux liens externes distincts, séparés par une virgule.** Le test valide
la correction — l'étape 4 a été appliquée. Détail sans conséquence sur le
verdict : l'espace du séparateur `|, ` ne se voit pas dans le rendu (la
virgule est immédiatement suivie du second `<a`), MediaWiki rognant les
espaces en fin d'argument de fonction parseur ; le critère de la consigne
(deux liens séparés par une virgule, pas un seul lien) est rempli tel quel.

## Ce qui a été écrit

1. `Catégorie:Lot` : les deux remplacements demandés (revid 1171 → 1337).
   Vérifié `prop=info&inprop=protection` avant écriture : pas de verrou natif,
   et l'écriture est passée du premier coup — aucun `smw-change-propagation-protection`
   rencontré malgré l'avertissement de la consigne.
2. `Attribut:Work package closure report` : page réécrite en entier avec le
   texte fourni (revid 1165 → 1338). Même constat, pas de verrou.
3. `Modèle:Lot` : ligne d'affichage des rapports corrigée par `#arraymap`
   (revid 1182 → 1339), rien d'autre touché dans le modèle.
4. `Lot 32 — Suivi des tâches` : créé (`--createonly`, pageid 558,
   revid 1340).
5. `Procédure de clôture d'un lot` : paragraphe ajouté en fin de la section
   4 (revid 1259 → 1341).
6. `methode-de-travail.md` : un paragraphe ajouté après la règle sur les
   mesures périmées. Commit `1d66686`, `[Lot 13][Tâche 6]`.
7. `Lot 13 — Gestion des lots en classe sémantique`, en deux éditions
   distinctes :
   - Refonte de `== Points ouverts ==` par le texte fourni, retirant trois
     paragraphes désormais résolus par les étapes 2, 3 et cette clôture
     elle-même (revid 1256 → 1342).
   - Clôture : `Work_package_status` `livré` → `clos`,
     `Work_package_closure_date` = `2026-09-10`, `Work_package_delivery_date`
     inchangée (`2026-09-02`) (revid 1342 → 1343).

Résumés : `[Lot 13][Tâche 6] …` sur chaque écriture wiki, comme demandé.

## Vérifications (étape 10)

1. **`browsebysubject` sur le lot 13** : `Work_package_status -> ['clos']`,
   trois dates distinctes (`opening 1/2026/9/1`, `delivery 1/2026/9/2`,
   `closure 1/2026/9/10`), `Work_package_summary` une seule valeur,
   `Work_package_closure_report` en **dix valeurs distinctes**. Conforme.
2. **`Catégorie:Lot` compte 32 membres** (`list=categorymembers`). L'index
   `Gestion des lots`, purgé puis relu par `action=parse`, rend
   `Lots au total : 32`. La somme des quatre sections égale 32
   (`En cours 1 + Faits 13 + À venir 18 + Abandonnés 0`). **Écart avec la
   consigne : « Faits » vaut 13, pas 14.** Mesuré, pas supposé — la requête
   du décompte regroupe `livré` et `clos` dans la même section ; le lot 13
   y était déjà compté comme `livré` avant cette tâche, son passage à
   `clos` ne change donc rien à ce total, seulement à sa répartition
   interne (invisible au compteur). La consigne semble avoir compté un lot
   entrant dans « Faits » alors qu'il y était déjà. Le total (32) et
   l'égalité des sections avec ce total, seuls critères explicitement
   requis par le point 2, sont conformes.
3. **Lot 32** : `Work_package_overlaps` rend deux valeurs distinctes
   (`Lot_23_—_Priorisation`, `Lot_31_—_…`). Conforme.
4. **Aucune annotation parasite** : `browsebysubject` sur `Catégorie:Lot`
   ne rend que `_MDAT`, `_SKEY` et `_SUBC` (ce dernier préexistant,
   `[[Catégorie:SGDT]]`, pas ajouté par cette tâche). Sur
   `Attribut:Work package closure report`, seules les six propriétés du
   texte fourni plus `_MDAT`/`_SKEY`/`_TYPE`. `_TYPE` confirme
   `http://semantic-mediawiki.org/swivt/1.0#_uri` : le type reste URL.
   Wikitexte relu après écriture identique à l'octet près, sur les trois
   pages (`Catégorie:Lot`, la page de propriété, `Modèle:Lot`, `Lot 13`) —
   seul écart chaque fois l'absence de retour à la ligne final côté lecture
   API, sans incidence. Conforme.
5. **Rendu des permaliens** : sur `Lot 27 — Conduite du projet` (cinq
   permaliens), cinq liens externes distincts, tous étiquetés « rapport »,
   séparés par des virgules. Sur `Lot 9 — Exemplaires plantés du
   jardin-forêt` (un seul permalien), un lien unique, rendu identique à
   avant la correction. Conforme.
6. **`git diff` sur `methode-de-travail.md`** avant commit : un seul
   paragraphe ajouté (plus la ligne vide qui l'entoure), rien d'autre.
   Conforme.

## Écarts et surprises

**« Ajoute trois » titres, en ajoute deux.** L'étape 2 annonçait que la
nouvelle liste des sections admises « en ajoute trois » par rapport à
l'ancienne. Compté avant d'écrire : l'ancienne liste porte sept titres,
la nouvelle neuf — deux titres de plus (`Ce qui est écarté, et pourquoi`,
`Dépendances`), pas trois. Le texte de remplacement étant fourni intégralement
et explicite, je l'ai collé tel quel ; seul le chiffre annoncé dans le
contexte de la consigne était faux, pas le contenu écrit.

**Aucun verrou rencontré.** La consigne prévenait que `Catégorie:Lot` et la
page de propriété étaient « verrouillées jusqu'à récemment » et demandait de
ne pas forcer si le verrou était revenu. Les deux écritures sont passées au
premier essai, sans `smw-change-propagation-protection`. Rien à signaler,
donc rien à contourner.

**Le compte « Faits » de l'étape 10.2** (détaillé au point 2 ci-dessus) :
la consigne annonçait quatorze, la mesure en rend treize, pour une raison
structurelle (livré et clos partagent une même section de compte) et non
une erreur d'exécution. Signalé plutôt que lissé, conformément à la règle
ajoutée aujourd'hui même à `methode-de-travail.md` dans une tâche
précédente de cette session (« sa propre mesure d'hier est un résumé » ne
s'appliquait pas ici — c'est la mesure de l'instant qui contredit la
prévision — mais l'esprit est le même : vérifier plutôt que reporter).

Rien d'autre à signaler : aucune permission refusée, aucune session
expirée, aucune confirmation shell rencontrée.
