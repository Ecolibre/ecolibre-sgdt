# Lot 21, tâche 14 — Inscription de la conception

Exécutée le 8 octobre 2026 par Claude Code, sur consigne de l'architecte.

## Étape 0 — État du dépôt

- `git status` : branche `main`, à jour avec `origin/main`, copie de travail propre. Aucune ligne M, A, D, R ni `??`.
- `travaux/lot-21-tache14-conception.md` n'existait pas.
- `.claude/settings.local.json` au début comme à la fin de la tâche : `"allow": []`, `"deny": []`. Aucune règle.

## Entrée ajoutée aux Limites connues

Un seul appel à `bin/wiki-append.sh`, résumé `[Lot 21][Tâche 14] Un lot suspendu n'a pas d'état pour le dire`. Révision 1466 → **1467** (2026-10-08T19:11:01Z). Pré-contrôle : 64 entrées ; post-contrôle : 65 entrées, l'ajout est la dernière ; rendu : un seul bloc `<ol>`.

**Entrée 65** :

```
# '''Une énumération fermée ne s'enrichit plus une fois le verrou de propagation posé.''' Ajouter une valeur à la liste <code>_PVAL</code> d'une propriété revient à modifier sa déclaration, donc à la verrouiller si elle ne l'est pas déjà, et c'est impossible si elle l'est. Constaté le 6 octobre 2026 sur <code>Work_package_status</code>, dont les six valeurs sont « identifié », « cadré », « ouvert », « livré », « clos » et « abandonné » : il n'en existe aucune pour un lot suspendu par une dépendance externe, et trente-quatre lots dépendent de cette propriété. Le cas se représentera pour toute énumération fermée du modèle. '''En attendant que le verrou soit réparé, une valeur manquante se dit en prose sur la page concernée, jamais en ajoutant une valeur à l'énumération.'''
```

## Diff de la page du lot 21

Page `Lot 21 — Grandeurs et unités`, révision 1464 → **1468** (2026-10-08T19:21:51Z), résumé `[Lot 21][Tâche 14] Inscription de la conception arrêtée`. Les huit ancres ont été trouvées chacune une fois et une seule (contrôle fait sur les huit avant tout remplacement). Diff final, `diff` avant/après, correction 49 → 51 comprise (voir Écarts) :

```
4c4
< |Work_package_summary=Faire des grandeurs physiques et de leurs unités des pages porteuses d'attributs, et décider comment une valeur mesurée s'attache à un item.
---
> |Work_package_summary=Faire des grandeurs physiques et de leurs unités des pages porteuses d'attributs, décider comment une valeur mesurée s'attache à un item, et poser le socle qui en découle : une propriété par grandeur, pour tout le modèle.
7c7
< |Work_package_overlaps=Lot 12 — Contenants et étiquetage,Lot 26 — Renommage des propriétés par domaine,Lot 31 — Qualification des données et confiance entre pairs
---
> |Work_package_overlaps=Lot 12 — Contenants et étiquetage,Lot 19 — Vocabulaire et multilingue,Lot 26 — Renommage des propriétés par domaine,Lot 31 — Qualification des données et confiance entre pairs
37c37
< '''Un mode se vise par le filtre de classe.''' Mesuré le 5 octobre 2026 : une requête sur une propriété rend la page et ses sous-objets mêlés, mais la même requête portant en plus la catégorie de la classe ne rend que la page. Les sous-objets ne portent pas <code>_INST</code>, seul le sujet principal le porte. Les deux autres pistes envisagées — une propriété distincte par mode, un marqueur de mode porté par le sous-objet — sont donc inutiles.
---
> '''Le filtre de classe sépare la page de ses sous-objets.''' Mesuré le 5 octobre 2026 : une requête sur une propriété rend la page et ses sous-objets mêlés, mais la même requête portant en plus la catégorie de la classe ne rend que la page. Les sous-objets ne portent pas <code>_INST</code>, seul le sujet principal le porte. Rédaction corrigée le 8 octobre 2026 : la version du 6 octobre concluait de là que le filtre de classe suffisait à viser un mode, et que le marqueur porté par le sous-objet était inutile. C'est faux. Le filtre isole la valeur scalaire ; la spécification et la mesure sont toutes deux des sous-objets de la même page, et rien ne les distingue sans marqueur. La conception arrêtée depuis supprime le scalaire, ce qui retire au filtre de classe son dernier emploi.
46a47,82
> == La conception arrêtée ==
> 
> Arrêtée du 6 au 8 octobre 2026, après la phase de mesure. Elle déborde l'objet initial du lot, qui a été élargi en conséquence.
> 
> '''Une propriété par grandeur, et non une par caractéristique.''' Décidé le 8 octobre 2026. Le wiki déclarait jusqu'ici une propriété par caractéristique : <code>Nominal diameter</code>, <code>Secondary diameter</code>, <code>Max thickness</code> et <code>Max head</code> mesurent trois fois la même grandeur, une longueur, et redéclarent trois fois leur type et leurs unités. Le socle devient une propriété par grandeur, soit quelques dizaines au lieu de centaines. Motif : deux ateliers s'accorderont sur « diamètre », jamais sur « diamètre secondaire », qui est un mot de notre catalogue et non une notion partagée. Si chaque caractéristique est une propriété, chaque partenaire invente les siennes et la jointure est perdue d'avance, ce que le SGDT veut précisément éviter. Prix accepté : les requêtes s'allongent, et la reprise des propriétés existantes devient une refonte plutôt qu'un changement de type.
> 
> '''Cette décision engage le modèle entier, pas seulement ce lot.''' Le [[Lot 10 — Procédés et outils|lot 10]], dont <code>Measured_quantities</code> devient caduque ; le [[Lot 12 — Contenants et étiquetage|lot 12]], dont les contenants porteront des cotes ; le [[Lot 26 — Renommage des propriétés par domaine|lot 26]], qui renommera un socle partagé et non des noms isolés ; le [[Lot 7 — Nomenclature quantifiée et entité réception|lot 7]] et le [[Lot 19 — Vocabulaire et multilingue|lot 19]]. Le recoupement entre lots ne se déclarant que d'un côté (entrée 51 des Limites connues), aucun de ces lots ne verra passer la décision : elle est nommée ici pour qu'on la retrouve.
> 
> '''Trois propriétés par grandeur : la valeur, le minimum, le maximum.''' <code>Diameter</code>, <code>Diameter min</code>, <code>Diameter max</code>. Les comparateurs sur des bornes de ce genre ont été mesurés le 4 octobre 2026. Les deux autres formes envisagées, un rôle de borne porté par le sous-objet ou deux bornes dans un sous-objet distinct, multiplieraient les sous-objets pour économiser des propriétés, c'est-à-dire déplaceraient la complexité là où elle se voit le moins.
> 
> '''Toute valeur de grandeur est portée par un sous-objet, sans exception.''' Le mode scalaire disparaît. Un item peut porter deux diamètres, et un scalaire n'en loge qu'un : la forme dépendrait alors de l'item, et une requête devrait chercher à deux endroits sans savoir lequel. Prix accepté : plus aucune valeur ne s'écrit en une ligne. Gain : une seule forme, donc aucun choix à la saisie, et un seul mécanisme de sélection au lieu de deux.
> 
> '''Le mode est porté par une propriété, <code>Characteristic mode</code>, en énumération fermée à deux valeurs : spécification et mesure.''' Une catégorie ne conviendrait pas, un sous-objet n'en portant pas (mesuré le 5 octobre 2026). Deux valeurs seulement : la provenance d'une mesure, son incertitude et la façon dont elle a été obtenue relèvent du [[Lot 31 — Qualification des données et confiance entre pairs|lot 31]], et une énumération fermée est ce qu'il y a de plus coûteux à enrichir une fois le verrou posé (entrée 65).
> 
> '''Un rôle distingue deux valeurs de la même grandeur sur le même item.''' Nominal, extérieur, intérieur, maximal admissible. Porté par le sous-objet. Son vocabulaire et sa forme restent à arrêter.
> 
> '''Un rattachement distingue ce qui caractérise une partie de l'item.''' Le diamètre de l'orifice d'aspiration est le diamètre d'un orifice, pas de la pompe. Un sous-objet peut porter un rattachement ; la définition de ces entités relève du [[Lot 12 — Contenants et étiquetage|lot 12]], et le lot 21 se borne à ménager la place.
> 
> '''Une tolérance se stocke en deux bornes absolues, jamais en écart.''' Un mécanicien écrit « 20 ±0,1 », « 20 -0,1/+0,2 » ou « H7 » : trois écritures de la même chose. Le formulaire les accepte toutes et fait la soustraction ; le sous-objet porte la valeur et les deux bornes calculées. Une requête devient alors directe, et la question du décalage d'origine des températures s'évanouit, une borne absolue étant une température absolue. La forme d'origine est conservée telle quelle dans un champ de texte à côté, parce qu'un dessin se relit et qu'un « H7 » ne se reconstitue pas depuis deux nombres.
> 
> '''Ce que porte une page de grandeur.''' Les libellés par langue en Monolingual text ; le symbole usuel ; une définition en une phrase ; l'unité principale, en lien vers une page d'unité ; les unités admises, en liens, multivalué ; le type à employer, Quantity ou Temperature ; le bloc de déclaration tout fait, à transclure, l'ordre des unités d'affichage déjà écrit dans le bon sens ; le nom de la propriété correspondante ; une équivalence vers un identifiant externe. La dimension physique et la grandeur de base dont elle dérive n'y figurent pas : aucun mécanisme ne s'en servirait, et une page de grandeur s'enrichit plus tard sans risque, étant une page ordinaire.
> 
> '''Ce que porte une page d'unité.''' Les libellés par langue ; le symbole, c'est-à-dire la chaîne exacte qu'un contributeur tape ; les alias acceptés à la saisie, pour qui n'a pas les caractères sous la main ; la grandeur dont elle est une unité ; le facteur de conversion vers l'unité principale ; le code UCUM ; une équivalence vers un identifiant externe ; son appartenance au SI et à quel titre. Le trio symbole, alias, facteur est exactement ce qu'attend une ligne de déclaration : une page d'unité porte donc déjà tout ce qu'il faut pour l'écrire.
> 
> '''Le bloc de déclaration est écrit à la main sur la page de grandeur, et transclus par les propriétés.''' Écrit à la main, une ligne par unité, recopiée du symbole et du facteur portés par les pages d'unité : un lecteur voit exactement ce qui sera déclaré. Transclus plutôt que recopié dans chaque propriété, parce que la liste des unités admises appartient à la grandeur et non à chacune de ses propriétés, ce qui est tout l'objet du lot. L'effet d'une modification du bloc sur les propriétés qui le transcluent n'est pas mesuré : voir les risques connus.
> 
> '''Les titres sont français, les noms de propriétés anglais.''' Une page de grandeur ou d'unité porte un titre français, et une unité porte son nom développé, « Millimètre » et non « mm » : un titre se lit, un symbole se tape. Un nom de propriété est un identifiant technique, écrit une fois et jamais traduit, et l'anglais le rapproche des équivalences externes. Le pont se fait sur la page de grandeur, qui porte le nom de sa propriété comme elle porte son code UCUM.
> 
> '''La jointure entre wikis passe par un identifiant externe, pas par le titre.''' QUDT pour les grandeurs, UCUM et QUDT pour les unités. Aucun n'est obligatoire : une grandeur ou une unité sans équivalent connu reste valable, simplement moins joignable. Les rendre obligatoires bloquerait la création d'unités métier que personne n'a normalisées, et il y en aura.
> 
> '''La portée d'une propriété ne porte plus l'unité.''' Elle garde ce que l'unité ne dit pas : une borne, une cardinalité, une énumération. '''Avertissement''' : ce champ est une consigne lue par un humain, rien ne la fait respecter. Croire qu'une portée écrite est une contrainte appliquée est le genre de malentendu qui se paie deux ans plus tard.
> 
> '''<code>Measured quantities</code> devient caduque.''' Dire qu'un appareil mesure un débit, c'est désormais porter un sous-objet de débit en mode mesure. Son sort, suppression ou renommage, appartient au [[Lot 10 — Procédés et outils|lot 10]] ; elle est signalée ici pour qu'on cesse de la remplir.
> 
> '''La reprise des propriétés existantes ne migre rien : elle réécrit les pages porteuses.''' <code>Max thickness</code> à 0,2 devient un sous-objet portant une épaisseur de 0,2 mm, en mode spécification, avec le rôle maximal. Trois valeurs sur deux pages. Les anciennes propriétés restent en place et se vident, et leur sort appartient au [[Lot 26 — Renommage des propriétés par domaine|lot 26]]. '''Aucune écriture n'a donc lieu sur les quatre pages de propriété existantes''', ce qui écarte tout risque de verrou sur elles. La règle d'ordre inscrite aux risques connus le 6 octobre 2026, écrire l'unité puis changer le type, devient sans objet.
> 
52a89,94
> '''Une grandeur « écart de température », distincte de la température.''' Envisagée le 6 octobre 2026, parce que le type Temperature applique le décalage d'origine à un écart et le rend faux. Écartée le 8 octobre 2026 : les tolérances se stockant en bornes absolues, il n'existe plus d'écart nulle part, et une borne absolue est une température ordinaire. La mesure du décalage garde sa valeur d'avertissement, et justifie précisément ce choix. Si un écart devait un jour être stocké tel quel, il faudrait une grandeur distincte.
> 
> '''Une page d'unité portant deux appartenances.''' Envisagée le 6 octobre 2026 pour le degré Celsius, unité de deux grandeurs à la fois. Tombe avec la précédente : une unité appartient à une grandeur, sans exception.
> 
> '''Le bloc de déclaration engendré par une requête sur les pages d'unité.''' Écarté le 8 octobre 2026. Une requête s'exécuterait au moment d'analyser une page de propriété, et son résultat déciderait du type des données ; si elle rendait les unités dans un autre ordre, l'unité d'affichage par défaut changerait sans que personne ait rien touché. C'est ajouter une pièce mobile à l'endroit le plus rigide du système. L'automatisation se reposera quand la fédération aura des dizaines de grandeurs.
> 
73c115,124
< Les descriptions des propriétés de diamètre nominal et secondaire prescrivent le point décimal, que l'installation rejette, et le diamètre secondaire sépare ses valeurs par la virgule, qui découpe une virgule décimale (entrée 57 des Limites connues). Aucune valeur n'en dépend aujourd'hui. Ces deux pages sont libres au 6 octobre 2026 et doivent le rester : les corriger maintenant les verrouillerait et interdirait ensuite le changement de type (entrée 62). La correction de la description et la migration du type s'écrivent donc ensemble, en une seule écriture par propriété.
---
> Les descriptions des propriétés de diamètre nominal et secondaire prescrivent le point décimal, que l'installation rejette, et le diamètre secondaire sépare ses valeurs par la virgule, qui découpe une virgule décimale (entrée 57 des Limites connues). Aucune valeur n'en dépend. Depuis le 8 octobre 2026, ces deux propriétés ne sont plus reprises par ce lot : elles se vident et leur sort appartient au [[Lot 26 — Renommage des propriétés par domaine|lot 26]]. Elles sont libres au 8 octobre 2026 et doivent le rester, les corriger les verrouillant pour rien.
> 
> Quatre arbitrages restent à rendre avant la première écriture dans l'espace Attribut, et les deux premiers seuls sont bloquants :
> 
> * le vocabulaire des rôles, et sa forme : énumération fermée, ou pages d'un vocabulaire ouvert ;
> * les noms des propriétés, celles du socle comme celles que portent les pages de grandeur et d'unité, puisqu'une déclaration neuve doit être juste du premier coup ;
> * le nom du champ qui conserve la forme d'origine d'une tolérance ;
> * la liste des grandeurs à créer en premier.
> 
> Le lot n'est bloqué par rien d'autre. Les opérations côté serveur, dont l'examen du verrou de propagation, restent en attente de la migration et ne commandent plus aucune étape de ce lot.
77c128
< Trois hypothèses du travail préparatoire d'août 2026 restent à trancher pendant la conception ; la mesure du 4 octobre 2026 ne les touchait pas.
---
> Les trois hypothèses du travail préparatoire d'août 2026 ont toutes été tranchées entre le 6 et le 8 octobre 2026, et leur résolution figure ci-dessus.
79,81c130,132
< * La forme d'une caractéristique, scalaire ou sous-objet, déclarée une fois par grandeur, niveau et mode, jamais choisie à la saisie : sinon une requête devrait chercher à deux endroits sans savoir lequel.
< * L'unité sortie de la portée des propriétés et remplacée par un lien vers la page de grandeur, la portée ne gardant que le range formel.
< * La page d'unité portant un code UCUM et une équivalence vers QUDT, sans rien importer.
---
> * La forme d'une caractéristique est désormais unique : un sous-objet, toujours, le scalaire ayant disparu.
> * L'unité est sortie de la portée des propriétés, remplacée par un bloc de déclaration transclus depuis la page de grandeur.
> * La page d'unité porte un code UCUM et une équivalence externe, sans rien importer, et aucun des deux n'est obligatoire.
83c134
< L'existant à reprendre est minime : une poignée de valeurs hors positions, relevé du 4 octobre 2026. Une quarantaine de grandeurs sont visées à terme.
---
> L'existant à reprendre est minime : trois valeurs sur deux pages, relevé du 4 octobre 2026. Une quarantaine de grandeurs sont visées à terme.
88c139,140
< * La valeur recalculée l'est à partir de la saisie portée par la page de l'item. Une valeur saisie sans unité, comme les nombres nus que portent aujourd'hui les propriétés de production, n'a pas été mesurée dans ce cas. '''Ordre à suivre à la migration : écrire d'abord l'unité sur les pages porteuses, puis seulement changer le type de la propriété.'''
---
> * Ce risque ne concerne plus ce lot depuis le 8 octobre 2026 : la reprise des propriétés existantes ne change aucun type, elle réécrit les pages porteuses. Il reste valable pour tout lot qui changerait le type d'une propriété en production.
> * Une propriété neuve se crée sans danger, une à la fois, sous réserve de la barrière du type résolu : onze créations isolées entre le 4 et le 6 octobre 2026 ont toutes rendu le bon type. Le gel du type résolu n'est survenu qu'une fois, sur une rafale de onze pages écrites en treize secondes (entrée 59 des Limites connues). Ce qui arrive souvent est le verrou d'écriture, qui ne gêne pas l'usage (entrée 63) mais interdit de revenir sur la déclaration : une déclaration neuve doit donc être juste du premier coup.
```

## Correspondance N6 appliquée

**N6 = 65.** Une seule occurrence, dans le paragraphe « Le mode est porté par une propriété, `Characteristic mode`… » : « (entrée 65) ».

## Diff de CLAUDE.md

```
diff --git a/CLAUDE.md b/CLAUDE.md
index 37d4b31..58c465b 100644
--- a/CLAUDE.md
+++ b/CLAUDE.md
@@ -284,7 +284,7 @@ Ce que Cyril peut lancer seul, et ce qui relève de fuzzy : voir
 
   **Le verrou d'écriture n'est pas un critère.** `smw-change-propagation-protection` n'empêche ni le stockage ni la requête : mesuré le 5 octobre 2026, une propriété verrouillée stocke et répond exactement comme une propriété libre de même type. Ne jamais éliminer ni abandonner une propriété parce que sa page est verrouillée. Le verrou se lit sans rien écrire par `intestactions`, et il se consigne.
 
-  **En revanche il fige la déclaration.** Toute écriture qui modifie le type d'une propriété la verrouille en moins de trois minutes, et aucun verrou observé entre le 4 et le 6 octobre 2026 ne s'est levé. Une page de propriété s'écrit donc une seule fois, dans sa forme définitive, type, conversions, unités d'affichage et description comprises. Ne jamais corriger une description sur une propriété dont le type doit encore changer : les deux écritures n'en font qu'une.
+  **En revanche il fige la déclaration, et c'est une panne, pas une règle du modèle.** Toute écriture qui modifie le type d'une propriété la verrouille en moins de trois minutes, et aucun verrou observé entre le 4 et le 6 octobre 2026 ne s'est levé, alors que trois verrous d'août 2026 s'étaient levés seuls en quelques jours. Un verrou temporaire le temps d'une propagation est le comportement documenté de SMW ; qu'il ne se lève pas ne l'est pas, et la cause probable est la file de travaux qui ne tourne pas. **Précaution d'exploitation, valable tant que ce défaut dure :** écrire une page de propriété une seule fois, dans sa forme définitive, type, conversions, unités d'affichage et description comprises, et ne jamais corriger une description sur une propriété dont le type doit encore changer. **Condition de sortie :** dès qu'un verrou se lève à nouveau de lui-même, cette précaution tombe et une propriété se corrige normalement.
 
   Après avoir créé une propriété, n'émettre aucune requête nommant cette propriété tant que `_CHGPRO` n'a pas disparu de ses faits ; la seule sonde autorisée pendant cette attente est la lecture des faits de la page et celle de `intestactions`, qui ne résolvent aucun type. Ce n'est pas la rafale qui décide : mesuré les 4 et 5 octobre 2026, une rafale de huit créations a réussi, une création isolée a échoué.
 
@@ -590,6 +590,7 @@ sur la banque physique est notée ici. À traiter avec le lot de numérotation.
   modifier un fichier que l'outillage a pu changer, le relire par une
   commande.
 - `sleep` au premier plan est bloqué par l'environnement Claude Code, avec le message « Blocked: sleep 60 followed by… ». Pour une pause fixe, lancer `sleep` en arrière-plan et attendre sa notification de fin. Pour attendre la file de travaux, `bin/wiki-wait-jobs.sh`. Mesuré le 4 octobre 2026, lot 21 tâche 8.
+- Un fichier d'ajout ne contient qu'une seule entrée, et `bin/wiki-append.sh` ne s'appelle qu'une fois par entrée. Cinq entrées ajoutées ensemble coûtent une seule révision mais se défont ensemble ; cinq appels coûtent cinq révisions et chacune s'annule seule. La règle existait déjà et une consigne du 6 octobre 2026 l'a contredite : c'est la consigne qui était en tort.
 
 ## Garde-fous d'exécution (dépôt git)
 
```

La seconde ancre, telle que je l'ai d'abord cherchée (avec retour à la ligne et indentation), n'existait pas : la puce sur `sleep` tient sur une seule ligne. L'ajout est placé juste après elle, dernière puce de la section « Leçons de méthode », immédiatement avant « Garde-fous d'exécution (dépôt git) ».

## Vérifications

**a. Celle qui tranche.**
- `bin/wiki-verify.sh "Lot 21 — Grandeurs et unités" pages/Lot_21.txt` : `IDENTIQUE`, sortie 0.
- `Limites connues` relue par `bin/wiki-get.sh` dans `pages/Limites_connues.txt` après l'ajout, puis `bin/wiki-verify.sh` : `IDENTIQUE`, sortie 0. La dernière ligne de la page est identique au fichier d'ajout, au saut de ligne final près.

**b. Rendu.** `action=parse&prop=text|categories` sur les deux pages : aucun avertissement SMW (`smw-highlighter`, `smwttcontent`), aucune classe `error`, aucun lien de classe `new`. Catégories : `Lot` pour la page du lot, `Page_de_suivi` pour les Limites connues, rien d'autre. Liens (`generator=links&prop=info`) : aucune page manquante sur l'une ou l'autre. Les six lots cités existent :

| Lot | pageid |
|---|---|
| Lot 7 — Nomenclature quantifiée et entité réception | 520 |
| Lot 10 — Procédés et outils | 523 |
| Lot 12 — Contenants et étiquetage | 485 |
| Lot 19 — Vocabulaire et multilingue | 491 |
| Lot 26 — Renommage des propriétés par domaine | 537 |
| Lot 31 — Qualification des données et confiance entre pairs | 556 |

Faits stockés sur la page du lot (`--facts`) : `Work_package_overlaps` porte quatre valeurs, lots 12, 19, 26 et 31 ; `Work_package_summary` porte le nouveau résumé ; aucun fait parasite. Faits des Limites connues : `_INST`, `_MDAT`, `_SKEY` seulement.

**c. Numérotation.** Entrée **65** : « Une énumération fermée ne s'enrichit plus une fois le verrou de propagation posé. » C'est la 65e ligne commençant par `# ` de la page relue. La mention « (entrée 65) » de la page du lot pointe bien sur elle.

**d. Structure de la page du lot.** Sections dans l'ordre (`prop=sections`) :
1. Ce qui est déjà tranché
2. La conception arrêtée
3. Ce qui est écarté, et pourquoi
4. Ce qui est exclu du périmètre
5. Points ouverts
6. Point de départ
7. Risques connus
8. Dépendances

« La conception arrêtée » est bien entre « Ce qui est déjà tranché » et « Ce qui est écarté, et pourquoi ».

**e. Erreurs.** `[[_ERRC::+]]` vaut **1** par les deux mesures : `action=ask` (`meta.count` = 1) et rendu en ligne `format=count` (1). Seul sujet : `Utilisateur:Cywil/Bac à sable/Lot21c pompe#saisie-douteux`. Aucun sujet nouveau.

**f. Propriétés intactes.** `prop=info&intestactions=edit&intestactionsdetail=full`, connecté en tant que Cywil :

| Propriété | lastrevid | edit |
|---|---|---|
| Attribut:Nominal diameter | 342 | `[]` |
| Attribut:Secondary diameter | 343 | `[]` |
| Attribut:Power rating | 803 | `[]` |
| Attribut:Max thickness | 804 | `[]` |

Révisions attendues, aucune verrouillée. Aucune écriture dans l'espace Attribut, aucune page d'essai touchée.

## Écarts et surprises

1. **L'entrée 49 citée par le remplacement 2.4 n'était pas la bonne.** L'entrée 49 des Limites connues porte sur les extensions de fichiers refusées à l'envoi ; le recoupement entre lots déclaré d'un seul côté est l'**entrée 51**. Corrigé en 51 sur la page du lot, avec l'accord de Cyril (point A ci-dessous). Les autres renvois ont été vérifiés et sont justes : 33, 57, 59, 60, 61, 62, 63, et 65 pour la nouvelle entrée.

2. **Le texte inscrit contredit CLAUDE.md sur les créations isolées.** Le remplacement 2.7 écrit : « onze créations isolées entre le 4 et le 6 octobre 2026 ont toutes rendu le bon type. Le gel du type résolu n'est survenu qu'une fois, sur une rafale ». CLAUDE.md, règle « Barrière avant d'employer une propriété neuve », dit : « Ce n'est pas la rafale qui décide : mesuré les 4 et 5 octobre 2026, une rafale de huit créations a réussi, une création isolée a échoué. » Les deux ne peuvent être vrais ensemble. Inscrit tel que la consigne le donnait ; aucun des deux textes n'a été modifié pour l'autre. Voir point B.

3. **« Mesurent trois fois la même grandeur » pour quatre propriétés.** Le paragraphe « Une propriété par grandeur » nomme quatre propriétés, `Nominal diameter`, `Secondary diameter`, `Max thickness` et `Max head`, puis dit qu'elles mesurent « trois fois la même grandeur, une longueur ». `Attribut:Max head` existe (révision 335) ; ce n'est pas l'une des quatre propriétés de production nommées par la consigne, qui comprennent `Power rating` à sa place. Inscrit tel quel.

4. **Paragraphes antérieurs de la page du lot que la conception arrêtée dément, et que la consigne ne touchait pas.** Ils sont restés tels quels et coexistent maintenant avec la nouvelle section :
   - « Trois modes d'affirmation d'une valeur » : « Une valeur scalaire pour le cas simple ». La conception supprime le scalaire.
   - « Les propriétés existantes changent sur place » : la conception dit que la reprise ne migre rien et réécrit les pages porteuses.
   - « Le mode scalaire est porté par le type Quantity… » : même contradiction sur le scalaire.
   - « Une tolérance de température n'emploie pas le type Temperature » : prescrit Quantity pour un écart ou une tolérance, alors que la conception stocke les tolérances en bornes absolues, donc en Temperature, et l'écart de température est écarté.
   - « Les caractéristiques nouvelles » (section « exclu du périmètre ») : « Le lot pose le mécanisme et y fait passer les propriétés existantes », ce que la conception ne fait plus.
   - « Les déclarations d'unités se partagent par un modèle transclus » : compatible, mais le transclus est désormais le bloc de la page de grandeur.

5. **La session a expiré entre l'écriture et les vérifications**, une dizaine de minutes après `bin/wiki-login.sh`. Le premier `intestactions` a répondu comme pour un anonyme (`permissiondenied`, `confirmemail`), ce qui masquait l'information sur le verrou. `meta=userinfo` l'a confirmé (`anon: true`). Après reconnexion, la lecture a rendu `edit: []` pour les quatre propriétés. Les vérifications b et e ont été faites en lecture anonyme, sans effet sur leur résultat puisque ces pages et requêtes sont publiques. `bin/wiki-api.sh` ne signale pas qu'il retombe en anonyme alors que le fichier de cookies existe.

6. Le résumé de l'ajout aux Limites connues, « Un lot suspendu n'a pas d'état pour le dire », décrit le cas déclencheur, pas le titre de l'entrée (« Une énumération fermée ne s'enrichit plus… »). Écrit tel que donné.

## Échanges avec Cyril hors consigne

- Point A, entrée 49 : réponse « Corriger en 51 ». Appliqué.

## Questions

**B.** La page du lot (risques connus, depuis cette tâche) dit que onze créations isolées ont toutes réussi et que le gel n'a touché qu'une rafale. CLAUDE.md dit l'inverse : une rafale de huit a réussi, une création isolée a échoué. Lequel fait foi ? Je suggère que l'architecte relise les rapports des tâches 6 à 12 et qu'une consigne corrige ensuite le texte qui a tort, sur le wiki ou dans CLAUDE.md.

**C.** Six paragraphes de la page du lot contredisent désormais la section « La conception arrêtée » (écart 4). Faut-il les réécrire, les barrer ou les dater comme dépassés ? Je suggère une consigne qui ajoute à chacun une mention « Dépassé le 8 octobre 2026, voir La conception arrêtée », sur le modèle de la rédaction corrigée du remplacement 2.3, plutôt qu'un effacement.

**D.** « Trois fois la même grandeur » pour quatre propriétés nommées, dont `Max head` (écart 3). Je suggère de corriger en « quatre fois » à la prochaine écriture sur la page, ou de retirer `Max head` si elle n'est pas une longueur ; c'est à vérifier sur sa page.

**E.** `bin/wiki-api.sh` lit en anonyme sans le dire quand la session a expiré (écart 5). Je suggère de lui faire afficher un avertissement sur stderr quand `meta=userinfo` répond `anon` alors qu'un fichier de cookies est présent, ou à défaut d'ajouter cette situation à la leçon « La session expire entre lecture et écriture ».
