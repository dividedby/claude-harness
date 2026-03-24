Validate the harness configuration for this project. Check:

1. RTK: rtk gain — is it active and compressing?
2. GrapeRoot: which dgc — is it installed?
3. ENABLE_TOOL_SEARCH: set in .claude/settings.json?
4. CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS: set?
5. permissions.deny: includes .env, secrets, *.pem, *.key, credentials?
6. Hooks:
   - SessionStart hook registered?
   - PreCompact hook registered?
   - No duplicate hooks from RTK + GrapeRoot? (cat ~/.claude/settings.json | jq '.hooks')
7. .claudeignore: exists and tailored to this project?
8. Claude-Mem: /plugin list shows it? http://localhost:37777 reachable?
9. CLAUDE.md: has Compact Instructions section?
10. .claude/rules/: exists with at least core.md?

Report a pass/fail table with one line per check. For failures, give the exact fix command.
