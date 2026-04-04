# Prompt: First-Time Machine Setup

**When to use:** You're on a new machine or fresh environment and want the harness available globally.

**Usage:** Open Claude Code anywhere and paste this prompt.

---

```
Set up the claude-harness on this machine for the first time.

Step 1 — Check what's already installed:
  ls ~/.claude/ 2>/dev/null
  cat ~/.claude/CLAUDE.md 2>/dev/null | head -5

Step 2 — Clone the global harness:
  If ~/claude-harness/ does not exist:
    git clone https://github.com/dividedby/claude-harness ~/claude-harness
  If it does exist:
    git -C ~/claude-harness pull --rebase origin main

Step 3 — Wire it into global Claude config:
  If ~/.claude/CLAUDE.md does not exist: touch ~/.claude/CLAUDE.md
  If the file does NOT already contain "@~/claude-harness/CLAUDE.md":
    Prepend this line to ~/.claude/CLAUDE.md:
    @~/claude-harness/CLAUDE.md

Step 4 — Verify:
  echo "=== Global CLAUDE.md ===" && cat ~/.claude/CLAUDE.md
  echo "=== Harness CLAUDE.md ===" && head -5 ~/claude-harness/CLAUDE.md
  echo "=== Skills ===" && ls ~/claude-harness/skills/

Step 5 — Check prerequisites:
  which gh && gh auth status || echo "WARNING: gh CLI not authenticated — needed for PR creation"
  which jq || echo "WARNING: jq not installed — needed for guard-protected-files.sh hook"
  which curl || echo "WARNING: curl not installed"

Report: what was installed, what was already present, and any prerequisite warnings.
```
