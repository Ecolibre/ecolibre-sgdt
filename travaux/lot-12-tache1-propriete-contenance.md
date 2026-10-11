# Lot 12 — tâche 1 sur 4 : ouverture du lot et création de la propriété de contenance

Exécutée le 11 octobre 2026. Aucun modèle, aucun formulaire, aucune donnée touchés.

## 1. État du dépôt et règles locales au départ

`git status --porcelain` :

```
?? travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md
```

Aucun fichier suivi modifié. Le seul fichier non suivi est le rapport que Cyril a demandé, le 10 octobre 2026, de laisser hors de git : il n'a pas été commité (voir Écarts).

`.claude/settings.local.json`, aucune règle :

```
{
  "permissions": {
    "allow": [],
    "deny": []
  }
}
```

## 2. Mesures avant écriture

Toutes par `action=ask` en liste (longueur de `results`, aucune suite de pagination), sauf e par `list=embeddedin`. Aucune ne nomme `Contained_in`.

| | Mesure | Attendu | Mesuré |
|---|---|---|---|
| a | Pages de `Catégorie:Physical item` | 48 | 48 |
| b | Pages portant `Part_of`, toutes classes | 22 | 22 |
| c | Pages de `Catégorie:Physical item` portant `Part_of` | 0 | 0 |
| d | Pages portant `Located_at` | 45 | 45 |
| e | Transclusions de `Modèle:Physical item` | 51 dont 49 en espace principal | 51 dont 49 en espace principal ; les deux autres sont `Modèle:Physical item` et `Modèle:Physical item/doc` |

c étant un relevé vide, il a été recoupé par une autre voie : les 22 porteurs de `Part_of`, lus avec leurs catégories, se répartissent en 21 `Functional item` et 1 `Organic item` (dont 2 sont aussi dans `Procédé`), aucun `Physical item`.

## 3. Pages écrites

| Page | Résumé de modification | Result | Révision |
|---|---|---|---|
| Lot 12 — Contenants et étiquetage | `[Lot 12][Ouverture] état ouvert, date d'ouverture réelle du lot` | Success | 1498 (précédente 1361) |
| Attribut:Contained in | `[Lot 12][Tâche 1] création de la propriété de contenance physique` | Success, `new`, avec `--createonly` | 1499 |

Lot 12 : diff limité aux deux lignes demandées (`cadré` → `ouvert`, `2026-08-30` → `2026-10-11`), contrôlé avant écriture. Faits relus après écriture :

```
Work_package_opening_date -> ['1/2026/10/11']
Work_package_status -> ['ouvert']
```

« Gestion des lots », relue sans la modifier : le lot 12 figure dans la section « En cours », avec les lots 21 et 24. Il n'est plus une ligne de « À venir », où il n'apparaît que dans la colonne « Dépend de » des lots qui en dépendent. Compte rendu : 41 au total, 3 en cours, 16 faits, 22 à venir, 0 abandonné ; 3 + 16 + 22 + 0 = 41.

## 4. Attente de la propagation

| Moment | `_CHGPRO` | Verrou d'écriture (`intestactions`) |
|---|---|---|
| Lecture initiale, 12 h 37 | présent | `smw-change-propagation-protection` |
| Cycle 1 : `bin/wiki-wait-jobs.sh` (« FILE FIGEE a 6 travaux » après cinq essais), relu à 12 h 37 | présent | `smw-change-propagation-protection` |
| Pause de 5 minutes en arrière-plan, puis cycle 2 : `bin/wiki-wait-jobs.sh` (« FILE VIDE » au premier essai), relu à 12 h 43 | absent | aucun |

**Deux cycles.** `_CHGPRO` a disparu et le verrou s'est levé en six minutes environ. Faits lus après disparition :

```
Property_cardinality -> ['single']
Property_description_EN -> ['Physical container holding this specimen. At most three nested containers above an object, furniture included. Beyond that the place page can no longer find the object.']
Property_description_FR -> ["Contenant physique dans lequel se trouve cet exemplaire. Au plus trois contenants emboîtés au-dessus d'un objet, meuble compris. Au-delà, la fiche de lieu ne retrouve plus l'objet."]
Property_domain -> ['Physical_item#14##']
Property_range -> ['item physique']
_MDAT -> ['1/2026/10/11/10/37/36/0']
_SKEY -> ['Contained in']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_wpg']
```

Les six faits sont présents, accents compris, et aucun `_ERRC` n'apparaît.

## 5. Contrôle du type résolu

Requête : `[[Catégorie:Physical item]]|?Contained_in|?Located_at|?Planting_rank|limit=1`. Type déclaré du témoin 2, lu sur `Attribut:Planting rank` : `[[Has type::Number]]`, donc `_num` attendu.

```
{"label":"","key":"","typeid":"_wpg"}
{"label":"Contained in","key":"Contained_in","typeid":"_wpg"}
{"label":"Located at","key":"Located_at","typeid":"_wpg"}
{"label":"Planting rank","key":"Planting_rank","typeid":"_num"}
```

- Témoin 1, `Located_at` : `_wpg`, conforme.
- Témoin 2, `Planting_rank` : `_num`, conforme à son type déclaré. La lecture est donc valide.
- `Contained_in` : `_wpg`, conforme à l'attendu.

**Réserve :** le type voulu étant Page, un gel de type aurait rendu exactement le même résultat, `_wpg`, qu'une résolution correcte. Ce contrôle ne peut donc pas distinguer les deux. Il prouve seulement que la lecture fonctionne et que rien ne contredit le type voulu.

## 6. Règles locales à la fin

`.claude/settings.local.json`, aucune règle apparue pendant la tâche :

```
{
  "permissions": {
    "allow": [],
    "deny": []
  }
}
```

## 7. Commit et poussée

Hash et état de la poussée donnés dans la réponse du terminal : la preuve d'une poussée ne peut pas figurer dans le commit qu'elle prouve (`methode-de-travail.md`).

## 8. Écarts et surprises

- **« Commite d'abord ce qui traîne » : non appliqué au fichier non suivi.** L'étape 1 demandait de commiter ce qui traîne si `git status` n'était pas propre. Le seul élément était `travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md`, en `??`. Cyril avait demandé de le laisser hors de git, et `methode-de-travail.md` dit qu'un fichier non suivi ne justifie rien. Il est resté non suivi. **A.** Ce fichier doit-il rester durablement hors de git ? Tant qu'il y reste, il apparaîtra à chaque étape 1. Ma suggestion est de le commiter ou de le supprimer, sur ta décision.
- **Session expirée à la première écriture.** `bin/wiki-put.sh` a refusé l'écriture du lot 12 (« session expirée »), sans rien écrire. Relancé après `bin/wiki-login.sh`, il est passé du premier coup. C'est le cas prévu par `CLAUDE.md`, la consigne n'ouvrant pas de session avant l'écriture.
- **Pause ajoutée entre deux cycles.** `bin/wiki-wait-jobs.sh` rend la main en une vingtaine de secondes quand il juge la file figée. Trois cycles enchaînés auraient tenu en une minute, sans laisser à la propagation une chance réelle d'aboutir. J'ai donc intercalé une pause de 5 minutes en arrière-plan avant le cycle 2. Cette décision vient de moi ; la consigne ne fixait pas la durée d'un cycle.
- **`wiki-wait-jobs.sh` a de nouveau crié au loup** (« FILE FIGEE a 6 travaux ») : cinq minutes plus tard, la file était vide et la propagation achevée. C'est la dette d'outillage déjà notée dans `CLAUDE.md`.
- **Mesures conformes à l'attendu**, toutes les cinq. Elles sont à jour au 11 octobre 2026. La page du lot 12 cite encore « 47 items physiques » et « transclus par 47 pages » : ce sont des chiffres du cadrage, aujourd'hui 48 et 51. Je ne les ai pas corrigés, à noter pour la suite du lot.
- **`Attribut:Part of` déclare encore `Category:Physical item` dans son domaine.** Rien n'y a été touché, conformément à la consigne, qui ne le demandait pas dans cette tâche.
