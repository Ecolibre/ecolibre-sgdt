# Lot 22 — Tâche 4 : ouverture du lot et mesure de la machine hôte

Date : 9 octobre 2026. Exécuteur : Claude Code, poste spheres.

## Étape 1 — État du dépôt

- `git status --porcelain` : sortie vide, dépôt propre.
- `.claude/settings.local.json` : aucune règle (`"allow": []`, `"deny": []`), au début comme à la fin.
- `travaux/lot-22-tache4-ouverture.md` : absent avant la tâche.

## Étape 2 — Mesures sur le poste spheres (chiffres bruts)

**Disque** (`df -h /home/spheres`) — `/home/spheres` est sur la partition racine :

```
Sys. de fichiers Taille Utilisé Dispo Uti% Monté sur
/dev/nvme0n1p5      92G     63G   24G  73% /
```

**Mémoire** (`free -h`) :

```
               total       utilisé      libre     partagé tamp/cache   disponible
Mem:            15Gi       9,2Gi       1,9Gi       128Mi       3,5Gi       6,4Gi
Échange:       9,8Gi          0B       9,8Gi
```

**Système** : Ubuntu 24.04.4 LTS (Noble Numbat), `VERSION_ID="24.04"`. Architecture `x86_64`. `nproc` : 16.

**Docker** : absent.
- `which docker` : aucune sortie.
- `docker --version` et `docker compose version` : `docker : commande introuvable`.
- `getent group docker` : aucune sortie, le groupe n'existe pas.
- `id` : `uid=1000(spheres) gid=1000(spheres) groupes=1000(spheres),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),108(kvm),119(lpadmin),130(lxd),131(sambashare)`.
- `systemctl is-active docker` : `inactive` (aucune unité docker installée, cohérent avec l'absence du binaire).

**Dossiers Syncthing** (marqueur `.stfolder`) :

```
/home/spheres/ecolibre-sgdt.avant-retour/travaux/.stfolder
/home/spheres/ecolibre-sgdt/travaux/.stfolder
/home/spheres/Sync/.stfolder
```

Aucune mesure n'a exigé sudo, ssh, mysql ni mysqldump.

## Étape 3 — Écriture

- Page : `Lot 22 — Miroir local`, retenue comme seul membre de `Catégorie:Lot` commençant par « Lot 22 ».
- Protection : `[]`.
- Révision avant : **1473** (conforme à la consigne). Révision après : **1476**.
- Résumé : `[Lot 22][Tâche 4] Ouverture du lot : état ouvert, date du 9 octobre 2026, route du dump vérifiée et inscrite`.
- Aucune autre page écrite.

## Étape 4 — Vérifications

| N° | Contrôle | Résultat |
|---|---|---|
| 1 | Faits stockés (`--facts`) — **qui tranche** | **Passe.** `Work_package_status -> ['ouvert']`, `Work_package_opening_date -> ['1/2026/10/9']`, `Work_package_number -> ['22']`. |
| 2 | Wikitexte relu, comparé au texte de la consigne | Passe. Identique au caractère près, à l'exception du saut de ligne final (4 274 contre 4 275 caractères). |
| 3 | `prop=categories` | Passe. `Catégorie:Lot` seule, aucune catégorie de suivi. |
| 4 | `prop=links` | Passe. Trois liens, tous vers des pages existantes : `Gestion des lots`, `Lot 20 — External Data`, `Attribut:Work package status` (les deux derniers viennent du modèle). |
| 5 | Faits avant et après | Passe. Seule annotation nouvelle : `Work_package_opening_date`. `Work_package_status` a changé de valeur (`identifié` → `ouvert`), `_MDAT` a changé ; `_ASK` (mêmes trois empreintes), `_INST`, `_SKEY`, `Work_package_number`, `Work_package_summary` inchangés. |
| 6 | `.claude/settings.local.json` | Passe. Toujours vide. |

## Questions posées ou réponses rendues hors consigne

Aucune.

## Écarts et surprises

- **Le texte inscrit est déjà en retard d'une phrase sur la tâche.** La section « Points ouverts » dit encore « L'espace disque libre du poste spheres et la présence de Docker n'ont jamais été mesurés. » Ils viennent de l'être (étape 2). Le texte a été écrit tel que donné ; la phrase est à remplacer par les mesures dans une prochaine écriture.
- **Docker est absent**, groupe compris : son installation, qui demande sudo, est un préalable au miroir.
- **Mémoire disponible : 6,4 Gi sur 15 Gi** au moment de la mesure, avec 9,2 Gi utilisés par la session de bureau. Les « 16 Go » de la décision du 8 octobre sont la mémoire totale, pas celle dont disposera le miroir.
- **Disque : 24 G libres** sur la partition racine, qui porte `/home`. Le dump et l'archive d'images pèsent ensemble moins de 0,5 Go compressés ; la place des images Docker reste à estimer.
- **Un second dossier `travaux/` est partagé par Syncthing** : `/home/spheres/ecolibre-sgdt.avant-retour/travaux/`. Probable reste d'une bascule de poste ; il porte toujours son marqueur `.stfolder`. Non examiné plus avant, hors périmètre. À retenir pour la règle « ni dossier synchronisé » : le dump ne doit aller dans aucun des trois dossiers listés.
- « Le choix se fait à l'ouverture » (âge de la base) : l'ouverture a lieu avec cette tâche, et ce choix n'est pas tranché par le texte inscrit.
