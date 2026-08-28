# Exécution — verrou Casc, et rattachement des 45 photos

## 1. Le verrou sur les deux Attribut:Casc — vérifié, aucune écriture

`action=query&prop=info&inprop=protection&intestactions=edit&intestactionsdetail=full`
sur les deux pages :

```
Attribut:Casc parent
  protection: []
  actions.edit[0].code: "smw-change-propagation-protection"

Attribut:Casc lineage
  protection: []
  actions.edit[0].code: "smw-change-propagation-protection"
```

**Code d'erreur confirmé : `smw-change-propagation-protection`, sur les
deux pages.** `protection: []` dans les deux cas — invisible à
`prop=info` seul, exactement le point aveugle déjà consigné dans
`CLAUDE.md` (§ Garde-fous d'exécution, point 5) : la protection native ne
voit ni Lockdown ni ce verrou SMW.

**Hypothèse confirmée** : le blanchiment du 26 août (qui a retiré leur
`Has type`) a déclenché une propagation de changement, et celle-ci
apparaît coincée — même signature que sur `Attribut:INSEE code` depuis le
21 août (limite consignée dans *Limites connues du SGDT*, propriété
`Property_range` plafonnée à 85 caractères, six pages verrouillées à
cette date). **La demande à fuzzy passe donc de une à trois pages** :
`Attribut:INSEE code`, `Attribut:Casc parent`, `Attribut:Casc lineage`.

**À consigner séparément** (non fait ici, hors périmètre de cette tâche) :
blanchir une page de propriété avant de la supprimer ajoute un verrou de
propagation de changement, qui peut bloquer la suppression elle-même —
distinct du cas déjà connu (dépassement de `Property_range`). Cyril
tranchera s'il veut une entrée dédiée sur *Limites connues* ou un
complément à l'entrée existante.

Aucune écriture faite sur ces deux pages.

## 2. Les 45 photos du groupe A — écrites, une par une

Ancre corrigée comme demandé : `|Image_location=Le Buisson de Cerzat`
(barre verticale comprise), jamais `Image_location=...}}`. Vérifiée
unique dans le texte complet de chaque page avant remplacement — y
compris sur les pages à `Depicts_specimen` multivalué, dont plusieurs
titres d'items contiennent eux-mêmes la sous-chaîne « Le Buisson de
Cerzat » (ex. `Ail éléphant — Le Buisson de Cerzat (ECL-0003)`) : l'ancre
au `|` ne les confond pas, contrairement à l'ancre `}}` écartée à la
tâche précédente.

Séquence par page : lecture (`wiki-get.sh`), comptage de l'ancre,
remplacement, écriture (`wiki-put.sh`, résumé
`[Correctif] Image_location vers <lieu cible>`), relecture, vérification
que l'ancienne ancre a disparu et la nouvelle est présente. Script
d'orchestration en `scratchpad` appelant ces deux scripts existants pour
chaque page (aucun script de `bin/` modifié, aucun appel direct à l'API
d'écriture) ; conçu pour s'arrêter au premier échec — non déclenché,
les 45 pages sont passées sans arrêt.

**Résultat : 45/45 écritures réussies, 45/45 relectures conformes.**
Detail des 45 (page, revid avant → après, cible) :

| Photo | oldrevid → newrevid | Cible |
|---|---|---|
| ECL-Buisson Cerzat-Ail elephant-2026-08-07_01.jpg | 653 → 1024 | Butte de la tranchée |
| ECL-Buisson Cerzat-Ail elephant-2026-08-07_02.jpg | 654 → 1025 | Butte de la tranchée |
| ECL-Buisson Cerzat-Ail elephant-2026-08-07_03.jpg | 655 → 1026 | Butte de la tranchée |
| ECL-Buisson Cerzat-Ail elephant-2026-08-08_01.jpg | 656 → 1027 | Butte de la tranchée |
| ECL-Buisson Cerzat-Bourrache-2026-08-08_01.jpg | 657 → 1028 | Butte de la tranchée |
| ECL-Buisson Cerzat-Brocoli vivace-2026-08-08_01.jpg | 658 → 1029 | Butte de la tranchée |
| ECL-Buisson Cerzat-Capucine tubereuse-2026-08-08_01.jpg | 659 → 1030 | Butte de la tranchée |
| ECL-Buisson Cerzat-Chayote-2026-08-08_01.jpg | 660 → 1031 | Au pied du pylône électrique |
| ECL-Buisson Cerzat-Chou Daubenton-2026-08-08_01.jpg | 661 → 1032 | Butte de la tranchée |
| ECL-Buisson Cerzat-Consoude B14-2026-08-08_01.jpg | 662 → 1033 | Extrémité de tranchée |
| ECL-Buisson Cerzat-Consoude naine-2026-08-08_01.jpg | 663 → 1034 | Extrémité de tranchée |
| ECL-Buisson Cerzat-Crosne du Japon-2026-08-08_01.jpg | 669 → 1035 | Butte de la tranchée |
| ECL-Buisson Cerzat-Egopode-2026-08-08_01.jpg | 670 → 1036 | Butte de la tranchée |
| ECL-Buisson Cerzat-Fraisier X-2026-08-08_01.jpg | 671 → 1037 | Butte de la tranchée |
| ECL-Buisson Cerzat-Fraisier X2-2026-08-08_01.jpg | 672 → 1038 | Butte de la tranchée |
| ECL-Buisson Cerzat-Helianthi-2026-08-08_01.jpg | 674 → 1039 | Butte de la tranchée |
| ECL-Buisson Cerzat-Hemerocalle-2026-08-08_01.jpg | 675 → 1040 | Butte de la tranchée |
| ECL-Buisson Cerzat-Hemerocalle-2026-08-08_02.jpg | 676 → 1041 | Butte de la tranchée |
| ECL-Buisson Cerzat-Hemerocalle-2026-08-08_03.jpg | 677 → 1042 | Butte de la tranchée |
| ECL-Buisson Cerzat-Hemerocalle-2026-08-08_04.jpg | 678 → 1043 | Butte de la tranchée |
| ECL-Buisson Cerzat-Hysope-2026-08-08_01.jpg | 731 → 1044 | Butte de la tranchée |
| ECL-Buisson Cerzat-Menthe X-2026-08-08_01.jpg | 679 → 1045 | Butte de la tranchée |
| ECL-Buisson Cerzat-Menthe bergamote-2026-08-08_01.jpg | 680 → 1046 | Butte de la tranchée |
| ECL-Buisson Cerzat-Miscanthus-2026-08-08_01.jpg | 681 → 1047 | Butte de la tranchée |
| ECL-Buisson Cerzat-Miscanthus-2026-08-08_02.jpg | 682 → 1048 | Butte de la tranchée |
| ECL-Buisson Cerzat-Miscanthus-2026-08-08_03.jpg | 683 → 1049 | Butte de la tranchée |
| ECL-Buisson Cerzat-Miscanthus-2026-08-08_04.jpg | 684 → 1050 | Butte de la tranchée |
| ECL-Buisson Cerzat-Oignon rocambole-2026-08-08_01.jpg | 685 → 1051 | Butte de la tranchée |
| ECL-Buisson Cerzat-Paulownia-2026-08-08_01.jpg | 686 → 1052 | Butte de la tranchée |
| ECL-Buisson Cerzat-Paulownia-2026-08-08_02.jpg | 687 → 1053 | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-07_01.jpg | 688 → 1054 | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-07_02.jpg | 689 → 1055 | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-07_03.jpg | 690 → 1056 | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-07_04.jpg | 691 → 1057 | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_01.jpg | 692 → 1058 | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_02.jpg | 693 → 1059 | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_03.jpg | 694 → 1060 | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_04.jpg | 695 → 1061 | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_05.jpg | 696 → 1062 | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_06.jpg | 697 → 1063 | Butte de la tranchée |
| ECL-Buisson Cerzat-Poireau perpetuel-2026-08-08_07.jpg | 698 → 1064 | Butte de la tranchée |
| ECL-Buisson Cerzat-Roquette sauvage-2026-08-08_01.jpg | 701 → 1065 | Butte de la tranchée |
| ECL-Buisson Cerzat-Sarrasin vivace-2026-08-08_01.jpg | 702 → 1066 | Butte de la tranchée |
| ECL-Buisson Cerzat-Tomates-2026-08-08_01.jpg | 703 → 1067 | Butte de la tranchée |
| ECL-Buisson Cerzat-Yacon-2026-08-08_01.jpg | 704 → 1068 | Butte de la tranchée |

**Groupe B intact** : les 8 photos (couleuvre × 5, gainage/raboutage
câble × 3) n'ont reçu aucune écriture — laissées à `Le Buisson de
Cerzat`, décision de Cyril à venir.

## Contrôles après écriture

File de travaux : figée à 92 sur cinq lectures rapprochées (3 s
d'intervalle) juste après les 45 écritures, puis vidée en une lecture
supplémentaire espacée d'une minute (`jobs=0`). Les contrôles suivants
ont été pris file vide.

- **Requête en liste** `[[Image_location::Le Buisson de Cerzat]]`
  (jamais `format=count`) : **exactement 8 résultats**, les huit du
  groupe B, aucun autre.
- **Répartition complète** (`[[Image_location::+]]|?Image_location`,
  73 sujets) :
  ```
  42 Butte de la tranchée
  15 Jardin de Chilhac
   8 Le Buisson de Cerzat
   5 Terrasse de Chilhac
   2 Extrémité de tranchée
   1 Au pied du pylône électrique
  ```
  Conforme aux comptes attendus (Butte de la tranchée 42, Extrémité de
  tranchée 2, Au pied du pylône électrique 1).
- **`browsebysubject` sur trois photos**, dont les deux Consoudes et la
  Chayote :
  ```
  Consoude B14   → Image_location -> Extrémité_de_tranchée
  Consoude naine → Image_location -> Extrémité_de_tranchée
  Chayote        → Image_location -> Au_pied_du_pylône_électrique
  ```
  Les trois concordent avec la table ci-dessus.
- **Erreurs de traitement SMW** : **1**, `Attribut:INSEE code` — lu sur
  le rendu de la page (`action=parse&prop=text`, compte affiché « 1 »,
  table à une ligne), pas sur `action=ask&format=count` (défaut connu
  depuis le 21 août). Inchangé par les 45 écritures : aucune nouvelle
  erreur introduite.

Aucun écart entre `ask` et `browsebysubject` sur les trois échantillons ;
aucune erreur SMW nouvelle ; le compte des 8 restantes au groupe B est
exact.
