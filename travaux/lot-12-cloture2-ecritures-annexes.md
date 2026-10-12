# Lot 12 — Clôture 2 sur 3 : la valeur d'état manquante, un fait mesuré, deux notes et un lot nouveau

Date : 12 octobre 2026. Consigne de l'architecte, relayée par Cyril. Avant
toute écriture, Cyril l'a amendée sur trois points, en réponse à une série de
trois questions : voir « Avant d'écrire ». Les cinq pages annoncées ont été
touchées, et aucune autre.

## En bref

| Page | Révision avant | Taille avant | Révision après | Taille après | Résumé |
|---|---|---|---|---|---|
| Attribut:Service status | 1526 | 921 octets | 1544 | 946 octets | `[Lot 12][Clôture] état cédé, pour un objet donné ou vendu` |
| Formulaire:Physical item | 1531 | 2895 octets | 1545 | 2902 octets | `[Lot 12][Clôture] la liste du formulaire suit celle de la propriété` |
| Limites connues du Système de Gestion de Données Techniques | 1541 | 65494 octets | 1546 | 66765 octets | `[Lot 12][Clôture] le compteur de références peut rendre une valeur périmée` |
| Notes en attente de rangement | 1487 | 7670 octets | 1547 | 8769 octets | `[Lot 12][Clôture] deux idées trouvées pendant le lot 12` |
| Lot 42 — État de conception des modèles | — | page neuve | 1548 | 2006 octets | `[Lot 42][Création] état de conception des items référencés` |

Une édition par page, toutes avec le résultat `Success`, entre 16:22:47 et
16:23:23 UTC. Les Limites ont été écrites par `bin/wiki-append.sh`, en un seul
appel. Le lot 42 a été créé avec `--createonly`.

Les neuf vérifications sont conformes, la sixième dans sa forme amendée.
Deux points à signaler. `Gestion des lots` n'a suivi qu'après une purge,
prévue par la consigne. Et l'ajout de « cédé » a verrouillé la page de
propriété pendant moins de deux minutes : c'est une mesure que les Limites
n'avaient pas, voir la question A.

## Étape 1 — État du dépôt et règles locales

`git status --short --branch` :

```
## main...origin/main
?? travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md
```

Le seul fichier non suivi est celui que la consigne dit de laisser de côté.

`.claude/settings.local.json`, relevé au début de la tâche : 59 octets, aucune
règle.

```
{
  "permissions": {
    "allow": [],
    "deny": []
  }
}
```

## Étape 2 — Lectures

- `CLAUDE.md` : 806 lignes, dernier commit `6651236` du 10 octobre 2026,
  inchangé depuis la clôture 1.
- `Attribut:Service status`, révision 1526 : six `Allows value`, de « en
  service » à « perdu », type Text.
- `Formulaire:Physical item`, révision 1531 : la liste déroulante de
  `Service_status` porte les mêmes six valeurs, dans le même ordre.
- `Notes en attente de rangement`, révision 1487. Elle compte sept notes,
  datées du 10/10/26 au 01/09/26, toutes signées « Cyril ». En tête, la page
  pose trois règles et deux phrases de fonctionnement, dont : « Chaque note
  porte un titre, sa date et son auteur » et « Les notes les plus récentes
  sont en haut ».
- `Lot 41 — Convention de titre des pages`, lu comme patron. Il appelle
  `{{Lot}}` avec le numéro, l'état et le résumé, puis donne les sections
  Objet, Ce qui est déjà tranché, Périmètre, Risques connus, Points ouverts,
  Dépendances et Origine, un filet et un « Voir aussi ». Le contenu du lot 42
  reprend ce patron, sans les sections Risques connus, Dépendances et Origine.
- **Fin des `Limites connues`**, révision 1541 : 71 entrées. La dernière est
  l'entrée de la tâche 9 sur le tri, et la liste finit la page.
- **Plus grand numéro de lot : 41, comme attendu.** Par `action=ask` sur
  `Work_package_number::+` : 41 pages, numérotées de 1 à 41 sans trou. Toutes
  portent un tiret long dans leur titre. États : 22 identifiés, 10 livrés,
  6 clos, 3 ouverts.
- **`Gestion des lots`**, lue pour la vérification 8. Sa section « Compte »
  rendait : 41 lots au total, 3 en cours, 16 faits, 22 à venir, 0 abandonné.
  La somme était juste.

## Avant d'écrire : mesures et amendements

### Les faits cités par les textes à écrire

| Affirmation | Mesure | Résultat |
|---|---|---|
| Lot 42 : « Les 41 items référencés » | `action=ask` sur `Category:Referenced item`, recoupé par `list=categorymembers` | 41 et 41 |
| Lot 42 : le plus grand numéro existant vaut 41 | `action=ask` sur `Work_package_number::+` | 41 pages, de 1 à 41 |
| Le tiret long dans le titre « comme celui des quarante et un autres lots » | même requête, recherche de « — » dans chaque titre | 41 sur 41 |
| Entrée des Limites : retard du compteur après la création du lieu 0014, réévaluation à 0015, rien d'écrit avec la valeur périmée | rapport de la tâche 3, `travaux/lot-12-tache3-cas-essai.md`, « Écarts et surprises » et tableau des références évaluées | conforme |
| Entrée des Limites : fait nouveau | recherche dans le wikitexte des Limites de « périmé », « compteur », « même numéro », « numéro par défaut », « plus grand numéro » | aucune entrée sur ce retard ; les entrées 27 et 66 portent sur le compteur de la file de travaux, la 69 sur le numéro d'inventaire par défaut, valable pour le seul site par défaut |
| Note « Inventaire exhaustif » : « C'est ainsi que la limite des quatre sauts a été mesurée » | entrée 68 des Limites | « avec une référence calculée à part saut par saut » : conforme |

### Trois amendements de Cyril, demandés avant toute écriture

J'ai posé trois questions en une fois. Les réponses de Cyril :

1. **Place des deux notes.** `Notes en attente de rangement` dit : « Les notes
   les plus récentes sont en haut ». La consigne les plaçait en fin de page,
   avant la catégorie. Réponse : les placer en haut, celle du 12/10 d'abord,
   celle du 11/10 ensuite. Le remplacement reste unique, ancré sur le titre de
   la note du 10/10/26, réinséré inchangé après les deux nouvelles. La
   vérification 6 contrôle désormais que :
   - les deux nouvelles notes ouvrent la liste, dans cet ordre ;
   - les notes existantes suivent sans changement, dans leur ordre d'origine ;
   - la catégorie reste en fin de page.

   Elle cite aussi le nombre de sections avant et après, et l'ordre des dates
   après.
2. **Ligne d'auteur.** La même page veut « un titre, sa date et son auteur »,
   et les notes de la consigne portaient ''Lot 12, le 11/10/26'', une
   provenance. Réponse : mettre Cyril, avec un tiret simple et non un tiret
   long, « pour ne pas ajouter de caractères qui ne se tapent pas au
   clavier ». Les deux lignes deviennent :
   - ''Cyril, le 12/10/26 - lot 12'', pour la note des colonnes ;
   - ''Cyril, le 11/10/26 - lot 12'', pour celle de l'inventaire.

   Le reste des deux notes ne change pas.
3. **Dernière phrase de l'entrée des Limites.** Elle disait : « Sept autres
   évaluations faites le même jour n'ont montré aucun retard ». Le chiffre
   venait de mon rapport de la tâche 3, qui en oubliait. Le compte réel du
   11 octobre :
   - **Quatorze évaluations en tout.** Quatre au premier envoi (commit
     `079bf2f`), qu'aucune création n'avait précédées. Dix au second : une par
     création, plus la réévaluation du lieu 0015.
   - **Sept suivaient une création dans la même banque.** Ce sont :
     - les quatre évaluations de E1 qui ont précédé 0030, 0031, 0032 et 0033 ;
     - les deux évaluations de E2 avant le lieu 0015, la périmée et sa
       réévaluation ;
     - celle de E3 avant CWL-000D.

     Le retard n'est apparu qu'une fois.

   Réponse : remplacer la phrase par « Les cinq autres évaluations faites ce
   jour-là après une création dans la même banque n'ont montré aucun
   retard ; le compte ne porte que sur celles-là, puisqu'un retard ne peut se
   produire qu'après une création. » Le reste de l'entrée ne change pas.

**Une erreur de ma part dans la première question.** J'y ai écrit « les six
notes existantes », et la réponse de Cyril reprend « les six existantes ».
Elles sont sept, comme le montre `prop=sections` avant écriture. La
vérification 6 a donc porté sur les sept.

## Étapes 3 à 7 — Écritures

Session ouverte par `bin/wiki-login.sh` (« Success Cywil »). Avant toute
écriture, j'ai lu `prop=info&inprop=protection` et
`intestactions=edit|create` en détail complet, sous l'utilisateur Cywil :
aucune protection et aucune erreur sur les cinq titres. Le lot 42 était
`missing`. Chaque page a été préparée sur une copie locale. Les trois
remplacements ont été faits sur leur ancre exacte, présente une seule fois, et
les diffs relus avant l'envoi. Après écriture, le wikitexte relu en ligne est
identique au fichier envoyé pour la propriété, le formulaire et les notes
(`cmp`). Pour le lot 42, il ne diffère que par le saut de ligne final, que
MediaWiki retire. Pour les Limites, il est exactement l'ancien texte suivi de
l'ajout.

### Étape 3 — Attribut:Service status (1526 → 1544)

```diff
7a8
> [[Allows value::cédé]]
```

Motif, donné par la consigne : la page du lot range « détruit, perdu ou cédé »
parmi les fins de vie, et les six valeurs n'en couvraient que deux. Un objet
donné ou vendu n'avait aucun état juste, et « prêté » ne convient pas puisque
l'objet revient. Ce changement ferme la question B de la clôture 1.

### Étape 4 — Formulaire:Physical item (1531 → 1545)

```diff
33c33
< | {{{field|Service_status|input type=dropdown|values=en service,en réserve,prêté,en panne,rebuté,perdu}}}
---
> | {{{field|Service_status|input type=dropdown|values=en service,en réserve,prêté,en panne,rebuté,perdu,cédé}}}
```

La propriété a été écrite d'abord et le formulaire ensuite, dans l'ordre
« modèle avant formulaire » de `CLAUDE.md`. Ainsi, le formulaire n'a jamais
offert une valeur que la propriété refusait.

### Étape 5 — Limites connues (1541 → 1546)

`bin/wiki-append.sh`, un seul appel, a rendu ces trois contrôles :

```
Pré-contrôle OK — 71 entrées « # » avant ajout, la liste finit la page.
Post-controle OK : 71 -> 72 entrees, lajout est bien la derniere entree de la page.
Rendu OK : lajout sinsere dans la liste existante (1 bloc(s) <ol> sur la page).
```

Le fichier d'ajout, écrit avec l'outil d'écriture, contient un saut de ligne
initial suivi d'une seule ligne commençant par `# `, sans `[[` ni `{{`. Il
reprend le texte de la consigne, à une différence près : la dernière phrase
est remplacée selon l'amendement 3.

### Étape 6 — Notes en attente de rangement (1487 → 1547)

Un seul remplacement, ancré sur `== Ce que les refus de l'exécuteur protègent
réellement ==`, réinséré inchangé après les deux nouvelles notes, selon les
amendements 1 et 2 :

```diff
11a12,19
> == Colonnes d'une fiche de lieu selon le type de lieu ==
> ''Cyril, le 12/10/26 - lot 12''
> La table des items présents d'une fiche de lieu porte les mêmes colonnes pour tous les lieux : rang, position en mètres, date de plantation, état du plant. Trois d'entre elles sont vides sur la fiche d'un atelier, et une l'est sur celle d'une butte. Les conditionner au type de lieu demanderait de la machinerie pour un gain d'affichage, et le type de lieu est un texte libre que rien ne contraint.
> 
> == Inventaire exhaustif d'un lieu par extraction à plat ==
> ''Cyril, le 11/10/26 - lot 12''
> Une requête de page ne peut pas lister tout ce que contient une pièce : la chaîne qui traverse les contenants puis remonte l'arbre des lieux dépasse les quatre sauts admis. La reconstruction hors wiki n'a elle aucune limite de profondeur : une requête par propriété, à plat, puis le recollage des relations en local. C'est ainsi que la limite des quatre sauts a été mesurée. Reste à décider ce qu'on en fait, un script versé dans bin, une page d'inventaire régénérée de temps en temps, ou rien.
> 
```

### Étape 7 — Lot 42 — État de conception des modèles (création, 1548)

Le plus grand numéro relevé à l'étape 2 valait bien 41. Création par
`bin/wiki-put.sh … --createonly`, avec la réponse `"new": true` et `oldrevid`
0. Le contenu est celui de la consigne, mot pour mot. Le titre porte le tiret
long, et aucune virgule.

## Étape 8 — Vérifications

**File et purge.**
- **Attente de la file.** Au premier appel, `bin/wiki-wait-jobs.sh` a répondu
  « FILE FIGEE a 10 travaux » après cinq essais. J'ai fait une pause de cinq
  minutes en arrière-plan, et le script relancé a répondu « essai 1 :
  jobs=0 », puis « FILE VIDE ».
- **Purge.** J'ai purgé les cinq pages touchées et la fiche du fer à souder,
  en un appel à `bin/wiki-purge.sh` : `purged` et `linkupdate` à `True`
  pour les six.
- **`Gestion des lots`.** Elle a d'abord été lue sans purge, pour voir si
  elle suivait d'elle-même (vérification 8).

**1) Faits d'`Attribut:Service status`.** Conforme. Après purge, `_PVAL`
porte sept valeurs : en service, en réserve, prêté, en panne, rebuté, perdu,
cédé. `_TYPE` vaut `_txt`, `_MDAT` 2026-10-12 16:22:47, et il n'y a pas de
`_CHGPRO`. `intestactions=edit`, sous Cywil, ne rend aucune erreur.

Historique de `_CHGPRO` et du verrou, relevés après l'écriture de 16:22:47 :

| Heure (UTC) | Délai | `_CHGPRO` | `_PVAL` affiché | Verrou |
|---|---|---|---|---|
| 16:22:51 | 4 s | présent ; sa charge porte les sept valeurs | les six anciennes | `smw-change-propagation-protection` |
| 16:24:15 | 1 min 28 s | absent | les sept | — |
| 16:24:20 | 1 min 33 s | — | — | aucun |
| 16:28:06 | 5 min 19 s | — | — | aucun |
| 16:28:54, après purge | 6 min 07 s | absent | les sept | aucun |

Le verrou avait donc disparu avant la vérification 2, comme demandé.

**2) Essai en lecture seule, sans aucune écriture.** Conforme. J'ai rendu
quatre textes par `action=parse`, avec le titre
`Utilisateur:Cywil/Bac à sable` et `prop=text`, sans rien enregistrer :

| Texte rendu | Résultat |
|---|---|
| <code>[[Service_status::cédé]]</code> | affiche « cédé », sans infobulle ni classe d'avertissement : acceptée |
| <code>[[Service_status::en rade]]</code> | avertissement : « « en rade » n'est pas dans la liste (en service, en réserve, prêté, en panne, rebuté, perdu, cédé) des valeurs autorisées pour la propriété « Service status ». » : refusée |
| <code>{{#set:Service_status=cédé}}</code>, en complément | rien d'affiché, aucun avertissement : acceptée |
| <code>{{#set:Service_status=en rade}}</code>, en complément | même avertissement : refusée |

Le message de refus cite la liste effectivement appliquée. Elle compte sept
valeurs, « cédé » comprise, ce qui confirme que la contrainte active a suivi
`_PVAL`. Les deux rendus par `#set` ne sont pas demandés par la consigne. Je
les ai ajoutés parce que les fiches passent par le `#set` de
`Modèle:Physical item`.

**3) Fiche du fer à souder.** Conforme. Après purge, la fiche
`Fer à souder — Atelier appartement (CWL-0009)`, toujours à la révision 1537,
affiche « État de service en service ». `bin/wiki-warnings.sh` répond « Aucun
avertissement », et le rendu ne contient aucune classe d'erreur. Le fait
stocké vaut `Service_status` = en service, et la fiche ne porte pas de
`_ERRC`.

**4) Liste du formulaire physique.** Conforme. Le wikitexte en ligne porte
`values=en service,en réserve,prêté,en panne,rebuté,perdu,cédé` : sept valeurs,
aucune espace autour d'une virgule, dans le même ordre que sur la propriété.

**5) Limites connues.** Conforme.
- **Dernière entrée.** C'est l'ajout : le wikitexte en ligne vaut exactement
  l'ancien texte suivi du fichier d'ajout.
- **Compte.** De 71 à 72 entrées, d'après le script et d'après le recompte
  des lignes en `# `.
- **Rendu.** Après purge, un seul bloc `<ol>`, de 72 éléments, dont le
  dernier commence par « Le compteur de références peut rendre une valeur
  périmée ».
- **Faits.** Seulement `_INST` = Page de suivi, `_MDAT` 2026-10-12 16:23:11 et
  `_SKEY`.
- **Catégories** (`prop=categories`). Page de suivi seule : aucune catégorie
  de suivi apparue.
- **Liens** (`prop=links`). Quatre, comme avant, tous existants.
- **Erreurs.** Aucune classe d'erreur, et `bin/wiki-warnings.sh` répond
  « Aucun avertissement ».

**6) Notes en attente de rangement.** Conforme à la forme amendée.
- **Sections.** Sept avant, neuf après, dans cet ordre :
  1. Colonnes d'une fiche de lieu selon le type de lieu ;
  2. Inventaire exhaustif d'un lieu par extraction à plat ;
  3. Ce que les refus de l'exécuteur protègent réellement ;
  4. Couche sociale au-dessus du wiki : piste Communecter ;
  5. Sens de la relation « souhaité par », concept de projet et alignement
     PAIR ;
  6. Revoir le principe de nommage des photos importée ;
  7. Fusion des items physiques de plantes ;
  8. Tri automatique des images non utilisées ;
  9. Taille des images téléversées.
- **Ordre des dates après écriture.** 12/10/26, 11/10/26, 10/10/26,
  05/10/26, puis 01/09/26 cinq fois. La cinquième note porte « 01/09/26 —
  complétée le 07/09/26 ».
- **Notes existantes intactes.** Dans le wikitexte en ligne, l'en-tête, de la
  première ligne jusqu'à la première note, est identique octet pour octet à
  celui d'avant. Les sept notes d'origine le sont aussi, de leur premier titre
  jusqu'à la fin.
- **Catégorie.** Elle reste la dernière ligne : `[[Catégorie:Page de suivi]]`.
- **Rendu.** Catégorie Page de suivi. Les quatre mêmes liens qu'avant, tous
  existants. Aucune classe d'erreur. Faits : `_INST`, `_MDAT` et `_SKEY`
  seulement, la page n'en portait pas d'autre avant.

**7) Lot 42.** Conforme.
- **Encadré.** Le rendu affiche l'encadré du modèle Lot : « Lot,
  Identification, Numéro 42, État identifié, Calendrier, Ouvert le —, … ».
- **Faits.** `Work_package_number` = 42, `Work_package_status` = identifié,
  `Work_package_summary` conforme, trois `_ASK`, `_INST` = Lot.
- **Sections.** Objet, Ce qui est déjà tranché, Périmètre, Points ouverts.
- **Liens.** Deux, tous deux existants : Gestion des lots et Limites connues.
- **Catégorie.** Lot.
- **Erreurs.** Aucune classe d'erreur, aucun avertissement.

**8) Gestion des lots.** Conforme après purge.
- **Avant purge.** La page lue telle quelle n'avait pas suivi : 41 lots au
  total, 3 en cours, 16 faits, 22 à venir, 0 abandonné, et pas de lot 42 dans
  « À venir ».
- **Après purge.** 42 au total, 3 en cours, 16 faits, 23 à venir,
  0 abandonné. La somme des quatre états vaut 42, comme le total. Le lot 42
  figure dans le tableau « À venir », qui a 23 lignes.
- **Page intacte.** Elle n'a pas été modifiée et reste à la révision 1240.
  Aucune classe d'erreur, aucun lien vers une page inexistante.

**9) Erreurs et avertissements.** Conforme. `bin/wiki-warnings.sh` répond
« Aucun avertissement » pour les sept pages : les cinq touchées, `Gestion des
lots` et la fiche du fer. Aucun des rendus relus ne contient de classe
d'erreur. Pour la page de propriété, j'ai écarté `smw-highlighter` de la
recherche des classes, puisqu'il y sert aussi aux infobulles ordinaires des
propriétés ; ses avertissements sont couverts par `bin/wiki-warnings.sh`.

## Étape 9 — Fin de tâche

`.claude/settings.local.json`, relevé à la fin de la tâche : 59 octets, aucune
règle, contenu identique à celui du début.

```
{
  "permissions": {
    "allow": [],
    "deny": []
  }
}
```

`git status --short --branch` avant le commit : `## main...origin/main`, plus
deux fichiers non suivis. Le premier est
`travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md`, qui
ne compte pas. Le second est ce rapport.

## Écarts et surprises

- **La consigne plaçait les deux notes en fin de page.** C'était contraire à la
  règle de la page, « Les notes les plus récentes sont en haut ». Corrigé avant
  écriture sur la réponse de Cyril (amendement 1).
- **La consigne donnait une provenance à la place d'un auteur.** Ses lignes de
  date, ''Lot 12, le …'', ne respectaient pas « Chaque note porte un titre, sa
  date et son auteur ». Corrigé avant écriture (amendement 2) : « Cyril », et
  un tiret simple.
- **La dernière phrase de l'entrée des Limites sous-comptait les évaluations.**
  L'erreur venait de mon rapport de la tâche 3. Il ne citait que les cinq
  évaluations de E1 et les deux de E3 du second envoi. Il omettait celle de E2
  pour le lieu 0014 et les quatre du premier envoi. Surtout, il ne disait pas
  qu'un retard n'a de sens qu'après une création. Corrigé avant écriture
  (amendement 3). Le rapport de la tâche 3 est un procès-verbal : je ne l'ai
  pas modifié.
- **Une erreur de compte dans ma propre question.** J'y ai écrit « six notes
  existantes » ; il y en a sept. La réponse de Cyril a repris le chiffre. La
  vérification 6 a porté sur les sept.
- **Un ajout de valeur autorisée verrouille aussitôt la page de propriété, et
  le verrou s'est levé en moins de deux minutes.** Les Limites ne l'avaient pas
  mesuré. Relevés sur `Attribut:Service status`, après l'écriture de
  16:22:47 :
  - à 16:22:51, soit 4 s plus tard, `_CHGPRO` est présent. Sa charge porte les
    sept valeurs, mais `_PVAL` affiche encore les six anciennes, et
    `intestactions=edit` rend `smw-change-propagation-protection` ;
  - à 16:24:15 (88 s), `_CHGPRO` a disparu et `_PVAL` porte les sept valeurs ;
  - à 16:24:20 (93 s), le verrou est levé.

  À la clôture 1, la réécriture des deux descriptions
  d'`Attribut:Storage rank` n'avait au contraire fait apparaître ni
  `_CHGPRO` ni verrou, sur 6 min 32 s de relevés. Ces deux mesures touchent
  trois entrées des Limites :
  - l'entrée 65 dit qu'un ajout de valeur autorisée verrouille « très
    probablement ». Elle précise que c'est « mesuré pour un changement de
    type (entrée 62) mais pas pour un ajout de valeur autorisée » ;
  - les entrées 62 et 65 disent que le verrou se lève « en quelques jours » ;
  - l'entrée 14 dit qu'il se lève « en un temps qui se compte en jours et non
    en minutes ». Elle note aussi : « Cause exacte du déclenchement non
    établie ».

  Je n'y ai pas touché. Voir la question A.
- **`bin/wiki-wait-jobs.sh` a de nouveau annoncé une file figée**, à
  10 travaux, alors que la propagation de la propriété s'est achevée pendant
  ces mêmes relevés. Après la pause de cinq minutes, le script a trouvé la file
  vide au premier essai. Cela confirme la leçon déjà écrite dans `CLAUDE.md`.
- **`Gestion des lots` n'a suivi qu'après une purge.** Lue sans purge après la
  création du lot 42, elle affichait encore 41 lots ; purgée, 42. C'est le
  comportement que décrivent la procédure de clôture et l'entrée 47 des
  Limites (« se rafraîchit avec retard, pas jamais »). La page n'a pas été
  modifiée.
- **Un paramètre faux de ma part, sans effet.** J'ai lancé un
  `intestactionsdetail=quiet`, valeur que cette version de MediaWiki ne
  connaît pas. L'API a répondu `badvalue` et n'a rien fait. J'ai relancé avec
  `full`.
- **La question B de la clôture 1 est close par l'étape 3.** La question A
  de la clôture 1 ne l'est pas : il s'agit des arbitrages non écrits sur le
  vocabulaire des états et sur la branche de la fonction de rangement. Cette
  consigne ne la traite pas, et elle reste ouverte.

## Questions

**A.** L'ajout de « cédé » à `Attribut:Service status` a verrouillé la page dans
les quatre secondes, et le verrou était levé 93 secondes au plus tard après
l'écriture. La réécriture de deux descriptions, à la clôture 1, n'avait
déclenché ni `_CHGPRO` ni verrou. Les Limites disent le contraire ou
l'ignorent :
- l'entrée 65 dit que ce verrou vient « très probablement », mesuré « pour un
  changement de type (entrée 62) mais pas pour un ajout de valeur
  autorisée » ;
- les entrées 62 et 65 annoncent une levée « en quelques jours » ;
- l'entrée 14 dit « en jours et non en minutes », et « Cause exacte du
  déclenchement non établie ».

Faut-il consigner ces deux mesures ? Suggestion : oui, en une entrée nouvelle
à la suite, par `bin/wiki-append.sh`. Elle dirait qu'un ajout de valeur
autorisée verrouille aussitôt, que le verrou peut se lever en moins de deux
minutes, et qu'une réécriture de description ne le déclenche pas. Elle
renverrait aux entrées 14, 62 et 65, dont les délais deviendraient une plage
et non une règle. Corriger ces trois entrées en place demanderait de
réécrire toute la page.
