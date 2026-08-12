# Diff — Organic item, Part_of multivalué

**Statut :** validé et écrit — `Modèle:Organic item` rev 355,
`Formulaire:Organic item` rev 356, tous deux confirmés identiques par
relecture après écriture. `Physical item` non touché (mono-parent correct
pour un exemplaire physique).

**Constat de départ :** `+sep=,` du `#set` portait sur `Realizes_function`,
pas sur `Part_of` — l'organique ne pouvait stocker qu'un seul parent.
Affichage « Parent organique » en texte brut, sans lien. Formulaire :
`Part_of` en `combobox` sans `list`, contrairement à tous les autres champs
multivalués du même formulaire.

**Ordre d'écriture : modèle avant formulaire**, conformément à la leçon 4 du
lot 6 (poser `+sep=`/`#arraymap` sur un modèle recevant une valeur unique est
inerte ; l'ordre inverse ouvrirait une fenêtre où le formulaire pourrait
soumettre plusieurs valeurs à un modèle encore incapable de les stocker).

## 1. `Modèle:Organic item`

```diff
 |Realizes_function={{{Realizes_function|}}}
 |+sep=,
 |Part_of={{{Part_of|}}}
+|+sep=,
 |Connection_gender={{{Connection_gender|}}}
 ...
 ! style="background:#f2f2f2" | Parent organique
-| {{{Part_of|}}}
+| {{#arraymap:{{{Part_of|}}}|,|@@@|[[@@@]]|,&#32;}}
```

## 2. `Formulaire:Organic item`

```diff
 ! Parent organique :
-| {{{field|Part_of|input type=combobox|values from category=Organic item}}}
+| {{{field|Part_of|list|delimiter=,|input type=tokens|values from category=Organic item}}}
```

Aligné sur `Formulaire:Functional item` :
`{{{field|Part_of|list|delimiter=,|input type=tokens|values from category=Functional item|placeholder=Sélectionner...}}}`
— `placeholder=` non repris, absent du périmètre demandé par Cyril.
