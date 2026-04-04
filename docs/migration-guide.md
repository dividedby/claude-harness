# Migration Guide: Old Harness → v2

## Before You Start
**Time:** 30-60 min | **Risk:** Low | **Rollback:** `git revert`

---

## Step 1: Snapshot
```bash
cd ~/claude-harness
git add -A && git commit -m "snapshot: old harness v1 before v2 migration"
```

## Step 2: Delete Dead Files
```bash
# Always delete:
rm -f .claude/hooks/skill-tracker.sh          # Writes to unread log on every bash call
rm -rf .claude/skills/                         # Pre-native format (check for YAML frontmatter first)

# Evaluate: old commands that restate agent content
# → delete if no unique value beyond what the skill says
ls .claude/commands/
```

## Step 3: Slim CLAUDE.md
Current harness CLAUDE.md is likely 100-300+ lines. Target: ≤50 lines.

**Deletion test:** For each line: "Would removing this cause Claude to make a worse decision?" If no → cut.

**Move to `.claude/rules/`:**
- Domain-specific coding rules → `code-style.md`
- API conventions → `api-conventions.md`
- Path-specific rules → add `paths:` frontmatter

**Delete outright:**
- Project architecture overviews
- Dependency lists (Claude reads package.json)
- Platitudes ("write clean code")
- Anything also in README.md

## Step 4: Install v2

### Plugin (recommended)
```bash
claude plugin install claude-harness@dividedby --scope user
```

### Repo clone (fallback)
```bash
git clone https://github.com/dividedby/claude-harness ~/claude-harness
echo "@~/claude-harness/CLAUDE.md" >> ~/.claude/CLAUDE.md
```

## Step 5: Migrate Each Project
```bash
cd /path/to/project
# Uses the migrate-project skill automatically
claude -p "/migrate-project ."
```

Or manually:
1. Apply deletion test to `.claude/CLAUDE.md`
2. Create `.claudeignore` (copy from harness)
3. Verify no broken hook paths in `.claude/settings.json`

## Step 6: Validate
```bash
claude
> /memory                         # Verify CLAUDE.md loads
> review this code: const x = 1   # Verify code-review skill triggers
> /hooks                           # Verify hooks configured
```

## Step 7: Commit Migration
```bash
git checkout -b harness/v2-migration
git add -A
git commit -m "chore: migrate to harness v2 — lean CLAUDE.md, native skills, safety hooks"
gh pr create --title "Harness v2 migration" --draft
```

## What Changed

| Area | v1 | v2 |
|------|----|----|
| CLAUDE.md | 100-300+ lines | 29 lines |
| Skills | Custom pre-native format | Native `.claude-plugin/` |
| skill-tracker.sh | Fires on every bash call | Deleted |
| Commands | Restate agent content | 1-2 line delegates |
| Agents | No frontmatter constraints | Model + tools + isolation |
| Self-improvement | Direct mutation | Draft PRs only |
| Perplexity | Always-on MCP | Conditional bash + scheduled task |
| Safety hooks | None | PreCompact + StopFailure + file-guard |
| Install | Repo clone only | Plugin primary, repo-clone fallback |
