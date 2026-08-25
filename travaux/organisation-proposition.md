# [Lot 11][Amendement] Proposition — classe Organisation

**Date : 25 août 2026. Lecture et proposition seulement, aucune écriture.**
Numérotation de lot à donner par Cyril — provisoirement `[Amendement]`.

**Pourquoi :** *Avancement du jardin-forêt* liste aujourd'hui les plantations
par lieu (`Located_at`). Ça ne dit pas à qui elles appartiennent, et ça casse
dès qu'une plante change de lieu. Il faut une entité « à qui ça appartient »
pour rester juste dans le temps et rester reproductible par un autre
permaculteur qui voudrait s'approprier le même système.

**Vocabulaire tenu tel que donné :** on instancie **Organisation** ; **Acteur**
est une classe déduite qui réunit personnes morales et physiques, jamais
instanciée directement. Les propriétés qui *visent* un acteur documentent
leur portée comme « un acteur », pas « une organisation » — pour qu'une
future `Catégorie:Personne` s'y glisse sans les toucher.

---

## 1. Le patron lu : `Catégorie:Lieu` et `Modèle:Lieu`

Les deux pages tiennent le même raisonnement, transposable presque mot pour
mot :

- **Hors chaîne, explicitement.** Lieu « n'a ni fonction à remplir, ni
  solution qui la remplit, ni route d'approvisionnement, ni niveau de
  maturité : ce n'est pas une cinquième classe de la chaîne
  fonctionnel → organique → référencé → physique, c'est une entité de
  localisation, à part. » Organisation appelle la même phrase, avec
  « entité d'appartenance » à la place de « entité de localisation ».
- **La catégorie est posée automatiquement par le modèle**, jamais à la
  main — elle vaut appartenance à la classe, pas navigation. Même règle
  pour Organisation.
- **Position dans le modèle** se limite à une phrase de négation (ne
  descend d'aucune des quatre classes, n'en a aucune comme parente) plus,
  pour Lieu, la seule propriété qui la relie à la chaîne (`Located_at`,
  côté Physical item). Organisation n'a aujourd'hui **aucune** propriété qui
  la relie à la chaîne — voir §4, c'est le trou principal.
- **`Champs`** ne documente que ce qui a un comportement à expliquer
  (ici, le repli de `Place_name` sur `PAGENAME` quand le nom d'usage
  diffère du titre). Pas une liste exhaustive des propriétés — celles-ci
  vivent dans l'espace `Attribut:`.
- **Le modèle** : `{{#set:}}` dans un bloc `<includeonly>`, affichage en
  tableau, la catégorie posée en toute dernière ligne. `Modèle:Lieu` ajoute
  deux blocs `#ask` (enfants directs, items physiques présents) —
  gabarit que Organisation n'a pas de raison de reprendre tant qu'aucune
  requête ne le réclame (règle « rien de plus tant qu'aucun usage ne le
  réclame », déjà dans la consigne).

Aucune trace, sur ces deux pages ni ailleurs sur le wiki, d'un rattachement à
une ontologie externe (recherche plein texte `PAIR` et `pair:` : zéro
résultat sur tout le wiki). Le patron ne montre donc pas *comment* documenter
`pair:Organization` — voir §4.1, c'est un vrai manque, pas un oubli de
lecture.

---

## 2. Articulation avec le Registre des préfixes de site

Le registre contient aujourd'hui trois lignes d'organisation (`ADD`, `CWL`,
`ECL`) et une réservation non-organisationnelle (`LOC`, explicitement
écartée par le texte de la page : « LOC n'est pas le code d'une
organisation »). Ce sont des **lignes de tableau à la main**, pas des pages,
pas des faits SMW.

Point structurant que la lecture fait remonter : **ADD et CWL vivent sur
d'autres wikis** (`add.ecolibre.org`, `cwl.ecolibre.org`), chacun avec son
propre magasin SMW. Rien ne fédère les faits entre wikis MediaWiki
indépendants. Le registre existe *précisément* pour ça — un accord partagé
en dehors du magasin de données de chacun. Ça encadre les deux options,
sans trancher entre elles :

**Option A — le registre reste seul maître, la page Organisation ne fait que
recopier.** `Site_code` devient un champ de `Modèle:Organisation` (texte
libre côté page locale), mais le registre continue d'exister tel quel,
maintenu à la main, et c'est lui qui décide de l'unicité fédérée à
l'attribution. La page Organisation locale ne fait qu'afficher un code déjà
réservé — jamais l'inverse. Risque : divergence silencieuse si le code
change d'un côté sans l'autre (aucun mécanisme ne les recoupe aujourd'hui,
et un `#ask` ne peut pas traverser les wikis pour vérifier).

**Option B — le registre devient dérivé pour les organisations qui vivent
sur *ce* wiki.** Pour la ligne `ECL` (et une éventuelle ligne locale future),
la ligne du tableau est remplacée par une requête `#ask` sur
`[[Category:Organisation]]`, sur le modèle des blocs « Enfants directs » de
`Modèle:Lieu`. Les lignes `ADD` et `CWL`, elles, ne peuvent pas suivre ce
chemin — leurs pages Organisation, si elles existent un jour, vivent sur
d'autres wikis — donc le tableau resterait un mélange de lignes générées et
de lignes à la main. Risque : un tableau à deux régimes est plus dur à lire
qu'un tableau uniforme, pour un gain qui ne profite qu'à une ligne sur
quatre.

Je penche pour l'option A — plus simple, un seul maître, pas de tableau à
deux régimes — mais c'est un avis, pas une décision : à trancher par Cyril
avant l'écriture, et à documenter explicitement où que la décision aille,
plutôt que la laisser implicite dans le code du modèle.

---

## 3. Proposition

### a) `Catégorie:Organisation`

Sur le gabarit de `Catégorie:Lieu` :

```
== Définition ==

Une personne morale ou physique qui possède, exploite ou fournit des items —
la fédération elle-même, un partenaire, un fournisseur. Une organisation n'a
ni fonction à remplir, ni solution qui la remplit, ni route
d'approvisionnement, ni niveau de maturité : ce n'est pas une cinquième
classe de la chaîne fonctionnel → organique → référencé → physique, c'est une
entité d'appartenance, à part — au même titre que [[:Catégorie:Lieu|Lieu]]
est une entité de localisation à part.

Organisation instancie [Acteur], classe déduite qui réunit personnes morales
et physiques. Acteur ne s'instancie jamais directement : seules ses
sous-classes le font — Organisation aujourd'hui, une éventuelle Personne
demain, sans que cette page ni les propriétés qui visent un acteur aient à
changer.

Cette catégorie est posée automatiquement par
[[:Modèle:Organisation|Modèle:Organisation]]. Elle ne doit jamais être
ajoutée à la main : elle vaut appartenance à la classe, pas navigation.

== Position dans le modèle ==

Hors chaîne. Ne descend d'aucune des quatre classes de conception et n'en a
aucune comme parente. Aucune propriété ne relie aujourd'hui un item à une
organisation — voir les Limites connues du SGDT pour ce manque tant qu'il
n'est pas comblé.

Ontologie externe : <nowiki>pair:Organization</nowiki>. [à confirmer avant
écriture — voir §4.1, aucune référence PAIR n'existe encore sur ce wiki]

== Champs ==

`Organisation_name` ne recopie pas le titre de la page : elle sert
uniquement aux organisations dont le nom d'usage diffère du titre
(sigle, nom commercial, alias). Laissée vide, la page affiche le titre
par défaut.

[[Catégorie:SGDT]]
```

**Sur `[Acteur]` en gras dans le texte** : proposition d'écrire ce lien vers
`Catégorie:Acteur`, qui n'existe pas et n'est pas créée dans ce lot (voir
§4.2). Un lien rouge est normal et documenté dans le style maison
(`Modèle:Lieu`/`Modèle:Physical item` pointent déjà vers des pages de
fournisseurs et de matériaux qui n'existent pas encore, lot 6 et lot 10).

### b) `Modèle:Organisation`

Sur le gabarit de `Modèle:Lieu`, sans les blocs `#ask` (rien ne les réclame
encore) :

```
<noinclude>
{{Documentation}}
</noinclude>
<includeonly>
{{#set:
|Organisation_name={{{Organisation_name|}}}
|Organisation_description={{{Organisation_description|}}}
|Organisation_site_code={{{Organisation_site_code|}}}
|Organisation_website={{{Organisation_website|}}}
}}

{| class="wikitable" style="width:100%"
|+ Organisation
! colspan="2" style="background:#dfe8d8; text-align:left;" | Identification
|-
! style="background:#f2f2f2; width:30%;" | Nom d'usage
| {{#if:{{{Organisation_name|}}}|{{{Organisation_name}}}|{{PAGENAME}}}}
|-
! style="background:#f2f2f2; width:30%;" | Description
| {{#if:{{{Organisation_description|}}}|{{{Organisation_description}}}|''non renseignée''}}
|-
! style="background:#f2f2f2; width:30%;" | Code de site
| {{#if:{{{Organisation_site_code|}}}|{{{Organisation_site_code}}}|''non attribué''}}
|-
! style="background:#f2f2f2; width:30%;" | Site web
| {{#if:{{{Organisation_website|}}}|{{{Organisation_website}}}|''non renseigné''}}
|}

[[Category:Organisation]]
</includeonly>
```

Minimal, comme demandé : quatre champs, pas de requête, rien câblé vers la
chaîne fonctionnel/organique/référencé/physique tant qu'aucune propriété
d'appartenance n'existe côté item (§4.1).

### c) Pages `Attribut:` nécessaires

Quatre propriétés, format maison vérifié sur `Attribut:Place name` et
`Attribut:Postal address` (`Has type` en premier, cinq annotations dans
l'ordre, domaine = `Category:Organisation`, portée sous 85 caractères) :

**`Attribut:Organisation name`**
```
[[Has type::Text]]
[[Property_description_FR::Nom d'usage de l'organisation, tel qu'affiché sur les pages qui s'y réfèrent.]]
[[Property_description_EN::Common name of the organisation, as displayed on pages that refer to it.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Organisation]]
[[Property_range::nom d'affichage]]
```

**`Attribut:Organisation description`**
```
[[Has type::Text]]
[[Property_description_FR::Description libre de l'organisation.]]
[[Property_description_EN::Free-text description of the organisation.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Organisation]]
[[Property_range::description libre]]
```

**`Attribut:Organisation site code`**
```
[[Has type::Keyword]]
[[Property_description_FR::Code à trois lettres attribué à cette organisation (voir Registre des préfixes de site).]]
[[Property_description_EN::Three-letter code assigned to this organisation (see Site prefix registry).]]
[[Property_cardinality::single]]
[[Property_domain::Category:Organisation]]
[[Property_range::code de site à trois lettres]]
```

**`Attribut:Organisation website`**
```
[[Has type::URL]]
[[Property_description_FR::Site web de l'organisation.]]
[[Property_description_EN::Organisation's website.]]
[[Property_cardinality::single]]
[[Property_domain::Category:Organisation]]
[[Property_range::URL]]
```

**Nommage `Organisation_…` plutôt que `Org_…`** : voir §4.3, pour ne pas
créer une abréviation qui se lit comme « Organic » ailleurs dans le modèle.

### d) Page `Ecolibre`

Confirmé absente de `Special:AllPages` (25 août 2026) : ce sera la toute
première instance de la classe, pas une page existante à faire évoluer.

```
{{Organisation
|Organisation_description=Organisation porteuse du wiki wiki.ecolibre.org et de la fédération SGDT.
|Organisation_site_code=ECL
|Organisation_website=
}}
```

`Organisation_name` laissé vide à dessein — le titre de page « Ecolibre »
suffit, même raisonnement que `Place_name` sur les trois lieux existants,
aucun n'ayant renseigné le champ. `Organisation_website` laissé vide : je
n'ai pas de source fiable pour l'URL exacte (le wiki lui-même n'est pas
« le site web » au sens du champ) — à donner par Cyril avant écriture,
pas à deviner.

---

## 4. Ce qui manque ou est de trop dans cette liste

### 4.1 — La propriété qui relie réellement un item à son organisation n'est pas dans ce lot

C'est elle qui répond au besoin motivant (« lister ce qui appartient à
quelqu'un »), et elle n'est nulle part dans les points a–d ci-dessus : la
tâche demandait la classe Organisation elle-même, pas son câblage à la
chaîne. Sans elle, Organisation existe et rien ne s'y rattache — la page
Ecolibre serait une île.

Une question à trancher avant d'écrire quoi que ce soit sur l'item ou le
lieu : le domaine de cette future propriété (`Owned_by` ou équivalent)
est-il **Physical item** (chaque exemplaire déclare son propriétaire) ou
**Lieu** (le lieu appartient, tout ce qui s'y trouve en hérite par
transitivité via `Located_at`) ? Les deux se défendent : le premier est
plus fin (un exemplaire prêté peut appartenir à quelqu'un d'autre que le
lieu qui l'héberge) ; le second est plus proche de l'usage réel actuel
(le jardin appartient à Cyril, pas chaque plant individuellement) et évite
de saisir la même valeur des dizaines de fois. Je recommande le second par
défaut, avec une dérogation possible au niveau item pour les cas
d'exception — mais c'est un choix de modèle, pas une évidence, et il
mérite son propre passage avant écriture.

### 4.2 — `pair:Organization` n'a aucun précédent sur ce wiki

Recherche plein texte à zéro résultat pour `PAIR` et `pair:`, sur
l'ensemble du wiki. `Catégorie:Lieu` — le patron le plus proche — ne
rattache à aucune ontologie externe. La proposition en §3.a invente donc un
format (une ligne de texte en pied de section, protégée en `<nowiki>` pour
ne pas s'exécuter comme un lien interwiki si `pair:` était configuré comme
tel) faute d'exemple à suivre. Deux choses à confirmer avant d'écrire :

- l'IRI complète de la classe visée (le sigle seul ne suffit pas à qui
  relira dans deux ans) ;
- si `pair:` doit être un vrai préfixe interwiki configuré côté
  `LocalSettings_ecolibre.php` (ce qui relève de `demandes-adminsys.md`,
  pas d'une édition de page) ou rester une mention documentaire en texte
  brut.

### 4.3 — Risque de collision de lecture entre `Org_` et `Organic`

Le modèle utilise déjà abondamment « Organic » (`Organic item`, `Organic
facet plant`…) pour la classe organique de la chaîne fonctionnel → organique
→ référencé → physique — sans rapport avec Organisation. Une abréviation
`Org_name` risquait de se lire comme une propriété de la classe Organic à
qui découvre le modèle sans contexte. §3.c propose donc `Organisation_name`
en toutes lettres — plus long, sans ambiguïté possible, cohérent avec
`Property_domain::Category:Organisation` déjà écrit en toutes lettres sur
chaque page d'attribut.

### 4.4 — La page `Ecolibre` fait jurisprudence

Rien à changer dans ce qui précède, mais à savoir avant d'écrire : c'est la
première instance de la classe, donc tout choix fait dessus (vide vs
renseigné, formulation de la description) sert de modèle de fait aux
instances futures d'ADD et CWL — si elles sont un jour créées ici, ce qui
renvoie à l'option A/B du §2.

### 4.5 — Rien de trop identifié

Le périmètre a–d demandé est déjà minimal ; je n'ai rien à retrancher. Les
seuls candidats à un champ supplémentaire (contact, email) sont
délibérément absents ici, cohérent avec la consigne « rien de plus tant
qu'aucun usage ne le réclame » — à confirmer que ce n'est pas un oubli
plutôt qu'un choix.

---

## Avant d'écrire

1. Trancher §2 (registre) — option A recommandée, à confirmer.
2. Trancher §4.1 (domaine de la future propriété d'appartenance) — hors
   périmètre de ce lot mais conditionne s'il faut prévoir de la place.
3. Confirmer §4.2 (IRI PAIR exacte, statut du préfixe interwiki).
4. Confirmer §4.3 (nommage `Organisation_…`) et fournir l'URL pour
   `Organisation_website` sur la page Ecolibre.
5. Vérifier qu'aucune des quatre propriétés proposées ne collisionne avec
   l'existant (contrôle sur le wiki vivant, pas fait ici — cette lecture
   n'a couvert que les pages nommément citées par la tâche).
