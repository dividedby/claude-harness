# Claude Harness v4

Lean Claude Code harness. Zero MCPs locally. GitHub via gh CLI. Perplexity runs only in GitHub Actions.

## Philosophy
- **Zero MCPs in local Claude.** GitHub MCP + Perplexity MCP each add 5K–55K tokens to every session baseline — before you type a word.
- **gh CLI for everything GitHub.** Same results, ~80 tokens per call instead of 14K+ schema load.
- **Perplexity stays in Actions.** Weekly cron does the research and opens a PR. You review and merge.
- **Claude OAuth, not API key.** GitHub Actions uses your Max subscription token — no extra billing.

## Quick setup (new project)

```bash
# 1. Extract harness
unzip claude-harness-v4-final.zip
cp -r claude-harness-v4/. .

# 2. Fill in project context
# Edit docs/project.md

# 3. Wire GitHub Actions (one-time per repo)
/install-github-app
gh secret set CLAUDE_CODE_OAUTH_TOKEN --body "$(claude setup-token)"
gh secret set PERPLEXITY_API_KEY --body "pplx-..."
```

## Commands

| Command | When |
|---|---|
| `/project:plan` | Before any new feature or app |
| `/project:review` | After implementing, before commit |
| `/project:done` | Reality check before claiming complete |
| `/project:test` | Browser UI + flow verification |
| `/project:deploy` | Cloudflare DNS + Traefik wiring |
| `/project:clean` | Post-feature or weekly cleanup |
| `/project:fresh` | Stack audit before major work |
| `/project:dream` | Memory consolidation (local) |
| `/project:new-repo` | Create a new private GitHub repo |

## GitHub Actions (automated)

| Workflow | Trigger | What it does |
|---|---|---|
| `harness-update.yml` | Sunday 2am CDT | Perplexity research, updates research/ files, opens PR |
| `pr-review.yml` | Every PR | Claude reviews diff, posts inline comments |
| `issue-to-pr.yml` | Issue labeled `claude` | Implements issue, opens draft PR |

All Actions use `CLAUDE_CODE_OAUTH_TOKEN` (Max sub, no API key needed).

## Secrets per repo

```bash
gh secret set CLAUDE_CODE_OAUTH_TOKEN  # Claude Max OAuth - covers all Actions
gh secret set PERPLEXITY_API_KEY       # weekly research cron only
# GITHUB_TOKEN is auto-provided by Actions
```

## Memory system

```
MEMORY.md                          always in context, index only (<=150 chars/entry)
research/claude-code-patterns.md   on-demand, updated by Actions weekly
research/github-actions-oauth.md   on-demand, updated by Actions weekly
```

Memory is a hint. Always verify against real files before acting.

## See also

- `prompts/` — 10 ready-to-paste daily prompts
- `global-scope-reference/` — one-time machine setup guide
