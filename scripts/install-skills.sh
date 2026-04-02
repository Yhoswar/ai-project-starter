#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────
#  Claude Code Skills Installer
#
#  PART 1 — LOCAL SKILLS
#    Source:  ~/OneDrive/Desktop/Claude/claude-skills/  (o $SKILLS_ROOT)
#    Dest:    ~/.claude/skills/  ← GLOBAL (todos los proyectos)
#
#  PART 2 — MARKETPLACE PACKAGES
#    Install via: claude plugin install <package>
#    (este script solo muestra la lista)
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
#  Source: claude-skills repo (Yhoswar/claude-skills)
#  Dest:   ~/.claude/skills/  (global)
# ─────────────────────────────────────────────

echo -e "${BOLD}[1/2] LOCAL SKILLS${RESET} ${DIM}(from claude-skills repo → ~/.claude/skills/)${RESET}"
echo ""

# Resolve source directory
if [[ -n "${SKILLS_ROOT:-}" ]]; then
  SOURCE_DIR="$SKILLS_ROOT"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || -d "/c/Users" ]]; then
  SOURCE_DIR="${USERPROFILE}/OneDrive/Desktop/Claude/claude-skills"
else
  SOURCE_DIR="$HOME/Desktop/Claude/claude-skills"
fi

DEST_SKILLS="$HOME/.claude/skills"
DEST_AGENTS="$HOME/.claude/agents"

echo -e "  Source:      ${CYAN}$SOURCE_DIR${RESET}"
echo -e "  Destination: ${CYAN}$DEST_SKILLS${RESET}"
echo ""

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo -e "  ${YELLOW}⚠ claude-skills repo not found: $SOURCE_DIR${RESET}"
  echo -e "  ${DIM}Clone it first: git clone https://github.com/Yhoswar/claude-skills.git${RESET}"
  echo -e "  ${DIM}Or set SKILLS_ROOT=/path/to/claude-skills and retry.${RESET}"
  echo ""
else
  mkdir -p "$DEST_SKILLS" "$DEST_AGENTS"

  install_skill() {
    local skill="$1"
    local src="$SOURCE_DIR/$skill"
    local dest="$DEST_SKILLS/$skill"
    if [[ ! -e "$src" ]]; then
      echo -e "    ${DIM}SKIP: $skill (not found in source)${RESET}"
      return
    fi
    if [[ -e "$dest" ]]; then
      echo -e "    ${DIM}OK (already installed): $skill${RESET}"
      return
    fi
    cp -r "$src" "$dest"
    echo -e "    ${GREEN}✓ INSTALLED: $skill${RESET}"
  }

  # ── Core skills (install always) ──────────────────────────────────────
  echo -e "  ${BOLD}Core skills${RESET} ${DIM}(installed for all projects):${RESET}"
  CORE_SKILLS=(
    "security"
    "researcher"
    "self-healing"
    "cost-reducer"
    "systematic-debugging"
    "content-research-writer"
    "humanizer"
    "pdf"
    "docx"
    "mcp-builder"
    "web-accessibility"
    "web-design-guidelines"
    "emil-design-eng"
  )
  for skill in "${CORE_SKILLS[@]}"; do install_skill "$skill"; done

  # ── Marketing Suite (optional) ────────────────────────────────────────
  echo ""
  echo -e "  ${BOLD}Marketing Suite${RESET} ${DIM}(31 skills — content, CRO, email, strategy):${RESET}"
  read -rp "    Install full Marketing suite? [y/N] " answer
  if [[ "$answer" =~ ^[Yy]$ ]]; then
    MARKETING_SKILLS=(
      "ab-test-setup" "ai-seo" "analytics-tracking" "churn-prevention" "cold-email"
      "competitor-alternatives" "content-strategy" "copy-editing" "copywriting"
      "customer-research" "email-sequence" "form-cro" "free-tool-strategy"
      "launch-strategy" "lead-magnets" "marketing-ideas" "marketing-psychology"
      "onboarding-cro" "page-cro" "paywall-upgrade-cro" "popup-cro" "pricing-strategy"
      "product-marketing-context" "programmatic-seo" "referral-program" "revops"
      "sales-enablement" "schema-markup" "signup-flow-cro" "site-architecture"
      "social-content"
    )
    MARKETING_SRC="$SOURCE_DIR/claude-marketing"
    for skill in "${MARKETING_SKILLS[@]}"; do
      local src="$MARKETING_SRC/$skill"
      local dest="$DEST_SKILLS/$skill"
      if [[ ! -e "$src" ]]; then
        echo -e "    ${DIM}SKIP: $skill (not found)${RESET}"
      elif [[ -e "$dest" ]]; then
        echo -e "    ${DIM}OK (already installed): $skill${RESET}"
      else
        cp -r "$src" "$dest"
        echo -e "    ${GREEN}✓ INSTALLED: $skill${RESET}"
      fi
    done
    echo -e "    ${GREEN}✓ Marketing suite complete${RESET}"
  else
    echo -e "    ${DIM}Skipped.${RESET}"
  fi

  # ── Ads Suite (optional) ──────────────────────────────────────────────
  echo ""
  echo -e "  ${BOLD}Ads Suite${RESET} ${DIM}(18 skills + 10 agents — Google, Meta, LinkedIn, TikTok, etc.):${RESET}"
  read -rp "    Install full Ads suite? [y/N] " answer
  if [[ "$answer" =~ ^[Yy]$ ]]; then
    ADS_SRC="$SOURCE_DIR/claude-ads"
    # Main ads skill + sub-skills
    for skill_dir in "$ADS_SRC"/*/; do
      name=$(basename "$skill_dir")
      [[ "$name" == "agents" ]] && continue
      local dest="$DEST_SKILLS/$name"
      if [[ -e "$dest" ]]; then
        echo -e "    ${DIM}OK (already installed): $name${RESET}"
      else
        cp -r "$skill_dir" "$dest"
        echo -e "    ${GREEN}✓ INSTALLED: $name${RESET}"
      fi
    done
    # Agents
    if [[ -d "$ADS_SRC/agents" ]]; then
      for agent_file in "$ADS_SRC/agents"/*.md; do
        agent_name="$(basename "$agent_file")"
        if [[ -f "$DEST_AGENTS/$agent_name" ]]; then
          echo -e "    ${DIM}OK (already installed): agent/$agent_name${RESET}"
        else
          cp "$agent_file" "$DEST_AGENTS/$agent_name"
          echo -e "    ${GREEN}✓ INSTALLED: agent/$agent_name${RESET}"
        fi
      done
    fi
    echo -e "    ${GREEN}✓ Ads suite complete${RESET}"
  else
    echo -e "    ${DIM}Skipped.${RESET}"
  fi

  # ── SEO Suite (optional) ───────────────────────────────────────────────
  echo ""
  echo -e "  ${BOLD}SEO Suite${RESET} ${DIM}(20 skills + 12 agents):${RESET}"
  read -rp "    Install full SEO suite? [y/N] " answer
  if [[ "$answer" =~ ^[Yy]$ ]]; then
    SEO_SKILLS=(
      "seo" "seo-audit" "seo-backlinks" "seo-competitor-pages" "seo-content"
      "seo-dataforseo" "seo-firecrawl" "seo-geo" "seo-google" "seo-hreflang"
      "seo-image-gen" "seo-images" "seo-local" "seo-maps" "seo-page"
      "seo-plan" "seo-programmatic" "seo-schema" "seo-sitemap" "seo-technical"
    )
    for skill in "${SEO_SKILLS[@]}"; do install_skill "$skill"; done

    # Install SEO agents
    SEO_AGENTS_SRC="$SOURCE_DIR/claude-seo/agents"
    if [[ -d "$SEO_AGENTS_SRC" ]]; then
      for agent_file in "$SEO_AGENTS_SRC"/seo-*.md; do
        agent_name="$(basename "$agent_file")"
        if [[ -f "$DEST_AGENTS/$agent_name" ]]; then
          echo -e "    ${DIM}OK (already installed): agent/$agent_name${RESET}"
        else
          cp "$agent_file" "$DEST_AGENTS/$agent_name"
          echo -e "    ${GREEN}✓ INSTALLED: agent/$agent_name${RESET}"
        fi
      done
    fi
    echo -e "    ${GREEN}✓ SEO suite complete${RESET}"
  else
    echo -e "    ${DIM}Skipped.${RESET}"
  fi
fi

# ─────────────────────────────────────────────
#  PART 2 — MARKETPLACE PACKAGES
#  Install via Claude Code plugin manager or CLI.
# ─────────────────────────────────────────────

echo ""
echo -e "${BOLD}[2/2] MARKETPLACE PACKAGES${RESET} ${DIM}(install via Claude Code plugin manager)${RESET}"
echo ""
echo -e "  ${DIM}Install via CLI: claude plugin install <package>${RESET}"
echo -e "  ${DIM}Or via UI: Claude Code → Settings → Plugins/Marketplace${RESET}"
echo ""

echo -e "  ${BOLD}Core (recommended for ALL projects):${RESET}"
echo -e "  ${GREEN}•${RESET} superpowers     — TDD, debugging, brainstorming, planning, worktrees (12+ skills)"
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

echo -e "${BOLD}Done!${RESET} Restart Claude Code for skills to take effect."
echo ""
