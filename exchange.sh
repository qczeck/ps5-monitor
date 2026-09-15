#!/usr/bin/env bash
# Wymienia kod autoryzacyjny na access_token + refresh_token.
# Uzycie: ./exchange.sh <kod_ze_strony_callback>
set -euo pipefail
set -a; source .env; set +a
[ $# -eq 1 ] || { echo "Uzycie: $0 <code>"; exit 1; }
curl -sS -X POST https://www.olx.pl/api/open/oauth/token \
  -H 'Content-Type: application/json' \
  -d "{\"grant_type\":\"authorization_code\",
       \"client_id\":\"${OLX_CLIENT_ID}\",
       \"client_secret\":\"${OLX_CLIENT_SECRET}\",
       \"code\":\"$1\",
       \"redirect_uri\":\"${OLX_REDIRECT_URI}\"}" \
  | tee tokens.json | python3 -m json.tool
