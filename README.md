# 🤖 AI Project Starter

> Template AI-nativo: configuración multi-agente para Claude Code & OpenCode + tres templates de producción listos para usar.

[![CI](https://github.com/Yhoswar/ai-project-starter/actions/workflows/ci.yml/badge.svg)](https://github.com/Yhoswar/ai-project-starter/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Ready-blue)](https://claude.com/code)
[![OpenCode](https://img.shields.io/badge/OpenCode-Compatible-green)](https://opencode.ai/)

---

## 🎯 ¿Qué es esto?

Un template **listo para usar** con dos capas independientes que coexisten:

**Capa 1 — AI Config Layer** (funciona con cualquier codebase)
- 7 agentes especializados de Claude Code (Director, Arquitecto, Frontend, Backend, Marketer, Investigador, Revisor)
- Slash commands: `/team-plan`, `/team-status`, `/team-review`
- Sistema `MEMORY.md` para contexto de proyecto entre sesiones
- Compatible con Claude Code y OpenCode

**Capa 2 — Application Templates** (starters de producción)
| Template | Stack | Ideal para |
|----------|-------|------------|
| `next-saas` | Next.js 15 + Auth.js + Drizzle + shadcn/ui | SaaS, dashboards, web apps |
| `api-service` | Bun + Hono + Drizzle + Zod | REST APIs, microservicios |
| `automation` | Trigger.dev + Composio + n8n | Jobs, workflows, integraciones |

Estas capas son **independientes**: puedes usar solo el AI Config Layer en tu proyecto existente, o empezar desde uno de los templates.

---

## ✨ Características

- ✅ **Sistema multi-agente** — 7 agentes especializados con orquestación automática
- ✅ **3 templates de producción** — Next.js 15, API Bun/Hono, Automation Trigger.dev
- ✅ **Ecosistema de skills** — marketplace packages (Plugin Manager) + local skills (script), disponibles en todos tus proyectos
- ✅ **Sistema MEMORY.md** — contexto de proyecto persistente entre sesiones de Claude
- ✅ **CI/CD incluido** — GitHub Actions con lint + typecheck + tests + build
- ✅ **Dual-platform** — Claude Code y OpenCode comparten el mismo sistema de agentes
- ✅ **Agnóstico de tecnología** — también funciona con React, PHP, Python, etc.

---

## 🚀 Uso Rápido

### Opción A: Usar un Template

```bash
git clone https://github.com/Yhoswar/ai-project-starter.git
cd ai-project-starter

# Copia el template elegido
cp -r templates/next-saas ../my-project
cd ../my-project

bun install
cp .env.example .env  # Completa tus valores
bun db:push
bun dev
```

### Opción B: Agregar agentes AI a un proyecto existente

```bash
cp -r ai-project-starter/.claude your-project/
cp ai-project-starter/CLAUDE.md your-project/
cp ai-project-starter/AGENTS.md your-project/
cp -r ai-project-starter/memory your-project/
```

### Opción C: Script de inicialización interactivo

```bash
./init-project.sh        # bash/zsh
./init-project.ps1       # PowerShell (Windows)
```

El script interactivo te pedirá nombre del proyecto, descripción, URL, idioma, tipo de proyecto y luego reemplaza automáticamente todos los placeholders.

---

## 📦 Estructura del Repositorio

```
ai-project-starter/
├── .claude/
│   ├── agents/                    # 7 agentes especializados
│   ├── commands/                  # /team-plan, /team-status, /team-review
│   └── settings.local.json        # Permisos de herramientas
├── .opencode/                     # Compatibilidad OpenCode
├── .github/
│   └── workflows/
│       ├── ci.yml                 # lint + typecheck + test + build
│       └── security.yml           # bun audit + dependency scanning
├── templates/
│   ├── next-saas/                 # Next.js 15 + Auth.js + Drizzle + shadcn/ui
│   ├── api-service/               # Bun + Hono + Zod
│   └── automation/                # Trigger.dev + Composio + n8n
├── docs/
│   ├── getting-started.md
│   ├── skills-guide.md
│   ├── memory-guide.md
│   └── agents-guide.md
├── memory/
│   ├── MEMORY.md                  # Índice de memoria del proyecto (template)
│   ├── decisions.md               # Decisiones de arquitectura
│   └── services.md                # Servicios externos y credenciales
├── scripts/
│   ├── install-skills.sh          # Instalador global de skills (bash)
│   └── install-skills.ps1         # Instalador global de skills (PowerShell)
├── init-project.sh                # Inicialización interactiva (bash)
├── init-project.ps1               # Inicialización interactiva (PowerShell)
├── .env.example                   # Variables de entorno base
├── .gitignore
├── .editorconfig
├── CLAUDE.md
└── AGENTS.md
```

---

## 🤖 Sistema Multi-Agente

Este template incluye un **sistema de orquestación con 7 agentes especializados** listo para usar.

### Agentes Disponibles

| Agente | Especialización | Cuándo usarlo |
|--------|----------------|---------------|
| **Director** | Coordinación y planificación | Coordina equipos, descompone objetivos complejos |
| **Arquitecto** | Diseño de sistemas y estructura | Decisiones de arquitectura, patrones, escalabilidad |
| **Frontend** | UI/UX, HTML, CSS, JS, React | Interfaces, diseño, animaciones, accesibilidad |
| **Backend** | APIs, bases de datos, lógica | Endpoints, modelos, seguridad, optimización |
| **Marketer** | SEO, contenido, copywriting | Meta tags, textos persuasivos, estrategia digital |
| **Investigador** | Análisis y documentación | Investigar soluciones, documentar código |
| **Revisor** | QA, testing, code review | Validar calidad, detectar bugs, mejoras |

### Comandos del Sistema

| Comando | Propósito |
|---------|-----------|
| `/team-plan <objetivo>` | Planificar tarea con equipo de agentes |
| `/team-status` | Ver estado de tareas en progreso |
| `/team-review` | Revisar resultados consolidados |

### Ejemplo de Uso

```bash
/team-plan "crear sistema de autenticación con JWT"
```

El **director** automáticamente:
1. ✅ Descompone el objetivo en subtareas
2. ✅ Asigna tareas a agentes especializados
3. ✅ Lanza agentes en paralelo (respetando dependencias)
4. ✅ Consolida resultados en un reporte final

---

## 📥 Instalar Skills Globalmente

Haz que los skills estén disponibles en **todos** tus proyectos de Claude Code:

```bash
# bash/zsh
./scripts/install-skills.sh

# PowerShell (Windows)
./scripts/install-skills.ps1
```

El script soporta `SKILLS_ROOT` para una ruta personalizada:

```bash
SKILLS_ROOT="/ruta/a/Claude Skills" ./scripts/install-skills.sh
```

Ver guía completa: [docs/skills-guide.md](docs/skills-guide.md)

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

---

## 🧠 Sistema MEMORY.md

El repo incluye un template de `memory/MEMORY.md` que cada proyecto personaliza. Claude Code lo lee al inicio de cada sesión para mantener contexto entre conversaciones.

Esto es distinto de `claude-mem` (MCP de base de datos cross-session). MEMORY.md es:
- Por proyecto, no global
- Versionado en git junto al código
- Legible y editable por humanos
- Un índice de punteros a archivos detallados en `memory/`

Ver guía completa: [docs/memory-guide.md](docs/memory-guide.md)

---

## 📋 Próximos Pasos Después de Inicializar

### 1. Personalizar `CLAUDE.md`

Completa los placeholders (`{PLACEHOLDER}`):
- Arquitectura específica del proyecto
- Convenciones de código
- Stack tecnológico

### 2. Personalizar `AGENTS.md`

- Estructura de archivos real
- Componentes principales
- Comandos útiles del proyecto

### 3. Agregar Skills Personalizados

Crea archivos en `.claude/skills/` para guías especializadas:

```markdown
---
name: database-conventions
description: Convenciones de base de datos del proyecto
---

# Database Conventions
...
```

### 4. Agregar Slash Commands

Crea comandos en `.claude/commands/`:

```markdown
---
name: add-component
description: Crear un nuevo componente con estructura estándar
---
...
```

### 5. Configurar Permisos

Ajusta `.claude/settings.local.json` según las necesidades de tu proyecto:

```json
{
  "permissions": {
    "allow": ["Bash(git status)", "Bash(bun run build)"],
    "deny": ["Bash(rm -rf *)"]
  }
}
```

---

## 🎨 Ejemplos de Uso

### Proyecto Next.js SaaS

```bash
cp -r templates/next-saas ../my-saas
cd ../my-saas
bun install
cp .env.example .env  # Agrega DATABASE_URL, AUTH_SECRET
bun db:push
bun dev
```

### API REST con Bun + Hono

```bash
cp -r templates/api-service ../my-api
cd ../my-api
bun install
cp .env.example .env
bun dev
```

### Automation con Trigger.dev

```bash
cp -r templates/automation ../my-jobs
cd ../my-jobs
bun install
cp .env.example .env  # Agrega TRIGGER_SECRET_KEY
bun run dev
```

### Agregar agentes a proyecto React existente

```bash
./init-project.sh
# Nombre: my-react-app
# Tipo: React
# Idioma: español
```

### Agregar agentes a proyecto PHP existente

```bash
./init-project.sh
# Nombre: my-php-app
# Tipo: PHP
# Idioma: español
```

---

## 📚 Documentación

- [Getting Started](docs/getting-started.md) — Guía de onboarding
- [Skills Guide](docs/skills-guide.md) — Qué skills instalar según tipo de proyecto
- [Memory Guide](docs/memory-guide.md) — Cómo usar MEMORY.md y claude-mem
- [Agents Guide](docs/agents-guide.md) — Cómo funciona el sistema multi-agente

---

## 🔀 Compatibilidad Dual-Platform

| Plataforma | Estado | Carpeta |
|------------|--------|---------|
| **Claude Code** (Anthropic) | ✅ Soportado | `.claude/` |
| **OpenCode** (OpenCode.ai) | ✅ Soportado | `.opencode/` |
| **Gemini CLI** | 🔜 Via bridge skill | — |

Ambas plataformas tienen agentes nativos sincronizados: `.claude/agents/` para Claude Code y `.opencode/agents/` para OpenCode. Para agregar un agente, créalo en la carpeta de tu plataforma — o en ambas si quieres compatibilidad completa.

---

## 🤝 Contribuir

¿Tienes ideas para mejorar el template? ¡PRs bienvenidos!

1. Fork el proyecto
2. Crea tu feature branch (`git checkout -b feature/amazing-feature`)
3. Commit tus cambios (`git commit -m 'Add amazing feature'`)
4. Push a la rama (`git push origin feature/amazing-feature`)
5. Abre un Pull Request

---

## 📄 Licencia

MIT — ver [LICENSE](LICENSE) para más detalles.

---

## 🙏 Agradecimientos

- [Anthropic](https://www.anthropic.com/) — Claude Code
- [OpenCode.ai](https://opencode.ai/) — OpenCode AI
- [obra](https://github.com/obra) — Superpowers Framework
- Comunidad de desarrolladores que trabajan con IA

---

## 📞 Soporte

- 📧 Email: yhoswarperez@gmail.com
- 🐛 Issues: [GitHub Issues](https://github.com/Yhoswar/ai-project-starter/issues)
- 💬 Discusiones: [GitHub Discussions](https://github.com/Yhoswar/ai-project-starter/discussions)

---

<p align="center">
  Hecho con ❤️ para la comunidad de desarrolladores que usan IA
</p>

<p align="center">
  <a href="#-qué-es-esto">Inicio</a> •
  <a href="#-uso-rápido">Uso</a> •
  <a href="#-estructura-del-repositorio">Estructura</a> •
  <a href="#-documentación">Docs</a>
</p>
