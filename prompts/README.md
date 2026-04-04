# Harness Entry-Point Prompt Library

Copy-paste prompts for every common harness workflow.
All prompts assume the harness lives at `./claude-harness/` inside the project
(or `~/claude-harness/` for machine-global setup).

## Prompts

| # | File | When to Use |
|---|------|-------------|
| 01 | `01-migrate-existing-project.md` | Existing project → pull harness + self-migrate |
| 02 | `02-new-project.md` | Empty directory → define + scaffold new project with harness |
| 03 | `03-harness-self-update.md` | Pull latest harness version into an existing project |
| 04 | `04-fresh-machine-setup.md` | New machine → global harness install |
| 05 | `05-review-this-project.md` | Full adversarial review: deps + code + harness compliance |
| 06 | `06-capture-and-improve.md` | End of session → capture a learning into harness or project |
| 07 | `07-quick-health-check.md` | Sanity check — is the harness correctly wired in this project? |

## Pattern

All prompts follow the same shape:
1. Clone/update `./claude-harness/` if needed
2. Read the relevant skill/agent from the harness
3. Execute the workflow
4. Commit or create a draft PR — never push directly to main

## Storage options

Put these wherever you reach for them fastest:
- A `prompts/` directory in a personal dotfiles repo
- Raycast snippets (trigger: `!migrate-harness`, `!new-project`, etc.)
- A `~/.claude/CLAUDE.md` section pointing Claude to this file
- Plain text notes app

## Install convention

Prompts assume the harness is a **subdirectory of the project** (`./claude-harness/`), not a global path. This makes each project self-contained and lets Claude read the harness files directly via relative paths. The global `~/claude-harness/` install is only needed for the machine-setup prompt (04).
