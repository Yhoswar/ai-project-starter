# Spec: README.md Update — Skills Ecosystem Sync

**Date:** 2026-03-17
**Status:** Approved
**Scope:** Opción C — Auditoría completa, cambios quirúrgicos donde es necesario

---

## Context

En sesión anterior (c8503d7) se actualizó CLAUDE.md y install-skills.sh para reflejar el ecosistema moderno de skills (marketplace packages + local skills). El README quedó desincronizado con IDs de marketplace obsoletos, 2 packages faltantes, y sin las secciones "Always Install" ni "By Project Type".

Adicionalmente, el README describe `.opencode/` como "única fuente de verdad" para agentes, pero el commit dc9b7a3 agregó agentes nativos en `.claude/agents/` — esto también requiere corrección.

---

## Cambios Requeridos

### 1. Sección Skills (líneas 181–190) — REESCRITURA

**Problema:** IDs de marketplace obsoletos, faltan 2 packages, sin estructura por tipo de proyecto, sin local skills, sin "Always Install".

**Solución:** Reemplazar tabla plana de 6 skills por estructura de 4 sub-secciones:

#### A. Intro: Dos tipos de skills
Párrafo corto explicando la diferencia marketplace vs local.

#### B. Tabla Marketplace (8 packages)
| Package | Sub-skills / Propósito |
|---------|------------------------|
| `superpowers` | TDD, debugging, brainstorming, planning, worktrees, parallel agents (12 skills) |
| `claude-mem` | Memoria cross-session: make-plan, do, smart-explore, mem-search |
| `context-mode` | Gestión de contexto en tiempo real — evita flooding del context window |
| `frontend-design` | UI components de producción, evita estética genérica de IA |
| `ui-ux-pro-max` | 50+ estilos, 161 paletas, 57 font pairings, 99 UX guidelines |
| `claude-api` | Construir apps con Claude API / Anthropic SDK |
| `code-review` | Code review de pull requests |
| `skill-creator` | Crear, testear y optimizar skills propios |

Instalación: `claude plugin install <package>`

#### C. Local Skills (4, via install-skills.sh)
- `security` — OWASP Top 10, XSS, CSRF, SQL injection, auth review
- `researcher` — investigación profunda con web search y síntesis
- `self-healing` — auto-mejora continua, auto-memory, creación de skills
- `cost-reducer` — optimización de costos cloud, infra y queries

#### D. Always Install (5 core) — con justificación por línea

#### E. Por Tipo de Proyecto (tabla)

---

### 2. Sección Dual-Platform (línea 334) — CORRECCIÓN

**Problema:** "`.opencode/` es la única fuente de verdad para agentes y comandos — Claude Code los lee vía bridge"
**Corrección:** Desde dc9b7a3, Claude Code tiene sus propios agentes nativos en `.claude/agents/`. La descripción bridge es obsoleta.

**Solución:** Actualizar para reflejar que ambas plataformas tienen agentes propios sincronizados.

---

### 3. Sección Características (línea 37) — MINOR UPDATE

**Problema:** "Scripts de instalación global de skills" — correcto pero vago.
**Mejora:** Mencionar explícitamente la distinción marketplace/local.

---

## Archivos Afectados

- `README.md` — cambios en secciones Skills y Dual-Platform
- Sin cambios en: CLAUDE.md, install-skills.sh, AGENTS.md, templates/

---

## Verificación

1. README renderiza correctamente en GitHub (tablas, enlaces)
2. Comandos de instalación son ejecutables
3. Todos los package names coinciden con CLAUDE.md
4. Sección Dual-Platform refleja estado real de `.claude/agents/` y `.opencode/`
