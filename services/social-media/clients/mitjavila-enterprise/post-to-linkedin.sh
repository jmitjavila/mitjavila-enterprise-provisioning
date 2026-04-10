#!/bin/bash

# Mitjavila Enterprise — LinkedIn Posting Script
# Phase 1: text-only company-page posts using LinkedIn Posts API

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -f "$SCRIPT_DIR/.env.local" ]; then
  # shellcheck disable=SC1091
  source "$SCRIPT_DIR/.env.local"
else
  echo "❌ Error: .env.local not found"
  exit 1
fi

MESSAGE="${1:-}"
LINKEDIN_API_VERSION="${LINKEDIN_API_VERSION:-202603}"

if [ -z "$MESSAGE" ]; then
  echo 'Usage: bash post-to-linkedin.sh "Your LinkedIn post text here"'
  exit 1
fi

if [ -z "${LINKEDIN_ACCESS_TOKEN:-}" ]; then
  echo "❌ Error: LINKEDIN_ACCESS_TOKEN is missing from .env.local"
  exit 1
fi

if [ -z "${LINKEDIN_ORGANIZATION_URN:-}" ]; then
  echo "❌ Error: LINKEDIN_ORGANIZATION_URN is missing from .env.local"
  exit 1
fi

BODY=$(LINKEDIN_AUTHOR_URN="$LINKEDIN_ORGANIZATION_URN" LINKEDIN_MESSAGE="$MESSAGE" python3 - <<'PY'
import json
import os
print(json.dumps({
    "author": os.environ["LINKEDIN_AUTHOR_URN"],
    "commentary": os.environ["LINKEDIN_MESSAGE"],
    "visibility": "PUBLIC",
    "distribution": {
        "feedDistribution": "MAIN_FEED",
        "targetEntities": [],
        "thirdPartyDistributionChannels": []
    },
    "lifecycleState": "PUBLISHED",
    "isReshareDisabledByAuthor": False
}))
PY
)

HEADERS_FILE=$(mktemp)
BODY_FILE=$(mktemp)
trap 'rm -f "$HEADERS_FILE" "$BODY_FILE"' EXIT

HTTP_STATUS=$(curl -sS \
  -o "$BODY_FILE" \
  -D "$HEADERS_FILE" \
  -w "%{http_code}" \
  -X POST "https://api.linkedin.com/rest/posts" \
  -H "Authorization: Bearer ${LINKEDIN_ACCESS_TOKEN}" \
  -H "Content-Type: application/json" \
  -H "Linkedin-Version: ${LINKEDIN_API_VERSION}" \
  -H "X-Restli-Protocol-Version: 2.0.0" \
  --data "$BODY")

if [ "$HTTP_STATUS" = "201" ]; then
  POST_URN=$(grep -i '^x-restli-id:' "$HEADERS_FILE" | head -1 | cut -d':' -f2- | tr -d '\r' | xargs)
  echo "✅ LinkedIn post published!"
  echo "Post URN: ${POST_URN:-[not returned]}"
  echo "Author: ${LINKEDIN_ORGANIZATION_URN}"
  echo "Time: $(date '+%Y-%m-%d %H:%M:%S %Z')"
else
  echo "❌ LinkedIn post failed"
  echo "HTTP Status: $HTTP_STATUS"
  echo "Response:"
  cat "$BODY_FILE"
  exit 1
fi
