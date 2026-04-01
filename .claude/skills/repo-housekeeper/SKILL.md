---
name: repo-housekeeper
description: Clean up the repo after a feature ships or on a weekly basis. Finds dead code, stale files, duplicate docs, unused deps, and misaligned Docker/Traefik config. Use after merging a big feature or when the repo feels cluttered.
allowed-tools: Read, Grep, Glob, Bash, Edit
---

# Repo Housekeeper

## Workflow

1. **Scan** the repo with Glob and Grep — do not rely on memory
2. **List findings** before making any changes
3. **Ask confirmation** for any deletion of non-trivially-generated files
4. **Apply** approved changes only

## Checklist

### Code
- [ ] Dead code: exported symbols never imported elsewhere
- [ ] Commented-out code blocks (>5 lines)
- [ ] TODO/FIXME older than current feature branch

### Deps
- [ ] `package.json` / `requirements.txt` — unused packages
- [ ] Dev-only deps in prod deps list

### Docs
- [ ] Stale `handoff`, `HANDOFF`, or old harness files
- [ ] Duplicate content across `README.md` and `docs/`
- [ ] `docs/plans/` — completed plans older than 30 days (archive, don't delete)

### Docker & Traefik
- [ ] `docker-compose.yml` — service names match Traefik labels
- [ ] Traefik labels use `traefik.http.routers.<service>.rule`
- [ ] `.env.example` reflects all vars currently used in compose

### General
- [ ] `.gitignore` covers `*.local.*`, `node_modules`, `.env`, build artifacts
- [ ] No secrets or keys in tracked files

## Output
Report findings in this format:
```
## Housekeeper Report
### Removed
- file/symbol — reason
### Archived
- file — reason
### Recommended (needs confirmation)
- item — reason
### Clean
- areas with no issues
```
