I cloned my scaffold repo into ./claude-harness/ in this project.

PHASE 1 — SCAFFOLD:
1. Check the project root for existing CLAUDE.md, TODO.md, handoff.md,
   .claudeignore, ROUTE_REFERENCE.md, and SYSTEM_DOC.md.
   - If a file EXISTS: read both the existing file and the scaffold version.
     Merge them — keep any project-specific content but ensure the structure
     and sections from the scaffold template are present. Back up the
     original as [filename].backup before modifying.
   - If a file DOES NOT EXIST: copy it from claude-harness/.
2. Merge directories from claude-harness/ into the project root:
   .claude/, .research/
   Don't overwrite existing files within them.

PHASE 2 — PROJECT HYGIENE:
3. Audit the project root. If there are loose files that belong in
   subdirectories (scripts, configs, data, docs, tests), organize them.
   Group by purpose. Don't leave random files at the top level.
4. Review .claudeignore and tailor it to this project. It should exclude:
   - node_modules/, dist/, build/, out/, __pycache__/, .next/, coverage/
   - Lock files (package-lock.json, yarn.lock, pnpm-lock.yaml)
   - Test fixtures, mock data, vendored dependencies
   - Any large generated or binary files
   The goal: Claude should only see files it might need to read or edit.
5. Create or update .gitignore. It must include at minimum:
   - claude-harness/
   - node_modules/
   - .env, .env.*, *.env
   - **/*.key, **/*.pem, **/*.p12, **/*.pfx
   - **/credentials*, **/secrets*
   - .DS_Store, *.swp, *.swo, *~
   - Any build output directories
   Scan the repo for anything that looks like credentials, API keys,
   tokens, or secrets. If found, remove them from tracking with
   git rm --cached and add the paths to .gitignore.
6. Initialize git if not already set up. Make sure there's at least one
   commit. Set up a sensible branch (main).

PHASE 3 — VERIFY:
7. Confirm ENABLE_TOOL_SEARCH and CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS
   are set in .claude/settings.json
8. Confirm Claude-Mem is installed and running:
   - /plugin list shows claude-mem
   - http://localhost:37777 is reachable
9. Run: git status — should be clean or show only intended changes.
10. Report: what was copied, what was organized, what was gitignored,
    whether any secrets were found, and whether Claude-Mem is active.
