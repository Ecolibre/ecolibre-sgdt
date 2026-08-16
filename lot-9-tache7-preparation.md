# Lot 9 — Tâche 7 : préparation (aucune écriture)

Relu : `lot-9-amendement-1.md` §2 tâche 7 (révisée) et `plants-2026-08.tsv`.
Rien ci-dessous ne touche à l'attribution des références — traitée séparément,
comme demandé.

## 0. Ce que contient réellement le fichier

`plants-2026-08.tsv` a 39 lignes : 1 en-tête, 1 ligne d'exemple (id vide,
`lieu` commence par `#Buisson_Cerzat` — donc pas une plantation, un modèle de
ligne entièrement renseigné, à titre d'exemple), 37 lignes de plantations
réelles (`id` 1 à 37).

Sur ces 37 lignes réelles, seules trois colonnes sont significativement
renseignées :

| colonne | renseignée sur |
|---|---|
| `id` | 37/37 |
| `lieu` | 37/37 |
| `nom_photo` | 35/37 |
| `nom_courant` | 4/37 (les 2 cas de scission `Menthe_X`/`Chayote`, `Hysope`, `Oignon_rocambole` — ces deux derniers uniquement parce que leur photo a un nom défectueux, voir §2) |
| `issu_de` | 1/37 (id 31, filiation vers id 30) |
| `taxon`, `cultivar`, `date_plantation`, `provenance`, `annee_source`, `rang`, `statut` | **0/37** |

**C'est le constat central de cette préparation** : sept colonnes sur douze
sont vides sur la totalité des plantations réelles, dont `provenance` et
`annee_source` — les deux colonnes qui définissent le regroupement des items
référencés (`espèce × provenance × année`). Comparé à `TSV plantes -
Feuille 1.tsv` (39 lignes, mêmes `id`/`lieu` sur les 37 plantations,
`nom_courant`/`provenance`/`annee_source`/`statut` intégralement renseignés),
`plants-2026-08.tsv` est un allégé de ce fichier source, pas une version
enrichie — cohérent avec le message du commit qui l'a introduit (« fichier
de travail... plantes photographiées à qualifier »).

Deux écarts supplémentaires entre les deux fichiers, à trancher avant
génération :

- **id 38 de la Feuille 1 (Miscanthus, Buisson_Cerzat, doublon de id 25) est
  absent de `plants-2026-08.tsv`.** Volontaire (doublon retiré) ou oubli ?
- **Orthographe du nom courant du poireau** : `perpétuel` (avec accent, ligne
  d'exemple) contre `perpetuel` (sans accent, `Feuille 1.tsv` id 30/31/32) et
  `Poireau_perpetuel` (slug `nom_photo`, sans accent). Trois graphies pour la
  même espèce ; à unifier avant que le titre de la page organique ne soit
  fixé, un renommage de page organique après coup déplaçant tout ce qui
  pointe vers elle.

Sans réponse à « d'où vient `provenance`/`annee_source` pour la génération »,
la tâche 7 ne peut pas produire d'items référencés significatifs : voir le
chiffrage dégradé au §1.

## 1. Dénombrement

**37 plantations** (une par ligne `id` 1–37 ; la ligne d'exemple exclue).

**30 items organiques** (une par espèce distincte, clé = `nom_courant` si
renseigné sinon `nom_photo`) :

Ail_elephant · Bourrache · Brocoli_vivace · Capucine_tubereuse · Chayote (×2
plantations) · Chou_Daubenton (×2) · Consoude_B14 · Consoude_naine ·
Crosne_du_Japon · Egopode · Fraisier_X · Fraisier_X2 · Framboisier_classique
· Framboisier_jaune · Groseiller · Groseiller_a_maquereau · Helianthi ·
Hemerocalle · Hysope · Menthe_X (×2) · Menthe_bergamote · Miscanthus ·
Oignon_rocambole (×2) · Paulownia · Persil_japonais · Poireau_perpetuel (×3)
· Roquette_sauvage (×2) · Sarrasin_vivace · Tomates · Yacon.

(21 espèces à 1 seule plantation, 9 à 2 ou 3 — le détail complet des 37
plantations par espèce est disponible sur demande, omis ici pour la
lisibilité.)

**Items référencés — deux chiffres, pas un**, parce que `provenance` et
`annee_source` sont vides partout dans `plants-2026-08.tsv` :

- **Tel que le fichier est aujourd'hui : 30**, un par espèce, parce que
  `('espèce', '', '')` est la seule clé possible quand provenance et année
  sont constantes (vides) sur toutes les lignes d'une même espèce. La
  filiation (id 31 → id 30) n'a aucun effet observable sur ce chiffre : les
  deux lignes tombaient déjà dans le même groupe par vacuité de la clé,
  filiation ou pas. **Ce chiffre ne dit rien d'utile** — il ne distingue
  aucune provenance, alors que la décision 1.7/1.12 du lot repose
  justement sur cette distinction.
- **Si `provenance`/`annee_source` de `Feuille 1.tsv` étaient reportées dans
  `plants-2026-08.tsv` (jointure sur `id`, les 37 `id`/`lieu` correspondent
  exactement entre les deux fichiers) : 31.** L'écart avec 30 vient de
  `Chayote`, planté à deux endroits avec deux provenances distinctes
  (`Bene Bonno` à Buisson_Cerzat, `Non défini` à Terrasse_Cyril_Chilhac) —
  exactement le cas que la clé `espèce × provenance × année` est censée
  distinguer. C'est ce chiffre qui donne une idée du volume réel, pas 30.

Le contrôle d'intégrité issu_de → id (voir §2) ne remonte qu'une filiation
(id 31 → id 30), donc l'effet de dédoublonnage par filiation ne joue que sur
un seul item référencé dans les deux chiffrages.

## 2. Cohérence

- **`issu_de` vers un id existant ?** Oui, la seule valeur renseignée (id 31
  → `30`) pointe vers une ligne qui existe. Aucun orphelin.
- **Virgules dans une cellule ?** Aucune, sur les 38 lignes (37 plantations +
  ligne d'exemple), toutes colonnes confondues.
- **Statuts hors des six valeurs ?** Sans objet en l'état : `statut` est vide
  sur les 37 plantations réelles (seule la ligne d'exemple porte `en place`,
  qui est valide). Rien à rejeter aujourd'hui, mais rien non plus à valider —
  la vérification redevient pertinente le jour où la colonne est remplie.
  Les six valeurs de référence (relevées sur
  `Formulaire:Physical item/bloc facette végétal`, pas supposées) :
  `en réserve`, `en place`, `repris`, `souffrant`, `mort`, `remplacé`.
- **`nom_photo` sans fichier correspondant, ou l'inverse ?** Aucun écart.
  33 couples (lieu, nom_photo) distincts dans le TSV, les 33 ont un fichier
  parmi les 71 correctement nommés téléversés sur le wiki (`allimages`,
  parsing `ECL-<lieu>-<plante>-<date>_<nn>.jpg` avec les trois lieux connus
  comme séparateur fiable, le tiret étant aussi présent à l'intérieur du
  champ date). Aucun des 71 fichiers plante n'est orphelin (sans ligne TSV).
  Les deux lignes sans `nom_photo` (id 20 `Hysope`, id 27 `Oignon_rocambole`)
  correspondent exactement aux deux fichiers au nommage défectueux déjà
  identifiés (`ECL-Buisson_CerzatHysope-...` — tiret manquant après le lieu ;
  `ECL-Jardin_Cyril_Chilhac-Oignon_rocambole_...` — tiret remplacé par un
  underscore avant la date), hors périmètre de la tâche 7 comme de la tâche 8
  (ré-téléversement en tâche 11). Cohérent, rien à corriger ici.
  (3 autres couples (lieu, plante) parmi les 71 fichiers sont hors sujet
  végétal par construction — `Couleuvre_verte_et_jaune`, `Gainage_cable`,
  `Raboutage_cable_gaine` — normal qu'ils n'apparaissent pas dans le TSV.)
- **Table de correspondance lieu (TSV) → page (wiki), à ne pas sauter.** Les
  trois slugs `lieu` du TSV ne sont pas les titres de page : `Buisson_Cerzat`
  → `Le Buisson de Cerzat`, `Jardin_Cyril_Chilhac` → `Jardin de Chilhac`
  (« Cyril » disparaît), `Terrasse_Cyril_Chilhac` → `Terrasse de Chilhac`
  (idem). Une conversion naïve underscore→espace produirait un `Located_at`
  qui ne pointe vers aucune page de lieu existante. Vérifié sur
  `categorymembers` de `Category:Lieu` (3 pages, ces titres exacts).

## 3. Convention de titre

**Plantations** — donnée par Cyril : `<Libellé> (ECL-NNNN)`. `Libellé` n'a
pas de définition antérieure dans les rapports du lot ; faute d'une espèce
suffisant seule à distinguer deux plantations de la même espèce (cas
`Poireau_perpetuel` ×3, `Chayote` ×2...), je le lis comme
`<Nom courant> — <Lieu>` — seule part de l'ancienne proposition de tâche 7
(`<Nom courant> — <lieu> — <AAAA-MM>`) qui reste nécessaire une fois que
`(ECL-NNNN)` assure lui-même l'unicité (la date n'a plus besoin d'être dans
le titre pour ça). **À confirmer par Cyril avant génération**, ce n'est pas
une convention déjà en place comme les deux niveaux suivants.

**Organique et référencé — relevés sur les items déjà en place** (aucun
item organique/référencé végétal n'existe encore, mais deux paires non
végétales suffisent à établir le motif : `Bidon 220L` → `Bidon 220L bleu
plastique Borde`) :

- Organique = **nom générique seul**, sans fournisseur, sans variante.
  `Bidon 220L` ne dit ni bleu, ni Borde, ni plastique.
- Référencé = **nom organique, suivi des qualificatifs qui identifient le
  moyen d'approvisionnement**, en texte libre juxtaposé (pas de ponctuation
  de séparation) : `Bidon 220L` + `bleu plastique Borde`. Le `Supplier` et
  la description détaillée restent des propriétés (`#set`), pas seulement du
  texte de titre — le titre n'en est qu'un résumé lisible.

Trois exemples réels tirés du TSV, chaînes complètes sur les trois niveaux :

**1. Cas simple — Ail éléphant (id 1)**
- Organique : `Ail éléphant`
- Référencé : `Ail éléphant Armand 2026` *(provenance/année Feuille 1, absentes du TSV de travail — voir §0)*
- Plantation : `Ail éléphant — Le Buisson de Cerzat (ECL-NNNN)`

**2. Cas à deux provenances — Chayote (id 5 et id 23)**
- Organique : `Chayote`
- Référencé n°1 (id 5, Buisson_Cerzat) : `Chayote Bene Bonno 2026`
- Référencé n°2 (id 23, Terrasse_Cyril_Chilhac) : `Chayote Non défini` —
  titre boiteux, parce que la provenance source est elle-même la valeur
  `Non défini` (donnée non qualifiée, pas juste un nom court). **Cas à
  trancher avec Cyril** : garder `Non défini` tel quel dans le titre, ou
  distinguer autrement (numéro de ligne, date) tant que la vraie provenance
  n'est pas connue ?
- Plantation n°1 : `Chayote — Le Buisson de Cerzat (ECL-NNNN)`
- Plantation n°2 : `Chayote — Terrasse de Chilhac (ECL-NNNN)`

**3. Cas de filiation — Poireau perpétuel (id 30, mère ; id 31, `issu_de=30`)**
- Organique : `Poireau perpétuel` *(orthographe à confirmer, voir §0)*
- Référencé (partagé par les deux plantations, décision 1.12) :
  `Poireau perpétuel Escuroux 2025`
- Plantation mère (id 30) : `Poireau perpétuel — Le Buisson de Cerzat (ECL-NNNN)`
- Plantation fille (id 31) : `Poireau perpétuel — Le Buisson de Cerzat (ECL-NNNN)`
  — **même Libellé que la mère**, seul `(ECL-NNNN)` les distingue. Confirme
  que la référence d'inventaire doit faire partie du titre, pas être un
  simple embellissement : sans elle, deux pages porteraient le même titre.

## 4. Stratégie de vérification (100 % des pages, pas un échantillon)

`result: Success` ne prouve pas que la donnée est en base (leçon tâche 6) ;
sur ~98 pages (30 organiques + 30 ou 31 référencés + 37 plantations), un
sondage ne couvre pas le risque qu'une ligne parmi 37 diffère silencieusement
d'un gabarit qui a fonctionné pour les 36 autres.

1. **Manifeste attendu, généré avant toute écriture.** Un script construit,
   à partir du TSV (et de la table lieu, et des références une fois
   attribuées séparément), une ligne par page à écrire : titre, propriétés
   attendues et leurs valeurs. Fichier local, pas sur le wiki — c'est la
   vérité de référence du contrôle, indépendante de ce que l'écriture aura
   réellement produit.
2. **Lecture individuelle après coup, pas d'échantillon.** `browsebysubject`
   ne prend qu'un sujet à la fois (pas de variante par lot constatée dans
   l'outillage disponible) : boucle sur les ~98 titres, un appel par page,
   comparaison programmatique valeur par valeur contre le manifeste. Coût
   ~98 appels GET, dans le même ordre de grandeur que les vérifications déjà
   faites tâche par tâche cette session — pas un obstacle.
3. **Doublons d'`Inventory_number`**, exigé par la tâche 7 elle-même : une
   requête comptant les valeurs après les 37 écritures d'items physiques,
   dans la même session, avant toute création par formulaire qui viendrait
   percuter le compteur.
4. **Intégrité référentielle croisée**, en plus du manifeste : chaque
   `Located_at` d'un physique pointe vers une des 3 pages de `Category:Lieu`
   réellement existantes (pas juste vers *une page* — vers *la bonne*,
   compte tenu de la table de correspondance du §2) ; chaque `Instance_of`
   d'un physique pointe vers un référencé qui existe et qui a bien été créé
   dans cette même session ; chaque `Corresponds_to_organic` d'un référencé
   pointe vers l'organique correspondant. Les trois par lecture des pages
   elles-mêmes, pas par confiance dans l'ordre d'écriture.
5. **Comptage final par catégorie**, recoupé avec le §1 : `#ask` sur
   `Category:Organic item`/`Referenced item`/`Physical item` filtré sur les
   pages créées dans cette session (par date de création ou par une
   propriété de lot si on en pose une), doit tomber sur 30 / (30 ou 31) / 37
   exactement. Un écart signale un doublon ou un oubli avant que ça ne se
   voie ailleurs.

Rien de tout ceci ne remplace la correction n° 1 en attente (le module
d'audit Base36 ne détecte toujours pas les doublons) : le contrôle du point 3
est une requête ponctuelle pour cette session, pas une fermeture de cette
correction.

## À trancher avant d'écrire quoi que ce soit

1. D'où viennent `provenance`/`annee_source` pour la génération réelle —
   report depuis `Feuille 1.tsv`, ressaisie, ou autre ? Bloquant pour tout
   item référencé qui ne soit pas un doublon dégénéré par espèce.
2. id 38 de la Feuille 1 (Miscanthus, doublon) : à inclure ou à laisser hors
   champ ?
3. Orthographe retenue pour `Poireau perpétuel`/`perpetuel`.
4. Définition de `Libellé` dans `<Libellé> (ECL-NNNN)` — `<Nom courant> —
   <Lieu>` proposé ci-dessus, à valider.
5. Titre d'un référencé dont la provenance source est elle-même `Non défini`
   (cas `Chayote` à Terrasse_Cyril_Chilhac).
