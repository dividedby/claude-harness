---
name: migrate-project
description: >
  Migrates a project from old claude-harness v1 to v2. Use for: projects with
  old .claude/ directory structure, legacy commands, or old skill format.
  NOT for fresh projects (use bootstrap instead).
disable-model-invocation: true
---

Migrate project at: $ARGUMENTS

1. Audit: `find .claude/ -type f | sort && wc -l .claude/CLAUDE.md 2>/dev/null`
2. Snapshot: `git add -A && git commit -m "chore: snapshot before harness v2 migration"`
3. Slim CLAUDE.md: apply deletion test to every line; target ≤50 lines; move domain rules to `.claude/rules/`
4. Remove dead files: skill-tracker.sh, commands that restate skill content verbatim
5. Validate hooks: every SessionStart hook needs idempotency guard; add StopFailure hook if missing
6. Create migration PR:
   ```bash
   git checkout -b harness/v2-migration
   git add -A
   git commit -m "chore: migrate to harness v2"
   gh pr create --title "Harness v2 migration" --draft
   ```
7. Print: files changed, lines removed from CLAUDE.md, estimated tokens saved.
