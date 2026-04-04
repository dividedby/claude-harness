# Patch Strategy: PR-Ready Diff Against Current Repo

## Philosophy
One PR per concern. Small, reviewable, independently rollbackable.

## PR Sequence (highest ROI first)

### PR 1: CLAUDE.md Slim
```bash
git checkout -b harness/slim-claude-md
cp /tmp/claude-harness-v2/CLAUDE.md ./CLAUDE.md
git add CLAUDE.md
git commit -m "harness: slim CLAUDE.md to 29 lines

Removes project descriptions, stack overviews, standard conventions.
Keeps behavioral rules, git workflow, tool preferences.
~800 tokens saved per session."
gh pr create --title "Harness: slim CLAUDE.md" --draft
```

### PR 2: Safety Hooks
```bash
git checkout -b harness/safety-hooks
mkdir -p .claude/hooks .claude/scripts
cp /tmp/claude-harness-v2/hooks/hooks.json .claude/hooks/
cp /tmp/claude-harness-v2/scripts/*.sh .claude/scripts/
chmod +x .claude/scripts/*.sh
# Adjust ${CLAUDE_PLUGIN_ROOT} to ${CLAUDE_PROJECT_DIR}/.claude for repo-clone path:
sed -i 's|${CLAUDE_PLUGIN_ROOT}|${CLAUDE_PROJECT_DIR}/.claude|g' .claude/hooks/hooks.json
git add .claude/
git commit -m "harness: add PreCompact, StopFailure, file-guard hooks"
gh pr create --title "Harness: safety hooks" --draft
```

### PR 3: Native Skills
```bash
git checkout -b harness/native-skills
mkdir -p .claude-plugin/skills
cp -r /tmp/claude-harness-v2/skills/* .claude-plugin/skills/
git add .claude-plugin/
git commit -m "harness: add 8 native skills (on-demand loading)"
gh pr create --title "Harness: native skills" --draft
```

### PR 4: Proper Agents
```bash
git checkout -b harness/proper-agents
cp /tmp/claude-harness-v2/agents/* .claude/agents/
git add .claude/agents/
git commit -m "harness: proper agent frontmatter (model, tools, isolation)"
gh pr create --title "Harness: proper agents" --draft
```

### PR 5: Delete Dead Files
```bash
git checkout -b harness/delete-dead-files
rm -f .claude/hooks/skill-tracker.sh
git add -A
git commit -m "harness: delete skill-tracker.sh (fires on every bash call, writes to unread log)"
gh pr create --title "Harness: delete dead files" --draft
```

### PR 6: GitHub Actions
```bash
git checkout -b harness/github-actions
mkdir -p .github/workflows
cp /tmp/claude-harness-v2/.github/workflows/*.yml .github/workflows/
git add .github/
git commit -m "harness: add weekly-refresh and pr-review Actions"
gh pr create --title "Harness: GitHub Actions" --draft
```

## Merge Order
1. Delete dead files (no deps)
2. CLAUDE.md slim (no deps)
3. Safety hooks (no deps)
4. Native skills (no deps)
5. Proper agents (no deps)
6. GitHub Actions (requires PERPLEXITY_API_KEY secret)

## Validate After Each Merge
```bash
claude
> /memory       # verify CLAUDE.md loads
> /hooks        # verify hooks configured
> review this: const x = 1   # verify code-review triggers
```
