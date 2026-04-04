# Prompt: Update the Harness in a Project

**When to use:** The harness repo has been updated and you want to pull the latest version into an existing project's `./claude-harness/` directory without breaking anything.

**Usage:** Paste in a Claude Code session at the project root.

---

```
Update the harness in this project to the latest version.

Step 1 — Check current state:
  cd ./claude-harness && git log --oneline -3 && git status && cd ..

Step 2 — Pull latest:
  git -C ./claude-harness pull --rebase origin main

Step 3 — Check for migration notes:
  git -C ./claude-harness log --oneline ORIG_HEAD..HEAD 2>/dev/null | head -20
  If the log mentions "breaking", "migration", or "CLAUDE.md" changes:
    Read ./claude-harness/docs/migration-guide.md and flag any steps that apply to this project.

Step 4 — Validate the harness @-reference is still in .claude/CLAUDE.md:
  grep -n "@./claude-harness/CLAUDE.md" .claude/CLAUDE.md || echo "WARNING: harness reference missing"
  If missing: add @./claude-harness/CLAUDE.md at the top of .claude/CLAUDE.md

Step 5 — Commit:
  git add ./claude-harness .claude/
  git commit -m "chore: update harness to latest" 2>/dev/null || echo "nothing new to commit"

Report: which commits were pulled, any breaking changes flagged, and current harness version.
```
