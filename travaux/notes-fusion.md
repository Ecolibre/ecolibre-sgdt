# Fusion des notes PAIR / concept de projet / Wanted_by — 7 septembre 2026

Décision de Cyril : le retournement de `Wanted_by` (item → acteur) est
**suspendu au lot PAIR**. Un souhait se rattache à un projet, lui-même
porté par un organisme, pas directement à l'organisme — donc pas de sens
tant que le concept de projet n'existe pas sur le wiki.

## Fusion sur `Notes en attente de rangement`

Les deux notes qui se recouvraient (« Sens de la relation souhaité par, et
concept de projet », Cyril le 01/09/26, et « Alignement PAIR et concept de
projet », ajoutée le 07/09/26) sont fusionnées en une seule :

**« Sens de la relation « souhaité par », concept de projet et alignement
PAIR »** — date conservée `Cyril, le 01/09/26 — complétée le 07/09/26`,
pour marquer que c'est Cyril qui a ouvert cette note, pas nous.

La note porte maintenant trois volets, dans l'ordre demandé :
1. **PAIR** : paquet de déploiement préparé, en attente d'une version
   stable confirmée ; PAIR porte une classe Projet.
2. **Le concept de projet** : la page d'avancement du jardin-forêt ne
   distingue pas ce qui relève du projet de ce qui appartient simplement à
   Ecolibre — un ficus de bureau y entrerait. Même manque que celui déjà
   identifié par Cyril pour `Wanted_by`.
3. **Wanted_by** : retournement suspendu à ce lot. État mesuré le
   7 septembre 2026 (voir `travaux/wanted-by-etat.md`) : une seule valeur
   sur tout le wiki, `Mèche de tarière pour perceuse -> Ecolibre`. Le
   retournement, le moment venu, ne coûtera qu'une migration de cette
   valeur unique — mais n'a pas de sens avant que le projet existe comme
   entité.

Écriture par `wiki-put.sh` (la page est structurée en sections `==`, pas en
liste numérotée ouverte : hors périmètre de `wiki-append.sh`). Résumé
`[Complément] Notes en attente — fusion PAIR, concept de projet et
Wanted_by suspendu`.

### Vérifications après écriture

- **Une seule note** sur le sujet : l'ancienne section « Alignement PAIR et
  concept de projet » et l'ancienne section « Sens de la relation… » ont
  toutes deux disparu, remplacées par la note fusionnée, en tête de page
  (convention « les plus récentes en haut »).
- **La page rend** : relecture du wikitexte après écriture conforme au
  contenu voulu ; page purgée pour écarter tout doute sur un rendu en
  cache.
- **Catégorie inchangée** : `Catégorie:Page de suivi`, seule et identique
  à avant l'écriture.
- **`browsebysubject` sans annotation parasite** : la page ne porte que
  `_INST` (`Page_de_suivi`), `_MDAT` et `_SKEY` — aucun fait ni lien
  accidentel malgré les guillemets français et le `->` du texte.

## Correctif de `travaux/remise-a-niveau-6-septembre.md`

Cette page datait « Mèche de tarière pour perceuse » comme item
**référencé**. Mesure directe de sa page (`{{Organic item| ... }}`,
effectuée le 7 septembre dans `travaux/wanted-by-etat.md`) : c'est un item
**organique**. Comme prédit, l'erreur faussait les deux comptes de classe
d'une unité chacun, en sens opposé :

| Classe | Valeur erronée | Valeur corrigée |
|---|---|---|
| Organic item | 40 | **41** |
| Referenced item | 39 | **38** |

Corrigé dans le tableau de la section 2, avec une note de correctif
expliquant le changement et son origine. Conséquence secondaire : le
Referenced item ne comportait en fait **aucun écart** avec la mesure du
29-31 août (déjà à 38) — le paragraphe qui expliquait un faux passage
« 38 → 39 » a été récrit en conséquence. La seconde mention du même fait
(section sur les notes en attente de rangement, point 5) est corrigée de
même, et mise à jour pour refléter la fusion et la décision de Cyril sur
`Wanted_by`.
