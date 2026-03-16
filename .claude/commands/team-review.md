---
name: team-review
description: Revisa y consolida los resultados del trabajo del equipo multi-agente
---

# Team Review Command

## Propósito

Consolida resultados de múltiples agentes, valida calidad del trabajo y genera reporte final.

**Este comando es un wrapper del sistema `.opencode/`** - delega la lógica de revisión al agente revisor.

## Implementación

### Workflow Automático

Cuando ejecutas `/team-review`, el skill `opencode-bridge` se activa y:

1. **Lee la definición**: `.opencode/commands/team-review.md` (fuente de verdad)
2. **Lee el estado**: `.opencode/team/tasks.json` para ver tareas completadas
3. **Lee el revisor**: `.opencode/agents/revisor.md` (agente especializado en QA)
4. **Ejecuta revisión**: Usa Task tool con el revisor
5. **Genera reporte**: Consolida hallazgos y recomendaciones

### Sintaxis

```bash
/team-review
```

## Salida Esperada

```markdown
## 🔍 Reporte de Revisión del Equipo

### ✅ Resumen de Trabajo Completado
### 📊 Métricas de Calidad
### ⚠️ Hallazgos y Recomendaciones
### ✅ Checklist de QA
### 🎯 Próximos Pasos
```

## Ver También

- **Crear plan**: `/team-plan "<tarea>"`
- **Ver estado**: `/team-status`
- **Documentación**: `.opencode/README.md`

---

**Recuerda:** La revisión es el último paso antes de considerar el trabajo completo. No la omitas. ✨
