#!/bin/bash
# ai-project-starter — Project Initialization
# ============================================
# Recommended: Use /init-project in Claude Code for a better experience.
# This script is a fallback for environments without Claude Code.

set -e

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║      AI Project Starter — Setup          ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# Check if Claude Code is available
if command -v claude &> /dev/null; then
    echo "✅ Claude Code detected!"
    echo ""
    echo "For the best experience, use the interactive wizard:"
    echo ""
    echo "  1. Open Claude Code in this directory"
    echo "  2. Run: /init-project"
    echo ""
    echo "The /init-project command will:"
    echo "  • Ask you about your project interactively"
    echo "  • Configure CLAUDE.md and AGENTS.md automatically"
    echo "  • Set up your memory system"
    echo "  • Generate appropriate .gitignore"
    echo "  • Create your first sprint plan"
    echo ""
    read -p "Open Claude Code now? (y/N): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        claude .
        exit 0
    fi
fi

# Basic fallback setup
echo "Running basic setup..."
echo ""

read -p "Project name: " PROJECT_NAME
read -p "Your name/email: " CONTACT
TODAY=$(date +%Y-%m-%d)

# Replace placeholders in key files
if [ -f "CLAUDE.md" ]; then
    sed -i "s/{PROJECT_NAME}/$PROJECT_NAME/g" CLAUDE.md
    sed -i "s/{CURRENT_DATE}/$TODAY/g" CLAUDE.md
    echo "✅ CLAUDE.md configured"
fi

if [ -f "AGENTS.md" ]; then
    sed -i "s/{PROJECT_NAME}/$PROJECT_NAME/g" AGENTS.md
    sed -i "s/{CURRENT_DATE}/$TODAY/g" AGENTS.md
    echo "✅ AGENTS.md configured"
fi

if [ -f "memory/MEMORY.md" ]; then
    sed -i "s/{PROJECT_NAME}/$PROJECT_NAME/g" memory/MEMORY.md
    echo "✅ memory/MEMORY.md configured"
fi

echo ""
echo "✅ Basic setup complete for: $PROJECT_NAME"
echo ""
echo "Next steps:"
echo "  1. Open Claude Code: claude ."
echo "  2. Run: /init-project  (for full configuration)"
echo "  3. Or read START_PROJECT_PROMPT for manual setup"
echo ""
