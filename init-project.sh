#!/bin/bash

# 🤖 AI Project Starter - Initialization Script
# This script will help you set up your project with AI agent configuration

set -e

echo "🤖 AI Project Starter - Inicialización del Proyecto"
echo "====================================================="
echo ""

# Function to replace placeholders in files
replace_placeholder() {
    local file=$1
    local placeholder=$2
    local value=$3

    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        sed -i '' "s|${placeholder}|${value}|g" "$file"
    else
        # Linux/Git Bash
        sed -i "s|${placeholder}|${value}|g" "$file"
    fi
}

# Collect project information
read -p "📝 Nombre del proyecto (e.g., my-awesome-app): " PROJECT_NAME
read -p "📝 Descripción del proyecto: " PROJECT_DESCRIPTION
read -p "🌐 URL del sitio web (opcional, presiona Enter para omitir): " WEBSITE_URL
read -p "📧 Email de contacto (opcional): " CONTACT_EMAIL
read -p "🗣️  Idioma de respuesta preferido (español/inglés/otro): " PREFERRED_LANGUAGE
read -p "📱 Tipo de proyecto (React/PHP/Next.js/Python/otro): " PROJECT_TYPE
read -p "🌍 Idioma principal del contenido (español/inglés/otro): " MAIN_LANGUAGE

echo ""
echo "🔧 Configurando proyecto..."
echo ""

# Replace placeholders in CLAUDE.md
replace_placeholder "CLAUDE.md" "{PROJECT_NAME}" "$PROJECT_NAME"
replace_placeholder "CLAUDE.md" "{PROJECT_DESCRIPTION}" "$PROJECT_DESCRIPTION"
replace_placeholder "CLAUDE.md" "{WEBSITE_URL}" "${WEBSITE_URL:-TBD}"
replace_placeholder "CLAUDE.md" "{PREFERRED_LANGUAGE}" "$PREFERRED_LANGUAGE"
replace_placeholder "CLAUDE.md" "{MAIN_LANGUAGE}" "$MAIN_LANGUAGE"

# Replace placeholders in AGENTS.md
replace_placeholder "AGENTS.md" "{PROJECT_NAME}" "$PROJECT_NAME"
replace_placeholder "AGENTS.md" "{PROJECT_DESCRIPTION}" "$PROJECT_DESCRIPTION"
replace_placeholder "AGENTS.md" "{WEBSITE_URL}" "${WEBSITE_URL:-TBD}"
replace_placeholder "AGENTS.md" "{CONTACT_EMAIL}" "${CONTACT_EMAIL:-TBD}"
replace_placeholder "AGENTS.md" "{PREFERRED_LANGUAGE}" "$PREFERRED_LANGUAGE"
replace_placeholder "AGENTS.md" "{MAIN_LANGUAGE}" "$MAIN_LANGUAGE"
replace_placeholder "AGENTS.md" "{CURRENT_DATE}" "$(date +%Y-%m-%d)"

# Replace placeholders in .claude/settings.local.json
replace_placeholder ".claude/settings.local.json" "{PREFERRED_LANGUAGE}" "$PREFERRED_LANGUAGE"
replace_placeholder ".claude/settings.local.json" "{PROJECT_TYPE}" "$PROJECT_TYPE"

# Replace placeholders in .opencode/package.json
replace_placeholder ".opencode/package.json" "{PROJECT_NAME}" "$PROJECT_NAME"

echo "✅ Archivos de configuración actualizados"
echo ""

# Install OpenCode dependencies
echo "📦 Instalando dependencias de OpenCode..."
cd .opencode
if command -v npm &> /dev/null; then
    npm install
    echo "✅ Dependencias instaladas con npm"
elif command -v bun &> /dev/null; then
    bun install
    echo "✅ Dependencias instaladas con bun"
elif command -v yarn &> /dev/null; then
    yarn install
    echo "✅ Dependencias instaladas con yarn"
else
    echo "⚠️  No se encontró npm, bun ni yarn. Instala las dependencias manualmente."
fi
cd ..

echo ""
echo "✅ ¡Proyecto inicializado correctamente!"
echo ""
echo "📋 Próximos pasos:"
echo ""
echo "1. [ ] Instalar Claude Code Skills globales (si no los tienes):"
echo "       - superpowers@superpowers-marketplace"
echo "       - claude-mem@thedotmack"
echo "       - frontend-design@claude-plugins-official (si aplica)"
echo ""
echo "2. [ ] Personalizar CLAUDE.md:"
echo "       - Completar placeholders restantes {PLACEHOLDER}"
echo "       - Agregar detalles específicos del proyecto"
echo "       - Documentar arquitectura y convenciones"
echo ""
echo "3. [ ] Personalizar AGENTS.md:"
echo "       - Completar stack tecnológico real"
echo "       - Documentar estructura de archivos"
echo "       - Agregar comandos útiles"
echo ""
echo "4. [ ] Crear .claude/agents.md (copia de AGENTS.md o versión específica)"
echo ""
echo "5. [ ] Crear skills personalizados en .claude/skills/"
echo ""
echo "6. [ ] Crear slash commands en .claude/commands/"
echo ""
echo "7. [ ] Configurar permisos en .claude/settings.local.json"
echo ""
echo "8. [ ] (Opcional) Configurar MCP servers si es necesario"
echo ""
echo "9. [ ] Inicializar Git (si aún no lo has hecho):"
echo "       git init"
echo "       git add ."
echo "       git commit -m 'Initial commit with AI configuration'"
echo ""
echo "📚 Documentación: https://docs.claude.com/en/docs/claude-code"
echo ""
echo "🎉 ¡Listo para empezar a desarrollar con Claude Code!"
