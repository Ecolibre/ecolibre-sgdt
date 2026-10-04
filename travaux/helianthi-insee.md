# Helianthi et Attribut:INSEE code — 7 septembre 2026

Suite de `travaux/rangs-correction.md`, où Helianthi et `Attribut:INSEE
code` avaient été laissés de côté.

## 1. Helianthi — plage, pas deux plantations

Décision de Cyril : le Helianthi est traçant, les 50 cm se combleront l'an
prochain, une plage décrit mieux l'occupation réelle que deux points.
Aucune seconde page créée.

`Helianthi — Le Buisson de Cerzat (ECL-0020)` : `Planting_rank=48,7 + 49,2`
remplacé par `Planting_rank=48,7` / `Planting_rank_end=49,2`. Édition
`[Correctif] Planting_rank — plage saisie dans un champ unique`, relecture
du wikitexte après écriture — conforme. `browsebysubject` confirme les deux
valeurs stockées séparément (`Planting_rank -> ['48.7']`,
`Planting_rank_end -> ['49.2']`) et l'absence de `_ERRC`.

## 2. Attribut:INSEE code — Property_range raccourci

Le verrou `smw-change-propagation-protection` était levé (`prop=info`,
`protection: []`, comme les quatre autres pages concernées). La valeur en
place de `Property_range` faisait 90 caractères (94 octets UTF-8) — au-delà
du plafond de 85 du type Keyword, d'où l'annotation jamais stockée depuis
la création de la page.

Texte de remplacement, celui préparé en tâche 1 du lot 11 : « code INSEE
commune, 5 caractères — 0 initial possible, 2A/2B Corse » — 66 caractères,
69 octets, sens conservé. Compté par script avant l'envoi, pas à l'œil.

Une seule tentative d'écriture, réussie du premier coup — le verrou n'est
pas revenu. Résumé : `[Correctif] Property_range raccourci sous le plafond
de 85 caractères — annotation rejetée depuis la création`.

Vérification par `browsebysubject` : `Property_range` est **direct**
(`['code INSEE commune, 5 caractères — 0 initial possible, 2A/2B Corse']`),
pas en attente dans `_CHGPRO` — la lecture n'est donc pas tombée dans le
piège de propagation différée déjà rencontré le 19 août 2026. Aucun
`_ERRC` sur la page.

## 3. Compteur global

`bin/wiki-api.sh "action=ask&query=[[_ERRC::+]]&format=json"` (requête en
liste, jamais `format=count`) rend **zéro résultat**. Erreurs de traitement
SMW retombe à 0 — première fois mesurée dans cette série de sessions. Le
compteur n'a pas tardé : la première lecture était déjà à zéro, purge non
nécessaire.

## 4. Correctif de rapport

`travaux/rangs-correction.md`, section 2, datait la présence de
`Attribut:INSEE code` dans la liste des pages en erreur du « 16 août
2026 » — c'était la date de découverte du verrou de propagation sur les
15 pages `Attribut:`, pas celle de la création de cette propriété. Corrigé
en « 21 août 2026 », qui est la date de création de la page
(`touched`/`lastrevid` initial confirmés par `prop=info`).
