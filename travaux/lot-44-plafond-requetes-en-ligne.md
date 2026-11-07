# Lot 44 — Limites connues : le plafond des requêtes en ligne, entrée 75

Écriture faite le 6 novembre 2026 à 23:27 UTC, soit le 7 novembre à 0 h 27 à
Paris ; rapport rédigé le 7 novembre au matin, à la reprise. Session Claude
Code cloud, branche `claude/focused-wright-wr4tlb`. Une écriture sur le wiki,
réussie du premier coup, après un arrêt avant écriture. La vérification qui
tranche donne 74 entrées avant, 75 après. La chaîne qu'elle cherchait figure
0 fois, et non 1 : elle appartenait à l'entrée remplacée ; la chaîne
correspondante de la nouvelle entrée figure 1 fois.

## Étape 0 — état du dépôt

`git fetch origin`, puis `git status --porcelain` : sortie vide, aucun arrêt,
aux trois passages : au premier, après l'échange, et à la reprise du 7 au
matin. `HEAD` et `origin/main` au même commit, `d245fda`, les trois fois :
rien à mettre à jour. `.claude/settings.local.json` : absent, au début comme
à la fin de la tâche, donc aucune règle.

Session wiki : `bin/wiki-login.sh` rend `Success`, compte `Cywil`.

## Arrêt avant écriture, et échanges par le canal direct

Avant d'écrire, j'ai mesuré ce que l'entrée fournie affirmait et que je
n'avais pas encore mesuré moi-même. Deux de ses phrases étaient démenties,
d'où deux points soumis à Cyril, rien n'étant écrit :

- **A** : « … sans que la page le signale » était faux avec les réglages par
  défaut. Une prévisualisation avec `limit=1000` sur 598 pages rend 500
  éléments, suivis d'un lien « ... autres résultats » vers `Spécial:Requêter`,
  au format liste comme au format tableau.
- **B** : « qu'il vaille aussi pour le format tableau est une déduction, non
  une mesure » était dépassé : la même prévisualisation au format tableau
  rend 500 lignes numérotées de 1 à 500, puis une ligne de pied.

Le message signalait aussi que ces deux erreurs venaient de mes rapports
précédents (voir les écarts), et que les mesures du 6 novembre en UTC
tombaient le 7 après minuit à l'heure de Paris.

Réponse de Cyril : « A et B. Les deux sont acceptés, et j'ai vérifié de mon
côté : au format tableau, la prévisualisation rend 502 lignes, soit l'en-tête,
500 lignes de données et la ligne de pied smwfooter ; au format liste,
« autres résultats » est bien présent. » L'entrée a été remplacée entièrement
par un nouveau texte fourni, celui du diff ; le résumé, les vérifications et
le rapport restaient inchangés.

Le tour s'est ensuite interrompu après les vérifications, avant la rédaction
de ce rapport. Le 7 au matin, Cyril a écrit « Reprenons ». Reprise après
contrôle : la page portait toujours la révision 1734, identique à la
relecture faite après l'écriture, `origin/main` n'avait pas bougé, et les
fichiers de travail étaient intacts.

## Lectures et mesures préalables

- Page relue par `bin/wiki-get.sh` (`action=parse&prop=wikitext`) juste avant
  l'écriture : identique à la révision 1723, celle du correctif du
  4 novembre. Protections : `protection: []` et aucun motif de refus. La
  dernière ligne de la page est l'entrée 74.
- Avant l'écriture : 74 entrées ; « plafonnée à 500 résultats », 0 fois ;
  « n'affiche jamais plus de 500 résultats », 0 fois ;
  `smwgQMaxInlineLimit`, 0 fois ; 0 lien externe.
- Faits de la nouvelle entrée, vérifiés avant d'écrire :
  - 598 pages portent une date de modification, compte rendu par une
    prévisualisation au format `count` ;
  - `action=ask` sur ces pages : `limit=400` rend 400, `limit=500` 500,
    `limit=1000` 598, `limit=2000` 598 ;
  - prévisualisations avec `limit=1000` et les réglages par défaut : au format
    liste, 500 éléments puis le lien « ... autres résultats » ; au format
    tableau, 502 balises `<tr>`, soit l'en-tête, 500 lignes numérotées de 1 à
    500 et une ligne `<tr class="smwfooter sortbottom row-odd">` qui porte le
    lien ;
  - les mêmes avec `searchlabel=` vide : au format liste, 500 éléments sans
    lien ; au format tableau, 501 balises `<tr>`, soit l'en-tête et
    500 lignes, sans ligne de pied ni lien. La phrase « Ce lien disparaît si
    la requête vide son libellé » est donc mesurée aux deux formats ;
  - la page du lot 24 liste les réglages `$smwg*` à relever depuis le
    2 novembre, et le lien vers elle aboutit.

## Écriture

| Page | Révision | Heure (UTC) | Résumé | Méthode |
|---|---|---|---|---|
| Limites connues du Système de Gestion de Données Techniques | 1723 → 1734 | 23:27:31 | `[Lot 44][Complément] plafond des requêtes en ligne, mesuré à 500` | `bin/wiki-append.sh` |

`result: Success`. Pré-contrôle du script : 74 entrées, la liste finit la
page. Post-contrôle : 74 → 75 entrées, l'ajout est la dernière, un seul bloc
`<ol>` au rendu. L'entrée a été recopiée deux fois, et le fichier d'ajout est
exactement un saut de ligne suivi de la seconde recopie. Le résumé suit le
garde-fou 2.

## Le diff

Sans contexte. La ligne `-` puis `+` de l'entrée 74 ne vient que du saut de
ligne final : son texte est inchangé.

```diff
--- av/limites.txt
+++ limites-1734.txt
@@ -101 +101,2 @@
-# '''L'URI de base d'un import de vocabulaire est concaténée telle quelle au terme, sans séparateur ajouté.''' Mesuré sur owl, après correction : <code><nowiki>MediaWiki:Smw import owl</nowiki></code> porte <code><nowiki>http://www.w3.org/2002/07/owl#</nowiki></code> depuis le 25 juillet 2026, et <code>Attribut:Owl:differentFrom</code> s'exporte en <code><nowiki>http://www.w3.org/2002/07/owl#differentFrom</nowiki></code> - lu par <code>Spécial:Export RDF</code> le 26 juillet 2026, puis de nouveau les 29 octobre et 2 novembre 2026. Avant correction, l'import portait <code><nowiki>https://www.w3.org/TR/owl2-syntax/</nowiki></code>, et ce depuis sa révision 7 du 23 mars 2025, qui est l'import livré par défaut avec SMW. L'export d'alors n'a jamais été lu : l'URI qu'il produisait se déduit de la concaténation, elle ne se mesure pas. Même déduction sur skos, dont l'URI de base, <code><nowiki>http://www.w3.org/TR/skos-reference</nowiki></code>, ne se terminait ni par <code><nowiki>/</nowiki></code> ni par <code><nowiki>#</nowiki></code> : un terme s'y serait soudé, donnant <code><nowiki>skos-referenceConcept</nowiki></code>. Aucun attribut skos n'existait pour le vérifier. Les deux URI ont été corrigées le 25 juillet 2026.
\ No newline at end of file
+# '''L'URI de base d'un import de vocabulaire est concaténée telle quelle au terme, sans séparateur ajouté.''' Mesuré sur owl, après correction : <code><nowiki>MediaWiki:Smw import owl</nowiki></code> porte <code><nowiki>http://www.w3.org/2002/07/owl#</nowiki></code> depuis le 25 juillet 2026, et <code>Attribut:Owl:differentFrom</code> s'exporte en <code><nowiki>http://www.w3.org/2002/07/owl#differentFrom</nowiki></code> - lu par <code>Spécial:Export RDF</code> le 26 juillet 2026, puis de nouveau les 29 octobre et 2 novembre 2026. Avant correction, l'import portait <code><nowiki>https://www.w3.org/TR/owl2-syntax/</nowiki></code>, et ce depuis sa révision 7 du 23 mars 2025, qui est l'import livré par défaut avec SMW. L'export d'alors n'a jamais été lu : l'URI qu'il produisait se déduit de la concaténation, elle ne se mesure pas. Même déduction sur skos, dont l'URI de base, <code><nowiki>http://www.w3.org/TR/skos-reference</nowiki></code>, ne se terminait ni par <code><nowiki>/</nowiki></code> ni par <code><nowiki>#</nowiki></code> : un terme s'y serait soudé, donnant <code><nowiki>skos-referenceConcept</nowiki></code>. Aucun attribut skos n'existait pour le vérifier. Les deux URI ont été corrigées le 25 juillet 2026.
+# '''Une requête <code><nowiki>#ask</nowiki></code> posée dans une page n'affiche jamais plus de 500 résultats, quelle que soit la limite demandée ; la même requête par l'API n'est pas plafonnée là.''' Mesuré les 6 et 7 novembre 2026 sur une requête appariant 598 entités. En ligne, par prévisualisation qui n'enregistre rien, aux formats liste et tableau : <code><nowiki>limit=1000</nowiki></code> rend 500 éléments, suivis d'un lien « ... autres résultats » vers <code>Spécial:Requêter</code> - au format tableau, ce lien occupe une ligne de pied, portant le total à 502 lignes avec l'en-tête. Ce lien disparaît si la requête vide son libellé par <code><nowiki>searchlabel=</nowiki></code>, et rien n'indique jamais que la limite demandée a été ramenée à 500. Par <code><nowiki>action=ask</nowiki></code> sur la même requête : <code><nowiki>limit=400</nowiki></code> rend 400, <code><nowiki>limit=500</nowiki></code> rend 500, <code><nowiki>limit=1000</nowiki></code> et <code><nowiki>limit=2000</nowiki></code> rendent 598, c'est-à-dire la totalité. Conséquence : un compte relevé par l'API peut dépasser ce qu'une page affiche. Le plafond correspond vraisemblablement à <code><nowiki>$smwgQMaxInlineLimit</nowiki></code>, qui figure parmi les réglages que le [[Lot 24 — Adminsys autonome|lot 24]] doit encore relever.
\ No newline at end of file
```

## Vérifications

1. **Qui tranche : la page des Limites connues.** Relue par `action=parse`
   après l'écriture : **74 entrées avant, 75 après**. La chaîne de la
   consigne, « plafonnée à 500 résultats », figure **0 fois, et non 1** :
   elle appartenait à la première version de l'entrée, que Cyril a fait
   remplacer entièrement, et la vérification n'a pas suivi ce remplacement.
   Contrôle correspondant sur l'entrée écrite : « n'affiche jamais plus de
   500 résultats » figure **1 fois** ; l'entrée fournie est la dernière ligne
   de la page, et la page égale l'état d'avant suivi de cette seule ligne.
2. **Liens externes** (`prop=extlinks`) : **0 avant, 0 après**, et aucun lien
   externe nouveau. Le `touched` de la page, 23:27:32, suit l'écriture de
   23:27:31 ; l'entrée ne contient aucune adresse hors `<nowiki>`.
3. **Annotations** : `[[Has type::+]]`, `limit=500`, **161**, avec
   161 résultats rendus, tous dans l'espace Attribut : aucune page de
   registre n'y figure, ni les Limites connues, ni les Notes, le
   Récapitulatif, la Gestion des lots, les Choix imposés ou les procédures.

Contrôles complémentaires, non demandés : la page ne porte que les faits
`_INST` (Page de suivi), `_MDAT`, égal à l'heure de la nouvelle révision, et
`_SKEY` ; sa seule catégorie est Page de suivi ; aucun lien vers une page
inexistante, et le lien vers le lot 24 est enregistré.

## Écarts et surprises

- **La chaîne de la vérification 1 ne correspondait plus à l'entrée écrite.**
  Résultat donné tel quel, 0, avec le contrôle correspondant à côté ; rien n'a
  été écrit pour faire correspondre un compte attendu.
- **Deux de mes affirmations antérieures étaient fausses, et la première
  version de l'entrée en avait hérité.**
  - Dans `travaux/lot-3-cloture.md` : « Au-delà de 200, il tronquerait sans
    le dire ». C'était une déduction, tirée d'une remarque de la consigne qui
    portait sur `action=ask`, et elle est fausse avec les réglages par
    défaut, puisqu'une page affiche « ... autres résultats » au-delà du
    plafond. Les prévisualisations faites plus tard le même soir ont paru la
    confirmer, parce que j'y avais moi-même vidé `searchlabel`, ce qui
    supprime ce lien.
  - Dans `travaux/lot-44-correctifs-cloture-lot-3.md` : « aucun tableau du
    wiki ne dépasse aujourd'hui 500 lignes pour le vérifier ». Le
    raisonnement était faux : une prévisualisation d'une requête au format
    tableau sur plus de 500 pages le mesurait en un appel.

  Ces deux rapports ne sont pas retouchés ; ce paragraphe tient lieu de
  correction. C'est le cas que décrit `CLAUDE.md` : « Une mesure ne vaut que
  si elle mesure ce qu'on croit ». Un paramètre de la requête avait fabriqué
  le résultat observé.
- **Les dates.** Les mesures du soir ont été faites le 6 novembre entre
  23:13 et 23:27 UTC, soit le 7 après minuit à Paris, fuseau du wiki. Les
  vérifications de Cyril datent du 7. « Les 6 et 7 novembre 2026 » couvre les
  deux lectures.
- **Le tour interrompu, puis repris sur « Reprenons »** : voir le canal
  direct plus haut.
