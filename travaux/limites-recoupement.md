# Limites connues du SGDT — recoupement contre les mesures du lot 11

2026-08-28. Quatre entrées de *Limites connues du Système de Gestion de
Données Techniques* démenties ou dépassées par des mesures du lot 11
lui-même, jamais reportées sur la page. Corrigées ici, une édition par
entrée. Aucune correction du fond des observations SMW n'était en jeu —
seulement leur consignation, restée en retard sur ce qui avait déjà été
mesuré et écrit ailleurs dans `travaux/`.

Titre exact de la page (à ne pas confondre avec le sigle) : **Limites
connues du Système de Gestion de Données Techniques**, `pageid` 144.

## Session

- `bin/wiki-login.sh` relancé en début de session (session précédente
  potentiellement expirée).
- Lecture avant chaque écriture (`bin/wiki-get.sh`), diff calculé sur une
  copie de travail, écriture (`bin/wiki-put.sh`), relecture immédiate après
  chaque écriture — quatre cycles indépendants, jamais une édition groupée.
- Révisions : 1083 (état de départ) → 1084 (n° 16) → 1085 (n° 24) → 1086
  (n° 25) → 1087 (n° 14, état final).

## Entrée n° 16 — `action=purge` : correction partielle

**Avant :**
> `action=purge` exige une requête POST avec jeton CSRF sur ce wiki ; un
> appel en GET échoue avec `mustbeposted`. À prévoir pour tout outil de
> purge futur.

**Vérifié avant d'écrire** : `bin/wiki-api.sh "action=paraminfo&modules=purge&format=json"`
— le module `purge` ne déclare `writerights: true` et `mustbeposted: true`,
mais **aucun `tokentype`** dans sa liste de paramètres. `needstoken` est
donc bien absent pour ce module, confirmant l'affirmation de Cyril. Le POST
reste exigé (`mustbeposted: true`), c'est la seule partie vraie de l'entrée
d'origine.

Relu aussi `bin/wiki-purge.sh` : le script interroge `meta=tokens` avant
l'appel, mais son propre commentaire (lignes 41-42) dit déjà que ce bloc
« ne sert plus qu'à détecter une session expirée », pas à signer la purge —
cohérent avec l'absence de jeton exigé par l'API.

**Après :**
> `action=purge` exige une requête POST sur ce wiki, mais pas de jeton
> CSRF. Un appel en GET échoue avec `mustbeposted` — ce point reste vrai.
> Cette entrée affirmait à tort un jeton requis : `action=paraminfo&modules=purge`
> ne déclare aucun `tokentype` pour ce module (`needstoken` absent), vérifié
> le 28 août 2026. `bin/wiki-purge.sh` interroge quand même `meta=tokens`
> avant d'appeler `action=purge`, mais pas pour signer la requête —
> seulement pour détecter une session expirée (jeton anonyme `+\`) avant de
> la tenter. À prévoir pour tout outil de purge futur : POST obligatoire,
> pas de jeton.

Résumé d'édition : `[Correctif] Limites connues n° 16 — action=purge n'exige pas de jeton CSRF, seul le POST reste vrai`

## Entrée n° 24 — galerie groupée par lieu : structure disparue

**Avant :**
> Conséquence acceptée sur [[Avancement du jardin-forêt]] : faute de
> négation, le bloc replié « Autres photos » de chaque lieu contient aussi
> la photo principale du lieu. [...] Défaut assumé et expliqué sur la page
> elle-même, plutôt qu'une mécanique fragile.

**Vérifié avant d'écrire** : lecture complète de `Avancement du
jardin-forêt` (`bin/wiki-get.sh`). Aucune occurrence de « Autres photos »,
aucun bloc replié, aucun regroupement par lieu. La section `== Photos ==`
contient une galerie unique :
```
{{#ask: [[Category:Photo de plantation]]
|format=gallery
|sort=Image_date
|order=desc
|limit=24
}}
```
précédée d'un commentaire wikitexte daté du 27-28 août 2026 expliquant que
la galerie est désormais « volontairement non filtrée par lieu ». Cohérent
avec `travaux/avancement-execution.md` / `travaux/avancement-proposition.md`
(réécriture en variante B, 25 août 2026). La structure que décrivait
l'entrée n° 24 n'existe donc plus.

**Après :**
> Contournement abandonné sur [[Avancement du jardin-forêt]] : la galerie
> n'est plus groupée par lieu. Cette entrée décrivait un bloc replié
> « Autres photos » par lieu, censé exclure la photo principale de chaque
> lieu — faute de négation exprimable en SMW (voir l'entrée précédente), il
> ne pouvait pas le faire proprement. Trois contournements avaient été
> testés le 16 août 2026 et écartés : `limit`/`offset` entre deux requêtes
> (tri à égalité — 38 des 45 photos du Buisson portent la même
> `Image_date`) ; `[[Main_image::!+]]` (compilé en `[[Main_image::+]]`,
> voir ci-dessus) ; `format=template` comparant le nom de fichier à
> `Main_image` (20 photos sur 65 ont un `Depicts_specimen` multivalué, sans
> terme unique à comparer). La page a été réécrite le 25 août 2026 (variante
> B) : une galerie unique et sans condition de lieu, interrogeant
> `Category:Photo de plantation` — plus de bloc par lieu, donc plus de
> doublon photo principale / « autres photos » à exclure. La cause reste
> celle documentée ci-dessus : SMW n'exprime ni la négation ni l'absence
> d'une propriété.

Le lien `[[Avancement du jardin-forêt]]` déjà présent est conservé sans
modification de forme (une seule ligne, non replié).

Résumé d'édition : `[Correctif] Limites connues n° 24 — galerie groupée par lieu abandonnée, structure obsolète`

## Entrée n° 25 — verrou du lot 7 : cinq pages sur six corrigées

**Avant :**
> [...] Non corrigé à cette date : les six pages restent sous
> `smw-change-propagation-protection` (voir `demandes-adminsys.md`).

**Vérifié avant d'écrire** : `travaux/lot-11-verrou-mesure-v2.md`, qui
consigne la mesure du 25 août 2026 — nom exact des cinq propriétés du lot 7
corrigées ce jour-là : `Edible_parts`, `Plant_habit`, `Propagation_method`,
`Root_system`, `Seed_treatment`. Toutes des pages du 15 août 2026,
**éditées** (pas créées) le 25 août, `Property_range` corrigé du premier
coup, sans aucun refus. Seule `Attribut:INSEE code`, créée le 21 août 2026
(lot 11, tâche 1), reste bloquée — cinq refus `smw-change-propagation-protection`
sur quatre jours, jamais débloquée depuis.

**Après :**
> [...] Liste à jour, tous espaces de noms confondus : [[Erreurs de
> traitement SMW]]. Corrigé le 25 août 2026 sur cinq des six pages, du
> premier coup, sans verrou : `Edible_parts`, `Plant_habit`,
> `Propagation_method`, `Root_system`, `Seed_treatment`. Seule `Attribut:INSEE
> code` reste bloquée, sous `smw-change-propagation-protection` depuis sa
> création le 21 août 2026 (voir `demandes-adminsys.md`) — c'est ce refus
> isolé qui a fait tomber l'hypothèse d'un verrou général sur les six
> pages.

Résumé d'édition : `[Correctif] Limites connues n° 25 — cinq des six pages corrigées le 25 août, sans verrou`

## Entrée n° 14 — complétée par un renvoi, pas réécrite

Cyril a demandé de ne pas réécrire cette entrée (déjà prudemment formulée)
mais d'y ajouter la mesure plus fine du lot 11, avec renvoi à l'entrée
n° 33.

**Vérifié avant d'écrire** : l'entrée n° 33 existe (« Blanchir une page de
propriété avant de la supprimer la verrouille »). Même mécanisme —
`smw-change-propagation-protection` sur une page `Attribut:` — mais un
déclencheur différent : elle établit que le blanchiment (retrait de `Has
type`) déclenche le verrou alors qu'une suppression directe ne le fait pas,
un exemple de plus que le verrou dépend de l'action précise, pas d'un état
global de la page. Sujet cohérent avec le renvoi demandé.

**Phrase ajoutée en fin d'entrée n° 14** (le reste de l'entrée n'a pas
changé) :
> Mesure plus fine, lot 11, 25 août 2026 : éditer une page de propriété
> existante ne rencontre jamais ce verrou — six cas, zéro refus. Seule une
> page bloquée depuis sa création le reste. Voir l'entrée n° 33 pour une
> autre nuance sur ce qui déclenche le verrou.

Résumé d'édition : `[Correctif] Limites connues n° 14 — renvoi à la mesure plus fine du 25 août (n° 33)`

## Vérifications finales

- **Compte d'entrées** : `grep -c "^# "` sur le wikitexte final rend `34`.
  Quatre remplacements, aucun ajout ni suppression d'entrée — conforme.
- **`browsebysubject` sur la page** (`bin/wiki-api.sh --facts`, sujet
  encodé en `%20`) : seuls `_MDAT` et `_SKEY` sont portés. Aucune
  annotation SMW parasite introduite par le nouveau texte — le piège
  documenté dans CLAUDE.md (exemple de syntaxe SMW ou lien mal protégé
  exécuté comme une vraie annotation) ne s'est pas reproduit ici ; aucune
  des quatre nouvelles formulations ne contient de `[[Propriété::valeur]]`
  ni de fonction d'analyseur en clair.
- **Aucun lien rouge** : comparaison de l'ensemble des `[[ ]]` avant/après
  sur la page entière — identique, aucun lien nouveau introduit. Le renvoi
  à l'entrée n° 14 vers n° 33 est un texte simple (« l'entrée n° 33 »), pas
  un lien wiki, donc rien à vérifier côté `pagelinks`. Le seul lien wiki
  touché par une réécriture, `[[Avancement du jardin-forêt]]` dans
  l'entrée n° 24, cible une page existante (`pageid` 396, confirmé par
  `action=query`).

## Proposition de règle CLAUDE.md — non appliquée

Cyril propose la règle suivante, à ajouter dans la section « Leçons de
méthode (wiki et outillage) » de CLAUDE.md. **Proposition, non écrite** :
aucune modification de CLAUDE.md n'a été faite dans cette session.

> **Une mesure qui contredit une page du wiki n'est pas terminée tant que
> cette page n'est pas corrigée.** Le 28 août 2026, trois entrées de
> Limites connues (n° 16, 24, 25) se sont révélées démenties par des
> mesures du lot 11 lui-même, notées ailleurs et jamais reportées. Après
> toute mesure qui infirme quelque chose, chercher où cette chose est
> écrite avant de passer à la suite.

À valider par Cyril avant écriture dans CLAUDE.md.
