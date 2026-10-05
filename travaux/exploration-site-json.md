# Exploration du dépôt site-json (Open Atlas)

Pour l'architecte. Demande particulière de Cyril, rattachée à aucun lot. Rien n'a été écrit sur le wiki et aucune commande `bin/wiki-*.sh` n'a été lancée. Le code cloné n'a été ni installé, ni construit, ni exécuté.

- Clone : `~/exploration-site-json/site-json/`, laissé en place.
- Adresse qui a fonctionné : `https://gitlab.adullact.net/pixelhumain/site-json.git`, du premier coup ; l'adresse sans `.git` n'a pas été essayée.
- Branche extraite : `main`, au commit `76ca35bd2614c1494b6bb15d141e78c98ac5cc0e`. Tous les chemins cités plus bas sont relatifs à la racine du clone. Les extraits sont numérotés comme dans le fichier source.
- Date du relevé : 5 octobre 2026.

## Arborescence (étape 5)

Racine du clone, `ls -la ~/exploration-site-json/site-json` :

````
drwxr-xr-x  .claude/
drwxr-xr-x  .design-sync/
-rw-r--r--      857 .dockerignore
drwxr-xr-x  .git/
-rw-r--r--      970 .gitignore
-rw-r--r--        8 .nvmrc
-rw-r--r--     4522 Dockerfile
-rw-r--r--     3908 README.md
-rw-r--r--      417 components.json
-rw-r--r--     8587 config.dev.acc.json
-rw-r--r--    17973 config.dev.json
-rw-r--r--    22292 config.prod.commune-transparente.json
-rw-r--r--    80925 config.prod.cyber-reunion.json
-rw-r--r--    75972 config.prod.eXtremeDefiAdeme.json
-rw-r--r--   153247 config.prod.equipements-Sportifs-Scolaire.json
-rw-r--r--   186969 config.prod.equipements-Sportifs.json
-rw-r--r--    45084 config.prod.federationDesCae.json
-rw-r--r--   234459 config.prod.institut-bleu.json
-rw-r--r--    94651 config.prod.json
-rw-r--r--    26731 config.prod.julie-pot-vin.json
-rw-r--r--   202250 config.prod.maison-sport-sante-la-tampon.json
-rw-r--r--    23524 config.prod.nos-commune.json
-rw-r--r--   874496 config.prod.parent62.json
-rw-r--r--   158412 config.prod.relief.json
-rw-r--r--   133969 config.prod.rezo-la-mer.json
-rw-r--r--   279358 config.prod.rezo-sante-reunion.json
-rw-r--r--   261221 config.prod.saint-paul-sport.json
-rw-r--r--   388549 config.prod.sport-sante-bien-etre.json
-rw-r--r--   226845 config.prod.tiers-lieux.json
drwxr-xr-x  doc/
drwxr-xr-x  doc-projets/
-rw-r--r--     2783 docker-compose.yml
drwxr-xr-x  docs/
drwxr-xr-x  e2e/
-rw-r--r--     2897 eslint.config.js
-rw-r--r--     3844 index.html
-rw-r--r--      506 knip.json
-rw-r--r--   614379 package-lock.json
-rw-r--r--     7733 package.json
-rw-r--r--      655 playwright.config.ts
-rw-r--r--       70 postcss.config.js
drwxr-xr-x  public/
drwxr-xr-x  scripts/
drwxr-xr-x  server/
-rw-r--r--    21735 site-config.json
-rw-r--r--     5607 sites.json
drwxr-xr-x  src/
drwxr-xr-x  tests/
-rw-r--r--      758 tsconfig.app.json
-rw-r--r--      213 tsconfig.json
-rw-r--r--      479 tsconfig.node.json
-rw-r--r--    16560 vite.config.ts
-rw-r--r--      371 vitest.config.integration.ts
-rw-r--r--      311 vitest.config.ts
-rw-r--r--     1494 vitest.config.unit.ts
````

`doc/`, tous les fichiers avec leur taille en octets, triés par nom (`find doc -type f -printf '%p %s\n' | sort`) :

````
doc/01-introduction-installation.md 11350
doc/02-configuration.md 20284
doc/03-architecture.md 61970
doc/04-schema-principal.md 45166
doc/05-schemas-sections.md 128324
doc/06-sections-dynamiques.md 28864
doc/07-module-search.md 168264
doc/08-module-profil.md 87851
doc/09-module-news.md 39737
doc/10-permissions.md 17954
doc/11-api-authentification.md 41945
doc/12-performance.md 26017
doc/13-i18n.md 17847
doc/14-backend-ssr.md 47351
doc/15-tests.md 54658
doc/16-deploiement-docker.md 39136
doc/17-module-command-palette.md 55263
doc/18-module-cagnotte.md 61045
doc/19-visibility-system.md 17954
doc/20-module-interop.md 22457
doc/21-module-coform.md 94156
doc/22-module-ampli.md 30152
doc/23-module-auth.md 44761
doc/24-admin-panel.md 19897
doc/25-module-notification.md 14289
doc/26-assistant-config.md 32018
doc/27-module-observatoire.md 25886
doc/28-module-formengine.md 58432
doc/29-module-agenda.md 26705
doc/30-module-admin.md 40806
doc/31-rfc-assistant-config-costum.md 15960
doc/32-module-articles-blog.md 30356
doc/33-media-components.md 14988
doc/34-gardes-de-page.md 8849
doc/34-module-aac.md 74002
doc/35-rattachement-et-referencement.md 6326
doc/README.md 4280
doc/cartographie-fonctions/RAPPORT.md 4201
doc/cartographie-fonctions/functions.json 78159
doc/cartographie-forms-formalisme.md 68449
````

Deux autres dossiers de documentation existent à la racine, en plus de `doc/` : `docs/`, qui ne contient que `docs/CONFIG-SURFACE.md` (82 987 octets), et `doc-projets/`, qui contient 15 fichiers dont `doc-projets/federation-des-cae.md` (91 025 octets) et `doc-projets/tiers-lieux.md` (110 116 octets).

## Q1. site-json sait-il lire autre chose que l'API Communecter ?

### README de la racine (étape 6), recopié en entier : 122 lignes, sous le seuil de 300

````
    1  # POC SiteForge - Générateur de Sites JSON
    2  
    3  ## Présentation
    4  
    5  SiteForge est un générateur de sites web innovant qui transforme des configurations JSON simples en sites web modernes, performants, et entièrement personnalisables.
    6  
    7  ## Fonctionnalités principales
    8  
    9  * **Configuration JSON intuitive :** Définissez intégralement votre site grâce à un simple fichier JSON.
   10  * **Design moderne et adaptatif :** Composants UI avec support natif du responsive design, thèmes sombre/clair, et animations fluides.
   11  * **Multilingue natif :** Support automatique de plusieurs langues avec basculement selon les préférences utilisateur.
   12  * **Performances optimisées :** Lazy loading, optimisation automatique des images, et code splitting.
   13  * **Sécurité avancée :** Validation stricte des schémas, et sanitisation automatique du contenu.
   14  * **Architecture modulaire :** Ajoutez facilement de nouveaux composants et étendez les fonctionnalités selon vos besoins.
   15  
   16  ## Structure du projet
   17  
   18  ```
   19  scripts/              # Scripts utilitaires
   20  server/               # Serveurs de développement et production
   21  src/                  # Source de l'application
   22    components/         # Composants React réutilisables
   23    contexts/           # Contextes React pour la gestion d'état global
   24    data/               # Données et exemples JSON
   25    helpers/            # Fonctions utilitaires
   26    hooks/              # Hooks personnalisés React
   27    lib/                # Librairies et utilitaires généraux
   28    modules/            # Modules spécifiques (ex: recherche avancée)
   29    types/              # Déclarations TypeScript globales
   30    entry-client.tsx    # Entrée côté client
   31    entry-server.tsx    # Entrée côté serveur (SSR)
   32    RootLayout.tsx      # Composant racine
   33  ```
   34  
   35  ## 📖 Documentation
   36  
   37  Pour une documentation complète (installation, configuration, schémas JSON, SSR, modules, i18n, etc.), consultez :
   38  [doc/README.md](./doc/README.md)
   39  
   40  ---
   41  
   42  ## 🛠️ Installation
   43  
   44  ### Cloner le dépôt
   45  ```bash
   46  git clone https://gitlab.adullact.net/pixelhumain/site-json
   47  cd site-json
   48  ```
   49  
   50  ### Installer les dépendances
   51  ```bash
   52  npm install
   53  # ou yarn install
   54  ```
   55  
   56  Le client API `@communecter/cocolight-api-client` est déclaré dans `package.json` et installé automatiquement par la commande ci-dessus (aucun clone séparé n'est nécessaire).
   57  
   58  ### Créer le fichier `.env`
   59  
   60  Créez un fichier `.env` à la racine du projet (voir [Configuration](./doc/02-configuration.md) pour le détail des variables). Les lignes commentées (en grisé) donnent un exemple de configuration alternative : le serveur QA, qui sert de serveur de test, ainsi que le slug et le fichier de configuration de tiers-lieux.org.
   61  
   62  ```bash
   63  VITE_BASE_URL_BACKEND=http://localhost:3000
   64  # VITE_BASE_URL_BACKEND=https://qa.communecter.org
   65  VITE_SERVER_URL=http://localhost:3000
   66  # VITE_SERVER_URL=https://qa.communecter.org
   67  VITE_SLUG=default
   68  # VITE_SLUG=franceTierslieux
   69  VITE_MON_DOMAIN=monsite-exemple.com
   70  
   71  SITE_CONFIG_PATH=./config.prod.json
   72  # SITE_CONFIG_PATH=./config.prod.tiers-lieux.json
   73  ```
   74  
   75  ### Démarrer en mode développement
   76  ```bash
   77  npm run dev
   78  # ou yarn dev
   79  ```
   80  
   81  Ouvrez ensuite http://localhost:5173 pour naviguer sur le site.
   82  
   83  ## Commandes principales
   84  
   85  * **Développement local :**
   86  
   87  ```bash
   88  npm run dev
   89  ```
   90  
   91  * **Build pour production :**
   92  
   93  ```bash
   94  npm run build
   95  npm run build:ssr
   96  ```
   97  
   98  * **Prévisualisation du build :**
   99  
  100  ```bash
  101  npm run preview
  102  ```
  103  
  104  * **Lancement du serveur de production :**
  105  
  106  ```bash
  107  npm run start
  108  ```
  109  
  110  ## Personnalisation
  111  
  112  Configurez facilement votre site via les fichiers JSON dans `config.prod.json` ou en adaptant les exemples dans `src/data/demo-site.ts`.
  113  
  114  
  115  ## Contribution
  116  
  117  Nous accueillons volontiers vos contributions ! Veuillez créer une pull request sur GitHub ou signaler des problèmes via la section "Issues".
  118  
  119  ## Licence
  120  
  121  Ce projet est sous licence MIT. Consultez le fichier [LICENSE](LICENSE) pour plus de détails.
  122  
````

### Le client d'accès aux données

`package.json` déclare le client (`grep -n 'cocolight' package.json`) :

````
75:    "@communecter/cocolight-api-client": "^1.0.195",
````

`src/lib/apiClient.ts`, lignes 1 à 23 :

````
    1  /*
    2   * api-client.ts (TypeScript)
    3   * --------------------------------------------------
    4   * Wrapper typé autour du SDK JavaScript @communecter/cocolight-api-client.
    5   * Il utilise les déclarations situées dans
    6   *   src/@types/communecter__cocolight-api-client.d.ts
    7   * que nous avons ajoutées précédemment.  Toute nouvelle méthode que tu
    8   * appelles pourra être renseignée petit à petit dans ce fichier .d.ts.
    9   */
   10  
   11  import Cocolight, { type Api, type ApiClient, type Organization, type Project, type User, type UserApi } from "@communecter/cocolight-api-client";
   12  import { getBaseUrl, getSlug } from "./constant/common";
   13  import { applySiteCostum } from "./siteCostum";
   14  
   15  // ————————————————————————————————————————————————————————————
   16  // Types utilitaires — dérivés automatiquement depuis la lib JS
   17  // ————————————————————————————————————————————————————————————
   18  
   19  export interface InitApiOptions {
   20    baseURL?: string;
   21    /** Toute option supplémentaire fournie par le SDK */
   22    [key: string]: unknown;
   23  }
````

L'adresse du serveur vient d'une variable d'environnement, pas du fichier de configuration JSON. `src/lib/constant/common.ts`, ligne 49 :

````
   49  export const getBaseUrl  = () => readEnv("VITE_BASE_URL_BACKEND", "http://localhost:3000");
````

`src/RootLayout.tsx`, ligne 100 :

````
  100          <CocolightProvider clientOptions={{ baseURL: getBaseUrl(), costumForceLive: getCostumForceLive() }}>
````

`src/contexts/CocolightProvider.tsx`, lignes 1 à 35 :

````
    1  import Cocolight, { type Api, type Organization, type User, type Project } from "@communecter/cocolight-api-client";
    2  import { useEffect, useState, ReactNode, useMemo, useCallback } from "react";
    3  
    4  import { InitApiOptions } from "../lib/apiClient";
    5  import { getSlug } from "../lib/constant/common";
    6  import { applySiteCostum } from "../lib/siteCostum";
    7  import { CocolightContext } from "./CocolightContext";
    8  import { useCocolightInit } from "@/hooks/useCocolightInit";
    9  
   10  // ---------------------------------------------------------------------------
   11  // Types dérivés du SDK -------------------------------------------------------
   12  // ---------------------------------------------------------------------------
   13  
   14  export interface CocolightProviderProps {
   15    children: ReactNode;
   16    clientOptions?: InitApiOptions;
   17  }
   18  
   19  const DEFAULT_CLIENT_OPTIONS: InitApiOptions = Object.freeze({});
   20  
   21  export function CocolightProvider({
   22    children,
   23    clientOptions = DEFAULT_CLIENT_OPTIONS,
   24  }: CocolightProviderProps) {
   25  
   26      /* 1️⃣ — données initiales, déjà prêtes grâce à Suspense ---------------- */
   27    const {
   28      client, // ApiClient           (stable)
   29      userApiInstance, // UserApi             (stable)
   30      api: initialApi, // Api                 (mutable : login/logout)
   31      me: initialMe,
   32      contextType: initialContextType,
   33      contextId: initialContextId,
   34      entity: initialEntity,
   35    } = useCocolightInit(clientOptions);
````

`doc/03-architecture.md`, lignes 1130 à 1143 :

````
 1130  ### `src/lib/apiClient.ts` — client API Cocolight
 1131  
 1132  Wrapper typé autour du SDK `@communecter/cocolight-api-client`.
 1133  
 1134  **`initApi(options)` / `initApiClient(options)`** :
 1135  - **Serveur** : crée des instances fraîches à chaque appel (`storageType: "memory"`) — pas de singleton partagé entre requêtes
 1136  - **Client** : singleton via variables module-level — une seule initialisation, promise-cached pour éviter les init concurrentes
 1137  - Résolution du slug : `getSlug()` → `me.entityBySlug(slug)` (si connecté) ou `api.entitySlug(slug)` (anonymous)
 1138  - Hydratation SSR : si `window.__REACT_QUERY_STATE__` contient `cocolight-data` et que l'utilisateur n'est pas connecté, reconstruit l'entité depuis le JSON via `Cocolight.helper.fromEntityJSON()`
 1139  
 1140  **`resetApiState()`** : remet à zéro le singleton client (utilisé par `entry-server.tsx` pour garantir l'isolation entre requêtes SSR).
 1141  
 1142  **Helpers** : `getApiClient()`, `getUserApi()`, `getApi()` — initialisent si besoin et retournent les singletons typés.
 1143  
````

Une configuration de l'API mise en commentaire, `src/types/site-schema.ts`, lignes 48 à 52 :

````
   48  // export const CocolightConfig = z.object({
   49  //   baseUrl: z.string().url().default("http://localhost:5080"),
   50  //   debug: z.boolean().default(false),
   51  //   context: z.object({
   52  //     type: z.enum(["organizations", "projects"]).optional(),
````

### Couche d'accès aux données (étape 9)

Commande 1, appels réseau explicites :

````
cd ~/exploration-site-json/site-json && grep -rn -I -E 'fetch\(|axios|XMLHttpRequest' --include='*.ts' --include='*.tsx' --include='*.js' --include='*.mjs' --include='*.cjs' --exclude-dir=node_modules --exclude-dir=.git .
````

Elle donne 93 lignes, dont plusieurs sont des faux positifs : `refetch(`, mais aussi `fetchNextPage(`, qui contient `fetch(`.

Commande 2, chaînes qui commencent par `http://` ou `https://` :

````
cd ~/exploration-site-json/site-json && grep -rn -I -E '"https?://|'"'"'https?://|`https?://' --include='*.ts' --include='*.tsx' --include='*.js' --include='*.mjs' --include='*.cjs' --exclude-dir=node_modules --exclude-dir=.git .
````

Elle donne 610 lignes.

Les 100 premières lignes de résultat suivent : les 93 lignes de la commande 1, puis les 7 premières de la commande 2.

````
tests/integration/ssr-rendering.test.ts:23:    const res = await fetch(url, { signal: controller.signal });
tests/integration/ssr-completeness.test.ts:39:    const res = await fetch(url, { signal: controller.signal });
tests/integration/config-driven-ssr.test.ts:49:      const res = await fetch(url, { signal: controller.signal });
tests/integration/ssr-concurrency.test.ts:53:        const res = await fetch(getBaseUrl(), { signal: controller.signal });
tests/integration/ssr-concurrency.test.ts:71:      fetch(getBaseUrl()).then(async (res) => ({
tests/integration/ssr-concurrency.test.ts:90:      return fetch(`${getBaseUrl()}${route}`).then(async (res) => ({
tests/integration/ssr-concurrency.test.ts:108:      fetch(getBaseUrl()).then(async (res) => ({
tests/integration/ssr-concurrency.test.ts:135:      fetch(getBaseUrl()).then(async (res) => ({
tests/integration/ssr-concurrency.test.ts:139:      fetch(`${getBaseUrl()}${secondaryPath}`).then(async (res) => ({
tests/preflight/environment.test.ts:113:      const res = await fetch(backendUrl, { signal: controller.signal });
src/components/admin/AdminPanel.tsx:336:        const res = await fetch("/api/admin/config-save", {
src/components/admin/zod-auto-form/fields/ImageField.tsx:37:      const res = await fetch("/api/admin/upload-image", {
tests/helpers/global-setup.ts:22:    const res = await fetch(url, { signal: controller.signal });
tests/helpers/global-setup.ts:69:      const res = await fetch(BASE_URL);
src/hooks/useWebPush.ts:68:        const r = await fetch(`${base}/cle`);
src/hooks/useWebPush.ts:84:      const rc = await fetch(`${base}/cle`);
src/hooks/useWebPush.ts:99:      const r = await fetch(`${base}/abonnement`, {
src/hooks/useWebPush.ts:126:        await fetch(`${base}/abonnement`, {
src/components/sections/NewsletterSection.tsx:40:      const response = await fetch(formAction, {
src/hooks/useRealtimeTopics.ts:113:        const r = await fetch(chemin, {
src/lib/location/AddressEditor.tsx:101:        const res = await fetch(`https://data.geopf.fr/geocodage/search/?${params}`);
src/modules/toolsCatalog/utils/enrichmentResult.test.ts:36:    // Le 401 est normalement rompu par axios avant d'arriver ici. Si le serveur
src/modules/toolsCatalog/utils/enrichmentResult.test.ts:88:/** Les 3 réponses HTTP 200 que le serveur peut produire (les 401 sont rompus par axios). */
src/modules/admin/hooks/useValidateGroup.ts:36:      // Référencement, tuiles dashboard) — le refetch() du composant ne couvre que la clé active.
src/modules/toolsCatalog/utils/enrichmentResult.ts:33: * jusqu'ici : axios rejette les 4xx et la promesse de la lib est rompue avant.
src/modules/admin/sections/AdminReferenceSection.tsx:165:    void global.refetch();
src/modules/admin/sections/AdminReferenceSection.tsx:166:    void referenced.refetch();
src/modules/admin/sections/AdminResourceTable.tsx:348:  // Pas de refetch() dans les callbacks : les hooks invalident déjà par prédicat admin-* (queryKeys),
src/modules/admin/sections/AdminResourceTable.tsx:799:            if (!o) { setEditEntity(null); void refetch(); }
src/modules/admin/sections/AdminResourceTable.tsx:814:            if (!o) void refetch();
src/modules/admin/hooks/useReferenceElement.ts:189:      // Référencement, tuiles dashboard) — le refetch() du composant ne couvre que la clé active.
src/modules/admin/sections/AdminOwnershipMigrationSection.tsx:138:        onApplied={() => void history.refetch()}
src/modules/toolsCatalog/components/ToolsCatalog.tsx:281:              <Button type="button" variant="outline" size="sm" onClick={() => refetch()}>
src/modules/toolsCatalog/components/ToolsCatalog.tsx:315:                  onClick={() => (isFetchNextPageError ? fetchNextPage() : refetch())}
src/modules/search/SearchPro.tsx:185:            onClick={() => refetch()}
src/modules/ampli/constants/queryKeys.ts:16:   * Consommateurs invalidants : aucun explicite — refetch via `refetch()` ou
src/modules/search/components/FranceRegionsMap.tsx:162:    fetch("/france-regions.geojson")
src/modules/search/constants/queryKeys.ts:8: *   Sinon refetch via `refetch()` ou changement des params (qui change la
src/modules/search/components/preview/PreviewStructure.tsx:626:            if (!open) void fullEntity.refetch();
src/modules/search/SearchProStatic.tsx:562:            onClick={() => refetch()}
src/modules/aac/pages/AacCommunDetailPage.tsx:453:        await answerQuery.refetch();
src/modules/aac/pages/AacCommunDetailPage.tsx:489:        await answerQuery.refetch();
src/modules/aac/pages/AacCommunDetailPage.tsx:503:            answerQuery.refetch(),
src/modules/aac/pages/AacCommunDetailPage.tsx:565:                            await Promise.all([answerQuery.refetch(), refreshMe()]);
src/modules/aac/pages/AacCommunDetailPage.tsx:708:                        if (!ouvert) void answerQuery.refetch();
src/modules/aac/sections/AacDirectorySection.tsx:180:    void (isFetchNextPageError ? fetchNextPage() : refetch());
src/modules/blog/sections/ArticleTeaser.tsx:104:        <Button variant="outline" onClick={() => refetch()}>{t("feed.retry")}</Button>
src/modules/cagnotte/services/helloAssoVerification.ts:18:    const response = await fetch(
src/modules/cagnotte/components/sections/CreateMilestoneDialog.tsx:105:          if (onRefetch) await onRefetch();
src/modules/cagnotte/components/PiggyBankHeaderButton.tsx:56:  const refresh = async () => { await refetch(); };
src/modules/cagnotte/services/fundingEnvelopePayment.ts:5: * Raison : version "v1" qui faisait un `fetch("/co2/aap/fundingenvelope/")` HTTP brut.
src/modules/cagnotte/services/fundingEnvelopePayment.ts:82:  const response = await fetch(getFundingEnvelopeUrl(), {
src/modules/cagnotte/services/helloAssoCheckoutIntent.ts:71:    const response = await fetch("/api/helloasso/checkout-intent", {
src/modules/cagnotte/hooks/useProjectModalCagnotte.ts:258:    await refetch();
src/modules/cagnotte/services/helloAssoWebhook.ts:154:    // const response = await fetch(`https://api.helloasso.com/v5/payments/${transactionId}`, {
src/modules/profil/components/profile-edit/EditLocationTab.tsx:168:      const res = await fetch(url);
src/modules/blog/sections/ArticleFeed.tsx:55:        <Button variant="outline" onClick={() => refetch()}>{t("feed.retry")}</Button>
scripts/answer-facet-labels.mjs:93:    const r = await fetch(`${BACKEND}/survey/coform/getformbyid`, {
scripts/lib/coolify.ts:360:    res = await fetch(url, {
scripts/config-render.ts:268:    await fetch(`http://127.0.0.1:${port}/`, { signal: ctrl.signal });
scripts/config-render.ts:343:    const res = await fetch(url, { signal: ctrl.signal });
scripts/import-communes-territoires62.ts:60:      const response = await fetch(url, { headers: { "User-Agent": BROWSER_UA } });
scripts/lib/ovh.ts:78:  const r = await fetch(`${c.base}/auth/time`);
scripts/lib/ovh.ts:100:  const r = await fetch(url, {
scripts/contract-snapshot-live.mjs:33:  const r = await fetch(url, { method: "POST", headers: { "content-type": "application/x-www-form-urlencoded" }, body: body ?? "" });
e2e/global-setup.ts:14:      const res = await fetch(baseUrl, { signal: controller.signal });
e2e/auth-real.spec.ts:18:    const res = await fetch(BACKEND_URL, { signal: controller.signal });
e2e/parent62.spec.ts:50:    await fetch(base, { signal: controller.signal });
e2e/search.spec.ts:12:    const res = await fetch(BACKEND_URL, { signal: controller.signal });
e2e/profile.spec.ts:14:    const res = await fetch(BACKEND_URL, { signal: controller.signal });
server/__tests__/realtime.test.ts:114:  const r = await fetch(`${relais.url}/api/realtime/flux`, { headers: entetes, signal: abandon.signal });
server/__tests__/realtime.test.ts:129:    const r = await fetch(`${relais.url}/api/realtime/flux`, { headers: { authorization: "Bearer x" } });
server/__tests__/realtime.test.ts:142:    const r = await fetch(`${relais.url}/api/realtime/flux`);
server/__tests__/realtime.test.ts:169:    const r = await fetch(`${relais.url}/api/realtime/flux`, { headers: { authorization: "Bearer faux" } });
server/__tests__/realtime.test.ts:176:    const r = await fetch(`${relais.url}/api/realtime/flux`, { headers: { authorization: "Bearer x" } });
server/__tests__/realtime.test.ts:182:    const r = await fetch(`${relais.url}/api/realtime/flux`, { headers: { authorization: "Bearer x" } });
server/__tests__/realtime.test.ts:282:    const r = await fetch(`${relais.url}/api/realtime/flux`, { headers: { authorization: "Bearer périmé" } });
server/__tests__/realtime.test.ts:288:    const r = await fetch(`${relais.url}/api/realtime/flux`);
server/__tests__/realtime.test.ts:296:    const r = await fetch(`${relais.url}/api/realtime/push/cle`);
server/__tests__/realtime.test.ts:302:    const r = await fetch(`${relais.url}/api/realtime/push/abonnement`, {
server/__tests__/realtime.test.ts:313:    const r = await fetch(`${relais.url}/api/realtime/push/abonnement`, {
server/__tests__/realtime.test.ts:322:    const r = await fetch(`${relais.url}/api/realtime/push/refuse`, { method: "POST", headers: { "content-type": "application/json" }, body: "{}" });
server/__tests__/realtime.test.ts:328:    const r = await fetch(`${relais.url}/api/realtime/push/cle`);
server/__tests__/realtime.test.ts:339:    const r = await fetch(`${relais.url}/api/realtime/flux`, { headers: { authorization: "Bearer x" } });
server/__tests__/realtime.test.ts:346:    const r = await fetch(`${relais.url}/api/realtime/flux`, { headers: { authorization: "Bearer x" } });
server/api/realtime.js:78:    const r = await fetch(c.ticket, {
server/api/realtime.js:114:    amont = await fetch(c.hub, { headers: entetesAmont, signal: abandon.signal });
server/api/realtime.js:182:    const amont = await fetch(url, {
server/api/helloasso-checkout.js:151:        const response = await fetch(tokenUrl, {
server/api/helloasso-checkout.js:239:    const response = await fetch(
server/api/helloasso-checkout.js:297:  const response = await fetch(`${HELLOASSO_API_BASE}/checkout-intents/${checkoutIntentId}`, {
server/api/helloasso-checkout.js:573:      const r = await fetch(url, {
server/middleware/imageOptimizer.js:207:        const response = await fetch(sourceUrl, {
playwright.config.ts:13:    baseURL: "http://localhost:5173",
playwright.config.ts:25:    url: "http://localhost:5173",
tests/helpers/global-setup.ts:9:const BASE_URL = `http://localhost:${PORT}`;
tests/helpers/server-manager.ts:8:const BASE_URL = `http://localhost:${PORT}`;
src/components/admin/AdminPanel.tsx:730:              <Input value={item.href ?? ""} onChange={(e) => update({ href: e.target.value || undefined })} placeholder="https://example.com" />
src/components/layout/Seo.tsx:47:    ? "https://www.communecter.org" + (dataCostum?.logo as string || dataCostum?.bannerLogoUrl as string) || meta.favicon || ""
tests/integration/costum-forms.e2e.test.ts:54:const BACKEND = process.env.E2E_BACKEND ?? "http://127.0.0.1:5099";
````

Les répertoires où se trouvent les chaînes `http(s)://` (commande 2), 25 premiers, avec le nombre de lignes par répertoire :

````
    103 .design-sync/previews
     81 src/components/admin
     47 src/data
     38 src/modules/search/lib
     33 src/modules/profil/forms
     26 src/modules/toolsCatalog/utils
     25 src/modules/coform/utils
     18 src/lib
     16 src/modules/aac/lib
     15 src/modules/profil/components/sections/custom
     14 server/__tests__
     12 src/modules/search/hooks
     11 src/modules/profil/lib
     11 src/modules/profil/forms/costum/tiers-lieux
     11 src/modules/interop/hooks
     10 src/modules/auth/hooks/__tests__
     10 scripts/lib
      8 src/modules/search/components/preview
      8 scripts
      6 src/modules/admin/lib
      6 src/lib/__tests__
      6 src/components/sections
      5 src/modules/search/components/card/resource
      5 src/modules/coform/hooks
      5 src/modules/aac
````

Les données métier ne passent pas par `fetch` : elles passent par le client `@communecter/cocolight-api-client`. Les répertoires de `src/` et `server/` qui l'importent, 20 premiers, avec le nombre de fichiers par répertoire :

````
grep -rln -I 'cocolight-api-client' --exclude-dir=node_modules --exclude-dir=.git src server | xargs -n1 dirname | sort | uniq -c | sort -rn | head -20
     27 src/modules/profil/hooks
     19 src/modules/aac/hooks
     16 src/modules/profil/forms
     12 src/modules/search/hooks
     11 src/modules/search/components/card
      9 src/modules/search/components
      9 src/modules/cagnotte/hooks
      8 src/modules/toolsCatalog/components
      8 src/modules/news/hooks
      7 src/modules/profil/permissions/calculators
      7 src/modules/profil/actions/mutations
      7 src/modules/profil/actions/hooks
      7 src/modules/agenda/lib
      7 src/hooks
      5 src/modules/toolsCatalog/hooks
      5 src/modules/search/lib
      5 src/modules/search/components/preview
      5 src/modules/profil/components/members
      5 src/modules/news/components
      5 src/modules/coform/hooks
````

Au total, 359 fichiers de `src/` et `server/` importent ce client : `grep -rl -I 'cocolight-api-client' --exclude-dir=node_modules --exclude-dir=.git src server | wc -l` renvoie `359`.

### Notion d'adaptateur, de connecteur ou de source de données

Commande :

````
cd ~/exploration-site-json/site-json && grep -rn -I -i -E 'adapter|adaptateur|connector|connecteur|dataSource|data-source|datasource|source de donn' --exclude-dir=node_modules --exclude-dir=.git --exclude-dir=.design-sync src server doc docs README.md
````

Elle donne 129 lignes. J'ai lu les 60 premières. Aucune ne désigne une couche qui permettrait de brancher une autre source de données que Communecter. Ce que la recherche fait apparaître :

- `useCagnotteAdapter` (`src/modules/cagnotte/hooks/useCagnotteAdapter.ts`) : une mise en forme interne des données de la cagnotte ;
- `dataSourceToUse` (`src/modules/coform/types.ts:435`, `src/modules/coform/utils/categorizedCheckbox.ts:33-40`) : le choix, pour un champ de formulaire, entre des options saisies à la main (`manual`) et des options venues d'une table du serveur (`distanceOnly`) ;
- l'en-tête « Source de données » de `src/modules/toolsCatalog/schema.ts`, lignes 15 à 21, qui désigne un formulaire Communecter :

````
   15      // ── Source de données (requis) ────────────────────────────────────────
   16      /** Id du form de réponses (answers.form). */
   17      formId: z.string(),
   18      /** Champ `id` du form dont les `inputs` = catégories d'usage. */
   19      step: z.string(),
   20      /** Dot-path du lieu/CAE dans la réponse (ne compte que les réponses liées). */
   21      finderPath: z.string(),
````

Je n'ai trouvé aucun fichier qui montre une notion d'adaptateur, de connecteur ou de source de données configurable au sens de la question Q1. Ma recherche se limite aux mots-clés ci-dessus ; une abstraction nommée autrement lui aurait échappé.

## Q2. Que peut-on déclarer dans un fichier config.prod.*.json ?

### Fichiers config*.json de la racine, avec leur taille en octets

````
config.dev.acc.json 8587
config.dev.json 17973
config.prod.commune-transparente.json 22292
config.prod.cyber-reunion.json 80925
config.prod.eXtremeDefiAdeme.json 75972
config.prod.equipements-Sportifs-Scolaire.json 153247
config.prod.equipements-Sportifs.json 186969
config.prod.federationDesCae.json 45084
config.prod.institut-bleu.json 234459
config.prod.json 94651
config.prod.julie-pot-vin.json 26731
config.prod.maison-sport-sante-la-tampon.json 202250
config.prod.nos-commune.json 23524
config.prod.parent62.json 874496
config.prod.relief.json 158412
config.prod.rezo-la-mer.json 133969
config.prod.rezo-sante-reunion.json 279358
config.prod.saint-paul-sport.json 261221
config.prod.sport-sante-bien-etre.json 388549
config.prod.tiers-lieux.json 226845
````

### config.prod.federationDesCae.json

Le fichier compte 1113 lignes (`wc -l`), plus que le seuil de 300. Voici les 150 premières :

````
    1  {
    2    "version": "1.0.0",
    3    "meta": {
    4      "title": {
    5        "fr": "Fédération des CAE — Appel à Communs"
    6      },
    7      "description": {
    8        "fr": "La Fédération des coopératives d'activité et d'emploi recueille, présente, finance et suit les communs de son réseau via son Appel à Communs."
    9      },
   10      "defaultLang": "fr",
   11      "languages": [
   12        "fr"
   13      ],
   14      "keywords": [
   15        "CAE",
   16        "coopérative d'activité et d'emploi",
   17        "les SCOP",
   18        "appel à communs",
   19        "financement participatif"
   20      ]
   21    },
   22    "theme": {
   23      "colors": {
   24        "light": {
   25          "background": "oklch(1.0000 0 0)",
   26          "foreground": "oklch(0.2000 0 0)",
   27          "card": "oklch(1.0000 0 0)",
   28          "cardForeground": "oklch(0.2000 0 0)",
   29          "popover": "oklch(1.0000 0 0)",
   30          "popoverForeground": "oklch(0.2000 0 0)",
   31          "primary": "oklch(0.5800 0.2450 356)",
   32          "primaryForeground": "oklch(1.0000 0 0)",
   33          "secondary": "oklch(0.9600 0.0150 356)",
   34          "secondaryForeground": "oklch(0.3500 0.0500 356)",
   35          "muted": "oklch(0.9700 0 0)",
   36          "mutedForeground": "oklch(0.5500 0.0200 356)",
   37          "accent": "oklch(0.9400 0.0500 356)",
   38          "accentForeground": "oklch(0.4500 0.1800 356)",
   39          "destructive": "oklch(0.6368 0.2078 25.3313)",
   40          "destructiveForeground": "oklch(1.0000 0 0)",
   41          "border": "oklch(0.9200 0.0050 356)",
   42          "input": "oklch(0.9200 0.0050 356)",
   43          "ring": "oklch(0.5800 0.2450 356)",
   44          "chart1": "oklch(0.5800 0.2450 356)",
   45          "chart2": "oklch(0.6500 0.1900 20)",
   46          "chart3": "oklch(0.6200 0.1600 300)",
   47          "chart4": "oklch(0.7000 0.1500 60)",
   48          "chart5": "oklch(0.5500 0.1400 200)",
   49          "sidebar": "oklch(0.9800 0.0030 356)",
   50          "sidebarForeground": "oklch(0.2000 0 0)",
   51          "sidebarPrimary": "oklch(0.5800 0.2450 356)",
   52          "sidebarPrimaryForeground": "oklch(1.0000 0 0)",
   53          "sidebarAccent": "oklch(0.9400 0.0500 356)",
   54          "sidebarAccentForeground": "oklch(0.4500 0.1800 356)",
   55          "sidebarBorder": "oklch(0.9200 0.0050 356)",
   56          "sidebarRing": "oklch(0.5800 0.2450 356)"
   57        },
   58        "dark": {
   59          "background": "oklch(0.1800 0.0100 356)",
   60          "foreground": "oklch(0.9600 0.0050 356)",
   61          "card": "oklch(0.2200 0.0150 356)",
   62          "cardForeground": "oklch(0.9600 0.0050 356)",
   63          "popover": "oklch(0.2000 0.0150 356)",
   64          "popoverForeground": "oklch(0.9600 0.0050 356)",
   65          "primary": "oklch(0.6800 0.2200 356)",
   66          "primaryForeground": "oklch(0.1500 0.0200 356)",
   67          "secondary": "oklch(0.3000 0.0400 356)",
   68          "secondaryForeground": "oklch(0.9600 0.0050 356)",
   69          "muted": "oklch(0.2800 0.0200 356)",
   70          "mutedForeground": "oklch(0.7200 0.0300 356)",
   71          "accent": "oklch(0.4000 0.1000 356)",
   72          "accentForeground": "oklch(0.9600 0.0050 356)",
   73          "destructive": "oklch(0.6368 0.2078 25.3313)",
   74          "destructiveForeground": "oklch(1.0000 0 0)",
   75          "border": "oklch(0.3500 0.0300 356)",
   76          "input": "oklch(0.3000 0.0200 356)",
   77          "ring": "oklch(0.6800 0.2200 356)",
   78          "chart1": "oklch(0.6800 0.2200 356)",
   79          "chart2": "oklch(0.7000 0.1800 20)",
   80          "chart3": "oklch(0.6800 0.1500 300)",
   81          "chart4": "oklch(0.7500 0.1400 60)",
   82          "chart5": "oklch(0.6200 0.1300 200)",
   83          "sidebar": "oklch(0.2000 0.0150 356)",
   84          "sidebarForeground": "oklch(0.9600 0.0050 356)",
   85          "sidebarPrimary": "oklch(0.6800 0.2200 356)",
   86          "sidebarPrimaryForeground": "oklch(0.1500 0.0200 356)",
   87          "sidebarAccent": "oklch(0.4000 0.1000 356)",
   88          "sidebarAccentForeground": "oklch(0.9600 0.0050 356)",
   89          "sidebarBorder": "oklch(0.3500 0.0300 356)",
   90          "sidebarRing": "oklch(0.6800 0.2200 356)"
   91        }
   92      },
   93      "typography": {
   94        "fontFamily": {
   95          "sans": [
   96            "Inter"
   97          ],
   98          "serif": [
   99            "Roboto Slab"
  100          ],
  101          "mono": [
  102            "Roboto Mono"
  103          ]
  104        },
  105        "letterSpacing": "0em"
  106      },
  107      "spacing": {
  108        "base": "0.25rem"
  109      },
  110      "borderRadius": {
  111        "base": "0.5rem"
  112      },
  113      "shadows": {
  114        "light": {
  115          "shadow2xs": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.13)",
  116          "shadowXs": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.13)",
  117          "shadowSm": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.25), 0px 1px 2px -1px hsl(0.00 0.00% 0.00% / 0.25)",
  118          "shadow": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.25), 0px 1px 2px -1px hsl(0.00 0.00% 0.00% / 0.25)",
  119          "shadowMd": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.25), 0px 2px 4px -1px hsl(0.00 0.00% 0.00% / 0.25)",
  120          "shadowLg": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.25), 0px 4px 6px -1px hsl(0.00 0.00% 0.00% / 0.25)",
  121          "shadowXl": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.25), 0px 8px 10px -1px hsl(0.00 0.00% 0.00% / 0.25)",
  122          "shadow2xl": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.63)"
  123        },
  124        "dark": {
  125          "shadow2xs": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.13)",
  126          "shadowXs": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.13)",
  127          "shadowSm": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.25), 0px 1px 2px -1px hsl(0.00 0.00% 0.00% / 0.25)",
  128          "shadow": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.25), 0px 1px 2px -1px hsl(0.00 0.00% 0.00% / 0.25)",
  129          "shadowMd": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.25), 0px 2px 4px -1px hsl(0.00 0.00% 0.00% / 0.25)",
  130          "shadowLg": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.25), 0px 4px 6px -1px hsl(0.00 0.00% 0.00% / 0.25)",
  131          "shadowXl": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.25), 0px 8px 10px -1px hsl(0.00 0.00% 0.00% / 0.25)",
  132          "shadow2xl": "0px 1px 4px 0px hsl(0.00 0.00% 0.00% / 0.63)"
  133        }
  134      },
  135      "customCSS": "/* Bande des searchHeader : charte du site plutôt que le turquoise de index-rezo-la-mer.css (feuille partagée). Mélangée au fond pour suivre le mode. */\n:root:root { --gradient-section: linear-gradient(135deg, color-mix(in oklab, var(--primary) 10%, var(--background)), color-mix(in oklab, var(--accent) 60%, var(--background))); }\n"
  136    },
  137    "aac": {
  138      "formId": "677e7e389058e31575550ac8",
  139      "directory": {
  140        "fields": {
  141          "description": "answers.aapStep1.aapStep1lzi62x3etw49gyc424d",
  142          "tags": "answers.aapStep1.aapStep1m03ot9qymmfgashp7l",
  143          "maturity": "answers.aapStep1.aapStep1m2ucu54mopm33osqxpd",
  144          "users": "links.cae",
  145          "choose": "answers.aapStep2.choose"
  146        }
  147      },
  148      "detail": {
  149        "gallery": "aapStep1.image",
  150        "usageFormId": "6525865cdeaf281bbc7280e9",
````

Les clés de premier et de deuxième niveau, relevées par `json.load` en Python :

````
version: [str len=5]
meta: title, description, defaultLang, languages, keywords
theme: colors, typography, spacing, borderRadius, shadows, customCSS
aac: formId, directory, detail
cagnotteModuleConfig: defaultType
header: type, logoTitle, nav, utilities, logo, logoSize, height
pages: [list len=6]
footer: type, logo, logoAlt, logoTitle, description, copyright, extra, columns
profiles: default, organizations, projects
````

Nombre exact de lignes : 1113.

### Le schéma qui valide ces fichiers

`src/types/site-schema.ts`, lignes 2342 à 2435 : liste complète des clés de premier niveau admises.

````
 2342  export const SiteConfig = z.object({
 2343    version: z.string().optional(),
 2344    generated: z.string().optional(), // ISO timestamp
 2345    meta: z.object({
 2346      title: LocalizedString,
 2347      description: LocalizedString.optional(),
 2348      defaultLang: z.enum(LOCALES).default("fr"),
 2349      languages: z.array(z.enum(LOCALES)).default([...LOCALES]),
 2350      favicon: z.string().optional(),
 2351      ogImage: z.string().optional(), // image Open Graph par défaut du site (les pages surchargent via seo.ogImage)
 2352      themeColor: z.string().optional(),
 2353      author: LocalizedString.optional(),
 2354      keywords: z.array(z.string()).optional(),
 2355      robots: z.string().optional(),
 2356    }),
 2357    header: Header,
 2358    pages: z
 2359      .array(Page)
 2360      .check((ctx) => {
 2361        // On extrait tous les chemins
 2362        const paths = ctx.value.map((p) => p.path);
 2363        // Si doublon, on pousse une issue
 2364        if (new Set(paths).size !== paths.length) {
 2365          ctx.issues.push({
 2366            code: "custom",           // code littéral, comme préconisé
 2367            message: "Chaque page doit avoir un path unique.",
 2368            input: ctx.value,         // l’entrée invalidée (le tableau complet)
 2369          });
 2370        }
 2371      }),
 2372    footer: Footer,
 2373    integrations: Integrations.optional(),
 2374    features: z.array(FeatureFlag).optional(),
 2375    theme: ThemeConfig.optional(),
 2376    performance: PerformanceConfig.optional(),
 2377    redirects: z.array(z.object({
 2378      from: z.string(),
 2379      to: z.string(),
 2380      permanent: z.boolean().default(false),
 2381    })).optional(),
 2382    customDomains: z.array(z.string()).optional(),
 2383    maintenance: z.object({
 2384      enabled: z.boolean().default(false),
 2385      message: LocalizedString.optional(),
 2386      allowedIPs: z.array(z.string()).optional(),
 2387    }).optional(),
 2388    auth: AuthConfigSchema.optional(),
 2389    // Contexte costum du déploiement. Le SLUG du costum vient de l'entité porteuse
 2390    // (useCocolight().entity = VITE_SLUG, constant) ; costumId/costumType viennent du registry de la lib
 2391    // via `me.costum(slug)`. Ce bloc ne sert donc plus qu'aux TAGS observatoire (mainTag/compagnon).
 2392    costum: z.object({
 2393      mainTag: z.string().optional(),
 2394      compagnon: z.string().optional(),
 2395    }).optional(),
 2396    // Modales costum déclarées EN DONNÉES (document fusionné `CostumFormSchema` par id). Compilées au boot
 2397    // (`registerCostumForm`) en descriptor+spec → résolues par `add-/edit-<id>` via la table runtime, SANS code.
 2398    // zod permissif (record) : la structure est validée par le compilateur/registre (durcissement zod = à part).
 2399    costumForms: z.record(z.string(), z.unknown()).optional(),
 2400    profiles: ProfilesConfigSchema,
 2401    floatingQRCode: z.object({
 2402      enabled: z.boolean().default(false),
 2403      url: z.string().optional(),
 2404      position: z.enum(["bottom-right", "bottom-left", "top-right", "top-left"]).default("bottom-right"),
 2405      size: z.number().optional().default(80),
 2406      expandedSize: z.number().optional().default(200),
 2407      includeFavicon: z.boolean().optional().default(true),
 2408      bgColor: z.string().optional().default("#ffffff"),
 2409      fgColor: z.string().optional().default("#000000"),
 2410    }).optional(),
 2411    floatingActionButton: z.object({
 2412      enabled: z.boolean().default(false),
 2413      // Modale à ouvrir. Entités standard + `add-<id>` d'un costum (résolu par la table runtime costumFormRegistry,
 2414      // qu'il soit déclaré en TS ou dans `config.costumForms`). Ouvert en string (ex-enum fermé) pour les costums de config.
 2415      modal: z.string(),
 2416      label: LocalizedString,
 2417      icon: z.string().optional().default("plus"),
 2418      position: z.enum(["bottom-right", "bottom-left", "top-right", "top-left"]).default("bottom-right"),
 2419      condition: VisibilityConditionSchema,
 2420    }).optional(),
 2421    ampli: z.array(AmpliConfigSchema).optional(),
 2422    // Config site-level de l'Appel à Communs — SINGULIER (un seul AAC par site,
 2423    // contrairement à `ampli` qui est un tableau). Le site déclare son `formId` ;
 2424    // les sections `aac-directory`/`aac-highlight` et les routes `/aac` le lisent
 2425    // depuis ici (les routes ne sont montées que si ce bloc existe). cf. modules/aac.
 2426    aac: AacConfigSchema.optional(),
 2427    commandPalette: CommandPaletteConfigSchema.optional(),
 2428    // Config site-level du blog : défauts des variants extensibles (card/reader/feedLayout). cf. modules/blog.
 2429    blog: BlogConfigSchema.optional(),
 2430    // Page d'Administration (config-driven, jumeau du module profil). Onglets/sections/accès déclarés en
 2431    // données. Absent → pas de page admin. cf. modules/admin + commentaire/plan-module-admin-generique.md
 2432    admin: AdminConfigSchema.optional(),
 2433    cagnotteModuleConfig: CagnotteModuleConfig.optional(),
 2434  });
 2435  export type SiteConfig = z.infer<typeof SiteConfig>;
````

Aucune de ces clés ne désigne l'adresse d'un serveur ou une source de données. La commande `grep -n -i -E 'baseurl|backend|apiurl|endpoint' src/types/site-schema.ts` ne renvoie que deux lignes : la ligne 49, qui est en commentaire (extrait sous Q1), et la ligne 454, `mediaBaseUrl: z.string().optional(),`.

### La documentation des fichiers de configuration

`doc/02-configuration.md`, lignes 151 à 206 :

````
  151  ## Fichiers JSON de configuration
  152  
  153  ### Fichiers disponibles
  154  
  155  Les fichiers `config.prod.*.json` présents à la racine du dépôt :
  156  
  157  | Fichier | Description |
  158  | ------- | ----------- |
  159  | `config.prod.json` | Config de production par défaut |
  160  | `config.prod.tiers-lieux.json` | Navigator des Tiers-Lieux |
  161  | `config.prod.rezo-la-mer.json` | Rezo la Mer |
  162  | `config.prod.cyber-reunion.json` | Cyber Réunion (aussi utilisée par le slug `cocolight`) |
  163  | `config.prod.sport-sante-bien-etre.json` | Sport Santé Bien-Être |
  164  | `config.prod.nos-commune.json` | Nos Communes |
  165  | `config.prod.commune-transparente.json` | Commune Transparente (partagée par plusieurs slugs communes) |
  166  | `config.prod.julie-pot-vin.json` | Julie Pot Vin |
  167  | `config.prod.institut-bleu.json` | Institut Bleu |
  168  | `config.prod.equipements-Sportifs.json` | Équipements Sportifs 974 |
  169  | `config.prod.eXtremeDefiAdeme.json` | eXtrème Défi Ademe |
  170  | `config.dev.json` | Config de développement |
  171  | `site-config.json` | Config alternative |
  172  
  173  ### Structure d'un fichier config
  174  
  175  Tous les fichiers doivent être conformes au `SiteConfigSchema` défini dans `src/types/site-schema.ts` et validé par Zod :
  176  
  177  ```json
  178  {
  179    "meta": {
  180      "title": { "fr": "SiteForge", "en": "SiteForge" },
  181      "description": { "fr": "Générateur JSON", "en": "JSON Site Generator" }
  182    },
  183    "header": {
  184      "nav": [ /* … */ ],
  185      "logoSize": "sm",
  186      "utilities": { "themeSwitch": true, "auth": true, "piggyBank": false }
  187    },
  188    "pages": [
  189      {
  190        "path": "/",
  191        "title": { "fr": "Accueil", "en": "Home" },
  192        "sections": [
  193          {
  194            "type": "hero",
  195            "props": {
  196              "headline": { "fr": "Bienvenue", "en": "Welcome" },
  197              "cta": [ /* … */ ]
  198            }
  199          }
  200          /* … */
  201        ]
  202      }
  203      /* … */
  204    ]
  205  }
  206  ```
````

`docs/CONFIG-SURFACE.md`, lignes 1 à 8 : un relevé, généré par un outil, des clés employées site par site. Il compte 1067 lignes.

````
    1  # Surface des configs — clé → sites exposés
    2  
    3  Généré par `npm run config:surface -- --write` (CI : `--check`). NE PAS éditer à la main.
    4  Usage : avant de modifier la sémantique d'une clé ou son consommateur,
    5  `npm run config:surface -- --key <nom>` donne les chemins complets par site.
    6  
    7  13 configs scannées : commune-transparente, cyber-reunion, eXtremeDefiAdeme, equipements-Sportifs, institut-bleu, julie-pot-vin, nos-commune, parent62, rezo-la-mer, rezo-sante-reunion, saint-paul-sport, sport-sante-bien-etre, tiers-lieux.
    8  
````

## Q3. Comment l'onglet « Wiki » d'une page de profil est-il alimenté ?

### Où se trouvent les adresses du wiki

Elles ne viennent pas du fichier `config.prod.*.json`. Elles viennent de l'objet « costum » renvoyé par le serveur Communecter pour l'entité porteuse du site. `src/modules/interop/hooks/useInteropConfigQuery.tsx`, en entier :

````
    1  import { useCocolight } from "@/hooks/useCocolight";
    2  
    3  export function useInteropConfig() {
    4    const { entity } = useCocolight();
    5    const costum = entity?.serverData?.costum as
    6      | Record<string, unknown>
    7      | undefined;
    8    const cfg = costum?.interop as Record<string, string> | undefined;
    9    return {
   10      discourseUrl: cfg?.DISCOURSE_URL ?? null,
   11      wikiBaseUrl: cfg?.WIKI_BASE_URL ?? null,
   12      wikiApiUrl: cfg?.WIKI_API_URL ?? null,
   13      costumSlug: (entity?.serverData.slug as string) ?? null,
   14      hasDiscourse: !!cfg?.DISCOURSE_URL,
   15      hasWiki: !!cfg?.WIKI_BASE_URL,
   16    };
   17  }
````

`wikiApiUrl` n'a qu'une occurrence hors des tests, sa déclaration ci-dessus : `grep -rn -I 'wikiApiUrl\|WIKI_API_URL' --exclude-dir=node_modules --exclude-dir=.git src | grep -v '\.test\.'` ne renvoie que `src/modules/interop/hooks/useInteropConfigQuery.tsx:12`.

Le nom de compte wiki lié à un profil, `src/modules/interop/hooks/useUserInteropLinks.tsx`, lignes 7 à 30 :

````
    7  export function useInteropUserLinks() {
    8    const { entity } = useProfileEntity();
    9    const { me } = useCocolight();
   10    const { costumSlug } = useInteropConfig();
   11    const interop = entity ?  entity?.serverData?.interop as InteropData | undefined : me?.serverData?.interop as InteropData | undefined;
   12  
   13    const discourseVal = costumSlug
   14      ? (interop?.discourse?.[costumSlug] as string | false | undefined)
   15      : undefined;
   16  
   17    const wikiVal = costumSlug
   18      ? (interop?.mediawiki?.[costumSlug] as string | undefined)
   19      : undefined;
   20  
   21    // Guard contre `undefined === undefined === true` (cas user déconnecté + entité absente).
   22    const isOwnProfile = Boolean(me?.slug && entity?.slug && me.slug === entity.slug);
   23  
   24    return {
   25      /** Username Discourse lié ou undefined */
   26      discourseUsername:
   27        typeof discourseVal === "string" ? discourseVal : undefined,
   28      isDiscourseLinked: typeof discourseVal === "string",
   29      isDiscourseDismissed: discourseVal === false,
   30      wikiUsername: wikiVal,
````

### L'appel qui ramène les contributions

Il passe par une méthode de l'entité, fournie par le serveur Cocolight, et non par un appel direct à `api.php`. `src/modules/interop/hooks/_interopEntity.ts`, lignes 1 à 13 puis 50 à 96 :

````
    1  /**
    2   * Augmentation locale des entités SDK avec les méthodes interop.
    3   *
    4   * Le SDK `@communecter/cocolight-api-client` ne types pas encore ces méthodes
    5   * runtime ajoutées par le backend Cocolight (link/unlink Discourse/MediaWiki,
    6   * getDiscourseProfile, getMediaWikiContributions, etc.).
    7   *
    8   * Ce module concentre **tous les casts SDK interop** en un seul endroit, à la place
    9   * des 8+ casts disséminés dans les 4 hooks interop. Quand le SDK exposera ces
   10   * méthodes nativement, supprimer ce fichier et utiliser directement `EntityTypes`.
   11   *
   12   * @todo Demander au mainteneur SDK d'exposer ces méthodes (cf. AUDIT-cocolight-api-client.md).
   13   */
````

````
   50  export type MediawikiResult = {
   51    result: boolean;
   52    error?: string;
   53    username?: string;
   54    msg?: string;
   55  };
   56  
   57  export interface WikiContrib {
   58    title?: string;
   59    timestamp?: string;
   60    comment?: string;
   61    revid?: number;
   62    [k: string]: unknown;
   63  }
   64  
   65  export type MediawikiContribsResult = {
   66    result: boolean;
   67    contribs?: WikiContrib[] | Record<string, unknown> | null;
   68    [k: string]: unknown;
   69  };
   70  
   71  // ============================================================================
   72  // Augmentation locale — Entity avec méthodes interop runtime
   73  // ============================================================================
   74  
   75  /**
   76   * Type intersection — `EntityTypes` SDK + les méthodes interop ajoutées côté backend.
   77   *
   78   * @internal Usage interne au module `interop`. Ne pas exporter en dehors.
   79   */
   80  export type EntityWithInterop = EntityTypes & {
   81    // Mutations Discourse
   82    linkDiscourseAccount(username: string): Promise<DiscourseLinkResult>;
   83    unlinkDiscourseAccount(): Promise<DiscourseSimpleResult>;
   84    checkDiscourseEmailMatch(): Promise<DiscourseCheckEmailResult>;
   85    dismissDiscourseLink(): Promise<DiscourseSimpleResult>;
   86    // Query Discourse
   87    getDiscourseProfile(username: string): Promise<DiscourseProfilResult>;
   88    // Mutations MediaWiki
   89    linkMediaWikiAccount(username: string): Promise<MediawikiResult>;
   90    unlinkMediaWikiAccount(): Promise<MediawikiResult>;
   91    // Query MediaWiki
   92    getMediaWikiContributions(
   93      username: string,
   94      limit?: number,
   95    ): Promise<MediawikiContribsResult>;
   96  };
````

`src/modules/interop/hooks/useMediawikiContribs.tsx`, lignes 15 à 26 :

````
   15  export function useMediawikiContribsQuery(limit = 10) {
   16    const { entity } = useCocolight();
   17    const { hasWiki } = useInteropConfig();
   18    const { wikiUsername, isWikiLinked } = useInteropUserLinks();
   19  
   20    return useQuery<MediawikiContribsResult>({
   21      queryKey: INTEROP_QUERY_KEYS.MEDIAWIKI_CONTRIBS(entity?.id ?? null, wikiUsername ?? null),
   22      queryFn: async () => {
   23        if (!entity || !wikiUsername) {
   24          throw new Error("MediaWiki contributions query enabled without entity/username");
   25        }
   26        return asInteropEntity(entity).getMediaWikiContributions(wikiUsername, limit);
````

La liaison du compte, `src/modules/interop/hooks/useInteropMutation.ts`, lignes 134 à 152 :

````
  134  // MEDIAWIKI
  135  // ============================================================================
  136  
  137  export const useMediawikiLink = createInteropMutation<string, MediawikiResult>({
  138    action: (entity, username) => entity.linkMediaWikiAccount(username),
  139    i18n: {
  140      successKey: "toasts.mediawiki.linkSuccess",
  141      errorKey: "toasts.mediawiki.linkError",
  142    },
  143    invalidate: [INTEROP_QUERY_KEYS.MEDIAWIKI_CONTRIBS_PREFIX()],
  144  });
  145  
  146  export const useMediawikiUnlink = createInteropMutation<void, MediawikiResult>({
  147    action: (entity) => entity.unlinkMediaWikiAccount(),
  148    i18n: {
  149      successKey: "toasts.mediawiki.unlinkSuccess",
  150      errorKey: "toasts.mediawiki.unlinkError",
  151    },
  152    invalidate: [INTEROP_QUERY_KEYS.MEDIAWIKI_CONTRIBS_PREFIX()],
````

### Les adresses construites côté navigateur

`src/modules/interop/components/MediawikiPod.tsx`, lignes 16 à 28 puis 70 à 80 :

````
   16  const MediawikiPod = () => {
   17    const t = useT("modules/interop");
   18    const { wikiBaseUrl } = useInteropConfig();
   19    const { wikiUsername, isOwnProfile } = useInteropUserLinks();
   20    const { data, isLoading } = useMediawikiContribsQuery(10);
   21    const unlinkMutation = useMediawikiUnlink();
   22  
   23    const contribs = asContribList(data?.contribs);
   24  
   25    const userPageUrl =
   26      wikiBaseUrl && wikiUsername
   27        ? `${wikiBaseUrl}/wiki/User:${encodeURIComponent(wikiUsername)}`
   28        : null;
````

````
   70          <div>
   71            <div className="flex items-center justify-between mb-2">
   72              <h3 className="text-xs font-bold uppercase tracking-widest text-muted-foreground">
   73                {t("wiki.latest_contributions")}
   74              </h3>
   75              {userPageUrl && (
   76                <a
   77                  href={`${wikiBaseUrl}/wiki/Special:Contributions/${encodeURIComponent(wikiUsername!)}`}
   78                  target="_blank"
   79                  rel="noopener noreferrer"
   80                  className="text-xs text-primary hover:underline whitespace-nowrap"
````

`src/modules/interop/components/MediawikiLink.tsx`, lignes 36 et 37 :

````
   36    const exampleUrl = wikiBaseUrl
   37      ? `${wikiBaseUrl}/wiki/Special:Contributions/`
````

### Où la section est affichée

`src/modules/interop/MediawikiSection.tsx`, en entier :

````
    1  import { lazy } from "vite-preload";
    2  import { useInteropUserLinks } from "./hooks/useUserInteropLinks";
    3  
    4  const MediawikiPod = lazy(() => import("./components/MediawikiPod"));
    5  const MediawikiLink = lazy(() => import("./components/MediawikiLink"));
    6  
    7  const MediawikiSection = () => {
    8    const { isWikiLinked, isOwnProfile } = useInteropUserLinks();
    9  
   10    if (!isWikiLinked && !isOwnProfile) return null;
   11  
   12    return (
   13      <>
   14        {isWikiLinked ? <MediawikiPod /> : <MediawikiLink />}
   15      </>
   16    );
   17  };
   18  
   19  export default MediawikiSection;
````

`src/modules/profil/components/sections/ProfileAbout.tsx`, lignes 13 à 19 puis 56 à 69 :

````
   13  const DiscourseSection = lazy(() => import("@/modules/interop/DiscourseSection"));
   14  const MediawikiSection = lazy(() => import("@/modules/interop/MediawikiSection"));
   15  
   16  export default function ProfileAbout({ section }: ProfileAboutProps) {
   17    const { entity, t } = useProfileSetup();
   18    const { shortDescription, description } = useFormatProfileEntity(entity);
   19    const { hasDiscourse, hasWiki } = useInteropConfig();
````

````
   56        {(entity.getEntityType() === "citoyens") && (
   57          <>
   58            {hasWiki && (
   59              <div className="mb-6">
   60                <MediawikiSection />
   61              </div>
   62            )}
   63            {hasDiscourse && (
   64              <div className="mb-6">
   65                <DiscourseSection />
   66              </div>
   67            )}
   68          </>
   69        )}
````

### L'onglet « Wiki » selon la documentation

`doc/20-module-interop.md`, lignes 76 à 91 puis 403 à 431 :

````
   76  
   77  ```ts
   78  import { useInteropConfig } from "@/modules/interop";
   79  
   80  function MyComponent() {
   81    const {
   82      discourseUrl,     // string | null  — URL du forum Discourse (DISCOURSE_URL)
   83      wikiBaseUrl,      // string | null  — URL base du wiki (WIKI_BASE_URL)
   84      wikiApiUrl,       // string | null  — URL de l'API Mediawiki (WIKI_API_URL)
   85      costumSlug,       // string | null  — slug de l'entité courante (entity.serverData.slug)
   86      hasDiscourse,     // boolean — true si DISCOURSE_URL est défini et non vide
   87      hasWiki,          // boolean — true si WIKI_BASE_URL est défini et non vide
   88    } = useInteropConfig();
   89  }
   90  ```
   91  
````

````
  403  ## Intégration dans les profils
  404  
  405  Les sections Discourse et Mediawiki peuvent être ajoutées comme onglets de profil dans la config JSON :
  406  
  407  ```json
  408  {
  409    "profiles": {
  410      "organizations": {
  411        "tabs": [
  412          { "id": "about", "label": { "fr": "À propos" } },
  413          {
  414            "id": "discourse",
  415            "label": { "fr": "Forum" },
  416            "component": "DiscourseSection"
  417          },
  418          {
  419            "id": "wiki",
  420            "label": { "fr": "Wiki" },
  421            "component": "MediawikiSection"
  422          }
  423        ]
  424      }
  425    }
  426  }
  427  ```
  428  
  429  `DiscourseSection` et `MediawikiSection` sont des sections profil qui lazy-chargent leurs sous-composants (pod + formulaire de liaison). Elles ne s'affichent que si la config interop du costum est active.
  430  
  431  L'intégration dans `ProfileAbout.tsx` utilise également `useInteropConfig` pour conditionner l'affichage des onglets Discourse/Wiki :
````

Aucun des trois fichiers de configuration demandés ne déclare d'onglet nommé « Wiki ». La commande `grep -n -i -E '"wiki"|MediawikiSection|"Wiki"' config*.json site-config.json sites.json` ne renvoie rien. Avec `grep -n -i 'wiki' config.prod.tiers-lieux.json config.prod.eXtremeDefiAdeme.json config.prod.federationDesCae.json`, les seules correspondances sont des liens « Wiki Movilab » dans `config.prod.tiers-lieux.json`, lignes 177-178, 841-842, 1032-1033 et 1043-1044, plus une ligne de mentions légales (2534-2535). Elles figurent dans les résultats de Q4.

## Q4. Traces de MediaWiki ou de Semantic MediaWiki

Commande lancée à la racine du clone :

````
cd ~/exploration-site-json/site-json && grep -rn -i -I -E 'mediawiki|api\.php|semantic|smw|wikibase|movilab|fabmob' --exclude-dir=node_modules --exclude-dir=.git .
````

Elle donne 175 lignes, plus que le seuil de 150. Les 150 premières suivent, telles que `grep` les a sorties, sans tri. Deux lignes de `package-lock.json` (7895 et 13868) sont des faux positifs : des empreintes `sha512` qui contiennent par hasard une des chaînes cherchées.

````
doc-projets/relief.md:79:   chat, wiki Movilab, notes, visio, fichiers) et `/usages` (catalogue `toolsCatalog` sur le
config.prod.relief.json:123:              "fr": "Wiki Movilab",
config.prod.relief.json:124:              "en": "Wiki Movilab"
config.prod.relief.json:130:            "path": "https://movilab.org/"
config.prod.relief.json:648:                  "fr": "Via le Wiki Movilab",
config.prod.relief.json:649:                  "en": "Via the Movilab Wiki"
config.prod.relief.json:651:                "href": "https://movilab.org/"
config.prod.relief.json:836:                  "fr": "Le Wiki Movilab",
config.prod.relief.json:837:                  "en": "The Movilab Wiki"
config.prod.relief.json:839:                "href": "https://movilab.org/"
package-lock.json:7895:      "integrity": "sha512-fmTRWbNMmsmWq6xJV8D19U/gw/bwrHfNXxrIN+HfZgnzqTHp9jOmKMhsTUjXOJnZOdZY9Q28y4yebKzqDKlxlQ==",
package-lock.json:13868:      "integrity": "sha512-jTHb8ZtQHd2VWAAKeCINgv/8zNEF0+LesmwJak69GemoPVN9/8fGEARTvqOpKqmN57HwaM9z8UKBVNVJe8zggw==",
doc-projets/parent62.md:3934:| 2.1 | Module actualités + interop WordPress | ✅ / 🟡 interop | 6 434 articles, `/blog`, `/actualites`, 9 `/theme/*`, admin, RSS, ⌘K. **Interop WP = import batch one-shot** (`tools/wp-migration/`), pas de sync live/webhook ; « ajout de post » = form `parent62-article` admin (le module `interop/` = Discourse/Mediawiki, pas WP). **06/08** : 2 pages de contenu tagué ajoutées sur le même patron, `/appels-a-projets` et `/offres-emploi` (`articleFeed` filtré par tag WordPress libre, zéro impact backend, §9quater). **02/09** : champ **« Type d'actualité »** (`category` : Article simple / Appel à projets / Offre d'emploi) dans le formulaire d'ajout d'article, avec un `mutation.stamps` `$mapLabels` qui pose le mot-clé public à la création ET à l'édition, + 2 onglets `/admin` filtrés par `defaultTags` (§9sexdecies). **09/09** : boutons **Modifier / Supprimer** sur la fiche `/blog/:slug`, gardés par `canEditProfile` (admin du costum ou auteur) et réutilisant la modale `edit-parent62-article` déjà en place — hérité par les **4 sites** déclarant une page `/blog`, à charge pour eux de router leur propre `editModals` (§9sexvicies.2). **17/09** : types **« À la une »** et **« Zoom sur le réseau »**, type en **choix multiple** ; le mot-clé suit désormais le type (codecs à la place du stamp) ; section d'accueil « Zoom sur le réseau » filtrée sur `Zoom` ; territoires/publics/thèmes facultatifs (§9octovicies.3-4). **22/09** : filtre **« Villes »** sur `/blog` (33 villes du survol des territoires, **23/09** : sur la ville de l'adresse) et champ adresse du formulaire (§9octotricies.1, §9novotricies) |
config.prod.tiers-lieux.json:177:              "fr": "Wiki Movilab",
config.prod.tiers-lieux.json:178:              "en": "Wiki Movilab"
config.prod.tiers-lieux.json:184:            "path": "https://movilab.org/"
config.prod.tiers-lieux.json:841:                  "fr": "Via le Wiki Movilab",
config.prod.tiers-lieux.json:842:                  "en": "Via the Movilab Wiki"
config.prod.tiers-lieux.json:844:                "href": "https://movilab.org/"
config.prod.tiers-lieux.json:1032:              "fr": "Le wiki Movilab vous permettra d'accéder à une base de connaissances collaborative. Ressources pratiques, guides méthodologiques et retours d'expérience sont à votre disposition. La page logiciels et usages et son catalogue permet de découvrir les meilleurs outils pour gérer et animer votre lieu, mais aussi de décrire les votres, et ainsi faciliter des coopérations et cofinancements d'améliorations.",
config.prod.tiers-lieux.json:1033:              "en": "The Movilab wiki gives you access to a collaborative knowledge base. Practical resources, methodological guides and feedback from experience are available to you. The Uses page and its catalogue help you discover the best tools to manage and animate your space, while also allowing you to document your own tools and practices—making it easier to develop collaborations"
config.prod.tiers-lieux.json:1043:                  "fr": "Le Wiki Movilab",
config.prod.tiers-lieux.json:1044:                  "en": "The Movilab Wiki"
config.prod.tiers-lieux.json:1046:                "href": "https://movilab.org/"
src/modules/interop/index.ts:4: * Module pour l'interopérabilité avec des services tiers (Discourse, Mediawiki, etc.).
src/modules/interop/index.ts:29:// Composants Mediawiki
src/modules/interop/index.ts:31:export { default as MediawikiLink } from "./components/MediawikiLink";
src/modules/interop/index.ts:33:export { default as MediawikiPod } from "./components/MediawikiPod";
src/modules/interop/index.ts:35:export { default as MediawikiSection } from "./MediawikiSection";
src/modules/interop/index.ts:39:/** Consommé en interne (import par chemin profond) par DiscourseSection / MediawikiSection / DiscoursePod / MediawikiPod — pas via ce barrel. */
src/modules/interop/hooks/useInteropMutation.ts:2: * Mutations interop (Discourse + MediaWiki) — factory + hooks.
src/modules/interop/hooks/useInteropMutation.ts:11: *  - Invalidation de la query associée (`discourse-profil` / `mediawiki-contribs`)
src/modules/interop/hooks/useInteropMutation.ts:24:  type MediawikiResult,
src/modules/interop/hooks/useInteropMutation.ts:134:// MEDIAWIKI
src/modules/interop/hooks/useInteropMutation.ts:137:export const useMediawikiLink = createInteropMutation<string, MediawikiResult>({
src/modules/interop/hooks/useInteropMutation.ts:138:  action: (entity, username) => entity.linkMediaWikiAccount(username),
src/modules/interop/hooks/useInteropMutation.ts:140:    successKey: "toasts.mediawiki.linkSuccess",
src/modules/interop/hooks/useInteropMutation.ts:141:    errorKey: "toasts.mediawiki.linkError",
src/modules/interop/hooks/useInteropMutation.ts:143:  invalidate: [INTEROP_QUERY_KEYS.MEDIAWIKI_CONTRIBS_PREFIX()],
src/modules/interop/hooks/useInteropMutation.ts:146:export const useMediawikiUnlink = createInteropMutation<void, MediawikiResult>({
src/modules/interop/hooks/useInteropMutation.ts:147:  action: (entity) => entity.unlinkMediaWikiAccount(),
src/modules/interop/hooks/useInteropMutation.ts:149:    successKey: "toasts.mediawiki.unlinkSuccess",
src/modules/interop/hooks/useInteropMutation.ts:150:    errorKey: "toasts.mediawiki.unlinkError",
src/modules/interop/hooks/useInteropMutation.ts:152:  invalidate: [INTEROP_QUERY_KEYS.MEDIAWIKI_CONTRIBS_PREFIX()],
src/modules/interop/i18n/fr.json:12:    "mediawiki": {
src/modules/interop/i18n/fr.json:13:      "linkSuccess": "Compte MediaWiki lié avec succès",
src/modules/interop/i18n/fr.json:14:      "linkError": "Échec de la liaison du compte MediaWiki",
src/modules/interop/i18n/fr.json:15:      "unlinkSuccess": "Compte MediaWiki délié",
src/modules/interop/i18n/fr.json:16:      "unlinkError": "Échec de la déliaison du compte MediaWiki"
src/modules/interop/i18n/fr.json:24:    "username_placeholder": "Votre nom d'utilisateur MediaWiki",
src/modules/interop/i18n/fr.json:25:    "link_description": "Reliez votre compte <strong>MediaWiki</strong> à votre profil pour afficher vos fiches et contributions.",
src/modules/interop/hooks/useUserInteropLinks.tsx:18:    ? (interop?.mediawiki?.[costumSlug] as string | undefined)
src/modules/interop/components/MediawikiPod.tsx:7:import { useMediawikiContribsQuery, type WikiContrib } from "../hooks/useMediawikiContribs";
src/modules/interop/components/MediawikiPod.tsx:8:import { useMediawikiUnlink } from "../hooks/useInteropMutation";
src/modules/interop/components/MediawikiPod.tsx:16:const MediawikiPod = () => {
src/modules/interop/components/MediawikiPod.tsx:18:  const { wikiBaseUrl } = useInteropConfig();
src/modules/interop/components/MediawikiPod.tsx:20:  const { data, isLoading } = useMediawikiContribsQuery(10);
src/modules/interop/components/MediawikiPod.tsx:21:  const unlinkMutation = useMediawikiUnlink();
src/modules/interop/components/MediawikiPod.tsx:26:    wikiBaseUrl && wikiUsername
src/modules/interop/components/MediawikiPod.tsx:27:      ? `${wikiBaseUrl}/wiki/User:${encodeURIComponent(wikiUsername)}`
src/modules/interop/components/MediawikiPod.tsx:77:                href={`${wikiBaseUrl}/wiki/Special:Contributions/${encodeURIComponent(wikiUsername!)}`}
src/modules/interop/components/MediawikiPod.tsx:129:export default MediawikiPod;
src/modules/interop/components/MediawikiLink.tsx:9:import { useMediawikiLink } from "../hooks/useInteropMutation";
src/modules/interop/components/MediawikiLink.tsx:18:const MediawikiLink = () => {
src/modules/interop/components/MediawikiLink.tsx:20:  const { wikiBaseUrl } = useInteropConfig();
src/modules/interop/components/MediawikiLink.tsx:21:  const linkMutation = useMediawikiLink();
src/modules/interop/components/MediawikiLink.tsx:36:  const exampleUrl = wikiBaseUrl
src/modules/interop/components/MediawikiLink.tsx:37:    ? `${wikiBaseUrl}/wiki/Special:Contributions/`
src/modules/interop/components/MediawikiLink.tsx:109:export default MediawikiLink;
src/modules/interop/MediawikiSection.tsx:4:const MediawikiPod = lazy(() => import("./components/MediawikiPod"));
src/modules/interop/MediawikiSection.tsx:5:const MediawikiLink = lazy(() => import("./components/MediawikiLink"));
src/modules/interop/MediawikiSection.tsx:7:const MediawikiSection = () => {
src/modules/interop/MediawikiSection.tsx:14:      {isWikiLinked ? <MediawikiPod /> : <MediawikiLink />}
src/modules/interop/MediawikiSection.tsx:19:export default MediawikiSection;
src/modules/interop/hooks/useInteropConfigQuery.test.ts:28:      expect(result.current.wikiBaseUrl).toBeNull();
src/modules/interop/hooks/useInteropConfigQuery.test.ts:41:      expect(result.current.wikiBaseUrl).toBeNull();
src/modules/interop/hooks/useInteropConfigQuery.test.ts:77:  describe("MediaWiki configuré", () => {
src/modules/interop/hooks/useInteropConfigQuery.test.ts:78:    it("expose wikiBaseUrl + wikiApiUrl + hasWiki=true", () => {
src/modules/interop/hooks/useInteropConfigQuery.test.ts:84:            WIKI_API_URL: "https://wiki.example/api.php",
src/modules/interop/hooks/useInteropConfigQuery.test.ts:89:      expect(result.current.wikiBaseUrl).toBe("https://wiki.example");
src/modules/interop/hooks/useInteropConfigQuery.test.ts:90:      expect(result.current.wikiApiUrl).toBe("https://wiki.example/api.php");
src/modules/interop/hooks/useInteropConfigQuery.test.ts:97:        costum: { interop: { WIKI_API_URL: "https://wiki.example/api.php" } },
src/modules/interop/hooks/useInteropConfigQuery.test.ts:101:      expect(result.current.wikiApiUrl).toBe("https://wiki.example/api.php");
src/modules/interop/hooks/useInteropConfigQuery.test.ts:105:  describe("Discourse + MediaWiki ensemble", () => {
src/modules/interop/hooks/useInteropConfigQuery.test.ts:113:            WIKI_API_URL: "https://wiki.example/api.php",
src/modules/interop/constants/queryKeys.ts:5: * `"mediawiki-contribs"`), méthodes en SCREAMING_SNAKE_CASE, chaque
src/modules/interop/constants/queryKeys.ts:30:   * Contributions MediaWiki récentes d'un user.
src/modules/interop/constants/queryKeys.ts:32:   * Producteur : `useMediawikiContribsQuery`
src/modules/interop/constants/queryKeys.ts:33:   * Consommateurs invalidants : `useMediawikiLink`, `useMediawikiUnlink` —
src/modules/interop/constants/queryKeys.ts:34:   *   via `MEDIAWIKI_CONTRIBS_PREFIX()`
src/modules/interop/constants/queryKeys.ts:36:  MEDIAWIKI_CONTRIBS: (entityId: string | null, wikiUsername: string | null) =>
src/modules/interop/constants/queryKeys.ts:37:    ["mediawiki-contribs", entityId, wikiUsername] as const,
src/modules/interop/constants/queryKeys.ts:38:  /** Préfixe minimal — invalide toutes les contribs MediaWiki. */
src/modules/interop/constants/queryKeys.ts:39:  MEDIAWIKI_CONTRIBS_PREFIX: () => ["mediawiki-contribs"] as const,
src/modules/interop/hooks/useMediawikiContribs.tsx:8:  type MediawikiContribsResult,
src/modules/interop/hooks/useMediawikiContribs.tsx:13:export type { WikiContrib, MediawikiContribsResult };
src/modules/interop/hooks/useMediawikiContribs.tsx:15:export function useMediawikiContribsQuery(limit = 10) {
src/modules/interop/hooks/useMediawikiContribs.tsx:20:  return useQuery<MediawikiContribsResult>({
src/modules/interop/hooks/useMediawikiContribs.tsx:21:    queryKey: INTEROP_QUERY_KEYS.MEDIAWIKI_CONTRIBS(entity?.id ?? null, wikiUsername ?? null),
src/modules/interop/hooks/useMediawikiContribs.tsx:24:        throw new Error("MediaWiki contributions query enabled without entity/username");
src/modules/interop/hooks/useMediawikiContribs.tsx:26:      return asInteropEntity(entity).getMediaWikiContributions(wikiUsername, limit);
src/modules/interop/hooks/_interopEntity.ts:5: * runtime ajoutées par le backend Cocolight (link/unlink Discourse/MediaWiki,
src/modules/interop/hooks/_interopEntity.ts:6: * getDiscourseProfile, getMediaWikiContributions, etc.).
src/modules/interop/hooks/_interopEntity.ts:50:export type MediawikiResult = {
src/modules/interop/hooks/_interopEntity.ts:65:export type MediawikiContribsResult = {
src/modules/interop/hooks/_interopEntity.ts:88:  // Mutations MediaWiki
src/modules/interop/hooks/_interopEntity.ts:89:  linkMediaWikiAccount(username: string): Promise<MediawikiResult>;
src/modules/interop/hooks/_interopEntity.ts:90:  unlinkMediaWikiAccount(): Promise<MediawikiResult>;
src/modules/interop/hooks/_interopEntity.ts:91:  // Query MediaWiki
src/modules/interop/hooks/_interopEntity.ts:92:  getMediaWikiContributions(
src/modules/interop/hooks/_interopEntity.ts:95:  ): Promise<MediawikiContribsResult>;
src/modules/interop/hooks/useInteropConfigQuery.tsx:11:    wikiBaseUrl: cfg?.WIKI_BASE_URL ?? null,
src/modules/interop/i18n/en.json:12:    "mediawiki": {
src/modules/interop/i18n/en.json:13:      "linkSuccess": "MediaWiki account linked successfully",
src/modules/interop/i18n/en.json:14:      "linkError": "Failed to link MediaWiki account",
src/modules/interop/i18n/en.json:15:      "unlinkSuccess": "MediaWiki account unlinked",
src/modules/interop/i18n/en.json:16:      "unlinkError": "Failed to unlink MediaWiki account"
src/modules/interop/i18n/en.json:24:    "username_placeholder": "Your MediaWiki username",
src/modules/interop/i18n/en.json:25:    "link_description": "Link your <bold>MediaWiki</bold> account to your profile to display your pages and contributions.",
src/modules/profil/components/sections/ProfileAbout.tsx:14:const MediawikiSection = lazy(() => import("@/modules/interop/MediawikiSection"));
src/modules/profil/components/sections/ProfileAbout.tsx:60:              <MediawikiSection />
.claude/skills/config-assistant/SKILL.md:390:| `interop` | pods Discourse/Mediawiki | clés interop | instances externes |
.claude/skills/config-assistant/examples/header-mega-menu.json:157:              "fr": "Wiki Movilab",
.claude/skills/config-assistant/examples/header-mega-menu.json:158:              "en": "Wiki Movilab"
.claude/skills/config-assistant/examples/header-mega-menu.json:164:            "path": "https://movilab.org/"
doc/20-module-interop.md:15:- [Mediawiki](#mediawiki)
doc/20-module-interop.md:16:  - [Composants Mediawiki](#composants-mediawiki)
doc/20-module-interop.md:17:  - [Hooks Mediawiki](#hooks-mediawiki)
doc/20-module-interop.md:32:- **Mediawiki** : wiki collaboratif (lien de compte, pod de profil, contributions)
doc/20-module-interop.md:49:│   ├── MediawikiLink.tsx            # Formulaire de liaison Mediawiki (react-hook-form + Zod)
doc/20-module-interop.md:50:│   └── MediawikiPod.tsx             # Pod profil Mediawiki (contributions récentes)
doc/20-module-interop.md:62:│   ├── useMediawikiContribs.tsx     # Query contributions Mediawiki d'un utilisateur
doc/20-module-interop.md:65:├── MediawikiSection.tsx             # Section profil : lazy-charge MediawikiPod ou MediawikiLink
doc/20-module-interop.md:83:    wikiBaseUrl,      // string | null  — URL base du wiki (WIKI_BASE_URL)
doc/20-module-interop.md:84:    wikiApiUrl,       // string | null  — URL de l'API Mediawiki (WIKI_API_URL)
doc/20-module-interop.md:172:## Mediawiki
doc/20-module-interop.md:174:### Composants Mediawiki
doc/20-module-interop.md:178:| `MediawikiPod` | Affiche les contributions récentes de l'utilisateur sur le wiki (titre de la page, commentaire, date). Inclut un lien vers la page utilisateur, un lien "voir toutes les contributions" et un bouton "Délier" pour le propriétaire du profil. |
doc/20-module-interop.md:179:| `MediawikiLink` | Formulaire (react-hook-form + Zod) permettant de lier le compte Mediawiki en saisissant le username wiki. Affiche une aide contextuelle avec l'URL des contributions. |
doc/20-module-interop.md:181:### Hooks Mediawiki
doc/20-module-interop.md:185:| `useMediawikiContribsQuery` | `(limit?: number) => UseQueryResult<MediawikiContribsResult>` | Contributions Mediawiki récentes de l'utilisateur lié. `limit` est 10 par défaut. Lit entity + wikiUsername depuis les contextes. |
doc/20-module-interop.md:202:INTEROP_QUERY_KEYS.MEDIAWIKI_CONTRIBS(entityId, wikiUsername)
doc/20-module-interop.md:203:// → ["mediawiki-contribs", entityId, wikiUsername]
doc/20-module-interop.md:205:INTEROP_QUERY_KEYS.MEDIAWIKI_CONTRIBS_PREFIX()
doc/20-module-interop.md:206:// → ["mediawiki-contribs"]  — pour invalidation cross-entity/username
doc/20-module-interop.md:247:**Mutations MediaWiki exposées :**
doc/20-module-interop.md:251:| `useMediawikiLink` | `username: string` | `MediawikiResult` | Invalide `["mediawiki-contribs"]` |
doc/20-module-interop.md:252:| `useMediawikiUnlink` | `void` | `MediawikiResult` | Invalide `["mediawiki-contribs"]` |
doc/20-module-interop.md:256:**Note** : `useMediawikiLink` et `useMediawikiUnlink` ne sont **pas** exportés via le barrel `index.ts` (consommés uniquement en interne par `MediawikiLink.tsx` et `MediawikiPod.tsx`).
doc/20-module-interop.md:272:| `MediawikiResult` | `{ result: boolean; username?: string; msg?: string; error?: string }` |
````

Total : 175 correspondances. Répartition par fichier (`cut -d: -f1 | sort | uniq -c | sort -rn`) :

````
     47 doc/20-module-interop.md
     14 src/modules/interop/hooks/useInteropMutation.ts
     11 src/modules/interop/hooks/useInteropConfigQuery.test.ts
     11 config.prod.tiers-lieux.json
     10 src/modules/interop/hooks/_interopEntity.ts
     10 src/modules/interop/components/MediawikiPod.tsx
      9 src/modules/interop/constants/queryKeys.ts
      9 config.prod.relief.json
      7 src/modules/interop/i18n/fr.json
      7 src/modules/interop/i18n/en.json
      7 src/modules/interop/hooks/useMediawikiContribs.tsx
      7 src/modules/interop/components/MediawikiLink.tsx
      6 src/modules/interop/index.ts
      5 src/modules/interop/MediawikiSection.tsx
      3 .claude/skills/config-assistant/examples/header-mega-menu.json
      2 src/modules/profil/components/sections/ProfileAbout.tsx
      2 package-lock.json
      1 src/modules/interop/hooks/useUserInteropLinks.tsx
      1 src/modules/interop/hooks/useInteropConfigQuery.tsx
      1 doc/README.md
      1 doc/26-assistant-config.md
      1 doc/12-performance.md
      1 doc-projets/relief.md
      1 doc-projets/parent62.md
      1 .claude/skills/config-assistant/SKILL.md
````

Vérification séparée des motifs `semantic`, `smw`, `wikibase` et `fabmob` :

````
cd ~/exploration-site-json/site-json && grep -rn -i -I -E 'semantic|smw|wikibase|fabmob' --exclude-dir=node_modules --exclude-dir=.git .
````

Elle donne 16 lignes. Deux sont les empreintes de `package-lock.json` (7895 et 13868). Les quatorze autres sont des occurrences de l'identifiant `wikiBaseUrl` (URL de base du wiki), que le motif `wikibase` retient parce que la recherche ignore la casse. Ces quatorze lignes se trouvent dans `MediawikiPod.tsx` (18, 26, 27, 77), `MediawikiLink.tsx` (20, 36, 37), `useInteropConfigQuery.test.ts` (28, 41, 78, 89), `useInteropConfigQuery.tsx` (11) et `doc/20-module-interop.md` (83, 310). Ni Semantic MediaWiki ni Wikibase n'apparaissent dans le dépôt.

Aucun fichier ne porte `semantic`, `smw` ou `wikibase` dans son nom. La commande `find . -not -path './.git/*' -not -path '*/node_modules/*' -iname '*semantic*' -o -not -path './.git/*' -iname '*smw*' -o -not -path './.git/*' -iname '*wikibase*'` ne renvoie rien.

## Q5. Ajout d'une nouvelle source de données ou d'un nouveau type d'objet

### Index de doc/ (étape 10)

`doc/` contient un sommaire. Voici `doc/README.md`, recopié en entier (55 lignes) :

````
    1  [← Retour au projet](../README.md)
    2  
    3  # Documentation SiteForge
    4  
    5  > Générateur de sites web piloté par JSON — React 19 + Vite 5 + React Router v7 + SSR streaming
    6  
    7  ## Guide de lecture rapide
    8  
    9  | Pour... | Lire... |
   10  |---------|---------|
   11  | Démarrer rapidement | [Introduction & Installation](01-introduction-installation.md) |
   12  | Configurer le projet | [Configuration](02-configuration.md) |
   13  | Comprendre l'architecture | [Architecture](03-architecture.md) |
   14  | Définir une structure JSON | [Schéma principal](04-schema-principal.md) |
   15  | Référence des sections | [Schémas sections](05-schemas-sections.md) |
   16  | Ajouter/personnaliser une section | [Sections dynamiques](06-sections-dynamiques.md) |
   17  | Module de recherche | [Module Search](07-module-search.md) |
   18  | Module agenda (events : liste/calendrier/carte) | [Module Agenda](29-module-agenda.md) — voir aussi `src/modules/agenda/README.md` |
   19  | Module profil | [Module Profil](08-module-profil.md) |
   20  | Formulaires & costums config-driven | [Module formEngine](28-module-formengine.md) |
   21  | Module actualités | [Module News](09-module-news.md) |
   22  | Module articles / blog (POI type=article) | [Module Articles/Blog](32-module-articles-blog.md) — voir aussi `src/modules/blog/README.md` |
   23  | Projet Parent62 (CDC, modèle de données, avancement) | [Projet Parent62](../doc-projets/parent62.md) — doc de travail (déplacée dans [`doc-projets/`](../doc-projets/README.md)) |
   24  | Module cagnotte (financement) | [Module Cagnotte](18-module-cagnotte.md) |
   25  | Module ampli (amplification) | [Module Ampli](22-module-ampli.md) |
   26  | Module interop (Discourse/Mediawiki) | [Module Interop](20-module-interop.md) |
   27  | Module CoForm (formulaires dynamiques) | [Module CoForm](21-module-coform.md) — voir aussi `src/modules/coform/README.md` |
   28  | Module AAC (Appel à Communs) | [Module AAC](34-module-aac.md) — annuaire des communs (`aac-directory`/`aac-highlight`, `/aac`), fiche d'un commun (financement si `coremu`, paliers et actions, contributeurs), dépôt et édition CoForm, droits, endpoint `directoryproposal` ; pièges & roadmap (campagnes, panier, doublonnage) |
   29  | Module auth (connexion/inscription/SSO) | [Module Auth](23-module-auth.md) |
   30  | Module notification (cloche + section) | [Module Notification](25-module-notification.md) |
   31  | Composants média (audio/galerie/fichiers) | [Media Components](33-media-components.md) |
   32  | Restreindre l'accès à une page (`page.auth`) | [Gardes de page](34-gardes-de-page.md) |
   33  | Rattacher une fiche à un costum / à un formulaire (référencement, sous-types, routage d'édition) | [Rattachement et référencement](35-rattachement-et-referencement.md) |
   34  | Module observatoire (dashboard déclaratif) | [Module Observatoire](27-module-observatoire.md) |
   35  | Module admin (back-office /admin config-driven) | [Module Admin](30-module-admin.md) |
   36  | Panneau d'administration (live edit) | [Admin Panel](24-admin-panel.md) |
   37  | Assistant de configuration | [Assistant Config](26-assistant-config.md) |
   38  | Système de visibilité | [Visibility System](19-visibility-system.md) |
   39  | Système de permissions | [Permissions](10-permissions.md) |
   40  | API et authentification | [API & Auth](11-api-authentification.md) |
   41  | Optimisation | [Performance](12-performance.md) |
   42  | Multi-langue | [Internationalisation](13-i18n.md) |
   43  | SSR et serveurs | [Backend & SSR](14-backend-ssr.md) |
   44  | Tests | [Tests](15-tests.md) |
   45  | Déploiement | [Docker](16-deploiement-docker.md) |
   46  | Palette Cmd+K (implémentée) | [Command Palette](17-module-command-palette.md) — module implémenté ; les sections 1-11 du doc restent l'annexe RFC/justification d'architecture |
   47  | 🚧 RFC : assistant config × costums | [Assistant config costum (RFC)](31-rfc-assistant-config-costum.md) — formulaires costum générés, config admin, cycle de vie sans re-publication |
   48  
   49  ## Documents annexes (non numérotés)
   50  
   51  | Pour... | Lire... |
   52  |---------|---------|
   53  | Nommage & inventaire du système de formulaires (avant un refactor) | [Cartographie & formalisme des formulaires](cartographie-forms-formalisme.md) |
   54  | Doublons, mutualisation, code mort | [Cartographie des fonctions](cartographie-fonctions/RAPPORT.md) — artefact **généré** par `npm run map:functions` (+ `cartographie-fonctions/functions.json`) |
   55  
````

### Ce que dit la documentation

Commande :

````
cd ~/exploration-site-json/site-json && grep -rn -i -E 'nouvelle source|nouveau type|ajouter un (nouveau )?(type|module|backend)|autre backend|autre api|nouvelle api' doc docs README.md
````

Résultat complet :

````
doc/10-permissions.md:495:| **Ajouter un module** | Modifier `useUserPermissions` | Créer `permissions/` dans le module |
doc/10-permissions.md:496:| **Ajouter un type d'entité** | Modifier `useUserPermissions` | Créer un calculateur |
doc/17-module-command-palette.md:236:- Extensible : ajouter une nouvelle source de commandes ne doit pas toucher au core du module.
doc/03-architecture.md:124:**`SECTION_EXTRACTORS` registry** : Registre extensible des extracteurs de sections imbriquées. Pour ajouter un nouveau type de container (comme `gridLayout` ou `tabs`), il suffit d'ajouter un [suite de la ligne non recopiée]
doc/34-module-aac.md:870:### Ajouter un type de champ CoForm (le besoin n°1 : `newDepenseList`)
````

La documentation ne parle d'ajouter une source de données nulle part : aucune correspondance pour « nouvelle source » au sens d'une source de données, ni pour « autre backend », « autre api » ou « nouvelle api ». La seule « nouvelle source » trouvée, à `doc/17-module-command-palette.md:236`, concerne les commandes de la palette Cmd+K.

La procédure documentée qui s'en rapproche le plus est l'ajout d'un nouveau type de **section** d'affichage. `doc/06-sections-dynamiques.md`, lignes 358 à 420 ; le fichier en compte 478 :

````
  358  ## Comment ajouter ou personnaliser une nouvelle section
  359  
  360  Pour créer une section sur mesure :
  361  
  362  > ⚠️ **Ce n'est pas un changement en 3 étapes.** Les étapes 1 à 4 sont rattrapées par le compilateur,
  363  > les 5 et 6 par `npm run test:preflight` — que **ni hook ni CI ne déclenche** (`.husky/` ne contient
  364  > que `_`, il n'y a pas de `.github/workflows`) — et les étapes 7 à 10 échouent **en silence**.
  365  
  366  1. **Déclarer le schéma Zod** dans `src/types/site-schema.ts`, en `const` **non exporté** englobant
  367     `type` + `id` + `props` (précédent : `HeroSectionSchema`). N'exporter que les types inférés.
  368  
  369     ```ts
  370     const MySectionSchema = z.object({
  371       type: z.literal("my-section"),
  372       id: z.string().optional(),
  373       props: z.object({
  374         title: LocalizedString,
  375         items: z.array(z.string()),
  376       }),
  377     });
  378     export type MySectionProps = z.infer<typeof MySectionSchema>["props"];
  379     ```
  380  
  381  2. **L'inscrire dans l'union `Section`** (`export const Section = z.discriminatedUnion("type", [...])`).
  382  
  383     > ⚠️ **Ne jamais éditer `SectionPropsMap`** : c'est un type **dérivé** de l'union
  384     > (`{ [K in Section['type']]: … }`), et il ne vit **pas** dans `src/types/site.ts`.
  385  
  386  3. **Créer le composant React** avec un `export default`, en **posant `id` sur l'élément racine** —
  387     c'est le mécanisme d'ancrage de la section — et en passant tout texte localisé par `useT`/`t`,
  388     jamais par `props.title.fr` (qui casse le changement de langue en silence).
  389  
  390     ```tsx
  391     // src/components/sections/MySectionSection.tsx
  392     import { useLocalization } from "@/hooks/useLocalization";
  393     import type { MySectionProps } from "@/types/site-schema";
  394  
  395     function MySectionSection({ id, props }: { id?: string; props: MySectionProps }) {
  396       const { t } = useLocalization();
  397       return (
  398         <section id={id}>
  399           <h2>{t(props.title)}</h2>
  400           <ul>
  401             {props.items.map((item, i) => <li key={i}>{item}</li>)}
  402           </ul>
  403         </section>
  404       );
  405     }
  406  
  407     export default MySectionSection;
  408     ```
  409  
  410  4. **Enregistrer dans `SectionRenderer.tsx`**, clé et `lazy(` **sur la même ligne** (un test de
  411     préflight lit cette table à la regex) :
  412  
  413     ```ts
  414     const LazySections = {
  415       // ...
  416       "my-section": lazy(() => import("./MySectionSection")),
  417     };
  418     ```
  419  
  420     > **Important** : `lazy()` vient de **vite-preload** (ni `React.lazy`, qui ne trace pas le chunk et
````

## Q6. Vitalité du dépôt

Les commandes sont lancées sur `~/exploration-site-json/site-json`.

`git log -1 --format='%H %aI %an <%ae>'` :

````
76ca35bd2614c1494b6bb15d141e78c98ac5cc0e 2026-10-01T15:08:17+02:00 thomas craipeau <thomas.craipeau@gmail.com>
````

`git rev-list --count HEAD` :

````
2162
````

Premier commit de `main` (`git log --reverse --format='%H %aI' | head -1`) :

````
acfa3ffc86b1bd2ae60b8087026e7144ec8ca9b1 2025-06-20T16:55:37+04:00
````

`git shortlog -sn HEAD | head -10` :

````
  1338	aboire
   120	Schumann Juda
   117	mirana
   111	Nicolas
   109	ANDRIANIRINARISOA Paul Antenaina Louis Francki
    90	leonidjonah
    75	ANDRINIRINA Peterson Severin
    62	Thomas Craipeau
    43	cael
    40	thomas craipeau
````

« Thomas Craipeau » et « thomas craipeau » sont comptés séparément par `shortlog` : le même nom, écrit avec et sans majuscules.

Taille du clone (`du -sh`) :

````
128M	/home/spheres/exploration-site-json/site-json
63M	/home/spheres/exploration-site-json/site-json/.git
````

Sans `.git` (`du -sh --exclude=.git .`) : `66M`.

Branches distantes (`git branch -a`) : 43 branches distantes en plus de `main`, et `origin/HEAD` qui pointe sur `origin/main`. On y trouve notamment `master`, `openatlas`, `judi-tierslieux.org`, `fah-multi-site` et `ssr`.

### Licence

Il n'y a pas de fichier de licence à la racine, ni ailleurs dans le dépôt :

````
find ~/exploration-site-json/site-json -iname '*licen*' -not -path '*/node_modules/*' -not -path '*/.git/*'
````

Cette commande ne renvoie rien. `ls ~/exploration-site-json/site-json | grep -i -E 'licen|copying'` ne renvoie rien non plus.

`package.json` ne porte pas de champ `license` : `grep -n -i 'licen\|MIT' package.json` ne renvoie que la ligne 8 (`"typecheck": "tsc -b --noEmit",`), retenue parce que « emit » contient `mit`.

Le README annonce pourtant une licence, `README.md`, lignes 119 à 121 :

````
  119  ## Licence
  120  
  121  Ce projet est sous licence MIT. Consultez le fichier [LICENSE](LICENSE) pour plus de détails.
````

Le fichier `LICENSE` vers lequel pointe ce lien n'existe pas dans le clone.

## Écarts et surprises

1. **Arrêt à l'étape 1, puis reprise sur instruction.** `git status --porcelain` a montré deux fichiers suivis et modifiés, ` M CLAUDE.md` et ` M demandes-adminsys.md`, ainsi qu'un fichier non suivi, `?? pages/Lot21c_essai_11_temperature_2.txt`. Les deux premières lignes commencent par une espace puis `M`, pas directement par `M`. J'ai suivi l'intention de la consigne et je me suis arrêté. J'ai posé à Cyril la question suivante : « Ces modifications de `CLAUDE.md` et `demandes-adminsys.md` sont-elles de toi et voulues ? » Il a répondu : « c'est une demande particulière, pas rattachée à un lot ou autre. Traite quand même la demande même si c'est hors du cadre habituel. » J'ai donc repris la tâche. Ces deux fichiers n'ont été ni commités ni modifiés. Le commit de cette tâche ne porte que `travaux/exploration-site-json.md`.
2. **Relevé de `.claude/settings.local.json`.** Au début de la tâche :
   ```
   {
     "permissions": {
       "allow": [],
       "deny": []
     }
   }
   ```
   Le fichier ne porte aucune règle. Le relevé de fin de tâche figure au point 9.
3. **Le dépôt contient un module d'interopérabilité MediaWiki.** La consigne demandait si le code portait « la moindre trace » de MediaWiki. On y trouve le module `src/modules/interop/`, documenté dans `doc/20-module-interop.md`. Ce module lit une clé `WIKI_API_URL`, mais aucun code du clone ne l'emploie (voir Q3). Les contributions sont demandées au serveur Cocolight, par `getMediaWikiContributions` : ce que ce serveur fait de `api.php` n'est pas dans ce dépôt.
4. **La configuration du wiki n'est pas dans le fichier `config.prod.*.json`.** Elle est lue dans `entity.serverData.costum.interop`, c'est-à-dire dans des données renvoyées par le serveur Communecter. Elle n'est pas visible dans ce dépôt.
5. **L'onglet « Wiki » cherché par la consigne n'a pas été trouvé dans les configurations.** Les seules déclarations d'un onglet `"label": { "fr": "Wiki" }` sont dans un exemple de `doc/20-module-interop.md`, lignes 403 à 431. Dans le code, la section wiki s'affiche à l'intérieur de `ProfileAbout`, et seulement pour les profils de type `citoyens` (`ProfileAbout.tsx:56`). Je n'ai pas cherché d'où vient l'onglet que l'architecte a vu sur les sites rendus. Il peut venir de la configuration renvoyée par le serveur, ou d'une branche autre que `main`.
6. **Pas de fichier `LICENSE`**, alors que le README en annonce un (voir Q6). L'étape 4 demandait « le nom exact du fichier de licence et sa première ligne » : faute de fichier, la question n'a pas de réponse.
7. **La consigne mentionne `extremedefi.00.re`.** Le fichier qui correspond s'appelle `config.prod.eXtremeDefiAdeme.json`. Je n'ai pas vérifié lequel des fichiers de configuration sert chaque domaine : `sites.json` et `doc/02-configuration.md`, lignes 234 et suivantes (« Mécanisme `sites.json` »), en parlent, mais je ne les ai pas lus.
8. **Ce qui sort du texte de la consigne.** `doc/` a un sommaire : j'ai donc appliqué la première branche de l'étape 10 et recopié ce seul fichier. `doc/` compte 40 fichiers. La documentation est aussi répartie dans `docs/` et `doc-projets/`, que l'étape 5 ne visait pas. `doc-projets/federation-des-cae.md` et `doc-projets/tiers-lieux.md` n'ont pas été lus. Le dépôt contient aussi un dossier `.claude/` (des skills Claude Code, dont `config-assistant`), qui apparaît dans les résultats de Q4.
9. **Relevé de `.claude/settings.local.json` en fin de tâche :** même contenu qu'au début, `"allow": []` et `"deny": []`. Aucune règle.
10. **Demandes de confirmation.** Je ne vois pas les fenêtres de confirmation que Cyril reçoit : je ne peux pas dire lesquelles ont proposé une autorisation permanente. Le relevé du point 9 établit qu'aucune n'a été inscrite dans `settings.local.json`.
12. **Le dépôt a changé pendant la tâche.** Au moment du commit, `git status --porcelain` ne montrait plus que `?? travaux/exploration-site-json.md`. Les modifications de `CLAUDE.md` et de `demandes-adminsys.md` ont été intégrées au commit `cd78e45` (« [Lot 21][Tâche 10] Protocole durci : arrêt sur la barrière de P3, règles et rapport », 2026-10-05T19:47:00+02:00). Ce commit n'a pas été fait par cette session. Le fichier `pages/Lot21c_essai_11_temperature_2.txt` n'apparaît plus comme non suivi.
11. **Vérification qui tranche.** Chacune des six questions porte au moins un extrait localisé par un chemin de fichier et un numéro de ligne, ou une mention d'absence accompagnée de la commande qui l'établit. Pour Q6, l'absence de fichier de licence est établie par une commande, et c'est le README qui affirme la licence (ligne 121).
