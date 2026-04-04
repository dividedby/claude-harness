#!/usr/bin/env bash
# StopFailure — appends structured JSON record to bounded log
LOG="${CLAUDE_PLUGIN_DATA:-$HOME/.claude/plugins/data/claude-harness}/failures.log"
TS=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
PROJECT=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
BRANCH=$(git branch --show-current 2>/dev/null || echo "unknown")
echo "{\"ts\":\"$TS\",\"project\":\"$PROJECT\",\"branch\":\"$BRANCH\",\"event\":\"StopFailure\"}" >> "$LOG"
# Bound log at 500 lines
[ -f "$LOG" ] && [ "$(wc -l < "$LOG")" -gt 500 ] && tail -400 "$LOG" > "$LOG.tmp" && mv "$LOG.tmp" "$LOG"
