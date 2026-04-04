# Harness Architecture — v2

## Design Principles

1. **Root context is sacred** — CLAUDE.md stays ≤50 lines of hard behavioral rules only.
2. **Skills are the lazy-loading layer** — everything domain-specific loads on trigger.
3. **Agents run in isolated context** — adversarial reviewer never sees its own parent context.
4. **Hooks are deterministic** — safety enforcement via hooks, not advisory prose.
5. **Self-improvement is queued, never immediate** — all harness mutations produce draft PRs.
6. **No always-on MCPs** — external services via CLI tools or conditional bash calls.

## Loading Budget

| Component | Always-In-Context Tokens |
|-----------|--------------------------|
| CLAUDE.md (29 lines) | ~400 |
| Auto memory (MEMORY.md, first 200 lines) | ~3,000 |
| Skill metadata (8 skills × ~100 tokens) | ~800 |
| **Total startup overhead** | **~4,200** |

Old harness: ~15,000+ always-in-context tokens.

## Skill Trigger Map

| Skill | Auto-trigger phrases | Manual |
|-------|---------------------|--------|
| code-review | "review this", "check the diff", "look for bugs" | `/code-review` |
| requirements-check | "validate requirements", "check this spec", "is this PRD complete" | `/requirements-check` |
| stack-recommend | "what stack should I use", "recommend a framework" | `/stack-recommend` |
| freshness-check | "check dependencies", "are we outdated" | `/freshness-check` |
| bootstrap | manual only | `/bootstrap [target]` |
| migrate-project | manual only | `/migrate-project [path]` |
| self-improve | "add to harness", "remember this for harness" | `/self-improve` |
| research-docs | "look up", "latest docs for", "what changed in" | `/research-docs [query]` |

## Control Flow

```
Session Start
├── CLAUDE.md loaded (~400 tokens, re-injected every turn)
├── MEMORY.md loaded (auto, first 200 lines / 25KB)
├── Skill metadata loaded (8 × ~100 tokens)
├── SessionStart hook → session-start.sh (idempotent, hourly max)
└── [User prompt]
    ├── Trigger matches skill → Level 2 SKILL.md loaded
    ├── "review" → adversarial-reviewer agent (isolated context)
    ├── "housekeeping" → repo-housekeeper agent (worktree isolation)
    └── PreToolUse → guard-protected-files.sh (.env blocked, CLAUDE.md warned)

Context ~64-75%
└── PreCompact → pre-compact.sh → context stub written

Turn ends with API error
└── StopFailure → stop-failure.sh → JSON record appended to failures.log
```

## Install Model

**Primary:** Plugin
```bash
claude plugin install claude-harness@dividedby --scope user
```

**Fallback:** Repo clone
```bash
git clone https://github.com/dividedby/claude-harness ~/claude-harness
echo "@~/claude-harness/CLAUDE.md" >> ~/.claude/CLAUDE.md
```

## Weekly Refresh Flow

```
GitHub Actions (Monday 06:00 UTC)
└── Query Perplexity API
    ├── NO_CHANGE → log and exit (no PR noise)
    └── CHANGES → create harness/weekly-refresh-DATE branch
        └── Write findings to docs/weekly-refresh-staging.md
            └── Open draft PR (human reviews + applies)
```
