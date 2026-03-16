# next-saas Template

Full-stack Next.js 15 starter for SaaS products, dashboards, and web applications.

## Stack

- **Framework:** Next.js 15 (App Router)
- **Language:** TypeScript (strict)
- **Styling:** Tailwind CSS + shadcn/ui
- **Auth:** Auth.js v5 (GitHub + Google OAuth)
- **Database:** Drizzle ORM + PostgreSQL (Neon)
- **Testing:** Vitest (unit) + Playwright (e2e)

## Quick Start

1. Copy this folder: `cp -r templates/next-saas my-project && cd my-project`
2. Install: `bun install`
3. Copy env: `cp .env.example .env` and fill in values
4. Push DB schema: `bun db:push`
5. Start dev: `bun dev`

## Commands

| Command | Description |
|---------|-------------|
| `bun dev` | Start development server |
| `bun build` | Build for production |
| `bun run typecheck` | TypeScript type check |
| `bun run test -- --run` | Run unit tests |
| `bun run test:e2e` | Run e2e tests |
| `bun db:push` | Push schema to database |
| `bun db:studio` | Open Drizzle Studio |

## Recommended Skills

- `security` — auth, API endpoints, input validation
- `frontend-design` — UI/component work
- `ui-ux-pro-max` — design system and UX patterns
