# Lot 24 — Tâche 2 : ouvrir le lot et aligner les trois écrits

## Ce qui a été écrit

1. `Lot 24 — Adminsys autonome` (revid 1253 → 1330) : `Work_package_status`
   `identifié` → `ouvert`, `Work_package_opening_date` = `2026-09-10`. Ajout
   des deux paragraphes de l'étape 3 en tête de `== Points ouverts ==`, rien
   d'autre touché dans cette section ni ailleurs sur la page.
2. `Comment ce wiki est tenu` (revid 1329 → 1331) : ajout de
   `4.0 International` après « dans les mêmes conditions », dans la section
   « Ce qui est public ». Rien d'autre modifié — la section « Nous joindre »,
   déjà changée depuis la tâche 7 (le lien `écrivez-nous` pointe maintenant
   vers `https://ecolibre.org/?Contact`), a été relue et recopiée telle
   quelle, sans y toucher.
3. `Limites connues du Système de Gestion de Données Techniques`
   (revid 1314 → 1332) : dans l'entrée qui porte sur la compatibilité des
   sources botaniques, « Le wiki est sous CC BY-SA. » devient « Le wiki est
   sous CC BY-SA 4.0, déclarée dans la configuration du site depuis le
   10 septembre 2026 et visible au pied de chaque page. » Rien d'autre dans
   l'entrée n'a changé (règle de travail sur les sources botaniques
   intacte), et aucune autre entrée n'a bougé (`diff` complet avant/après,
   voir vérification 3).
4. `Transmettre vos outils et vos machines` : relue, aucune mention de
   licence n'y figure. Conformément à l'étape 2.3, rien n'y a été ajouté.

Résumés : `[Lot 24][Tâche 2] Ouverture — …`, `[Lot 24][Tâche 2] Précision de
version — …`, `[Lot 24][Tâche 2] Entrée 43 — …`.

## Vérifications (étape 4)

1. **`browsebysubject` sur le lot 24** : `Work_package_status -> ['ouvert']`,
   `Work_package_opening_date -> ['1/2026/9/10']`, `Work_package_summary`
   porte toujours une seule valeur (la phrase d'objet inchangée). Conforme.
2. **Index `Gestion des lots`**, purgé puis relu par `action=parse` : la
   section « En cours » rend deux lignes, `Lot 24 — Adminsys autonome` et
   `Lot 27 — Conduite du projet`. Le bloc « Compte » rend
   `Lots au total : 31`, `En cours : 2`, `Faits : 12`, `À venir : 17`,
   `Abandonnés : 0` — la somme fait 31, et le total est resté 31 (aucun lot
   créé, un lot déplacé de section). Conforme.
3. **Limites connues, comparaison avant/après** : `diff` entre le wikitexte
   lu avant écriture et celui relu après est vide en contenu (une seule
   différence, l'absence de saut de ligne final côté lecture API, sans
   incidence). Compte d'entrées numérotées (`grep -c "^# "`) : **51 avant,
   51 après** — inchangé, seule l'entrée 43 a été modifiée. Voir « Écarts et
   surprises » : ce compte ne vaut pas 47, contrairement à ce que la
   consigne annonçait.
4. **`action=parse` sur `Comment ce wiki est tenu`** : `4.0 International`
   apparaît dans le rendu, aucun `[[`, `]]`, `{{` ni `}}` littéral. Le
   wikitexte relu après écriture est identique à ce qui a été envoyé (`diff`
   vide, hors fin de fichier). `browsebysubject` sur la page ne rend
   toujours que `_MDAT` et `_SKEY` : aucune annotation sémantique. Conforme.

## Écarts et surprises

**Le compte des Limites connues n'est pas quarante-sept, il est
cinquante et un.** Mesuré deux fois, avant et après l'écriture de l'entrée
43 (`grep -c "^# "` sur le wikitexte brut, entrée par ligne puisque chaque
entrée y tient sur une seule ligne physique, conformément à la convention de
la page) : 51 dans les deux cas. L'entrée 43 elle-même, en revanche, est
bien celle attendue — j'ai vérifié sa position par comptage avant de
l'éditer, et son contenu (« La compatibilité des sources botaniques avec la
licence du wiki n'est pas tranchée ») correspond à ce que la consigne
décrivait. Je n'ai pas cherché à faire correspondre le compte à 47 : la
règle de méthode est de signaler l'écart, pas de le lisser. Le chiffre de
47 était peut-être juste à une date antérieure — plusieurs tâches récentes
(lot 27, tâches 2/4/6, portant sur le durcissement de l'ouverture de cette
page) ont pu ajouter des entrées depuis.

Rien d'autre à signaler : aucune permission refusée, aucune session
expirée, aucune confirmation shell rencontrée. La page `Comment ce wiki est
tenu` avait changé depuis la tâche 7 (ajout d'un vrai lien de contact dans
« Nous joindre », visiblement fait par Cyril) — relu avant d'écrire, comme
l'exige la règle de la consigne, et reporté sans y toucher.
