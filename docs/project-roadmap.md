# Project Roadmap — From Zero to Production

> **Complete guide** for taking a project from idea to live app using this template.
> Follow the phases in order. Each phase has clear inputs, outputs, and checkpoints.

---

## Overview

```
FASE 0: Planning      → PRD, specs, architecture decisions
FASE 1: Setup         → Repo, config, services, skills
FASE 2: Build         → Sprints, features, security review
FASE 3: Launch        → Testing, audit, deploy, domain
FASE 4: Growth        → Automations, mobile, new attack surface
```

---

## FASE 0 — Planning & Decisions

> **Before writing a single line of code.** This phase defines what you're building and how.

### Deliverables

| File | Purpose | Command |
|------|---------|---------|
| `planning/prd.md` | Product Requirements Document | `/team-plan "write PRD for [project]"` |
| `planning/design-reference.md` | Visual references, UI style, color system | Manual or Figma export |
| `implementation/stack-decisions.md` | Tech stack + rationale (ADR format) | Architect agent |
| `implementation/database-spec.md` | Data models, relations, indexes | Architect agent |
| `implementation/auth-spec.md` | Auth flow, roles, permissions | Architect + Backend agents |
| `implementation/security-spec.md` | Threat model, attack surface, mitigations | Security skill |

### Key Questions to Answer

- Who are the users? What problem does this solve?
- What's the MVP scope? What's post-launch?
- Which blueprint fits? (`next-saas`, `api-service`, `automation`)
- What external services are needed? (auth provider, DB, email, payments)
- What are the security requirements? (data sensitivity, auth requirements, compliance)

### Checkpoint ✓

- [ ] PRD approved
- [ ] Stack decided and documented
- [ ] Data model sketched
- [ ] Auth flow defined
- [ ] Security threats identified

---

## FASE 1 — Project Setup

> **Configure the workspace.** This takes 15–30 minutes and should only happen once.

### Steps

#### 1.1 Create the Repo

```bash
# Option A: Use as GitHub Template (recommended)
# Click "Use this template" on GitHub → clone your new repo

# Option B: Manual
git clone https://github.com/Yhoswar/ai-project-starter.git my-project
cd my-project
```

#### 1.2 Run the Setup Wizard

```bash
claude .
/init-project
```

The wizard will:
- Ask about your project type and stack
- Generate `CLAUDE.md` and `AGENTS.md` with no placeholders
- Set up `memory/` files with first sprint
- Offer to start from a production blueprint (`_blueprints/`)
- Initialize git with first commit

#### 1.3 Configure External Services

Depending on your blueprint:

| Service | next-saas | api-service | automation |
|---------|-----------|-------------|------------|
| Database | Neon / Supabase | PlanetScale / Neon | — |
| Auth | Auth.js / Clerk | JWT / API keys | — |
| Deploy | Vercel | Railway / Fly.io | Trigger.dev |
| Email | Resend | Resend | — |
| Payments | Stripe | Stripe | — |

Add credentials to `.env` (never `.env.example`, never commit `.env`).

#### 1.4 Install Skills

```bash
# Essential — install first
claude install superpowers context-mode claude-mem security

# Recommended
claude install frontend-design ui-ux-pro-max code-review

# Optional
claude install researcher cost-reducer self-healing humanizer
```

See `docs/skills-guide.md` for what each skill does.

#### 1.5 Validate Setup

```bash
/validate-setup
```

### Checkpoint ✓

- [ ] `/init-project` completed, no placeholders in CLAUDE.md
- [ ] `.env` filled out (DB, auth, services)
- [ ] `bun install` passes, `bun dev` starts
- [ ] Core skills installed
- [ ] `/validate-setup` passes

---

## FASE 2 — Build (Sprints)

> **Iterative development.** Each sprint is 1–2 weeks. Use `/load-context` and `/save-context` every session.

### Session Protocol

```bash
# Start of every session
/load-context
# → "Here's where we are: Sprint 2, working on payments..."

# End of every session
/save-context
# → Updates memory files, shows snapshot, suggests next steps
```

### Sprint Structure

#### Sprint 1 — Foundation

- App shell: layout, navigation, responsive grid
- Authentication: sign-up, sign-in, session management
- Database: run initial migration (`bun db:push`)
- CI/CD: verify GitHub Actions pass (lint, typecheck, build)

```bash
/team-plan "implement authentication end-to-end with [Auth.js/Clerk/etc]"
```

#### Sprint 2 — Core Features

- Primary user flows (the reason the app exists)
- Data CRUD operations
- API routes / server actions
- Basic error handling

```bash
/team-plan "build [core feature] with full data flow"
```

#### Sprint 3 — Secondary Features

- Supporting flows (settings, profile, notifications)
- Email integration
- Admin panel (if needed)
- Payments (if needed)

#### Sprint 4 — Polish & Responsive

- Mobile responsiveness audit
- Loading states, empty states, error boundaries
- Performance: image optimization, bundle size, Core Web Vitals
- Accessibility: keyboard nav, ARIA labels, color contrast

```bash
/team-plan "responsive audit and polish for production"
```

#### Pre-Launch Security Review

Before launch, run a security review with the Reviewer agent:

```bash
/team-review "security audit before production launch"
```

This checks:
- Authentication flows (session fixation, token leakage)
- API authorization (missing auth checks, IDOR)
- Input validation (XSS, SQL injection, CSRF)
- Dependency vulnerabilities
- Secrets in code

### Checkpoint ✓

- [ ] All Sprint 1–4 features complete
- [ ] Tests pass (`bun test`)
- [ ] CI/CD all green
- [ ] Security review completed (no critical issues)
- [ ] Performance audit done (Lighthouse > 80)

---

## FASE 3 — Launch

> **Go live.** This phase is about production stability, not new features.

### 3.1 Real User Testing

Before public launch:
- 5–10 real users in a beta/staging environment
- Document bugs in `memory/issues.md`
- Fix critical issues before proceeding

### 3.2 Security Audit Final

```bash
/team-review "final security audit for production"
```

Checklist:
- [ ] Security headers configured (CSP, HSTS, X-Frame-Options)
- [ ] HTTPS enforced (no HTTP redirects accepted)
- [ ] Rate limiting on auth and sensitive endpoints
- [ ] No sensitive data in logs
- [ ] Dependency audit: `bun audit` (or `npm audit`)
- [ ] Environment variables properly scoped (no dev secrets in prod)

### 3.3 Deploy to Production

**Next.js + Vercel:**
```bash
# Connect repo to Vercel
# Set environment variables in Vercel dashboard
# Deploy from main branch
vercel --prod
```

**Bun + Hono (Railway/Fly.io):**
```bash
# See _blueprints/api-service/README.md for deploy steps
```

**Automation (Trigger.dev):**
```bash
# See _blueprints/automation/README.md for deploy steps
```

### 3.4 Domain + HTTPS

1. Point DNS to your deploy provider
2. Verify SSL certificate is active
3. Test HTTPS redirect (HTTP → HTTPS)
4. Add domain to auth provider's allowed origins

### 3.5 Optional: PWA

For mobile-like experience without a native app:
- Add `manifest.json`
- Configure service worker
- Test install prompt on iOS/Android

### 3.6 Analytics

- Vercel Analytics (built-in for Vercel deploys)
- PostHog (open source, self-hostable)
- Plausible (privacy-first, GDPR-friendly)

### Checkpoint ✓

- [ ] Production deploy successful
- [ ] Custom domain with HTTPS active
- [ ] Error monitoring configured (Sentry or similar)
- [ ] Analytics running
- [ ] Uptime monitoring configured

---

## FASE 4 — Growth

> **After you have real users.** Optimize, expand, and maintain security as the surface area grows.

### Automations

- Background jobs for email, notifications, data processing
- Scheduled tasks (cron jobs via Trigger.dev or Vercel Cron)
- Webhooks from external services

### Security: New Attack Surface

Every new feature adds potential attack vectors. Review when:
- Adding a new API endpoint or webhook
- Integrating a new third-party service
- Adding file upload functionality
- Expanding user roles or permissions

```bash
/team-review "security review for [new feature]"
```

### App Mobile

Consider a mobile app when:
- >30% of traffic is mobile
- Features need camera, notifications, or offline mode
- Users express demand for native experience

Options:
- **React Native** — if your team knows React
- **Expo** — easiest path from Next.js/React codebase
- **PWA** — often sufficient, zero native code

### Ongoing Maintenance

- Monthly: `bun update` + dependency audit
- Quarterly: full security review
- On incidents: update `memory/issues.md`, post-mortem in `memory/decisions.md`

---

## Security Reference

### What the Agents Handle Automatically

| Area | Automatic Behavior |
|------|--------------------|
| Code review | Reviewer agent flags OWASP Top 10 violations |
| Auth implementation | Backend agent follows secure session patterns |
| Input validation | Backend agent uses Zod validation on all inputs |
| SQL | Architect/Backend agents use ORMs, avoid raw SQL |
| Secrets | Agents never hardcode secrets, always use env vars |

### What You Configure Manually

| Area | Where to Configure |
|------|--------------------|
| Security headers | `next.config.js` → `headers()` or Vercel dashboard |
| Rate limiting | Middleware or API route wrappers |
| CORS policy | API service configuration |
| CSP policy | Security headers config |
| Auth providers | `.env` + auth provider dashboard |
| SSL/TLS | Deploy provider (automatic on Vercel/Railway) |

---

## Stack-Specific Tips

### Next.js + Supabase + Vercel

- Use Supabase Row-Level Security (RLS) — don't skip it
- Server Components can query DB directly; Client Components cannot
- Use `middleware.ts` for auth protection, not just page-level checks
- Vercel Edge Functions for geolocation and A/B testing
- Enable Vercel Speed Insights for Core Web Vitals tracking

### Bun + Hono

- Hono validators on every route (`zValidator`)
- Use Hono's built-in JWT middleware for auth
- Test with `bun test` — Bun has a native test runner
- Deploy to Railway or Fly.io for persistent connections (WebSocket support)
- Use Drizzle for type-safe queries; avoid raw SQL

### Automation (Trigger.dev + n8n)

- Trigger.dev for reliable, long-running jobs (retries, observability)
- n8n for no-code workflow prototyping
- Composio for third-party service integrations
- Always add idempotency keys on webhook handlers
- Log job execution to `memory/services.md` when configuring

---

## Quick Reference

```bash
# Planning
/team-plan "write PRD for [project]"

# Start every session
/load-context

# Build
/team-plan "implement [feature]"

# Review security
/team-review "security audit"

# End every session
/save-context

# Before launch
/validate-setup
```

---

*See also: [Getting Started](getting-started.md) · [Skills Guide](skills-guide.md)*
