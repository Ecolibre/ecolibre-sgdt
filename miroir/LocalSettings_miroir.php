<?php
# Miroir local du wiki Ecolibre — lot 22 du SGDT.
#
# Reprend la configuration de production (LocalSettings_ecolibre.php). Le
# miroir compte exactement douze écarts, décrits dans
# miroir/ecarts-avec-la-production.md : les dix qui relèvent de ce fichier
# (1 à 9, et 11) sont marqués « ÉCART n » ci-dessous ; le dixième porte sur
# les modules PHP de l'image (miroir/Dockerfile). Toute autre différence de comportement
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
