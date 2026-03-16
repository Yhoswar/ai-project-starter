#!/usr/bin/env bash
set -euo pipefail

# Install Claude Code skills globally
if [[ -n "${SKILLS_ROOT:-}" ]]; then
  SOURCE_DIR="$SKILLS_ROOT"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || -d "/c/Users" ]]; then
  SOURCE_DIR="${USERPROFILE}/OneDrive/Desktop/Claude Skills"
else
  SOURCE_DIR="$HOME/Claude Skills"
fi

DEST_DIR="$HOME/.claude/plugins/local-skills"

echo "Claude Code Skills Installer"
echo "Source: $SOURCE_DIR"
echo "Destination: $DEST_DIR"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "ERROR: Claude Skills folder not found at: $SOURCE_DIR"
  echo "Set SKILLS_ROOT=/path/to/your/skills and retry."
  exit 1
fi

CORE_SKILLS=("security" "scalability" "frontend-design" "researcher" "know-me" "self-healing")
OPTIONAL_SKILLS=("trigger-dev" "composio" "n8n" "cost-reducer" "customer-support" "create-skill")

mkdir -p "$DEST_DIR"

install_skill() {
  local skill="$1"
  local src="$SOURCE_DIR/$skill"
  local dest="$DEST_DIR/$skill"
  if [[ ! -d "$src" ]]; then echo "  SKIP: $skill (not found)"; return; fi
  if [[ -d "$dest" ]]; then echo "  OK (already installed): $skill"; return; fi
  cp -r "$src" "$dest"
  echo "  INSTALLED: $skill"
}

echo ""
echo "Installing core skills..."
for skill in "${CORE_SKILLS[@]}"; do install_skill "$skill"; done

echo ""
echo "Optional skills (y to install, Enter to skip):"
for skill in "${OPTIONAL_SKILLS[@]}"; do
  read -rp "  Install $skill? [y/N] " answer
  if [[ "$answer" =~ ^[Yy]$ ]]; then install_skill "$skill"; fi
done

echo ""
echo "Done! Restart Claude Code for changes to take effect."
