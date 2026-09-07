# Lot 28 — Tâche 1 : ouverture du lot et correction de sa page

**Exécuté le :** 7 septembre 2026, session Claude Code, compte `Cywil`.

**Nom de fichier volontairement différent de celui demandé par la
consigne** (`travaux/lot-28-tache1-ouverture.md`) — voir la section
« Écarts et surprises » : ce nom désigne déjà un fichier existant, non
suivi par git, documentant une opération antérieure et distincte. Je ne
l'ai pas touché.

## Révision avant / après

Avant écriture : `lastrevid: 1257` (confirmé par
`action=query&prop=info|revisions` avant toute action — conforme à la
valeur attendue par la consigne, qui exigeait l'arrêt sinon). Après
écriture : `newrevid: 1303`.

## Les cinq vérifications

**1. Relecture et comparaison au contenu fourni.**
`bin/wiki-get.sh` après écriture, comparé par `diff` au fichier local
envoyé à `wiki-put.sh` : **`diff` ne remonte aucun écart** (code de sortie
0). Le wikitexte stocké est identique, caractère pour caractère, au texte
fourni dans la consigne.

**2. Catégories de suivi.**
`action=parse&prop=categories` sur la page : une seule catégorie,
`Catégorie:Lot`. Aucune catégorie de liens brisés, aucune catégorie de
liens de fichiers brisés.

**3. Faits stockés (`browsebysubject`) — la vérification qui tranche.**
```
Work_package_number -> ['28']
Work_package_opening_date -> ['1/2026/9/6']
Work_package_overlaps -> ['Lot_21_—_Grandeurs_et_unités#0##', 'Lot_25_—_Axe_taxonomique#0##', 'Lot_27_—_Conduite_du_projet#0##']
Work_package_status -> ['ouvert']
Work_package_summary -> ["Écrire ce qu'un partenaire doit publier pour que l'échange de données fonctionne, et ce qu'Ecolibre publie en retour."]
```
`Work_package_status` vaut bien `ouvert`, `Work_package_opening_date`
porte bien le 6 septembre 2026 (`1/2026/9/6`). `Work_package_overlaps`
porte bien trois valeurs distinctes, dont le nouveau Lot 27. Aucune clé
inattendue au-delà de `_ASK`, `_INST`, `_MDAT`, `_SKEY`.

**4. Absence de `_ERRC`.**
`[[_ERRC::+]]` sur l'ensemble du wiki : **0 résultat**. Aucune page en
erreur de traitement SMW, Lot 28 compris.

**5. Index `Gestion des lots`.**
`action=parse&page=Gestion des lots&prop=text`, lu une seule fois, **sans
purge** (conformément à la consigne, pour ne pas fausser la mesure du
délai). Sur cette première lecture déjà :
- le Lot 28 figure dans la section « En cours », plus dans « À venir » ;
- section « Compte » : `Lots au total : 28`.

**L'index a suivi immédiatement, sans délai mesurable, dès la première
lecture après l'écriture.** Aucune attente n'a été nécessaire — cohérent
avec le fait que `#ask` interroge le magasin SMW à la demande, déjà à jour
puisque la vérification 3 (faits directs) avait elle-même réussi sans
délai.

## Fichiers `travaux/lot-28-*` déjà présents dans l'arbre de travail

Un seul, non suivi par git (`git status --short` : `??`), daté par le
système de fichiers du **4 septembre 2026, 01:34** :

- `travaux/lot-28-tache1-ouverture.md` — première ligne : « # Lot 28 —
  Ouverture : ce qu'on attend d'un partenaire »

Je n'y ai pas touché, ne l'ai pas commité. Son contenu (lu, non modifié)
documente une session antérieure, datée du 4 septembre 2026, qui a
**créé** la page du lot 28 par `--createonly` (page absente avant, `pageid
541`, `newrevid 1257` — la révision de départ exacte que la consigne
d'aujourd'hui vérifiait) avec le statut `identifié` et le contenu
d'origine à deux points ouverts (celui qui vient d'être corrigé). Ce
fichier documente donc la tâche qui a produit l'état de départ de la tâche
d'aujourd'hui, pas la même opération.

## Écarts et surprises

**Collision de nom de fichier entre la consigne et un fichier
pré-existant, non anticipée par la consigne elle-même.** La consigne
demande d'écrire le rapport dans `travaux/lot-28-tache1-ouverture.md`,
mais demande aussi, dans le même souffle, de lister « les fichiers
travaux/lot-28-* déjà présents dans l'arbre de travail […] et de ne pas y
toucher ». Ces deux instructions se contredisent ici : le fichier cible du
rapport EST le fichier pré-existant à ne pas toucher. Écrire à l'emplacement
demandé aurait donc écrasé, sans recours possible (fichier non suivi par
git, donc pas de commit à annuler), le rapport de la session du
4 septembre qui a créé la page du lot. J'ai choisi de préserver ce
fichier et d'écrire le présent rapport sous un autre nom
(`lot-28-tache1-ouverture-corrections.md`), conformément au principe de ne
jamais écraser un fichier non versionné dont l'origine n'est pas certaine
sans consigne explicite et non ambiguë de le faire. À trancher par Cyril :
faut-il renommer l'un des deux fichiers, les fusionner, ou les laisser
coexister.

Le reste de la consigne s'est confirmé exactement tel qu'annoncé : révision
de départ à 1257, texte fourni écrit sans écart, les trois faits vérifiés
(statut, date d'ouverture, chevauchements) conformes, zéro erreur de
traitement SMW, et l'index à jour sans délai. Aucune affirmation du
contexte fourni ne s'est révélée fausse à la mesure.
