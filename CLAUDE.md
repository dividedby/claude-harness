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

## Compact Instructions
When compressing context, preserve in priority order:
1. Architecture decisions (NEVER summarize — preserve verbatim)
2. Modified files and their key changes
3. Current verification status (pass/fail commands)
4. Open TODOs, risks, and rollback notes
5. Session decisions made via /orchestrate
6. Tool outputs (can truncate — keep pass/fail summary only)

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
- Agent Teams do NOT inherit session history. Embed Claude-Mem results into task descriptions before spawning.

## Handoff Protocol
Use /handoff to automate this. It will:
1. Update handoff.md + TODO.md
2. Commit work in progress
3. Tell user: "Run /clear, then: [exact instruction]"

The PreCompact hook will also trigger this automatically before context compaction.

## Verification
- Run /test after any code change. Fix failures before marking done.
- For API changes, run /review on changed endpoints.
- Definition of done: all tests pass, lint clean, no leftover TODOs.

## Commands
Use these before doing things manually:
- /test — run tests (report failures only)
- /review [file] — code review with severity levels
- /research [topic] — investigate and save to .research/
- /handoff — prepare session handoff
- /compact-save — structured handoff before manual /compact
- /mem-search [query] — search Claude-Mem for prior work
- /docs-maintain — update ROUTE_REFERENCE.md and SYSTEM_DOC.md
- /orchestrate [task] — decide subagents vs teams vs octopus
- /health — validate harness configuration

When you notice a recurring workflow, create a new slash command in .claude/commands/.
Use $ARGUMENTS for dynamic input.

## Rules
- Path-specific rules live in .claude/rules/. Keep CLAUDE.md under ~130 lines.
- When project conventions grow, move domain rules to .claude/rules/[domain].md.
