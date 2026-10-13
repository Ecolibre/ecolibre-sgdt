# Lot 21, tâche 21 — Trois mesures avant d'inscrire

Session du 13 octobre 2026, environnement Claude Code hébergé (cloud), branche `claude/magical-mayer-lm5dk7`.

## Les trois réponses

**TÂCHE BLOQUÉE AVANT TOUTE ÉCRITURE SUR LE WIKI : aucune des trois mesures n'a été faite.** Ce conteneur ne peut pas joindre wiki.ecolibre.org : le proxy sortant le refuse, et `.env` est absent.

- **Mesure A (remontée d'un sous-objet à son item)** : non mesurée. Je ne sais pas.
- **Mesure B (modèle écrivant dans une propriété passée en paramètre)** : non mesurée. Je ne sais pas.
- **Mesure C (comparateur strict sur une Quantity avec unité)** : non mesurée. Je ne sais pas.

Rien n'a été créé sur le wiki. Aucune page n'a été lue sur le wiki. Seuls les huit fichiers de `pages/` ont été écrits, tels que la consigne les donne, pour qu'une prochaine session les reprenne.

## Étape 0 — État du dépôt

`git status` au début :

```
On branch claude/magical-mayer-lm5dk7
nothing to commit, working tree clean
```

Aucune ligne M, A, D ou R, aucune ligne ??.

`travaux/lot-21-tache21-trois-mesures.md` n'existait pas (`ls` : « No such file or directory »).

`.claude/settings.local.json` : le fichier n'existe pas dans ce conteneur, donc ne porte aucune règle. Relevé au début de la tâche, et refait à la fin (voir « Vérifications »).

## Étape 1 — Ce qui a bloqué

1. `bin/wiki-login.sh` :

   ```
   ERREUR: .env introuvable (cherché dans /home/user/ecolibre-sgdt/../ecolibre-sgdt-prive/.env puis /home/user/ecolibre-sgdt/.env)
   ```

   Le répertoire parent ne contient que `ecolibre-sgdt` : `ecolibre-sgdt-prive` n'existe pas dans ce conteneur. `SGDT_PRIVE` n'est pas défini.

2. Lecture anonyme, pour savoir si le wiki était au moins lisible :
   `bin/wiki-api.sh "action=query&meta=siteinfo&siprop=general&format=json"`

   ```
   curl: (56) CONNECT tunnel failed, response 403
   ERREUR: curl a échoué (code 56) — transport (hôte/proxy/DNS), ou URL mal formée.
   ```

   C'est le cas déjà consigné dans `CLAUDE.md` le 24 août 2026 : le proxy sortant de l'environnement hébergé refuse wiki.ecolibre.org au CONNECT. Cette fois `wiki-api.sh` l'a signalé explicitement (code 56 et message), et ne s'est pas tu comme le 24 août.

Ces deux causes sont indépendantes. Même avec le `.env`, le proxy aurait refusé. Même avec le réseau, aucune écriture n'était possible sans le `.env`.

**Journal de la barrière** : aucun tour. P1 (`Attribut:Test lot21d épaisseur`) et P2 (`Attribut:Test lot21d rôle`) n'ont pas été créées. Leur absence sur le wiki (`missing`) n'a pas pu être vérifiée.

## Étape 2 — Créations

Aucune des huit pages n'a été créée sur le wiki. Pas de pageid, de révision ni d'horodatage à donner.

Les fichiers locaux sont écrits mot pour mot depuis la consigne :

| Fichier | Titre prévu |
|---|---|
| `pages/Lot21d_essai_01_epaisseur.txt` | Attribut:Test lot21d épaisseur |
| `pages/Lot21d_essai_02_role.txt` | Attribut:Test lot21d rôle |
| `pages/Lot21d_essai_03_modele.txt` | Modèle:Test lot21d caractéristique |
| `pages/Lot21d_essai_04_role_page.txt` | Utilisateur:Cywil/Bac à sable/Lot21d maximal admissible |
| `pages/Lot21d_essai_05_machine_a.txt` | Utilisateur:Cywil/Bac à sable/Lot21d machine A |
| `pages/Lot21d_essai_06_machine_b.txt` | Utilisateur:Cywil/Bac à sable/Lot21d machine B |
| `pages/Lot21d_essai_07_machine_c.txt` | Utilisateur:Cywil/Bac à sable/Lot21d machine C |
| `pages/Lot21d_essai_08_requetes.txt` | Utilisateur:Cywil/Bac à sable/Lot21d requêtes |

## Étape 3 — Relevés

Aucun. État 0, relevé 1, purge et second relevé : non faits.

## Vérifications

- a. Relevé de ce qui est stocké : non fait, rien n'est stocké.
- b. `bin/wiki-verify.sh` : non lancé, aucune page créée.
- c. Compte de `_ERRC` : non mesuré.
- d. Liens des pages machine : non relevés.
- e. Révisions 342, 343, 803 et 804 des quatre propriétés de production : non vérifiées. Aucune écriture n'est partie de ce conteneur, puisque le wiki n'y est pas joignable.
- `.claude/settings.local.json` en fin de tâche : toujours absent, donc aucune règle.

## Écarts et surprises

1. **L'environnement de cette session ne permet aucune tâche wiki.** La consigne supposait un poste où `wiki-login.sh` trouve le `.env` et où le wiki est joignable. Ici, ni l'un ni l'autre. La consigne s'exécute telle quelle sur le poste de Cyril, ou dans un environnement hébergé dont l'accès réseau autorise wiki.ecolibre.org et qui fournit les identifiants.

2. **La consigne prescrit `action=browsebysubject` aux étapes 3.3 et 3.5.** Depuis le 7 octobre 2026, `CLAUDE.md` dit que ce module, déprécié par Semantic MediaWiki, ne doit plus être employé, et que `bin/wiki-api.sh --facts` passe par `action=smwbrowse`. À la reprise, je propose de faire le relevé par `--facts` (et par le JSON brut de `smwbrowse` pour les types rendus). Le bloc `query` est le même. Non tranché : voir la question B.

3. Un point à vérifier quand la mesure sera faite, et non une conclusion : `Module:Nombre|virgule` reçoit `0.2`, `0,3` et `0.5`. Le nom de la fonction laisse penser qu'elle rend une virgule décimale. Le stockage d'une Quantity dépend alors de la façon dont SMW lit la virgule sur ce wiki. C'est justement ce que la consigne demande de comparer. Je ne sais pas ce que fait la fonction : je n'ai pas lu le module, puisque le wiki n'est pas joignable.

## Échanges avec Cyril hors consigne

Aucun.

## Questions

**A.** Contexte : depuis ce conteneur hébergé, le proxy refuse wiki.ecolibre.org (403 au CONNECT), et le `.env` est absent (pas de `ecolibre-sgdt-prive`). Question : faut-il relancer la tâche 21 sur ton poste, ou ouvrir l'accès dans cet environnement ? Suggestion : la relancer sur ton poste, où l'outillage et les permissions sont réglés. Ouvrir l'environnement hébergé suppose deux réglages, l'un et l'autre dans les paramètres de l'environnement (menu de l'environnement dans la barre de titre de la session, puis Edit) : ajouter wiki.ecolibre.org aux domaines autorisés (Network access), et fournir les identifiants du compte bot. `wiki-login.sh` ne lit qu'un fichier `.env` : il faudrait donc aussi un moyen d'en produire un, ce qui sort du périmètre de cette tâche.

**B.** Contexte : la consigne demande `action=browsebysubject`, que `CLAUDE.md` interdit depuis le 7 octobre 2026. Question : relevé par `smwbrowse` (`bin/wiki-api.sh --facts`, plus le JSON brut) à la reprise ? Suggestion : oui. `CLAUDE.md` l'emporte, et le contenu du bloc `query` est identique.
