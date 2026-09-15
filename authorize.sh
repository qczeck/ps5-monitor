#!/usr/bin/env bash
# Otwiera w przeglądarce ekran zgody OLX.
set -euo pipefail
set -a; source .env; set +a
SCOPE="${1:-read}"
URL="https://www.olx.pl/oauth/authorize/?client_id=${OLX_CLIENT_ID}&response_type=code&scope=${SCOPE}&redirect_uri=${OLX_REDIRECT_URI}&state=$(openssl rand -hex 8)"
echo "$URL"
command -v open >/dev/null && open "$URL" || true
