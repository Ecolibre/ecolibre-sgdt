# Rangs de plantation en erreur — 4-6 septembre 2026

## 1. Ce qui est établi (avant toute correction)

Les trois pages en erreur de traitement SMW depuis le 4 septembre, et la
valeur telle que tapée dans `Planting_rank` :

| Page | Valeur tapée | Message SMW (`_ERRT`) |
|---|---|---|
| Capucine tubéreuse — Le Buisson de Cerzat (ECL-0006) | `53,1 54,3` | `smw-datavalue-number-textnotallowed`, reste non consommé `,3`, nombre retenu `53.154` |
| Fraisier X — Le Buisson de Cerzat (ECL-0014) | `58,3 à 58,8` | reste non consommé `à58,8`, nombre retenu `58.3` |
| Helianthi — Le Buisson de Cerzat (ECL-0020) | `48,7 + 49,2` | reste non consommé `+49,2`, nombre retenu `48.7` |

**Ce n'est pas le piège virgule/point pressenti.** Aucune des trois valeurs
ne contient de point décimal — la virgule est déjà là, correctement, dans
les deux nombres de chacune. Les trois champs contiennent en réalité **deux
valeurs numériques** (un début et une fin de rang), séparées par un espace,
le mot « à », ou un signe « + ». SMW a essayé de lire le champ comme un
nombre unique : il consomme le premier nombre puis échoue sur le reste, d'où
`smw-datavalue-number-textnotallowed`.

**Conformément à la consigne, j'arrête ici sans corriger.** Remplacer un
point par une virgule n'a pas de sens sur ces trois valeurs — il n'y a pas
de point à remplacer, et la correction à faire n'est pas une réécriture de
syntaxe mais un choix de contenu (quelle valeur va dans `Planting_rank`,
quelle valeur va dans `Planting_rank_end`) que je ne dois pas trancher seul.

### Constat annexe, non demandé mais découvert en creusant la cause

Égopode — Le Buisson de Cerzat (ECL-0013), saisi le même jour, porte
`Planting_rank=49,6 51` et **ne remonte aucune erreur**. Ce n'est pas parce
que la saisie est correcte : par un hasard de format, la chaîne concaténée
sans l'espace ne contient qu'**une seule virgule** (`49,651`), ce que SMW
lit comme un nombre valide — 49,651 — au lieu des deux valeurs 49,6 et 51
qui étaient probablement voulues. **Cette page n'est pas en erreur, mais sa
valeur stockée est très probablement fausse, silencieusement.** Elle
n'était pas dans la liste des trois signalées ; je ne l'ai pas corrigée. À
vérifier par Cyril au même titre que les trois autres.

## 2., 3., 4. Correction, vérification, tooltip — non exécutées

Ces trois étapes de la consigne supposaient la cause virgule/point. Le
constat du point 1 change la nature de l'action à faire : il ne s'agit pas
de corriger l'écriture d'une valeur, mais de décider comment répartir deux
valeurs entre `Planting_rank` et `Planting_rank_end` sur quatre pages
(les trois en erreur + Égopode). Je n'ai rien écrit sur le wiki au-delà des
lectures ci-dessus.

L'infobulle sur le séparateur décimal (point rejeté, virgule attendue)
reste pertinente pour `Planting_rank`/`Planting_rank_end` dans l'absolu,
mais son absence n'est pas la cause de ces quatre échecs — je ne l'ajoute
donc pas dans ce lot-ci, en l'absence d'un fait qui le justifie ici. À
reprendre séparément si Cyril le souhaite toujours.

## 5. Observation sur la convention (lot 11), sans conclusion

Le rang se compte en mètres entiers depuis l'origine du lieu, convention du
lot 11. Les quatre valeurs rencontrées (Capucine, Fraisier X, Helianthi,
Égopode) sont toutes des **paires de nombres décimaux** — un début et une
fin de rang, pas un rang ponctuel entier. Ça peut vouloir dire que l'usage
réel sur le terrain est d'occuper une plage de rangs plutôt qu'un rang
unique, ou que la mesure au terrain ne tombe pas sur un mètre entier. Les
deux lectures sont possibles ; je n'en retiens aucune. C'est une décision de
Cyril : soit la convention doit prévoir un couple de bornes (ce que
`Planting_rank_end` semble déjà anticiper, mais que personne n'a encore
rempli sur aucune des 40 plantations), soit la saisie doit être reprise pour
revenir à un rang entier unique.

## À trancher avant toute écriture

1. Pour chacune des quatre pages (Capucine, Fraisier X, Helianthi,
   Égopode) : quelle valeur va dans `Planting_rank`, quelle valeur va dans
   `Planting_rank_end` ?
2. Le format d'entrée à corriger dans le formulaire n'est pas le séparateur
   décimal mais l'unicité de la valeur par champ — un champ, un nombre.
3. Une fois la règle fixée, corriger les quatre pages une par une, puis
   relire (`browsebysubject`) pour confirmer que `_ERRC` disparaît sur les
   trois en erreur et que la valeur d'Égopode n'est plus 49,651.
