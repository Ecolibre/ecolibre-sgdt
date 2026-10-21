# Cohérence de la section 1 et section 10 de la note d'installation de swowl

Session cloud (Claude Code sur le web), le 21 octobre 2026. Rien n'a été
écrit sur le wiki, et rien n'y a été lu. Étape 0 : `git fetch origin` n'a
rien rapatrié, et `git status -sb` montrait `## main...origin/main`, sur
`692bdd5`. Aucune fusion. Aucune question posée ni réponse rendue par le
canal direct. `.claude/settings.local.json` est absent, au début comme à la
fin.

## Section 1

Seule la seconde moitié de la phrase a changé. La première moitié, « Rien de
ce qu'il produit ne fait autorité tant que ce n'est pas revenu dans
`ontologie/` », reste vraie et n'a pas été touchée, comme le reste de la
section.

Avant :

> Rien de ce qu'il produit ne fait autorité tant que ce n'est pas revenu
> dans `ontologie/`, et aucun retour ne s'y fait sans le contrôle de
> non-perte de la section 7.

Après :

> Rien de ce qu'il produit ne fait autorité tant que ce n'est pas revenu
> dans `ontologie/`, et aujourd'hui, rien n'y revient : le contrôle de
> non-perte ne vaut que pour un chargement suivi d'un réexport sans
> modification, et aucun contrôle adapté à un fichier modifié n'existe
> encore. Le détail est en section 7.

Les trois passages qui parlent d'un retour vers `ontologie/`, en sections 1,
7 et 10, disent désormais tous que rien n'y revient. Mesure : recherche de
« retour », « revien » et « revenu » dans la note, qui ne trouve que ces
trois passages.

## Section 10

« Ce qui reste ouvert », ajoutée en fin de note, après la section 9, et
datée par une ligne « État au 21 octobre 2026. ». Elle contient les trois
points de la consigne, et rien de plus :

1. le contrôle de non-perte après modification ;
2. l'accès depuis le navigateur ;
3. les cinq défauts de swowl à signaler à son auteur.

Mise en forme : l'intitulé de chaque point est en gras, comme les pertes de
la section 8. Les cinq défauts forment une liste numérotée, dont les
numéros remplacent les mots « Un, », « Deux, »… de la consigne. Les noms de
fichier et d'option sont en code. Le texte est celui de la consigne.

## Ce qui résiste

Rien n'a empêché d'appliquer la consigne. Une remarque seulement : les
défauts 2 à 4 sont énoncés en termes généraux, alors que la section 8 n'en
documente chacun que sur un cas. Ce sont les 12 références d'OSE vers Q2U,
l'unique axiome qu'OSE pose sur une classe de Q2U, et une seule restriction
de Q2U. Je les ai recopiés tels quels ; à garder en tête au moment de les
signaler à l'auteur.
