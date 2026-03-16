# Memory Guide

## Two Memory Systems

### MEMORY.md — Per-Project Context
File-based, git-versioned, per-project. Claude reads it at session start.

**Setup:**
1. Edit `memory/MEMORY.md` with your project details
2. Update it as your project evolves

**What to put in it:**
- Project name, stack, current goal
- Key architecture decisions
- Active sprint / what you're working on
- External services in use (without credentials)

**What NOT to put in it:**
- API keys or secrets (use .env)
- Code snippets

### claude-mem MCP — Cross-Session Database
Persistent memory across ALL sessions and projects. Uses smart search.

**When to use:** "Did we solve this bug before?" / "How did we configure X last time?"

## Memory Hierarchy

```
~/.claude/memory/           ← Global user memory (all projects)
project-root/memory/        ← This project's memory
  MEMORY.md                 ← Index (Claude reads this first)
  decisions.md              ← Architecture decisions log
  sprint.md                 ← Current work in progress
  services.md               ← External services (no secrets)
claude-mem MCP database     ← Cross-session searchable history
```
