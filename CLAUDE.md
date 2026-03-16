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
| **Context Mode** | latest (mksglu) | Reduce context window en tiempo real: sandbox de ejecución, indexación in-session | Sesiones largas o con output pesado |
| **Claude Mem** | latest (thedotmack) | Memoria persistente entre sesiones con compresión IA | Siempre activo (cross-session memory) |

### MCP Servers Activos / Active MCP Servers

| Server | Estado | Propósito |
|---|---|---|
| **{MCP_SERVER_NAME}** | {STATUS} | {PURPOSE} |

## Gestión de Contexto / Context Management

Dos sistemas **complementarios** con responsabilidades distintas — NO son rivales:

    SESIÓN ANTERIOR → [claude-mem guarda] → SESIÓN ACTUAL → [claude-mem provee] → SESIÓN FUTURA
                                                  ↑
                                        [context-mode filtra output,
                                         indexa docs, reduce tokens]

| Dimensión | **context-mode** (mksglu) | **claude-mem** (thedotmack) |
|---|---|---|
| ¿Cuándo opera? | Durante la sesión activa | Entre sesiones (cross-session) |
| ¿Qué guarda? | Output filtrado, docs indexadas this-session | Decisiones, bugs, aprendizajes permanentes |
| Duración | Efímero (muere con la sesión) | Persistente (SQLite permanente) |
| Búsqueda | Docs cargadas **esta sesión** | Historia de trabajo **pasado** |

### Protocolo de uso — cuándo usar cada uno

**Usa `ctx_execute`** → ejecutar comandos con output largo sin volcar todo al contexto
**Usa `ctx_fetch_and_index` + `ctx_search`** → cargar y consultar documentación externa esta sesión
**Usa `ctx_execute_file`** → procesar archivos grandes sin exponer contenido crudo
**Usa `ctx_stats`** → ver cuántos tokens se han ahorrado en la sesión

**Usa `mcp__plugin_claude-mem_mcp-search__smart_search`** → "¿ya resolvimos esto antes?", recuperar decisiones pasadas
**Usa `mcp__plugin_claude-mem_mcp-search__get_observations`** → recuperar un bloque específico de trabajo pasado por ID

### Regla de oro

> **context-mode** = *"¿Cómo ejecuto esto sin saturar el contexto HOY?"*
> **claude-mem** = *"¿Qué sabíamos sobre esto de sesiones ANTERIORES?"*

---

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

## Sistema Multi-Agente (Dual-Platform)

Este template soporta **dos plataformas de IA** con un sistema único de agentes especializados.

### Plataformas Compatibles

| Plataforma | Carpeta | Estado | Uso |
|------------|---------|--------|-----|
| **Claude Code** (Anthropic) | `.claude/` | ✅ Soportado | Bridge a `.opencode/` |
| **OpenCode** (OpenCode.ai) | `.opencode/` | ✅ Soportado | Fuente de verdad |
| **OpenAI Codex CLI** | `.agents/` | ⏳ Futuro | Planeado |

### Arquitectura del Sistema

El sistema multi-agente está ubicado en `.opencode/` como **fuente de verdad única**. Claude Code accede mediante un **skill puente** ubicado en `.claude/skills/opencode-bridge/`.

### Uso en Claude Code

Los comandos `/team-*` funcionan automáticamente:

```bash
# Planificar tarea compleja
/team-plan "implementar autenticación JWT con refresh tokens"

# Ver estado de tareas
/team-status

# Revisar resultados y calidad
/team-review
```

**Workflow interno:**
1. Skill `opencode-bridge` se **auto-invoca**
2. **Lee** archivos en `.opencode/` (comandos + agentes)
3. **Ejecuta** según instrucciones
4. **Guarda estado** en `.opencode/team/tasks.json`

### Convenciones del Sistema

#### 🎯 Reglas Obligatorias

1. **Fuente de verdad**: `.opencode/` es LA fuente de verdad
   - ❌ NO duplicar agentes en `.claude/`
   - ✅ SIEMPRE leer desde `.opencode/`

2. **Lectura obligatoria**: SIEMPRE lee los `.md` antes de actuar
   - ❌ NO asumir comportamiento de agentes
   - ✅ Lee el archivo completo y sigue sus instrucciones

3. **Coordina con director**: El director SIEMPRE coordina
   - ❌ NO lanzar agentes sin pasar por director
   - ✅ Director decide qué agentes usar y cómo

4. **Estado persistente**: Usa `.opencode/team/tasks.json`
   - ❌ NO perder contexto entre ejecuciones
   - ✅ Lee/escribe estado para continuidad

### Recursos Adicionales

- **Sistema completo**: `.opencode/README.md`
- **Cada agente**: `.opencode/agents/{agente}.md`
- **Skill de orquestación**: `.opencode/skills/multi-team/skill.md`
- **Skill puente**: `.claude/skills/opencode-bridge/skill.md`

---

**Nota:** Este sistema de bridge permite que Claude Code use el mismo sistema multi-agente que OpenCode, sin duplicar código.
