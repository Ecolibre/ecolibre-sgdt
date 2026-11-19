# Lot 48, tâche 4 : documentation des espaces de formation

Session locale sur le Framework, 19 novembre 2026, branche `main`.

## Étape 1 : état du dépôt

- `git fetch origin` puis `git status -sb` : `## main...origin/main`, propre ; `HEAD` et `origin/main` tous deux sur `ef8235f`.
- `git rev-parse --is-shallow-repository` : `false`.
- `git merge-base --is-ancestor origin/main HEAD` : vrai.
- `.claude/settings.local.json` au début : **absent** (`No such file or directory`), donc aucune règle.

## Étape 2 : page du lot 48

Titre pris dans `Catégorie:Lot` : `Lot 48 — Espaces de formation verrouillés` (pageid 723).

- Révision avant : **1808** (attendue 1808). Protection native : aucune.
- Révision après : **1812**.
- Résumé : `[Lot 48][Tâche 4] Mise en production, mesures, pages témoins et points ouverts consignés`
- Script de session : chaque ligne visée (R1, R2, R3, R4, R7, les deux titres de R6) comptée à exactement une occurrence, la phrase de R3 aussi ; sinon arrêt sans écrire. Contenu affiché avec son lancement.
- `bin/wiki-verify.sh` : **IDENTIQUE**.
- `prop=links` (1 lien) et `prop=categories` (`Catégorie:Lot`) : identiques avant et après.
- Faits après écriture (`_MDAT` à 20:38:51, donc relus après l'écriture) : `Work_package_number` 48, `Work_package_status` ouvert, `Work_package_opening_date` 2026-11-19, `Work_package_summary` inchangé. Tous les quatre inchangés.

Diff (sortie de `diff`, avant puis après) :

```
39c39
< * '''Tout réglage s'éprouve d'abord sur le miroir local''', selon la règle du lot 24 : celui-ci porte sur des droits, pas sur l'affichage.
---
> * '''Tout réglage s'éprouve d'abord sur le miroir local''', selon la règle du lot 24 : celui-ci porte sur des droits, pas sur l'affichage. Décision remplacée le 19 novembre 2026, voir plus bas.
46c46
< * '''Le robot de formation est un second mot de passe de robot du compte de Cyril''', limité à la lecture et à l'écriture de pages. C'est la forme la plus simple, et elle cache le support aussi bien qu'un compte propre, puisque le verrou s'applique aux visiteurs. Il lit aussi l'espace CWL, comme le robot du SGDT.
---
> * '''Le robot de formation est un second mot de passe de robot du compte de Cyril''', créé le 19 novembre 2026. Cyril lui a donné, en plus de la création et de la modification de pages, le téléversement, le remplacement et le renommage de fichiers, la vérification et la révocation de modifications. Il travaille depuis un dépôt privé distinct de ce projet, dont les scripts n'écrivent que dans les espaces de formation. Il lit aussi l'espace CWL, comme le robot du SGDT.
48,49c48,59
< * '''La vérification sans connexion couvre aussi''' l'inclusion par l'API, l'API REST, Spécial:Exporter, l'historique avec ses anciennes versions et ses différences, et la page d'informations. La recherche s'y vérifie avec un témoin : la même recherche, faite connecté, doit trouver la page, l'index de recherche du wiki étant partiel.
< * '''L'entrée des Limites connues qui tient le verrou pour inopérant sera réécrite dans ce lot''', après les essais sur le miroir : elle dit l'espace CWL lisible sans connexion, ce que démentent les relevés des 18 et 19 novembre 2026.
---
> * '''La vérification sans connexion couvre aussi''' l'inclusion par l'API, l'API REST, Spécial:Exporter, l'historique avec ses anciennes versions et ses différences, et la page d'informations. La recherche s'y vérifie sur le titre, avec un témoin : la même recherche, faite connecté, doit trouver la page. Mesuré le 19 novembre 2026 sur la page de test de l'espace CWL : connecté, la recherche dans le texte ne la trouve pas, l'index de recherche du wiki étant partiel, alors que la recherche sur le titre la trouve.
> * '''L'entrée des Limites connues qui tenait le verrou pour inopérant est réécrite''' le 19 novembre 2026, d'après les mesures de ce lot.
>
> Décisions et mesures de la mise en production, le 19 novembre 2026 :
>
> * '''La configuration est appliquée directement en production, sans essai sur le miroir.''' […P1 mot pour mot…]
> * '''Le compte de Cyril est entré dans le groupe formation''' […P2 mot pour mot…]
> * '''Mesuré sans connexion sur les pages témoins''' […P3 mot pour mot…]
> * '''Trois pages témoins restent en place''' […P4 mot pour mot…]
> * '''Les scripts du dépôt public refusent ces espaces''' […P5 mot pour mot…]
> * '''Les supports de formation sont en "tous droits réservés"''' […P6 mot pour mot…]
> * '''Le message d'avertissement des formulaires reste tel quel.''' […P7 mot pour mot…]
69,73c79
< * '''Le refus dans les scripts du SGDT''' : où il se place, et comment on l'éprouve.
< * '''Le message d'avertissement des formulaires d'édition.''' […]
< * '''La vérification déconnectée''', sur le miroir puis en production : […]
< * '''Ce que la migration doit emporter''' : les espaces personnalisés gardent exactement leurs numéros, sinon leurs pages deviennent inaccessibles ; la vérification déconnectée se refait ensuite.
< * '''Où documenter ces espaces sur le wiki.''' La liste des espaces du Récapitulatif technique ne cite aujourd'hui que 102, 106, 108 et 828.
---
> * '''Ce que la migration doit emporter''' : les espaces personnalisés gardent exactement leurs numéros, sinon leurs pages deviennent inaccessibles ; les lignes de configuration sont dans le dépôt, avec celles du miroir ; la vérification sans connexion se refait ensuite sur les pages témoins.
77c83
< Le miroir local du lot 22, clos, sert aux essais : ce lot en est le premier usage réel, et il ne tourne que sur la tour, en session locale. L'application en production attend la sauvegarde de précaution. Le lot 41 fixe d'abord […]
---
> Le miroir local du lot 22 devait servir aux essais ; Cyril a finalement appliqué la configuration directement en production, le miroir ne tournant que sur la tour. La sauvegarde de précaution n'a pas été attendue : seul le fichier de configuration a été copié avant le changement. Le lot 41 fixe d'abord le caractère qui remplace le tiret long dans les titres neufs : des titres de formation écrits en caractères tapables au clavier n'ajoutent rien au renommage à venir.
```

Les lignes P1 à P7 sont celles de la consigne, recopiées mot pour mot par le script ; elles sont abrégées ici seulement, et `wiki-verify.sh` atteste que le texte en ligne est celui envoyé.

## Étape 3 : Limites connues du Système de Gestion de Données Techniques

- Révision avant : **1775** (attendue 1775). Protection native : aucune.
- Révision après : **1813**.
- Résumé : `[Lot 48][Tâche 4] Entrée sur Lockdown réécrite d'après les mesures du 19 novembre 2026`
- `bin/wiki-verify.sh` : **IDENTIQUE**.
- `prop=links` (11) et `prop=categories` (`Catégorie:Page de suivi`) : identiques avant et après.
- Entrées numérotées (lignes commençant par `# `) : 78 avant, 78 après, compté dans le script avant écriture puis sur la page relue en ligne.

Diff :

```
75c75
< # '''Lockdown ne protège rien sur ce wiki.''' SMW ne consulte pas les droits de lecture de MediaWiki : ses requêtes puisent dans ses propres tables. Un espace de noms verrouillé reste interrogeable par <code>#ask</code>, et les propriétés qu'il porte restent publiques. La confidentialité réelle passe obligatoirement par un wiki propre à la structure concernée. Le constat est ancien — il figure dans <code>travaux/sgdt-etat-des-lieux_old.md</code>, dont le nom laisse croire qu'il est périmé — et a été redécouvert le 7 septembre 2026 en le proposant à nouveau, l'extension étant installée et un espace de noms <code>CWL</code> existant, lisible en anonyme.
---
> # '''Lockdown cache le contenu d'une page, pas ce qui l'entoure.''' Mesuré les 18 et 19 novembre 2026 sur l'espace CWL et les espaces de formation du lot 48 : […texte de la consigne, mot pour mot…] L'ancienne version de cette entrée, du 7 septembre 2026, disait l'espace CWL lisible sans connexion : il ne l'est plus.
```

## Étape 4 : Récapitulatif technique du Système de Gestion de Données Techniques

- Révision avant : **1743** (attendue 1743). Protection native : aucune.
- Révision après : **1814**.
- Résumé : `[Lot 48][Tâche 4] Espaces de noms personnalisés ajoutés`
- Le script a vérifié que la ligne `828 <code>Module</code>.` était unique et se trouvait bien dans la section `=== Espaces de noms ===`.
- `bin/wiki-verify.sh` : **IDENTIQUE**.
- `prop=links` (207) et `prop=categories` (`Catégorie:Page de suivi`, `Catégorie:SGDT`) : identiques avant et après.

Diff :

```
478a479,480
> Espaces personnalisés, verrouillés par Lockdown : 500 <code>CWL</code>, lecture et modification réservées aux administrateurs ; 502 <code>CAO</code>, 504 <code>SolidWorks</code>, 506 <code>FreeCAD</code>, 508 <code>Onshape</code> et 510 <code>Fusion</code>, chacun avec son espace de discussion au numéro impair suivant, réservés au groupe formation, sans inclusion possible (lot 48, 19 novembre 2026). Les numéros 512 à 515 sont réservés à Inventor et Catia, sans être créés. Ces numéros ne doivent jamais changer, sinon les pages de ces espaces deviennent inaccessibles.
>
```

(Résultat : `828 <code>Module</code>.`, une ligne vide, la nouvelle ligne, une ligne vide, puis `=== Types de données disponibles ===`.)

## Étape 5 : page du lot 49

Titre pris dans `Catégorie:Lot` : `Lot 49 — Licence et provenance des fichiers` (pageid 724).

- Révision avant : **1806** (attendue 1806). Protection native : aucune.
- Révision après : **1815**.
- Résumé : `[Lot 48][Tâche 4] Cinquième cas de licence, transmis par le lot 48`
- `bin/wiki-verify.sh` : **IDENTIQUE**.
- `prop=links` (1) et `prop=categories` (`Catégorie:Lot`) : identiques avant et après.
- Faits après écriture (`_MDAT` à 20:39:52) : `Work_package_number` 49, `Work_package_status` identifié. Inchangés.

Diff :

```
26a27
> ** support de formation, ajouté le 19 novembre 2026 sur décision de Cyril transmise par le lot 48 : "tous droits réservés" pour les productions de Cyril destinées à la formation, captures de ses propres modèles comprises ; une capture d'un logiciel propriétaire suit en plus les conditions de son éditeur, vérifiées au cas par cas avant tout téléversement.
```

## Étape 6 : dépôt

### `.claude/settings.json`

Lu dans `~/data/Pro/depots/formation-cao/.claude/settings.json` : seules les règles `Bash(` de `deny` ont été affichées. Seize portent sur `.env` et `.cookies.txt` ; elles ont été ajoutées à `deny` ici, juste après `Bash(mysqldump:*)`, et rien d'autre n'a changé :

```
+      "Bash(cat *.env*)",
+      "Bash(cat *.cookies.txt*)",
+      "Bash(head *.env*)",
+      "Bash(head *.cookies.txt*)",
+      "Bash(tail *.env*)",
+      "Bash(tail *.cookies.txt*)",
+      "Bash(grep *.env*)",
+      "Bash(grep *.cookies.txt*)",
+      "Bash(sed *.env*)",
+      "Bash(sed *.cookies.txt*)",
+      "Bash(awk *.env*)",
+      "Bash(awk *.cookies.txt*)",
+      "Bash(od *.env*)",
+      "Bash(od *.cookies.txt*)",
+      "Bash(python3 *.env*)",
+      "Bash(python3 *.cookies.txt*)",
```

Les règles `sudo`, `mysql`, `mysqldump` (déjà présentes ici) et `ssh` (ici en `ask`, et non en `deny`) n'ont pas été reprises : elles ne portent pas sur `.env` ni `.cookies.txt`.

Comptes après écriture : `deny 40 ask 5 allow 49` (avant : `deny 24 ask 5 allow 49`). JSON valide, puisqu'il a été chargé par `json.load`.

Épreuve : `head -c 0 <scratchpad>/t4/essai.env`, sur un fichier inexistant qu'aucune règle `Read` ne couvre, ce qui isole la règle neuve `Bash(head *.env*)`, et avec `-c 0`, qui ne peut rien afficher. Résultat : `Permission to use Bash with command head -c 0 …/essai.env has been denied.`

### `installation-nouveau-poste.md`

```
@@ -50,0 +51 @@
+| `deny Bash(cat, head, tail, grep, sed, awk, od, python3 *.env*)` et les mêmes en `*.cookies.txt*`, seize règles reprises du dépôt privé de formation | Protection contre la lecture de .env par mégarde, par les commandes de lecture autorisées ; pas un verrou : cp puis cat sur un autre nom passe encore | 19/11/2026 |
```

### `CLAUDE.md`

```
-… Seule exception passée : les trois pages d'essai du lot 48, créées le 19 novembre 2026 et à supprimer à sa clôture.
+… Seule exception passée : les trois pages d'essai du lot 48, créées le 19 novembre 2026 et gardées comme témoins du verrou.
```

`git diff --stat` avant commit : 3 fichiers, 18 insertions, 1 suppression.

## Relevé de `.claude/settings.local.json`

- Au début : absent.
- À la fin : absent. `ls -la .claude/` montre seulement `commands/` et `settings.json`.

## Questions posées et réponses rendues hors consigne

Aucune.

## Écarts et surprises

1. **Numéros de révision.** Les quatre révisions attendues étaient exactes à la lecture. Les nouvelles révisions vont de 1812 à 1815 : les révisions 1809 à 1811 ont été écrites ailleurs sur le wiki entre-temps. Je ne les ai pas examinées, car elles relèvent peut-être des espaces de formation, que ce dépôt ne lit pas.
2. **D'autres passages de la page du lot 48 sont devenus faux**, sans que la consigne les touche ; je les ai laissés tels quels :
   - « Place dans la feuille de route » : « Seule l'application en production attend que la sauvegarde de précaution soit faite ; les essais sur le miroir n'en dépendent pas. » R7 dit maintenant le contraire.
   - Décisions du 18 novembre, résumés automatiques : « Le réglage s'éprouve d'abord sur le miroir. »
   - Décisions du 19 novembre, inclusion : « Qu'il bloque aussi ces deux appels reste à éprouver sur le miroir. » P3 dit maintenant que l'inclusion ne rend qu'un lien.
3. **Les nouvelles règles `deny` visent plus large que `.env`** (déduction, non mesurée sauf pour l'épreuve ci-dessus). Le motif `*.env*` se compare à toute la ligne de commande. Il devrait donc aussi refuser :
   - tout `python3 -c` qui écrit `os.environ` (`.environ` contient `.env`) ;
   - tout `grep`, `sed` ou `awk` qui cherche la chaîne `.env` dans la documentation, par exemple dans `CLAUDE.md` ou `installation-nouveau-poste.md`.

   Les refus seront visibles (« denied ») et sans danger, mais ils peuvent gêner. Voir la question A.
4. Ce dépôt est public. La ligne de `installation-nouveau-poste.md` parle du « dépôt privé de formation » sans le nommer ni donner de chemin ; `CLAUDE.md` le nommait déjà.

## Questions

**A.** Les motifs `Bash(python3 *.env*)` et `Bash(grep *.env*)` refusent probablement aussi `os.environ` dans un `python3 -c`, et toute recherche de la chaîne `.env` dans la documentation. Garder ces motifs tels qu'ils sont repris du dépôt de formation, ou les resserrer ? Suggestion : les garder, et noter le premier refus réel s'il se produit ; on resserrera seulement si la gêne se confirme.

**B.** La page du lot 48 garde trois phrases démenties par la mise en production (écart 2). Les corriger dans une prochaine consigne, ou à la clôture du lot ? Suggestion : une consigne courte de trois remplacements, avant la clôture.
