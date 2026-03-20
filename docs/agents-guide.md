# Agents Guide

## The Multi-Agent System

6 agents (5 core + 1 optional) that collaborate via Claude Code.

| Agent | Role | Use for |
|-------|------|---------|
| Director | Orchestrates | Project planning, delegation |
| Architect | System design | Architecture decisions |
| Frontend | UI/UX | Components, pages, styling |
| Backend | API + data | Routes, DB, auth |
| Marketer | Product messaging | Landing pages, copy |
| Researcher | Deep research | Finding solutions, comparing options |
| Reviewer | Code quality | PR review, security audit |

## Slash Commands

```bash
/team-plan    # Director creates a plan using all relevant agents
/team-status  # Summary of current progress
/team-review  # Full code review using Reviewer agent
```

## How to Use Specific Agents

```
@architect What's the best approach for file uploads at scale?
@frontend Build a responsive data table with sorting and filtering
@backend Add rate limiting to all /api/auth/* routes
```

## Adding Custom Agents

Add a file to `.claude/agents/`:

```markdown
---
name: your-agent-name
description: When to invoke this agent
---

# Agent Role
Your agent instructions here.
```
