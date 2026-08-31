# Trois leçons de la conversation d'architecture (29-31 août 2026)

Session du 29 au 31 août 2026 : clôture du lot 10, cadrage du lot 12,
création de neuf pages de lot. Trois enseignements ne vivaient que dans la
conversation, archivée après cette consignation.

## 2a — Leçon nowiki mise à jour (CLAUDE.md)

**Où :** section « Leçons de méthode (wiki et outillage) », entrée
« Les backticks ne protègent rien en wikitexte » (elle devient « … — ni
`<code>` »).

**Ce qui change :**
- Le compte passe de deux à **trois** occurrences. Troisième cas : le
  31 août 2026 sur *Récapitulatif technique du SGDT*, deux exemples entourés
  de `<code>` mais non échappés produisaient un vrai lien de fichier brisé
  et un vrai lien de page. La page portait de ce fait la catégorie de suivi
  des liens de fichiers brisés **depuis la révision 1088**, des semaines
  avant qu'on le voie.
- Ajout du contrôle qui a permis de le trouver : **l'examen des _catégories_
  de la page après écriture** (`prop=categories`), pas la relecture du
  texte. Une catégorie de suivi apparue sans qu'on l'ait posée signale une
  syntaxe non échappée, invisible au wikitexte.
- Une phrase relie ce contrôle à celui de la leçon précédente
  (`browsebysubject`) : l'un voit les annotations parasites, l'autre les
  liens parasites.

## 2b — Nouvelle entrée outillage (CLAUDE.md)

**Où :** même section, à la fin, avant « Garde-fous d'exécution (dépôt
git) ».

**Contenu :** `bin/wiki-wait-jobs.sh` annonce une panne qui n'existe pas. Il
a signalé « FILE FIGEE » quatre fois pendant la session (4, 9, 11 puis
13 travaux) alors que `runJobs.php` répondait « Job queue is empty » et que
l'API annonçait zéro. Le nombre qu'il lit vient de `siteinfo`
(`siprop=statistics`, clé `jobs`), une **estimation plafonnée, pas un
décompte** — déjà noté dans *Limites connues* et constaté à 100 travaux dans
`travaux/owned-by-execution.md` sans que le script change.

Conséquence écrite : une file annoncée non vide **n'est pas un diagnostic de
panne** et ne justifie ni de réécrire, ni d'attendre. Le seul contrôle qui
tranche est `runJobs.php` côté serveur. Le libellé du script est à
reprendre — dette d'outillage ouverte.

## 2c — Nouvelle entrée méthode (CLAUDE.md)

**Où :** même section, juste après 2b.

**Contenu :** « Une mesure ne vaut que si elle mesure ce qu'on croit. »
Quatre affirmations fausses écrites dans des consignes *validées* pendant la
session, toutes de la même cause :
- deux formats de requête (`format=tree`, `format=outline`) déclarés
  inopérants parce qu'on avait cherché leur nom dans le HTML produit — un
  format ne signe pas sa sortie ; ils rendaient un arbre complet ;
- une propriété (`Main_image`) déclarée câblée nulle part après examen de
  deux modèles sur les vingt-sept de l'espace `Modèle` — câblée dans un
  troisième ;
- une numérotation de correction citée de mémoire alors que le fichier était
  ouvrable ;
- une traçabilité de rapports déclarée commencer six lots trop tard, parce
  qu'un `ls` ne montrait que les fichiers nommés par lot, sans ouvrir les
  rapports datés qui portent leur numéro en titre interne.

Règle : **avant d'écrire une absence, dire par quelle mesure on l'a établie,
et vérifier que cette mesure pouvait la détecter.** Une absence se prouve
plus difficilement qu'une présence ; un contrôle par mot-clé dans une sortie
ne prouve rien.

Contrepartie, et c'est elle qui a fonctionné : ces quatre erreurs ont toutes
été rattrapées par la vérification **exigée dans la consigne elle-même**,
jamais par son auteur. Une consigne doit demander de vérifier ce qu'elle
affirme, y compris contre celui qui l'écrit.

## 2d — Nouvelle entrée sur le wiki

**Où :** « Limites connues du Système de Gestion de Données Techniques »,
section « Limites, dettes et faits à retenir », entrée **n° 42** (dernière
de la liste). Motif de la porter aussi sur le wiki : elle concerne toute
personne qui édite ce wiki, pas seulement les sessions outillées. Vérifié le
31 août : aucune entrée n'existait sur ce sujet.

**Contenu :** une balise `<code>` n'échappe rien — elle met en forme, elle
n'empêche pas l'interprétation. Une syntaxe de lien ou d'annotation placée à
l'intérieur est exécutée. Seule la balise `<nowiki>` protège, y compris
imbriquée dans `<code>`. Le contrôle est l'examen des catégories de la page
après enregistrement. Cas du 31 août sur *Récapitulatif technique*,
catégorie de suivi des liens de fichiers brisés portée depuis la
révision 1088.

L'entrée cite de la syntaxe : elle est elle-même échappée par
`<code><nowiki>…</nowiki></code>` (motif déjà en usage sur la page), et la
vérification après écriture porte sur ses catégories.

Édition : revid 1150, résumé
`[Lot 10][Leçon] Entrée n° 42 — une balise <code> n'échappe rien…`.

## Vérifications

### Wiki — « Limites connues »

| Contrôle | Résultat |
|---|---|
| `browsebysubject` (faits SMW portés) | `['_MDAT', '_SKEY']` — aucune propriété du modèle de données |
| `prop=categories` | `[]` — aucune catégorie, donc aucune catégorie de suivi |
| liens rouges au rendu | aucun (`redlink=1` absent) |
| taille wikitexte (octets) | 34 895 avant (rev 1138) → 36 218 après (rev 1150) : grossit, une seule entrée ajoutée |
| `diff` remote / local-moins-entrée | identique — rien d'autre n'a bougé |
| rendu de l'entrée n° 42 | `[[Fichier:exemple.png]]` et `[[Propriété::valeur]]` s'affichent en texte littéral (nowiki actif), ne créent ni lien ni annotation — confirmé par les deux lignes ci-dessus |

La page a été purgée (`forcelinkupdate`) avant ces relevés. La file de
travaux SMW était bloquée à 13 (situation préexistante, cf. 2b) — sans
effet : les contrôles portent sur `browsebysubject` et le rendu, tous deux
concluants.

### CLAUDE.md — cohérence des trois entrées

- **2a** cohabite avec la leçon précédente (« `<code>` ne protège pas »,
  16 août) : même constat, contrôles complémentaires (annotations vs liens),
  lien explicite entre les deux. Aucune contradiction.
- **2b** est cohérente avec *Limites connues* n° 27 (« le compteur `jobs`
  est une estimation globale … jamais le compteur de la file ») et ne
  contredit pas la leçon « Après création ou modification d'une page de
  propriété, les faits ne sont pas lisibles immédiatement » (19 août) :
  celle-ci porte sur la réalité de la propagation asynchrone, celle-ci sur
  la fiabilité de l'alarme du script.
- **2c** renforce « Une convention rédigée de mémoire ne fait pas foi »
  (lot 9) et « Lire l'état du wiki avant de raisonner » : même famille,
  aucune contradiction.
- Aucune revendication périmée sur `format=tree` / `Main_image` ne subsiste
  ailleurs dans CLAUDE.md (`grep` fait). L'entrée existante sur
  `Main_image -> !+` (16 août) concerne une annotation parasite, sujet
  distinct.

## Écarts

Aucun. Les trois entrées CLAUDE.md et l'entrée wiki sont posées conformément
à la consigne. Seule adaptation de forme : dans 2c, la liste des quatre
erreurs est rendue en sous-puces markdown plutôt qu'en prose, pour la
lisibilité.
