# New Feature Prompt
# Use when starting work on a meaningful new feature.
# Fill in the bracketed sections, then paste into Claude.

I want to add the following feature:

**Feature:** [describe what you want — be specific about behavior, not implementation]

**Why:** [one sentence on the user or business reason]

**Success criteria:**
- [ ] [criterion 1 — observable, testable behavior]
- [ ] [criterion 2]
- [ ] [criterion 3]

**Out of scope for this task:**
- [thing you explicitly do NOT want done yet]

**Constraints:**
- [any technical constraints, e.g. "must work without new dependencies" or "must stay in existing auth system"]

---

Please:
1. Read `docs/project.md` and relevant existing code first
2. Use `/project:plan` to create a plan before writing any code
3. Show me the plan and wait for my approval before implementing
4. After implementing, run `/project:done` to verify completion
