#!/bin/bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
HARNESS_DIR="$(dirname "$SCRIPT_DIR")"
PROJECT_DIR="$(dirname "$HARNESS_DIR")"

echo "=== Merging scaffold into project root ==="
# Copy templates (won't overwrite existing files)
for f in CLAUDE.md TODO.md handoff.md README.md; do
  [ ! -f "$PROJECT_DIR/$f" ] && cp "$HARNESS_DIR/$f" "$PROJECT_DIR/$f"
done

# Merge directories
cp -rn "$HARNESS_DIR/.claude" "$PROJECT_DIR/" 2>/dev/null || true
cp -rn "$HARNESS_DIR/.research" "$PROJECT_DIR/" 2>/dev/null || true
cp -rn "$HARNESS_DIR/prompts" "$PROJECT_DIR/" 2>/dev/null || true
cp -rn "$HARNESS_DIR/scripts" "$PROJECT_DIR/" 2>/dev/null || true
chmod +x "$PROJECT_DIR/scripts/"*.sh

echo "=== Installing tools ==="
# RTK (token compression)
command -v rtk || { brew install rtk && rtk init --global; }

# GrapeRoot (context pre-injection)
command -v dgc || { curl -sSL https://raw.githubusercontent.com/kunal12203/Codex-CLI-Compact/main/install.sh | bash && source ~/.zshrc; }

# Bun (OMO prerequisite)
command -v bun || curl -fsSL https://bun.sh/install | bash

# Oh My OpenAgent
[ -d ~/.opencode/plugins/oh-my-opencode ] || git clone https://github.com/code-yeongyu/oh-my-openagent.git ~/.opencode/plugins/oh-my-opencode

# Serena MCP (symbolic editing)
command -v serena-mcp || opencode --install-mcp serena

# Perplexity MCP (web search) — requires PERPLEXITY_API_KEY
if ! claude mcp list 2>/dev/null | grep -q perplexity; then
  echo "Add Perplexity MCP manually: claude mcp add perplexity --env PERPLEXITY_API_KEY=\"your-key\" -- npx -y @perplexity-ai/mcp-server"
fi

# Gemini CLI (free research)
command -v gemini || npm install -g @google/gemini-cli

# Claude Octopus (token analytics)
command -v claude-octopus || npm install -g claude-octopus

# Playwright (visual testing — direct, not MCP)
if [ ! -d "$PROJECT_DIR/node_modules/playwright" ]; then
  cd "$PROJECT_DIR" && npm install playwright @playwright/test && npx playwright install chromium
fi

echo "=== Done. You can delete claude-harness/ or add it to .gitignore ==="
echo "Run: ./scripts/session-start.sh"
