# Lot 5 — clôture : arbitrage consigné, état clos

Exécuté le 7 novembre 2026, vers 20 h 45 UTC, dans une session Claude Code
cloud, sur la branche `claude/nifty-einstein-i9t8kk`. Deux écritures sur la
page du lot 5, réussies du premier coup, sans arrêt ni question. Les deux
vérifications passent ; celle qui tranche, la première, a demandé une purge
de l'index pour que le lot 5 y apparaisse en « clos ».

## Étape 0 — état du dépôt, et canal direct

Une première commande d'état a été refusée par interdiction, avec
« denied », avant toute écriture. Elle réunissait plusieurs contrôles, dont
un `ls -la` sur le fichier de session du wiki, que couvre la règle `deny`
`Read(./.cookies.txt)` de `.claude/settings.json` : la commande entière a
été refusée, et rien ne s'est exécuté. Le processus de la session a ensuite
redémarré, puis Cyril a écrit, par le canal direct : « Réessayez ». La
commande a été refaite sans nommer ce fichier.

`git fetch origin`, puis `git status --porcelain` : sortie vide, aucun arrêt.
`HEAD` et `origin/main` au même commit, `98fa24c` : rien à mettre à jour.
`.claude/settings.local.json` : absent, au début comme à la fin de la tâche,
donc aucune règle.

Session wiki : `bin/wiki-login.sh` rend `Success Cywil` avant toute lecture.

## Lectures et mesures préalables

- La page du lot 5 a été lue par `bin/wiki-get.sh`
  (`action=parse&prop=wikitext`), puis de nouveau juste avant chaque
  écriture : identique. Révision de départ : 1188. Protection, par
  `prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full` :
  `protection: []` et aucun motif de refus.
- Ancrages : l'appel de modèle occupe les lignes 1 à 8, la ligne 9 est vide,
  « == Points ouverts == » est ligne 10 et en est la seule section ;
  `|Work_package_status=livré` y figure une fois, et
  `|Work_package_delivery_date=2026-07-27` est suivi directement de
  `|Work_package_closure_report=`, sans `Work_package_closure_date`.
- Faits sur lesquels repose le texte, vérifiés avant d'écrire :
  - `travaux/ecolibre-sgdt-lot5.md`, §5 : « Un item organique peut réaliser
    plusieurs fonctions. Un châssis assure la structure, le maintien et la
    protection ; le modèle actuel n'en accepte qu'une. », et l'action W :
    « Passer `Property_cardinality` de `single` à `multiple` » ;
  - le contrôle des virgules a bien eu lieu avant l'écriture :
    `travaux/rapport-2026-07-28.md`, §2.1, « 19 membres, aucune virgule »,
    puis « Feu vert donné pour la phase 2 (actions W à Z) » ;
  - `Attribut:Realizes function` porte `Property_cardinality -> multiple`,
    `Property_domain -> Organic item` et `Property_range -> Functional item` ;
  - le Récapitulatif porte la règle dans sa section « Règles métier »,
    ligne 417 : « Un nom d'item fonctionnel '''ne contient pas de
    virgule''' — depuis que <code>Realizes_function</code> est multivaluée,
    la virgule y sert de séparateur de valeurs. ».
- Comptes de départ, par `action=ask` avec `limit=500`, sans suite pour
  aucun : `[[Has type::+]]` 161, `[[Item_ref::+]]` 118,
  `[[Realizes_function::+]]` 14. Index : le lot 5 en « livré » ; 45 lots,
  3 en cours, 17 faits, 25 à venir, 0 abandonné.

## Écritures

| Étape | Page | Révision | Heure (UTC) | Résumé | Outil |
|---|---|---|---|---|---|
| 1 | Lot 5 — Registre et fonctions multiples | 1188 → 1744 | 20:43:14 | `[Lot 44][Clôture du lot 5] arbitrage consigné` | `bin/wiki-put.sh` |
| 2 | Lot 5 — Registre et fonctions multiples | 1744 → 1745 | 20:43:34 | `[Lot 44][Clôture du lot 5] état clos au 7 novembre 2026` | `bin/wiki-put.sh` |

Les deux ont rendu `result: Success`, et `bin/wiki-verify.sh` a rendu
`IDENTIQUE` après chacune. Le texte de l'étape 1 a été recopié tel quel dans
un fichier, puis inséré entre l'appel de modèle et « == Points ouverts == » :
la section « Points ouverts » est identique, au caractère près, avant et
après. Les deux résumés sont ceux de la consigne, mot pour mot.

## Les deux diffs

### Étape 1

```diff
--- lot5-1188.txt
+++ lot5-1744.txt
@@ -7,6 +7,10 @@
 |Work_package_closure_report=https://github.com/Ecolibre/ecolibre-sgdt/blob/3a0e7af4e6b4d2e0ade4e1d645d568311e04afad/travaux/ecolibre-sgdt-lot5.md
 }}
 
+== Ce qui est déjà tranché ==
+
+'''<code><nowiki>Realizes_function</nowiki></code> est multivaluée.''' Motif : un item organique réalise souvent plusieurs fonctions - un châssis assure la structure, le maintien et la protection - et la cardinalité <code>single</code> d'origine obligeait à en choisir une. Décidé le 27 juillet 2026. Conséquence directe, vérifiée avant l'écriture sur les dix-neuf items fonctionnels d'alors : un nom d'item fonctionnel ne peut plus contenir de virgule, qui sert désormais de séparateur de valeurs. La règle est énoncée dans les règles métier du [[Récapitulatif technique du Système de Gestion de Données Techniques]].
+
 == Points ouverts ==
 
 La date de livraison mesurée est le 27 juillet 2026 à 23h45, dernière écriture portant l'étiquette du lot. L'index affichait le 28 juillet. L'écart d'un jour n'est pas expliqué ; la date mesurée a été retenue.
\ No newline at end of file
```

### Étape 2

```diff
--- lot5-1744.txt
+++ lot5-1745.txt
@@ -1,9 +1,10 @@
 {{Lot
 |Work_package_number=5
-|Work_package_status=livré
+|Work_package_status=clos
 |Work_package_summary=Passer Realizes_function en multivaluée, et enrichir le registre des préfixes de site en le reliant aux lieux.
 |Work_package_opening_date=2026-07-27
 |Work_package_delivery_date=2026-07-27
+|Work_package_closure_date=2026-11-07
 |Work_package_closure_report=https://github.com/Ecolibre/ecolibre-sgdt/blob/3a0e7af4e6b4d2e0ade4e1d645d568311e04afad/travaux/ecolibre-sgdt-lot5.md
 }}
 
```

## Vérifications

1. **Qui tranche : la page du lot 5 et l'index.** La page relue par
   `action=parse` après la dernière écriture porte deux sections, « Ce qui
   est déjà tranché » puis « Points ouverts ». Le texte fourni y figure une
   fois, exactement entre l'appel de modèle et « Points ouverts », et la
   section « Points ouverts » est identique à celle de la révision 1188.
   `Work_package_status=clos`, plus aucune occurrence de « livré » ;
   `Work_package_closure_date=2026-11-07` en ligne 7, entre la date de
   livraison et le rapport de clôture ; les autres paramètres sont
   inchangés. Faits stockés (`smwbrowse`) : `Work_package_status -> clos`,
   `Work_package_closure_date -> 1/2026/11/7`, `_MDAT` égal à l'heure de la
   révision 1745. L'index affichait encore le lot 5 en « livré » à 20:43:48
   et à 20:44:04, soit 14 et 30 secondes après l'écriture. Purgé par
   `bin/wiki-purge.sh "Gestion des lots"` : `purged: true`,
   `linkupdate: true`. Relu à 20:44:15 : lot 5 en « clos », `touched`
   2026-11-07T20:44:15Z. Compte de l'index : 45 lots, 3 en cours, 17 faits,
   25 à venir, 0 abandonné ; la somme égale le total.
2. **Comptes**, par `action=ask` avec `limit=500`, sans suite pour aucun :
   `[[Has type::+]]` **161**, `[[Item_ref::+]]` **118**,
   `[[Realizes_function::+]]` **14**, avant comme après les écritures.

Contrôles complémentaires, non demandés :

- Annotations (`smwbrowse`) : la page ne porte que les faits de son appel de
  modèle, plus `_ASK`, `_INST` (`Lot`), `_MDAT` et `_SKEY`. Aucun `_ERRC`.
- Catégories : `Catégorie:Lot` seule, aucune catégorie de suivi. Liens : un
  seul lien interne, vers le Récapitulatif, qui existe ; `list=backlinks`
  sur le Récapitulatif rend bien la page du lot 5. Lien externe : le seul
  de l'appel de modèle, le rapport de clôture, déjà présent.
- Rendu : deux sections, l'énoncé en gras, `Realizes_function` et `single`
  affichés en code.
- La règle de la virgule tient toujours : `Catégorie:Functional item` compte
  aujourd'hui 27 membres, et aucun de leurs noms ne contient de virgule.

## Écarts et surprises

Relevés sans correctif proposé, comme le demande la consigne.

- **Aucun item ne porte aujourd'hui plusieurs fonctions.** Le texte écrit
  dit « un item organique réalise souvent plusieurs fonctions ». Mesuré le
  7 novembre 2026 : les 14 pages qui portent `Realizes_function` sont toutes
  des items organiques, et chacune n'en porte qu'une valeur, 14 valeurs pour
  14 pages. `Catégorie:Organic item` compte 49 membres, dont 35 sans aucune
  fonction réalisée. Le document du lot 5 écrivait « peut réaliser ».
- **La date de la décision a deux lectures.** Le texte écrit dit « Décidé le
  27 juillet 2026 », la date d'ouverture du lot sur sa page. Le document qui
  porte la décision, `travaux/ecolibre-sgdt-lot5.md`, est « Établi le :
  26 juillet 2026 ». Pour le lot 4, « Décidé le » avait repris la date de ses
  documents, qui était aussi celle de son ouverture.
- **La description d'`Attribut:Realizes function` est restée au singulier**
  : « Lien vers la fonction technique que cet item organique réalise. »,
  alors que la propriété est multivaluée depuis le lot 5.
- **L'index n'a suivi qu'après purge, pour la deuxième clôture de suite** :
  le lot 4 dans l'après-midi, à 35 et 74 secondes, le lot 5 ici, à 14 et
  30 secondes. Lors de la clôture du lot 3, la veille, il avait suivi en
  moins d'une minute sans purge. La cause n'est pas établie.
- **Une interdiction de `.claude/settings.json` porte aussi sur un simple
  `ls`.** La commande refusée au début ne lisait pas le fichier de session,
  elle en listait seulement les attributs : la règle `deny`
  `Read(./.cookies.txt)` l'a refusée tout entière, avec les contrôles
  d'état qui l'accompagnaient. Constaté une fois, dans cette session cloud.
