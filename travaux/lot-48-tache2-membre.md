# Lot 48 — tâche 2 : pages d'essai et mesures en tant que membre

Session locale sur le Framework, 19 novembre 2026, branche `main`, après le
commit `e702e65`. Toutes les mesures attendues sont conformes. Aucune
correction ni retour en arrière.

## Étape 1 — État du dépôt

- `git fetch origin` : `main` alignée sur `origin/main`, 0 commit de retard.
- `git status --porcelain` : sortie vide.
- `.claude/settings.local.json` au début : fichier absent, donc aucune règle.

## Étape 2 — Nettoyage du serveur

Les deux fichiers de travail (`bloc-lot48.php`,
`LocalSettings_ecolibre.php.nouveau-lot48`) ont été supprimés (`rm` sans
erreur). Listage du dossier de sauvegarde :

| Nom | Droits | Taille |
|---|---|---|
| (dossier de sauvegarde) | 700 | 4 096 |
| `LocalSettings_ecolibre.php.avant-lot48-20261119` | 600 | 11 614 |

Un seul fichier en tout (`ls -A | wc -l` : 1).

## Étape 3 — Le robot est membre

- `bin/wiki-login.sh` : `Success Cywil`.
- `userinfo` : `bureaucrat`, **`formation`**, `interface-admin`,
  `smwadministrator`, `sysop`, `*`, `user`, `autoconfirmed`.
- `intestactions` sur `CAO:Essai lot 48` (ns 502, encore `missing`) :
  `read: []`, `edit: []`, `create: []`, donc les trois actions sont permises.

## Étape 4 — Pages d'essai

| Page | Espace | pageid | revid | Horodatage (UTC) | Moyen | `wiki-verify.sh` |
|---|---|---|---|---|---|---|
| P1 `CAO:Essai lot 48` | 502 | 725 | 1809 | 2026-11-19T19:07:17Z | script Python de session, résumé vide | IDENTIQUE |
| P2 `Discussion CAO:Essai lot 48` | 503 | 726 | 1810 | 2026-11-19T19:07:24Z | `bin/wiki-put.sh --createonly` | IDENTIQUE |
| P3 `Essai inclusion lot 48` | 0 | 727 | 1811 | 2026-11-19T19:07:26Z | `bin/wiki-put.sh --createonly` | IDENTIQUE |

Le script de session était nécessaire pour P1 : `bin/wiki-put.sh` remplace un
résumé vide par un résumé par défaut (`SUMMARY="${3:-Modification via Claude
Code}"`), sans refuser l'appel. Le script a été affiché et lancé dans la même
commande. Il lit le jeton CSRF avec le fichier de session de `wiki-login.sh`,
comme `_wiki-csrf.sh`, puis fait un `action=edit` avec `summary=` vide,
`createonly=1` et `assert=user`, sans `bot`. Son résultat : `Success`,
`new: true`.

## Étape 5 — Mesures, connecté comme membre

- **M1** : `bin/wiki-get.sh "CAO:Essai lot 48"` donne le marqueur `MARQUEUR-LOT48`
  **présent** (1 ligne).
- **M2** : `prop=revisions&rvprop=comment` sur la révision 1809 rend un
  `comment` **vide (`""`)**. La coupure des résumés automatiques est donc
  effective. Pour contrôle, les résumés de P2 et P3 sont ceux fournis, mot pour mot.
- **M3** : `list=search&srwhat=title&srsearch=Essai lot 48&srnamespace=*` donne
  `totalhits: 3`, soit `CAO:Essai lot 48` (ns 502), `Discussion CAO:Essai lot
  48` (ns 503) et `Essai inclusion lot 48` (ns 0). La page `CAO:Essai lot 48` est bien
  trouvée. Voir l'écart 1 sur les extraits.
- **M4** : `action=parse&page=Essai inclusion lot 48&prop=text` donne le marqueur
  **absent**. À sa place, le rendu affiche un simple lien vers la page incluse :
  un paragraphe contenant `<a href="/wiki/CAO:Essai_lot_48" title="CAO:Essai
  lot 48">CAO:Essai lot 48</a>`. C'est le comportement de
  `$wgNonincludableNamespaces`. `prop=templates` et `prop=categories` sont vides.
- **M5** : `--facts` sur `subject=CAO:Essai lot 48&ns=502` donne deux clés seulement,
  `_MDAT` (`1/2026/11/19/19/7/17/0`) et `_SKEY` (`Essai lot 48`). Le magasin
  SMW a bien enregistré la page de l'espace 502.

## Étape 6 — Ce que je n'ai pas corrigé

Aucune mesure n'a contredit l'attendu. Je n'ai touché ni à la configuration ni aux
pages après leur création.

## Relevé de `.claude/settings.local.json`

- Début de tâche : fichier absent.
- Fin de tâche : fichier absent.

## Questions posées et réponses rendues hors consigne

Aucune.

## Écarts et surprises

1. **La recherche rend des extraits du contenu.** Pour le membre, les extraits de
   P1 et P2 dans `list=search` contiennent le texte de la page, marqueur
   compris. C'est normal pour un membre, mais c'est le point à regarder dans
   les relevés sans connexion de l'architecte : il faut vérifier si un anonyme
   voit ces titres, et surtout ces extraits.
2. Le rapport de transclusion, en commentaire HTML dans le rendu de P3, cite
   `CAO:Essai_lot_48` (1 appel, 0,052 ms), alors que `prop=templates` est vide
   et que le contenu n'est pas inclus. MediaWiki tente donc l'expansion, puis
   la remplace par un lien. Ce commentaire est visible dans le source HTML de
   la page, mais il ne donne que le titre.
3. Le même commentaire de rendu de P3 porte la clé du cache d'analyse, qui
   nomme la base de données du wiki. Je ne la recopie pas ici. Cette clé
   s'affiche sur toutes les pages du wiki, pas seulement sur celles du lot.
4. `bin/wiki-put.sh` ne refuse pas un résumé vide, il le remplace en silence
   par « Modification via Claude Code ». Une écriture qui omettrait son résumé
   porterait donc ce libellé, et non un résumé vide.
5. Les trois créations ont ajouté les pages à la liste de suivi du compte
   (`watched: true`). Je n'ai pas vérifié si ce suivi disparaît quand les pages
   sont supprimées en fin de lot.
