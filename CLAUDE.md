# Project Rules

> Full project context → @docs/project.md
> Personal coding preferences → ~/.claude/CLAUDE.md (global)

## Working style
- Read relevant files before editing. Match existing style.
- Keep changes minimal and scoped to the current request.
- Run lint/test before finishing if code changed.
- Never silence errors — surface them explicitly.
- Ask before adding new dependencies.

## Commands in this repo
| Command | Purpose |
|---|---|
| `/project:plan` | Plan a feature before touching code |
| `/project:review` | Code review after implementation |
| `/project:done` | Reality-check completion before shipping |
| `/project:test` | Browser UI test with playwright-cli |
| `/project:deploy` | Cloudflare DNS + Traefik domain wiring |
| `/project:clean` | Post-feature or weekly repo cleanup |
| `/project:fresh` | Check stack freshness before major work |
