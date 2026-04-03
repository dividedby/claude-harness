Stack freshness audit.

1. NPM: npx npm-check-updates --format group (major = research before upgrading)
2. Docker: pinned versions? any known-old bases?
3. Check GitHub release pages via gh:
   gh release list --repo <upstream> --limit 3

Report:
- Safe upgrades (patch/minor)
- Risky upgrades (major - research first)
- Docker images needing attention
- Deprecated patterns
- Upgrade order: lowest risk first
