# Lot 44 — modèle de message des deux procédures de clôture, 29 octobre 2026

Ajout, dans le bloc `pre` du message à coller des deux procédures de
clôture (d'un lot, d'une conversation), de la consigne de récupérer
`methode-de-travail.md` quand la conversation ne le connaît pas. Session
Claude Code hébergée (cloud), branche de travail `ccr-4b59dccc-xydpag`.

## 1. État du dépôt et des permissions locales

- `git status --porcelain` au départ : sortie vide, aucun arrêt.
- `git fetch origin` : `origin/main` sur `c7bd0ea`, comme la branche de
  travail ; `Already up to date`. Clone complet
  (`git rev-parse --is-shallow-repository` : `false`).
- `.claude/settings.local.json` au début : **fichier absent**, donc aucune
  règle.
- `.claude/settings.local.json` à la fin : **fichier absent**, aucune règle.

## 2. Contrôles avant écriture

| Contrôle | Mesure | Résultat |
|---|---|---|
| `lastrevid` de la procédure de clôture d'un lot | **1702**, `Page de suivi` | conforme à la consigne |
| `lastrevid` de la procédure de clôture d'une conversation | **1706**, `Page de suivi` ; copie locale identique (`cmp`) | conforme |
| Paragraphe d'ancrage | une seule occurrence par page, à l'intérieur de l'unique bloc `<pre>` de chacune | conforme |
| Date du protocole, « 2 septembre 2026 » | premier commit de `methode-de-travail.md` : `079ce9a`, 2 septembre 2026 à 23 h 58 (+02:00), « [Lot 27][Tâche 2] », mesuré sur un clone complet | conforme |
| Adresse brute | `curl` sur l'adresse : HTTP 200, 28 036 octets, identique octet pour octet à `methode-de-travail.md` du dépôt | conforme |

## 3. Préparation et diff

Les deux fichiers ont été produits par un script de scratchpad,
`modele.py`, montré avant son lancement. Il s'arrêtait si l'ancrage était
absent, multiple ou hors du bloc `pre`. Il insérait le même texte juste
après l'ancrage, sans toucher la ligne vide qui suivait.

`diff` avant envoi, identique sur les deux pages : **six lignes ajoutées,
aucune supprimée**. Ce sont les trois lignes de la phrase, une ligne vide,
la ligne `curl`, puis une ligne vide. Celle-ci sépare l'ajout du paragraphe
suivant (« Applique ensuite… »), qui reste séparé comme avant. Lignes : 93 → 99 et
109 → 115 ; octets : 8 370 → 8 616 et 6 486 → 6 732, soit +246 sur chacune.
Aucune syntaxe wiki dans l'ajout.

## 4. Écritures

`bin/wiki-login.sh` : `Success Cywil`. Chaque écriture a été précédée d'une
relecture de son `lastrevid`, inchangé à chaque fois.

| N° | Page | Résumé | Révision |
|---|---|---|---|
| 1 | Procédure de clôture d'un lot | `[Lot 44] Modèle de message : récupérer aussi methode-de-travail.md` | 1702 → **1708**, 12:22:01 UTC |
| 2 | Procédure de clôture d'une conversation | `[Lot 44] Modèle de message : récupérer aussi methode-de-travail.md` | 1706 → **1709**, 12:22:03 UTC |

Deux écritures sur le wiki, pas une de plus. La copie locale
`pages/Procedure_cloture_conversation.txt` a reçu le fichier envoyé. La
procédure de clôture d'un lot n'a pas de copie à jour dans `pages/`, et je
n'en ai pas créé.

## 5. Vérifications

### Vérification décisive

| Contrôle | Clôture d'un lot | Clôture d'une conversation |
|---|---|---|
| Blocs `pre` dans le rendu | 1 | 1 |
| Adresse brute présente dans le bloc `pre` | oui | oui |
| Adresse en lien actif | non : aucune balise `<a>` vers elle, et absente des liens externes de la page (`prop=externallinks`) | non, mêmes mesures |
| Classe `error` | 0 | 0 |
| `bin/wiki-verify.sh` | `IDENTIQUE` | `IDENTIQUE` |

**Réussie.**

### Vérifications secondaires

| Contrôle | Résultat |
|---|---|
| Sections | clôture d'un lot : 6 titres ; clôture d'une conversation : 8 titres. Inchangés |
| Tableau de la clôture d'une conversation | 7 lignes `<tr>` |
| Catégories | `Page de suivi`, seule, sur les deux |
| Liens rouges | aucun sur les deux |
| Diffs | uniquement des lignes ajoutées, six par page |

## Questions de Cyril en cours de route

Aucune.

## Écarts et surprises

- Aucun écart. Les deux faits portés par l'ajout, la date du protocole et
  l'adresse brute, ont été mesurés avant l'écriture (section 2).

## Poussée

Commit poussé sur `main`, et sur la branche désignée `ccr-4b59dccc-xydpag`.
