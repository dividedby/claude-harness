# One-Time Machine Setup

## Claude Code
  npm install -g @anthropic-ai/claude-code

## gh CLI
  # macOS
  brew install gh
  gh auth login

## OAuth token (Max subscription - no extra API cost in Actions)
  claude setup-token
  # -> copy output for CLAUDE_CODE_OAUTH_TOKEN repo secret

## Connect a repo to GitHub Actions
  cd <your-repo>
  /install-github-app        # inside Claude Code
  gh secret set CLAUDE_CODE_OAUTH_TOKEN --body "<token>"
  gh secret set PERPLEXITY_API_KEY --body "pplx-..."

## Playwright (for /project:test)
  npm install -g @playwright/test
  npx playwright install chromium

## No global MCP install needed
  # Perplexity MCP runs only inside GitHub Actions containers
  # gh CLI handles all GitHub operations locally
  # Zero MCPs = zero session token overhead

## Prompt cache - protect your session
  # 14 sticky break vectors (March 2026 source leak)
  # Never edit CLAUDE.md mid-session
  # Configure everything before starting a session
  # Extended thinking: decide before you start, don't toggle

## autoDream (optional)
  # /memory inside Claude Code to toggle auto-consolidation
  # Or paste prompts/dream.md manually
