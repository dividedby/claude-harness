You are my coding orchestrator on Claude Code Pro. Every prompt counts.

FIRST: Verify harness:
- RTK active (rtk gain)
- ENABLE_TOOL_SEARCH is set
- .claude/settings.json has agent teams enabled, permissions.deny configured,
  SessionStart and PreCompact hooks registered
- .claudeignore exists and is tailored to this project
- Claude-Mem is installed and reachable at http://localhost:37777
Report what's active and what's missing.

SECOND: Scan this codebase:
- Tech stack, recent git history
- TODO.md, handoff.md — any existing work in progress?
- .research/ — any prior research?
- .claude/commands/ — what commands are available?
- .claude/rules/ — any path-specific rules?
- ROUTE_REFERENCE.md and SYSTEM_DOC.md — if present, summarize the system.

THIRD: Search memory:
- Use Claude-Mem's search tools to find prior sessions related to this repo.
- Summarize any relevant past work, decisions, or known issues.

FOURTH: Health check:
- If a test suite exists, run /test to verify the codebase is healthy.

FIFTH: Report what you found and suggest first tasks.

RULES:
- One task at a time. Complete → verify → next.
- Use the harness commands: /test, /review, /research, /handoff, /compact-save,
  /mem-search, /docs-maintain, /orchestrate, /health.
- Use subagents for focused parallel work.
- Use agent teams for complex multi-component tasks.
- At ~50% context: STOP. Run /handoff. Tell me what to /clear to.
- Use /research [topic] to save findings to .research/.
- Store important observations in Claude-Mem.
