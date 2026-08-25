# Lot 11, tâche 4 — test de cascade Location_lineage : ARRÊTÉ à l'état de référence

2026-08-24/25. Mené via `/loop`. **Le test n'a pas eu lieu** — l'état de
référence attendu sur `Casc A`, `Casc B`, `Casc C` était faux, comme les
consignes anticipaient (« Sinon ARRÊTE et rapporte »). Aucune bascule de
parent faite sur `Casc A`, aucune attente entamée. Nettoyage fait, les
cinq pages sont blanchies.

## Mise en place — ordre respecté

Session ouverte par `bin/wiki-login.sh` avant la première écriture.
Vérifié avant création : aucune des cinq pages n'existait
(`Utilisateur:Cywil/Bac à sable/Casc R1`, `R2`, `A`, `B`, `C`, toutes
`wiki-get.sh` → « doesn't exist »). Créées dans l'ordre demandé, chaque
parent vérifié porteur de son fait avant la création de l'enfant suivant
(`--createonly` sur chacune) :

1. `Casc R1` — `{{#set:Casc lineage={{FULLPAGENAME}}}}`. Vérifié après
   coup : `Casc_lineage -> ['Cywil/Bac_à_sable/Casc_R1#2##']`.
2. `Casc R2` — même forme.
3. `Casc A`, parent `Casc R1` — wikitexte exact fourni.
4. `Casc B`, parent `Casc A` — wikitexte exact fourni.
5. `Casc C`, parent `Casc B` — wikitexte exact fourni.

## État de référence — `browsebysubject` sans filtre sur A, B, C

Relevé brut, immédiatement après création de C (avant toute attente,
avant toute bascule) :

**Casc A :**
```
Casc_parent -> ['Cywil/Bac_à_sable/Casc_R1#2##']
_ASK -> ['Cywil/Bac_à_sable/Casc_A#2##_QUERY8057fd4398874bc8d6e02617b08c0b21']
_ERRC -> ['Cywil/Bac_à_sable/Casc_A#2##_ERR936f7f7a42bb2130fa833ee222dd621c']
_MDAT -> ['1/2026/8/24/23/53/7/0']
_SKEY -> ['Cywil/Bac à sable/Casc A']
```
**`Casc_lineage` absent. `_ERRC` présent.**

**Casc B :**
```
Casc_lineage -> ['Cywil/Bac_à_sable/Casc_B,_Utilisateur:Cywil/Bac_à_sable/Casc_A,#2##']
Casc_parent -> ['Cywil/Bac_à_sable/Casc_A#2##']
_ASK -> ['Cywil/Bac_à_sable/Casc_B#2##_QUERYaf3fbd78d6da7cb2ed1e895a126418be']
_MDAT -> ['1/2026/8/24/23/53/47/0']
_SKEY -> ['Cywil/Bac à sable/Casc B']
```
**Un seul fait `Casc_lineage`, une valeur unique et malformée** (la
chaîne entière, virgules comprises, prise pour un seul titre de page —
pas d'`_ERRC` ici).

**Casc C :**
```
Casc_parent -> ['Cywil/Bac_à_sable/Casc_B#2##']
_ASK -> ['Cywil/Bac_à_sable/Casc_C#2##_QUERYbd7d4473d46609fd374176b655ec3da3']
_ERRC -> ['Cywil/Bac_à_sable/Casc_C#2##_ERR936f7f7a42bb2130fa833ee222dd621c']
_MDAT -> ['1/2026/8/24/23/53/52/0']
_SKEY -> ['Cywil/Bac à sable/Casc C']
```
**`Casc_lineage` absent. `_ERRC` présent**, même hash d'erreur que `Casc A`.

**C ne porte pas les quatre valeurs attendues (C, B, A, R1) — elle n'en
porte aucune.** L'état de référence est faux. Conformément à la consigne,
le test s'arrête ici : aucune bascule de parent sur `Casc A`, aucune
mesure à cinq ni quinze minutes.

## Ce qui a cassé, et pourquoi (diagnostic, pas une correction)

Messages d'avertissement relevés (`action=parse&prop=text`) sur `Casc A`
et `Casc C` :

**Casc A** :
> La propriété « Casc lineage » (en tant que type de page) avec la
> valeur d'entrée « Utilisateur:Cywil/Bac à sable/Casc A, Utilisateur:
> Cywil/Bac à sable/Casc R1, [[:Utilisateur:Cywil/Bac à sable/Casc
> R1|Cywil/Bac à sable/Casc R1 » contient des caractères non valides ou
> est incomplète […]

**Casc C** :
> La propriété « Casc lineage » (en tant que type de page) avec la
> valeur d'entrée « Utilisateur:Cywil/Bac à sable/Casc C, Utilisateur:
> Cywil/Bac à sable/Casc B, [[:Utilisateur:Cywil/Bac à sable/Casc B,
> Utilisateur:Cywil/Bac à sable/Casc A,|Cywil/Bac à sable/Casc B,
> Utilisateur:Cywil/Bac à sable/Casc A, » contient des caractères non
> valides ou est incomplète […]

**Mécanisme identifié** : `{{#show:...|?Casc lineage}}` sur une
propriété de type Page ne rend pas la valeur brute stockée — il rend un
**lien wiki** (`[[:Page|texte affiché]]`). Concaténé sans échappement
dans un `#set` d'une AUTRE propriété de type Page (via la virgule, sans
`+sep=`), les crochets `[[` `]]` produits par le `#show` atterrissent à
l'intérieur d'une valeur de type Page, qui les refuse comme caractères
non valides — tout le `#set` échoue, rien n'est stocké, `_ERRC` posé.

- **Sur `Casc A`** : le `#show` porte sur `Casc R1`, dont le
  `Casc_lineage` est une valeur simple (un seul titre) — le lien produit
  est court mais contient quand même `[[`, ce qui suffit à faire échouer
  tout le `#set` de `Casc A`.
- **Sur `Casc B`** : le `#show` porte sur `Casc A`, qui **n'a pas** de
  `Casc_lineage` stocké (l'échec précédent) — `{{#show:}}` sur une
  propriété absente rend une chaîne **vide**, pas un lien. La
  concaténation de `Casc B` ne contient donc aucun crochet, seulement
  une virgule traînante ; SMW accepte cette chaîne bizarre mais
  syntaxiquement inoffensive comme un titre de page unique. **Résultat
  trompeur** : `Casc B` porte un fait `Casc_lineage`, mais un fait faux
  (une seule valeur, pas une liste), et sans le moindre avertissement
  visible autre que la valeur elle-même.
- **Sur `Casc C`** : le `#show` porte sur `Casc B`, qui **a** un
  `Casc_lineage` stocké (le titre malformé ci-dessus) — `{{#show:}}`
  rend cette fois un vrai lien vers ce titre malformé, crochets inclus,
  et `Casc C` échoue exactement comme `Casc A`.

**Ce n'est donc pas un problème de timing ou d'ordre de création** (les
consignes anticipaient un lignage vide si un enfant était créé avant son
parent — ce n'est pas ce qui s'est produit, l'ordre a été respecté). Le
défaut est dans la forme du `#set` lui-même : `{{#show:}}` sur une
propriété Page rend un lien, pas une valeur brute, et ce lien casse
l'annotation qui le reçoit. Le patron testé ne peut pas fonctionner tel
quel pour une propriété de type Page — indépendamment de toute question
de cascade ou de délai de propagation, ce que ce test devait précisément
mesurer.

## Nettoyage

Les cinq pages relues avant blanchiment (contenu conforme à ce qui avait
été écrit), puis blanchies (une ligne de contexte, pas un fichier vide —
`wiki-put.sh` exige un paramètre `text` non vide, `missingparam` sinon) :
```
Page de test — lot 11, tâche 4, cascade Casc lineage. Blanchie après le
test ; à supprimer (voir demandes-adminsys.md).
```
`browsebysubject` sur les cinq après blanchiment : seuls `_MDAT`/`_SKEY`
restent sur chacune — aucun fait résiduel (`Casc_lineage`, `Casc_parent`,
`_ERRC` tous absents).

**Rappel** : `Attribut:Casc parent` et `Attribut:Casc lineage` ne sont
pas supprimables par ce compte (pas de droit `delete`, confirmé
précédemment via `meta=userinfo`). Elles s'ajoutent à la liste des pages
de test que Cyril doit supprimer, avec les cinq sous-pages du bac à
sable (`Casc R1`, `Casc R2`, `Casc A`, `Casc B`, `Casc C`) — sept pages
au total pour cette tâche.

## Pour la suite

Le test de cascade tel que conçu ne peut pas être rejoué sans corriger
le patron du `#set` — a minima retirer le `{{#show:}}` de la
concaténation, ou changer le type de `Casc lineage` pour qu'il tolère
une liste de liens (ce qui déplacerait le problème vers `Location_lineage`
et `Modèle:Lieu`, l'enjeu réel de cette tâche). Pas de proposition faite
ici — diagnostic seul, comme le reste de cette tâche jusqu'à
interruption.

Boucle arrêtée : plus rien à mesurer, le test ne peut pas continuer sur
sa forme actuelle.
