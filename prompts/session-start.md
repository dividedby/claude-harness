# Session Start Prompt
# Run at the start of every Claude Code session to load context.
# Claude does not retain memory between sessions — this 2-minute setup saves 10+ minutes of drift.

Load context for this session:

1. Read `CLAUDE.md` for project rules and available commands
2. Read `docs/project.md` for current project state, stack, and active work
3. Check `docs/plans/` for any in-progress plans
4. Run `git status` and `git log --oneline -5` to see recent state

Then tell me:
- What is currently in progress
- Any uncommitted work
- What you recommend I focus on next

Keep the summary short. I'll tell you what to work on.
