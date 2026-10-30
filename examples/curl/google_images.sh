#!/usr/bin/env bash
# Google Images API – cURL example
# Usage: AUTOM_API_KEY=your-key bash google_images.sh
set -euo pipefail

curl -sS -G "https://api.autom.dev/v1/google/images" \
  -H "x-api-key: ${AUTOM_API_KEY}" \
  --data-urlencode query=lion
