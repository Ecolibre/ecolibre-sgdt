# Correctif hors lot, suite — purge des pages des quatre classes, entrée des Limites connues

Exécuté le 3 octobre 2026 par Claude Code, sur consigne « Pour Claude Code. »,
en `[Correctif]` hors lot. Fait suite à
`travaux/correctif-formulaires-par-defaut.md`.

## Résultat

- **Purge.** Les 133 pages membres de Physical item, Referenced item, Lot et
  Lieu ont été purgées en 7 paquets. Chaque titre porte `"purged": true` et
  `"linkupdate": true`. Il n'y a eu ni relance, ni pause, ni avertissement
  de limitation de débit.
- **Vérification qui tranche** : sans connexion, **133 pages sur 133**
  montrent l'onglet du formulaire. Avant la purge, elles étaient 85.
- **Limites connues** (pageid 144) : une seule écriture, par
  `bin/wiki-append.sh`. La révision passe de 1364 à **1390** (horodatage
  2026-10-03T21:46:07Z). La page compte désormais 54 entrées, et la
  nouvelle est la dernière.

## Relevé de départ

**Étape 0.**
- `git status` : aucune ligne M, A, D ou R. Six lignes `??` dans
  `travaux/`, non comptées.
- `git log -1 --oneline` : `288f197`, comme attendu.
- Règles permanentes, `jq '.permissions.allow | length'
  .claude/settings.local.json` : **0**.
- Aucun des fichiers nommés n'existait : copie de l'entrée, rapport,
  script du scratchpad.

**1a. Script `verif_onglets.py`.** Recopié tel quel dans le scratchpad de
session, son contenu affiché dans le même message que son premier
lancement. Résultat :

| Classe | Pages | Avec l'onglet | Sans |
|---|---|---|---|
| Physical item | 47 | 41 | 6 |
| Referenced item | 39 | 36 | 3 |
| Lot | 34 | 7 | 27 |
| Lieu | 13 | 1 | 12 |
| **Total** | **133** | **85** | **48** |

Les 48 pages sans onglet concordent avec le relevé de l'architecte. Les
voici :
- **Physical item** : 476 Fer à souder — Atelier appartement (CWL-0009) ;
  371 Groseillier — Terrasse de Chilhac (ECL-0018) ; 383 Paulownia — Le
  Buisson de Cerzat (ECL-0030) ; 386 Poireau perpétuel — Jardin de Chilhac
  (ECL-0034) ; 385 Poireau perpétuel — Le Buisson de Cerzat (ECL-0032) ;
  389 Roquette sauvage — Terrasse de Chilhac (ECL-0036).
- **Referenced item** : 325 Bourrache La Closerie D'Olt 2026 ; 473 Fer à
  souder Quicko T12-942 ; 350 Poireau perpétuel Escuroux 2025.
- **Lot** : 523 Lot 10 ; 524 Lot 11 ; 486 Lot 14 ; 487 Lot 15 ; 488 Lot 16 ;
  489 Lot 17 ; 490 Lot 18 ; 491 Lot 19 ; 515 Lot 2 ; 492 Lot 20 ; 532 Lot 21 ;
  533 Lot 22 ; 534 Lot 23 ; 536 Lot 25 ; 537 Lot 26 ; 541 Lot 28 ;
  553 Lot 29 ; 516 Lot 3 ; 555 Lot 30 ; 556 Lot 31 ; 558 Lot 32 ; 517 Lot 4 ;
  518 Lot 5 ; 519 Lot 6 ; 520 Lot 7 ; 521 Lot 8 ; 522 Lot 9.
  Les sept lots qui avaient l'onglet sont les lots 1, 12, 13, 24, 27, 33
  et 34. Le lot 1 avait été purgé au correctif précédent, et le lot 24
  modifié par lui.
- **Lieu** : 413 Atelier appartement ; 449 Au pied du pylône électrique ;
  448 Butte de l'extrémité amont de la tranchée principale ; 447 Butte de
  la tranchée ; 442 Cerzat ; 443 Chilhac ; 291 Jardin de Chilhac ; 290 Le
  Buisson de Cerzat ; 441 Terrain de Cyril au Buisson de Cerzat ;
  292 Terrasse de Chilhac ; 445 Zone basse ; 446 Zone haute.
  Seule la page 444, Appartement de Chilhac, avait l'onglet ; elle avait
  été purgée au correctif précédent.

**1b. Limites connues** : tout est conforme à l'attendu.
- Révision 1364 (parent 1359).
- 53 entrées `# `.
- Faits : `_INST` Page_de_suivi, `_MDAT` 2026/10/1 19:55:05, `_SKEY`.
- Catégorie : Page de suivi.

## Entrée ajoutée

Le fichier `pages/Limites_connues_ajout_copies_figees.txt` a été écrit avec
l'outil d'écriture. Il contient une ligne vide, puis l'entrée fournie, mot
pour mot, sur une seule ligne physique. Avant l'écriture, j'ai vérifié que
l'entrée 47, à laquelle l'ajout renvoie, porte bien sur le rendu « qui se
rafraîchit avec retard, pas jamais ».

`bin/wiki-login.sh` a été lancé (`Success Cywil`), puis `bin/wiki-append.sh`
avec le résumé fourni. Sortie du script :
- `Pré-contrôle OK — 53 entrées « # » avant ajout, la liste finit la page.`
- `result: Success`, `oldrevid` 1364, `newrevid` 1390.
- `Post-controle OK : 53 -> 54 entrees, lajout est bien la derniere entree de la page.`
- `Rendu OK : lajout sinsere dans la liste existante (1 bloc(s) <ol> sur la page).`

## Purge

Avant la purge, `bin/wiki-get.sh --category` listait :
- Physical item : 47 titres ;
- Referenced item : 39 ;
- Lot : 34 ;
- Lieu : 13.

Ces comptes sont conformes. Chaque paquet a été envoyé en un seul appel à
`bin/wiki-purge.sh`.

| Paquet | Classe | Titres | Purgés | Relancés | Pauses | linkupdate |
|---|---|---|---|---|---|---|
| 1 | Physical item (Ail éléphant ECL-0003 → Helianthi ECL-0020) | 25 | 25 | 0 | 0 | 25/25 |
| 2 | Physical item (Hémérocalle ECL-0021 → Yacon ECL-0039) | 22 | 22 | 0 | 0 | 22/22 |
| 3 | Referenced item (Ail éléphant Armand 2026 → Menthe bergamote Escuroux 2025) | 25 | 25 | 0 | 0 | 25/25 |
| 4 | Referenced item (Menthe X origine inconnue → Yacon La Closerie D'Olt 2025) | 14 | 14 | 0 | 0 | 14/14 |
| 5 | Lot (Lot 1 → Lot 31, ordre alphabétique) | 25 | 25 | 0 | 0 | 25/25 |
| 6 | Lot (Lot 32 → Lot 9) | 9 | 9 | 0 | 0 | 9/9 |
| 7 | Lieu (les 13) | 13 | 13 | 0 | 0 | 13/13 |
| **Total** | | **133** | **133** | **0** | **0** | **133/133** |

Aucune réponse ne portait de clé `warnings`, ni de titre absent ou
non purgé.

## Vérifications

**1. Celle qui tranche : `verif_onglets.py` relancé après la purge.**
```
Physical item : 47 pages, 47 avec l'onglet
Referenced item : 39 pages, 39 avec l'onglet
Lot : 34 pages, 34 avec l'onglet
Lieu : 13 pages, 13 avec l'onglet
Total : 133 pages, 133 avec l'onglet
```
Le résultat est conforme. Aucune purge supplémentaire n'a été nécessaire.

**2. Relevé 1b refait** : tout est conforme.
- Révision **1390** (parent 1364).
- **54** entrées.
- Faits : `_INST` Page_de_suivi, `_SKEY`, et `_MDAT`, qui passe à
  2026/10/3 21:46:07. Mêmes faits qu'au départ.
- Catégorie : Page de suivi seule. Aucune catégorie de suivi n'est
  apparue.

**3. Diff calculé par le wiki, 1364 → 1390** : une seule ligne ajoutée,
l'entrée, après la dernière entrée existante. Rien de retiré : les deux
lignes de contexte sont inchangées. Le résultat est conforme.

**4. La marque s'affiche en clair.** La commande `… | jq -r '.parse.text'
| grep -c "&lt;!-- Cached"` rend **1**. La marque est échappée à l'affichage
et n'est pas devenue un vrai commentaire HTML. Le résultat est conforme.

**5. Règles permanentes** : `jq '.permissions.allow | length'
.claude/settings.local.json` rend **0**, inchangé.

## Confirmations demandées

Je ne vois pas, de mon côté, quelles commandes ont ouvert une fenêtre de
confirmation. Aucune n'a été refusée.

Formes annoncées par la consigne :
- **Script de vérification.** Il a été écrit dans le scratchpad avec
  l'outil d'écriture, puis lancé deux fois sous la forme
  `python3 /tmp/claude-1000/-home-spheres-ecolibre-sgdt/4cf72ba4-7d65-4227-bf63-3f31d38981d7/scratchpad/verif_onglets.py`
  (relevé de départ et vérification 1).
- **`sleep 60`** : jamais employé, aucune limitation de débit.
- **Lectures enchaînées par `|`.**
  - Comptes d'entrées, deux fois :
    `bin/wiki-get.sh "Limites connues du Système de Gestion de Données Techniques" | grep -c "^# "`
  - Lecture de l'entrée 47 :
    `bin/wiki-get.sh "Limites connues…" | grep "^# " | grep -n "" | grep "^47:" | cut -c1-400`.
    **Cette commande sort de la liste annoncée, puisque `cut` n'y figure
    pas.** Voir les écarts.
  - Vérification 3 :
    `bin/wiki-api.sh "action=compare&fromrev=1364&torev=1390…" | jq -r '.compare.body'`
  - Vérification 4 :
    `bin/wiki-api.sh "action=parse&pageid=144&prop=text…" | jq -r '.parse.text' | grep -c "&lt;!-- Cached"`

Forme non annoncée :
- **Paquet 1 de la purge** :
  `bin/wiki-purge.sh "…25 titres…" | jq -c '[…]'`. Voir les écarts.

Les autres commandes, sans `|`, sont de forme simple :
- `git status`, `git log`, `jq` ;
- `ls`, `grep` sur `bin/wiki-append.sh` ;
- `bin/wiki-api.sh`, `bin/wiki-get.sh --category` ;
- `bin/wiki-login.sh`, `bin/wiki-append.sh`, `bin/wiki-purge.sh`.

Aucun `python3` en ligne, aucun `cd`. Le script a été appelé par son
chemin complet.

## Écarts et surprises

1. **Deux commandes sont sorties des formes annoncées.**
   - Le paquet 1 de la purge a été lancé sous la forme
     `bin/wiki-purge.sh … | jq`, pour compter les titres purgés. Cette
     forme n'était pas dans la liste.
   - La lecture de l'entrée 47 a enchaîné `cut`, qui n'y figure pas non
     plus.

   Les deux commandes sont passées, et je ne sais pas si elles ont
   déclenché une fenêtre. Dès que j'ai remarqué l'écart sur le paquet 1,
   j'ai lancé les paquets 2 à 7 par `bin/wiki-purge.sh` seul et lu le JSON
   brut.
2. **Mon hypothèse du rapport précédent était fausse.** J'avais attribué le
   rattrapage partiel de l'onglet à une invalidation différée par la file
   de travaux. Le relevé de l'architecte, confirmé ici, montre une autre
   cause : la copie servie aux visiteurs non connectés par le cache de
   fichiers, qui n'expire pas. La page 394 rendait 1 parce que sa copie
   était postérieure à la modification, ou n'existait pas encore. La
   page 413 rendait 0 parce que sa copie était plus ancienne. La question A
   du rapport précédent est close par cette purge.
3. **Le script de vérification lit lui-même le cache de fichiers.** Il
   interroge `index.php?curid=N` sans paramètre de contournement. C'est
   voulu ici, puisque c'est la copie servie aux visiteurs qu'on veut
   mesurer. Mais par la même mécanique que décrit l'entrée ajoutée, chaque
   lancement peut créer une copie pour les pages qui n'en avaient pas.
   Pour un contrôle de l'état à jour plutôt que de l'état servi, il
   faudrait ajouter `&cachebust=1`, comme le recommande l'entrée.
