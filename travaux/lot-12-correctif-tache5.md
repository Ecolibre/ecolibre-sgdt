# Lot 12 — correctif de la tâche 5

Date : 11 octobre 2026.

Les deux phrases relevées par les questions A et B du rapport de la tâche 5
sont corrigées. Deux remplacements, deux éditions, rien d'autre. Les quatre
vérifications sont conformes.

## État du dépôt et règles locales au départ

- `git status` : seul `travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md`
  non suivi, hors compte comme prévu.
- `.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Lectures

`Modèle:Containment audit` (rév. 1519) et `Catégorie:Lieu` (rév. 1522) :
identiques à ce que la tâche 5 avait écrit, au saut de ligne final près, que
le wiki retire. Aucune protection native. Révisions relues inchangées juste
avant l'écriture.

## Mesure avant écriture

Le texte nouveau de l'audit affirme que, par l'API, la même requête « rend une
erreur et aucun résultat ». Mesuré en lecture seule sur la requête même de
l'audit, `action=ask` :

- à cinq sauts, `[[Category:Physical item]][[Contained_in.Contained_in.Contained_in.Contained_in.Contained_in::+]]` :
  un objet `error` (« La condition suivante de la requête n'a pas pu être
  évaluée en raison de restrictions de ce wiki sur la taille ou la profondeur
  de cette requête : `[[Contained in::+]]` »), et aucun bloc `query` ni
  `results` ;
- à quatre sauts, témoin : `results` vide, `count` 0, aucune erreur.

L'affirmation est conforme à la mesure. Ce que la page rend à cinq sauts, le
résultat tronqué suivi de l'avertissement, avait été mesuré en tâche 5 sur la
même requête.

## Prévisualisations

Par `action=parse` en POST, sans sauvegarde (`apercu.py`, script affiché en
tâche 5).

- `Modèle:Containment audit` : la phrase nouvelle apparaît dans la
  documentation ; liens `Administration SGDT` et `Limites connues du Système
  de Gestion de Données Techniques`, tous deux existants ; aucune catégorie ;
  aucune classe d'erreur.
- `Catégorie:Lieu` : le texte rendu ne diffère de l'actuel que par la phrase
  corrigée ; huit liens tous existants ; catégorie `SGDT` seule.

Diffs locaux : pour le modèle, la ligne 10 seule ; pour la catégorie, les
lignes 11 et 12 remplacées par trois lignes.

## Pages écrites

| Page | Résumé | Result | Révision |
|---|---|---|---|
| Modèle:Containment audit | `[Lot 12][Correctif] le dépassement est signalé par un avertissement, pas silencieux` | Success | 1523 (précédente 1519) |
| Catégorie:Lieu | `[Lot 12][Correctif] remettre le motif en accord avec la propriété citée` | Success | 1524 (précédente 1522) |

Codes de sortie 0.

## Vérifications

File : `bin/wiki-wait-jobs.sh` a annoncé « FILE FIGEE a 7 travaux » ; après la
pause de cinq minutes en arrière-plan, « FILE VIDE ». Purge des trois pages
avant relecture, toutes `purged` et `linkupdate`.

1. **Modèle:Containment audit.** Texte rendu de la documentation : « La chaîne
   du second contrôle compte quatre sauts, le maximum admis par cette
   installation. Un cinquième serait refusé : la page rendrait le résultat
   tronqué à quatre sauts, suivi d'un avertissement placé après le résultat
   et facile à manquer. Par l'API, la même requête rend une erreur et aucun
   résultat : les deux ne disent donc pas la même chose. Voir les Limites
   connues du Système de Gestion de Données Techniques . » Le lien est un vrai
   lien : `<a href="/wiki/Limites_connues_du_Syst%C3%A8me_de_Gestion_de_Donn%C3%A9es_Techniques" …>`.
   Le wikitexte relu après écriture ne diffère de celui d'avant que par la
   ligne 10 : le bloc `<includeonly>`, lignes 1 à 9, est intact. Conforme.
2. **Administration SGDT**, section « Audit de la contenance » : « 50
   exemplaires physiques, dont 45 portent un lieu et 2 un contenant. Il en
   reste 3 sans rattachement, dont le lieu n'est donc pas calculable. » ;
   « Exemplaires dépassant la profondeur admise, c'est-à-dire portant au
   moins quatre contenants emboîtés au-dessus d'eux : » ; « Aucun exemplaire
   ne dépasse trois contenants emboîtés. » Le rendu complet de la page est
   identique, caractère pour caractère, à celui relevé après la tâche 5.
   Conforme.
3. **Catégorie:Lieu.** Le diff avec le rendu relevé après la tâche 5 ne
   montre que la phrase corrigée : « s'y rattache par `Located_at`, jamais par
   `Contained_in` : `Contained_in` désigne un autre exemplaire, et un terrain
   est un lieu. Un plant ne se range pas dans son terrain, il s'y trouve. »
   Le reste de la page est inchangé. Conforme.
4. **Erreurs et avertissements** : aucune classe `error`, `warning`,
   `smw-highlighter`, `smwttinline` ni `smw-callout` dans le HTML des trois
   rendus. Recoupé par `bin/wiki-warnings.sh` : « Aucun avertissement. » pour
   les trois pages. Conforme.

Complément, contrôle des pages de documentation : catégories inchangées
(`Administration SGDT` et `Catégorie:Lieu` dans `SGDT`, le modèle dans
aucune) ; aucun lien vers une page inexistante ; `Catégorie:Lieu` porte les
mêmes clés qu'avant (`_MDAT`, `_SKEY`, `_SUBC`).

## Règles locales à la fin

`.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Écarts et surprises

- **`bin/wiki-api.sh` affiche une ligne d'erreur vide pour une erreur de
  requête SMW.** Sur la requête à cinq sauts, il a imprimé « ERREUR API: ? — »,
  sans code ni message, puis le JSON. L'erreur de SMW n'a pas la forme
  `error.code` / `error.info` qu'attend le script : elle arrive en liste sous
  `error.query`. Le JSON qui suit contient le message : rien n'est perdu,
  mais la ligne de synthèse n'apprend rien. Dette d'outillage, non traitée.
- Les observations de la tâche 5 restées hors de ce correctif sont
  inchangées et toujours ouvertes :
  - les guillemets droits du passage 7.2 ;
  - la mention d'`action=browsebysubject` à l'étape « 4. Contrôler » de
    `Catégorie:Lieu` ;
  - l'énumération incomplète de « Le rattachement ne remonte pas l'arbre » ;
  - les rangs `000A` à `003Z` affichés comme libres dans l'audit de la
    banque ECL.
- La file annoncée figée à 7 travaux était vide après la pause.
