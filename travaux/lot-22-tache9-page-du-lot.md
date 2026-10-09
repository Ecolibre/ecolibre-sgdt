# Lot 22 — Tâche 9 — Mise à jour de la page du lot

Exécuteur : Claude Code, 9 octobre 2026. Une seule écriture sur le wiki :
la page du lot, par `bin/wiki-put.sh`. Le lot reste « ouvert ».

**Résultat : page « Lot 22 — Miroir local » mise à jour, révision 1476 →
1482, avec cinq modifications (trois prévues par la consigne, deux ajoutées
par Cyril en cours de tâche). Les six contrôles passent.**

## Étape 1 — État du dépôt

`git status --porcelain` : vide. `.claude/settings.local.json` : `allow` et
`deny` vides. Dernier commit, poussé : `ed14a89f7e003b126614f9b955eb6c03b69e2b27`
(`main...origin/main`, sans écart).

## Titre de la page

Lu dans `Catégorie:Lot` (`list=categorymembers`) : le seul membre dont le
titre commence par « Lot 22 » est **« Lot 22 — Miroir local »**.

## Étape 2 — Les permaliens

Construits sur `ed14a89f7e003b126614f9b955eb6c03b69e2b27`, le commit de la
tâche 8, tête de `origin/main` au début de la tâche. Vérifiés par une boucle
`curl` écrite dans la commande elle-même, avant l'écriture puis après :
**200 pour chacun, les deux fois.**

1. https://github.com/Ecolibre/ecolibre-sgdt/blob/ed14a89f7e003b126614f9b955eb6c03b69e2b27/miroir/README.md
2. https://github.com/Ecolibre/ecolibre-sgdt/blob/ed14a89f7e003b126614f9b955eb6c03b69e2b27/miroir/compose.yml
3. https://github.com/Ecolibre/ecolibre-sgdt/blob/ed14a89f7e003b126614f9b955eb6c03b69e2b27/miroir/Dockerfile
4. https://github.com/Ecolibre/ecolibre-sgdt/blob/ed14a89f7e003b126614f9b955eb6c03b69e2b27/miroir/LocalSettings_miroir.php
5. https://github.com/Ecolibre/ecolibre-sgdt/blob/ed14a89f7e003b126614f9b955eb6c03b69e2b27/miroir/ecarts-avec-la-production.md

## Étape 3 — L'écriture

**Révisions : avant 1476, après 1482.** Une révision vérifiée deux fois à
1476 : à la lecture, puis juste avant l'écriture. Écriture par
`bin/wiki-put.sh` du wikitexte complet, préparé dans le scratchpad à partir
de la révision 1476 lue par `bin/wiki-get.sh`. Résumé :
`[Lot 22][Tâche 9] Page du lot mise à jour : décisions, points ouverts fermés, pages produites`.

Cinq modifications, et rien d'autre :

- **a)** Trois éléments ajoutés en fin de « Ce qui est déjà tranché »,
  affirmation en gras puis motif : le cœur copié depuis la production,
  Docker sans privilèges, les écarts tenus à jour (onze au 9 octobre 2026).
- **b)** « Points ouverts » remplacée en entier : les deux anciens points
  sont fermés. Les deux nouveaux sont les images non rapatriées et les
  vingt et un modules PHP absents. La forme est celle de la section
  existante : des paragraphes simples, sans gras.
- **c)** Nouvelle section « Pages produites », entre « Points ouverts » et
  « Dépendances » : les cinq permaliens en liens externes, chacun sur une
  seule ligne, avec une ligne disant à quoi il sert.
- **d)** L'élément « La configuration du site n'est pas modifiée… » est
  remplacé par « Le miroir a sa propre configuration, autonome… », avec le
  texte de Cyril, accents rétablis.
- **e)** L'élément « La route de récupération du dump est celle de
  l'adminsys… » est remplacé par « Le dump est produit par Cyril lui-même,
  par mysqldump… », avec le texte de Cyril, accents rétablis.

Le diff entre la révision 1476 et le texte envoyé ne comporte que ces blocs :
lignes 18 (d), 26 (e, suivie des trois ajouts a), 46 et 48 (b et c).

## Étape 4 — La règle `_INST` dans `CLAUDE.md`

Leçon « Un exemple de syntaxe SMW écrit dans une page de documentation crée
une vraie annotation », paragraphe « Contrôle à faire ».
`git diff --stat` : `CLAUDE.md | 4 +++-`.

Avant :

> **Contrôle à faire** après toute écriture sur une page de documentation :
> `smwbrowse` **sur cette page**, pour vérifier qu'elle ne porte que
> `_MDAT` et `_SKEY`. Une page qui décrit le modèle de données peut le
> polluer.

Après :

> **Contrôle à faire** après toute écriture sur une page de documentation :
> `smwbrowse` **sur cette page**, pour vérifier qu'elle ne porte que
> `_MDAT` et `_SKEY`, plus `_INST` quand elle est volontairement rangée dans
> une catégorie : `_INST` porte alors cette catégorie et rien d'autre. Une
> page qui décrit le modèle de données peut le polluer.

## Étape 5 — Vérifications

1. **QUI TRANCHE — passe.** Faits de la page par `bin/wiki-api.sh --facts`.

   | Fait | Avant | Après |
   |---|---|---|
   | `Work_package_number` | `22` | `22` |
   | `Work_package_opening_date` | `1/2026/10/9` | `1/2026/10/9` |
   | `Work_package_status` | `ouvert` | `ouvert` |
   | `Work_package_summary` | inchangé | inchangé |
   | `_ASK` | trois requêtes, `…QUERY16f6…`, `…QUERY2ad0…`, `…QUERY9c4d…` | les mêmes trois |
   | `_INST` | `Lot#14##` | `Lot#14##` |
   | `_SKEY` | `Lot 22 — Miroir local` | inchangé |
   | `_MDAT` | `1/2026/10/9/10/58/21/0` | `1/2026/10/9/22/55/4/0` |

   Aucune annotation nouvelle : seule `_MDAT` a changé.

2. **Wikitexte relu — passe.** Le wikitexte publié, relu par
   `bin/wiki-get.sh`, est identique au fichier envoyé, à un saut de ligne
   final près, que MediaWiki retire. Comparé ligne à ligne à la révision
   1476 par `diff`, il ne diffère que dans les blocs 18, 26, 46 et 48. Sont
   donc inchangés au caractère près :
   - les sections Objet, Ce que le lot exclut et Dépendances ;
   - dans « Ce qui est déjà tranché », les cinq éléments non touchés : Docker
     plutôt qu'une installation native, restauration du dump complet, aucune
     référence Base 36 hors ligne, machine hôte spheres, le dump est une
     donnée de production (lignes 14, 16, 20, 22 et 24 de la révision 1476).
3. **`prop=categories`** : `Catégorie:Lot` seulement.
4. **`prop=links`** : trois liens, `Gestion des lots`, `Lot 20 — External
   Data` et `Attribut:Work package status`, aucun vers une page inexistante.
   Les permaliens sont des liens externes et n'apparaissent pas dans
   `prop=links`.
5. **Permaliens** : 200 pour les cinq, revérifiés après l'écriture.
6. **`.claude/settings.local.json`** : vide au début et à la fin.

## Questions posées ou réponses rendues hors consigne

- **Refus de Cyril sur `permaliens.sh`.** J'avais écrit un script du
  scratchpad pour vérifier les cinq codes HTTP. Son contenu figurait dans le
  texte de mon message, mais pas dans la fenêtre de confirmation, qui ne
  montrait qu'un chemin. C'est le deuxième manquement du même genre dans ce
  lot, après `verif1.py` et `verif3.py` en tâche 6.

  **Ce que ce refus a changé :** plus de script du scratchpad tant que le
  travail tient en quelques lignes dans la commande. La boucle a été montrée,
  avec ses cinq URL en clair et son SHA, puis lancée après accord, écrite
  directement dans la commande. `permaliens.sh` reste dans le scratchpad,
  jamais exécuté.
- **Deux éléments démentis, signalés avant l'écriture.** En relisant la page,
  j'ai relevé deux éléments de « Ce qui est déjà tranché » contredits par les
  tâches 5 à 8 : la « surcharge locale » de la configuration, et la « route de
  récupération du dump » avec ses fichiers du 17 août. Je comptais les porter
  au rapport sans les toucher. Cyril a décidé de les corriger dans cette
  tâche et a fourni les deux textes de remplacement (modifications d et e).
  Il a étendu la vérification 2 aux cinq éléments non touchés.

## Écarts et surprises

- **Les permaliens pointent sur `ed14a89`, antérieur au commit de cette
  tâche.** C'est voulu par la consigne. Les cinq fichiers de `miroir/` n'ont
  pas changé depuis, donc le contenu qu'ils montrent reste celui de l'état
  livré.
- **Faits non mesurés par moi, repris de Cyril.** Le chiffre de 17
  extensions sans version déclarée, les 11 200 784 octets de la base
  décompressée et le maintien sur le serveur de l'archive des images du 17
  août viennent de la consigne. Je ne les ai pas revérifiés. Seules les 40
  extensions présentes sur le disque ont été comptées en tâche 5.
