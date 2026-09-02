# Lot 13 — Tâche 4 : l'index refondu, et la fusion de la feuille de route

**Exécuté le :** 2 septembre 2026 (12h20-12h25 UTC environ), session Claude
Code, compte `Cywil`. Session ouverte par `bin/wiki-login.sh` avant toute
écriture. Chaque page a été relue par `wiki-get.sh` immédiatement avant
écriture — huit relectures, huit `diff` vides contre la copie prise en
début de tâche, aucune dérive.

**Incident de séance à consigner en tête du rapport.** Au moment d'écrire
la redirection de l'étape 6, Cyril a envoyé un message d'arrêt qui est
arrivé *après* que l'appel d'écriture avait déjà renvoyé `result: Success`
— les deux événements sont apparus dans le même lot de résultats d'outils.
Impossible de revenir en arrière avec une édition normale. Les trois
questions posées ont été traitées après coup, par une vérification réelle
plutôt que par un raisonnement rétrospectif :

1. **Vers quoi, et pourquoi une redirection ?** Vers `Gestion des lots`,
   conformément à l'étape 6 de la consigne elle-même, qui invoque
   explicitement la même règle de `CLAUDE.md` (« une redirection est
   porteuse de données ») comme motif de conserver une redirection plutôt
   que de supprimer la page.
2. **Le recensement des liens entrants vient-il de `list=backlinks`, ou
   seulement d'un grep sur des pages choisies ?** De `list=backlinks`,
   appelé en tout premier, avant toute lecture de page individuelle : cinq
   résultats, identiques aux cinq annoncés par la consigne. Le grep n'a
   servi qu'à localiser la ligne à modifier *à l'intérieur* des quatre
   pages déjà identifiées par l'API — jamais à établir la liste elle-même.
   Un second appel `list=backlinks`, après correction des quatre pages et
   avant l'écriture de la redirection, a confirmé zéro lien entrant restant.
3. **La page porte-t-elle des annotations sémantiques ?** C'est le point
   vérifié seulement *après* l'écriture, pas avant — un vrai trou de
   séquencement, à ne pas reproduire. Contrôlé a posteriori : le wikitexte
   d'origine (`feuille.txt`, lu avant toute édition) ne contient aucune
   occurrence de `::` et aucun `{{#set:}}` — la page ne portait aucun fait
   SMW propre avant l'édition. `browsebysubject` sur la page, après
   écriture, ne retourne que `_MDAT`/`_SKEY`/`_ASK`, tous résolus vers
   `Gestion des lots` — comportement conforme à ce que `CLAUDE.md` décrit
   pour une redirection. Rien n'a été perdu ni faussé par cette écriture ;
   mais le contrôle aurait dû précéder l'écriture, pas la suivre.

Le travail a repris sur instruction explicite de Cyril, qui a validé la
vérification a posteriori.

---

## Contenu d'origine de l'index (`Gestion des lots`), avant l'étape 4

```
<div style="border:1px solid #a2a9b1; background:#f8f9fa; padding:0.8em 1em; margin-bottom:1em;">
'''Page provisoire, tenue à la main.''' [...]
</div>

Un « lot » est un ensemble cadré de modifications du SGDT [...]

Voir aussi la [[Feuille de route du Système de Gestion de Données Techniques]]
pour les chantiers ouverts hors lot, et les [[Limites connues du Système de Gestion de Données Techniques]].

== Lots livrés ==
[...onze lots numérotés, 1 à 11, chacun avec un lien de permalien...]
'''Trou de numérotation :''' [...]

== Lot en cours ==

Aucun. Le lot 10 se clôt avec cette page.

== Lots à venir ==
[...neuf lots identifiés, sans numéro sauf le 12...]

'''Rectification du 29 août 2026.''' Les descriptions des lots ''Navigation''
et ''Images'' ci-dessus ont été réécrites après vérification sur le wiki :
la clôture du lot 10 affirmait à tort que format=tree et format=outline ne
rendaient rien, et que Main_image n'était câblée dans aucun modèle. Ces deux
affirmations sont fausses ; une troisième, sur la liste des corrections de
CLAUDE.md, était également erronée. Détail des trois points au §3 du rapport
de clôture du lot 10 (lien « clôture » du lot 10 dans la section « Lots
livrés » ci-dessus).

----

Voir aussi le [[Récapitulatif technique...]], la [[Feuille de route...]],
les [[Limites connues...]] et le [[Registre des facettes]].
```

*(Version intégrale, non tronquée, conservée dans l'historique du wiki à la
révision 1149 — reproduite ici en forme condensée pour la lisibilité du
rapport ; c'est le texte complet, mot pour mot, qui a servi de source à la
vérification de l'étape 1 et au déplacement de l'étape 3.)*

## Contenu d'origine de la feuille de route, avant l'étape 6

```
Cette page recense les chantiers ouverts du Système de Gestion de Données
Techniques (SGDT) : des intentions, pas des faits — non planifiés, sans
échéance. Voir aussi le [[Récapitulatif technique...]] et les [[Limites connues...]].

== Chantiers ==

# Homogénéiser les onglets d'édition. [...]
# Lancer l'optimisation des tables SMW [...]
# Élucider les deux entités non valides [...]
# Lot 9 (plantes) — compatibilité CC BY-SA des sources de données botaniques [...]
#* Règle retenue en attendant l'arbitrage (16 août 2026) [...]
#* Fermée le 16 août 2026 — qui porte la date de plantation. [...]
# Suites du lot 9 [...]
#* 23 dates de plantation à retrouver. [...]
#* 9 taxons à chercher dans les catalogues fournisseurs [...]
#* Les rangs le long de la butte [...]
#* Le choix des photos principales [...]
#* Modèle:Organic facet fitting porte le même défaut [...]

== Lots livrés ==

''Section transitoire. [...] Ne rien y anticiper, ne pas renommer cette page.''

# Lot 10 (procédés et outils) — 29 août 2026. [...] Restent ouverts : deux
  outils sur cinq incomplets faute d'étiquette relevée, et les correctifs
  Module:Base36 n° 1 et n° 3.

----
Page créée le 12 août 2026, sur contrôle de fin de session du 12 août 2026.
```

*(Grep sur le fichier d'origine confirme l'absence de toute syntaxe `::` —
zéro occurrence — donc l'absence de tout `{{#set:}}` : la page ne portait
aucune annotation SMW propre.)*

---

## Étape 1 — Vérification élément par élément

| Élément de la feuille de route | Place vérifiée | Résultat |
|---|---|---|
| Homogénéiser les onglets d'édition | `Lot 24 — Adminsys autonome`, Points ouverts : « Homogénéiser les onglets d'édition, aujourd'hui incohérents d'une classe à l'autre. » | **présent** |
| Lancer l'optimisation des tables SMW | `Lot 24`, Points ouverts : « Lancer l'optimisation des tables de Semantic MediaWiki. » | **présent** |
| Élucider les deux entités non valides | `Lot 24`, Points ouverts : « Élucider les deux entités signalées non valides. » | **présent** |
| Lot 9 — règle CC BY-SA (16 août) | Aucune page ne portait le texte intégral de la règle | **absent avant l'étape 2** — traité à l'étape 2 |
| Lot 9 — clôture de la question date de plantation (16 août) | `Lot 9`, Ce qui est déjà tranché : « La date de plantation est portée par l'exemplaire planté, pas par la planche. » | **présent** |
| Suites du lot 9 — 23 dates, 9 taxons, rangs, photos principales, facette raccord | `Lot 9`, Points ouverts : les cinq items y figurent, reformulés en toutes lettres (« Vingt-trois dates… », « Neuf taxons… ») mais substance identique | **présent, les cinq** |
| Section transitoire lot 10 — outils incomplets | `Lot 10`, Points ouverts : « Un outil reste sans item référencé ni exemplaire physique… » (compte corrigé : un seul, pas deux — écart déjà consigné à la tâche 0 de ce lot) | **présent, en substance corrigée** |
| Section transitoire lot 10 — correctifs `Module:Base36` n° 1 et n° 3 | **Pas dans les points ouverts de `Lot 10` lui-même** | **voir ci-dessous** |

**Sur ce dernier point : aucune ligne de `Lot 10 — Procédés et outils` ne
mentionne `Module:Base36`.** Vérification faite avant de conclure à une
absence : la n° 1 (détection des doublons) est désormais l'objet même de
`Lot 16 — Corrections du module de références` (« détecter les doublons »,
dans son résumé) ; la n° 2 [sic, n° 3 dans la liste de `CLAUDE.md`] reste
suivie dans la table « Corrections sur les modèles » de `CLAUDE.md`, non
affectée par cette restructuration du wiki. Interprétation retenue : ces
deux correctifs ont un « chez eux » — l'un dans un lot, l'autre dans un
registre distinct et toujours vivant — mais aucun des deux ne vit **dans le
texte de `Lot 10`**, contrairement à ce que la lettre stricte de la
consigne d'étape 1 semblait exiger. Le seul élément que la consigne
annonçait comme sans place, la question de licence botanique, a bien été
confirmé sans place avant l'étape 2 — mais ce n'est pas, au sens strict, le
*seul* élément absent des pages de lot. Consigné ici plutôt que traité en
silence ; aucune écriture n'a été bloquée sur ce point, le jugement retenu
étant que `CLAUDE.md` reste le registre faisant foi pour les deux
correctifs `Module:Base36`, indépendamment de la page `Lot 10`.

## Étape 2 — Entrée 43 des *Limites connues*

Ajoutée après la n° 42, résumé
`[Lot 13][Tâche 4] Entrée 43 — compatibilité des sources botaniques avec la licence du wiki`,
`result: Success`, `oldrevid` 1150 → `newrevid` 1230.

## Étape 3 — Note du 29 août déplacée dans `Lot 10`

Nouvelle section `== Ce qui est déjà tranché ==`, insérée avant
`== Points ouverts ==` (`Lot 10` n'a pas de section `Dépendances` : la
consigne du lot précédent la clôturait sans en ouvrir). Les deux occurrences
de « ci-dessus » de la note d'origine ont été adaptées, rien d'autre :
« Les descriptions des lots ''Navigation'' et ''Images'' ci-dessus » devient
« … dans l'index » ; « (lien « clôture » du lot 10 dans la section « Lots
livrés » ci-dessus) » devient « (permalien porté par cette page) » — exact
maintenant, puisque `Work_package_closure_report` figure dans l'infobox en
tête de cette même page `Lot 10`. Résumé
`[Lot 13][Tâche 4] Ce qui est déjà tranché — note de rectification du 29
août déplacée depuis l'ancien index`, `oldrevid` 1193 → `newrevid` 1231.

## Étape 4 — `Gestion des lots` refondue

Contenu remplacé mot pour mot par le texte fourni en consigne. Résumé
`[Lot 13][Tâche 4] Refonte de l'index en requêtes — remplacement du contenu
tenu à la main`, `oldrevid` 1149 → `newrevid` 1232, écrite à
**2026-09-02T12:20:25Z**.

## Étape 5 — Les quatre liens entrants

`list=backlinks` avant correction : cinq pages (les quatre à corriger plus
`Gestion des lots` elle-même, déjà réglée par l'étape 4).

| Page | Ligne d'origine | Ligne corrigée |
|---|---|---|
| `Système de Gestion de Données Techniques orienté matériel libre` | « Voir aussi la [[Feuille de route…]] pour les chantiers ouverts. » | « Voir aussi la [[Gestion des lots]] pour les lots en cours et à venir. » |
| `Procédés et outils` | « Voir aussi le [[Guide de saisie]], la [[Feuille de route…]] et les [[Limites connues…]]. » | « … la [[Gestion des lots]] et les [[Limites connues…]]. » |
| `Guide de saisie` | « Voir aussi [[Procédés et outils]], la [[Feuille de route…]] et les [[Limites connues…]]. » | « … la [[Gestion des lots]] et les [[Limites connues…]]. » |
| `Lot 12 — Contenants et étiquetage` | « Voir aussi la [[Gestion des lots]], la [[Feuille de route…]] et les [[Limites connues…]]. » | « Voir aussi la [[Gestion des lots]] et les [[Limites connues…]]. » (lien redondant retiré plutôt que dupliqué) |

`list=backlinks` après correction, avant l'écriture de la redirection :
**zéro résultat.**

## Étape 6 — La fusion

`Feuille de route du Système de Gestion de Données Techniques` remplacée par
`#REDIRECTION [[Gestion des lots]]` (syntaxe confirmée sur ce wiki par les
sept redirections déjà posées à la tâche 3c). Page **non supprimée**.
Traité en détail dans l'encart d'incident en tête de ce rapport.

---

## Les sept contrôles

**1. `Limites connues` — quarante-trois entrées, les quarante-deux
premières inchangées.** `grep -c "^# "` sur la page relue après écriture :
`43`. Comparaison entrée par entrée contre le texte d'origine (reconstruit
à partir de la lecture faite avant écriture) : **une seule différence, la
quarante-troisième entrée ajoutée** ; les quarante-deux premières
identiques. Une première comparaison avait paru montrer un second écart, sur
l'entrée 24 (un tiret cadratin remplacé par une virgule) — **c'était une
erreur de retranscription dans le fichier de comparaison reconstruit à la
main pour ce contrôle, pas un écart réel sur le wiki** : l'édition réelle
avait été faite par l'outil `Edit`, qui exige une correspondance exacte de
l'ancien texte et ne peut donc pas avoir touché à une ligne qu'il ne
référençait pas. Repéré en comparant les deux fichiers plutôt qu'en faisant
confiance à la copie retapée — l'écart aurait sinon été signalé à tort
comme une altération de contenu.

**2. `action=parse` sur `Gestion des lots` — lignes rendues par section.**

| Section | Lignes de tableau |
|---|---|
| En cours | 1 (`Lot 13`, seul statut `ouvert` — le lot en cours d'exécution lui-même) |
| Faits | 10 |
| À venir | 15 |
| Abandonnés | 0 |
| **Somme** | **26** |

**3. Le contrôle qui tranche : la somme fait vingt-six, exactement le
compte de `Catégorie:Lot`.** Rien ne manque, aucun lot à identifier comme
absent d'une des quatre sections.

**4. `format=count` en wikitexte.** Bloc `Compte` relevé après rendu :
`Lots au total : 26`, `En cours : 1`, `Faits : 10`, `À venir : 15`,
`Abandonnés : 0`. Tous des nombres, aucun zéro à tort (le seul zéro,
« Abandonnés », est un vrai zéro — aucun lot n'a ce statut). Le chemin
`action=ask` de l'API, documenté comme rendant `0` à tort (entrée 43 de
*Limites connues*, elle-même numérotée avant l'ajout de ce jour), n'a pas
été sollicité ici : c'est précisément pour cette raison que le compte est
posé en dur sur la page plutôt que recalculé par un appel externe.

**5. Colonne `Documents` de la section `Faits`.** Extraite du rendu HTML,
lien par lien :

| Lot | Liens |
|---|---|
| 1, 2, 3, 5, 8, 9, 10, 11 | 1 chacun |
| **4** | **2** |
| **6** | **2** |

Conforme à l'attendu : deux permaliens (deux rapports) pour les lots 4 et 6,
un seul pour les huit autres — dix lignes au total, comme relevé au
contrôle 2.

**6. `action=query&prop=info` sur la feuille de route.** `pageid: 194`,
aucune clé `missing`, `redirect: true`. La page existe et est bien une
redirection.

**7. Horodatage.** `Gestion des lots` écrite à **2026-09-02T12:20:25Z**
(`newtimestamp` de la réponse d'écriture). Lecture de contrôle
(`action=parse` servant aux contrôles 2 à 5) effectuée à
**2026-09-02T12:24:50Z**. Délai mesuré : **4 minutes 25 secondes**, sans
qu'aucun signe de figement de rendu ne soit apparu sur cette page — à
comparer, à la tâche suivante, aux cas de cache figé rencontrés à la tâche
3d sur des pages plus anciennes.

---

## Écarts et surprises

**1. L'incident de séquencement sur l'étape 6 est le fait le plus
important de cette tâche.** Le message d'arrêt de Cyril est arrivé après
que l'écriture avait déjà réussi, dans le même lot de résultats d'outils —
rien d'anormal dans l'outillage, mais un rappel que « s'arrêter avant
d'écrire » suppose que la fenêtre pour s'arrêter existe encore au moment où
le message part. Les trois vérifications demandées ont toutes confirmé que
l'écriture était correcte, mais l'ordre dans lequel je les ai moi-même
menées était fautif : `list=backlinks` avait bien été vérifié *avant*
d'écrire, mais l'absence d'annotation sémantique sur la page ne l'a été
qu'*après*. Une lecture complète du wikitexte avait eu lieu avant
l'écriture et ne contenait aucun `::`, ce qui aurait dû suffire à répondre
à la question sans attendre — je ne l'ai pas formulé comme un contrôle
explicite au moment voulu.

**2. Le point de l'étape 1 sur les correctifs `Module:Base36` n'est pas
aussi net que l'annonçait la consigne.** Celle-ci affirmait qu'un seul
élément de la feuille de route restait sans place (la question de licence
botanique). En vérifiant point par point, la mention « correctifs
`Module:Base36` n° 1 et n° 3 » de la section transitoire ne figure nulle
part dans les points ouverts de `Lot 10`. Elle n'est pas perdue pour
autant : la n° 1 est devenue l'objet de `Lot 16`, et la n° 3 reste suivie
dans la table dédiée de `CLAUDE.md`, distincte du système de pages de lot.
Traité comme couvert, pas comme un blocage — mais signalé plutôt que passé
sous silence, conformément à la règle du lot sur les affirmations à ne pas
prendre pour argent comptant.

**3. La retranscription manuelle du contenu d'origine de `Limites connues`,
faite pour comparer avant/après, contenait elle-même une erreur (un tiret
cadratin devenu une virgule sur l'entrée 24).** Sans conséquence sur
l'écriture réelle — confirmée correcte par ailleurs — mais un rappel direct
de la leçon déjà consignée dans `CLAUDE.md` : une convention ou un contenu
retapé de mémoire ne fait pas foi, seule la comparaison contre l'état réel
tranche. C'est cette comparaison, et non la confiance dans la retranscription,
qui a débusqué l'écart.

**4. Aucun autre écart.** Les quatre pages de renvoi, la note déplacée, la
nouvelle page d'index et l'entrée 43 sont tous conformes à la consigne, et
les sept contrôles sont positifs sans réserve autre que celles ci-dessus.
