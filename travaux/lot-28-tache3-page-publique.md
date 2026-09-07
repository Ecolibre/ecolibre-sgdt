# Lot 28 — Tâche 3 : création de la page publique, mise à jour de la page du lot

**Exécuté le :** 7 septembre 2026, session Claude Code, compte `Cywil`.
Deux écritures wiki, aucune autre page touchée, aucun modèle ni propriété.

## Révisions

| Page | Avant | Après |
|---|---|---|
| `Transmettre vos outils et vos machines` | inexistante (`missing`, confirmé par l'appel `curl` de la consigne ; `oldrevid: 0`, `new: true`) | **1305** |
| `Lot 28 — Échange de données avec un partenaire` | **1303** (valeur exigée par la consigne, confirmée avant écriture) | **1306** |

La page publique a été créée avec `--createonly`, conformément au garde-fou
de `CLAUDE.md` sur toute création.

## Les sept vérifications

**1. Wikitextes relus et comparés.** `bin/wiki-get.sh` après écriture,
comparé par `diff` au fichier envoyé, pour chacune des deux pages :
**aucun écart sur l'une comme sur l'autre** (codes de sortie 0). Les deux
textes fournis sont stockés caractère pour caractère.

**2. Rendu de la liste ordonnée.** `action=parse&prop=text` sur la page
publique : le rendu contient **une seule liste `<ol>`, portant exactement
cinq `<li>`**, numérotés 1 à 5, et **aucune liste `<ul>`**. Les cinq
premiers mots de chaque élément, lus dans le HTML :
```
1. Une ligne par exemplaire, pas par modèle.
2. De quoi identifier le modèle.
3. De quoi situer l'exemplaire.
4. Chaque envoi est complet et porte sa date.
5. Ce qui a disparu, dites-le si vous pouvez.
```
La liste est bien rendue après le titre de section « Ce qui compte, c'est le
fond ». Aucun lien `class="new"` dans toute la page.

**3. Catégories de la page publique.** `action=parse&prop=categories` : une
seule, `Documentation_SGDT`. Aucune catégorie de liens brisés ni de liens de
fichiers brisés.

**4. Faits stockés de la page du lot — la vérification qui tranche.**
`action=browsebysubject` après réécriture complète de la page :
```
Work_package_number -> ['28']
Work_package_opening_date -> ['1/2026/9/6']
Work_package_overlaps -> ['Lot_21_—_Grandeurs_et_unités#0##', 'Lot_25_—_Axe_taxonomique#0##', 'Lot_27_—_Conduite_du_projet#0##']
Work_package_status -> ['ouvert']
Work_package_summary -> ['Écrire quelles données un partenaire doit transmettre pour que ses outils et ses machines soient rattachés aux fiches de modèle du wiki.']
```
Les cinq paramètres du modèle sont en base. `Work_package_status` vaut
toujours `ouvert`, `Work_package_opening_date` porte bien le 6 septembre
2026, et `Work_package_overlaps` compte **exactement trois** valeurs
distinctes. Aucun paramètre perdu à la réécriture.

**5. Résumé du lot.** `Work_package_summary` porte bien le nouveau texte,
celui qui commence par « Écrire quelles données un partenaire doit
transmettre » (voir la valeur exacte ci-dessus).

**6. Erreurs de traitement SMW.** `action=ask` sur `[[_ERRC::+]]` :
**count = 0**. Aucune page en erreur sur l'ensemble du wiki.

**7. Index `Gestion des lots`.** `action=parse&prop=text`, **sans purge**.
Le lot 28 apparaît dans la seule section « En cours » — vérifié section par
section : présent dans « En cours », absent de « À venir », « Faits » et
« Abandonnés ». Section « Compte » lue dans le rendu :
```
Lots au total : 28   En cours : 2   Faits : 11   À venir : 15   Abandonnés : 0
```
La somme 2 + 11 + 15 + 0 fait bien 28. Le résumé affiché dans la ligne du
lot 28 est le nouveau : « Écrire quelles données un partenaire doit
transmettre pour que ses outils et ses machines soient rattachés aux fiches
de modèle du wiki. »

**L'index n'a pas tardé** : il était à jour dès la première lecture après
l'écriture, sans attente ni purge. Même comportement qu'à la tâche 1.

## La page publique est orpheline

`action=query&list=backlinks` sur `Transmettre vos outils et vos machines` :
**liste vide, aucun lien entrant**. Aucune page du wiki ne pointe vers elle
aujourd'hui — ni la page du lot 28, ni le registre des préfixes, ni aucune
page de suivi. Elle n'est atteignable que par son adresse directe ou par
`Catégorie:Documentation SGDT`. Signalé, non corrigé : la consigne ne
prévoyait aucune écriture ailleurs, et créer un lien entrant aurait touché
une troisième page.

## Fichiers non suivis de `travaux/`

Neuf, inchangés depuis la tâche 2, ni commités ni modifiés ici :

```
travaux/helianthi-insee.md
travaux/lot-27-tache2-protocole.md
travaux/lot-27-tache4-procedure-ouverture.md
travaux/lot-27-tache6-durcissement-ouverture.md
travaux/notes-fusion.md
travaux/rangs-correction.md
travaux/rangs-separateur.md
travaux/remise-a-niveau-6-septembre.md
travaux/wanted-by-etat.md
```

Les trois `lot-27-*` relèvent du lot 27 ; les six autres sont les rapports
des tâches des 6 et 7 septembre. Leur inventaire détaillé (taille, date,
première ligne) figure dans `travaux/lot-28-tache2-registre-et-rangement.md`.

## Écarts et surprises

**« Sept passages périmés » : la mesure en compte dix, plus un ajout.** Le
contexte annonce sept passages rendus périmés, et le résumé de modification
que la consigne fait écrire sur le wiki dit « sept passages périmés
corrigés ». Le `diff` entre le texte de la révision 1303 et celui de la
1306 rend **onze blocs** : dix lignes modifiées et un bloc ajouté. Les dix
modifications portent sur le résumé du modèle (ligne 5), l'objet (13), « Le
flux a deux sens » devenu « La réciprocité tient par la lisibilité » (19),
« Chaque exigence porte un identifiant court et stable » devenu « Les points
de la page sont numérotés, sans préfixe » (23), le paragraphe OKW (27), le
fichier d'exemple (31), l'identifiant de ligne (33), « Le jeu publié est
complet » devenu « Chaque envoi est complet » (35), « Il produit du texte et
un fichier » devenu « Il produit du texte » (47), et « les outils et les
lieux » devenu « les outils et les machines » (49). Le bloc ajouté est le
second point ouvert, sur les identifiants attribués par Ecolibre. Le compte
de sept est peut-être celui des passages *périmés au sens fort*, les trois
autres n'étant que des accords de cohérence — mais la consigne demandait de
ne pas ajuster : la mesure dit dix modifications, et c'est ce chiffre qui est
rapporté. Le résumé de modification écrit sur le wiki reste, lui, à « sept » ;
il n'était pas rattrapable après coup.

**Tension résiduelle dans le texte fourni, non corrigée.** La section « Ce
qui est écarté, et pourquoi » justifie encore l'écartement de la
structuration des exigences par « L'identifiant stable de chaque exigence
suffit à garder la porte ouverte », alors que la section « Ce qui est déjà
tranché » établit désormais que le motif de cet identifiant est tombé le
7 septembre 2026 et que les numéros ne subsistent que pour se parler d'un
point précis. Les deux passages coexistent dans la page telle qu'écrite. Je
n'ai rien reformulé — le texte fourni est écrit tel quel, conformément aux
règles impératives — mais le signale pour une prochaine passe.

Le reste du contexte s'est vérifié : le titre de la page publique était bien
libre (`missing`), la page du lot était bien à la révision 1303, et les
arbitrages décrits (plus d'exigence de format, plus de colonnes, plus de
fichier d'exemple, identifiant attribué par Ecolibre) sont bien ceux que
portent les deux textes écrits.

## Preuve du push

`git push` : `9fffc7f..b2e7b9e  main -> main`, sans erreur.

Sortie de `git log origin/main --oneline -3`, lue après le push — c'est elle
qui fait preuve, et non l'absence d'erreur du `push` :
```
b2e7b9e [Lot 28][Tâche 3] Rapport — page publique créée, page du lot mise à jour
9fffc7f [Lot 28][Tâche 2] Rapport — périmètre du registre, rangement des rapports
f8c9e90 [Lot 28][Tâche 2] methode-de-travail.md — ce qui n'est pas poussé est invisible à l'architecte
```
Le commit du rapport de cette tâche (`b2e7b9e`) est bien sur `origin/main`.

**Une nuance de procédure, à corriger dans les consignes suivantes.** L'ordre
prescrit — commiter le rapport à l'étape 5, pousser et coller la sortie à
l'étape 6 — rend la preuve du push impossible à placer dans le commit du
rapport : au moment où `git log origin/main` est lisible, le rapport est déjà
commité. Ce bloc a donc demandé un second commit, portant sur le même et
unique fichier, poussé à son tour. C'est sans gravité, mais l'étape 6 gagnerait
à le prévoir plutôt qu'à le laisser découvrir.
