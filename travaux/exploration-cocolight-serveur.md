# Exploration du serveur Cocolight et de ses accès MediaWiki

Pour l'architecte. Ce rapport fait suite à `travaux/exploration-site-json.md`.

- Rien n'a été écrit sur le wiki et aucune commande `bin/wiki-*.sh` n'a été lancée.
- Le code cloné n'a été ni installé ni exécuté.
- Les clones, faits avec `--depth 1`, sont restés en place dans `~/exploration-site-json/` ; ils sont décrits sous R1.
- Les chemins sont relatifs à `~/exploration-site-json/`. Les extraits sont numérotés comme dans le fichier source.
- Relevé du 5 octobre 2026.

## Inventaire des dépôts (étape 3)

Adresse interrogée sans jeton : `https://gitlab.adullact.net/api/v4/groups/pixelhumain/projects?per_page=100&order_by=last_activity_at`. Elle a répondu HTTP 200 avec 73 dépôts. 73 est inférieur au plafond de 100 par page : la liste est donc complète, sans page suivante. Les deux adresses de repli n'ont pas servi.

Colonnes : chemin complet | nom | description | visibilité | dernière activité.

````
pixelhumain/site-json | site-json |  | public | 2026-10-05T17:40:50.849+02:00
pixelhumain/cocolight-api-client | cocolight api client |  | public | 2026-10-05T10:08:58.793+02:00
pixelhumain/co2 | co2 | Communecter 2.0 | public | 2026-10-02T18:25:40.964+02:00
pixelhumain/citizenToolKit | citizenToolKit |  | public | 2026-10-02T18:25:31.920+02:00
pixelhumain/costum | costum |  | public | 2026-10-02T11:39:54.236+02:00
pixelhumain/survey | survey | easy survey module for CO using dynSurvey  | public | 2026-10-02T08:19:36.581+02:00
pixelhumain/cocolight-backend | cocolight backend |  | public | 2026-10-01T13:16:12.052+02:00
pixelhumain/pixelhumain | pixelhumain | Generic & Modulare Citizen Toolkit (Php , MongoDB, REstfull API, Boostrap) | public | 2026-09-24T10:32:40.456+02:00
pixelhumain/api2 | api2 |  | public | 2026-09-03T13:07:28.538+02:00
pixelhumain/api | api |  | public | 2026-09-03T11:39:22.977+02:00
pixelhumain/map | map |  | public | 2026-06-12T08:23:46.489+02:00
pixelhumain/interop | interop | Module concernant l'interopérabilité avec d'autre site  | public | 2026-05-04T06:06:24.867+02:00
pixelhumain/cocolight | cocolight |  | public | 2026-04-08T11:30:53.502+02:00
pixelhumain/news | news | NEWS | public | 2026-02-17T14:09:27.912+01:00
pixelhumain/graph | graph | all graph generated for CO | public | 2026-02-17T14:09:13.426+01:00
pixelhumain/coeurmobi-monorepo | coeurmobi-monorepo |  | public | 2026-01-29T11:41:07.279+01:00
pixelhumain/notif-hub | notif-hub |  | public | 2026-01-28T13:08:52.642+01:00
pixelhumain/eco | eco | Local Exchange Systems, classifieds, ressources, offers, needs, services, competence, jobs | public | 2026-01-07T18:55:00.527+01:00
pixelhumain/dda | dda | Collaboration tools Dicuss, Decide, Action | public | 2025-12-05T06:59:43.055+01:00
pixelhumain/Rocket-Chat | Rocket-Chat | Have your own Slack like online chat, built with Meteor. | public | 2025-10-12T14:22:47.837+02:00
pixelhumain/editor-site-json | editor-site-json |  | public | 2025-08-08T08:37:01.991+02:00
pixelhumain/siteslug | siteSlug |  | public | 2025-07-23T14:13:13.915+02:00
pixelhumain/oceco | oceco |  | public | 2025-07-15T10:04:34.424+02:00
pixelhumain/cocostum | cocostum |  | public | 2025-06-25T07:00:14.002+02:00
pixelhumain/jsontohtml | jsontohtml |  | public | 2025-04-23T09:53:24.078+02:00
pixelhumain/docker-aap | docker aap |  | public | 2025-04-22T15:20:26.443+02:00
pixelhumain/codoc | codoc | documentation CO et Open Atlas en Markdown  | public | 2025-02-28T00:00:11.672+01:00
pixelhumain/doc-actions-co | doc-actions-co |  | public | 2025-02-21T09:54:24.462+01:00
pixelhumain/docker | docker | docker images for easy installing communecter and it's modules  | public | 2025-02-03T07:48:37.902+01:00
pixelhumain/address-processing-poc | address-processing-poc |  | public | 2024-12-03T06:58:33.563+01:00
pixelhumain/places | places | Module for using places | public | 2024-11-09T06:41:13.553+01:00
pixelhumain/chat | chat | Rocket Chat integration inside CO | public | 2024-11-09T06:40:23.550+01:00
pixelhumain/install-local-cocolight | Install Local Cocolight |  | public | 2024-11-05T14:27:02.912+01:00
pixelhumain/comobi | comobi | communecter mobile interface based on meteor | public | 2024-08-18T11:07:58.213+02:00
pixelhumain/codesign | codesign |  | public | 2024-06-25T06:00:41.461+02:00
pixelhumain/models | models |  | public | 2024-03-30T09:30:29.474+01:00
pixelhumain/sso | sso | sso based on node.js/meteor for CO users  | public | 2023-10-03T12:45:04.535+02:00
pixelhumain/rocket-chat-rest-client | Rocket Chat Rest Client |  | public | 2023-03-21T12:29:50.424+01:00
pixelhumain/wekan | wekan | The open-source Trello-like kanban (built with Meteor) | public | 2022-10-27T09:54:20.243+02:00
pixelhumain/communecter | communecter | Manage cities as a connected citizen (email & postalCode), produce openCityData, manage organizations, projects, events openly , an open societal approach | public | 2022-10-21T11:10:02.861+02:00
pixelhumain/cotools | cotools | Collection of Open Source Tools For Communities | public | 2022-08-08T11:48:37.151+02:00
pixelhumain/learn | learn | this is an empty sample module | public | 2022-05-17T13:40:09.336+02:00
pixelhumain/costumexport | costumExport | contient tout les exports des costums pour facilité l'installation sur n'importe quel plateforme | public | 2022-03-17T13:22:28.237+01:00
pixelhumain/sso-client-communecter-test | Sso Client Communecter Test |  | public | 2021-08-18T09:39:05.173+02:00
pixelhumain/ws-co | ws-co |  | public | 2021-06-01T11:24:52.953+02:00
pixelhumain/GoGoCarto | GoGoCarto | The project has been moved to https://gitlab.com/seballot/gogocarto | public | 2021-05-15T12:41:14.186+02:00
pixelhumain/GoGoCartoJs | GoGoCartoJs | The project has been moved to https://gitlab.com/seballot/gogocarto-js | public | 2021-05-13T16:12:59.961+02:00
pixelhumain/co-vendor | co-vendor |  | public | 2020-12-23T08:07:28.969+01:00
pixelhumain/co-meta | co-meta |  | public | 2020-12-22T07:20:46.495+01:00
pixelhumain/onepage | onepage |  | public | 2020-10-27T10:37:29.093+01:00
pixelhumain/parsecsv-for-php | Parsecsv For Php |  | public | 2020-09-23T08:15:01.501+02:00
pixelhumain/TCPDF | TCPDF |  | public | 2020-04-07T13:32:35.866+02:00
pixelhumain/MongoYii | MongoYii |  | public | 2020-04-07T13:24:17.839+02:00
pixelhumain/network | network | simplified network mapping module absed on the citizen toolkit | public | 2020-03-31T13:31:32.683+02:00
pixelhumain/meteor-accounts-communecter | meteor-accounts-communecter | meteor accounts communecter packages | public | 2019-10-24T12:13:31.713+02:00
pixelhumain/reveal.js | Reveal.js | Slideshow for CO | public | 2019-05-24T12:17:20.210+02:00
pixelhumain/communEvent | communEvent | meteor mobile event application | public | 2019-02-15T10:54:32.792+01:00
pixelhumain/notragora | notragora | Plateforme Notre Agora | public | 2018-12-18T09:14:43.027+01:00
pixelhumain/sig | sig | System d'information cartographique adapté au Pixel Humain  | public | 2018-12-17T09:54:51.426+01:00
pixelhumain/opendata | opendata | divers capteurs meteo comme smart Citizen , Arduino, Rasperi  | public | 2018-12-17T09:54:42.522+01:00
pixelhumain/terla | terla |  | public | 2018-12-17T09:54:42.172+01:00
pixelhumain/mongodb-odm | mongodb-odm | Doctrine MongoDB Object Document Mapper (ODM) | public | 2018-12-17T09:54:33.153+01:00
pixelhumain/meteormobil | meteormobil | application communecter mobile native + meteor  | public | 2018-12-17T09:54:30.866+01:00
pixelhumain/waterwatcher | waterwatcher | Water Watcher - Community Observation (Mobile and Web).  | public | 2018-12-17T09:54:28.741+01:00
pixelhumain/translations | translations | translating all our repositories  | public | 2018-12-17T09:54:16.559+01:00
pixelhumain/Leaflet-markercluster | Leaflet-markercluster | Marker Clustering plugin for Leaflet | public | 2018-12-17T09:54:16.523+01:00
pixelhumain/echolocal | echolocal | Système de Resotage, sondage et de discussion de groupe accés Environnment | public | 2018-12-17T09:54:08.326+01:00
pixelhumain/connect | connect | sso module | public | 2018-12-17T09:53:52.824+01:00
pixelhumain/cococarto | cococarto | module utilisant gogoCarto  | public | 2018-12-17T09:53:50.953+01:00
pixelhumain/coExtension | coExtension | Plug-in de Communecter | public | 2018-12-17T09:53:49.789+01:00
pixelhumain/city | city | module modélisant une ville  | public | 2018-12-17T09:53:48.494+01:00
pixelhumain/cityData | cityData | open data schema of a city  | public | 2018-12-17T09:53:47.519+01:00
pixelhumain/buildingCommons | buildingCommons | This is a Cross Project for dev-Common structures, listing all final ontoliogy structures of any common good application  | public | 2018-12-17T09:53:45.949+01:00
````

## R1. Quel dépôt contient le serveur Cocolight ?

J'ai retenu deux candidats, dans la limite fixée par la consigne.

**Critères de choix.**

- `pixelhumain/cocolight-backend` : c'est le seul dépôt dont le nom désigne un serveur Cocolight. Sa dernière activité date du 2026-10-01.
- `pixelhumain/interop` : sa description est « Module concernant l'interopérabilité avec d'autre site ». Son arborescence, lue par l'API GitLab avant le clone (`/api/v4/projects/279/repository/tree?path=controllers`), contient `controllers/MediawikiController.php`.

D'autres dépôts n'ont pas été clonés : `co2`, `citizenToolKit`, `api`, `api2`, `cocolight` et `cocolight-api-client`.

**Clones** (`git clone --depth 1`, mesurés avec `du -sh`) :

| Clone | Taille | Commit extrait |
|---|---|---|
| `interop/` | 2.8M | `30bee0ad7f694a8d91562e4f80cd8815b9c40485`, 2026-05-04T07:02:06+03:00, ANDRIANIRINARISOA Paul Antenaina Louis Francki |
| `cocolight-backend/` | 36M | `d224e4cb90c6b91ca03098d56668854b9cd52f94`, 2026-10-01T14:48:55+04:00, aboire |

Les deux dépôts sont publics. Aucun clone n'a échoué ni approché la limite de 2 Go.

**Résultat :** les trois routes connues sont implémentées **deux fois**.

- **`interop`** (PHP, Yii) : c'est l'implémentation d'origine, désignée « legacy » dans `cocolight-backend`. Les routes sont dans `interop/controllers/MediawikiController.php` et les appels au wiki dans `interop/models/ApiMediaWiki.php`. `interop/config/module.php` le rattache au module `co2` :

````
    1  <?php
    2  $moduleConfig = array(
    3  		"parent" => "co2",
    4  		"overwriteList" => array(
    5  			"views" => array(),
    6  			"assets" => array(),
    7  			"controllers" => array(),
    8  		)
    9  );
````

- **`cocolight-backend`** (Node, Fastify) : c'est une réécriture. Les routes sont dans `cocolight-backend/src/modules/interop/interop.routes.ts`.

Le contrat d'API de `cocolight-backend` (`grep -n '"path": "/interop/' cocolight-backend/src/contract/endpoints-copie.json`) ne contient que huit routes `/interop/`, dont les trois routes MediaWiki connues :

````
60431:      "path": "/interop/discourse/linkAccount",
60653:      "path": "/interop/discourse/unlinkAccount",
60782:      "path": "/interop/discourse/profile",
60945:      "path": "/interop/discourse/checkEmailMatch",
61147:      "path": "/interop/discourse/dismissDiscourseLink",
61300:      "path": "/interop/mediawiki/linkAccount",
61515:      "path": "/interop/mediawiki/unlinkAccount",
61644:      "path": "/interop/mediawiki/contribs",
````

Je n'ai pas établi lequel des deux serveurs répond aujourd'hui aux appels de site-json. Voir « Écarts et surprises », point 3.

## R2. Le serveur écrit-il dans un MediaWiki ?

### Recherche des trois routes connues (étape 6)

Commande :

````
cd ~/exploration-site-json && grep -rn -I -E 'interop/mediawiki|linkAccount|unlinkAccount|contribs|LINK_MEDIAWIKI_ACCOUNT|UNLINK_MEDIAWIKI_ACCOUNT|GET_MEDIAWIKI_CONTRIBUTIONS' --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=vendor interop cocolight-backend
````

Elle donne 278 lignes. La plupart viennent des outils d'audit de `cocolight-backend` (`tools/security`, `tools/parity`). Ce sont des lignes de contexte, recopiées plus bas. Les fichiers qui implémentent les routes sont les trois suivants.

#### `cocolight-backend/src/modules/interop/interop.routes.ts` : 89 lignes, recopié en entier

````
    1  import type { FastifyPluginAsync } from 'fastify';
    2  import { ObjectId } from 'mongodb';
    3  import { coll } from '../../db/mongo.js';
    4  import { requireAuth } from '../../http/middlewares/auth.js';
    5  import { fail } from '../../serialization/wrappers.js';
    6  
    7  /** Routes interop Discourse/MediaWiki (link/unlink/profile/contribs) — extrait d'advanced.routes.ts, audit étape 6. */
    8  export const interopRoutes: FastifyPluginAsync = async (app) => {
    9    // ───────────────── interop discourse / mediawiki ─────────────────
   10    // LOCAL (link/unlink/dismiss) = écriture citoyens.interop.<svc>.<slug> (validable hors-ligne).
   11    // DISTANT (profile/contribs/checkEmailMatch + validation du link) = gated sur ENV (DISCOURSE_URL /
   12    //   WIKI_API_URL) ; sinon comportement neutre. TODO : auth API key / SSO complets.
   13    const DISCOURSE_URL = (process.env.DISCOURSE_URL ?? '').replace(/\/$/, '');
   14    const WIKI_API_URL = process.env.WIKI_API_URL ?? '';
   15    const setInterop = async (userId: string, svc: string, slug: string, value: unknown): Promise<void> => {
   16      if (!ObjectId.isValid(userId) || !slug) return;
   17      const op = value === undefined ? { $unset: { [`interop.${svc}.${slug}`]: '' } } : { $set: { [`interop.${svc}.${slug}`]: value } };
   18      await coll('citoyens').updateOne({ _id: new ObjectId(userId) }, op);
   19    };
   20  
   21    app.post('/interop/discourse/linkAccount', { preHandler: requireAuth }, async (req) => {
   22      const b = (req.body ?? {}) as Record<string, string>;
   23      const username = String(b.username ?? '');
   24      const slug = String(b.costumSlug ?? '');
   25      if (!username) return fail('Paramètre username manquant.');
   26      if (DISCOURSE_URL) {
   27        try {
   28          const r = await fetch(`${DISCOURSE_URL}/u/${encodeURIComponent(username)}.json`);
   29          if (!r.ok) return fail("Cet utilisateur Discourse n'existe pas.");
   30        } catch { /* réseau indisponible -> on n'échoue pas le link local */ }
   31      }
   32      await setInterop(req.auth!.userId, 'discourse', slug, username);
   33      return { result: true, username, profileUrl: DISCOURSE_URL ? `${DISCOURSE_URL}/u/${username}/summary` : null };
   34    });
   35    app.post('/interop/discourse/unlinkAccount', { preHandler: requireAuth }, async (req) => {
   36      await setInterop(req.auth!.userId, 'discourse', String((req.body as Record<string, string>)?.costumSlug ?? ''), undefined);
   37      return { result: true };
   38    });
   39    app.post('/interop/discourse/dismissDiscourseLink', { preHandler: requireAuth }, async (req) => {
   40      await setInterop(req.auth!.userId, 'discourse', String((req.body as Record<string, string>)?.costumSlug ?? ''), false);
   41      return { result: true };
   42    });
   43    app.post('/interop/discourse/profile', async (req) => {
   44      const username = String((req.body as Record<string, string>)?.username ?? '');
   45      // actionProfile renvoie {error} quand username vide. NB : le http_response_code(400) du contrôleur
   46      // est écrasé par Rest::json -> le statut reste 200 (vérifié live). On renvoie donc 200 {error}.
   47      if (!username) return { error: 'Paramètre username manquant.' };
   48      let summary: unknown = null;
   49      if (DISCOURSE_URL) {
   50        try { const r = await fetch(`${DISCOURSE_URL}/u/${encodeURIComponent(username)}/summary.json`); if (r.ok) summary = await r.json(); } catch { /* ignore */ }
   51      }
   52      // getProfileUrl : baseUrl.'/u/'.rawurlencode(username).'/summary' — baseUrl='' (non configuré) -> URL
   53      // RELATIVE '/u/<user>/summary' (le legacy la construit TOUJOURS, même sans DISCOURSE_URL).
   54      return { summary, profileUrl: `${DISCOURSE_URL}/u/${encodeURIComponent(username)}/summary` };
   55    });
   56    app.post('/interop/discourse/checkEmailMatch', { preHandler: requireAuth }, async () => ({ found: false })); // requiert admin API key Discourse
   57  
   58    app.post('/interop/mediawiki/linkAccount', { preHandler: requireAuth }, async (req) => {
   59      const b = (req.body ?? {}) as Record<string, string>;
   60      const username = String(b.username ?? '');
   61      const slug = String(b.costumSlug ?? '');
   62      if (!username) return fail('Paramètre username manquant.');
   63      if (WIKI_API_URL) {
   64        try {
   65          const r = await fetch(`${WIKI_API_URL}?action=query&list=users&ususers=${encodeURIComponent(username)}&usprop=registration&format=json`);
   66          const j = await r.json() as { query?: { users?: Array<{ missing?: unknown }> } };
   67          if (j?.query?.users?.[0] && 'missing' in j.query.users[0]) return fail("Cet utilisateur MediaWiki n'existe pas.");
   68        } catch { /* ignore */ }
   69      }
   70      await setInterop(req.auth!.userId, 'mediawiki', slug, username);
   71      return { result: true, username, msg: 'Compte MediaWiki lié.' };
   72    });
   73    app.post('/interop/mediawiki/unlinkAccount', { preHandler: requireAuth }, async (req) => {
   74      await setInterop(req.auth!.userId, 'mediawiki', String((req.body as Record<string, string>)?.costumSlug ?? ''), undefined);
   75      return { result: true };
   76    });
   77    app.post('/interop/mediawiki/contribs', async (req) => {
   78      const b = (req.body ?? {}) as Record<string, string>;
   79      if (!WIKI_API_URL) return { result: false, error: 'Wiki non configuré.', msg: 'Wiki non configuré.' };
   80      const username = String(b.username ?? '');
   81      if (!username) return { result: false, error: "Nom d'utilisateur manquant.", msg: "Nom d'utilisateur manquant." };
   82      const limit = Math.min(Number(b.limit ?? 10) || 10, 50);
   83      try {
   84        const r = await fetch(`${WIKI_API_URL}?action=query&list=usercontribs&ucuser=${encodeURIComponent(username)}&uclimit=${limit}&ucprop=ids|title|timestamp|sizediff|comment&format=json`);
   85        const j = await r.json() as { query?: { usercontribs?: unknown[] } };
   86        return { result: true, contribs: j?.query?.usercontribs ?? [] };
   87      } catch { return { result: true, contribs: [] }; } // legacy masque l'échec externe (pas d'erreur)
   88    });
   89  };
````

#### `interop/controllers/MediawikiController.php` : 347 lignes, recopié en entier

````
    1  <?php
    2  
    3  namespace PixelHumain\PixelHumain\modules\interop\controllers;
    4  
    5  use CommunecterController, ApiMediaWiki, Person, Yii, PHDB;
    6  use MongoId;
    7  use PixelHumain\PixelHumain\modules\interop\components\InteropConfig;
    8  use Rest;
    9  
   10  /**
   11   * MediawikiController.php
   12   *
   13   * mediawiki interoperability
   14   *
   15   * @author: Lotik <laurentd@netc.fr>
   16   * Date: 02/04/2020
   17   */
   18  
   19  class MediawikiController extends CommunecterController
   20  {
   21  
   22  
   23      /**
   24       * actions
   25       *
   26       * @var array
   27       */
   28      public $dataView = [];
   29      private $api;
   30  
   31      /**
   32       * beforeAction
   33       *
   34       * see CommunecterController for all opérations
   35       *
   36       * @param  string $action
   37       * @return void
   38       */
   39      /** Actions qui n'ont pas besoin du client ApiMediaWiki (pas de $_POST['id']). */
   40      private static $noApiActions = ['userpod', 'linkaccount', 'unlinkaccount', 'contribs'];
   41  
   42      public function beforeAction($action)
   43      {
   44          if (!in_array(strtolower($action->id), self::$noApiActions, true)) {
   45              $this->api = new ApiMediaWiki();
   46          }
   47          return parent::beforeAction($action);
   48      }
   49      /**
   50       * actionIndex
   51       *
   52       * get actions and render the views index
   53       * @return view
   54       */
   55      public function actionIndex()
   56      {
   57          //models
   58          //var_dump(["test controller" => [$_POST]]);exit;
   59          $this->dataView = $this->api->dbWiki;
   60          $wikiParams=$this->api->dbWiki;
   61          // var_dump($this->dataView);exit;
   62          if ($this->dataView['wiki']['params'] === "none") {
   63              if (Yii::app()->request->isAjaxRequest) {
   64                  return $this->renderPartial("interop.views.create.index");
   65              }
   66  
   67  
   68          } else {
   69              if (Yii::app()->request->isAjaxRequest) {
   70                  return $this->renderPartial("interop.views.default.indexMediaWiki",array("wikiParams"=>$wikiParams));
   71              }
   72  
   73          }
   74      }
   75  
   76      /**
   77       * actionChooseCategory
   78       *
   79       * @return view
   80       * action for save name and url of wiki then render dynForm chooseCat
   81       */
   82      public function actionChooseCategory()
   83      {
   84          // var_dump($_POST);exit;
   85  
   86           // $this->api = new ApiMediaWiki();
   87          //var_dump(["test"=> "1"]);////TODO Vérifié que le mediawiki n'existe pas deja
   88          //var_dump($_POST);exit
   89          // var_dump($this->dataView);exit;
   90           // var_dump("expri");exit;
   91          $data = $this->api->insertFirstStep($_POST['dataForm']['url'], $_POST['dataForm']['name']);
   92          //var_dump(['test cont' => $this->api->dbWiki]);exit;
   93          //$idWiki = key($this->api->dbWiki);
   94          // var_dump($data);exit;
   95  
   96          if ($data === false) {
   97              $this->dataView = ["error" => "Ce wiki existe deja chez nous!"];
   98          } else {
   99              $this->dataView = $this->api->dbWiki; //[/*'id' => $this->api->dbWiki['id'], "wiki" =>  $this->api->dbWiki[$idWiki]*/ $this->api->dbWiki, "data" => $data];
  100          }
  101          //var_dump(["test" => "2"]);
  102          // var_dump($this->dataView);exit;
  103          return $this->renderPartial("interop.views.create.chooseCat",array("dataView"=>$this->dataView));
  104      }
  105      /**
  106       * actionInsertCat
  107       *
  108       * @return view
  109       * save choice of categorie then render the main menu
  110       */
  111      public function actionInsertCat()
  112      {
  113          //var_dump($_POST);exit;
  114          $this->api->insertCat($_POST['id'], $_POST['actors'], $_POST['classifieds'], $_POST['projects']);
  115          $this->dataView = $this->api->dbWiki;
  116          return $this->renderPartial("interop.views.default.indexMediaWiki",array("wikiParams"=>$this->dataView));
  117      }
  118  
  119      /**
  120       * actionMenuLeft
  121       *
  122       * @return view
  123       * view menuleft by search bar or category button
  124       */
  125      public function actionMenuLeft()
  126      {
  127  
  128          //models
  129          if ($_POST['categorie'] == 'search') {
  130              $this->api->dbWiki += $this->api->search($_POST['page']);
  131              $this->dataView = $this->api->dbWiki;
  132          } else {
  133              $this->api->dbWiki += $this->api->menu();
  134              $this->dataView = $this->api->dbWiki;
  135          }
  136          //view
  137          return $this->renderPartial("interop.views.menus.pages",array("dataView"=>$this->dataView));
  138      }
  139  
  140      /**
  141       * actionPage
  142       *
  143       * @return view
  144       *
  145       */
  146      public function actionPage()
  147      {
  148          //models
  149          $this->api->dbWiki += $this->api->page($_POST['page']);
  150          $this->dataView = $this->api->dbWiki;
  151          //view
  152          // var_dump($this->dataView);exit;
  153          return $this->renderPartial("interop.views.page.index",array("dataView"=>$this->dataView));
  154      }
  155  
  156      /**
  157       * actionEdit
  158       *
  159       * @return string
  160       * route for edit wiki witha communecter link
  161       */
  162      public function actionEdit()
  163      {
  164          if ($this->api->edit($_POST['page'])) {
  165              return '<p> Le wiki a bien été édité</p>';
  166          } else {
  167              return '<p> Un probléme est survenu veuillez contacter l\'administrateur</p>';
  168          }
  169      }
  170      public function actionDoc()
  171      {
  172          header("Location: https://gitlab.adullact.net/pixelhumain/codoc/-/blob/master/4%20-%20Documentation%20technique/mediawiki.md");
  173      }
  174      public function actionCreate()
  175      {
  176          $this->dataView = $this->api->createAccount();
  177      }
  178  
  179      /**
  180       * actionUserPod
  181       *
  182       * Retourne le rendu HTML du pod MediaWiki pour le profil social d'un utilisateur.
  183       * Appelé en AJAX depuis pageProfil.views.mediawiki.
  184       *
  185       * POST /interop/mediawiki/userPod
  186       *   searchName    string  Nom à rechercher dans les titres de pages (ex: "Gabriel Plassat")
  187       *   wikiUsername  string  Nom d'utilisateur MediaWiki (vide si non encore lié)
  188       *   profileUserId string  Id MongoDB du propriétaire du profil affiché
  189       *
  190       * Si le compte MediaWiki n'est pas encore lié ET que l'utilisateur connecté
  191       * consulte SON propre profil, on affiche le formulaire de liaison.
  192       */
  193      public function actionUserPod()
  194      {
  195          $wikiApiUrl     = InteropConfig::get('WIKI_API_URL');
  196          $wikiBaseUrl    = InteropConfig::get('WIKI_BASE_URL');
  197          $searchName     = isset($_POST['searchName'])    ? trim($_POST['searchName'])    : '';
  198          $wikiUsername   = isset($_POST['wikiUsername'])  ? trim($_POST['wikiUsername'])  : '';
  199          $profileUserId  = isset($_POST['profileUserId']) ? trim($_POST['profileUserId']) : '';
  200          $sessionUserId  = (string) (Yii::app()->session['userId'] ?? '');
  201          $costumSlug     = isset($_POST['costumSlug'])    ? trim($_POST['costumSlug'])    : '';
  202  
  203          $isOwner = !empty($sessionUserId) && !empty($profileUserId) && $sessionUserId === $profileUserId;
  204  
  205          // Lecture du username MediaWiki depuis le nouveau chemin de stockage
  206          if (!empty($profileUserId) && !empty($costumSlug)) {
  207              $profileOwner = PHDB::findOneById('citoyens', (string) $profileUserId);
  208              if (!empty($profileOwner['interop']['mediawiki'][$costumSlug])
  209                  && $profileOwner['interop']['mediawiki'][$costumSlug] !== false
  210              ) {
  211                  $wikiUsername = (string) $profileOwner['interop']['mediawiki'][$costumSlug];
  212              }
  213          }
  214  
  215          // Pas encore lié + propriétaire du profil → formulaire de liaison
  216          if (empty($wikiUsername) && $isOwner) {
  217              return $this->renderPartial('interop.views.pods._mediawikiLink', [
  218                  'wikiBaseUrl' => $wikiBaseUrl,
  219                  'costumSlug'  => $costumSlug,
  220              ]);
  221          }
  222  
  223          return $this->renderPartial('interop.views.pods._mediawikiPod', [
  224              'wikiApiUrl'     => $wikiApiUrl,
  225              'wikiBaseUrl'    => $wikiBaseUrl,
  226              'wikiUsername'   => $wikiUsername,
  227              'costumSlug'     => $costumSlug,
  228              'wikiSearchName' => !empty($wikiUsername) ? $wikiUsername : $searchName,
  229              'isOwner'        => $isOwner,
  230          ]);
  231      }
  232  
  233      /**
  234       * actionContribs
  235       *
  236       * Retourne les dernières contributions d'un utilisateur MediaWiki au format JSON.
  237       *
  238       * POST /interop/mediawiki/contribs
  239       *   username   string  Nom d'utilisateur MediaWiki
  240       *   limit      int     Nombre de contributions (défaut: 10, max: 50)
  241       *
  242       * Retourne JSON : { result: true, contribs: [...] } | { result: false, error: '...' }
  243       */
  244      public function actionContribs()
  245      {
  246          $wikiApiUrl = InteropConfig::get('WIKI_API_URL');
  247          if (empty($wikiApiUrl)) {
  248              return Rest::json(['result' => false, 'error' => 'Wiki non configuré.', 'msg' => 'Wiki non configuré.']);
  249          }
  250  
  251          $username = isset($_POST['username']) ? trim($_POST['username']) : '';
  252          if (empty($username)) {
  253              return Rest::json(['result' => false, 'error' => 'Nom d\'utilisateur manquant.', 'msg' => 'Nom d\'utilisateur manquant.']);
  254          }
  255  
  256          $limit   = isset($_POST['limit']) ? min((int) $_POST['limit'], 50) : 10;
  257          $contribs = ApiMediaWiki::getUserContribs($wikiApiUrl, $username, $limit);
  258  
  259          return Rest::json(['result' => true, 'contribs' => $contribs]);
  260      }
  261  
  262      /**
  263       * actionLinkAccount
  264       *
  265       * Valide et enregistre le nom d'utilisateur MediaWiki de l'utilisateur connecté.
  266       * Stocké dans socialNetwork.mediawiki (même pattern que github, mastodon…).
  267       *
  268       * POST /interop/mediawiki/linkAccount
  269       *   username string  Nom d'utilisateur MediaWiki à associer
  270       *
  271       * Retourne JSON : { result: true, username: '...' } | { result: false, error: '...' }
  272       */
  273      public function actionLinkAccount()
  274      {
  275          $wikiApiUrl = InteropConfig::get('WIKI_API_URL');
  276  
  277          $sessionUserId = Yii::app()->session['userId'] ?? null;
  278          if (empty($sessionUserId)) {
  279              http_response_code(401);
  280              return Rest::json(['result' => false, 'error' => 'Non connecté.', 'msg' => 'Non connecté.']);
  281          }
  282  
  283          $username   = isset($_POST['username'])   ? trim($_POST['username'])   : '';
  284          $costumSlug = isset($_POST['costumSlug']) ? trim($_POST['costumSlug']) : '';
  285          if (empty($username)) {
  286              http_response_code(400);
  287              return Rest::json(['result' => false, 'error' => 'Nom d\'utilisateur manquant.', 'msg' => 'Nom d\'utilisateur manquant.']);
  288          }
  289          if (empty($costumSlug)) {
  290              return Rest::json(['result' => false, 'error' => 'Contexte manquant.', 'msg' => 'Contexte manquant.']);
  291          }
  292  
  293          if (!empty($wikiApiUrl)) {
  294              $checkUrl = $wikiApiUrl . '?' . http_build_query([
  295                  'action'  => 'query',
  296                  'list'    => 'users',
  297                  'ususers' => $username,
  298                  'usprop'  => 'registration',
  299                  'format'  => 'json',
  300              ]);
  301              $data = ApiMediaWiki::staticGetJsonPublic($checkUrl);
  302              $wikiUser = isset($data['query']['users'][0]) ? $data['query']['users'][0] : [];
  303              if (array_key_exists('missing', $wikiUser)) {
  304                  return Rest::json([
  305                      'result' => false,
  306                      'error'  => 'Utilisateur "' . htmlspecialchars($username) . '" introuvable sur le wiki.',
  307                      'msg'    => 'Utilisateur "' . htmlspecialchars($username) . '" introuvable sur le wiki.',
  308                  ]);
  309              }
  310          }
  311  
  312          // Sauvegarde dans interop.mediawiki.$costumSlug (sans écraser les autres slugs)
  313          PHDB::update('citoyens',
  314              ['_id' => new MongoId((string) $sessionUserId)],
  315              ['$set' => ['interop.mediawiki.' . $costumSlug => $username]]
  316          );
  317  
  318          return Rest::json(['result' => true, 'username' => $username, 'msg' => 'Compte MediaWiki associé avec succès.']);
  319      }
  320  
  321      /**
  322       * actionUnlinkAccount
  323       *
  324       * Supprime le lien entre le compte MediaWiki et le profil connecté.
  325       *
  326       * POST /interop/mediawiki/unlinkAccount
  327       *
  328       * Retourne JSON : { result: true } | { result: false, error: '...' }
  329       */
  330      public function actionUnlinkAccount()
  331      {
  332          $sessionUserId = Yii::app()->session['userId'] ?? null;
  333          if (empty($sessionUserId)) {
  334              http_response_code(401);
  335              return Rest::json(['result' => false, 'error' => 'Non connecté.', 'msg' => 'Non connecté.']);
  336          }
  337  
  338          $costumSlug = isset($_POST['costumSlug']) ? trim($_POST['costumSlug']) : '';
  339  
  340          PHDB::update('citoyens',
  341              ['_id' => new MongoId((string) $sessionUserId)],
  342              ['$unset' => ['interop.mediawiki.' . $costumSlug => '']]
  343          );
  344  
  345          return Rest::json(['result' => true]);
  346      }
  347  }
````

#### `interop/models/ApiMediaWiki.php` : 728 lignes, recopié en entier

Ce fichier est entièrement consacré à MediaWiki. Il compte 728 lignes, au-dessus du seuil de 400. La consigne demande de recopier en entier la partie qui traite de MediaWiki : c'est ici le fichier entier.

````
    1  <?php
    2  // include_once __DIR__ . '/../components/InteropConfig.php';
    3  
    4  use PixelHumain\PixelHumain\modules\interop\components\InteropConfig;
    5  
    6  /**
    7   * ApiMediaWiki
    8   *
    9   * @author: Després Laurent <laurentd@netc.fr>
   10   * date: 03/2020
   11   */
   12  
   13  class ApiMediaWiki extends DB
   14  {
   15      /**
   16       * getCurl
   17       *
   18       * @return array data from the wiki
   19       * fetch data by curl
   20       */
   21      public function getCurl()
   22      {
   23          $curl = curl_init();
   24          curl_setopt($curl, CURLOPT_URL, $this->url . $this->paramsGet);
   25          curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
   26          curl_setopt($curl, CURLOPT_HEADER, 0);
   27          curl_setopt($curl, CURLOPT_COOKIESESSION, true);
   28          $ret = curl_exec($curl);
   29          $dataDecode = json_decode($ret, true);
   30          curl_close($curl);
   31          return $dataDecode;
   32      }
   33      /**
   34       * post
   35       *
   36       * @param  array $data
   37       * @return array
   38       */
   39      protected function post($data)
   40      {
   41          $curl = curl_init();
   42          curl_setopt($curl, CURLOPT_URL, $this->url);
   43          curl_setopt($curl, CURLOPT_POST, true);
   44          curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
   45          curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
   46          curl_setopt($curl, CURLOPT_COOKIEJAR, Yii::app()->getModulePath() . "/interop/cookie.txt");
   47          curl_setopt($curl, CURLOPT_COOKIEFILE, Yii::app()->getModulePath() . "/interop/cookie.txt");
   48          // curl_setopt($curl, CURLOPT_COOKIESESSION, true);
   49          $ret = curl_exec($curl);
   50          curl_close($curl);
   51          $dataDecode = json_decode($ret, true);
   52          return $dataDecode;
   53      }
   54      /////////////////////////////
   55      //PROPERTIES
   56      /**
   57       * @var string
   58       */
   59      ///////////////////////////
   60      //////énorme TODO gestion des mot de passe en db ou non en variable d'environement ou autres?
   61      //////mot de passe au nom de co ou faire entrées les données par l'user
   62      ////////////////////////////
   63      public $paramsGet = ""; //! set this before get data
   64      public $properties = "";
   65      protected $url = "";
   66      public $currentCat = ""; //! set at __construct
   67      /**
   68       * @var array
   69       */public $dbWiki;
   70      public $currentWiki;
   71      /////////////////////////////
   72      /////////////////////////////
   73      //METHODES
   74      /**
   75       * __construct
   76       *
   77       * @return void
   78       * create parent
   79       * with parentId parentName arentType for create wiki step else by id
   80       *
   81       * set categorie if is set
   82       */
   83      public function __construct()
   84      {
   85          $this->dbWiki = parent::__construct(isset($_POST['id']) ? $_POST['id'] : null);
   86          if (isset($_POST['categorie'])) {
   87              $this->setCurrentCat($_POST['categorie']);
   88          }
   89      }
   90      /**
   91       * insertFirstStep
   92       *
   93       * @param  string $url
   94       * @param  string $name
   95       * @return array $data['query']['allcategories']
   96       * set name and url of the médiawiki then fetch sorted catégories from the wiki
   97       */
   98      public function insertFirstStep($url, $name)
   99      {
  100          if (substr($url, -1) === '/') {
  101              $url = $url . 'api.php';
  102          } else {
  103              $url = $url . '/api.php';
  104          }
  105          $this->dbWiki['wiki']['name'] = $name;
  106          $this->dbWiki['wiki']['url'] = $url;
  107          $this->setParamsGet('?action=query&list=allcategories&aclimit=max&format=json');
  108          $this->url = $this->dbWiki['wiki']['url'];
  109          $data = $this->getCurl();
  110          $this->dbWiki['wiki']['params'] = $this->sortSiteCat($data['query']['allcategories']);
  111          $this->dbWiki = parent::saveWiki($this->dbWiki);
  112          //var_dump($this->dbWiki);exit;
  113          //var_dump(["test apimedia insertfirstste " => [$data]]);exit;
  114          //var_dump(['test apimedia insertfirststep 01'=> parent::saveWiki($this->dbWiki)]);exit;
  115      }
  116      /**
  117       * sortSiteCat
  118       *
  119       * @param  array $data
  120       * @return array $arrayParams = ["catActeurs" => [...], "catRessources" => [...], "catProjets" => [...]]
  121       * sort catégorie of mediawiki by match words (/^acteur/i, /^tiers-lieux$/i, /^ressource/i, /^commun$/i, /^projet/i)
  122       * TODO make array for words for match
  123       */
  124      public function sortSiteCat($data)
  125      {
  126          /// there we try to find some category that's match with own catégories
  127          //TODO integrate tab $wordsForRegex
  128          //$wordsForRegex = ["acteur", "tiers-lieux$", "ressource", "commun$", "projet"];
  129          $arrayParams = ["catActeurs" => [], "catRessources" => [], "catProjets" => []];
  130          foreach ($data as $v) {
  131              if (preg_match("/^acteur/i", $v['*']) && mb_stripos($v['*'], ":") === false) {
  132                  $arrayParams["catActeurs"][] = $v['*'];
  133              }
  134              if (preg_match("/^tiers-lieux$/i", $v['*']) && mb_stripos($v['*'], ":") === false) {
  135                  $arrayParams["catActeurs"][] = $v['*'];
  136              }
  137              if (preg_match("/^ressource/i", $v['*']) && mb_stripos($v['*'], ":") === false) {
  138                  $arrayParams["catRessources"][] = $v['*'];
  139              }
  140              if (preg_match("/^commun$/i", $v['*']) && mb_stripos($v['*'], ":") === false) {
  141                  $arrayParams["catRessources"][] = $v['*'];
  142              }
  143              if (preg_match("/^projet/i", $v['*']) && mb_stripos($v['*'], ":") === false) {
  144                  $arrayParams["catProjets"][] = $v['*'];
  145              }
  146          }
  147          $insert = [];
  148          if ($arrayParams['catRessources'] != []) {
  149              $insert += ['ressources'  => $arrayParams['catRessources']];
  150          }
  151          if ($arrayParams['catActeurs'] != []) {
  152              $insert += ['acteurs'  => $arrayParams['catActeurs']];
  153          }
  154          if ($arrayParams['catProjets'] != []) {
  155              $insert += ['projets' => $arrayParams['catProjets']];
  156          }
  157          return $insert;
  158      }
  159      
  160      /**
  161       * insertCat
  162       *
  163       * @param  string $idWiki
  164       * @param  string $actors
  165       * @param  string $classifieds
  166       * @param  string $projects
  167       * @return array $this->dbWiki
  168       * Fetch state in db, create médiawiki element['params'] and save it
  169       */
  170      public function insertCat($idWiki, $actors, $classifieds, $projects)
  171      {
  172          //var_dump($this->dbWiki);exit;
  173          $this->dbWiki = parent::setById($idWiki);
  174          $dataCat = [];
  175          $dataCat += ["actors" => explode(',', $actors)];
  176          $dataCat += ["classifieds" => explode(',', $classifieds)];
  177          $dataCat += ["projects" => explode(',', $projects)];      
  178          $this->dbWiki =  parent::updateOne($idWiki, 'params', $dataCat);
  179      }
  180      /**
  181       * menu
  182       *
  183       * @return array
  184       * check category and return list of pages from wiki for menuLeft view
  185       */
  186      public function menu()
  187      {
  188          $menu = ["categorie" => $this->currentCat, "menu" => []];
  189          switch ($this->currentCat) {
  190              case 'acteurs':
  191                  $tabParams = $this->dbWiki['wiki']['params']['actors'];
  192                  break;
  193              case 'ressources':
  194                  $tabParams = $this->dbWiki['wiki']['params']['classifieds'];
  195                  break;
  196              case 'projets':
  197                  $tabParams = $this->dbWiki['wiki']['params']['projects'];
  198                  break;
  199  
  200              default:
  201                  # code...
  202                  break;
  203          }
  204          foreach ($tabParams as $param) {
  205              $this->paramsGet = "?action=ask&query=[[Cat%C3%A9gorie:" . $param . "]]|limit=500&format=json";
  206              $this->url = $this->dbWiki['wiki']['url'];
  207              $data = $this->getCurl()['query']['results'];
  208              foreach ($data as $key => $value) {
  209                  $menu["menu"] += [$key => $value['fullurl']];
  210              }
  211          }
  212          return $menu;
  213      }
  214      /**
  215       * page
  216       *
  217       * @param  mixed name of the page to get data
  218       * @return array mapped data for the next view
  219       * fetch data from wiki and return data after sort with generic map
  220       */
  221      public function page($pageName)
  222      {
  223          //var_dump($this->dbWiki);exit;
  224          $page = [
  225          "title" => $pageName,
  226          "url" => str_replace('api.php', 'wiki/' . $pageName, $this->dbWiki['wiki']['url'])
  227      ];
  228          $validName = str_replace("&", "%26", str_replace(" ", "_", $pageName));
  229          $inCo = parent::findInCo($pageName);
  230          if ($inCo) {
  231              $page += ["inCo" => $inCo];
  232          } else {
  233              $page += ["inCo" => false];
  234          }
  235          $this->properties($validName);
  236          if ($this->properties == '') {
  237              $page += ["data" => false];
  238          } else {
  239              $this->paramsGet = "?action=ask&format=json&query=[[" . $validName . "]]" . $this->properties;
  240              $data = $this->getCurl()['query']['results'];
  241              if (empty($data[$page['title']]['printouts'])) {
  242                  $page += ["data" => false];
  243              } else {
  244                  $page += $data[$page['title']]['printouts'];
  245                  $page += ["data" => true];
  246              }
  247          }
  248          $page += ["logo" => $this->logo($pageName)];
  249          $pageConvert = Convert::convertWikiMediaToPh(["data" => $page], $this->currentCat, $this->dbWiki['wiki']['name']);
  250          //var_dump($pageConvert['data']);exit;
  251          return $pageConvert;
  252      }
  253      /**
  254       * properties
  255       *
  256       * @param  string url encoded name of page to search data
  257       * @return void
  258       * set properties by namePage to prepare curl call
  259       */
  260      public function properties($namePage)
  261      {
  262          $this->paramsGet = "?action=browsebysubject&subject=" . $namePage . "&format=json";
  263          $this->url = $this->dbWiki['wiki']['url'];
  264          $res = $this->getCurl()['query'];
  265          if (isset($res['data'])) {
  266              foreach ($res['data'] as $value) {
  267                  if (!preg_match("/^_/", $value['property'])) {
  268                      $this->properties .= "|?" . $value['property'];
  269                  }
  270              }
  271          }
  272      }
  273      /**
  274       * search
  275       *
  276       * @param  string $searchText
  277       * @return array $menu
  278       * fetch list of pages on wiki by curl with search value
  279       *
  280       */
  281      public function search($searchText)
  282      {
  283          $menu = ["categorie" => "page pour " . $searchText, "menu" => []];
  284          $this->paramsGet = "?action=opensearch&search=" . $searchText . "&limit=max&format=json";
  285          $this->url = $this->dbWiki['wiki']['url'];
  286          $data = $this->getCurl();
  287          $menu['menu'] = array_combine($data[1], $data[3]);
  288          return $menu;
  289      }
  290      /**
  291       * logo
  292       *
  293       * @param  string $name
  294       * @return string
  295       * create url for get logo image on the wiki of the current page
  296       */
  297      public function logo($name)
  298      {
  299          $this->paramsGet = "?action=query&prop=images&titles=" . str_replace(" ", "_", $name) . "&format=json";
  300          $data = $this->getCurl()['query']['pages'];
  301          foreach ($data as $v) {
  302              // var_dump($v/*['images'][0]*/);
  303              //     exit;
  304              if ($v['title'] == $name) {
  305                  if (isset($v['images'])) {
  306                      $nameFile = str_replace('Fichier:', '', $v['images'][0]['title']);
  307                      if ($nameFile == "No-image-yet.jpg") {
  308                          return "none";
  309                      } else {
  310                          return str_replace('api.php', 'index.php?title=Special:Redirect/file/' . $nameFile, $this->url);
  311                      }
  312                  } else {
  313                      return "none";
  314                      //$nameFile = $v['images'][0]['title']);
  315                  }
  316              } else {
  317                  return "none";
  318              }
  319          }
  320      }
  321      /**
  322       * logout
  323       *
  324       * @return array
  325       *
  326       */
  327      protected function logout()
  328      {
  329          $paramsLogout = [
  330              "action" => "logout",
  331              "format" => "json",
  332          ];
  333          $logout = $this->post($paramsLogout);
  334          //var_dump($logout);
  335          return $logout;
  336      }
  337      /**
  338       * edit
  339       *
  340       * @param  string $name
  341       * @return boolean
  342       * fetch text data on the wiki and rewrite with add links communecter
  343       * return true if success else false
  344       */
  345      public function edit($name)
  346      {
  347          // $test = $this->createAccount();
  348          //var_dump(InteropConfig::get('WIKI_NAME'));exit;
  349          $this->url = $this->dbWiki['wiki']['url'];
  350          $test = $this->login();
  351          $this->paramsGet = '?action=parse&page=' . $name . '&prop=wikitext&section=0&contentmodel=wikitext&disablelimitreport=1&format=json';
  352          $data = $this->getCurl()['parse']['wikitext']['*'];
  353          if (strpos($data, "|pageCo=")) {
  354              return false;
  355          } else {
  356              $newText = substr($data, 0, -2) . '|pageCo=https://www.communecter.org/#@' . $_POST['currentSlug'] . ' }}';
  357              $arrayParams = [
  358                  "action" => "edit",
  359                  "title" => $name,
  360                  "text" => $newText,
  361                  "format" => "json",
  362                  "nocreate" => true,
  363                  "token" => $this->fetchToken("csrf"),
  364              ];
  365              //var_dump($arrayParams);exit;
  366              $verif=$this->post($arrayParams);
  367              if (isset($verif['error'])){
  368                  return false;
  369              }
  370              // var_dump($verif);exit;
  371              $this->logout();
  372              return true;
  373          }
  374      }
  375      /**
  376       * login
  377       *
  378       * @return array
  379       * login on the wiki !!! username and password must be more secure(hash && || include db)
  380       */
  381      protected function login()
  382      {
  383          $token = $this->fetchToken("login");
  384          $paramsLogin = [
  385              "action" => "clientlogin",
  386              "username" => InteropConfig::get('WIKI_NAME'),
  387              "password" => InteropConfig::get('WIKI_PASS'),
  388              "loginreturnurl" => str_replace("/api.php", "", $this->url),
  389              "logintoken" => $token,
  390              "format" => "json",
  391          ];
  392          $login = $this->post($paramsLogin);
  393          return $login;
  394      }
  395      /**
  396       * fetchToken
  397       *
  398       * @param  string $typeToken
  399       * @return string
  400       * fetch token by type on the wiki
  401       */
  402      protected function fetchToken($typeToken)
  403      {
  404          $params = [
  405              "action" => "query",
  406              "type" => $typeToken,
  407              "format" => "json",
  408          ];
  409          ///condition pour wiki avec captcha (status: development)
  410          // if ($typeToken == "createaccount" && in_array($wiki, $this->captchaWiki)) {
  411          //     $params += ["meta" => "authmanagerinfo|tokens", "amirequestsfor" => "create"];
  412          //     $data = $this->post($params);
  413          //     $dataCaptchaAll = $data['query']['authmanagerinfo']['requests'][0]['fields'];
  414          //     $dataCaptcha = [
  415          //         "captchaId" => $dataCaptchaAll['captchaId']['value'],
  416          //         "question" => $dataCaptchaAll['captchaInfo']['value'],
  417          //         "token" => $data['query']['tokens']['createaccounttoken']
  418          //     ];
  419          //     return $dataCaptcha;
  420          // } else {
  421          $params += ["meta" => "tokens"];
  422          $dataToken = $this->post($params);
  423          // }
  424  
  425          return $dataToken['query']['tokens'][$typeToken . "token"];
  426      }
  427      /////////////////////////////
  428      /////////////////////////////
  429      //GETTERS SETTERS
  430  
  431      /**
  432       * Get the value of paramsGet
  433       */
  434      protected function getParamsGet()
  435      {
  436          return $this->paramsGet;
  437      }
  438  
  439      /**
  440       * Set the value of paramsGet
  441       *
  442       * @return  self
  443       */
  444      public function setParamsGet($paramsGet)
  445      {
  446          $this->paramsGet = str_replace(" ", "_", $paramsGet);
  447          //var_dump($this->paramsGet);//exit;
  448      }
  449  
  450      /**
  451       * Get the value of wiki
  452       */
  453      public function getWiki()
  454      {
  455          return $this->dbWiki;
  456      }
  457  
  458      /**
  459       * Set the value of wiki
  460       *
  461       * @return  void
  462       */
  463      public function setWiki($wiki)
  464      {
  465          $this->wiki = $wiki;
  466      }
  467  
  468      /**
  469       * Get the value of currentCat
  470       *
  471       * @return  string
  472       */
  473      public function getCurrentCat()
  474      {
  475          return $this->currentCat;
  476      }
  477  
  478      /**
  479       * Set the value of currentCat
  480       *
  481       * @param  string  $currentCat
  482       *
  483       */
  484      public function setCurrentCat($currentCat)
  485      {
  486          $this->currentCat = $currentCat;
  487      }
  488  
  489      /**
  490       * Get the value of id
  491       */
  492      public function getId()
  493      {
  494          return $this->id;
  495      }
  496  
  497      /**
  498       * Set the value of id
  499       *
  500       * @return  void
  501       */
  502      public function setId($id)
  503      {
  504          $this->id = $id;
  505      }
  506  
  507      // ─── Méthodes orientées utilisateur ──────────────────────────────────────
  508      // Utilisées pour les "pods" de profil social (contributions, fiches liées).
  509  
  510      /**
  511       * getUserContribs
  512       *
  513       * Retourne les dernières contributions (pages créées/modifiées) d'un utilisateur.
  514       *
  515       * @param  string $wikiApiUrl  URL de l'API MediaWiki, ex: https://wikixd.fabmob.io/api.php
  516       * @param  string $username    Nom d'utilisateur MediaWiki
  517       * @param  int    $limit       Nombre de contributions à retourner (max 500)
  518       * @return array               Tableau de contributions ou tableau vide
  519       */
  520      public static function getUserContribs($wikiApiUrl, $username, $limit = 10)
  521      {
  522          $wikiApiUrl = rtrim($wikiApiUrl, '/');
  523          $params = http_build_query([
  524              'action'  => 'query',
  525              'list'    => 'usercontribs',
  526              'ucuser'  => $username,
  527              'uclimit' => min((int) $limit, 500),
  528              'ucprop'  => 'ids|title|timestamp|sizediff|comment',
  529              'format'  => 'json',
  530          ]);
  531  
  532          $data = self::staticGetJson($wikiApiUrl . '?' . $params);
  533          return isset($data['query']['usercontribs']) ? $data['query']['usercontribs'] : [];
  534      }
  535  
  536      /**
  537       * getUserPages
  538       *
  539       * Retourne les pages dont le titre contient le nom de l'utilisateur
  540       * (utile pour les wikis Fabmob/XD où les fiches sont nommées "Prénom_Nom").
  541       *
  542       * @param  string $wikiApiUrl
  543       * @param  string $searchName  Nom tel qu'il apparaît dans les titres de pages
  544       * @param  int    $limit
  545       * @return array
  546       */
  547      public static function getUserPages($wikiApiUrl, $searchName, $limit = 20)
  548      {
  549          $wikiApiUrl = rtrim($wikiApiUrl, '/');
  550          $params = http_build_query([
  551              'action'  => 'query',
  552              'list'    => 'search',
  553              'srsearch'=> $searchName,
  554              'srwhat'  => 'title',
  555              'srlimit' => min((int) $limit, 50),
  556              'srprop'  => 'snippet|titlesnippet|timestamp',
  557              'format'  => 'json',
  558          ]);
  559  
  560          $data = self::staticGetJson($wikiApiUrl . '?' . $params);
  561          return isset($data['query']['search']) ? $data['query']['search'] : [];
  562      }
  563  
  564      /**
  565       * getUserPageProperties
  566       *
  567       * Récupère les propriétés sémantiques d'une fiche wiki (thèmes, compétences…)
  568       * en utilisant l'API Semantic MediaWiki (browsebysubject).
  569       *
  570       * @param  string $wikiApiUrl
  571       * @param  string $pageName   Titre exact de la page wiki
  572       * @return array              Tableau associatif propriété → valeurs
  573       */
  574      public static function getUserPageProperties($wikiApiUrl, $pageName)
  575      {
  576          $wikiApiUrl = rtrim($wikiApiUrl, '/');
  577          $params = http_build_query([
  578              'action'  => 'browsebysubject',
  579              'subject' => str_replace(' ', '_', $pageName),
  580              'format'  => 'json',
  581          ]);
  582  
  583          $data = self::staticGetJson($wikiApiUrl . '?' . $params);
  584          if (empty($data['query']['data'])) {
  585              return [];
  586          }
  587  
  588          $props = [];
  589          foreach ($data['query']['data'] as $item) {
  590              $property = $item['property'];
  591              // Ignorer les propriétés internes MediaWiki (commençant par _)
  592              if (strpos($property, '_') === 0) {
  593                  continue;
  594              }
  595              $values = [];
  596              foreach ($item['dataitem'] as $di) {
  597                  $values[] = $di['item'];
  598              }
  599              $props[$property] = $values;
  600          }
  601  
  602          return $props;
  603      }
  604  
  605      /**
  606       * buildWikiPageUrl
  607       *
  608       * Construit l'URL publique d'une page wiki à partir de l'URL de l'API.
  609       *
  610       * @param  string $wikiApiUrl
  611       * @param  string $pageName
  612       * @return string
  613       */
  614      public static function buildWikiPageUrl($wikiApiUrl, $pageName)
  615      {
  616          $base = str_replace('/api.php', '', rtrim($wikiApiUrl, '/'));
  617          return $base . '/wiki/' . str_replace(' ', '_', $pageName);
  618      }
  619  
  620      /**
  621       * staticGetJsonPublic
  622       *
  623       * Requête GET cURL statique publique (sans instance, sans cookies bot).
  624       * Utilisée pour les lectures publiques non authentifiées, notamment
  625       * la validation d'un nom d'utilisateur MediaWiki.
  626       *
  627       * @param  string $url
  628       * @return array|null
  629       */
  630      public static function staticGetJsonPublic($url)
  631      {
  632          return self::staticGetJson($url);
  633      }
  634  
  635      /**
  636       * staticGetJson
  637       *
  638       * Requête GET cURL statique (sans instance, sans cookies bot).
  639       * Utilisée pour les lectures publiques non authentifiées.
  640       *
  641       * @param  string $url
  642       * @return array|null
  643       */
  644      private static function staticGetJson($url)
  645      {
  646          $curl = curl_init();
  647          curl_setopt($curl, CURLOPT_URL, $url);
  648          curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
  649          curl_setopt($curl, CURLOPT_TIMEOUT, 10);
  650          curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
  651          curl_setopt($curl, CURLOPT_HTTPHEADER, ['Accept: application/json']);
  652          $body     = curl_exec($curl);
  653          $httpCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
  654          curl_close($curl);
  655  
  656          if ($httpCode !== 200 || $body === false) {
  657              return null;
  658          }
  659          return json_decode($body, true);
  660      }
  661  }
  662  
  663  //////////////////////// reserve of code
  664  // protected function createAccount()
  665  // {
  666  //     var_dump("test");exit;
  667  //     $token = $this->fetchToken("createaccount", $wiki = null);
  668  //     $paramsToPost = [
  669  //         "action" => "createaccount",
  670  //         "createtoken" => $token,
  671  //         "username" => $this->username,
  672  //         "password" => $this->password,
  673  //         "retype" => $this->password,
  674  //         "createreturnurl" => $this->wikiUrl,
  675  //         "format" => "json",
  676  //         "cookies" => $wiki,
  677  //     ];
  678  //     $respCreate = $this->post($paramsToPost);
  679  //     return $respCreate;
  680  // }
  681  ///////////////////////variable et fonctions pour purger cache du wiki
  682  // $paramsPurge = [
  683      //     "action" => "purge",
  684  //     "generator" => "categorymembers",
  685  //     "gcmlimit" => "max",
  686  //     "gcmtitle" => "Category:Défi",
  687  //     "forcelinkupdate" => "1",
  688  //     "format" => "json"
  689  // ];
  690  // // "generator" => "prefixsearch",
  691  // "titles" => "Améliorer_les_solutions_et_développer_de_nouvelles_solutions_de_mobilités_pour_tous",
  692  // // "gpssearch" => "Utilisateur:",
  693  // //"gapnamespace" => "0",
  694  // $test = $this->post($paramsPurge);
  695  // //sleep(2);
  696  // var_dump($test);exit;
  697  //var_dump($data);exit;
  698  // var_dump($data['query']);
  699  // var_dump($data['query']['results']);exit;
  700  //$page += $data;
  701  //////////////////////// in progress
  702  // public function infoApi()
  703  // {
  704  //     $this->setParamsGet("?action=query&meta=siteinfo&format=json");
  705  //     return $this->getCurl();
  706  // }
  707  // /**
  708  //  * createAccount
  709  //  *
  710  //  * @param  string $wiki
  711  //  * @return array
  712  //  */
  713  // /**
  714  //  * createAccountWithCaptcha
  715  //  *
  716  //  * @param  string $wiki
  717  //  * @return array
  718  //  */
  719  // protected function createAccountWithCaptcha($wiki, $connection, $data = null)
  720  // {
  721  //     if ($connection == "first") {
  722  //         return $this->fetchToken("createaccount", $wiki);
  723  //     } else if ($connection == "create") {
  724  //         $respCreate = $this->post($data);
  725  //         return $respCreate;
  726  //     }
  727  // }
  728  ///////////////////////////////////////////////////
````

### Recherche des actions de l'API (étape 7)

Commande :

````
cd ~/exploration-site-json && grep -rn -i -I -E 'action=edit|action=query|action=parse|action=upload|action=login|meta=tokens|csrftoken|lgtoken|appendtext|prependtext|section=new|assert=bot|api\.php' --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=vendor interop cocolight-backend
````

Elle donne 27 lignes, recopiées en entier. Les lignes de plus de 500 caractères sont coupées et la coupure est signalée : ce sont des lignes de JSON des outils d'audit.

````
interop/components/InteropConfig.php:25: *       "WIKI_API_URL":         "https://wiki.example.org/api.php",
interop/models/ApiMediaWiki.php:101:            $url = $url . 'api.php';
interop/models/ApiMediaWiki.php:103:            $url = $url . '/api.php';
interop/models/ApiMediaWiki.php:107:        $this->setParamsGet('?action=query&list=allcategories&aclimit=max&format=json');
interop/models/ApiMediaWiki.php:226:        "url" => str_replace('api.php', 'wiki/' . $pageName, $this->dbWiki['wiki']['url'])
interop/models/ApiMediaWiki.php:299:        $this->paramsGet = "?action=query&prop=images&titles=" . str_replace(" ", "_", $name) . "&format=json";
interop/models/ApiMediaWiki.php:310:                        return str_replace('api.php', 'index.php?title=Special:Redirect/file/' . $nameFile, $this->url);
interop/models/ApiMediaWiki.php:351:        $this->paramsGet = '?action=parse&page=' . $name . '&prop=wikitext&section=0&contentmodel=wikitext&disablelimitreport=1&format=json';
interop/models/ApiMediaWiki.php:388:            "loginreturnurl" => str_replace("/api.php", "", $this->url),
interop/models/ApiMediaWiki.php:515:     * @param  string $wikiApiUrl  URL de l'API MediaWiki, ex: https://wikixd.fabmob.io/api.php
interop/models/ApiMediaWiki.php:616:        $base = str_replace('/api.php', '', rtrim($wikiApiUrl, '/'));
interop/models/ApiMediaWiki.php:704://     $this->setParamsGet("?action=query&meta=siteinfo&format=json");
interop/views/pods/_mediawikiPod.php:6: *   $wikiApiUrl      string  URL de l'API MediaWiki (ex: https://wikixd.fabmob.io/api.php)
cocolight-backend/src/modules/interop/interop.routes.ts:65:        const r = await fetch(`${WIKI_API_URL}?action=query&list=users&ususers=${encodeURIComponent(username)}&usprop=registration&format=json`);
cocolight-backend/src/modules/interop/interop.routes.ts:84:      const r = await fetch(`${WIKI_API_URL}?action=query&list=usercontribs&ucuser=${encodeURIComponent(username)}&uclimit=${limit}&ucprop=ids|title|timestamp|sizediff|comment&format=json`);
cocolight-backend/tools/security/manifest/signatures.json:155:        "modules/citizenToolKit/models/databuilder/SerpApi.php",
cocolight-backend/tools/security/runs/2026-08-02-fix-lot3-ctkC/args.json:1:{"groups":[[{"id":"VULN-186","severity":"high","vulnClass":"WRITE-NOGUARD","route":"co2/action/contribute-to-action","actionFile":"modules/citizenToolKit/controllers/action/ContributeToActionAction.php","legacyRef":"modules/citizenToolKit/controllers/action/ContributeToActionAction.php:14-15 ($id=$_POST[\"actionId\"], $contributorId=$_POST[\"contributorId\"], aucun contrôle de session/rôle)","symptom":"L'action ne fait AU [… ligne coupée à 500 caractères sur 8208]
cocolight-backend/tools/security/runs/2026-08-01-ctk-passe5/citizenToolKit.json:122:      "symptom": "L'action lit action/id/champs directement dans $_POST sans aucune garde d'auth ni de droit. action=deletePlan supprime n'importe quel plan par _id ; action=editPlan remplace ses champs ($set) ; sans id, elle insère un document pricingplans arbitraire. Aucun Authorisation::/session/canEditItem/Form::canAdmin ; le seul gate (CommunecterController::beforeAction) ne rejette QUE si un Authorization:B [… ligne coupée à 500 caractères sur 587]
cocolight-backend/tools/parity/manifest/legacy-map.json:10751:    "modules/citizenToolKit/models/Api.php": {
cocolight-backend/tools/security/manifest/vulns.json:2548:      "attackVector": "InteropConfig.php:17-27 documente le blob : `\"interop\": { \"DISCOURSE_SSO_SECRET\": \"...\", \"WIKI_PASS\": \"mot_de_passe_bot\", \"OIDC_CLIENT_SECRET\": \"...\" }` et :30-31 ne protège QUE DISCOURSE_API_KEY (« stockée chiffrée dans la collection accesskey »). Canal de fuite prouvé en live, sans aucun token : POST /co2/cms/getcostumjson?slug=eXtremeDefiAdeme -> L ET B renvoient `\"interop\":{\"DISCOURSE_URL\":\"ht [… ligne coupée à 500 caractères sur 845]
cocolight-backend/tools/security/manifest/vulns.json:8005:      "symptom": "L'action lit action/id/champs directement dans $_POST sans aucune garde d'auth ni de droit. action=deletePlan supprime n'importe quel plan par _id ; action=editPlan remplace ses champs ($set) ; sans id, elle insère un document pricingplans arbitraire. Aucun Authorisation::/session/canEditItem/Form::canAdmin ; le seul gate (CommunecterController::beforeAction) ne rejette QUE si un Authorization:Bearer invalide est envoyé  [… ligne coupée à 500 caractères sur 561]
cocolight-backend/tools/parity/manifest/bugs.json:3450:      "evidence": "InteropConfig.php:17-27 documente le blob : `\"interop\": { \"DISCOURSE_SSO_SECRET\": \"...\", \"WIKI_PASS\": \"mot_de_passe_bot\", \"OIDC_CLIENT_SECRET\": \"...\" }` et :30-31 ne protège QUE DISCOURSE_API_KEY (« stockée chiffrée dans la collection accesskey »). Canal de fuite prouvé en live, sans aucun token : POST /co2/cms/getcostumjson?slug=eXtremeDefiAdeme -> L ET B renvoient `\"interop\":{\"DISCOURSE_URL\":\"https://f [… ligne coupée à 500 caractères sur 838]
cocolight-backend/docs/response-schemas/cible-survey-coform-getformbyid.md:21:- `modules/citizenToolKit/models/Api.php:577` (`checkDateStatus`→`late`/`include`/`past`)
cocolight-backend/docs/08-ENDPOINTS-MAPPING.md:8476:5. $contribs = ApiMediaWiki::getUserContribs($wikiApiUrl, $username, $limit) (ApiMediaWiki.php:520-534): construit une requete GET vers $wikiApiUrl (rtrim '/') avec querystring action=query, list=usercontribs, ucuser=$username, uclimit=min((int)$limit,500), ucprop='ids|title|timestamp|sizediff|comment', format=json. Appel cURL via staticGetJson (ApiMediaWiki.php:644-660): GET, timeout 10s, FOLLOWLOCATION true, header Accept: application/json; s [… ligne coupée à 500 caractères sur 616]
cocolight-backend/docs/08-ENDPOINTS-MAPPING.md:8510:- Effectue une requete HTTP sortante (cURL GET) vers l'API MediaWiki externe configuree (WIKI_API_URL), action=query&list=usercontribs.
cocolight-backend/docs/08-ENDPOINTS-MAPPING.md:8566:   - Si $wikiApiUrl non vide: construit une URL de verification MediaWiki (action=query&list=users&ususers=<username>&usprop=registration&format=json) et appelle ApiMediaWiki::staticGetJsonPublic($url) (curl GET timeout 10s, Accept application/json; renvoie null si HTTP!=200). Recupere $data['query']['users'][0]. Si la cle 'missing' existe (utilisateur inexistant sur le wiki) -> Rest::json({result:false, error:'Utilisateur \"<username>\" introu [… ligne coupée à 500 caractères sur 619]
cocolight-backend/docs/08-ENDPOINTS-MAPPING.md:10071:- `modules/citizenToolKit/models/Api.php:577 (checkDateStatus)`
````

**Cette recherche ne trouve pas l'écriture, et cela ne prouve pas qu'il n'y en ait pas.** En PHP, les paramètres POST sont écrits sous la forme d'un tableau, `"action" => "edit"`, et non `action=edit`. Les motifs de la consigne ne pouvaient donc pas les détecter. J'ai lancé une recherche complémentaire, `grep -rn -I -E "[\"']action[\"']\s*=>" interop` :

````
interop/controllers/MediawikiController.php:295:                'action'  => 'query',
interop/models/ApiMediaWiki.php:330:            "action" => "logout",
interop/models/ApiMediaWiki.php:358:                "action" => "edit",
interop/models/ApiMediaWiki.php:385:            "action" => "clientlogin",
interop/models/ApiMediaWiki.php:405:            "action" => "query",
interop/models/ApiMediaWiki.php:524:            'action'  => 'query',
interop/models/ApiMediaWiki.php:551:            'action'  => 'query',
interop/models/ApiMediaWiki.php:578:            'action'  => 'browsebysubject',
interop/models/ApiMediaWiki.php:669://         "action" => "createaccount",
interop/models/ApiMediaWiki.php:683:    //     "action" => "purge",
````

### Actions de l'API MediaWiki employées, avec leur extrait

Chaque action est donnée avec son emplacement. Les extraits complets sont dans les fichiers recopiés plus haut.

**Écriture**

- `action=edit` : `interop/models/ApiMediaWiki.php:357-366`, méthode `edit($name)`.

````
  345      public function edit($name)
  346      {
  347          // $test = $this->createAccount();
  348          //var_dump(InteropConfig::get('WIKI_NAME'));exit;
  349          $this->url = $this->dbWiki['wiki']['url'];
  350          $test = $this->login();
  351          $this->paramsGet = '?action=parse&page=' . $name . '&prop=wikitext&section=0&contentmodel=wikitext&disablelimitreport=1&format=json';
  352          $data = $this->getCurl()['parse']['wikitext']['*'];
  353          if (strpos($data, "|pageCo=")) {
  354              return false;
  355          } else {
  356              $newText = substr($data, 0, -2) . '|pageCo=https://www.communecter.org/#@' . $_POST['currentSlug'] . ' }}';
  357              $arrayParams = [
  358                  "action" => "edit",
  359                  "title" => $name,
  360                  "text" => $newText,
  361                  "format" => "json",
  362                  "nocreate" => true,
  363                  "token" => $this->fetchToken("csrf"),
  364              ];
  365              //var_dump($arrayParams);exit;
  366              $verif=$this->post($arrayParams);
  367              if (isset($verif['error'])){
  368                  return false;
  369              }
  370              // var_dump($verif);exit;
  371              $this->logout();
  372              return true;
  373          }
  374      }
````

Elle est appelée par la route `actionEdit`, `interop/controllers/MediawikiController.php:162-169` :

````
  156      /**
  157       * actionEdit
  158       *
  159       * @return string
  160       * route for edit wiki witha communecter link
  161       */
  162      public function actionEdit()
  163      {
  164          if ($this->api->edit($_POST['page'])) {
  165              return '<p> Le wiki a bien été édité</p>';
  166          } else {
  167              return '<p> Un probléme est survenu veuillez contacter l\'administrateur</p>';
  168          }
  169      }
````

Côté navigateur, l'appel part de `interop/assets/js/contentPage.js:29-33` :

````
   29  	$("#edit-wiki").click(function () {
   30  		interopMW.mediaWiki.currentSlug = $(this).data('slug');
   31  		$(this).remove();
   32  		$("#mark-on-wiki").load(baseUrl+"/interop/mediawiki/edit", interopMW.mediaWiki);
   33  	});
````

Ce que la documentation du module dit de cette route, `interop/README.md:59-65` :

````
   59  ### /interop/mediaWiki/edit
   60  Ici la route est appelé en cas de page communecter au méme nom que sur le wiki,
   61  et choix de l'user de marquer la page du wiki ce cette présence.
   62  
   63  !! Attention ici un réglage sur le wiki est a faire afin d'intégrer 
   64  la propriétés   `|pageCo=` dans le modéle des pages du wiki.
   65  renvoi une string message sur le succés ou non de l'opération
````

**Session et jetons**

- `action=clientlogin` : `interop/models/ApiMediaWiki.php:381-394` (extrait sous R3).
- `meta=tokens`, jetons `login` et `csrf` : `interop/models/ApiMediaWiki.php:402-426` ; l'appel `fetchToken("csrf")` est à la ligne 363.
- `action=logout` : `interop/models/ApiMediaWiki.php:327-336`.

**Lecture**

- `action=parse`, `prop=wikitext`, `section=0` : `interop/models/ApiMediaWiki.php:351`. Le wikitexte de la section 0 est lu juste avant la réécriture.
- `action=query`, avec plusieurs `list` ou `prop` :
  - `list=allcategories` : `ApiMediaWiki.php:107` ;
  - `prop=images` : `ApiMediaWiki.php:299` ;
  - `list=usercontribs` : `ApiMediaWiki.php:520-534` et `cocolight-backend/src/modules/interop/interop.routes.ts:84` ;
  - `list=search` : `ApiMediaWiki.php:547-562` ;
  - `list=users` : `MediawikiController.php:294-301` et `interop.routes.ts:65`.
- `action=opensearch` : `ApiMediaWiki.php:284`.
- `action=ask` (Semantic MediaWiki) : `ApiMediaWiki.php:205` et `239` (voir R5).
- `action=browsebysubject` (Semantic MediaWiki) : `ApiMediaWiki.php:262` et `578` (voir R5).

**En commentaire, donc inactif** : `action=createaccount` (`ApiMediaWiki.php:664-680`) et `action=purge` (`ApiMediaWiki.php:682-696`).

**Absences.** `action=upload`, `appendtext`, `prependtext`, `section=new`, `assert=bot`, `lgtoken` et `action=login` n'apparaissent nulle part : ni dans la sortie de la commande de l'étape 7, ni dans celle de la recherche complémentaire ci-dessus.

**Le serveur Node `cocolight-backend` n'écrit rien sur le wiki.** Ses seuls appels au wiki sont deux requêtes GET `action=query` (`interop.routes.ts:65` et `:84`). Ses seules écritures portent sur sa propre base MongoDB : `coll('citoyens').updateOne`, `interop.routes.ts:15-19`. La commande `grep -rn -i 'mediawiki' cocolight-backend/src --include='*.ts' | grep -v '\.test\.'` ne trouve d'autre fichier que `interop.routes.ts`, `toolscatalog.ts:154` (une image) et `dataBinding.ts:317` (une clé vide).

## R3. Avec quelle identité ?

### Écriture : un compte unique pour le costum, ouvert par `clientlogin`

`interop/models/ApiMediaWiki.php:376-394` :

````
  376       * login
  377       *
  378       * @return array
  379       * login on the wiki !!! username and password must be more secure(hash && || include db)
  380       */
  381      protected function login()
  382      {
  383          $token = $this->fetchToken("login");
  384          $paramsLogin = [
  385              "action" => "clientlogin",
  386              "username" => InteropConfig::get('WIKI_NAME'),
  387              "password" => InteropConfig::get('WIKI_PASS'),
  388              "loginreturnurl" => str_replace("/api.php", "", $this->url),
  389              "logintoken" => $token,
  390              "format" => "json",
  391          ];
  392          $login = $this->post($paramsLogin);
  393          return $login;
  394      }
````

Les cookies de session de ce compte sont écrits dans un fichier du module, `ApiMediaWiki.php:39-53` :

````
   39      protected function post($data)
   40      {
   41          $curl = curl_init();
   42          curl_setopt($curl, CURLOPT_URL, $this->url);
   43          curl_setopt($curl, CURLOPT_POST, true);
   44          curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
   45          curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
   46          curl_setopt($curl, CURLOPT_COOKIEJAR, Yii::app()->getModulePath() . "/interop/cookie.txt");
   47          curl_setopt($curl, CURLOPT_COOKIEFILE, Yii::app()->getModulePath() . "/interop/cookie.txt");
   48          // curl_setopt($curl, CURLOPT_COOKIESESSION, true);
   49          $ret = curl_exec($curl);
   50          curl_close($curl);
   51          $dataDecode = json_decode($ret, true);
   52          return $dataDecode;
   53      }
````

Le TODO d'origine sur les mots de passe, `ApiMediaWiki.php:59-62` :

````
   59      ///////////////////////////
   60      //////énorme TODO gestion des mot de passe en db ou non en variable d'environement ou autres?
   61      //////mot de passe au nom de co ou faire entrées les données par l'user
   62      ////////////////////////////
````

### Où ces identifiants sont lus

`InteropConfig::get` lit le champ `interop` du document costum, dans la base MongoDB. `interop/components/InteropConfig.php`, recopié en entier :

````
    1  <?php
    2  
    3  namespace PixelHumain\PixelHumain\modules\interop\components;
    4  
    5  use CacheHelper;
    6  use MongoId;
    7  use PHDB;
    8  
    9  /**
   10   * InteropConfig
   11   *
   12   * Lit la configuration des intégrations tierces (Discourse, OIDC, MediaWiki…)
   13   * depuis le champ `interop` du costum courant en base de données.
   14   *
   15   * Les données sont stockées dans le document costum MongoDB sous la clé `interop` :
   16   *   {
   17   *     "interop": {
   18   *       "DISCOURSE_URL":        "https://forum.example.org",
   19   *       "DISCOURSE_SSO_SECRET": "...",
   20   *       "OIDC_CLIENT_ID":       "mediawiki",
   21   *       "OIDC_CLIENT_SECRET":   "...",
   22   *       "OIDC_REDIRECT_URI":    "https://wiki.example.org/index.php/Special:OpenIDConnectReturn",
   23   *       "WIKI_NAME":            "nom_utilisateur_bot",
   24   *       "WIKI_PASS":            "mot_de_passe_bot",
   25   *       "WIKI_API_URL":         "https://wiki.example.org/api.php",
   26   *       "WIKI_BASE_URL":        "https://wiki.example.org"
   27   *     }
   28   *   }
   29   *
   30   * La clé API Discourse (DISCOURSE_API_KEY) est stockée chiffrée dans la collection
   31   * `accesskey` (comme la clé OpenAI) et jamais exposée côté client.
   32   *
   33   * Récupération via l'interface d'administration du costum, champ JSON `interop`.
   34   */
   35  class InteropConfig
   36  {
   37      /**
   38       * Récupère une valeur de configuration interop depuis le costum courant.
   39       *
   40       * @param  string $key     Clé de configuration (ex: DISCOURSE_SSO_SECRET)
   41       * @param  string $default Valeur par défaut si la clé est absente ou vide
   42       * @return string
   43       */
   44      public static function get($key, $default = '')
   45      {
   46          $costum = CacheHelper::getCostum();
   47          $value = isset($costum['interop'][$key]) ? $costum['interop'][$key] : null;
   48          return ($value !== null && $value !== '') ? (string) $value : $default;
   49      }
   50  
   51      /**
   52       * Récupère la clé API Discourse déchiffrée depuis la collection `accesskey`.
   53       * La clé n'est jamais stockée dans le document costum (sécurité).
   54       *
   55       * @return string|null  La clé déchiffrée, ou null si non configurée
   56       */
   57      public static function getDiscourseApiKey()
   58      {
   59          $costum = CacheHelper::getCostum();
   60          $record = PHDB::findOne("accesskey", [
   61              "parent.".$costum["contextId"]."" => ['$exists' => true],
   62              "keys.discourseApiKey"            => ['$exists' => true]
   63          ]);
   64          if (empty($record) || empty($record['keys']['discourseApiKey'])) {
   65              return null;
   66          }
   67          return self::decryptKey($costum["contextId"], $costum["contextSlug"], $record['keys']['discourseApiKey']);
   68      }
   69  
   70      private static function decryptKey($costumId, $costumSlug, $encryptedKey)
   71      {
   72          $key = hash('sha256', $costumId . $costumSlug, true);
   73          $iv  = substr($key, 0, 16);
   74          $decoded = base64_decode($encryptedKey);
   75          return openssl_decrypt($decoded, "aes-256-cbc", $key, 0, $iv);
   76      }
   77  }
````

Les valeurs de cet en-tête (`"..."`, `"nom_utilisateur_bot"`, `"mot_de_passe_bot"`) sont des exemples de documentation et non des secrets. Je les ai recopiées sans les remplacer par SECRET.

Il existe aussi un fichier modèle `interop/env.php`, qui pose des variables d'environnement. `grep -rn -I 'env\.php\|getenv' interop` ne trouve aucun code qui l'inclut ni aucun `getenv`. La commande ne renvoie que des mentions en commentaire, et `.env.php` dans `interop/.gitignore:1` :

````
interop/env.php:2:///                  Fichier a renommer en .env.php et completer avec les bonnes données
interop/.gitignore:1:.env.php
interop/models/ApiDiscourse.php:10: * Pour les endpoints privés, configurer DISCOURSE_API_KEY dans .env.php.
interop/controllers/DiscourseController.php:23: * Configuration requise dans env.php :
````

Les valeurs du fichier sont des textes d'exemple, pas des secrets. Recopié en entier :

````
    1  <?php
    2  ///                  Fichier a renommer en .env.php et completer avec les bonnes données
    3  $variables = [
    4      // ici voir si compte commun communecter pour le compte mediawiki
    5      // ou ajouter form pour que l'user qui rentre le mediawiki rentre ses données (! demande de stocker un mot de passe et ce que cela inclut)
    6      'WIKI_NAME' => "name of user to connecte on mediawiki",
    7      'WIKI_PASS' => "password of user to connecte on mediawiki",
    8      //   'APP_KEY' => '',
    9      //   'DB_HOST' => 'localhost',
   10      //   'DB_USERNAME' => 'root',
   11      //   'DB_PASSWORD' => '',
   12      //   'DB_NAME' => 'demoDB',
   13      //   'DB_PORT' => '3306',
   14  ];
   15  
   16  foreach ($variables as $key => $value) {
   17      putenv("$key=$value");
   18  }
````

### Quelle adresse de wiki reçoit l'écriture

`edit()` n'utilise ni `WIKI_API_URL` ni `WIKI_BASE_URL`. Elle utilise `$this->dbWiki['wiki']['url']` (`ApiMediaWiki.php:349`), c'est-à-dire l'URL qu'un utilisateur a saisie dans le formulaire « insertWiki ». Cette URL est complétée par `api.php` (`ApiMediaWiki.php:98-115`) puis enregistrée dans la collection MongoDB `mediawiki`. `interop/models/DB.php:27-40` :

````
   27      public function __construct($id)
   28      {
   29          if (empty($id)) {
   30              return;
   31          }
   32          if ($this->setById($id)) {
   33              return $this->wiki;
   34          } else {
   35              $this->wiki = PHDB::find("mediawiki", ["parent." . $id . ".name" => $_POST['name']]);
   36              if (empty($this->wiki)) {
   37                  $this->newIn($id, $_POST['name'], $_POST['type']);
   38                  $this->wiki = PHDB::find("mediawiki", ["parent." . $id . ".name" => $_POST['name']]);
   39              }
   40              $this->wiki = $this->mapWiki();
````

### Lecture : sans identité

Les lectures liées aux trois routes connues sont des requêtes GET anonymes. Dans `ApiMediaWiki.php:620-660`, `staticGetJson` est décrit ainsi : « sans instance, sans cookies bot ». Dans `cocolight-backend`, les deux `fetch` des lignes 65 et 84 ne portent aucun en-tête d'authentification. Le commentaire `interop.routes.ts:10-12` le dit en clair : « TODO : auth API key / SSO complets ».

### Ce qu'en disent les outils d'audit de cocolight-backend

`cocolight-backend/tools/security/manifest/vulns.json:2540-2560` :

````
 2540        "owasp": "A05:2021-Security Misconfiguration",
 2541        "severity": "info",
 2542        "module": "interop",
 2543        "route": "co2/cms/getcostumjson",
 2544        "actionFile": "modules/interop/components/InteropConfig.php",
 2545        "legacyRef": "modules/interop/components/InteropConfig.php:15-33 (schéma du blob) et :44-49 (lecture) ; modules/interop/controllers/DiscourseController.php:59-62 (la seule preuve exigée par le SSO est le HMAC de ce secret)",
 2546        "sinkRef": null,
 2547        "authRequired": "role",
 2548        "attackVector": "InteropConfig.php:17-27 documente le blob : `\"interop\": { \"DISCOURSE_SSO_SECRET\": \"...\", \"WIKI_PASS\": \"mot_de_passe_bot\", \"OIDC_CLIENT_SECRET\": \"...\" }` et :30-31 ne protège QUE DISCOURSE_API_KEY (« stockée chiffrée dans la collection accesskey »). Canal de fuite prouvé en live, sans aucun token : POST /co2/cms/getcostumjson?slug=eXtremeDefiAdeme -> L ET B renvoient `\"interop\":{\"DISCOURSE_URL\":\"https://forum.fabmob.io\",\"WIKI_API_URL\":\"https://wikixd.fabmob.io/api.php\",\"WIKI_BASE_URL\":\"https://wikixd.fabmob.io\"}` (réponses byte-identiques, 108591 octets). Le champ traverse donc le passe-plat sans filtre ; aujourd'hui il ne contient que 3 URLs (élément projects/63f7163932026e45283d7222, seul porteur de costum.interop en base).",
 2549        "blastRadius": "Le front lit costum.interop.DISCOURSE_URL / WIKI_API_URL / WIKI_BASE_URL pour monter les pods : il faut garder ces clés et ne masquer que *_SECRET / *_PASS / *_KEY. Écart T0 non byte-comparable, mais sans risque immédiat car aucune donnée sensible n'est présente sur cette base.",
 2550        "poc": "1) poser costum.interop.DISCOURSE_SSO_SECRET sur un costum ; 2) POST /co2/cms/getcostumjson?slug=<slug> sans Authorization -> le secret est dans data.interop ; 3) forger sso=base64(nonce=..&email=victime) + sig=hmac_sha256(sso,secret) -> GET /interop/discourse/sso l'accepte (DiscourseController.php:59-62).",
 2551        "portedToNode": true,
 2552        "nodeRef": "src/modules/cms/cms.routes.ts:13 (passe-plat du document costum, aucune projection)",
 2553        "remediation": "T0 des deux côtés : liste blanche à la lecture de costum.interop et déplacement de SSO_SECRET/WIKI_PASS/OIDC_CLIENT_SECRET vers la collection `accesskey` chiffrée — le mécanisme existe déjà (InteropConfig.php:57-76).",
 2554        "fixLocation": null,
 2555        "parityRef": "BUG-N-051",
 2556        "confidence": "high",
 2557        "status": "WONTFIX",
 2558        "discoveredOn": "2026-07-26",
 2559        "verified": {
 2560          "on": "2026-08-01",
````

Ce passage relève une mesure faite « en live » sur `eXtremeDefiAdeme` : le champ `interop` de ce costum ne portait alors que trois URL, celles d'un wiki `wikixd.fabmob.io`, et aucun `WIKI_NAME` ni `WIKI_PASS`. Je n'ai fait aucune vérification en ligne.

## R4. Toutes les clés de l'objet de configuration interop d'un costum

### Selon le bloc qui les documente

C'est l'en-tête de `interop/components/InteropConfig.php`, lignes 15 à 28, recopié en entier sous R3 :

````
   15   * Les données sont stockées dans le document costum MongoDB sous la clé `interop` :
   16   *   {
   17   *     "interop": {
   18   *       "DISCOURSE_URL":        "https://forum.example.org",
   19   *       "DISCOURSE_SSO_SECRET": "...",
   20   *       "OIDC_CLIENT_ID":       "mediawiki",
   21   *       "OIDC_CLIENT_SECRET":   "...",
   22   *       "OIDC_REDIRECT_URI":    "https://wiki.example.org/index.php/Special:OpenIDConnectReturn",
   23   *       "WIKI_NAME":            "nom_utilisateur_bot",
   24   *       "WIKI_PASS":            "mot_de_passe_bot",
   25   *       "WIKI_API_URL":         "https://wiki.example.org/api.php",
   26   *       "WIKI_BASE_URL":        "https://wiki.example.org"
   27   *     }
   28   *   }
   29   *
   30   * La clé API Discourse (DISCOURSE_API_KEY) est stockée chiffrée dans la collection
   31   * `accesskey` (comme la clé OpenAI) et jamais exposée côté client.
````

Neuf clés y figurent : `DISCOURSE_URL`, `DISCOURSE_SSO_SECRET`, `OIDC_CLIENT_ID`, `OIDC_CLIENT_SECRET`, `OIDC_REDIRECT_URI`, `WIKI_NAME`, `WIKI_PASS`, `WIKI_API_URL` et `WIKI_BASE_URL`. En plus des trois clés connues, les **autres** clés du même objet sont donc les six suivantes : `DISCOURSE_SSO_SECRET`, `OIDC_CLIENT_ID`, `OIDC_CLIENT_SECRET`, `OIDC_REDIRECT_URI`, `WIKI_NAME` et `WIKI_PASS`. Les lignes 30-31 ajoutent `DISCOURSE_API_KEY`, qui n'est pas rangée dans cet objet mais, chiffrée, dans la collection `accesskey`.

### Selon le code qui les lit

Commande : `grep -rn -o -I -E "InteropConfig::get\('[A-Z_]+'" interop`.

````
interop/controllers/DiscourseController.php:44:InteropConfig::get('DISCOURSE_SSO_SECRET'
interop/controllers/DiscourseController.php:99:InteropConfig::get('DISCOURSE_SSO_SECRET'
interop/controllers/DiscourseController.php:100:InteropConfig::get('DISCOURSE_URL'
interop/controllers/DiscourseController.php:177:InteropConfig::get('DISCOURSE_URL'
interop/controllers/DiscourseController.php:392:InteropConfig::get('DISCOURSE_URL'
interop/controllers/DiscourseController.php:45:InteropConfig::get('DISCOURSE_URL'
interop/models/ApiDiscourse.php:27:InteropConfig::get('DISCOURSE_URL'
interop/controllers/MediawikiController.php:195:InteropConfig::get('WIKI_API_URL'
interop/controllers/MediawikiController.php:246:InteropConfig::get('WIKI_API_URL'
interop/controllers/MediawikiController.php:275:InteropConfig::get('WIKI_API_URL'
interop/controllers/MediawikiController.php:196:InteropConfig::get('WIKI_BASE_URL'
interop/models/ApiMediaWiki.php:348:InteropConfig::get('WIKI_NAME'
interop/models/ApiMediaWiki.php:387:InteropConfig::get('WIKI_PASS'
````

La ligne 348 de `ApiMediaWiki.php` est en commentaire. Les trois clés `OIDC_*` ne sont lues par aucun appel à `InteropConfig::get` dans ce dépôt.

### Côté Node

`cocolight-backend` ne lit pas ces clés dans le costum : il les lit dans les variables d'environnement du processus. `grep -rn -I -E "process\.env\.(WIKI|DISCOURSE|OIDC)[A-Z_]*" cocolight-backend/src` :

````
cocolight-backend/src/modules/interop/interop.routes.ts:13:  const DISCOURSE_URL = (process.env.DISCOURSE_URL ?? '').replace(/\/$/, '');
cocolight-backend/src/modules/interop/interop.routes.ts:14:  const WIKI_API_URL = process.env.WIKI_API_URL ?? '';
````

## R5. Semantic MediaWiki

Commande :

````
cd ~/exploration-site-json && grep -rn -i -I -E 'askargs|browsebysubject|smwbrowse|semantic|smw' --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=vendor interop cocolight-backend
````

Elle donne 12 lignes, recopiées en entier. Les lignes de plus de 500 caractères sont coupées et la coupure est signalée.

````
interop/models/ApiMediaWiki.php:262:        $this->paramsGet = "?action=browsebysubject&subject=" . $namePage . "&format=json";
interop/models/ApiMediaWiki.php:568:     * en utilisant l'API Semantic MediaWiki (browsebysubject).
interop/models/ApiMediaWiki.php:578:            'action'  => 'browsebysubject',
cocolight-backend/package-lock.json:486:      "integrity": "sha512-SmwKXe6VHIyZYbBLJrhOoCJRB/Z1tckzmgTLfFYOfpMAx63BJEaL9ExI8x7v0oAO3Zh6D/Oi1gVxEYr5oUCFhw==",
cocolight-backend/docs/08-ENDPOINTS-MAPPING.md:3794:- id semantics: present+exists => $set update; present+not-exists => UPSERT (creates doc with that id); absent => insert with Mongo-generated id. Three distinct paths.
cocolight-backend/docs/08-ENDPOINTS-MAPPING.md:4123:- 'path'=='allToRoot' is a magic value writing at document root with split set/unset semantics — easy to miss.
cocolight-backend/docs/08-ENDPOINTS-MAPPING.md:5479:- 'all' uses PHP truthiness (@$_POST['all']) — any non-empty/non-'0' string counts as true; '0' or '' counts as false. Match loosely-truthy semantics, not strict boolean.
cocolight-backend/docs/08-ENDPOINTS-MAPPING.md:10473:- Field-strip is defense-in-depth only on the keys present in the incoming payload; on UPDATE, restricted keys already in DB are preserved (merge does not touch absent keys). Port must mirror the merge-not-replace semantics or risk silently dropping data.
cocolight-backend/tools/parity/runs/2026-08-20T11-54-pull-ekilibre/agents.jsonl:21:{"parentUuid":"d22b2826-37de-4f94-8f51-9dcdec682760","isSidechain":true,"agentId":"a3f8a9c6eb5d52474","message":{"model":"claude-fable-5","id":"msg_011CeDeLFH2PtqYQCnyAgb1v","type":"message","role":"assistant","content":[{"type":"thinking","thinking":"","signature":"CAISrgwKpAEIEBgCKkAn8nva9vI7R5rqOYIIcKT7KkD+jEMIWJZKAk226Di+RXdU6noIN+inn6mfEL0Qn44c/kS1eoZk+yQ9cHylLf2iMg5jbGF1ZGUtZmFibGUtNTgBQgh0aGlua2luZ1okMDYyNW [… ligne coupée à 500 caractères sur 3244]
cocolight-backend/tools/parity/runs/2026-08-20T11-54-pull-ekilibre/agents.jsonl:49:{"parentUuid":"157378ca-ff77-47e4-a792-c55299e2e927","isSidechain":true,"agentId":"a3f8a9c6eb5d52474","message":{"model":"claude-fable-5","id":"msg_011CeDeTZfkrvkgMQjnQ4Bbh","type":"message","role":"assistant","content":[{"type":"thinking","thinking":"","signature":"CAIS6iQKpAEIEBgCKkASRtlxM8mVvc410CY2VZR/EK5JruU6GAlP0n53C0hf8unUX96pqeO6iQf380Ll/6IREmPedrGQqPN2FKSNmutTMg5jbGF1ZGUtZmFibGUtNTgBQgh0aGlua2luZ1okMDYyNW [… ligne coupée à 500 caractères sur 7420]
cocolight-backend/tools/parity/runs/2026-08-20T11-54-pull-ekilibre/agents.jsonl:113:{"parentUuid":"a6e01ad8-0460-47e7-9b99-5c599bd16085","isSidechain":true,"agentId":"a3f8a9c6eb5d52474","message":{"model":"claude-fable-5","id":"msg_011CeDerW2cxJese9fxJQrws","type":"message","role":"assistant","content":[{"type":"thinking","thinking":"","signature":"CAIS9gwKpAEIEBgCKkCMCZtA6FO+IhFSqxoRivd99IzXn8Ain7OToD1yhS9Sav+qyK+RejF5yJvF4zR4tXzRu0Pw/3zfBiLqiPqaitj9Mg5jbGF1ZGUtZmFibGUtNTgBQgh0aGlua2luZ1okMDYyN [… ligne coupée à 500 caractères sur 3340]
cocolight-backend/tools/parity/runs/2026-08-20T11-54-pull-ekilibre/agents.jsonl:168:{"parentUuid":"f3141448-e425-4387-9c20-bb5a62486be3","isSidechain":true,"agentId":"a3f8a9c6eb5d52474","message":{"model":"claude-fable-5","id":"msg_011CeDfKMTBndQp8QVktUvhh","type":"message","role":"assistant","content":[{"type":"thinking","thinking":"","signature":"CAIS3C8KpAEIEBgCKkC6jKFfTfR1yOxnXNMP1oddeXS4rv0zIk13UXNQFPFWfbdc8dvRtAhTv4MF0vsaVWaPkTkenEVzqgu/wtS8r6pLMg5jbGF1ZGUtZmFibGUtNTgBQgh0aGlua2luZ1okMDYyN [… ligne coupée à 500 caractères sur 9282]
````

Dans cette sortie, seules les lignes 1 à 3 concernent Semantic MediaWiki ; elles sont toutes dans `interop/models/ApiMediaWiki.php`. Les autres sont des faux positifs : le mot anglais « semantics », une empreinte `sha512` de `package-lock.json` qui contient « Smw », et des transcriptions d'agents dans `tools/parity/runs/`.

`askargs` et `smwbrowse` n'apparaissent nulle part dans la sortie de cette commande. En revanche, le module emploie `action=ask`, qui ne figurait pas dans les motifs de l'étape 8. Je l'ai trouvé par la commande de l'étape 7 et par la lecture du fichier.

`ApiMediaWiki.php:186-213`, une requête par catégorie :

````
  186      public function menu()
  187      {
  188          $menu = ["categorie" => $this->currentCat, "menu" => []];
  189          switch ($this->currentCat) {
  190              case 'acteurs':
  191                  $tabParams = $this->dbWiki['wiki']['params']['actors'];
  192                  break;
  193              case 'ressources':
  194                  $tabParams = $this->dbWiki['wiki']['params']['classifieds'];
  195                  break;
  196              case 'projets':
  197                  $tabParams = $this->dbWiki['wiki']['params']['projects'];
  198                  break;
  199  
  200              default:
  201                  # code...
  202                  break;
  203          }
  204          foreach ($tabParams as $param) {
  205              $this->paramsGet = "?action=ask&query=[[Cat%C3%A9gorie:" . $param . "]]|limit=500&format=json";
  206              $this->url = $this->dbWiki['wiki']['url'];
  207              $data = $this->getCurl()['query']['results'];
  208              foreach ($data as $key => $value) {
  209                  $menu["menu"] += [$key => $value['fullurl']];
  210              }
  211          }
  212          return $menu;
  213      }
````

`ApiMediaWiki.php:221-272`, qui lit les propriétés d'une page par `browsebysubject`, puis les valeurs par `ask` avec `|?Propriété` :

````
  221      public function page($pageName)
  222      {
  223          //var_dump($this->dbWiki);exit;
  224          $page = [
  225          "title" => $pageName,
  226          "url" => str_replace('api.php', 'wiki/' . $pageName, $this->dbWiki['wiki']['url'])
  227      ];
  228          $validName = str_replace("&", "%26", str_replace(" ", "_", $pageName));
  229          $inCo = parent::findInCo($pageName);
  230          if ($inCo) {
  231              $page += ["inCo" => $inCo];
  232          } else {
  233              $page += ["inCo" => false];
  234          }
  235          $this->properties($validName);
  236          if ($this->properties == '') {
  237              $page += ["data" => false];
  238          } else {
  239              $this->paramsGet = "?action=ask&format=json&query=[[" . $validName . "]]" . $this->properties;
  240              $data = $this->getCurl()['query']['results'];
  241              if (empty($data[$page['title']]['printouts'])) {
  242                  $page += ["data" => false];
  243              } else {
  244                  $page += $data[$page['title']]['printouts'];
  245                  $page += ["data" => true];
  246              }
  247          }
  248          $page += ["logo" => $this->logo($pageName)];
  249          $pageConvert = Convert::convertWikiMediaToPh(["data" => $page], $this->currentCat, $this->dbWiki['wiki']['name']);
  250          //var_dump($pageConvert['data']);exit;
  251          return $pageConvert;
  252      }
  253      /**
  254       * properties
  255       *
  256       * @param  string url encoded name of page to search data
  257       * @return void
  258       * set properties by namePage to prepare curl call
  259       */
  260      public function properties($namePage)
  261      {
  262          $this->paramsGet = "?action=browsebysubject&subject=" . $namePage . "&format=json";
  263          $this->url = $this->dbWiki['wiki']['url'];
  264          $res = $this->getCurl()['query'];
  265          if (isset($res['data'])) {
  266              foreach ($res['data'] as $value) {
  267                  if (!preg_match("/^_/", $value['property'])) {
  268                      $this->properties .= "|?" . $value['property'];
  269                  }
  270              }
  271          }
  272      }
````

`ApiMediaWiki.php:564-603` (`getUserPageProperties`, `browsebysubject`) :

````
  564      /**
  565       * getUserPageProperties
  566       *
  567       * Récupère les propriétés sémantiques d'une fiche wiki (thèmes, compétences…)
  568       * en utilisant l'API Semantic MediaWiki (browsebysubject).
  569       *
  570       * @param  string $wikiApiUrl
  571       * @param  string $pageName   Titre exact de la page wiki
  572       * @return array              Tableau associatif propriété → valeurs
  573       */
  574      public static function getUserPageProperties($wikiApiUrl, $pageName)
  575      {
  576          $wikiApiUrl = rtrim($wikiApiUrl, '/');
  577          $params = http_build_query([
  578              'action'  => 'browsebysubject',
  579              'subject' => str_replace(' ', '_', $pageName),
  580              'format'  => 'json',
  581          ]);
  582  
  583          $data = self::staticGetJson($wikiApiUrl . '?' . $params);
  584          if (empty($data['query']['data'])) {
  585              return [];
  586          }
  587  
  588          $props = [];
  589          foreach ($data['query']['data'] as $item) {
  590              $property = $item['property'];
  591              // Ignorer les propriétés internes MediaWiki (commençant par _)
  592              if (strpos($property, '_') === 0) {
  593                  continue;
  594              }
  595              $values = [];
  596              foreach ($item['dataitem'] as $di) {
  597                  $values[] = $di['item'];
  598              }
  599              $props[$property] = $values;
  600          }
  601  
  602          return $props;
  603      }
````

Les valeurs lues par `page()` sont converties ensuite par `Convert::convertWikiMediaToPh` (`ApiMediaWiki.php:249`). Cette classe n'est pas dans le dépôt `interop` ; le README de ce dépôt (`interop/README.md:56`) la situe dans `citizenToolKit`, qui n'a pas été cloné.

L'écriture de `edit()` ajoute un paramètre de modèle `|pageCo=` à la fin du wikitexte de la section 0 (`ApiMediaWiki.php:356`). Elle ne pose aucune annotation sémantique directe. Le README (`interop/README.md:63-64`) précise que le modèle des pages du wiki doit avoir été réglé pour intégrer cette propriété.

## R6. Autres routes ou fonctions liées au wiki

### Toutes les routes du contrôleur MediaWiki (PHP)

Commande : `grep -n 'public function action' interop/controllers/MediawikiController.php`. Chaque action correspond à une route `/interop/mediawiki/<action>` (convention Yii, confirmée par le README, lignes 28 à 65).

````
55:    public function actionIndex()
82:    public function actionChooseCategory()
111:    public function actionInsertCat()
125:    public function actionMenuLeft()
146:    public function actionPage()
162:    public function actionEdit()
170:    public function actionDoc()
174:    public function actionCreate()
193:    public function actionUserPod()
244:    public function actionContribs()
273:    public function actionLinkAccount()
330:    public function actionUnlinkAccount()
````

Il y a donc neuf routes en plus des trois connues :

| Route | Lignes | Rôle |
|---|---|---|
| `index` | 55 | |
| `chooseCategory` | 82 | écrit l'adresse et le nom d'un wiki dans MongoDB |
| `insertCat` | 111 | |
| `menuLeft` | 125 | `ask` |
| `page` | 146 | `browsebysubject` puis `ask` |
| `edit` | 162 | **écriture sur le wiki** |
| `doc` | 170 | redirection |
| `create` | 174 | appelle `$this->api->createAccount()`, méthode qui n'existe qu'en commentaire dans `ApiMediaWiki.php:664` |
| `userPod` | 193 | |

### Autres fonctions dont le nom contient « wiki »

Commande :

````
cd ~/exploration-site-json && grep -rn -I -i -E "function [a-z_]*wiki|wiki[a-z_]*\s*[:=]\s*(async\s*)?(function|\()|app\.(get|post|put|patch|delete)\([^)]*wiki|route[^\n]*wiki" --exclude-dir=.git --exclude-dir=node_modules --exclude-dir=vendor --exclude-dir=tools interop cocolight-backend
````

Sortie :

````
interop/README.md:60:Ici la route est appelé en cas de page communecter au méme nom que sur le wiki,
interop/models/ApiMediaWiki.php:453:    public function getWiki()
interop/models/ApiMediaWiki.php:463:    public function setWiki($wiki)
interop/models/ApiMediaWiki.php:614:    public static function buildWikiPageUrl($wikiApiUrl, $pageName)
interop/models/DB.php:92:    public function mapWiki()
interop/models/DB.php:105:    public function saveWiki($wiki)
interop/views/pods/_mediawikiPod.php:248:    function escapeHtmlWiki(str) {
interop/controllers/DefaultController.php:100:	public function actionMediaWiki()
interop/controllers/MediawikiController.php:160:     * route for edit wiki witha communecter link
interop/controllers/MediawikiController.php:211:                $wikiUsername = (string) $profileOwner['interop']['mediawiki'][$costumSlug];
cocolight-backend/src/modules/interop/interop.routes.ts:7:/** Routes interop Discourse/MediaWiki (link/unlink/profile/contribs) — extrait d'advanced.routes.ts, audit étape 6. */
cocolight-backend/src/modules/interop/interop.routes.ts:58:  app.post('/interop/mediawiki/linkAccount', { preHandler: requireAuth }, async (req) => {
cocolight-backend/src/modules/interop/interop.routes.ts:73:  app.post('/interop/mediawiki/unlinkAccount', { preHandler: requireAuth }, async (req) => {
cocolight-backend/src/modules/interop/interop.routes.ts:77:  app.post('/interop/mediawiki/contribs', async (req) => {
cocolight-backend/docs/response-schemas/cible-interop-mediawiki-linkaccount.md:156:Handler : `src/modules/advanced/advanced.routes.ts:208-222` (`POST /interop/mediawiki/linkAccount`, `preHandler: requireAuth`).
cocolight-backend/docs/response-schemas/cible-interop-mediawiki-contribs.md:159:Handler : `src/modules/advanced/advanced.routes.ts:227-238` (`POST /interop/mediawiki/contribs`).
cocolight-backend/docs/response-schemas/cible-interop-mediawiki-unlinkaccount.md:118:Handler : `src/modules/advanced/advanced.routes.ts:223-226` (`POST /interop/mediawiki/unlinkAccount`, `preHandler: requireAuth`).
````

Une autre route porte le nom MediaWiki dans un contrôleur différent : `/interop/default/mediaWiki`, dans `interop/controllers/DefaultController.php:100-108` :

````
   95  	 * actionIndex
   96  	 *
   97  	 * get actions and render the views index
   98  	 * @return void
   99  	 */
  100  	public function actionMediaWiki()
  101  	{
  102  		$this->actions = $this->getPossiblesActions($_POST['name']);
  103  		if (Yii::app()->request->isAjaxRequest)
  104  			return $this->renderPartial("indexMediaWiki");
  105  		else {
  106  			return $this->render("indexMediaWiki");
  107  		}
  108  	}
````

Ce qui ne relève que du serveur Node : en dehors des tests, `cocolight-backend/src` ne contient pas d'autre route liée au wiki que les trois connues. La commande de R2, `grep -rn -i 'mediawiki' cocolight-backend/src --include='*.ts' | grep -v '\.test\.'`, le montre. Le contrat `endpoints-copie.json` ne compte que trois routes `/interop/mediawiki/` (voir R1).

## Écarts et surprises

1. **État du dépôt et relevé de `.claude/settings.local.json` au début de la tâche.** `git status --porcelain` n'a rien renvoyé, ce qui ne demande aucun arrêt. Le contenu de `.claude/settings.local.json` était :
   ```
   {
     "permissions": {
       "allow": [],
       "deny": []
     }
   }
   ```
   Aucune règle.
2. **Relevé de `.claude/settings.local.json` en fin de tâche :** même contenu qu'au début, `"allow": []` et `"deny": []`. Aucune règle. `git status --porcelain` ne montrait que `?? travaux/exploration-cocolight-serveur.md` avant le commit.
3. **Je n'ai pas établi lequel des deux serveurs est en production, ni si la route d'écriture `/interop/mediawiki/edit` est encore servie.** Le serveur Node ne porte pas cette route : elle est absente de son contrat, qui ne contient que huit routes `/interop/`. Le module PHP, lui, la porte toujours. Sa dernière activité date du 2026-05-04, et `cocolight-backend` s'y réfère comme au « legacy » (par exemple `interop.routes.ts:87` : « legacy masque l'échec externe »). Les outils de parité (`cocolight-backend/tools/parity/`) comparent un serveur « L » à un serveur « B ». Je les ai vus dans `vulns.json:2548`, mais je n'en ai pas lu la définition. Je n'ai fait aucune requête vers les serveurs en ligne.
4. **Les motifs de l'étape 7 ne pouvaient pas détecter l'écriture.** `edit` passe par un tableau PHP envoyé en POST (`"action" => "edit"`), et non par une chaîne `action=edit`. La recherche complémentaire et les extraits sont donnés sous R2. Sans la lecture du fichier, la commande de la consigne aurait conclu à tort à une absence.
5. **Deux sources différentes pour l'adresse du wiki dans le module PHP.** Les routes de profil (`contribs`, `linkAccount`, `userPod`) lisent `WIKI_API_URL` dans le costum. L'écriture `edit`, elle, utilise l'URL enregistrée dans la collection `mediawiki`, qu'un utilisateur a saisie dans un formulaire. Les identifiants `WIKI_NAME` et `WIKI_PASS` viennent pourtant du costum courant.
6. **Le serveur Node lit `WIKI_API_URL` dans l'environnement du processus** (`process.env`), alors que site-json la lit dans `costum.interop` (rapport précédent, Q3). Je n'ai pas cherché à concilier les deux.
7. **Une lecture de fichier a été bloquée par une règle `deny`.** Ma commande lisait `cocolight-backend/.env.example`. Elle visait le clone, mais l'outil l'a interprétée comme le chemin `/home/spheres/ecolibre-sgdt/cocolight-backend/.env.example`, et une règle de refus de `.claude/settings.json` l'a bloquée. Je n'ai pas contourné ce refus. Le contenu de ce fichier modèle n'est donc pas dans le rapport. Les variables lues par le code Node sont relevées sous R4 par une autre méthode, la recherche de `process.env`.
8. **Lignes coupées.** Dans les sorties de l'étape 7 (R2) et de l'étape 8 (R5), les lignes de plus de 500 caractères ont été coupées et la coupure est signalée. Il s'agit de JSON d'audit et de transcriptions d'agents ; la plus longue faisait 9 282 caractères. Je n'ai rien coupé dans les extraits de code.
9. **Secrets.** Je n'ai trouvé aucune valeur qui ressemble à un secret réel. Les valeurs de `InteropConfig.php` et de `env.php` sont des textes d'exemple. Je les ai recopiées telles quelles, sans les remplacer par SECRET.
10. **Ce qui n'a pas été lu.** `interop/models/DB.php` au-delà de la ligne 40 ; `Convert::convertWikiMediaToPh`, qui est dans `citizenToolKit`, non cloné ; `interop/assets/js/forms/insertWiki.js` ; les vues `views/default/indexMediaWiki.php` et `views/page/index.php` ; la documentation de `cocolight-backend` (`docs/08-ENDPOINTS-MAPPING.md`, `docs/response-schemas/`).
11. **Demandes de confirmation.** Je ne vois pas les fenêtres que Cyril reçoit, et je ne peux donc pas dire si l'une d'elles a proposé une autorisation permanente. Le relevé de fin de tâche du point 2 montre ce qui a été inscrit dans `.claude/settings.local.json`. Cyril ne m'a posé aucune question hors consigne.
12. **Vérification qui tranche.** Pour R2, chaque action de l'API MediaWiki citée est accompagnée de son chemin de fichier et de son numéro de ligne. Le code des écritures et de la connexion (`edit`, `clientlogin`, `meta=tokens`, `logout`) est recopié mot pour mot dans les extraits ou dans le fichier `ApiMediaWiki.php` recopié en entier. Les actions absentes sont nommées avec les deux commandes qui ont servi à les chercher.
