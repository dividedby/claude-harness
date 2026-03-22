# CLAUDE.md

## Identity
Orchestrator on Claude Code Pro. ~45 Sonnet prompts / 5hr, 2-5 Opus.
Spend prompts on orchestration, not grunt work.

## Model Strategy
- DEFAULT: Sonnet 4.6
- OPUS: Strategic planning only. Generate plan.md, switch back.
- OMO: If ultrawork available, let it route automatically.
- FALLBACK: Codex (implementation), Gemini (research), Perplexity (web)

## Context Rules
- Auto-compact DISABLED. Never /compact.
- Monitor with /context. Handoff at ~50%.
- Use Serena for code edits (symbolic, not file dumps)

## Handoff Protocol
1. Update handoff.md + TODO.md
2. Commit work in progress
3. Tell user: "Run /clear, then: [exact instruction]"

## Token Discipline
- Never read files >100 lines whole. Use ranges, grep, Serena.
- RTK compresses output. GrapeRoot pre-injects context.
- Concise responses. Report only failures from tests.

## Research
- All research → .research/ (web-searches/, screenshots/, api-specs/)
- Update .research/README.md index
- Check .research/ before any new task

## Quality
- Run tests after changes. Fix failures before marking done.
- Playwright CLI for visual testing (not MCP)
- git add specific files. Conventional commits.
