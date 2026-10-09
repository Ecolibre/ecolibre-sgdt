# Lot 21, tâche 19 — Réécriture des entrées 59 et 65

Session du 9 octobre 2026, exécutée par Claude Code.

## Étape 0 — État du dépôt

`git status --short` : aucune ligne. Dépôt propre. Le dernier commit était `faca5c5 [Protocole] Forme d'un point…`, venu d'une autre session : il modifiait `methode-de-travail.md`, et j'ai travaillé sur cette version.

`travaux/lot-21-tache19-reecriture.md` : absent avant la tâche.

`.claude/settings.local.json`, au début comme à la fin de la tâche : `allow` et `deny` vides, aucune règle.

Ancres et repérages : chacun a trouvé une ligne et une seule (`grep -cF` = 1 pour les trois ancres du dépôt ; le script de remplacement s'arrêtait si un début de ligne trouvait zéro ou plusieurs lignes).

## Nombre d'entrées avant écriture

65 lignes `# `. L'entrée « Le type résolu… » est en ligne 84 du fichier (rang 59), l'entrée « Enrichir une énumération fermée… » en ligne 90 (rang 65, la dernière).

## Diff des Limites connues

Révision 1477 → 1480, en une seule écriture, résumé `[Lot 21][Tâche 19] Entrées 59 et 65 réécrites d'un bloc`. Les deux lignes ont été remplacées en entier par un script du scratchpad, qui les repère par leur début, exige une seule correspondance pour chacune et ne touche rien d'autre (`git diff --stat` : 2 insertions, 2 suppressions).

```diff
84c84
< # '''Le type résolu d'une propriété peut rester le type par défaut alors que sa page porte le bon type.''' […] (ancienne version, 2 567 caractères)
---
> # '''Le type résolu d'une propriété peut rester le type par défaut alors que sa page porte le bon type.''' […] (texte de la consigne, 1 896 caractères)
90c90
< # '''Enrichir une énumération fermée verrouille la propriété, et diffère le changement suivant de quelques jours.''' […] (ancienne version, 1 315 caractères)
---
> # '''Enrichir une énumération fermée modifie la déclaration de la propriété, et diffère le changement suivant.''' […] (texte de la consigne, 1 072 caractères)
```

Les anciennes versions sont recopiées en entier dans le rapport de la tâche 18 ; les nouvelles le sont en vérification b ci-dessous.

## Diff de CLAUDE.md

```diff
-  […] attendre et revérifier, sans rien réparer et sans changer de nom. Six gels sur sept […]
+  […] attendre et revérifier, sans rien réparer et sans changer de nom à la première constatation. Six gels sur sept […]
 
-  […] soit un délai de quelques heures à quatre jours selon les cas. Le gel du type résolu se résorbe de la même façon. **Conséquence réelle :** […]
+  […] soit un délai de quelques heures à quatre jours selon les cas. **Conséquence réelle :** […]
```

Rien d'autre ne change dans CLAUDE.md.

## Diff de methode-de-travail.md

```diff
-[…] Une règle de conduite tirée d'un petit nombre de cas se marque comme telle : repère, pas mesure.
+[…] Une règle de conduite tirée d'un petit nombre de cas se marque comme telle : repère, pas mesure. **Et au-delà de deux retouches sur la même entrée, elle se réécrit d'un bloc.** Créée le 6 octobre 2026 et corrigée deux fois, les 8 et 9 octobre, l'entrée 59 avait atteint 2 567 caractères contre 718 pour l'entrée médiane, citait quatre dates et portait quatre passages en gras : elle racontait l'historique de ses rédactions au lieu d'énoncer ce qui est su, et chaque couche contredisait un peu la précédente. Sa troisième correction, le 9 octobre, l'a réécrite d'un bloc. L'historique vit dans les rapports de `travaux/`, qui sont faits pour cela.
```

**Ce texte diffère de celui de la consigne, à la demande de Cyril, et d'une formulation qu'il m'a donnée.** La consigne écrivait « Corrigée quatre fois en cinq jours ». Cyril a mesuré que c'est faux (voir « Échanges avec Cyril hors consigne ») et m'a donné la forme exacte : « entrée créée le 6 octobre, corrigée trois fois, les 8 et 9 octobre ». Je ne l'ai pas recopiée telle quelle. Dans cette phrase, les 2 567 caractères désignent l'état *avant* la réécriture, c'est-à-dire après deux corrections seulement ; la troisième correction est la réécriture de cette tâche. J'ai donc écrit « corrigée deux fois, les 8 et 9 octobre » pour l'état décrit, et ajouté « Sa troisième correction, le 9 octobre, l'a réécrite d'un bloc. » Les faits sont ceux de la mesure de Cyril ; seul leur découpage change. À valider, voir la question A.

J'ai cherché les chaînes « quatre fois » et « cinq jours » dans `methode-de-travail.md`, `CLAUDE.md`, `pages/Limites_connues.txt` et `pages/Lot_21.txt`. Les deux copies locales sont identiques aux pages en ligne : vérifié par `wiki-verify.sh` pour la première, par une copie fraîche pour la seconde. Le chiffre faux n'apparaissait que dans `methode-de-travail.md`. Les autres occurrences sont sans rapport :
- page du lot, l. 51 : « mesurent quatre fois la même grandeur », « redéclarent quatre fois leur type » ;
- CLAUDE.md, l. 532 : « FILE FIGEE » quatre fois ;
- entrée 59 : « au-delà de cinq jours », qui est juste.

## Les six vérifications

### a. Celle qui tranche

```
IDENTIQUE : Limites connues du Système de Gestion de Données Techniques
verify exit 0
```

Faits SMW de la page : `_INST`, `_MDAT` et `_SKEY` seuls, aucune annotation parasite.

### b. Les deux entrées

J'ai relu la page après écriture : 65 lignes commencent par `# `.

Entrée 59 :

> # '''Le type résolu d'une propriété peut rester le type par défaut alors que sa page porte le bon type.''' Semantic MediaWiki ne lit pas le type sur la page de propriété au moment de stocker une valeur ou de compiler une requête : il emploie un type résolu, qui peut diverger du fait <code>_TYPE</code>. Une propriété ainsi gelée est résolue en <code>_wpg</code>, et les valeurs des pages qui l'emploient sont stockées en type Page sans la moindre erreur ; ni purge, ni réécriture de la page porteuse, ni vidage de la file de travaux ne les en sort. '''Le type résolu se lit sans rien écrire''', dans <code>query.printrequests[].typeid</code> d'un <code>action=ask</code> portant sur la propriété, pour l'entrée dont le libellé n'est pas vide ; l'entrée au libellé vide est la colonne du sujet et vaut toujours <code>_wpg</code>. Lire dans la même requête une propriété témoin au type connu : si le témoin ne rend pas son type, c'est la lecture qui est en cause. '''Règle : vérifier le type résolu avant de créer la moindre page employant une propriété neuve.''' Mesuré du 4 au 9 octobre 2026 (lot 21, tâches 6 à 18) : sur vingt-cinq propriétés créées, sept ont gelé, en deux épisodes seulement, une rafale de six et une création isolée ; ni la rafale ni l'isolement ne prédisent le gel. Six de ces sept gels se sont levés d'eux-mêmes en deux à quatre jours ; le septième n'était pas levé le 9 octobre 2026, après cinq. '''Conduite à tenir : ne pas abandonner un nom à la première constatation, attendre et revérifier ; passé une semaine, recréer la propriété sous un autre nom et consigner la date de l'abandon.''' Cette semaine est un repère de conduite, pas une mesure : aucun gel n'a été observé au-delà de cinq jours, dans un sens comme dans l'autre. Cause non établie ; une propagation de changement qui n'aboutit que très lentement est l'hypothèse (<code>demandes-adminsys.md</code> §2.2).

Entrée 65 :

> # '''Enrichir une énumération fermée modifie la déclaration de la propriété, et diffère le changement suivant.''' Ajouter une valeur à la liste <code>_PVAL</code> revient à modifier la déclaration : l'écriture passe si la page est libre, et la verrouille très probablement, ce qui est mesuré pour un changement de type (entrée 62) mais pas pour un ajout de valeur autorisée ; elle est refusée si la page est déjà verrouillée, et il faut alors attendre la levée du verrou, qui vient seule en quelques jours (entrée 62). Un ajout est donc différé, non impossible. Constaté le 6 octobre 2026 sur <code>Work_package_status</code>, dont les six valeurs sont « identifié », « cadré », « ouvert », « livré », « clos » et « abandonné » : il n'en existe aucune pour un lot suspendu par une dépendance externe, et trente-quatre lots dépendent de cette propriété. Le cas se représentera pour toute énumération fermée du modèle. '''Conséquence : grouper en une seule écriture toutes les valeurs à ajouter, et n'employer la prose sur la page concernée que pendant le délai de levée.'''

Mesures faites par un script du scratchpad (`mesure19.py`). Une date est comptée par jour et mois distincts ; les deux bornes d'un intervalle « du X au Y » comptent chacune. Médiane des 65 entrées : 718 caractères, avant comme après.

| | Longueur avant | Longueur après | Rang (sur 65) avant → après | Dates distinctes avant → après | Passages en gras avant → après |
|---|---|---|---|---|---|
| Entrée 59 | 2 567 | 1 896 | 2 → 5 | 5 (4, 5, 6, 8, 9 oct.) → 2 (4, 9 oct.) | 4 → 4 |
| Entrée 65 | 1 315 | 1 072 | 10 → 16 | 2 (6, 8 oct.) → 1 (6 oct.) | 2 → 2 |

Récit des rédactions antérieures : il n'en reste aucun dans l'une ou l'autre. Les phrases « contrairement à ce que cette entrée affirmait jusqu'au 8 octobre 2026 » (59) et « La rédaction du 6 octobre 2026, qui tenait l'ajout pour impossible… » (65) ont disparu.

Titre démenti par le corps :
- **Entrée 59 :** non. Son titre (« peut rester ») est modal et le corps le confirme.
- **Entrée 65 :** c'est nettement moins net qu'avant, mais il reste une nuance. Le titre affirme sans réserve que l'ajout « diffère le changement suivant », alors que ce report découle du verrou, que le corps donne pour « très probablement » posé et non mesuré pour ce cas. Si l'ajout ne verrouille pas, le changement suivant n'est pas différé. La « Conséquence » (« grouper en une seule écriture ») reste une prudence valable dans les deux cas.

### c. Renvois entrants

J'ai relevé toute mention « entrée 59 » ou « entrée 65 », formes abrégées comprises, sur les *Limites connues*, sur *Lot 21 — Grandeurs et unités* (copie fraîche, identique à `pages/Lot_21.txt`), dans CLAUDE.md et dans `methode-de-travail.md`.

- *Limites connues* : aucune autre entrée ne cite 59 ni 65.
- Page du lot, l. 59 : « une énumération fermée est ce qu'il y a de plus coûteux à enrichir une fois le verrou posé (entrée 65) ». Concorde : le nouveau texte dit qu'un ajout est refusé sur une page verrouillée et attend la levée.
- Page du lot, l. 140 : « Six de ces sept gels se sont levés d'eux-mêmes en deux à quatre jours ; le septième n'était pas levé le 9 octobre 2026, après cinq (entrée 59 des Limites connues) ». Concorde mot pour mot avec l'entrée.
- CLAUDE.md, l. 283 : même phrase, suivie de « Passé une semaine, recréer la propriété sous un autre nom ». Concorde avec la « Conduite à tenir » de l'entrée.
- `methode-de-travail.md`, l. 183 : décrit l'état de l'entrée 59 *avant* la réécriture (2 567 caractères, quatre passages en gras). Le passé employé rend la phrase juste. En revanche, l'entrée réécrite porte **toujours quatre passages en gras** : la réécriture n'a pas changé ce compte, que la phrase cite comme un symptôme (voir Écarts, point 2).

Aucun renvoi devenu faux.

### d. Cohérence de CLAUDE.md

J'ai relu la règle « Barrière » en entier (l. 281 à 289).

- **Aucune contradiction.** « sans changer de nom à la première constatation » et « Passé une semaine, recréer la propriété sous un autre nom » s'accordent désormais. « Ce n'est ni une perte, ni une raison de changer de nom », au quatrième paragraphe, ne suit plus une phrase sur le gel : elle ne vise plus que la déclaration retardée par le verrou.
- **Aucune affirmation au présent général sur la durée d'un gel.** La seule phrase sur cette durée est datée et comptée : « Six gels sur sept… le 9 octobre 2026, après cinq ».
- **Aucun chiffre en double pour la même grandeur.**
  - « quatre jours » figure deux fois, pour deux grandeurs distinctes : la levée des gels et celle des verrous.
  - Le compte des gels figure deux fois, et concorde : « six gels sur sept » et « sept gelées ».
  - « Six » figure deux fois, pour deux choses distinctes : les six propriétés gelées le 4 octobre, et les six gels levés. Ce n'est pas la même grandeur, mais la lecture peut buter dessus.

### e. Propriétés intactes

Lecture faite connecté, sans aucun avertissement de session expirée :

```
{"title":"Attribut:Nominal diameter","lastrevid":342,"edit":true}
{"title":"Attribut:Secondary diameter","lastrevid":343,"edit":true}
{"title":"Attribut:Power rating","lastrevid":803,"edit":true}
{"title":"Attribut:Max thickness","lastrevid":804,"edit":true}
{"title":"Attribut:Work package status","lastrevid":1161,"edit":true}
```

Les révisions attendues sont présentes, et aucune propriété n'est verrouillée.

### f. Erreurs

- `action=ask` sur `[[_ERRC::+]]` : **1** résultat (`meta.count` = 1). Le sujet est `Utilisateur:Cywil/Bac à sable/Lot21c pompe#saisie-douteux`.
- Rendu en ligne, `{{#ask:[[_ERRC::+]]|format=count}}` par `action=parse` : **1**.

Le compte est inchangé.

## Écarts et surprises

1. **« Corrigée quatre fois en cinq jours » était faux**, comme Cyril l'a mesuré : l'entrée a été créée le 6 octobre, puis corrigée trois fois, les 8 et 9 octobre, cette réécriture comprise. J'avais recopié le chiffre de la consigne sans le vérifier. J'ai commencé à le contrôler après coup, par une méthode que Cyril a jugée fausse (voir « Échanges avec Cyril hors consigne ») ; le chiffre a été corrigé dans `methode-de-travail.md`, seul endroit où il figurait.
2. **L'entrée 59 réécrite porte toujours quatre passages en gras**, le compte même que `methode-de-travail.md` cite comme symptôme de l'ancienne rédaction. Le texte vient de la consigne. Elle reste aussi la cinquième plus longue des 65 entrées : 1 896 caractères, 2,6 fois la médiane.
3. **« Citait quatre dates » dépend de la façon de compter.** Comptées par jour distinct, bornes d'intervalle comprises, l'ancienne entrée en citait cinq (4, 5, 6, 8 et 9 octobre). On n'en trouve quatre qu'en écartant le 6 octobre, qui n'apparaît que comme borne d'un intervalle (« du 4 au 6 octobre »). Je n'ai pas modifié ce chiffre dans `methode-de-travail.md`.
4. **Une autre session travaille en parallèle sur le même dépôt et sur le wiki.** Il y a eu un commit `[Protocole]` (`faca5c5`) avant le début de la tâche, puis la révision 1479 (`[Correctif] Forme d'un point : renvoi à methode-de-travail.md`, sur *Procédure de clôture d'un lot*, à 11 h 15 UTC) juste avant mon écriture. La 1478 est la mienne, sur la page du lot, en tâche 18. Aucune collision : `git status` était propre, et `wiki-verify.sh` rend IDENTIQUE.

## Échanges avec Cyril hors consigne

1. **Script refusé.** J'ai écrit `historique19.sh` pour savoir quelles révisions d'octobre avaient touché l'entrée 59, et je l'ai soumis sans en montrer le contenu dans le message. Cyril l'a refusé : il ne valide pas un script dont il n'a pas vu le contenu. J'ai affiché le script ; il ne faisait que lire (`bin/wiki-api.sh "action=compare…"`, redirection vers le scratchpad, `grep -c`).

   La règle « afficher le contenu d'un script du scratchpad avant de l'exécuter » existait déjà dans CLAUDE.md, et je ne l'ai pas appliquée. Je ne l'ai pas appliquée non plus à `remplace19.py` ni à `mesure19.py`, dans cette même tâche : leur contenu n'était visible que dans l'appel d'écriture, pas dans le message de lancement. Consigne de Cyril pour la suite de la session : montrer le contenu dans le message ; si le script ne fait que lire, le dire et citer ses commandes.

2. **Mesure de Cyril sur l'historique de l'entrée 59.** Il a comparé la ligne elle-même dans le texte complet de chaque révision d'octobre :
   - créée en 1458 (6 octobre, tâche 13) ;
   - modifiée en 1471 (8 octobre, tâche 15), 1477 (9 octobre, tâche 18) et 1480 (9 octobre, tâche 19) ;
   - inchangée dans toutes les autres révisions d'octobre.

   Aucune révision ne l'a touchée sans la nommer dans son résumé. Consigne qui en découle : corriger le chiffre partout, en cherchant « quatre fois » et « cinq jours ».

3. **Pourquoi ma méthode aurait donné un résultat faux, d'après Cyril.**
   - `action=compare` renvoie des lignes de contexte autour des changements : un `grep` sur la phrase d'ouverture de l'entrée, restée inchangée, trouvait l'entrée dans des diffs qui ne la touchaient pas.
   - `grep -c` compte des lignes, et la réponse JSON tient sur une seule ligne : le compte ne pouvait valoir que 0 ou 1.

   Méthode juste : récupérer le texte des révisions par `prop=revisions&rvprop=content` et comparer la ligne elle-même. Je n'ai pas relancé le script, et je n'ai pas refait la mesure.

## Questions

**A.** Cyril m'a donné la formulation « créée le 6 octobre, corrigée trois fois, les 8 et 9 octobre ». Dans la phrase de `methode-de-travail.md`, qui décrit l'état à 2 567 caractères, j'ai écrit « corrigée deux fois, les 8 et 9 octobre », puis j'ai ajouté une phrase pour la troisième correction : cet état précédait la réécriture, qui est elle-même la troisième correction. Cette division te convient-elle, ou préfères-tu ta formulation telle quelle ? Ma suggestion : la garder, puisque recopier « trois fois » rattacherait les 2 567 caractères à un état que l'entrée n'a jamais eu.

**B.** L'entrée 59 réécrite garde quatre passages en gras, le chiffre même que `methode-de-travail.md` cite comme symptôme. Le titre de l'entrée 65 affirme encore sans réserve que l'ajout « diffère le changement suivant ». Faut-il y revenir ? Ma suggestion : non, pas avant qu'une mesure nouvelle l'impose. Chaque retouche relance le cycle que la règle nouvelle veut arrêter. Il suffirait de noter les deux points pour la prochaine réécriture.
