# [Amendement] Classe Organisation — exécution

**Date : 25 août 2026.** Huit pages créées, toutes en `createonly=1`, toutes
relues après écriture. Résumé d'édition identique sur les huit :
`[Amendement] Classe Organisation`.

Les trois corrections de Cyril sont appliquées : l'appartenance ira sur
**Physical item** et non sur Lieu (§1) ; le code de site est documenté comme
**mention documentaire, pas clé de jointure** (§2) ; **aucune IRI PAIR**
n'est déclarée, seule la phrase de vocabulaire est écrite (§3).

---

## 1. Vérifications avant écriture

| Contrôle | Résultat |
|---|---|
| Les quatre noms de propriété sont-ils libres ? | **Oui.** Les quatre remontent `missing` ; recoupé sur la liste complète de l'espace `Attribut:` — **104 pages**, aucune commençant par `Organisation`. |
| Le type `URL` est-il déjà employé ? | **Oui**, pas une introduction. `Attribut:External classification` le porte, et le magasin le confirme : `_TYPE -> …swivt/1.0#_uri`. Rien à signaler avant de l'employer. |
| `Ecolibre` absente ? | **Oui**, `missing`. |
| `Catégorie:Organisation` absente ? | **Oui**, `missing`. `Modèle:Organisation` également, vérifiée au passage. |
| Plafond de 85 caractères sur `Property_range` | Compté **avant** envoi, sur les quatre chaînes réelles : 15, 17, 28, 3 caractères. Marge confortable, aucune proche du plafond. |
| Baseline `Erreurs de traitement SMW` | **1** page en erreur avant écriture — `Attribut:INSEE code`, préexistante. |

`Attribut:Property range` est bien de type `Keyword` : le plafond de 85
s'applique, le contrôle n'était pas théorique.

---

## 2. Les huit écritures

Toutes `"result": "Success"`, `"new": true`.

| Ordre | Page | pageid | revid |
|---|---|---|---|
| a1 | `Attribut:Organisation name` | 450 | 929 |
| a2 | `Attribut:Organisation description` | 451 | 930 |
| a3 | `Attribut:Organisation site code` | 452 | 931 |
| a4 | `Attribut:Organisation website` | 453 | 932 |
| b | `Catégorie:Organisation` | 454 | 933 |
| c | `Modèle:Organisation` | 455 | 934 |
| d | `Ecolibre` | 456 | 935 |

Relecture après chaque écriture : les quatre pages `Attribut:` relues
intégralement, les trois autres comparées par `diff` au fichier source. **Le
seul écart sur les trois `diff` est le retour à la ligne final**, que
MediaWiki retire au stockage. Aucun écart de contenu.

### Correction 1 appliquée — l'appartenance ira sur Physical item

`Catégorie:Organisation`, section *Position dans le modèle*, écrit
explicitement que la future propriété portera sur **Physical item** avec
défaut au formulaire (patron `Inventory_site`), et **qu'elle ne portera pas
sur Lieu** — avec le motif : l'appartenance ne se déduit pas de la
localisation, faute de transitivité utilisable le long de `Located_in`, un
exemplaire rattaché à un lieu de troisième niveau n'étant pas retrouvé par
une chaîne partant du terrain qui le porte. La recommandation fautive de
`organisation-proposition.md` §4.1 n'a donc pas été portée sur le wiki ;
elle reste dans le fichier de proposition, où le présent rapport la corrige.

### Correction 2 appliquée — mention documentaire

`Attribut:Organisation site code` porte, dans ses deux descriptions FR et EN :
le code est repris **à titre de mention documentaire**, le
[Registre des préfixes de site] reste **seul maître de l'attribution**, ce
code **n'est pas une clé de jointure** et ne doit jamais servir à rattacher
un item à une organisation. La même mise en garde est répétée dans la
section *Champs* de `Catégorie:Organisation`, pour qui lit la classe sans
ouvrir la page de propriété. C'est l'option A du §2 de la proposition,
retenue.

### Correction 3 appliquée — pas d'IRI PAIR

`Catégorie:Organisation` porte exactement, et rien de plus :

> Vocabulaire inspiré de l'ontologie PAIR (Assemblée Virtuelle). Aucun
> alignement formel n'est déclaré tant qu'une version stable n'est pas
> confirmée.

Aucune IRI, aucune demande de préfixe interwiki, rien versé à
`demandes-adminsys.md`. La phrase sur Acteur comme classe déduite est
conservée, ainsi que la règle de portée « un acteur » plutôt que « une
organisation ».

### Ce que porte la page Ecolibre

```
{{Organisation
|Organisation_name=
|Organisation_description=Organisation porteuse de wiki.ecolibre.org, wiki faisant autorité pour le Registre des préfixes de site.
|Organisation_site_code=ECL
|Organisation_website=
}}
```

`Organisation_website` laissé **vide** comme demandé. `Organisation_name`
vide également : le titre suffit — c'est la forme des trois pages de lieu
existantes, qui listent tous les paramètres et n'en renseignent que
l'utile. La description est tirée du Registre des préfixes de site
(colonne *Wiki faisant autorité*), pas inventée.

---

## 3. Vérifications après écriture

### `browsebysubject` sur Ecolibre — les faits attendus, et rien d'autre

```
Organisation_description -> ['Organisation porteuse de wiki.ecolibre.org, wiki faisant autorité pour le Registre des préfixes de site.']
Organisation_site_code   -> ['ECL']
_INST                    -> ['Organisation#14##']
_MDAT                    -> ['1/2026/8/25/13/28/50/0']
_SKEY                    -> ['Ecolibre']
```

Les deux champs renseignés sont stockés. `_INST` confirme l'appartenance à
la classe. Les deux champs vides ne produisent **aucune** annotation —
comportement attendu de `#set` sur valeur vide. **Aucun `_ERRC`, aucune clé
parasite.**

### La page rend-elle ? La catégorie la contient-elle ?

Rendu de `Ecolibre`, texte extrait du HTML :

> Organisation · Identification · Nom d'usage **Ecolibre** · Description
> Organisation porteuse de wiki.ecolibre.org… · Code de site **ECL** ·
> Site web *non renseigné*

Le repli de `Organisation_name` sur `{{PAGENAME}}` fonctionne — « Ecolibre »
s'affiche sans que le champ soit renseigné. Le repli de
`Organisation_website` affiche *non renseigné*. **Aucun marqueur d'erreur,
zéro lien rouge** dans le rendu (`{{Documentation}}` existe bien, vérifié
avant écriture).

`list=categorymembers` sur `Catégorie:Organisation` :

```
Ecolibre  (pageid 456, ns 0)
```

Un membre, le bon, et lui seul.

### Erreurs de traitement SMW — toujours 1

`[[_ERRC::+]]` compté par `action=ask` avant et après, **file de travaux
vidée** :

```
COUNT 1
 - Attribut:INSEE code
```

Même compte, même page — la seule en erreur est celle qui l'était déjà.
**Les huit écritures n'ont introduit aucune erreur de traitement.** Le
plafond de 85 caractères n'a mordu sur aucune des quatre `Property_range`,
ce que confirme le contrôle direct du magasin ci-dessous : les quatre
valeurs y sont stockées intactes.

### `browsebysubject` sur Catégorie:Organisation — aucune annotation parasite

```
_MDAT -> ['1/2026/8/25/13/28/24/0']
_SKEY -> ['Organisation']
_SUBC -> ['SGDT#14##']
```

Trois clés, toutes internes : date de modification, clé de tri, et
sous-catégorie de SGDT (le `[[Catégorie:SGDT]]` de pied de page). **Aucune
annotation de propriété.** Les mentions de champs dans le corps du texte
sont écrites en `<code><nowiki>…</nowiki></code>` — patron maison — et
n'ont donc rien annoté. Les seuls `[[ ]]` de la page sont des liens de
navigation à colon initial (`[[:Catégorie:Lieu|Lieu]]`,
`[[:Modèle:Organisation|…]]`) et un lien simple vers le Registre, chacun
écrit sur une seule ligne.

**Note de méthode.** La première lecture, faite juste après l'écriture, ne
rendait que `_SKEY` et une clé `_CHGPRO` portant les trois faits en JSON —
exactement le cas décrit dans `CLAUDE.md` (« après création d'une page de
propriété, les faits ne sont pas lisibles immédiatement »). Ce n'était pas
un échec de stockage : après vidage de la file (`jobs = 0`), la lecture
rend les trois faits directs. **Relire après vidage, ne pas réécrire.**

### Contrôle supplémentaire — les quatre types réellement stockés

Non demandé, mais c'est ce qui prouve que les types ont pris :

| Propriété | `_TYPE` stocké | Lecture |
|---|---|---|
| `Organisation name` | `…#_txt` | Text |
| `Organisation description` | `…#_txt` | Text |
| `Organisation site code` | `…#_keyw` | Keyword |
| `Organisation website` | `…#_uri` | **URL** |

Les quatre portent aussi leur `Property_domain -> ['Organisation#14##']` et
leur `Property_range` intacte. Aucune ne porte de `_ERRC`.

---

## 4. Ce qui reste ouvert

1. **La propriété d'appartenance n'existe pas.** La classe est posée, rien
   ne s'y rattache encore : `Ecolibre` est une île tant que
   `Physical item` ne porte pas la propriété qui la vise. C'est le travail
   qui répond réellement au besoin de départ (*Avancement du jardin-forêt*
   listant ce qui appartient à quelqu'un plutôt que ce qui se trouve
   quelque part). Hors périmètre de cet amendement, à cadrer.
2. **`Catégorie:Acteur` n'existe pas** — le lien est rouge, à dessein. La
   classe déduite est nommée dans le vocabulaire sans être instanciable ;
   une page la décrivant reste à écrire si Cyril le souhaite.
3. **`Formulaire:Organisation` n'existe pas.** La saisie se fait en
   wikitexte pour l'instant. Cohérent avec « rien de plus tant qu'aucun
   usage ne le réclame » : une seule instance existe.
4. **ADD et CWL n'ont pas de page ici.** L'option A retenue le permet sans
   contradiction — leurs pages, si elles existent un jour, vivront sur
   leurs wikis respectifs, et le Registre reste le point d'accord fédéré.
5. **`Organisation_website` sur Ecolibre reste à renseigner** quand Cyril
   donnera l'URL. Une édition d'un champ, sans reprise du modèle.
