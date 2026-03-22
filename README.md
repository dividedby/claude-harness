# New project
mkdir my-project && cd my-project
git init
git clone https://github.com/dividedby/claude-harness.git
./claude-harness/scripts/setup.sh   # Merges files into project root, installs tools

# Each session
./scripts/session-start.sh
