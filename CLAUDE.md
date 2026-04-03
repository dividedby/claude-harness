# Claude Harness v4
Read docs/project.md for project context. Read MEMORY.md for session continuity.
Memory is a hint - verify against real files before acting.

## Core rules
- Plan before implementing. Use /project:plan for anything over 30 min.
- Never edit CLAUDE.md mid-session (breaks prompt cache permanently).
- Prefer CLI tools (gh, npx playwright, curl) over MCP for routine tasks.
- Keep changes minimal and targeted. No refactors unless explicitly requested.
- Run /project:done before claiming a feature complete.

## Context management
- MEMORY.md is the session index. research/ files hold details.
- If something contradicts MEMORY.md, the codebase is truth.
- Clear session when context reaches ~60%.

## Perplexity
- perplexity_ask for quick lookups. perplexity_research for deep audits.
- Always max_results: 3, max_tokens_per_page: 512 on perplexity_search.
- Findings go in research/<topic>.md with index entry in MEMORY.md.

## Commands
/project:plan  /project:review  /project:done  /project:test
/project:deploy  /project:clean  /project:fresh  /project:dream
