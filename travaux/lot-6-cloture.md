# Lot 6 — clôture : renommage, objet corrigé, arbitrages consignés, entrées corrigées, séparateur de Secondary_diameter, lot 46 créé

Exécuté le 10 novembre 2026, de 22 h 11 à 22 h 19 UTC, dans une session
Claude Code cloud, sur la branche `claude/nifty-einstein-i9t8kk`. Neuf
écritures sur le wiki, et deux pour le test du séparateur, toutes réussies,
sans arrêt ni question ; un premier essai de vidage du bac à sable a été
refusé par l'API sans rien écrire. Toutes les vérifications passent ; celle
qui tranche trouve les faits du lot 6 sous son nouveau titre.

Étape 0 : `git fetch origin`, puis `git status --porcelain`, sortie vide ;
`HEAD` et `origin/main` au même commit, `977754d`. `bin/wiki-login.sh` rend
`Success Cywil`.

## Mesures de l'étape 1

Les quatre concordent avec la consigne ; l'écriture a donc eu lieu.

- **a)** `Module:Base36` a **trois** révisions : 162 du
  2026-04-03T20:24:37Z, 235 du 2026-04-07T16:07:11Z et 237 du
  2026-04-07T16:15:52Z. Les deux dernières sont bien du 7 avril 2026.
- **b)** `Attribut:Item ref` porte `[[Has type::Code]]`, en ligne 1.
- **c)** `[[Category:Referenced item]][[Part_of::+]]` rend **0** résultat ;
  `[[Category:Referenced item]]` en rend **42**. Sans suite dans les deux
  cas, `limit=500`.
- **d)** `[[Secondary_diameter::+]]` rend **0** résultat, avec un type résolu
  `_num`.

Ni `Module:Base36` ni `Attribut:Item ref` n'ont été touchés.

## Écritures

| Étape | Page | Révision | Heure (UTC) | Résumé | Outil |
|---|---|---|---|---|---|
| 2 | Lot 6 — Durcissement du module de références → Lot 6 — Refonte des modèles d'item et registre des limites | page 519, révision 1751 ; redirection laissée sous l'ancien titre : page 720, révision 1752 | 22:14:39 | `[Lot 6][Clôture] renommage, le titre nommait un travail qui n'a pas eu lieu` | `bin/wiki-move.sh` |
| 3 | Lot 6 — Refonte des modèles d'item et registre des limites | 1751 → 1753 | 22:14:59 | `[Lot 6][Clôture] objet corrigé, arbitrages consignés, quatre points ouverts élucidés, lot clos` | `bin/wiki-put.sh` |
| 4 | Lot 17 — Arbre fonctionnel | 1220 → 1754 | 22:15:14 | `[Lot 6][Clôture] règle d'entrée dans l'arbre fonctionnel, tranchée au lot 6` | `bin/wiki-put.sh` |
| 5 | Choix imposés par l'outil | 1698 → 1755 | 22:15:28 | `[Lot 6][Clôture] cardinalité de Part_of, entrée corrigée sur l'état mesuré` | `bin/wiki-put.sh` |
| 6 | Attribut:Nominal diameter | 342 → 1756 | 22:15:49 | `[Lot 6][Clôture] consigne de décimale corrigée, le point était rejeté par le type Number` | `bin/wiki-put.sh` |
| 7 | Attribut:Secondary diameter | 343 → 1757 | 22:15:51 | `[Lot 6][Clôture] consigne de décimale corrigée et passage au point-virgule` | `bin/wiki-put.sh` |
| 8 | Modèle:Organic facet fitting | 423 → 1758 | 22:16:14 | `[Lot 6][Clôture] Secondary_diameter séparée par le point-virgule, la virgule servant de décimale` | `bin/wiki-put.sh` |
| 9 | Formulaire:Organic item/bloc facette raccord | 408 → 1759 | 22:16:30 | `[Lot 6][Clôture] champ des diamètres secondaires en accord avec le modèle` | `bin/wiki-put.sh` |
| 10 | Lot 46 — Circuit d'eau du Buisson de Cerzat | création, page 721, révision 1760 | 22:16:41 | `[Lot 6][Clôture] création, le circuit d'eau n'appartenait à aucun lot` | `bin/wiki-put.sh --createonly` |
| V3 | Utilisateur:Cywil/Bac à sable | 1273 → 1761 | 22:18:07 | `[Lot 6][Clôture] test du séparateur point-virgule de Secondary_diameter` | `bin/wiki-put.sh` |
| V3 | Utilisateur:Cywil/Bac à sable | 1761 → 1762 | 22:18:48 | `[Lot 6][Clôture] bac à sable vidé après test du séparateur` | `bin/wiki-put.sh` |

Chaque page a été relue par `bin/wiki-get.sh` juste avant son écriture, et
trouvée identique à la lecture faite au début de la tâche. Protection et
droits, par `intestactions` avec détail : aucune protection, aucun motif de
refus d'écriture, de renommage ou de création, y compris sur les deux pages
d'attribut. Le renommage a rendu `redirectcreated: true`. Les dix écritures
de contenu ont rendu `result: Success`, et `bin/wiki-verify.sh` a rendu
`IDENTIQUE` après chacune. Les textes ont été recopiés tels quels dans des
fichiers, puis écrits ou insérés :

- étape 4 : la nouvelle puce est placée juste après « Les items
  fonctionnels sont parentés… », dernière puce de « Ce qui est déjà
  tranché », ligne 12 ;
- étape 5 : les lignes 28 à 31, sous le titre de l'entrée, inchangé ligne
  27, sont remplacées par les quatre lignes fournies ;
- étapes 6 et 7 : seules les deux lignes de description diffèrent des
  pages précédentes ; type, cardinalité, domaine et portée sont identiques ;
- étape 8 : seules les lignes 10, 11 et 35 diffèrent du modèle précédent,
  qui n'avait aucune transclusion ;
- étape 9 : seule la ligne 16 change, et la ligne ancienne y figurait une
  fois, telle que la consigne la donnait.

Les résumés sont ceux de la consigne, mot pour mot, sauf celui de l'écriture
de test, que la consigne ne donnait pas : je l'ai formulé.

## Vérifications

- **Qui tranche — les faits du lot 6 sous son nouveau titre.**
  `bin/wiki-api.sh --facts` sur « Lot 6 — Refonte des modèles d'item et
  registre des limites » rend `Work_package_status -> clos`,
  `Work_package_closure_date -> 1/2026/11/8` et le nouvel objet, « Rendre
  Part_of multivaluée aux niveaux fonctionnel et organique… », avec `_SKEY`
  au nouveau titre et `_MDAT` à 22:14:59. Semantic MediaWiki a suivi le
  renommage. Interrogé sous l'ancien titre, `smwbrowse` suit la redirection
  et rend les mêmes faits, avec `_SKEY` au nouveau titre.
  `[[Work_package_number::6]]` ne rend qu'un sujet, le nouveau titre.
- **1. Gestion des lots**, lue à 22:17:11 : le lot 6, sous son nouveau
  titre, en « clos » ; le lot 46 en « identifié ». Compte : 46 lots, 3 en
  cours, 17 faits, 26 à venir, 0 abandonné ; la somme égale le total. Aucune
  purge n'a été nécessaire.
- **2. Les quatre pages** — `Attribut:Nominal diameter`,
  `Attribut:Secondary diameter`, `Modèle:Organic facet fitting`,
  `Formulaire:Organic item/bloc facette raccord` — se rendent par
  `action=parse` avec **0** élément d'erreur et aucun avertissement du
  parseur. Les deux attributs et le bloc de formulaire ne portent aucune
  catégorie. Le modèle porte `Pages avec des liens de fichiers brisés` et
  `Modèles de documentation`, deux catégories que portait déjà sa révision
  423 : voir les écarts. Faits des attributs après écriture : `_TYPE` à
  `_num` inchangé, aucun `_CHGPRO`, et `intestactions` ne rend toujours
  aucun refus.
- **3. Test du séparateur.** Le bac à sable a reçu
  `{{Organic facet fitting|Nominal_diameter=25|Secondary_diameter=25,4;32}}`.
  `bin/wiki-api.sh --facts` : `Secondary_diameter -> ['25.4', '32']`, soit
  **deux** valeurs et non quatre, `Nominal_diameter -> ['25']`,
  `Item_facet -> Facette raccord`, et `_INST -> Item à facette raccord`.
  Après le vidage : longueur 0, aucune catégorie, seulement `_MDAT` et
  `_SKEY` comme faits. `[[Secondary_diameter::+]]` rend de nouveau 0, et
  `[[Category:Item à facette raccord]]` 0.
- **4. `git status --porcelain`** : sortie vide avant la rédaction du
  rapport ; le rapport est le seul fichier ajouté au commit.

Contrôles complémentaires, non demandés :

- Faits du lot 46 : `Work_package_number -> 46`,
  `Work_package_status -> identifié`, `Work_package_depends_on -> Lot 7 —
  Nomenclature quantifiée et entité réception`, et son objet.
- Catégories : `Catégorie:Lot` pour les lots 6, 17 et 46,
  `Catégorie:Page de suivi` pour les Choix imposés ; aucune catégorie de
  suivi. Liens des quatre pages : 13 cibles, aucune inexistante, aucune
  redirection.
- Faits avancés par les textes, vérifiés :
  - le formulaire physique saisit son parent par un champ à valeur unique,
    `physical_parent` en `combobox` ;
  - les formulaires fonctionnel et organique saisissent `Part_of` en liste ;
  - le seul item fonctionnel à deux parents est « Acheminer l'eau au point
    d'usage », qui a pour parents `S'hydrater` et `Irriguer`, sur 22 items
    fonctionnels portant `Part_of` ;
  - les huit items d'eau nommés par le lot 46 existent dans les classes
    annoncées, et « Transfert d'eau par vases communicants » ne porte que
    `Item_ref` (`000Q`) et `Realizes_function` ;
  - le numéro 46 était libre ;
  - les trois permaliens du lot 6 désignent des fichiers présents au commit
    `3a0e7af` ;
  - la passation porte bien son §5.1, « Le système de purge du puits ».

## Relevé de `.claude/settings.local.json`

Absent au début de la tâche, absent à la fin : aucune règle.

## Écarts et surprises

Consignés sans rien corriger, comme le veulent la consigne et la règle « Ce
qui se corrige, et ce qui se note ».

- **Les textes datent du 8 novembre 2026 des écritures faites le
  10 novembre.** C'est le cas de la date de clôture `2026-11-08`, de
  « Corrigé le 8 novembre 2026 », de « Rédaction corrigée le 8 novembre
  2026 … Mesuré ce jour », et de « État relevé le 8 novembre 2026 ». Ils ont
  été écrits tels quels. Les mesures de l'étape 1, refaites le 10, rendent
  les mêmes chiffres.
- **« Les formulaires fonctionnel et organique … n'ont pas changé
  depuis »**, écrit à l'étape 5, n'est exact que pour leur champ
  `Part_of`. `Formulaire:Functional item` n'a pas bougé depuis sa révision
  320 du 9 août 2026. `Formulaire:Organic item`, lui, a été modifié depuis
  sa révision 356 du 10 août, qui a passé `Part_of` en liste : révisions 409
  et 411 du 11 août, pour les blocs de facette, et 987 du 25 août, pour
  `Wanted_by`. Son champ `Part_of` a aujourd'hui la forme posée le 10 août ;
  je n'ai pas comparé ligne à ligne les révisions intermédiaires.
- **L'affichage des diamètres secondaires reste ambigu.** La ligne
  d'affichage fournie à l'étape 8 sépare les valeurs par une virgule suivie
  d'une espace : le test rend « 25,4, 32 », où la virgule décimale et le
  séparateur se suivent. Le stockage, lui, est juste.
- **Le premier vidage du bac à sable a été refusé.** `bin/wiki-put.sh`,
  appelé avec un fichier vide, n'envoie pas de paramètre `text`, et l'API
  répond `missingparam`, sans rien écrire. Le vidage a été refait avec un
  fichier ne contenant qu'un saut de ligne, que le wiki supprime : la page
  est de longueur 0. Le script ne sait donc pas vider une page à partir d'un
  fichier vide.
- **Le bac à sable a perdu sa ligne descriptive**, « Page bac à sable — sert
  aux tests du lot 9 (voir CLAUDE.md, lot-9-cadrage-plantes.md). »,
  restaurée le 5 septembre 2026, révision 1273. La consigne demandait de
  vider la page ; la ligne reste dans l'historique.
- **`Modèle:Organic facet fitting` porte une catégorie de suivi qui précède
  cette tâche.** « Pages avec des liens de fichiers brisés » vient de
  `{{Documentation}}`, qui appelle `Template-info.svg`, absent du wiki ; la
  révision 423 la portait déjà. La sous-page `Modèle:Organic facet
  fitting/doc` n'existe pas.
- **L'index des lots a suivi sans purge**, à la différence des clôtures des
  lots 2, 4 et 5. À 22:17:11, il montrait le lot 6 en « clos », 2 min 12 s
  après l'écriture de son état, et le lot 46, créé 30 s plus tôt. La
  création d'une page de lot a pu rafraîchir l'index ; ce n'est pas établi.
- **« Gestion des lots » figure encore parmi les pages qui lient l'ancien
  titre du lot 6**, bien que son rendu affiche le nouveau. Sa table de liens
  n'a pas encore été mise à jour ; le lien passe par la redirection.
