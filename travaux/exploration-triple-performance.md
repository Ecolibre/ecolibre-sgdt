# Exploration de wiki.tripleperformance.fr

Date : 6 et 7 octobre 2026
Statut : close
Lot concerné : lot 31, Qualification des données et confiance entre pairs (état : identifié)
Relevés bruts : travaux/releve-triple-performance-api.md
Exploration voisine : travaux/exploration-site-json.md, travaux/exploration-cocolight-serveur.md

## 1. Pourquoi cette exploration

Simon Sarrazin a signalé ce wiki le 5 octobre 2026 comme un wiki sémantique riche en
innovations, susceptible d'inspirer le SGDT. Le besoin visé est le lot 31, et derrière
lui le principe de conception permanent du projet : que les commentaires, les débats et
à terme la provenance et la confiance puissent s'attacher partout où c'est pertinent,
sur les données elles-mêmes.

Triple Performance semblait l'avoir fait à l'intérieur du wiki, à l'échelle, devant un
public d'agriculteurs non informaticiens.

## 2. Méthode et sources

Trois sources distinctes, à ne pas confondre dans les relectures futures.

1. Lecture du code de production, publié sur GitHub sous l'organisation neayi. Dépôts
   clonés le 6 octobre 2026 : `tripleperformance` (la pile Docker, dont
   `config/LocalSettings.php`, 980 lignes), `mw-DiscourseIntegration`,
   `mw-NeayiInteractions`. L'organisation publie 60 dépôts.
2. Mesures sur le wiki vivant par `api.php` en lecture seule, 36 requêtes au total,
   espacées de 2 secondes, avec un en-tête d'identification. Consignées intégralement
   dans travaux/releve-triple-performance-api.md.
3. Mesures de comparaison sur wiki.ecolibre.org par `api.php`.

Non fait, volontairement : aucune lecture du dépôt `neayi/insights`, aucun contact avec
l'équipe Neayi.

## 3. Ce que le wiki est

MediaWiki 1.43.11, Semantic MediaWiki 7.2.0, 69 extensions. 26 828 pages dont 4 031
articles, 13 683 fichiers, 180 274 modifications, 2 522 comptes, 18 administrateurs,
et 8 utilisateurs actifs.

Espaces de noms : Attribut 102, Modèle 10, Formulaire 106, Concept 108, smw/schema 112,
Structure 3000, Formation 3002, Iframe 3004.

151 pages dans l'espace Attribut, mais 195 propriétés connues du magasin : les
propriétés spéciales et les propriétés employées sans page déclarée n'apparaissent pas
dans l'espace Attribut. Compter les pages de cet espace sous-estime le modèle réel.

493 modèles, 14 formulaires.

Extensions notables : PageForms 6.0.11, SemanticResultFormats, SemanticScribunto,
SemanticExtraSpecialProperties 5.0.2, SemanticAPI, NeayiSpecialProperties, Maps,
WikiSearch 8.1.5, CrawlerProtection.

La pile de production assemble aussi un forum Discourse, une application Laravel,
ElasticSearch, n8n, Matomo, Piwigo et Traefik. Ce n'est pas un wiki enrichi : c'est une
plateforme dont le wiki est un composant, maintenue par une entreprise, avec une
quinzaine d'extensions MediaWiki écrites maison.

## 4. Résultat principal : l'ancrage est la page

Démontré par le code, pas déduit d'une absence.

- `mw-DiscourseIntegration` est un fork de CommentStreams dont le stockage a été
  remplacé par Discourse. Dans `includes/ApiDIGetTopicID.php`, le lien entre un fil et
  une page est `$external_id = $wikiTitle->getArticleID();`. Un fil par page. Le fil
  est titré `Discussion - <titre de page>` et son premier message annonce qu'il
  accompagne la page.
- `mw-NeayiInteractions` ajoute le bloc d'interaction en bas de chaque page, par le
  crochet `BeforePageDisplay`. Il porte le suivi de page, un applaudissement libellé
  "Instructif", les déclarations "Je le fais" et "J'en ai", un compte d'exploitations et
  une carte par département. Toutes ses routes sont de la forme
  `api/page/<pageId>/stats`, `api/page/<pageId>/followers`, `api/user/page/<pageId>`.
  Rien n'y transporte quoi que ce soit de plus fin qu'un identifiant de page.
- Rien de tout cela n'est stocké dans le wiki. Les fils vivent dans Discourse, les
  interactions dans l'application Laravel `neayi/insights`.

Conséquence : c'est la même réponse que l'exploration de Communecter, close le 6 octobre
2026. La couche sociale vit à côté du wiki et s'accroche à la page. Deux équipes mieux
dotées que nous n'ont pas ancré sur la donnée.

Une nuance, et c'est le seul pont de la donnée vers la discussion :
`ApiDIAddMessage::getTagsForPage()` interroge le magasin sémantique avec la propriété
`A un mot-clé`, et chaque page trouvée devient une étiquette du fil Discourse. C'est de
là que vient le regroupement des questions-réponses par sujet. Le fil reste accroché à
la page, mais son classement est dérivé de la couche sémantique.

Transposable au SGDT : on peut renoncer à ancrer la discussion sur la donnée et pourtant
l'indexer par la donnée.

## 5. Le modèle de données : des propriétés génériques à valeurs-pages

Les caractéristiques de ferme visibles à l'écran ne sont pas des propriétés dédiées.
"Techniques culturales simplifiées", "irrigation" et "agriculture biologique" ne
figurent pas parmi les 151 propriétés. Ce sont des valeurs de deux propriétés
génériques, et chaque valeur est une page du wiki.

- `A un cahier des charges` : 235 pages, 285 valeurs, 36 valeurs distinctes, toutes de
  type Page. Agriculture Biologique 175, Haute valeur environnementale 25, Biodynamie
  13, Label Rouge 10, Agriculture de conservation des sols 9, puis une longue traine
  d'appellations à une occurrence.
- `A une caractéristique` : 203 pages, 336 valeurs, 65 valeurs distinctes, toutes de
  type Page. Activité biologique des sols 52, Système irrigué 35, Agriculture de
  conservation des sols 20, Système non irrigué 18, Non labour 14, Labour 12,
  Techniques culturales simplifiées 12, Agroécologie 12, Agroforesterie 12.

Deux propriétés absorbent cent une notions. Là où un modèle naïf créerait une propriété
par attribut, ils créent une page par notion.

Conséquence pour le lot 31 : quand une valeur est une page, elle porte sa propre
définition, sa discussion et son autorité. Débattre d'une caractéristique devient
possible sans rien installer. Attention à ne pas confondre : cela permet de discuter la
notion, pas la valeur qu'elle prend pour une fiche donnée. C'est une marche
intermédiaire, pas la solution que le lot 31 cherche.

Attention aussi à ne pas lire cette économie comme de la simplicité. Ils ont 493
modèles, contre 32 sur wiki.ecolibre.org, pour un nombre de formulaires comparable
(14 contre 13). La complexité ne s'est pas évaporée, elle s'est déplacée dans les
modèles, où elle coûte plus cher à maintenir.

Chaine observée sur une fiche : `Modèle:Exemple de mise en œuvre` (45 lignes) passe ses
paramètres à `Modèle:Exemple de mise en œuvre et portrait de ferme` (25 lignes), qui
porte les `#set`. Le formulaire est `Formulaire:Retour d'expérience` (93 lignes).

Autre mécanisme de frugalité : la propriété `Evoque` relie une fiche aux pages des
pratiques et des matériels qu'elle mentionne, au lieu de les redécrire.

## 6. Le lot 31 confronté à ce qui existe

Couche 1, la provenance : oui, deux mécanismes.

- `A comme agriculteur`, portée par 1 906 pages, de type Page, pointant vers des pages
  `Utilisateur:Prénom Nom` qui existent réellement. Une page peut en porter plusieurs,
  jusqu'à neuf pour un compte rendu d'événement.
- Les propriétés spéciales de SemanticExtraSpecialProperties, posées sans aucune saisie
  et interrogeables comme n'importe quelle propriété : `___CUSER` le créateur, `___EUSER`
  les éditeurs, `___NREV` le nombre de révisions, `___VIEWS` les consultations, `_MDAT`
  la date de modification, `___PAGELGTH` la longueur. Sur la fiche disséquée : deux
  éditeurs nommés, 26 révisions, 1 495 consultations.

Couche 2, la compétence par domaine : non. `Modèle:Contributeur` pose `A un nom`,
`A une photo`, `Biographie`, `A une URL` et `A un type de page`. Aucune organisation,
aucune affiliation, aucun domaine de compétence. La page d'un contributeur tient en deux
lignes de wikitexte. La compétence n'est pas déclarée, elle est montrée : trois requêtes
inverses affichent ce que la personne a écrit, où elle intervient et quelles formations
elle donne.

Couche 3, la confiance déclarée ou transitive : rien.

Position de conception qui se dégage de l'ensemble : Triple Performance ne calcule
jamais la confiance, il la rend inutile en donnant de quoi juger. Des caractéristiques
de ferme pour juger la transposabilité d'une expérience, un agriculteur nommé avec sa
page pour juger la source, la liste de ce qu'il a produit pour juger sa compétence.
Trois fois le même choix, sur trois objets différents. C'est une alternative cohérente
aux trois couches du lot 31, moins ambitieuse et sans doute beaucoup moins chère à
tenir. Elle est posée ici comme une option, pas comme une recommandation : la décision
appartient au lot 31 quand il s'ouvrira.

## 7. Ce que le cadrage initial croyait, et qui est faux

- Les caractéristiques de ferme ne sont pas des propriétés sémantiques dédiées, mais des
  valeurs de deux propriétés génériques. L'exploration initiale avait lu une fiche et
  pris pour des propriétés ce qui en avait l'apparence à l'écran.
- Il n'y a pas 581 fiches. `Catégorie:Retours d'expérience` compte 480 pages et 5
  sous-catégories. Aucune catégorie mesurée ne donne 581.
- Les affiliations des interlocuteurs ne sont pas modélisées. Les personnes sont
  identifiables, leurs affiliations ne le sont pas.
- Une partie des retours d'expérience sont des imports automatiques et non des
  témoignages. La fiche tirée au sort porte `Import GECO le` et `URL Geco`, et appartient
  aussi à `Catégorie:Articles issus de GECO`, qui compte 562 pages.

## 8. Dette de modélisation observée chez eux

`Est dans l'exploitation` est renseignée sur 282 pages, vide sur dix-huit des vingt
fiches tirées, et ses deux valeurs non vides pointent vers des pages de l'espace
principal qui n'existent pas. Une propriété déclarée, à moitié remplie, pointant vers du
vide. C'est la dette ordinaire d'un wiki qui vieillit, et elle nous guette.

## 9. Ce qu'il faut en faire

Une seule action concrète, gelée jusqu'à la fin de la migration serveur : évaluer
l'installation de SemanticExtraSpecialProperties sur wiki.ecolibre.org. Elle fournirait
la couche provenance du lot 31 sans une ligne de développement.

Etat de notre wiki mesuré le 6 octobre 2026 : 26 extensions, Semantic MediaWiki 4.2.0,
PageForms 5.8.1, SemanticResultFormats 4.2.1, 564 pages dont 205 articles, 138 pages
dans l'espace des propriétés, 32 modèles, 13 formulaires.
SemanticExtraSpecialProperties n'y est pas installée. Trois versions majeures de
Semantic MediaWiki nous séparent de Triple Performance.

Deux résultats à examiner le moment venu, sans chantier ouvert aujourd'hui :

- le style de modélisation par propriétés génériques à valeurs-pages, décrit en section 5 ;
- l'alternative "donner de quoi juger plutôt que calculer la confiance", décrite en
  section 6, face aux trois couches du lot 31.

Pistes écartées, avec leur motif :

- lire le dépôt `neayi/insights` : la couche sociale est hors wiki et ancrée à la page,
  son détail n'apprendrait rien de plus sur la question de l'ancrage ;
- chiffrer la maintenance par l'historique git : l'ordre de grandeur est acquis, le
  chiffre exact ne changerait aucune décision ;
- la voie la moins chère pour connaitre le coût réel de maintenance serait de poser la
  question à Neayi, par l'intermédiaire de Simon Sarrazin. A garder en réserve.

## 10. Journal

- 5 octobre 2026 : Simon Sarrazin signale le wiki.
- 6 octobre 2026 : lecture du code de production publié, passe A. L'ancrage à la page est
  établi. Mesure que le code de Triple Performance est intégralement public.
- 6 et 7 octobre 2026 : mesures sur le wiki vivant par api.php, passe B, 36 requêtes en
  deux séries, menées par Claude Code. Un appel de la première série, browsebysubject,
  était erroné : cet appel a été retiré de Semantic MediaWiki à la version 3, le bon
  nom est smwbrowse. Corrigé dans la seconde série.
- 7 octobre 2026 : rédaction du présent rapport, exploration close.
