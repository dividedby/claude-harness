# ~/.claude.json Settings Reference

Configure via /config inside Claude Code.

## Key settings
- autoConnectIde: true
- editorMode: vim or normal
- showTurnDuration: false (hides "Cooked for Xm Xs" noise)
- autoCompactEnabled: true

## autoDream
Toggle: /memory or /config -> Auto memory
Manual: /project:dream or paste prompts/harness-dream.md
When enabled: MEMORY.md index maintained, topic files in research/, consolidates after 5 sessions + 24h

## Perplexity MCP - global install (run once per machine)

    claude mcp add perplexity --scope user --env PERPLEXITY_API_KEY="pplx-..." -- npx -y @perplexity-ai/mcp-server
    claude mcp list

## GitHub auth

    gh auth login
    /install-github-app   (inside Claude Code in your repo)
    gh secret set ANTHROPIC_API_KEY --body "sk-ant-..."
    gh secret set PERPLEXITY_API_KEY --body "pplx-..."

OAuth (Pro/Max - no extra API cost):
    claude setup-token
    # Add output as CLAUDE_CODE_OAUTH_TOKEN repo secret

## Prompt cache - protect your cache (March 2026 source leak)

14 break vectors cause sticky invalidation (stays broken all session):
- Reordering CLAUDE.md sections
- Toggling extended thinking mid-session
- Changing MCP server configs mid-session

Best practice: configure everything before starting a session.
