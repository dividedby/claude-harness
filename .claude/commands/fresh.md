Stack freshness audit.

1. NPM: npx npm-check-updates --format group (major = research before upgrading)
2. Docker: pinned versions? any known-old bases?
3. Perplexity research (max_results: 3):
   perplexity_ask: "[framework] deprecations breaking changes 2026"
   perplexity_ask: "Docker [base-image] latest stable 2026"

Report:
- Safe upgrades (patch/minor)
- Risky upgrades (major - research first)
- Docker images needing attention
- Deprecated patterns
- Upgrade order: lowest risk first
