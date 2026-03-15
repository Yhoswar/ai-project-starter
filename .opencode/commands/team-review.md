---
description: Lanza al revisor para auditar el trabajo realizado por el equipo
agent: director
---

Lanza al subagente `revisor` para que realice una auditoria completa del trabajo realizado.

El revisor debe:
1. Leer AGENTS.md para conocer las convenciones del proyecto
2. Revisar los cambios recientes con `git diff` y `git log`
3. Buscar bugs, errores de sintaxis y variables no definidas
4. Verificar problemas de seguridad (XSS, CSRF, inputs no sanitizados)
5. Comprobar accesibilidad (alt en imagenes, labels en forms, ARIA)
6. Verificar consistencia con las convenciones definidas en AGENTS.md
7. Evaluar responsive y rendimiento

$ARGUMENTS

Presenta el reporte del revisor al usuario con las prioridades de correccion.
