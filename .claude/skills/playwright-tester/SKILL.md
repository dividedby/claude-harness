---
name: playwright-tester
description: Browser testing via playwright CLI. No test suite overhead. Use via /project:test.
allowed-tools: Bash(npx playwright:*), Bash(npx:*), Read, Write
---

Use: npx playwright chromium --eval "..."

Smoke check: page loads, title, screenshot, console errors
Mobile check (375px): no overflow, screenshot
Accessibility: imgs without alt, inputs without label, missing h1

Auth flows: test login -> session persists -> logout works

Report: URL tested, checks passed/failed, screenshot paths, errors found.
