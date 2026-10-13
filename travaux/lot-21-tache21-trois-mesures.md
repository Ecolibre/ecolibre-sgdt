# Lot 21, tâche 21 — Trois mesures avant d'inscrire (reprise)

Reprise du 13 octobre 2026. Environnement Claude Code hébergé (cloud), branche `ccr-ad6f0bcb-wsc18c`, session wiki ouverte par `bin/wiki-login.sh` sous le compte `Cywil` (id 4). Écritures sur le wiki de 21:28:34 à 21:36:32 UTC, relevés jusqu'à 21:43:20 UTC. La première exécution, arrêtée le même jour avant toute écriture, est reprise en annexe.

## Les trois réponses

**Mesure A.** La remontée d'un sous-objet à son item fonctionne, mais pas sous la forme de R3. R2 rend les trois sous-objets avec, dans sa colonne `-Has subobject`, l'item de chacun (machine A, B, C). R3, `[[-Has subobject.Test lot21d épaisseur::+]]`, ne rend aucun résultat : en condition, le signe moins fait chercher les sous-objets des porteurs de l'épaisseur, porteurs qui sont eux-mêmes des sous-objets. Hors consigne, `[[Has subobject.Test lot21d épaisseur::+]]`, sans le signe moins, rend les trois items.

**Mesure B.** Le paramètre est substitué : aux deux relevés, chaque sous-objet porte une propriété nommée `Test_lot21d_épaisseur`, de valeur numérique, et aucune propriété dont le nom littéral contient des accolades.

**Mesure C.** Le comparateur `>` n'est pas strict sur cette Quantity avec unité : R5 (`>0,3 mm`) rend B et C, R7 (`>0,2 mm`) rend A, B et C, et la condition stockée de R5 est `≥0,0003 m`. Les trois saisies 0.2, 0,3 et 0.5 sont stockées sous la même forme, un nombre en mètres (0.0002, 0.0003, 0.0005). Hors consigne, `>>0,3 mm` ne rend que C.

**Sur le critère bloquant de la consigne** (« si aucune des deux ne rend les items ») : ni R2 ni R3 ne rend les items comme lignes de résultat. R2 les donne dans sa colonne, R3 ne rend rien. Je ne sais pas si la consigne comptait la colonne de R2 comme une remontée. En condition, la remontée existe sous une autre forme que celle de R3, mesurée hors consigne : voir « Mesure A » plus bas.

## Étape 0 — État du dépôt

`git status` au début :

```
On branch ccr-ad6f0bcb-wsc18c
nothing to commit, working tree clean
```

Branche courante : `ccr-ad6f0bcb-wsc18c`. Aucune ligne M, A, D ou R, aucune ligne ??.

Les huit fichiers sont présents, aucun ne manque (`ls -la pages/`, extrait) :

```
-rw-r--r--  1 root root   391 Oct 13 21:24 Lot21d_essai_01_epaisseur.txt
-rw-r--r--  1 root root   181 Oct 13 21:24 Lot21d_essai_02_role.txt
-rw-r--r--  1 root root   329 Oct 13 21:24 Lot21d_essai_03_modele.txt
-rw-r--r--  1 root root   123 Oct 13 21:24 Lot21d_essai_04_role_page.txt
-rw-r--r--  1 root root   272 Oct 13 21:24 Lot21d_essai_05_machine_a.txt
-rw-r--r--  1 root root   272 Oct 13 21:24 Lot21d_essai_06_machine_b.txt
-rw-r--r--  1 root root   272 Oct 13 21:24 Lot21d_essai_07_machine_c.txt
-rw-r--r--  1 root root  1201 Oct 13 21:24 Lot21d_essai_08_requetes.txt
```

Les fichiers 01 et 02 ont été comparés par `diff` au texte que redonne la consigne, recopié dans le scratchpad : identiques.

`travaux/lot-21-tache21-trois-mesures.md` existait (6 630 octets) : c'était le rapport de blocage du 13 octobre. Il est remplacé par celui-ci et repris en annexe.

`.claude/settings.local.json` était absent au début (`cat` : « No such file or directory ») et l'est encore à la fin (`ls -la .claude/` ne montre que `commands/` et `settings.json`). Il ne porte donc aucune règle.

**La branche était en retard sur `main`.** `git fetch origin main` a rendu `1592203..95e6eb6`. La branche de session était en `a4c7b63`, et `origin/main` un commit plus loin, en `95e6eb6` : « [Saisie] Rapport : sept items organiques et deux organisations du dossier roue de vélo ». Ce commit ne touche qu'un fichier, `travaux/saisie-2026-10-13-items-roue-velo.md`, et il a été poussé à 21:24:43 UTC par une autre session. `859901f` est bien sur `main`, comme l'annonce la consigne. Pour que la poussée finale `HEAD:main` soit une avance rapide, j'ai ramené la branche par `git merge --ff-only origin/main` : `Updating a4c7b63..95e6eb6`, `Fast-forward`, un fichier, 122 insertions. Voir « Écarts et surprises », point 1.

**Lectures faites avant toute écriture**, pour ne pas reprendre les chiffres de la consigne sans les mesurer :

- `[[_ERRC::+]]` par `action=ask` : `"count": 1`, un seul sujet, `Utilisateur:Cywil/Bac à sable/Lot21c pompe#saisie-douteux`. Conforme à la consigne.
- `Module:Nombre`, lu en entier par `bin/wiki-get.sh` :

  ```lua
  local p = {}

  -- Normalise un nombre saisi avec un point décimal vers la virgule, seul
  -- séparateur accepté par SMW sur ce wiki (langue de contenu : fr, mesuré le
  -- 19 août 2026). Ne convertit que le cas non ambigu : un seul point et
  -- aucune virgule. Tout autre cas est retourné inchangé, pour que SMW refuse
  -- visiblement plutôt que d'enregistrer une valeur devinée.
  function p.virgule(frame)
      local v = mw.text.trim(frame.args[1] or '')
      if v == '' then return '' end
      if v:find(',', 1, true) then return v end
      local _, n = v:gsub('%.', '')
      if n ~= 1 then return v end
      return (v:gsub('%.', ','))
  end

  return p
  ```

- *Limites connues*, entrée 55 (55e ligne `# ` du wikitexte) : « Les comparateurs des requêtes ne sont pas stricts. […] Constaté le 4 octobre 2026 en bac à sable (lot 21, tâche 2), dans la condition stockée des requêtes. Un seuil qu'on veut exclure doit donc être écrit juste au-delà. »

## Étape 1 — Les deux propriétés : journal de la barrière

Session ouverte par `bin/wiki-login.sh` : `Success Cywil`. P1 traitée entièrement avant la création de P2. Chaque tour : une pause de 60 s par `sleep` en arrière-plan, attendue jusqu'à sa notification de fin, puis `bin/wiki-api.sh --facts` et `intestactions=edit&intestactionsdetail=full` sur la page de propriété, rien d'autre.

### P1 — `Attribut:Test lot21d épaisseur`, type résolu attendu `_qty`

Avant la création, `action=query&prop=info&inprop=protection` a rendu `"missing": true`, `"protection": []` et l'espace de noms 102.

Création :

```
bin/wiki-put.sh "Attribut:Test lot21d épaisseur" pages/Lot21d_essai_01_epaisseur.txt "[Lot 21][Tâche 21] Propriété d'essai créée seule" --createonly
→ "new": true, "result": "Success", "pageid": 661, "newrevid": 1588, "newtimestamp": "2026-10-13T21:28:34Z"
```

| Tour | Lecture (UTC) | `_CHGPRO` | `_TYPE` direct | Verrou (`edit`) | `touched` |
|---|---|---|---|---|---|
| 1 | 21:29:44 | présent | non | `smw-change-propagation-protection` | 21:28:35 |
| 2 | 21:30:55 | absent | oui, `_qty` | `smw-change-propagation-protection` | 21:30:03 |

Tour 1, `bin/wiki-api.sh --facts "subject=Test_lot21d_épaisseur&ns=102"` :

```
_CHGPRO -> ['{"subject":"Test_lot21d_\\u00e9paisseur#102##","data":[{"property":"Property_description_FR","dataitem":[{"type":2,"item":"Propri\\u00e9t\\u00e9 d\'essai du lot 21 : une \\u00e9paisseur, pour mesurer la remont\\u00e9e d\'un sous-objet \\u00e0 son item, le mod\\u00e8le de saisie g\\u00e9n\\u00e9rique et la stricte des comparateurs. Ne pas supprimer sans consigne."}]},{"property":"_CONV","dataitem":[{"type":2,"item":"1 m, metre"},{"type":2,"item":"1000 mm, millimetre"},{"type":2,"item":"100 cm, centimetre"}]},{"property":"_MDAT","dataitem":[{"type":6,"item":"1\\/2026\\/10\\/13\\/21\\/28\\/34\\/0"}]},{"property":"_SKEY","dataitem":[{"type":2,"item":"Test lot21d \\u00e9paisseur"}]},{"property":"_TYPE","dataitem":[{"type":5,"item":"http:\\/\\/semantic-mediawiki.org\\/swivt\\/1.0#_qty"}]},{"property":"_UNIT","dataitem":[{"type":2,"item":"mm, cm, m"}]}],"serializer":"SMW\\\\Serializers\\\\SemanticDataSerializer","version":2}']
_SKEY -> ['Test lot21d épaisseur']
```

Tour 2 :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : une épaisseur, pour mesurer la remontée d'un sous-objet à son item, le modèle de saisie générique et la stricte des comparateurs. Ne pas supprimer sans consigne."]
_CONV -> ['1 m, metre', '1000 mm, millimetre', '100 cm, centimetre']
_MDAT -> ['1/2026/10/13/21/28/34/0']
_SKEY -> ['Test lot21d épaisseur']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_qty']
_UNIT -> ['mm, cm, m']
```

Verrou, identique aux deux tours (`intestactions`, extrait) :

```
"edit": [{"code": "smw-change-propagation-protection", "text": "This page is locked to prevent accidental data modification while a [https://www.semantic-mediawiki.org/wiki/Change_propagation change propagation] update is run. The process may take a moment before the page is unlocked as it depends on the size and frequency of the [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Job_queue job queue] scheduler."}]
```

L'attente a pris fin au tour 2, verrou toujours posé : ce n'est pas un critère.

Type résolu, par `action=ask&query=[[Test lot21d épaisseur::+]]|?Test lot21d épaisseur|?Max thickness|limit=1&format=json`, `query.printrequests` :

```
{"label": "", "key": "", "redi": "", "typeid": "_wpg", "mode": 2, "format": false}
{"label": "Test lot21d épaisseur", "key": "Test_lot21d_épaisseur", "redi": "", "typeid": "_qty", "mode": 1, "format": ""}
{"label": "Max thickness", "key": "Max_thickness", "redi": "", "typeid": "_num", "mode": 1, "format": ""}
"results": [], "count": 0
```

P1 est conforme : type résolu `_qty`, et le témoin rend bien `_num`.

### P2 — `Attribut:Test lot21d rôle`, type résolu attendu `_wpg`

Avant la création : `"missing": true`, `"protection": []`, espace de noms 102.

Création :

```
bin/wiki-put.sh "Attribut:Test lot21d rôle" pages/Lot21d_essai_02_role.txt "[Lot 21][Tâche 21] Propriété d'essai créée seule" --createonly
→ "new": true, "result": "Success", "pageid": 662, "newrevid": 1589, "newtimestamp": "2026-10-13T21:31:12Z"
```

| Tour | Lecture (UTC) | `_CHGPRO` | `_TYPE` direct | Verrou (`edit`) | `touched` |
|---|---|---|---|---|---|
| 1 | 21:32:19 | présent | non | `smw-change-propagation-protection` | 21:31:12 |
| 2 | 21:33:28 | présent | non | `smw-change-propagation-protection` | 21:31:12 |
| 3 | 21:34:37 | présent | non | `smw-change-propagation-protection` | 21:31:12 |
| 4 | 21:35:47 | absent | oui, `_wpg` | `smw-change-propagation-protection` | 21:35:02 |

Tours 1, 2 et 3, même sortie à chaque tour (`bin/wiki-api.sh --facts "subject=Test_lot21d_rôle&ns=102"`) :

```
_CHGPRO -> ['{"subject":"Test_lot21d_r\\u00f4le#102##","data":[{"property":"Property_description_FR","dataitem":[{"type":2,"item":"Propri\\u00e9t\\u00e9 d\'essai du lot 21 : le r\\u00f4le d\'une caract\\u00e9ristique, port\\u00e9 par une page de vocabulaire. Ne pas supprimer sans consigne."}]},{"property":"_MDAT","dataitem":[{"type":6,"item":"1\\/2026\\/10\\/13\\/21\\/31\\/12\\/0"}]},{"property":"_SKEY","dataitem":[{"type":2,"item":"Test lot21d r\\u00f4le"}]},{"property":"_TYPE","dataitem":[{"type":5,"item":"http:\\/\\/semantic-mediawiki.org\\/swivt\\/1.0#_wpg"}]}],"serializer":"SMW\\\\Serializers\\\\SemanticDataSerializer","version":2}']
_SKEY -> ['Test lot21d rôle']
```

Tour 4 :

```
Property_description_FR -> ["Propriété d'essai du lot 21 : le rôle d'une caractéristique, porté par une page de vocabulaire. Ne pas supprimer sans consigne."]
_MDAT -> ['1/2026/10/13/21/31/12/0']
_SKEY -> ['Test lot21d rôle']
_TYPE -> ['http://semantic-mediawiki.org/swivt/1.0#_wpg']
```

Le texte du verrou était le même que pour P1, aux quatre tours. L'attente a pris fin au tour 4.

Type résolu, par `action=ask&query=[[Test lot21d rôle::+]]|?Test lot21d rôle|?Max thickness|limit=1&format=json` :

```
{"label": "", "key": "", "redi": "", "typeid": "_wpg", "mode": 2, "format": false}
{"label": "Test lot21d rôle", "key": "Test_lot21d_rôle", "redi": "", "typeid": "_wpg", "mode": 1, "format": ""}
{"label": "Max thickness", "key": "Max_thickness", "redi": "", "typeid": "_num", "mode": 1, "format": ""}
"results": [], "count": 0
```

P2 est conforme : type résolu `_wpg` comme attendu, et le témoin rend bien `_num`.

**État du verrou en fin de tâche**, relu à 21:43:20 UTC : `smw-change-propagation-protection` sur `edit`, toujours posé sur les deux pages, `touched` inchangés (21:30:03 et 21:35:02).

## Étape 2 — Les huit créations

Contrôle préalable des six titres de l'étape 2, en une seule lecture `prop=info&inprop=protection` : les six rendent `"missing": true` et `"protection": []`.

| Fichier | Page | pageid | Révision | Horodatage (UTC) |
|---|---|---|---|---|
| 01 | Attribut:Test lot21d épaisseur | 661 | 1588 | 2026-10-13T21:28:34Z |
| 02 | Attribut:Test lot21d rôle | 662 | 1589 | 2026-10-13T21:31:12Z |
| 03 | Modèle:Test lot21d caractéristique | 663 | 1590 | 2026-10-13T21:36:08Z |
| 04 | Utilisateur:Cywil/Bac à sable/Lot21d maximal admissible | 664 | 1591 | 2026-10-13T21:36:14Z |
| 05 | Utilisateur:Cywil/Bac à sable/Lot21d machine A | 665 | 1592 | 2026-10-13T21:36:18Z |
| 06 | Utilisateur:Cywil/Bac à sable/Lot21d machine B | 666 | 1593 | 2026-10-13T21:36:23Z |
| 07 | Utilisateur:Cywil/Bac à sable/Lot21d machine C | 667 | 1594 | 2026-10-13T21:36:27Z |
| 08 | Utilisateur:Cywil/Bac à sable/Lot21d requêtes | 668 | 1595 | 2026-10-13T21:36:32Z |

Les huit pages ont été créées par `bin/wiki-put.sh … --createonly`, avec `"new": true` et `"result": "Success"` à chaque fois. Les deux propriétés portent le résumé « [Lot 21][Tâche 21] Propriété d'essai créée seule », les six autres pages « [Lot 21][Tâche 21] Essai en bac à sable - à conserver jusqu'à nouvel ordre ». Les fichiers 05, 06 et 07 ont été envoyés tels quels : `nombre=0.2`, `nombre=0,3`, `nombre=0.5`.

## Étape 3 — Relevés

### 3.1 File de travaux (21:36:52 UTC)

```
essai 1 : jobs=14
essai 2 : jobs=14
essai 3 : jobs=14
essai 4 : jobs=14
essai 5 : jobs=14
FILE FIGEE a 14 travaux — inutile d'attendre davantage
```

La consigne annonce ce cas comme non bloquant : j'ai poursuivi.

### 3.2 État 0, avant toute purge (21:37:02 UTC)

Requête : `action=parse&page=Utilisateur:Cywil/Bac à sable/Lot21d requêtes&prop=text`. Le rendu servi venait du cache d'analyse, enregistré à 21:36:32 UTC lors de la création de la page (`Cached time: 20261013213632`, révision 1595). Il est donc postérieur au stockage des trois machines, créées entre 21:36:18 et 21:36:27.

Voici le texte du rendu, extrait du HTML par `rendu.py`. Les balises sont retirées et ` | ` sépare les cellules. Dans une cellule de valeur, le premier terme est la valeur affichée, la suite est le contenu de l'infobulle :

```
Page d'essai du lot 21 : les requêtes qui éprouvent la remontée d'un sous-objet à son item, et la stricte des comparateurs. Ne pas supprimer sans consigne.
Sommaire
1 R1
2 R2
3 R3
4 R4
5 R5
6 R6
7 R7
R1[modifier | modifier le wikicode]
Sujet | Test lot21d épaisseur | Test lot21d rôle |
Cywil/Bac à sable/Lot21d machine A | 0,2 mm0,02 cm <br />2,0e-4 m <br /> | Cywil/Bac à sable/Lot21d maximal admissible |
Cywil/Bac à sable/Lot21d machine B | 0,3 mm0,03 cm <br />3,0e-4 m <br /> | Cywil/Bac à sable/Lot21d maximal admissible |
Cywil/Bac à sable/Lot21d machine C | 0,5 mm0,05 cm <br />5,0e-4 m <br /> | Cywil/Bac à sable/Lot21d maximal admissible |
R2[modifier | modifier le wikicode]
Sujet | -Possède un sous-objet« -Possède un sous-objet <span style="font-size:small;">(-Has subobject)</span> » est une propriété prédéfinie fournie par MediaWiki Sémantique et qui représente un constructeur de conteneur. |
Cywil/Bac à sable/Lot21d machine A | Cywil/Bac à sable/Lot21d machine A |
Cywil/Bac à sable/Lot21d machine B | Cywil/Bac à sable/Lot21d machine B |
Cywil/Bac à sable/Lot21d machine C | Cywil/Bac à sable/Lot21d machine C |
R3[modifier | modifier le wikicode]
AUCUN RÉSULTAT
R4[modifier | modifier le wikicode]
AUCUN RÉSULTAT
R5[modifier | modifier le wikicode]
Sujet | Test lot21d épaisseur |
Cywil/Bac à sable/Lot21d machine B | 0,3 mm0,03 cm <br />3,0e-4 m <br /> |
Cywil/Bac à sable/Lot21d machine C | 0,5 mm0,05 cm <br />5,0e-4 m <br /> |
R6[modifier | modifier le wikicode]
AUCUN RÉSULTAT
R7[modifier | modifier le wikicode]
Sujet | Test lot21d épaisseur |
Cywil/Bac à sable/Lot21d machine A | 0,2 mm0,02 cm <br />2,0e-4 m <br /> |
Cywil/Bac à sable/Lot21d machine B | 0,3 mm0,03 cm <br />3,0e-4 m <br /> |
Cywil/Bac à sable/Lot21d machine C | 0,5 mm0,05 cm <br />5,0e-4 m <br /> |
```

Cible des liens de la colonne du sujet, relevée dans le HTML. Toutes les lignes de R1, R2, R5 et R7 portent la classe `smw-subobject-entity` :

| Ligne affichée | Présente dans | Cible du lien |
|---|---|---|
| Cywil/Bac à sable/Lot21d machine A | R1, R2, R7 | `/wiki/Utilisateur:Cywil/Bac_%C3%A0_sable/Lot21d_machine_A#_b82ae629de2ccbbbc9c886aa341873a6` |
| Cywil/Bac à sable/Lot21d machine B | R1, R2, R5, R7 | `/wiki/Utilisateur:Cywil/Bac_%C3%A0_sable/Lot21d_machine_B#_8cb987319781a328671b849acc76a51a` |
| Cywil/Bac à sable/Lot21d machine C | R1, R2, R5, R7 | `/wiki/Utilisateur:Cywil/Bac_%C3%A0_sable/Lot21d_machine_C#_ce25348cf3d3ddd7545e4b2a1204239b` |

La colonne `-Possède un sous-objet` de R2 a la classe `smwtype__sob` (écrite `smwtype&#95;_sob` dans le HTML). Elle porte des liens sans fragment : `/wiki/Utilisateur:Cywil/Bac_%C3%A0_sable/Lot21d_machine_A`, `…_B` et `…_C`, chacun en face de son propre sous-objet.

Les cellules de valeur de R1, R5 et R7 ont la forme suivante (machine A dans R1) :

```
<td class="Test-lot21d-épaisseur smwtype_qty" data-sort-value="0.0002"><span class="smw-highlighter" data-type="3" data-state="inline" data-title="Conversion d’unité" title="0,02 cm 2,0e-4 m"><span class="smwtext">0,2&#160;mm</span><span class="smwttcontent">0,02&#160;cm &lt;br /&gt;2,0e-4&#160;m &lt;br /&gt;</span></span></td>
```

`data-sort-value` vaut 0.0003 pour B et 0.0005 pour C.

Avertissements de Semantic MediaWiki : aucun. Le HTML ne contient aucune occurrence de `data-type="4"`, `data-type="5"`, `smw-warning`, `smwtticon`, `error`, `erreur` ni `avertissement` (compte : 0). Ses seules infobulles sont une de type 1 (« Propriété », en-tête de R2) et huit de type 3 (« Conversion d’unité » : trois dans R1, deux dans R5, trois dans R7).

### 3.3 Relevé 1 (21:37 UTC)

Requête : `action=smwbrowse&browse=subject`, en JSON brut, sur chaque page puis sur chaque sous-objet nommé par son `_SOBJ`, passé dans le paramètre `subobject`. Exemple pour le sous-objet de A : `params={"subject":"Cywil/Bac_à_sable/Lot21d_machine_A","ns":2,"subobject":"_b82ae629de2ccbbbc9c886aa341873a6"}`. Le script `faits.py` met chaque réponse en lignes, sans rien changer aux valeurs : une ligne par valeur, sous la forme `propriété | type | valeur brute`. Le type est le code d'élément de données de SMW : 1 nombre, 2 texte, 6 date, 9 page. « sobj inclus » désigne le bloc `query.sobj` que `smwbrowse` joint à la réponse d'une page.

Page A :

```
sujet : Cywil/Bac_à_sable/Lot21d_machine_A#2##
_MDAT | type 6 | 1/2026/10/13/21/36/18/0
_SKEY | type 2 | Cywil/Bac à sable/Lot21d machine A
_SOBJ | type 9 | Cywil/Bac_à_sable/Lot21d_machine_A#2##_b82ae629de2ccbbbc9c886aa341873a6
  sobj inclus : Cywil/Bac_à_sable/Lot21d_machine_A#2##_b82ae629de2ccbbbc9c886aa341873a6
   Test_lot21d_rôle | type 9 | Cywil/Bac_à_sable/Lot21d_maximal_admissible#2##
   Test_lot21d_épaisseur | type 1 | 0.0002
   _SKEY | type 2 | Cywil/Bac à sable/Lot21d machine A# b82ae629de2ccbbbc9c886aa341873a6
```

Page B :

```
sujet : Cywil/Bac_à_sable/Lot21d_machine_B#2##
_MDAT | type 6 | 1/2026/10/13/21/36/23/0
_SKEY | type 2 | Cywil/Bac à sable/Lot21d machine B
_SOBJ | type 9 | Cywil/Bac_à_sable/Lot21d_machine_B#2##_8cb987319781a328671b849acc76a51a
  sobj inclus : Cywil/Bac_à_sable/Lot21d_machine_B#2##_8cb987319781a328671b849acc76a51a
   Test_lot21d_rôle | type 9 | Cywil/Bac_à_sable/Lot21d_maximal_admissible#2##
   Test_lot21d_épaisseur | type 1 | 0.0003
   _SKEY | type 2 | Cywil/Bac à sable/Lot21d machine B# 8cb987319781a328671b849acc76a51a
```

Page C :

```
sujet : Cywil/Bac_à_sable/Lot21d_machine_C#2##
_MDAT | type 6 | 1/2026/10/13/21/36/27/0
_SKEY | type 2 | Cywil/Bac à sable/Lot21d machine C
_SOBJ | type 9 | Cywil/Bac_à_sable/Lot21d_machine_C#2##_ce25348cf3d3ddd7545e4b2a1204239b
  sobj inclus : Cywil/Bac_à_sable/Lot21d_machine_C#2##_ce25348cf3d3ddd7545e4b2a1204239b
   Test_lot21d_rôle | type 9 | Cywil/Bac_à_sable/Lot21d_maximal_admissible#2##
   Test_lot21d_épaisseur | type 1 | 0.0005
   _SKEY | type 2 | Cywil/Bac à sable/Lot21d machine C# ce25348cf3d3ddd7545e4b2a1204239b
```

Sous-objet de A, appelé par le paramètre `subobject` :

```
sujet : Cywil/Bac_à_sable/Lot21d_machine_A#2##_b82ae629de2ccbbbc9c886aa341873a6
Test_lot21d_rôle | type 9 | Cywil/Bac_à_sable/Lot21d_maximal_admissible#2##
Test_lot21d_épaisseur | type 1 | 0.0002
_SKEY | type 2 | Cywil/Bac à sable/Lot21d machine A# b82ae629de2ccbbbc9c886aa341873a6
```

Sous-objet de B :

```
sujet : Cywil/Bac_à_sable/Lot21d_machine_B#2##_8cb987319781a328671b849acc76a51a
Test_lot21d_rôle | type 9 | Cywil/Bac_à_sable/Lot21d_maximal_admissible#2##
Test_lot21d_épaisseur | type 1 | 0.0003
_SKEY | type 2 | Cywil/Bac à sable/Lot21d machine B# 8cb987319781a328671b849acc76a51a
```

Sous-objet de C :

```
sujet : Cywil/Bac_à_sable/Lot21d_machine_C#2##_ce25348cf3d3ddd7545e4b2a1204239b
Test_lot21d_rôle | type 9 | Cywil/Bac_à_sable/Lot21d_maximal_admissible#2##
Test_lot21d_épaisseur | type 1 | 0.0005
_SKEY | type 2 | Cywil/Bac à sable/Lot21d machine C# ce25348cf3d3ddd7545e4b2a1204239b
```

JSON brut complet du sous-objet de B, pour la sérialisation exacte :

```json
{
    "query": {
        "subject": "Cywil/Bac_à_sable/Lot21d_machine_B#2##_8cb987319781a328671b849acc76a51a",
        "data": [
            {
                "property": "Test_lot21d_rôle",
                "dataitem": [
                    {
                        "type": 9,
                        "item": "Cywil/Bac_à_sable/Lot21d_maximal_admissible#2##"
                    }
                ]
            },
            {
                "property": "Test_lot21d_épaisseur",
                "dataitem": [
                    {
                        "type": 1,
                        "item": "0.0003"
                    }
                ]
            },
            {
                "property": "_SKEY",
                "dataitem": [
                    {
                        "type": 2,
                        "item": "Cywil/Bac à sable/Lot21d machine B# 8cb987319781a328671b849acc76a51a"
                    }
                ]
            }
        ],
        "serializer": "SMW\\Serializers\\SemanticDataSerializer",
        "version": 2
    },
    "meta": {
        "type": "subject"
    }
}
```

Pour un sous-objet, la réponse dédiée et le bloc `query.sobj` joint à la page rendent les mêmes faits.

Aucun des six sujets ne porte `_ERRC` : il n'y avait aucun sous-objet d'erreur à rappeler. Cette absence est recoupée par le compte global de `[[_ERRC::+]]`, resté à 1 sur un autre sujet (vérification c).

### 3.4 Purge (21:38:18 UTC), puis file de travaux

`bin/wiki-purge.sh "Utilisateur:Cywil/Bac à sable/Lot21d machine A|Utilisateur:Cywil/Bac à sable/Lot21d machine B|Utilisateur:Cywil/Bac à sable/Lot21d machine C|Utilisateur:Cywil/Bac à sable/Lot21d requêtes"` :

```
{
    "batchcomplete": true,
    "purge": [
        {
            "ns": 2,
            "title": "Utilisateur:Cywil/Bac à sable/Lot21d machine A",
            "purged": true,
            "linkupdate": true
        },
        {
            "ns": 2,
            "title": "Utilisateur:Cywil/Bac à sable/Lot21d machine B",
            "purged": true,
            "linkupdate": true
        },
        {
            "ns": 2,
            "title": "Utilisateur:Cywil/Bac à sable/Lot21d machine C",
            "purged": true,
            "linkupdate": true
        },
        {
            "ns": 2,
            "title": "Utilisateur:Cywil/Bac à sable/Lot21d requêtes",
            "purged": true,
            "linkupdate": true
        }
    ]
}
```

`bin/wiki-wait-jobs.sh`, à 21:38:21 UTC :

```
essai 1 : jobs=0
FILE VIDE
```

### 3.5 Relevé 3 refait, puis rendu 2 refait (21:38 UTC)

Relevé : les six sorties (trois pages, trois sous-objets, mêmes `_SOBJ`) sont identiques à celles du relevé 1. Mesure : `diff` des six fichiers JSON bruts conservés dans le scratchpad, `r1_*.json` contre `r2_*.json`. Aucune différence, octet pour octet.

Rendu (21:38:52 UTC) : le texte est identique à celui de l'état 0, ligne pour ligne. Le `diff` des deux HTML ne trouve de différence que dans le rapport de l'analyseur :

```
34c34
< Cached time: 20261013213632
---
> Cached time: 20261013213852
40c40
< Real time usage: 0.293 seconds
---
> Real time usage: 0.186 seconds
54c54
< <!-- Saved in parser cache with key mediawiki_ecolibre_prod:pcache:idhash:668-0!dateformat=default and timestamp 20261013213632 and revision id 1595.
---
> <!-- Saved in parser cache with key mediawiki_ecolibre_prod:pcache:idhash:668-0!dateformat=default and timestamp 20261013213852 and revision id 1595.
```

Rien ne diffère entre l'état 0 et l'après-purge, ni dans ce qui est stocké, ni dans ce qui est affiché.

## Les trois réponses développées

Les recoupements marqués « hors consigne » sont des lectures `action=ask` ou `smwbrowse` faites par `bin/wiki-api.sh` après les relevés prescrits. Aucun n'écrit rien. Je les ai ajoutés parce que R3, R4 et R6 sont vides et qu'un relevé vide ne se conclut pas.

### Mesure A — remonter d'un sous-objet à son item

**R2**, `[[Test lot21d épaisseur::+]] |?-Has subobject`, rend des **sous-objets**, un par machine : `…Lot21d_machine_A#_b82ae629de2ccbbbc9c886aa341873a6`, `…machine_B#_8cb987319781a328671b849acc76a51a` et `…machine_C#_ce25348cf3d3ddd7545e4b2a1204239b`. Sa colonne s'intitule « -Possède un sous-objet », libellé français de `-Has subobject`, de type `_sob`. Elle porte, en face de chaque sous-objet, la page de l'item qui le contient : Cywil/Bac à sable/Lot21d machine A, B et C, par des liens sans fragment. Au rendu, la colonne du sujet et la colonne `-Has subobject` affichent le même texte : seule la cible du lien les distingue.

**R3**, `[[-Has subobject.Test lot21d épaisseur::+]]`, rend « AUCUN RÉSULTAT », avant comme après la purge : ni items, ni sous-objets.

R4 et R6 reposent sur la même chaîne `-Has subobject.` et sont vides elles aussi.

Recoupements, hors consigne :

1. `[[-Has subobject::Utilisateur:Cywil/Bac à sable/Lot21d machine A]]` rend un seul résultat, `"fulltext": "Utilisateur:Cywil/Bac à sable/Lot21d machine A# b82ae629de2ccbbbc9c886aa341873a6"`. En condition, `[[-Has subobject::P]]` désigne donc les sous-objets de P.
2. R3 telle quelle, lue par l'API, rend `"results": []` et `"count": 0`, sans erreur. L'API et la page disent la même chose.
3. `[[Has subobject.Test lot21d épaisseur::+]]` rend 3 résultats, `"count": 3`, qui sont les pages `Utilisateur:Cywil/Bac à sable/Lot21d machine A`, `… machine B` et `… machine C`, sans fragment.
4. Pendant de R6, `[[Has subobject.Test lot21d rôle::Utilisateur:Cywil/Bac à sable/Lot21d maximal admissible]]` rend machine A, B et C, `"count": 3`.
5. Pendant de R4, `[[Has subobject.Test lot21d épaisseur::>0,3 mm]] |?Has subobject.Test lot21d épaisseur` rend machine B (`"value": 0.0003, "unit": "m"`) et machine C (`"value": 0.0005, "unit": "m"`), `"count": 2`. La colonne chaînée est de type `_qty` (`"mode": 4`, `"chain": "Has subobject.Test lot21d épaisseur"`).

Lecture. D'après le recoupement 1, R3 demande les sous-objets des sujets qui portent l'épaisseur. Or ces sujets sont des sous-objets, et les relevés montrent qu'ils n'ont pas eux-mêmes de sous-objets : aucun `_SOBJ` parmi leurs faits. R3 est donc vide par construction, et R4 et R6 de même. Ce n'est pas la remontée qui manque, c'est le sens de la chaîne. Sur ce wiki, mesuré le 13 octobre 2026 sur trois items portant chacun un seul sous-objet :

- en colonne, sur des lignes de sous-objets : `?-Has subobject` donne l'item ;
- en condition, pour obtenir des items : `[[Has subobject.<grandeur>::…]]`, sans signe moins.

Cas non mesurés : un item portant plusieurs sous-objets de la même grandeur, et le tri ou la limite d'une requête chaînée sur un grand nombre d'items.

### Mesure B — un modèle qui écrit dans une propriété passée en paramètre

Au relevé 1 comme à celui de l'étape 3.5, chacun des trois sous-objets porte exactement trois faits :

- `Test_lot21d_rôle`, de type 9, valant `Cywil/Bac_à_sable/Lot21d_maximal_admissible#2##` ;
- `Test_lot21d_épaisseur`, de type 1, valant `0.0002`, `0.0003` et `0.0005` ;
- `_SKEY`.

Aucune propriété dont le nom contient des accolades, ni sur les sous-objets, ni sur les pages, dont les faits se limitent à `_MDAT`, `_SKEY` et `_SOBJ`. Le modèle reçoit le nom de la propriété en paramètre (`grandeur=Test lot21d épaisseur`), et SMW l'a pris comme nom de propriété avec son type résolu. La valeur est stockée comme un nombre (type 1), pas comme une page, et R1 l'affiche avec ses conversions d'unité. Pour une grandeur de type Quantity, une seule forme de saisie suffit donc. Cela n'a été mesuré que sur une grandeur.

### Mesure C — la stricte des comparateurs, et la forme stockée

R5, `[[Test lot21d épaisseur::>0,3 mm]]`, item par item :

- machine A (0,2 mm) : non rendue ;
- machine B (0,3 mm, égale au seuil) : rendue ;
- machine C (0,5 mm) : rendue.

R7, `[[Test lot21d épaisseur::>0,2 mm]]`, le contrôle :

- machine A (0,2 mm, égale au seuil) : rendue ;
- machine B (0,3 mm) : rendue ;
- machine C (0,5 mm) : rendue.

Les lignes rendues sont les sous-objets des machines (cibles `#_…`), pas les pages elles-mêmes.

Le comparateur `>` n'est donc pas strict pour une Quantity avec unité, comme l'annonce l'entrée 55. La méthode de l'entrée 55, la lecture de la condition stockée, donne la même conclusion. Hors consigne, `smwbrowse` sur la page des requêtes (champs `_ASKST`, `_ASKDE` et `_ASKSI` des sous-objets `_QUERY…`) rend :

```
_QUERYbcf9db108f6d878a1bb905c51408b12f  _ASKDE 1  _ASKSI 1  _ASKST [[Test lot21d épaisseur::+]]
_QUERYe3e55e6eaa409ed9aebd1b56903e70ca  _ASKDE 2  _ASKSI 2  _ASKST [[-Has subobject.Test lot21d épaisseur::+]]
_QUERY6110fa1aad61d19ab6de3bc2d9fe3586  _ASKDE 2  _ASKSI 3  _ASKST [[-Has subobject.Test lot21d épaisseur::≥0,0003 m]]
_QUERY985947f97313d28ebe1a28d575b1fea6  _ASKDE 1  _ASKSI 2  _ASKST [[Test lot21d épaisseur::≥0,0003 m]]
_QUERY567f8dd3cd671a89c41966922c2c746e  _ASKDE 2  _ASKSI 3  _ASKST [[-Has subobject.Test lot21d rôle::Utilisateur:Cywil/Bac à sable/Lot21d maximal admissible]]
_QUERYa6095e789b4617b6454ef12c3b8bbfc2  _ASKDE 1  _ASKSI 2  _ASKST [[Test lot21d épaisseur::≥0,0002 m]]
```

`>` y est compilé en `≥`, et le seuil converti dans l'unité de base, le mètre. La même condition que R5, lue par l'API, rend les mêmes deux sous-objets, B et C (`"count": 2`).

Hors consigne, une seule lecture : `[[Test lot21d épaisseur::>>0,3 mm]] |?Test lot21d épaisseur` rend un seul résultat, le sous-objet de C (`"value": 0.0005, "unit": "m"`, `"count": 1`). Sur ce cas, `>>` exclut la valeur égale au seuil. `<<` n'a pas été mesuré.

**Forme stockée.** Les saisies sont A `0.2` (point), B `0,3` (virgule) et C `0.5` (point). D'après la lecture du module, `Module:Nombre|virgule` change un point unique en virgule, et rend tel quel tout nombre qui contient déjà une virgule. La chaîne intermédiaire n'est pas observable, puisque `#subobject` n'affiche rien. Au stockage, on trouve trois nombres de type 1, `0.0002`, `0.0003` et `0.0005`, dans la même unité de base, le mètre (`Corresponds to::1 m, metre`). À l'affichage, `0,2 mm`, `0,3 mm` et `0,5 mm`, en `mm`, première unité de `Display units`. Le 0,3 saisi avec une virgule et les 0,2 et 0,5 saisis avec un point stockent donc la même forme.

## Vérifications

**a. Celle qui tranche.** Le relevé 1 et celui de l'étape 3.5 sont identiques, octet pour octet. Ce qui est stocké : trois sous-objets anonymes, un par machine. Chacun porte `Test_lot21d_épaisseur`, nombre en mètres (0.0002, 0.0003, 0.0005), et `Test_lot21d_rôle`, page `Lot21d maximal admissible`. Aucun ne porte `_ERRC`.

**b. Contenu.** `bin/wiki-verify.sh` sur les huit pages a rendu IDENTIQUE huit fois, avec une sortie 0 à chaque fois :

```
IDENTIQUE : Attribut:Test lot21d épaisseur
IDENTIQUE : Attribut:Test lot21d rôle
IDENTIQUE : Modèle:Test lot21d caractéristique
IDENTIQUE : Utilisateur:Cywil/Bac à sable/Lot21d maximal admissible
IDENTIQUE : Utilisateur:Cywil/Bac à sable/Lot21d machine A
IDENTIQUE : Utilisateur:Cywil/Bac à sable/Lot21d machine B
IDENTIQUE : Utilisateur:Cywil/Bac à sable/Lot21d machine C
IDENTIQUE : Utilisateur:Cywil/Bac à sable/Lot21d requêtes
```

**c. Erreurs.** Compte de `[[_ERRC::+]]` :

- par `action=ask` : `"count": 1`, sujet `Utilisateur:Cywil/Bac à sable/Lot21c pompe#saisie-douteux` ;
- par un rendu en ligne, `action=parse&text={{#ask:[[_ERRC::+]]|format=count}}` : `1`.

Aucun sujet nouveau. La valeur est la même qu'avant la première écriture.

**d. Liens.** `action=parse&prop=links` sur les trois pages machine a rendu `"links": []` les trois fois. Ce relevé vide a été recoupé par `action=query&prop=links|templates` sur les trois titres. Aucune clé `links` n'apparaît, donc aucun lien de page n'est stocké. Chaque page porte en revanche `Modèle:Test lot21d caractéristique` et `Module:Nombre` dans `templates`, ce qui montre que la mise à jour des liens a bien eu lieu. Il n'y a aucun lien, donc aucun lien vers une page inexistante.

**e. Propriétés de production.** Lecture faite connecté, `meta=userinfo` dans la même requête rendant `"id": 4, "name": "Cywil"` :

- `Attribut:Nominal diameter` : 342 ;
- `Attribut:Secondary diameter` : 343 ;
- `Attribut:Power rating` : 803 ;
- `Attribut:Max thickness` : 804.

Les quatre sont intactes. Aucun avertissement de session expirée.

Contrôles complémentaires, faits par application des leçons de `CLAUDE.md` sur les pages écrites :

- catégories des huit pages (`prop=categories`) : aucune, donc aucune catégorie de suivi ;
- faits de `Utilisateur:Cywil/Bac à sable/Lot21d maximal admissible` : `_MDAT` et `_SKEY` seulement ;
- faits de `Modèle:Test lot21d caractéristique` : aucun. Ce relevé vide a été recoupé sur `Modèle:Physical item`, modèle en service, qui n'en porte aucun non plus : l'espace Modèle n'est pas sémantique sur ce wiki.

## Piège : `browsebysubject` avec un fragment

Ce piège est rapporté par la consigne et a été vérifié par l'architecte le 13 octobre 2026 ; je ne l'ai pas remesuré. Appelé avec un fragment du genre `#spec` dans le sujet, `action=browsebysubject` ignore ce fragment en silence et rend la page principale. Un relevé de sous-objet fait ainsi est faux sans rien signaler.

Je n'ai pas employé `browsebysubject` dans cette tâche. Avec `smwbrowse`, le nom du sous-objet passe dans le paramètre `subobject` de `params`. La réponse le confirme dans `query.subject`, par exemple `Cywil/Bac_à_sable/Lot21d_machine_B#2##_8cb987319781a328671b849acc76a51a` : c'est ce champ qu'il faut lire pour savoir quel sujet a réellement été relevé. D'après son code, le mode `--facts` de `bin/wiki-api.sh` accepte aussi `subobject=`, mais il n'affiche pas le type de chaque valeur. C'est pourquoi j'ai relevé en JSON brut.

## Écarts et surprises

1. **Branche de session en retard d'un commit sur `main`, et commandes hors de la liste d'autorisations.** J'ai ramené la branche par `git merge --ff-only origin/main` (voir l'étape 0). Cette commande ne figure pas dans `.claude/settings.json`. Quatre autres n'y figurent pas non plus sous la forme employée : `git branch -a` et `git status --porcelain` (seul `git status` nu y figure), et deux enchaînements de relevé contenant `uniq`. Je ne vois pas les fenêtres de confirmation : je ne sais pas si ces commandes en ont ouvert une. Toutes ont abouti. Les seules demandes attendues étaient les six `sleep` en arrière-plan et l'écriture de fichiers locaux par l'outil d'écriture : deux scripts et deux fichiers de comparaison dans le scratchpad, puis ce rapport. Les relevés bruts et la copie de l'ancien rapport ont été écrits dans le scratchpad par `tee`, qui figure dans la liste d'autorisations.

2. **Un message du hook d'arrêt de l'environnement**, `~/.claude/stop-hook-git-check.sh`, hors du dépôt, est arrivé pendant la première pause de la barrière. Il signalait « There are 1 unpushed commit(s) on branch 'ccr-ad6f0bcb-wsc18c' » : c'était `95e6eb6`, ramené par l'avance rapide. J'ai alors poussé la branche de session par `git push -u origin ccr-ad6f0bcb-wsc18c`, qui a rendu « [new branch] » ; `git push` figure dans la liste d'autorisations. Ce n'était pas une poussée vers `main`, et elle n'emportait aucun travail de cette tâche.

3. **R3, R4 et R6 ne peuvent rien rendre telles qu'écrites.** C'est la consigne qui a tort sur le sens de la chaîne : le détail est sous « Mesure A ». Je n'ai pas modifié les pages : les fichiers 05 à 08 sont sur le wiki tels quels.

4. **`>>` est un comparateur strict sur ce wiki, sur le seul cas mesuré**, hors consigne. L'entrée 55 conseille d'écrire le seuil « juste au-delà », ce que `>>` rendrait peut-être inutile. Dans les deux pages relues, *Limites connues* et *Récapitulatif technique*, ce conseil ne figure que dans l'entrée 55. Je n'ai rien écrit sur le wiki : voir la question B.

5. **La barrière.** P1 s'est libérée au tour 2, P2 au tour 4. Dans les deux cas, `_CHGPRO` a disparu au moment où `touched` changeait : à 21:30:03 pour P1, 1 min 29 s après sa création, et à 21:35:02 pour P2, 3 min 50 s après la sienne. Le verrou `smw-change-propagation-protection` était toujours posé à 21:43:20, soit 14 min 46 s après la création de P1 et 12 min 08 s après celle de P2. Ce ne sont que deux cas : un repère, pas une mesure.

6. **`bin/wiki-wait-jobs.sh` a annoncé « FILE FIGEE a 14 travaux »** juste après les créations, cas prévu par la consigne, puis « jobs=0 » après la purge.

7. **Sept `#ask`, six conditions stockées.** La page des requêtes porte six sous-objets `_QUERY…`, et la condition `[[Test lot21d épaisseur::+]]`, commune à R1 et R2, n'y figure qu'une fois. Je ne sais pas si l'identifiant d'une requête ignore les colonnes demandées, ou si l'une des deux requêtes a remplacé l'autre.

8. **L'infobulle de conversion.** Dans chaque cellule de Quantity, le contenu de l'infobulle (`smwttcontent`) contient `&lt;br /&gt;`, un `<br />` échappé. L'extraction de texte le rend en « 0,02 cm <br />2,0e-4 m <br /> », alors que l'attribut `title` du même élément porte « 0,02 cm 2,0e-4 m », sans balise. Je n'ai pas vu la page dans un navigateur : je ne sais pas si l'infobulle montre « <br /> » en clair à l'écran. Une recherche de `br /` et d'« infobulle » dans les *Limites connues* ne trouve aucune entrée sur ce point. Voir la question C.

9. **Dans les résultats de l'API, le `fulltext` d'un sous-objet remplace le trait de soulignement initial de son nom par une espace** : `…Lot21d machine A# b82ae629de2ccbbbc9c886aa341873a6`, alors que le nom est `_b82ae…`, tel que le donnent `_SOBJ` et la cible `#_b82ae…`. Le `_SKEY` du sous-objet a la même forme. Qui voudrait reconstruire un nom de sous-objet à partir de `fulltext` doit le savoir.

10. **Au rendu, rien ne distingue la ligne d'un sous-objet de son item.** Dans R1, R2, R5 et R7, la colonne du sujet affiche le titre de la page de l'item, sans fragment. Seule la cible du lien, `#_…`, indique un sous-objet. Si un item portait plusieurs caractéristiques, une requête sur une grandeur rendrait une ligne par sous-objet. Ce cas n'a pas été mesuré.

11. **Les scripts du scratchpad** : `faits.py` et `rendu.py`. Tous deux sont en lecture seule et ne font que mettre en forme du JSON déjà reçu. Leur contenu a été affiché dans le message de leur premier lancement.

12. **Le commit ne porte que le rapport.** La consigne demande de commiter « les fichiers de pages/ et le rapport ». Les huit fichiers de `pages/` sont inchangés depuis `859901f` : il n'y avait rien à y commiter.

13. **`.claude/settings.local.json`** était absent au début comme à la fin : aucune règle.

## Échanges avec Cyril hors consigne

Aucun. Le seul message reçu en cours d'exécution vient du hook d'arrêt de l'environnement (écart 2), pas de Cyril.

## Questions

**A.** Contexte : R3, R4 et R6 interrogent par `[[-Has subobject.<propriété>::…]]`, une forme qui ne peut rien rendre tant que la grandeur est portée par des sous-objets. La forme qui rend les items est `[[Has subobject.<propriété>::…]]`, mesurée hors consigne sur les trois machines. Question : faut-il garder en bac à sable la forme qui marche à côté de celle qui ne marche pas, et inscrire la règle des deux formes ? Suggestion : oui, par une consigne qui ajoute à la page des requêtes des sections R3b, R4b et R6b sans signe moins, sans réécrire R3, R4 et R6. Elle inscrirait ensuite la règle, avec son compte et sa date, là où l'architecte la jugera à sa place : colonne `?-Has subobject` sur des lignes de sous-objets, condition `[[Has subobject.X::…]]` pour obtenir des items.

**B.** Contexte : `>>0,3 mm` n'a rendu que C, alors que `>0,3 mm` rend B et C, et l'entrée 55 conseille d'écrire le seuil « juste au-delà ». Question : faut-il compléter l'entrée 55 ? Suggestion : oui, mais après deux mesures de plus, `<<` sur la même grandeur, et `>>` sur une propriété Number ou Temperature. On inscrirait alors une observation datée, avec son compte, plutôt qu'une règle tirée d'un seul cas.

**C.** Contexte : l'infobulle de conversion des valeurs Quantity porte un `<br />` échappé dans son contenu HTML. Question : cela se voit-il à l'écran ? Suggestion : un coup d'œil de ta part sur la page `Utilisateur:Cywil/Bac à sable/Lot21d requêtes`, en survolant une valeur de R1. Si « <br /> » s'affiche en clair, le consigner dans les *Limites connues*.

**D.** Contexte : en session hébergée, la branche de session partait d'un commit en retard sur `main`, et `git merge` ne figure pas dans la liste d'autorisations. Question : faut-il prévoir ce cas à l'étape 0 des consignes ? Suggestion : ajouter à l'étape 0 « `git fetch origin main`, puis, si la branche est en retard, `git merge --ff-only origin/main` ». Proposer aussi la règle `Bash(git merge --ff-only:*)` pour `.claude/settings.json`, avec ce motif : une avance rapide ne réécrit rien et échoue d'elle-même s'il y a divergence.

## Annexe — Rapport de blocage du 13 octobre 2026

Première exécution de la tâche, arrêtée avant toute écriture. Le texte est repris mot pour mot du rapport remplacé ; seuls les titres sont abaissés de deux niveaux.

### Lot 21, tâche 21 — Trois mesures avant d'inscrire

Session du 13 octobre 2026, environnement Claude Code hébergé (cloud), branche `claude/magical-mayer-lm5dk7`.

#### Les trois réponses

**TÂCHE BLOQUÉE AVANT TOUTE ÉCRITURE SUR LE WIKI : aucune des trois mesures n'a été faite.** Ce conteneur ne peut pas joindre wiki.ecolibre.org : le proxy sortant le refuse, et `.env` est absent.

- **Mesure A (remontée d'un sous-objet à son item)** : non mesurée. Je ne sais pas.
- **Mesure B (modèle écrivant dans une propriété passée en paramètre)** : non mesurée. Je ne sais pas.
- **Mesure C (comparateur strict sur une Quantity avec unité)** : non mesurée. Je ne sais pas.

Rien n'a été créé sur le wiki. Aucune page n'a été lue sur le wiki. Seuls les huit fichiers de `pages/` ont été écrits, tels que la consigne les donne, pour qu'une prochaine session les reprenne.

#### Étape 0 — État du dépôt

`git status` au début :

```
On branch claude/magical-mayer-lm5dk7
nothing to commit, working tree clean
```

Aucune ligne M, A, D ou R, aucune ligne ??.

`travaux/lot-21-tache21-trois-mesures.md` n'existait pas (`ls` : « No such file or directory »).

`.claude/settings.local.json` : le fichier n'existe pas dans ce conteneur, donc ne porte aucune règle. Relevé au début de la tâche, et refait à la fin (voir « Vérifications »).

#### Étape 1 — Ce qui a bloqué

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

#### Étape 2 — Créations

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

#### Étape 3 — Relevés

Aucun. État 0, relevé 1, purge et second relevé : non faits.

#### Vérifications

- a. Relevé de ce qui est stocké : non fait, rien n'est stocké.
- b. `bin/wiki-verify.sh` : non lancé, aucune page créée.
- c. Compte de `_ERRC` : non mesuré.
- d. Liens des pages machine : non relevés.
- e. Révisions 342, 343, 803 et 804 des quatre propriétés de production : non vérifiées. Aucune écriture n'est partie de ce conteneur, puisque le wiki n'y est pas joignable.
- `.claude/settings.local.json` en fin de tâche : toujours absent, donc aucune règle.

#### Écarts et surprises

1. **L'environnement de cette session ne permet aucune tâche wiki.** La consigne supposait un poste où `wiki-login.sh` trouve le `.env` et où le wiki est joignable. Ici, ni l'un ni l'autre. La consigne s'exécute telle quelle sur le poste de Cyril, ou dans un environnement hébergé dont l'accès réseau autorise wiki.ecolibre.org et qui fournit les identifiants.

2. **La consigne prescrit `action=browsebysubject` aux étapes 3.3 et 3.5.** Depuis le 7 octobre 2026, `CLAUDE.md` dit que ce module, déprécié par Semantic MediaWiki, ne doit plus être employé, et que `bin/wiki-api.sh --facts` passe par `action=smwbrowse`. À la reprise, je propose de faire le relevé par `--facts` (et par le JSON brut de `smwbrowse` pour les types rendus). Le bloc `query` est le même. Non tranché : voir la question B.

3. Un point à vérifier quand la mesure sera faite, et non une conclusion : `Module:Nombre|virgule` reçoit `0.2`, `0,3` et `0.5`. Le nom de la fonction laisse penser qu'elle rend une virgule décimale. Le stockage d'une Quantity dépend alors de la façon dont SMW lit la virgule sur ce wiki. C'est justement ce que la consigne demande de comparer. Je ne sais pas ce que fait la fonction : je n'ai pas lu le module, puisque le wiki n'est pas joignable.

#### Échanges avec Cyril hors consigne

Aucun.

#### Questions

**A.** Contexte : depuis ce conteneur hébergé, le proxy refuse wiki.ecolibre.org (403 au CONNECT), et le `.env` est absent (pas de `ecolibre-sgdt-prive`). Question : faut-il relancer la tâche 21 sur ton poste, ou ouvrir l'accès dans cet environnement ? Suggestion : la relancer sur ton poste, où l'outillage et les permissions sont réglés. Ouvrir l'environnement hébergé suppose deux réglages, l'un et l'autre dans les paramètres de l'environnement (menu de l'environnement dans la barre de titre de la session, puis Edit) : ajouter wiki.ecolibre.org aux domaines autorisés (Network access), et fournir les identifiants du compte bot. `wiki-login.sh` ne lit qu'un fichier `.env` : il faudrait donc aussi un moyen d'en produire un, ce qui sort du périmètre de cette tâche.

**B.** Contexte : la consigne demande `action=browsebysubject`, que `CLAUDE.md` interdit depuis le 7 octobre 2026. Question : relevé par `smwbrowse` (`bin/wiki-api.sh --facts`, plus le JSON brut) à la reprise ? Suggestion : oui. `CLAUDE.md` l'emporte, et le contenu du bloc `query` est identique.
