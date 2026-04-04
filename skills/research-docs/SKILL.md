---
name: research-docs
description: >
  Lightweight research and documentation lookup using Perplexity API or web fetch.
  Use for: "look up the latest X docs", "what changed in Y", "find official API for Z".
  Prefers bash curl over always-on MCP servers.
---

Research: $ARGUMENTS

1. Check for `PERPLEXITY_API_KEY` or `CLAUDE_PLUGIN_OPTION_perplexity_api_key`.
2. With Perplexity:
   ```bash
   curl -s https://api.perplexity.ai/chat/completions \
     -H "Authorization: Bearer ${PERPLEXITY_API_KEY:-$CLAUDE_PLUGIN_OPTION_perplexity_api_key}" \
     -H "Content-Type: application/json" \
     -d '{"model":"llama-3.1-sonar-large-128k-online","messages":[{"role":"user","content":"'"$ARGUMENTS"'"}],"max_tokens":1024}' \
   | jq -r '.choices[0].message.content'
   ```
3. Without Perplexity: use WebFetch on official docs URL if known.
4. Summarize in ≤200 words. Link primary source. Flag version-specific caveats.
5. If findings suggest harness update needed: offer to run `/self-improve`.
