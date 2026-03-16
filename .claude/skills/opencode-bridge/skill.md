---
name: opencode-bridge
description: Permite a Claude Code usar el sistema multi-agente de .opencode/
auto_invoke: true
triggers:
  - /team-plan
  - /team-status
  - /team-review
---

# OpenCode Bridge Skill

## Propósito

Este proyecto usa **`.opencode/` como fuente de verdad** para el sistema multi-agente.

Claude Code puede acceder a él mediante este skill puente que:
- Se auto-invoca cuando detecta comandos `/team-*`
- Instruye a leer archivos `.opencode/` antes de ejecutar
- **NO ejecuta directamente**, solo da instrucciones de workflow

## Arquitectura Dual-Platform

```
.opencode/           ← FUENTE DE VERDAD (sistema multi-agente)
├── agents/         ← 7 agentes especializados
├── commands/       ← 3 comandos team
├── skills/         ← Orquestación multi-team
└── team/           ← Estado persistente (tasks.json)

.claude/             ← BRIDGE para Claude Code
├── skills/opencode-bridge/  ← Este skill (lee .opencode/)
└── commands/       ← Wrappers que delegan a .opencode/
```

## Sistema Multi-Agente Disponible

### 7 Agentes Especializados

Ubicados en `.opencode/agents/`:

| Agente | Archivo | Especialización |
|--------|---------|-----------------|
| **Director** | `director.md` | Coordinación, planificación estratégica |
| **Arquitecto** | `arquitecto.md` | Diseño de sistemas, patrones, escalabilidad |
| **Frontend** | `frontend.md` | UI/UX, HTML, CSS, JavaScript, frameworks |
| **Backend** | `backend.md` | APIs, bases de datos, lógica de negocio |
| **Marketer** | `marketer.md` | SEO, copywriting, contenido, estrategia |
| **Investigador** | `investigador.md` | Análisis, investigación, documentación |
| **Revisor** | `revisor.md` | QA, testing, code review, validación |

### 3 Comandos Team

Ubicados en `.opencode/commands/`:

| Comando | Archivo | Propósito |
|---------|---------|-----------|
| `/team-plan` | `team-plan.md` | Planificar tarea con equipo de agentes |
| `/team-status` | `team-status.md` | Ver estado de tareas en progreso |
| `/team-review` | `team-review.md` | Revisar y consolidar resultados |

### Skill de Orquestación

Ubicado en `.opencode/skills/multi-team/skill.md` - Coordina el trabajo entre agentes.

## Workflow de Uso

### ANTES de ejecutar cualquier comando `/team-*`:

```typescript
// 1. Lee la definición del comando
const commandDef = await Read('.opencode/commands/{comando}.md');

// 2. Lee el agente director (siempre coordina)
const director = await Read('.opencode/agents/director.md');

// 3. Director decide qué otros agentes necesita según la tarea
// 4. Lee los agentes necesarios
const agentes = await Promise.all(
  ['arquitecto', 'frontend', 'backend', ...].map(
    a => Read(`.opencode/agents/${a}.md`)
  )
);

// 5. Lee el skill de orquestación
const multiTeam = await Read('.opencode/skills/multi-team/skill.md');

// 6. Ejecuta siguiendo las instrucciones leídas
// 7. Guarda estado en .opencode/team/tasks.json
```

### Para tareas complejas:

1. **Analiza la tarea**: Determina complejidad y dominios involucrados
2. **Lee agentes relevantes**: Solo los necesarios para la tarea
3. **Usa Task tool**: Lanza subagentes según instrucciones del director
4. **Coordina**: El director supervisa y consolida resultados
5. **Persiste estado**: Escribe en `.opencode/team/tasks.json`

## Gestión de Estado

### Archivo de Tareas
**Ubicación:** `.opencode/team/tasks.json`

**Estructura:**
```json
{
  "tasks": [
    {
      "id": 1,
      "description": "Implementar autenticación JWT",
      "agent": "backend",
      "status": "in_progress",
      "subtasks": [],
      "created_at": "2026-03-15T10:00:00Z"
    }
  ]
}
```

**Operaciones:**
- `Read` para consultar estado
- `Write` para actualizar progreso
- **NO modificar manualmente** (lo gestionan los agentes)

## Convenciones Importantes

### 🎯 Reglas Obligatorias

1. **Fuente de verdad**: `.opencode/` es LA fuente de verdad
   - ❌ NO duplicar agentes en `.claude/`
   - ✅ SIEMPRE leer desde `.opencode/`

2. **Lectura obligatoria**: SIEMPRE lee los `.md` antes de actuar
   - ❌ NO asumir comportamiento de agentes
   - ✅ Lee el archivo y sigue sus instrucciones

3. **Coordina con director**: El director siempre coordina
   - ❌ NO lanzar agentes sin coordinación
   - ✅ Director decide qué agentes usar y cómo

4. **Estado persistente**: Usa `.opencode/team/tasks.json`
   - ❌ NO perder contexto entre ejecuciones
   - ✅ Lee/escribe estado para continuidad

## Comandos Rápidos por Tipo de Tarea

| Tarea | Agentes Recomendados | Orden |
|-------|---------------------|-------|
| **Bug fix** | director → investigador → revisor | Secuencial |
| **Feature nueva** | director → arquitecto → frontend/backend → revisor | Paralelo frontend+backend |
| **Refactor** | director → arquitecto → revisor | Secuencial |
| **SEO/Contenido** | director → marketer → frontend | Secuencial |
| **Performance** | director → arquitecto → backend | Secuencial |
| **Documentación** | director → investigador | Directo |

## Ejemplo Completo de Uso

### Caso: "Necesito agregar autenticación JWT"

```bash
User: /team-plan "agregar autenticación JWT con refresh tokens"
```

**Paso 1: Activación del skill**
```typescript
// opencode-bridge se auto-invoca al detectar /team-plan
```

**Paso 2: Lectura de definiciones**
```typescript
// Lee el comando
const command = await Read('.opencode/commands/team-plan.md');

// Lee el director (siempre primero)
const director = await Read('.opencode/agents/director.md');
```

**Paso 3: Director analiza y decide**
```typescript
// Director analiza: "autenticación JWT" requiere:
// - Arquitecto: diseñar arquitectura de auth
// - Backend: implementar endpoints y lógica
// - Revisor: validar seguridad

// Lee los agentes necesarios
const arquitecto = await Read('.opencode/agents/arquitecto.md');
const backend = await Read('.opencode/agents/backend.md');
const revisor = await Read('.opencode/agents/revisor.md');
```

**Paso 4: Lanzar agentes con Task tool**
```typescript
// Según instrucciones del director, lanzar agentes:

// 1. Arquitecto (primero)
await Task({
  description: "Diseñar arquitectura JWT",
  prompt: `Siguiendo las instrucciones de ${arquitecto}, diseña...`,
  subagent_type: "general-purpose"
});

// 2. Backend (después de arquitectura)
await Task({
  description: "Implementar JWT endpoints",
  prompt: `Siguiendo las instrucciones de ${backend} y el diseño de arquitectura...`,
  subagent_type: "general-purpose"
});

// 3. Revisor (al final)
await Task({
  description: "Validar seguridad de auth",
  prompt: `Siguiendo las instrucciones de ${revisor}, valida...`,
  subagent_type: "general-purpose"
});
```

**Paso 5: Guardar estado**
```typescript
// Escribe estado en tasks.json
await Write('.opencode/team/tasks.json', JSON.stringify({
  tasks: [
    { id: 1, description: "Diseñar arquitectura JWT", agent: "arquitecto", status: "completed" },
    { id: 2, description: "Implementar endpoints", agent: "backend", status: "completed" },
    { id: 3, description: "Validar seguridad", agent: "revisor", status: "completed" }
  ]
}, null, 2));
```

**Paso 6: Consolidar resultados**
```typescript
// Director consolida y presenta resultado final al usuario
```

## Skills y MCPs por Agente (Opcional)

**Nota:** Este template es **genérico** y NO incluye skills/MCPs específicos.

Cada agente en `.opencode/agents/{agente}.md` **puede** mencionar skills útiles para su rol, pero son **sugerencias opcionales**.

**El usuario decide** qué instalar según su proyecto:

```bash
# Ejemplos de skills opcionales (NO obligatorios)

# Para Frontend
claude plugin install frontend-design@claude-plugins-official
claude plugin install ui-ux-pro-max@ui-ux-pro-max-skill

# Para Backend
claude plugin install security-audit@security-tools

# Para Revisor
claude plugin install code-review@claude-plugins-official

# Globales (útiles para todos)
claude plugin install superpowers@superpowers-marketplace
claude plugin install claude-mem@thedotmack
```

## Troubleshooting

### ❌ Error: "No puedo leer .opencode/"
**Solución:** Verifica permisos en `.claude/settings.local.json`:
```json
{
  "permission": {
    "read": { ".opencode/**": "allow" }
  }
}
```

### ❌ Error: "Agente no responde"
**Solución:**
1. Verifica que leíste el archivo `.opencode/agents/{agente}.md`
2. Usa Task tool para lanzar subagente con las instrucciones leídas

### ❌ Error: "tasks.json no existe"
**Solución:** Créalo automáticamente en el primer uso:
```json
{
  "tasks": [],
  "version": "1.0.0"
}
```

## Recursos Adicionales

- **Documentación del sistema**: `.opencode/README.md`
- **Guía de agentes**: Cada archivo `.opencode/agents/{agente}.md`
- **Ejemplos de uso**: `README.md` (sección Sistema Multi-Agente)

---

**Resumen:** Este skill es un **puente transparente** que permite a Claude Code usar el sistema multi-agente de `.opencode/` sin duplicar código. ✨
