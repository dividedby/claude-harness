# Claude Code Architecture Patterns
Researched: 2026-04-02 | Status: Active | Refresh: monthly via GitHub Actions

## Memory system (3-layer, confirmed March 2026 source leak)
- Layer 1 MEMORY.md: index only, <=150 chars, always in context
- Layer 2 topic files: fetched on-demand when index suggests relevance
- Layer 3 transcripts: never loaded, only grep'd for identifiers
- Write discipline: write topic file FIRST, then update index
- Skeptical rule: memory is a hint. Verify against actual codebase.

## CLAUDE.md behaviour
- Reinserted into context on EVERY turn change (not just session start)
- Any edit mid-session triggers sticky prompt cache break (14 vectors, no recovery)
- Configure CLAUDE.md and tools before session start, never mid-session

## Prompt cache (14 break vectors, sticky)
- Reordering CLAUDE.md sections, toggling extended thinking, changing MCPs mid-session
- Once broken, stays broken for the entire session — no recovery

## Multi-agent coordinator
- System prompt instructions, not code-level orchestration
- Sub-agents share prompt cache: spawning 5 costs barely more than 1
- Orchestrator synthesizes results, never relays them

## autoDream (memory consolidation)
- 3 gates: 24h elapsed + 5 sessions + lock available
- Phases: orient > gather > consolidate > prune
- Keeps MEMORY.md under 200 lines / 25KB
- Manual trigger: /project:dream

## Adversarial verification
- Separate agent whose job is to break what was just built
- "Does it work?" vs "How can I break it?" — different goals
- Run before marking any feature complete (Karen does this)

## Auto mode (yoloClassifier.ts)
- Each tool call triggers Sonnet classifier — real latency + cost
- Circuit breaker: 3 consecutive or 20 total blocks pauses to manual

## Autocompact circuit breaker
- MAX_CONSECUTIVE_AUTOCOMPACT_FAILURES = 3
- "Compaction failed" = system protecting you, not broken

## SessionStart hook
- MUST be idempotent — fork bomb risk if spawning processes
- Use PID / env-flag guard (harness session-start.sh does this)

## MCP overhead (measured, April 2026)
- GitHub MCP: 5K–14.7K tokens added to EVERY session baseline
- Perplexity MCP: similar overhead, loaded regardless of use
- CLI equivalent: ~80 tokens per gh/curl call vs 55K+ MCP schema load
- Decision: zero MCPs locally; Perplexity runs only in GitHub Actions
