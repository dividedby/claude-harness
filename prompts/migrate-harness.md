# Harness v3 Migration Prompt
# Paste this into Claude Code at the root of any project to migrate to Harness v3.

I want you to migrate this existing project to my new lean Harness v3.

Follow these instructions exactly and work in a careful, staged way.

# Goals
- Replace the old harness with the new simpler harness structure.
- Preserve useful project-specific knowledge from the old setup.
- Convert old files like `CLAUDE.md`, `claude.md`, `HANDOFF.md`, `handoff.md`, and similar notes into the new structure.
- Keep the final setup lean, practical, easy to use, and low in context bloat.
- Separate global Claude/machine items from project-specific repo items.
- Inventory plugins and MCP servers and recommend whether they fit the new model.

# Global vs project rule
Before making changes, separate everything into these buckets:

## Global machine / user items
These live outside the repo (~/.claude/ or machine-wide):
- global Claude skills, agents, commands, plugins
- global Claude settings
- RTK
- gh
- playwright-cli
- optional GrapeRoot
- any MCP servers that are truly cross-project and still worth keeping

## Project items
These live in this repo:
- CLAUDE.md
- .claude/skills/
- .claude/agents/
- .claude/commands/
- .claude/settings.json if project-specific
- docs/project.md
- docs/research/
- docs/plans/
- repo-specific workflows, commands, rules, or deployment notes

Do not move repo-specific behavior into global Claude folders unless you explicitly explain why.

# Step 1 — full inventory and migration note
Inspect this repo and my current Claude setup.

## Project-level inventory
Find and report:
- existing harness-related files
- existing .claude/ structure
- existing CLAUDE.md, claude.md, HANDOFF.md, handoff.md, or similar docs
- existing skills, agents, commands, hooks, memory files, setup scripts
- stale or duplicate docs
- anything obviously bloated, duplicated, obsolete, or confusing

## Plugin and MCP inventory
Also inventory any existing Claude plugins and MCP servers.

Check:
- global Claude config (~/.claude/)
- project Claude config (.claude/)
- plugin-related files
- MCP-related config files and .mcp.json

Run if available:
  claude mcp list
  claude mcp get <name>   (for each configured server)

For each plugin or MCP server, determine:
- what it is for
- whether it appears actively useful
- whether it overlaps with a CLI tool already in use
- likely context overhead and maintenance burden
- whether it fits the new lean harness model

Classify each one as:
  Keep
  Keep but optional (not default)
  Replace with CLI
  Remove

Bias toward CLI tools over MCP when CLI is sufficient.
Fewer moving parts. Lower context overhead.

Before changing anything, create:
  docs/project-migration-notes.md

That file must include:
- old files found
- plugins and MCP servers found (with classification for each)
- what each item was used for
- what should be preserved
- what should be replaced with CLI
- what should be removed
- final recommendation for the new harness model

# Step 2 — install global prerequisites if missing
Check whether these are installed globally:
- RTK (rtk gain — should show token stats)
- gh
- playwright-cli

If RTK is missing:
  brew install rtk && rtk init -g
  (answer y when prompted to patch settings.json)

If playwright-cli is missing:
  npm i -g @playwright/test

If gh is missing:
  brew install gh

Do not install GrapeRoot unless you conclude this repo is large or complex enough
that it would materially help. Explain if you recommend it.

Report any global install failures clearly.

# Step 3 — clone Harness v3
Clone my harness repo:
  https://github.com/dividedby/claude-harness

Clone it into a temporary folder, not over the top of this project.
Use that repo as the source of truth for Harness v3 structure.

# Step 4 — migrate project harness files
Migrate this repo to Harness v3.

Target project-level files:
- CLAUDE.md
- .claude/skills/
- .claude/agents/
- .claude/commands/
- .claude/settings.json
- docs/project.md
- docs/research/
- docs/plans/

Rules:
- Preserve project-specific knowledge from old files
- Do not blindly copy bloated content into the new CLAUDE.md
- Keep the new CLAUDE.md lean
- Move durable project-specific details into docs/project.md
- Move migration notes into docs/project-migration-notes.md
- Move research content into docs/research/
- Move planning content into docs/plans/
- Preserve custom project commands only if they still make sense
- Preserve custom skills or agents only if they fit the simplified model

# Step 5 — convert old files
Inspect and convert content from files like:
  CLAUDE.md, claude.md, HANDOFF.md, handoff.md
  setup prompts, old harness scripts, old research/planning docs

Mapping:
- Durable repo context → docs/project.md
- Migration notes → docs/project-migration-notes.md
- Research notes → docs/research/...
- Planning notes → docs/plans/...
- Obsolete harness boilerplate → remove after preserving anything useful

# Step 6 — clean up old artifacts
Remove or archive:
- oversized or duplicate CLAUDE files
- old handoff files that were fully migrated
- superseded commands/skills/agents/hooks
- stale setup scripts from the previous harness
- plugin or MCP references that no longer fit the new model

Prefer deleting obsolete harness clutter.
Preserve anything genuinely project-specific.

# Step 7 — verify
Verify:
- .claude/ structure is correct
- CLAUDE.md is lean and points to docs/project.md
- docs/project.md is populated with project context
- docs/research/ and docs/plans/ exist
- docs/project-migration-notes.md exists
- RTK is installed and initialized globally
- playwright-cli is available
- gh is available

Also verify the plugin/MCP outcome:
- list what is kept, demoted, replaced, removed

# Step 8 — final report
Give me:
1. Summary of what changed
2. What was preserved from the old harness
3. What was removed
4. Plugin/MCP decisions (kept / demoted / replaced / removed)
5. Whether GrapeRoot is recommended for this repo
6. Manual follow-up I should do
7. Final relevant file tree
8. Global vs project items split

# Working style
- Conservative and organized
- Smallest sensible set of changes
- No over-engineering
- If ambiguous, safest practical choice with explanation
- Lean, low-context, easy-to-use result
