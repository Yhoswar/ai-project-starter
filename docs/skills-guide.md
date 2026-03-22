# Skills Guide

> Which Claude Code skills to install for each project type.

## Install Skills Globally

```bash
./scripts/install-skills.sh        # bash/zsh
./scripts/install-skills.ps1       # PowerShell
```

## Core Skills (Install for Every Project)

| Skill | What it does |
|-------|-------------|
| `security` | Secure coding, OWASP, auth patterns |
| `frontend-design` | Production-quality UI components |
| `scalability` | DB optimization, caching, API design |
| `superpowers` | TDD, debugging, planning workflows |

## By Project Type

### next-saas
- `ui-ux-pro-max` — design system, shadcn/ui patterns
- `claude-api` — if adding AI features to your app

### api-service
- `security` — auth middleware and input validation
- `scalability` — before adding caching or queues

### automation
- `trigger-dev` — Trigger.dev jobs, scheduling, error handling
- `composio` — 1000+ app integrations
- `n8n` — n8n workflow building

### mcp / integrations
- `mcp-builder` — build MCP (Model Context Protocol) servers from scratch

### document processing
- `pdf` — merge, split, OCR, extract text/data, fill forms
- `docx` — create and edit Word (.docx) files programmatically

## Manual Installation

Add to `~/.claude/settings.json`:

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
