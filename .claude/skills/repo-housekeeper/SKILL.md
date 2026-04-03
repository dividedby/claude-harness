---
name: repo-housekeeper
description: Clean dead code, stale deps, MEMORY.md bloat, Docker label drift. Use via /project:clean.
---

Cleanup checklist:
- Code: unused imports, dead functions/routes, commented-out blocks, old TODOs
- Deps: npx depcheck for unused packages
- Infra: Traefik labels match service names; .env.example in sync
- MEMORY.md: remove entries pointing to missing files; merge duplicates; prune 90+ day stale

Rule: grep before deleting. List everything removed in the summary.
