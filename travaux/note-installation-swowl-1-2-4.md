# Note d'installation de swowl mise à jour pour la 1.2.4

Date : 26 octobre 2026. Session Claude Code cloud.
Sources : `travaux/swowl-installation-ubuntu-1-2-4.md`, `travaux/swowl-controle-structure.md` et la consigne.

## Ce qui a changé

**`ontologie/installation-swowl.md`**
- Introduction : relevé de référence swowl 1.2.4, commit `cbcf8a8` du 26 octobre 2026, poste Ubuntu de Cyril, Ubuntu 26.10, Python 3.14.8 ; procédure refaite entièrement sur une machine neuve, seul `python3-venv` manquant. Renvois aux deux rapports du 26 octobre et à celui du 21 octobre.
- Section 4 : installation par `backend/requirements.txt` de swowl (passe sur Python 3.14 depuis la 1.1.2) ; `ontologie/swowl-requirements.txt` requalifié en jeu de secours, avec la raison (bornes larges, précédent de FastAPI 0.155.0). Contrôle de chargement conservé. Commit et version de Python de référence mis à jour.
- Section 5 : accès navigateur vérifié directement sur Ubuntu le 26 octobre ; mention WSL du 21 octobre gardée. Ajout de la lecture de `/api/version`, attendu `{"version":"1.2.4"}` (vient du rapport Ubuntu).
- Section 6 : la ligne du tableau devient « Jeu de versions de secours ».
- Section 7 : nouveaux nombres d'import (avec la colonne des avertissements) et de réexport ; attendu du `grep` d'identifiants mal formés passé de 12 à 0 ; les deux contrôles décrits avec ce que chacun attrape et ne regarde pas, leurs commandes complètes et leurs résultats attendus ; avertissement sur la portée du contrôle structurel ; raison de l'abandon de l'isomorphisme ; avertissement sur la modification dans swowl conservé et adapté.
- Section 8 : remplacée par les trois différences observables qui ne sont pas des pertes, plus la phrase d'histoire et le renvoi à `travaux/swowl-installation.md`.
- Section 10 : les cinq défauts retirés, une ligne pour dire qu'ils sont corrigés ; restent ouverts le contrôle après modification (avec la règle qui en découle) et la couverture du contrôle structurel.

**`ontologie/swowl-requirements.txt`** : en-tête réécrit (jeu de secours, Python 3.14, swowl 1.2.4, deux machines, à refaire sur une autre version de Python) ; versions remplacées par celles de la consigne.

**`controle-de-fin-de-session.md`** : la phrase sur le dépôt « qui n'est pas public au même titre » corrigée ; ligne ajoutée sur le nom ou l'adresse de quelqu'un dans un rapport.

## Points appliqués autrement que mot pour mot

- **controle-de-fin-de-session.md** : la ligne sur les noms et adresses est placée après la phrase « Si un élément de la session en contient, le signaler… » et non juste avant : placée avant, le « en » de cette phrase se serait rapporté aux noms et adresses au lieu des informations sensibles.
- **Section 4, contrôle de chargement** : l'erreur `enum=` du 21 octobre est gardée, présentée comme un souvenir ; en cas d'erreur, la note renvoie au jeu de secours.
- **Section 8** : la classe importée est nommée (`q2u:Quantity`). Le nom vient du rapport Ubuntu, qui l'a vérifié.

## Non traité, à signaler

- **A.** La section 9 (« Si un jour la version de Python change ») n'a pas été touchée, puisque la consigne n'en parlait pas. Son étape 4 recommande encore de revenir à FastAPI 0.154.0 en cas d'erreur `enum=`, alors que le jeu éprouvé est désormais en FastAPI 0.162.0 et que swowl 1.2.4 n'a plus ce défaut. Son étape 2 (installer sans épingler) pourrait aussi devenir « installer par `backend/requirements.txt` ». Question : faut-il la remettre à jour ? Ma suggestion : oui, dans une consigne courte, en remplaçant l'étape 4 par « descendre le paquet en cause ».
- **B.** `ontologie/swowl-compte.py` est toujours présenté en section 7. Il fournit les nombres de réexport que demande la consigne. La note précise qu'il ne prouve pas l'absence de perte.
