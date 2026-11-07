#!/usr/bin/env bash
# Read-only: prints an asset's field NAMES and TYPES only, no values.
# Usage: FRAME_REF=<frame> ./asset-shape.sh <assetType> <assetId>
# The key goes in through a file descriptor, so it never appears in arguments or logs.
set -euo pipefail
: "${FRAME_API_KEY:?set FRAME_API_KEY}"; REF="${FRAME_REF:?set FRAME_REF}"
TYPE="${1:?assetType e.g. text-areas}"; ID="${2:?assetId}"
curl -sf -H @<(printf 'Authorization: Bearer %s\n' "$FRAME_API_KEY") \
  "https://api.framevr.io/automate/v1/asset/$REF/$TYPE/$ID" |
python3 -c '
import json,sys
def walk(o,p=""):
    if isinstance(o,dict):
        for k,v in o.items():
            print(f"{p}{k}: {type(v).__name__}"); walk(v,p+"  ")
    elif isinstance(o,list) and o: print(f"{p}[list item]"); walk(o[0],p+"  ")
walk(json.load(sys.stdin))'
