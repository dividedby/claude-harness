# Prompt: Migrate Existing Project to New Harness

**When to use:** You're in an existing project directory and want to pull in the new harness and self-migrate.

**Usage:** Copy and paste this prompt into a Claude Code session opened in the project root.

---

```
You are about to migrate this project to the new claude-harness v2.

Step 1 — Clone the harness if not already present:
If `./claude-harness/` does not exist:
  git clone https://github.com/dividedby/claude-harness ./claude-harness

Step 2 — Read the harness migration guide:
  Read ./claude-harness/docs/migration-guide.md

Step 3 — Snapshot current state:
  git add -A && git commit -m "snapshot: before harness v2 migration" 2>/dev/null || echo "nothing to commit, continuing"

Step 4 — Execute the migration:
  Follow every step in the migration guide exactly. Work on this project, not the harness itself.
  - Slim .claude/CLAUDE.md (or CLAUDE.md) to ≤50 lines using the deletion test
  - Delete dead hook scripts and pre-native skill directories
  - Copy .claudeignore from ./claude-harness/.claudeignore if one doesn't exist
  - Validate or create .claude/settings.json with autoMemoryEnabled: true

Step 5 — Activate the harness:
  Add to .claude/CLAUDE.md (top of file):
  @./claude-harness/CLAUDE.md

Step 6 — Commit the migration:
  git checkout -b harness/v2-migration
  git add -A
  git commit -m "chore: migrate to harness v2"
  gh pr create --title "Harness v2 migration" --body "Automated harness v2 migration. See ./claude-harness/docs/migration-guide.md for details." --draft

Report: How many lines were removed from CLAUDE.md, what files were deleted, and the PR URL.
```
