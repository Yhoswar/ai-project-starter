# Init Project

Interactive project initialization wizard. Sets up your complete project structure based on your answers.

## Instructions for Claude:

When the user runs `/init-project`, follow this exact flow:

---

## 🚀 Phase 1: Ask questions interactively

Ask these questions ONE AT A TIME (wait for each answer before asking the next):

### Question 1: Project name
"What's the name of your project? (e.g., MyApp, task-manager, FinanceTracker)"

### Question 2: Project type
"What type of project is this?
1. **web-fullstack** — Full web app with frontend + backend (Next.js, React, etc.)
2. **api-only** — Backend API / microservice (REST, GraphQL)
3. **mobile** — Mobile app (React Native, Flutter, Expo)
4. **automation** — Automation, bots, workflows, scrapers
5. **library** — npm/pip package or SDK
6. **other** — Something else (describe it)"

### Question 3: Stack
Based on their project type, suggest a stack:
- web-fullstack → "Suggested: Next.js 15 + Tailwind + shadcn/ui + PostgreSQL. Use this or describe your stack:"
- api-only → "Suggested: Bun + Hono + Zod + PostgreSQL. Use this or describe your stack:"
- mobile → "Suggested: React Native + Expo. Use this or describe your stack:"
- automation → "Suggested: Trigger.dev + TypeScript. Use this or describe your stack:"
- library → "Suggested: TypeScript + Vitest. Use this or describe your stack:"
- other → "Describe your technology stack:"

### Question 4: Features needed
"Which features do you need? (answer with numbers, comma-separated)
1. Authentication / user accounts
2. Database
3. Payments (Stripe)
4. Email sending (Transactional)
5. File uploads
6. CI/CD (GitHub Actions)
7. Docker / containerization
8. None of the above"

### Question 5: Experience level
"What's your experience level with Claude Code?
1. **Beginner** — New to AI-assisted development (I'll add extra guidance)
2. **Intermediate** — Comfortable with the basics
3. **Advanced** — Power user, minimal hand-holding"

### Question 6: Blueprint
"Would you like to start from an existing blueprint?
1. **next-saas** — Next.js 15 + Auth.js + Drizzle + shadcn/ui (production SaaS)
2. **api-service** — Bun + Hono + Drizzle + Zod (production API)
3. **automation** — Trigger.dev + Composio + n8n (automation system)
4. **No blueprint** — Start from scratch with just the AI config layer"

---

## 🔧 Phase 2: Generate files

After collecting all answers, generate and write the following files:

### Always create:

**CLAUDE.md** — Fill with project-specific info (replace all {PLACEHOLDER} with real values from their answers):
- Project name, description
- Their stack
- Language preference (ask if not clear from context)
- If beginner: add extra explanatory comments
- Include the "Persistence Rules" section (it's already there, keep it)

**AGENTS.md** — Configure with:
- Project name, type
- Their stack (backend, frontend, tools sections)
- Placeholder architecture sections with helpful comments saying "fill this in as you build"

**memory/MEMORY.md** — Fill in:
- Project name and one-line description
- Stack summary
- Today's date as "Last updated"
- Empty sections ready to be filled

**memory/sprint.md** — Create first sprint:
- Sprint 1 with today's date
- Goal: "Set up project foundation"
- First 3 tasks based on their answers (e.g., "Set up database", "Create first API endpoint", etc.)

**.gitignore** — Generate appropriate .gitignore for their stack:
- Always include: `.env`, `.env.local`, `*.env`
- Node.js: add `node_modules/`, lock files appropriate to their package manager
- Python: add `__pycache__/`, `.venv/`, `*.pyc`
- Go: add binary outputs
- General: add `.DS_Store`, `Thumbs.db`

### Create based on features:

If they chose **Authentication**: Create `implementation/auth-spec.md` with basic auth architecture notes.

If they chose **Database**: Create `implementation/database-spec.md` with DB schema starter.

If they chose **Payments**: Add Stripe env vars to .env.example.

If they chose **CI/CD**: Note that .github/workflows/ci.yml already exists (no action needed).

If they chose **Docker**: Create a basic `docker-compose.yml`:
```yaml
version: '3.8'
services:
  app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - NODE_ENV=development
    env_file:
      - .env
```

### Create based on project type:

If **web-fullstack**: Create folders: `src/` with `.gitkeep`, `public/` with `.gitkeep`
If **api-only**: Create `src/routes/` and `src/middleware/` with `.gitkeep`
If **mobile**: Create `src/screens/` and `src/components/` with `.gitkeep`
If **automation**: Create `src/jobs/` and `src/workflows/` with `.gitkeep`

### If blueprint chosen:

Tell the user: "Copy the `_blueprints/[chosen]/` folder to your project root and run `npm install` / `bun install` to get started."

Do NOT automatically copy blueprints — just show the command.

---

## ✅ Phase 3: Finalize and show summary

### Initialize git if not already done:
Check if `.git` exists. If not:
```bash
git init
git add -A
git commit -m "feat: initial project setup with ai-project-starter"
```

If git already exists:
```bash
git add -A
git commit -m "feat: configure project with /init-project"
```

### Show completion summary:
```
## ✅ Project Initialized: [PROJECT_NAME]

**Type:** [type]
**Stack:** [stack]
**Features:** [list]

### Files created/configured:
- ✅ CLAUDE.md — configured for your project
- ✅ AGENTS.md — architecture template ready
- ✅ memory/MEMORY.md — context tracking active
- ✅ memory/sprint.md — Sprint 1 ready
- ✅ .gitignore — configured for [stack]
[+ any feature-specific files]

### Next steps:
1. Open `AGENTS.md` and fill in your architecture details as you build
2. Run `/validate-setup` to verify everything is configured
3. Start your first task: "[first task from sprint.md]"
4. At the end of each session, run `/save-context` to preserve progress

### Recommended skills to install:
```
claude install superpowers context-mode claude-mem security
```

Happy building! 🎉
```
