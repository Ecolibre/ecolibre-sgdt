# Catégorie:Lieu — procédure de renommage corrigée

Suite de `renommage-consignation.md`. Diff validé par Cyril, avec
l'ajout d'une cinquième étape sur la redirection.

---

## Écriture faite

`Catégorie:Lieu` (pageid 288), `oldrevid` 1004 → `newrevid` 1082.

Résumé :
`[Correctif] Catégorie:Lieu — la purge ne fait pas converger le
stockage, l'ancien nom reste interrogeable, la redirection est une
donnée`

Seule la section « Renommer un lieu » est touchée. Le reste de la page
est inchangé (diff local vérifié).

---

## Ce qui a changé, bloc par bloc

### Intro de la section

- **Avant** : « renommer la page ne suffit pas à mettre les données à
  jour ».
- **Après** : le renommage met à jour la valeur stockée par SMW
  (renvoi à l'étape 3), mais **pas** le wikitexte des pages annotantes,
  qui continuent de nommer l'ancien titre — d'où la redirection qui
  « fait tenir l'ensemble ».
- « Quatre étapes » → « **Cinq** étapes ».

### Étape 2 — recensement

Formulation adoucie pour rester cohérente avec l'étape 3 : oublier une
famille de propriétés ne « laisse pas des données fausses » (le
stockage converge seul) mais « **un affichage périmé** » — liens et
tableaux qui nomment encore l'ancien titre. La méthode (requête inverse
`#ask` par propriété de type Page) est inchangée.

### Étape 3 — purge

Le cœur de la correction.

- **Retiré** : « C'est le reparse de ces pages qui fait basculer la
  valeur stockée vers le nouveau titre. » — faux.
- **Ajouté** : le renommage seul, redirection laissée, fait déjà
  basculer le littéral stocké (propagation de changement SMW, sans
  reparse — renvoi à *Limites connues* n° 34, mesuré en production le
  28 août 2026). La purge sert au cache de page et aux liens indexés
  (`pagelinks`, donc `list=backlinks` et les tableaux `#ask` rendus
  ailleurs), pas au stockage. Sans purge : stockage juste, affichage
  qui peut mentir un temps indéterminé.
- Paragraphe « Ordre de grandeur » conservé ; une seule clause
  reformulée : les pages oubliées restent « liées à l'ancien titre
  (backlinks, tableaux, cache) » et non « pointées sur l'ancien lieu »
  — le recensement complet reste nécessaire, pour savoir quoi purger.

### Étape 4 — « Contrôler » (ex-« Ne pas supprimer la redirection avant la fin de la purge »)

- Titre changé : l'étape devient l'étape de **contrôle**. Son ancien
  contenu sur le calendrier de la redirection part à l'étape 5.
- Contrôle par lecture des faits réellement stockés
  (`action=browsebysubject`), affichage qui ne prouve rien : conservé.
- **Ajouté** : ne pas attendre zéro d'une requête inverse sur l'ancien
  titre. SMW normalise la condition vers la cible de la redirection
  avant de compiler —
  `[[Located_at::ancien titre]]` et
  `[[Located_at::nouveau titre]]` rendent le même résultat et le même
  `meta.hash`. Le seul contrôle utile est positif : lire le littéral,
  vérifier qu'il porte le nouveau titre.

### Étape 5 — « Ne pas supprimer la redirection » (nouvelle)

Texte proposé par Cyril, adapté à la page (renvoi *Limites connues*
n° 26 plutôt que « n° 26 des Limites connues » en clair) :

> Le renommage ne touche pas le wikitexte des pages qui visaient le
> lieu : elles portent toujours l'ancien titre en toutes lettres.
> Supprimer la redirection ferait retomber leur valeur stockée sur cet
> ancien titre — c'est-à-dire sur une page qui n'existe plus (entrée
> n° 26 des *Limites connues du SGDT*). Les liens et les requêtes
> cesseraient de résoudre, sans aucun message.
>
> Pour se passer de la redirection, il faut d'abord réécrire le
> wikitexte de toutes les pages recensées à l'étape 2 pour qu'elles
> portent le nouveau titre. C'est un lot à part entière, pas une étape
> de renommage. Tant que ce n'est pas fait, la redirection est une
> donnée.

Le paragraphe de clôture (« le comportement de fond … vaut pour toutes
les propriétés pointant vers une page … consigné dans *Limites
connues* ») est conservé tel quel, après l'étape 5.

---

## Vérifications

| Contrôle | Résultat |
|---|---|
| `browsebysubject` sur `Catégorie:Lieu` | `_MDAT`, `_SKEY`, `_SUBC -> ['SGDT#14##']` uniquement. Aucune annotation parasite — les exemples `[[Located_at::…]]` sont en `<nowiki>` et rendus comme texte. |
| La page rend | Oui (`action=parse`, 43 ko de HTML). Section « Renommer un lieu » relue en entier en rendu. |
| Liens rouges | Aucun. Les 8 liens internes existent (`Limites connues…`, `Registre des préfixes de site`, `Modèle:Lieu`, `Modèle:Physical facet plant/doc`, `Attribut:Image location`, `Attribut:Located at`, `Attribut:Located in`, `Formulaire:Lieu`). `Spécial:Types/Page` inchangé. |
| `[[ ]]` littéraux dans le HTML | 3, tous attendus : deux exemples de l'étape 4 (`ancien titre` / `nouveau titre`) + l'exemple `#ask` préexistant de l'étape 2. |

### Un lecteur qui ne connaît rien au projet peut-il suivre ?

Oui. Les cinq étapes s'enchaînent :

1. renommer en laissant la redirection ;
2. recenser les propriétés de type Page qui visent le lieu, par
   requête inverse ;
3. purger les pages trouvées — en sachant que c'est pour l'affichage,
   le stockage s'étant déjà corrigé seul ;
4. contrôler en lisant les faits stockés, sans s'attendre à zéro sur
   l'ancien nom ;
5. ne pas supprimer la redirection, et pourquoi.

Point de friction résiduel, mineur : le titre de l'étape 3 (« Purger
toutes les pages recensées ») annonce une action que le corps
relativise aussitôt (« la purge ne sert pas à cette bascule »).
L'impératif tient quand même — il faut purger — et le corps lève
l'ambiguïté dès la deuxième phrase. Non corrigé pour ne pas alourdir
un titre validé ; à surveiller si un lecteur bute dessus.

---

## Rappel — noté, pas traité

Défaut d'outillage `wiki-purge.sh` (« Unrecognized parameter: token »
à chaque appel) : voir `renommage-consignation.md` §3, à reprendre avec
les deux autres défauts d'outillage en attente.
