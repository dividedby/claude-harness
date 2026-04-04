# Prompt: Ruthless Project Review

**When to use:** You want a full adversarial review of the current project — code quality, security, deps, and requirements all at once.

**Usage:** Paste in a Claude Code session at the project root.

---

```
Run a full adversarial review of this project. Use the harness skills at ./claude-harness/skills/.

Do these three passes in order:

Pass 1 — Freshness (read ./claude-harness/skills/freshness-check/SKILL.md):
  Audit all dependency files for CRITICAL and HIGH staleness issues only.
  Print findings in the DEPENDENCY_AUDIT format.

Pass 2 — Code review (read ./claude-harness/skills/code-review/SKILL.md):
  Spawn the adversarial-reviewer agent from ./claude-harness/agents/adversarial-reviewer.md.
  Review all non-test source files for security vulnerabilities and correctness bugs.
  Skip LOW severity findings in this pass — focus on Critical and High only.

Pass 3 — Harness compliance:
  Check .claude/CLAUDE.md: is it ≤50 lines? Does it reference @./claude-harness/CLAUDE.md?
  Check .claudeignore: does it exist and exclude node_modules/dist/etc?
  Check .claude/settings.json: is autoMemoryEnabled set?

Print a combined REVIEW SUMMARY at the end:
  MUST_FIX (Critical/High from all passes)
  SHOULD_FIX (Med from code review, missing harness config)
  IGNORE_FOR_NOW (everything else)
```
