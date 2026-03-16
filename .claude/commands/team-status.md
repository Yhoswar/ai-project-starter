---
name: team-status
description: Muestra el estado actual de las tareas del equipo multi-agente
---

# Team Status Command

## Propósito

Consulta el estado de las tareas en progreso del sistema multi-agente.

**Este comando es un wrapper del sistema `.opencode/`** - lee el estado desde `.opencode/team/tasks.json`.

## Implementación

### Workflow Automático

Cuando ejecutas `/team-status`, el skill `opencode-bridge` se activa y:

1. **Lee la definición**: `.opencode/commands/team-status.md` (fuente de verdad)
2. **Lee el archivo de estado**: `.opencode/team/tasks.json`
3. **Genera reporte**: Agrupa tareas por estado (pending/in_progress/completed)
4. **Muestra resultados**: Formato legible para el usuario

### Sintaxis

```bash
/team-status
```

## Salida Esperada

```markdown
## 📊 Estado del Equipo Multi-Agente

### ⏳ Tareas Pendientes (2)
### 🔄 Tareas en Progreso (1)
### ✅ Tareas Completadas (3)

**Total:** 6 tareas | 3 completadas (50%)
```

## Ver También

- **Crear plan**: `/team-plan "<tarea>"`
- **Revisar resultados**: `/team-review`
- **Documentación**: `.opencode/README.md`

---

**Recuerda:** Consulta `/team-status` frecuentemente para monitorear progreso del equipo. ✨
