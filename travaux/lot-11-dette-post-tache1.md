# Lot 11 — dette soldée après la tâche 1

2026-08-21. Suite de `travaux/lot-11-tache1-cloture.md`. Quatre points,
traités dans l'ordre demandé, avant ouverture de la tâche 2.

## 1. Page d'audit des erreurs SMW — écrite

Wikitexte proposé puis écrit sur `Erreurs de traitement SMW`
(`Category:Documentation SGDT`), `createonly=1` :

```
Détecteur permanent des échecs silencieux d'annotation SMW : une valeur qui
dépasse une contrainte de type (par exemple le plafond de 85 caractères
d'une propriété <code>Keyword</code>) est rejetée sans faire échouer
l'écriture de la page — <code>action=edit</code> répond <code>Success</code>,
seule l'annotation est perdue. Cette page liste, tous espaces de noms
confondus, tout sujet portant un fait <code>_ERRC</code> : l'indicateur SMW
d'une erreur de traitement sur au moins une annotation.

'''Nombre de pages en erreur''' : {{#ask:
[[_ERRC::+]]
|format=count
|limit=500
}}

{{#ask:
[[_ERRC::+]]
|format=table
|headers=show
|mainlabel=Page
|limit=500
}}

Le message d'erreur lisible (par exemple « Le mot-clé dépasse la valeur
maximale de 85 caractères. ») n'est pas exposé par un printout
<code>?_ERRC</code> sur cette installation — testé, la colonne reste vide
même demandée. Pour le lire, ouvrir la page listée : il s'affiche en tête
de son rendu.

[[Category:Documentation SGDT]]
```

**Colonne message d'erreur — testée, abandonnée.** `?_ERRC` et
`?_ERRC#-long` en printout `#ask` reviennent tous deux vides sur cette
installation (`"ERRC": []`) : SMW ne l'expose pas par ce canal. Noté sur
la page elle-même plutôt que passé sous silence.

Écrit — résumé `[Lot 11][Tâche 1] Création — détecteur permanent des
échecs silencieux d'annotation SMW` (pageid 430, revid 844). Vérifié
après coup, trois contrôles :
- relecture du wikitexte : identique à ce qui a été envoyé ;
- `browsebysubject` sans filtre sur la page elle-même : seuls `_ASK` (les
  deux `#ask` intégrés), `_INST` (catégorie), `_MDAT`, `_SKEY` — aucune
  pollution du modèle de données ;
- rendu (`action=parse&prop=text`) : compteur à **9**, table de 9 lignes,
  les six pages `Attribut:` et les trois autres relevées en clôture de
  tâche 1 toutes présentes.

## 2. Trois entrées pour « Limites connues du SGDT » — diff proposé, rien écrit

Page existante : `Limites connues du Système de Gestion de Données
Techniques` (le titre complet — pas de redirection courte constatée).
Relue avant de proposer le diff. Insertion en fin de la liste numérotée,
juste avant le séparateur `----` et la note de création de page.

```diff
 # '''Conséquence acceptée sur [[Avancement du jardin-forêt]] :''' faute de négation, le bloc replié « Autres photos » de chaque lieu contient '''aussi la photo principale''' du lieu. Trois contournements ont été testés le 16 août 2026 et écartés : <code>limit</code>/<code>offset</code> entre les deux requêtes (ensembles de résultats différents, et tri à égalité — 38 des 45 photos du Buisson portent la même <code>Image_date</code>) ; <code><nowiki>[[Main_image::!+]]</nowiki></code> (voir ci-dessus) ; et <code>format=template</code> comparant le nom du fichier à la <code>Main_image</code> de sa plantation (le primitif fonctionne, mais 20 photos sur 65 ont un <code>Depicts_specimen</code> multivalué, sans terme unique à comparer). '''Défaut assumé et expliqué sur la page elle-même''', plutôt qu'une mécanique fragile.
+# '''`Property_range` est typé `Keyword` sur ce wiki, plafonné à 85 caractères.''' Une valeur qui dépasse ce plafond est rejetée par SMW sans faire échouer l'écriture de la page — <code>action=edit</code> répond <code>Success</code> tout de même, seule l'annotation `Property_range` est perdue, remplacée par un fait `_ERRC`. Cinq propriétés du lot 7 (`Edible_parts`, `Plant_habit`, `Propagation_method`, `Root_system`, `Seed_treatment`) en souffrent depuis leur création sans que rien ne l'ait signalé — découvert le 21 août 2026, en marge du lot 11 tâche 1, sur `INSEE_code` (même défaut, propriété créée ce jour-là). Liste à jour, tous espaces de noms confondus : [[Erreurs de traitement SMW]]. Non corrigé à cette date : les six pages restent sous `smw-change-propagation-protection` (voir `demandes-adminsys.md`).
+# '''Une redirection est porteuse de données SMW — la supprimer ou la vider repointe silencieusement les annotations de type `Page` qui la traversaient.''' Test dédié le 20-21 août 2026 (lot 11, tâche 0, `Utilisateur:Cywil/Bac à sable/Lot11 item`, propriété `Located_at`) : après renommage d'une page cible et purge, le littéral stocké bascule sur le '''nouveau''' nom bien que le wikitexte annotant n'ait jamais été réédité — c'est la résolution de la redirection laissée en place qui réécrit l'annotation au reparse. Retirer ensuite cette redirection (page vidée, remplacée par un contenu sans `#REDIRECTION`) fait retomber le littéral stocké sur l'''ancien''' nom, celui réellement écrit dans le `#set`, sans qu'aucune page annotante n'ait été touchée. '''Conséquence pratique : un renommage ou une suppression de page cible est une opération SMW, pas seulement éditoriale''' — vérifier `list=backlinks` et les annotations de type `Page` qui pointent vers la cible avant de vider ou supprimer une redirection.
+# '''Le compteur `jobs` de `action=query&meta=siteinfo` est une estimation globale, pas un état par page.''' Il peut rester figé sur plusieurs lectures consécutives puis retomber à `0` sans action identifiable entre les deux relevés, et la propagation d'une propriété individuelle (`_TYPE` promu en fait direct sur une page `Attribut:`) peut être acquise pendant qu'il affiche encore une valeur non nulle. Constaté le 21 août 2026, lot 11 tâche 1 : file figée à `18` sur trois lectures consécutives, puis `0` sans geste intermédiaire, alors que les cinq `_TYPE` créés ce jour-là étaient déjà en fait direct pendant la période figée. '''Pour une page `Attribut:`, le signal qui fait foi est le refus ou l'acceptation de l'écriture elle-même''' — `smw-change-propagation-protection` côté verrou, présence ou absence de `_ERRC` côté traitement de l'annotation — jamais le compteur de la file.
 
 ----
 Page créée le 10 août 2026, à partir de l'audit consolidé dans le cadrage du lot 6.
```

Non écrit — en attente de validation.

## 3. `demandes-adminsys.md` — entrée reformulée

Édition faite (fichier du dépôt, pas le wiki — pas de validation
séparée requise pour ce type d'écriture). Ancienne formulation : verrou
« orphelin », propre aux 15 pages du 15 août, « la demande n'est plus
bloquante ». Remplacée pour dire ce que cette tâche a établi : le verrou
n'est pas un incident isolé mais un comportement systématique de
`smw-change-propagation-protection`, qui se redéclenche à **chaque**
création de propriété — observé de nouveau le jour même sur
`Attribut:INSEE code`, trois tentatives, trois refus identiques. La
demande à fuzzy reste la même (`$smwgChangePropagationProtection = false`
dans `LocalSettings_ecolibre.php`), reformulée pour ne plus donner
l'impression d'être en réserve : elle bloque aujourd'hui six corrections
concrètes (INSEE_code + les cinq propriétés du lot 7). Relu après
écriture : le texte en place correspond à l'édition envoyée.

## 4. ECL-0023 et ECL-0026 — noté, non traité

Deux des 40 plantations (`Menthe X — Le Buisson de Cerzat (ECL-0023)`,
`Menthe bergamote — Le Buisson de Cerzat (ECL-0026)`) portent une erreur
de traitement SMW au message « « A » ne peut pas être affecté à un type
de nombre déclaré avec la valeur -0. » / « -1. » — relevée en clôture de
tâche 1 (`_ERRC`, hors du lot des six pages `Property_range`). Signature
différente du piège décimal déjà consigné dans `Limites connues du SGDT`
(virgule vs point sur `Number` en locale FR) : ici la valeur en cause est
`-0` ou `-1`, pas une valeur décimale mal lue, et la propriété fautive
(désignée `A` dans le message, donc non identifiée nommément par ce
canal) reste à déterminer. Une valeur numérique n'est donc pas stockée
sur ces deux plantations. Non élucidé, non corrigé — hors périmètre de ce
lot, à reprendre séparément.

## Ce qui n'a pas été touché, comme demandé

Aucune des cinq propriétés du lot 7 (`Edible_parts`, `Plant_habit`,
`Propagation_method`, `Root_system`, `Seed_treatment`) n'a été modifiée :
même verrou qu'`INSEE_code`, pas le moment.
