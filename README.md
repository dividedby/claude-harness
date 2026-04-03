# Claude Harness v4

Lean Claude Code harness. Minimizes context bloat, uses Perplexity for fresh knowledge, keeps automation light.

## Quick setup

```bash
tar -xzf claude-harness-v4-final.tar.gz

# 1. Install Perplexity MCP globally (one-time per machine)
claude mcp add perplexity --scope user --env PERPLEXITY_API_KEY="pplx-..." -- npx -y @perplexity-ai/mcp-server

# 2. Connect GitHub Actions (one-time per repo)
/install-github-app
gh secret set ANTHROPIC_API_KEY --body "sk-ant-..."
gh secret set PERPLEXITY_API_KEY --body "pplx-..."

# 3. Fill in project context
# Edit docs/project.md
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
| `/project:dream` | Research latest patterns + consolidate memory |

## Memory system

```
MEMORY.md                        index only, always loaded, entries <=150 chars
research/claude-code-patterns.md loaded on demand
research/perplexity-mcp.md       loaded on demand
```

Rule: memory is a hint. Verify against real files before acting.

## Perplexity MCP (4 tools)

- `perplexity_ask` - sonar-pro, quick Q&A (most common)
- `perplexity_search` - facts/news (always max_results: 3)
- `perplexity_research` - deep analysis (expensive, use sparingly)
- `perplexity_reason` - complex logic

Weekly automation: GitHub Actions runs Sunday 2am CDT, researches latest patterns via Perplexity, updates research/ topic files, opens PR. Never auto-merges.

## GitHub auth

```bash
gh auth login
/install-github-app
gh secret set ANTHROPIC_API_KEY --body "sk-ant-..."
gh secret set PERPLEXITY_API_KEY --body "pplx-..."
```

## MCP philosophy

One MCP (Perplexity, user-scoped). Everything else uses CLI tools:
- GitHub: gh CLI
- Browser testing: npx playwright
- DNS: curl + Cloudflare API

## Source leak insights applied

From March 2026 Claude Code source leak:
- Skeptical memory: verify-before-act rule in CLAUDE.md
- Index-only MEMORY.md: entries <=150 chars, content in topic files
- autoDream via /project:dream
- Prompt cache stability: warn against mid-session edits
- Adversarial verification: Karen runs adversarial challenge phase
- Magic Docs: research/ topic files stay fresh via weekly automation
