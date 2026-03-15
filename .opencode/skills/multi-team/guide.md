# Guia de Instalacion: Sistema Multi-Agente para OpenCode

## Que es esto

Este es un sistema de orquestacion multi-agente para **OpenCode** (CLI de IA). Permite descomponer tareas complejas en subtareas especializadas y ejecutarlas en paralelo usando 7 agentes con roles definidos: Director (coordinador), Arquitecto, Frontend, Backend, Marketer, Investigador y Revisor.

Cada agente lee las convenciones del proyecto desde un archivo `AGENTS.md` en la raiz, lo que hace al sistema **100% portable** entre proyectos.

---

## Prerequisitos

Antes de instalar, asegurate de tener:

- **Node.js** (v18+) o **Bun** (v1+) -- necesario para el tool de tareas
- **OpenCode** instalado y funcionando
- **Un proyecto existente** donde quieras usar el sistema

Para verificar:
```bash
node --version    # Debe mostrar v18 o superior
# o
bun --version     # Debe mostrar v1 o superior
```

---

## Instalacion Paso a Paso

### Paso 1: Copiar la carpeta `.opencode/`

Copia toda la carpeta `.opencode/` a la raiz del nuevo proyecto.

```bash
# Desde la terminal, ajusta las rutas a tu caso:
cp -r /ruta/al/proyecto-origen/.opencode /ruta/al/proyecto-nuevo/.opencode
```

**En Windows:**
```cmd
xcopy /E /I "C:\ruta\origen\.opencode" "C:\ruta\destino\.opencode"
```

> NOTA: La carpeta `node_modules/` no se copia si esta en `.gitignore` (lo cual es correcto). Se regenera en el paso 2.

### Paso 2: Instalar dependencias

Abre una terminal **dentro** de la carpeta `.opencode/` del nuevo proyecto y ejecuta:

```bash
cd /ruta/al/proyecto-nuevo/.opencode
npm install
```

O si usas Bun:
```bash
cd /ruta/al/proyecto-nuevo/.opencode
bun install
```

Esto descarga la libreria `@opencode-ai/plugin` que el tool `team-tasks.ts` necesita para funcionar. Solo se ejecuta **una vez**.

### Paso 3: Crear el AGENTS.md

Copia el archivo `AGENTS-TEMPLATE.md` (incluido en el proyecto origen) a la raiz del nuevo proyecto y renombralo:

```bash
cp /ruta/al/AGENTS-TEMPLATE.md /ruta/al/proyecto-nuevo/AGENTS.md
```

### Paso 4: Rellenar el AGENTS.md

Este es el paso mas importante. El archivo `AGENTS.md` es la **unica fuente de verdad** que los 7 agentes consultan para conocer tu proyecto.

Abre `AGENTS.md` y rellena cada seccion. Si una IA te esta ayudando, debe hacerte estas preguntas:

#### Preguntas para la seccion "Negocio"
- Cual es el nombre de la empresa o proyecto?
- Que hace? A quien sirve?
- Cual es el sitio web y email de contacto?
- En que idioma debo comunicarme contigo?
- El proyecto es multiidioma? Cuales idiomas?

#### Preguntas para la seccion "Arquitectura"
- Cual es la estructura de carpetas del proyecto?
- Cual es el archivo principal (entry point)?
- Donde estan los templates/componentes?
- Donde estan los assets (CSS, JS, imagenes)?
- Hay archivos de configuracion o bootstrap?

#### Preguntas para la seccion "Stack Tecnologico"
- Que lenguaje de backend usas? (PHP, Node, Python, etc.)
- Que framework? (Laravel, Express, Django, vanilla, etc.)
- Que framework CSS? (Bootstrap, Tailwind, custom, etc.)
- Usas algun tema o template base? Cual?
- Que librerias JS principales usas? (jQuery, React, Vue, GSAP, etc.)
- Usas base de datos? Cual?
- Cual es tu entorno local? (XAMPP, Docker, Vite dev server, etc.)

#### Preguntas para la seccion "Convenciones de Codigo"
- Como se hacen los includes/imports en el proyecto?
- Como se referencian los assets (imagenes, CSS, JS)?
- Hay un sistema de traducciones/textos? Como funciona?
- Como se construyen las URLs?
- Hay variables CSS o un sistema de temas?
- Donde va el CSS custom? (que archivos NO se deben editar)
- Donde va el JS custom?

#### Preguntas para la seccion "Reglas Importantes"
- Hay archivos que NUNCA se deben modificar? Cuales?
- Hay alguna regla especial del proyecto? (ej: menu con 2 bloques sincronizados)
- Hay un sistema de seguridad? Como funciona?

#### Preguntas para la seccion "Testing Local"
- Como se arranca el proyecto localmente?
- Cual es la URL local?
- Que funcionalidades debo verificar despues de hacer cambios?

### Paso 5: Verificacion

Ejecuta esta checklist para confirmar que todo esta correcto:

```
[ ] .opencode/agents/ contiene 7 archivos .md
    (arquitecto, backend, director, frontend, investigador, marketer, revisor)

[ ] .opencode/skills/multi-team/SKILL.md existe

[ ] .opencode/tools/team-tasks.ts existe

[ ] .opencode/commands/ contiene 3 archivos .md
    (team-plan, team-review, team-status)

[ ] .opencode/node_modules/@opencode-ai/plugin/ existe
    (si no existe, ejecuta npm install dentro de .opencode/)

[ ] .opencode/package.json existe con la dependencia @opencode-ai/plugin

[ ] AGENTS.md existe en la raiz del proyecto con contenido real
    (no placeholders como [Nombre del Proyecto])
```

---

## Estructura de Archivos Resultante

Despues de la instalacion, tu proyecto debe verse asi:

```
tu-proyecto/
├── AGENTS.md                    # <-- Convenciones de TU proyecto (rellenado)
├── .opencode/
│   ├── agents/
│   │   ├── arquitecto.md        # Agente: analisis y diseño
│   │   ├── backend.md           # Agente: logica de servidor
│   │   ├── director.md          # Agente: coordinador (primary)
│   │   ├── frontend.md          # Agente: HTML, CSS, JS
│   │   ├── investigador.md      # Agente: busqueda e investigacion
│   │   ├── marketer.md          # Agente: copywriting y contenido
│   │   └── revisor.md           # Agente: auditoria y QA
│   ├── commands/
│   │   ├── team-plan.md         # Comando /team-plan
│   │   ├── team-review.md       # Comando /team-review
│   │   └── team-status.md       # Comando /team-status
│   ├── skills/
│   │   └── multi-team/
│   │       ├── SKILL.md         # Protocolo de orquestacion
│   │       └── guide.md         # Esta guia
│   ├── tools/
│   │   └── team-tasks.ts        # Tool de gestion de tareas
│   ├── team/                    # Carpeta de datos (tasks.json se genera aqui)
│   ├── package.json             # Dependencias del tool
│   ├── node_modules/            # Librerias (generado por npm install)
│   └── .gitignore               # Excluye node_modules, package.json, bun.lock
└── [... archivos de tu proyecto ...]
```

---

## Primer Uso

Una vez instalado, abre OpenCode en tu proyecto y usa estos comandos:

### Planificar y ejecutar una tarea con el equipo
```
/team-plan Crear una seccion de precios con 3 planes
```
Esto activa al Director, que:
1. Lee tu AGENTS.md
2. Descompone la tarea en subtareas
3. Asigna cada una a un agente especializado
4. Presenta el plan para tu aprobacion
5. Ejecuta en paralelo respetando dependencias

### Ver el estado de las tareas
```
/team-status
```

### Lanzar una auditoria
```
/team-review
```

### Usar el Director directamente
Tambien puedes cambiar al agente Director (Tab en OpenCode) y darle instrucciones directamente sin usar comandos slash.

---

## Troubleshooting

### "team-tasks no funciona" o "tool not found"
**Causa:** Falta ejecutar `npm install` dentro de `.opencode/`.
**Solucion:**
```bash
cd tu-proyecto/.opencode
npm install
```

### "El agente no conoce mis convenciones"
**Causa:** El archivo `AGENTS.md` no existe en la raiz del proyecto, o esta vacio/con placeholders.
**Solucion:** Crear y rellenar `AGENTS.md` con las convenciones reales del proyecto.

### "No encuentra la skill multi-team"
**Causa:** La carpeta `skills/multi-team/` esta mal nombrada o falta el `SKILL.md`.
**Solucion:** Verificar que existe `.opencode/skills/multi-team/SKILL.md`.

### "Los subagentes no se lanzan en paralelo"
**Causa:** Las dependencias entre tareas impiden el paralelismo.
**Solucion:** Es comportamiento esperado. Solo se lanzan en paralelo las tareas cuyas dependencias ya estan COMPLETED. Usa `/team-status` para ver cuales estan listas.

### "El Director no lee el AGENTS.md"
**Causa:** El archivo debe llamarse exactamente `AGENTS.md` (mayusculas) y estar en la raiz del proyecto.
**Solucion:** Renombrar si es necesario. Verificar que no este en una subcarpeta.

---

## Referencia Rapida de Agentes

| Agente | Rol | Modifica archivos? | Herramientas especiales |
|--------|-----|---------------------|-------------------------|
| **Director** | Coordina el equipo, asigna tareas | Si | task, team-tasks, todowrite, skill |
| **Arquitecto** | Analiza, diseña, propone | No (solo lectura) | git (limitado) |
| **Frontend** | Implementa HTML, CSS, JS | Si | bash, write, edit |
| **Backend** | Implementa logica de servidor | Si | bash, write, edit |
| **Marketer** | Crea contenido y textos | Si (solo textos) | webfetch |
| **Investigador** | Busca informacion | No (solo lectura) | webfetch, websearch |
| **Revisor** | Audita y busca problemas | No (solo lectura) | git (limitado) |

---

## Patrones de Uso Comunes

### Tarea nueva con investigacion
```
/team-plan Investigar las mejores practicas de [tema] y luego implementar [funcionalidad]
```
Flujo: Investigador -> Arquitecto -> Frontend/Backend -> Revisor

### Agregar nueva seccion/componente
```
/team-plan Crear una nueva seccion de [nombre] con [requisitos]
```
Flujo: Arquitecto + Marketer (paralelo) -> Frontend -> Revisor

### Corregir bugs reportados
```
/team-plan Corregir los siguientes bugs: [lista]
```
Flujo: Arquitecto (analisis) -> Frontend/Backend (correccion) -> Revisor

### Solo investigar (sin implementar)
```
/team-plan Investigar como implementar [funcionalidad] y presentar opciones
```
Flujo: Investigador -> Arquitecto -> Director presenta resumen
