# Usage Examples

## Install / Bootstrap
```
/bootstrap                                     # machine setup
/bootstrap /Users/you/projects/my-api          # project setup
```

## New Project Stack
```
What stack for a REST API: TypeScript, file uploads, JWT auth, deploy to Railway?
```
→ `stack-recommend` auto-triggers. Returns one concrete recommendation with pinned versions.

## Migrate Existing Project
```
/migrate-project /Users/you/projects/old-api
```
→ Snapshots, slims CLAUDE.md, converts old commands, creates draft PR.

## Code Review
```
Review the changes in src/auth/ — we just added OAuth support
```
→ `code-review` skill triggers, spawns `adversarial-reviewer` agent in isolated context.

Example output:
```
[HIGH] src/auth/oauth.ts:47
Problem: state param uses Math.random() — not cryptographically secure, CSRF risk
Fix: crypto.randomBytes(32).toString('hex')

VERDICT: BLOCK
```

## Requirements Verification
```
Check this spec before we start: [paste PRD]
```
→ `requirements-check` triggers.

Example output:
```
GAPS_FOUND: YES
AMBIGUITIES:
- "fast response": no latency target defined → Add: p99 < 200ms
VERDICT: NEEDS_CLARIFICATION
```

## Freshness Check
```
Check if our dependencies are outdated
```
→ `freshness-check` triggers. Runs npm/pip queries, reports only actionable gaps.

## Weekly Self-Refresh
Automated every Monday. Check for draft PRs in `harness/weekly-refresh-*` branches.

Manual trigger:
```bash
gh workflow run weekly-refresh.yml
```

Capture session learning:
```
Add to harness: always use --max-turns 10 for automated workflows
```
→ `self-improve` triggers, creates draft PR to harness repo (never modifies inline).

## Research / Docs
```
Look up the Fastify v5 migration guide
```
→ `research-docs` triggers. Calls Perplexity API via bash curl if key configured, else WebFetch.
