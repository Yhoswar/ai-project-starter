# Getting Started

## Prerequisites

- [Node.js 20+](https://nodejs.org)
- [Bun](https://bun.sh) — `curl -fsSL https://bun.sh/install | bash`
- [Git](https://git-scm.com)
- [Claude Code](https://claude.ai/code) — for AI agent features
- [GitHub CLI](https://cli.github.com) — optional, for scripts

## 1. Clone

```bash
git clone https://github.com/Yhoswar/ai-project-starter.git
cd ai-project-starter
```

## 2. Choose Your Path

**New project from template:**
```bash
cp -r _blueprints/next-saas ../my-project
cd ../my-project
bun install
cp .env.example .env
```

**Add agents to existing project:**
```bash
cp -r .claude /path/to/your-project/
cp CLAUDE.md AGENTS.md /path/to/your-project/
cp -r memory /path/to/your-project/
```

## 3. Install Skills Globally

```bash
./scripts/install-skills.sh
```

## 4. Configure Memory

Edit `memory/MEMORY.md` in your project to describe what you're building.

## 5. Open Claude Code

```bash
claude  # opens in your project directory
```

Try `/team-plan` to kick off planning with all 7 agents.

## Troubleshooting

**Skills not loading?**
- Run `./scripts/install-skills.sh` again
- Check `~/.claude/settings.json` has `yhosw-skills@yhosw-skills: true`
- Restart Claude Code

**Template won't start?**
- Ensure `.env` is filled out (not `.env.example`)
- Run `bun install` first
- For next-saas: run `bun db:push` to create DB tables

---

## Next Steps

Once you're set up, follow the complete project roadmap:
**[docs/project-roadmap.md](project-roadmap.md)** — Phases 0–4 from idea to production, including security checkpoints.
