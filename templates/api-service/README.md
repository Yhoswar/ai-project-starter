# api-service Template

Lightweight REST API starter with Bun + Hono.

## Stack

- **Runtime:** Bun
- **Framework:** Hono
- **Database:** Drizzle ORM + PostgreSQL (Neon)
- **Validation:** Zod + @hono/zod-validator
- **Testing:** Vitest

## Quick Start

1. Copy: `cp -r templates/api-service my-api && cd my-api`
2. Install: `bun install`
3. Copy env: `cp .env.example .env` and fill in values
4. Start: `bun dev`

## Environment Variables

| Variable | Description |
|---|---|
| `DATABASE_URL` | Neon connection string |
| `ALLOWED_ORIGIN` | CORS origin (default: `http://localhost:3000`) |
| `PORT` | Server port (default: `3001`) |

## Built-in Middleware

- **Logger** — request/response logging via `hono/logger`
- **Security headers** — via `hono/secure-headers`
- **CORS** — restricted to `ALLOWED_ORIGIN`
- **Error handler** — JSON errors, hides stack in production

## Health Check

`GET /health` → `{ status: "ok", timestamp: "..." }`

## Adding a Route

1. Create `src/routes/your-resource.ts`
2. Define a `new Hono()` router with Zod validators
3. Mount in `src/index.ts`: `app.route('/api/your-resource', yourRouter)`

```ts
import { Hono } from 'hono'
import { zValidator } from '@hono/zod-validator'
import { z } from 'zod'

export const myRouter = new Hono()

myRouter.post('/', zValidator('json', z.object({ name: z.string() })), async (c) => {
  const { name } = c.req.valid('json')
  return c.json({ id: crypto.randomUUID(), name }, 201)
})
```

## Commands

| Command | Description |
|---------|-------------|
| `bun dev` | Start with hot reload |
| `bun start` | Production start |
| `bun run typecheck` | TypeScript check |
| `bun run lint` | TypeScript check (tsc --noEmit) |
| `bun run test` | Run tests |
