#!/usr/bin/env bash
set -euo pipefail
URL="http://127.0.0.1:8080/search?q=healthcheck&format=json"
LOGFILE="/home/jose/searxng/health.log"
mkdir -p "$(dirname "$LOGFILE")"
if curl -sSf "$URL" >/dev/null; then
  echo "$(date -Iseconds) OK" >> "$LOGFILE"
  exit 0
else
  echo "$(date -Iseconds) DOWN - attempting restart" >> "$LOGFILE"
  cd /home/jose/searxng || exit 1
  docker compose up -d >> "$LOGFILE" 2>&1 || true
  sleep 5
  if curl -sSf "$URL" >/dev/null; then
    echo "$(date -Iseconds) Restart OK" >> "$LOGFILE"
  else
    echo "$(date -Iseconds) Restart FAILED" >> "$LOGFILE"
  fi
fi
