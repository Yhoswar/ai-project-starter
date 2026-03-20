# Architecture

## System Overview

```mermaid
graph TB
    User[👤 User] -->|runs| InitProject["/init-project"]
    User -->|runs| TeamPlan["/team-plan"]
    User -->|runs| LoadCtx["/load-context"]
    User -->|runs| SaveCtx["/save-context"]

    InitProject --> Config[CLAUDE.md + AGENTS.md]
    InitProject --> Memory[memory/ setup]
    InitProject --> Gitignore[.gitignore generation]
    InitProject --> Blueprints[_blueprints/ reference]

    TeamPlan --> Director

    subgraph Agents["🤖 Agent System"]
        Director[Director\norchestrator]
        Director --> Architect[Architect]
        Director --> Frontend[Frontend]
        Director --> Backend[Backend]
        Director --> Reviewer[Reviewer]
        Director --> Strategist[Strategist\noptional]
    end

    subgraph Memory["🧠 Memory System"]
        MEMORY[MEMORY.md\nindex]
        Decisions[decisions.md]
        Issues[issues.md]
        Sprint[sprint.md]
        Services[services.md]
        Changelog[changelog.md]
    end

    LoadCtx --> MEMORY
    SaveCtx --> MEMORY
    SaveCtx --> Changelog

    Agents --> MEMORY
    Agents --> Decisions
    Agents --> Issues
```

## /init-project Flow

```mermaid
sequenceDiagram
    participant User
    participant Claude
    participant Files as File System

    User->>Claude: /init-project
    Claude->>User: Q1: Project name?
    User->>Claude: "MyApp"
    Claude->>User: Q2: Project type?
    User->>Claude: "web-fullstack"
    Claude->>User: Q3: Stack? (suggests Next.js)
    User->>Claude: "Next.js 15 + Postgres"
    Claude->>User: Q4: Features needed?
    User->>Claude: "auth, database, CI/CD"
    Claude->>User: Q5: Experience level?
    User->>Claude: "intermediate"
    Claude->>User: Q6: Blueprint?
    User->>Claude: "next-saas"

    Claude->>Files: Write CLAUDE.md (no placeholders)
    Claude->>Files: Write AGENTS.md (configured)
    Claude->>Files: Write memory/MEMORY.md
    Claude->>Files: Write memory/sprint.md (Sprint 1)
    Claude->>Files: Write .gitignore (Node.js)
    Claude->>Files: Write implementation/auth-spec.md
    Claude->>Files: Write implementation/database-spec.md
    Claude->>Files: git init + first commit

    Claude->>User: ✅ Summary + next steps
```

## Memory System Flow

```mermaid
sequenceDiagram
    participant Session1 as Session 1
    participant Memory as memory/
    participant Session2 as Session 2

    Session1->>Memory: /load-context → reads all files
    Memory->>Session1: Project context restored
    Note over Session1: [work happens]
    Session1->>Memory: /save-context → updates all files
    Session1->>Memory: changelog.md: "Session 1 - did X"

    Note over Memory: Time passes, new session

    Session2->>Memory: /load-context → reads all files
    Memory->>Session2: "Last session: implemented auth\nCurrent sprint: 3/5 done\nNext: integrate payments"
    Note over Session2: [continues exactly where left off]
```

## Directory Structure

```
ai-project-starter/
│
├── .claude/                    AI Config Layer (Claude Code)
│   ├── agents/                 6 specialized agents
│   │   ├── director.md         Orchestrator
│   │   ├── architect.md        System design
│   │   ├── frontend.md         UI/UX
│   │   ├── backend.md          Server/API
│   │   ├── reviewer.md         QA/Security
│   │   └── strategist.md       Research/Content (optional)
│   └── commands/               7 slash commands
│       ├── init-project.md     ← Setup wizard (STAR)
│       ├── load-context.md     Session start
│       ├── save-context.md     Session end
│       ├── validate-setup.md   Verification
│       ├── team-plan.md        Multi-agent planning
│       ├── team-status.md      Task status
│       └── team-review.md      Work review
│
├── .opencode/                  AI Config Layer (OpenCode mirror)
│
├── memory/                     Persistent Context System
│   ├── MEMORY.md               Index (loaded every session)
│   ├── decisions.md            Architecture decisions
│   ├── issues.md               Tech debt tracker
│   ├── sprint.md               Current sprint
│   ├── services.md             External services
│   └── changelog.md            Session history
│
├── _blueprints/                Production Templates
│   ├── next-saas/              Next.js 15 SaaS
│   ├── api-service/            Bun + Hono API
│   └── automation/             Trigger.dev automation
│
├── planning/                   Project planning docs
├── implementation/             Technical specs
├── tests/                      Test files
├── mcps/                       MCP server configs
│
├── CLAUDE.md                   ← Fill this in
├── AGENTS.md                   ← Fill this in
└── START_PROJECT_PROMPT        ← No-CLI fallback
```

## Design Principles

1. **Universal** — Works for any project type, any stack
2. **Lightweight** — No dependencies in the base template
3. **Progressive** — Works without any setup, better with full setup
4. **Persistent** — Memory system prevents context loss
5. **Dual platform** — Claude Code and OpenCode support
