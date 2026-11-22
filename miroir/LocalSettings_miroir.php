<?php
# Miroir local du wiki Ecolibre — lot 22 du SGDT.
#
# Reprend la configuration de production (LocalSettings_ecolibre.php). Le
# miroir compte exactement douze écarts, décrits dans
# miroir/ecarts-avec-la-production.md : les dix qui relèvent de ce fichier
# (1 à 9, et 11) sont marqués « ÉCART n » ci-dessous ; le dixième et le
# douzième portent sur l'image PHP (miroir/Dockerfile) : ses modules PHP,
# et PHP en module Apache au lieu de FPM. Toute autre différence de comportement
# avec la production est une erreur de ce fichier.
#
# Aucun secret ici : les valeurs secrètes se lisent par getenv(), depuis
# l'environnement du conteneur (fichier miroir.env, hors du dépôt).
#
# Mise au net sans effet de comportement : les extensions que la production
# charge deux fois (dont Lockdown) ne sont chargées qu'une fois ici.

if ( !defined( 'MEDIAWIKI' ) ) {
	exit;
}

## Site
$wgSitename = "Ecolibre";

## URL
$wgScriptPath = "";
$wgArticlePath = '/wiki/$1';

# ÉCART 1 — adresse du miroir, port lié à 127.0.0.1 seulement.
$wgServer = "http://localhost:8080";

## Logo
$wgLogos = [
	'1x' => "https://cwl.li/Logo_Ecolibre_135x135.png",
	'icon' => "https://cwl.li/Logo_Ecolibre_135x135.png",
];

## Courriel
$wgEnableEmail = true;
$wgEnableUserEmail = true; # UPO

# ÉCART 7 — adresses locales invalides : le miroir n'envoie aucun courriel réel.
$wgEmergencyContact = "miroir@localhost.invalide";
$wgPasswordSender = "miroir@localhost.invalide";

$wgEnotifUserTalk = true; # UPO
$wgEnotifWatchlist = true; # UPO
$wgEmailAuthentication = true;

## Base de données
$wgDBtype = "mysql";

# ÉCART 4 — serveur, base et compte du miroir, lus dans l'environnement.
# Le nom de base reste mediawiki_ecolibre_prod : c'est l'identifiant du wiki
# sous lequel SMW range son état dans extensions/SemanticMediaWiki/.smw.json.
$wgDBserver = getenv( 'MIROIR_DB_SERVER' );
$wgDBname = getenv( 'MIROIR_DB_NAME' );
$wgDBuser = getenv( 'MIROIR_DB_USER' );
$wgDBpassword = getenv( 'MIROIR_DB_PASSWORD' );

$wgDBprefix = "";
$wgDBTableOptions = "ENGINE=InnoDB, DEFAULT CHARSET=binary";
$wgSharedTables[] = "actor";

## Cache
$wgMainCacheType = CACHE_MEMCACHED;

# ÉCART 2 — memcached joint par le réseau interne de compose, et non par la
# prise unix de la production.
$wgMemCachedServers = [ 'memcached:11211' ];

$wgSessionCacheType = CACHE_DB;
$wgCacheDirectory = "$IP/cache/ecolibre";
$wgUseFileCache = true;
$wgInvalidateCacheOnLocalSettingsChange = false;
$wgCachePages = false;

# ÉCART 11 — aucun travail de la file exécuté pendant une requête web.
# Sur le miroir, une requête de lecture ne doit pas modifier la base, sinon
# une mesure ne se répète pas. La production laisse la valeur par défaut, 1.
# Pour éprouver ce qui dépend des travaux : retirer cette ligne, ou lancer
# maintenance/runJobs.php délibérément.
$wgJobRunRate = 0;

## Fichiers
# ÉCART 9 — images/ecolibre et cache/ecolibre sont vides sur le miroir :
# les pages de fichier existent sans leur fichier, les liens d'image sont
# cassés. Les réglages eux-mêmes sont ceux de la production.
$wgEnableUploads = true;
$wgUploadDirectory = "$IP/images/ecolibre";
$wgUploadPath = "/images/ecolibre";
$wgUseImageMagick = true;
$wgImageMagickConvertCommand = "/usr/bin/convert";
$wgUseInstantCommons = false;
$wgFileExtensions = [
	'png', 'gif', 'jpg', 'jpeg', 'webp', 'pdf',
	'doc', 'docx', 'odt', 'xls', 'xlsx', 'ods',
	'ppt', 'pptx', 'odp', 'tiff', 'bmp', 'ico',
];

# ÉCART 3 — aucune remontée de statistiques vers mediawiki.org.
$wgPingback = false;

## Langue et fuseau
$wgLanguageCode = "fr";
$wgLocaltimezone = "Europe/Paris";

## Clés
# ÉCART 5 — clé secrète propre au miroir.
$wgSecretKey = getenv( 'MIROIR_SECRET_KEY' );
$wgAuthenticationTokenVersion = "1";
# ÉCART 6 — clé de mise à jour propre au miroir.
$wgUpgradeKey = getenv( 'MIROIR_UPGRADE_KEY' );

## Licence
$wgRightsPage = "";
$wgRightsUrl = "https://creativecommons.org/licenses/by-sa/4.0/deed.fr";
$wgRightsText = "Creative Commons Attribution - Partage dans les mêmes conditions 4.0 International";
$wgRightsIcon = "https://licensebuttons.net/l/by-sa/4.0/88x31.png";

$wgDiff3 = "/usr/bin/diff3";

## Droits
$wgGroupPermissions["*"]["edit"] = false;
$wgGroupPermissions['user']['edit'] = true;
$wgEmailConfirmToEdit = true;
$wgGroupPermissions["*"]["createaccount"] = false;

## Habillages
$wgDefaultSkin = "vector";
wfLoadSkin( 'MinervaNeue' );
wfLoadSkin( 'MonoBook' );
wfLoadSkin( 'Timeless' );
wfLoadSkin( 'Vector' );

## Extensions, dans l'ordre de la production
wfLoadExtension( 'CategoryTree' );
wfLoadExtension( 'Cite' );
wfLoadExtension( 'CleanChanges' );
wfLoadExtension( 'CodeEditor' );
wfLoadExtension( 'MyVariables' );
wfLoadExtension( 'Nuke' );
wfLoadExtension( 'PageForms' );
wfLoadExtension( 'ParserFunctions' );
wfLoadExtension( 'Renameuser' );
wfLoadExtension( 'ReplaceText' );
wfLoadExtension( 'SemanticMediaWiki' );
wfLoadExtension( 'SemanticResultFormats' );
wfLoadExtension( 'TemplateData' );
wfLoadExtension( 'UserMerge' );
wfLoadExtension( 'VEForAll' );
wfLoadExtension( 'VisualEditor' );
wfLoadExtension( 'WikiEditor' );
wfLoadExtension( 'Scribunto' );
wfLoadExtension( 'Mermaid' );
wfLoadExtension( 'Lockdown' );
wfLoadExtensions( [ 'ConfirmEdit', 'ConfirmEdit/QuestyCaptcha' ] );

## Collation
$wgCategoryCollation = 'uca-fr';
$smwgEntityCollation = 'uca-fr';

## Scribunto
$wgScribuntoDefaultEngine = 'luastandalone';

## WikiEditor et CodeEditor
// Enables use of WikiEditor by default # UPO
$wgDefaultUserOptions['usebetatoolbar'] = 1;
// Enables link and table wizards by default # UPO
$wgDefaultUserOptions['usebetatoolbar-cgd'] = 1;
// Displays the Preview and Changes tabs
$wgDefaultUserOptions['wikieditor-preview'] = 1;
// Displays the Publish and Cancel buttons on the top right side
$wgDefaultUserOptions['wikieditor-publish'] = 1;

## VisualEditor et VEForAll
# Affecte le tableau en entier : doit précéder le bloc CWL, qui lui ajoute
# ensuite NS_CWL et NS_CWL_TALK.
$wgVisualEditorAvailableNamespaces = [
	NS_MAIN => true,
	NS_USER => true,
	NS_PROJECT => true,
	NS_HELP => true
];
// Enable by default for everybody
$wgDefaultUserOptions['visualeditor-enable'] = 1;
// Don't allow users to disable it
$wgHiddenPrefs[] = 'visualeditor-enable';

## CleanChanges
$wgDefaultUserOptions['usenewrc'] = 1;
$wgCCUserFilter = false;
$wgCCTrailerFilter = true;

## ConfirmEdit et QuestyCaptcha
$wgCaptchaTriggers['createaccount'] = true;
$wgCaptchaTriggers['autocreateaccount'] = true;
$wgCaptchaTriggers['edit']          = true;
$wgCaptchaTriggers['create']        = true;
$wgCaptchaTriggers['createtalk']    = true;
$wgCaptchaTriggers['addurl']        = false;
$wgCaptchaTriggers['badlogin']      = true;
$wgGroupPermissions['user']['skipcaptcha'] = true;
$wgGroupPermissions['emailconfirmed']['skipcaptcha'] = true;
$ceAllowConfirmedEmail = true;

# ÉCART 8 — question et réponse locales, sans rapport avec la production.
$wgCaptchaQuestions[] = [
	'question' => "Combien de pattes a une araignée ? (en chiffres)",
	'answer' => "8",
];

## Semantic MediaWiki
enableSemantics( 'wiki.ecolibre.org' );
$smwgQMaxSize = 40;
$smwgEnabledQueryDependencyLinksStore = true;

## Page Forms
$wgGroupPermissions['*']['viewedittab'] = false;
$wgGroupPermissions['sysop']['viewedittab'] = true;
$wgPageFormsUseDisplayTitle = false;
$wgPageFormsSimpleUpload = true;
$wgPageFormsRenameEditTabs = true;
$wgPageFormsMaxAutocompleteValues = 1000;
$wgPageFormsMaxLocalAutocompleteValues = 500;

// ---------------------------------------------------------
// 100. Configuration de l'Espace de Noms Privé (CWL) - AVEC LOCKDOWN
// ---------------------------------------------------------
define("NS_CWL", 500);
define("NS_CWL_TALK", 501);
$wgExtraNamespaces[NS_CWL] = "CWL";
$wgExtraNamespaces[NS_CWL_TALK] = "CWL_Discussion";

// 1. On charge l'extension requise pour bloquer la lecture
// Miroir : Lockdown est déjà chargée plus haut, à sa place dans la liste des
// extensions ; la production la charge une seconde fois ici.
// wfLoadExtension( 'Lockdown' );

// 2. On utilise les bonnes variables de Lockdown pour restreindre l'accès
// Seuls les admins (sysop) peuvent LIRER cet espace
$wgNamespacePermissionLockdown[NS_CWL]['read'] = ['sysop'];
$wgNamespacePermissionLockdown[NS_CWL_TALK]['read'] = ['sysop'];

// On en profite pour s'assurer que seuls les admins peuvent l'ÉDITER
$wgNamespacePermissionLockdown[NS_CWL]['edit'] = ['sysop'];
$wgNamespacePermissionLockdown[NS_CWL_TALK]['edit'] = ['sysop'];

// --- Intégration VisualEditor & SMW ---
$wgVisualEditorAvailableNamespaces[NS_CWL] = true;
$wgVisualEditorAvailableNamespaces[NS_CWL_TALK] = true;
$smwgNamespacesWithSemanticLinks[NS_CWL] = true;

// ---------------------------------------------------------
// Lot 48 - Espaces de formation verrouillés, appliqué le 19 novembre 2026.
// Numéros réservés, non créés : 512 et 513 pour Inventor, 514 et 515 pour Catia.
// ---------------------------------------------------------
define( 'NS_CAO', 502 );
define( 'NS_CAO_TALK', 503 );
define( 'NS_SOLIDWORKS', 504 );
define( 'NS_SOLIDWORKS_TALK', 505 );
define( 'NS_FREECAD', 506 );
define( 'NS_FREECAD_TALK', 507 );
define( 'NS_ONSHAPE', 508 );
define( 'NS_ONSHAPE_TALK', 509 );
define( 'NS_FUSION', 510 );
define( 'NS_FUSION_TALK', 511 );

$wgExtraNamespaces[NS_CAO] = 'CAO';
$wgExtraNamespaces[NS_CAO_TALK] = 'Discussion_CAO';
$wgExtraNamespaces[NS_SOLIDWORKS] = 'SolidWorks';
$wgExtraNamespaces[NS_SOLIDWORKS_TALK] = 'Discussion_SolidWorks';
$wgExtraNamespaces[NS_FREECAD] = 'FreeCAD';
$wgExtraNamespaces[NS_FREECAD_TALK] = 'Discussion_FreeCAD';
$wgExtraNamespaces[NS_ONSHAPE] = 'Onshape';
$wgExtraNamespaces[NS_ONSHAPE_TALK] = 'Discussion_Onshape';
$wgExtraNamespaces[NS_FUSION] = 'Fusion';
$wgExtraNamespaces[NS_FUSION_TALK] = 'Discussion_Fusion';

// Le groupe formation : Cyril et le robot de formation.
$wgGroupPermissions['formation']['read'] = true;

// Lecture, modification et toute autre action réservées au groupe formation ;
// inclusion interdite, même entre pages de formation ; sous-pages et éditeur visuel.
foreach ( [ NS_CAO, NS_CAO_TALK, NS_SOLIDWORKS, NS_SOLIDWORKS_TALK, NS_FREECAD, NS_FREECAD_TALK, NS_ONSHAPE, NS_ONSHAPE_TALK, NS_FUSION, NS_FUSION_TALK ] as $lot48ns ) {
    $wgNamespacePermissionLockdown[$lot48ns]['*'] = [ 'formation' ];
    $wgNonincludableNamespaces[] = $lot48ns;
    $wgNamespacesWithSubpages[$lot48ns] = true;
    $wgVisualEditorAvailableNamespaces[$lot48ns] = true;
}

// Semantic MediaWiki dans les cinq espaces de contenu.
foreach ( [ NS_CAO, NS_SOLIDWORKS, NS_FREECAD, NS_ONSHAPE, NS_FUSION ] as $lot48ns ) {
    $smwgNamespacesWithSemanticLinks[$lot48ns] = true;
}

// Décision du lot 48 pour tout le wiki : un résumé laissé vide n'est plus
// rempli par le début du texte, qui se lirait sans connexion.
$wgUseAutomaticEditSummaries = false;

// ---------------------------------------------------------
// Lot 48, amendement du 22 novembre 2026 : quatre chemins de l'API lisaient
// sans compte les pages verrouillées par Lockdown. Réglages provisoires, à
// retirer après la mise à jour de MediaWiki, chacun une fois sa faille
// vérifiée corrigée sans connexion sur la page témoin CAO:Essai lot 48.
// ---------------------------------------------------------
// CVE-2025-67480, corrigée en 1.39.16 : list=allrevisions ignore Lockdown.
$wgAPIListModules['allrevisions'] = 'ApiQueryDisabled';
// action=compare rend le texte d'une version verrouillée.
$wgAPIModules['compare'] = 'ApiDisabled';
// Les deux modules de l'éditeur visuel traitent une page sans vérifier le
// droit de lecture de l'appelant : on le vérifie avant eux.
$wgHooks['ApiCheckCanExecute'][] = static function ( $module, $user, &$message ) {
    if ( !in_array( $module->getModuleName(), [ 'visualeditor', 'visualeditoredit' ], true ) ) {
        return true;
    }
    $page = $module->getRequest()->getVal( 'page' );
    $title = $page === null ? null : Title::newFromText( $page );
    if ( $title !== null && !MediaWiki\MediaWikiServices::getInstance()->getPermissionManager()->userCan( 'read', $user, $title ) ) {
        $message = 'badaccess-group0';
        return false;
    }
    return true;
};
