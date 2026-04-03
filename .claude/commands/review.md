Code review. Real problems only.

1. Read CLAUDE.md - flag any violations
2. Correctness: edge cases, off-by-one, race conditions
3. Security: injection, auth bypass, unvalidated input, secrets in code
4. Complexity: simpler implementation with same correctness?
5. Context hygiene: content in MEMORY.md that should be in research/ files?

Output per issue:
File:Line - [CRITICAL / WARN / NOTE]
One-sentence problem
Specific fix

End with: SHIP or FIX FIRST (CRITICAL items only)

Files: $ARGUMENTS
