# Claude Code Harness v3

Lean, practical Claude Code harness for daily development.
Built for: low context overhead, simple skills, CLI-first tooling, easy Cloudflare deployment.

## Philosophy
- **CLI over MCP** — prefer CLI tools when they solve the job. Add MCP only when it earns its place.
- **Project rules in the repo** — versioned with code, shared with teammates.
- **Global tools on the machine** — RTK, gh, playwright-cli installed once, work everywhere.
- **CLAUDE.md stays lean** — it answers "how should I work on this?", not "what is this?"
- **Prompts are reusable** — copy from prompts/ for common scenarios.

## Structure
```
.
├── CLAUDE.md                        ← lean project rules + command reference
├── CLAUDE.local.md                  ← personal overrides (gitignored)
├── .gitignore
├── README.md
├── docs/
│   ├── project.md                   ← fill this in per project
│   ├── research/                    ← research notes
│   └── plans/                       ← feature plans
├── prompts/
│   ├── README.md                    ← prompt index
│   ├── migrate-harness.md           ← migrate an existing project
│   ├── session-start.md             ← start of every session
│   ├── new-feature.md               ← starting a new feature
│   ├── debug-issue.md               ← bug investigation
│   ├── pr-prep.md                   ← before merge/PR
│   ├── quick-fix.md                 ← scoped small fix
│   ├── stack-decision.md            ← tool/tech decision
│   └── end-of-session.md            ← capture state before closing
└── .claude/
    ├── settings.json                ← permissions
    ├── skills/
    │   ├── app-product-planner/     ← /project:plan
    │   ├── repo-housekeeper/        ← /project:clean
    │   ├── freshness-architect/     ← /project:fresh
    │   ├── cloudflare-deploy/       ← /project:deploy
    │   └── playwright-tester/       ← /project:test
    ├── agents/
    │   ├── karen-reality-auditor.md ← /project:done
    │   └── code-ruthless-reviewer.md← /project:review
    └── commands/
        ├── plan.md
        ├── review.md
        ├── done.md
        ├── test.md
        ├── deploy.md
        ├── clean.md
        └── fresh.md
```

## Setup

### 1. Install global tools (once, machine-wide)
```bash
# RTK — reduces token usage 60-90%
brew install rtk
rtk init -g        # answer y when prompted to patch settings.json
rtk gain           # verify savings are being tracked

# GitHub CLI
brew install gh
gh auth login

# Playwright CLI
npm i -g @playwright/test
```

### 2. Drop harness into a project
```bash
cp -r claude-harness-v3/.claude ./
cp -r claude-harness-v3/docs ./       # only if docs/ doesn't exist yet
cp -r claude-harness-v3/prompts ./
cp claude-harness-v3/CLAUDE.md ./
# merge .gitignore entries with your existing one
```

### 3. Fill in docs/project.md
Edit docs/project.md with your project's context.

### 4. Migrate an existing project
Use prompts/migrate-harness.md — paste it into Claude Code.

---

## Daily workflow

| Situation | Paste / Use |
|---|---|
| Starting a session | prompts/session-start.md |
| New feature | prompts/new-feature.md |
| Bug to investigate | prompts/debug-issue.md |
| Quick scoped fix | prompts/quick-fix.md |
| Before merge/PR | prompts/pr-prep.md |
| Tool/tech decision | prompts/stack-decision.md |
| End of session | prompts/end-of-session.md |
| Weekly cleanup | /project:clean |
| Stack currency check | /project:fresh |
| New domain | /project:deploy <subdomain> |
| Migrate a project | prompts/migrate-harness.md |

---

## Global Claude setup (~/.claude/CLAUDE.md)

Your global CLAUDE.md holds personal preferences across all projects.
This file is NOT in any repo — it lives at ~/.claude/CLAUDE.md.

Suggested content:

```markdown
# My Coding Preferences (applies to all projects)

## Style
- Comments in English only
- Prefer functional patterns where practical
- Keep functions small and single-purpose
- Use strict types everywhere

## Error handling
- Raise errors explicitly — never silently ignore
- Error messages should include enough context to debug
- Fix root causes, not symptoms

## Testing
- Prefer integration and end-to-end tests over unit tests
- Never add tests just for coverage numbers
- Avoid mocks when real calls are practical

## Terminal
- Prefer non-interactive commands with flags
- Use rg for searching code
- Use git --no-pager diff or git diff | cat

## Workflow
- Read existing code before editing
- Match the existing repo style
- Keep changes minimal and scoped
- Run lint/test before finishing if code changed
- Ask before adding new dependencies
```

---

## MCP guidance

Default: use CLI tools instead of MCP servers.
Add MCP only when it provides structured access or remote integration that CLI cannot match.

| Tool | Recommendation |
|---|---|
| RTK | ✅ Global hook — install once, runs everywhere |
| gh CLI | ✅ Use directly — no MCP needed for most GitHub work |
| playwright-cli | ✅ ~26K tokens vs ~114K for Playwright MCP |
| Playwright MCP | ⚠️ Only if playwright-cli is insufficient for your use case |
| GitHub MCP | ⚠️ Only for complex multi-step automated GitHub workflows |
| Generic MCP servers | ❌ Replace with CLI equivalents |

Fewer MCP servers = less context overhead = better session quality.

---

## CLAUDE.md hierarchy (reference)

```
~/.claude/CLAUDE.md           global, all projects, not in git
./CLAUDE.md                   project root, committed, team-wide
./CLAUDE.local.md             personal project overrides, gitignored
./.claude/settings.json       committed permissions
./.claude/settings.local.json personal permission overrides, gitignored
```

All layers load additively. More specific overrides less specific.
