# Lot 8 — Tâche 0 : rapport de vérifications préalables

**Exécuté le 11 août 2026.** Aucune écriture wiki. Prérequis lus intégralement :
`lot-8-cadrage-facettes.md`, `CLAUDE.md`, `sgdt-passation-2026-08-10.md`.

**Verdict global : le lot s'arrête à la Tâche 0.** Le point 2 (mécanisme de
masquage d'un bloc `for template` par `show on select`, sans appel de modèle
vide écrit) n'est pas documenté. C'est exactement le cas de sortie prévu par
le cadrage lui-même (§4, Tâche 0) : arbitrage à rouvrir avant toute écriture.

---

## 1. Versions (Spécial:Version / siteinfo)

Lu via `action=query&meta=siteinfo` (lecture publique, hors périmètre de
`bin/wiki-get.sh` qui ne gère que `parse`/`categorymembers`/`protection`,
donc requête directe en `curl -G`, sans identifiant).

| Composant | Version |
|---|---|
| MediaWiki | 1.39.11 (PHP 7.4.33 fpm-fcgi) |
| Semantic MediaWiki | 4.2.0 |
| Semantic Result Formats | 4.2.1 |
| Page Forms | **5.8.1** |
| Scribunto | installée (numéro de version non exposé par l'API) |
| Lockdown | installée (vcs-date 2025-12-22) |

**Effet de bord utile :** ceci tranche une question ouverte du §6 de la
passation (« Lockdown est-elle installée ? », CLAUDE.md l'affirme, l'état des
lieux disait qu'elle avait été écartée) — **elle est bien installée**,
confirmé par siteinfo indépendamment de `prop=info|protection`.

## 2. Documentation Page Forms 5.8.1 (mediawiki.org, pages officielles)

Sources consultées en wikitexte brut (`action=raw`) : *Defining forms*,
*Input types*, *Page Forms and templates*, *Values, mappings and
autocompletion*.

### 2a. Masquer un bloc `for template` entier via `show on select`, sans appel de modèle vide

**Non documenté.** Aucune des quatre pages ne décrit de marqueur à poser sur
la balise `<div>` entourant un bloc `for template` pour empêcher Page Forms
d'écrire un appel de modèle vide quand le bloc est masqué par `show on
select`.

**`holds template` n'est pas ce marqueur — l'hypothèse du cadrage était
fausse.** C'est un paramètre distinct, documenté sous « Embedded templates » :
il sert à faire qu'un *champ* stocke une série d'appels d'un autre modèle
(gabarit multi-instance imbriqué comme valeur d'un paramètre du modèle
parent) — un mécanisme de stockage, sans rapport avec l'affichage
conditionnel d'un bloc.

Le seul mécanisme documenté pour un bloc de modèle réellement optionnel (zéro
instance possible, aucun appel écrit si non utilisé) est celui des
**templates multi-instances** (`multiple`, `minimum instances=0`) — mais son
interface est un bouton « Ajouter », pas une case à cocher pilotée par
`show on select`. Ce n'est pas transposable tel quel au design du lot
(facette cochée → bloc révélé).

**Conclusion :** point 2a conclu « non documenté ». Selon la règle posée par
le cadrage lui-même : *« Si le point 2 se conclut par impossible ou non
documenté, le lot s'arrête là et on rouvre l'arbitrage : la solution de repli
est un formulaire par facette, avec `#default_form` émis par le modèle de
facette pour lever l'ambiguïté à la réédition. »*

Je n'ai pas testé empiriquement en bac à sable — ce test-là est le contenu de
la Tâche 8, pas de la Tâche 0, et la Tâche 0 est de la reconnaissance
documentaire seule.

### 2b. Transclusion d'une sous-page contenant `{{{for template}}}` / `{{{field}}}`

**Documenté et supporté**, sous la section *« Reusing form elements »* de
*Defining forms* : on peut isoler du texte de formulaire répété (y compris
des balises `for template` / `field`) dans une page à part et la transclure
dans le formulaire — c'est exactement le design de la décision 1.6 du
cadrage.

**Condition impérative :** dans la page transcluse, les caractères des
balises Page Forms doivent être échappés en HTML (`{` → `&#123;`, `|` →
`&#124;`, `}` → `&#125;`) ou entourés de `<nowiki>`. Raison, confirmée par la
section *« Caching form definitions »* : une définition de formulaire est
parsée deux fois — d'abord le wikitexte en HTML (c'est cette passe qui
effectue la transclusion), puis les balises spécifiques à Page Forms
(`{{{field}}}`, etc.). Sans échappement, la première passe traiterait les
accolades comme une transclusion de paramètre de modèle ordinaire et casserait
la syntaxe avant que Page Forms n'ait pu la reconnaître.

**`$wgPageFormsFormCacheType` :** aucune interaction spécifique avec la
transclusion n'est documentée. La seule réserve documentée sur ce cache
concerne les éléments à affichage dynamique (`{{PAGENAME}}`,
`{{CURRENTUSER}}}`), à ne pas mettre en cache — sans rapport avec le
mécanisme de transclusion en tant que tel. Rien ne signale que le cache
empêcherait ou modifierait le fonctionnement décrit en 2b.

### 2c. `values from category` sur un champ `checkboxes`

**Oui, documenté.** La page *Values, mappings and autocompletion* introduit
l'ensemble des paramètres `values...` (dont `values from category=`) comme
s'appliquant « aux types d'entrée qui offrent un ensemble fini d'options »,
et cite explicitement `dropdown` et `checkboxes` comme exemples de ce
groupe. Le tableau dédié au type `checkboxes` dans *Input types* ne liste que
`hide select all` / `show select all` comme paramètres *propres* au type,
mais cela ne contredit pas l'usage de `values from category`, qui est un
paramètre générique de la famille des champs à valeurs prédéfinies, pas un
paramètre spécifique à un type d'entrée donné.

## 3. Déclaration de `Max_head`

Lue sur `Property:Max head` :

```
[[Has type::Number]]
[[Property_cardinality::single]]
[[Property_domain::Category:Referenced item]]
[[Property_range::cm]]
```

**Type Nombre (`Number`), pas Quantité (`Quantity`).** L'unité n'est pas
gérée par le mécanisme natif SMW de conversion d'unités (qui exigerait le
type `Quantity` avec ses propriétés `Corresponds to`/`Display units`) mais
par une convention locale : une propriété texte `Property_range` qui
documente l'unité sans la faire porter par le type. Les propriétés numériques
du lot 8 (`Adult_height`, `Adult_width`, `Hardiness_min_temp`,
`Time_to_production`) doivent s'aligner sur cette convention : type `Number`
+ `Property_range` textuelle, pas `Quantity`.

## 4. Items organiques et propriétés de raccord effectivement renseignées

`Category:Organic item` contient exactement trois membres, conforme à
l'effectif attendu (§3 du cadrage, §1 de la passation) :

| Item | Réf. | `Connection_gender` | `Thread_designation` | `Nominal_diameter` | `Secondary_diameter` | `Connection_standard` | `Fitting_family` | `Material` |
|---|---|---|---|---|---|---|---|---|
| `Bidon 220L` | 000M | — | — | — | — | — | — | — |
| `Cuve de récupération d'eau` | 000L | — | — | — | — | — | — | — |
| `Transfert d'eau par vases communicants` | 000Q | — | — | — | — | — | — | — |

**Aucune des sept propriétés de raccord n'est renseignée sur aucun des trois
items organiques.** Les paramètres existent bien dans `Modèle:Organic item`
(vérifié : les sept apparaissent dans le `#set` et le tableau d'affichage),
mais aucun des trois items actuels ne les utilise — aucun n'est un raccord.
Aucun item référencé « raccord » n'existe non plus (`Category:Referenced
item` ne contient que `Batterie défaillante récupérée` et `Bidon 220L bleu
plastique Borde`).

**Conséquence pour les Tâches 5 et 6 :** la liste de migration est **vide**.
Retirer les sept paramètres de `Modèle:Organic item` (Tâche 6) n'affecterait
aucune annotation existante — l'opération serait sans risque de perte de
donnée le jour où elle serait exécutée, mais aussi sans objet réel à migrer
en Tâche 5. Le mécanisme de facette raccord serait alors validé sur un item
créé pour l'occasion (bac à sable, Tâche 8), pas sur un cas réel migré.

## 5. Upload JPEG

Vérifié dans la copie locale de `LocalSettings.php`
(`Serveur3/wiki.ecolibre.org_LocalSettings_ecolibre.php`, identique à la
copie datée du 26/07) :

```
$wgEnableUploads = true;
$wgFileExtensions = [ 'png','gif','jpg','jpeg','webp','pdf','doc','docx','odt',
                       'xls','xlsx','ods','ppt','pptx','odp','tiff','bmp','ico' ];
```

**JPEG (`jpg`/`jpeg`) est autorisé.** La limite connue sur `$wgFileExtensions`
porte bien sur SVG (absent de la liste), pas sur JPEG — pas de confusion,
`Seedling_image` et `Mature_image` (Tâche 4) pourront recevoir des JPEG.

**Réserve :** vérifié sur une copie locale du 26/07, pas par lecture live du
serveur (pas d'accès SSH depuis cette session). Si `LocalSettings.php` a été
modifié depuis, cette réponse serait caduque — à recouper en direct si un
doute existe au moment de l'upload.

---

## Ce qui bloque, ce qui ne bloque pas

**Bloquant (point 2a) :** le mécanisme central du cadrage — un bloc de
formulaire masqué qui n'écrit rien tant qu'il n'est pas révélé — n'est
documenté nulle part dans la documentation officielle de Page Forms 5.8.1.
Conformément à la règle du cadrage, je m'arrête ici et ne commence pas la
Tâche 1. Deux voies possibles, à ta décision :

- rouvrir l'arbitrage vers la solution de repli déjà prévue (un formulaire
  par facette, `#default_form` émis par le modèle de facette) ;
- ou autoriser un test empirique ciblé en bac à sable (ce qui revient à
  anticiper une partie de la Tâche 8) avant de trancher, si tu préfères
  vérifier par la pratique plutôt que par la documentation avant de rouvrir
  l'arbitrage.

**Non bloquant, à noter :**
- Point 2b et 2c sont positifs : la transclusion de sous-page (décision 1.6)
  et `values from category` sur `checkboxes` (champ `Item_facet`, Tâche 7)
  sont tous deux documentés et utilisables tels que cadrés.
- Point 3 : convention `Number` + `Property_range` confirmée pour les
  propriétés numériques de la Tâche 4.
- Point 4 : la liste de migration de la Tâche 5 est vide — à en tenir compte
  si le lot reprend.
- Point 5 : JPEG confirmé autorisé, sous réserve de fraîcheur du fichier
  local.
