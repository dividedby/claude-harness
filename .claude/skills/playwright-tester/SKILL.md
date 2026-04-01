---
name: playwright-tester
description: Run browser-level UI tests and flow verification using playwright-cli. Use after implementing UI changes, before shipping a feature, or to investigate a visual/flow issue on a live site. Low token overhead — uses CLI not MCP.
allowed-tools: Bash
---

# Playwright CLI Tester

Uses `playwright-cli` (not Playwright MCP) for low-token browser automation.
Token cost: ~26K per task vs ~114K for MCP.

## Quick reference
```bash
playwright-cli open <url>                         # open page
playwright-cli snapshot                           # get element refs
playwright-cli click <ref>                        # click element
playwright-cli fill <ref> <text>                  # fill input
playwright-cli screenshot [ref]                   # take screenshot
playwright-cli --session=<name> open <url>        # named session
playwright-cli session-stop-all                   # cleanup
playwright-cli console [min-level]                # view console errors
```

## Workflow

1. **Open** the page under test with a named session
2. **Snapshot** to get element references
3. **Interact** via click/fill using snapshot refs
4. **Screenshot** to verify visual state
5. **Console** check for JS errors
6. **Stop** session when done

## Standard smoke test
```bash
playwright-cli --session=smoke open <app-url>
playwright-cli --session=smoke snapshot
# verify key elements are present in snapshot output
playwright-cli --session=smoke screenshot
playwright-cli --session=smoke console error
playwright-cli session-stop-all
```

## Report format
After testing, report:
- Pages tested
- Actions performed
- Errors found (console errors, broken flows, visual issues)
- Screenshots taken (list paths)
- Pass / Fail verdict per flow

## Rules
- Always use named sessions (`--session=<name>`) so multiple flows don't collide
- Always run `session-stop-all` when done
- Screenshot on failure, not just success
- Note console errors even if flows appear to work
