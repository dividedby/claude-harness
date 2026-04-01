# PR Prep Prompt
# Run before opening a pull request or merging to main.
# Combines code review + completion check + commit cleanup.

Prepare this work for merge:

1. Run `/project:review` on the changed files since the last merge base
2. Run `/project:done` to verify the feature is actually complete
3. Check `git diff main` (or the base branch) for anything obviously wrong
4. Summarize:
   - What changed
   - Any issues found in review
   - Completion status from Karen
   - Whether it is safe to merge

Do not merge. Just report. I'll decide whether to merge after reviewing your summary.

If you find must-fix issues, list them clearly so I can decide whether to fix them now or track them.
