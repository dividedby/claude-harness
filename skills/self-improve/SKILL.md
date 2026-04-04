---
name: self-improve
description: >
  Captures harness improvement opportunities and queues them as draft PRs.
  Use for: "add to harness", "remember this for harness", "improve harness based on session".
  NEVER modifies harness in-session. Always produces a draft PR.
disable-model-invocation: true
---

Capture improvement: $ARGUMENTS

1. Classify: project-specific or global harness improvement?
2. If project-specific: write to `.claude/CLAUDE.md` or `.claude/rules/<topic>.md`; commit directly; done.
3. If global:
   ```bash
   git -C ~/claude-harness checkout -b harness/improve-$(echo "$ARGUMENTS" | tr ' ' '-' | tr '[:upper:]' '[:lower:]' | cut -c1-40)
   # [write proposed change to target file]
   git -C ~/claude-harness add -A
   git -C ~/claude-harness commit -m "improve: $ARGUMENTS"
   gh -R dividedby/claude-harness pr create \
     --title "Harness improvement: $ARGUMENTS" \
     --body "## What\n[change]\n\n## Why\n[session context]" \
     --draft
   ```
4. Print: `IMPROVEMENT QUEUED — Review at: <PR URL>`
5. NEVER auto-merge. NEVER modify harness files in current session directly.
