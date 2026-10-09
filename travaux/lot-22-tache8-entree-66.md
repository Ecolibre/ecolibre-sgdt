# Lot 22 — Tâche 8 — Entrée 66 des limites connues

Exécuteur : Claude Code, 9 octobre 2026. Une seule écriture sur le wiki : un
ajout en fin de liste sur *Limites connues du Système de Gestion de Données
Techniques*, par `bin/wiki-append.sh`.

**Résultat : entrée 66 ajoutée, révision 1480 → 1481. Les sept contrôles
passent.**

## Étape 1 — État du dépôt

`git status --porcelain` : vide. `.claude/settings.local.json` : `allow` et
`deny` vides.

## Étape 2 — L'écriture

**Relevés avant l'écriture** :

- `prop=info|revisions` : `lastrevid` **1480** (parent 1477, 9 octobre 2026,
  11 h 17 min 17 s UTC), `protection: []`. La révision était bien 1480 :
  l'écriture a eu lieu.
- Le fichier d'ajout, écrit dans le scratchpad par l'outil d'écriture de
  fichier, recopie le texte de la consigne. Il commence par exactement un
  saut de ligne (`od -c` : `\n #`) et contient une seule ligne `# `.
- Session ouverte par `bin/wiki-login.sh` (« Success Cywil »).

**Appel** :

```
bin/wiki-append.sh "Limites connues du Système de Gestion de Données Techniques" <scratchpad>/entree66.txt "[Lot 22][Tâche 8] Limites connues, entrée 66 : le compte de showJobs.php est en retard sur la table job"
```

**Sortie** :

```
Pré-contrôle OK — 65 entrées « # » avant ajout, la liste finit la page.
"result": "Success", "oldrevid": 1480, "newrevid": 1481, "newtimestamp": "2026-10-09T21:59:03Z"
Post-controle OK : 65 -> 66 entrees, lajout est bien la derniere entree de la page.
Rendu OK : lajout sinsere dans la liste existante (1 bloc(s) <ol> sur la page).
```

**Révisions : avant 1480, après 1481.**

## Étape 3 — Vérifications

Les contrôles 1 à 5 ont été faits par un script de lecture seule
(`verif_t8.py`, du scratchpad), montré en entier dans le message de
lancement. Il fait des appels GET anonymes à l'API de production et n'écrit
rien. Il a été lancé une seule fois. Sortie complète :

```
révision lue : 1481 | référence : 1480
1. lignes commençant par # : 66 (révision 1480 : 65 )
   66e identique au caractère près : True | longueurs 1197 1197
   la 66e est la dernière ligne non vide : True
2. entrées 1 à 65 différentes de la révision 1480 : aucune
   reste de la page (hors entrée 66) identique : True | lignes 90 -> 91
3. commentaires aux lignes : [20] | première entrée ligne 26 | avant la liste : True
   texte du commentaire : <!-- Cette liste doit rester la dernière chose de la page.
4. catégories : ['Catégorie:Page de suivi']
5. liens : 4 | vers des pages inexistantes : aucun
```

1. **QUI TRANCHE — passe.**
   - Le wikitexte de la révision 1481, relu par l'API (`action=parse`),
     porte 66 lignes commençant par « # ».
   - La 66e est identique au caractère près à la ligne du fichier d'ajout :
     comparaison par égalité de chaînes, 1197 caractères de chaque côté. Le
     fichier d'ajout est lui-même une copie du texte de la consigne.
   - La 66e est aussi la dernière ligne non vide de la page.
2. **Les 65 entrées précédentes sont inchangées.** Chacune a été comparée à
   son homologue de la révision 1480, relue par `action=parse&oldid=1480` :
   aucune différence. Au-delà des entrées, les 90 lignes de la révision 1480
   se retrouvent identiques, dans l'ordre, en tête des 91 lignes de la 1481.
3. **Le commentaire garde-fou est toujours avant la liste.** C'est le seul
   commentaire HTML de la page. Il est à la ligne 20 et la première entrée à
   la ligne 26 (numérotation de ce relevé : voir « Écarts et surprises »).
4. **`prop=categories`** : `Catégorie:Page de suivi` seulement.
5. **`prop=links`** : 4 liens, aucun vers une page inexistante.
6. **Faits stockés, par `bin/wiki-api.sh --facts`** :
   - avant : `_INST -> ['Page_de_suivi#14##']`,
     `_MDAT -> ['1/2026/10/9/11/17/17/0']`, `_SKEY -> ['Limites connues du
     Système de Gestion de Données Techniques']` ;
   - après : `_INST` identique, `_MDAT -> ['1/2026/10/9/21/59/3/0']`,
     `_SKEY` identique.

   Aucune annotation nouvelle ; seule la date de modification a avancé. La
   page porte aussi `_INST`, déjà présent avant l'écriture : voir « Écarts et
   surprises ».
7. **`.claude/settings.local.json`** : vide au début et à la fin.

## Étape 4 — La description dans `CLAUDE.md`

Section « Outils disponibles », description de `bin/wiki-append.sh`. Seule
la parenthèse change ; `git diff --stat` : `CLAUDE.md | 2 +-`.

Avant :

> *Limites connues du SGDT* a été réorganisée le 6 septembre 2026
> (provenance en tête, liste en fin de page, commentaire garde-fou collé à
> la dernière entrée) pour rendre ce script utilisable sur elle.

Après :

> *Limites connues du SGDT* a été réorganisée le 6 septembre 2026
> (provenance en tête, liste en fin de page, commentaire garde-fou placé
> avant la liste) pour rendre ce script utilisable sur elle.

## Questions posées ou réponses rendues hors consigne

Aucune.

## Écarts et surprises

- **Les faits de la page portent `_INST`, en plus de `_MDAT` et `_SKEY`.**
  Le contrôle 6 de la consigne attendait « seuls `_MDAT` et `_SKEY` », comme
  la leçon de `CLAUDE.md` sur les pages de documentation. `_INST ->
  Page_de_suivi` est l'appartenance à `Catégorie:Page de suivi`, posée
  volontairement. Il était déjà là avant l'écriture et n'a pas changé. Ce
  n'est pas une annotation parasite. En revanche, la leçon de `CLAUDE.md`
  (« vérifier qu'elle ne porte que `_MDAT` et `_SKEY` ») est incomplète pour
  toute page catégorisée : elle devrait admettre `_INST` pour les catégories
  posées exprès.
- **Le commentaire garde-fou est à la ligne 20 de mon relevé, contre 19 dans
  celui de Cyril.** Mon relevé découpe le wikitexte rendu par `action=parse`
  sur les sauts de ligne et numérote à partir de 1. L'écart d'une ligne vient
  probablement d'une convention de numérotation ou de découpage différente.
  Il ne change pas la conclusion : le commentaire est avant la liste, qui
  commence ligne 26.
