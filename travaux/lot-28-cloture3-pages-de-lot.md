# Lot 28 — Clôture 3 : quatre trouvailles rangées sur les pages de lot

## Révisions et tailles

| Page | Révision avant | Taille avant | Révision après | Taille après |
|---|---|---|---|---|
| Lot 28 — Échange de données avec un partenaire | 1309 | 8722 octets | 1315 | 9875 octets |
| Lot 10 — Procédés et outils | 1231 | 2252 octets | 1316 | 2715 octets |
| Lot 8 — Facettes de type d'item | 1191 | 434 octets | 1317 | 715 octets |
| Lot 27 — Conduite du projet | 1254 | 1757 octets | 1318 | 2586 octets |

Toutes les valeurs de départ annoncées dans la consigne se sont vérifiées.
Chaque ancre, sur chacune des quatre pages, n'apparaissait qu'une seule fois
avant écriture. Les quatre pages ont été traitées dans l'ordre donné, sans
qu'aucune n'échoue.

## Diff intégral — Lot 28

```diff
33a34,35
> '''La release 2 est atteignable, contrairement à ce que le dépôt enregistre.''' Le texte normatif est servi en markdown par <code>raw.githubusercontent.com</code>, domaine autorisé depuis l'environnement d'exécution, dans le dépôt <code>iop-alliance/open-knowledge-framework</code> — alors que le rapport de la tâche 0 du [[Lot 10 — Procédés et outils|lot 10]] conclut à son inaccessibilité sur un HTTP 403 obtenu ailleurs. Deux réserves, mesurées le 6 septembre 2026 : la spécification ne fournit aucun nom de champ, sa section 3.9 en annonçant pourtant un par propriété — le mot n'y apparaît qu'une fois, dans cette annonce même ; et ses deux rendus divergent, celui de PubPub étant complet quand l'export markdown est tronqué de sa dernière propriété et de sa section de gouvernance. Un alignement nom à nom sur OKW est donc impossible, et non seulement difficile.
>
58c60
< La compatibilité des licences sera mise à l'épreuve pour la première fois. L'entrée 43 des [[Limites connues du Système de Gestion de Données Techniques|Limites connues]] pose une règle de travail — un fait isolé n'est pas protégeable, une description rédigée l'est — qui n'a jamais servi. Si un partenaire publie sous une licence incompatible, ses descriptions ne peuvent pas être reprises ici.
---
> La compatibilité des licences sera mise à l'épreuve pour la première fois. L'entrée 43 des [[Limites connues du Système de Gestion de Données Techniques|Limites connues]] pose une règle de travail — un fait isolé n'est pas protégeable, une description rédigée l'est — qui n'a jamais servi. Reformulé le 8 septembre 2026 : le partenaire ne publie plus, il envoie, et c'est Ecolibre qui rédige les fiches à partir de ses faits — ce qui écarte l'essentiel du risque. Il demeure sur ce que le partenaire transmet lui-même de rédigé, une description ou une notice, dont la licence n'est pas connue et qui ne peut pas être reprise telle quelle.
```

## Diff intégral — Lot 10

```diff
26c26,28
< Deux points signalés à la clôture sont fermés, vérifié le 2 septembre 2026 : les deux pages de test ont été supprimées, et la puissance nominale de la machine à souder par points est renseignée.
\ Pas de fin de ligne à la fin du fichier
---
> Deux points signalés à la clôture sont fermés, vérifié le 2 septembre 2026 : les deux pages de test ont été supprimées, et la puissance nominale de la machine à souder par points est renseignée.
>
> Le rapport de la tâche 0 de ce lot conclut que la spécification normative d'Open Know-Where est hors de portée, sur un HTTP 403. Elle est atteignable : mesuré le 6 septembre 2026 pendant le lot 28, le dépôt <code>iop-alliance/open-knowledge-framework</code> la sert en markdown depuis <code>raw.githubusercontent.com</code>, domaine autorisé. Le rapport n'est pas corrigé — c'est un procès-verbal — mais quiconque s'y fierait renoncerait pour rien.
\ Pas de fin de ligne à la fin du fichier
```

## Diff intégral — Lot 8

```diff
8c8,12
< }}
\ Pas de fin de ligne à la fin du fichier
---
> }}
>
> == Points ouverts ==
>
> La page [[Ajouter une facette]] est rangée dans <code>Catégorie:Facette</code> : elle apparaît donc dans la liste du [[Registre des facettes]] comme si elle en était une, alors que c'est un mode d'emploi. Constaté le 8 septembre 2026 pendant le lot 28.
\ Pas de fin de ligne à la fin du fichier
```

## Diff intégral — Lot 27

```diff
23a24,27
> Ce lot attend la livraison du lot 28, et sa page ne le dit pas : ses dépendances portent « rien en amont ». Le motif est que son texte public et la page publique du lot 28 s'adressent au même lecteur — une structure partenaire — et se contrediraient s'ils étaient écrits séparément. Le [[Lot 28 — Échange de données avec un partenaire|lot 28]] a été livré le 8 septembre 2026.
>
> Trois de ses rapports ne sont pas dans le dépôt public : ceux des tâches 2, 4 et 6, présents sur la machine et jamais commités. Celui de la tâche 3 n'apparaît nulle part, ni versionné ni dans l'inventaire des fichiers non suivis relevé le 8 septembre 2026. Le paragraphe 2 de la [[Procédure de clôture d'un lot]] porte sur les fichiers du lot présents dans le dépôt : la clôture de ce lot passerait à côté d'eux.
>
```

Sur les quatre pages, les diffs sont exactement ceux annoncés par la consigne.
Aucune autre différence, sur aucune des quatre.

## Résultat des sept vérifications

1. **Diffs intégraux** : ci-dessus, sur les quatre pages. Conformes à
   l'attendu.
2. **Tailles après écriture** (`prop=revisions&rvprop=size`) : Lot 28 =
   9875 octets (revid 1315), Lot 10 = 2715 octets (revid 1316), Lot 8 =
   715 octets (revid 1317), Lot 27 = 2586 octets (revid 1318). Les quatre
   conformes.
3. **Faits stockés** (`browsebysubject`) : les paramètres de modèle sont
   intacts sur les quatre pages.
   - Lot 28 : `Work_package_status` = « livré » (inchangé).
   - Lot 27 : `Work_package_status` = « ouvert » (inchangé).
   - Lot 10 : `Work_package_status` = « livré », avec son
     `Work_package_closure_report` intact.
   - Lot 8 : `Work_package_status` = « livré », avec son
     `Work_package_closure_report` intact.

   Aucun paramètre n'a changé de valeur sur aucune des quatre pages.
4. **Rendu de la page du lot 8** : la section « Points ouverts » apparaît.
   Les deux liens rendent :
   `<a href="/wiki/Ajouter_une_facette" title="Ajouter une facette">` et
   `<a href="/wiki/Registre_des_facettes" title="Registre des facettes">` —
   ni l'un ni l'autre ne porte `class="new"`. Conforme.
5. **Rendu de la page du lot 27** : la section « Points ouverts » (H2 réel,
   pas une occurrence de la table des matières) compte exactement **trois**
   paragraphes — l'ancre d'origine, puis les deux paragraphes insérés — et
   « == Dépendances == » vient immédiatement après, sans rien entre les
   deux. Conforme.
6. **Index « Gestion des lots »** (`action=parse&prop=text`) : comptes
   inchangés, « En cours : 1 », « Faits : 12 », « À venir : 15 », total 28.
   Conforme.
7. **Faits `_ERRC` sur le wiki** (`action=ask&query=[[_ERRC::+]]`) : zéro
   résultat. Conforme.

## Écarts et surprises

Aucun. Toutes les affirmations du contexte et de la consigne (révisions,
tailles avant et après sur les quatre pages, forme des diffs, absence de
saut de ligne final aux trois ancres qui n'en portaient pas, comptes de
l'index, état des propriétés) se sont vérifiées telles quelles à la mesure.

Seule note méthodologique : une première tentative de lecture du rendu de
« Gestion des lots » via `action=parse&titles=...` a échoué silencieusement
en ne renvoyant qu'un message d'avertissement (« Unrecognized parameter:
titles ») lors de la vérification de la page du lot 8 — corrigé en
utilisant `page=` au lieu de `titles=`, le paramètre attendu par
`action=parse`. Sans conséquence sur le résultat, simplement noté ici parce
que la sortie vide initiale aurait pu être prise à tort pour une absence de
contenu.
