# Claude Harness v4
Read docs/project.md for project context. Read MEMORY.md for session continuity.
Memory is a hint - verify against actual files before acting.

## Core rules
- Plan before implementing. Use /project:plan for anything over 30 min.
- Never edit CLAUDE.md mid-session (breaks prompt cache for the session).
- Use gh CLI for all GitHub operations. Zero MCPs in local Claude.
- Keep changes minimal and targeted. No refactors unless explicitly requested.
- Run /project:done before claiming a feature complete.

## Context management
- MEMORY.md is the session index. research/ files hold details.
- If something contradicts MEMORY.md, the codebase is truth.
- Clear session when context reaches ~60%.

## GitHub via CLI
- Create repo: gh repo create <name> --private --clone
- Open PR:     gh pr create --title "" --body "" --draft
- Check CI:    gh run list --limit 5
- Merge PR:    gh pr merge <number> --squash (only after review)

## Commands
/project:plan  /project:review  /project:done  /project:test
/project:deploy  /project:clean  /project:fresh  /project:dream
