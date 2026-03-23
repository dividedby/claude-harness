Install my development harness. This is Ubuntu Linux.

TOOLS:
1. RTK (token compression):
   curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/refs/heads/master/install.sh | sh
   rtk init --global
   Verify with: rtk gain

2. GrapeRoot (codebase context pre-injection):
   curl -sSL https://raw.githubusercontent.com/kunal12203/Codex-CLI-Compact/main/install.sh | bash
   source ~/.bashrc
   Verify with: which dgc

3. Claude-Mem (persistent memory across sessions):
   /plugin marketplace add thedotmack/claude-mem
   /plugin install claude-mem
   Restart Claude Code.

   Verify:
   - Claude-Mem shows up in /plugin list
   - http://localhost:37777 loads the memory viewer
   - New sessions mention Claude-Mem in tool logs when searching memory

SETTINGS — write to ~/.claude/settings.json (merge if it exists):
{
  "env": {
    "ENABLE_TOOL_SEARCH": "true",
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  }
}

Report what's installed, what failed, and confirm the settings file is correct.
