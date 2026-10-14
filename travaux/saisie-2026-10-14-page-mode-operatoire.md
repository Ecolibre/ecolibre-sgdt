# Saisie du 14 octobre 2026 — page de mode opératoire du remplacement de rayon

Suite de `travaux/saisie-2026-10-13-rayons-et-norme.md`. Hors lot, étiquette
de résumé `[Saisie]`. Session Claude Code hébergée (cloud), branche locale
`claude/clever-clarke-o1jkjc`, au même commit que `origin/main` (`470d20e`)
au départ.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` : sortie vide, aucun arrêt.
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.

## 2. Session

`bin/wiki-login.sh` : `Success Cywil`.

## 3. Lecture avant écriture

- `bin/wiki-get.sh "Remplacement de rayons de la roue motorisée d'Anton"` :
  lu en entier. **Révision courante : 1576** (Cywil, 2026-10-12T20:27:47Z),
  conforme au repère. Aucun arrêt.
- Titre cible « Remplacer un rayon sur une roue à moyeu moteur » : `missing`,
  donc libre. Aucune page de discussion n'existait, ni à l'ancien titre ni au
  nouveau. Aucune protection native.
- `list=backlinks` sur l'ancien titre : **aucune page n'y pointait**. Aucun
  lien ne passera donc par la redirection.
- Les 17 fichiers employés par la révision 1576 existent tous
  (`generator=images`, aucun `missing`). C'est **exactement le même jeu de 17
  fichiers** que celui du nouveau texte : la restructuration n'ajoute et ne
  retire aucune photo.
- `bin/wiki-move.sh` lu avant usage : il ne passe ni `noredirect`, ni
  `movetalk`, ni `ignorewarnings`, et ajoute `assert=user`.

## 4. Renommage

Commande, exactement celle de la consigne, sans `--noredirect` :

```
bin/wiki-move.sh "Remplacement de rayons de la roue motorisée d'Anton" "Remplacer un rayon sur une roue à moyeu moteur" "[Saisie] Renommage : la page décrit une méthode applicable à un type de roue, l'intervention sur la roue d'Anton en devient une application datée"
```

Réponse : `"redirectcreated": true`, `"moveoverredirect": false`.

- Le renommage a créé sur la page déplacée (pageid 648, historique conservé)
  la révision 1599. Son sha1 (`75da113d…`) est **identique** à celui de la
  révision 1576 : le contenu n'a pas changé entre la lecture et la
  réécriture.
- L'ancien titre devient la page 671, révision 1600, une redirection dont le
  wikitexte est
  `#REDIRECTION [[Remplacer un rayon sur une roue à moyeu moteur]]`.

## 5. Réécriture

Le fichier de contenu a été écrit avec l'outil d'écriture de fichier, en
recopiant le texte mot pour mot. Il a été envoyé par `bin/wiki-put.sh`,
résumé « [Saisie] Restructuration : plan, galeries, conditions
d'applicabilité, points de vigilance, cause probable » : `Success`,
**révision 1601** (sur 1599).

## 6. Vérifications

### Vérification décisive, sur le rendu (`action=parse&prop=text`)

| Poste | Attendu par la consigne | Mesuré | Verdict |
|---|---|---|---|
| Images distinctes affichées | 17, aucune manquante | 17 balises `img`, 17 sources distinctes, 17 `gallerybox` ; `generator=images` : 17 fichiers, 0 manquant | **conforme** |
| Galeries | 11 | **9** (`ul class="gallery…"`) | **écart**, voir ci-dessous |
| Vignettes isolées | aucune | 0 image hors des galeries ; 0 `div class="thumb t…"` | **conforme** |
| Liens rouges | un seul, « Démonter un pneu de vélo » | un seul `class="new"`, vers « Démonter un pneu de vélo » | **conforme** |
| Classe `error` | aucune | 0 | **conforme** |

**Sur l'écart des galeries — c'est la valeur attendue qui est fausse, pas la
page.** Le texte prescrit contient lui-même 9 blocs `<gallery>`, comptés sur
le fichier avant tout envoi (`grep -c "^<gallery"`). Ce sont ceux des étapes 3
à 10, plus celui de la variante écartée : les étapes 1 et 2 n'ont pas de
galerie. Le rendu reproduit fidèlement le texte. Hypothèse non vérifiée : le
nombre 11 compte une galerie par étape, soit dix, plus celle de la variante.
Conformément à la consigne, rien n'a été réparé. Il n'y a d'ailleurs rien à
réparer sans réécrire le texte prescrit.

**Piège de mesure évité.** Le rendu contient 17 `<div class="thumb">`. Ce sont
les cadres internes des vignettes de galerie, pas des vignettes isolées. Dans
cette version de MediaWiki, une vignette isolée porte `class="thumb tnone"`,
`thumb tright` ou une variante voisine. Un comptage par mot-clé aurait conclu
à tort à 17 vignettes isolées. La mesure retenue compte les images hors des
blocs de galerie : il y en a 0.

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| Redirection depuis l'ancien titre | `redirects=1` résout l'ancien titre vers « Remplacer un rayon sur une roue à moyeu moteur » ; wikitexte `#REDIRECTION […]` — **conforme** |
| Sommaire | affiché (`mw-toc-heading` présent) — **conforme** |
| Titres de niveau 2 | attendu 7, **mesuré 6** — **écart**, voir ci-dessous |
| Titres de niveau 3 | attendu 10, **mesuré 12** — **écart**, voir ci-dessous |
| `lastrevid` de « Roue motorisée d'Anton » et « Jante 20" moteur Anton » | 1573 et 1574, **inchangés** — **conforme** |
| Catégories de la page | aucune, catégories cachées comprises (`prop=categories`) — **conforme** |
| Faits SMW de la page | `_MDAT` et `_SKEY` seulement, aucune annotation parasite |
| Liens de la page | 11 liens internes, dont 10 existants. Le seul lien rouge est « Démonter un pneu de vélo » |

**Sur les titres, même cause que pour les galeries.** Le texte prescrit compte
6 titres de niveau 2 : « Ce qu'il faut sous la main », « Mode opératoire »,
« Variante écartée… », « Points de vigilance », « Cause probable… » et
« Application ». Il compte 12 titres de niveau 3 : « Pièces », « Outils » et
les dix étapes. Ces nombres ont été comptés sur le fichier avant l'envoi, puis
retrouvés dans `prop=sections` après. Hypothèses non vérifiées : le 10 compte
les seules étapes numérotées ; le 7 compte peut-être le titre « Sommaire »,
qui est lui aussi un `h2` dans le HTML rendu.

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- **Trois valeurs attendues de la consigne ne correspondent pas à son propre
  texte** : 9 galeries au lieu de 11, 6 titres de niveau 2 au lieu de 7, 12
  titres de niveau 3 au lieu de 10. Je l'ai vu avant d'écrire, en comptant
  sur le fichier. J'ai écrit quand même, pour trois raisons : la consigne ne
  faisait de ces comptes aucune condition d'arrêt avant écriture ; le jeu de
  17 photos était identique à celui de la révision 1576, donc aucune photo
  ne manquait ; et l'écriture s'annule par l'historique. La page rendue est
  conforme au texte prescrit.
- **Légendes et photos.** J'ai regardé les 17 photos en miniature (360 px,
  récupérées en lecture par `curl` dans le scratchpad, hors du dépôt).
  Aucune légende n'est franchement fausse ; je n'en ai corrigé aucune.
  Réserves :
  - « Serrage écrou G12.jpg », légende « Serrage de l'écrou » : la clé ronde
    multi-tailles entoure le rayon à mi-longueur et ne semble pas engagée sur
    l'écrou, au moins à cette résolution. La photo montre l'outil plus que le
    serrage. Le même fichier illustre aussi la page « Outil de serrage
    d'écrou de rayon de vélo ».
  - « Rayon G12 déformé de face.jpg » et « … de côté.jpg », légendes « Rayon
    déformé, de face / de côté » : la clé est encore engagée sur le rayon.
    La légende reste juste, mais elle ne le dit pas.
  - « Réduction longueur rayon 74mm.jpg », légende « Réduction de la longueur
    du rayon de 74 mm » : une lecture rapide peut comprendre une réduction de
    74 mm. La photo montre deux rayons côte à côte, dont l'un est raccourci à
    son extrémité filetée.
- **Outils visibles sur les photos, pour une tâche suivante.** L'« outil
  solide » des étapes 3 et 7 est, sur les photos, une clé plate à œil
  (clé mixte). L'outil de serrage photographié est une clé ronde
  multi-tailles graduée par numéros, du type que la page de norme signale
  comme source de confusion.
- Les liens rouges de la révision 1576, « Clé allen » et « Vers page item réf
  correspondant », ont disparu avec la réécriture, comme prévu. Seul reste
  « Démonter un pneu de vélo », volontairement.
- La révision 1598, intercalée entre la tâche précédente (1597) et ce
  renommage (1599), est d'une autre session : « Lot 21 — Grandeurs et
  unités », résumé « [Lot 21][Tâche 22] … ». Elle est sans rapport avec cette
  tâche.
- `bin/wiki-move.sh` n'est pas cité dans la liste « Outils disponibles » de
  `CLAUDE.md`. Il est pourtant autorisé dans `.claude/settings.json` et
  documenté dans `installation-nouveau-poste.md`, depuis le 2 septembre 2026
  (lot 13, tâche 3a).
