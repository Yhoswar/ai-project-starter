# next-saas Template

Full-stack Next.js 16 starter for SaaS products, dashboards, and web applications.

## Stack

- **Framework:** Next.js 16 (App Router)
- **Language:** TypeScript (strict)
- **Styling:** Tailwind CSS v4 + shadcn/ui
- **Auth:** Auth.js v5 (GitHub + Google OAuth)
- **Database:** Drizzle ORM + PostgreSQL (Neon)
- **Testing:** Vitest (unit) + Playwright (e2e)

## Quick Start

1. Copy this folder: `cp -r templates/next-saas my-project && cd my-project`
2. Install: `bun install`
3. Copy env: `cp .env.example .env.local` and fill in values
4. Push DB schema: `bun run db:push`
5. Seed dev data: `bun run db:seed`
6. Start dev: `bun dev`

## Environment Variables

| Variable | Description |
|---|---|
| `DATABASE_URL` | Neon connection string |
| `AUTH_SECRET` | `openssl rand -base64 32` |
| `AUTH_GITHUB_ID` / `AUTH_GITHUB_SECRET` | GitHub OAuth app |
| `AUTH_GOOGLE_ID` / `AUTH_GOOGLE_SECRET` | Google OAuth app |
| `NEXT_PUBLIC_APP_URL` | App URL (e.g. `http://localhost:3000`) |

## Key Features

### Logger (`src/lib/logger.ts`)
Structured logging — JSON in production, readable in dev.

```ts
import { logger } from '@/lib/logger'
logger.info('User signed in', { userId: user.id })
logger.error('Payment failed', { code: err.code })
```

### Error Handling (`src/lib/errors.ts`)
Typed errors with HTTP status codes.

```ts
import { AppError, handleError } from '@/lib/errors'
throw new AppError('User not found', 'USER_NOT_FOUND', 404)

// In catch blocks:
const { message, statusCode } = handleError(err)
```

### Health Check
`GET /api/health` → `{ status: "ok", timestamp: "..." }`
Use for uptime monitoring, load balancer checks, and k8s readiness probes.

### Security Headers
Configured in `next.config.ts`: X-Frame-Options, HSTS, CSP, X-Content-Type-Options, Referrer-Policy.
Edit the CSP `connect-src` directive to add your OAuth provider domains.

## Commands

| Command | Description |
|---------|-------------|
| `bun dev` | Start development server |
| `bun run build` | Build for production |
| `bun run typecheck` | TypeScript type check |
| `bun run lint` | ESLint |
| `bun run test --run` | Run unit tests |
| `bun run test:e2e` | Run e2e tests |
| `bun run db:push` | Push schema to database |
| `bun run db:seed` | Insert 2 dev users |
| `bun run db:studio` | Open Drizzle Studio |

## Recommended Skills

- `security` — auth, API endpoints, input validation
- `frontend-design` — UI/component work
- `ui-ux-pro-max` — design system and UX patterns
