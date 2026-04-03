# Perplexity MCP - Lean Usage Guide
Researched: 2026-04-02 | Status: Active | Refresh: monthly

## Install (one-time, user scope)

    claude mcp add perplexity --scope user --env PERPLEXITY_API_KEY="pplx-..." -- npx -y @perplexity-ai/mcp-server

Package: @perplexity-ai/mcp-server (Perplexity AI maintained)
Docs: https://docs.perplexity.ai/docs/getting-started/integrations/mcp-server

## 4 tools and cost tiers

| Tool | Model | Best for | Cost |
|---|---|---|---|
| perplexity_search | sonar | URLs, facts, news | $1/$1 per M |
| perplexity_ask | sonar-pro | Q&A with web context | $3/$15 per M |
| perplexity_research | sonar-deep-research | Deep audits, reports | $2/$8 + searches |
| perplexity_reason | sonar-reasoning-pro | Logic, complex decisions | $2/$8 per M |

## Lean parameters (always use)
- perplexity_search: max_results: 3, max_tokens_per_page: 512
- Default max_results is 10 - always override to 3
- perplexity_research: use sparingly - adds $5/1K search queries

## Weekly harness update workflow
1. GitHub Actions cron (Sun 7am UTC) triggers harness-update.yml
2. Claude uses perplexity_ask to check for Claude Code changes
3. Diffs against research/claude-code-patterns.md
4. Updates topic file + MEMORY.md + opens PR for review
5. Never auto-pushes to main
