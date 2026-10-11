# Lot 12 — tâche 5 sur 5 : page de contrôle et pages de définition

Date : 11 octobre 2026.

Un modèle créé (`Modèle:Containment audit`), trois pages modifiées
(`Administration SGDT`, `Catégorie:Physical item`, `Catégorie:Lieu`). Aucune
donnée ni aucun modèle d'affichage touchés. Les sept vérifications sont
conformes. Un écart de fond : une phrase de la documentation de l'audit est
contredite par une mesure (voir Écarts, et la question A).

## État du dépôt et règles locales au départ

- `git status` : seul `travaux/correctif-2026-10-10-revision-claude-md-et-arret-lots-39-40.md`
  non suivi, hors compte comme prévu.
- `.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Lectures

`CLAUDE.md` ; sur le wiki : `Lot 12 — Contenants et étiquetage` (rév. 1503,
inchangée), `Administration SGDT` (1424), `Modèle:Inventory numbering audit`
(1423), `Catégorie:Physical item` (1384), `Catégorie:Lieu` (1387). Aucune
protection native. `Modèle:Containment audit` absent avant création. Lu en
plus : l'entrée des Limites connues sur la profondeur des chaînes, sur
laquelle s'appuie la documentation de l'audit.

## Mesures avant

Par `action=ask` en liste (longueur de `results`, aucune suite de pagination).

| Mesure | Attendu | Mesuré |
|---|---|---|
| Physical item | 50 | 50 |
| Porteurs de `Located_at` | 45 | 45 |
| Porteurs de `Contained_in` | 2 | 2 |

Complément : aucun exemplaire ne porte à la fois `Located_at` et
`Contained_in`, condition de validité de la soustraction faite par l'audit.

Rendus de `Catégorie:Physical item`, `Catégorie:Lieu` et
`Administration SGDT` relevés après purge et enregistrés en texte, pour la
comparaison d'après. État sémantique de départ : `Catégorie:Physical item` porte
`_MDAT`, `_SKEY`, `_SUBC` (Item SGDT) ; `Catégorie:Lieu` porte `_MDAT`, `_SKEY`,
`_SUBC` (SGDT) ; `Administration SGDT` porte `_ASK`, `_INST` (SGDT), `_MDAT`,
`_SKEY`. Aucun lien vers une page inexistante sur les trois.

## Prévisualisations

Toutes par `action=parse` en POST, sans sauvegarde ni cookie, par deux scripts
du scratchpad affichés avant exécution : `preview.py` pour le bloc
`<includeonly>` du modèle, `apercu.py` pour une page entière (texte, liens et
existence, catégories).

- Audit, rendu dans le contexte d'`Administration SGDT` : « 50 exemplaires
  physiques, dont 45 portent un lieu et 2 un contenant. Il en reste 3 sans
  rattachement, dont le lieu n'est donc pas calculable. », puis « Aucun
  exemplaire ne dépasse trois contenants emboîtés. » Aucune classe d'erreur.
- Témoin, rendu sans écriture : la même requête de dépassement portée à
  **cinq** sauts. Voir Écarts.
- `Administration SGDT` : la nouvelle section rend comme ci-dessus.
- `Catégorie:Physical item` : section placée avant « Position dans la
  chaîne », six liens tous existants, catégorie `Item_SGDT` seule.
- `Catégorie:Lieu` : le texte rendu ne diffère de l'actuel que par les trois
  passages remplacés ; huit liens tous existants, catégorie `SGDT` seule.

Diffs locaux avant écriture : `Administration SGDT`, quatre lignes ajoutées ;
`Catégorie:Physical item`, dix lignes ajoutées avant la ligne 14 ;
`Catégorie:Lieu`, une ligne changée en 7.1, sept lignes remplacées par huit en
7.2, neuf lignes remplacées par dix-neuf en 7.3. Rien d'autre.

## Pages écrites

| Page | Résumé | Result | Révision |
|---|---|---|---|
| Modèle:Containment audit | `[Lot 12][Tâche 5] audit de la contenance des exemplaires physiques` | Success, création (`--createonly`) | 1519 |
| Administration SGDT | `[Lot 12][Tâche 5] afficher l'audit de la contenance` | Success | 1520 (précédente 1424) |
| Catégorie:Physical item | `[Lot 12][Tâche 5] documenter la règle de contenance sur la catégorie des exemplaires` | Success | 1521 (précédente 1384) |
| Catégorie:Lieu | `[Lot 12][Tâche 5] la contenance passe à Contained_in, règle des trois niveaux et cas de la pile` | Success | 1522 (précédente 1387) |

Codes de sortie 0. Les révisions des trois pages modifiées ont été relues
inchangées juste avant leur écriture. Les trois remplacements de
`Catégorie:Lieu` sont passés en une seule édition (voir Écarts).

## Vérifications

File : `bin/wiki-wait-jobs.sh` a annoncé « FILE FIGEE a 8 travaux » ; après la
pause de cinq minutes en arrière-plan, « FILE VIDE ». Purge des quatre pages
écrites avant toute relecture, toutes `purged` et `linkupdate`.

1. **Administration SGDT**, section « Audit de la contenance », texte rendu :
   « 50 exemplaires physiques, dont 45 portent un lieu et 2 un contenant. Il
   en reste 3 sans rattachement, dont le lieu n'est donc pas calculable. » ;
   « Exemplaires dépassant la profondeur admise, c'est-à-dire portant au moins
   quatre contenants emboîtés au-dessus d'eux : » ; « Aucun exemplaire ne
   dépasse trois contenants emboîtés. » Le diff avec le rendu d'avant ne
   montre que ces quatre lignes ajoutées en fin de page. Conforme.
2. **Catégorie:Physical item.** Le diff avec le rendu d'avant ne montre que la
   nouvelle section, insérée entre « … pas navigation. » et « Position dans
   la chaîne ». Texte rendu : « Lieu et contenance » ; « Un exemplaire porte
   Located_at , qui pointe vers un lieu, ou Contained_in , qui pointe vers un
   autre exemplaire. Jamais les deux : […] » ; « Quand un exemplaire porte un
   contenant, sa fiche calcule son lieu […] par Modèle:Lieu par contenance .
   Rien n'est stocké : […] » ; « Au plus trois contenants emboîtés […] Voir
   les Limites connues du Système de Gestion de Données Techniques . » ;
   « Un contenant est un exemplaire comme un autre […] Voir Catégorie:Lieu . »
   La section porte trois liens, tous vers des pages existantes :
   `Modèle:Lieu par contenance`, `Limites connues du Système de Gestion de
   Données Techniques`, `Catégorie:Lieu`. La page n'a aucun lien vers une
   page inexistante, et sa catégorie reste `Item SGDT` seule. Conforme.
3. **Catégorie:Lieu.** Le diff avec le rendu d'avant ne montre que les trois
   passages :
   - 7.1 : « s'y rattache par `Located_at`, jamais par `Contained_in` : un
     plant n'est pas un » ;
   - 7.2 : « `Located_at` et `Contained_in` ne se confondent pas, et un
     exemplaire porte l'un ou l'autre, jamais les deux. `Contained_in`, champ
     "Rangé dans" du formulaire physique, dit "est physiquement dans" […]
     Quand un exemplaire porte un contenant, sa fiche calcule son lieu en
     remontant la contenance. » ;
   - 7.3 : « Le cas mobile-et-contenant, une conserve, une caisse, un camion,
     reste un item physique. […] Contained_in va du contenu vers le
     contenant : […] », puis les deux paragraphes nouveaux, « Une pile de
     caisses n'est pas un exemplaire : […] Même raison que pour une planche de
     culture. » et « Au plus trois contenants emboîtés […] voir les Limites
     connues du Système de Gestion de Données Techniques . », ce dernier rendu
     en lien (`<a href="/wiki/Limites_connues_du_Syst%C3%A8me_de_Gestion_de_Donn%C3%A9es_Techniques" …>`).

   Plus aucune occurrence de `physical_parent` dans le rendu. Une seule
   occurrence de `Part_of` subsiste : « à la différence de `Part_of` qui est
   multivaluée sur les classes de conception », qui décrit les classes de
   conception et non la classe physique. Les trois `[[` restants du rendu sont
   les exemples échappés par `<nowiki>`, déjà présents avant (trois aussi).
   Conforme.
4. **Erreurs et avertissements** : aucune classe `error`, `warning`,
   `smw-highlighter`, `smwttinline` ni `smw-callout` dans le HTML des trois
   rendus. Ce filtre a montré en tâche 4 qu'il détecte ces classes sur un
   témoin, et il les a encore détectées aujourd'hui sur le témoin à cinq
   sauts. Recoupé par `bin/wiki-warnings.sh` : « Aucun avertissement. » pour
   les trois pages. Conforme.
5. **Modèle:Containment audit** : `prop=categories` vide ; `prop=links` :
   `Administration SGDT` et `Limites connues du Système de Gestion de Données
   Techniques`, toutes deux existantes. Conforme.
6. **Comptes après** : 50 Physical item, 45 porteurs de `Located_at`,
   2 porteurs de `Contained_in`. Inchangés.
7. **Cohérence** : les 3 exemplaires sans rattachement annoncés par l'audit
   sont `Batterie de récupération trotinette 1`, `Bidon 220L Bleu 1` et
   `Bidon 220L Bleu 2`, les trois mêmes qu'en tâche 4. Établi par une requête
   qui affiche `Located_at` et `Contained_in` pour les 50 exemplaires, et non
   par l'audit, qui ne fait que soustraire des comptes. Aucun exemplaire ne
   porte les deux.

Complément au contrôle des pages de documentation prévu par `CLAUDE.md` :
après écriture, `Catégorie:Physical item` et `Catégorie:Lieu` portent les
mêmes clés qu'au départ (`_MDAT`, `_SKEY`, `_SUBC`). `Administration SGDT`
porte aussi les mêmes clés qu'au départ (`_ASK`, `_INST`, `_MDAT`, `_SKEY`).
Aucune catégorie de suivi n'est apparue sur les trois pages.

## Règles locales à la fin

`.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`).

## Écarts et surprises

- **La documentation de l'audit affirme une absence que la mesure dément.**
  Le texte donné, écrit tel quel dans `Modèle:Containment audit`, dit qu'un
  cinquième saut « serait refusé et rendrait le résultat du quatrième sans
  que rien ne le signale ». Le témoin rendu sans écriture aujourd'hui, la
  requête de dépassement de l'audit portée à cinq sauts, rend en table le
  texte de repli **suivi d'un avertissement** : `class="smw-highlighter"` et
  `class="smwtticon warning"`, message « La condition suivante de la requête
  n'a pas pu être évaluée en raison de restrictions de ce wiki sur la taille
  ou la profondeur de cette requête : `[[Contained in::+]]` ». En
  `format=count`, il rend « 0 » suivi du même avertissement. L'entrée des
  Limites connues dit la même chose pour une chaîne en condition : « suivis
  de l'avertissement ». Elle ne range parmi les cas silencieux que la chaîne
  en colonne d'affichage. « Rendrait le résultat du quatrième » n'est pas
  démenti ; ce n'était pas discriminant aujourd'hui, les deux rendant zéro.
  Seul « sans que rien ne le signale » est faux. Je ne l'ai pas corrigé :
  voir la question A.
- **Lien replié remis sur une ligne en 7.3.** Dans la consigne, le lien
  `[[Limites connues du` / `Système de Gestion de Données Techniques]]` était
  coupé par un retour à la ligne. Je l'ai écrit sur une seule ligne, selon la
  leçon de `CLAUDE.md` sur les liens repliés. Le texte n'a pas d'autre
  différence avec la consigne. Le rendu confirme que c'est un vrai lien.
- **Trois remplacements, une édition.** J'ai lu « Résumé pour les trois »
  comme une seule édition portant les trois remplacements (rév. 1522). Si
  trois éditions étaient voulues, elles ne s'annulent plus séparément : il
  faudrait annuler la révision entière.
- **La justification de 7.1 ne suit plus la propriété.** La phrase rendue est
  « Un item physique s'y rattache par `Located_at`, jamais par
  `Contained_in` : un plant n'est pas un composant de son terrain, il s'y
  trouve. » « N'est pas un composant » réfutait une relation de composition,
  `Part_of`. La raison de ne pas employer `Contained_in` est autre :
  `Contained_in` désigne un exemplaire, et un terrain est un lieu. Je ne l'ai
  pas touchée : voir la question B.
- **Guillemets droits en 7.2.** Le passage nouveau emploie `"Rangé dans"`,
  `"est physiquement dans"`, `"se trouve à"`, là où le reste de la page
  emploie les guillemets français « ». Je l'ai recopié tel que donné.
- **Deux passages de `Catégorie:Lieu`, hors des trois remplacements,
  vieillissent.** Je n'y ai pas touché.
  - « Le rattachement ne remonte pas l'arbre » dit qu'une fiche de lieu
    affiche « ses enfants directs, et les items directement rattachés à
    lui ». Depuis la tâche 4, elle affiche aussi les items rangés dans un
    contenant présent. L'affirmation sur les lieux descendants reste vraie,
    l'énumération est incomplète.
  - L'étape « 4. Contrôler » du renommage recommande
    `action=browsebysubject`, module que `CLAUDE.md` déclare déprécié et à ne
    plus employer, au profit de `action=smwbrowse`.
- **L'audit de la banque d'inventaire ECL affiche 104 rangs « libres » de
  `000A` à `003Z`**, sur `Administration SGDT`, juste au-dessus de la section
  ajoutée. C'est une conséquence visible de la banque ECL sans lettres,
  consignée en tâche 3 dans les Limites connues. La note de la page ne
  signale comme exceptions que `ECL-0043` et `CWL-0007`. Cela relève du
  lot 16.
- La file annoncée figée à 8 travaux était vide après la pause : comme
  d'habitude, l'annonce ne prouvait aucune panne.

## Questions

**A.** La documentation de `Modèle:Containment audit` dit qu'un cinquième saut
rendrait le résultat du quatrième « sans que rien ne le signale ». La mesure
d'aujourd'hui et l'entrée des Limites connues montrent un avertissement à la
suite du résultat. Faut-il corriger la phrase ? Suggestion, par une écriture
`[Lot 12][Correctif]` sur la seule section `<noinclude>` : « Un cinquième
serait refusé : la page rendrait le résultat tronqué à quatre sauts, suivi
d'un avertissement discret, facile à manquer. Voir les
[[Limites connues du Système de Gestion de Données Techniques]]. »

**B.** La phrase de `Catégorie:Lieu` issue de 7.1 justifie le refus de
`Contained_in` par « un plant n'est pas un composant de son terrain », motif
qui visait `Part_of`. Faut-il la reprendre ? Suggestion : « Un item physique
s'y rattache par `Located_at`, jamais par `Contained_in` : `Contained_in`
désigne un autre exemplaire, et un terrain est un lieu. Un plant ne se range
pas dans son terrain, il s'y trouve. »
