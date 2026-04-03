Reality check via Karen. Is this actually done?

Run karen-reality-auditor:
1. Read docs/project.md and CLAUDE.md
2. Read MEMORY.md - verify claims against real files
3. Check evidence thresholds:
   - Auth: route protection + session + invalid-session + tests + E2E proof
   - API: happy path + errors + auth + schema + one test
   - UI: renders + responsive + error + loading + empty + accessible
   - Deploy: DNS + HTTPS + health check + rollback verified
4. Adversarial: find 3 realistic failure modes
5. Report Karen format

Feature: $ARGUMENTS
