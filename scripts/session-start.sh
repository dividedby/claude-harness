#!/bin/bash
dgc .  # GrapeRoot pre-injection
if command -v ultrawork &>/dev/null; then
  ultrawork
else
  echo "OMO not found, starting plain Claude Code"
  claude
fi
