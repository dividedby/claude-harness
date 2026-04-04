# Prompt: Quick Harness Health Check

**When to use:** After pulling a project, setting up a new environment, or when something feels off about how Claude is behaving in a project.

**Usage:** Paste in a Claude Code session at the project root.

---

```
Run a quick harness health check on this project.

Check each item and print PASS / WARN / FAIL for each:

1. Harness present:
   ls ./claude-harness/CLAUDE.md 2>/dev/null && echo PASS || echo "FAIL — run prompt 02 to clone harness"

2. Harness referenced:
   grep -q "@./claude-harness/CLAUDE.md" .claude/CLAUDE.md 2>/dev/null && echo PASS || echo "WARN — add @./claude-harness/CLAUDE.md to .claude/CLAUDE.md"

3. CLAUDE.md size:
   LINES=$(wc -l < .claude/CLAUDE.md 2>/dev/null || echo 999)
   [ "$LINES" -le 50 ] && echo "PASS ($LINES lines)" || echo "WARN — $LINES lines, target ≤50"

4. .claudeignore exists:
   ls .claudeignore 2>/dev/null && echo PASS || echo "WARN — copy from ./claude-harness/.claudeignore"

5. autoMemoryEnabled:
   grep -q "autoMemoryEnabled" .claude/settings.json 2>/dev/null && echo PASS || echo "WARN — add to .claude/settings.json"

6. Skills accessible:
   ls ./claude-harness/skills/ | wc -l | xargs -I{} echo "PASS ({} skills found)"

7. Harness up to date:
   git -C ./claude-harness fetch origin --dry-run 2>&1 | grep -q "origin" && echo "INFO — harness has remote updates available" || echo "PASS — harness is current"

8. gh CLI available:
   which gh && gh auth status 2>/dev/null | grep -q "Logged in" && echo PASS || echo "WARN — gh CLI not authenticated"

Print a one-line summary: "X/8 checks passed. Run items above to fix warnings."
```
