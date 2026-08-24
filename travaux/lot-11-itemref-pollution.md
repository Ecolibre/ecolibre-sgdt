# Lot 11 — pollution `Item_ref` sur Récapitulatif technique : mesure avant nettoyage

2026-08-21. Suite de `travaux/lot-11-dette-audit.md`. Rien corrigé dans
cette entrée, comme demandé — mesure seulement.

## 1. Les deux diffs validés — écrits, relus

**`CLAUDE.md`** : nouvelle entrée « Les backticks ne protègent rien en
wikitexte » insérée juste après la leçon existante sur les exemples de
syntaxe SMW, avant « Une convention rédigée de mémoire ne fait pas foi ».
Relue après écriture (fichier local) : en place, identique au diff
proposé.

**`Erreurs de traitement SMW`** : parenthèse d'horodatage remplacée par
la version qui nomme la file de travaux et la purge comme recours. Écrit
— résumé `[Lot 11][Tâche 1] Horodatage précisé — l'invalidation passe par
la file de travaux et peut tarder` (pageid 430, revid 849). Relu après
écriture : `diff` entre le fichier envoyé et la page relue — aucune
différence de contenu (seul écart, fin de ligne manquante sur la copie
récupérée, déjà l'artefact habituel de `wiki-get.sh`).

## 2. Mesure — `Item_ref` sur Récapitulatif technique, avant tout nettoyage

### a) La requête équivalente au compteur Base36 — la page ne sort pas en tête

```
action=ask&query=[[Item_ref::+]]|?Item_ref|sort=Item_ref|order=desc|limit=1
→ 1 résultat : « Machine à souder par points SUNKKO 709AD », Item_ref = 002N
```

**Récapitulatif technique n'apparaît pas.** Le sommet du tri descendant
est `002N`, une vraie référence de conception, pas la page polluée. La
seule question qui comptait est donc tranchée : cette pollution **n'a
pas pu fausser** un calcul de compteur qui prend le maximum.

### b) Le classement complet — `+` est le minimum, pas un maximum

Dix premières valeurs en ordre descendant :

| Rang | Page | `Item_ref` |
|---|---|---|
| 1 | Machine à souder par points SUNKKO 709AD | `002N` |
| 2 | Machine à souder par point | `002M` |
| 3 | Maintenir en position | `002L` |
| 4 | Mesurer une grandeur électrique | `002K` |
| 5 | Souder par points | `002J` |
| 6 | Braser tendre | `002I` |
| 7 | Assembler | `002H` |
| 8 | Miscanthus La Closerie D'Olt 2026 | `002G` |
| 9 | Yacon La Closerie D'Olt 2025 | `002F` |
| 10 | Tomates Camille Buisson 2026 | `002E` |

95 pages portent `Item_ref` au total (compté par la longueur de
`results` sur une requête en liste, pas par `format=count` — défaut déjà
consigné). **`+` se range en position 95 sur 95, tout en bas d'un tri
descendant** : premier résultat d'un tri **ascendant**, avant même
`0001` :

```
action=ask&query=[[Item_ref::+]]|?Item_ref|sort=Item_ref|order=asc|limit=5
→ 1. Récapitulatif technique du SGDT (+)
   2. Assurer les besoins vitaux (0001)
   3. Se nourrir (0002)
   4. Conserver les aliments (0003)
   5. Cuire les aliments (0004)
```

Le caractère `+` (point de code inférieur à tout chiffre ou lettre) se
classe systématiquement avant toute vraie référence dans l'ordre binaire
utilisé par ce wiki (voir l'entrée sur la collation `uca-fr`,
`demandes-adminsys.md`) — il ne peut donc jamais gagner un tri
descendant, seulement un tri ascendant. **Un compteur qui prend le
maximum ne peut pas être trompé par cette pollution ; un calcul qui
prendrait par erreur le minimum le serait.** Aucun usage actuel du SGDT
ne trie `Item_ref` en ascendant à ma connaissance — à confirmer si un
futur usage venait à le faire.

### c) Le fragment fautif — deux occurrences du même piège, sur la même page

Wikitexte de `Récapitulatif technique`, section « Ce que les modèles
imposent sans le dire » :

```
* <code>Template:Item numbering audit</code> interroge <code>[[Item_ref::+]]</code> '''sans aucun filtre de catégorie''' : la détection des trous porte sur tout le wiki, pas sur une classe.
```

**Fragment fautif : `<code>[[Item_ref::+]]</code>`.** `<code>` seul,
sans `<nowiki>` — exactement le mécanisme déjà documenté dans
`CLAUDE.md` (« `<code>` ne protège pas ») et rappelé aujourd'hui par la
nouvelle entrée sur les backticks. Cette ligne visait à *citer* la
requête du module d'audit à titre d'exemple ; elle l'a *exécutée* comme
une vraie annotation de la page courante.

**Un second exemplaire du même piège, plus loin sur la même page**,
section « Requêtes portées par les pages » :

```
| Cette page || 1 || tableau des propriétés (<code>[[Has type::+]]</code>)
```

**C'est là l'origine de l'erreur déjà connue** (« La propriété « A le
type » est une propriété déclarative… ») — confirmé, comme pressenti :
même piège, non échappé, `<code>` sans `<nowiki>`, décrivant la vraie
requête `{{#ask: [[Has type::+]] ...}}` de la page (celle-là légitime,
en tête de page) mais l'exécutant une seconde fois dans le corps du
texte.

**Rien d'autre ne pollue le modèle de données** sur cette page — les
autres `{{#ask:}}`, `{{#show:}}` et `{{#tag:pre|{{#invoke:Source|...}}}}`
présents sont des requêtes et transclusions **intentionnelles**, non
protégées à dessein (elles doivent s'exécuter : tableau des sept
catégories, code source affiché, etc.).

**Deux occurrences supplémentaires notées, cosmétiques, sans pollution
de fait** — même relâchement (`<code>` sans `<nowiki>`) mais sans
propriété SMW en cause, donc sans `_ERRC` ni fait parasite : section
« Contraintes de rédaction des modèles », `<code>[[a|b]]</code>` et
`<code>[[File:x|150px]]</code>`, cités comme exemples de liens à
`|` interne. Ce sont des liens/inclusions wiki ordinaires, pas des
annotations — au pire un lien rouge ou une image manquante affichés en
plein milieu du texte, jamais un fait stocké. Non corrigés non plus,
signalés pour mémoire.

## 3. Note — le détecteur d'erreurs ne voit pas ce cas

`Item_ref::+` est une **annotation valide**, pas une erreur SMW : `+`
est une valeur `Code` comme une autre pour SMW, simplement absurde
sémantiquement. Elle ne porte donc **aucun `_ERRC`**, et n'apparaît pas
dans `Erreurs de traitement SMW`. Le contrôle qui l'a trouvée est le
`browsebysubject` sans filtre passé directement sur les pages de
documentation (`travaux/lot-11-dette-audit.md`, point 2) — un contrôle
différent, qui vérifie qu'une page ne porte que les faits attendus,
plutôt que de chercher les échecs de traitement. Les deux contrôles se
complètent, mais ne se recouvrent pas : le premier voit les rejets
silencieux, le second voit les annotations acceptées à tort. Aucun des
deux ne suffit seul.
