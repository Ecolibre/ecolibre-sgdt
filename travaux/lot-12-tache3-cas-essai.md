# Lot 12 — tâche 3 sur 4 : cas d'essai réel (fer à souder, sacoche, caisse, pile)

Date : 11 octobre 2026.

**Tâche arrêtée à l'étape 4, avant toute écriture sur le wiki.** L'expression
du formulaire `Formulaire:Physical item`, évaluée en ligne, rend `0046` là où
la consigne attendait `000C`. La consigne demandait de s'arrêter dans ce cas.
Aucune des neuf créations ni la modification du fer à souder n'a été faite.

## État du dépôt et règles locales au départ

- `git status` : seul `travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md`
  non suivi, hors compte comme prévu.
- `.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Lectures

`CLAUDE.md` ; sur le wiki : `Lot 12 — Contenants et étiquetage`,
`Stocker des ressources`, `Bidon 220L`, `Bidon 220L bleu plastique Borde`,
`Atelier appartement`, `Fer à souder — Atelier appartement (CWL-0009)` ;
champs de référence de `Formulaire:Functional item`, `Formulaire:Lieu`,
`Formulaire:Physical item` ; faits de `Attribut:Location type` (Keyword,
texte libre, aucune liste fermée : `zone` et `pile` seraient acceptées) ;
`Modèle:Préfixe site`.

## Mesures avant

Par `action=ask` en liste (longueur de `results`, aucune suite de pagination).

| Mesure | Attendu | Mesuré |
|---|---|---|
| Functional item | 26 | 26 |
| Organic item | 40 | 40 |
| Referenced item | 39 | 39 |
| Physical item | 48 | 48 |
| Lieu | 13 | 13 |
| Porteurs de `Located_at` | 45 | 45 |
| Porteurs de `Contained_in` | 0 | 0 |

Toutes conformes.

## Références évaluées

Par `action=expandtemplates`, `title=Utilisateur:Cywil/Bac à sable`,
expressions recopiées des formulaires. Aucune création n'ayant eu lieu, chaque
expression n'a été évaluée qu'une fois.

| Banque | Expression (ci-dessous) | Attendu | Rendu |
|---|---|---|---|
| Items F/O/R | E1 | 002Z | **002Z**, conforme |
| Lieux | E2 | 0014 | **0014**, conforme (`{{Préfixe lieu}}` rend `LOC`) |
| Physiques | E3 | 000C | **0046 — écart, arrêt** |

- E1, `Formulaire:Functional item`, champ `Item_ref` :
  `{{#invoke:Base36|next|{{#ask: [[Category:Functional item||Organic item||Referenced item]] [[Item_ref::+]] |?Item_ref= |sort=Item_ref |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }}`
- E2, `Formulaire:Lieu`, champ `Location_number` :
  `{{#invoke:Base36|next|{{#ask: [[Category:Lieu]] [[Location_site::{{Préfixe lieu}}]] [[Location_number::+]] |?Location_number= |sort=Location_number |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }}`
- E3, `Formulaire:Physical item`, champ `ref_number` :
  `{{#invoke:Base36|next|{{#ask: [[Category:Physical item]] [[Inventory_site::{{Préfixe site}}]] [[Inventory_number::+]] |?Inventory_number= |sort=Inventory_number |order=desc |limit=1 |mainlabel=- |format=list |link=none |headers=hide |default=0000}} }}`

Cause de l'écart, mesurée :

- `{{Préfixe site}}` rend `ECL`, pas `CWL`. `Modèle:Préfixe site` contient
  `<includeonly>ECL</includeonly>` ; sa documentation le dit « code de
  l'organisation qui exploite ce wiki », valeur par défaut du champ de site,
  et précise qu'un exemplaire détenu par un partenaire conserve le code de
  son détenteur.
- L'expression du formulaire évalue donc la banque `ECL`, dont le suivant est
  `0046`.
- Lecture seule complémentaire : les items physiques à `Inventory_site::CWL`
  sont quatre, numéros `0008`, `0009`, `000A`, `000B`. La même expression avec
  `CWL` écrit en dur à la place de `{{Préfixe site}}` rend `000C`, la valeur
  attendue par la consigne. Cette variante n'est pas l'expression du
  formulaire ; je ne l'ai pas employée.

## Pages écrites

Aucune. Session ouverte par `bin/wiki-login.sh` (`Success Cywil`), aucune
écriture ensuite.

## Mesures après

Sans objet : rien n'a été écrit.

## Vérifications 1 à 8

Sans objet : rien n'a été écrit.

## Règles locales à la fin

`.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Écarts et surprises

- **L'expression du formulaire Physical item ne suit pas la banque CWL.** Elle
  est indexée sur `{{Préfixe site}}`, donc sur le site par défaut du wiki
  (`ECL`), alors que le champ `site_code` est saisi par item. Un exemplaire
  CWL créé par le formulaire recevrait par défaut le suivant de la banque ECL.
  Les quatre exemplaires CWL existants (`0008` à `000B`) ont donc été numérotés
  autrement que par la valeur par défaut du formulaire, ou avant qu'elle ne
  prenne cette forme : non vérifié.
- Aucun autre écart. Les deux autres banques rendent exactement les valeurs
  attendues, et les sept mesures avant sont conformes.

## Questions

**A.** La consigne demandait d'évaluer pour les items physiques « l'expression
de `Formulaire:Physical item`, champ `ref_number` ». Cette expression vise la
banque du site par défaut, `ECL`, et rend `0046` ; la valeur attendue `000C`
n'est rendue que par la même expression avec `CWL` à la place de
`{{Préfixe site}}`. Quelle expression fait foi pour un exemplaire CWL ?
Suggestion : relancer la tâche en remplaçant, pour les deux items physiques,
l'expression du formulaire par la même avec `[[Inventory_site::CWL]]` écrit en
dur, évaluée avant chaque création comme prévu ; et noter dans le lot que le
défaut du formulaire ne convient qu'aux exemplaires du site par défaut.
