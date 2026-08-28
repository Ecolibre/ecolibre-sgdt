# Négation SMW — mesure refaite, et vérification de numérotation

Deux vérifications demandées après le contrôle du lot 9.

---

## 1. `[[X::!+]]` rend le complément exact de ce qu'on demande

### Mesure refaite (28 août 2026)

| Requête | `count` | `meta.hash` |
|---|---|---|
| `[[Depicts_specimen::!+]]` seule | **65** | `371ee7fbe61129413273d02460f9b756` |
| `[[Depicts_specimen::+]]` | **65** | `371ee7fbe61129413273d02460f9b756` |
| `[[Image_location::+]][[Depicts_specimen::!+]]` | **65** | `371ee7fbe61129413273d02460f9b756` |
| `[[Image_location::+]]` (référence) | 73 | `c26e398220b7dc6f96a4e94e825d7c5a` |

**Les trois premières lignes ont le même `meta.hash`.** Ce n'est pas
« un comportement proche », c'est **la même requête compilée** :
`[[Depicts_specimen::!+]]` est réécrit en `[[Depicts_specimen::+]]`, le
`!` est jeté. Les résultats sont les pages qui **portent**
`Depicts_specimen` — le complément exact de « pages sans
`Depicts_specimen` ». Les trois premiers résultats retournés sont des
photos d'Ail éléphant qui, elles, ont bien un `Depicts_specimen` : la
requête rend précisément l'inverse de son intention.

Dans la conjonction, `[[Image_location::+]]` est même absorbé
(`Depicts_specimen ⊆ Image_location`), d'où le hash identique à
`[[Depicts_specimen::+]]` seul.

### Pourquoi l'entrée existante dit « zéro »

L'entrée n° 23 (voir §2) a été écrite le 16 août 2026 à partir d'un
test sur `Main_image`, qu'**aucune** plantation ne portait alors.
`[[Main_image::+]]` valait 0 ; `[[Main_image::!+]]`, étant la même
requête, valait 0 aussi. On a lu 0 et conclu « `!+` rend zéro ». C'était
un artefact des données du test, pas le comportement.

### Ce qui rend ça plus grave que « zéro »

Un zéro se remarque : « 0 plantation sans photo, c'est louche ». Un
`65` crédible ne se questionne pas — on le prend pour la réponse. La
négation SMW ne « casse » pas bruyamment : elle rend un chiffre faux et
plausible. C'est le pire des deux mondes.

### Proposition de mise à jour — entrée n° 23 (PROPOSÉE, NON ÉCRITE)

**Texte actuel** (`# ` unique, file line 38 de la copie locale) :

> '''Semantic MediaWiki 4.2.0 n'exprime ni la négation, ni l'absence
> d'une propriété.''' `[[X::!+]]` ne rend '''pas''' les pages
> dépourvues de `X` : il rend zéro résultat. Vérifié le 16 août 2026
> sur `Main_image`, alors qu'aucune plantation ne la portait — la
> requête « plantations sans photo principale » du Buisson de Cerzat
> rend `0` au lieu des `29` attendues, sans erreur ni avertissement. La
> variante `[[!X::+]]`, elle, produit une erreur explicite (« contient
> un caractère « ! » répertorié comme faisant partie du libellé de la
> propriété ») '''et la condition est purement ignorée''' — la requête
> rend alors l'ensemble non filtré, ce qui peut passer pour un succès si
> l'on ne lit pas le message. '''Une requête « tout sauf » n'est donc
> pas exprimable directement.''' La parade est de '''matérialiser le
> complément par une propriété positive''' […] : il n'y en a pas.

**Texte proposé** (une seule ligne `# `, syntaxe en
`<code><nowiki>…</nowiki></code>` comme le reste de la page) :

> '''Semantic MediaWiki 4.2.0 n'exprime ni la négation, ni l'absence
> d'une propriété — et `[[X::!+]]` est silencieusement compilé en
> `[[X::+]]`, le `!` jeté.''' La requête rend alors les pages qui
> '''portent''' `X` : le complément exact de ce qu'on demandait.
> Mesuré le 28 août 2026 sur `Depicts_specimen` :
> `[[Depicts_specimen::!+]]` et `[[Depicts_specimen::+]]` rendent
> toutes deux 65 résultats, '''avec le même `meta.hash`'''
> (`371ee7fbe61129413273d02460f9b756`) — c'est la même requête.
> '''Cette entrée a longtemps affirmé que `[[X::!+]]` « rend zéro
> résultat » :''' c'était un artefact du test du 16 août 2026 sur
> `Main_image`, qu'aucune plantation ne portait — `[[Main_image::+]]`
> valait 0, donc `[[Main_image::!+]]` aussi (la requête « plantations
> sans photo principale » du Buisson rendait `0` au lieu de `29`).
> '''Le vrai comportement est plus dangereux qu'un zéro :''' un zéro se
> remarque, un compte plausible du mauvais ensemble se croit. La
> variante `[[!X::+]]` (le `!` sur le '''nom''' de propriété) produit,
> elle, une erreur explicite (« contient un caractère « ! » répertorié
> comme faisant partie du libellé de la propriété ») '''et la condition
> est purement ignorée''' — la requête rend l'ensemble non filtré, ce
> qui peut aussi passer pour un succès. '''Une requête « tout sauf »
> n'est donc exprimable sous aucune des deux formes.''' La parade est
> de '''matérialiser le complément par une propriété positive''' — une
> valeur présente que l'on peut interroger — et non de chercher une
> forme de négation : il n'y en a pas.

Résumé d'écriture proposé :
`[Correctif] Limites connues n° 23 — [[X::!+]] rend le complément, pas zéro`

Conséquence sur l'entrée n° 24 (« Conséquence acceptée sur *Avancement
du jardin-forêt* ») : elle cite `[[Main_image::!+]] (voir ci-dessus)`
comme contournement écarté. Le renvoi reste valide — il pointe vers la
n° 23, désormais plus juste. Rien à changer sur la n° 24.

---

## 2. Vérification de numérotation — « n° 38 » et « n° 45 » n'existent pas

### Compte réel

*Limites connues du Système de Gestion de Données Techniques*, rendu
aujourd'hui : **34 entrées** dans la liste numérotée (comptées une à
une sur le wikitexte récupéré, lignes `# ` en tête). C'est bien le
compte d'hier : 33 entrées + la n° 34 sur le renommage en production.

Les entrées que je voulais citer :

| Sujet | Numéro d'entrée réel | Ligne dans ma copie locale (`Read`, format `cat -n`) |
|---|---|---|
| SMW n'exprime pas la négation (`[[X::!+]]`) | **n° 23** | ligne 38 |
| `#show` sur un espace non sémantique | **n° 30** | ligne 45 |

**n° 38 et n° 45 n'existent pas** : la liste s'arrête à 34.

### D'où vient l'erreur

Pas de mémoire — d'un **décalage entre le numéro de ligne et le numéro
d'entrée**. Ma copie locale de la page est lue avec l'outil `Read`, qui
préfixe chaque ligne de son numéro (`cat -n`). L'entrée sur la négation
est à la **ligne 38** du fichier, l'entrée `#show` à la **ligne 45**.
J'ai repris ces numéros de ligne comme si c'étaient des numéros
d'entrée. La liste commence ligne 16 : entrée n° K = ligne 15 + K.

### Où l'erreur a été écrite

Uniquement dans **`travaux/outillage-suite.md`**, deux endroits :

- ligne 87 : « (entrée n° 38 de *Limites connues*) » → devrait être
  **n° 23** ;
- ligne 122 : « piège de l'entrée n° 45 de *Limites connues* » →
  devrait être **n° 30**.

**Les pages écrites sur le wiki cette session sont indemnes** — vérifié
entrée par entrée contre la liste rendue :

- *Limites connues* n° 34 (mon texte) cite « entrées n° 26 et n° 32 » —
  correctes ;
- *Catégorie:Lieu* cite « entrée n° 26 » et « n° 34 » — correctes.

### Correction à faire

`travaux/outillage-suite.md` lignes 87 et 122 : `n° 38 → n° 23`,
`n° 45 → n° 30`. Non corrigé ici (ce document n'écrit que
`negation-smw.md`) — à faire sur indication, ou à intégrer si la
proposition du §1 part en écriture.

**Règle à retenir** : un numéro d'entrée de *Limites connues* se
compte sur la liste rendue, jamais sur le numéro de ligne du wikitexte.
Décalage constant de 15 (entrée n° K = ligne 15 + K), mais ce décalage
bougera au prochain remaniement du chapô — donc compter, pas
soustraire.
