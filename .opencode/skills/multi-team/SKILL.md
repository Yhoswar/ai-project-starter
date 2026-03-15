---
name: multi-team
description: Protocolo de orquestacion multi-agente. Coordina un equipo de subagentes especializados (arquitecto, frontend, backend, marketer, investigador, revisor) para resolver tareas complejas en paralelo.
---

# Skill: Multi-Team - Protocolo Multi-Agente

## Resumen

Esta skill define el protocolo para coordinar un equipo de agentes IA especializados. El **Director** (agente primario) descompone problemas complejos en subtareas, las asigna a subagentes especializados, y los lanza en paralelo cuando las dependencias lo permiten.

Cada subagente consulta el archivo **AGENTS.md** del proyecto para obtener el contexto especifico (stack, convenciones, reglas).

---

## Roles del Equipo

| Rol | Agente | Modo | Capacidad |
|-----|--------|------|-----------|
| Director | `director` | primary | Coordina, planifica, asigna tareas, consolida resultados |
| Arquitecto | `arquitecto` | subagent | Analiza codebase, define estructura y patrones. Solo lectura |
| Frontend | `frontend` | subagent | Implementa HTML, CSS, JS, animaciones, responsive |
| Backend | `backend` | subagent | Implementa logica de servidor, formularios, seguridad, APIs |
| Marketer | `marketer` | subagent | Copywriting, SEO, contenido de marca, textos multiidioma |
| Investigador | `investigador` | subagent | Busqueda web, documentacion, analisis de mercado. Solo lectura |
| Revisor | `revisor` | subagent | Auditoria de codigo, bugs, seguridad, accesibilidad. Solo lectura |

---

## Protocolo de Orquestacion

### Paso 1: Recibir Objetivo

El Director recibe el objetivo del usuario. Antes de cualquier accion:

1. Cargar esta skill (`multi-team`) si no esta cargada
2. Leer el **AGENTS.md** del proyecto para entender el contexto
3. Analizar el alcance del objetivo
4. Identificar que roles son necesarios (no siempre se necesitan todos)

### Paso 2: Descomponer en Subtareas

El Director crea subtareas usando la herramienta `team-tasks_add`:

```
Cada tarea debe tener:
- title: Descripcion clara y accionable
- assigned_to: Nombre del subagente (arquitecto, frontend, backend, marketer, investigador, revisor)
- dependencies: Lista de IDs de tareas que deben completarse antes
```

**Reglas de descomposicion:**
- Las tareas de analisis/investigacion van PRIMERO (sin dependencias)
- Las tareas de implementacion dependen de las de analisis
- Las tareas de revision van AL FINAL (dependen de implementacion)
- Tareas independientes pueden ejecutarse en paralelo

### Paso 3: Ejecutar Tareas

El Director lanza subagentes via **Task tool**, respetando dependencias:

```
1. Consultar team-tasks_list para ver tareas PENDING
2. Filtrar las que tienen TODAS sus dependencias en COMPLETED
3. Lanzar esas tareas en paralelo (multiples Task tool calls en un solo mensaje)
4. Al recibir resultados, actualizar estado con team-tasks_update
5. Repetir hasta que todas las tareas esten COMPLETED
```

**Lanzamiento de subagente** (ejemplo):
```
Task tool call:
  - subagent_type: "arquitecto"
  - prompt: "[Tarea #1] Analizar la estructura del proyecto y proponer donde insertar el nuevo componente. Consulta AGENTS.md para las convenciones. Devuelve: ubicacion recomendada, clases a usar, estructura propuesta."
```

### Paso 4: Consolidar y Reportar

Cuando todas las tareas estan COMPLETED:

1. Resumir lo que cada subagente hizo
2. Listar los archivos creados/modificados
3. Indicar si hay acciones pendientes para el usuario
4. Actualizar el TodoWrite con el estado final

---

## Reglas de Dependencias

```
PENDING     -> La tarea esta esperando ser ejecutada
IN_PROGRESS -> Un subagente esta trabajando en ella
COMPLETED   -> Terminada exitosamente
BLOCKED     -> No puede ejecutarse (dependencia fallida o problema)
```

**Regla critica**: NUNCA lanzar una tarea cuyas dependencias no esten en `COMPLETED`.

### Patrones Comunes de Dependencias

```
Patron 1: Investigar -> Disenar -> Implementar -> Revisar
  T1: investigador (deps: [])
  T2: arquitecto   (deps: [T1])
  T3: frontend     (deps: [T2])
  T4: revisor      (deps: [T3])

Patron 2: Analisis paralelo -> Implementacion paralela -> Revision
  T1: arquitecto   (deps: [])
  T2: marketer     (deps: [])
  T3: frontend     (deps: [T1, T2])
  T4: backend      (deps: [T1])
  T5: revisor      (deps: [T3, T4])

Patron 3: Investigacion pura (sin implementacion)
  T1: investigador (deps: [])
  T2: arquitecto   (deps: [T1])
  (Director consolida y presenta al usuario)
```

---

## Gatekeeping: Plan antes de Ejecutar

Para objetivos que implican **cambios significativos**:

1. El Director PRIMERO presenta un plan al usuario usando TodoWrite
2. Espera confirmacion explicita antes de lanzar subagentes de implementacion
3. Los subagentes de analisis (arquitecto, investigador) SI pueden lanzarse sin confirmacion

**Cambios significativos** incluyen:
- Crear nuevos archivos o secciones
- Modificar mas de 3 archivos existentes
- Cambios en la estructura principal del proyecto
- Cambios en sistemas core (traducciones, navegacion, seguridad)

---

## Comunicacion entre Director y Subagentes

### Prompt del Director al Subagente

Cada prompt debe incluir:
1. **Numero de tarea**: `[Tarea #N]`
2. **Objetivo claro**: Que debe hacer exactamente
3. **Contexto necesario**: Archivos relevantes, convenciones (referencia a AGENTS.md)
4. **Formato de respuesta**: Que debe devolver al terminar

Ejemplo:
```
[Tarea #3] Implementar el nuevo componente en la pagina principal.

Contexto:
- El arquitecto definio que va despues de la seccion X (ver resultado Tarea #1)
- Usar las clases y patrones indicados en AGENTS.md
- Los textos ya estan en el sistema de traducciones (ver resultado Tarea #2)

Archivos a modificar:
- [archivo principal] (insertar include del template)
- [template nuevo] (crear template)
- [CSS custom] (estilos si son necesarios)

Al terminar devuelve:
- Lista de archivos creados/modificados
- Cualquier problema encontrado
- Sugerencias para el revisor
```

### Respuesta del Subagente al Director

El subagente devuelve un mensaje final con:
1. **Estado**: Completado / Bloqueado / Necesita decision
2. **Archivos afectados**: Lista de archivos creados o modificados
3. **Resumen**: Que hizo exactamente
4. **Problemas**: Cualquier issue encontrado
5. **Recomendaciones**: Para el siguiente paso

---

## Mapa de Herramientas por Rol

| Herramienta | Director | Arquitecto | Frontend | Backend | Marketer | Investigador | Revisor |
|-------------|----------|------------|----------|---------|----------|--------------|---------|
| read/grep/glob | Si | Si | Si | Si | Si | Si | Si |
| write/edit | Si | No | Si | Si | Si | No | No |
| bash | Si | Limitado | Si | Si | No | No | Limitado |
| webfetch | Si | No | No | No | Si | Si | No |
| websearch | No | No | No | No | No | Si | No |
| task (subagentes) | Si | No | No | No | No | No | No |
| team-tasks | Si | No | No | No | No | No | No |
| todowrite | Si | No | No | No | No | No | No |
| skill | Si | No | No | No | No | No | No |

---

## Uso de esta Skill

### Activacion automatica
El Director carga esta skill automaticamente cuando:
- El usuario ejecuta `/team-plan`
- El usuario menciona `@director`
- El usuario selecciona el agente Director

### Activacion manual
Cualquier agente puede cargar la skill:
```
skill({ name: "multi-team" })
```

### Ejemplo de sesion completa

```
Usuario: /team-plan Crear una nueva seccion de precios con 3 planes

Director:
  1. Carga skill multi-team
  2. Lee AGENTS.md para entender convenciones del proyecto
  3. Analiza: necesita arquitecto, marketer, frontend, revisor
  4. Crea tareas:
     T1: arquitecto -> Definir estructura HTML/CSS (deps: [])
     T2: marketer -> Escribir contenido de los 3 planes en todos los idiomas (deps: [])
     T3: frontend -> Implementar seccion de precios (deps: [T1, T2])
     T4: revisor -> Auditar accesibilidad y responsive (deps: [T3])
  5. Presenta plan al usuario (gatekeeping: nueva seccion)
  6. Usuario aprueba
  7. Lanza T1 y T2 en paralelo
  8. Ambos completan -> Lanza T3
  9. T3 completa -> Lanza T4
  10. T4 reporta resultados
  11. Director consolida y reporta al usuario
```

---

## Setup para Proyecto Nuevo

Para usar este sistema multi-agente en un proyecto nuevo:

1. **Copiar** la carpeta `.opencode/` al nuevo proyecto
2. **Ejecutar** `npm install` o `bun install` dentro de `.opencode/` (solo la primera vez)
3. **Crear** un archivo `AGENTS.md` en la raiz del proyecto con las convenciones especificas (usa el AGENTS-TEMPLATE.md como guia)
4. **Listo** - el sistema detecta el AGENTS.md y cada agente leera las convenciones automaticamente
