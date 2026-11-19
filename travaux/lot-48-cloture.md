# Lot 48 : clôture

Session locale sur le Framework, 19 novembre 2026, branche `main`. Cette consigne fait écrire ce que la clôture a décidé dans la conversation du lot ; ce n'est pas l'exécution de la procédure de clôture par l'exécuteur.

## Étape 1 : état du dépôt

- `git fetch origin`, puis `git status -sb` : `## main...origin/main`, propre ; `origin/main` sur `88ac283`.
- Clone superficiel : `false`. `origin/main` est bien l'ancêtre de `HEAD`.
- Vérifié par `git ls-tree` au commit `88ac283cbc25a8abab1cacacfb06e93cd0c37b33` : les dix fichiers de `travaux/` cités en C1 existent tous.
- `.claude/settings.local.json` au début : **absent**.

## Méthode commune

Les cinq pages ont été lues par `bin/wiki-get.sh`. Un seul script de session, `cloture.py`, affiché en entier avec son lancement, traite chaque page séparément. Il arrête la page concernée sans rien produire si une ligne ou une phrase visée ne compte pas exactement une occurrence. Il vérifie aussi que les points d'insertion « dernière entrée » le sont bien, que la liste des Limites passe de 78 à 80 entrées, et que l'ajout aux Choix compte quinze lignes. Les cinq pages sont passées sans arrêt.

Dans les diffs ci-dessous, les lignes longues sont abrégées par `[…]`. Elles reprennent mot pour mot les textes de la consigne, et `bin/wiki-verify.sh` atteste que le texte en ligne est celui envoyé.

Révisions et liens, relevés par `prop=info|links|categories` avant et après :

| Page | Révision attendue | Révision lue | Révision après | Liens | Catégories |
|---|---|---|---|---|---|
| Lot 48 — Espaces de formation verrouillés (723) | 1812 | 1812 | 1816 | 1, identiques | Lot, identiques |
| Lot 24 — Adminsys autonome (535) | 1787 | 1787 | 1817 | 4, identiques | Lot, identiques |
| Limites connues du Système de Gestion de Données Techniques (144) | 1813 | 1813 | 1818 | 11, identiques | Page de suivi, identiques |
| Choix imposés par l'outil (718) | 1770 | 1770 | 1819 | 3, identiques | Page de suivi, identiques |
| Procédure d'ouverture d'un lot (542) | 1807 | 1807 | 1820 | 1, identiques | Page de suivi, identiques |

Aucune protection native sur les cinq pages. Pour chacune, `bin/wiki-verify.sh` a rendu **IDENTIQUE**.

## Étape 2 : lot 48

Résumé : `[Lot 48][Clôture] Lot clos, phrases contredites corrigées, points ouverts transmis au lot 24`

```
3c3
< |Work_package_status=ouvert
---
> |Work_package_status=clos
5a6,8
> |Work_package_delivery_date=2026-11-19
> |Work_package_closure_date=2026-11-19
> |Work_package_closure_report=https://github.com/Ecolibre/ecolibre-sgdt/blob/88ac283…/travaux/lots-48-49-pages.md,[…dix permaliens, sans espace…]
10c13   (C2)
< […] Seule l'application en production attend que la sauvegarde de précaution soit faite ; les essais sur le miroir n'en dépendent pas.
---
> […] L'application en production devait attendre la sauvegarde de précaution ; elle s'en est finalement passée le 19 novembre 2026, voir plus bas.
37c40   (C3)
< […] Le réglage s'éprouve d'abord sur le miroir.
---
> […] Le réglage a été posé directement en production le 19 novembre 2026, voir plus bas ; un résumé laissé vide reste vide.
44c47   (C4)
< […] Qu'il bloque aussi ces deux appels reste à éprouver sur le miroir.
---
> […] Mesuré en production le 19 novembre 2026 : il bloque aussi ces deux appels, qui ne rendent plus qu'un lien.
59a63   (C5, après la ligne P7 sur le message d'avertissement)
> * '''Le passage sans miroir reste une exception propre à ce lot.''' […]
79c83   (C6, section Points ouverts)
< * '''Ce que la migration doit emporter''' : […]
---
> Aucun. Ce que la migration doit emporter, et le critère de passage par le miroir, sont passés au lot 24 le 19 novembre 2026.
```

Faits après écriture (`_MDAT` à 20:56:34, donc relus après l'écriture) :
- `Work_package_status` vaut `clos` ;
- `Work_package_closure_date` vaut 2026-11-19, de même que `Work_package_delivery_date` ;
- `Work_package_closure_report` compte **10 valeurs**, chacune un permalien entier, sans espace en tête ;
- `Work_package_number` vaut 48, et `Work_package_summary` est inchangé.

## Étape 3 : lot 24

Résumé : `[Lot 48][Clôture] Migration et critère de passage par le miroir transmis au lot 24`

```
33a34,37
> Venu du lot 48 le 19 novembre 2026 : ce que la migration du serveur doit emporter. […M1…]
>
> Venu du lot 48 le 19 novembre 2026 : le critère de passage par le miroir. […M2…]
>
```

Résultat : le paragraphe « Trois réglages de… », une ligne vide, M1, une ligne vide, M2, une ligne vide, puis `== Dépendances ==`.

Faits après écriture (`_MDAT` à 20:56:37) : `Work_package_number` 24, `Work_package_status` ouvert. Ce sont les valeurs du wikitexte lu avant l'écriture ; les faits d'avant n'ont pas été relevés par `--facts` (voir les écarts).

## Étape 4 : Limites connues

Résumé : `[Lot 48][Clôture] Deux faits mesurés le 19 novembre 2026`

```
105c105,107
< # '''Page Forms ne sait pas masquer un bloc de modèle entier sans écrire un appel vide.''' […]
---
> # '''Page Forms ne sait pas masquer un bloc de modèle entier sans écrire un appel vide.''' […]
> # '''Ajouter un espace de noms à <code>$smwgNamespacesWithSemanticLinks</code> n'a pas demandé setupStore.php.''' […E79…]
> # '''Une recherche sans connexion limitée à un espace verrouillé cherche ailleurs, sans le dire.''' […E80…]
```

`diff` signale la ligne 105 comme modifiée uniquement parce que la page n'a pas de fin de ligne finale. Son texte est inchangé.

Entrées numérotées : 78 avant, **80** après, compté dans le script puis sur la page relue en ligne.

## Étape 5 : Choix imposés par l'outil

Résumé : `[Lot 48][Clôture] Trois choix imposés par l'outil consignés`

```
41a42,56
> # '''L'interdiction d'inclure les pages de formation.'''
> #* '''Le choix.''' […]   (4 sous-lignes)
> # '''Aucun fichier confidentiel dans les supports de formation.'''
> #* […]                   (4 sous-lignes)
> # '''La séparation des deux robots par les scripts.'''
> #* […]                   (4 sous-lignes)
```

Les quinze lignes sont insérées juste après la dernière ligne de la dernière entrée (« Coût d'une reprise… Le bouton et sa section multi-instance… »), avant la ligne vide et le `----`.

## Étape 6 : Procédure d'ouverture d'un lot

Résumé : `[Lot 48][Clôture] Phrase sur la longueur du message d'ouverture corrigée`

```
1c1
< […] Le message d'ouverture tient en trois lignes : il donne le numéro du lot et l'adresse de cette page, que l'assistant récupère lui-même. […]
---
> […] Le message d'ouverture est court : il donne le numéro du lot, l'adresse de cette page, que l'assistant récupère lui-même, et les avertissements qui doivent être connus avant sa lecture. […]
```

## Étape 7 : Gestion des lots

`bin/wiki-purge.sh "Gestion des lots"` : `purged: true`, `linkupdate: true`. Relu ensuite, le fait `Work_package_status` du lot 48 vaut `clos`. Je n'en tire aucune autre conclusion, et le rendu de l'index n'a pas été examiné.

## Ce que la vérification a révélé

- Les cinq écritures sont identiques au texte envoyé. Les liens internes et les catégories des cinq pages sont inchangés.
- Les faits demandés sont conformes, et `Work_package_closure_report` est bien découpé en dix valeurs.
- Contrôle complémentaire de CLAUDE.md sur les trois pages de suivi écrites (Limites, Choix, Procédure d'ouverture) : `smwbrowse` n'y montre que `_INST` (Page de suivi), `_MDAT` et `_SKEY`. Les exemples `<code>` des nouvelles entrées (`$smwgNamespacesWithSemanticLinks`, `#ask`, `list=search`, `srnamespace=500`, `$wgNonincludableNamespaces`) n'ont produit ni annotation ni lien parasite.
- `Catégorie:Erreurs de traitement SMW` : vide.
- Les révisions 1816 à 1820 se suivent : aucune écriture tierce n'est venue s'intercaler pendant la clôture.

## Relevé de `.claude/settings.local.json`

- Au début : absent.
- À la fin : absent. `.claude/` ne contient que `commands/` et `settings.json`.

## Questions posées et réponses rendues hors consigne

Aucune.

## Écarts et surprises

1. **Faits du lot 24 avant écriture.** Je ne les ai pas relevés par `--facts` avant l'écriture. La comparaison se fait donc avec le wikitexte lu juste avant, qui portait `Work_package_number=24` et `Work_package_status=ouvert`, et l'écriture ne touchait pas au modèle. C'est une comparaison plus faible que celle des faits.
2. **Écart à la règle sur `cd`.** Pour repérer les ancrages, j'ai lancé une commande qui commençait par `cd` dans le scratchpad et enchaînait plusieurs `grep`. CLAUDE.md demande un `cd` seul, dans une commande à part. L'environnement a ramené le répertoire courant à la racine du dépôt, et les appels `bin/` suivants ne sont pas touchés.
3. Rien d'autre à signaler. Le lot 48 est clos ; le lot 49, qui le suit, n'a pas été touché par cette clôture.
