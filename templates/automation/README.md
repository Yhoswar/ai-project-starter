# automation Template

Background jobs and workflow automation starter.

## Stack

- **Jobs:** Trigger.dev v3
- **Integrations:** Composio (1000+ apps)
- **Workflows:** n8n (JSON exports in src/workflows/)
- **Testing:** Vitest

## Quick Start

1. Copy: `cp -r templates/automation my-automation && cd my-automation`
2. Install: `bun install`
3. Copy env: `cp .env.example .env` and fill values
4. Dev: `bun dev`

## Structure

- `src/jobs/` — Trigger.dev scheduled and event-triggered tasks
- `src/integrations/` — Composio app connections
- `src/workflows/` — n8n workflow JSON exports
- `tests/` — Vitest unit tests for job logic
