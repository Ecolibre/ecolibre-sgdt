# Clôture du test double renommage — 27 août 2026

Fait suite à `travaux/double-renommage.md`. Toutes les mesures qui suivent
sont en lecture seule ; aucune écriture n'a eu lieu sur le wiki dans cette
session, hors la relecture demandée au point 1.

## 1. Relecture sur état stabilisé

`bin/wiki-wait-jobs.sh 60 10` (jusqu'à 10 minutes, intervalle 10 s) :

```
essai 1 : jobs=0
FILE VIDE
```

La file s'est révélée vide dès le premier essai — elle avait donc fini de
se vider entre la clôture du test initial et cette relecture, sans qu'il
ait fallu attendre les dix minutes prévues.

Mesures reprises, file vide confirmée :

- `browsebysubject` sur *Dbl item* :
  `Located_at -> ['Cywil/Bac_à_sable/Dbl_cible_c#2##']`
  — **identique** au relevé pris file non vidée (6 puis 9 travaux en
  attente). Le littéral n'a pas changé.
- `list=querypage&qppage=DoubleRedirects` :
  `Utilisateur:Cywil/Bac à sable/Dbl cible` → `Dbl cible b` → `Dbl cible c`
  — **identique** également, la chaîne est toujours signalée telle quelle.

**Le résultat le plus important du test est donc confirmé, pas modifié** :
prendre la mesure avec la file non vidée n'a pas produit de faux résultat
ici. Ça ne dit rien sur le cas général — seulement que sur ce test précis,
la file figée à 6 puis 9 travaux ne portait pas de travail affectant cette
page ou cette page spéciale.

## 2. Le hash de requête partagé — noté, non résolu

Sur les douze appels `ask` du test (état de référence, Q1–Q3 du premier
renommage, Q1–Q3 du second), les douze réponses portent le **même hash de
requête** : `17490d7db8053317836080b5e56d984a` — y compris entre des
requêtes portant sur trois noms différents (origine, intermédiaire,
final), avant et après les deux renommages.

Deux explications tiennent, et rien dans les mesures prises ne les
départage :

- SMW canonise les trois noms vers la même entité cible avant de calculer
  le hash (cohérent avec le comportement observé côté stockage) ;
- un cache de requête renvoie une réponse déjà calculée sans recalculer.

Le 21 août 2026, un hash partagé (`8abf92b9a496fa12811f646f040f3025`)
revenait déjà sur toutes les requêtes `format=count` vides via
`action=ask` — un défaut déjà consigné dans *Limites connues* (entrée sur
`format=count`). Le hash constaté ici est différent, mais le motif est le
même : plusieurs requêtes distinctes en apparence rendent la même
empreinte.

**Conséquence à retenir pour la suite : le résultat qui fait foi est
`browsebysubject`, pas `ask`.** `ask` a produit ici des comptes corrects
(1 partout, ce qui correspondait à la réalité), mais le hash partagé
retire toute garantie que chaque appel ait été réellement recalculé plutôt
que servi depuis un cache. `browsebysubject` n'a pas ce défaut connu.

## 3. Proposition d'entrée — *Limites connues du SGDT*

Numérotation actuelle de la page : 31 entrées. Ce qui suit prendrait le
n° 32, à la suite de l'entrée n° 26 (« Une redirection est porteuse de
données SMW… », test à un seul renommage du 20-21 août 2026), à laquelle
elle renvoie.

**Non écrite sur le wiki — proposition seulement, à valider par Cyril.**

Texte proposé (syntaxe wiki, prêt à coller comme item de la liste
numérotée) :

<code><nowiki>
# '''Un lieu renommé deux fois de suite garde ses annotations — mais seulement tant que les DEUX redirections restent en place.''' Test à deux renommages en chaîne (A → B → C), en bac à sable, le 27 août 2026 : après un premier renommage (redirection laissée) puis un second sur la page intermédiaire (redirection laissée, la première non touchée), le littéral stocké pour une propriété de type Page annotant la page A (Located_at) porte le nom '''final''' C, pas le nom intermédiaire B — mesuré par browsebysubject, confirmé après vidage complet de la file de travaux. '''La condition n'est pas nouvelle, elle s'aggrave : l'entrée n° 26 a établi qu'ôter UNE redirection fait retomber le littéral stocké sur ce que porte le wikitexte du #set d'origine, qui n'a jamais changé.''' Une chaîne à deux maillons ajoute donc un second point de rupture indépendant du premier — retirer la redirection A→B ou la redirection B→C produit vraisemblablement deux résultats différents, aucun des deux mesurés ici. '''Chaque renommage successif d'un lieu ajoute un point de rupture, et rien n'affiche lequel des maillons est porteur de la donnée réellement lue.''' Special:DoubleRedirects voit la chaîne et la signale comme un défaut à corriger — un script de maintenance générique pourrait donc la « réparer » (en retargetant A directement vers C) sans qu'on l'ait demandé, ce qui laisserait intact le littéral déjà stocké mais changerait le mécanisme qui le maintient à jour au prochain renommage.
</nowiki></code>

Points laissés ouverts par ce test, à ne pas faire porter par l'entrée
proposée comme s'ils étaient mesurés :

- l'effet du retrait d'une seule redirection sur les deux (A→B ou B→C)
  dans une chaîne à deux maillons n'a pas été mesuré — seule l'entrée
  n° 26, à un seul maillon, l'a été ;
- la question ouverte au point 2 (hash de requête partagé sur `ask`) n'a
  pas sa place dans cette entrée : elle concerne l'API `ask` en général,
  pas spécifiquement les renommages en chaîne.

Je m'arrête là, comme demandé — proposition seulement.
