# Lot 21, tâche 9 — Troisième bac à sable, construit sous barrière

Exécutée le 5 octobre 2026 entre 12:03 et 12:08 UTC environ.

**La tâche s'est arrêtée à l'étape 3, sur P1.** `Attribut:Test lot21c
température`, créée seule, n'a pas franchi la barrière en trois tours. Au
bout du tour 2, elle était dans l'état exact des six propriétés Test lot21b :
le `_TYPE` porté est juste, le type résolu vaut `_wpg`, la page est verrouillée
par `smw-change-propagation-protection`, `_CHGPRO` est absent et la file de
travaux est à 0. Conformément à la consigne, je n'ai rien créé de plus. P2 à
P5, le modèle, la catégorie et les deux pages de bac à sable n'existent pas
sur le wiki.

**La prémisse de la consigne est contredite.** Une création seule, hors de
toute rafale, a produit le même verrou. La rafale n'est donc pas une
condition nécessaire. **Une faute de ma part entre peut-être en jeu** : j'ai
lancé une lecture `action=ask` sur la propriété 32 secondes après sa création,
avant la fin de la pause. Voir « Écarts et surprises », points 1 et 2.

## Étape 0 — État du dépôt

- `git status` : `nothing to commit, working tree clean`, aucune ligne M, A, D,
  R ni `??`.
- `travaux/lot-21-tache9-bac-a-sable-c.md` n'existait pas.
- `.claude/settings.local.json`, au début comme à la fin de la tâche :
  `"allow": []`, `"deny": []`. Aucune règle.

## Étape 1 — Diff de CLAUDE.md

```diff
@@ -275,6 +275,11 @@ Ce que Cyril peut lancer seul, et ce qui relève de fuzzy : voir
   badfilename de MediaWiki (espace parasite) — vérifier les noms avant de
   téléverser, pas après.
 - Page bac à sable pour les essais : `Utilisateur:Cywil/Bac à sable`.
+- **Barrière avant d'employer une propriété neuve.** Aucune page employant une propriété nouvellement créée ne se crée avant que cette propriété ait franchi deux volets, mesurés dans le même tour :
+  1. le type résolu à l'exécution est le bon. Le lire dans `query.printrequests[].typeid` d'un `action=ask` portant sur cette propriété, pour l'entrée dont le label n'est pas vide ; l'entrée au label vide est la colonne du sujet et vaut toujours `_wpg` ;
+  2. une écriture sur la page de propriété est acceptée, `nochange` compris.
+
+  Le fait `_TYPE` porté par la page de propriété ne vaut pas barrière. Mesuré le 4 octobre 2026, lots 21 tâches 6 à 8 : six propriétés portaient le bon `_TYPE` tout en étant résolues en `_wpg` et verrouillées par `smw-change-propagation-protection`, file de travaux à 0 et `_CHGPRO` absent. Les valeurs des pages qui les employaient sont tombées en type Page, et rien n'a pu les en sortir. Créer les propriétés une par une, jamais en rafale.
 
 ## Corrections sur les modèles — liste unique et numérotation de référence
 
@@ -573,6 +578,7 @@ sur la banque physique est notée ici. À traiter avec le lot de numérotation.
   venaient d'y inscrire, alors que `grep` et `python3` les voyaient. Avant de
   modifier un fichier que l'outillage a pu changer, le relire par une
   commande.
+- `sleep` au premier plan est bloqué par l'environnement Claude Code, avec le message « Blocked: sleep 60 followed by… ». Pour une pause fixe, lancer `sleep` en arrière-plan et attendre sa notification de fin. Pour attendre la file de travaux, `bin/wiki-wait-jobs.sh`. Mesuré le 4 octobre 2026, lot 21 tâche 8.
 
 ## Garde-fous d'exécution (dépôt git)
```

Le texte a été écrit mot pour mot, comme la consigne le demandait. La
dernière phrase de la règle de la barrière, « Créer les propriétés une par
une, jamais en rafale », est désormais insuffisante au vu de cette tâche :
voir la question C.

## Étape 2 — Entrée ajoutée à demandes-adminsys.md

Les entrées existantes n'ont ni rubrique « Date du constat » ni rubrique
« Urgence » : ce sont des puces au titre en gras, suivies de paragraphes
ouverts par un intitulé en gras (« **Le mesuré, le 25 août 2026.** »,
« **Demande à fuzzy** »), et elles se closent par une ligne d'état. J'ai
reporté les rubriques de la consigne dans cette forme. L'entrée est à la fin
du fichier, comme demandé. Elle tombe donc sous « 2.4 Gouvernance », voir
« Écarts », point 5.

```markdown
- **Six propriétés d'essai verrouillées par
  `smw-change-propagation-protection` après une création en rafale —
  constat du 4 octobre 2026.** Les six pages `Attribut:Test lot21b débit`,
  `Attribut:Test lot21b puissance`, `Attribut:Test lot21b température`,
  `Attribut:Test lot21b tolérance temp`, `Attribut:Test lot21b écart
  température` et `Attribut:Test lot21b libellé` refusent toute écriture
  avec `smw-change-propagation-protection`.

  **Le mesuré, le 4 octobre 2026.** File de travaux à 0 ; aucun `_CHGPRO`
  sur aucune des six ; aucune protection MediaWiki, le champ `protection`
  est vide comme sur une propriété saine ; le type résolu à l'exécution
  vaut `_wpg` sur les six, alors que leur fait `_TYPE` porte `_qty`, `_tem`
  ou `_mlt_rec` ; une propriété créée seule le même jour à 23:44 UTC
  (`Attribut:Test lot21c débit`) fonctionne normalement.

  **Circonstance.** Les six ont été créées le 4 octobre 2026 à 22:24 UTC,
  dans une rafale de onze pages en treize secondes.

  **Demande à fuzzy.** Dans quel état de propagation ces six propriétés
  sont-elles, et comment lève-t-on ce verrou ? L'enjeu dépasse ces pages
  d'essai : si une rafale de créations peut verrouiller durablement des
  propriétés, cela guette la production.

  **Urgence : aucune.** Rien ne dépend de ces six pages, qui restent en
  place comme témoins. À envoyer groupée avec la prochaine demande.

  Rien n'a été demandé à ce jour : entrée de constat, ouverte.
```

Cette entrée est déjà dépassée par le résultat de cette tâche : une septième
propriété, `Attribut:Test lot21c température`, est dans le même état, et elle
n'a pas été créée en rafale. Voir la question B.

## Étape 3 — Les propriétés, une par une

`bin/wiki-login.sh` : `Success Cywil`.

Avant toute création, j'ai vérifié les dix titres en un seul appel
`action=query&titles=…`. Les neuf titres à créer rendaient `"missing": true`.
`Attribut:Test lot21c débit` existait (pageid 587).

| Propriété | pageid | Révision | Horodatage de création | Tour de franchissement | typeid lu |
|---|---|---|---|---|---|
| P1 `Test lot21c température` | 588 | 1441 | 2026-10-05T12:03:18Z | **aucun : échec aux tours 1, 2 et 3** | `_wpg` aux trois tours, attendu `_tem` |
| P2 `Test lot21c tolérance temp` | — | — | non créée | — | — |
| P3 `Test lot21c écart température` | — | — | non créée | — | — |
| P4 `Test lot21c libellé` | — | — | non créée | — | — |
| P5 `Test lot21c puissance` | — | — | non créée | — | — |

Création de P1, avec `--createonly` et le résumé `[Lot 21][Tâche 9] Propriété
d'essai créée seule` : `"new": true`, `"result": "Success"`, sortie 0.

### Détail des tours de P1

Le volet 1 passe par un script du scratchpad, `volet1.py`. Il construit la
chaîne `action=ask&query=[[<P>::+]]|?<P>|limit=1&format=json`, l'encode
entièrement par `urllib.parse.quote` (crochets, barres, plus, espaces et
accents), l'envoie à `bin/wiki-api.sh` et affiche les `printrequests`. Son
contenu a été affiché avant la première exécution. Le témoin Max thickness a
rendu `_num` à chaque lecture : la lecture est valide.

| Tour | Attente | typeid de P1 | typeid de Max thickness | Écriture de contrôle | État observé à côté |
|---|---|---|---|---|---|
| (hors tour) | Lecture faite par erreur à 12:03:50, pendant la pause du tour 1, 32 s après la création. | `_wpg` | `_num` | non faite | — |
| 1 | `wiki-wait-jobs.sh` : cinq fois `jobs=4`, `FILE FIGEE a 4 travaux`, sortie 2. Pause de 60 s en arrière-plan, terminée. Lecture à 12:04:48. | `_wpg` | `_num` | **refus `smw-change-propagation-protection`**, sortie 1 | `--facts` : **`_CHGPRO` présent**, portant `_TYPE` `_tem`, `_UNIT` et la description. Aucun fait direct. |
| 2 | `wiki-wait-jobs.sh` : cinq fois `jobs=4`, `FILE FIGEE a 4 travaux`, sortie 2. Pause de 60 s. Lecture à 12:06:15. | `_wpg` | `_num` | **refus `smw-change-propagation-protection`** | `--facts` : `_CHGPRO` **absent**, faits directs présents : `_TYPE` `…#_tem`, `_UNIT` `°C, K, °F`, `_MDAT`, `_SKEY`, description. `siteinfo` : `"jobs": 0`. |
| 3 | `wiki-wait-jobs.sh` : `jobs=0`, `FILE VIDE`, sortie 0. Pause de 60 s. Lecture à 12:07:31. | `_wpg` | `_num` | **refus `smw-change-propagation-protection`**, à 12:07:35 | Dans le même tour, `Test lot21c débit` rend toujours `_qty`. |

Les `printrequests` du tour 3, recopiés tels quels :

```
12:07:31 Test lot21c température -> typeid ['_wpg']
  printrequests : [{"label": "", "key": "", "redi": "", "typeid": "_wpg", "mode": 2, "format": false}, {"label": "Test lot21c température", "key": "Test_lot21c_température", "redi": "", "typeid": "_wpg", "mode": 1, "format": ""}]
  results : []
12:07:31 Max thickness -> typeid ['_num']
  printrequests : [{"label": "", "key": "", "redi": "", "typeid": "_wpg", "mode": 2, "format": false}, {"label": "Max thickness", "key": "Max_thickness", "redi": "", "typeid": "_num", "mode": 1, "format": ""}]
12:07:32 Test lot21c débit -> typeid ['_qty']
  printrequests : [{"label": "", "key": "", "redi": "", "typeid": "_wpg", "mode": 2, "format": false}, {"label": "Test lot21c débit", "key": "Test_lot21c_débit", "redi": "", "typeid": "_qty", "mode": 1, "format": ""}]
```

Le refus de l'écriture de contrôle, identique aux trois tours :

```
ERREUR API: smw-change-propagation-protection — This page is locked to prevent accidental data modification while a [https://www.semantic-mediawiki.org/wiki/Change_propagation change propagation] update is run. …
```

Chaque refus a été constaté une seule fois par tour. Je n'ai jamais retenté
d'écriture dans un même tour.

### Comparaison en lecture seule, après l'arrêt

`action=query&prop=info|revisions&inprop=protection&intestactions=edit&intestactionsdetail=full`
sur les deux propriétés Test lot21c :

| | `Test lot21c débit` (tâche 8) | `Test lot21c température` (tâche 9) |
|---|---|---|
| pageid, révision | 587, 1440, une seule révision | 588, 1441, une seule révision |
| `protection` | `[]` | `[]` |
| `actions.edit` | `[]` | `smw-change-propagation-protection` |
| `touched` | 2026-10-04T23:44:25Z | 2026-10-05T12:05:06Z |
| Type déclaré | `_qty`, avec `_CONV` et `_UNIT` | `_tem`, avec `_UNIT` |
| Première lecture `action=ask` après la création | environ 85 s (23:44:00, puis 23:45:25) | **32 s** (12:03:18, puis 12:03:50) |

Les modifications récentes ne montrent aucune écriture d'un tiers entre 23:44
la veille et 12:03 : la création de P1 suit directement celle de Test lot21c
débit.

## Étape 4 — Modèle et catégorie

**Non faite.** La tâche s'est arrêtée à l'étape 3. `Modèle:Test lot21c
valeur` et `Catégorie:Test lot21c classe` n'existent pas.

## Étape 5 — Contrôle final

**Non fait**, pour la même raison.

## Étape 6 — Pages de bac à sable

**Non faite.** `Utilisateur:Cywil/Bac à sable/Lot21c grandeur débit` et
`Utilisateur:Cywil/Bac à sable/Lot21c pompe` n'existent pas.

## Étape 7 — Relevés

**Non faits.** Ils portent tous sur des pages qui n'ont pas été créées.

## Vérifications

a. **Relevé 2 de l'étape 7** : sans objet, l'étape n'a pas eu lieu. Le seul
stockage mesuré est celui de la page de propriété P1, après vidage de
`_CHGPRO` : `_TYPE` vaut `http://semantic-mediawiki.org/swivt/1.0#_tem`. Le
type résolu à l'exécution vaut pourtant `_wpg`.

b. **Contenu** : la tâche n'a créé qu'une page.
`bin/wiki-verify.sh "Attribut:Test lot21c température"
pages/Lot21c_essai_02_temperature.txt` rend `IDENTIQUE`, sortie 0.

c. **Erreurs**, mesurées deux fois à 12:07:57 UTC :
- `action=ask` sur `[[_ERRC::+]]`, `limit=500` : 0 résultat ;
- rendu en ligne de `{{#ask:[[_ERRC::+]]|format=count}}` par `action=parse` :
  `<p>0\n</p>`.

Le compte est à 0. Aucun sujet de production n'y figure.

d. **Liens et catégories de la page d'item** : sans objet, la page n'existe
pas.

## Les cinq questions

| Question | Réponse | Relevé |
|---|---|---|
| 1 — Le filtre de classe écarte-t-il les sous-objets ? | non tranchée par cette mesure | La page pompe n'a pas été créée. |
| 3a — Le couple nombre normalisé plus unité donne-t-il une annotation valide ? | non tranchée par cette mesure | Idem. |
| 4 — Monolingual text : stockage, requête, affichage par langue ? | non tranchée par cette mesure | P4 non créée. |
| 5 — Un écart porté par Temperature subit-il le décalage d'origine ? | non tranchée par cette mesure | P2 et P3 non créées. |
| 6 — Le °F est-il reconnu nativement par Temperature ? | non tranchée par cette mesure | P1 créée mais résolue en `_wpg` : aucune valeur n'aurait été stockée en température. |

## Écarts et surprises

1. **Ma faute : une lecture `action=ask` sur P1 pendant la pause du tour 1.**
   J'ai lancé `volet1.py` à 12:03:50, juste après le départ du `sleep 60` en
   arrière-plan, sans attendre sa notification. Cette lecture a eu lieu 32 s
   après la création, alors que la propagation de P1 n'était pas terminée :
   `_CHGPRO` était encore présent au tour 1. Elle a rendu `_wpg`. Je ne l'ai
   pas comptée comme un tour. J'ai attendu la fin de la pause pour lancer le
   tour 1 réglementaire.

2. **Hypothèse, non établie : interroger une propriété avant la fin de sa
   propagation figerait son type en `_wpg`, ainsi que le verrou.** Elle
   rassemble les trois cas connus :
   - les six Test lot21b : des pages qui les employaient ont été analysées
     dans les secondes qui ont suivi leur création, en rafale ;
   - Test lot21c débit : première lecture environ 85 s après la création, et
     elle fonctionne ;
   - Test lot21c température : première lecture 32 s après la création, et
     elle est figée.

   Une explication technique plausible, que je n'ai pas vérifiée : SMW met en
   cache le type résolu d'une propriété. Une lecture faite avant
   l'application de `_TYPE` mettrait `_wpg` en cache, et ce cache ne serait
   pas invalidé quand la propagation s'achève. Le verrou, de son côté,
   resterait posé alors que la file est vide et que `_CHGPRO` a disparu. Un
   seul cas par branche, donc rien de prouvé. Mais **la rafale seule
   n'explique pas le cas de P1**, et la règle « une par une » ajoutée à
   CLAUDE.md à l'étape 1 ne suffit pas à elle seule.

3. **`_CHGPRO` était présent sur P1 au tour 1.** Il a disparu avant le tour 2.
   La consigne, comme le constat des Test lot21b, décrivait un `_CHGPRO`
   absent. Pour P1, l'état final est bien celui-là, mais on a vu la
   propagation en cours, puis achevée, sans que le verrou ni le type résolu
   ne suivent.

4. **J'ai écrit les neuf fichiers de `pages/` d'un bloc avant toute
   création**, au lieu d'écrire chaque fichier dans le cycle de sa
   propriété. C'est sans effet sur le wiki. Les fichiers 03 à 10 sont
   commités, mais rien n'a été envoyé au wiki à partir d'eux.

5. **L'entrée de `demandes-adminsys.md` est placée à la fin du fichier,
   comme demandé.** Elle tombe donc dans la section « 2.4 Gouvernance ». Sa
   place logique serait « 2.2 Configuration », à côté de l'entrée
   `$smwgChangePropagationProtection`, qui traite du même verrou.

6. **`bin/wiki-wait-jobs.sh` a annoncé deux fois `FILE FIGEE a 4 travaux`,
   sortie 2.** Au troisième passage, il a rendu `jobs=0`. Comme prévu par la
   consigne, je ne l'ai pas traité comme un échec.

7. Je n'ai pas relu les pages de référence du wiki, *Limites connues*
   notamment, avant la première écriture de cette tâche. Les tâches 6 à 8
   du même lot l'avaient fait.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

**A.** *Contexte* : l'hypothèse du point 2 des écarts se teste à peu de
frais, et la tester lèverait le doute sur la part de ma faute. *Question* :
veux-tu une tâche qui crée P2 seule, puis n'émet aucune lecture de cette
propriété pendant un délai fixé, cinq minutes par exemple, avant le premier
tour ? *Suggestion* : oui. Le même jour, créer en contrepoint une autre
propriété, lue volontairement à 30 s. Si la première passe et la seconde se
fige, l'hypothèse tient.

**B.** *Contexte* : `Attribut:Test lot21c température` est désormais une
septième propriété verrouillée, et elle n'a pas été créée en rafale. L'entrée
ajoutée à `demandes-adminsys.md` dit l'inverse en creux, puisqu'elle met la
rafale en avant. *Question* : faut-il compléter cette entrée avec ce
septième cas, et la déplacer en 2.2 ? *Suggestion* : oui, les deux, dans une
consigne suivante. L'entrée ne part pas avant.

**C.** *Contexte* : la règle de la barrière ajoutée à CLAUDE.md finit par
« Créer les propriétés une par une, jamais en rafale ». Cette tâche montre
que ce n'est pas suffisant. *Question* : faut-il l'amender dès maintenant ?
*Suggestion* : attendre le résultat du test de la question A. Une fois
celui-ci connu, ajouter, s'il confirme, « et ne rien lire ni analyser qui
emploie la propriété avant la fin de sa propagation ».
