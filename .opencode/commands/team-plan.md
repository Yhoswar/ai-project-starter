---
description: Activa el equipo multi-agente para planificar y ejecutar un objetivo
agent: director
---

Carga la skill `multi-team` para obtener el protocolo de orquestacion multi-agente.

Luego, analiza el siguiente objetivo y crea un plan de trabajo:

**Objetivo:** $ARGUMENTS

Pasos:
1. Inicializa el sistema de tareas con `team-tasks_init`
2. Analiza el alcance del objetivo
3. Identifica que subagentes necesitas (arquitecto, frontend, backend, marketer, investigador, revisor)
4. Descompone el objetivo en subtareas con dependencias claras
5. Registra cada tarea con `team-tasks_add`
6. Presenta el plan al usuario con TodoWrite antes de ejecutar
7. Espera confirmacion del usuario para cambios significativos
8. Lanza los subagentes en paralelo respetando dependencias
