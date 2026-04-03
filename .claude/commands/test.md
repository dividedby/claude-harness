Browser and flow testing via Playwright CLI.

1. Get target URL from docs/project.md or $ARGUMENTS
2. Smoke check: page loads, title, no console errors, screenshot
3. Mobile check: 375px, no overflow, screenshot
4. Accessibility: imgs without alt, inputs without label, missing h1
5. Auth flows if applicable: login, session, logout

Use: npx playwright chromium --eval "..."

Report: checks passed/failed, screenshots, errors found.

Target: $ARGUMENTS
