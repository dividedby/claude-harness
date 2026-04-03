#!/bin/bash
INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty' 2>/dev/null | head -1)
if [ -z "$CMD" ]; then echo '{"decision":"approve"}'; exit 0; fi
HISTORY=".claude/.cmd-history"
echo "$CMD" >> "$HISTORY" 2>/dev/null
SAME=$(tail -5 "$HISTORY" 2>/dev/null | sort | uniq -c | sort -rn | head -1 | awk '{print $1}')
if [ "${SAME:-0}" -ge 5 ]; then
  rm -f "$HISTORY"
  echo '{"decision":"block","reason":"Same command 5+ times - possible loop. Review manually."}'
  exit 0
fi
echo '{"decision":"approve"}'
