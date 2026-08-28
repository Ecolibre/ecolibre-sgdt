# Test du double renommage — 27 août 2026

Contexte : la tâche 0 du 20 août n'avait mesuré qu'un renommage simple.
MediaWiki ne suit pas les redirections en chaîne (A → B → C) par défaut ;
la décision 1.3 du cadrage annonce des redécoupages fréquents, donc ce cas
arrivera en production. Ce test le mesure pour la première fois, en bac à
sable exclusivement.

Aucune écriture en production. Les deux renommages ont été faits par
Cyril via l'interface, à ma demande — `bin/wiki-api.sh` blackliste `move`
et je n'ai fabriqué aucun `curl` d'écriture.

**Rapport factuel : mesures brutes, aucune conclusion tirée ci-dessous
sauf la question posée explicitement en fin de document.**

## Mise en place

Deux pages créées en `createonly=1` :

- `Utilisateur:Cywil/Bac à sable/Dbl cible`
  → contenu : `Page de test double renommage, supprimable.`
- `Utilisateur:Cywil/Bac à sable/Dbl item`
  → contenu :
    ```
    Page de test double renommage, supprimable.
    {{#set:Located_at=Utilisateur:Cywil/Bac à sable/Dbl cible}}
    ```

### État de référence (avant tout renommage)

- `browsebysubject` sur *Dbl item* :
  `Located_at -> ['Cywil/Bac_à_sable/Dbl_cible#2##']` — conforme.
- `ask [[Located_at::…/Dbl cible]]` : 1 résultat, *Dbl item* — conforme.

Mise en place validée, passage au premier renommage.

## Premier renommage

Fait par Cyril : `Dbl cible` → `Dbl cible b`, **redirection laissée**.

*Dbl item* purgée ensuite. La file de travaux ne s'est pas vidée :
`bin/wiki-wait-jobs.sh` a mesuré **6 travaux en attente**, stable sur 5
essais (« file figée »). Les mesures ci-dessous ont été prises malgré
cela.

| # | Requête | Résultat brut |
|---|---|---|
| Q1 | `ask [[Located_at::…/Dbl cible b]]` | count=1, *Dbl item* — hash `17490d7d…d984a` |
| Q2 | `ask [[Located_at::…/Dbl cible]]` (ancien nom) | count=1, *Dbl item* — **même hash** `17490d7d…d984a` |
| Q3 | `browsebysubject` sur *Dbl item* | `Located_at -> ['Cywil/Bac_à_sable/Dbl_cible_b#2##']` |

Q1 et Q2 renvoient toutes deux 1 résultat, avec un hash de requête
identique entre elles — et identique à celui mesuré en état de référence
avant renommage.

## Second renommage

Fait par Cyril : `Dbl cible b` → `Dbl cible c`, **redirection laissée**.
La première redirection (`Dbl cible` → `Dbl cible b`) n'a pas été
touchée.

*Dbl item* purgée ensuite. File de travaux à nouveau figée :
**9 travaux en attente**, stable sur 5 essais.

| # | Requête | Résultat brut |
|---|---|---|
| Q1 | `ask [[Located_at::…/Dbl cible c]]` | count=1, *Dbl item* — hash `17490d7d…d984a` |
| Q2 | `ask [[Located_at::…/Dbl cible b]]` | count=1, *Dbl item* — **même hash** |
| Q3 | `ask [[Located_at::…/Dbl cible]]` (nom d'origine, chaîne complète) | count=1, *Dbl item* — **même hash** |
| Q4 | `browsebysubject` sur *Dbl item* | `Located_at -> ['Cywil/Bac_à_sable/Dbl_cible_c#2##']` |
| Q5 | `list=querypage&qppage=DoubleRedirects` | 1 résultat : `Utilisateur:Cywil/Bac à sable/Dbl cible` → `Dbl cible b` → `Dbl cible c` (colonnes `b_title`/`c_title` de la page spéciale) |

Les trois requêtes `ask` (Q1, Q2, Q3) renvoient chacune count=1 pour les
trois noms — origine, intermédiaire, final — avec le même hash de requête
que dans tous les relevés précédents de ce test.

Le littéral stocké après le second renommage (Q4) porte
**« Dbl cible c »** — le nom final, pas l'intermédiaire.

`Special:DoubleRedirects` (Q5) répertorie la chaîne : elle voit bien les
deux redirections mises bout à bout et identifie `Dbl cible` comme
double-redirigeant vers `Dbl cible c` via `Dbl cible b`.

## Question posée en tête de tâche

*« Le littéral stocké après le second renommage : porte-t-il "Dbl cible
c" (chaîne suivie), ou reste-t-il sur "Dbl cible b" (annotation cassée) ? »*

Réponse à la mesure directe (Q4) : **« Dbl cible c »**.

## Pages créées — à supprimer par Cyril, dans cet ordre

1. `Utilisateur:Cywil/Bac à sable/Dbl item`
2. `Utilisateur:Cywil/Bac à sable/Dbl cible` (redirection vers *Dbl cible b*)
3. `Utilisateur:Cywil/Bac à sable/Dbl cible b` (redirection vers *Dbl cible c*)
4. `Utilisateur:Cywil/Bac à sable/Dbl cible c` (page cible finale)

Aucun blanchiment fait ici — les quatre pages restent en l'état pour que
Cyril les supprime lui-même.
