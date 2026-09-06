# `bin/wiki-append.sh` — défaut 1 de l'outillage, seconde passe

Fait suite à `outillage-passe2.md` (défaut 7, helper CSRF, commit `d3edbf2`).
Ici : réorganisation de *Limites connues du SGDT* pour qu'`appendtext` puisse
y ajouter une entrée, puis le script `bin/wiki-append.sh`.

Toutes les mesures datent du **6 septembre 2026**, compte `Cywil`.

---

## 1. *Limites connues du SGDT* — réorganisée (deux éditions)

`appendtext` écrit en fin de **page**, pas en fin de **liste**. La page se
terminait par la liste, puis un `----`, puis une ligne de provenance, puis
`[[Catégorie:Page de suivi]]`. Un `# nouvelle entrée` ajouté à la fin
serait tombé après tout ça, hors de la liste.

### Édition 1 — révision 1279

Résumé : `[Correctif] Limites connues du SGDT — provenance en tête, liste en fin de page (préalable à wiki-append.sh)`

- La ligne de provenance (« Page créée le 10 août 2026… ») remonte sous le
  chapô, en italique.
- `[[Catégorie:Page de suivi]]` remonte juste sous « Voir aussi… » (une
  catégorie s'annote où on veut, le rendu est identique).
- Le `----` disparaît.
- **Aucune entrée de la liste n'est touchée** — le diff ne porte que sur
  la tête et le pied.

Transformation faite par script (`scratchpad/reorg.py`), pas à la main,
avec assertions : 47 entrées avant → 47 après, `----` absent du résultat,
catégorie présente une seule fois, dernière ligne = dernière entrée.

**Vérifications après écriture (demandées) :**

| Contrôle | Attendu | Observé |
|---|---|---|
| relecture vs fichier local | identique (hors `\n` final) | **identique** |
| entrées `# ` | 47 (inchangé) | **47** |
| catégorie `Page de suivi` | posée | **posée, seule catégorie** |
| `browsebysubject` | `_INST`, `_MDAT`, `_SKEY` seulement | **exactement ça** — aucune annotation parasite |

### Édition 2 — révision 1290

Résumé : `[Correctif] Limites connues du SGDT — commentaire garde-fou en fin de page (contrainte wiki-append.sh)`

Commentaire HTML invisible ajouté en fin de page, **collé à la dernière
entrée** (voir §3 pour le « collé ») :

```
<!-- Cette liste doit rester la dernière chose de la page.
     bin/wiki-append.sh ajoute en fin de PAGE, pas en fin de liste :
     toute section ajoutée après elle casserait l'ajout, sans erreur.
     Réorganisé le 6 septembre 2026 pour cette raison. -->
```

**Vérifications après écriture :**

| Contrôle | Observé |
|---|---|
| relecture vs fichier local | identique (hors `\n` final) |
| entrées `# ` | 47 (inchangé) |
| catégorie | `Page de suivi`, seule — pas de catégorie de suivi parasite (liens brisés etc.) |
| `browsebysubject` | `_INST`, `_MDAT`, `_SKEY` seulement |
| **rendu HTML** | **1 seul bloc `<ol>`, 47 `<li>`** — le commentaire final ne coupe pas la liste |

---

## 2. `bin/wiki-append.sh` — écrit et testé

### Spécification retenue + l'ajout demandé

Sur la base d'`outillage-proposition.md` §1.b, avec **un contrôle AVANT
écriture** (demande de Cyril : vérifier après, « à ce moment-là le mal est
fait ») :

**Contrôle local du fichier d'ajout** — refuse si : ne commence pas par un
`\n`, commence par `\n\n` (ligne vide → casse la liste), ne commence pas
par `# ` après le `\n`, ou contient plus d'une ligne `# `.

**Pré-contrôle de la page (lecture, jamais renvoyée)** — refuse si :
- la dernière ligne de contenu (après avoir retiré un éventuel commentaire
  HTML final) ne commence pas par `# ` → *« la cible doit finir la page »* ;
- **une ligne vide sépare la dernière entrée du commentaire HTML final**
  → l'ajout, fait après le commentaire, couperait la liste au rendu (voir
  §3). Message : *« coller le commentaire à la dernière entrée »*.

Sinon : compte les entrées `# ` (`COUNT_BEFORE`), jeton via
`bin/_wiki-csrf.sh`, puis `action=edit&appendtext@fichier` avec
`nocreate=1`, `assert=user`. Jamais `bot=1`, jamais `createonly`.

**Post-contrôle** — re-lecture :
- wikitexte : `COUNT_BEFORE + 1` entrées, l'ajout est la dernière entrée,
  le texte ajouté est présent ;
- **rendu** (`action=parse&prop=text`) : l'ajout ne forme pas une liste
  numérotée à lui seul (le `<ol>` qui le contient a plus d'un `<li>`).
  Ce contrôle rattrape exactement le cas où le wikitexte est correct mais
  le rendu cassé.

Tout écart = avertissement bruyant, code non nul. L'ajout reste annulable
par l'historique.

### Tests — les deux chemins

Sous-pages de `Utilisateur:Cywil/Bac à sable` (nettoyées après).

| Cas | Attendu | Observé |
|---|---|---|
| page finissant par une liste + commentaire **collé** | **passe** | pré-contrôle OK, `result: Success`, post-contrôle wikitexte OK (3→4), **rendu OK (1 `<ol>`)**, exit 0 |
| page finissant par une **section** après la liste | **refuse** | `REFUS: la derniere ligne … nest pas une entree de liste`, **exit 2, aucune écriture** (révision inchangée) |
| page finissant par liste + **ligne vide** + commentaire | **refuse** | `REFUS: une ligne vide separe la derniere entree du commentaire` — **exit 2, aucune écriture** |
| fichier d'ajout à deux `\n` / sans `\n` initial / à deux entrées | **refuse** | les trois refus locaux, exit 1 |

**Le refus est le test qui compte** — les trois refus ont bien laissé la
page intacte (révisions vérifiées inchangées après coup).

### Ce que `wiki-append.sh` ne résout PAS

**Le gain porte sur l'ajout d'une entrée, pas sur la correction d'une
entrée existante.** Reformuler la n° 14, préciser la n° 2 : ça reste une
réécriture complète de la page par `wiki-put.sh`, toute la page repassant
par un fichier local retouché. `appendtext` n'aide en rien — on ne peut
pas éditer une ligne au milieu d'une page avec cette API.

C'est le scénario qui a coûté l'apostrophe de la n° 26 le 27 août :
correction ailleurs sur la page, caractère perdu dans une entrée que
personne ne touchait. **`wiki-append.sh` n'aurait pas évité cet
incident.** Écrit tel quel dans l'en-tête du script et dans `CLAUDE.md`.

---

## 3. Note technique — pourquoi le commentaire est « collé »

Mesuré sur le bac à sable, dans les deux configurations :

- `# entrée\n<!-- commentaire -->` puis `appendtext` de `\n# nouvelle` →
  **1 `<ol>`, liste continue.** MediaWiki retire le commentaire *et* le
  saut de ligne qui le précède au pré-traitement : les deux `#` se
  retrouvent adjacents.
- `# entrée\n\n<!-- commentaire -->` (une ligne vide avant le commentaire)
  puis même `appendtext` → **2 `<ol>` (3 `<li>` puis 1)** : la liste est
  coupée. La ligne vide subsiste après retrait du commentaire.

D'où : sur *Limites connues*, le commentaire garde-fou est collé à la
dernière entrée (aucune ligne vide), et `wiki-append.sh` **refuse** toute
page où une ligne vide s'est glissée là. Le post-contrôle de rendu du
script est le filet si ça arrivait quand même.

Le contrôle du wikitexte seul ne voyait pas cette coupure — le nombre de
`# ` était bon, la dernière ligne était bien l'ajout. Seul le rendu la
montrait. C'est pour ça que le post-contrôle interroge `action=parse`.

---

## 4. `CLAUDE.md` et `.claude/settings.json`

- **`CLAUDE.md`** : description de `bin/wiki-append.sh` ajoutée à « Outils
  disponibles », après `wiki-put.sh`. Périmètre (pages finissant par la
  cible), les deux refus, les post-contrôles, et « n'aide en rien à
  corriger une entrée existante ». +18 lignes.
- **`.claude/settings.json`** : `Bash(bin/wiki-append.sh:*)` ajouté à
  `allow`, après `wiki-put.sh` — pour que le script s'invoque sans
  confirmation comme les autres `bin/wiki-*`.
  Comptes après écriture : **deny 16, ask 4, allow 31** (allow 30 → 31,
  +1 exactement).

---

## 5. État git

Commit de cette passe (à la suite de `d3edbf2`) :

```
[Correctif] Outillage bin/ — wiki-append.sh (appendtext + garde-fous)
```

`bin/wiki-append.sh` (nouveau), `CLAUDE.md`, `.claude/settings.json`,
`travaux/outillage-passe2.md` et `travaux/wiki-append.md`.
Fichiers `travaux/lot-27-*` / `lot-28-*` : présents avant la session,
laissés hors commit.

Éditions wiki : `Limites connues du SGDT` rév. 1279 puis 1290 ; sous-pages
de bac à sable créées puis nettoyées (rév. jusqu'à ~1296).

## 6. Reste de l'audit outillage (`outillage-proposition.md`)

Les sept défauts sont traités : 2, 3, 4, 5, 6 (première passe,
`outillage-suite.md`), 7 (`d3edbf2`), 1 (ce document). Rien en attente.
