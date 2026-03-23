Install my development harness. This is Ubuntu Linux.

TOOLS:
1. RTK (token compression):
   curl -fsSL https://raw.githubusercontent.com/rtk-ai/rtk/refs/heads/master/install.sh | sh
   rtk init --global --auto-patch
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
  },
  "permissions": {
    "deny": [
      "Read(./.env)",
      "Read(./.env.*)",
      "Read(./secrets/**)",
      "Read(**/*.pem)",
      "Read(**/*.key)",
      "Read(**/credentials*)"
    ]
  },
  "hooks": {
    "SessionStart": [
      {
        "hooks": [{
          "type": "command",
          "command": "echo '{\"additionalContext\": \"Branch: '$(git branch --show-current 2>/dev/null || echo unknown)'. Last commit: '$(git log -1 --format=\"%s\" 2>/dev/null || echo none)'. Harness: RTK + GrapeRoot + Claude-Mem.\"}'"
        }]
      }
    ],
    "PreCompact": [
      {
        "hooks": [{
          "type": "command",
          "command": "echo 'COMPACTION IMMINENT: Write current state to handoff.md now. Include: what was done, what is in progress, files changed, and the exact resume instruction. Do this before proceeding.'"
        }]
      }
    ]
  }
}

HOOK ORDERING NOTE:
- RTK installs a PreToolUse hook. If Security Guidance plugin is also installed,
  confirm RTK's hook runs AFTER Security Guidance in settings.json so RTK sees
  the already-approved command.
- GrapeRoot also writes hooks. After all tools are installed, verify no duplicates:
  cat ~/.claude/settings.json | jq '.hooks'

Report what's installed, what failed, and confirm the settings file is correct.
