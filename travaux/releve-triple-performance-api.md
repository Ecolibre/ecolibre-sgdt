# Relevé API — wiki.tripleperformance.fr (passe B, exploration)

Relevé du 6 octobre 2026, en lecture seule stricte, par Claude Code. Rien n'a été écrit, ni sur wiki.tripleperformance.fr ni sur wiki.ecolibre.org.

Conditions de politesse appliquées : une requête à la fois, attente de 2 s avant chaque requête, en-tête `User-Agent: Ecolibre-SGDT/1.0 (exploration technique; https://wiki.ecolibre.org)`, plafond de 30 tenu par un compteur. **Requêtes émises : 26 sur 30.** Toutes en GET, anonymes.

## Étape 1 — Identité du serveur

- Requête n° 1, 2026-10-06T20:10:45+02:00, HTTP 200, 43065 octets : `https://wiki.tripleperformance.fr/api.php?action=query&meta=siteinfo&siprop=general%7Cextensions%7Cstatistics%7Cnamespaces&format=json&formatversion=2`

- MediaWiki : `MediaWiki 1.43.11` (PHP 8.2.34, mysql 8.4.11)
- Semantic MediaWiki : `7.2.0`
- Pages : 26828 ; articles : 4031 ; modifications : 180274 ; fichiers : 13683
- Utilisateurs : 2522 ; utilisateurs actifs : 8 ; administrateurs : 18 ; travaux en file : 0

### Espaces de noms

| N° | Nom | Nom canonique |
|---|---|---|
| -2 | Média | Media |
| -1 | Spécial | Special |
| 0 | (principal) |  |
| 1 | Discussion | Talk |
| 2 | Utilisateur | User |
| 3 | Discussion utilisateur | User talk |
| 4 | Triple Performance | Project |
| 5 | Discussion Triple Performance | Project talk |
| 6 | Fichier | File |
| 7 | Discussion fichier | File talk |
| 8 | MediaWiki | MediaWiki |
| 9 | Discussion MediaWiki | MediaWiki talk |
| 10 | Modèle | Template |
| 11 | Discussion modèle | Template talk |
| 12 | Aide | Help |
| 13 | Discussion aide | Help talk |
| 14 | Catégorie | Category |
| 15 | Discussion catégorie | Category talk |
| 102 | Attribut | Attribut |
| 103 | Discussion attribut | Discussion attribut |
| 106 | Formulaire | Form |
| 107 | Discussion formulaire | Form talk |
| 108 | Concept | Concept |
| 109 | Discussion concept | Discussion concept |
| 112 | smw/schema | smw/schema |
| 113 | smw/schema talk | smw/schema talk |
| 420 | GeoJson | GeoJson |
| 421 | GeoJson talk | GeoJson talk |
| 460 | Campaign | Campaign |
| 461 | Campaign talk | Campaign talk |
| 828 | Module | Module |
| 829 | Discussion module | Module talk |
| 3000 | Structure | Structure |
| 3001 | Structure talk | Structure talk |
| 3002 | Formation | Formation |
| 3003 | Formation talk | Formation talk |
| 3004 | Iframe | Iframe |
| 3005 | IFrame talk | IFrame talk |

Propriétés : 102 `Attribut`. Modèles : 10 `Modèle`. Formulaires : 106 `Formulaire`. Structure : 3000. Formation : 3002.

### Extensions (68)

| Type | Nom | Version |
|---|---|---|
| specialpage | Admin Links | 0.6.3 |
| parserhook | ArrayFunctions | 1.9.0 |
| other | Bootstrap | 5.0.0 |
| parserhook | Carousel | 2.0 |
| parserhook | CategoryTree | (non renseignée) |
| specialpage | ChangeAuthor | 1.3.0 |
| parserhook | Cite | (non renseignée) |
| other | ConvertPDF2Wiki | 0.0.0 |
| hook | CrawlerProtection | 1.7.0 |
| specialpage | DeleteBatch | 1.8.1 |
| other | Description2 | 0.4.1 |
| other | Disambiguator | 1.4 |
| parserhook | DiscourseIntegration | 5.0 |
| parserhook | ECharts | 1.0 |
| specialpage | Echo | (non renseignée) |
| parserhook | EmbedVideo | 4.2.0 |
| parserhook | FleurAgroecologie | 1.0 |
| other | HeadScript | 1.1.1 |
| other | HidePrefix | 0.1.0 |
| variable | HitCounters | 0.4 |
| parserhook | IFrameTag | 1.0.4 |
| parserhook | InputBox | 0.3.0 |
| parserhook | Link Attributes | 1.1 |
| parserhook | LinkTitles | 8.2.0 |
| parserhook | Loops | 1.0.0-beta |
| parserhook | Maps | 13.1.2 |
| parserhook | Math | (non renseignée) |
| other | MultimediaViewer | (non renseignée) |
| media | NativeSvgHandler | 1.5.0 |
| other | NeayiAuth | 4.0 |
| parserhook | NeayiInteractions | 1.0 |
| parserhook | NeayiIntroJS | 1.0 |
| parserhook | NeayiNavbar | 1.0 |
| parserhook | NeayiRelatedPages | 0.1.0 |
| semantic | NeayiSpecialProperties | 1.0.0 |
| parserhook | OpenGraphMeta | 0.5.6 |
| media | PDF Handler | (non renseignée) |
| parserhook | PDFEmbed | 2.0.3 |
| specialpage | PageForms | 6.0.11 |
| api | PageImages | (non renseignée) |
| parserhook | ParserFunctions | 1.6.1 |
| other | Parsoid | (non renseignée) |
| other | Piwigo | (non renseignée) |
| other | PluggableAuth | 7.5.0 |
| other | Popups | (non renseignée) |
| parserhook | Realnames | 0.8.0 |
| betafeatures | RelatedArticles | 3.1.0 |
| specialpage | Replace Text | 1.8 |
| parserhook | Scribunto | (non renseignée) |
| extension | SemanticAPI | 1.0.0 |
| semantic | SemanticExtraSpecialProperties | 5.0.2 |
| semantic | SemanticMediaWiki | 7.2.0 |
| semantic | SemanticResultFormats | 6.0.1-alpha |
| semantic | SemanticScribunto | 3.0.0 |
| other | Slack Notifications | 1.15 |
| parserhook | TemplateData | 0.1.2 |
| other | TextExtracts | (non renseignée) |
| other | Upload Wizard | 1.5.0 |
| UploadConvert | UploadConvert | 0.1.1-beta |
| specialpage | UrlShortener | 1.2.0 |
| other | VEForAll | 0.5.2 |
| parserhook | Variables | 2.6.0-beta |
| editor | VisualEditor | (non renseignée) |
| parserhook | WikiSearch | 8.1.5 |
| parserhook | WikiSearchFront | 3.3.0 |
| other | WikiSearchLink | (non renseignée) |
| other | WikiSearchMapsLink | 1.0.0 |
| skin | chameleon | 5.0.3 |

## Étape 2 — Propriétés (espace 102)

- Requête n° 2, 2026-10-06T20:10:55+02:00, HTTP 200, 9431 octets : `https://wiki.tripleperformance.fr/api.php?action=query&list=allpages&apnamespace=102&aplimit=500&format=json&formatversion=2`

Pas de continuation dans la réponse. **Total : 151 propriétés.**

- A comme agriculteur
- A comme modèle ESR
- A comme photo d'agriculteur
- A des coordonnées
- A des coordonnées GPS
- A des pépins
- A des termes SEO
- A des transcriptions
- A la une
- A un JSON de système
- A un UTH
- A un auteur
- A un cahier des charges
- A un climat
- A un code couleur
- A un code de formation
- A un coût
- A un email
- A un fichier d'icone de caractéristique
- A un financement
- A un glyph
- A un intervenant
- A un label
- A un libellé d'image
- A un mot-clé
- A un nom
- A un nom latin
- A un numéro de département
- A un objectif
- A un objectif Agrilismat
- A un pH de sol
- A un producteur
- A un rendement moyen
- A un résumé
- A un site
- A un sol
- A un store
- A un telephone
- A un titre
- A un titre court
- A un type de matériel
- A un type de page
- A un type de production
- A un type de sol
- A un usage
- A une SAU
- A une URL
- A une URL de vidéo
- A une caractéristique
- A une couleur
- A une culture principale
- A une date de mise en ligne
- A une date de mise en œuvre
- A une description
- A une description du sol
- A une ferme
- A une fréquence de sol
- A une galerie photo
- A une icone
- A une icône de portail
- A une image
- A une modalité
- A une origine
- A une page Agrinovateur
- A une pertinence
- A une photo
- A une priorité d'affichage
- A une production
- A une présentation rapide
- A une résistance
- A une résistance au black-rot
- A une résistance au botrytis
- A une résistance au mildiou
- A une résistance à l'oidium
- A une saveur
- A une source d'icone
- A une thématique
- Adresse
- Aptitudes de production
- Besoins en eau
- Biographie
- Contribue à
- Contributeur
- Coût moyen
- Croissance
- Date d'introduction
- Date de débourrement
- Date de l'événement
- Description
- Description de la pratique
- Disposition
- Doit être affiché par défaut
- Durée
- Durée test
- Débourrement
- Défavorise
- Développement
- Enracinement
- Est appliqué à
- Est complémentaire
- Est dans l'exploitation
- Est dans la liste A France Agrimer
- Est dans la liste France Agrimer
- Est dans la région
- Est dans le département
- Est dans le portail
- Est dans le projet
- Est de type
- Est incompatible
- Est incompatible avec
- Est produit par
- Est un intervenant de
- Est un élément de profil
- Evoque
- Exposition
- Fait partie de
- Fait partie de la chambre régionale
- Famille
- Favorise
- Feuillage
- Financement via Agrilismat possible
- Foaf:homepage
- Foaf:knows
- Foaf:name
- Forme
- Fréquence
- Import GECO le
- Informe sur
- Mois d'intérêt de la page
- NBSoil theme
- Ombrage
- Origine de l'espèce
- Owl:differentFrom
- PH
- Page construite en partenariat avec
- Pertinence Gässler
- Port
- Remarquable
- Richesse sol
- Régule
- Résistance au froid
- Résistance à la chaleur
- S'applique à
- S'appuie sur
- S'attaque à
- Système racinaire
- Type de bioagresseur
- Type de culture
- Type sol
- URL Geco
- Utilise

## Étape 3 — Catégories

- Requête n° 3, 2026-10-06T20:11:01+02:00, HTTP 200, 37744 octets : `https://wiki.tripleperformance.fr/api.php?action=query&list=allcategories&acprop=size&aclimit=500&format=json&formatversion=2`
- Requête n° 4, 2026-10-06T20:11:10+02:00, HTTP 200, 38701 octets : `https://wiki.tripleperformance.fr/api.php?action=query&list=allcategories&acprop=size&aclimit=500&accontinue=Epeautre&format=json&formatversion=2`
- Requête n° 5, 2026-10-06T20:11:15+02:00, HTTP 200, 38557 octets : `https://wiki.tripleperformance.fr/api.php?action=query&list=allcategories&acprop=size&aclimit=500&accontinue=Mycorhizes_et_champignons_fonctionnels_du_sol&format=json&formatversion=2`
- Requête n° 6, 2026-10-06T20:11:21+02:00, HTTP 200, 21563 octets : `https://wiki.tripleperformance.fr/api.php?action=query&list=allcategories&acprop=size&aclimit=500&accontinue=Semoir_%C3%A0_c%C3%A9r%C3%A9ale&format=json&formatversion=2`

La liste rendue est alphabétique et plafonnée à 500 par réponse : quatre requêtes (trois continuations) ont été nécessaires pour obtenir la liste complète avant de trier. **Total : 1777 catégories.** `size` = pages + sous-catégories + fichiers.

### Les trente plus peuplées

| Rang | Catégorie | size | pages | sous-cat. | fichiers |
|---|---|---|---|---|---|
| 1 | Fichier chargé avec l'assistant UploadWizard | 2459 | 0 | 0 | 2459 |
| 2 | Vidéos | 2124 | 2122 | 2 | 0 |
| 3 | Contributeurs | 1568 | 1567 | 1 | 0 |
| 4 | Pages vidéos avec un résumé long | 1406 | 1406 | 0 | 0 |
| 5 | Ver de Terre Production | 1118 | 1038 | 80 | 0 |
| 6 | Bioagresseurs | 1082 | 982 | 100 | 0 |
| 7 | Fiches techniques | 804 | 803 | 1 | 0 |
| 8 | Pages avec extrait de wikipedia | 582 | 515 | 67 | 0 |
| 9 | Articles issus de GECO | 562 | 556 | 6 | 0 |
| 10 | Retours d'expérience | 485 | 480 | 5 | 0 |
| 11 | Cépages | 450 | 450 | 0 | 0 |
| 12 | Terres Inovia | 444 | 444 | 0 | 0 |
| 13 | Maraîchage Sol Vivant | 353 | 353 | 0 | 0 |
| 14 | Cultures et productions | 253 | 235 | 18 | 0 |
| 15 | Ver de Terre Production - Videos | 238 | 238 | 0 | 0 |
| 16 | Matériels et équipements | 230 | 208 | 22 | 0 |
| 17 | Auxiliaires | 197 | 154 | 35 | 8 |
| 18 | Centre National d'Agroécologie | 186 | 186 | 0 | 0 |
| 19 | Portail | 178 | 176 | 2 | 0 |
| 20 | Icones de caractéristiques | 168 | 0 | 0 | 168 |
| 21 | Programme Fiches Système DEPHY EXPE | 165 | 163 | 2 | 0 |
| 22 | Icones pour les portails | 149 | 0 | 0 | 149 |
| 23 | Portrait de ferme | 144 | 144 | 0 | 0 |
| 24 | Civam | 131 | 131 | 0 | 0 |
| 25 | The Noun Project Icons | 120 | 0 | 0 | 120 |
| 26 | Arbre | 117 | 117 | 0 | 0 |
| 27 | MSV Normandie | 111 | 110 | 1 | 0 |
| 28 | Chambres d'Agriculture | 104 | 104 | 0 | 0 |
| 29 | Département | 101 | 101 | 0 | 0 |
| 30 | Articles Terres-Inovia | 98 | 98 | 0 | 0 |

Catégorie des retours d'expérience : **`Catégorie:Retours d'expérience`**, size 485 (480 pages, 5 sous-catégories, 0 fichier).

### Catégories dont le nom contient retour, exp, ferme, témoign, exploitation ou agriculteur

| Catégorie | size | pages |
|---|---|---|
| Expérimentations | 2 | 2 |
| FEVE Fermes En ViE | 1 | 1 |
| Fermes En Vie (FEVE) | 1 | 1 |
| Fermes d'Avenir | 9 | 9 |
| Fiches Système DEPHY EXPE | 2 | 0 |
| Fiches Système DEPHY EXPE - Arboriculture | 2 | 2 |
| Fiches Système DEPHY EXPE - Cultures tropicales | 0 | 0 |
| Fiches Système DEPHY EXPE - Grande culture / Polyculture élevage | 2 | 2 |
| Fiches Trajectoire DEPHY FERME | 2 | 1 |
| Fiches Trajectoire DEPHY FERME - Grande culture / Polyculture élevage | 0 | 0 |
| GAB 85 - Groupement des Agriculteurs Bio de Vendée | 13 | 13 |
| La plus belle ferme De France | 1 | 1 |
| La plus belle ferme de France | 27 | 27 |
| Portrait de ferme | 144 | 144 |
| Portraits de ferme Normandie | 1 | 1 |
| Programme Fiches Système DEPHY EXPE | 165 | 163 |
| Programme Fiches Trajectoire DEPHY FERME | 12 | 11 |
| Retours d'expérience | 485 | 480 |
| Retours d'expérience projets Agro-Campus environnemental | 1 | 1 |
| Retours d'expérience projets Boost | 20 | 20 |
| Retours d'expérience projets ENSAT | 6 | 6 |
| Retours d'expérience projets Institut Agro Dijon | 4 | 4 |
| Retours d'expérience projets Institut Agro Montpellier | 27 | 27 |
| Retours d'expérience projets Parc Naturel Régional de l'Astarac | 1 | 1 |
| Retours d'expérience projets Purpan | 1 | 1 |
| Retours d'expérience projets étudiants | 6 | 0 |
| Thierry Agriculteur d'Aujourd'hui | 2 | 2 |
| Visite de Ferme MSV Est - Jean Becker (Bas-Rhin) | 8 | 8 |
| Visite de Ferme MSV Est - SEFFERSOL Wintzenheim - Guillaume Delaunay - Pierre Eichenlaub - Joseph Templier | 8 | 8 |
| Visite de ferme Gaec Terres de Gogagne | 6 | 6 |
| Visite de ferme Jardin des Peltier | 7 | 7 |
| Visite de ferme Jean Becker | 2 | 2 |
| Visite de ferme Vincent Levavasseur | 3 | 3 |
| Visites de fermes MSV Est - Jardin de Manspach (Haut-Rhin) | 41 | 41 |
| Visites de fermes MSV Normandie | 4 | 4 |
| Visites de fermes et analyse des sols | 11 | 11 |

## Étape 4 — Une fiche réelle

- Requête n° 7, 2026-10-06T20:11:29+02:00, HTTP 200, 6159 octets : `https://wiki.tripleperformance.fr/api.php?action=query&list=categorymembers&cmtitle=Cat%C3%A9gorie:Retours_d%27exp%C3%A9rience&cmtype=page&cmlimit=50&format=json&formatversion=2`
- Requête n° 8, 2026-10-06T20:11:35+02:00, HTTP 200, 372 octets : `https://wiki.tripleperformance.fr/api.php?action=browsebysubject&subject=Autonomie%20fourrag%C3%A8re%20et%20d%C3%A9rob%C3%A9es&format=json`

Tirage : 50 premiers membres (pages) de la catégorie, indice tiré par `random.SystemRandom().randrange(1, 50)` (l'indice 0 exclu). Indice obtenu : 43.

**Page choisie : « Autonomie fourragère et dérobées ».**

Réponse brute de `browsebysubject` :

```json
{"error":{"code":"badvalue","info":"Unrecognized value for parameter \"action\": browsebysubject.","*":"See https://wiki.tripleperformance.fr/api.php for API usage. Subscribe to the mediawiki-api-announce mailing list at &lt;https://lists.wikimedia.org/postorius/lists/mediawiki-api-announce.lists.wikimedia.org/&gt; for notice of API deprecations and breaking changes."}}
```

**Échec : l'action `browsebysubject` n'existe pas sur cette API (erreur `badvalue`, HTTP 200). Aucune paire propriété-valeur relevée.** Non contourné, conformément à la consigne.

Les 50 membres reçus :

- [0] 10 ans de couverts végétaux permanents spontanés agriculture biologique
- [1] Abricot : privilégier les observations et le biocontrôle pour baisser les IFT
- [2] Activation des défenses naturelles grâce au jus de luzerne en arboriculture et maraîchage
- [3] Adaptation aux effets du changement climatique sur les systèmes d’élevage ovins grâce à l’agroforesterie
- [4] Adaptation de la fertilisation : un levier pour limiter les pressions en bioagresseurs
- [5] Adaptation du travail du sol suite à des observations
- [6] Adoption du semis direct et diversification des cultures face aux défis climatiques
- [7] Agriculture Biologique et séquestration carbone en élevage bovin viande
- [8] Allongement de la rotation avec la succession de deux cultures de printemps
- [9] Allongement de la rotation et réduction du travail du sol en système Grandes Cultures Breton
- [10] Allongement de la rotation et techniques alternatives en système céréalier conduit en sec
- [11] Allongement de la rotation par introduction de cultures de printemps
- [12] Allongement et diversification du système colza-blé-orge Lorrain
- [13] Allonger la rotation et combiner des leviers agronomiques pour réduire d'au moins 65% l’IFT en système colza-blé-orge Lorrain
- [14] Allonger sa rotation pour diminuer les produits phytosanitaires et augmenter son autonomie alimentaire
- [15] Alternance artichaut-scarole pour introduction d'une solarisation et d'engrais verts dans les rotations, irrigation localisée et paillage biodegradable afin de réduire l'IFT
- [16] Alternance des cultures pour lutter contre les graminées d’hiver
- [17] Alternative au désherbage par paillage ou enherbement
- [18] Alternative à la monoculture de maïs: diversification de la rotation et techniques culturales simplifiées
- [19] Alternatives pour déplafonner la fourniture azotée du sol
- [20] Amélioration de la gestion collective des prélèvements d’irrigation
- [21] Amélioration de la nutrition des plantes grâce à l'activation de la vie du sol
- [22] Amélioration de la santé des ruminants par leur alimentation
- [23] Amélioration de la structure du sol grâce à des prébiotiques
- [24] Amélioration de l’efficience de l’eau d’irrigation en verger de pommiers grâce au micro-jet et au goutte-à-goutte
- [25] Amélioration de l’efficience de l’eau d’irrigation grâce au pilotage (Outil Net-Irrig)
- [26] Améliorer la PBI en production de Gariguette hors sol sous serre, région PACA
- [27] Application de sucre pour lutter contre la pyrale du maïs grain
- [28] Application des principes de la biodynamie et du biocontrôle dans une approche globale de protection du verger
- [29] Apport de fumier et de déchets verts au palmier dattier
- [30] Apport massif de matière organique sous forme de fumier pour la gestion alternative des bioagresseurs telluriques en cultures légumières
- [31] Arrêt du glyphosate comme mode de destruction systématique du couvert
- [32] Association vigne et rosiers au lycée viticole d'Amboise
- [33] Associer du lupin jaune de printemps à du blé panifiable sur la côte sud bretonne
- [34] Associer le colza aux Fabacées sur l'exploitation de Vesoul Agrocampus
- [35] Assolement innovant et transformation à la ferme : le retour d’expérience de la Ferme de la Belle Noé
- [36] Augmenter la biodiversité d'un domaine agricole par la voie de l'agroforesterie
- [37] Augmenter la résilience du vignoble de Cognac grâce au mode de conduite Scott Henry
- [38] Augmenter l’efficience de la stratégie de protection en verger de pomme
- [39] Augmenter son autonomie fourragère tout en baissant ses intrants grâce à la luzerne et au méteil
- [40] Auto-construction de strip-till pour réussir son implantation en colza
- [41] Auto-construire son matériel : une solution adaptée à certaines exploitations
- [42] Autoguidage et ACS le duo gagnant
- [43] Autonomie fourragère et dérobées
- [44] Autonomie semencière et transformation artisanale en système grandes cultures sans irrigation
- [45] Bandes fleuries en culture de fraises
- [46] Bien positionner sa station météorologique en fonction des objectifs de travail
- [47] Bâches tissées sur le rang, alternatives au désherbage
- [48] Caractérisation du phénomène d'érosion et ses enjeux
- [49] Changement de pratiques pour retrouver de la rentabilité au lycée agricole Tulle Naves

## Étape 5 — Modèle et formulaire

- Requête n° 9, 2026-10-06T20:11:49+02:00, HTTP 200, 1317 octets : `https://wiki.tripleperformance.fr/api.php?action=parse&page=Autonomie%20fourrag%C3%A8re%20et%20d%C3%A9rob%C3%A9es&prop=templates&format=json&formatversion=2`

### Modèles employés par la page (20)

- Modèle:Exemple de mise en œuvre
- Modèle:Exemple de mise en œuvre et portrait de ferme
- Modèle:Affiche fil d'ariane
- Modèle:Translation for case study
- Modèle:Translation for
- Modèle:Tag
- Modèle:Affiche caractéristiques
- Modèle:Caractéristique département
- Modèle:Caractéristique
- Modèle:Caractéristique simple
- Modèle:Glyph
- Modèle:Page image and icone
- Modèle:ForceImage
- Modèle:Organisme de la page
- Modèle:Article issu de Geco
- Modèle:AddUTM
- Modèle:Pages liées
- Modèle:Techniques évoquées
- Modèle:Contribue à
- Modèle:Materiels évoqués

### Modèle:Exemple de mise en œuvre — 45 lignes

- Requête n° 10, 2026-10-06T20:11:56+02:00, HTTP 200, 2598 octets : `https://wiki.tripleperformance.fr/api.php?action=parse&page=Mod%C3%A8le:Exemple%20de%20mise%20en%20%C5%93uvre&prop=wikitext&format=json&formatversion=2`

```
<noinclude>
{{#template_params:Nom de l'agriculteur|Photo de l'agriculteur|Nom de l'exploitation|Département (property=A un numéro de département)|SAU (label=SAU (Surface totale de l'exploitation);property=A une SAU)|UTH (label=UTH (Unité de Travailleur Humain);property=A un UTH)|Texture du sol (property=A un sol)|Description du sol (property=A une description du sol)|pH (label=pH du sol)|Type de production (property=A un type de production)|Cultures (list)|Cahier des charges (list)|Autres caractéristiques (list)|Titre court (label=Titre court (pour affichage dans les partages))|Objectif|Date de mise en œuvre|Photo d'illustration (property=A une photo)}}[[Category:Modèles de catégories]]
</noinclude><includeonly>{{Exemple de mise en œuvre et portrait de ferme
 | Fil d'ariane = [[Search | {{Translation for case study|plural=yes}} "A un type de page={{Translation for case study}}"]]
 | Adresse = {{{Adresse|}}}
 | Auteur = {{{Auteur|}}}
 | Autres caractéristiques = {{{Autres caractéristiques|}}}
 | Cahier des charges = {{{Cahier des charges|}}}
 | Cultures = {{{Cultures|}}}
 | Date de mise en œuvre = {{{Date de mise en œuvre|}}}
 | Département = {{{Département|}}}
 | Description de sol = {{{Description de sol|}}}
 | Image = {{{Image|}}}
 | ImageCaption = {{{ImageCaption|}}}
 | Latitude = {{{Latitude|}}}
 | Longitude = {{{Longitude|}}}
 | Coordonnées GPS = {{{Coordonnées GPS|}}}
 | Mois de l'année = {{{Mois de l'année|}}}
 | Nom de l'agriculteur = {{{Nom de l'agriculteur|}}}
 | Nom de l'exploitation = {{{Nom de l'exploitation|}}}
 | Numéro de département = {{{Numéro de département|}}}
 | Objectif = {{{Objectif|}}}
 | Organisme = {{{Organisme|}}}
 | pH = {{{pH|}}}
 | Photo de l'agriculteur = {{{Photo de l'agriculteur|}}}
 | Photo d'illustration = {{{Photo d'illustration|}}}
 | Problématique = {{{Problématique|}}}
 | Programme = {{{Programme|}}}
 | SAU = {{{SAU|}}}
 | Texture du sol = {{{Texture du sol|}}}
 | Titre court = {{{Titre court|}}}
 | Type de production = {{{Type de production|}}}
 | UTH = {{{UTH|}}} 
 | Tag 0 = {{{Tag 0|}}}
 | Tag 1 = {{{Tag 1|}}}
 | Tag 2 = {{{Tag 2|}}}
 | Tag 3 = {{{Tag 3|}}}
 | Tag 4 = {{{Tag 4|}}}
 | Tag 5 = {{{Tag 5|}}}
 | Tag 6 = {{{Tag 6|}}}
 | Tag 7 = {{{Tag 7|}}}
 | Tag 8 = {{{Tag 8|}}}
 | Tag 9 = {{{Tag 9|}}}
 | Mots-clés = {{{Mots-clés|}}}
}}[[Category:{{Translation for case study|plural=yes}}]]{{#Set:A un type de page={{Translation for case study}} }}</includeonly>
```

### Modèle:Exemple de mise en œuvre et portrait de ferme — 25 lignes

- Requête n° 11, 2026-10-06T20:12:03+02:00, HTTP 200, 4514 octets : `https://wiki.tripleperformance.fr/api.php?action=parse&page=Mod%C3%A8le:Exemple%20de%20mise%20en%20%C5%93uvre%20et%20portrait%20de%20ferme&prop=wikitext&format=json&formatversion=2`

```
<noinclude>
{{#template_params:Nom de l'agriculteur|Photo de l'agriculteur|Nom de l'exploitation|Département (property=A un numéro de département)|SAU (label=SAU (Surface totale de l'exploitation);property=A une SAU)|UTH (label=UTH (Unité de Travailleur Humain);property=A un UTH)|Texture du sol (property=A un sol)|Description du sol (property=A une description du sol)|pH (label=pH du sol)|Type de production (property=A un type de production)|Cultures (list)|Cahier des charges (list)|Autres caractéristiques (list)|Titre court (label=Titre court (pour affichage dans les partages))|Objectif|Date de mise en œuvre|Photo d'illustration (property=A une photo)}}[[Category:Modèles de catégories]]
</noinclude><includeonly>{{Affiche fil d'ariane
|Icone=Icone categorie Retours d'expérience.png
|{{{Fil d'ariane}}}
|{{#if:{{{Organisme|}}}|[[{{ForceStructure|{{{Organisme}}} }} | {{RemoveStructure|{{{Organisme}}} }}]] }}
|{{#arraymap:{{{Programme|}}}|,|x|{{#set: Est dans le projet = x }}[[x]]|<nowiki>, </nowiki>}}
|{{#if:{{{Nom de l'agriculteur|}}}|{{#arraymap:{{{Nom de l'agriculteur|}}}|,|x|{{#set: A comme agriculteur = {{ForceUser|x}} }}[[{{ForceUser|x }} | x]]|<nowiki>, </nowiki>| <nowiki> et </nowiki> }} }} {{#if:{{{Date de mise en œuvre|}}}|({{{Date de mise en œuvre}}})}}
|{{#if:{{{Problématique|}}}| <span class="tp-Icone-categorie-objectif"></span> {{#arraymap:{{{Problématique|}}}|,|x|x{{#set: A un objectif = x }} }} }}
}}<div class="noexcerpt tags">{{#if:{{{Type de production|}}}| {{#arraymap:{{{Type de production|}}}|,|x|{{#set: A un type de production = x }}{{tag|x}}<span class="d-none type-production">x</span>|<nowiki> </nowiki>}} }}{{#forargs: Tag
 | key
 | value
 | {{tag|{{#var: value}}|Deprecated}}
}}{{#arraymap:{{{Mots-clés|}}}|,|x|{{tag|x}}|<nowiki> </nowiki> }}</div>{{Affiche caractéristiques
| Département = {{#if:{{{Département|}}} | {{{Département}}} | {{#if:{{{Numéro de département|}}}| Département {{{Numéro de département}}} }} }}
| SAU = {{{SAU|}}}
| UTH = {{{UTH|}}}
| Texture du sol = {{{Texture du sol|}}}
| Description de sol = {{{Description de sol|}}}
| pH = {{{pH|}}}
| Type de production = {{{Type de production|}}}
| Cultures = {{{Cultures|}}}
| Cahier des charges = {{{Cahier des charges|}}}
| Autres caractéristiques = {{{Autres caractéristiques|}}}
}}{{Page image and icone|Image={{{Photo d'illustration|}}}{{{Image|}}}|ImageCaption={{{ImageCaption|}}} }}{{#if:{{{Auteur|}}}| {{#set: A comme agriculteur = {{ForceUser|{{{Auteur}}} }} }} }}{{#if:{{{Photo de l'agriculteur|}}}| {{#set: A comme photo d'agriculteur = File:{{{Photo de l'agriculteur}}} }} }} {{#if:{{{Nom de l'exploitation|}}}| {{#set: Est dans l'exploitation = {{{Nom de l'exploitation}}} }} }} {{#if:{{{Département|}}}| {{#set: Est dans le département = {{{Département}}} }} }}{{#if:{{{Numéro de département|}}}| {{#set: Est dans le département = Département {{{Numéro de département}}} }} }}{{#if:{{{SAU|}}}| {{#set: A une SAU = {{{SAU}}} }} }} {{#if:{{{UTH|}}}| {{#set: A un UTH = {{{UTH}}} }} }} {{#if:{{{Texture du sol|}}}| {{#set: A un sol = {{{Texture du sol}}} }} }} {{#if:{{{Description de sol|}}}| {{#set: A une description du sol = {{{Description de sol}}} }} }} {{#if:{{{pH|}}}| {{#set: A un pH de sol = {{{pH}}} }} }} {{#if:{{{Cultures|}}}| {{#arraymap:{{{Cultures}}}|@|x|{{#set:A une production=x}}}} }} {{#if:{{{Cahier des charges|}}}| {{#arraymap:{{{Cahier des charges}}}|@|x|{{#set:A un cahier des charges=x}} }} }} {{#if:{{{Autres caractéristiques|}}}| {{#arraymap:{{{Autres caractéristiques}}}|@|x|{{#set:A une caractéristique=x}} }} }} {{#if:{{{Titre court|}}}| {{#set: A un titre = {{{Titre court}}} }} }} {{#if:{{{Objectif|}}}| {{#arraymap:{{{Objectif}}}|@|x|{{#set:A un mot-clé=x}}}} }} {{Organisme de la page|Organisme={{{Organisme|}}}| Programme={{{Programme|}}}}}{{#if:{{{Date de mise en œuvre|}}}| {{#set: A une date de mise en œuvre = {{{Date de mise en œuvre}}} }} }}{{#if:{{{Mois de l'année|}}} |{{Mois d'intérêt de la page|{{{Mois de l'année}}} }} }}{{#if:{{{Coordonnées GPS|}}} | {{#set: A des coordonnées GPS = {{{Coordonnées GPS}}} }} | {{#if:{{{Latitude|}}} | {{#set: A des coordonnées GPS = {{{Latitude}}}, {{{Longitude}}} }} | {{#if:{{{Adresse |}}} | [[Category:Pages avec une adresse mais sans coordonnées GPS]] |  [[Category:Pages sans coordonnées GPS]]}} }} }}</includeonly>
```

Le premier est le modèle appelé par la page ; il transmet ses paramètres au second, qui porte les `#set`.

### Formulaires (espace 106, 14 pages)

- Requête n° 12, 2026-10-06T20:12:09+02:00, HTTP 200, 923 octets : `https://wiki.tripleperformance.fr/api.php?action=query&list=allpages&apnamespace=106&aplimit=500&format=json&formatversion=2`

- Formulaire:Bioagresseur
- Formulaire:Culture
- Formulaire:Culture et production
- Formulaire:Exemple de mise en œuvre
- Formulaire:Expérimentation
- Formulaire:Fiche technique
- Formulaire:Livre
- Formulaire:Matériel et outils
- Formulaire:Matériel et équipement
- Formulaire:Portrait de ferme
- Formulaire:Pratique
- Formulaire:Retour d'expérience
- Formulaire:Vidéo
- Formulaire:Événement

### Formulaire:Exemple de mise en œuvre — 1 lignes

- Requête n° 13, 2026-10-06T20:12:16+02:00, HTTP 200, 135 octets : `https://wiki.tripleperformance.fr/api.php?action=parse&page=Formulaire:Exemple%20de%20mise%20en%20%C5%93uvre&prop=wikitext&format=json&formatversion=2`

```
#REDIRECTION [[Formulaire:Retour d'expérience]]
```

### Formulaire:Retour d'expérience — 93 lignes

- Requête n° 14, 2026-10-06T20:12:18+02:00, HTTP 200, 3824 octets : `https://wiki.tripleperformance.fr/api.php?action=parse&page=Formulaire:Retour%20d%27exp%C3%A9rience&prop=wikitext&format=json&formatversion=2`

```
<noinclude>
Ceci est le formulaire « {{Translation for case study}} ».
Pour créer une page avec ce formulaire, entrez le nom de la page ci-dessous ;
si une page avec ce nom existe déjà, vous serez dirigé vers un formulaire pour l’éditer.

{{#forminput:form={{Translation for case study}} }}

</noinclude><includeonly>
<div id="wikiPreview" style="display: none; padding-bottom: 25px; margin-bottom: 25px; border-bottom: 1px solid #AAAAAA;"></div>
{{{for template|Exemple de mise en œuvre}}}
<div style="border: 1px solid grey; padding: 5px">
{| class="formtable"
! Nom de l'agriculteur : 
| {{{field|Nom de l'agriculteur|mandatory|input type=text with autocomplete|values from namespace=Utilisateur}}}
|-
! Photo de l'agriculteur (chargez une photo ou indiquez le nom du fichier sans le préfixe) : 
| {{{field|Photo de l'agriculteur|input type=text|uploadable|image preview}}}
|-
! Nom de l'exploitation : 
| {{{field|Nom de l'exploitation|input type=text with autocomplete}}}
|-
! Département (saisir les premières lettres du nom) :
| {{{field|Département|input type=text with autocomplete|values from category=Département}}}
|-
! Adresse :
| {{{field|Adresse|input type=text}}}
|-
! Localisation :
| {{{field|Coordonnées GPS|input type=leaflet}}}
|-
! SAU (en ha) : 
| {{{field|SAU}}}
|-
! UTH : 
| {{{field|UTH}}}
|-
! Texture du sol : 
| {{{field|Texture du sol|input type=combobox|values from category=Textures du sol}}}
|-
! Description de sol : 
| {{{field|Description de sol}}}
|-
! pH du sol :
| {{{field|pH|input type=dropdown|values=Sol acide,Sol peu acide,Sol neutre,Sol basique}}}
|-
! Type de production : 
| {{{field|Type de production|input type=combobox|values from concept=Productions}}}
|-
! Cultures : 
| {{{field|Cultures|input type=tokens|values from concept=Production_types|delimiter=@}}}
|-
! Cahier des charges : 
| {{{field|Cahier des charges|input type=tokens|values from concept=Specifications|delimiter=@}}}
|-
! Autres caractéristiques : 
| {{{field|Autres caractéristiques|input type=tokens|values from concept=Other_caracteristics|delimiter=@}}}
|}
</div><div style="border: 1px solid grey; padding: 5px">
{| class="formtable"
! Titre court : 
| {{{field|Titre court}}}
|-
! Objectif :
| {{{field|Objectif|input type=dropdown|values from category=Objectif}}}
|-
! Organisme : <br><small>''(conduisant l'expérimentation)''</small>
| {{{field|Organisme|input type=combobox|values from category=Structure}}}
|-
! Programme : <br><small>''(finançant cette expérimentation)''</small>
| {{{field|Programme|input type=combobox|values from category=Projets}}}
|-
! Date de mise en œuvre : 
| {{{field|Date de mise en œuvre|input type=year}}}
|-
! Photo d'illustration  (chargez une photo ou indiquez le nom du fichier sans le préfixe) : 
| {{{field|Photo d'illustration|input type=text|uploadable|image preview}}}
|-
! Mois de l'année d'intérêt de la fiche : <br><small>''Sélectionnez les mois durant lesquels cette fiche est d'actualité, pour la mettre en avant sur les réseaux sociaux ou sur la page d'accueil''</small>
| {{{field|Mois de l'année|input type=checkboxes|values=Janvier,Février,Mars,Avril,Mai,Juin,Juillet,Août,Septembre,Octobre,Novembre,Décembre}}}
|-
! Mots-clés : <br><small>''Ajoutez des mots clés à la page, qui peuvent être d'autres pages de la plateforme''</small>
| {{{field|Mots-clés|input type=tokens|values from concept=All pages with a type|delimiter=,}}}
|}
</div>
{{{end template}}}

== Contenu de la page ==
{{{standard input|free text|rows=20|autogrow|editor=visualeditor}}}

{{{for template|Pages liées}}}
{{{end template}}}

</includeonly>
```

Le formulaire associé est `Formulaire:Retour d'expérience` (`for template|Exemple de mise en œuvre`) ; `Formulaire:Exemple de mise en œuvre` est une redirection vers lui.

## Étape 6 — Taux de remplissage

Propriétés choisies dans les `#set` de `Modèle:Exemple de mise en œuvre et portrait de ferme` (étape 5), l'étape 4 n'ayant rendu aucun fait. Comptage sur tout le wiki, toutes pages confondues, pas seulement la catégorie des retours d'expérience.

**Méthode : `action=ask` avec `format=count`** (réponse de la forme `{"query":{"count":N,"meta":{"type":"count"}}}`). La méthode `limit=500` n'a pas été employée.

| Propriété | Pages |
|---|---|
| Est dans le département | 919 |
| A une SAU | 358 |
| A un UTH | 340 |
| A un sol | 382 |
| A une description du sol | 208 |
| A un pH de sol | 120 |
| A un type de production | 2055 |
| A une production | 446 |
| A un cahier des charges | 235 |
| A une caractéristique | 203 |
| Est dans l'exploitation | 282 |
| A comme agriculteur | 1906 |

- Requête n° 15, 2026-10-06T20:12:31+02:00, HTTP 200, 47 octets : `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BEst%20dans%20le%20d%C3%A9partement%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json`
- Requête n° 16, 2026-10-06T20:12:47+02:00, HTTP 200, 47 octets : `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20une%20SAU%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json`
- Requête n° 17, 2026-10-06T20:12:50+02:00, HTTP 200, 47 octets : `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20un%20UTH%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json`
- Requête n° 18, 2026-10-06T20:12:52+02:00, HTTP 200, 47 octets : `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20un%20sol%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json`
- Requête n° 19, 2026-10-06T20:12:54+02:00, HTTP 200, 47 octets : `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20une%20description%20du%20sol%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json`
- Requête n° 20, 2026-10-06T20:12:56+02:00, HTTP 200, 47 octets : `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20un%20pH%20de%20sol%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json`
- Requête n° 21, 2026-10-06T20:12:58+02:00, HTTP 200, 48 octets : `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20un%20type%20de%20production%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json`
- Requête n° 22, 2026-10-06T20:13:01+02:00, HTTP 200, 47 octets : `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20une%20production%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json`
- Requête n° 23, 2026-10-06T20:13:03+02:00, HTTP 200, 47 octets : `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20un%20cahier%20des%20charges%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json`
- Requête n° 24, 2026-10-06T20:13:05+02:00, HTTP 200, 47 octets : `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20une%20caract%C3%A9ristique%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json`
- Requête n° 25, 2026-10-06T20:13:07+02:00, HTTP 200, 47 octets : `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BEst%20dans%20l%27exploitation%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json`
- Requête n° 26, 2026-10-06T20:13:09+02:00, HTTP 200, 48 octets : `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20comme%20agriculteur%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json`

## Journal complet des requêtes

| N° | Horodatage | HTTP | Octets | Adresse |
|---|---|---|---|---|
| 1 | 2026-10-06T20:10:45+02:00 | 200 | 43065 | `https://wiki.tripleperformance.fr/api.php?action=query&meta=siteinfo&siprop=general%7Cextensions%7Cstatistics%7Cnamespaces&format=json&formatversion=2` |
| 2 | 2026-10-06T20:10:55+02:00 | 200 | 9431 | `https://wiki.tripleperformance.fr/api.php?action=query&list=allpages&apnamespace=102&aplimit=500&format=json&formatversion=2` |
| 3 | 2026-10-06T20:11:01+02:00 | 200 | 37744 | `https://wiki.tripleperformance.fr/api.php?action=query&list=allcategories&acprop=size&aclimit=500&format=json&formatversion=2` |
| 4 | 2026-10-06T20:11:10+02:00 | 200 | 38701 | `https://wiki.tripleperformance.fr/api.php?action=query&list=allcategories&acprop=size&aclimit=500&accontinue=Epeautre&format=json&formatversion=2` |
| 5 | 2026-10-06T20:11:15+02:00 | 200 | 38557 | `https://wiki.tripleperformance.fr/api.php?action=query&list=allcategories&acprop=size&aclimit=500&accontinue=Mycorhizes_et_champignons_fonctionnels_du_sol&format=json&formatversion=2` |
| 6 | 2026-10-06T20:11:21+02:00 | 200 | 21563 | `https://wiki.tripleperformance.fr/api.php?action=query&list=allcategories&acprop=size&aclimit=500&accontinue=Semoir_%C3%A0_c%C3%A9r%C3%A9ale&format=json&formatversion=2` |
| 7 | 2026-10-06T20:11:29+02:00 | 200 | 6159 | `https://wiki.tripleperformance.fr/api.php?action=query&list=categorymembers&cmtitle=Cat%C3%A9gorie:Retours_d%27exp%C3%A9rience&cmtype=page&cmlimit=50&format=json&formatversion=2` |
| 8 | 2026-10-06T20:11:35+02:00 | 200 | 372 | `https://wiki.tripleperformance.fr/api.php?action=browsebysubject&subject=Autonomie%20fourrag%C3%A8re%20et%20d%C3%A9rob%C3%A9es&format=json` |
| 9 | 2026-10-06T20:11:49+02:00 | 200 | 1317 | `https://wiki.tripleperformance.fr/api.php?action=parse&page=Autonomie%20fourrag%C3%A8re%20et%20d%C3%A9rob%C3%A9es&prop=templates&format=json&formatversion=2` |
| 10 | 2026-10-06T20:11:56+02:00 | 200 | 2598 | `https://wiki.tripleperformance.fr/api.php?action=parse&page=Mod%C3%A8le:Exemple%20de%20mise%20en%20%C5%93uvre&prop=wikitext&format=json&formatversion=2` |
| 11 | 2026-10-06T20:12:03+02:00 | 200 | 4514 | `https://wiki.tripleperformance.fr/api.php?action=parse&page=Mod%C3%A8le:Exemple%20de%20mise%20en%20%C5%93uvre%20et%20portrait%20de%20ferme&prop=wikitext&format=json&formatversion=2` |
| 12 | 2026-10-06T20:12:09+02:00 | 200 | 923 | `https://wiki.tripleperformance.fr/api.php?action=query&list=allpages&apnamespace=106&aplimit=500&format=json&formatversion=2` |
| 13 | 2026-10-06T20:12:16+02:00 | 200 | 135 | `https://wiki.tripleperformance.fr/api.php?action=parse&page=Formulaire:Exemple%20de%20mise%20en%20%C5%93uvre&prop=wikitext&format=json&formatversion=2` |
| 14 | 2026-10-06T20:12:18+02:00 | 200 | 3824 | `https://wiki.tripleperformance.fr/api.php?action=parse&page=Formulaire:Retour%20d%27exp%C3%A9rience&prop=wikitext&format=json&formatversion=2` |
| 15 | 2026-10-06T20:12:31+02:00 | 200 | 47 | `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BEst%20dans%20le%20d%C3%A9partement%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json` |
| 16 | 2026-10-06T20:12:47+02:00 | 200 | 47 | `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20une%20SAU%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json` |
| 17 | 2026-10-06T20:12:50+02:00 | 200 | 47 | `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20un%20UTH%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json` |
| 18 | 2026-10-06T20:12:52+02:00 | 200 | 47 | `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20un%20sol%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json` |
| 19 | 2026-10-06T20:12:54+02:00 | 200 | 47 | `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20une%20description%20du%20sol%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json` |
| 20 | 2026-10-06T20:12:56+02:00 | 200 | 47 | `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20un%20pH%20de%20sol%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json` |
| 21 | 2026-10-06T20:12:58+02:00 | 200 | 48 | `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20un%20type%20de%20production%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json` |
| 22 | 2026-10-06T20:13:01+02:00 | 200 | 47 | `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20une%20production%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json` |
| 23 | 2026-10-06T20:13:03+02:00 | 200 | 47 | `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20un%20cahier%20des%20charges%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json` |
| 24 | 2026-10-06T20:13:05+02:00 | 200 | 47 | `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20une%20caract%C3%A9ristique%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json` |
| 25 | 2026-10-06T20:13:07+02:00 | 200 | 47 | `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BEst%20dans%20l%27exploitation%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json` |
| 26 | 2026-10-06T20:13:09+02:00 | 200 | 48 | `https://wiki.tripleperformance.fr/api.php?action=ask&query=%5B%5BA%20comme%20agriculteur%3A%3A%2B%5D%5D%7Cformat%3Dcount&format=json` |
