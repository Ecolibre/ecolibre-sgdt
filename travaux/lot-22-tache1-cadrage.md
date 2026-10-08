````markdown
# Lot 22 — Tâche 1 : inscription du cadrage sur la page du lot

Date : 8 octobre 2026. Exécuteur : Claude Code, poste spheres.

Page écrite : `Lot 22 — Miroir local` (pageid 533), révision 1225 → **1469**, 2026-10-08T21:11:12Z.
Résumé de modification : `[Lot 22][Cadrage] Inscription des arbitrages du 8 octobre 2026 : machine hôte, exclusions, points ouverts`.
Aucune autre page écrite.

## Étapes

1. **État du dépôt** : `git status --porcelain` ne renvoie aucune ligne. Le dépôt est propre et rien n'arrête la tâche.
   `.claude/settings.local.json` contient `"allow": []` et `"deny": []`, sans aucune règle, au début comme à la fin de la tâche.
2. **Titre de la page** : relevé par `list=categorymembers` sur `Catégorie:Lot`. Le seul titre qui commence par « Lot 22 » est `Lot 22 — Miroir local`.
3. **Lecture** : le wikitexte complet figure ci-dessous. Contrôle de protection par `prop=info&inprop=protection` : `protection: []`.
4. **Écriture** : le diff a été calculé avant l'écriture. Il ne contient que les trois modifications 4a, 4b et 4c. Le modèle `Lot` et le statut n'ont pas été touchés.
5. **Vérification** : voir la section *Vérifications*.

## Wikitexte avant (révision 1225)

```
{{Lot
|Work_package_number=22
|Work_package_status=identifié
|Work_package_summary=Monter un miroir local du wiki, pour éprouver un changement de configuration avant de le demander en production.
}}

== Ce qui est déjà tranché ==

'''Docker plutôt qu'une installation native.''' La production tourne sur PHP 7.4, en fin de vie, et l'état doit pouvoir être remis à zéro entre deux essais.

'''Restauration du dump complet, pas d'un extrait.''' Les tables de SMW et celles du cœur dépendent les unes des autres.

'''La configuration du site n'est pas modifiée : un fichier de surcharge locale lui est ajouté.''' Le fichier de production est partagé par toute la ferme.

'''Aucune référence Base 36 n'est créée hors ligne.''' La séquence est unique et partagée ; en créer une localement produirait un doublon à la première synchronisation.

== Points ouverts ==

Le dump est une donnée de production : ni dépôt git, ni dossier synchronisé, et les ports liés à l'interface locale seulement.

== Dépendances ==

Rien en amont. Le lot 20 en dépend, puisqu'il installe une extension et modifie la configuration du site.

----

Voir aussi la [[Gestion des lots]].
```

## Wikitexte après (révision 1469, relu par l'API)

```
{{Lot
|Work_package_number=22
|Work_package_status=identifié
|Work_package_summary=Monter un miroir local du wiki, pour éprouver un changement de configuration avant de le demander en production.
}}

== Ce qui est déjà tranché ==

'''Docker plutôt qu'une installation native.''' La production tourne sur PHP 7.4, en fin de vie, et l'état doit pouvoir être remis à zéro entre deux essais.

'''Restauration du dump complet, pas d'un extrait.''' Les tables de SMW et celles du cœur dépendent les unes des autres.

'''La configuration du site n'est pas modifiée : un fichier de surcharge locale lui est ajouté.''' Le fichier de production est partagé par toute la ferme.

'''Aucune référence Base 36 n'est créée hors ligne.''' La séquence est unique et partagée ; en créer une localement produirait un doublon à la première synchronisation.

'''La machine hôte est le poste Ubuntu spheres.''' Décision du 8 octobre 2026 : ses 16 Go de mémoire évitent de confondre un défaut de configuration avec un manque de mémoire. Le poste cwl-toshiba, 3,8 Go, est réservé à l'objectif hors réseau qui viendra après ce lot.

'''Le dump est une donnée de production.''' Ni dépôt git, ni dossier synchronisé, et les ports liés à l'interface locale seulement.

== Ce que le lot exclut ==

La disponibilité du wiki quand le réseau internet est coupé : archive consultable hors ligne, export statique, machine allumée en permanence. Objectif distinct, arbitré le 8 octobre 2026, traité après ce lot.

L'hébergement du wiki public, que ce soit depuis une machine chez Cyril ou sur une machine louée, ainsi que la sortie du wiki de la ferme hébergée par l'adminsys.

Toute écriture du miroir vers la production : le miroir lit le serveur, il n'écrit jamais dessus.

== Points ouverts ==

La route de récupération du dump n'est pas arrêtée : mysqldump depuis le compte de Cyril, ou script de maintenance MediaWiki. A mesurer à l'ouverture du lot.

L'espace disque libre du poste spheres et la présence de Docker n'ont jamais été mesurés.

== Dépendances ==

Rien en amont. Le lot 20 en dépend, puisqu'il installe une extension et modifie la configuration du site.

----

Voir aussi la [[Gestion des lots]].
```

## Vérifications

La page a été relue par `bin/wiki-get.sh` après l'écriture. Le texte relu a été comparé par `diff` au fichier envoyé. La seule différence est le saut de ligne en fin de fichier, que MediaWiki retire.

| Contrôle | Mesure | Résultat |
|---|---|---|
| La section « Ce que le lot exclut » est présente avec ses trois paragraphes | Lecture du wikitexte relu et `diff` avec le fichier envoyé | **Passe** |
| La section « Points ouverts » contient deux paragraphes et ne mentionne plus de dépôt git | `grep -n -i git` sur le wikitexte relu : une seule occurrence, en ligne 19, dans « Ce qui est déjà tranché ». Aucune dans « Points ouverts » (lignes 29 à 33) | **Passe** |
| Le statut est toujours « identifié » | `grep` dans le wikitexte, ligne 3 : `Work_package_status=identifié`. Faits stockés relus par `bin/wiki-api.sh --facts` : `Work_package_status -> ['identifié']` | **Passe** |
| Pas de doublon de l'ancien paragraphe | Ancienne phrase « Le dump est une donnée de production : ni dépôt git… » : absente du texte relu. Elle ne subsiste que dans sa nouvelle forme, en fin de « Ce qui est déjà tranché » | **Passe** |
| Faits stockés par la page | `Work_package_number` 22, `Work_package_status` identifié, `Work_package_summary` inchangé, `_INST` Lot, `_ASK`, `_MDAT`, `_SKEY`. Aucune annotation parasite | **Passe** |

## Questions posées ou réponses rendues hors de cette consigne

Aucune.

## Écarts et surprises

- Le paragraphe déplacé en 4a ne reprend pas mot pour mot l'ancien. Le texte de la consigne remplace les deux-points par un point et met une majuscule à « Ni ». J'ai écrit le texte de la consigne tel quel.
- « A mesurer », sans accent sur le A, a été écrit tel que la consigne le donne.
- Je n'ai effectué ni le contrôle `prop=categories` ni le contrôle `prop=links` sur la page. Le seul lien est `[[Gestion des lots]]`, qui existait déjà, et le texte ajouté ne contient aucune syntaxe wiki en dehors du gras.
````
