# Lot 28 — Clôture 2 : garde-fou des Limites connues replacé avant la liste

## Révision et taille

| | Révision | Taille | Entrées « # » |
|---|---|---|---|
| Avant | 1313 | 42798 octets | 51 |
| Après | 1314 | 42974 octets | 51 |

Les trois valeurs de départ (révision 1313, taille 42798 octets, 51 entrées)
correspondaient exactement à celles annoncées. Chaque ancre des deux
opérations n'apparaissait qu'une seule fois dans le fichier avant écriture.

## Diff intégral

```diff
19a20,25
> <!-- Cette liste doit rester la dernière chose de la page.
>      bin/wiki-append.sh ajoute en fin de PAGE, pas en fin de liste :
>      toute section ajoutée après elle ferait atterrir l'ajout hors de la liste.
>      Ce commentaire est placé AVANT la liste et non après : posé en fin de page
>      le 6 septembre 2026, il a été repoussé au milieu de la liste par le premier
>      ajout, le 8 septembre 2026. Ici, il ne bouge plus. -->
67,70d72
< <!-- Cette liste doit rester la dernière chose de la page.
<      bin/wiki-append.sh ajoute en fin de PAGE, pas en fin de liste :
<      toute section ajoutée après elle casserait l'ajout, sans erreur.
<      Réorganisé le 6 septembre 2026 pour cette raison. -->
```

Six lignes ajoutées avant la première entrée (le nouveau commentaire, texte
corrigé), quatre lignes supprimées entre les entrées 47 et 48 (l'ancien
commentaire, à son emplacement erroné). Rien d'autre : aucune des 51 entrées
n'a été touchée.

## Résultat des six vérifications

1. **Diff intégral** : ci-dessus. Conforme à l'attendu.
2. **Taille après écriture** (`prop=revisions&rvprop=size`) : **42974
   octets**, revid 1314. Conforme.
3. **Nombre d'entrées « # »** dans le wikitexte relu : **51**. Conforme —
   aucune entrée perdue ni dupliquée.
4. **Rendu** (`action=parse&prop=text`) : un seul bloc `<ol>` sur toute la
   page, portant exactement **51** `<li>`. Conforme — le retrait du
   commentaire à son ancienne position et son insertion à la nouvelle n'ont
   pas coupé la liste.
5. **Premier et dernier éléments rendus** :
   - premier : « Racine de l'arbre fonctionnel codée en dur. [...] »
   - dernier : « Le recoupement entre lots ne se déclare que d'un côté.
     Work_package_overlaps est posée sur la page qui cite, [...] »

   Les deux correspondent exactement à ce qu'annonçait la consigne.
6. **Faits `_ERRC` sur le wiki** (`action=ask&query=[[_ERRC::+]]`) : zéro
   résultat. Conforme.

## Écarts et surprises

Aucun. Toutes les valeurs annoncées dans le contexte (révision et taille de
départ, nombre d'entrées, taille et forme du diff attendues, taille finale,
premier et dernier élément) se sont vérifiées à la mesure, sans exception. Le
garde-fou est maintenant posé avant la première entrée de la liste, à un
endroit qu'aucun appel futur à `bin/wiki-append.sh` ne peut déplacer — cet
outil n'ajoutant qu'en fin de page, jamais avant elle.
