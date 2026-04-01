# Skills Guide

> Which Claude Code skills to install for each project type.

## Install Skills

```bash
./scripts/install-skills.sh        # bash/zsh
./scripts/install-skills.ps1       # PowerShell
```

Source repo: [Yhoswar/claude-skills](https://github.com/Yhoswar/claude-skills)

Clone it first if you haven't:
```bash
git clone https://github.com/Yhoswar/claude-skills.git ~/Desktop/Claude/claude-skills
```

---

## Core Skills (Every Project)

Installed automatically by the script — no prompt needed.

| Skill | What it does |
|-------|-------------|
| `security` | OWASP Top 10, XSS, CSRF, SQL injection, auth review |
| `researcher` | Deep research with web search and source synthesis |
| `self-healing` | Continuous self-improvement, auto-memory, skill creation |
| `cost-reducer` | Cloud, infra, and query cost optimization |
| `systematic-debugging` | Structured debugging methodology |
| `content-research-writer` | Research-backed content writing |
| `humanizer` | Remove AI writing patterns from text (improved local version) |
| `pdf` | PDF merge, split, OCR, extract text/data, fill forms |
| `docx` | Create and edit Word (.docx) files programmatically |
| `mcp-builder` | Build MCP (Model Context Protocol) servers from scratch |
| `web-accessibility` | WCAG compliance, a11y review |
| `web-design-guidelines` | Design system standards and best practices |
| `emil-design-eng` | Design engineering patterns |

---

## SEO Suite (Web / Content Projects)

Single install prompt — installs all 20 skills + 12 subagents.

| Skill | What it does |
|-------|-------------|
| `seo` | Main skill — orchestrates the full SEO workflow |
| `seo-audit` | Full site audit (up to 500 pages, parallel subagents) |
| `seo-backlinks` | Backlink profile, anchor text, toxic link detection |
| `seo-competitor-pages` | Competitor comparison and alternatives pages |
| `seo-content` | Content quality, E-E-A-T, readability |
| `seo-dataforseo` | Live SERP data via DataForSEO MCP |
| `seo-firecrawl` | Full-site crawling via Firecrawl MCP |
| `seo-geo` | AI Overviews, ChatGPT, Perplexity optimization |
| `seo-google` | Google Search Console, PageSpeed, GA4 |
| `seo-hreflang` | Hreflang and international SEO audit |
| `seo-image-gen` | AI image generation for SEO assets |
| `seo-images` | Image optimization analysis |
| `seo-local` | Local SEO and Google Business Profile |
| `seo-maps` | Maps intelligence, geo-grid rank tracking |
| `seo-page` | Deep single-page SEO analysis |
| `seo-plan` | Strategic SEO planning with industry templates |
| `seo-programmatic` | Programmatic SEO at scale |
| `seo-schema` | Schema.org structured data detection and validation |
| `seo-sitemap` | XML sitemap analysis and generation |
| `seo-technical` | Technical SEO audit across 9 categories |

**Agents (12):** `seo-content`, `seo-dataforseo`, `seo-geo`, `seo-google`, `seo-image-gen`, `seo-local`, `seo-maps`, `seo-performance`, `seo-schema`, `seo-sitemap`, `seo-technical`, `seo-visual`

---

## Marketplace Packages

Install via `claude plugin install <package>` or the Claude Code UI.

### Always Install (Core)

| Package | Purpose |
|---------|---------|
| `superpowers` | TDD, debugging, brainstorming, planning, worktrees (12+ skills) |
| `claude-mem` | Cross-session memory: make-plan, do, smart-explore, mem-search |
| `context-mode` | Real-time context management — prevents context flooding |

### UI / Frontend

| Package | Purpose |
|---------|---------|
| `frontend-design` | Production-grade UI components |
| `ui-ux-pro-max` | 50+ styles, 161 palettes, 57 font pairings, full UX guidelines |

### By Project Type

| Template | Additional Skills |
|----------|------------------|
| `next-saas` | `ui-ux-pro-max`, `claude-api`, `skill-creator` |
| `api-service` | `claude-api`, `code-review` |
| `automation` | `loop`, `cost-reducer`, `researcher` |
| `mcp / integrations` | `mcp-builder` |
| `document processing` | `pdf`, `docx` |
| any | `simplify`, `update-config`, `humanizer` |

---

## How Skills Are Activated Per Project

After installing globally, open your project's `CLAUDE.md` and uncomment the skills relevant to that project in the `## Skills Activos para Este Proyecto` section. Claude will prioritize those skills for every session in that project.

---

## Manual Settings

To register the `claude-skills` repo as a marketplace source, add to `~/.claude/settings.json`:

```json
{
  "enabledPlugins": {
    "yhosw-skills@yhosw-skills": true
  },
  "extraKnownMarketplaces": {
    "yhosw-skills": {
      "source": {
        "source": "github",
        "repo": "Yhoswar/claude-skills"
      }
    }
  }
}
```
