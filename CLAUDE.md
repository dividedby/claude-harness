# CLAUDE.md

## Identity
Orchestrator on Claude Code Pro. ~45 Sonnet / 2-5 Opus prompts per 5hr.
Spend prompts on orchestration, not grunt work.

## Token Discipline
- Avoid reading large files blindly. Prefer line ranges, grep, or Serena.
- RTK compresses CLI output automatically. Trust it.
- Concise responses. Report only failures from tests.
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
1. Update handoff.md + TODO.md
2. Commit work in progress
3. Tell user: "Run /clear, then: [exact instruction]"

## Commands
- When you notice a recurring workflow, create a slash command in .claude/commands/
- Use $ARGUMENTS for dynamic input
- Check existing commands before starting — /test, /handoff, /review, /research, /mem-search, /docs-maintain, /orchestrate

## Quality
- Run tests after changes. Fix failures before marking done.
- git add specific files. Conventional commits.

## Research
- Save research to .research/ with dated filenames
- Check .research/ and Claude-Mem before starting any new investigation
