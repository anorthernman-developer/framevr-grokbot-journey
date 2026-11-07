#!/usr/bin/env bash
# Read-only: prints the HTTP status for each documented GET. Prints no bodies.
# The key goes in through a file descriptor (printf is a shell builtin),
# so it never shows up in process arguments or logs.
set -euo pipefail
: "${FRAME_API_KEY:?set FRAME_API_KEY}"; REF="${FRAME_REF:-letscollaborate}"
for p in frame member admin scene; do
  code=$(curl -s -o /dev/null -w '%{http_code}' \
    -H @<(printf 'Authorization: Bearer %s\n' "$FRAME_API_KEY") \
    "https://api.framevr.io/automate/v1/$p/$REF")
  echo "$p: $code"
done
