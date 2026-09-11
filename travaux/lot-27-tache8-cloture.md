# Lot 27 — Tâche 8 : clôture

## Préalable — mettre au dépôt les rapports manquants

La page du lot signalait elle-même la dette avant cette tâche : les
rapports des tâches 2, 4 et 6 n'avaient jamais été commités
(`travaux/lot-27-tache2-protocole.md`,
`travaux/lot-27-tache4-procedure-ouverture.md`,
`travaux/lot-27-tache6-durcissement-ouverture.md`), présents seulement sur
la machine. Sans eux, l'étape 5 (permaliens de tous les rapports) aurait
produit des liens morts pour trois des cinq. Vérifié avant commit (recherche
de motifs de secret, sans résultat), puis commité et poussé en un seul
commit (`0327650`), avant toute construction de permalien.

Aucun rapport de tâche 3 n'existe dans `travaux/` : confirmé par recherche
(`find`) avant et après cette tâche. Rien à lier pour cette tâche.

## Ce qui a été écrit

1. `Lot 27 — Conduite du projet`, en deux éditions distinctes :
   - Remplacement de `== Points ouverts ==` par le texte fourni (revid 1318
     → 1333).
   - Clôture : `Work_package_status` `ouvert` → `clos`,
     `Work_package_delivery_date` = `Work_package_closure_date` =
     `2026-09-10`, `Work_package_closure_report` avec les cinq permaliens,
     et ajout de la section `== Rapports ==` en fin de page (revid 1333 →
     1336).
2. `methode-de-travail.md` : deux paragraphes ajoutés (« Sa propre mesure
   d'hier est un résumé » dans « Les règles de vérification », après celui
   sur les résumés ; « Deux des règles de ce fichier viennent de
   l'exécuteur » à la fin de « Ce qui rattrape les erreurs »). Commit
   `13b2b82`, `[Lot 27][Tâche 8]`.
3. `Lot 24 — Adminsys autonome` : phrase ajoutée en fin du paragraphe sur la
   déclaration de licence, dans `== Points ouverts ==` (revid 1330 → 1334).
4. `Lot 31 — Qualification des données et confiance entre pairs` : paragraphe
   ajouté en fin de `== Ce qui est déjà tranché ==` (revid 1325 → 1335).

Résumés : `[Lot 27][Tâche 8] Points ouverts reformulés — …`,
`[Lot 27][Tâche 8] Clôture — …`, `[Lot 27][Tâche 8] Critère du miroir
ajouté …`, `[Lot 27][Tâche 8] Origine du lot ajoutée — …`.

## Les cinq permaliens

Construits sur le SHA `0327650d31c90fbc1e0967ea3dcd454f71dfff79` (dernier
commit avant l'écriture sur le wiki, celui qui met tache2/4/6 au dépôt),
vérifiés un par un par requête HTTP (code 200 pour chacun avant de les
écrire sur le wiki) :

- Tâche 1 — Ouverture, et corrections sur les verrous de propagation
- Tâche 2 — Le protocole de travail
- Tâche 4 — La procédure d'ouverture d'un lot
- Tâche 6 — Durcir la procédure d'ouverture après son premier essai
- Tâche 7 — La page publique, et ouverture du lot 31

## Vérifications (étape 6)

1. **`browsebysubject` sur le lot 27** : `Work_package_status -> ['clos']`,
   `Work_package_opening_date -> ['1/2026/9/2']`,
   `Work_package_delivery_date -> ['1/2026/9/10']`,
   `Work_package_closure_date -> ['1/2026/9/10']` (les deux dates portent la
   même valeur, conformément à la règle impérative de la consigne).
   `Work_package_summary` reste une seule valeur. `Work_package_closure_report`
   rend **cinq valeurs distinctes** dans la liste (pas une chaîne unique) —
   la propriété porte bien `+sep=,` sur le modèle. Conforme.
2. **Index `Gestion des lots`**, purgé puis relu par `action=parse` : la
   section « En cours » ne rend plus qu'une ligne, `Lot 24 — Adminsys
   autonome`. Le bloc « Compte » rend `Lots au total : 31`, `En cours : 1`,
   `Faits : 13`, `À venir : 17`, `Abandonnés : 0` — somme 31, total 31.
   Conforme.
3. **`git diff` sur `methode-de-travail.md`**, vérifié avant le commit :
   deux blocs ajoutés (4 lignes au total, texte + ligne vide de chaque
   côté), rien d'autre modifié. Conforme.
4. **Lots 24 et 31, `browsebysubject`** : aucune propriété au-delà des
   champs du modèle `Lot` (`Work_package_*`, `_INST`, `_ASK`, `_MDAT`,
   `_SKEY`) — pas d'annotation parasite. Wikitexte relu après écriture
   comparé (`diff`) au fichier envoyé sur chacune des deux pages : identique
   à l'octet près (seul écart, l'absence de retour à la ligne final côté
   lecture API, sans incidence). Conforme.

Contrôle supplémentaire, non demandé mais nécessaire pour la section
`== Rapports ==` : `action=parse` sur le lot 27 rend cinq liens externes
distincts (`class="external text"`), chacun avec le libellé attendu, aucun
`[[`, `]]`, `{{` ni `}}` littéral dans le rendu. Le champ `Work_package_closure_report`
du modèle affiche les cinq URL sous forme d'un seul lien brut concaténé par
des virgules dans le tableau d'identification — c'est le comportement
déjà en place sur le lot 28 (le modèle n'`#arraymap`-e pas ce champ à
l'affichage) : rien de propre à cette écriture, non corrigé ici, hors
périmètre de la tâche.

## Écarts et surprises

Le compte des Limites connues cité dans la tâche précédente (lot 24 tâche
2) portait un écart déjà signalé alors (51 entrées mesurées contre 47
annoncées). Rien de neuf sur ce point ici ; je le mentionne seulement parce
que la nouvelle règle de méthode ajoutée à l'étape 2 (« sa propre mesure
d'hier est un résumé ») cite explicitement ce type d'erreur — je n'ai pas eu
besoin de la réappliquer dans cette tâche, aucun chiffre n'y étant repris
d'une tâche antérieure sans remesure.

Rien d'autre à signaler : aucune permission refusée, aucune session
expirée, aucune confirmation shell rencontrée. Les trois rapports mis au
dépôt en préalable (tâches 2, 4, 6) ont été relus avant commit dans la
seule mesure d'une recherche de motifs de secret ; je ne les ai pas relus
mot pour mot, n'ayant aucune raison de les modifier.
