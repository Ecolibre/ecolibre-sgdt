# Outillage `bin/` — seconde passe : défauts 7 et 1

Fait suite à `outillage-proposition.md` (les sept défauts) et
`outillage-suite.md` (première passe : défauts 2, 3, 4, 5, 6 appliqués).
Cette passe traite le **défaut 7** (helper CSRF, fait) et le **défaut 1**
(`appendtext`, en attente de validation).

---

## Défaut 7 — helper CSRF partagé — FAIT ET COMMITÉ

### Ce qui a été écrit

**`bin/_wiki-csrf.sh`** (nouveau, 57 lignes). Préfixe `_` = interne, jamais
appelé directement. Reçoit le chemin des cookies en `$1`, lit `$WIKI_API`
dans l'environnement (exporté par le script appelant via `set -a; source
.env`). Écrit le jeton seul sur stdout, tout message sur stderr.

Trois cas distincts, trois codes de sortie :

| Code | Cas | Message |
|---|---|---|
| 0 | jeton obtenu | *(rien — le jeton est la seule sortie)* |
| 3 | réseau : API injoignable, HTTP non-2xx, réponse vide ou non-JSON | `API injoignable (transport curl en échec)…` / `HTTP xxx de l'API…` |
| 4 | session expirée (l'API rend le jeton anonyme `+\`) | `session expirée … Relance bin/wiki-login.sh` |

Le `curl` est en `-sS` (sortie d'erreur en cas d'échec transport) avec
`-w '%{http_code}' -o <tmp>` ; le corps passe par un fichier temporaire
nettoyé au `trap EXIT`. Le python de parsing distingue « non-JSON »
(code 3) de « pas de csrftoken dans la réponse » (code 3 aussi, message
distinct).

### Ce qui a changé dans les trois scripts d'écriture

Le bloc recopié à l'identique (`wiki-put.sh` 46-52, `wiki-purge.sh` 41-49,
`wiki-upload.sh` 46-52) est remplacé par une ligne :

```bash
CSRF=$("$DIR/bin/_wiki-csrf.sh" "$C") || exit 1
```

`wiki-purge.sh` ne signe plus la purge (défaut 3, première passe) :
l'appel au helper n'y sert que de **sonde de session** avant la purge —
`>/dev/null || exit 1`, le jeton n'est pas réutilisé. Commentaire du
script mis à jour en ce sens.

### Tests — helper seul

| Cas | Commande | Résultat |
|---|---|---|
| jeton OK | `_wiki-csrf.sh <cookies réels>` | jeton 42 car., **exit 0** |
| session expirée | `_wiki-csrf.sh <cookies vides>` | message session expirée, **exit 4** |
| réseau KO | `WIKI_API=https://127.0.0.1:9/… _wiki-csrf.sh <cookies>` | `curl (7)` + message injoignable, **exit 3** |
| `WIKI_API` absente | `env -u WIKI_API _wiki-csrf.sh <cookies>` | message « variable WIKI_API absente », **exit 1** |

### Tests — les trois scripts après modification (bac à sable)

| Script | Chemin nominal | Chemin d'échec |
|---|---|---|
| `wiki-put.sh` | écriture `Utilisateur:Cywil/Bac à sable` → `result: Success`, revid 1272 ; restauration revid 1273, **exit 0** | `--createonly` sur page existante → `ERREUR API: articleexists`, **exit 1** ; session expirée → message helper, **exit 1** |
| `wiki-purge.sh` | purge du bac à sable → `purged: true, linkupdate: true`, **exit 0** | session expirée (`SGDT_PRIVE` bidon, cookies vides) → message helper, **exit 1** |
| `wiki-upload.sh` | *(pas de téléversement réel — voir note)* | fichier soumis → jeton obtenu, l'API répond `verification-error` (MIME), le contrôle `result != Success` → **exit 1** ; session expirée → message helper, **exit 1** |

**Note `wiki-upload.sh`** : le chemin nominal (téléversement réussi) n'a
pas été exercé — il créerait une vraie page `Fichier:`. Le test soumet un
fichier à l'API : le helper obtient le jeton, l'appel `action=upload`
part signé, l'API le refuse au stade vérification, et le contrôle de
résultat du script sort non nul. La chaîne helper → jeton → appel signé →
contrôle de résultat est donc bien exercée de bout en bout ; seul le
« happy path » exact (fichier accepté) ne l'est pas.

Le bac à sable a été relu après les tests : contenu d'origine restauré
(une ligne).

### Commit

`[Correctif] Outillage bin/ — helper CSRF partagé, garde-fou réseau`
`git show --stat` : **4 fichiers, +64 −23** (`_wiki-csrf.sh` +57,
`wiki-purge.sh` +5 −9, `wiki-put.sh` +1 −7, `wiki-upload.sh` +1 −7).
Commit `d3edbf2`, poussé sur `origin/main`.

---

## Défaut 1 — `appendtext` — EN ATTENTE DE VALIDATION

### Point 1 — réorganisation de *Limites connues* — PROPOSÉE, PAS ÉCRITE

`appendtext` écrit en fin de **page**, pas en fin de **liste**. Or la
page se termine par un `----` et une ligne de provenance *après* la liste
numérotée. Un `# nouvelle entrée` ajouté à la fin atterrirait après le
filet, hors de la liste.

**Il faut réorganiser la page une fois pour que la liste la termine.**
La page a été relue en ligne le 6 septembre 2026 avant d'écrire ce diff
(état : révision courante, dernière entrée `#` = « Le rendu d'une page
qui dépend d'une donnée portée ailleurs se rafraîchit avec retard »).

#### Diff proposé

**En tête** — après « …dans quel lot la traiter. » :

```diff
 Elle ne remplace pas un suivi de tickets : chaque entrée est datée et indique,
 quand c'est connu, dans quel lot la traiter.

+''Page créée le 10 août 2026, à partir de l'audit consolidé dans le cadrage du lot 6.''
+
 Voir aussi le [[Récapitulatif technique du Système de Gestion de Données Techniques]].
+
+[[Catégorie:Page de suivi]]

 == Limites, dettes et faits à retenir ==
```

**En pied** — la page se terminait par :

```diff
 # '''Le rendu d'une page qui dépend d'une donnée portée ailleurs se rafraîchit avec retard, pas jamais.''' […] ne se lève ni par attente ni par purge.
-
-----
-Page créée le 10 août 2026, à partir de l'audit consolidé dans le cadrage du lot 6.
-
-[[Catégorie:Page de suivi]]
```

Après réorganisation : la **dernière ligne non vide de la page est le
dernier `#` de la liste**. C'est la condition pour que `wiki-append.sh`
fonctionne.

#### Ce que ça change à l'écran

- La provenance passe en italique juste sous le chapô, au lieu d'un
  pied de page détaché par un `----`. Même information, remontée.
- La catégorie `Page de suivi` remonte aussi (une catégorie s'annote où
  on veut, le rendu est identique).
- Le `----` disparaît.
- Aucune entrée de la liste n'est touchée — le diff ne porte que sur les
  quelques lignes de tête et de pied.

**Résumé de modification proposé** :
`[Correctif] Limites connues du SGDT — provenance en tête, liste en fin de page (préalable à wiki-append.sh)`

**→ Je m'arrête ici. Rien n'est écrit sur le wiki tant que ce diff n'est
pas validé.** C'est une page de référence ; le diff doit être relu avant
écriture.

### Point 2 — `bin/wiki-append.sh` — À ÉCRIRE APRÈS VALIDATION DU POINT 1

Spécification retenue (d'après `outillage-proposition.md` §1.b) :

- `action=edit` avec `appendtext@fichier`, `nocreate=1`, `assert=user`,
  `format=json`, jeton via `bin/_wiki-csrf.sh` ;
- **jamais** `bot=1`, **jamais** `createonly` (c'est un ajout) ;
- le fichier d'entrée doit commencer par exactement `\n# ` — une ligne
  vide entre deux `#` casserait la liste numérotée en deux ;
- contrôle du résultat comme `wiki-put.sh` corrigé : code non nul si
  `{"error":…}` ou `result != "Success"` ;
- **vérification après écriture** : re-GET du wikitexte, contrôle que
  (i) le bloc ajouté est bien la dernière ligne non vide, (ii) le nombre
  de lignes `# ` a augmenté d'exactement 1. Sinon, avertissement bruyant.
  Le comptage *avant* ajout est une lecture, mais on ne renvoie jamais ce
  qu'on a lu : la surface de corruption reste nulle.
- **Périmètre documenté en tête** : réservé aux pages qui se **terminent**
  par la cible d'ajout (liste ouverte, journal). Pas un outil générique.
- Test sur `Utilisateur:Cywil/Bac à sable` d'abord, jamais sur *Limites
  connues* du premier coup.

### Point 3 — ce que `appendtext` ne résout PAS

**Le gain porte sur l'ajout d'une entrée, pas sur la correction d'une
entrée existante.**

- Ajouter l'entrée n° 35 : `wiki-append.sh` envoie ~200 octets, ne lit
  jamais les 34 autres entrées, ne peut pas les corrompre. Gain réel.
- **Corriger une entrée existante** (reformuler la n° 14, préciser la
  n° 2…) : reste une réécriture complète de la page via `wiki-put.sh`.
  Toute la page repasse par un fichier local retouché à la main.
  `appendtext` n'y change rien — on ne peut pas « éditer en place » une
  ligne au milieu d'une page avec cette API.

C'est exactement le scénario qui a coûté l'apostrophe de l'entrée n° 26
le 27 août : une correction ailleurs sur la page, un caractère perdu
dans une entrée que personne ne touchait ce jour-là. **`wiki-append.sh`
n'aurait pas évité cet incident** — il n'intervient pas sur les
corrections.

Ce qui réduirait *aussi* le risque sur les corrections, sans être dans ce
lot : `wiki-put.sh --section N` (repli §1 de la proposition), qui ne fait
repasser que la section visée. À garder pour un cas de liste en milieu
de page ; pas nécessaire ici.

**Honnêtement : `appendtext` supprime la surface de corruption pour le
cas le plus fréquent (ajouter une entrée par lot) et ne fait rien pour
le cas qui a effectivement mordu (corriger une entrée).**

---

## État git en fin de session

```
d3edbf2  [Correctif] Outillage bin/ — helper CSRF partagé, garde-fou réseau
```

Poussé : `4701d4d..d3edbf2  main -> main`.

`bin/_wiki-csrf.sh` (nouveau), `bin/wiki-put.sh`, `bin/wiki-purge.sh`,
`bin/wiki-upload.sh`. `wiki-append.sh` **pas** créé : attend la validation
du point 1. Fichiers `travaux/lot-27-*` et `lot-28-*` présents avant la
session, laissés hors commit.

## Reste à faire (après validation)

1. Valider le diff de réorganisation de *Limites connues* → écrire.
2. Écrire `bin/wiki-append.sh`, le tester sur le bac à sable.
3. Ajouter la description de `wiki-append.sh` à `CLAUDE.md`
   (section « Outils disponibles »).
