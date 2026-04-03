# Migrate to Harness v4

1. Read current structure: stack, entry points, deploy method, domain

2. Create/update CLAUDE.md (max 30 lines):
   - Stack and key file locations
   - Project-specific conventions and forbidden patterns
   - Reminder: zero MCPs, use gh CLI

3. Create docs/project.md:
   - Name, description, stack, domain, Cloudflare zone ID
   - Docker Compose names and Traefik labels if self-hosted
   - Deploy target

4. Create MEMORY.md (index-only, entries <=150 chars)

5. Set repo secrets:
   gh secret set CLAUDE_CODE_OAUTH_TOKEN --body "$(claude setup-token)"
   gh secret set PERPLEXITY_API_KEY --body "<key>"

6. Enable GitHub Actions (Settings -> Actions -> Allow all)

Report: created, updated, skipped, why
