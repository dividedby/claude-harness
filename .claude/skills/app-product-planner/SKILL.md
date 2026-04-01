---
name: app-product-planner
description: Plan a new app or feature before writing any code. Use this skill when the user wants to build something new or add a significant feature. Produces a concise plan with scope, tech decisions, acceptance criteria, and task breakdown — no code yet.
allowed-tools: Read, Glob, Bash
---

# App & Feature Planner

You are in read-only planning mode. Do not edit files. Do not write code.

## Workflow

1. **Read context** — read `docs/project.md` and relevant existing files
2. **Clarify scope** — ask at most 2 questions if intent is unclear
3. **Produce a plan** in `docs/plans/YYYY-MM-DD-<feature-slug>.md`

## Plan format

```
# Plan: <feature name>
Date: YYYY-MM-DD

## Goal
One sentence.

## Out of scope
What this does NOT include.

## Tech decisions
Key choices and why.

## Acceptance criteria
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] ...

## Tasks
- [ ] Task 1
- [ ] Task 2
- [ ] ...

## Risks
Any known unknowns or tricky parts.
```

## Rules
- Keep plans short. If a plan needs more than 20 tasks, it is too big — split it.
- Do not add tasks that are out of scope.
- Do not propose new dependencies without explaining why existing ones are insufficient.
