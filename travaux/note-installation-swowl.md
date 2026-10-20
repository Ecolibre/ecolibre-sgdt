# Note d'installation de swowl et renvoi depuis installation-nouveau-poste

Session cloud (Claude Code sur le web), le 21 octobre 2026 vers 0 h 40,
heure de Paris. Rien n'a été écrit sur le wiki, et rien n'y a été lu.

## Ce qui a été fait

1. Étape 0 : `git fetch origin` a rapatrié `65d0efd..89f6023`, et
   `git status -sb` montrait `## main...origin/main [behind 5]`. L'arbre
   était propre ; `git merge --ff-only origin/main` a avancé jusqu'à
   `89f6023`.
2. `ontologie/installation-swowl.md` est écrit, avec les neuf sections dans
   l'ordre de la consigne, précédées d'une courte introduction : le relevé
   de référence, le dépôt supposé cloné dans `~/ecolibre-sgdt`, et
   l'annonce des deux manques.
3. Le renvoi est une nouvelle section, `## swowl, éditeur de l'ontologie`,
   lignes 242 à 246 de `installation-nouveau-poste.md`, suivie de son
   propre `---`, ligne 248. Elle se place entre le `---` qui clôt la
   section 5, ligne 240, et `## Machine qui ne t'appartient pas`, désormais
   ligne 250. `git diff --numstat` : 8 lignes ajoutées, aucune supprimée.
4. `.claude/settings.local.json` est absent, au début comme à la fin.

Aucune question posée ni réponse rendue par le canal direct.

## D'où vient chaque élément

| Section de la note | Du rapport source | De la consigne |
|---|---|---|
| Introduction | date, poste, WSL2, Python 3.14.4, commit `8a1cb11`, chemin du dépôt | — |
| 1. Ce qu'est swowl | — | tout |
| 2. Sécurité | — | tout |
| 3. Windows | — | tout : `wsl --install`, redémarrage, utilisateur, les deux pièges |
| 4. Installation | clone, venv, mise à jour de pip, `pip install -r`, contrôle du module et son erreur, « on ne modifie pas swowl » | le refus de `backend/requirements.txt` et des versions du jour, et son motif |
| 5. Démarrer et arrêter | `mkdir`, démarrage, `curl` de contrôle, `HTTP 000` et journal, `ss -ltn` | `pkill -f "[u]vicorn main:app"` et son explication |
| 6. Emplacements | le tableau | rien dans le dépôt, rien à synchroniser, registre non transportable |
| 7. Chargement | commandes d'import, d'export, de comptage, `grep` ; tous les nombres ; nature de la réponse d'import | Q2U d'abord, « confirmés sur deux machines », règle du retour |
| 8. Pertes | 12 identifiants mal formés ; 41 et 135 triplets perdus | les quatre pertes et leur caractère silencieux |
| 9. Python | — | tout |

Adaptations :

- Le rapport écrit `/home/cyril` en toutes lettres ; la note écrit `~`. Le
  rapport précise que sa propre consigne portait `$HOME`.
- Trois commandes dont le rapport donne le fait mais pas la ligne :
  `git clone https://github.com/MyShivaRepo/swowl.git ~/swowl` (« cloné
  depuis … dans `~/swowl` ») ; `python3 --version` (« Python 3.14.4
  (`python3` du système) ») ; `ss -ltn` après l'arrêt (« aucun serveur
  n'écoutait sur le port 8000 », constaté après le `pkill` par une commande
  que le rapport ne cite pas).
- `pkill -f "[u]vicorn main:app"` est prescrit par la consigne. D'après le
  rapport, personne ne l'a encore passé : il le recommande seulement, après
  l'incident 2.

## Ce que le rapport source ne donnait pas

1. **Le script de comptage.** La consigne demande de le reprendre depuis le
   rapport, mais celui-ci n'en donne que l'appel,
   `/tmp/compte.py <les quatre fichiers>`. Son contenu, dit « identique à
   celui de la consigne », n'y est pas, et aucun autre fichier du dépôt ne
   le porte : une recherche de `compte.py` dans tout le dépôt ne trouve que
   le rapport. La note le signale comme manque, sans rien inventer.
2. **Le corps des deux requêtes d'import**, `/tmp/imp-q2u.json` et
   `/tmp/imp-ose.json` : même situation. Le rapport dit seulement que
   `$HOME` y était remplacé par `/home/cyril`, donc qu'ils portent des
   chemins absolus. Avec le point 1, c'est ce qui empêche de tenir le but
   de la note pour le chargement : un poste neuf ne peut pas suivre la
   section 7 sans chercher ailleurs.
3. La commande qui a mesuré les nombres rendus à l'import, c'est-à-dire les
   longueurs des listes de la réponse JSON.
4. Les noms et l'ordre des quatre fichiers passés à `compte.py`.
5. **Les paquets nécessaires.** Le rapport ne contient aucune commande
   `apt`. La note n'en donne aucune et le dit.
6. Le chapitre WSL, l'avertissement de sécurité, le registre à chemins
   absolus, les quatre pertes du point 8 et le motif « code compilé » du
   point 9 sont absents du rapport : je les ai repris de la consigne seule.
7. **Le renvoi « pour le détail » du point 8.** Le rapport ne détaille pas
   les pertes : il n'en porte que les comptes (41 et 135 triplets, une
   restriction d'OSE, 12 identifiants mal formés). Les domaines en union,
   l'axiome perdu et la restriction vidée n'y figurent pas. La note renvoie
   donc au rapport pour le relevé et ses comptes, pas pour le détail.
8. L'ouverture dans le navigateur : le rapport ne dit pas que l'adresse a
   été ouverte. Sous Windows, l'accès du navigateur de Windows à swowl, qui
   tourne dans WSL, n'est pas mesuré.
9. Le relevé vaut pour swowl au commit `8a1cb11`. Ni le rapport ni la
   consigne ne disent s'il faut se placer sur ce commit : la note le cite,
   sans commande pour s'y placer.
10. La méthode pour refaire le relevé des versions (point 9) n'est décrite
    nulle part.
11. Les nombres de référence valent pour un chargement suivi d'un réexport,
    sans modification. Rien ne dit comment appliquer le contrôle de
    non-perte à un fichier modifié dans swowl avant son retour dans
    `ontologie/`.

## Écarts et surprises

- La consigne supposait que le rapport source contenait le script de
  comptage. Il ne le contient pas, ni les corps des requêtes d'import. J'ai
  choisi de signaler ces manques dans la note elle-même, par un encadré à
  l'endroit concerné et une annonce dès l'introduction, pour qu'un lecteur
  ne découvre pas en section 7 qu'il ne peut pas finir.
- Je n'ai pas repris le « plafond de 40 s » que le rapport attribue au
  `curl` de contrôle. D'après la documentation de curl, `--max-time` borne
  chaque tentative, pas l'ensemble ; je ne l'ai pas mesuré.
- Comme pour la tâche précédente, le commit porte l'identité du conteneur
  cloud, `Claude <noreply@anthropic.com>`. Son sujet est celui prescrit,
  avec deux lignes finales d'attribution, `Co-Authored-By` et
  `Claude-Session`.
