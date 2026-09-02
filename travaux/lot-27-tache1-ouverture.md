# Lot 27 — Tâche 1 : ouverture, et corrections sur les verrous de propagation

**Exécuté le :** 2 septembre 2026 (20h39-20h43 UTC), session Claude Code,
compte `Cywil`. Session ouverte par `bin/wiki-login.sh` avant toute écriture.
Chaque page relue par `wiki-get.sh` immédiatement avant écriture ; les
comparaisons avant/après portent sur ces lectures ou sur la révision
précédente récupérée par l'API, jamais sur une retranscription.

---

## Étape 1 — Vérifier avant de corriger

`action=query&prop=info&intestactions=edit&intestactionsdetail=full` sur
les cinq pages :

| Page | État d'édition |
|---|---|
| `Attribut:INSEE code` | **autorisée** (`actions.edit: []`) |
| `Attribut:Casc parent` | **autorisée** |
| `Attribut:Casc lineage` | **autorisée** |
| `Catégorie:Lot` | **refusée** — `smw-change-propagation-protection` |
| `Attribut:Work package closure report` | **refusée** — `smw-change-propagation-protection` |

Les trois pages d'août acceptent l'édition ; les deux pages de septembre
restent verrouillées. Conforme à l'attendu de la consigne — la correction a
donc pu se poursuivre.

## Étape 2 — Entrée 14 complétée

Texte de la mesure du 2 septembre ajouté mot pour mot à la fin de l'entrée
14, rien retiré. Écrite dans la même édition que l'étape 3 (voir ci-dessous),
`oldrevid` 1248 → `newrevid` 1252, résumé `[Lot 27][Tâche 1] Entrée 14
complétée (le verrou survit à une file vide, se lève en jours) et renvoi de
l'entrée 47 corrigé (entrée 34 → entrée 14)`.

## Étape 3 — Renvoi de l'entrée 47 corrigé

`(entrée 34)` remplacé par `(entrée 14)`, rien d'autre touché dans la phrase
ni ailleurs sur la page. Même édition que l'étape 2 — les deux corrections
portaient sur la même page, avec la même cause (documentation du verrou de
propagation) et le même contrôle de comparaison ; regroupées dans un seul
résumé qui nomme les deux, plutôt que deux écritures qui se seraient
chevauchées sur la même page en quelques secondes.

## Étape 4 — Point ouvert du lot 24 corrigé

Le paragraphe entier remplacé par le texte donné en consigne — l'ancienne
affirmation (« dont trois ne se sont jamais rouvertes ») disparaît avec lui.
`oldrevid` 1249 → `newrevid` 1253, résumé `[Lot 27][Tâche 1] Points ouverts
— correction : le verrou se lève de lui-même en quelques jours, aucune page
n'est restée bloquée définitivement`.

## Étape 5 — `demandes-adminsys.md` corrigé

**Correction volontairement resserrée sur la phrase fausse**, conformément
à la consigne (« ne réécris pas le paragraphe entier »). Un premier essai,
plus large, a été abandonné et refait plus étroitement après relecture —
voir « Écarts et surprises ». Diff retenu :

```diff
-  - **Trois pages restent bloquées, pas une seule** : `Attribut:INSEE
+  - **Trois pages sont restées bloquées, pas une seule — puis se sont
+    débloquées d'elles-mêmes, avant le 31 août 2026, revérifié le
+    2 septembre 2026** : `Attribut:INSEE
     code`, depuis sa création le 21 août 2026 (lot 11, tâche 1) — cinq
     refus `smw-change-propagation-protection` identiques, répartis sur
-    quatre jours, jamais corrigée depuis ; et depuis le 27 août 2026,
+    quatre jours ; et depuis le 27 août 2026,
     `Attribut:Casc parent` et `Attribut:Casc lineage`, toutes deux
     blanchies la veille (26 août) en préparation de leur suppression.
     Code d'erreur vérifié le 27 août par
```

Non commité dans une écriture séparée : regroupé avec ce rapport dans le
commit de fin de tâche (voir plus bas), le fichier n'étant pas un rapport
d'exécution mais un document de gouvernance versionné au même titre que
`CLAUDE.md`.

## Étape 6 — Ouverture du lot 27

`action=query&prop=info` avant écriture : `missing: true`. Créée par
`wiki-put.sh --createonly`, contenu conforme mot pour mot à la consigne,
`pageid` 540, `newrevid` 1254, résumé `[Lot 27][Tâche 1] Création Lot 27 —
Conduite du projet`.

---

## Les quatre contrôles

**1. Les cinq pages de l'étape 1** — relevé ci-dessus, revérifié
identique en fin de tâche (mêmes cinq résultats).

**2. Quarante-sept entrées, la 14 complétée, la 47 corrigée sur son seul
renvoi, les autres inchangées.** `grep -c "^# "` : `47`. Comparaison
automatisée entrée par entrée contre la révision 1248 (récupérée par
`action=query&revids=1248&prop=revisions&rvprop=content`, l'état réel
précédant cette écriture) : **seules les entrées 14 et 47 diffèrent**, les
45 autres byte pour byte identiques. `browsebysubject` sur la page : `_INST`,
`_MDAT`, `_SKEY` seulement — aucune annotation parasite depuis les noms
techniques entre guillemets simples inversés (`` `runJobs.php` ``,
`` `INSEE_code` ``…) du nouveau texte, qui ne contiennent aucun `::`.

**3. `Catégorie:Lot` — vingt-sept membres ; l'index rend vingt-sept au
total.** Les deux confirmés : `list=categorymembers` → 27 ;
`Compte` de `Gestion des lots` → `Lots au total : 27`. **Écart avec la
consigne sur le second point : l'index affiche un seul lot « en cours »,
pas deux.** `action=ask` sur `[[Work_package_status::ouvert]]` ne retourne
que `Lot 27 — Conduite du projet` — `Lot 13` porte `Work_package_status ->
livré` depuis la tâche 5b, pas `ouvert`. Vérifié après une purge forcée de
`Gestion des lots` pour écarter un rendu périmé (leçon de l'entrée 47
elle-même) : le résultat ne change pas, `En cours : 1`. Ce n'est donc pas
un défaut d'affichage — la donnée dit un seul lot ouvert. Non corrigé :
changer le statut d'un lot pour faire correspondre un compte attendu serait
fabriquer un fait plutôt que le rapporter. Détaillé en « Écarts et
surprises ».

**4. `git diff` sur `demandes-adminsys.md` — une seule phrase touchée.**
Diff joint à l'étape 5 : un bloc de trois lignes modifiées (l'intitulé en
gras et la clause « jamais corrigée depuis »), rien d'autre dans le fichier.

---

## Écarts et surprises

**1. La consigne annonçait deux lots « en cours » après l'ouverture du
lot 27 ; il n'y en a qu'un.** `Lot 13` a été livré à la tâche 5b de la
tâche précédente — son état est `livré`, pas `ouvert`, depuis le
2 septembre. La consigne semble avoir compté `Lot 13` comme encore ouvert
au moment de sa rédaction, ce qui n'était déjà plus le cas. Rapporté tel
que mesuré, deux fois (lecture directe puis après purge), sans corriger la
donnée pour faire correspondre le compte annoncé.

**2. Le premier essai de correction de `demandes-adminsys.md` était trop
large, et a été refait.** Une première version réécrivait le narratif de
la puce entière — dates reformulées, phrases réordonnées — plutôt que de
ne toucher que l'affirmation fausse. Repérée en relisant le `git diff`
avant de committer, et reprise pour ne changer que l'intitulé en gras et
la clause « jamais corrigée depuis », conformément à l'instruction « ne
réécris pas le paragraphe entier si tu peux corriger la seule phrase
fausse ».

**3. La section « Demande à fuzzy » qui suit immédiatement, dans le même
fichier, reste orientée vers un déblocage des trois pages d'août** (vider
la file de travaux, vérifier le réglage), alors que ces trois pages sont
maintenant débloquées d'elles-mêmes. Non touchée : elle n'est pas « la
phrase fausse » visée par la consigne, et la corriger aurait débordé du
paragraphe 2.2 vers une reformulation de la demande elle-même — hors
mandat de cette tâche. Signalé pour que Cyril en décide.

**4. Aucun autre écart.** Les six écritures sont conformes mot pour mot à
la consigne (à l'exception du recadrage volontaire de l'étape 5, refait
avant commit), et les quatre contrôles sont positifs, avec la seule réserve
du point 3 ci-dessus sur le compte de lots « en cours ».
