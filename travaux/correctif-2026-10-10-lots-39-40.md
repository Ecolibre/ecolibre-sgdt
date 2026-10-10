# Correctif du 10 octobre 2026 — création des pages des lots 39 et 40

Tâche hors lot. Deux pages créées au statut identifié, aucune autre page modifiée, rien ajouté à « Gestion des lots ».

## Étape 1 — état du dépôt

Premier passage, arrêté : `git status --porcelain` rendait ` M CLAUDE.md`, la révision des garde-fous du dépôt git étant écrite mais en attente d'accord. Arrêt signalé, voir `travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md`.

Second passage, après le commit de `CLAUDE.md` (`66512360453fd0ab34f22974210d5221b1c45f7f`, poussé) :

```
?? travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md
```

Un fichier non suivi, aucun fichier suivi modifié : pas d'arrêt.

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
- `allpages` préfixe « Lot 3 » : lots 30 à 38 et lot 3, aucun lot 39.
- `allpages` préfixe « Lot 4 » : seul « Lot 4 — Numérotation des items physiques », aucun lot 40.
- `action=ask` sur `Catégorie:Lot`, numéros portés : 1 à 38, sans trou ni doublon. 39 et 40 libres.
- Contrôle ajouté, en lecture seule : les pages citées par les deux textes existent, et aucune n'est une redirection : « Lot 12 — Contenants et étiquetage », « Lot 36 — Sauvegarde du wiki », « Registre des préfixes de site ».

## Étapes 3 et 4 — créations

| Page | Révision | Page id |
|---|---|---|
| Lot 39 — Format matériel des étiquettes | 1495 | 608 |
| Lot 40 — Wiki privé CWL | 1496 | 609 |

Les deux avec `--createonly`, résumés tels que fournis par la consigne. Fichiers `/tmp/lot-39.txt` et `/tmp/lot-40.txt` écrits par l'outil d'écriture de fichier, texte recopié sans modification.

Contrôle supplémentaire : le wikitexte relu par `bin/wiki-get.sh` est identique aux deux fichiers, à une seule différence près, le saut de ligne final, que MediaWiki retire à l'enregistrement.

## Étape 5 — vérifications

Faits du lot 39 :

```
Work_package_depends_on -> ['Lot_12_—_Contenants_et_étiquetage#0##']
Work_package_number -> ['39']
Work_package_status -> ['identifié']
Work_package_summary -> ["Décider ce qu'une étiquette porte, sous quelle forme matérielle, et vers quoi pointe le code qu'on y imprime."]
_ASK -> ['Lot_39_—_Format_matériel_des_étiquettes#0##_QUERYc1dc04387d6d950ceb92d542f24c3523', 'Lot_39_—_Format_matériel_des_étiquettes#0##_QUERY2825f12c4b275c3faff2a0a227f47826', 'Lot_39_—_Format_matériel_des_étiquettes#0##_QUERY558ea21e4f6f566059fb712b84a6fa55']
_INST -> ['Lot#14##']
_MDAT -> ['1/2026/10/10/21/3/11/0']
_SKEY -> ['Lot 39 — Format matériel des étiquettes']
```

Faits du lot 40 :

```
Work_package_depends_on -> ['Lot_12_—_Contenants_et_étiquetage#0##']
Work_package_number -> ['40']
Work_package_overlaps -> ['Lot_36_—_Sauvegarde_du_wiki#0##']
Work_package_status -> ['identifié']
Work_package_summary -> ["Monter le wiki privé CWL et y porter le modèle du SGDT, pour qu'un inventaire réel puisse y être saisi."]
_ASK -> ['Lot_40_—_Wiki_privé_CWL#0##_QUERYf275ce73611300544b7c6541f137f9a6', 'Lot_40_—_Wiki_privé_CWL#0##_QUERY773a138149fe0c9bce7e6bfe85a5bddf', 'Lot_40_—_Wiki_privé_CWL#0##_QUERY87fb919fbd3287feccb31790c4c00df0']
_INST -> ['Lot#14##']
_MDAT -> ['1/2026/10/10/21/3/14/0']
_SKEY -> ['Lot 40 — Wiki privé CWL']
```

Tous les faits attendus sont présents dès la première lecture : aucune attente de la file, rien réécrit.

Catégories et liens (sortie résumée, JSON complet relevé en séance) :

- Lot 39 : catégories `Catégorie:Lot` seule. Liens : « Gestion des lots », « Lot 12 — Contenants et étiquetage ».
- Lot 40 : catégories `Catégorie:Lot` seule. Liens : « Gestion des lots », « Lot 12 — Contenants et étiquetage », « Lot 36 — Sauvegarde du wiki », « Registre des préfixes de site ».

Aucune catégorie de suivi. Les quatre cibles de lien existent (contrôle de l'étape 2 pour trois d'entre elles ; « Gestion des lots » est la page d'index). Aucun lien vers une page inexistante.

## Questions posées et réponses données hors de cette consigne

- **A**, posée au premier passage : le dépôt n'était pas propre, `CLAUDE.md` attendait l'accord sur son diff. Réponse de Cyril : diff validé sur le fond, avec trois corrections, puis commit de `CLAUDE.md` seul et reprise de cette consigne à l'étape 1 sans la modifier.
- **B**, sur un script `bin/` pour `${PIPESTATUS[0]}` : réponse de Cyril, pas de script, motif consigné dans `CLAUDE.md`.
- **C**, sur le commit du rapport d'arrêt : Cyril a demandé de le laisser non suivi. Il l'est encore à la fin de cette tâche ; seul le présent rapport est commité.

## Écarts et surprises

- **Deux pages commencent par « Lot 30 — »** : « Accès, prêt, compétences et stock » et « Ce qu'une structure met à disposition ». La première est une redirection, mesurée par `prop=info` : un ancien titre renommé, sans incidence sur cette tâche.
- **Trois `_ASK` sur chaque page**, déjà relevés à la création des lots 35 à 38 : ce sont les requêtes du modèle Lot, pas une syntaxe du corps.
- **La tâche a été arrêtée une fois à l'étape 1**, par sa propre condition, puis reprise sans modification après le commit de `CLAUDE.md`.
