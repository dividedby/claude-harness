# Harness Rules

## Non-Negotiable Behaviors
- NEVER modify CLAUDE.md, settings.json, or MCP config mid-session. These break prompt cache permanently.
- NEVER push directly to main/master. All changes via PR on a feature branch.
- NEVER commit secrets, keys, or tokens. Check with `git diff --staged` before every commit.
- NEVER auto-merge harness self-modification PRs. Human review required.
- Always run the project's own test/lint commands before declaring work complete.
- Always commit before beginning risky refactors: `git add -A && git commit -m "checkpoint: before <change>"`

## Git Workflow
- Branch naming: `feat/`, `fix/`, `chore/`, `harness/` prefixes
- Commit messages: imperative mood, ≤72 chars subject line
- PR description must include: what changed, why, how to verify

## Context Hygiene
- Use subagents for investigation tasks to protect main context.
- Use plan mode for multi-file changes before executing.
- When asked to "review" code: spawn the adversarial-reviewer agent, do not inline it.
- When compacting: preserve list of modified files and pending tasks.

## Tool Preference
- Prefer CLI tools over MCP: `gh` for GitHub, `curl` for APIs, `jq` for JSON.
- Read `.claudeignore` before exploring large directories.

## Harness Self-Awareness
- This harness lives at: `$CLAUDE_PLUGIN_ROOT` (plugin) or `~/claude-harness` (repo clone).
- Skills: `${CLAUDE_PLUGIN_ROOT}/skills/` or `.claude-plugin/skills/`
- Weekly refresh PRs: branch pattern `harness/weekly-refresh-*`
