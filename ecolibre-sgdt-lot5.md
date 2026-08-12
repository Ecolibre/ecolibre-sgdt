# Lot 5 — Registre, fonctions multiples, corrections

**Pour :** session Claude Code, dépôt `~/ecolibre-sgdt`
**Cible :** `https://wiki.ecolibre.org` — MediaWiki 1.39.11, SMW 4.2.0
**Suite de :** lot 4 (numérotation d'inventaire, opérationnelle et testée)
**Établi le :** 26 juillet 2026

---

## 0. Garde-fous propres à ce lot

**Le `Registre des préfixes de site` vient d'être modifié à la main par Cyril.**
Le relire en direct et fusionner. Ne jamais l'écraser depuis une version
mémorisée.

**Ce lot précède immédiatement une session de saisie réelle.** Cyril va créer
la chaîne complète de son système de purge de puits juste après. La
numérotation Base 36 ne doit pas bouger pendant ce temps : aucune écriture sur
`Module:Base36`, aucun changement de type sur `Item_ref`. C'est le lot 6.

---

## 1. Action S — Corriger les info-bulles du formulaire physique

`info=` n'est pas un paramètre de champ valide dans Page Forms ; le paramètre
correct est `description=`. Les deux textes écrits au lot 4 existent dans le
wikitexte mais ne s'affichent pas.

Dans `Formulaire:Physical item`, remplacer `info=` par `description=` sur les
deux champs `site_code` et `ref_number`. Ne rien changer d'autre.

Résumé : `[Lot 5] Action S — info= remplacé par description= (paramètre valide)`

**Contrôle :** ouvrir `Spécial:AjouterDonnées/Physical item/Test affichage` et
vérifier que les deux textes apparaissent bien à côté des champs. Ne pas
enregistrer la page.

---

## 2. Action T — Enrichir le registre

**Lire d'abord la page en direct** : Cyril y a ajouté à la main la ligne `CWL`,
la colonne d'autorité et probablement la règle associée. Ne rien dupliquer.

Compléter ce qui manque, sans réécrire ce qui est là :

**La justification**, si elle n'y figure pas déjà, en trois raisons emboîtées :

```wikitext
Le code de site permet à chaque organisation de numéroter son inventaire sans
demander à personne si un numéro est libre : c'est ce qui rend les partenaires
autonomes.

Mais un exemplaire peut être publié sur un wiki qui n'est pas celui de son
détenteur. Deux organisations qui choisiraient les mêmes trois lettres
produiraient alors des références identiques désignant des objets différents,
sans que rien ne le signale. Ce registre est le point unique où l'unicité se
vérifie, et il doit être tenu '''avant''' l'usage, jamais après.

C'est aussi pourquoi un code attribué ne se réemploie jamais : les références
déjà émises lui survivent, y compris dans les copies publiées sur d'autres
wikis.
```

**Les catégories.** Vérifier d'abord quelles catégories de documentation
existent réellement (`list=allpages&apnamespace=14`) et rattacher la page à
celle qui convient — `Documentation SGDT` si elle existe. Ne pas inventer de
catégorie.

Résumé : `[Lot 5] Action T — justification et catégorisation du registre`

---

## 3. Action U — Sortir le registre de l'orphelinat

La page n'a aucun lien entrant hors de `Modèle:Préfixe site`. Personne ne la
trouvera.

Ajouter un lien depuis trois endroits :

**`Catégorie:Physical item`** — c'est là que regarde quelqu'un qui s'apprête à
créer un exemplaire. Une phrase dans la section de définition, après le
paragraphe existant, du type : le code de site qui préfixe la référence
d'inventaire est attribué par le [[Registre des préfixes de site]].

**`Récapitulatif technique`** — une sous-section courte sous « Configuration
hors wiki » ou à la suite de « Les quatre classes », selon ce que la structure
permet. Elle doit dire : les items physiques ont leur propre numérotation,
préfixée par un code de site à trois lettres, indépendante de la séquence Base
36 des trois classes de conception ; les codes sont enregistrés dans le
registre.

**`Système de Gestion de Données Techniques orienté matériel libre`** — la page
portail, celle qui porte les liens de création des quatre types d'items. Lire
sa structure d'abord ; si aucun emplacement n'est manifestement approprié,
**remonter la question plutôt que de placer le lien au jugé**.

Vérifier au passage que le lien de `Modèle:Préfixe site` pointe bien sur le
titre exact de la page.

Résumé : `[Lot 5] Action U — liens entrants vers le registre des préfixes`

---

## 4. Action V — Contrôle préalable, avant toute écriture de la phase 2

Aucun titre d'item fonctionnel ne doit contenir de virgule. Cyril l'a vérifié à
la main ; le revérifier par programme sur les 19 membres de
`Category:Functional item`.

**Si une seule virgule est trouvée : arrêt, et signalement.** La virgule est sur
le point de devenir un séparateur de valeurs — c'est la dette n°1 du lot 1, à
l'envers.

---

## 5. Actions W à Y — `Realizes_function` devient multivaluée

Un item organique peut réaliser plusieurs fonctions. Un châssis assure la
structure, le maintien et la protection ; le modèle actuel n'en accepte qu'une.

**Action W — `Attribut:Realizes function`**
Passer `Property_cardinality` de `single` à `multiple`. Une ligne.
Résumé : `[Lot 5] Action W — Realizes_function passe en cardinalité multiple`

**Action X — `Modèle:Organic item`**
Ajouter `|+sep=,` immédiatement après la ligne `Realizes_function` du `#set`.
Le paramètre s'applique à l'assignation qui le précède.
Résumé : `[Lot 5] Action X — +sep=, sur Realizes_function`

**Action Y — `Formulaire:Organic item`**
Passer le champ de fonction en saisie multiple. **Reprendre exactement le motif
du champ `parents` de `Formulaire:Referenced item`** (`input type=tokens|list`)
plutôt que d'en inventer un. Lire les deux formulaires avant d'écrire.
Résumé : `[Lot 5] Action Y — saisie multiple des fonctions réalisées`

### Contrôle de la phase 2

Les deux items organiques existants ne visent qu'une fonction chacun : rien à
reprendre, mais rien ne prouve non plus que le multivalué fonctionne.

Test propre, en trois temps :

1. Créer `Utilisateur:Cywil/Test multivalué` transcluant `Modèle:Organic item`
   avec deux fonctions séparées par une virgule, prises parmi les items
   fonctionnels existants.
2. `action=browsebysubject` sur cette page : `Realizes_function` doit porter
   **deux valeurs distinctes de type Page**, et non un littéral unique.
3. Vider la page immédiatement après le contrôle (le compte bot ne peut pas
   supprimer). Vérifier que `Category:Organic item` est bien redescendue à
   2 membres.

Rapporter le résultat de l'étape 2 tel quel.

---

## 6. Action Z — Mettre les règles du Récapitulatif à jour

Deux corrections dans la même édition, après que la phase 2 est passée.

**Dans « Règles métier »**, ajouter une puce :

```wikitext
* Un nom d'item fonctionnel '''ne contient pas de virgule''' — depuis que <code>Realizes_function</code> est multivaluée, la virgule y sert de séparateur de valeurs.
```

**Dans « Règles implicites »**, la puce sur la séquence Base 36 est devenue
inexacte : elle affirme que les items physiques sont exclus et saisis à la main,
alors qu'ils ne portent plus `Item_ref` du tout depuis le lot 4. Elle fond aussi
en un seul mécanisme deux requêtes distinctes. La remplacer par :

```wikitext
* La '''séquence Base 36 est partagée''' entre les items fonctionnels, organiques et référencés : le calcul du numéro suivant interroge les trois catégories ensemble. Ce filtre est '''recopié à l'identique dans les trois formulaires''' — modifier l'un sans les autres ferait diverger les séquences sans que rien ne le signale.
* Les items physiques '''ne portent pas <code>Item_ref</code>''' : ils ont leur propre numérotation d'inventaire, préfixée par un code de site, indépendante de la séquence de conception.
* <code>Template:Item numbering audit</code> interroge <code>[[Item_ref::+]]</code> '''sans aucun filtre de catégorie''' : la détection des trous porte sur tout le wiki, pas sur une classe.
* <code>Realizes_function</code> est multivaluée : un item organique peut réaliser plusieurs fonctions.
```

Résumé : `[Lot 5] Action Z — règles métier et implicites remises à jour`

---

## 7. Contrôles finaux

1. `list=categorymembers` sur les quatre classes : 19, 2, et les deux compteurs
   d'items référencés et physiques tels qu'ils étaient en début de session.
   L'action U ajoute des liens de catégorie dans plusieurs pages — vérifier
   qu'aucun `:` initial n'a été oublié.
2. Le registre a au moins trois liens entrants (`list=backlinks`).
3. `Attribut:Realizes function` affiche bien `multiple` dans le tableau du
   Récapitulatif.
4. `Utilisateur:Cywil/Test multivalué` est vide et hors de toute catégorie.

---

## 8. Renvoyé au lot 6

**Durcissement de `Module:Base36`** — normalisation de la casse, détection des
doublons — et **bascule de `Item_ref` de `Code` vers `Keyword`**. L'ordre y est
contraint : le durcissement d'abord, la bascule de type ensuite.

Écartés de ce lot parce que Cyril s'apprête à saisir une chaîne complète
d'items, et que la numérotation doit rester stable pendant ce travail.

---

## 9. Ne pas faire

- Ne pas écraser le registre : le relire, fusionner.
- Ne pas toucher `Module:Base36` ni le type de `Item_ref`.
- Ne pas modifier les modèles ni les formulaires des trois autres classes.
- Ne pas placer le lien du portail au jugé si sa structure ne s'y prête pas.
- Ne pas laisser la page de test transcluse après le contrôle.
