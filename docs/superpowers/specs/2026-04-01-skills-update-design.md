# Skills Update Design — ai-project-starter

**Date:** 2026-04-01
**Status:** Approved

## Problem

The `ai-project-starter` repo's skill documentation and install script were created before a large set of new skills were installed globally. The gap:

- 20 SEO skills + 12 SEO agents — not documented anywhere
- 6 other local skills missing (`content-research-writer`, `systematic-debugging`, `web-accessibility`, `web-design-guidelines`, `emil-design-eng`)
- `humanizer` was cloned from a third-party repo (blader/humanizer) but the user has an improved local version
- `pdf.md`, `docx.md`, `mcp-builder.md` exist as local skill files but were incorrectly listed as marketplace packages

## Approved Design: Option B — Global Install + Project-Level Activation

All skills install globally to `~/.claude/skills/`. No skill installs to a per-project `.claude/` folder. The distinction is at the **documentation layer**: the `CLAUDE.md` template includes a checklist where users activate only the skills relevant to their project type, so Claude knows what to prioritize.

### Rationale
- No skills overlap with each other — safe to install all globally
- Simpler mental model: one destination (`~/.claude/skills/`), organized source
- Per-project relevance communicated via CLAUDE.md, not file system layout

---

## Changes

### 1. `claude-skills` repo — humanizer update

Copy `~/.claude/skills/humanizer/` (improved local version) to `claude-skills/humanizer/`, replacing the third-party version. This makes the repo the source of truth for the improved humanizer.

### 2. `install-skills.sh` — full rewrite

**PART 1 — LOCAL SKILLS** (source: `claude-skills` repo clone on local disk)

Core (install without prompting):
- `security`, `researcher`, `self-healing`, `cost-reducer`
- `systematic-debugging`, `content-research-writer`
- `humanizer`, `pdf`, `docx`, `mcp-builder`
- `web-accessibility`, `web-design-guidelines`, `emil-design-eng`

Optional — SEO Suite (single y/N prompt installs all 20 + agents):
- `seo`, `seo-audit`, `seo-backlinks`, `seo-competitor-pages`, `seo-content`
- `seo-dataforseo`, `seo-firecrawl`, `seo-geo`, `seo-google`, `seo-hreflang`
- `seo-image-gen`, `seo-images`, `seo-local`, `seo-maps`, `seo-page`
- `seo-plan`, `seo-programmatic`, `seo-schema`, `seo-sitemap`, `seo-technical`
- Agents: copy `agents/seo-*.md` to `~/.claude/agents/`

**PART 2 — MARKETPLACE PACKAGES** (unchanged, listed for reference)
- Core: `superpowers`, `claude-mem`, `context-mode`
- UI: `frontend-design`, `ui-ux-pro-max`
- By project: `claude-api`, `code-review`, `skill-creator`, `loop`, `simplify`, `update-config`

**PART 3 — GIT-CLONED** → **removed** (humanizer moved to local skills in PART 1)

### 3. `docs/skills-guide.md` — full reorganization

New category structure:
- **Core** (every project): security, researcher, self-healing, systematic-debugging, content-research-writer, humanizer, cost-reducer
- **Design / Frontend**: web-accessibility, web-design-guidelines, emil-design-eng + marketplace: frontend-design, ui-ux-pro-max
- **SEO Suite**: seo + 19 specialized skills + 12 agents
- **Tools**: pdf, docx, mcp-builder
- **Marketplace always**: superpowers, claude-mem, context-mode

### 4. `CLAUDE.md` template — new section

Add `## Skills Activos para Este Proyecto` section with a commented checklist organized by project type. Users uncomment what applies:

```markdown
## Skills Activos para Este Proyecto

**Core (siempre activos):**
- `security` — OWASP, auth, input validation
- `researcher` — deep research y síntesis
- `systematic-debugging` — metodología de debugging
- `humanizer` — eliminar patrones AI en escritura

**Según tipo de proyecto (descomenta los que aplican):**
<!-- SEO / Presencia web -->
<!-- - `seo` + suite SEO completa (20 skills + 12 agentes) -->

<!-- UI / Frontend -->
<!-- - `frontend-design`, `web-design-guidelines`, `web-accessibility` -->
<!-- - `ui-ux-pro-max`, `emil-design-eng` -->

<!-- Documentos -->
<!-- - `pdf`, `docx` -->

<!-- Integraciones / MCP -->
<!-- - `mcp-builder` -->

<!-- IA / API -->
<!-- - `claude-api`, `skill-creator` -->

<!-- Automatización -->
<!-- - `loop`, `cost-reducer` -->
```

---

## Files Modified

| File | Change |
|---|---|
| `claude-skills/humanizer/` | Replace with improved local version |
| `ai-project-starter/scripts/install-skills.sh` | Full rewrite — new categories, SEO suite, remove git-clone |
| `ai-project-starter/docs/skills-guide.md` | Reorganize + add all missing skills |
| `ai-project-starter/CLAUDE.md` | Add "Skills Activos" section to template |

## Verification

1. Run `./scripts/install-skills.sh` on a clean machine → confirms all core skills install, SEO prompt works
2. Check `~/.claude/skills/` has all 13 core skills after run
3. Check `~/.claude/agents/` has all 12 SEO agents after answering Y to SEO prompt
4. Open a new project using the starter → CLAUDE.md has the skills checklist
5. Claude in that project correctly identifies active skills from the checklist
