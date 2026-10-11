# Lot 12 — tâche 2 sur 4 : bascule de la contenance physique vers Contained_in

Exécutée le 11 octobre 2026, de 12 h 54 à 13 h 03. Aucune donnée créée.

## 1. État du dépôt et règles locales au départ

Dépôt propre au sens de la consigne : le seul élément non propre est le fichier d'une autre conversation, laissé tel quel.

`.claude/settings.local.json`, aucune règle :

```
{
  "permissions": {
    "allow": [],
    "deny": []
  }
}
```

Lectures faites dans l'ordre demandé. « Limites connues » : la liste est numérotée automatiquement par MediaWiki (lignes `# `), sans numéro manuel ; 67 entrées avant ajout, la dernière portant sur le socle PHP 7.4. L'entrée ajoutée est donc la 68ᵉ, sans numéro à écrire.

## 2. Mesures avant écriture

Par `action=ask` en liste (longueur de `results`, aucune suite de pagination), sauf e par `list=embeddedin`.

| | Mesure | Attendu | Mesuré |
|---|---|---|---|
| a | Pages de `Catégorie:Physical item` | 48 | 48 |
| b | Porteurs de `Part_of`, toutes classes | 22 | 22 |
| c | Items physiques portant `Part_of` | 0 | 0 |
| d | Porteurs de `Located_at` | 45 | 45 |
| e | Transclusions de `Modèle:Physical item` | 51 dont 49 en espace principal | 51 dont 49 |
| f | Porteurs de `Contained_in` | 0 | 0 |

## 3. Pages écrites

Session ouverte par `bin/wiki-login.sh` avant la première écriture. Chaque page relue juste avant d'être modifiée, et chaque diff contrôlé avant écriture. Les remplacements ont été faits par un petit script du scratchpad, affiché avant exécution, qui s'arrête sans rien écrire si une chaîne ancienne n'apparaît pas exactement une fois.

| Page | Résumé | Result | Révision |
|---|---|---|---|
| Attribut:Part of | `[Lot 12][Tâche 2] la contenance physique passe à Contained_in, retrait du domaine physique` | Success | 1500 (précédente 264) |
| Modèle:Physical item | `[Lot 12][Tâche 2] bascule de la contenance physique vers Contained_in` | Success | 1501 (précédente 937) |
| Formulaire:Physical item | `[Lot 12][Tâche 2] champ Rangé dans et règle de saisie entre lieu et contenant` | Success | 1502 (précédente 1090) |
| Lot 12 — Contenants et étiquetage | `[Lot 12][Tâche 2] chiffres remesurés et résultat du point de départ sur la profondeur des chaînes` | Success | 1503 (précédente 1498) |
| Limites connues du Système de Gestion de Données Techniques | `[Lot 12][Tâche 2] profondeur des chaînes de propriétés plafonnée à quatre sauts` | Success, par `bin/wiki-append.sh` | 1504 (précédente 1486) |

Diffs :

- **Attribut:Part of** : une seule ligne retirée, `[[Property_domain::Category:Physical item]]`. Page libre de tout verrou avant écriture (`intestactions` vide).
- **Modèle:Physical item** : quatre lignes modifiées (11, 30, 39, 41), et rien d'autre.
- **Formulaire:Physical item** : deux lignes modifiées (20, 23), et rien d'autre.
- **Lot 12** : six lignes modifiées, une par remplacement. La page n'avait pas changé depuis sa lecture.

## 4. Mesures après écriture

Relevées à 13 h 01, après les écritures :

| | Mesure | Avant | Après |
|---|---|---|---|
| a | Pages de `Catégorie:Physical item` | 48 | 48 |
| b | Porteurs de `Part_of`, toutes classes | 22 | 22 |
| c | Items physiques portant `Part_of` | 0 | 0 |
| d | Porteurs de `Located_at` | 45 | 45 |
| e | Transclusions de `Modèle:Physical item` | 51 dont 49 | 51 dont 49 |
| f | Porteurs de `Contained_in` | 0 | 0 |

Aucune régression sur b ni sur d.

## 5. Vérifications

1. **Mesures** : toutes inchangées, voir section 4.
2. **Faits de Attribut:Part of** : `Property_domain -> ['Functional_item#14##', 'Organic_item#14##', 'Referenced_item#14##']`, trois valeurs. Aucun `_CHGPRO` dans les faits.
3. **Rendu de « Fer à souder — Atelier appartement (CWL-0009) »** par `action=parse`, sans purge : l'affichage était déjà à jour.
   - Ligne « Rangé dans (Contenant) » présente, cellule vide.
   - Section « Contient » présente, avec son texte par défaut : « Cet item ne contient aucun sous-élément physique. »
   - Les anciens intitulés « Installé dans (Parent physique) » et « Éléments contenus (Enfants) » sont absents.
   - Aucune classe d'erreur ni avertissement SMW dans le HTML. Seule catégorie : `Catégorie:Physical item`.
   - Aucun formulaire ouvert.
4. **Formulaire, wikitexte seul** : relu sur le wiki, il est identique au fichier préparé. Les deux remplacements sont en place, et la ligne de l'infobulle tient d'un seul tenant (35 lignes avant comme après). Le modèle, relu de même, est identique au fichier préparé.
5. **Limites connues** :
   - **Place de l'ajout** : le post-contrôle de `bin/wiki-append.sh` donne 67 → 68 entrées, l'ajout est la dernière entrée, et le rendu ne montre qu'un seul bloc `<ol>` sur la page.
   - **Faits** : `_INST -> ['Page_de_suivi#14##']`, `_MDAT`, `_SKEY`, rien d'autre. `_INST` porte la catégorie de suivi volontaire de la page.
   - **Catégories** : `Catégorie:Page de suivi` seule, aucune catégorie de suivi apparue.
   - **Liens** : 4 liens, aucun vers une page inexistante (contrôle par `generator=links`).
6. **File de travaux** : trois cycles de `bin/wiki-wait-jobs.sh`.
   - 12 h 56 : « FILE FIGEE a 11 travaux », suivi d'une pause de 5 minutes en arrière-plan.
   - 13 h 01 : « FILE FIGEE a 16 travaux ».
   - 13 h 02 : 16 travaux.

   Toutes les relectures ci-dessus ont été faites après ces cycles, la file n'étant pas vide (voir Écarts).

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

## 7. Écarts et surprises

- **La file ne s'est pas vidée pendant la tâche.** Elle est montée de 11 à 16 travaux, ce qui est attendu après une modification d'un modèle transclus par 51 pages et d'une page de propriété. Les relectures ont été faites file non vide. Ce sont des faits stockés et des rendus, et ils sont conformes. Le rafraîchissement des 49 items par la file n'a pas été attendu jusqu'au bout. Le rendu de CWL-0009 était déjà à jour, mais je n'ai pas vérifié les 48 autres.
- **Les guillemets de l'infobulle changent de forme.** Le texte fourni emploie des guillemets droits (`"Se trouve à"`, `"Rangé dans"`), là où l'ancienne infobulle employait des chevrons (« »). Recopié tel quel, conformément à la consigne.
- **« 685 caractères » remesuré avant écriture** : `Catégorie:Physical item` fait 685 caractères et 711 octets. L'ancien « 652 » pouvait désigner l'un ou l'autre ; le nouveau chiffre est en caractères.
- **Le contenu de l'entrée ajoutée aux Limites connues n'a pas été remesuré par moi.** La profondeur des chaînes, les comptes 48, 47, 6, 4, 2 et le chiffre de 166 résultats viennent de la consigne. Je les ai recopiés sans les reproduire.
- **Script de remplacement réutilisé trois fois.** Il vit dans le scratchpad de session, affiché avant sa première exécution. Il n'est pas versionné ; si ce besoin revient, il relèverait de `bin/`.
