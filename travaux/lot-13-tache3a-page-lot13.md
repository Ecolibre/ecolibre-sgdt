# Lot 13 — Tâche 3a : la page du lot 13, seule

**Exécuté le :** 2 septembre 2026 (00h03-00h08 UTC), session Claude Code,
compte `Cywil`. Session ouverte par `bin/wiki-login.sh` avant toute écriture.
Suite de `travaux/lot-13-tache2-modele-formulaire.md`.

---

## 0. Test préalable de `bin/wiki-move.sh`

Demandé par Cyril avant toute reprise de la tâche, sur la page bac à sable
`Utilisateur:Cywil/Bac à sable/Test wiki-move` (créée pour l'occasion,
pageid 509).

| Test | Résultat |
|---|---|
| 1. Renommage vers un titre libre (`…/Test wiki-move renommé`) | `redirectcreated: true` ; ancien titre devenu redirection (nouveau pageid 510, `"redirect": true`) ; nouveau titre a **conservé le pageid 509** avec une chaîne de révisions continue (1173→1174) — l'historique a suivi. |
| 2. Renommage retour vers le titre de départ | `redirectcreated: true`, `moveoverredirect: true` (par-dessus la redirection posée au test 1) ; le titre de départ a repris le pageid 509, révisions 1173→1174→1176 continues ; le titre intermédiaire est devenu une redirection à son tour. |
| 3a. Renommage **depuis** `MediaWiki:Sidebar` | Refusé par le script lui-même (`ERREUR: refus de renommer depuis 'MediaWiki:Sidebar'…`), code de sortie 1, **avant tout appel API** — confirmé par l'absence d'effet secondaire. |
| 3b. Renommage **vers** `MediaWiki:Test wiki-move` | Refusé de la même manière (`ERREUR: refus de renommer vers…`), code de sortie 1. Vérifié après coup : `MediaWiki:Test wiki-move` reste `"missing": true` — aucune page créée. |
| 4. Renommage vers un titre déjà occupé (`Lot 12 — Contenants et étiquetage`) | L'API a refusé (`articleexists`, code de sortie 1) — pas d'écrasement. Vérifié après coup : `Lot 12 — Contenants et étiquetage` inchangée, `pageid 485`, `lastrevid 1127`, `touched` antérieur au test. |

**Les quatre tests passent.** Le script se comporte comme prévu dans les deux
sens (renommage + retour, historique suivi) et refuse correctement dans les
trois cas dangereux (source `MediaWiki:`, cible `MediaWiki:`, cible occupée),
sans jamais écraser ni laisser de trace indésirable. La page de test reste
dans le bac à sable, à son titre d'origine (pageid 509).

## 1. Étape 1 — renommage de la page réelle

Titre cible vérifié libre avant écriture
(`action=query&titles=Lot 13 — Gestion des lots en classe sémantique&prop=info`
→ `"missing": true`).

`bin/wiki-move.sh "Lot — Gestion des lots en classe sémantique" "Lot 13 —
Gestion des lots en classe sémantique" "[Lot 13][Tâche 3a] Attribution du
numéro à l'ouverture, redirection conservée"` → `redirectcreated: true`,
`moveoverredirect: false`.

Vérification `action=query&prop=info` sur les deux titres :

| Titre | pageid | état |
|---|---|---|
| `Lot 13 — Gestion des lots en classe sémantique` | 493 (conservé de l'ancien titre) | page réelle, `lastrevid 1178` |
| `Lot — Gestion des lots en classe sémantique` | 512 (nouveau) | redirection (`"redirect": true`) |

## 2. Étape 2 — contenu avant remplacement

Relu par `wiki-get.sh` juste avant l'écriture, reproduit intégralement
ci-dessous pour qu'il reste tracé :

```
'''Transformer les pages de lot, aujourd'hui statiques, en une classe interrogeable, et fusionner la feuille de route dans la page d'index.'''

''Ce lot n'a pas encore de numéro : il lui sera attribué à son ouverture.''

== État ==

À cadrer. Éléments réunis le 31 août 2026 au fil du lot 10. Le cadrage complet — périmètre, point de départ, risques — s'écrit à l'ouverture du lot, contre l'état du wiki de ce jour-là.

== Objet ==

Transformer les pages de lot, aujourd'hui statiques, en une classe interrogeable, et fusionner la feuille de route dans la page d'index.

== Ce qui est déjà tranché ==

* '''Une page par lot, plus une page d'index.''' Un index tenu à la main se périme — la liste des corrections a déjà été en retard sur le wiki.
* '''Quatre attributs suffisent : numéro, état, objet bref, et le lot dont il dépend.''' Le dernier fait de la dépendance une relation et non une phrase, donc l'index se construit tout seul.
* '''La motivation est la délégation''' : documenter et séparer les lots permet de répartir le travail au lieu qu'il repose sur une seule personne.
* '''La fusion de la feuille de route conserve la redirection depuis l'ancien titre.''' Sur ce wiki les redirections portent des données.
* '''Les rapports d'exécution restent dans <code>travaux/</code> et sont liés en permaliens sur un commit.''' Ils citent de la syntaxe SMW que le wiki lirait comme de vraies annotations, et un lien de branche pointera un jour vers un fichier modifié sans que personne le sache.

== Ce qui est écarté, et pourquoi ==

Aucun écart consigné à ce jour.

== Dépendances ==

Aucune, mais le lot gagne à attendre que deux ou trois lots aient vécu dans la forme courte, pour savoir quels attributs servent vraiment.

----

Voir aussi la [[Gestion des lots]].
```

Ce contenu est identique à celui relevé en tâche 0
(`travaux/lot-13-tache0-recon.md`), sans dérive entre les deux lectures.

## 3. Étape 3 — remplacement

`bin/wiki-put.sh` (édition standard, page existante) — `pageid 493`,
`oldrevid 1178` → `newrevid 1180`, résumé `[Lot 13][Tâche 3a] Remplacement
par la page de lot en classe sémantique`. Contenu conforme mot pour mot à
la consigne.

## 4. Étape 4 — vérification (le cœur de la tâche)

File de travaux avant vérification : `jobs: 2`
(`action=query&meta=siteinfo&siprop=statistics`) — non retenu comme un
blocage a priori, contrôle fait directement sur les faits.
`action=browsebysubject`, `ns=0`, immédiatement après l'écriture :

**1. Phrase d'objet — une seule valeur, ses trois virgules incluses.**
Confirmé : `Work_package_summary` porte **un seul `dataitem`** :
« Transformer les pages de lot, aujourd'hui statiques, en une classe
interrogeable, et fusionner la feuille de route dans la page d'index. » —
les trois virgules de la phrase sont bien à l'intérieur de cette valeur
unique, le séparateur multivalué (placé avant les propriétés `depends_on`/
`overlaps`/`revises`, jamais avant `summary`) n'a pas débordé sur elle.

**2. Le numéro, stocké comme nombre.** `Work_package_number` :
`{"type": 1, "item": "13"}` — le type `1` de l'API `browsebysubject`
correspond à un nombre (cohérent avec `_TYPE` de la propriété, vérifié en
tâche 1 comme `_num`), pas une chaîne.

**3. La date d'ouverture, forme interne.** `Work_package_opening_date` :
`{"type": 6, "item": "1/2026/9/1"}` — format interne SMW d'une date de
calendrier (`calendarmodel/année/mois/jour`), confirmant que
`2026-09-01` a bien été compris comme une date, pas comme du texte.

**4. Les propriétés laissées vides — aucune stockée.** **Écart avec la
consigne à signaler : la consigne parle de six propriétés laissées vides,
la page n'en laisse que cinq** (`Work_package_closure_date`,
`Work_package_closure_report`, `Work_package_depends_on`,
`Work_package_overlaps`, `Work_package_revises` — les quatre autres,
`number`, `status`, `summary`, `opening_date`, sont remplies). Mesuré :
aucune des cinq n'apparaît parmi les `property` du relevé
`browsebysubject` — `#set` a bien ignoré les paramètres vides plutôt que
d'enregistrer une valeur vide qui les ferait apparaître à tort dans une
requête par présence.

**5. La catégorie.** `_INST -> Lot#14##` dans `browsebysubject`, et
`action=query&list=categorymembers&cmtitle=Catégorie:Lot` retourne
**exactement un membre** : `Lot 13 — Gestion des lots en classe
sémantique` (pageid 493).

**6. Annotations parasites.** Clés retournées par `browsebysubject` :
`Work_package_number`, `Work_package_opening_date`, `Work_package_status`,
`Work_package_summary` (les quatre attendues) plus `_ASK` (trois
sous-objets de requête, un par relation inverse du modèle), `_INST`,
`_MDAT`, `_SKEY` — toutes les clés hors les quatre propriétés attendues
sont préfixées d'un souligné. **Aucune annotation parasite.**

### Rendu (`action=parse` sur la page réelle)

- Phrase d'objet en gras avant le tableau : présente, identique à
  `Work_package_summary`.
- Tableau complet : dix lignes, quatre sections, valeurs `13` / `ouvert` /
  `2026-09-01` correctement affichées, cases vides repliées en tiret
  cadratin ou message de remplacement (`Aucun rapport lié.`).
- Les trois requêtes inverses affichent chacune leur message d'absence :
  « Aucun lot ne dépend de celui-ci. », « Aucun lot ne le recoupe. »,
  « Aucun lot ne le révise. » — cohérent avec le fait qu'aucune autre page
  de lot n'existe encore.
- `categories`: `[{"category": "Lot"}]` — une seule catégorie, aucune
  catégorie de suivi de lien cassé.
- Aucun `[[`, `]]`, `{{`, `}}` littéral dans le texte rendu (14 821
  caractères) : pas de syntaxe non échappée qui fuit.

## 5. Étape 5 — contrôle de la redirection

`action=query&prop=info` sur `Lot — Gestion des lots en classe
sémantique` : existe, `"redirect": true`, non supprimée.

`list=backlinks` sur ce même titre : **une seule page pointe encore vers
l'ancien titre — `Gestion des lots`** (pageid 484). Non corrigée ici,
conformément à la consigne : cette liste sert de point de départ à la
tâche 4.

## Écarts et surprises

**Un seul écart, déjà signalé au point 4 ci-dessus :** la consigne annonce
six propriétés laissées vides, la page en a cinq — les quatre propriétés
remplies (`number`, `status`, `summary`, `opening_date`) plus les cinq
vides (`closure_date`, `closure_report`, `depends_on`, `overlaps`,
`revises`) font neuf, pas dix. Aucune conséquence sur la vérification :
les cinq réelles sont toutes correctement absentes du magasin SMW.

Aucune autre surprise : le renommage a préservé le pageid et la chaîne de
révisions comme attendu, le remplacement de contenu n'a rien laissé
échapper de littéral, la phrase d'objet à trois virgules n'a pas été
coupée par le séparateur multivalué (la précaution de l'ordonner avant les
propriétés multivaluées dans le bloc de stockage du modèle a tenu), et le
signal de file de travaux (`jobs: 2`) ne s'est pas révélé être un obstacle
— les faits étaient déjà tous présents à la première lecture.
