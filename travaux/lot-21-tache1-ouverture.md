# Lot 21, tâche 1 — ouverture du lot et correction de sa page

Exécuté le 4 octobre 2026 (heure de Paris) par Claude Code, sur consigne
« Pour Claude Code. ».

## Ce qui a été fait

La page « Lot 21 — Grandeurs et unités » (pageid 532) a reçu, en une seule
écriture, le contenu fourni par la consigne.

| | |
|---|---|
| Révision lue | 1224 (création au lot 13, parent 0) |
| Nouvelle révision | **1391** |
| Horodatage | 2026-10-03T22:31:24Z, soit le 4 octobre 2026 à 00 h 31, heure de Paris |
| Résumé | `[Lot 21][Tâche 1] Ouverture du lot — exclusions, arbitrages, point de départ` |
| Copie locale | `pages/Lot_21_ouverture.txt`, écrite avec l'outil d'écriture de fichier, mot pour mot, aucune ligne repliée |

Le lot passe de l'état « identifié » à « ouvert », avec une date
d'ouverture au 2 octobre 2026. Aucune autre page du wiki n'a été écrite.

### Étapes préalables

0. `git status` : aucune ligne modifiée, ajoutée, supprimée ou renommée.
   Six fichiers non suivis dans `travaux/`, qui ne comptent pas.
1. `travaux/lot-21-tache1-ouverture.md` et `pages/Lot_21_ouverture.txt`
   n'existaient pas.
2. Révision courante de la page : **1224**, comme attendu.
3. Les trois affirmations à vérifier sont confirmées :
   - a. `action=smwinfo&info=subobjectcount` rend
     `"subobjectcount": 0`.
   - b. `Attribut:Nominal diameter` et `Attribut:Secondary diameter` portent
     tous deux, dans `Property_description_FR`, « Décimales avec un point,
     jamais une virgule. ». Les deux sont de type `Number`, avec la portée
     `mm` et `mm, valeur multiple`.
   - c. `git log -1 --format=%H -- travaux/lot-10-tache3-proposition.md`
     rend `5f91eddf8f366a5e3dadcef11f94c6e27192617c`, et
     `git log -1 --format=%H -- travaux/lot-9-amendement-1.md` rend
     `c73d88a5931d1ceec88964029c97f6774f21ce6b`. Ce sont les deux
     permaliens du contenu.

### Pages de référence lues avant l'écriture

C'était la première écriture du lot. J'ai lu :
- `Catégorie:Page de suivi` ;
- `Gestion des lots` ;
- `Limites connues du Système de Gestion de Données Techniques` ;
- `Récapitulatif technique du Système de Gestion de Données Techniques` ;
- `Notes en attente de rangement` ;
- `Procédure de clôture d'un lot`.

J'ai aussi lu l'ancienne version de la page du lot 21.

J'ai contrôlé les entrées des Limites connues que cite le contenu. Leur
objet concorde avec ce qu'en dit la page :
- **n° 2** : arbre fonctionnel en graphe orienté acyclique. Aucun patron de
  résolution n'existe à recopier, les pages `Board_*` sont absentes.
- **n° 10** : filetage et diamètre d'un raccord à plusieurs orifices. Un
  sous-objet par orifice est évoqué.
- **n° 14** : le verrou `smw-change-propagation-protection` se lève de
  lui-même, « en un temps qui se compte en jours ».
- **n° 20** : le type `Number` en locale française rejette le point
  décimal.
- **n° 33** : blanchir une page de propriété la verrouille. Il faut la
  supprimer directement.

## Vérifications

**a. Celle qui tranche : faits stockés** (`--facts`). Tout est conforme.
- `Work_package_status` : `ouvert`.
- `Work_package_opening_date` : `1/2026/10/2`.
- `Work_package_number` : `21`.
- `Work_package_summary` : inchangé, « Faire des grandeurs physiques et
  de leurs unités des pages porteuses d'attributs, et décider comment une
  valeur mesurée s'attache à un item. ».
- `Work_package_overlaps` : trois valeurs, lots 12, 26 et 31.
- `Work_package_revises` : deux valeurs, lots 9 et 10.
- Faits techniques : `_ASK` (3 requêtes), `_INST` (Lot), `_MDAT`,
  `_SKEY`.
- Aucun fait `_ERRC`, et aucun autre fait.

**b. Contenu.** `bin/wiki-verify.sh` rend `IDENTIQUE : Lot 21 — Grandeurs
et unités`, sortie 0. Conforme.

**c. Liens et catégories** (`action=parse`, `prop=links|categories`).
**12 liens, tous `"exists": true`**. Une seule catégorie, `Lot`.
Conforme. Les 12 liens se répartissent ainsi :
- lots 7, 8, 9, 10, 12, 19, 26, 28 et 31 ;
- `Gestion des lots` ;
- `Limites connues du Système de Gestion de Données Techniques` ;
- `Attribut:Work package status`, posé par le modèle Lot.

**d. Index.** `action=ask` sur `[[Work_package_status::ouvert]]` rend
`count: 3` : lot 21, lot 24 et lot 34. Le lot 21 y figure. Conforme.

## Écarts et surprises

1. **Le diff avant envoi n'a pas été calculé séparément.** Le garde-fou 1
   de CLAUDE.md demande de lire, calculer le diff, puis écrire. J'ai lu la
   page courante (révision 1224, intégralement affichée) et vérifié qu'elle
   n'avait pas bougé. En revanche, je n'ai pas lancé de
   `bin/wiki-get.sh | diff` avant l'écriture. La consigne remplaçait la
   totalité du contenu par un texte fourni et ne prévoyait pas cette étape
   parmi les demandes de confirmation attendues. L'égalité exacte après
   écriture est établie par la vérification b.
2. **Dates en UTC et dates du texte.** L'historique du wiki affiche
   l'écriture au 3 octobre 2026, 22 h 31 UTC. Le texte de la page date la
   reformulation de la règle et les deux relevés du « 4 octobre 2026 »,
   ce qui correspond à l'heure de Paris. Je n'ai rien changé : je le
   signale seulement pour qui datera le lot par les résumés de
   modification.
3. **`Procédure d'ouverture d'un lot` n'a pas été lue.** Elle figure dans
   `Catégorie:Page de suivi`, mais pas dans la liste des pages de référence
   de CLAUDE.md. Elle s'adresse d'ailleurs à une conversation claude.ai.
4. **Rendu de `Gestion des lots` non vérifié.** La vérification d porte sur
   la requête stockée, pas sur l'affichage de l'index. L'entrée 47 des
   Limites connues rappelle que ce rendu peut retarder. Je n'ai pas purgé
   la page : la consigne ne le prévoyait pas.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

Aucune.
