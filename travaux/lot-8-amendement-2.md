# Lot 8 — amendement n°2 : où va la connaissance de saisie

**Rédigé le 11 août 2026, pendant la tâche 2.** Complète les tâches 2, 4 et 7.
Ne remet en cause ni le mécanisme retenu à l'amendement n°1, ni le reste du
cadrage.

---

## 1. Principe

Une note rangée dans une page de registre n'est lue par personne au moment où
elle servirait. Règle du lot : **toute information dont dépend une saisie
correcte doit être dans le formulaire**, et de préférence dans sa structure
plutôt que dans un texte à interpréter.

Quatre destinations, par ordre de préférence décroissant :

1. **Un champ.** Quand l'information est une donnée qu'on peut demander. Un
   champ à liste fermée ne laisse rien à interpréter — c'est toujours mieux
   qu'une note bien rédigée.
2. **Le libellé du champ.** Quand l'ambiguïté porte sur ce qui est demandé.
3. **`{{#info: …}}`.** Consigne de saisie qui ne tient pas dans un libellé.
   Rappel du mécanisme, déjà établi sur ce wiki : la fonction d'analyse se place
   **dans la cellule du libellé, juste après le libellé**. Ni `info=` ni
   `description=` sur la balise `field` ne fonctionnent ; `placeholder=` écrit à
   l'intérieur du champ et ne convient pas ici.
4. **Commentaire wikitexte `<!-- -->` dans la définition du formulaire.** Pour
   qui maintiendra le formulaire, pas pour qui le remplit.

Le registre garde ce qui relève de la conception, pas de la saisie : périmètre
de la facette, ce qu'elle exclut, classes concernées, modèles associés.

---

## 2. Reclassement des huit notes

| Information | Destination | Contenu |
|---|---|---|
| « végétal » est un nom en apposition, ne pas corriger en « végétale » | commentaire wikitexte, en tête de `Modèle:Organic facet plant` et de la page de registre | tel quel |
| les animaux auront leur propre facette | registre | relève du périmètre, pas de la saisie |
| nécessité d'un pied mâle | **champ** | voir §3 |
| `Companion_species` = association favorable, pas pollinisation | **libellé** | « Plantes compagnes (association favorable) » |
| `Companion_species` se saisit dans un seul sens | `{{#info:}}` | « À saisir sur une seule des deux fiches. La réciproque s'obtient par requête inverse — saisir des deux côtés fait diverger les fiches. » |
| `Propagation_method` ≠ `Procurement_route` | **libellé** + `{{#info:}}` | libellé : « Modes de multiplication de l'espèce ». Info : « Comment l'espèce se multiplie en général. Comment cet exemplaire-ci a été obtenu se saisit au niveau référencé. » |
| facette raccord sans données, gabarit du lot 7, maille grossière | registre + commentaire dans le bloc de formulaire raccord | conception |
| `values from category=Facette` disponible mais non utilisé | commentaire wikitexte dans la définition du formulaire | note de maintenance |

**Étendre la grille aux trente-six autres propriétés** : tout champ dont le
libellé seul ne suffit pas reçoit un `{{#info:}}`. Au minimum
`Forest_garden_layer`, `Root_system`, `Seed_treatment`, `Toxicity_note`,
`Documentation_source`.

---

## 3. Modification de la tâche 4

**`Pollination_type` est supprimée et remplacée par `Pollination_requirement`**,
liste fermée, formulée en question de jardinier plutôt qu'en terme botanique :

- `Autofertile — un seul pied suffit`
- `Nécessite un second pied de la même espèce (dioïque)`
- `Nécessite une autre variété pollinisatrice`
- `Sans objet — pas de fruit ni de graine récoltés`

C'est la vraie question au moment de planter, et elle ne demande aucune
connaissance botanique pour être répondue ni pour être lue. Les trois valeurs
couvrent les cas ; la quatrième évite qu'on laisse vide par défaut, ce qui ne se
distinguerait pas d'un oubli.

**Ajouter `Pollinator_species`**, type Page, multivalué, facultatif : quelle
variété assure la pollinisation, quand elle est connue et nommable. Sans elle,
« nécessite une autre variété pollinisatrice » laisse la moitié du problème hors
du wiki. Elle reste facultative — un argousier dioïque n'en a pas besoin, la
liste fermée suffit.

Le décompte de la tâche 4 passe de trente-six à trente-sept propriétés.

Cette modification est un cas d'école du §1 : le cadrage prévoyait de *signaler*
le besoin d'un pied mâle par une note de registre adossée à un terme botanique.
Un champ à quatre valeurs le *pose*. C'est moins de texte et plus d'information.

---

## 4. Correction d'une vérification

La consigne « aucune page demandée sous `Spécial:Pages_demandées` » est
remplacée. Cette page dépend de la file de travaux et peut retarder, donc elle
ne prouve rien dans la minute.

**Vérification exacte :** sur l'item bac à sable de la tâche 8, la valeur
affichée par `Item_facet` doit être un **lien bleu**. Un lien rouge signifie que
le modèle de facette pointe vers un titre qui n'existe pas — faute de frappe
entre la page de registre créée en tâche 2 et le titre écrit en dur dans le
modèle de facette. Le contrôle est immédiat et ne dépend d'aucun traitement
différé.
