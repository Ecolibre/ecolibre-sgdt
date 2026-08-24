# Lot 11 — audit v3 : horodatage corrigé, `?_ERRT` retesté en wikitexte, entrée `format=count` écrite

2026-08-21. Suite de `travaux/lot-11-audit-v2.md`.

## 1. Horodatage — corrigé selon la remarque

`{{CURRENTDAY2}}`/`{{CURRENTTIME}}` écartés : rendus au parse, mis en
cache, afficheraient l'heure du dernier reparse en se faisant passer pour
l'heure courante — une fausse date est pire qu'aucune date sur une page
d'audit. Remplacé par la phrase fournie, reprise telle quelle :

```
(recalculé à chaque reparse de la page ; SMW l'invalide quand une des
pages listées change)
```

## 2. `?_ERRT` retesté en wikitexte — la colonne reste vide

Le test précédent passait par `action=ask`, canal dont l'entrée 3
ci-dessous établit qu'il ment sur `format=count` — pas probant à lui
seul. Refait en wikitexte : `|?_ERRT` ajouté à la requête `format=table`
de la page d'audit, testée par `action=parse&text=...` (contenu court,
GET, sans le piège des gros templates) plutôt qu'en écrivant d'abord sur
la page en place.

Rendu obtenu (extrait, une ligne représentative sur les neuf) :
```html
<tr data-row-number="1" class="row-odd">
  <td class="Page smwtype_wpg"><a href="/wiki/Attribut:Edible_parts" ...>Edible parts</a></td>
  <td class="ERRT smwtype_wpg"></td>
</tr>
```

Colonne « ERRT » présente dans l'en-tête, **chaque cellule vide** sur les
neuf lignes — même verdict que via l'API. Signe supplémentaire :
`Attribut:ERRT` est un lien rouge (« page inexistante ») dans l'en-tête
rendu — cette propriété n'est même pas déclarée sur ce wiki, elle
retombe sur le type `Page` par défaut plutôt que sur un type dédié au
texte d'erreur.

**Verdict retenu, comme prévu par la consigne si le résultat restait
vide : la phrase déjà rédigée est bonne.** Précisée pour dire quel canal
a été testé où : `?_ERRC` vide via l'API seulement ; `?_ERRT` vide sur
les deux canaux testés séparément, API et wikitexte.

## 3. Entrée `format=count` — écrite dans Limites connues

Page relue avant écriture (identique à la version de l'entrée
précédente). Entrée ajoutée telle que rédigée et validée, en quatrième
position après les trois déjà en place, avant le séparateur `----`.

Écrit — résumé `[Lot 11][Tâche 1] Entrée — format=count via action=ask
renvoie 0, défaut propre au chemin API` (pageid 144, revid 846). **Relu
après écriture** : `diff` entre le fichier envoyé et la page relue —
aucune différence, y compris sur la fin de fichier cette fois.

## 4. Wikitexte final de la page d'audit — proposé, rien écrit

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
(recalculé à chaque reparse de la page ; SMW l'invalide quand une des
pages listées change)

{{#ask:
[[_ERRC::+]]
|format=table
|headers=show
|mainlabel=Page
|limit=500
}}

Le message d'erreur lisible (par exemple « Le mot-clé dépasse la valeur
maximale de 85 caractères. ») n'est exposé par aucun printout testé sur
cette installation. <code>?_ERRC</code> revient vide via l'API
(<code>action=ask</code>, avec et sans <code>#-long</code>).
<code>?_ERRT</code> — la propriété que SMW réserve au texte d'erreur — a
été testée séparément sur les deux canaux, API et wikitexte
(<code>|?_ERRT</code> ajouté directement à la requête <code>#ask</code>
de cette page, rendu vérifié) : vide dans les deux cas, colonne affichée
mais chaque cellule reste blanche. Pour lire le message, ouvrir la page
listée : il s'affiche en tête de son rendu.

[[Category:Documentation SGDT]]
```

Diff par rapport à la version en place (revid 844) : ajout de la ligne
d'horodatage après le compteur ; paragraphe final réécrit pour couvrir
`?_ERRC` et `?_ERRT` sur leurs canaux testés respectifs, au lieu de ne
mentionner que `?_ERRC` sur un seul canal.

Non écrit — en attente de validation, comme demandé.
