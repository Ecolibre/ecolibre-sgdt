# Lot 21, tâche 29 — les six pages de rôle de caractéristique restantes

Date : 14 octobre 2026 (horloge UTC du conteneur, 20:54 à 20:58). Exécuteur : Claude Code (session cloud, branche locale `claude/fervent-carson-98rx72`).

## Ce qui a été écrit

Six écritures sur le wiki, six créations par `bin/wiki-put.sh … --createonly`, une page à la fois, dans l'ordre de la consigne :

| Page | Résumé de modification | pageid | newrevid | Horodatage |
|---|---|---|---|---|
| `Rôle extérieur` | `[Lot 21][Tâche 29] Création de la page de rôle Rôle extérieur` | 681 | 1614 | 2026-10-14T20:54:43Z |
| `Rôle intérieur` | `[Lot 21][Tâche 29] Création de la page de rôle Rôle intérieur` | 682 | 1615 | 2026-10-14T20:54:48Z |
| `Rôle hors tout` | `[Lot 21][Tâche 29] Création de la page de rôle Rôle hors tout` | 683 | 1616 | 2026-10-14T20:54:52Z |
| `Rôle utile` | `[Lot 21][Tâche 29] Création de la page de rôle Rôle utile` | 684 | 1617 | 2026-10-14T20:54:57Z |
| `Rôle maximal admissible` | `[Lot 21][Tâche 29] Création de la page de rôle Rôle maximal admissible` | 685 | 1618 | 2026-10-14T20:55:01Z |
| `Rôle minimal admissible` | `[Lot 21][Tâche 29] Création de la page de rôle Rôle minimal admissible` | 686 | 1619 | 2026-10-14T20:55:06Z |

Les six appels ont rendu `"new": true` et `"result": "Success"`, code de sortie 0.

Contenu : exactement celui de chaque bloc de la consigne (9, 9, 9, 9, 15 et 13 lignes, contrôlées avant envoi). Relu par `bin/wiki-get.sh` et comparé par `diff` au fichier envoyé : pour chaque page, la seule différence porte sur la dernière ligne (`9c9`, `15c15`, `13c13`), par l'absence de saut de ligne final, que MediaWiki retire de tout wikitexte enregistré.

Aucune autre page écrite : ni `Rôle nominal`, ni `Modèle:Characteristic role`, ni `Catégorie:Rôle de caractéristique`, ni les cinq propriétés du lot, ni `Attribut:Nominal diameter`, `Attribut:Secondary diameter`, `Attribut:Power rating`, `Attribut:Max thickness`, ni les bacs à sable `Test lot21b`, `Test lot21c`, `Test lot21d` et leurs modèles et propriétés d'essai.

## Résultat de chaque étape

**Étape 1 — état du dépôt.** `git status --porcelain` : sortie vide.

**Étape 2 — relevé initial.** `.claude/settings.local.json` n'existe pas (`cat` : « No such file or directory »). Aucune règle. Le fichier de rapport n'existait pas non plus.

**Étape 3 — absence des six pages.** Les six `"missing": true`, ns 0.

**Étape 4 — écritures.** Voir ci-dessus. `bin/wiki-login.sh` lancé avant : `Success Cywil`.

**Étape 5 — vérification par les valeurs.** Requête lancée à 20:57:27 UTC, 2 min 21 s après la dernière écriture, exactement celle de la consigne. Elle a rendu **sept pages** dès la première lecture (`"count":7`) ; aucune relecture n'a été nécessaire. Typeid de la colonne : `Preferred label` → `_mlt_rec`.

Liste des sept pages et de leurs libellés, dans l'ordre rendu :

| Page | Libellé `fr` | Libellé `en` | Conforme au bloc |
|---|---|---|---|
| `Rôle extérieur` | extérieur | outer | oui |
| `Rôle hors tout` | hors tout | overall | oui |
| `Rôle intérieur` | intérieur | inner | oui |
| `Rôle maximal admissible` | maximal admissible | maximum allowable | oui |
| `Rôle minimal admissible` | minimal admissible | minimum allowable | oui |
| `Rôle nominal` | nominal | nominal | oui (tâche 28) |
| `Rôle utile` | utile | usable | oui |

Chaque page porte exactement deux valeurs de `Preferred label`, l'une au code `fr`, l'autre au code `en`. Sortie brute, telle quelle :

```
{"query":{"printrequests":[{"label":"","key":"","redi":"","typeid":"_wpg","mode":2,"format":false},{"label":"Preferred label","key":"Preferred_label","redi":"","typeid":"_mlt_rec","mode":1,"format":""}],"results":{"Rôle extérieur":{"printouts":{"Preferred label":[{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["extérieur"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["fr"]}},{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["outer"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["en"]}}]},"fulltext":"Rôle extérieur","fullurl":"https://wiki.ecolibre.org/wiki/R%C3%B4le_ext%C3%A9rieur","namespace":0,"exists":"1","displaytitle":""},"Rôle hors tout":{"printouts":{"Preferred label":[{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["hors tout"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["fr"]}},{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["overall"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["en"]}}]},"fulltext":"Rôle hors tout","fullurl":"https://wiki.ecolibre.org/wiki/R%C3%B4le_hors_tout","namespace":0,"exists":"1","displaytitle":""},"Rôle intérieur":{"printouts":{"Preferred label":[{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["intérieur"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["fr"]}},{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["inner"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["en"]}}]},"fulltext":"Rôle intérieur","fullurl":"https://wiki.ecolibre.org/wiki/R%C3%B4le_int%C3%A9rieur","namespace":0,"exists":"1","displaytitle":""},"Rôle maximal admissible":{"printouts":{"Preferred label":[{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["maximal admissible"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["fr"]}},{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["maximum allowable"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["en"]}}]},"fulltext":"Rôle maximal admissible","fullurl":"https://wiki.ecolibre.org/wiki/R%C3%B4le_maximal_admissible","namespace":0,"exists":"1","displaytitle":""},"Rôle minimal admissible":{"printouts":{"Preferred label":[{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["minimal admissible"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["fr"]}},{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["minimum allowable"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["en"]}}]},"fulltext":"Rôle minimal admissible","fullurl":"https://wiki.ecolibre.org/wiki/R%C3%B4le_minimal_admissible","namespace":0,"exists":"1","displaytitle":""},"Rôle nominal":{"printouts":{"Preferred label":[{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["nominal"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["fr"]}},{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["nominal"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["en"]}}]},"fulltext":"Rôle nominal","fullurl":"https://wiki.ecolibre.org/wiki/R%C3%B4le_nominal","namespace":0,"exists":"1","displaytitle":""},"Rôle utile":{"printouts":{"Preferred label":[{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["utile"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["fr"]}},{"Text":{"label":"Text","key":"_TEXT","typeid":"_txt","item":["usable"]},"Language code":{"label":"Language code","key":"_LCODE","typeid":"__lcode","item":["en"]}}]},"fulltext":"Rôle utile","fullurl":"https://wiki.ecolibre.org/wiki/R%C3%B4le_utile","namespace":0,"exists":"1","displaytitle":""}},"serializer":"SMW\\Serializers\\QueryResultSerializer","version":2,"meta":{"hash":"525224c99fb011cdb4b499738ba48eca","count":7,"offset":0,"source":"","time":"0.037794"}}}
```

**Étape 6 — vérification par la structure.** Lancée à 20:57:39 UTC, par `action=smwbrowse&browse=subject` au lieu de `action=browsebysubject` (voir Écarts, point 1) ; même hôte, même sujet `Rôle_maximal_admissible`, même `format=json&formatversion=2`. Sortie telle quelle :

```
{"query":{"subject":"Rôle_maximal_admissible#0##","data":[{"property":"Preferred_label","dataitem":[{"type":9,"item":"Rôle_maximal_admissible#0##_MLcd0ba09bd74cf26f8bb5ef058c6c67ef"},{"type":9,"item":"Rôle_maximal_admissible#0##_ML537bbba1743e4bca65e01484d3117f78"}]},{"property":"_INST","dataitem":[{"type":9,"item":"Rôle_de_caractéristique#14##"}]},{"property":"_MDAT","dataitem":[{"type":6,"item":"1/2026/10/14/20/55/1/0"}]},{"property":"_SKEY","dataitem":[{"type":2,"item":"Rôle maximal admissible"}]}],"sobj":[{"subject":"Rôle_maximal_admissible#0##_MLcd0ba09bd74cf26f8bb5ef058c6c67ef","data":[{"property":"_LCODE","dataitem":[{"type":2,"item":"fr"}]},{"property":"_SKEY","dataitem":[{"type":2,"item":"Rôle maximal admissible#maximal admissible;fr"}]},{"property":"_TEXT","dataitem":[{"type":2,"item":"maximal admissible"}]}]},{"subject":"Rôle_maximal_admissible#0##_ML537bbba1743e4bca65e01484d3117f78","data":[{"property":"_LCODE","dataitem":[{"type":2,"item":"en"}]},{"property":"_SKEY","dataitem":[{"type":2,"item":"Rôle maximal admissible#maximum allowable;en"}]},{"property":"_TEXT","dataitem":[{"type":2,"item":"maximum allowable"}]}]}],"serializer":"SMW\\Serializers\\SemanticDataSerializer","version":2},"meta":{"type":"subject"}}
```

Lecture : `Preferred_label` porte **deux sous-objets** ; `_INST` vise `Rôle_de_caractéristique#14##` ; les autres propriétés sont `_MDAT` et `_SKEY` ; **aucune propriété non préfixée d'un souligné hormis `Preferred_label`**, donc aucune annotation parasite. Les deux sous-objets portent `maximal admissible` au code `fr` et `maximum allowable` au code `en`.

**Concordance des deux lectures.** Pour `Rôle maximal admissible`, l'étape 5 rend `maximal admissible`/`fr` et `maximum allowable`/`en` ; l'étape 6 rend les mêmes textes aux mêmes codes, dans deux sous-objets distincts, et la catégorie. Les deux lectures concordent.

**Conclusion.** Les sept rôles de caractéristique arrêtés par le lot existent, sont rangés dans `Catégorie:Rôle de caractéristique` par le modèle, et portent chacun leurs deux libellés, `fr` et `en`, conformes aux blocs de la consigne. Rien n'a été corrigé ni réécrit.

**Étape 7 — relevé final.** `.claude/settings.local.json` n'existe toujours pas. Aucune règle. Le dossier `.claude/` ne contient que `settings.json` et `commands/`.

## Contrôles supplémentaires, en lecture seule

Au titre de CLAUDE.md (catégories et liens après écriture), `prop=categories|links` sur les six pages :

- chacune porte une seule catégorie, `Catégorie:Rôle de caractéristique`, et aucune catégorie de suivi ;
- cinq pages n'ont aucun lien ; `Rôle minimal admissible` en a un, vers `Rôle maximal admissible`, page existante, écrite quatre secondes avant elle.

## Questions posées hors consigne

Aucune.

## Écarts et surprises

1. **`browsebysubject` remplacé par `smwbrowse` à l'étape 6.** CLAUDE.md, section « Outils disponibles » : ce module est déprécié depuis Semantic MediaWiki 3.0.0, supprimé en 7.0.0, et « ne doit plus être employé », même s'il fonctionne encore ici en 4.2.0. CLAUDE.md faisant foi sur la consigne, j'ai lancé la même requête directe avec `action=smwbrowse&browse=subject&params={"subject":"Rôle_maximal_admissible","ns":0}`. Le bloc `query` est celui que rendait `browsebysubject` ; `smwbrowse` ajoute seulement le bloc `meta` (`{"type":"subject"}`). L'appel déprécié n'a pas été émis.
2. **Correction de ma remarque de la tâche 28.** J'y avais écrit qu'il fallait descendre sous-objet par sous-objet pour lire les codes de langue. C'est vrai seulement de `bin/wiki-api.sh --facts`, qui n'imprime que `query.data`. La sortie brute de `smwbrowse` porte le bloc `sobj`, avec `_LCODE` et `_TEXT`, dans le même appel, et `action=ask` rend texte et code directement, comme la consigne l'indiquait.
3. **« Les cinq propriétés créées hier ».** Par l'horloge UTC du conteneur, elles ont été créées le 14 octobre 2026, entre 16:57 et 20:34, le jour même de cette tâche (20:54 à 20:58). Sans conséquence sur ce qui a été fait.
4. **Typeid du code de langue.** Dans la sortie d'`action=ask`, le champ `Language code` a pour typeid `__lcode` (deux soulignés), le champ `Text` a `_txt`. Simple constat, à garder en tête si une vérification future compare des typeid de champs de Monolingual text.
5. `origin/main` n'avait pas bougé depuis la tâche 28 (`6a73db4`) : aucune avance rapide nécessaire avant le commit.
