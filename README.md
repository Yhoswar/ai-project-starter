# 🤖 AI Project Starter

> Universal template for AI-ready projects with **Claude Code** & **OpenCode** configuration

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Ready-blue)](https://claude.com/code)
[![OpenCode](https://img.shields.io/badge/OpenCode-Compatible-green)](https://opencode.ai/)

---

## 🎯 ¿Qué es esto?

Un template **listo para usar** que configura automáticamente tu proyecto para trabajar con agentes de IA como **Claude Code** y **OpenCode**.

En lugar de configurar manualmente archivos `CLAUDE.md`, `AGENTS.md`, `.claude/` y `.opencode/` en cada proyecto nuevo, **simplemente usa este template y ejecuta un script de inicialización**.

---

## ✨ Características

- ✅ **Estructura `.claude/`** completa con settings, skills y commands
- ✅ **Estructura `.opencode/`** con configuración base
- ✅ **Archivos `CLAUDE.md` y `AGENTS.md`** genéricos con placeholders
- ✅ **Scripts de inicialización** interactivos (bash y PowerShell)
- ✅ **Agnóstico de tecnología** - funciona con React, PHP, Python, Next.js, etc.
- ✅ **Listo para GitHub** - configurado como template repository
- ✅ **Documentación incluida** - guías y mejores prácticas
- ✅ **Sistema multi-agente** - 7 agentes especializados con orquestación automática

---

## 🤖 Sistema Multi-Agente Incluido

Este template incluye un **sistema de orquestación con 7 agentes especializados** listo para usar, que permite ejecutar tareas complejas en paralelo con coordinación automática.

### Agentes Disponibles

| Agente | Especialización | Cuándo Usarlo |
|---|---|---|
| **Director** | Coordinación y planificación | Coordina equipos, descompone objetivos complejos |
| **Arquitecto** | Diseño de sistemas y estructura | Decisiones de arquitectura, patrones, escalabilidad |
| **Frontend** | UI/UX, HTML, CSS, JS, React | Interfaces, diseño, animaciones, accesibilidad |
| **Backend** | APIs, bases de datos, lógica | Endpoints, modelos, seguridad, optimización |
| **Marketer** | SEO, contenido, copywriting | Meta tags, textos persuasivos, estrategia digital |
| **Investigador** | Análisis y documentación | Investigar soluciones, documentar código |
| **Revisor** | QA, testing, code review | Validar calidad, detectar bugs, mejoras |

### Comandos del Sistema

| Comando | Propósito |
|---|---|
| `/team-plan <objetivo>` | Planificar tarea con equipo de agentes |
| `/team-status` | Ver estado de tareas en progreso |
| `/team-review` | Revisar resultados consolidados |

### Ejemplo de Uso

```bash
/team-plan "crear sistema de autenticación con JWT"
```

El **director** automáticamente:
1. ✅ Descompone el objetivo en subtareas
2. ✅ Asigna tareas a agentes especializados:
   - Arquitecto → Diseña estructura de auth
   - Backend → Implementa JWT y endpoints
   - Frontend → Crea formularios login/registro
   - Revisor → Valida seguridad y tests
3. ✅ Lanza agentes en paralelo (respetando dependencias)
4. ✅ Consolida resultados en un reporte final

### Arquitectura del Sistema

```
.opencode/
├── agents/              # 7 agentes especializados
│   ├── director.md
│   ├── arquitecto.md
│   ├── frontend.md
│   ├── backend.md
│   ├── marketer.md
│   ├── investigador.md
│   └── revisor.md
├── commands/            # 3 comandos de equipo
│   ├── team-plan.md
│   ├── team-status.md
│   └── team-review.md
├── skills/
│   └── multi-team/      # Skill de orquestación
│       └── skill.md
└── tools/
    └── team-tasks.ts    # Gestión de tareas (TypeScript)
```

### Ventajas del Sistema Multi-Agente

✨ **Ejecución paralela** - Múltiples agentes trabajan simultáneamente
🎯 **Especialización** - Cada agente domina su área
🔄 **Coordinación automática** - El director gestiona dependencias
📊 **Trazabilidad** - Todas las tareas quedan registradas
🚀 **Escalabilidad** - Agrega más agentes según necesites

---

## 🚀 Uso Rápido

### Opción A: Usar como Template en GitHub

1. Haz clic en **"Use this template"** en la página del repositorio
2. Dale un nombre a tu nuevo proyecto
3. Clona tu nuevo repositorio
4. Ejecuta el script de inicialización:

```bash
# Linux/Mac/Git Bash
./init-project.sh

# Windows PowerShell
.\init-project.ps1
```

### Opción B: Clonar y Configurar

```bash
# Clonar el template
git clone https://github.com/yhoswarperez/ai-project-starter.git mi-proyecto

# Entrar al directorio
cd mi-proyecto

# Ejecutar inicialización (Linux/Mac/Git Bash)
./init-project.sh

# O en Windows PowerShell:
# .\init-project.ps1
```

---

## 📦 ¿Qué Incluye?

```
ai-project-starter/
├── .claude/
│   ├── README.md                # Guía de uso de Claude Code
│   ├── settings.local.json      # Configuración de permisos y preferencias
│   ├── skills/                  # Carpeta para skills personalizados
│   └── commands/                # Carpeta para slash commands
│
├── .opencode/
│   └── package.json             # Dependencias de OpenCode
│
├── CLAUDE.md                     # Documentación para Claude Code (genérico)
├── AGENTS.md                     # Documentación de arquitectura (genérico)
├── opencode.json                 # Configuración de OpenCode
├── init-project.sh               # Script de inicialización (bash)
├── init-project.ps1              # Script de inicialización (PowerShell)
├── .gitignore                    # Ignorar archivos comunes
└── README.md                     # Este archivo
```

---

## 🔧 Script de Inicialización

El script interactivo te pedirá:

- 📝 **Nombre del proyecto**
- 📝 **Descripción**
- 🌐 **URL del sitio web** (opcional)
- 📧 **Email de contacto** (opcional)
- 🗣️ **Idioma de respuesta preferido** (español, inglés, etc.)
- 📱 **Tipo de proyecto** (React, PHP, Next.js, Python, etc.)
- 🌍 **Idioma principal del contenido**

Luego:
1. ✅ Reemplaza automáticamente los placeholders en los archivos
2. ✅ Instala dependencias de OpenCode (`npm install`)
3. ✅ Muestra un checklist de próximos pasos

---

## 📋 Próximos Pasos Después de Inicializar

Una vez ejecutado el script, deberás:

### 1. Instalar Claude Code Skills Globales (Recomendado)

```bash
# Skills esenciales
claude plugin install superpowers@superpowers-marketplace
claude plugin install claude-mem@thedotmack

# Para proyectos frontend
claude plugin install frontend-design@claude-plugins-official
```

### 2. Personalizar `CLAUDE.md`

Completa los placeholders restantes (`{PLACEHOLDER}`):
- Arquitectura específica del proyecto
- Convenciones de código
- Stack tecnológico
- Reglas importantes

### 3. Personalizar `AGENTS.md`

- Estructura de archivos real
- Componentes principales
- Rutas/páginas
- Comandos útiles

### 4. Crear `.claude/agents.md`

Puedes copiar `AGENTS.md` o crear una versión más detallada:

```bash
cp AGENTS.md .claude/agents.md
```

### 5. Agregar Skills Personalizados

Crea archivos en `.claude/skills/` para guías especializadas:

**Ejemplo:** `.claude/skills/database-conventions.md`

```markdown
---
name: database-conventions
description: Convenciones de base de datos del proyecto
---

# Database Conventions

## Schema Naming
...
```

### 6. Agregar Slash Commands

Crea comandos personalizados en `.claude/commands/`:

**Ejemplo:** `.claude/commands/add-component.md`

```markdown
---
name: add-component
description: Crear un nuevo componente con estructura estándar
---

# Add Component

Crea un nuevo componente con:
1. Archivo del componente
2. Archivo de estilos
3. Archivo de tests
...
```

### 7. Configurar Permisos en `settings.local.json`

Ajusta los permisos según las necesidades de tu proyecto:

```json
{
  "permissions": {
    "allow": [
      "Bash(git status)",
      "Bash(npm run build)"
    ],
    "deny": [
      "Bash(rm -rf *)"
    ],
    "ask": []
  }
}
```

---

## 📚 Recursos

### Documentación Oficial

- [Claude Code Docs](https://docs.claude.com/en/docs/claude-code)
- [OpenCode Docs](https://opencode.ai/docs)
- [Superpowers Framework](https://github.com/obra/superpowers)

### Skills Recomendados

| Skill | Marketplace | Propósito |
|---|---|---|
| **Superpowers** | `superpowers@superpowers-marketplace` | Framework de desarrollo ágil |
| **Claude Mem** | `claude-mem@thedotmack` | Memoria persistente entre sesiones |
| **Frontend Design** | `frontend-design@claude-plugins-official` | Guía de diseño frontend |
| **Code Review** | `code-review@claude-plugins-official` | Revisión automática de código |

---

## 🎨 Ejemplos de Uso

### Proyecto React

```bash
./init-project.sh
# Nombre: my-react-app
# Tipo: React
# Idioma: español

# Luego personaliza:
# - CLAUDE.md → Agrega convenciones de React
# - AGENTS.md → Documenta componentes y rutas
# - .claude/skills/component-patterns.md
```

### Proyecto PHP

```bash
./init-project.sh
# Nombre: my-php-app
# Tipo: PHP
# Idioma: español

# Luego personaliza:
# - CLAUDE.md → Agrega convenciones de PHP
# - AGENTS.md → Documenta estructura de archivos
# - .claude/skills/php-security.md
```

### Proyecto Next.js

```bash
./init-project.sh
# Nombre: my-nextjs-app
# Tipo: Next.js
# Idioma: inglés

# Luego personaliza:
# - CLAUDE.md → Agrega convenciones de Next.js
# - AGENTS.md → Documenta páginas y API routes
# - .claude/commands/create-page.md
```

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

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

---

## 🙏 Agradecimientos

- [Anthropic](https://www.anthropic.com/) - Claude Code
- [OpenCode.ai](https://opencode.ai/) - OpenCode AI
- [obra](https://github.com/obra) - Superpowers Framework
- Comunidad de desarrolladores que trabajan con IA

---

## 📞 Soporte

- 📧 Email: yhoswarperez@gmail.com
- 🐛 Issues: [GitHub Issues](https://github.com/yhoswarperez/ai-project-starter/issues)
- 💬 Discusiones: [GitHub Discussions](https://github.com/yhoswarperez/ai-project-starter/discussions)

---

<p align="center">
  Hecho con ❤️ para la comunidad de desarrolladores que usan IA
</p>

<p align="center">
  <a href="#-qué-es-esto">Inicio</a> •
  <a href="#-uso-rápido">Uso</a> •
  <a href="#-qué-incluye">Contenido</a> •
  <a href="#-recursos">Recursos</a>
</p>
