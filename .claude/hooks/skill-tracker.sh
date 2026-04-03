#!/bin/bash
INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty' 2>/dev/null | cut -c1-80)
if [ -n "$CMD" ]; then
  echo "$(date -Iseconds) $CMD" >> .claude/session-log.txt 2>/dev/null || true
fi
