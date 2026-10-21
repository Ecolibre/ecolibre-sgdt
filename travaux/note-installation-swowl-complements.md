# Compléments à la note d'installation de swowl

Session cloud (Claude Code sur le web), le 21 octobre 2026. Rien n'a été
écrit sur le wiki, et rien n'y a été lu.

## Déroulement et canal direct

La première exécution s'est interrompue juste après les deux commandes de
l'étape 0. Cyril a alors écrit « Réessayez ». J'ai repris la consigne en
refaisant l'étape 0 : `git fetch origin` n'a rien rapatrié, et
`git status -sb` montrait `## main...origin/main`, sur `4401bf1`. Aucune
fusion. Aucune autre question posée, ni réponse rendue.

## Ce que j'ai ajouté, et où

- `ontologie/swowl-compte.py` : le script de l'étape 1, au caractère près.
- Introduction : l'annonce des deux manques est supprimée.
- Section 4 : les deux commandes `apt` et la phrase sur `python3-venv`, en
  tête de la sous-section, renommée « Paquets et version de Python ». Après
  le clone, le paragraphe sur le commit `8a1cb11`.
- Section 5 : le constat sur l'accès depuis un navigateur Windows, après
  l'adresse à ouvrir.
- Section 7, dans l'ordre de la consigne : `mkdir -p ~/swowl-data`, les deux
  blocs d'import (écriture du corps de la requête puis `curl`, avec le
  programme Python ajouté au bout), l'explication sur la réponse de l'API,
  le réexport, le comptage par `swowl-compte.py` avec les quatre fichiers
  dans l'ordre prescrit, puis le `grep`. L'avertissement ferme la section,
  dans un encadré dont le titre est en gras.
- Section 8 : entièrement remplacée par le détail des quatre pertes, des
  unions orphelines et de la cause.
- Section 9 : la méthode en six étapes.

## Ce que je n'ai pas appliqué tel quel

1. **Accents.** L'avertissement, la section 8 et les trois compléments de
   l'étape 5 étaient écrits sans accents. Je les ai rétablis sans changer
   un mot : la note est accentuée partout ailleurs, et deux accents changent
   le sens (« ou regarder » pour « où regarder », « la ou » pour « là où »).
   Le script et le message de commit sont repris exactement, sans accents.
2. **`mkdir -p ~/swowl-data`** était déjà en section 5. Je l'ai déplacé en
   tête de la section 7, comme le veut la consigne, plutôt que de le doubler.
3. **Section 8, mise en forme.** Les identifiants, les adresses, les chemins
   et l'axiome sont en code, et l'intitulé de chaque perte est en gras. J'ai
   ajouté une phrase de provenance, « Elles viennent des mesures du
   21 octobre 2026 », puisque le renvoi au rapport source disparaît.
4. **Section 7.** La sortie du programme Python d'une ligne n'est pas
   reproduite en entier : l'ordre des clés suit la réponse de swowl, que je
   n'ai pas mesurée. La note n'en donne qu'un exemple, `'classes': 18`. Ma
   phrase de fin de section, « aucun retour… sans ce contrôle », est
   remplacée par un renvoi à la section 8, suivi de l'avertissement.
5. **Section 9.** J'ai mis en commandes les étapes qui en ont une dans la
   note ou dans le rapport : l'environnement neuf (commandes de la reprise),
   l'installation sans épinglage (première tentative), le contrôle du module
   (celui de la section 4, qui affiche `module charge`, au lieu du
   `python -c "import main"` muet de la consigne), et la réinstallation de
   `fastapi==0.154.0`. Trois points restent rédigés, faute de commande
   exacte possible :
   - « le paquet en cause » est ma lecture : la consigne ne dit pas lequel
     faire descendre de version ;
   - « en y mettant à jour la date du relevé et la version de Python » est
     aussi ma lecture : remettre l'en-tête inchangé le rendrait faux ;
   - le commit est sans commande, faute de message donné.
6. **Non modifié.** La section 1 dit toujours « aucun retour ne s'y fait
   sans le contrôle de non-perte de la section 7 ». C'est toujours vrai, mais
   moins fort que l'avertissement, qui suspend tout retour. La consigne ne
   demandait pas d'y toucher.

## Vérifications

- `swowl-compte.py` a tourné sur les deux fichiers sources du dépôt, dans un
  environnement jetable hors du dépôt (Python 3.13.16, rdflib 7.6.0). Il
  rend 598, 18, 12, 4, 29, 91 pour Q2U et 1470, 75, 138, 10, 164, 5 pour
  OSE, exactement les lignes « source » de la note. Les lignes « réexport »
  ne se mesurent pas ici : swowl n'a été ni installé ni lancé dans cette
  session.
- Le programme d'une ligne, essayé sur un JSON d'exemple, n'affiche que la
  longueur des listes nommées.
- La note relue en entier ne renvoie plus à aucune pièce absente. Une
  recherche de `manque`, `compte.py` et `<les quatre fichiers>` ne trouve
  plus que le nouveau script et la phrase « la restriction qui manque au
  compte » de la section 8.
- `.claude/settings.local.json` est absent, au début comme à la fin.
