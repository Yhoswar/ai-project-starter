# api-service Template

Lightweight REST API starter with Bun + Hono.

## Stack

- **Runtime:** Bun
- **Framework:** Hono
- **Database:** Drizzle ORM + PostgreSQL (Neon)
- **Validation:** Zod
- **Testing:** Vitest

## Quick Start

1. Copy: `cp -r templates/api-service my-api && cd my-api`
2. Install: `bun install`
3. Copy env: `cp .env.example .env` and fill in values
4. Start: `bun dev`

## Commands

| Command | Description |
|---------|-------------|
| `bun dev` | Start with hot reload |
| `bun run typecheck` | TypeScript check |
| `bun test` | Run tests |
