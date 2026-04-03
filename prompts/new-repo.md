# New Private Repo

Create a new private GitHub repo and scaffold it with the harness.

Repo name: [NAME]
Description: [ONE LINE]
Stack: [LANGUAGE/FRAMEWORK]

Steps:
1. gh repo create [NAME] --private --clone --description "[DESCRIPTION]"
2. Copy harness files into the new directory
3. Fill in docs/project.md with the stack above
4. Initial commit and push
5. Set secrets: CLAUDE_CODE_OAUTH_TOKEN + PERPLEXITY_API_KEY
6. Confirm workflows are enabled in GitHub Actions tab
