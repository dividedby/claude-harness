# Migrate to Harness v4

1. Read current structure: stack, entry points, deploy method, domain

2. Create/update CLAUDE.md (max 30 lines):
   - Stack and key file locations
   - Project-specific conventions
   - Known forbidden patterns

3. Create docs/project.md:
   - Name, description, stack, domain, Cloudflare zone ID
   - Docker Compose names and Traefik labels if self-hosted
   - Deploy target

4. Create MEMORY.md (index-only, entries <=150 chars)

5. Verify .mcp.json has Perplexity configured

6. Report: created, updated, skipped, why
