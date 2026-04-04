# Session Learnings Pipeline

## Flow

```
Session insight
│
├─► Project-specific?
│   └── YES: write to .claude/CLAUDE.md or .claude/rules/<topic>.md
│           commit directly | done
│
└─► Globally valuable?
    └── YES: /self-improve <description>
             → creates branch, writes change, opens draft PR
             → human reviews + merges when ready
```

## What to Capture Globally
- Skill trigger description was wrong (false/missed activations)
- New hook pattern useful across all projects
- Claude Code feature change that affects skill/agent structure
- Weekly refresh finding that updates skill content

## What to Capture Project-Locally
- "This project uses pnpm not npm"
- "API tests require local Redis"
- "Billing module is high-risk, use plan mode"

## What NOT to Capture
- One-time debugging hacks
- Anything contradicting official docs
- Changes that would make CLAUDE.md longer

## Governance
- Draft PRs only — never auto-merge
- Weekly refresh PRs reference specific changelog entries or official docs
- Improvement PRs sitting >4 weeks un-merged: re-evaluate, close if stale
- Global harness PRs use label: `harness`
