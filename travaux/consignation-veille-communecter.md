# Consignation de la veille Communecter — rapport d'exécution

Date : 6 octobre 2026. Exécuteur : Claude Code.

Deux travaux indépendants : une note ajoutée à *Notes en attente de rangement* (seule écriture sur le wiki), et deux remplacements dans `methode-de-travail.md`.

## 1. État de départ

- `git status --porcelain` : sortie vide, aucun fichier suivi modifié, aucun fichier non suivi.
- `travaux/consignation-veille-communecter.md` n'existait pas.
- `.claude/settings.local.json` : `allow: []`, `deny: []`, aucune règle.

## 2. Lecture avant écriture

`bin/wiki-get.sh "Notes en attente de rangement" > /tmp/notes-avant.txt`

- Taille : **4 646 octets** (concorde avec `length: 4646` de `prop=info`, révision 1302).
- Titres de section de niveau 2 : **5**.
- Ligne d'ancrage `Les notes les plus récentes sont en haut.` : présente une seule fois (ligne 10, correspondance exacte par `grep -cx` → 1).
- Protection native : `protection: []`.

## 3. Diff avant écriture (étape 6)

`diff /tmp/notes-avant.txt /tmp/notes-apres.txt` — ajout seul, aucune ligne retirée ou modifiée :

```
11a12,22
> == Couche sociale au-dessus du wiki : piste Communecter ==
> ''Cyril, le 05/10/26''
> 
> Piste signalée par Simon Sarazin : poser une couche réseau social au-dessus du wiki au moyen d'une instance Communecter (association Open Atlas). Exploration du code menée le 5 octobre 2026 ; rapports détaillés dans le dépôt, <nowiki>travaux/exploration-site-json.md</nowiki> et <nowiki>travaux/exploration-cocolight-serveur.md</nowiki>.
> 
> '''Ce qui est établi.''' La façade <nowiki>site-json</nowiki> ne lit qu'une source, l'API Communecter ; elle ne sait pas interroger un wiki. En revanche le module PHP <nowiki>pixelhumain/interop</nowiki> porte un client Semantic MediaWiki générique : il découvre les propriétés d'une page par <nowiki>action=browsebysubject</nowiki>, écarte celles dont le nom commence par un souligné, puis lit leurs valeurs par <nowiki>action=ask</nowiki> avec les <nowiki>|?Propriété</nowiki> correspondants. Il sait aussi écrire, pour marquer dans la page du wiki un lien vers la fiche Communecter correspondante.
> 
> '''Ce qui bloque.''' Ce client sémantique n'est pas déployé. Le serveur en production est une réécriture en Node qui n'a repris que trois routes sur douze et se limite au profil, c'est-à-dire au compte wiki lié et aux dernières contributions. Son portage n'est financé par personne et le seul bailleur du connecteur se contente du profil à ce stade. L'écriture, elle, passe aujourd'hui par un compte de service unique, ce qui effacerait la provenance des contributions dans l'historique du wiki. Simon indique qu'un SSO permettrait d'écrire au nom de l'utilisateur connecté, ce qui suppose d'installer OpenID Connect sur le cœur MediaWiki partagé, donc après la migration de serveur.
> 
> '''État.''' Piste conservée, en lecture seule à ce stade, sans engagement. Le motif <nowiki>browsebysubject</nowiki> puis <nowiki>ask</nowiki> reste réutilisable indépendamment de Communecter : il permet de bâtir une façade sur un wiki sémantique sans coder son modèle de données à l'avance.
> 
```

La dernière ligne ajoutée est vide : elle sépare le bloc inséré de la ligne vide d'origine, qui précède la section « Sens de la relation… ». Résultat : une ligne vide entre l'ancrage et la nouvelle section, et entre la nouvelle section et la suivante, comme demandé.

## 4. Écriture (étape 7)

`bin/wiki-put.sh "Notes en attente de rangement" /tmp/notes-apres.txt "[Veille] Note sur la piste Communecter ajoutée en tête des notes"`

`result: Success`, révision 1302 → **1457**, horodatage `2026-10-06T11:57:30Z`.

## 5. Vérification qui tranche (étape 8)

`diff /tmp/notes-apres.txt /tmp/notes-relu.txt` : **vide** (code de sortie 0). La page relue fait 6 694 octets et porte 6 titres de niveau 2 (5 + 1).

## 6. Faits sémantiques (étape 9)

Sortie telle quelle de `bin/wiki-api.sh --facts "subject=Notes%20en%20attente%20de%20rangement&ns=0"` :

```
_INST -> ['Page_de_suivi#14##']
_MDAT -> ['1/2026/10/6/11/57/30/0']
_SKEY -> ['Notes en attente de rangement']
```

Uniquement des propriétés internes. `_INST` est l'appartenance à `Catégorie:Page de suivi`, déjà présente avant l'écriture. Aucun fait parasite.

Contrôle complémentaire, non demandé, recommandé par `CLAUDE.md` après écriture d'un texte citant de la syntaxe : `prop=links|categories`. Liens : les quatre pages déjà liées avant l'écriture (Ail éléphant Armand 2026, Gestion des lots, Limites connues…, Mèche de tarière pour perceuse), aucun lien nouveau. Catégories : `Catégorie:Page de suivi` seule, aucune catégorie de suivi. Les `<nowiki>` ont bien neutralisé `|?Propriété` et les noms d'action.

## 7. methode-de-travail.md (étapes 10 et 11)

Les deux textes d'origine ont été trouvés à l'identique et remplacés par l'outil d'édition :

1. Paragraphe sur l'étape d'état du dépôt (section « Ce qu'une consigne doit contenir ») : remplacé par la version qui décrit les deux colonnes de `--porcelain` et le cas vécu du 5 octobre 2026.
2. Règle « Un relevé vide se vérifie sur la source » : la phrase « Avant de conclure qu'une chose n'est pas là, la chercher autrement, ou lire la source. » est complétée par l'exemple PHP du module `interop`.

Confirmation : `git diff --stat methode-de-travail.md` → `2 insertions(+), 2 deletions(-)`, soit exactement deux lignes remplacées ; chaque phrase nouvelle se retrouve une fois par `grep -c` (« constaté le 5 octobre 2026 » → 1, « Constaté le 5 octobre 2026 sur le module » → 1).

## Écarts et surprises

- **Encodage du sujet à l'étape 9.** La consigne donnait `bin/wiki-api.sh --facts "subject=Notes en attente de rangement"`, avec des espaces et sans `ns`. `CLAUDE.md` établit que `wiki-api.sh` ne réencode pas sa chaîne et qu'un espace fait échouer `curl` en silence, sortie vide (un faux « aucun fait »). J'ai donc lancé `subject=Notes%20en%20attente%20de%20rangement&ns=0`, forme canonique de `CLAUDE.md`. Pour les consignes à venir : écrire les titres en `%20` dans tout appel `wiki-api.sh`.
- **Contrôle de protection** (`prop=info&inprop=protection`) fait avant l'écriture, comme l'exige `CLAUDE.md` (garde-fou 5) ; la consigne ne le demandait pas.
- **Fichiers dans `/tmp`.** La consigne nommait `/tmp/notes-*.txt` ; je les ai suivis tels quels plutôt que le scratchpad de session.
- Aucune question de Cyril hors consigne pendant cette session.
- Aucune demande de confirmation proposant une autorisation permanente n'est apparue de mon côté ; je ne vois pas les réponses données aux fenêtres.
- **`.claude/settings.local.json`** : au début, `{"permissions": {"allow": [], "deny": []}}` ; à la fin (relevé avant la rédaction de ce rapport), identique. Aucune règle.
