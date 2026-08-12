# Lot 8 — amendement n°1 : mécanisme de bloc optionnel

**Rédigé le 11 août 2026, après le rapport de tâche 0.** Complète la décision
1.5, **remplace la tâche 7**, ajuste les tâches 5, 6 et 8. Tout le reste du
cadrage est inchangé — en particulier la tâche 4 et ses trente-six propriétés.

Le rapport de tâche 0 a raison sur les deux points qui comptent : `holds
template` n'est pas le marqueur annoncé, et le mécanisme visé n'est pas
documenté. L'arrêt était la bonne décision. Ce qui suit ne le contredit pas :
il tranche par le code source de Page Forms 5.8.1, là où la documentation est
muette.

---

## 1. Ce que fait réellement Page Forms 5.8.1

Établi par lecture du source de la version installée, tag `5.8.1`. Références de
fichiers et de lignes données pour que tout soit revérifiable.

**a. `holds template` est un paramètre de champ, pas un attribut de `<div>`.**
`PF_FormField.php:276` le lit parmi les composants d'une balise `{{{field}}}`,
et `PF_FormPrinter.php:470` et `:1161` s'en servent pour les modèles imbriqués.
Rien à voir avec l'affichage conditionnel. **L'hypothèse du cadrage était
fausse ; le rapport a raison de la rejeter.**

**b. `show on select` sur un `<div>` fonctionne, et fait plus que masquer.**
`PageForms.js` marque le bloc masqué `.hiddenByPF` (fonction `hideDiv`, ~ligne
211), et à la soumission désactive tous les `input`, `select` et `textarea`
qu'il contient (~lignes 1068-1070) pour qu'ils ne soient pas envoyés. Le
commentaire du code le dit explicitement. Donc : aucune valeur ne remonte d'un
bloc masqué. Bon à savoir, mais insuffisant.

**c. Insuffisant, parce que l'appel de modèle est écrit quand même.**
`PF_WikiPage::createPageText()` (lignes 168-172) parcourt les sections de modèle
du formulaire **sans condition** et écrit un appel pour chacune.
`createTemplateCall()` (lignes 106-112) saute les **paramètres** vides, jamais
l'**appel**. Un bloc masqué produit donc un `{{Organic facet plant}}` nu. Avec
quinze facettes, quinze appels vides sur chaque page. C'est exactement le risque
que la tâche 0 cherchait à écarter, et il est confirmé.

**d. Une section multi-instance sans instance n'écrit rien.**
`PF_FormPrinter.php:1101-1102` : `addTemplate()` n'est appelé que si
`!allInstancesPrinted()`. Quand une section `multiple` n'a aucune instance
saisie, seul le « starter » caché est imprimé, le modèle n'est jamais ajouté à
la page. **C'est le seul chemin qui garantit l'absence d'appel vide** — la piste
identifiée par le rapport est la bonne.

Vérifié aussi, puisque le cadrage s'est déjà trompé une fois : `label`,
`minimum instances`, `maximum instances` et `add button text` sont bien des
paramètres de `for template` (`PF_TemplateInForm.php:96-104`).

---

## 2. Mécanisme retenu

**Section multi-instance à instance unique, sans champ pilote.**

```
{{{for template|Organic facet plant|label=Caractéristiques végétales|multiple
 |minimum instances=0|maximum instances=1
 |add button text=Ajouter les caractéristiques végétales}}}
… champs …
{{{end template}}}
```

Trois conséquences, toutes favorables :

1. **Rien n'est écrit tant qu'on n'a pas cliqué.** Pas d'appel vide, pas de
   catégorie parasite, pas de nettoyage à prévoir.

2. **`Item_facet` disparaît comme champ de saisie** et devient une annotation
   émise par le modèle de facette lui-même : `[[Item_facet::Facette végétal]]`.
   Source unique de vérité — la facette est portée par la présence du bloc, plus
   par une case qui peut le contredire. Le piège signalé au cadrage (case non
   enregistrée → bloc masqué à la réédition → effacement silencieux) disparaît
   avec le champ qui le causait.

3. **La décision 1.2 est préservée.** Deux sections multi-instances coexistent
   sans combinatoire : un bidon fileté porte les facettes Contenant et Raccord
   en cliquant deux boutons. C'est précisément ce que le repli « un formulaire
   par facette » ne savait pas faire — il aurait fallu un formulaire par
   combinaison. **Ce repli est écarté définitivement.**

Ce que ça coûte : quinze boutons « Ajouter » au lieu de quinze cases à cocher.
Les grouper sous un intertitre « Facettes » en bas du formulaire. Sur téléphone,
un bouton nommé se lit mieux qu'une case.

**Ceinture et bretelles.** Envelopper malgré tout le corps de chaque modèle de
facette dans un `{{#if:}}` sur son champ clé — `Taxon_name` pour la facette
végétale, `Nominal_diameter` pour la facette raccord — de sorte qu'un appel vide
n'émette ni catégorie ni annotation. Coût nul, et ça protège d'un appel vide
arrivé par une autre voie qu'un formulaire : import, correction manuelle,
copier-coller entre pages.

**`show on select` n'est pas retenu comme mécanisme structurel.** Il reste
disponible pour du confort d'affichage *à l'intérieur* d'un bloc — par exemple
n'afficher `Seed_treatment` que si `Propagation_method` contient « semis ». À ne
pas faire dans ce lot.

---

## 3. Tâche 7 — réécrite

Deux sous-pages, `Formulaire:Item organique/bloc facette végétal` et
`.../bloc facette raccord`, chacune contenant une section `for template`
complète selon le patron du §2 ci-dessus.

**Contrainte d'écriture confirmée par la tâche 0, à ne pas perdre :** dans une
sous-page destinée à être transcluse, les balises Page Forms doivent être
échappées (`&#123;`, `&#124;`, `&#125;`) ou placées sous `<nowiki>`, parce que
la définition de formulaire est parsée deux fois et que c'est la première passe
qui transclut. Écrire une des deux sous-pages, vérifier le rendu du formulaire,
et seulement ensuite écrire la seconde — une erreur d'échappement est plus
facile à isoler sur un seul bloc.

Dans `Formulaire:Item organique`, sous un intertitre « Facettes » placé après
les champs de classe : une ligne de transclusion par bloc.

Le champ `Item_facet` **n'est pas ajouté au formulaire**. La propriété reste
créée en tâche 1 — elle est alimentée par les modèles de facette et sert aux
requêtes.

`values from category=Facette`, validé en tâche 0, n'est plus utilisé ici. Le
noter dans le registre : le mécanisme est disponible si un jour un champ de
sélection de facette redevient nécessaire.

---

## 4. Tâches 5 et 6 — ajustées

**Tâche 5 supprimée.** Aucun item n'utilise les sept propriétés de raccord ; la
liste de migration est vide. Rien à migrer.

**Tâche 6 maintenue** — retirer les sept paramètres de `Modèle:Organic item` —
et devenue sans risque de perte. Mais elle gagne une échéance : **elle doit être
faite avant la saisie de la facture Weldom du lot 7.** Ce sont ces vingt-deux
lignes qui créeront les premiers vrais items raccord, et ils doivent naître sur
la facette, pas sur le modèle de classe. Sinon on refait la migration qu'on
vient d'éviter, avec des données cette fois.

**Conséquence sur le périmètre :** la facette Raccord reste au lot, bien qu'elle
n'ait aucune donnée. Elle est le second exemplaire qui valide le mécanisme, et
elle sert de gabarit à la saisie du lot 7.

---

## 5. Tâche 8 — points de vérification révisés

Les points 1 à 5 du cadrage supposaient des cases à cocher. Ils sont remplacés
par :

1. Créer un item bac à sable sans ajouter de facette, sauver → **aucun appel
   `{{Organic facet …}}` dans le wikitexte**. C'est le point qui a bloqué la
   tâche 0 ; c'est celui qu'il faut constater en premier.
2. Ajouter la facette végétale, remplir, sauver → annotations végétales et
   `Item_facet` présentes dans `Spécial:Parcourir`.
3. Rouvrir avec le formulaire → l'instance revient, remplie.
4. Supprimer l'instance par sa croix, sauver → l'appel disparaît du wikitexte,
   les annotations avec.
5. Ajouter les deux facettes → les deux blocs coexistent, les deux sous-tableaux
   s'affichent.
6. Vérifier que `maximum instances=1` interdit bien un second exemplaire de la
   même facette.
7. Un item organique existant s'ouvre correctement dans le formulaire modifié.

---

## 6. Trois points hors mécanisme, relevés par la tâche 0

**Lockdown est installée.** Ça tranche une question ouverte du §6 de la
passation, et ça infirme l'état des lieux qui la disait écartée. À corriger en
tâche 9 : la page *Limites connues* et le récapitulatif technique portent une
information fausse.

**Convention numérique confirmée.** `Max_head` est en `Has type::Number` avec
l'unité en texte dans `Property_range`. À appliquer tel quel à `Adult_height`
(m), `Adult_width` (m), `Hardiness_min_temp` (°C) et `Time_to_production`
(années). Ne pas introduire le type Quantity de SMW dans ce lot : une seconde
convention coûterait plus qu'elle ne rapporte tant que la première n'est pas
lassante.

**Le fichier `LocalSettings.php` consulté datait du 26 juillet.** La conclusion
sur le JPEG est donc sous réserve. Elle n'est pas bloquante : si le téléversement
échoue à la tâche 8, on le verra immédiatement et la correction est connue.

---

## 7. Reprise

Le lot repart à la tâche 1. L'ordre reste : 1, 2, 3, 4 par blocs thématiques, 6,
7, 8, 9.
