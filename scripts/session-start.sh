#!/usr/bin/env bash
# SessionStart — idempotent, hourly max (fork-bomb guard)
MARKER="${CLAUDE_PLUGIN_DATA:-$HOME/.claude/plugins/data/claude-harness}/session-start-last-run"
NOW=$(date +%s)
if [ -f "$MARKER" ]; then
  LAST=$(cat "$MARKER" 2>/dev/null || echo 0)
  if [ $((NOW - LAST)) -lt 3600 ]; then exit 0; fi
fi
echo "$NOW" > "$MARKER"
echo "💡 /context to check token usage | /memory to review loaded instructions"
