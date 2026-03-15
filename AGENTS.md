# AGENTS.md — {PROJECT_NAME}

## Negocio / Business

**{PROJECT_NAME}** — {PROJECT_DESCRIPTION}

- **Sitio web / Website**: {WEBSITE_URL}
- **Email**: {CONTACT_EMAIL}
- **Idioma principal / Main language**: {MAIN_LANGUAGE}
- **Idioma secundario / Secondary language**: {SECONDARY_LANGUAGE}
- **Responder siempre en {PREFERRED_LANGUAGE}** al usuario.

---

## Arquitectura del Proyecto / Project Architecture

```
{PROJECT_NAME}/
├── {MAIN_DIRECTORY}/           # {DESCRIPTION}
├── {CONFIG_DIRECTORY}/         # {DESCRIPTION}
├── {COMPONENTS_DIRECTORY}/     # {DESCRIPTION}
├── {STYLES_DIRECTORY}/         # {DESCRIPTION}
├── {ASSETS_DIRECTORY}/         # {DESCRIPTION}
└── {OTHER_DIRECTORIES}/        # {DESCRIPTION}
```

---

## Stack Tecnológico / Technology Stack

### Backend
- **{BACKEND_LANGUAGE}** - {BACKEND_DESCRIPTION}
- **{BACKEND_FRAMEWORK}** - {FRAMEWORK_DESCRIPTION}
- **{DATABASE}** - {DATABASE_DESCRIPTION}
- **{AUTH_SYSTEM}** - {AUTH_DESCRIPTION}

### Frontend
- **{FRONTEND_FRAMEWORK}** - {FRONTEND_DESCRIPTION}
- **{UI_LIBRARY}** - {UI_DESCRIPTION}
- **{STATE_MANAGEMENT}** - {STATE_DESCRIPTION}
- **{STYLING_SOLUTION}** - {STYLING_DESCRIPTION}

### DevOps & Tools
- **{BUILD_TOOL}** - {BUILD_DESCRIPTION}
- **{TESTING_FRAMEWORK}** - {TESTING_DESCRIPTION}
- **{LINTER}** - {LINTER_DESCRIPTION}

---

## Convenciones de Código / Code Conventions

### {LANGUAGE_1}

#### Imports/Includes
```{LANGUAGE_1}
// Convención de imports
{IMPORT_EXAMPLE}
```

#### Naming Conventions
```{LANGUAGE_1}
// Variables: {VARIABLE_CONVENTION}
// Funciones: {FUNCTION_CONVENTION}
// Clases: {CLASS_CONVENTION}
// Constantes: {CONSTANT_CONVENTION}

{NAMING_EXAMPLES}
```

#### File Structure
```{LANGUAGE_1}
// Estructura típica de archivo
{FILE_STRUCTURE_EXAMPLE}
```

---

### CSS/Styling

- **Sistema de diseño / Design system**: {DESIGN_SYSTEM_NAME}
- **Naming pattern**: {CSS_NAMING_PATTERN} (BEM, CSS Modules, Utility-first, etc.)
- **Variables CSS**: {CSS_VARIABLES_LOCATION}
- **Custom styles**: {CUSTOM_STYLES_PATH}

#### Naming Patterns
- Componentes: `.{COMPONENT_PATTERN}`
- Utilidades: `.{UTILITY_PATTERN}`
- Estados: `.{STATE_PATTERN}`

---

### {LANGUAGE_2} (si aplica)

{ADDITIONAL_LANGUAGE_CONVENTIONS}

---

## Estructura de {MAIN_FEATURE} / {MAIN_FEATURE} Structure

{FEATURE_DESCRIPTION}

### Ejemplo / Example

```{LANGUAGE}
{FEATURE_CODE_EXAMPLE}
```

---

## Sistema de {SECONDARY_FEATURE} / {SECONDARY_FEATURE} System

{SECONDARY_FEATURE_DESCRIPTION}

### Configuración / Configuration

```{LANGUAGE}
{CONFIGURATION_EXAMPLE}
```

---

## Seguridad / Security

### Medidas Implementadas / Implemented Measures

1. **{SECURITY_MEASURE_1}**
   - {DESCRIPTION}
   - Implementación: {IMPLEMENTATION_PATH}

2. **{SECURITY_MEASURE_2}**
   - {DESCRIPTION}
   - Implementación: {IMPLEMENTATION_PATH}

3. **{SECURITY_MEASURE_3}**
   - {DESCRIPTION}
   - Implementación: {IMPLEMENTATION_PATH}

---

## Componentes Principales / Main Components

| Componente | Archivo | Descripción |
|------------|---------|-------------|
| {COMPONENT_1} | `{PATH_1}` | {DESCRIPTION_1} |
| {COMPONENT_2} | `{PATH_2}` | {DESCRIPTION_2} |
| {COMPONENT_3} | `{PATH_3}` | {DESCRIPTION_3} |

---

## Rutas/Páginas / Routes/Pages

| Ruta | Archivo | Descripción |
|------|---------|-------------|
| `{ROUTE_1}` | `{FILE_1}` | {DESC_1} |
| `{ROUTE_2}` | `{FILE_2}` | {DESC_2} |
| `{ROUTE_3}` | `{FILE_3}` | {DESC_3} |

---

## Reglas Importantes / Important Rules

### ❌ NO HACER / DO NOT

1. **{RULE_1}** - {REASON_1}
2. **{RULE_2}** - {REASON_2}
3. **{RULE_3}** - {REASON_3}
4. **{RULE_4}** - {REASON_4}

### ✅ HACER / DO

1. **{GOOD_PRACTICE_1}** - {REASON_1}
2. **{GOOD_PRACTICE_2}** - {REASON_2}
3. **{GOOD_PRACTICE_3}** - {REASON_3}
4. **{GOOD_PRACTICE_4}** - {REASON_4}

---

## Comandos Útiles / Useful Commands

| Comando | Descripción |
|---------|-------------|
| `{COMMAND_1}` | {DESCRIPTION_1} |
| `{COMMAND_2}` | {DESCRIPTION_2} |
| `{COMMAND_3}` | {DESCRIPTION_3} |

---

## Testing Local / Local Testing

### Setup
1. {SETUP_STEP_1}
2. {SETUP_STEP_2}
3. {SETUP_STEP_3}

### Acceso / Access
- URL local: `{LOCAL_URL}`
- Puerto: `{PORT}`

### Verificar funcionalidades / Check functionalities
- [ ] {FEATURE_TO_TEST_1}
- [ ] {FEATURE_TO_TEST_2}
- [ ] {FEATURE_TO_TEST_3}
- [ ] {FEATURE_TO_TEST_4}

---

## Deployment / Despliegue

### Producción / Production
```bash
{DEPLOYMENT_COMMANDS}
```

### Variables de Entorno / Environment Variables
```bash
{ENV_VARIABLES_EXAMPLE}
```

---

## Auto-Actualización / Auto-Update

Después de cada sesión de trabajo significativa, actualiza automáticamente:
- **AGENTS.md** — si hay cambios en arquitectura, archivos nuevos o eliminados
- **CLAUDE.md** — si hay cambios en convenciones, estructura de secciones o templates

Esto asegura que la documentación siempre refleje el estado actual del proyecto y evita trabajo duplicado en futuras sesiones.

---

## Recursos de Referencia / Reference Resources

- **{RESOURCE_1_NAME}**: [{RESOURCE_1_TITLE}]({RESOURCE_1_URL})
- **{RESOURCE_2_NAME}**: [{RESOURCE_2_TITLE}]({RESOURCE_2_URL})
- **{RESOURCE_3_NAME}**: [{RESOURCE_3_TITLE}]({RESOURCE_3_URL})

---

## 📝 Personalización de este Template

Después de inicializar el proyecto, reemplaza todos los placeholders marcados con `{PLACEHOLDER}`:

**Información General:**
- `{PROJECT_NAME}` - Nombre del proyecto
- `{PROJECT_DESCRIPTION}` - Descripción del negocio/proyecto
- `{WEBSITE_URL}` - URL del sitio
- `{CONTACT_EMAIL}` - Email de contacto
- `{PREFERRED_LANGUAGE}` - Idioma de respuesta (español, inglés, etc.)
- `{MAIN_LANGUAGE}` - Idioma principal del código/contenido
- `{SECONDARY_LANGUAGE}` - Idioma secundario (si aplica)

**Arquitectura:**
- `{MAIN_DIRECTORY}` - Directorio principal
- `{CONFIG_DIRECTORY}` - Directorio de configuración
- `{COMPONENTS_DIRECTORY}` - Directorio de componentes
- `{STYLES_DIRECTORY}` - Directorio de estilos
- `{ASSETS_DIRECTORY}` - Directorio de assets
- `{DESCRIPTION}` - Descripciones de cada directorio

**Stack Tecnológico:**
- `{BACKEND_LANGUAGE}`, `{BACKEND_FRAMEWORK}`, `{DATABASE}`, `{AUTH_SYSTEM}`
- `{FRONTEND_FRAMEWORK}`, `{UI_LIBRARY}`, `{STATE_MANAGEMENT}`, `{STYLING_SOLUTION}`
- `{BUILD_TOOL}`, `{TESTING_FRAMEWORK}`, `{LINTER}`

**Convenciones:**
- `{LANGUAGE_1}`, `{LANGUAGE_2}` - Lenguajes usados
- `{IMPORT_EXAMPLE}` - Ejemplo de imports
- `{VARIABLE_CONVENTION}`, `{FUNCTION_CONVENTION}`, `{CLASS_CONVENTION}`, `{CONSTANT_CONVENTION}`
- `{CSS_NAMING_PATTERN}` - Patrón de nomenclatura CSS
- `{DESIGN_SYSTEM_NAME}` - Nombre del sistema de diseño

**Features:**
- `{MAIN_FEATURE}`, `{SECONDARY_FEATURE}` - Características principales
- `{FEATURE_DESCRIPTION}` - Descripción de características
- `{FEATURE_CODE_EXAMPLE}` - Ejemplos de código

**Seguridad:**
- `{SECURITY_MEASURE_1/2/3}` - Medidas de seguridad implementadas

**Componentes y Rutas:**
- `{COMPONENT_1/2/3}`, `{PATH_1/2/3}` - Componentes principales
- `{ROUTE_1/2/3}`, `{FILE_1/2/3}` - Rutas de la aplicación

**Testing y Deployment:**
- `{LOCAL_URL}`, `{PORT}` - Configuración local
- `{DEPLOYMENT_COMMANDS}` - Comandos de despliegue
- `{ENV_VARIABLES_EXAMPLE}` - Variables de entorno

---

*Este es un template genérico. Personalízalo según las necesidades de tu proyecto.*

*Última actualización: {CURRENT_DATE}*
