# README.md Update — Skills Ecosystem Sync Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:subagent-driven-development (if subagents available) or superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Actualizar README.md para que refleje el ecosistema moderno de skills (marketplace vs local), corrija el statement obsoleto sobre `.opencode/` como única fuente de verdad, y sea más explicativo para nuevos usuarios.

**Architecture:** Ediciones quirúrgicas en dos secciones de README.md — la sección Skills (reescritura completa de ~10 líneas a ~45 líneas) y la sección Dual-Platform (corrección de una descripción obsoleta). Fuente de verdad: CLAUDE.md sección "Recommended Skills".

**Tech Stack:** Markdown, git

**Spec:** `docs/superpowers/specs/2026-03-17-readme-update-design.md`

---

## Chunk 1: Actualizar sección Skills

### Task 1: Reemplazar tabla de Skills en README

**Files:**
- Modify: `README.md` (sección "Skills recomendados vía claude plugin install", líneas ~181–190)

**Contexto actual (a reemplazar):**
```markdown
### Skills recomendados vía `claude plugin install`

| Skill | Marketplace | Propósito |
|-------|-------------|-----------|
| **Superpowers** | `superpowers@superpowers-marketplace` | Framework de desarrollo ágil con 20+ skills |
| **Claude Mem** | `claude-mem@thedotmack` | Memoria persistente entre sesiones |
| **Frontend Design** | `frontend-design@claude-plugins-official` | Guía de diseño bold, tipografía y animaciones |
| **UI/UX Pro Max** | `ui-ux-pro-max@ui-ux-pro-max-skill` | Design System Generator + 99 UX Guidelines |
| **Code Review** | `code-review@claude-plugins-official` | Revisión con 5 agentes paralelos |
| **Context Mode** | `context-mode@mksglu` | Reducción de contexto en tiempo real |
```

**Contenido nuevo (reemplazar con):**

```markdown
### Skills recomendados

Los skills se dividen en dos categorías: **marketplace** (instalados vía Claude Code Plugin Manager, disponibles globalmente) y **locales** (instalados vía script, viven en este repo).

#### 📦 Marketplace Packages — `claude plugin install <package>`

| Package | Sub-skills / Propósito |
|---------|------------------------|
| `superpowers` | TDD, debugging, brainstorming, planning, worktrees, parallel agents (12 skills) |
| `claude-mem` | Memoria cross-session: make-plan, do, smart-explore, mem-search |
| `context-mode` | Gestión de contexto en tiempo real — evita flooding del context window |
| `frontend-design` | UI components de producción, evita estética genérica de IA |
| `ui-ux-pro-max` | 50+ estilos, 161 paletas, 57 font pairings, 99 UX guidelines |
| `claude-api` | Construir apps con Claude API / Anthropic SDK |
| `code-review` | Code review de pull requests con análisis detallado |
| `skill-creator` | Crear, testear y optimizar skills propios |

#### 🛠️ Local Skills — `./scripts/install-skills.sh`

Estos skills se instalan globalmente desde el script del repo y quedan disponibles en todos tus proyectos:

| Skill | Propósito |
|-------|-----------|
| `security` | OWASP Top 10, XSS, CSRF, SQL injection, revisión de auth |
| `researcher` | Investigación profunda con web search y síntesis de fuentes |
| `self-healing` | Auto-mejora continua, auto-memory, creación de skills |
| `cost-reducer` | Optimización de costos cloud, infra y queries |

#### ⭐ Always Install (Core Recomendado)

| Skill | Por qué instalarlo |
|-------|-------------------|
| `superpowers` | Disciplina de workflow base (TDD, debugging, planning) |
| `claude-mem` | Memoria cross-session — nunca pierdas contexto entre conversaciones |
| `context-mode` | Evita flooding de contexto en outputs grandes |
| `security` | Todo proyecto necesita revisión de seguridad |
| `frontend-design` | Trabajo de UI/componentes con calidad de producción |

#### 🎯 Por Tipo de Proyecto

| Template | Skills adicionales recomendados |
|----------|--------------------------------|
| `next-saas` | `ui-ux-pro-max`, `claude-api`, `skill-creator` |
| `api-service` | `security`, `claude-api`, `code-review` |
| `automation` | `loop`, `cost-reducer`, `researcher` |
| cualquier proyecto | `simplify`, `update-config`, `keybindings-help` |
```

**Steps:**

- [ ] **Step 1: Editar README.md — reemplazar sección Skills**
  - Usar Edit tool para reemplazar desde `### Skills recomendados vía \`claude plugin install\`` hasta el cierre de la tabla (6 filas + separador `---`)
  - Reemplazar con el contenido nuevo de 4 sub-secciones descrito arriba

- [ ] **Step 2: Verificar que el markdown renderiza correctamente**
  - Contar que haya exactamente 8 filas en tabla Marketplace
  - Contar que haya exactamente 4 filas en tabla Local Skills
  - Contar que haya exactamente 5 filas en tabla Always Install
  - Contar que haya exactamente 4 filas en tabla Por Tipo de Proyecto

---

## Chunk 2: Corregir Dual-Platform y Características

### Task 2: Corregir descripción obsoleta de .opencode/

**Files:**
- Modify: `README.md` (sección "Compatibilidad Dual-Platform", líneas ~326–334)

**Contexto actual (a corregir):**
```markdown
`.opencode/` es la única fuente de verdad para agentes y comandos — Claude Code los lee vía bridge. Para agregar un nuevo agente, solo crea el archivo en `.opencode/agents/` y ambas plataformas lo detectarán automáticamente.
```

**Por qué está mal:** El commit dc9b7a3 agregó agentes nativos en `.claude/agents/`. Claude Code ya no depende de un bridge hacia `.opencode/`.

**Nuevo contenido:**
```markdown
Ambas plataformas tienen agentes nativos sincronizados: `.claude/agents/` para Claude Code y `.opencode/agents/` para OpenCode. Para agregar un agente, créalo en la carpeta de tu plataforma — o en ambas si quieres compatibilidad completa.
```

**Steps:**

- [ ] **Step 3: Editar README.md — corregir párrafo Dual-Platform**
  - Usar Edit tool para reemplazar el párrafo obsoleto con el nuevo

### Task 3: Actualizar bullet de Características

**Files:**
- Modify: `README.md` (línea ~37, sección "✨ Características")

**Contexto actual:**
```markdown
- ✅ **Scripts de instalación global de skills** — disponibles en todos tus proyectos
```

**Nuevo contenido:**
```markdown
- ✅ **Ecosistema de skills** — marketplace packages (Plugin Manager) + local skills (script), disponibles en todos tus proyectos
```

**Steps:**

- [ ] **Step 4: Editar README.md — actualizar bullet de Características**

---

## Chunk 3: Verificación y Commit

### Task 4: Verificación final y commit

**Steps:**

- [ ] **Step 5: Verificar cambios con git diff**
  - Revisar que solo README.md fue modificado
  - Confirmar que no hay regresiones en otras secciones

- [ ] **Step 6: Commit**
  ```bash
  git add README.md
  git commit -m "docs: sync README skills section with modern marketplace ecosystem

  - Replace outdated marketplace IDs with current package names
  - Add 2 missing packages (claude-api, skill-creator)
  - Add local skills section (security, researcher, self-healing, cost-reducer)
  - Add Always Install recommendations with justifications
  - Add By Project Type table
  - Fix obsolete .opencode/ bridge description (dc9b7a3 added native .claude/agents/)
  - Update Características bullet to reflect marketplace/local distinction"
  ```

- [ ] **Step 7: Push a GitHub**
  ```bash
  git push origin main
  ```
