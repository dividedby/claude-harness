#!/usr/bin/env bash
# PreToolUse — blocks writes to secrets files, warns on CLAUDE.md edits
INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty' 2>/dev/null)
[ -z "$FILE" ] && exit 0
if echo "$FILE" | grep -qE '(\.env$|\.env\.[^.]+$|secrets\.|credentials\.|id_rsa|\.pem$|\.key$)'; then
  echo "BLOCKED: Refusing to write to protected file: $FILE" >&2
  exit 2
fi
if echo "$FILE" | grep -qE '(CLAUDE\.md|\.claude/settings\.json)'; then
  echo "WARNING: Editing $FILE breaks prompt cache for this session. Consider editing after the session." >&2
fi
exit 0
