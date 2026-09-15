#!/usr/bin/env bash
# Odswieza access_token na podstawie refresh_token z tokens.json.
set -euo pipefail
set -a; source .env; set +a
RT=$(python3 -c 'import json;print(json.load(open("tokens.json"))["refresh_token"])')
curl -sS -X POST https://www.olx.pl/api/open/oauth/token \
  -H 'Content-Type: application/json' \
  -d "{\"grant_type\":\"refresh_token\",
       \"client_id\":\"${OLX_CLIENT_ID}\",
       \"client_secret\":\"${OLX_CLIENT_SECRET}\",
       \"refresh_token\":\"${RT}\"}" \
  | tee tokens.json | python3 -m json.tool
