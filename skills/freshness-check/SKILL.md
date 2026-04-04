---
name: freshness-check
description: >
  Audits project dependencies for staleness. Use for: "are we using outdated packages",
  "check if our stack is current", pre-sprint dependency review.
  NOT for security scanning.
---

Audit dependencies for: $ARGUMENTS (or current project if empty)

1. Read `package.json`, `requirements.txt`, `pyproject.toml`, `go.mod` as applicable.
2. For each major dependency, check latest version via npm/pip/registry.
3. Report only meaningful gaps:

**CRITICAL:** Deprecated/unmaintained package, known security issue, major version gap ≥2
**HIGH:** Major version gap of 1 with breaking changes affecting current usage
**LOW:** Minor/patch gaps, or package superseded by better alternative

## Output Format
```
DEPENDENCY_AUDIT: <project> @ <date>
CRITICAL: <package>: current=<v> latest=<v> | <reason>
HIGH: <package>: current=<v> latest=<v> | <reason>
LOW: <package>: current=<v> latest=<v> | <reason>
RECOMMENDATION: <one-sentence priority action>
```
