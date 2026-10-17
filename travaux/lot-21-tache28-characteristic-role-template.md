# Lot 21, tâche 28 — modèle, catégorie et première page de rôle de caractéristique

Date : 14 octobre 2026. Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

Trois écritures sur le wiki, trois créations par `bin/wiki-put.sh … --createonly`, dans l'ordre de la consigne :

| Page | Résumé de modification | pageid | newrevid | Horodatage |
|---|---|---|---|---|
| `Modèle:Characteristic role` | `[Lot 21][Tâche 28] Création du modèle des pages de rôle de caractéristique` | 678 | 1611 | 2026-10-14T20:44:28Z |
| `Catégorie:Rôle de caractéristique` (demandée sous `Category:`) | `[Lot 21][Tâche 28] Création de la catégorie des rôles de caractéristique` | 679 | 1612 | 2026-10-14T20:44:33Z |
| `Rôle nominal` | `[Lot 21][Tâche 28] Création de la page de rôle Rôle nominal, première page du modèle Characteristic role` | 680 | 1613 | 2026-10-14T20:44:39Z |

Les trois appels ont rendu `"new": true` et `"result": "Success"`, code de sortie 0.

Contenu : exactement celui de la consigne pour chacune, sauts de ligne compris (14, 7 et 11 lignes ; 45 accolades ouvrantes et 45 fermantes dans le modèle, contrôlées avant envoi). Relu par `bin/wiki-get.sh` et comparé par `diff` au fichier envoyé : pour chaque page, seule différence, l'absence de saut de ligne final, que MediaWiki retire de tout wikitexte enregistré.

Aucune autre page écrite : aucune autre page de rôle, aucune des cinq propriétés du jour, ni `Attribut:Nominal diameter`, `Attribut:Secondary diameter`, `Attribut:Power rating`, `Attribut:Max thickness`, ni les bacs à sable `Test lot21b`, `Test lot21c`, `Test lot21d` et leurs modèles et propriétés d'essai.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas non plus.

**Étape 3 — absence des trois pages.** Les trois `"missing": true` : `Rôle nominal` (ns 0), `Catégorie:Rôle de caractéristique` (ns 14), `Modèle:Characteristic role` (ns 10). L'API a normalisé `Category:Rôle de caractéristique` en `Catégorie:Rôle de caractéristique`.

**Étapes 4, 5 et 6 — écritures.** Voir ci-dessus. `bin/wiki-login.sh` lancé avant : `Success Cywil`.

**Étape 7 — la vérification qui tranche.**

*Attente de `_CHGPRO`.* La clé `_CHGPRO` ne figurait pas dans les faits de `Rôle nominal` dès la première lecture, à 20:44:44 UTC, cinq secondes après l'écriture : la condition d'attente était remplie d'emblée. **Délai réel de disparition : sans objet, la clé n'est jamais apparue sur cette page** (elle accompagne les écritures de pages de propriété). Une relecture de confirmation, deux minutes plus tard (20:47:26 UTC), a rendu des faits identiques.

*Faits de `Rôle nominal`, sans filtre, tels quels* (20:44:44 UTC, identiques à 20:47:26 UTC) :

```
Preferred_label -> ['Rôle_nominal#0##_MLaac91c2a5a89c1bf065b594818db74be', 'Rôle_nominal#0##_ML0f972cdab45fe6a9f2b5cd05987b2f98']
_INST -> ['Rôle_de_caractéristique#14##']
_MDAT -> ['1/2026/10/14/20/44/39/0']
_SKEY -> ['Rôle nominal']
```

`Preferred_label` porte deux valeurs, qui sont deux conteneurs Monolingual text distincts. `bin/wiki-api.sh --facts` n'affiche que le bloc `query.data`, pas le contenu des sous-objets : les codes de langue ont donc été lus dans les faits de chaque conteneur, par le paramètre `subobject=` que le script prévoit. Tels quels (20:44:54 UTC, identiques à 20:47:26 UTC) :

`subobject=_MLaac91c2a5a89c1bf065b594818db74be`
```
_LCODE -> ['fr']
_SKEY -> ['Rôle nominal#nominal;fr']
_TEXT -> ['nominal']
```

`subobject=_ML0f972cdab45fe6a9f2b5cd05987b2f98`
```
_LCODE -> ['en']
_SKEY -> ['Rôle nominal#nominal;en']
_TEXT -> ['nominal']
```

Les trois conditions de la consigne :
- `Preferred label` porte **deux valeurs**, `nominal` avec le code `fr` et `nominal` avec le code `en` : **oui** ;
- appartenance à la catégorie `Rôle de caractéristique` (`_INST -> Rôle_de_caractéristique#14##`) : **oui** ;
- aucune autre propriété non préfixée d'un souligné : **oui**, `Preferred_label` est la seule. Pas de `_ERRC`.

**Conclusion.** Les deux appels distincts à `#set` sur la même page stockent bien les deux libellés, un par langue, même quand le texte est identique dans les deux langues. Le point que la tâche devait mesurer est établi : **rien dans le stockage ne s'oppose à l'écriture des six autres pages de rôle.** Rien n'a été corrigé ni réécrit.

**Étape 8 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Contrôles supplémentaires, en lecture seule

Faits au titre de CLAUDE.md (contrôles après écriture sur une page de documentation : faits, catégories, liens), en plus de la consigne :

- **Faits de `Catégorie:Rôle de caractéristique`** : `_MDAT -> ['1/2026/10/14/20/44/33/0']` et `_SKEY -> ['Rôle de caractéristique']` seulement. Aucune annotation parasite.
- **Faits de `Modèle:Characteristic role`** : aucun fait SMW (« ne porte aucun fait SMW »). Même réponse pour `Modèle:Physical item`, modèle en service : l'espace `Modèle` n'est pas sémantique sur ce wiki. Le contrôle par les faits ne s'applique donc pas à un modèle ; ceux par les catégories et les liens, si.
- **Catégories et liens** (`prop=categories|links`) :
  - `Modèle:Characteristic role` : aucune catégorie ; un lien, vers `Attribut:Preferred label`, qui existe.
  - `Catégorie:Rôle de caractéristique` : aucune catégorie ; deux liens, vers `Modèle:Characteristic role` et `Attribut:Characteristic role`, qui existent.
  - `Rôle nominal` : une seule catégorie, `Catégorie:Rôle de caractéristique`, aucune catégorie de suivi ; aucun lien.
- **Rendu de `Rôle nominal`** (`action=parse`, texte débarrassé de ses balises) : la définition en tête, puis le tableau « Rôle de caractéristique » avec « Libellé français : nominal » et « Libellé anglais : nominal », puis la section « Ce que ce rôle recouvre ». Aucune balise d'erreur, aucun avertissement SMW.

## Questions posées hors consigne

Aucune question reçue. Une question posée à Cyril dans le terminal, point A ci-dessous.

**A.** Contexte : `bin/wiki-api.sh --facts` n'affiche pas le contenu des sous-objets ; pour un Monolingual text, il montre deux identifiants `_ML…` sans aucun code de langue. La vérification des six pages de rôle suivantes devra donc lire chaque conteneur par `subobject=`, comme ici. Question : faut-il inscrire cette lecture dans la consigne des six pages, ou faire afficher le bloc `sobj` par `--facts` ? Suggestion : l'inscrire dans la consigne pour cette tâche-là, et noter la seconde voie comme dette d'outillage, à décider à part, puisqu'elle modifie un script de `bin/`.

## Écarts et surprises

1. **`_CHGPRO` n'apparaît pas sur une page de contenu.** La consigne demandait d'attendre sa disparition des faits de `Rôle nominal` ; elle n'y a jamais figuré. J'ai lu la condition comme remplie à la première lecture et ajouté une relecture de confirmation à deux minutes, qui n'a rien changé.
2. **Les codes de langue ne se lisent pas dans les faits de la page**, mais dans ceux des sous-objets `_ML…` (voir A). Une lecture qui s'arrêterait à `--facts` sur la page verrait deux valeurs sans pouvoir dire leurs langues.
3. **Deux libellés au texte identique restent distincts.** « nominal » en français et « nominal » en anglais ont donné deux conteneurs aux identifiants différents, et leur `_SKEY` porte le texte suivi du code de langue (`nominal;fr`, `nominal;en`). Mesuré sur ce seul cas ; le cas de deux valeurs de même texte et de même langue n'a pas été essayé.
4. **L'espace `Modèle` n'est pas sémantique** (constaté sur deux modèles). Sans conséquence ici, puisque le `#set` et la catégorie du modèle sont dans `<includeonly>`.
5. `origin/main` n'avait pas bougé depuis la tâche 27 (`43d3ccb`) : aucune avance rapide nécessaire avant le commit.
