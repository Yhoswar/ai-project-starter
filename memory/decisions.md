# Architecture Decisions

> Log significant technical decisions here with context and rationale.
> Format: ## Decision Title, **Date**, **Status** (Active/Superseded), **Context**, **Decision**, **Consequences**

---

## Example: Chose Drizzle over Prisma

**Date:** YYYY-MM-DD
**Status:** Active

**Context:** Needed a TypeScript ORM for PostgreSQL. Evaluated Prisma, Drizzle, and Kysely.

**Decision:** Drizzle ORM — lighter bundle, SQL-first, better edge compatibility, no code generation step.

**Consequences:** SQL knowledge required for complex queries. No Prisma Studio GUI. Better performance at edge.
