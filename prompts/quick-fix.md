# Quick Fix Prompt
# Use for small, scoped fixes. Prevents scope creep.
# Fill in the bracketed sections, then paste.

Fix this specific thing:

**Fix:** [exactly what needs to change — be precise]

**Scope limit:** Only change what is necessary for this fix. Do not:
- Refactor unrelated code
- Add new features
- Change tests unless they directly test this fix
- Update dependencies

**Files likely involved:** [list if you know, or "read the code to find out"]

After fixing:
- Show me a diff of what changed
- Tell me how to verify it works
