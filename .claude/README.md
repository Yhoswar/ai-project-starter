# Configuración Claude Code

Esta carpeta contiene la configuración y documentación personalizada para trabajar con Claude Code en tu proyecto.

## 📁 Estructura

```
.claude/
├── README.md                    # Este archivo
├── agents.md                    # Documentación completa del proyecto
├── settings.local.json          # Configuración de permisos y preferencias
├── skills/                      # Habilidades especializadas (vacío inicialmente)
└── commands/                    # Comandos personalizados / slash commands (vacío inicialmente)
```

## 📚 agents.md

Crea este archivo con la documentación maestra del proyecto. Usa [../AGENTS.md](../AGENTS.md) como referencia.

**Debe incluir:**
- Información del negocio
- Arquitectura completa del proyecto
- Stack tecnológico
- Convenciones de código
- Estructura del proyecto
- Sistemas importantes
- Reglas y buenas prácticas

## 🛠️ Skills

Los skills son guías especializadas para tareas específicas. Créalos en `skills/` cuando necesites:

**Ejemplos de skills:**
- `database-conventions.md` - Convenciones de base de datos
- `api-patterns.md` - Patrones de API
- `styling-guide.md` - Guía de estilos
- `testing-workflow.md` - Flujo de testing

**Formato de un skill:**
```markdown
---
name: nombre-del-skill
description: Descripción breve del propósito
---

# Contenido del Skill

Documentación detallada...
```

## ⚡ Commands (Slash Commands)

Los comandos personalizados se invocan con `/nombre-comando`.

**Ejemplos de comandos:**
- `/add-component` - Agregar nuevo componente
- `/create-test` - Crear archivo de test
- `/sync-translations` - Sincronizar traducciones

**Formato de un comando:**
```markdown
---
name: nombre-comando
description: Descripción breve
---

# Prompt del Comando

Instrucciones que se ejecutarán cuando se invoque el comando...
```

## ⚙️ settings.local.json

Configura permisos y preferencias:

### Permisos

**`allow`**: Operaciones permitidas sin confirmación
**`deny`**: Operaciones bloqueadas
**`ask`**: Operaciones que requieren confirmación

### Preferencias

- **`language`**: Idioma principal de respuesta
- **`projectType`**: Tipo de proyecto
- **`defaultBranch`**: Rama principal de Git

### Custom Prompts

Recordatorios automáticos antes/después de ediciones.

## 🚀 Próximos Pasos

1. Crea `agents.md` con la documentación del proyecto
2. Personaliza `settings.local.json` según tus necesidades
3. Agrega skills personalizados en `skills/` según sea necesario
4. Crea slash commands útiles en `commands/`
5. Actualiza este README con información específica de tu proyecto

## 📖 Recursos

- [Claude Code Documentation](https://docs.claude.com/en/docs/claude-code)
- [Template Original](../README.md)

---

*Template creado por AI Project Starter*
