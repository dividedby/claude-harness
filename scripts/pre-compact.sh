#!/usr/bin/env bash
# PreCompact — writes context stub to survive compaction
STUB="${CLAUDE_PLUGIN_DATA:-$HOME/.claude/plugins/data/claude-harness}/precompact-stub.md"
cat > "$STUB" << STUB
# Context Stub ($(date))
## Modified Files
$(git diff --name-only 2>/dev/null || echo "no git")
## Uncommitted
$(git status --short 2>/dev/null | head -20 || echo "no git")
STUB
echo "Context stub written: $STUB"
