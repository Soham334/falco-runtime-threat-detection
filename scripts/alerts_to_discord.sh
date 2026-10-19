#!/usr/bin/env bash
# Optional: forward new Falco alerts to Discord.
# Usage: DISCORD_WEBHOOK_URL=https://discord.com/api/webhooks/... ./scripts/alerts_to_discord.sh
: "${DISCORD_WEBHOOK_URL:?Set DISCORD_WEBHOOK_URL first}"
tail -n0 -F "$(dirname "$0")/../logs/events.log" | while read -r line; do
  payload=$(python3 -c 'import json,sys; print(json.dumps({"content": "🚨 Falco: " + sys.argv[1][:1800]}))' "$line")
  curl -s -H "Content-Type: application/json" -d "$payload" "$DISCORD_WEBHOOK_URL" >/dev/null
done
