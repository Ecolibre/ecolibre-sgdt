# Lot 21, tâche 8 — La barrière

Session du 5 octobre 2026 en heure locale. Les horodatages du wiki sont en
UTC, le 4 octobre 2026, entre 23 h 43 et 23 h 46.

**Verdict : cas A, constaté au tour 1.** La propriété neuve `Test lot21c
débit` est résolue en `_qty` à l'exécution et accepte une écriture
(`nochange`), dans le même tour que le témoin `Max thickness`, résolu en
`_num`. La panne est locale aux six propriétés Test lot21b : ce wiki sait
toujours déclarer une propriété neuve.

Le compte `[[_ERRC::+]]` est de 0. Aucun sujet de production n'y figure.

## Étape 0 — État du dépôt

- `git status --porcelain` : sortie vide.
- `travaux/lot-21-tache8-barriere.md` : « No such file or directory ».
- `.claude/settings.local.json` vérifié au début et à la fin :
  `{"permissions": {"allow": [], "deny": []}}`. Aucune règle.

## Étape 1 — Tentative unique sur le témoin

`bin/wiki-login.sh` : `Success Cywil`.

`ls pages/Lot21b_essai_*_v2.txt` trouve sept fichiers : `03_debit_v2`,
`04_puissance_v2`, `05_temperature_v2`, `06_tolerance_temp_v2`,
`07_ecart_temperature_v2`, `08_libelle_v2` et `13_pompe_v2`.
`pages/Lot21b_essai_08_libelle_v2.txt` existe.

J'ai écrit `Attribut:Test lot21b libellé` à partir de ce fichier, avec le
résumé `[Lot 21][Tâche 8] Tentative unique pour savoir si le verrou de
propagation se lève seul`. L'écriture a eu lieu vers 23:43:50 UTC ; la
commande suivante affichait `Sun Oct  4 23:43:53 UTC 2026`.

Réponse exacte de l'API, avec une sortie 1 :

```
ERREUR API: smw-change-propagation-protection — This page is locked to prevent accidental data modification while a [https://www.semantic-mediawiki.org/wiki/Change_propagation change propagation] update is run. The process may take a moment before the page is unlocked as it depends on the size and frequency of the [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Job_queue job queue] scheduler.
{
    "error": {
        "code": "smw-change-propagation-protection",
        "info": "This page is locked to prevent accidental data modification while a [https://www.semantic-mediawiki.org/wiki/Change_propagation change propagation] update is run. The process may take a moment before the page is unlocked as it depends on the size and frequency of the [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Job_queue job queue] scheduler.",
        ...
    }
}
```

C'est un refus. Je n'ai fait aucune autre tentative.

## Étape 2 — Création de la propriété d'essai

- `pages/Lot21c_essai_01_debit.txt` a été écrit d'après le bloc de la
  consigne.
- `Attribut:Test lot21c débit` rendait `"missing": true`.
- Création avec `--createonly` et le résumé `[Lot 21][Tâche 8] Propriété
  d'essai créée seule` :
  - `"new": true`
  - `"result": "Success"`
  - **pageid 587**
  - **révision 1440**
  - horodatage **2026-10-04T23:44:00Z**

Rien d'autre n'a été créé.

## Étape 3 — Tours

| Tour | Attente | typeid de Test lot21c débit | typeid de Max thickness | Écriture de contrôle |
|---|---|---|---|---|
| 1 | `bin/wiki-wait-jobs.sh` : cinq fois `jobs=3`, puis `FILE FIGEE a 3 travaux`, sortie 2. Ensuite une pause de 60 s, voir « Écarts » point 1. Lecture à 23:45:25 UTC. | `_qty` | `_num` | `"result": "Success"`, `"nochange": true`, sortie 0 |

Les deux volets ont réussi au tour 1. J'ai donc arrêté les tours.

Le volet 1 est passé par `bin/wiki-api.sh`, avec la chaîne encodée à la
main : `%5B`, `%5D`, `%7C`, `%2B` et `%20`. Les accents sont passés tels
quels. Le recours à `curl` n'a pas été nécessaire.

Les `printrequests` rendus, recopiés tels quels :

```
Test lot21c débit :
[{"label":"","key":"","redi":"","typeid":"_wpg","mode":2,"format":false},{"label":"Test lot21c débit","key":"Test_lot21c_débit","redi":"","typeid":"_qty","mode":1,"format":""}]
results : []

Max thickness :
[{"label":"","key":"","redi":"","typeid":"_wpg","mode":2,"format":false},{"label":"Max thickness","key":"Max_thickness","redi":"","typeid":"_num","mode":1,"format":""}]
```

L'entrée au label vide est la colonne du sujet. Elle vaut `_wpg` dans les
deux requêtes, et ce n'est pas elle qu'on lit.

## Étape 4 — Verdict

**Cas A, constaté au tour 1.** La panne est locale aux six propriétés
Test lot21b, et le wiki sait toujours déclarer une propriété neuve.

**L'hypothèse de la consigne est contredite.** Elle supposait que la
suppression de 00 h 12 avait laissé la propagation dans un état inachevé,
et que toute propriété créée depuis en hériterait. La propriété créée à
23:44 ne porte pas ce défaut.

## Vérifications

**a. Celle qui tranche.** C'est le tour 1 : `_qty` pour la propriété
d'essai, `_num` pour le témoin `Max thickness` dans la même lecture, puis
`nochange` pour l'écriture de contrôle.

**b. Contenu.** `bin/wiki-verify.sh "Attribut:Test lot21c débit"
pages/Lot21c_essai_01_debit.txt` rend `IDENTIQUE`, sortie 0. L'étape 1
ayant été refusée, il n'y a pas de vérification sur `Test lot21b libellé`.

**c. Erreurs.** Le compte est de **0**, avec les deux mesures :
- `action=ask` sur `[[_ERRC::+]]`, `limit=500` : `[]` ;
- rendu en ligne, `#ask` en `format=list` et `format=count` :
  `AUCUN RESULTAT 0`.

**d. Faits de la propriété d'essai** (`--facts`, après le tour 1) :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : une seule propriété, créée seule, pour savoir si ce wiki peut encore déclarer le type d'une propriété neuve. Ne pas supprimer sans consigne."]
_CONV -> ['1 m³/s, m3/s', '3600 m³/h, m3/h', '3600000 L/h, l/h']
_MDAT -> ['1/2026/10/4/23/44/0/0']
_SKEY -> ['Test lot21c débit']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['L/h, m³/h, m³/s']
```

- `_TYPE` vaut `#_qty`. `_CONV` porte trois déclarations. `_UNIT` vaut
  `L/h, m³/h, m³/s`.
- **`_CHGPRO` est absent.**
- **Ces faits concordent avec le typeid du volet 1** : `_qty` des deux
  côtés.

## Écarts et surprises

1. **Le `sleep 60` au premier plan est bloqué par l'environnement Claude
   Code.** Le message était : « Blocked: sleep 60 followed by: date -u. To
   wait for a condition, use Monitor… ». J'ai donc lancé `sleep 60` en
   arrière-plan et attendu sa notification de fin avant le volet 1 : la
   pause de 60 s a bien eu lieu.

   Par erreur, j'ai aussi lancé un second `sleep 55` en arrière-plan,
   décrit « Placeholder ». Il n'a rien fait d'autre qu'attendre et n'a
   touché ni le wiki ni le dépôt.

   À retenir pour les consignes : la commande `sleep` seule ne marche pas
   au premier plan dans cet environnement.

2. **La propriété neuve n'est pas analysée au moment de sa création comme
   l'avaient été les onze pages de la tâche 6.** Après la création et un
   seul `bin/wiki-wait-jobs.sh`, `--facts` montre déjà `_TYPE` en fait
   direct et aucun `_CHGPRO`. Les six propriétés de la tâche 6, elles,
   n'avaient porté au premier passage que `_CHGPRO` et `_SKEY`.

   Je ne sais pas si cette différence vient du fait que la propriété a été
   créée seule, et non au milieu d'une rafale de onze créations. Le moment
   du relevé diffère aussi : environ 1 min 30 après la création, contre
   environ 1 min à la tâche 6.

3. **Lecture comparative hors consigne, en lecture seule.** Avec la même
   requête `action=ask`, `Test lot21b libellé` rend toujours `typeid`
   `_wpg` (`{"label":"Test lot21b libellé",…,"typeid":"_wpg",…}`). Cela
   confirme la mesure de 23 h 38 citée par la consigne, dans le même
   intervalle que la mesure qui fonde le verdict.

4. **La tentative unique de l'étape 1, à 23:43:50, a été refusée.**
   Le verrou avait été rencontré pour la première fois à la tâche 7, vers
   23:35, soit environ huit minutes plus tôt. Un délai aussi court ne dit
   donc presque rien de la capacité du verrou à se lever seul.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

**A.** *Contexte* : la panne est locale aux six propriétés Test lot21b.
Elles sont résolues en `_wpg` et verrouillées en propagation. Une
propriété créée seule fonctionne. *Question* : que faire des six
propriétés bloquées ? *Suggestion* : les laisser en place, non blanchies,
comme témoins, et ouvrir une entrée dans `demandes-adminsys.md` pour que
fuzzy examine l'état de propagation de ces six propriétés, sur le modèle
des quinze verrous orphelins du 16 août 2026. Les questions 3a, 4, 5 et 6
seraient reprises dans un troisième bac à sable, avec des propriétés
créées une à une, chacune contrôlée par les deux volets de cette tâche
avant la création de la page d'item.

**B.** *Contexte* : le blocage du `sleep` au premier plan est un fait de
l'environnement, absent de `CLAUDE.md`. *Question* : faut-il l'ajouter aux
leçons d'outillage ? *Suggestion* : oui, une ligne près de la règle sur
les boucles d'attente. Pour une pause fixe, utiliser `sleep` en
arrière-plan, ou `bin/wiki-wait-jobs.sh` quand il s'agit d'attendre la
file.
