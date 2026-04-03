#!/bin/bash
INPUT=$(cat)
CMD=$(echo "$INPUT" | jq -r '.tool_input.command // empty' 2>/dev/null)
BLOCKED=("rm -rf /" "DROP TABLE" "DROP DATABASE" "> /dev/sda" "mkfs" "dd if=")
for pattern in "${BLOCKED[@]}"; do
  if echo "$CMD" | grep -qF "$pattern"; then
    echo '{"decision":"block","reason":"Dangerous command pattern blocked"}'
    exit 0
  fi
done
echo '{"decision":"approve"}'
