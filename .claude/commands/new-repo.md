Create a new private GitHub repo and wire it to this harness.

1. Create repo:
   gh repo create $ARGUMENTS --private --clone --description ""

2. Copy harness scaffold into new repo directory:
   cp CLAUDE.md docs/project.md MEMORY.md .gitignore .claudeignore <new-dir>/
   cp -r .claude .github <new-dir>/

3. Edit docs/project.md - fill in project name and stack

4. Initial commit:
   cd <new-dir> && git add -A && git commit -m "init: harness scaffold"
   git push origin main

5. Set repo secrets:
   gh secret set CLAUDE_CODE_OAUTH_TOKEN --body "$(claude setup-token)"
   gh secret set PERPLEXITY_API_KEY --body "<from-your-notes>"

Repo name: $ARGUMENTS
