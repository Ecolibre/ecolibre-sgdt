# Correctif du 10 octobre 2026 — création de la page du lot 41, règle sur les modifications en attente

Tâche hors lot. Une page créée sur le wiki au statut identifié, un paragraphe ajouté à `methode-de-travail.md`. Aucune autre page ni aucun autre fichier modifié, rien ajouté à « Gestion des lots ».

## Étape 1 — état du dépôt

```
?? travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md
```

Le seul fichier non suivi attendu, aucun fichier suivi modifié : pas d'arrêt.

`.claude/settings.local.json`, identique au début et à la fin de la tâche, sans aucune règle :

```
{
  "permissions": {
    "allow": [],
    "deny": []
  }
}
```

## Étape 2 — contrôles avant écriture

- `bin/wiki-login.sh` : `Success`.
- `allpages` préfixe « Lot 4 » : « Lot 40 — Wiki privé CWL » et « Lot 4 — Numérotation des items physiques ». Aucun lot 41.
- `action=ask` sur `Catégorie:Lot`, numéros portés : 1 à 40, sans trou ni doublon. 41 libre.
- Contrôle ajouté, en lecture seule : les deux pages liées par le texte existent, et aucune n'est une redirection : « Lot 26 — Renommage des propriétés par domaine », « Gestion des lots ».

## Étape 3 — création

| Page | Révision | Page id |
|---|---|---|
| Lot 41 — Convention de titre des pages | 1497 | 610 |

Créée avec `--createonly`, résumé tel que fourni. Fichier `/tmp/lot-41.txt` écrit par l'outil d'écriture de fichier. Contrôle supplémentaire : le wikitexte relu par `bin/wiki-get.sh` est identique au fichier, au saut de ligne final près, que MediaWiki retire à l'enregistrement.

## Étape 4 — vérifications

Faits stockés, lus dès la première lecture sans attente de la file :

```
Work_package_number -> ['41']
Work_package_status -> ['identifié']
Work_package_summary -> ["Décider par quoi se remplacent les caractères de titre qui ne se tapent pas au clavier, et appliquer la décision à l'existant sans casser les relations qui citent ces titres."]
_ASK -> ['Lot_41_—_Convention_de_titre_des_pages#0##_QUERYdf68cec7c6fdb6b672e22466c53591f8', 'Lot_41_—_Convention_de_titre_des_pages#0##_QUERY30b0bef29113e54696d01561487d2a48', 'Lot_41_—_Convention_de_titre_des_pages#0##_QUERY531e0b1668c405252e60b8cd929b5269']
_INST -> ['Lot#14##']
_MDAT -> ['1/2026/10/10/21/10/52/0']
_SKEY -> ['Lot 41 — Convention de titre des pages']
```

Catégories et liens :

```
{
    "batchcomplete": true,
    "query": {
        "pages": [
            {
                "pageid": 610,
                "ns": 0,
                "title": "Lot 41 — Convention de titre des pages",
                "categories": [
                    {
                        "ns": 14,
                        "title": "Catégorie:Lot"
                    }
                ],
                "links": [
                    {
                        "ns": 0,
                        "title": "Gestion des lots"
                    },
                    {
                        "ns": 0,
                        "title": "Lot 26 — Renommage des propriétés par domaine"
                    }
                ]
            }
        ]
    }
}
```

Seule `Catégorie:Lot`, aucune catégorie de suivi. Les deux cibles de lien existent (contrôle de l'étape 2).

## Étape 5 — diff de methode-de-travail.md

```diff
diff --git a/methode-de-travail.md b/methode-de-travail.md
index d353709..e889705 100644
--- a/methode-de-travail.md
+++ b/methode-de-travail.md
@@ -44,6 +44,8 @@ Les règles impératives propres à la tâche, y compris ce qu'il ne faut pas fa
 
 L'étape d'état du dépôt distingue deux cas que `git status` affiche côte à côte. La sortie `--porcelain` porte deux colonnes, l'index puis l'arbre de travail : un fichier modifié mais non indexé sort avec une espace en premier caractère. Une ligne dont l'un des deux premiers caractères est `M`, `A`, `D` ou `R` signale donc un fichier suivi et modifié, qu'un commit peut emporter ou qu'une opération peut écraser : elle justifie un arrêt. Une ligne commençant par `??` signale un fichier non suivi, qu'aucun `git add` nommant des chemins explicites ne peut atteindre : elle ne justifie rien. Confondre les deux fait arrêter une tâche que rien ne menaçait. Une consigne qui écrit « une ligne commençant par `M` » fait manquer exactement le cas qu'elle veut attraper : constaté le 5 octobre 2026.
 
+Une tâche ne se termine jamais sur une modification non commitée d'un fichier suivi. Elle commite, elle annule, ou elle le signale à Cyril comme un blocage, en nommant le fichier. Motif : `CLAUDE.md` exige un état propre avant toute opération dans le dépôt, donc une modification laissée en attente arrête la première tâche suivante, quelle qu'elle soit, et celle-ci n'a aucun moyen de savoir quelle conversation en est propriétaire. Constaté le 10 octobre 2026 : la révision des garde-fous du dépôt git, écrite puis laissée en attente d'accord, a arrêté une tâche sans rapport et coûté un aller-retour complet pour retrouver la conversation à qui la soumettre.
+
 Les étapes. Deux modes, et il faut savoir lequel on emploie.
 
 Le **texte fourni** : le contenu exact à écrire, mot pour mot. C'est le cas majoritaire, et le seul acceptable dès qu'on sait d'avance ce qu'il faut écrire. « Rédige un texte qui dit que » produit un texte inventé.
 methode-de-travail.md | 2 ++
 1 file changed, 2 insertions(+)
```

Deux insertions : le paragraphe, sur une seule ligne, et la ligne vide qui le sépare de la suite. La ligne vide qui suivait déjà la phrase repère sert de séparation avant lui. Aucune suppression.

## Questions posées et réponses données hors de cette consigne

Aucune.

## Écarts et surprises

- **Contrôle ajouté à l'étape 2** : l'existence des pages liées par le texte, non demandée, faite en lecture seule avant l'écriture.
- **Concordance avec le texte de la page** : la redirection au titre à virgules que la section « Risques connus » mentionne est sans doute « Lot 30 — Accès, prêt, compétences et stock », relevée comme redirection à la création des lots 39 et 40. Non revérifié ici : la page affirme un compte du 10 octobre, la consigne ne demandait pas de le remesurer.
- **Trois `_ASK`** sur la page, comme sur les lots 35 à 40 : ce sont les requêtes du modèle Lot.
