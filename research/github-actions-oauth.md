# GitHub Actions + Claude OAuth Setup
Researched: 2026-04-02 | Status: Active | Refresh: as-needed

## OAuth vs API key in Actions
- claude-code-action supports CLAUDE_CODE_OAUTH_TOKEN (Max sub, no extra API cost)
- Generate once: claude setup-token  ->  add as repo secret
- API key also works but charges per-token on top of subscription
- Prefer OAuth unless you need non-interactive headless agent billing

## Secret setup (per repo)
  claude setup-token  # outputs token
  gh secret set CLAUDE_CODE_OAUTH_TOKEN --body "<token>"
  gh secret set PERPLEXITY_API_KEY --body "pplx-..."  # weekly cron only
  # GITHUB_TOKEN is auto-provided by Actions — no action needed

## claude-code-action usage
  uses: anthropics/claude-code-action@v1
  with:
    claude_code_oauth_token: ${{ secrets.CLAUDE_CODE_OAUTH_TOKEN }}
    # NOT anthropic_api_key — that triggers per-token billing

## OAuth token refresh
  - Tokens expire; re-run: claude setup-token && gh secret set CLAUDE_CODE_OAUTH_TOKEN
  - grll/claude-code-action fork supports auto-refresh if preferred

## GitHub CLI for repo operations (no MCP needed)
  gh repo create <name> --private --clone --description ""
  gh pr create --title "" --body "" --draft --base main
  gh pr list --state open
  gh pr merge <num> --squash
  gh issue create --title "" --body "" --label ""
  gh run list --limit 5
  gh run watch <id>

## Perplexity in Actions (scoped, not local)
  - Runs only inside harness-update.yml cron job
  - env: PERPLEXITY_API_KEY: ${{ secrets.PERPLEXITY_API_KEY }}
  - Claude calls it via npx @perplexity-ai/mcp-server inside the action container
  - Zero token overhead in local Claude sessions
