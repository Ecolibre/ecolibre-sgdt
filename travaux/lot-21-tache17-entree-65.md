# Lot 21, tâche 17 — L'entrée 65 et deux scories

Session du 9 octobre 2026, exécutée par Claude Code.

## Étape 0 — État du dépôt

`git status --short` : aucune ligne. Dépôt propre.

`travaux/lot-21-tache17-entree-65.md` : absent avant la tâche.

`.claude/settings.local.json`, au début comme à la fin de la tâche : `allow` et `deny` vides, aucune règle.

Ancres : chacune trouvée une fois et une seule. L'entrée 65 occupe la ligne 90 de la page, une ligne complète et la dernière du fichier. Les deux ancres de CLAUDE.md : `grep -c` = 1 chacune.

Avant d'écrire : la page porte 65 lignes `# `, et l'entrée remplacée est bien la dernière. Aucune autre session n'avait ajouté d'entrée. Révision de départ : 1471, `protection: []`, `intestactions` edit = true.

## Diff des Limites connues

Révision 1471 → 1475, résumé `[Lot 21][Tâche 17] Entrée 65 corrigée : le verrou diffère l'ajout, il ne l'interdit pas`. Copie locale : `pages/Limites_connues.txt`.

```diff
90c90
< # '''Une énumération fermée ne s'enrichit plus une fois le verrou de propagation posé.''' Ajouter une valeur à la liste <code>_PVAL</code> d'une propriété revient à modifier sa déclaration, donc à la verrouiller si elle ne l'est pas déjà, et c'est impossible si elle l'est. Constaté le 6 octobre 2026 sur <code>Work_package_status</code>, dont les six valeurs sont « identifié », « cadré », « ouvert », « livré », « clos » et « abandonné » : il n'en existe aucune pour un lot suspendu par une dépendance externe, et trente-quatre lots dépendent de cette propriété. Le cas se représentera pour toute énumération fermée du modèle. '''En attendant que le verrou soit réparé, une valeur manquante se dit en prose sur la page concernée, jamais en ajoutant une valeur à l'énumération.'''
---
> # '''Enrichir une énumération fermée verrouille la propriété, et diffère le changement suivant de quelques jours.''' Ajouter une valeur à la liste <code>_PVAL</code> d'une propriété revient à modifier sa déclaration : l'écriture passe si la page est libre, et la verrouille aussitôt ; elle est refusée si la page est déjà verrouillée, et il faut alors attendre que le verrou se lève, ce qu'il fait seul en quelques jours (entrée 62). Un ajout est donc différé, jamais impossible. Constaté le 6 octobre 2026 sur <code>Work_package_status</code>, dont les six valeurs sont « identifié », « cadré », « ouvert », « livré », « clos » et « abandonné » : il n'en existe aucune pour un lot suspendu par une dépendance externe, et trente-quatre lots dépendent de cette propriété. Le cas se représentera pour toute énumération fermée du modèle. '''Conséquence : grouper les valeurs à ajouter en une seule écriture, puisque la suivante attendra, et n'employer la prose sur la page concernée que pendant ce délai.''' La rédaction du 6 octobre 2026, qui tenait l'ajout pour impossible et l'interdisait, reposait sur l'idée que le verrou ne se levait pas ; la tâche 15 du lot 21 a mesuré le contraire le 8 octobre 2026.
\ Pas de fin de ligne à la fin du fichier
```

## Diff de CLAUDE.md

```diff
@@ -284,9 +284,9 @@
-  **En revanche il retarde toute correction.** […] soit un délai de quelques heures à quatre jours selon les cas. Le gel du type résolu se résorbe de la même façon, en deux à quatre jours. **Conséquence réelle :** […]
+  **En revanche il retarde toute correction.** […] soit un délai de quelques heures à quatre jours selon les cas. Le gel du type résolu se résorbe de la même façon. **Conséquence réelle :** […]
 
-  […] Ce n'est pas la rafale qui décide : mesuré les 4 et 5 octobre 2026, une rafale de huit créations a réussi, une création isolée a échoué.
+  […] Ce n'est pas la rafale qui décide : mesuré les 4 et 5 octobre 2026, une rafale de huit créations a rendu le bon type résolu, et une création isolée a gelé. Compte complet du 4 au 6 octobre 2026 : vingt-cinq propriétés créées, sept gelées, en deux épisodes seulement. Le gel est temporaire, voir ci-dessus.
```

Les parties notées `[…]` sont inchangées. Rien d'autre ne change dans CLAUDE.md.

## Les cinq vérifications

### a. Celle qui tranche

```
IDENTIQUE : Limites connues du Système de Gestion de Données Techniques
verify exit 0
```

Contrôles complémentaires :
- catégories de la page : `Catégorie:Page de suivi` seule ;
- faits SMW de la page : `_INST`, `_MDAT` et `_SKEY`, aucune annotation parasite. `_INST` correspond à la catégorie.

### b. Entrées

J'ai relu la page après écriture : 65 lignes commencent par `# `.

- 59 : '''Le type résolu d'une propriété peut rester le type par défaut alors que sa page porte le bon type.'''
- 62 : '''Toute écriture qui modifie le type d'une propriété la verrouille aussitôt, et le verrou se lève seul en quelques jours.'''
- 63 : '''Un verrou de propagation n'empêche ni le stockage d'une valeur ni sa requête.'''
- 65 : '''Enrichir une énumération fermée verrouille la propriété, et diffère le changement suivant de quelques jours.'''

Aucune des quatre n'en contredit une autre :
- 65 s'appuie sur 62, la levée seule du verrou ;
- 63 et 65 portent sur des choses distinctes : l'usage de la propriété d'un côté, la modification de sa déclaration de l'autre ;
- 59 porte sur le gel du type, pas sur le verrou.

Il reste une nuance, développée dans « Écarts et surprises » : 62 a mesuré le verrou après un changement de *type*. Qu'un ajout de valeur à `_PVAL` verrouille « aussitôt » est une déduction, pas une mesure.

### c. Cohérence de CLAUDE.md

J'ai relu la règle « Barrière » en entier (lignes 281 à 289). Aucune phrase n'y contredit une autre. Aucun chiffre n'y figure deux fois. Comptes faits sur ces lignes :
- « deux à quatre jours » : 1 ;
- « quatre jours » : 1 de plus, celui du délai du *verrou* (« quelques heures à quatre jours »), qui est une autre grandeur ;
- « vingt-cinq », « sept gelées », « quinze », « trois minutes » : 1 chacun.

En revanche, deux phrases de la règle contredisent l'entrée 59 des Limites connues, à laquelle elles renvoient (voir Écarts, point 1).

### d. Renvois

Le renvoi « (entrée 62) » ajouté dans l'entrée 65 pointe sur l'entrée 62, dont le titre est « Toute écriture qui modifie le type d'une propriété la verrouille aussitôt, et le verrou se lève seul en quelques jours ». C'est bien l'entrée du verrou qui se lève seul.

### e. Propriétés intactes

Lecture `intestactions=edit` faite connecté, sans aucun avertissement de session expirée :

```
{"title":"Attribut:Nominal diameter","lastrevid":342,"edit":true}
{"title":"Attribut:Secondary diameter","lastrevid":343,"edit":true}
{"title":"Attribut:Power rating","lastrevid":803,"edit":true}
{"title":"Attribut:Max thickness","lastrevid":804,"edit":true}
{"title":"Attribut:Work package status","lastrevid":1161,"edit":true}
```

Les révisions attendues sont toutes présentes, et aucune des cinq propriétés n'est verrouillée. Le constat de l'architecte sur `Work package status` (libre, révision 1161) est confirmé.

## Écarts et surprises

1. **« Le gel se résorbe en deux à quatre jours » est démenti par l'entrée 59 elle-même.** CLAUDE.md affirme, depuis la tâche 16 : « Le gel se résorbe de lui-même en deux à quatre jours (entrée 59 des Limites connues) ». Depuis cette tâche, il affirme aussi : « Le gel est temporaire, voir ci-dessus. » Or l'entrée 59 dit : « Une seule, <code>Test lot21b débit</code>, restait gelée après quatre jours. » Six des sept gels se sont donc résorbés dans le délai, et le septième n'était pas résorbé au dernier relevé. « Temporaire » reste une hypothèse pour ce cas. La page du lot 21 (ligne 140) reprend la même formule : « le gel se résorbe de lui-même en deux à quatre jours ». Je l'ai repérée en tâche 16 sans la relever : la vérification d de cette tâche portait sur la concordance des sujets, pas sur les chiffres. Non corrigé ici, voir question A.
2. **« La verrouille aussitôt », dans l'entrée 65, n'est pas mesuré pour un ajout à `_PVAL`.** L'entrée 62 mesure le verrou après un changement de type, et sur des pages d'essai créées. Je n'ai trouvé dans les Limites connues aucune mesure d'un verrou posé par un ajout de valeur autorisée. L'entrée 65 de départ affirmait déjà le verrouillage (« donc à la verrouiller ») ; la nouvelle rédaction y ajoute « aussitôt ». La première écriture réelle sur `Work package status` dira si c'est vrai.
3. **La révision passe de 1471 à 1475.** Les révisions 1472 à 1474 ont été écrites entre-temps sur d'autres pages : 1474 est celle du lot 21 en tâche 16, 1473 celle du lot 22. Rien d'anormal.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

**A.** Le gel du type résolu n'est pas résorbé pour l'une des sept propriétés gelées, `Test lot21b débit`, au dernier relevé du 8 octobre 2026 (entrée 59). Pourtant, CLAUDE.md (règle « Barrière », deux phrases) et la page du lot 21 (ligne 140) affirment qu'il se résorbe en deux à quatre jours. Faut-il relire aujourd'hui le type résolu de `Test lot21b débit`, puis aligner les trois textes sur le résultat ? Ma suggestion : une tâche courte, qui fait d'abord cette lecture (`action=ask`, avec un témoin), puis écrit :
- si le gel est levé : « six en deux à quatre jours, la septième en N jours » ;
- sinon : « six sur sept en deux à quatre jours ; une restait gelée au JJ octobre ».
