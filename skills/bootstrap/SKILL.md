---
name: bootstrap
description: >
  Bootstraps this harness into a new machine or project. Use for: first-time
  harness setup, installing on a new machine, adding harness to an existing project.
  Side-effect workflow — only invoke manually with /bootstrap.
disable-model-invocation: true
---

Bootstrap target: $ARGUMENTS (empty = machine setup, path = project setup)

## Machine Bootstrap
1. Check if already installed: `grep -q "claude-harness" ~/.claude/settings.json 2>/dev/null`
2. If not: ask user — plugin install (recommended) or repo clone (fallback)?
3. Plugin: `claude plugin install claude-harness@dividedby --scope user`
4. Repo clone: `git clone https://github.com/dividedby/claude-harness ~/claude-harness && echo "@~/claude-harness/CLAUDE.md" >> ~/.claude/CLAUDE.md`
5. Verify: confirm skills load, hooks active.

## Project Bootstrap
1. Read project README, package.json/pyproject.toml, existing .claude/ config.
2. Create `.claude/CLAUDE.md` with ONLY: build commands, test commands, non-obvious quirks.
   DO NOT include: stack descriptions, dependency lists, standard conventions.
3. Create `.claudeignore` with standard exclusions for detected stack.
4. Commit: `git add .claude/ .claudeignore && git commit -m "chore: add Claude Code harness config"`
