# Debug Issue Prompt
# Use when investigating a bug, error, or unexpected behavior.
# Fill in the bracketed sections, then paste into Claude.

I have an issue to investigate:

**What is happening:** [describe the observed behavior]

**What should happen:** [describe expected behavior]

**How to reproduce:**
1. [step 1]
2. [step 2]
3. [observed result]

**Error message / logs (if any):**
```
[paste error here]
```

**Where I think it might be:** [any files, modules, or areas you suspect — or "unknown"]

---

Please:
1. Read the relevant code — do not guess
2. Form a hypothesis before suggesting a fix
3. Explain your reasoning before writing any changes
4. Make the minimal fix — do not refactor unrelated code
5. Tell me how to verify the fix worked
