#!/usr/bin/env bash
# Usage: bin/wiki-api.sh "action=browsebysubject&subject=Foo&property=Bar"
#
# Exécute n'importe quelle chaîne de paramètres d'API MediaWiki en GET, avec
# la session courante. Couvre tout ce pour quoi bin/wiki-get.sh n'a pas de
# raccourci dédié : browsebysubject, expandtemplates, intestactions,
# query&meta=siteinfo, query&list=allpages, query&list=backlinks, etc.
#
# Lecture seule stricte :
#   - toujours curl -G : aucune donnée n'est jamais envoyée dans le corps
#     d'une requête, donc aucune requête POST n'est jamais émise ;
#   - le paramètre "action=" est obligatoire (pas de action=query implicite,
#     pour éviter toute ambiguïté sur ce qui est réellement exécuté) ;
#   - l'action demandée est vérifiée contre une liste noire des actions
#     d'écriture connues du cœur de l'API MediaWiki, et refusée si elle y
#     figure. action=purge est une exception explicitement autorisée :
#     invalidation de cache, pas une écriture de contenu.
# Cette liste noire est une défense en profondeur, pas la seule barrière :
# MediaWiki refuse de toute façon la plupart des actions d'écriture reçues
# en GET (mustBePosted). Elle couvre le cœur MediaWiki et les extensions de
# cette installation (Page Forms, Semantic Forms, SMW) ; une extension future
# ou non répertoriée ici pourrait exposer sa propre action d'écriture sous un
# autre nom.
#
# Authentification : réutilise .cookies.txt (créés par bin/wiki-login.sh),
# comme bin/wiki-get.sh. Aucun identifiant n'est jamais lu, construit ou
# passé en argument ici.
set -euo pipefail

readonly WIKI_API="https://wiki.ecolibre.org/api.php"

readonly WRITE_ACTIONS=(
  edit delete move protect block unblock upload import patrol rollback
  undelete userrights emailuser createaccount changecontentmodel
  managetags mergehistory revisiondelete setnotificationtimestamp
  setpagelanguage tag thank watch changeauthenticationdata
  removeauthenticationdata resetpassword clearhasmsg filerevert
  imagerotate linkaccount unlinkaccount login logout options
  stashedit abusefilterunblockautopromote spamblacklist
  wbeditentity wbcreateclaim wbremoveclaims wbsetclaim wbsetclaimvalue
  wbsetdescription wbsetlabel wbsetsitelink wbsetaliases wbmergeitems
  wblinktitles
  pfautoedit sfautoedit smwtask
)

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 \"action=...&param=valeur...\"" >&2
  exit 1
fi

PARAMS="$1"

ACTION=$(python3 -c '
import sys, urllib.parse
params = urllib.parse.parse_qs(sys.argv[1], keep_blank_values=True)
vals = params.get("action", [])
print("__MULTI__" if len(vals) > 1 else (vals[0] if vals else ""))
' "$PARAMS")

if [ -z "$ACTION" ]; then
  echo "ERREUR: paramètre action= obligatoire dans la chaîne" >&2
  exit 1
fi

if [ "$ACTION" = "__MULTI__" ]; then
  echo "ERREUR: action= apparaît plusieurs fois dans la chaîne — refusé (PHP retient la dernière valeur, un contrôle sur la première serait contournable)." >&2
  exit 1
fi

for w in "${WRITE_ACTIONS[@]}"; do
  if [ "$ACTION" = "$w" ]; then
    echo "ERREUR: action='$ACTION' est une action d'écriture, refusée par ce script (lecture seule stricte)." >&2
    exit 1
  fi
done

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COOKIES="$DIR/.cookies.txt"

CURL_OPTS=(-s -G)
if [ -f "$COOKIES" ]; then
  CURL_OPTS+=(-b "$COOKIES")
fi

# Ajoute format=json/formatversion=2 par défaut si absents de $PARAMS,
# sans jamais dupliquer un paramètre déjà fourni par l'appelant.
EXTRA=""
case "&$PARAMS&" in
  *"&format="*) ;;
  *) EXTRA="${EXTRA}&format=json" ;;
esac
case "&$PARAMS&" in
  *"&formatversion="*) ;;
  *) EXTRA="${EXTRA}&formatversion=2" ;;
esac

RESPONSE=$(curl "${CURL_OPTS[@]}" "$WIKI_API" --data "${PARAMS}${EXTRA}")

if PRETTY=$(printf '%s' "$RESPONSE" | python3 -m json.tool 2>/dev/null); then
  echo "$PRETTY"
else
  printf '%s\n' "$RESPONSE"
fi
