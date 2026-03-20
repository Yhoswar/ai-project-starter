<div align="center">

# AI Project Starter

**La forma más rápida de iniciar cualquier proyecto con infraestructura AI completa.**

7 agentes especializados · Sistema de memoria · Wizard de setup interactivo · Blueprints de producción

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-blue)](https://claude.ai/code)

[Inicio Rápido](#inicio-rápido) · [Qué Incluye](#qué-incluye) · [Agentes](#agentes) · [Comandos](#comandos) · [Blueprints](#blueprints)

**[🇺🇸 English Version](README.md)**

</div>

---

## Inicio Rápido

**2 minutos para tener un workspace AI completamente configurado.**

### Opción 1: Usar como Template de GitHub (Recomendado)

1. Haz clic en **"Use this template"** en GitHub
2. Clona tu nuevo repositorio
3. Abrelo en Claude Code y ejecuta:

```bash
/init-project
```

El wizard te hará preguntas sobre tu proyecto y configurará todo automáticamente.

### Opción 2: Sin Claude Code

Copia el contenido del archivo `START_PROJECT_PROMPT` y pégalo en cualquier conversación de Claude.

---

## Qué Incluye

### 🤖 7 Agentes Especializados

| Agente | Especialidad |
|--------|-------------|
| **Director** | Orquesta workflows multi-agente |
| **Architect** | Diseño de sistemas, ADRs |
| **Frontend** | UI/UX, React, Tailwind |
| **Backend** | APIs, bases de datos, auth |
| **Reviewer** | Code review, seguridad, QA |
| **Strategist** | Research, contenido, SEO *(opcional)* |

### 🧠 Memoria Persistente Entre Sesiones

Nunca pierdas contexto. Cada sesión continúa exactamente donde quedó.

- `/load-context` — Inicio de sesión: carga todo el contexto
- `/save-context` — Fin de sesión: guarda progreso y sugiere próximos pasos

### ⚡ Comandos Slash

| Comando | Propósito |
|---------|-----------|
| `/init-project` | Wizard de setup interactivo |
| `/load-context` | Cargar contexto al inicio |
| `/save-context` | Guardar contexto al final |
| `/validate-setup` | Verificar configuración correcta |
| `/team-plan` | Planificar tarea con múltiples agentes |
| `/team-status` | Ver estado de tareas |
| `/team-review` | Revisar trabajo completado |

### 📐 Skeleton Universal

```
tu-proyecto/
├── planning/       ← Roadmaps, sprints, OKRs
├── implementation/ ← Specs técnicas, ADRs
├── tests/          ← Tests del proyecto
├── mcps/           ← Configuraciones MCP
└── memory/         ← Persistencia de contexto (siempre presente)
```

---

## Agentes

### Cómo Funciona la Colaboración Multi-Agente

```
Tú: /team-plan "implementar autenticación de usuarios"
        ↓
   Director analiza → envía a Architect → Architect diseña
        ↓
   Director envía a Backend → Backend implementa
        ↓
   Director envía a Frontend → Frontend construye UI
        ↓
   Director envía a Reviewer → Reviewer valida
        ↓
   Director presenta resultado consolidado
```

---

## Blueprints

Templates de producción listos para usar en `_blueprints/`:

| Blueprint | Stack | Ideal Para |
|-----------|-------|-----------|
| `next-saas/` | Next.js 15 + Auth.js + Drizzle + shadcn/ui | SaaS, dashboards |
| `api-service/` | Bun + Hono + Drizzle + Zod | REST APIs, microservicios |
| `automation/` | Trigger.dev + Composio + n8n | Workflows, automatizaciones |

Usa `/init-project` para iniciar desde un blueprint.

---

## Skills Recomendados

```bash
# Esenciales
claude install superpowers context-mode claude-mem security

# Recomendados
claude install frontend-design ui-ux-pro-max

# Opcionales
claude install researcher cost-reducer
```

---

## Contribuir

Ver [CONTRIBUTING.md](CONTRIBUTING.md) para guía de contribución.

---

## Licencia

MIT — Ver [LICENSE](LICENSE).
