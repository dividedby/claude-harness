# claude-harness v2

Lean, automatic, self-improving Claude Code harness.

**Philosophy:** Root context ≤50 lines. Skills load on demand. Hooks enforce safety. Self-improvement queues as draft PRs.

## Install

```bash
# Recommended
claude plugin install claude-harness@dividedby --scope user

# Fallback
git clone https://github.com/dividedby/claude-harness ~/claude-harness
echo "@~/claude-harness/CLAUDE.md" >> ~/.claude/CLAUDE.md
```

## Capabilities

| Capability | How to Invoke |
|-----------|---------------|
| Code review | "review this code" / `/code-review` |
| Requirements verification | "validate this spec" / `/requirements-check` |
| Stack recommendation | "what stack for X" / `/stack-recommend` |
| Dependency freshness | "check dependencies" / `/freshness-check` |
| Bootstrap | `/bootstrap [machine\|project-path]` |
| Migrate old project | `/migrate-project [path]` |
| Capture improvement | "add to harness" / `/self-improve` |
| Research / docs | "look up X" / `/research-docs [query]` |
| Repo housekeeping | "clean stale branches" → auto-spawns repo-housekeeper |
| Weekly refresh | Automated (Monday 06:00 UTC via GitHub Actions) |

## Token Budget

| Component | Tokens |
|-----------|--------|
| CLAUDE.md (29 lines) | ~400 |
| Auto memory | ~3,000 |
| Skill metadata (8 skills) | ~800 |
| **Startup total** | **~4,200** |

Old harness: ~15K+ tokens always in context.

## Docs

- [Architecture](docs/architecture.md)
- [Migration Guide](docs/migration-guide.md)
- [Usage Examples](docs/usage-examples.md)
- [Session Learnings Pipeline](docs/session-learnings-pipeline.md)
- [Patch Strategy](docs/patch-strategy.md)

## Weekly Refresh Setup

Add `PERPLEXITY_API_KEY` to repository secrets. Draft PRs land in `harness/weekly-refresh-*` branches each Monday.
