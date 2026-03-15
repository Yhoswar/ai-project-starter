---
description: Muestra el estado actual de todas las tareas del equipo multi-agente
agent: director
---

Usa la herramienta `team-tasks_list` con filtro "all" para mostrar el estado completo de todas las tareas del equipo.

Presenta la informacion de forma clara:
1. Resumen general (total, completadas, pendientes, bloqueadas)
2. Lista de tareas con su estado y asignacion
3. Tareas listas para lanzar (dependencias cumplidas)
4. Si hay tareas bloqueadas, indica por que

Si no hay tareas registradas, indica al usuario que use `/team-plan <objetivo>` para crear un plan.
