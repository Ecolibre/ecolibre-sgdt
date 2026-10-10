# Lot 22 — Tâche 14 — Écriture de la clôture

Exécuteur : Claude Code, 10 octobre 2026 (date relevée par `date` : sam.
10 oct. 2026 13:11:55 CEST au début, 13:24:39 CEST avant ce rapport). Une
seule page du wiki écrite : *Lot 22 — Miroir local*. La procédure de
clôture elle-même est appliquée par la conversation claude.ai ; cette
consigne ne demandait que des écritures ordinaires.

**Résultat : la page du lot 22 porte l'état clos, livré le 9 octobre 2026,
clos le 10, le rapport de clôture en permalien, et le compte de douze
écarts. Révision 1485 → 1489. Les huit contrôles passent.**

## Révisions

| Page | Avant | Après | Horodatage |
|---|---|---|---|
| Lot 22 — Miroir local | 1485 | **1489** | 2026-10-10T11:23:25Z |

Résumé : `[Lot 22][Tâche 14] Clôture du lot : livré le 9 octobre 2026, clos
le 10, rapport de clôture en permalien, compte porté à douze`.

## Étape 1 — État du dépôt

`git status --porcelain` : vide. `.claude/settings.local.json` : `allow` et
`deny` vides.

## Étape 2 — Les corrections du dépôt

Commit **`302e513ab8ed3607fde0d033640502d6be95ebdd`**, poussé :

```
 miroir/LocalSettings_miroir.php |  5 +++--
 travaux/lot-22-cloture.md       | 50 +++++++++++++++++++++++++++--------------
 2 files changed, 36 insertions(+), 19 deletions(-)
```

### Correction B — en-tête de `miroir/LocalSettings_miroir.php`

Avant :

```
# (1 à 9, et 11) sont marqués « ÉCART n » ci-dessous ; le dixième porte sur
# les modules PHP de l'image (miroir/Dockerfile). Toute autre différence de comportement
```

Après :

```
# (1 à 9, et 11) sont marqués « ÉCART n » ci-dessous ; le dixième et le
# douzième portent sur l'image PHP (miroir/Dockerfile) : ses modules PHP,
# et PHP en module Apache au lieu de FPM. Toute autre différence de comportement
```

Commentaire seulement : aucune ligne de code, aucun `getenv()`, aucune
valeur en dur dans le diff, montré à Cyril et validé avant la poussée.

### Correction A et précision — `travaux/lot-22-cloture.md`

Erreur 1, le masquage, fin du paragraphe :

> Le filtre n'avait été essayé sur aucun cas où le secret était présent ;
> l'erreur s'est vue à l'affichage même du secret. L'architecte a vu le
> secret dans la sortie collée par Cyril, donc après coup (source :
> l'architecte, consigne de la tâche 14 ; aucun rapport du dépôt ne le
> porte). C'est de là que viennent la règle 8 de `CLAUDE.md` et le second
> motif de la demande de rotation.

Erreur 2, le motif d'exclusion :

> **Ce qui l'a attrapée : la vérification qui tranche inscrite dans la
> consigne elle-même**, qui listait le contenu de l'archive au lieu de
> relire le motif, au premier essai. L'archive a été refaite avec le motif
> corrigé, et la nouvelle vérifiée par trois contrôles de liste. Le
> contrôle a fonctionné ; c'est le filtre qui avait échoué. Aucun rapport
> du dépôt ne la couvre : cette archive a été faite dans le terminal de
> Cyril, pas par l'exécuteur (source : l'architecte, consigne de la
> tâche 14).

Fin de la section 6, texte de Cyril (point D) :

> Trois des cinq ont été attrapées avant de produire leur effet : la
> deuxième par le contrôle de liste, avant que l'archive défectueuse ne
> serve ; la quatrième et la cinquième avant toute écriture. La troisième
> l'a été après coup, le chiffre faux ayant été inscrit sur la page du lot
> puis corrigé en tâche 10. La première ne l'a jamais été. Un filtre jugé
> sur son intention ne se contrôle pas ; jugé sur ce qu'il produit, il se
> contrôle.

Précision, section 5, puce du douzième écart :

> Les dix limites PHP vérifiées en tâche 6 restent justes : l'égalité des
> valeurs entre `apache2/php.ini` et `fpm/php.ini` de la production a été
> mesurée le 9 octobre 2026 par Cyril, dans son terminal, en session SSH,
> et non par l'exécuteur. Cette mesure ne vit que dans la conversation
> claude.ai : aucun fichier du dépôt ni aucune page du wiki ne la porte.

Et, dans « Écarts et surprises » (point F, avec l'amorce en gras) :

> **La page du lot comptait encore « onze » écarts**, deux fois. L'écriture
> de clôture de la tâche 14, qui suit ce commit, les porte à douze : ce
> rapport est écrit avant elle et ne peut pas en rendre compte.

## Étape 3 — Le permalien

https://github.com/Ecolibre/ecolibre-sgdt/blob/302e513ab8ed3607fde0d033640502d6be95ebdd/travaux/lot-22-cloture.md

**200** avant l'écriture. Forme relevée sur la page du lot 34, lue par
l'API : `Work_package_closure_report=` suivi de l'URL `blob` complète, SHA
en 40 caractères, sans crochets ni libellé.

## Étape 4 — La clôture de la page

**Titre** lu dans `Catégorie:Lot` : « Lot 22 — Miroir local ». **Révision
avant écriture : 1485**, `protection: []`.

**Ordre des champs** relevé dans `Modèle:Lot` : `number`, `status`,
`summary`, `opening_date`, `delivery_date`, `closure_date`,
`closure_report`, `depends_on`, `overlaps`, `revises`, `produces`. Les trois
champs nouveaux se placent donc entre `opening_date` et `produces`.

**Diff complet 1485 → 1489** (`diff`, wikitexte de la 1485 sauvegardé avant
écriture) :

```
3c3
< |Work_package_status=ouvert
---
> |Work_package_status=clos
5a6,8
> |Work_package_delivery_date=2026-10-09
> |Work_package_closure_date=2026-10-10
> |Work_package_closure_report=https://github.com/Ecolibre/ecolibre-sgdt/blob/302e513ab8ed3607fde0d033640502d6be95ebdd/travaux/lot-22-cloture.md
33c36
< … Ils sont onze au 9 octobre 2026.
---
> … Ils sont douze au 9 octobre 2026.
71c74
< … — les onze écarts entre le miroir et la production et leur motif, …
---
> … — les douze écarts entre le miroir et la production et leur motif, …
```

(Lignes 33 et 71 abrégées ici par « … » ; le reste de chaque ligne est
inchangé, voir le contrôle 2.) Copie locale : `pages/Lot_22_cloture.txt`.

## Étape 5 — Vérifications

1. **QUI TRANCHE — passe.** `bin/wiki-api.sh --facts`, avant et après.
   Différences, et seulement celles-là :
   - ajoutés : `Work_package_closure_date -> ['1/2026/10/10']`,
     `Work_package_closure_report -> ['https://github.com/Ecolibre/ecolibre-sgdt/blob/302e513ab8ed3607fde0d033640502d6be95ebdd/travaux/lot-22-cloture.md']`,
     `Work_package_delivery_date -> ['1/2026/10/9']` ;
   - changés : `Work_package_status` `ouvert` → `clos` ; `_MDAT`
     `1/2026/10/9/23/24/43/0` → `1/2026/10/10/11/23/25/0`.

   Inchangés : `Work_package_number` 22, `Work_package_opening_date`
   `1/2026/10/9`, `Work_package_produces` `Miroir_local_du_wiki`,
   `Work_package_summary`, les trois `_ASK` aux mêmes hachages, `_INST`
   Lot, `_SKEY`.
2. **Wikitexte relu — passe.** Le wikitexte de la 1489, relu par
   `bin/wiki-get.sh`, est identique au fichier envoyé (`diff` vide). Le
   `diff` entre la 1485 et la 1489 compte 9 lignes marquées : 3 retirées
   (statut et les deux lignes de compte) et 6 ajoutées (statut, trois
   champs, deux lignes de compte). Toutes les autres lignes sont
   identiques au caractère près. Dans les deux lignes de compte, seul le
   mot « onze » est devenu « douze » : elles ont été produites par une
   substitution `sed` limitée à ce mot, et le diff ci-dessus les montre en
   entier avant d'être abrégé ici.
3. **Plus aucun « onze » — passe.** `grep -c -i onze` sur la 1489 : 0.
4. **Catégories et liens — passe.** `prop=categories` : `Catégorie:Lot`
   seule. `generator=links` : quatre liens (`Gestion des lots`, `Lot 20 —
   External Data`, `Attribut:Work package status`, `Miroir local du
   wiki`), aucun `missing`.
5. **Permalien — passe.** 200, revérifié après l'écriture.
6. **Index *Gestion des lots*** (lu par `action=parse`, sans purge) : la
   ligne du lot 22 montre déjà « clos », le résumé, deux dates (9 octobre
   2026 et 9 octobre 2026, ouverture et livraison) et le permalien du
   rapport de clôture. La date de clôture n'apparaît pas dans cette ligne ;
   je n'en tire aucune conclusion, la consigne prévenant que le rendu peut
   retarder et la colonne n'ayant pas été relevée. Le lot 22 apparaît aussi
   dans la ligne du lot 20, au titre de sa dépendance.
7. **Le miroir tourne — passe.** `http://localhost:8080/wiki/Accueil` :
   **200**.
8. **`.claude/settings.local.json`** : `allow` et `deny` vides, au début et
   à la fin.

## Questions posées ou réponses rendues hors consigne

- **Refus de Cyril, sur le fond.** Ma première commande de l'étape 2
  plaçait `git diff --stat` avant `git add`, dans la même commande que le
  commit et la poussée : l'inspection serait arrivée après la poussée,
  irréversible pour un secret puisque la poussée forcée est interdite.
  Cyril l'a refusée et a demandé le diff complet de
  `miroir/LocalSettings_miroir.php`, puis celui de
  `travaux/lot-22-cloture.md`.
  **Ce que ce refus a changé :** inspection d'abord, dans une commande ;
  add, commit et push ensuite, dans une autre, après accord. Et la section
  6 du rapport de clôture, relue avant d'être figée par le permalien, a
  été corrigée sur trois points (D, E, F ci-dessous).
- **D, E, F**, posés après lecture du diff, avant la poussée :
  - **D.** La phrase « Quatre des cinq ont été attrapées avant de produire
    leur effet » était fausse : l'erreur 3 avait été inscrite sur la page
    avant d'être corrigée. Réponse de Cyril : phrase exacte fournie, écrite
    mot pour mot.
  - **E.** Phrase mal construite dans l'erreur 1. Réponse : phrase fournie.
  - **F.** La puce « La page du lot compte encore « onze » » serait
    devenue fausse une fois figée. Réponse : texte fourni, puis amorce en
    gras.

  Les accents absents du texte collé ont été rétablis.
- **Dénombrement annoncé faux.** J'avais annoncé 25 insertions et 13
  suppressions pour le commit de l'étape 2. Le commit en compte 36 et 19.
  C'est mon compte qui était faux, pas le contenu : le diff montré à Cyril
  donne 33 et 17 pour le rapport, plus 3 et 2 pour l'en-tête. Constaté
  après la poussée, à la lecture de `git show --stat`.

## Écarts et surprises

- **« Ils sont douze au 9 octobre 2026. »** La consigne demandait de
  changer seulement le nombre. Le douzième écart existait bien le 9 octobre
  2026, mais il n'a été relevé que le 10, en tâche 13 : la phrase reste
  exacte sur l'état du miroir, mais elle date le compte de la veille de sa
  découverte. **G.** Faut-il écrire « au 10 octobre 2026 » ? Suggestion :
  oui, par un `[Correctif]` d'un mot, ou laisser en l'état si l'on lit la
  date comme celle de l'état mesuré.
- **Le lien de « Fichiers produits » pointe sur l'ancienne version.** La
  ligne qui dit maintenant « les douze écarts » renvoie au permalien de
  `miroir/ecarts-avec-la-production.md` au commit `ed14a89`, qui n'en porte
  que onze. Les cinq liens de la liste sont tous au commit `ed14a89`. **H.** Faut-il
  reconstruire ces permaliens sur `302e513` ? Suggestion : oui, au moins
  celui du fichier des écarts, dans une écriture séparée, puisque cette
  consigne interdisait toute autre modification de la page.
- **`pages/Lot_22_cloture.txt`** : copie locale de la page, versionnée
  comme les autres copies de `pages/`, jointe au commit de ce rapport.
