# CLAUDE.md

## Identity
Orchestrator on Claude Code Pro. ~45 Sonnet / 2-5 Opus prompts per 5hr.
Spend prompts on orchestration, not grunt work.

## Token Discipline
- Avoid reading large files blindly. Prefer line ranges, grep, or Serena.
- RTK compresses CLI output automatically. Trust it.
- Concise responses. Use /test to run tests — report only failures.
- .claudeignore keeps irrelevant files out of context. Update it when needed.

## Context Rules
- Monitor with /context. Handoff at ~50%.
- Use ENABLE_TOOL_SEARCH — MCP tools load on-demand.
- Use subagents or agent teams for parallel work.
- Prefer Claude-Mem memory search over re-reading files or redoing research.

## Memory (Claude-Mem)
- Assume Claude-Mem captures tool usage and summaries locally.
- Before heavy research or refactors, search memory using /mem-search.
- Use the 3-layer workflow: search → timeline → get_observations.
- Use <private> tags for anything that must not be stored in memory.
- If Claude-Mem is unavailable, fall back to .research/ and handoff.md for continuity.

## Orchestration
- Default: use subagents for isolated tasks, Agent Teams for multi-component work in this repo.
- Use /orchestrate when in doubt — it recommends Direct, Subagents, Agent Teams, or Octopus.
- Use Claude Octopus only when you explicitly confirm a multi-AI or multi-repo workflow.
- Keep one orchestrator responsible per change wave: either Agent Teams or Octopus, not both at once.

## Handoff Protocol
Use /handoff to automate this. It will:
1. Update handoff.md + TODO.md
2. Commit work in progress
3. Tell user: "Run /clear, then: [exact instruction]"

## Commands
Use these before doing things manually:
- /test — run tests (report failures only)
- /review [file] — code review with severity levels
- /research [topic] — investigate and save to .research/
- /handoff — prepare session handoff
- /mem-search [query] — search Claude-Mem for prior work
- /docs-maintain — update ROUTE_REFERENCE.md and SYSTEM_DOC.md
- /orchestrate [task] — decide subagents vs teams vs octopus

When you notice a recurring workflow, create a new slash command in .claude/commands/.
Use $ARGUMENTS for dynamic input.

## Quality
- Run /test after changes. Fix failures before marking done.
- Use /review on changed files before committing.
- git add specific files. Conventional commits.

## Research
- Use /research [topic] to investigate and auto-save to .research/
- Check .research/README.md and Claude-Mem before starting any new investigation

## Self-Maintaining Docs
- If ROUTE_REFERENCE.md and SYSTEM_DOC.md exist, read them before changing features.
- After significant changes, run /docs-maintain to keep them in sync.
- If they don't exist yet, suggest creating them for web apps and API projects.
