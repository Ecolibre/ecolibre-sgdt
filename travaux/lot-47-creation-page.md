# Lot 47 — création de la page du lot et versement du rapport de la passe 1

Rapport d'exécution de la consigne du 16 novembre 2026 « création de la page du lot 47 et versement du rapport de la passe 1 ». Exécuteur : Claude Code, poste local, branche `main`.

## Ce qui a été fait

1. **État de départ.**
   - `git status --porcelain` est vide.
   - `.claude/settings.local.json` est absent (`No such file or directory`), donc ne porte aucune règle.
   - Après `git fetch origin`, `origin/main` n'était pas l'ancêtre de `HEAD` : arrêt et question A. Après la réponse, `git merge --ff-only origin/main` a avancé la copie de `d9bea8c` à `58b6bf0`. L'étape 1 a ensuite été rejouée, et elle est conforme : `HEAD` = `origin/main` = `58b6bf0a0ca311d7e00d66b7872faf83790b9cef`.
2. **Fichiers trouvés** dans `~/Téléchargements` (`/home/cyril/Téléchargements/`), un seul exemplaire de chacun :
   - `lot-47-relecture-passe1-rapport.md` (25 700 octets)
   - `lot-47-relecture-passe1-dossier.md` (120 406 octets)

   Rien dans `~/Downloads`. Il n'y a pas de `/mnt/c/Users/*/Downloads`, le poste n'est pas sous WSL. `travaux/` ne contenait aucun fichier `lot-47*` avant la copie. Copie par `cp -n`.
3. **Empreintes mesurées** sur les copies dans `travaux/`, identiques aux valeurs attendues :
   ```
   81afae127bc7b07ffc72832ff13e187c480f19ecb13d11d694bfcc9a43d81d1a  lot-47-relecture-passe1-rapport.md
   7607c94541932bd9f25f5cc592dd94b3be48de8e4fd6543e101c7b0aaea7340b  lot-47-relecture-passe1-dossier.md
   ```
4. **Commit `f9cf26dd8de2d5fac4a6498e6ccfdb1f69d9bf86`**, « Lot 47 : rapport et dossier de la passe 1 de la relecture de conception ». `git show --stat` :
   ```
    travaux/lot-47-relecture-passe1-dossier.md | 1223 ++++++++++++++++++++++++++++
    travaux/lot-47-relecture-passe1-rapport.md |  222 +++++
    2 files changed, 1445 insertions(+)
   ```
   L'ascendance directe a été revérifiée après un nouveau `git fetch origin`. Poussée : `58b6bf0..f9cf26d  HEAD -> main`.
5. **Numéro 47 libre.**
   - `list=allpages&apprefix=Lot 47` rend `"allpages": []`.
   - `[[Catégorie:Lot]]` avec `?Work_package_number` rend 46 résultats, numéros 1 à 46, aucun 47.
   - Les six pages citées existent : lot 7 (pageid 520), lot 17 (489), lot 29 (553), lot 30 (555), lot 31 (556), lot 43 (672), ainsi que `Gestion des lots` (484). La page cible était `missing`, protection `[]`.
6. **Page créée.** Les deux `SHA_DU_COMMIT` ont été remplacés par `f9cf26dd8de2d5fac4a6498e6ccfdb1f69d9bf86` : `grep` compte 0 `SHA_DU_COMMIT` restant et 2 occurrences du hash. Aucune autre retouche du wikitexte.
   - `bin/wiki-login.sh` : `Success Cywil`, après la réponse à C.
   - `bin/wiki-put.sh … --createonly`, avec le résumé fourni mot pour mot : `"new": true`, `"result": "Success"`, `"pageid": 722`, `"newrevid": 1776`, `"newtimestamp": "2026-11-16T05:48:24Z"`.

## Vérifications (étape 7)

**Faits stockés** (`bin/wiki-api.sh --facts`), la vérification qui tranche :

```
Work_package_closure_report -> ['https://github.com/Ecolibre/ecolibre-sgdt/blob/f9cf26dd8de2d5fac4a6498e6ccfdb1f69d9bf86/travaux/lot-47-relecture-passe1-rapport.md', 'https://github.com/Ecolibre/ecolibre-sgdt/blob/f9cf26dd8de2d5fac4a6498e6ccfdb1f69d9bf86/travaux/lot-47-relecture-passe1-dossier.md']
Work_package_number -> ['47']
Work_package_opening_date -> ['1/2026/11/16']
Work_package_overlaps -> ['Lot_7_—_Nomenclature_quantifiée_et_entité_réception#0##', "Lot_29_—_Alignement_sur_l'ontologie_PAIR#0##", "Lot_30_—_Ce_qu'une_structure_met_à_disposition#0##", 'Lot_31_—_Qualification_des_données_et_confiance_entre_pairs#0##', 'Lot_43_—_Modes_opératoires#0##']
Work_package_status -> ['ouvert']
Work_package_summary -> ["Relire la conception du SGDT au regard de la cible du service, en trois passes : la conception, l'ordre des lots, le fonctionnement entre les intervenants."]
_ASK -> [trois requêtes du modèle Lot]
_INST -> ['Lot#14##']
_MDAT -> ['1/2026/11/16/5/48/24/0']
_SKEY -> ['Lot 47 — Relecture de la conception au regard de la cible']
```

Bilan des faits :
- numéro 47 ;
- état ouvert ;
- ouverture au 16 novembre 2026 ;
- cinq valeurs de chevauchement, qui sont des pages distinctes : le découpage à la virgule est appliqué ;
- deux valeurs de rapport, portant chacune le hash de l'étape 4.

Conforme.

**Autres contrôles**, tous conformes :
- **Liens** (`generator=links`) : sept liens, tous vers des pages existantes. Ce sont les lots 7, 17, 29, 30, 31 et 43, et `Gestion des lots`. Aucun lien rouge.
- **Catégories** (`prop=categories`) : `Catégorie:Lot` seule, aucune catégorie de suivi.
- **Erreurs SMW** (`[[_ERRC::+]]` sur la page) : 0 résultat.
- **Index** : `bin/wiki-purge.sh "Gestion des lots"` rend `purged: true`, `linkupdate: true`. Au rendu de `Gestion des lots` (`action=parse`), le titre « Lot 47 — Relecture… » est présent, avec 2 occurrences de « Lot 47 ».
- **`.claude/settings.local.json`**, relevé de fin : toujours absent, aucune règle apparue.

## Fichier temporaire

Le fichier `pages/lot-47-creation.txt` n'est pas suivi par git (`??`). Il est supprimé après ce rapport, comme le demande l'étape 8.

## Écarts et surprises

**A — copie locale en retard sur `origin/main`.** Après `git fetch origin`, `git merge-base --is-ancestor origin/main HEAD` a échoué. La copie locale `main` (`d9bea8c`) avait 26 commits de retard sur `origin/main` (`58b6bf0`), lots 44 et 6, sans aucun commit propre. Ces commits modifiaient aussi `CLAUDE.md`.
- *Question posée :* faire `git merge --ff-only origin/main`, relire `CLAUDE.md`, puis reprendre à l'étape 1 ?
- *Réponse de Cyril :* « A : oui. Fais git merge --ff-only origin/main, relis CLAUDE.md, puis reprends la consigne à l'étape 1. Si le CLAUDE.md à jour contredit une étape de la consigne, arrête-toi et signale-le. Consigne cette question et cette réponse dans "Ecarts et surprises" du rapport. »
- *Suite :* avance rapide faite. J'ai relu les écarts de `CLAUDE.md` et `methode-de-travail.md`. Ils portent sur les corrections 2 et 3, la poussée décidée par l'ascendance, le contrôle des branches de session, le hash cité depuis `git show --stat`, et la forme des résumés fournis. Aucun ne contredit la consigne : la nouvelle règle de poussée est celle de l'étape 4.

**B — `bin/wiki-login.sh` échoue, pas de `.env`.** Message : `ERREUR: ni .env (cherché dans …/ecolibre-sgdt-prive/.env puis …/ecolibre-sgdt/.env) ni WIKI_API, WIKI_USER et WIKI_PASS dans l'environnement`. Le dossier `../ecolibre-sgdt-prive/` existait mais était vide. Les étapes 1 à 5 étaient alors terminées et le premier commit poussé.
- *Question posée :* Cyril peut-il déposer le `.env` dans `../ecolibre-sgdt-prive/` ?
- *Réponse de Cyril :* « B : pas encore. Cherche d'abord si un fichier .env ou .cookies.txt du projet existe ailleurs sur ce poste, sans jamais lire ni afficher leur contenu : affiche seulement les chemins trouvés. Cherche dans le dossier personnel, sur deux ou trois niveaux, les dossiers dont le nom contient "sgdt" ou "ecolibre", et sous WSL aussi dans /mnt/c/Users/*/. Ne copie rien toi-même. Consigne cette question et cette réponse dans "Ecarts et surprises". »
- *Suite :* recherche par `find` et `ls`, sur les noms seulement, sans lecture ni copie.
  - Dossiers « sgdt » ou « ecolibre » à trois niveaux : seul `/home/cyril/data/Ecolibre` est un vrai dossier de projet. Les autres résultats sont des dossiers internes de Claude Code.
  - `.env`, `*.env` et `.cookies.txt` : aucun, ni sous `/home/cyril/data/Ecolibre` à toute profondeur, ni dans le dossier personnel sur quatre niveaux. Même `miroir.env` est absent.
  - Les anciens emplacements `~/ecolibre-sgdt`, `~/ecolibre-sgdt-prive` et `~/Documents/Ecolibre` n'existent pas.
  - Il n'y a pas de `/mnt/c/Users/*/` : le poste n'est pas sous WSL.

**C — aucun identifiant sur ce poste.**
- *Question posée :* Cyril recrée-t-il le `.env`, ou le rapatrie-t-il d'un autre poste, dans `../ecolibre-sgdt-prive/.env`, en le déposant lui-même avec le préfixe `!` ?
- *Réponse de Cyril :* « C : c'est fait, le .env est en place dans ../ecolibre-sgdt-prive/. Reprends à l'étape 6. Consigne cette question et cette réponse dans "Ecarts et surprises". »
- *Suite :* `bin/wiki-login.sh` a rendu `Success Cywil`, puis l'étape 6 a été menée.

**Constat d'installation.** Avant la réponse à C, ce poste n'avait ni `.env` ni `.cookies.txt`, alors que `installation-nouveau-poste.md` suppose le dossier privé garni. Ce rapport ne le corrige pas, puisque la consigne ne nomme pas ce fichier. Seul le `.env` a été déposé, par Cyril ; `.cookies.txt` a été créé par `wiki-login.sh`.

**Texte fourni.** Aucune faute repérée qui justifie un signalement dans les deux fichiers ni dans le wikitexte. Les deux fichiers n'ont pas été relus en entier : seule l'empreinte en garantit l'intégrité. La page n'appelle aucune autre remarque.
