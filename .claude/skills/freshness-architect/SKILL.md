---
name: freshness-architect
description: Audit stack for outdated deps, Docker images, deprecated patterns. Uses gh CLI for upstream release checks. Use via /project:fresh.
---

1. npm: npx npm-check-updates --format group (patch/minor safe; major needs review)
2. Docker: pinned? check Dockerfile for known-old bases
3. Upstream releases: gh release list --repo <upstream> --limit 3
4. Self-hosted vs managed: evaluate operational burden vs control tradeoff

Output: safe upgrades / risky upgrades / Docker needing attention / deprecated patterns / upgrade order
