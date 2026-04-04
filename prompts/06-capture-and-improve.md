# Prompt: Capture Session Learnings

**When to use:** At the end of a productive session where you discovered something worth preserving — a pattern, a rule, a better way to do something.

**Usage:** Paste this in the same session before closing, filling in the LEARNING placeholder.

---

```
Capture this session learning into the harness:

LEARNING: [describe the insight here — be specific]

Use the self-improve skill at ./claude-harness/skills/self-improve/SKILL.md.

Before doing anything:
  Classify: is this learning specific to THIS project, or useful for ALL projects?

If project-specific:
  Write it to .claude/CLAUDE.md or a new file at .claude/rules/<topic>.md
  Keep it to 1-3 lines maximum.
  git add .claude/ && git commit -m "chore: capture session learning — [short description]"
  Print: "SAVED TO PROJECT — will not appear in other projects"

If globally useful:
  Determine the target file in ./claude-harness/ (skill, agent, CLAUDE.md, doc)
  Show me the proposed diff first. Wait for my approval before writing.
  After approval:
    git -C ./claude-harness checkout -b harness/improve-[slug]
    Apply the change
    git -C ./claude-harness add -A
    git -C ./claude-harness commit -m "improve: [description]"
    gh -R dividedby/claude-harness pr create --title "Harness improvement: [description]" --draft
  Print: "QUEUED AS DRAFT PR — [URL]"

IMPORTANT: Never modify ./claude-harness/CLAUDE.md or any harness file directly without showing me the diff first and getting explicit approval.
```
