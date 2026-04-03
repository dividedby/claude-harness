Repo cleanup.

1. Unused imports and dead code (grep before deleting)
2. Stale deps: npx depcheck
3. Commented-out code blocks
4. MEMORY.md: entries pointing to missing files, duplicates, 90+ day stale
5. .env.example: in sync with actual env vars?
6. Docker Compose labels: match service names in docs/project.md?

Report: what removed, what kept and why.

Scope: $ARGUMENTS
