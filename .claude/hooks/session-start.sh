#!/bin/bash
LOCK=".claude/.session-started"
[ -f "$LOCK" ] && exit 0
touch "$LOCK"
echo ""
echo "=== Harness v4 ==="
echo "Memory: MEMORY.md (index only - verify before acting)"
echo "Project: docs/project.md"
echo "Commands: plan review done test deploy clean fresh dream"
echo "=================="
echo ""
