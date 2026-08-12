# Diff — Correction hors-lot : liens vides affichant `[[]]`

**Statut :** validé et écrit — `Modèle:Referenced item` rev 352, confirmé
identique par relecture (`bin/wiki-get.sh`) après écriture.

**Contexte :** demande explicite de Cyril, avant reprise de la Tâche 3.
`Modèle:Referenced item` affiche `Corresponds_to_organic`, `Supplier` et
`Manufacturer` par `[[{{{param|}}}]]` sans garde : un item où ces paramètres
sont vides (paramètre facultatif) rend un lien littéral `[[]]` au lieu de
n'afficher rien. Correction : encadrer chaque lien d'un `{{#if:}}` testant le
paramètre avant de le rendre.

**Protection vérifiée :** `bin/wiki-get.sh --protection "Modèle:Referenced item"`
→ aucune protection native (Lockdown, si actif, resterait invisible ici).

---

## 1. `Modèle:Referenced item`

```diff
 ! style="background:#e8f0ff" | Item Organique associé
-| [[{{{Corresponds_to_organic|}}}]]
+| {{#if:{{{Corresponds_to_organic|}}}|[[{{{Corresponds_to_organic|}}}]]}}
 |-
 ! style="background:#f2f2f2" | État de maturité
 ...
 ! style="background:#e8f0ff" | Fournisseur
-| [[{{{Supplier|}}}]]
+| {{#if:{{{Supplier|}}}|[[{{{Supplier|}}}]]}}
 |-
 ! style="background:#f2f2f2" | Réf. fournisseur
 ...
 ! style="background:#e8f0ff" | Fabricant
-| [[{{{Manufacturer|}}}]]
+| {{#if:{{{Manufacturer|}}}|[[{{{Manufacturer|}}}]]}}
```

---

## 2. Même défaut, `Modèle:Organic item` et `Modèle:Physical item`

**Statut :** validé par Cyril, écrit.

Repéré à la vérification, puis corrigé par la même méthode (`{{#if:}}`).
Écrit et confirmé identique par relecture : `Modèle:Organic item` rev 353,
`Modèle:Physical item` rev 354.

### 2.1 `Modèle:Organic item`

```diff
 ! style="background:#e8f0ff" | Réalise la fonction
-| [[{{{Realizes_function|}}}]]
+| {{#if:{{{Realizes_function|}}}|[[{{{Realizes_function|}}}]]}}
```

### 2.2 `Modèle:Physical item`

```diff
 ! style="background:#f2f2f2" | Modèle (Réf. technique)
-| [[{{{model_link|}}}]]
+| {{#if:{{{model_link|}}}|[[{{{model_link|}}}]]}}
 ...
 ! style="background:#e8f0ff" | Installé dans (Parent physique)
-| [[{{{physical_parent|}}}]]
+| {{#if:{{{physical_parent|}}}|[[{{{physical_parent|}}}]]}}
```
