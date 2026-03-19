# automation Template

Background jobs and workflow automation starter with Trigger.dev v3.

## Stack

- **Jobs:** Trigger.dev v3
- **Validation:** Zod
- **Runtime:** Bun
- **Testing:** Vitest

## Quick Start

1. Copy: `cp -r templates/automation my-automation && cd my-automation`
2. Install: `bun install`
3. Login: `bunx trigger.dev@latest login`
4. Copy env: `cp .env.example .env` and fill values
5. Dev: `bun dev`

## Environment Variables

| Variable | Description |
|---|---|
| `TRIGGER_SECRET_KEY` | From your Trigger.dev project settings |

## Included Jobs

### `weekly-email-digest` (`src/jobs/email-digest.ts`)
Runs every Monday at 9am. Extend the `run` function to fetch real data and send via Resend, Postmark, etc.

### GitHub Notifier (`src/integrations/github-notifier.ts`)
Example integration pattern — shows how to call external APIs from a job.

## Adding a Job

```ts
// src/jobs/my-job.ts
import { task } from '@trigger.dev/sdk/v3'

export const myJob = task({
  id: 'my-job',
  run: async (payload: { userId: string }) => {
    // your logic here
    return { success: true }
  },
})
```

## Structure

- `src/jobs/` — Trigger.dev scheduled and event-triggered tasks
- `src/integrations/` — External API integration helpers
- `tests/` — Vitest unit tests for job logic (test pure functions, not the Trigger.dev runtime)

## Commands

| Command | Description |
|---------|-------------|
| `bun dev` | Trigger.dev dev mode (runs jobs locally) |
| `bun run deploy` | Deploy to Trigger.dev cloud |
| `bun run typecheck` | TypeScript check |
| `bun run lint` | TypeScript check (tsc --noEmit) |
| `bun run test` | Run unit tests |
