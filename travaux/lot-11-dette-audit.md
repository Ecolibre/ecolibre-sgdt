# Lot 11 — dette de l'audit : leçon CLAUDE.md, contrôle des pages de doc, horodatage

2026-08-21. Trois points courts avant la tâche 4. Points 1 et 3 :
diff proposé, rien écrit. Point 2 : lecture seule, rien corrigé.

## 1. CLAUDE.md — diff proposé, arrêt à la proposition

Insertion juste après la leçon existante sur les exemples de syntaxe SMW
(après le paragraphe « Contrôle à faire », avant « Une convention rédigée
de mémoire ne fait pas foi »), comme variante concrète :

```diff
   **Contrôle à faire** après toute écriture sur une page de documentation :
   `browsebysubject` **sur cette page**, pour vérifier qu'elle ne porte que
   `_MDAT` et `_SKEY`. Une page qui décrit le modèle de données peut le polluer.
 
+- **Les backticks ne protègent rien en wikitexte.** Un exemple de syntaxe
+  SMW écrit entre backticks s'exécute comme une vraie annotation ou une
+  vraie requête. Seul `<nowiki>` protège. Ce piège est passé deux fois
+  dans la session du 21 août 2026 (`LOC` dans `Attribut:Location site`,
+  puis trois fragments dans *Limites connues*). Le patron maison est
+  `<code><nowiki>…</nowiki></code>`.
+
 - **Une convention rédigée de mémoire ne fait pas foi.** La convention de
   nommage des 73 fichiers du lot 9 a été dictée dans une forme inexacte
```

Non écrit — en attente de validation.

## 2. Contrôle des annotations involontaires — six pages, lecture seule

`browsebysubject` sans filtre, en cherchant tout ce qui dépasse
`_MDAT`, `_SKEY`, `_INST`, `_ASK` :

| Page | Faits au-delà des quatre attendus | Verdict |
|---|---|---|
| Limites connues du SGDT | aucun | propre |
| Récapitulatif technique | **`Item_ref -> ['+']`**, plus `_ERRC` | **polluée**, deux défauts distincts |
| Catégorie:Lieu | `_SUBC -> ['SGDT#14##']` | attendu, pas une pollution |
| Registre des préfixes de site | aucun | propre |
| Erreurs de traitement SMW | aucun | propre |
| Feuille de route du SGDT | aucun | propre |

**Catégorie:Lieu — `_SUBC` expliqué, pas un défaut.** C'est le fait
standard SMW « cette catégorie est sous-catégorie de X » (ici `SGDT`),
une structure de catégories normale sur une page `Catégorie:`, pas
l'exécution accidentelle d'un exemple. Rien à corriger.

**Récapitulatif technique — deux défauts, tous deux confirmés, rien
corrigé comme demandé.**
1. **`_ERRC` — l'erreur déjà connue.** Message rendu (relevé en clôture
   de tâche 1) : « La propriété « A le type » est une propriété
   déclarative et peut être utilisée seulement sur une page de propriété
   ou de catégorie. » Un `[[Has type::…]]` (ou `A le type` côté
   affichage) écrit sans échappement sur cette page de contenu, hors
   espace `Attribut:`/`Property:` — SMW le refuse, mais refuse
   silencieusement à l'affichage (l'écriture elle-même n'échoue pas).
2. **`Item_ref -> ['+']` — pollution non documentée jusqu'ici.** Un fait
   réel et stocké, pas une erreur : quelque part sur cette page, un
   `[[Item_ref::+]]` a été écrit sans `<nowiki>` et s'est exécuté comme
   une vraie annotation, exactement le mécanisme déjà consigné dans
   `CLAUDE.md` (§ *Un exemple de syntaxe SMW écrit dans une page de
   documentation crée une vraie annotation*) — mais l'incident du
   16 août 2026 qui a inspiré cette leçon visait *Limites connues du
   SGDT* (aujourd'hui propre, vérifié ci-dessus), pas ce
   `Récapitulatif technique`-ci. Second exemplaire du même piège, sur
   une autre page, jamais assaini. `Item_ref::+` fausse potentiellement
   tout comptage réel du wiki qui s'appuierait sur cette propriété et
   croiserait cette page — même nature de risque que le cas `Main_image`
   déjà noté dans `CLAUDE.md`.

Les 14 `_ASK` et les deux `_INST` (`SGDT`, `Pages avec des liens de
fichiers brisés`) sur cette même page sont attendus : la page embarque
légitimement des requêtes et appartient à deux catégories.

## 3. Horodatage — diff proposé, arrêt à la proposition

```diff
 '''Nombre de pages en erreur''' : {{#ask:
 [[_ERRC::+]]
 |format=count
 |limit=500
 }}
-(recalculé à chaque reparse de la page ; SMW l'invalide quand une des
-pages listées change)
+(recalculé au reparse de la page ; SMW l'invalide quand une page listée
+change, mais l'invalidation passe par la file de travaux et peut
+tarder — purger la page pour forcer le recalcul)
```

Non écrit — en attente de validation.
