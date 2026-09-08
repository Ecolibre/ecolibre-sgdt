# Lot 28 — Clôture 1 : quatre faits mesurés dans les Limites connues

## Révision et taille

| | Révision | Taille | Entrées « # » |
|---|---|---|---|
| Avant | 1290 | 40787 octets | 47 |
| Après (4 ajouts) | 1313 | 42798 octets | 51 |

## Résultat de chaque ajout (bin/wiki-append.sh)

| Ajout | Résumé | Résultat | Avertissement |
|---|---|---|---|
| 1 — Lockdown | `[Lot 28][Clôture 1] Limites connues — Lockdown ne protège pas` | Pré-contrôle OK (47 entrées), écriture Success (revid 1290 → 1310), post-contrôle OK (47→48), rendu OK (1 bloc `<ol>`) | Aucun |
| 2 — extensions à l'envoi | `[Lot 28][Clôture 1] Limites connues — extensions acceptées à l'envoi` | Pré-contrôle OK (48 entrées), écriture Success (1310 → 1311), post-contrôle OK (48→49), rendu OK (1 bloc `<ol>`) | Aucun |
| 3 — Specimen status botanique | `[Lot 28][Clôture 1] Limites connues — pas d'état de cycle de vie pour un outil` | Pré-contrôle OK (49 entrées), écriture Success (1311 → 1312), post-contrôle OK (49→50), rendu OK (1 bloc `<ol>`) | Aucun |
| 4 — recoupement unilatéral | `[Lot 28][Clôture 1] Limites connues — le recoupement est unilatéral` | Pré-contrôle OK (50 entrées), écriture Success (1312 → 1313), post-contrôle OK (50→51), rendu OK (1 bloc `<ol>`) | Aucun |

Les quatre ajouts sont passés sans le moindre avertissement.

## Résultat des cinq vérifications

1. **Compte des entrées « # »** après les quatre ajouts : **51**. Conforme.

2. **Les quatre nouvelles entrées sont-elles les quatre dernières, dans
   l'ordre, et le commentaire de garde est-il toujours la dernière chose de
   la page ?**

   Premiers mots des entrées 48 à 51, dans l'ordre :
   - 48 : « '''Lockdown ne protège »
   - 49 : « '''Le wiki n'accepte »
   - 50 : « '''La seule énumération »
   - 51 : « '''Le recoupement entre »

   Ce sont bien les quatre dernières entrées de la page, dans l'ordre des
   ajouts.

   **Mais le commentaire de garde n'est plus la dernière chose de la
   page.** Sa première ligne (« <!-- Cette liste doit rester la dernière
   chose de la page. ») se trouve toujours dans le wikitexte, mais entre
   l'entrée 47 (dernière entrée d'origine) et l'entrée 48 (premier ajout de
   cette tâche) — pas après l'entrée 51. `bin/wiki-append.sh` ajoute en fin
   de PAGE : le premier appel a donc placé l'entrée 48 après le
   commentaire, qui devient alors la dernière chose écrite avant elle ; les
   trois appels suivants se sont enchaînés après l'entrée 48, 49, 50, sans
   jamais repasser par le commentaire. Résultat : le commentaire est
   maintenant coincé au milieu de la liste, entre les entrées 47 et 48, et
   plus aucun commentaire ne signale la fin réelle de la liste après
   l'entrée 51.

   Voir « Écarts et surprises ».

3. **Taille après écriture** (`prop=revisions&rvprop=size`) : **42798
   octets**, revid 1313. Conforme, sans écart.

4. **Rendu** (`action=parse&prop=text`) : un seul bloc `<ol>` sur toute la
   page, portant exactement **51** `<li>`. Conforme — malgré le
   déplacement constaté au point 2, le rendu reste une liste unique et
   continue : MediaWiki élide entièrement un commentaire HTML qui occupe
   sa propre ligne, sans laisser de ligne vide, ce qui explique que la
   liste ne soit pas coupée en deux malgré la position désormais médiane du
   commentaire.

5. **Faits `_ERRC` sur le wiki** (`action=ask&query=[[_ERRC::+]]`) : zéro
   résultat. Conforme.

## Écarts et surprises

Le point 2 de la consigne affirmait : « le commentaire HTML de garde doit
toujours être la dernière chose de la page ». **C'est faux à la mesure.**
Après les quatre ajouts, le commentaire de garde se trouve entre l'entrée 47
et l'entrée 48 — au milieu de la liste, pas à sa fin. C'est une conséquence
directe et documentée du fonctionnement de `bin/wiki-append.sh`, qui ajoute
toujours en fin de PAGE (via `appendtext`) : le premier des quatre ajouts de
cette tâche a mécaniquement fait passer l'ajout après le commentaire, qui
occupait jusque-là la dernière position ; les trois ajouts suivants se sont
enchaînés après le premier, sans jamais revenir sur le commentaire.

Cela n'a corrompu ni le wikitexte ni le rendu — le rendu reste une liste
unique de 51 éléments, comme le point 4 le confirme, parce qu'un commentaire
HTML occupant sa propre ligne est intégralement supprimé par MediaWiki avant
la mise en liste, sans laisser de ligne vide. Mais le commentaire ne joue
plus son rôle de garde-fou pour la suite : plus rien, à la fin réelle de la
page (après l'entrée 51), n'avertit qu'il ne faut pas ajouter une section
« == … == » après la liste. Un cinquième ajout par `bin/wiki-append.sh`
fonctionnerait néanmoins sans problème, puisque le script vérifie la
dernière ligne de contenu réelle (l'entrée 51, qui commence par « # »), pas
la présence ou la position du commentaire.

Ce déplacement n'a pas été corrigé dans cette tâche : la consigne restreint
l'intervention à `bin/wiki-append.sh` seul, qui ne sait pas replacer un
commentaire. Une remise en ordre du commentaire — le recoller après l'entrée
51 — resterait une réécriture complète par `bin/wiki-put.sh`, hors du
périmètre de cette clôture.

Aucun autre écart : les révisions, tailles et comptes annoncés dans le
contexte se sont tous vérifiés tels quels.
