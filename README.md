# ai-project-starter

> The AI-native project starter: multi-agent Claude Code configuration + three production-ready templates.

[![CI](https://github.com/Yhoswar/ai-project-starter/actions/workflows/ci.yml/badge.svg)](https://github.com/Yhoswar/ai-project-starter/actions/workflows/ci.yml)

## What's Inside

Two independent layers:

**1. AI Config Layer** — Works with any codebase
- 7 specialized Claude Code agents (Director, Architect, Frontend, Backend, Marketer, Researcher, Reviewer)
- Slash commands: `/team-plan`, `/team-status`, `/team-review`
- `MEMORY.md` system for project context across sessions
- Compatible with Claude Code and OpenCode

**2. Application Templates** — Production-ready starters
| Template | Stack | Best for |
|----------|-------|----------|
| `next-saas` | Next.js 15 + Auth.js + Drizzle + shadcn/ui | SaaS, dashboards, web apps |
| `api-service` | Bun + Hono + Drizzle + Zod | REST APIs, microservices |
| `automation` | Trigger.dev + Composio + n8n | Background jobs, workflows, integrations |

## Quick Start

### Option A: Use a Template
```bash
git clone https://github.com/Yhoswar/ai-project-starter.git
cd ai-project-starter

# Copy your chosen template
cp -r templates/next-saas ../my-project
cd ../my-project

bun install
cp .env.example .env  # Fill in your values
bun db:push
bun dev
```

### Option B: Add AI Agents to Existing Project
```bash
cp -r ai-project-starter/.claude your-project/
cp ai-project-starter/CLAUDE.md your-project/
cp ai-project-starter/AGENTS.md your-project/
cp -r ai-project-starter/memory your-project/
```

### Option C: Run the Init Script
```bash
./init-project.sh        # bash/zsh
./init-project.ps1       # PowerShell (Windows)
```

## Install Skills Globally

Make skills available in all your Claude Code projects:

```bash
# bash/zsh
./scripts/install-skills.sh

# PowerShell (Windows)
./scripts/install-skills.ps1
```

Or install manually: see [docs/skills-guide.md](docs/skills-guide.md)

## Documentation

- [Getting Started](docs/getting-started.md)
- [Skills Guide](docs/skills-guide.md) — Which skills to install for each project type
- [Memory Guide](docs/memory-guide.md) — How to use MEMORY.md and claude-mem
- [Agents Guide](docs/agents-guide.md) — How the multi-agent system works

## Platform Support

| Platform | Status |
|----------|--------|
| Claude Code | ✅ Full support |
| OpenCode | ✅ Full support |
| Gemini CLI | 🔜 Via bridge skill |

## License

MIT
