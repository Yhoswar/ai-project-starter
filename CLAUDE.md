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

Install via `scripts/install-skills.sh` or manually via Claude Code plugin manager.

### Always Install
- `security` — every project needs security review
- `frontend-design` — UI/component work
- `scalability` — before any production deployment
- `superpowers` — TDD, debugging, brainstorming, planning workflows

### By Project Type
| Template | Additional Skills |
|----------|------------------|
| next-saas | `ui-ux-pro-max`, `claude-api` |
| api-service | `scalability`, `security` |
| automation | `trigger-dev`, `composio`, `n8n` |

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
