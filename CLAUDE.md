# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Idioma / Language

**Responder siempre en {PREFERRED_LANGUAGE}** al usuario. Always respond in {PREFERRED_LANGUAGE} to the user.

## Negocio / Business

**{PROJECT_NAME}** — {PROJECT_DESCRIPTION}

- Sitio / Website: `{WEBSITE_URL}`
- Idioma principal / Main language: {MAIN_LANGUAGE}
- Idioma secundario / Secondary language: {SECONDARY_LANGUAGE}

## Entorno de Desarrollo / Development Environment

- **Entorno local / Local environment:** {LOCAL_ENVIRONMENT_DESCRIPTION}
- **Proceso de build / Build process:** {BUILD_PROCESS_DESCRIPTION}
- **Gestor de paquetes / Package manager:** {PACKAGE_MANAGER} (npm, yarn, pnpm, composer, pip, etc.)
- **Producción / Production:** {PRODUCTION_ENVIRONMENT_DESCRIPTION}

## Arquitectura / Architecture

### Flujo de carga / Loading Flow

{LOADING_FLOW_DESCRIPTION}

```
Describe aquí el flujo de carga típico de tu aplicación.
Ejemplo:
- Para PHP: index.php → loadpage.php → functions → templates
- Para React: index.tsx → App.tsx → Routes → Components
- Para Next.js: pages/_app.tsx → layout → page components
```

### Páginas/Rutas disponibles / Available Pages/Routes

| URL | Descripción | Archivo |
|---|---|---|
| `/` | Home | `{FILE_PATH}` |
| `{ADD_YOUR_ROUTES}` | ... | ... |

## Sistema Multiidioma / Multi-language System

{MULTI_LANGUAGE_DESCRIPTION}

**Si tu proyecto NO es multiidioma, elimina esta sección.**

```javascript
// Ejemplo de acceso a traducciones:
{TRANSLATION_EXAMPLE_CODE}
```

## Convenciones de Código / Code Conventions

### {LANGUAGE_1} (e.g., JavaScript, PHP, Python)

```{LANGUAGE_1}
// Convenciones específicas del lenguaje
// Ejemplo: naming conventions, imports, etc.
{CODE_CONVENTIONS_EXAMPLE}
```

### CSS/Styling

- **Framework:** {CSS_FRAMEWORK} (e.g., Tailwind, Bootstrap, CSS Modules, Styled Components)
- **Custom CSS en / Custom CSS in:** `{CUSTOM_CSS_PATH}`
- **Variables:** {CSS_VARIABLES_DESCRIPTION}

### {LANGUAGE_2} (si aplica)

{ADDITIONAL_LANGUAGE_CONVENTIONS}

## Seguridad / Security

{SECURITY_MEASURES_DESCRIPTION}

Ejemplo:
- CSRF tokens
- Input sanitization
- Authentication system
- Rate limiting
- etc.

## Plugins Instalados / Installed Plugins

Claude Code tiene plugins activos que se auto-invocan cuando es relevante:

| Plugin | Versión | Propósito | Activación |
|---|---|---|---|
| **{PLUGIN_NAME}** | {VERSION} | {PURPOSE} | {WHEN_TO_ACTIVATE} |

### MCP Servers Activos / Active MCP Servers

| Server | Estado | Propósito |
|---|---|---|
| **{MCP_SERVER_NAME}** | {STATUS} | {PURPOSE} |

## Skills Disponibles / Available Skills

### Skills Personalizados del Proyecto / Custom Project Skills

| Comando | Propósito |
|---|---|
| `/{SKILL_NAME}` | {SKILL_PURPOSE} |

## Estructura del Proyecto / Project Structure

```
{PROJECT_NAME}/
├── {MAIN_DIRECTORY}/
│   ├── {SUBDIRECTORY}/
│   └── {FILES}
└── {OTHER_DIRECTORIES}/
```

## Reglas Importantes / Important Rules

### ❌ NO HACER / DO NOT

1. {RULE_1}
2. {RULE_2}
3. {RULE_3}

### ✅ HACER / DO

1. {GOOD_PRACTICE_1}
2. {GOOD_PRACTICE_2}
3. {GOOD_PRACTICE_3}

## Auto-Actualización de Documentación / Documentation Auto-Update

Después de cambios arquitectónicos significativos (nuevos archivos, secciones, convenciones), actualizar:
- **CLAUDE.md** — si cambia arquitectura, convenciones o flujos
- **AGENTS.md** — arquitectura y listado de archivos

---

## 📝 Personalización de este Template

Después de inicializar el proyecto, reemplaza todos los placeholders marcados con `{PLACEHOLDER}`:

**Información del Proyecto:**
- `{PROJECT_NAME}` - Nombre del proyecto
- `{PROJECT_DESCRIPTION}` - Descripción breve del negocio/proyecto
- `{WEBSITE_URL}` - URL del sitio web
- `{PREFERRED_LANGUAGE}` - Idioma de respuesta preferido (español, inglés, etc.)
- `{MAIN_LANGUAGE}` - Idioma principal del proyecto
- `{SECONDARY_LANGUAGE}` - Idioma secundario (si aplica)

**Entorno:**
- `{LOCAL_ENVIRONMENT_DESCRIPTION}` - Descripción del entorno local (XAMPP, Node.js, Docker, etc.)
- `{BUILD_PROCESS_DESCRIPTION}` - Proceso de compilación (si aplica)
- `{PACKAGE_MANAGER}` - Gestor de paquetes usado
- `{PRODUCTION_ENVIRONMENT_DESCRIPTION}` - Descripción del entorno de producción

**Arquitectura:**
- `{LOADING_FLOW_DESCRIPTION}` - Flujo de carga de la aplicación
- `{FILE_PATH}` - Rutas de archivos principales
- `{ADD_YOUR_ROUTES}` - Tus rutas específicas

**Código:**
- `{LANGUAGE_1}`, `{LANGUAGE_2}` - Lenguajes de programación usados
- `{CODE_CONVENTIONS_EXAMPLE}` - Ejemplos de convenciones
- `{CSS_FRAMEWORK}` - Framework CSS utilizado
- `{CUSTOM_CSS_PATH}` - Ruta al CSS personalizado
- `{CSS_VARIABLES_DESCRIPTION}` - Variables CSS del proyecto

**Plugins/Tools:**
- `{PLUGIN_NAME}`, `{VERSION}`, `{PURPOSE}` - Plugins de Claude Code instalados
- `{MCP_SERVER_NAME}`, `{STATUS}` - Servidores MCP configurados
- `{SKILL_NAME}`, `{SKILL_PURPOSE}` - Skills personalizados

**Seguridad:**
- `{SECURITY_MEASURES_DESCRIPTION}` - Medidas de seguridad implementadas

**Multiidioma:**
- `{MULTI_LANGUAGE_DESCRIPTION}` - Descripción del sistema multiidioma (si aplica)
- `{TRANSLATION_EXAMPLE_CODE}` - Ejemplo de código de traducción

---

*Este es un template genérico. Personalízalo según las necesidades de tu proyecto.*

---

## Recommended Skills (Claude Code)

Local skills via `scripts/install-skills.sh`. Marketplace packages via Claude Code plugin manager.

### Marketplace Packages (Claude Code Plugin Manager)
| Package | Sub-skills / Purpose |
|---------|---------------------|
| `superpowers` | TDD, debugging, brainstorming, planning, worktrees, parallel agents (12 skills) |
| `claude-mem` | Cross-session memory: make-plan, do, smart-explore, mem-search |
| `context-mode` | Real-time context management — prevents context window flooding |
| `frontend-design` | Production-grade UI components, avoids generic AI aesthetics |
| `ui-ux-pro-max` | 50+ styles, 161 palettes, 57 font pairings, full UX guidelines |
| `claude-api` | Build apps with Claude API / Anthropic SDK |
| `code-review` | Pull request code review |
| `skill-creator` | Create, test, and optimize custom skills |

### Local Skills (install via install-skills.sh)
- `security` — OWASP Top 10, XSS, CSRF, SQL injection, auth review
- `researcher` — deep research with web search and source synthesis
- `self-healing` — continuous self-improvement, auto-memory, skill creation
- `cost-reducer` — cloud, infra, and query cost optimization

### Git-Cloned Skills (install via install-skills.sh PART 3)
| Skill | Source | Purpose |
|-------|--------|---------|
| `humanizer` | [blader/humanizer](https://github.com/blader/humanizer) | Remove AI writing patterns from text (24 patterns, v2.2.0) |

### Always Install (Recommended Core)
- `superpowers` — foundational workflow discipline (TDD, debugging, planning)
- `claude-mem` — cross-session memory, never lose context between conversations
- `context-mode` — prevents context flooding on large outputs
- `security` — every project needs security review
- `frontend-design` — UI/component work

### By Project Type
| Template | Additional Skills |
|----------|------------------|
| next-saas | `ui-ux-pro-max`, `claude-api`, `skill-creator` |
| api-service | `security`, `claude-api`, `code-review` |
| automation | `loop`, `cost-reducer`, `researcher` |
| any | `simplify`, `update-config`, `keybindings-help`, `humanizer` |

---

## Memory System

This repo includes a `memory/` folder with Claude memory templates.

1. Copy `memory/MEMORY.md` to your project root
2. Fill in your project details
3. Claude will read it at session start and maintain context across conversations

For cross-session persistent memory, also use the `claude-mem` MCP plugin.

---

## Project Context (fill in when starting a project)

- **Project name:** [NAME]
- **Stack:** [STACK]
- **Current focus:** [WHAT YOU'RE BUILDING]
- **Key constraints:** [DEADLINES, TECH CONSTRAINTS]


---

## 💡 Ejemplo Completo / Full Example

> ⚠️ **EJEMPLO SOLO** — No uses esta sección directamente. Muestra cómo debería verse el archivo una vez personalizado.
> ⚠️ **EXAMPLE ONLY** — Do not use as-is. Shows what the file looks like once filled in.

### Si tu proyecto fuera "MyFinance" (Next.js 15 SaaS):

```
PROJECT_NAME: MyFinance
PROJECT_DESCRIPTION: App de finanzas personales — tracking de gastos y metas de ahorro

WEBSITE_URL: https://myfinance.app
PREFERRED_LANGUAGE: español
MAIN_LANGUAGE: español
SECONDARY_LANGUAGE: inglés (código)

LOCAL_ENVIRONMENT_DESCRIPTION:
  Node.js 22 + Bun. Base de datos: Neon PostgreSQL (serverless).
  Correr `bun dev` para iniciar en localhost:3000.

PACKAGE_MANAGER: bun
BUILD_PROCESS_DESCRIPTION: `bun run build` — Next.js build con output en .next/
PRODUCTION_ENVIRONMENT_DESCRIPTION: Vercel (auto-deploy desde main). DB en Neon production branch.

LOADING_FLOW_DESCRIPTION:
  src/app/layout.tsx → SessionProvider → página solicitada
  Rutas protegidas via src/middleware.ts (redirige /dashboard → /login si no autenticado)

LANGUAGE_1: TypeScript
CSS_FRAMEWORK: Tailwind CSS v4
CUSTOM_CSS_PATH: src/app/globals.css
CSS_VARIABLES_DESCRIPTION:
  --background, --foreground: tema claro/oscuro via next-themes
  --primary: #6366f1 (indigo-500)

PLUGIN_NAME: superpowers | VERSION: 5.x | PURPOSE: TDD, debugging, planning
MCP_SERVER_NAME: context7 | STATUS: activo | PURPOSE: documentación de librerías

SECURITY_MEASURES_DESCRIPTION:
  - Auth.js v5 con sesiones JWT httpOnly
  - Zod validation en todos los API routes y Server Actions
  - Drizzle ORM — nunca SQL raw
  - HTTPS via Vercel, variables sensibles solo en .env
```
