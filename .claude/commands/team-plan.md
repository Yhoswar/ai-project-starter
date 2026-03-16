---
name: team-plan
description: Planifica una tarea compleja con el equipo multi-agente de .opencode/
---

# Team Plan Command

## Propósito

Coordina múltiples agentes especializados para planificar y ejecutar tareas complejas.

**Este comando es un wrapper del sistema `.opencode/`** - delega toda la lógica a los archivos de definición en `.opencode/`.

## Implementación

### Workflow Automático

Cuando ejecutas `/team-plan`, el skill `opencode-bridge` se activa automáticamente y:

1. **Lee la definición**: `.opencode/commands/team-plan.md` (fuente de verdad)
2. **Lee el director**: `.opencode/agents/director.md` (siempre coordina)
3. **Director analiza**: Determina qué agentes necesita según la tarea
4. **Lee agentes necesarios**: `.opencode/agents/{agente}.md`
5. **Ejecuta según instrucciones**: Usa Task tool para lanzar subagentes
6. **Guarda estado**: Escribe en `.opencode/team/tasks.json`

### Sintaxis

```bash
/team-plan "<descripción detallada de la tarea>"
```

### Ejemplos

```bash
# Feature completa
/team-plan "implementar sistema de autenticación con JWT y refresh tokens"

# Optimización UI
/team-plan "mejorar performance de la página de productos"

# Contenido SEO
/team-plan "crear landing page para nuevo servicio con SEO optimizado"
```

## Ver También

- **Ver estado**: `/team-status`
- **Revisar resultados**: `/team-review`
- **Documentación**: `.opencode/README.md`

---

**Recuerda:** Este comando delega a `.opencode/` - actualiza AHÍ si necesitas cambiar comportamiento. ✨
