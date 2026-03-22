#!/bin/bash
command -v rtk    || brew install rtk && rtk init --global
command -v dgc    || curl -sSL https://raw.githubusercontent.com/kunal12203/Codex-CLI-Compact/main/install.sh | bash
command -v serena-mcp || opencode --install-mcp serena
command -v claude-octopus || npm install -g claude-octopus
command -v gemini || npm install -g @google/gemini-cli

# Merge .claude/settings.json into ~/.claude/settings.json
echo "Setup complete. Run ./scripts/session-start.sh to start."
