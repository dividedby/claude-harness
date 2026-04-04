# Prompt: Start a New Project

**When to use:** You've created a new empty directory and want to bootstrap it as a project with the new harness already wired in.

**Usage:** `cd ~/projects/my-new-thing && claude` then paste this prompt.

---

```
I'm starting a new project in this directory. Help me define and bootstrap it.

Step 1 — Clone the harness if not already present:
If `./claude-harness/` does not exist:
  git clone https://github.com/dividedby/claude-harness ./claude-harness

Step 2 — Initialize git if needed:
  git init && git add . && git commit -m "init: new project" 2>/dev/null || true

Step 3 — Ask me these questions (ask all at once, not one at a time):
  a. What is this project? (one sentence description)
  b. What type of project: API, SPA, full-stack, CLI, library, data pipeline, mobile, other?
  c. What languages/frameworks do you already have in mind, or should I recommend a stack?
  d. What are the 3 most important things this needs to do in v1?
  e. Where will this be deployed / run?

Step 4 — After I answer, do the following in one pass:
  - Run the stack-recommend logic from ./claude-harness/skills/stack-recommend/SKILL.md to give me ONE concrete stack recommendation with pinned versions
  - Create .claude/CLAUDE.md with ONLY: the build command, the test command, and any constraints I told you about. Max 20 lines.
  - Copy .claudeignore from ./claude-harness/.claudeignore
  - Create .claude/settings.json with autoMemoryEnabled: true
  - Add @./claude-harness/CLAUDE.md at the top of .claude/CLAUDE.md
  - Create a minimal README.md: project name, one-sentence description, setup steps
  - Scaffold the project structure for the chosen stack (package.json / pyproject.toml / etc.)
  - git add -A && git commit -m "chore: project bootstrap with harness v2"

Step 5 — Print a summary:
  Stack chosen, why, one gotcha, and the exact command to run the project for the first time.
```
