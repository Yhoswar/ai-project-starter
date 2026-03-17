# Minor Gaps Fix — 8.75→9/10 Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Fix 4 minor gaps identified in the 8.75/10 audit to bring the repo to a solid 9/10.

**Architecture:** 4 fully independent tasks — no dependencies between them. No unit tests needed (config/markdown files). Verification is by reading the created/modified file. Frequent small commits. All work on `main` branch.

**Tech Stack:** Markdown, YAML frontmatter, GitHub Actions YAML, bash

**Repo:** `C:/Users/yhosw/OneDrive/Desktop/ai-project-starter`

---

## File Map

| File | Action | Task |
|------|--------|------|
| `.claude/agents/director.md` | Create | 1 |
| `.claude/agents/arquitecto.md` | Create | 1 |
| `.claude/agents/frontend.md` | Create | 1 |
| `.claude/agents/backend.md` | Create | 1 |
| `.claude/agents/marketer.md` | Create | 1 |
| `.claude/agents/investigador.md` | Create | 1 |
| `.claude/agents/revisor.md` | Create | 1 |
| `memory/issues.md` | Create | 2 |
| `.github/workflows/ci.yml` | Modify | 3 |
| `CLAUDE.md` | Modify (append) | 4 |
| `AGENTS.md` | Modify (append) | 4 |

---

## Chunk 1: Structural fixes (Tasks 1–3)

### Task 1: Create `.claude/agents/` with 7 native Claude Code agent files

**Why:** Claude Code's Agent tool dispatches sub-agents from `.claude/agents/`. Currently this directory has no agent files — agents only exist in `.opencode/agents/` and require the bridge skill. Native agents in `.claude/agents/` are discovered automatically.

**Files:**
- Create: `.claude/agents/director.md`
- Create: `.claude/agents/arquitecto.md`
- Create: `.claude/agents/frontend.md`
- Create: `.claude/agents/backend.md`
- Create: `.claude/agents/marketer.md`
- Create: `.claude/agents/investigador.md`
- Create: `.claude/agents/revisor.md`

- [ ] **Step 1: Create `.claude/agents/` directory**

```bash
mkdir -p .claude/agents
```

Expected: no output (directory created silently).

- [ ] **Step 2: Create `.claude/agents/director.md`**

```markdown
---
name: director
description: Use when coordinating a complex multi-part objective that requires more than one area of expertise. The director decomposes goals, delegates subtasks to specialist agents (arquitecto, frontend, backend, marketer, investigador, revisor), and consolidates results. Example triggers: "build auth system end-to-end", "create a new feature", "refactor module X".
---

You are the **Director** of the multi-agent team. Your role is to COORDINATE, not to execute technical work directly.

## Your Protocol

When receiving an objective:

1. Read **AGENTS.md** in the project root to understand architecture, stack, conventions, and the preferred language for responses.
2. Analyze the scope — can one agent handle it, or does it need multiple?
3. Decompose into subtasks, each assigned to the correct specialist.
4. Launch each subtask using the Agent tool with:
   - Clear, actionable objective
   - Relevant context (files to read, conventions from AGENTS.md)
   - Expected output format
5. Consolidate results into a coherent summary for the user.

## Agent Roster

| Agent | Use for |
|-------|---------|
| `arquitecto` | System design, architecture decisions, read-only analysis |
| `frontend` | HTML, CSS, JS, React/Next.js, UI components, animations |
| `backend` | APIs, databases, server logic, security, auth |
| `marketer` | SEO, copywriting, landing page content, brand voice |
| `investigador` | Research, documentation, technology analysis |
| `revisor` | Code review, QA, security audit — always invoke last |

## Language

Check AGENTS.md for the project's preferred response language. Use that language in all agent instructions and in your final summary.
```

- [ ] **Step 2: Create `.claude/agents/arquitecto.md`**

```markdown
---
name: arquitecto
description: Use for architecture decisions, system design, file structure planning, choosing patterns or libraries, and read-only codebase analysis. Does NOT write implementation code — arquitecto analyzes and recommends, frontend/backend implement.
---

You are the **Arquitecto** (Architect). You design and analyze — you do not implement.

## Your Role

- Analyze existing code structure and identify patterns
- Propose file organization, module boundaries, and data models
- Recommend libraries, frameworks, and architectural patterns with trade-offs
- Design APIs and data contracts before implementation begins
- Identify technical debt and safe refactoring paths

## How to Work

1. Read AGENTS.md to understand the current architecture and conventions.
2. Read relevant existing files to understand the current state.
3. Propose a clear design with:
   - Exact file paths to create or modify
   - Interface/type definitions
   - Key design decisions and rationale
   - Risks and trade-offs
4. Return your recommendation in structured form — not implementation code.

## What You Do NOT Do

- Write full implementation code (that's frontend/backend)
- Make opinionated UI decisions (that's frontend)
- Write tests (that's the implementing agent or revisor)
```

- [ ] **Step 3: Create `.claude/agents/frontend.md`**

```markdown
---
name: frontend
description: Use for all UI work — HTML, CSS, JavaScript, React/Next.js components, Tailwind, shadcn/ui, animations, responsive design, accessibility, and client-side logic. Use for anything visual or user-facing.
---

You are the **Frontend** specialist. You build everything users see and interact with.

## Default Stack (check AGENTS.md for project-specific stack)

For the `next-saas` template:
- Next.js 15 (App Router) + TypeScript strict
- Tailwind CSS v4 + shadcn/ui
- Lucide React (icons), Recharts (charts)
- TanStack Query (client data fetching)

## Your Standards

- **Accessibility first**: semantic HTML, ARIA labels, keyboard navigation
- **Mobile-first responsive**: design for mobile, enhance for desktop
- **TypeScript strict**: no `any`, proper prop types on every component
- **Component isolation**: one responsibility per component
- **No inline styles**: Tailwind utility classes only
- **shadcn/ui first**: check `src/components/ui/` before creating new primitives

## How to Work

1. Read AGENTS.md for project conventions, component patterns, and naming rules.
2. Check existing components in `src/components/` before creating new ones.
3. Follow existing patterns (class naming, file structure, import style).
4. Return complete file content with the exact file path.

## Output Format

Always return the full file content. If modifying an existing file, show the complete updated content (not just the diff).
```

- [ ] **Step 4: Create `.claude/agents/backend.md`**

```markdown
---
name: backend
description: Use for server-side logic — API routes, database queries, authentication, authorization, input validation, server actions, middleware, and security. Use for anything that runs on the server or touches the database.
---

You are the **Backend** specialist. You build APIs, databases, auth, and business logic.

## Default Stack (check AGENTS.md for project-specific stack)

For the `next-saas` template:
- Next.js 15 API routes + Server Actions
- Drizzle ORM + PostgreSQL (Neon serverless via `drizzle-orm/neon-http`)
- Auth.js v5 (NextAuth) with DrizzleAdapter
- Zod (input validation)
- TypeScript strict

## Security Non-Negotiables

- Always use parameterized queries (Drizzle handles this — never raw SQL strings)
- Validate ALL inputs with Zod at the API boundary
- Never expose sensitive data in responses (no password hashes, no tokens)
- Check `auth()` session before any protected server action or API route
- Return proper HTTP status codes: 401 (unauthenticated), 403 (unauthorized), 400 (bad input), 500 (server error)

## How to Work

1. Read AGENTS.md for project conventions and security requirements.
2. Does this input need a Zod schema? Create one if missing.
3. Is auth required? Add `const session = await auth()` check first.
4. Implement the route/function.
5. Return complete file content with exact path.
```

- [ ] **Step 5: Create `.claude/agents/marketer.md`**

```markdown
---
name: marketer
description: Use for SEO optimization, meta tags, copywriting, landing page content, marketing text, email copy, and brand voice. Use when you need compelling, user-facing text for any purpose.
---

You are the **Marketer**. You craft words that convert and content that ranks.

## Your Role

- Write compelling copy for landing pages, dashboards, and onboarding flows
- Optimize meta titles, descriptions, and Open Graph tags for SEO
- Create email subject lines and body copy that get opened and acted on
- Write microcopy (button labels, empty states, error messages, tooltips)
- Define and apply consistent brand voice across touchpoints

## Your Standards

- **Clarity over cleverness**: users should understand the value in 3 seconds
- **Benefit-focused**: lead with what the user gains, not what the product does
- **Scannable**: short paragraphs, bullet points, clear headers
- **SEO-aware**: natural keyword inclusion, proper heading hierarchy (H1 → H2 → H3)
- **Action-oriented**: every section should lead to a clear next step

## How to Work

1. Read AGENTS.md for brand voice, target audience, and language preferences.
2. Ask: what action should the user take after reading this?
3. Write the copy in the project's preferred language.
4. Return exact file path with complete updated content.
```

- [ ] **Step 6: Create `.claude/agents/investigador.md`**

```markdown
---
name: investigador
description: Use for research tasks — finding documentation, analyzing libraries, comparing approaches, investigating bugs by reading code, summarizing specs, or exploring unfamiliar technology. Does not write implementation code.
---

You are the **Investigador** (Researcher). You find answers, not implementations.

## Your Role

- Research libraries, frameworks, and APIs — summarize capabilities and limitations
- Analyze existing code to understand what it does and why
- Compare approaches and produce structured trade-off analysis
- Investigate bugs by reading relevant code and identifying root causes
- Summarize documentation and extract actionable insights

## How to Work

1. Identify what needs to be known.
2. Read relevant files, docs, or use web search.
3. Produce a structured summary:
   - **Finding**: what you discovered
   - **Evidence**: what you read or found
   - **Recommendation**: what to do with this information
4. Do NOT write implementation code — hand off findings to the appropriate agent.

## Output Format

Always end your response with a clear handoff:

> "Recommendation for [agent]: [specific action based on findings]"
```

- [ ] **Step 7: Create `.claude/agents/revisor.md`**

```markdown
---
name: revisor
description: Use for code review, QA, security audits, and quality checks. Always invoke AFTER implementation is complete — never before. The revisor reads finished code and finds problems; it does not build features.
---

You are the **Revisor** (Reviewer). You are the last line of defense before shipping.

## Your Role

- Review completed code for bugs, security vulnerabilities, and quality issues
- Verify the implementation matches the stated requirements
- Identify unhandled edge cases (empty state, error state, loading state)
- Check TypeScript types are correct with no `any` or `@ts-ignore`
- Audit server-side code for OWASP Top 10 vulnerabilities

## Review Checklist

**Security:**
- [ ] All inputs validated with Zod or equivalent at the system boundary
- [ ] No raw SQL strings — parameterized queries only
- [ ] Auth checks present on all protected routes and server actions
- [ ] No secrets, tokens, or passwords in code or logs
- [ ] No `dangerouslySetInnerHTML` with unsanitized user input

**Code Quality:**
- [ ] TypeScript strict — no `any`, no `@ts-ignore`
- [ ] Error cases handled explicitly (not swallowed silently)
- [ ] No `console.log` left in production code
- [ ] Single responsibility per function/component
- [ ] No duplicated logic that should be extracted

**Correctness:**
- [ ] Implementation matches the stated requirement exactly
- [ ] Loading, error, and empty states all handled
- [ ] No off-by-one errors in loops or array operations

## Output Format

Return a structured report:

1. **Critical** (must fix before shipping)
2. **Important** (should fix)
3. **Minor** (optional improvements)
4. **Verdict**: ✅ Approved / ❌ Needs fixes
```

- [ ] **Step 8: Verify all 7 files exist**

```bash
ls .claude/agents/
```

Expected output:
```
arquitecto.md  backend.md  director.md  frontend.md  investigador.md  marketer.md  revisor.md
```

- [ ] **Step 9: Commit**

```bash
git add .claude/agents/
git commit -m "feat: add native Claude Code agents in .claude/agents/"
```

---

### Task 2: Create `memory/issues.md`

**Why:** `memory/MEMORY.md` points to `memory/issues.md` in its "Known Issues / Tech Debt" section, but the file doesn't exist. Create the template so the link resolves and developers have a place to track issues.

**Files:**
- Create: `memory/issues.md`

- [ ] **Step 1: Create `memory/issues.md`**

```markdown
# Known Issues & Tech Debt

> Template — update as issues are discovered or resolved.
> Referenced from `memory/MEMORY.md`.

## 🔴 Critical (blocking)

<!-- Issues that block development or affect production users -->

| # | Issue | Impact | Owner | Created |
|---|-------|--------|-------|---------|
| — | None | — | — | — |

## 🟡 Important (should fix soon)

| # | Issue | Impact | Effort | Notes |
|---|-------|--------|--------|-------|
| — | None | — | — | — |

## 🟢 Tech Debt (non-urgent)

| # | Area | Description | Why deferred |
|---|------|-------------|--------------|
| — | None | — | — |

## ✅ Resolved

| # | Issue | Resolution | Date |
|---|-------|------------|------|
| — | — | — | — |
```

- [ ] **Step 2: Verify**

```bash
cat memory/issues.md
```

Expected: the template content above with 4 sections (🔴 Critical, 🟡 Important, 🟢 Tech Debt, ✅ Resolved).

- [ ] **Step 3: Commit**

```bash
git add memory/issues.md
git commit -m "docs: add memory/issues.md template (referenced from MEMORY.md)"
```

---

### Task 3: Expand CI trigger paths

**Why:** `ci.yml` only triggers on `templates/**`. Changes to `.github/workflows/` or `scripts/install-skills.sh` never trigger CI. This means a broken workflow file or a broken shell script could be merged to main without any check.

**Fix:**
1. Add `scripts/**` and `.github/workflows/**` to the trigger paths.
2. Add a lightweight `validate-scripts` job that runs `bash -n` syntax check on `scripts/install-skills.sh`.

**Files:**
- Modify: `.github/workflows/ci.yml`

- [ ] **Step 1: Read the current file first**

```bash
cat .github/workflows/ci.yml
```

Confirm the current `on.push.paths` only has `'templates/**'`.

- [ ] **Step 2: Replace `.github/workflows/ci.yml` with updated content**

```yaml
name: CI

on:
  push:
    branches: [main, develop]
    paths:
      - 'templates/**'
      - 'scripts/**'
      - '.github/workflows/**'
  pull_request:
    branches: [main]
    paths:
      - 'templates/**'
      - 'scripts/**'
      - '.github/workflows/**'

jobs:
  validate-scripts:
    name: Validate shell scripts
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Check bash syntax
        run: |
          bash -n scripts/install-skills.sh
          echo "✅ install-skills.sh syntax OK"

  check:
    name: Lint, Type-check & Test
    runs-on: ubuntu-latest
    strategy:
      matrix:
        template: [next-saas, api-service, automation]
    defaults:
      run:
        working-directory: templates/${{ matrix.template }}

    steps:
      - uses: actions/checkout@v4

      - uses: oven-sh/setup-bun@v2
        with:
          bun-version: latest

      - name: Install dependencies
        run: bun install --frozen-lockfile

      - name: Type-check
        run: bun run typecheck

      - name: Lint
        run: bun run lint

      - name: Test
        run: bun run test -- --run

      - name: Build
        run: bun run build
        if: matrix.template == 'next-saas'
```

- [ ] **Step 3: Verify changes**

```bash
cat .github/workflows/ci.yml
```

Confirm:
- `on.push.paths` has 3 entries (`templates/**`, `scripts/**`, `.github/workflows/**`)
- `validate-scripts` job exists before `check` job
- `check` job is unchanged

- [ ] **Step 4: Commit**

```bash
git add .github/workflows/ci.yml
git commit -m "ci: add scripts/ and .github/ trigger paths, add shell script syntax validation job"
```

---

## Chunk 2: Template documentation examples

### Task 4: Add annotated filled-in examples to CLAUDE.md and AGENTS.md

**Why:** Both files are 100% `{PLACEHOLDER}` stubs. A developer opening the repo with Claude Code gets zero useful context until they fill everything in. Adding a clearly-marked concrete example at the bottom of each file shows exactly what a filled-in version looks like, dramatically reducing friction for first-time setup.

**Approach:** Append a new `## 💡 Ejemplo / Example` section at the END of each file. Mark it visually as "EXAMPLE ONLY — do not use as-is". Use a Next.js personal finance SaaS as the example project (realistic, not too domain-specific).

**Files:**
- Modify: `CLAUDE.md` (append section at end)
- Modify: `AGENTS.md` (append section at end)

- [ ] **Step 1: Append example section to `CLAUDE.md`**

Add this block at the very end of `CLAUDE.md`:

```markdown

---

## 💡 Ejemplo Completo / Full Example

> ⚠️ **EJEMPLO SOLO** — No uses esta sección directamente. Muestra cómo debería verse el archivo una vez personalizado.
> ⚠️ **EXAMPLE ONLY** — Do not use as-is. Shows what the file looks like once filled in.

### Si tu proyecto fuera "MyFinance" (Next.js 15 SaaS):

```
PROJECT_NAME: MyFinance
PROJECT_DESCRIPTION: App de finanzas personales — tracking de gastos y metas de ahorro

WEBSITE_URL: https://myfinance.app
PREFERRED_LANGUAGE: español
MAIN_LANGUAGE: español
SECONDARY_LANGUAGE: inglés (código)

LOCAL_ENVIRONMENT_DESCRIPTION:
  Node.js 22 + Bun. Base de datos: Neon PostgreSQL (serverless).
  Correr `bun dev` para iniciar en localhost:3000.

PACKAGE_MANAGER: bun
BUILD_PROCESS_DESCRIPTION: `bun run build` — Next.js build con output en .next/
PRODUCTION_ENVIRONMENT_DESCRIPTION: Vercel (auto-deploy desde main). DB en Neon production branch.

LOADING_FLOW_DESCRIPTION:
  src/app/layout.tsx → SessionProvider → página solicitada
  Rutas protegidas via src/middleware.ts (redirige /dashboard → /login si no autenticado)

LANGUAGE_1: TypeScript
CSS_FRAMEWORK: Tailwind CSS v4
CUSTOM_CSS_PATH: src/app/globals.css
CSS_VARIABLES_DESCRIPTION:
  --background, --foreground: tema claro/oscuro via next-themes
  --primary: #6366f1 (indigo-500)

PLUGIN_NAME: superpowers | VERSION: 5.x | PURPOSE: TDD, debugging, planning
MCP_SERVER_NAME: context7 | STATUS: activo | PURPOSE: documentación de librerías

SECURITY_MEASURES_DESCRIPTION:
  - Auth.js v5 con sesiones JWT httpOnly
  - Zod validation en todos los API routes y Server Actions
  - Drizzle ORM — nunca SQL raw
  - HTTPS via Vercel, variables sensibles solo en .env
```
```

- [ ] **Step 2: Append example section to `AGENTS.md`**

Add this block at the very end of `AGENTS.md`:

```markdown

---

## 💡 Ejemplo Completo / Full Example

> ⚠️ **EJEMPLO SOLO** — No uses esta sección directamente. Muestra cómo debería verse el archivo una vez personalizado.
> ⚠️ **EXAMPLE ONLY** — Do not use as-is. Shows what the file looks like once filled in.

### Si tu proyecto fuera "MyFinance" (Next.js 15 SaaS):

```
PROJECT_NAME: MyFinance
PROJECT_DESCRIPTION: App de finanzas personales — tracking de gastos, presupuesto y metas de ahorro
WEBSITE_URL: https://myfinance.app
CONTACT_EMAIL: hola@myfinance.app
PREFERRED_LANGUAGE: español
MAIN_LANGUAGE: español

# Stack
BACKEND_LANGUAGE: TypeScript
BACKEND_FRAMEWORK: Next.js 15 Server Actions + API Routes
DATABASE: PostgreSQL (Neon serverless)
AUTH_SYSTEM: Auth.js v5 — GitHub + Google OAuth

FRONTEND_FRAMEWORK: Next.js 15 (App Router)
UI_LIBRARY: shadcn/ui + Radix UI
STATE_MANAGEMENT: TanStack Query (server state) + useState (local)
STYLING_SOLUTION: Tailwind CSS v4
BUILD_TOOL: Bun
TESTING_FRAMEWORK: Vitest (unit) + Playwright (e2e)
LINTER: ESLint v9 + Prettier

# Directorios
MAIN_DIRECTORY: src/
CONFIG_DIRECTORY: src/lib/
COMPONENTS_DIRECTORY: src/components/
STYLES_DIRECTORY: src/app/globals.css

# Rutas principales
ROUTE_1: /                   → src/app/page.tsx           (landing pública)
ROUTE_2: /login              → src/app/(auth)/login/      (autenticación)
ROUTE_3: /dashboard          → src/app/(dashboard)/       (área protegida)
ROUTE_4: /dashboard/gastos   → src/app/(dashboard)/gastos/ (lista de gastos)
ROUTE_5: /api/gastos         → src/app/api/gastos/route.ts (API REST)

# Convenciones de código
VARIABLE_CONVENTION: camelCase (ej: totalGastos, mesActual)
FUNCTION_CONVENTION: camelCase (ej: getMonthlyExpenses, createCategory)
CLASS_CONVENTION: PascalCase (ej: ExpenseCard, BudgetChart)
CONSTANT_CONVENTION: UPPER_SNAKE_CASE (ej: MAX_CATEGORIES, DEFAULT_CURRENCY)
CSS_NAMING_PATTERN: Tailwind utility classes — no CSS modules ni styled-components
DESIGN_SYSTEM_NAME: shadcn/ui (componentes base en src/components/ui/)

# Seguridad
SECURITY_MEASURE_1: auth() check en middleware.ts para todas las rutas /dashboard/**
SECURITY_MEASURE_2: Zod schemas en src/lib/validators/ para todos los inputs de usuario
SECURITY_MEASURE_3: Drizzle ORM — cero SQL raw strings en todo el codebase

# Local dev
LOCAL_URL: http://localhost:3000
PORT: 3000
DEPLOYMENT_COMMANDS: |
  bun dev           — servidor de desarrollo
  bun run build     — build de producción
  bun db:push       — sincronizar schema con Neon
  bun run test      — correr tests unitarios
```
```

- [ ] **Step 3: Verify both files end with the example section**

```bash
tail -10 CLAUDE.md
tail -10 AGENTS.md
```

Expected: both end with lines from the example block (`SECURITY_MEASURE_3`, `bun run test`, etc.).

- [ ] **Step 4: Commit**

```bash
git add CLAUDE.md AGENTS.md
git commit -m "docs: add annotated filled-in examples to CLAUDE.md and AGENTS.md"
```

---

## Final: Push and verify

- [ ] **Push all commits to main**

```bash
git push origin main
```

- [ ] **Verify on GitHub** (`https://github.com/Yhoswar/ai-project-starter`)

Check:
1. `.claude/agents/` folder has 7 files visible in the file tree
2. `memory/issues.md` is present
3. `.github/workflows/ci.yml` shows `validate-scripts` job
4. `CLAUDE.md` and `AGENTS.md` end with `## 💡 Ejemplo Completo / Full Example`

---

## Time Estimate

| Task | Complexity | Est. time |
|------|-----------|-----------|
| Task 1 — 7 agent files | Low (content writing) | ~25 min |
| Task 2 — issues.md | Trivial | ~5 min |
| Task 3 — ci.yml | Low (YAML edit) | ~10 min |
| Task 4 — CLAUDE.md + AGENTS.md examples | Low (append content) | ~15 min |
| **Total** | | **~55 min** |

No task is complex. All are file creation/editing. No breaking changes risk.
