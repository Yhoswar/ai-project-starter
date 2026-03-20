<div align="center">

# AI Project Starter

**The fastest way to start any project with full AI infrastructure.**

5 core agents + 1 optional · Context memory system · Interactive setup wizard · Production blueprints

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-blue)](https://claude.ai/code)
[![OpenCode](https://img.shields.io/badge/OpenCode-Compatible-green)](https://opencode.ai)

[Quick Start](#quick-start) · [What You Get](#what-you-get) · [Agents](#agents) · [Commands](#commands) · [Blueprints](#blueprints) · [Roadmap](docs/project-roadmap.md) · [Contributing](CONTRIBUTING.md)

**[🇪🇸 Versión en Español](README.es.md)**

</div>

---

## Quick Start

**2 minutes to a fully configured AI workspace.**

### Option 1: Use as GitHub Template (Recommended)

1. Click **"Use this template"** on GitHub
2. Clone your new repo
3. Open in Claude Code and run:

```bash
/init-project
```

The wizard will ask about your project and configure everything automatically.

> **What's next after `/init-project`?** Follow the [Project Roadmap](docs/project-roadmap.md) — phases 0–4 from planning to production.

### Option 2: Add to Existing Project

```bash
# Copy only the AI config layer (no templates)
curl -sSL https://raw.githubusercontent.com/Yhoswar/ai-project-starter/main/scripts/install-skills.sh | bash
```

### Option 3: Manual Clone

```bash
git clone https://github.com/Yhoswar/ai-project-starter.git my-project
cd my-project
claude .
# Then run /init-project
```

> **No Claude Code?** Copy `START_PROJECT_PROMPT` and paste it into any Claude conversation.

---

## What You Get

### 🤖 6 Specialized Agents (5 Core + 1 Optional)
Pre-configured agents that collaborate automatically. Each expert in their domain, with built-in security rules and memory protocol.

| Agent | Expertise |
|-------|-----------|
| **Director** | Orchestrates multi-agent workflows |
| **Architect** | System design, ADRs, data models |
| **Frontend** | UI/UX, React, Tailwind, accessibility |
| **Backend** | APIs, databases, auth, security |
| **Reviewer** | Code review, security audit, QA |
| **Strategist** | Research, content, SEO *(optional)* |

### 🧠 Persistent Memory System
Never lose context between sessions. Every session picks up exactly where you left off.

```
memory/
├── MEMORY.md       ← Session index (auto-loaded)
├── decisions.md    ← Architecture decisions log
├── issues.md       ← Tech debt tracker
├── sprint.md       ← Current sprint status
├── services.md     ← External services registry
└── changelog.md    ← Session-by-session history
```

**Key commands:**
- `/load-context` — Start of session: loads all context and presents summary
- `/save-context` — End of session: saves all progress and suggests next steps

### ⚡ Slash Commands

| Command | Purpose |
|---------|---------|
| `/init-project` | Interactive setup wizard |
| `/load-context` | Load context at session start |
| `/save-context` | Save context at session end |
| `/validate-setup` | Verify project is correctly configured |
| `/team-plan` | Plan a task using multiple agents |
| `/team-status` | Check in-progress task status |
| `/team-review` | Review completed work |

### 📐 Universal Skeleton

```
your-project/
├── planning/           ← Roadmaps, sprints, OKRs
├── implementation/     ← Technical specs, ADRs
├── tests/              ← Test files
├── mcps/               ← MCP server configurations
├── memory/             ← Context persistence (always present)
└── _blueprints/        ← Production templates (optional reference)
```

---

## Agents

### How Multi-Agent Collaboration Works

```
You: /team-plan "build user authentication end-to-end"
         ↓
    Director analyzes → dispatches Architect → Architect designs
         ↓
    Director dispatches Backend → Backend implements
         ↓
    Director dispatches Frontend → Frontend builds UI
         ↓
    Director dispatches Reviewer → Reviewer validates
         ↓
    Director presents consolidated result
```

### Using Individual Agents

Mention the agent role in your request or use it explicitly:

```
"As the architect, design the data model for multi-tenancy"
"Have the backend agent implement the /api/users endpoint"
"Use the reviewer to audit the auth middleware for security issues"
```

### Memory Protocol (Built Into Every Agent)

Every agent automatically:
1. **Before acting**: Reads `memory/MEMORY.md` for project context
2. **After completing**: Updates relevant memory files

---

## Commands

### `/init-project` — Project Setup Wizard

Interactively configures your entire project:

- Asks about project type, stack, and features
- Generates configured `CLAUDE.md` and `AGENTS.md` (no placeholders)
- Sets up `memory/` files with first sprint
- Creates appropriate `.gitignore`
- Offers to start from a production blueprint
- Initializes git with first commit

### `/team-plan` — Multi-Agent Task Planning

```bash
/team-plan "implement Stripe payments with webhooks"
```

### `/load-context` · `/save-context` — Memory Management

```bash
# Start of session
/load-context
# → "Here's where we are: Sprint 3, working on payments..."

# End of session
/save-context
# → Updates all memory files, shows snapshot, suggests next steps
```

---

## Blueprints

Production-ready project starters in `_blueprints/`. Use `/init-project` to start from one.

| Blueprint | Stack | Best For |
|-----------|-------|----------|
| `next-saas/` | Next.js 15 + Auth.js + Drizzle + shadcn/ui | SaaS, dashboards |
| `api-service/` | Bun + Hono + Drizzle + Zod | REST APIs, microservices |
| `automation/` | Trigger.dev + Composio + n8n | Workflows, bots |

Blueprints are **reference implementations** — they show production patterns but are not meant to be used as-is. Run `/init-project` and choose a blueprint to start from it.

---

## Dual Platform Support

This template works with both Claude Code and OpenCode:

| Feature | Claude Code | OpenCode |
|---------|-------------|----------|
| Agents | `.claude/agents/` | `.opencode/agents/` |
| Commands | `.claude/commands/` | `.opencode/commands/` |
| Skills | Via plugin manager | Via opencode.json |

---

## Recommended Skills

Install these after setting up your project:

```bash
# Essential (install first)
claude install superpowers context-mode claude-mem security

# Recommended
claude install frontend-design ui-ux-pro-max code-review

# Optional
claude install researcher cost-reducer self-healing
```

See `docs/skills-guide.md` for what each skill does.

---

## Project Structure

```
ai-project-starter/
├── .claude/
│   ├── agents/          ← 6 specialized agents
│   ├── commands/        ← 7 slash commands
│   └── settings.local.json
├── .opencode/           ← OpenCode mirror
├── .github/
│   └── workflows/       ← CI/CD (lint, typecheck, test, build)
├── _blueprints/         ← 3 production starters
├── docs/                ← Guides and architecture docs
├── memory/              ← Persistent context system
├── planning/            ← Project planning
├── implementation/      ← Technical specs
├── tests/               ← Test files
├── mcps/                ← MCP configurations
├── scripts/             ← Installation helpers
├── CLAUDE.md            ← Claude Code configuration (fill this in)
├── AGENTS.md            ← Agent architecture guide (fill this in)
├── START_PROJECT_PROMPT ← No-CLI fallback
└── init-project.sh/.ps1 ← Quick setup scripts
```

---

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to contribute.

**Quick version:**
- Bug reports → [GitHub Issues](https://github.com/Yhoswar/ai-project-starter/issues)
- Feature requests → [GitHub Issues](https://github.com/Yhoswar/ai-project-starter/issues)
- Pull requests → Fork → branch → PR against `main`

---

## License

MIT — See [LICENSE](LICENSE).

---

<div align="center">
Made for builders who want AI to feel like a superpower, not a chatbot.
</div>
