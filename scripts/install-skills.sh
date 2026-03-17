#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────
#  Claude Code Skills Installer
#  Installs LOCAL skills from a folder + lists
#  MARKETPLACE packages to install via UI.
# ─────────────────────────────────────────────

# ANSI colors (fallback gracefully if not supported)
if [[ -t 1 ]]; then
  BOLD="\033[1m"; GREEN="\033[0;32m"; YELLOW="\033[1;33m"
  CYAN="\033[0;36m"; RESET="\033[0m"; DIM="\033[2m"
else
  BOLD=""; GREEN=""; YELLOW=""; CYAN=""; RESET=""; DIM=""
fi

echo ""
echo -e "${BOLD}╔══════════════════════════════════════════╗${RESET}"
echo -e "${BOLD}║     Claude Code Skills Installer         ║${RESET}"
echo -e "${BOLD}╚══════════════════════════════════════════╝${RESET}"
echo ""

# ─────────────────────────────────────────────
#  PART 1 — LOCAL SKILLS
#  Copied from a local folder into ~/.claude/skills/
# ─────────────────────────────────────────────

echo -e "${BOLD}[1/2] LOCAL SKILLS${RESET} ${DIM}(copied from local folder)${RESET}"
echo ""

# Resolve source directory
if [[ -n "${SKILLS_ROOT:-}" ]]; then
  SOURCE_DIR="$SKILLS_ROOT"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || -d "/c/Users" ]]; then
  SOURCE_DIR="${USERPROFILE}/OneDrive/Desktop/Claude Skills"
else
  SOURCE_DIR="$HOME/Claude Skills"
fi

DEST_DIR="$HOME/.claude/skills"

echo -e "  Source:      ${CYAN}$SOURCE_DIR${RESET}"
echo -e "  Destination: ${CYAN}$DEST_DIR${RESET}"
echo ""

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo -e "  ${YELLOW}⚠ Skills folder not found: $SOURCE_DIR${RESET}"
  echo -e "  ${DIM}Set SKILLS_ROOT=/path/to/your/skills and retry, or skip to Part 2.${RESET}"
  echo ""
else
  # Core local skills (always install if available)
  CORE_SKILLS=("security" "researcher" "self-healing")
  # Optional local skills (ask user)
  OPTIONAL_SKILLS=("cost-reducer")

  mkdir -p "$DEST_DIR"

  install_skill() {
    local skill="$1"
    local src="$SOURCE_DIR/$skill"
    local dest="$DEST_DIR/$skill"
    if [[ ! -d "$src" ]]; then
      echo -e "  ${DIM}SKIP: $skill (not found in source)${RESET}"
      return
    fi
    if [[ -d "$dest" ]]; then
      echo -e "  ${DIM}OK (already installed): $skill${RESET}"
      return
    fi
    cp -r "$src" "$dest"
    echo -e "  ${GREEN}✓ INSTALLED: $skill${RESET}"
  }

  echo -e "  ${BOLD}Core skills:${RESET}"
  for skill in "${CORE_SKILLS[@]}"; do install_skill "$skill"; done

  echo ""
  echo -e "  ${BOLD}Optional skills${RESET} ${DIM}(y to install, Enter to skip):${RESET}"
  for skill in "${OPTIONAL_SKILLS[@]}"; do
    read -rp "    Install $skill? [y/N] " answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then install_skill "$skill"; fi
  done
fi

# ─────────────────────────────────────────────
#  PART 2 — MARKETPLACE PACKAGES
#  Install these via Claude Code plugin manager UI.
#  These are NOT local files — they come from the marketplace.
# ─────────────────────────────────────────────

echo ""
echo -e "${BOLD}[2/2] MARKETPLACE PACKAGES${RESET} ${DIM}(install via Claude Code plugin manager)${RESET}"
echo ""
echo -e "  ${DIM}These cannot be installed by this script.${RESET}"
echo -e "  ${DIM}Open Claude Code → Settings → Plugins/Marketplace and install:${RESET}"
echo ""

echo -e "  ${BOLD}Core (recommended for ALL projects):${RESET}"
echo -e "  ${GREEN}•${RESET} superpowers     — TDD, debugging, brainstorming, planning, worktrees (12 skills)"
echo -e "  ${GREEN}•${RESET} claude-mem      — cross-session memory (make-plan, do, smart-explore, mem-search)"
echo -e "  ${GREEN}•${RESET} context-mode    — real-time context window management"
echo ""

echo -e "  ${BOLD}UI / Frontend:${RESET}"
echo -e "  ${CYAN}•${RESET} frontend-design — production-grade UI components"
echo -e "  ${CYAN}•${RESET} ui-ux-pro-max   — 50+ styles, 161 palettes, full UX guidelines"
echo ""

echo -e "  ${BOLD}By project type:${RESET}"
echo -e "  ${CYAN}•${RESET} claude-api      — Anthropic SDK / Claude API development"
echo -e "  ${CYAN}•${RESET} code-review     — pull request reviews"
echo -e "  ${CYAN}•${RESET} skill-creator   — create and optimize custom skills"
echo -e "  ${CYAN}•${RESET} loop            — recurring/interval tasks"
echo -e "  ${CYAN}•${RESET} simplify        — code quality review"
echo -e "  ${CYAN}•${RESET} update-config   — configure settings.json and hooks"
echo ""

echo -e "${BOLD}Done!${RESET} Restart Claude Code for local skills to take effect."
echo ""
