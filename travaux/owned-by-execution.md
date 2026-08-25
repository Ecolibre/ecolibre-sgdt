# [Amendement] `Owned_by` — exécution

**Date : 25 août 2026. 47 écritures, toutes réussies, aucune interruption.**

Décisions de Cyril appliquées telles quelles : `Owned_by=Ecolibre` sur les
**44** items, CWL-0007 compris ; les 29 plantations incluses ; portée
`acteur (organisation ou personne)`, sans article ; aucune page `CWL Optéos`
créée. Le formulaire est passé **en 3ᵉ position**, avant le remplissage.

---

## 1. Les 47 écritures

| Rang | Écritures | Page | revid | Résumé |
|---|---|---|---|---|
| 1 | 1 | `Attribut:Owned by` | 936 | `[Amendement] Classe Organisation` |
| 2 | 1 | `Modèle:Physical item` | 937 | `[Amendement] Owned_by=Ecolibre` |
| 3 | 1 | `Formulaire:Physical item` | 938 | `[Amendement] Owned_by=Ecolibre` |
| 4 | 44 | les 44 items physiques | — | `[Amendement] Owned_by=Ecolibre` |

Chacune relue après écriture. Les trois pages structurelles ont été
**relues en ligne juste avant** d'être écrites, et comparées au wikitexte
qui avait servi à calculer les diffs de la proposition : **identiques**,
aucune modification hors session entre la proposition et l'exécution.

### Rang 2 — `Modèle:Physical item`, diff réellement appliqué

Relu après écriture, comparé à l'état d'avant (revid 544 → 937) :

```
12a13
> |Owned_by={{{Owned_by|}}}
33a35,37
> |-
> ! style="background:#e8f0ff" | Appartient à (Propriétaire)
> | {{#if:{{{Owned_by|}}}|[[{{{Owned_by|}}}]]}}
```

**Quatre lignes ajoutées, zéro supprimée.** Le diff du §4 de la
proposition, sans modification.

### Rang 3 — `Formulaire:Physical item`, diff réellement appliqué

Relu après écriture (revid 545 → 938) :

```
24a25,27
> |-
> ! Appartient à : {{#info: Acteur à qui appartient l'exemplaire. …}}
> | {{{field|Owned_by|input type=combobox|values from category=Organisation|default=Ecolibre}}}
```

**Trois lignes ajoutées, zéro supprimée.** Le diff du §5, sans modification.

### Rang 4 — les 44 items

Édition directe du wikitexte, **jamais par le formulaire**. Ancre
`|model_link=`, une ligne `|Owned_by=Ecolibre` insérée juste après, un
résumé par page.

**Un essai à blanc a précédé l'écriture**, sur les 44 pages : pour chacune,
lecture du wikitexte courant, vérification qu'elle ne portait pas déjà
`Owned_by`, que l'ancre `|model_link=` s'y trouvait **exactement une fois**,
et que la transformation n'ajoutait **qu'une seule ligne** — la bonne — sans
en retirer aucune. Les 44 ont passé cet essai avant que la première écriture
parte. Le script s'arrêtait à la première anomalie ou au premier `result`
différent de `Success` ; il n'a pas eu à s'arrêter.

Deux pages relues après coup, sur des structures différentes :

```
{{Physical item                      {{Physical item
|site_code=ECL                       |site_code=CWL
|ref_number=0038                     |ref_number=0007
|model_link=Tomates Camille …        |model_link=Batterie défaillante …
|Owned_by=Ecolibre                   |Owned_by=Ecolibre
|description=                        }}
|sn=
|physical_parent=
|Located_at=Butte de la tranchée
}}
{{Physical facet plant
…
```

L'insertion tombe au même endroit dans les deux cas, y compris sur la page
qui porte un second bloc `{{Physical facet plant` — les 40 pages à deux
blocs sont bien traitées, l'ancre `|model_link=` n'existant que dans le
premier.

---

## 2. Contrôle intermédiaire entre les rangs 2 et 3

Demandé avant de toucher au formulaire : les 44 pages rendent-elles encore,
et la nouvelle ligne s'affiche-t-elle vide sans casser le tableau ?

Les 44 ont été purgées puis rendues une par une, avec cinq contrôles
automatiques par page : présence du rang « Appartient à (Propriétaire) » ;
absence d'accolades non substituées (`{{{`, `{{#if`) ; absence de marqueur
d'erreur ; `<table>` et `</table>` en nombre égal ; et **la cellule du
nouveau rang appariée à son en-tête et effectivement vide**.

```
pages controlees : 44
rendu conforme   : 44
soucis           : 0
```

Rendu d'une page à cet instant, le rang vide en place entre « Se trouve à »
et « Éléments contenus » :

```
Se trouve à (Lieu)            | Butte de la tranchée
Appartient à (Propriétaire)   |
Éléments contenus (Enfants)   | Cet item ne contient aucun sous-élément physique.
```

Rien d'abîmé : le rang 3 pouvait partir.

---

## 3. Les six contrôles après remplissage

### 1 — Le compte : 44 sur 44

```
total classe Physical item      : 44
portant Owned_by (quelconque)   : 44
portant Owned_by::Ecolibre      : 44
sans proprietaire               : 0 []
```

Aucun item sans propriétaire. Les trois comptes coïncident, ce qui exclut
une écriture inerte comme une valeur mal orthographiée.

### 2 — Le magasin, sur quatre situations différentes

```
Tomates — Le Buisson de Cerzat (ECL-0038)   (plantation de la butte)
    Inventory_site -> ['ECL']
    Located_at     -> ['Butte_de_la_tranchée#0##']
    Owned_by       -> ['Ecolibre#0##']

Machine à souder par point — Atelier appartement (ECL-0043)
    Inventory_site -> ['ECL']
    Located_at     -> ['Atelier_appartement#0##']
    Owned_by       -> ['Ecolibre#0##']

Batterie de récupération trotinette 1        (le CWL, sans Located_at)
    Inventory_ref  -> ['CWL-0007']
    Inventory_site -> ['CWL']
    Owned_by       -> ['Ecolibre#0##']

Bidon 220L Bleu 1                            (sans Located_at)
    Inventory_site -> ['ECL']
    Owned_by       -> ['Ecolibre#0##']
```

Le suffixe `#0##` confirme le stockage en **type Page**, pas en texte. Aucune
clé `_ERR*` sur aucun des quatre.

**Le CWL-0007 est la démonstration de la propriété.** Une seule page porte
désormais `Inventory_site -> CWL` et `Owned_by -> Ecolibre` : inventorié par
CWL, possédé par Ecolibre. C'est exactement la distinction que la page de
propriété décrit, et elle est maintenant instanciée sur un cas réel — pas
seulement documentée.

### 3 — Erreurs de traitement SMW : toujours 1

```
pages en erreur : 1
  - Attribut:INSEE code
```

Même page, préexistante, mesurée avant l'amendement Organisation. **Les 47
écritures n'ont introduit aucune annotation rejetée.**

### 4 — Liens retour sur `Ecolibre` : 44

```
backlinks ns0          : 44
items sans lien retour : 0 []
```

C'est le contrôle propre aux `[[ ]]` : un lien cassé par un retour à la ligne
s'écrit sans erreur d'API mais n'entre jamais dans `pagelinks`. Les 44 y sont.

### 5 — Le rendu d'une page

Cellule HTML brute du nouveau rang, sur `Bidon 220L Bleu 1` :

```html
<a href="/wiki/Ecolibre" title="Ecolibre">Ecolibre</a>
```

Lien **bleu** (aucun `class="new"`), pas d'accolade nue, pas de lien rouge.

### 6 — Le formulaire, une seule fois

Consulté en **lecture seule** (GET), jamais enregistré. Le champ est là :

```html
<select id="input_8" name="Physical item[Owned_by]" class="pfComboBox"
        tabindex="8" autocompletesettings="Organisation" …>
```

Ordre des champs confirmé — `Owned_by` est bien le dernier du bloc
principal, après `Located_at` :

```
site_code · ref_number · model_link · description · sn · physical_parent · Located_at · Owned_by
```

Le libellé et l'infobulle rendent correctement.

**Sur le défaut, le contrôle qui tranche.** Une première consultation, ciblée
sur `Utilisateur:Cywil/Bac à sable`, montrait `Owned_by` **sans valeur** — ce
qui aurait pu passer pour un défaut inopérant. C'est un faux négatif : sur une
page **existante**, Page Forms n'applique aucun défaut, et `site_code` était
vide lui aussi. Comparaison des deux modes, dans la même page de contrôle :

| Champ | cible existante | cible neuve |
|---|---|---|
| `site_code` | *(aucun)* | `'ECL'` |
| `ref_number` | *(aucun)* | `'0044'` |
| `Located_at` | *(aucun)* | *(aucun)* |
| **`Owned_by`** | *(aucun)* | **`'Ecolibre'`** |

Le défaut se pose à la création, exactement comme `{{Préfixe site}}` sur
`site_code` — le témoin connu, mesuré dans la même réponse. C'est la
comparaison qui fait foi, pas la lecture isolée.

Et la combobox propose bien la bonne valeur, vérifié sur le point d'entrée
qu'elle interroge :

```
action=pfautocomplete&category=Organisation&substr=E
  -> [{"title": "Ecolibre"}]
```

**Aucune page n'a été créée** par ces consultations : la cible neuve
utilisée pour le test ressort toujours `missing`.

---

## 4. Deux notes de méthode

**La file de travaux n'a pas bloqué les faits.** `bin/wiki-wait-jobs.sh` a
rendu « FILE FIGÉE à 100 travaux » à trois reprises. Les faits étaient
pourtant déjà lisibles : les 44 `Owned_by` remontaient avant que la file
bouge. Le compte est redescendu à 87 depuis. Le nombre remonté par
`siteinfo` est une **estimation plafonnée**, pas un décompte ; il porte sur
la propagation (`refreshLinks`), pas sur l'annotation, qui est écrite au
moment de l'enregistrement. Une file qui ne descend pas n'est donc pas une
raison de conclure à un échec de stockage — ni de réécrire. À distinguer du
cas déjà consigné dans `CLAUDE.md` (`_CHGPRO` sur une page de propriété
fraîchement créée), où la lecture est réellement en retard.

**Un piège de lecture rencontré à l'inventaire, qui a failli fausser le
cadrage.** Dans le JSON d'`action=ask`, la clé de `printouts` est le
**label** (`"Inventory site"`, avec une espace), pas la clé interne
(`Inventory_site`). Un filtre sur le mauvais nom a d'abord rendu « 44 items
sans `Inventory_site` » — chiffre absurde, qui aurait fait conclure à une
banque vide au lieu de 43 ECL + 1 CWL. Recoupé par `browsebysubject`, qui
rendait bien `Inventory_site -> ['ECL']`. Même famille que le piège `_PVAL`
déjà noté : **le nom d'affichage n'est pas la clé, et un seul canal ne
suffit pas.**

---

## 5. Note pour la suite — la page d'avancement, à ne pas construire ici

`Owned_by=Ecolibre` **ne suffira pas** à *Avancement du jardin-forêt* : les
44 items portent désormais la même valeur, donc une requête sur ce seul
critère ramènerait la batterie de trottinette, les deux bidons et la machine
à souder au milieu des plantations.

Il faudra un **second critère** — la facette végétale, ou une notion de
projet qui n'existe pas encore dans le modèle. **À cadrer après le
rendez-vous avec Mathieu**, rien n'est construit ni proposé ici.

Deux appuis chiffrés pour ce cadrage, relevés en passant : les 44 items se
répartissent en **40 pages portant un bloc `{{Physical facet plant`** et 4
sans — la facette végétale sépare donc déjà proprement les plantations du
reste ; et les 29 plantations de la butte sont **trois lieux sous** le
terrain (`Butte de la tranchée → Zone basse → Terrain de Cyril au Buisson de
Cerzat`), ce qui reste vrai quel que soit le second critère retenu.

---

## 6. État final

- `Attribut:Owned by` créée, type `Page`, domaine `Category:Physical item`,
  portée `acteur (organisation ou personne)` — 33 caractères, sous le
  plafond de 85 du type `Keyword`, compté par script avant envoi.
- `Modèle:Physical item` stocke et affiche `Owned_by` (revid 937).
- `Formulaire:Physical item` propose le champ, en dernier du bloc principal,
  combobox sur `Catégorie:Organisation`, défaut `Ecolibre` à la création
  (revid 938).
- 44 items sur 44 portent `Owned_by -> Ecolibre` dans le magasin.
- Erreurs de traitement SMW : **1**, inchangée.
- Aucune écriture n'a échoué ; aucune page n'a été créée par accident.
