# Lot 48 — amendement, suite : nettoyage du serveur et forme des réponses de fermeture

Session locale sur le Framework, 22 novembre 2026, branche `main`, après le
commit `c9d8491` (lu par `git log` après coup ; une première version de ce
rapport citait `9f083da`, écrit de mémoire). Suite de `travaux/lot-48-amendement-2026-11-22.md`, en réponse
à sa question A.

## Étape 1 — État du dépôt

- `git fetch origin` : `main` alignée sur `origin/main`, `origin/main` ancêtre
  de `HEAD`, `git status` propre.
- `.claude/settings.local.json` au début : fichier absent, donc aucune règle.
- `bin/wiki-login.sh` : `Success Cywil`.

## Étape 2 — Serveur

`rm` des deux fichiers de travail, `bloc-amendement.php` et
`LocalSettings_ecolibre.php.nouveau-amendement` : aucune sortie, aucune erreur.

Listage du dossier de sauvegarde après suppression :

| Nom | Droits | Taille |
|---|---|---|
| (dossier) | 700 (`drwx------`) | — |
| `LocalSettings_ecolibre.php.avant-amendement-20261122` | 600 (`-rw-------`) | 13 777 octets |
| `LocalSettings_ecolibre.php.avant-lot48-20261119` | 600 (`-rw-------`) | 11 614 octets |

Il ne reste que les deux copies attendues.

## Étape 3 — Limites connues du Système de Gestion de Données Techniques

- Révision attendue 1827, lue 1827 ; aucune protection native.
- Script de session `amender2.py` (contenu affiché avec son lancement) : une
  seule ligne visée, une seule occurrence de la phrase dans la page et dans la
  ligne ; fichier préparé.
- Diff : ligne 75 seulement, 107 lignes avant et après. La phrase « Une liste
  de chemins éprouvés ne prouve jamais qu'il n'en existe pas d'autres. »,
  dernière de la ligne, est remplacée par le texte de la consigne, qui la
  reprend et la prolonge sur la même ligne.
- `bin/wiki-put.sh` : `Success`, révision 1827 → **1830**, résumé
  « [Lot 48][Amendement] Forme de la réponse d'un module désactivé ».
- `bin/wiki-verify.sh` : `IDENTIQUE`.

| Contrôle | Avant | Après |
|---|---|---|
| `prop=links` | 11 liens | 11 liens, mêmes titres |
| `prop=categories` | Page de suivi | Page de suivi |
| Entrées numérotées (`# ` en début de ligne) | 80 | 80 |
| Rendu : listes `<ol>`, éléments `<li>` | — | 1 liste, 80 éléments |
| Faits de la page (`--facts`) | — | `_INST` (Page de suivi), `_MDAT`, `_SKEY` seulement |

## Relevé de `.claude/settings.local.json`

- Début de tâche : fichier absent.
- Fin de tâche : fichier absent.

## Écarts et surprises

1. La révision 1830 suit directement les 1827 à 1829 de l'amendement : aucune
   écriture faite ailleurs sur le wiki entre les deux tâches.
2. Le comptage des éléments `<li>` du rendu n'a été fait qu'après écriture ; il
   concorde avec les 80 entrées du wikitexte, avant comme après.
3. Pour la deuxième fois aujourd'hui, le commit de départ a été écrit dans le
   rapport avant d'être lu, et il était faux. La règle de CLAUDE.md sur les
   hash vise ceux imprimés par `git show --stat` ; le commit de départ d'un
   rapport devrait se lire de la même façon, par `git log -1` avant la
   rédaction.
