---
name: freshness-architect
description: Audit stack for outdated deps, Docker images, deprecated patterns. Research via Perplexity. Use via /project:fresh.
---

1. npm: npx npm-check-updates --format group (patch/minor safe; major requires research)
2. Docker: pinned? docker scout quickview if available
3. Perplexity (max_results: 3): "[framework] deprecations 2026" / "Docker [image] latest stable 2026"
4. Self-hosted vs managed: evaluate operational burden vs control tradeoff

Output: safe upgrades / risky upgrades / Docker needing attention / deprecated patterns / upgrade order
